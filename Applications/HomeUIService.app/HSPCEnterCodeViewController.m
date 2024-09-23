@implementation HSPCEnterCodeViewController

- (HSPCEnterCodeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  HSPCEnterCodeViewController *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HSPCEnterCodeViewController;
  v7 = -[HSPCTextFieldViewController initWithCoordinator:config:withTextFieldMinimumHeight:](&v20, "initWithCoordinator:config:withTextFieldMinimumHeight:", a3, v6, 100.0);
  if (v7)
  {
    v8 = HULocalizedString(CFSTR("HUProximityCardEnterSetupCodeTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[HSPCEnterCodeViewController setTitle:](v7, "setTitle:", v9);

    v10 = HULocalizedString(CFSTR("HUProximityCardEnterSetupCodeSubtitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[HSPCEnterCodeViewController setSubtitle:](v7, "setSubtitle:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController continueAction](v7, "continueAction"));
    objc_msgSend(v12, "setEnabled:", 1);

    v14 = objc_opt_class(HSSetupStateMachineCHIPPartnerConfiguration, v13);
    v15 = v6;
    if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (!v17)
      v18 = -[HSPCEnterCodeViewController addOptionalButtonWithTitleKey:target:futureSelector:](v7, "addOptionalButtonWithTitleKey:target:futureSelector:", CFSTR("HSSetupCodeActionButtonCamera"), v7, "onCameraButton");
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HSPCEnterCodeViewController;
  -[HSPCTextFieldViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v3, "setKeyboardType:", 11);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v4, "setTextAlignment:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", 30.0, UIFontWeightSemibold));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v8, "setClearButtonMode:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController footnoteLabel](self, "footnoteLabel"));
  objc_msgSend(v10, "setTextColor:", v9);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSPCEnterCodeViewController;
  -[HSPCTextFieldViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v4, "becomeFirstResponder");

}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textFieldText](self, "textFieldText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "didReceiveSetupCode:fromViewController:", v4, self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", &stru_1000A1EE0));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100024F60;
  v9[3] = &unk_1000A1328;
  objc_copyWeak(&v10, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recover:", v9));
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

- (id)onCameraButton
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A81D0);
}

- (void)configureNextViewController:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = objc_opt_class(HSPCCameraScanViewController, v4);
  v8 = v3;
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "setMode:", 0);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController footnoteLabel](self, "footnoteLabel"));
  objc_msgSend(v11, "setText:", &stru_1000A3BA0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1000A3BA0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1000A3BA0));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "invertedSet"));
  v17 = objc_msgSend(v14, "rangeOfCharacterFromSet:", v16);

  if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 0;
    goto LABEL_26;
  }
  if (length == 1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", location, 1));
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("-")))
    {

LABEL_7:
      --location;
      goto LABEL_8;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", location, 1));
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR(" "));

    if (v21)
      goto LABEL_7;
  }
LABEL_8:
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v10));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "hf_extractDecimalDigits"));
  v24 = objc_msgSend(v23, "length");

  if ((unint64_t)v24 <= 0x15)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[HUStringDisplayFormatter stringByApplyingCodeFormatToString:](HUStringDisplayFormatter, "stringByApplyingCodeFormatToString:", v22));
    v19 = objc_msgSend(v22, "isEqualToString:", v25);
    if ((v19 & 1) == 0)
    {
      objc_msgSend(v9, "setText:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringToIndex:", location));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "hf_extractDecimalDigits"));
      v28 = objc_msgSend(v27, "length");
      v29 = (uint64_t)v28 + (_QWORD)objc_msgSend(v14, "length");

      if (v29 <= 20)
      {
        if (v29 <= 18)
        {
          if (v29 <= 15)
          {
            if (v29 <= 11)
            {
              if (v29 < 8 || (unint64_t)objc_msgSend(v25, "length") <= 9)
                v30 = v29 > 4;
              else
                v30 = 2;
            }
            else
            {
              v30 = 3;
            }
          }
          else
          {
            v30 = 4;
          }
        }
        else
        {
          v30 = 5;
        }
      }
      else
      {
        v30 = 6;
      }
      v31 = v29 + v30;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "beginningOfDocument"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "positionFromPosition:offset:", v32, v31));

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textRangeFromPosition:toPosition:", v33, v33));
      objc_msgSend(v9, "setSelectedTextRange:", v34);

    }
  }
  else
  {
    v19 = 0;
  }

LABEL_26:
  return v19;
}

- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("identifier == %@"), CFSTR("com.apple.menu.standard-edit")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v7));
  return v8;
}

- (unint64_t)numberOfDigits
{
  return self->_numberOfDigits;
}

- (void)setNumberOfDigits:(unint64_t)a3
{
  self->_numberOfDigits = a3;
}

@end
