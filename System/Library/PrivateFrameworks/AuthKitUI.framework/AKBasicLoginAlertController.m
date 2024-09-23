@implementation AKBasicLoginAlertController

- (AKBasicLoginAlertController)initWithAlertStyle:(int64_t)a3
{
  AKBasicLoginAlertController *v4;
  AKBasicLoginAlertController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKBasicLoginAlertController;
  v4 = -[AKBasicLoginAlertController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    -[AKBasicLoginAlertController setPreferredStyle:](v4, "setPreferredStyle:", 1);
    -[AKBasicLoginAlertController setAlertStyle:](v5, "setAlertStyle:", a3);
    -[AKBasicLoginAlertController _beginObservingDidEnterCodeNotifications](v5, "_beginObservingDidEnterCodeNotifications");
  }
  return v5;
}

- (AKBasicLoginAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  AKBasicLoginAlertController *v4;
  AKBasicLoginAlertController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKBasicLoginAlertController;
  v4 = -[AKBasicLoginAlertController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AKBasicLoginAlertController setPreferredStyle:](v4, "setPreferredStyle:", 1);
    -[AKBasicLoginAlertController _setupViewControllerForAlertStyle](v5, "_setupViewControllerForAlertStyle");
    -[AKBasicLoginAlertController _beginObservingDidEnterCodeNotifications](v5, "_beginObservingDidEnterCodeNotifications");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[AKBasicLoginAlertController _endObservingDidEnterCodeNotifications](self, "_endObservingDidEnterCodeNotifications");
  v3.receiver = self;
  v3.super_class = (Class)AKBasicLoginAlertController;
  -[AKBasicLoginAlertController dealloc](&v3, sel_dealloc);
}

- (void)_setupViewControllerForAlertStyle
{
  AKBasicLoginAlertController *v3;
  uint64_t v4;

  -[AKBasicLoginAlertController _removeAllTextFields](self, "_removeAllTextFields");
  -[AKBasicLoginAlertController setTitle:](self, "setTitle:", 0);
  -[AKBasicLoginAlertController setMessage:](self, "setMessage:", 0);
  -[AKBasicLoginAlertController setPreferredAction:](self, "setPreferredAction:", 0);
  switch(-[AKBasicLoginAlertController alertStyle](self, "alertStyle"))
  {
    case 0:
      -[AKBasicLoginAlertController _setupViewControllerForDefaultStyle](self, "_setupViewControllerForDefaultStyle");
      break;
    case 1:
      -[AKBasicLoginAlertController _setupViewControllerForNonEditableUsernameFieldStyle](self, "_setupViewControllerForNonEditableUsernameFieldStyle");
      break;
    case 2:
      -[AKBasicLoginAlertController _setupViewControllerForUserOrCreateAppleIDStyle](self, "_setupViewControllerForUserOrCreateAppleIDStyle");
      break;
    case 3:
      -[AKBasicLoginAlertController _setupViewControllerForIForgotStyle](self, "_setupViewControllerForIForgotStyle");
      break;
    case 4:
      v3 = self;
      v4 = 4;
      goto LABEL_8;
    case 5:
      v3 = self;
      v4 = 5;
LABEL_8:
      -[AKBasicLoginAlertController _setupViewControllerForSecondFactorEntryStyle:](v3, "_setupViewControllerForSecondFactorEntryStyle:", v4);
      break;
    default:
      return;
  }
}

- (id)_wrappedCancelAction
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0CEA2E0];
  -[AKBasicLoginAlertController cancelButtonTitle](self, "cancelButtonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ALERT_CANCEL"), &stru_1E7679C68, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__AKBasicLoginAlertController__wrappedCancelAction__block_invoke;
  v9[3] = &unk_1E7679810;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "actionWithTitle:style:handler:", v6, 1, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v7;
}

