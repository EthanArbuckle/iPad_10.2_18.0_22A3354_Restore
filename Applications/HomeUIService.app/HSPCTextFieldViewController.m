@implementation HSPCTextFieldViewController

- (HSPCTextFieldViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  return -[HSPCTextFieldViewController initWithCoordinator:config:withTextFieldMinimumHeight:](self, "initWithCoordinator:config:withTextFieldMinimumHeight:", a3, a4, 0.0);
}

- (HSPCTextFieldViewController)initWithCoordinator:(id)a3 config:(id)a4 withTextFieldMinimumHeight:(double)a5
{
  id v9;
  id v10;
  HSPCTextFieldViewController *v11;
  HSPCTextFieldViewController *v12;
  uint64_t v13;
  PRXAction *continueAction;
  uint64_t v15;
  PRXLabel *footnoteLabel;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HSPCTextFieldViewController;
  v11 = -[HSPCTextFieldViewController init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_config, a4);
    objc_storeStrong((id *)&v12->_coordinator, a3);
    v12->_textFieldMinimumHeight = a5;
    v13 = objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController addProminentButtonWithTitleKey:target:futureSelector:](v12, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v12, "commitConfiguration"));
    continueAction = v12->_continueAction;
    v12->_continueAction = (PRXAction *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 3));
    footnoteLabel = v12->_footnoteLabel;
    v12->_footnoteLabel = (PRXLabel *)v15;

  }
  return v12;
}

- (id)commitConfiguration
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSPCTextFieldViewController.m"), 89, CFSTR("Subclass to override."));

  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A83E0);
}

- (void)setTextFieldText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)textFieldText
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));
  v4 = v3;
  if (!v3)
    v3 = &stru_1000A3BA0;
  v5 = v3;

  return v5;
}

- (void)setTextFieldPlaceholderText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v5, "setPlaceholder:", v4);

}

- (NSString)textFieldPlaceholderText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "placeholder"));

  return (NSString *)v3;
}

- (PRXTextField)textField
{
  PRXTextField *textField;
  HSPCTextField *v4;
  PRXTextField *v5;

  textField = self->_textField;
  if (!textField)
  {
    v4 = objc_alloc_init(HSPCTextField);
    -[HSPCTextField setClearButtonMode:](v4, "setClearButtonMode:", 3);
    -[HSPCTextField setAutocapitalizationType:](v4, "setAutocapitalizationType:", 1);
    -[HSPCTextField setReturnKeyType:](v4, "setReturnKeyType:", 9);
    -[HSPCTextField setDelegate:](v4, "setDelegate:", self);
    v5 = self->_textField;
    self->_textField = (PRXTextField *)v4;

    textField = self->_textField;
  }
  return textField;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)HSPCTextFieldViewController;
  -[HSPCTextFieldViewController viewDidLoad](&v48, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v3, "addSubview:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainContentGuide"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_opt_new(NSMutableArray, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  objc_msgSend(v9, "na_safeAddObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  objc_msgSend(v9, "na_safeAddObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  objc_msgSend(v9, "na_safeAddObject:", v21);

  if (NACGFloatGreaterThanFloat(-[HSPCTextFieldViewController textFieldMinimumHeight](self, "textFieldMinimumHeight")))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "heightAnchor"));
    -[HSPCTextFieldViewController textFieldMinimumHeight](self, "textFieldMinimumHeight");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintGreaterThanOrEqualToConstant:"));

    objc_msgSend(v9, "na_safeAddObject:", v24);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController footnoteLabel](self, "footnoteLabel"));
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController contentView](self, "contentView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController footnoteLabel](self, "footnoteLabel"));
  objc_msgSend(v26, "addSubview:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController footnoteLabel](self, "footnoteLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
  objc_msgSend(v9, "na_safeAddObject:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController footnoteLabel](self, "footnoteLabel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
  objc_msgSend(v9, "na_safeAddObject:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController footnoteLabel](self, "footnoteLabel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, 10.0));
  objc_msgSend(v9, "na_safeAddObject:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController footnoteLabel](self, "footnoteLabel"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:constant:", v43, 10.0));
  objc_msgSend(v9, "na_safeAddObject:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController footnoteLabel](self, "footnoteLabel"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "heightAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintGreaterThanOrEqualToConstant:", 40.0));
  objc_msgSend(v9, "na_safeAddObject:", v47);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v9);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSPCTextFieldViewController;
  -[HSPCTextFieldViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
    objc_msgSend(v7, "becomeFirstResponder");

  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v4));
  -[HSPCTextFieldViewController setTextFieldText:](self, "setTextFieldText:", v5);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)endEditing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController contentView](self, "contentView"));
  objc_msgSend(v2, "endEditing:", 1);

}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HFNamedItemBuilder)builder
{
  return (HFNamedItemBuilder *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBuilder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)textFieldMinimumHeight
{
  return self->_textFieldMinimumHeight;
}

- (void)setTextFieldMinimumHeight:(double)a3
{
  self->_textFieldMinimumHeight = a3;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (PRXAction)continueAction
{
  return self->_continueAction;
}

- (void)setContinueAction:(id)a3
{
  objc_storeStrong((id *)&self->_continueAction, a3);
}

- (PRXLabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_continueAction, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_builder, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
