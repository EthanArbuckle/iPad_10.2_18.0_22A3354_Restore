@implementation AKLoginFieldsViewController

- (AKLoginFieldsViewController)initWithContext:(id)a3
{
  id v4;
  AKLoginFieldsViewController *v5;
  AKLoginFieldsViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKLoginFieldsViewController;
  v5 = -[AKLoginFieldsViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_context, v4);

  return v6;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKLoginFieldsViewController;
  -[AKLoginFieldsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[AKLoginFieldsViewController _prepareUsernameField](self, "_prepareUsernameField");
  -[AKLoginFieldsViewController _preparePasswordField](self, "_preparePasswordField");
}

- (id)usernameText
{
  void *v2;
  void *v3;

  -[AKLoginFieldsViewController usernameField](self, "usernameField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)passwordText
{
  void *v3;
  void *v4;
  void *v5;

  -[AKLoginFieldsViewController passwordField](self, "passwordField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[AKLoginFieldsViewController passwordField](self, "passwordField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)showPasswordField
{
  void *v3;
  id v4;

  -[AKLoginFieldsViewController passwordField](self, "passwordField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[AKLoginFieldsViewController passwordField](self, "passwordField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;

  -[AKLoginFieldsViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loginFieldsDidReturn:", self);

  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v6 = a3;
  -[AKLoginFieldsViewController usernameField](self, "usernameField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    -[AKLoginFieldsViewController context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "username");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      _AKLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1BD795000, v11, OS_LOG_TYPE_DEFAULT, "Username is changing", v13, 2u);
      }

      objc_msgSend(v9, "setUsername:", 0);
    }
    -[AKLoginFieldsViewController _hidePasswordIfNeeded](self, "_hidePasswordIfNeeded");

  }
  return 1;
}

- (void)_prepareUsernameField
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  -[AKLoginFieldsViewController usernameField](self, "usernameField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutocapitalizationType:", 0);

  -[AKLoginFieldsViewController usernameField](self, "usernameField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardType:", 7);

  -[AKLoginFieldsViewController usernameField](self, "usernameField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextContentType:", *MEMORY[0x1E0CEBD10]);

  -[AKLoginFieldsViewController usernameField](self, "usernameField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EMAIL_OR_PHONE_PLACEHOLDER"), &stru_1E7679C68, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceholder:", v8);

  -[AKLoginFieldsViewController context](self, "context");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    objc_msgSend(v15, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKLoginFieldsViewController usernameField](self, "usernameField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

  }
  v13 = objc_msgSend(v15, "isUsernameEditable") ^ 1;
  -[AKLoginFieldsViewController usernameField](self, "usernameField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", v13);

}

- (void)_preparePasswordField
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AKLoginFieldsViewController passwordField](self, "passwordField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecureTextEntry:", 1);

  -[AKLoginFieldsViewController passwordField](self, "passwordField");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PASSWORD_ALERT_PLACEHOLDER"), &stru_1E7679C68, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceholder:", v5);

}

- (void)_hidePasswordIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AKLoginFieldsViewController passwordField](self, "passwordField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) == 0)
  {
    -[AKLoginFieldsViewController passwordField](self, "passwordField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[AKLoginFieldsViewController passwordField](self, "passwordField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", 0);

    -[AKLoginFieldsViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "passwordFieldDidHide:", self);

    -[AKLoginFieldsViewController usernameField](self, "usernameField");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "becomeFirstResponder");

  }
}

- (AKLoginFieldsDelegate)delegate
{
  return (AKLoginFieldsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKAppleIDAuthenticationContext)context
{
  return (AKAppleIDAuthenticationContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (UITextField)usernameField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_usernameField);
}

- (void)setUsernameField:(id)a3
{
  objc_storeWeak((id *)&self->_usernameField, a3);
}

- (UITextField)passwordField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_passwordField);
}

- (void)setPasswordField:(id)a3
{
  objc_storeWeak((id *)&self->_passwordField, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_passwordField);
  objc_destroyWeak((id *)&self->_usernameField);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