void __51__AKBasicLoginAlertController__wrappedCancelAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "loginActions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ak_cancelAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v9, "loginActions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v7 = v4;
      objc_msgSend(v4, "ak_cancelAction");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();

      WeakRetained = v9;
      goto LABEL_7;
    }
    objc_msgSend(v9, "secondFactorActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ak_cancelAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v9;
    if (v6)
    {
      objc_msgSend(v9, "secondFactorActions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)_syncUsernameAndPasswordPropertiesWithTextFieldContent
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *ak_username;
  NSString *v13;
  NSString *ak_password;
  id v15;

  v3 = -[AKBasicLoginAlertController alertStyle](self, "alertStyle");
  if (v3 == 1)
  {
    -[AKBasicLoginAlertController username](self, "username");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginAlertController textFields](self, "textFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
  }
  else
  {
    if (v3)
    {
      -[AKBasicLoginAlertController username](self, "username");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[AKBasicLoginAlertController password](self, "password");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    -[AKBasicLoginAlertController textFields](self, "textFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[AKBasicLoginAlertController textFields](self, "textFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v11 = (NSString *)objc_msgSend(v15, "copy");
  ak_username = self->_ak_username;
  self->_ak_username = v11;

  v13 = (NSString *)objc_msgSend(v10, "copy");
  ak_password = self->_ak_password;
  self->_ak_password = v13;

}

- (void)_setupAuthenticateAndCancelButtons
{
  -[AKBasicLoginAlertController _setupAuthenticateAndCancelButtonsWithIForgot:](self, "_setupAuthenticateAndCancelButtonsWithIForgot:", 0);
}

- (void)_setupAuthenticateAndCancelButtonsWithIForgot:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[2];
  _QWORD v23[4];

  v3 = a3;
  v23[3] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__AKBasicLoginAlertController__setupAuthenticateAndCancelButtonsWithIForgot___block_invoke;
  v19[3] = &unk_1E7679810;
  objc_copyWeak(&v20, &location);
  v6 = (void *)MEMORY[0x1C3B760D8](v19);
  v7 = (void *)0x1E0CEA000;
  if (v3)
  {
    v8 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD_ALERT"), &stru_1E7679C68, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __77__AKBasicLoginAlertController__setupAuthenticateAndCancelButtonsWithIForgot___block_invoke_2;
    v18[3] = &unk_1E7679838;
    v18[4] = self;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)MEMORY[0x1E0CEA2E0];
  -[AKBasicLoginAlertController authenticateButtonTitle](self, "authenticateButtonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SIGN_IN"), &stru_1E7679C68, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "_actionWithTitle:descriptiveText:image:style:handler:shouldDismissHandler:", v14, 0, 0, 0, v6, &__block_literal_global_5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

  }
  if (v11)
  {
    v23[0] = v15;
    v23[1] = v11;
    -[AKBasicLoginAlertController _wrappedCancelAction](self, "_wrappedCancelAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  }
  else
  {
    v22[0] = v15;
    -[AKBasicLoginAlertController _wrappedCancelAction](self, "_wrappedCancelAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginAlertController _setActions:](self, "_setActions:", v17);

  -[AKBasicLoginAlertController setPreferredAction:](self, "setPreferredAction:", v15);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __77__AKBasicLoginAlertController__setupAuthenticateAndCancelButtonsWithIForgot___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_syncUsernameAndPasswordPropertiesWithTextFieldContent");
  objc_msgSend(WeakRetained, "loginActions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "authenticateAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "loginActions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "authenticateAction");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "username");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "password");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v4)[2](v4, v5, v6);

  }
}

uint64_t __77__AKBasicLoginAlertController__setupAuthenticateAndCancelButtonsWithIForgot___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissAndShowiForgot:", 0);
}

uint64_t __77__AKBasicLoginAlertController__setupAuthenticateAndCancelButtonsWithIForgot___block_invoke_3()
{
  return 0;
}

- (void)_setupViewControllerForDefaultStyle
{
  void *v2;
  void *v3;
  __CFString *v4;
  AKBasicLoginContentViewController *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
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
  int v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;

  -[AKBasicLoginAlertController contentViewController](self, "contentViewController");
  v6 = (AKBasicLoginContentViewController *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[AKBasicLoginContentViewController initWithNibName:bundle:]([AKBasicLoginContentViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[AKBasicLoginAlertController setContentViewController:](self, "setContentViewController:", v6);
  }
  -[AKBasicLoginAlertController authenticateTitle](self, "authenticateTitle");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v9 = 0;
    v10 = 0;
    v11 = (void *)v7;
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("APPLE_ID_SIGN_IN_HEADER");
    v13 = objc_msgSend(CFSTR("APPLE_ID_SIGN_IN_HEADER"), "containsString:", CFSTR("REBRAND"));
    if ((v13 & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "isAABrandingEnabled"))
      {
        objc_msgSend(CFSTR("APPLE_ID_SIGN_IN_HEADER"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v10 = 1;
      }
      else
      {
        v10 = 0;
      }
    }
    v9 = v13 ^ 1;
    v3 = v12;
    objc_msgSend(v12, "localizedStringForKey:value:table:", v4, &stru_1E7679C68, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AKBasicLoginContentViewController contentContainerView](v6, "contentContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitleText:", v11);

  if (v8)
  {
    if (!v10)
      goto LABEL_13;
  }
  else
  {

    if (!v10)
    {
LABEL_13:
      if (!v9)
        goto LABEL_14;
LABEL_21:

      if (v8)
        goto LABEL_15;
      goto LABEL_22;
    }
  }

  if (v9)
    goto LABEL_21;
LABEL_14:
  if (v8)
    goto LABEL_15;
LABEL_22:

LABEL_15:
  -[AKBasicLoginAlertController reason](self, "reason");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginContentViewController contentContainerView](v6, "contentContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMessageText:", v15);

  v17 = (void *)MEMORY[0x1E0D002B8];
  -[AKBasicLoginAlertController username](self, "username");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "formattedUsernameFromUsername:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("APPLE_ID_ALERT_PLACEHOLDER"), "containsString:", CFSTR("REBRAND")))
  {
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("APPLE_ID_ALERT_PLACEHOLDER"), &stru_1E7679C68, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("APPLE_ID_ALERT_PLACEHOLDER"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", v23, &stru_1E7679C68, CFSTR("Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("APPLE_ID_ALERT_PLACEHOLDER"), &stru_1E7679C68, CFSTR("Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isMultiUserMode");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v25)
    v28 = CFSTR("PASSCODE_ALERT_PLACEHOLDER");
  else
    v28 = CFSTR("PASSWORD_ALERT_PLACEHOLDER");
  objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_1E7679C68, CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v30 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __66__AKBasicLoginAlertController__setupViewControllerForDefaultStyle__block_invoke;
  v37[3] = &unk_1E7679880;
  v31 = v19;
  v38 = v31;
  v32 = v21;
  v39 = v32;
  -[AKBasicLoginAlertController addTextFieldWithConfigurationHandler:](self, "addTextFieldWithConfigurationHandler:", v37);
  v34[0] = v30;
  v34[1] = 3221225472;
  v34[2] = __66__AKBasicLoginAlertController__setupViewControllerForDefaultStyle__block_invoke_2;
  v34[3] = &unk_1E76798A8;
  objc_copyWeak(&v36, &location);
  v33 = v29;
  v35 = v33;
  -[AKBasicLoginAlertController addTextFieldWithConfigurationHandler:](self, "addTextFieldWithConfigurationHandler:", v34);
  -[AKBasicLoginAlertController _setupAuthenticateAndCancelButtons](self, "_setupAuthenticateAndCancelButtons");

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

void __66__AKBasicLoginAlertController__setupViewControllerForDefaultStyle__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setKeyboardType:", 7);
  objc_msgSend(v4, "setText:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setBorderStyle:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(v4, "setTextContentType:", *MEMORY[0x1E0CEBD10]);
  objc_msgSend(v4, "setPlaceholder:", *(_QWORD *)(a1 + 40));

}

void __66__AKBasicLoginAlertController__setupViewControllerForDefaultStyle__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v6, "setSecureTextEntry:", 1);
    objc_msgSend(v6, "setBorderStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v4);

    objc_msgSend(v6, "setDelegate:", WeakRetained);
    objc_msgSend(v6, "setEnablesReturnKeyAutomatically:", 1);
    objc_msgSend(v6, "setTextContentType:", *MEMORY[0x1E0CEBCD0]);
    objc_msgSend(v6, "setPlaceholder:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "addTarget:action:forControlEvents:", WeakRetained, sel__passwordFieldDidChange_, 0x20000);
    v5 = (id)objc_msgSend(v6, "ak_addForgotButtonWithTarget:action:", WeakRetained, sel__dismissAndShowiForgot_);
  }

}

- (void)_setupViewControllerForNonEditableUsernameFieldStyle
{
  AKBasicLoginContentViewController *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  char v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  -[AKBasicLoginAlertController contentViewController](self, "contentViewController");
  v3 = (AKBasicLoginContentViewController *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[AKBasicLoginContentViewController initWithNibName:bundle:]([AKBasicLoginContentViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[AKBasicLoginAlertController setContentViewController:](self, "setContentViewController:", v3);
  }
  v4 = (void *)0x1E0D00000;
  objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMultiUserMode");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("APPLE_ID_PASSCODE_HEADER_IPAD"), &stru_1E7679C68, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("APPLE_ID_PASSWORD_HEADER");
    v11 = objc_msgSend(CFSTR("APPLE_ID_PASSWORD_HEADER"), "containsString:", CFSTR("REBRAND"));
    if ((v11 & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isAABrandingEnabled"))
      {
        objc_msgSend(CFSTR("APPLE_ID_PASSWORD_HEADER"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v12 = 1;
      }
      else
      {
        v12 = 0;
      }
    }
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E7679C68, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)

    if ((v11 & 1) == 0)
  }

  -[AKBasicLoginAlertController authenticateTitle](self, "authenticateTitle");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v9;
  -[AKBasicLoginContentViewController contentContainerView](v3, "contentContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitleText:", v15);

  -[AKBasicLoginAlertController reason](self, "reason");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginContentViewController contentContainerView](v3, "contentContainerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMessageText:", v17);

  objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v19, "isMultiUserMode");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((_DWORD)v18)
    v22 = CFSTR("PASSCODE_ALERT_PLACEHOLDER");
  else
    v22 = CFSTR("PASSWORD_ALERT_PLACEHOLDER");
  objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1E7679C68, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __83__AKBasicLoginAlertController__setupViewControllerForNonEditableUsernameFieldStyle__block_invoke;
  v25[3] = &unk_1E76798A8;
  objc_copyWeak(&v27, &location);
  v24 = v23;
  v26 = v24;
  -[AKBasicLoginAlertController addTextFieldWithConfigurationHandler:](self, "addTextFieldWithConfigurationHandler:", v25);
  -[AKBasicLoginAlertController _setupAuthenticateAndCancelButtons](self, "_setupAuthenticateAndCancelButtons");

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __83__AKBasicLoginAlertController__setupViewControllerForNonEditableUsernameFieldStyle__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v6, "setSecureTextEntry:", 1);
    objc_msgSend(v6, "setBorderStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v4);

    objc_msgSend(v6, "setDelegate:", WeakRetained);
    objc_msgSend(v6, "setEnablesReturnKeyAutomatically:", 1);
    objc_msgSend(v6, "setTextContentType:", *MEMORY[0x1E0CEBCD0]);
    objc_msgSend(v6, "setPlaceholder:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "addTarget:action:forControlEvents:", WeakRetained, sel__passwordFieldDidChange_, 0x20000);
    v5 = (id)objc_msgSend(v6, "ak_addForgotButtonWithTarget:action:", WeakRetained, sel__dismissAndShowiForgot_);
  }

}

- (void)_setupViewControllerForUserOrCreateAppleIDStyle
{
  void *v2;
  AKBasicLoginContentViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  int v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  id *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  _QWORD v32[5];

  v32[3] = *MEMORY[0x1E0C80C00];
  -[AKBasicLoginAlertController contentViewController](self, "contentViewController");
  v4 = (AKBasicLoginContentViewController *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[AKBasicLoginContentViewController initWithNibName:bundle:]([AKBasicLoginContentViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[AKBasicLoginAlertController setContentViewController:](self, "setContentViewController:", v4);
  }
  -[AKBasicLoginAlertController authenticateTitle](self, "authenticateTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[AKBasicLoginAlertController reason](self, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AKBasicLoginContentViewController contentContainerView](v4, "contentContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleText:", v6);

  if (!v5)
  -[AKBasicLoginContentViewController contentContainerView](v4, "contentContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMessageText:", 0);

  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(CFSTR("USE_APPLE_ID"), "containsString:", CFSTR("REBRAND"));
  if ((v11 & 1) != 0)
  {
    v12 = 0;
    v13 = CFSTR("USE_APPLE_ID");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("USE_APPLE_ID"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v12 = 1;
    }
    else
    {
      v12 = 0;
      v13 = CFSTR("USE_APPLE_ID");
    }
  }
  objc_msgSend(v10, "localizedStringForKey:value:table:", v13, &stru_1E7679C68, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __78__AKBasicLoginAlertController__setupViewControllerForUserOrCreateAppleIDStyle__block_invoke;
  v29[3] = &unk_1E7679810;
  v24 = &v30;
  objc_copyWeak(&v30, &location);
  objc_msgSend(v9, "_actionWithTitle:descriptiveText:image:style:handler:shouldDismissHandler:", v14, 0, 0, 0, v29, &__block_literal_global_57);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  if ((v11 & 1) == 0)

  v15 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(CFSTR("CREATE_APPLE_ID"), "containsString:", CFSTR("REBRAND"));
  if ((v17 & 1) != 0)
  {
    v18 = 0;
    v19 = CFSTR("CREATE_APPLE_ID");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager", &v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("CREATE_APPLE_ID"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v18 = 1;
    }
    else
    {
      v18 = 0;
      v19 = CFSTR("CREATE_APPLE_ID");
    }
  }
  objc_msgSend(v16, "localizedStringForKey:value:table:", v19, &stru_1E7679C68, CFSTR("Localizable"), v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __78__AKBasicLoginAlertController__setupViewControllerForUserOrCreateAppleIDStyle__block_invoke_3;
  v27[3] = &unk_1E7679810;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v15, "actionWithTitle:style:handler:", v20, 0, v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  if ((v17 & 1) == 0)

  v32[0] = v26;
  v32[1] = v21;
  -[AKBasicLoginAlertController _wrappedCancelAction](self, "_wrappedCancelAction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginAlertController _setActions:](self, "_setActions:", v23);

  objc_destroyWeak(&v28);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

}

void __78__AKBasicLoginAlertController__setupViewControllerForUserOrCreateAppleIDStyle__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void (**v4)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "loginActions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "useIDAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "loginActions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "useIDAction");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

uint64_t __78__AKBasicLoginAlertController__setupViewControllerForUserOrCreateAppleIDStyle__block_invoke_2()
{
  return 0;
}

void __78__AKBasicLoginAlertController__setupViewControllerForUserOrCreateAppleIDStyle__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void (**v4)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "loginActions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "createIDAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "loginActions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createIDAction");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)_setupViewControllerForIForgotStyle
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  int v7;
  __CFString *v8;
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
  char v20;
  int v21;
  __CFString *v22;
  void *v23;
  id *v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  -[AKBasicLoginAlertController setContentViewController:](self, "setContentViewController:", 0);
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0CEA2E0];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("FORGOT_APPLE_ID"), "containsString:", CFSTR("REBRAND"));
  if ((v6 & 1) != 0)
  {
    v7 = 0;
    v8 = CFSTR("FORGOT_APPLE_ID");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("FORGOT_APPLE_ID"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = 1;
    }
    else
    {
      v7 = 0;
      v8 = CFSTR("FORGOT_APPLE_ID");
    }
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v8, &stru_1E7679C68, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __66__AKBasicLoginAlertController__setupViewControllerForIForgotStyle__block_invoke;
  v31[3] = &unk_1E7679810;
  v24 = &v32;
  objc_copyWeak(&v32, &location);
  objc_msgSend(v3, "actionWithTitle:style:handler:", v9, 0, v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  if ((v6 & 1) == 0)

  v11 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD_ALERT"), &stru_1E7679C68, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __66__AKBasicLoginAlertController__setupViewControllerForIForgotStyle__block_invoke_2;
  v29 = &unk_1E7679810;
  objc_copyWeak(&v30, &location);
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, &v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = v10;
  v34[1] = v14;
  -[AKBasicLoginAlertController _wrappedCancelAction](self, "_wrappedCancelAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginAlertController _setActions:](self, "_setActions:", v16);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FORGOT_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginAlertController setTitle:](self, "setTitle:", v18);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(CFSTR("FORGOT_DESCRIPTION"), "containsString:", CFSTR("REBRAND"));
  if ((v20 & 1) != 0)
  {
    v21 = 0;
    v22 = CFSTR("FORGOT_DESCRIPTION");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager", &v32, v26, v27, v28, v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("FORGOT_DESCRIPTION"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v21 = 1;
    }
    else
    {
      v21 = 0;
      v22 = CFSTR("FORGOT_DESCRIPTION");
    }
  }
  objc_msgSend(v19, "localizedStringForKey:value:table:", v22, &stru_1E7679C68, CFSTR("Localizable"), v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginAlertController setMessage:](self, "setMessage:", v23);

  if (v21)
  if ((v20 & 1) == 0)

  objc_destroyWeak(&v30);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __66__AKBasicLoginAlertController__setupViewControllerForIForgotStyle__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void (**v4)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "loginActions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "forgotIDAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "loginActions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forgotIDAction");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

void __66__AKBasicLoginAlertController__setupViewControllerForIForgotStyle__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "loginActions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "forgotPasswordAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v7;
    if (v3)
    {
      objc_msgSend(v7, "_syncUsernameAndPasswordPropertiesWithTextFieldContent");
      objc_msgSend(v7, "loginActions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "forgotPasswordAction");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "username");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v5)[2](v5, v6);

      WeakRetained = v7;
    }
  }

}

- (void)_setupViewControllerForSecondFactorEntryStyle:(int64_t)a3
{
  AKSecondFactorCodeEntryContentViewController *v5;
  AKSecondFactorCodeEntryContentViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  -[AKBasicLoginAlertController contentViewController](self, "contentViewController");
  v5 = (AKSecondFactorCodeEntryContentViewController *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
  }
  else
  {
    v6 = -[AKSecondFactorCodeEntryContentViewController initWithNibName:bundle:]([AKSecondFactorCodeEntryContentViewController alloc], "initWithNibName:bundle:", 0, 0);

    if (a3 == 5)
      -[AKSecondFactorCodeEntryContentViewController setPiggybackingForTrustedDevice:](v6, "setPiggybackingForTrustedDevice:", 1);
    -[AKBasicLoginAlertController setContentViewController:](self, "setContentViewController:", v6);
  }
  -[AKBasicLoginAlertController reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSecondFactorCodeEntryContentViewController setReason:](v6, "setReason:", v7);

  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DIDNT_GET_A_CODE"), &stru_1E7679C68, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__AKBasicLoginAlertController__setupViewControllerForSecondFactorEntryStyle___block_invoke;
  v14[3] = &unk_1E7679810;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v11;
  -[AKBasicLoginAlertController _wrappedCancelAction](self, "_wrappedCancelAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginAlertController _setActions:](self, "_setActions:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __77__AKBasicLoginAlertController__setupViewControllerForSecondFactorEntryStyle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void (**v4)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "secondFactorActions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "regenerateCodeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "secondFactorActions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "regenerateCodeAction");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)_dismissAndShowiForgot:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  -[AKBasicLoginAlertController loginActions](self, "loginActions", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forgotPasswordAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AKBasicLoginAlertController _syncUsernameAndPasswordPropertiesWithTextFieldContent](self, "_syncUsernameAndPasswordPropertiesWithTextFieldContent");
    -[AKBasicLoginAlertController loginActions](self, "loginActions");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "forgotPasswordAction");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSString *))v6)[2](v6, self->_ak_username);

  }
}

- (void)setAlertStyle:(int64_t)a3
{
  self->_alertStyle = a3;
  -[AKBasicLoginAlertController _setupViewControllerForAlertStyle](self, "_setupViewControllerForAlertStyle");
}

- (int64_t)alertStyle
{
  return self->_alertStyle;
}

- (void)setUsername:(id)a3
{
  NSString *v4;
  NSString *ak_username;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  ak_username = self->_ak_username;
  self->_ak_username = v4;

  -[AKBasicLoginAlertController _setupViewControllerForAlertStyle](self, "_setupViewControllerForAlertStyle");
}

- (NSString)username
{
  return (NSString *)(id)-[NSString copy](self->_ak_username, "copy");
}

- (void)setPassword:(id)a3
{
  NSString *v4;
  NSString *ak_password;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  ak_password = self->_ak_password;
  self->_ak_password = v4;

  -[AKBasicLoginAlertController _setupViewControllerForAlertStyle](self, "_setupViewControllerForAlertStyle");
}

- (NSString)password
{
  return (NSString *)(id)-[NSString copy](self->_ak_password, "copy");
}

- (void)setAuthenticateTitle:(id)a3
{
  NSString *v4;
  NSString *ak_title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  ak_title = self->_ak_title;
  self->_ak_title = v4;

  -[AKBasicLoginAlertController _setupViewControllerForAlertStyle](self, "_setupViewControllerForAlertStyle");
}

- (NSString)authenticateTitle
{
  return (NSString *)(id)-[NSString copy](self->_ak_title, "copy");
}

- (void)setReason:(id)a3
{
  NSString *v4;
  NSString *ak_reason;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  ak_reason = self->_ak_reason;
  self->_ak_reason = v4;

  -[AKBasicLoginAlertController _setupViewControllerForAlertStyle](self, "_setupViewControllerForAlertStyle");
}

- (NSString)reason
{
  return (NSString *)(id)-[NSString copy](self->_ak_reason, "copy");
}

- (void)setAuthenticateButtonTitle:(id)a3
{
  NSString *v4;
  NSString *ak_authenticateButtonTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  ak_authenticateButtonTitle = self->_ak_authenticateButtonTitle;
  self->_ak_authenticateButtonTitle = v4;

  -[AKBasicLoginAlertController _setupViewControllerForAlertStyle](self, "_setupViewControllerForAlertStyle");
}

- (NSString)authenticateButtonTitle
{
  return (NSString *)(id)-[NSString copy](self->_ak_authenticateButtonTitle, "copy");
}

- (void)setCancelButtonTitle:(id)a3
{
  NSString *v4;
  NSString *ak_cancelButtonTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  ak_cancelButtonTitle = self->_ak_cancelButtonTitle;
  self->_ak_cancelButtonTitle = v4;

  -[AKBasicLoginAlertController _setupViewControllerForAlertStyle](self, "_setupViewControllerForAlertStyle");
}

- (NSString)cancelButtonTitle
{
  return (NSString *)(id)-[NSString copy](self->_ak_cancelButtonTitle, "copy");
}

- (void)clearSecondFactorEntry
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint8_t v7[16];

  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Received request to clear 2FA Entry Field", v7, 2u);
  }

  -[AKBasicLoginAlertController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EF523A70);

  if (v5)
  {
    -[AKBasicLoginAlertController contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearSecondFactorEntry");

  }
}

- (void)setPasscodeFieldDisabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;

  v3 = a3;
  -[AKBasicLoginAlertController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EF523A70);

  if (v6)
  {
    -[AKBasicLoginAlertController contentViewController](self, "contentViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPasscodeFieldDisabled:", v3);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginAlertController;
  -[AKBasicLoginAlertController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[AKBasicLoginAlertController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "basicLoginControllerDidPresent:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginAlertController;
  -[AKBasicLoginAlertController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[AKBasicLoginAlertController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "basicLoginControllerWillDismiss:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginAlertController;
  -[AKBasicLoginAlertController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[AKBasicLoginAlertController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "basicLoginControllerDidDismiss:", self);

}

- (id)_passwordField
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[AKBasicLoginAlertController textFields](self, "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_122);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __45__AKBasicLoginAlertController__passwordField__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSecureTextEntry");
}

- (BOOL)disablesAutomaticKeyboardDismissal
{
  return 1;
}

- (void)startAnimating
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!-[AKBasicLoginAlertController alertStyle](self, "alertStyle")
    || -[AKBasicLoginAlertController alertStyle](self, "alertStyle") == 1)
  {
    -[AKBasicLoginAlertController textFields](self, "textFields");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_beginPinningInputViews");

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[AKBasicLoginAlertController textFields](self, "textFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9++), "setEnabled:", 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AKBasicLoginAlertController actions](self, "actions", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "setEnabled:", 0);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  -[AKBasicLoginAlertController _passwordField](self, "_passwordField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "ak_addActivityIndicator");

}

- (void)stopAnimating
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[AKBasicLoginAlertController textFields](self, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v7++), "setEnabled:", 1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v5);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[AKBasicLoginAlertController actions](self, "actions", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12++), "setEnabled:", 1);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v10);
  }

  -[AKBasicLoginAlertController _passwordField](self, "_passwordField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
    objc_msgSend(v13, "setRightView:", 0);
  else
    v16 = (id)objc_msgSend(v13, "ak_addForgotButtonWithTarget:action:", self, sel__dismissAndShowiForgot_);
  -[AKBasicLoginAlertController textFields](self, "textFields");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "becomeFirstResponder");

  -[AKBasicLoginAlertController textFields](self, "textFields");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "_isPinningInputViews");

  if (v21)
  {
    -[AKBasicLoginAlertController textFields](self, "textFields");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_endPinningInputViews");

  }
}

- (void)jiggleAView
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  -[AKBasicLoginAlertController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EF523A70);

  if (v4)
  {
    -[AKBasicLoginAlertController contentViewController](self, "contentViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "jiggleAView");
  }
  else
  {
    -[AKBasicLoginAlertController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD26F8], "ak_jiggleAnimation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAnimation:forKey:", v6, CFSTR("jiggle"));

  }
}

- (void)clearPasswordField
{
  id v3;

  -[AKBasicLoginAlertController _passwordField](self, "_passwordField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);
  -[AKBasicLoginAlertController _passwordFieldDidChange:](self, "_passwordFieldDidChange:", v3);

}

- (void)_passwordFieldDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  objc_opt_class();
  v10 = v4;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:

    v5 = v10;
    goto LABEL_11;
  }
  v5 = v10;
  if (v10)
  {
    objc_msgSend(v10, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length")
      || (objc_msgSend(v10, "rightView"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      if (objc_msgSend(v6, "length"))
      {
        objc_msgSend(v10, "rightView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          objc_msgSend(v10, "setRightView:", 0);
      }
    }
    else
    {
      v9 = (id)objc_msgSend(v10, "ak_addForgotButtonWithTarget:action:", self, sel__dismissAndShowiForgot_);
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (void)_beginObservingDidEnterCodeNotifications
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *didEnterCodeObserver;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__AKBasicLoginAlertController__beginObservingDidEnterCodeNotifications__block_invoke;
  v7[3] = &unk_1E7679930;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("AKSecondFactorCodeEntryContentViewControllerDidEnterCodeNotification"), 0, v4, v7);
  v5 = objc_claimAutoreleasedReturnValue();
  didEnterCodeObserver = self->_didEnterCodeObserver;
  self->_didEnterCodeObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __71__AKBasicLoginAlertController__beginObservingDidEnterCodeNotifications__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didEnterCode:", v3);

}

- (void)_didEnterCode:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AKBasicLoginAlertController secondFactorActions](self, "secondFactorActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "codeEnteredAction");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v8, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("generatedCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v7);

  }
}

- (void)_endObservingDidEnterCodeNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_didEnterCodeObserver);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (NSString)generatedCode
{
  return self->_generatedCode;
}

- (void)setGeneratedCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1368);
}

- (AKBasicLoginActions)loginActions
{
  return self->_loginActions;
}

- (void)setLoginActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1376);
}

- (AKBasicLoginSecondFactorActions)secondFactorActions
{
  return self->_secondFactorActions;
}

- (void)setSecondFactorActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1384);
}

- (AKBasicLoginControllerDelegate)delegate
{
  return (AKBasicLoginControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondFactorActions, 0);
  objc_storeStrong((id *)&self->_loginActions, 0);
  objc_storeStrong((id *)&self->_generatedCode, 0);
  objc_storeStrong((id *)&self->_ak_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_ak_authenticateButtonTitle, 0);
  objc_storeStrong((id *)&self->_ak_reason, 0);
  objc_storeStrong((id *)&self->_ak_title, 0);
  objc_storeStrong((id *)&self->_ak_password, 0);
  objc_storeStrong((id *)&self->_ak_username, 0);
  objc_storeStrong((id *)&self->_didEnterCodeObserver, 0);
}

@end
