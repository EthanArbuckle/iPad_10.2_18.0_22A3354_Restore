@implementation STKBaseInputAlertViewController

+ (BOOL)wantsTextView
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STKBaseInputAlertViewController;
  -[STKBaseAlertViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STKBaseInputAlertViewController;
  -[STKBaseAlertViewController viewDidLoad](&v3, "viewDidLoad");
  self->_minLength = 0;
  self->_maxLength = -1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STKBaseInputAlertViewController;
  -[STKBaseInputAlertViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[UITextField becomeFirstResponder](self->_inputTextField, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STKBaseInputAlertViewController;
  -[STKBaseAlertViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[UITextField resignFirstResponder](self->_inputTextField, "resignFirstResponder");
}

- (void)setMinLength:(unint64_t)a3
{
  self->_minLength = a3;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (id)newTopBar
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v3 = objc_alloc_init((Class)UINavigationBar);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "_setHidesShadow:", 1);
  objc_msgSend(v3, "setBarStyle:", 1);
  v4 = objc_alloc_init((Class)UIImage);
  objc_msgSend(v3, "setBackgroundImage:forBarMetrics:", v4, 0);

  v5 = objc_alloc((Class)UINavigationItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_100014540, CFSTR("SIMToolkitUI")));
  v8 = objc_msgSend(v5, "initWithTitle:", v7);

  objc_msgSend(v3, "pushNavigationItem:animated:", v8, 0);
  v9 = objc_msgSend(objc_alloc((Class)UINavigationItem), "initWithTitle:", &stru_100014540);
  v10 = objc_alloc((Class)UIBarButtonItem);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100014540, CFSTR("SIMToolkitUI")));
  v13 = objc_msgSend(v10, "initWithTitle:style:target:action:", v12, 0, self, "rightNavigationButtonPressed");

  objc_msgSend(v9, "setRightBarButtonItem:", v13);
  objc_msgSend(v3, "pushNavigationItem:animated:", v9, 0);

  return v3;
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  if ((objc_opt_respondsToSelector(self, "leftNavigationButtonPressed", a3, a4) & 1) != 0)
    -[STKBaseInputAlertViewController performSelector:withObject:](self, "performSelector:withObject:", "leftNavigationButtonPressed", 0);
  return 0;
}

