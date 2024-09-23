@implementation PasscodeEmbeddedCustomizableViewController

- (PasscodeEmbeddedCustomizableViewController)initWithPasscodeLength:(int64_t)a3 alphanumeric:(BOOL)a4
{
  _BOOL4 v4;
  PasscodeEmbeddedCustomizableViewController *v6;
  PasscodeEmbeddedCustomizableViewController *v7;
  int64_t v8;
  void *v9;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PasscodeEmbeddedCustomizableViewController;
  v6 = -[PasscodeEmbeddedCustomizableViewController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    if (a3 < 1)
      v8 = -1;
    else
      v8 = a3;
    v6->_passcodeLength = v8;
    if (v4)
    {
      v6->_hasAlphanumericPasscode = 1;
    }
    else if (a3 <= 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v7->_hasAlphanumericPasscode = objc_msgSend(v9, "userInterfaceIdiom") != (id)1 || v7->_passcodeLength > 6;

    }
    else
    {
      v6->_hasAlphanumericPasscode = (unint64_t)a3 > 6;
    }
  }
  return v7;
}

- (unint64_t)passcodeLength
{
  return self->_passcodeLength;
}

- (BOOL)hasAlphaNumericPasscode
{
  return self->_hasAlphanumericPasscode;
}

- (void)setPasscodeFocused:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PasscodeEmbeddedCustomizableViewController;
  -[PasscodeEmbeddedViewController setPasscodeFocused:](&v3, "setPasscodeFocused:", a3);
}

- (id)alphanumericFieldPlaceholder
{
  void *v2;
  id v4;
  NSString *placeholderText;
  NSString *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v4 = objc_alloc((Class)NSAttributedString);
  placeholderText = self->_placeholderText;
  v6 = placeholderText;
  if (!placeholderText)
  {
    v13.receiver = self;
    v13.super_class = (Class)PasscodeEmbeddedCustomizableViewController;
    v7 = -[PasscodeEmbeddedViewController alphanumericFieldPlaceholder](&v13, "alphanumericFieldPlaceholder");
    v2 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "string"));
  }
  v14[0] = NSParagraphStyleAttributeName;
  v8 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v8, "setAlignment:", 1);
  v15[0] = v8;
  v14[1] = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v15[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
  v11 = objc_msgSend(v4, "initWithString:attributes:", v6, v10);

  if (!placeholderText)
  {

  }
  return v11;
}

- (int64_t)alphanumericFieldTextAlignment
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController passcodeField](self, "passcodeField"));

  if (v11 != v9)
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Received delegate message for invalid text field (%@)"), v9);
    goto LABEL_10;
  }
  if (-[PasscodeEmbeddedViewController animating](self, "animating"))
    goto LABEL_10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v13 = objc_msgSend(v12, "length");
  if (v13 >= (id)-[PasscodeEmbeddedCustomizableViewController passcodeLength](self, "passcodeLength"))
  {
    v14 = -[PasscodeEmbeddedCustomizableViewController passcodeLength](self, "passcodeLength");

    if (v14)
      goto LABEL_8;
  }
  else
  {

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", location, length, v10));
  objc_msgSend(v9, "setText:", v16);

LABEL_8:
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v18 = objc_msgSend(v17, "length");
  v19 = -[PasscodeEmbeddedCustomizableViewController passcodeLength](self, "passcodeLength");

  if ((unint64_t)v18 >= v19)
    -[PasscodeEmbeddedCustomizableViewController _verifyTextField:](self, "_verifyTextField:", v9);
LABEL_10:

  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController passcodeField](self, "passcodeField"));

  if (v5 == v4)
    -[PasscodeEmbeddedCustomizableViewController _verifyTextField:](self, "_verifyTextField:", v4);
  else
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Received delegate message for invalid text field (%@)"), v4);

  return 0;
}

- (BOOL)verifyPasscode:(id)a3
{
  return 1;
}

- (void)_verifyTextField:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002310C;
  v8[3] = &unk_10007A5D0;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(WeakRetained, "verifyPasscode:reply:", v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (PasscodeEmbeddedViewControllerDelegate)delegate
{
  return (PasscodeEmbeddedViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
