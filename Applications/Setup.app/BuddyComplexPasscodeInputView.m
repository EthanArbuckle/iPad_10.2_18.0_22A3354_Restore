@implementation BuddyComplexPasscodeInputView

- (BuddyComplexPasscodeInputView)initWithFrame:(CGRect)a3 numericOnly:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  UIFont *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSArray *v23;
  BuddyComplexPasscodeInputView *v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void **v31;
  int v32;
  int v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  objc_super v38;
  BOOL v39;
  SEL v40;
  id location;
  CGRect v42;
  _QWORD v43[5];

  v42 = a3;
  v40 = a2;
  v39 = a4;
  location = 0;
  v38.receiver = self;
  v38.super_class = (Class)BuddyComplexPasscodeInputView;
  location = -[BuddyComplexPasscodeInputView initWithFrame:](&v38, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v4 = objc_alloc_init((Class)UITextField);
    v5 = (void *)*((_QWORD *)location + 2);
    *((_QWORD *)location + 2) = v4;

    objc_msgSend(*((id *)location + 2), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)location + 2), "setDelegate:", location);
    objc_msgSend(*((id *)location + 2), "setSecureTextEntry:", 1);
    objc_msgSend(*((id *)location + 2), "setReturnKeyType:", 4);
    if (v39)
      objc_msgSend(*((id *)location + 2), "setKeyboardType:", 4);
    v37 = objc_msgSend(*((id *)location + 2), "textInputTraits");
    objc_msgSend(v37, "setDevicePasscodeEntry:", 1);
    objc_msgSend(*((id *)location + 2), "setTextAlignment:", 1);
    v6 = (void *)*((_QWORD *)location + 2);
    v7 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
    objc_msgSend(v6, "setFont:", v7);

    v8 = objc_msgSend(*((id *)location + 2), "layer");
    objc_msgSend(v8, "setBorderWidth:", 1.0);

    v9 = objc_msgSend(location, "traitCollection");
    v31 = _NSConcreteStackBlock;
    v32 = -1073741824;
    v33 = 0;
    v34 = sub_10019E9BC;
    v35 = &unk_100280730;
    v36 = location;
    objc_msgSend(v9, "performAsCurrentTraitCollection:", &v31);

    v10 = objc_msgSend(*((id *)location + 2), "layer");
    objc_msgSend(v10, "setCornerRadius:", 10.0);

    v11 = (void *)*((_QWORD *)location + 2);
    v12 = +[UIColor _labelColor](UIColor, "_labelColor");
    objc_msgSend(v11, "setTextColor:", v12);

    objc_msgSend(location, "addSubview:", *((_QWORD *)location + 2));
    v30 = objc_msgSend(*((id *)location + 2), "heightAnchor");
    objc_msgSend(*((id *)location + 2), "intrinsicContentSize");
    v29 = objc_msgSend(v30, "constraintEqualToConstant:", v13 * 2.0);
    v43[0] = v29;
    v28 = objc_msgSend(*((id *)location + 2), "leadingAnchor");
    v27 = objc_msgSend(location, "leadingAnchor");
    v26 = objc_msgSend(v28, "constraintEqualToAnchor:");
    v43[1] = v26;
    v14 = objc_msgSend(*((id *)location + 2), "trailingAnchor");
    v15 = objc_msgSend(location, "trailingAnchor");
    v16 = objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v43[2] = v16;
    v17 = objc_msgSend(*((id *)location + 2), "topAnchor");
    v18 = objc_msgSend(location, "topAnchor");
    v19 = objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v43[3] = v19;
    v20 = objc_msgSend(*((id *)location + 2), "bottomAnchor");
    v21 = objc_msgSend(location, "bottomAnchor");
    v22 = objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v43[4] = v22;
    v23 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 5);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
  }
  v24 = (BuddyComplexPasscodeInputView *)location;
  objc_storeStrong(&location, 0);
  return v24;
}

- (id)passcodeDisplayView
{
  return self->_passcodeField;
}

- (void)setPasscode:(id)a3
{
  UITextField *v3;
  id location[2];
  BuddyComplexPasscodeInputView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyComplexPasscodeInputView passcodeField](v5, "passcodeField");
  -[UITextField setText:](v3, "setText:", location[0]);

  objc_storeStrong(location, 0);
}

- (id)passcode
{
  UITextField *v2;
  NSString *v3;

  v2 = -[BuddyComplexPasscodeInputView passcodeField](self, "passcodeField", a2, self);
  v3 = -[UITextField text](v2, "text");

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  UITextField *v3;
  id v4;
  id v5;
  objc_super v6;
  id location[2];
  BuddyComplexPasscodeInputView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)BuddyComplexPasscodeInputView;
  -[BuddyComplexPasscodeInputView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", location[0]);
  v3 = -[BuddyComplexPasscodeInputView passcodeField](v8, "passcodeField");
  v4 = -[UITextField layer](v3, "layer");
  v5 = objc_retainAutorelease(+[UIColor _labelColor](UIColor, "_labelColor"));
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  objc_storeStrong(location, 0);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  BuddyPasscodeInputViewDelegate *v6;
  char v7;
  id v8;
  BuddyPasscodeInputViewDelegate *v9;
  id v11;
  char v12;
  id v13;
  id v14;
  id location[2];
  BuddyComplexPasscodeInputView *v16;
  _NSRange v17;

  v17 = a4;
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v6 = -[BuddyPasscodeInputView delegate](v16, "delegate");
  v12 = 0;
  v7 = 0;
  if (v6)
  {
    v13 = -[BuddyPasscodeInputView delegate](v16, "delegate");
    v12 = 1;
    v7 = objc_opt_respondsToSelector(v13, "passcodeInput:willChangeContents:");
  }
  if ((v12 & 1) != 0)

  if ((v7 & 1) != 0)
  {
    v8 = objc_msgSend(location[0], "text");
    v11 = objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", v17.location, v17.length, v14);

    v9 = -[BuddyPasscodeInputView delegate](v16, "delegate");
    -[BuddyPasscodeInputViewDelegate passcodeInput:willChangeContents:](v9, "passcodeInput:willChangeContents:", v16, v11);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  BuddyPasscodeInputViewDelegate *v3;
  char v4;
  BuddyPasscodeInputViewDelegate *v5;
  BuddyComplexPasscodeInputView *v6;
  id v7;
  char v9;
  BuddyPasscodeInputViewDelegate *v10;
  id location[2];
  BuddyComplexPasscodeInputView *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyPasscodeInputView delegate](v12, "delegate");
  v9 = 0;
  v4 = 0;
  if (v3)
  {
    v10 = -[BuddyPasscodeInputView delegate](v12, "delegate");
    v9 = 1;
    v4 = objc_opt_respondsToSelector(v10, "passcodeInput:enteredPasscode:");
  }
  if ((v9 & 1) != 0)

  if ((v4 & 1) != 0)
  {
    v5 = -[BuddyPasscodeInputView delegate](v12, "delegate");
    v6 = v12;
    v7 = -[BuddyComplexPasscodeInputView passcode](v12, "passcode");
    -[BuddyPasscodeInputViewDelegate passcodeInput:enteredPasscode:](v5, "passcodeInput:enteredPasscode:", v6, v7);

  }
  objc_storeStrong(location, 0);
  return 1;
}

- (UITextField)passcodeField
{
  return self->_passcodeField;
}

- (void)setPasscodeField:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeField, 0);
}

@end