- (id)newBottomBar
{
  void *v3;
  double v4;
  double v5;
  UIView *v6;
  UIView *sendingFieldView;
  UIButton *v8;
  UIButton *button;
  double v10;
  UIButton *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RoundedBorderView *v16;
  void *v17;
  UIView *v18;
  UIView *textBorderView;
  UITextField *v20;
  UITextField *inputTextField;
  UITextField *v22;
  void *v23;
  UITextField *v24;
  void *v25;
  UITextField *v26;
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
  UIView *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[10];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseInputAlertViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = (UIView *)objc_alloc_init((Class)UIView);
  sendingFieldView = self->_sendingFieldView;
  self->_sendingFieldView = v6;

  -[UIView _setLayoutDebuggingIdentifier:](self->_sendingFieldView, "_setLayoutDebuggingIdentifier:", CFSTR("_sendingFieldView"));
  -[UIView setFrame:](self->_sendingFieldView, "setFrame:", 0.0, 0.0, v5, 36.0);
  v8 = (UIButton *)objc_alloc_init((Class)UIButton);
  button = self->_button;
  self->_button = v8;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v10) = 1144750080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_button, "setContentHuggingPriority:forAxis:", 0, v10);
  v11 = self->_button;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SEND"), &stru_100014540, CFSTR("SIMToolkitUI")));
  -[UIButton setTitle:forState:](v11, "setTitle:forState:", v13, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
  objc_msgSend(v14, "setFont:", v15);

  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, "_sendClicked", 64);
  -[UIButton setContentEdgeInsets:](self->_button, "setContentEdgeInsets:", 5.0, 5.0, 5.0, 5.0);
  -[UIView addSubview:](self->_sendingFieldView, "addSubview:", self->_button);
  v16 = [RoundedBorderView alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 255.0, 255.0, 255.0, 0.1));
  v18 = -[RoundedBorderView initWithFrame:color:](v16, "initWithFrame:color:", v17, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  textBorderView = self->_textBorderView;
  self->_textBorderView = v18;

  -[UIView _setLayoutDebuggingIdentifier:](self->_textBorderView, "_setLayoutDebuggingIdentifier:", CFSTR("_textBorderView"));
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_textBorderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_sendingFieldView, "addSubview:", self->_textBorderView);
  v20 = (UITextField *)objc_alloc_init((Class)UITextField);
  inputTextField = self->_inputTextField;
  self->_inputTextField = v20;

  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_inputTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextField setBorderStyle:](self->_inputTextField, "setBorderStyle:", 0);
  v22 = self->_inputTextField;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UITextField setBackgroundColor:](v22, "setBackgroundColor:", v23);

  v24 = self->_inputTextField;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
  -[UITextField setFont:](v24, "setFont:", v25);

  v26 = self->_inputTextField;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UITextField setTextColor:](v26, "setTextColor:", v27);

  -[UITextField setDelegate:](self->_inputTextField, "setDelegate:", self);
  -[UIView addSubview:](self->_textBorderView, "addSubview:", self->_inputTextField);
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_button, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_sendingFieldView, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, -5.0));
  v62[0] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_button, "centerYAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_sendingFieldView, "centerYAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
  v62[1] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_textBorderView, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_sendingFieldView, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 10.0));
  v62[2] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_textBorderView, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_button, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -10.0));
  v62[3] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_textBorderView, "heightAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_sendingFieldView, "heightAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, -10.0));
  v62[4] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_textBorderView, "centerYAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_sendingFieldView, "centerYAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v62[5] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leadingAnchor](self->_inputTextField, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_textBorderView, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 5.0));
  v62[6] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField trailingAnchor](self->_inputTextField, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_textBorderView, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, -5.0));
  v62[7] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField heightAnchor](self->_inputTextField, "heightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_textBorderView, "heightAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
  v62[8] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField centerYAnchor](self->_inputTextField, "centerYAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_textBorderView, "centerYAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
  v62[9] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField textInputTraits](self->_inputTextField, "textInputTraits"));
  objc_msgSend(v36, "setAcceptsFloatingKeyboard:", 0);
  objc_msgSend(v36, "setAcceptsSplitKeyboard:", 0);
  v37 = self->_sendingFieldView;

  return v37;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  id v8;
  void *v9;
  char *v10;
  char *v11;
  BOOL v12;
  void *v13;
  void *v14;

  length = a4.length;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v10 = (char *)objc_msgSend(v9, "length");

  if ((unint64_t)v10 >= length)
    v11 = &v10[-length];
  else
    v11 = 0;
  if (&v11[(_QWORD)objc_msgSend(v8, "length")] <= (char *)self->_maxLength)
  {
    if (self->_digitsOnly)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet phonePadCharacterSet](NSCharacterSet, "phonePadCharacterSet"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v13));
      v12 = objc_msgSend(v14, "length") == 0;

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setDigitsOnly:(BOOL)a3
{
  self->_digitsOnly = a3;
  if (a3)
    -[UITextField setKeyboardType:](self->_inputTextField, "setKeyboardType:", 5);
}

- (void)_sendClicked
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_inputTextField, "text"));
  v4 = objc_msgSend(v3, "length");

  if ((unint64_t)v4 >= self->_minLength && (unint64_t)v4 <= self->_maxLength)
    -[STKBaseInputAlertViewController sendButtonPressed](self, "sendButtonPressed");
}

- (UIView)sendingFieldView
{
  return self->_sendingFieldView;
}

- (UIButton)button
{
  return self->_button;
}

- (UIView)textBorderView
{
  return self->_textBorderView;
}

- (UITextField)inputTextField
{
  return self->_inputTextField;
}

- (UIView)buttonBorderView
{
  return self->_buttonBorderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonBorderView, 0);
  objc_storeStrong((id *)&self->_textBorderView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_sendingFieldView, 0);
  objc_storeStrong((id *)&self->_inputTextField, 0);
}

@end
