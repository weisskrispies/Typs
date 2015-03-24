//
//  ViewController.swift
//  Typs
//
//  Created by Patrick Weiss on 3/21/15.
//  Copyright (c) 2015 Patrick Weiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipBox: UIView!
    @IBOutlet weak var totalBox: UIView!
    @IBOutlet weak var billAmount: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        billField.becomeFirstResponder()

        tipBox.alpha = 0
        totalBox.alpha = 0
        tipControl.alpha = 0
        
        billField.frame.origin.y = 140
        billAmount.frame.origin.y = 120
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func textInputChanged(sender: AnyObject) {
        println("editing changed")
        
        var billAmount = NSString(string: billField.text).doubleValue
        
        if billAmount > 0 {
            println("it's bigger than 0, bro")
            
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.billField.alpha = 0.6
                self.billAmount.alpha = 0
                self.billField.frame.origin.y = 20;
                    
                self.tipBox.alpha = 1
                self.totalBox.alpha = 1
                self.tipControl.alpha = 1
            })
        } else {
            UIView.animateWithDuration(0.5, animations: {
            
            self.billField.alpha = 1
                
            self.tipBox.alpha = 0
            self.totalBox.alpha = 0
            self.tipControl.alpha = 0
            self.billAmount.alpha = 1
                
            self.billField.frame.origin.y = 140
            self.billAmount.frame.origin.y = 120
            })
        }
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject)
    {
        view.endEditing(true)
    }
}

