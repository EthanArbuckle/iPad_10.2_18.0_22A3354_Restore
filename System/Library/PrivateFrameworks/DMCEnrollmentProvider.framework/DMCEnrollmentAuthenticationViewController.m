@implementation DMCEnrollmentAuthenticationViewController

- (DMCEnrollmentAuthenticationViewController)init
{
  void *v3;
  DMCEnrollmentAuthenticationViewController *v4;
  DMCEnrollmentTableViewTextFieldCell *v5;
  DMCEnrollmentTableViewTextFieldCell *usernameCell;
  void *v7;
  void *v8;
  void *v9;
  DMCEnrollmentTableViewTextFieldCell *v10;
  DMCEnrollmentTableViewTextFieldCell *passwordCell;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  DMCLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)DMCEnrollmentAuthenticationViewController;
  v4 = -[DMCEnrollmentTemplateTableViewController initWithIconNames:title:subTitle:](&v15, sel_initWithIconNames_title_subTitle_, &unk_24D548678, v3, 0);

  if (v4)
  {
    v5 = -[DMCEnrollmentTableViewTextFieldCell initWithType:]([DMCEnrollmentTableViewTextFieldCell alloc], "initWithType:", 0);
    usernameCell = v4->_usernameCell;
    v4->_usernameCell = v5;

    -[DMCEnrollmentTableViewTextFieldCell textField](v4->_usernameCell, "textField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v4);

    -[DMCEnrollmentTableViewTextFieldCell textField](v4->_usernameCell, "textField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v4, sel_textFieldDidChange_, 0x20000);

    v16[0] = v4->_usernameCell;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_userInputSection = -[DMCEnrollmentTemplateTableViewController addSectionWithCellData:animated:](v4, "addSectionWithCellData:animated:", v9, 0);

    v10 = -[DMCEnrollmentTableViewTextFieldCell initWithType:]([DMCEnrollmentTableViewTextFieldCell alloc], "initWithType:", 1);
    passwordCell = v4->_passwordCell;
    v4->_passwordCell = v10;

    -[DMCEnrollmentTableViewTextFieldCell textField](v4->_passwordCell, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v4);

    -[DMCEnrollmentTableViewTextFieldCell textField](v4->_passwordCell, "textField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTarget:action:forControlEvents:", v4, sel_textFieldDidChange_, 0x20000);

    v4->_usernameEditable = 1;
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  DMCEnrollmentLinkLabelView *v7;
  void *v8;
  DMCEnrollmentLinkLabelView *v9;
  DMCEnrollmentLinkLabelView *v10;
  void *v11;
  void *v12;
  void *v13;
  DMCEnrollmentConfirmationView *v14;
  void *v15;
  DMCEnrollmentConfirmationView *v16;
  DMCEnrollmentConfirmationView *confirmationView;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)DMCEnrollmentAuthenticationViewController;
  -[DMCEnrollmentTemplateTableViewController viewWillAppear:](&v23, sel_viewWillAppear_, a3);
  if ((-[DMCEnrollmentAuthenticationViewController isBeingPresented](self, "isBeingPresented") & 1) != 0
    || -[DMCEnrollmentAuthenticationViewController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    -[DMCEnrollmentAuthenticationViewController _setupNavigationBar](self, "_setupNavigationBar");
    -[DMCEnrollmentTemplateTableViewController bottomView](self, "bottomView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[DMCEnrollmentAuthenticationViewController bottomViewText](self, "bottomViewText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (v6)
      {
        v7 = [DMCEnrollmentLinkLabelView alloc];
        -[DMCEnrollmentAuthenticationViewController bottomViewText](self, "bottomViewText");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[DMCEnrollmentLinkLabelView initWithIcon:message:linkMessage:linkHandler:](v7, "initWithIcon:message:linkMessage:linkHandler:", 0, v8, 0, 0);

      }
      else
      {
        objc_initWeak(&location, self);
        v10 = [DMCEnrollmentLinkLabelView alloc];
        DMCLocalizedString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        DMCLocalizedString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __60__DMCEnrollmentAuthenticationViewController_viewWillAppear___block_invoke;
        v20[3] = &unk_24D52E7F8;
        objc_copyWeak(&v21, &location);
        v9 = -[DMCEnrollmentLinkLabelView initWithIcon:message:linkMessage:linkHandler:](v10, "initWithIcon:message:linkMessage:linkHandler:", 0, v11, v12, v20);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
      -[DMCEnrollmentTemplateTableViewController addBottomView:](self, "addBottomView:", v9);
      -[DMCEnrollmentAuthenticationViewController setBottomLinkView:](self, "setBottomLinkView:", v9);

    }
    -[DMCEnrollmentAuthenticationViewController confirmationView](self, "confirmationView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_initWeak(&location, self);
      v14 = [DMCEnrollmentConfirmationView alloc];
      DMCLocalizedString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __60__DMCEnrollmentAuthenticationViewController_viewWillAppear___block_invoke_3;
      v18[3] = &unk_24D52E7F8;
      objc_copyWeak(&v19, &location);
      v16 = -[DMCEnrollmentConfirmationView initWithConfirmationText:cancelText:confirmationAction:cancelAction:](v14, "initWithConfirmationText:cancelText:confirmationAction:cancelAction:", v15, 0, v18, 0);
      confirmationView = self->_confirmationView;
      self->_confirmationView = v16;

      -[DMCEnrollmentTemplateTableViewController addFloatyBottomView:](self, "addFloatyBottomView:", self->_confirmationView);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    -[DMCEnrollmentAuthenticationViewController updateContinueButtonStatus](self, "updateContinueButtonStatus");
  }
}

void __60__DMCEnrollmentAuthenticationViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__DMCEnrollmentAuthenticationViewController_viewWillAppear___block_invoke_2;
    block[3] = &unk_24D52E500;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __60__DMCEnrollmentAuthenticationViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  return +[DMCEnrollmentAboutRemoteManagementViewController presentAboutRemoteManagementViewControllerWithBaseViewController:](DMCEnrollmentAboutRemoteManagementViewController, "presentAboutRemoteManagementViewControllerWithBaseViewController:", *(_QWORD *)(a1 + 32));
}

void __60__DMCEnrollmentAuthenticationViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "continueButtonTapped");

}

- (void)viewControllerHasBeenDismissed
{
  id v3;

  -[DMCEnrollmentAuthenticationViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authenticationViewControllerDidCancel:", self);

}

- (void)_setupNavigationBar
{
  void *v3;
  NSString *cancelButtonTitle;
  void *v5;
  id v6;

  -[DMCEnrollmentTemplateTableViewController updateNavBarButtonType:forButtonPosition:enabled:](self, "updateNavBarButtonType:forButtonPosition:enabled:", 1, 0, 1);
  -[DMCEnrollmentAuthenticationViewController cancelButtonTitle](self, "cancelButtonTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    cancelButtonTitle = self->_cancelButtonTitle;
    -[DMCEnrollmentAuthenticationViewController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leftBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", cancelButtonTitle);

  }
}

- (void)updateContinueButtonStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  id v14;

  if (-[DMCEnrollmentTemplateTableViewController inProgress](self, "inProgress"))
  {
    -[DMCEnrollmentAuthenticationViewController confirmationView](self, "confirmationView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInProgress:", 1);
  }
  else
  {
    -[DMCEnrollmentAuthenticationViewController usernameCell](self, "usernameCell");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    LODWORD(v3) = -[DMCEnrollmentAuthenticationViewController isDisplayingPasswordCell](self, "isDisplayingPasswordCell");
    v7 = objc_msgSend(v14, "length");
    if ((_DWORD)v3)
    {
      if (v7)
      {
        -[DMCEnrollmentAuthenticationViewController passwordCell](self, "passwordCell");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "textField");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length") != 0;

      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = v7 != 0;
    }
    -[DMCEnrollmentAuthenticationViewController confirmationView](self, "confirmationView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInProgress:", 0);

    -[DMCEnrollmentAuthenticationViewController confirmationView](self, "confirmationView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConfirmationButtonEnabled:", v11);

  }
}

- (void)setUsername:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  v5 = a3;
  objc_storeStrong((id *)&self->_username, a3);
  -[DMCEnrollmentAuthenticationViewController usernameCell](self, "usernameCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

  if (!objc_msgSend(v5, "length"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__DMCEnrollmentAuthenticationViewController_setUsername___block_invoke;
    block[3] = &unk_24D52E500;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __57__DMCEnrollmentAuthenticationViewController_setUsername___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showPasswordField:", 0);
}

- (void)setCancelButtonTitle:(id)a3
{
  NSString *v4;
  NSString *cancelButtonTitle;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[NSString isEqualToString:](self->_cancelButtonTitle, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v9, "copy");
    cancelButtonTitle = self->_cancelButtonTitle;
    self->_cancelButtonTitle = v4;

    v6 = self->_cancelButtonTitle;
    -[DMCEnrollmentAuthenticationViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leftBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v6);

  }
}

- (void)setBottomText:(id)a3
{
  NSString *v4;
  NSString *bottomViewText;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_bottomViewText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    bottomViewText = self->_bottomViewText;
    self->_bottomViewText = v4;

  }
}

- (void)setInProgress:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DMCEnrollmentAuthenticationViewController;
  -[DMCEnrollmentTemplateTableViewController setInProgress:](&v7, sel_setInProgress_);
  v5 = !v3;
  -[DMCEnrollmentTemplateTableViewController updateNavBarButtonType:forButtonPosition:enabled:](self, "updateNavBarButtonType:forButtonPosition:enabled:", 1, 0, v5);
  -[DMCEnrollmentAuthenticationViewController bottomLinkView](self, "bottomLinkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

}

- (void)setStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3 == 1)
    {
      -[DMCEnrollmentTemplateTableViewController setIconNames:](self, "setIconNames:", &unk_24D5486A8);
      DMCLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentTemplateTableViewController setTitleText:](self, "setTitleText:", v5);

      -[DMCEnrollmentAuthenticationViewController usernameCell](self, "usernameCell");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      DMCLocalizedFormat();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentTemplateTableViewController setSubtitleText:](self, "setSubtitleText:", v9, v8);

      -[DMCEnrollmentTemplateTableViewController bottomView](self, "bottomView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", 0.0);

      -[DMCEnrollmentAuthenticationViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
    }
    else if (!a3)
    {
      -[DMCEnrollmentTemplateTableViewController setIconNames:](self, "setIconNames:", &unk_24D548690);
      DMCLocalizedString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentTemplateTableViewController setTitleText:](self, "setTitleText:", v4);

      -[DMCEnrollmentTemplateTableViewController setSubtitleText:](self, "setSubtitleText:", 0);
      -[DMCEnrollmentTemplateTableViewController bottomView](self, "bottomView");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAlpha:", 1.0);

    }
  }
}

- (void)setUsernameEditable:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_usernameEditable != a3)
  {
    self->_usernameEditable = a3;
    if (a3)
      objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "placeholderTextColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentAuthenticationViewController usernameCell](self, "usernameCell");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

  }
}

- (void)showPasswordField:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x24BDAC8D0];
  if (-[DMCEnrollmentAuthenticationViewController isDisplayingPasswordCell](self, "isDisplayingPasswordCell") != a3)
  {
    if (v3)
    {
      -[DMCEnrollmentAuthenticationViewController setIsDisplayingPasswordCell:](self, "setIsDisplayingPasswordCell:", 1);
      v9[4] = self;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __63__DMCEnrollmentAuthenticationViewController_showPasswordField___block_invoke;
      v10[3] = &unk_24D52E500;
      v10[4] = self;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __63__DMCEnrollmentAuthenticationViewController_showPasswordField___block_invoke_2;
      v9[3] = &unk_24D52E820;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v10, v9, 0.2);
    }
    else
    {
      -[DMCEnrollmentAuthenticationViewController setIsDisplayingPasswordCell:](self, "setIsDisplayingPasswordCell:", 0);
      -[DMCEnrollmentAuthenticationViewController passwordCell](self, "passwordCell");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentTemplateTableViewController removeCellData:fromSection:animated:](self, "removeCellData:fromSection:animated:", v6, -[DMCEnrollmentAuthenticationViewController userInputSection](self, "userInputSection"), 1);

      -[DMCEnrollmentAuthenticationViewController passwordCell](self, "passwordCell");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", 0);

    }
    -[DMCEnrollmentAuthenticationViewController updateContinueButtonStatus](self, "updateContinueButtonStatus");
  }
}

void __63__DMCEnrollmentAuthenticationViewController_showPasswordField___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "passwordCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCellData:toSection:animated:", v4, objc_msgSend(*(id *)(a1 + 32), "userInputSection"), 1);

}

void __63__DMCEnrollmentAuthenticationViewController_showPasswordField___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "passwordCell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textField");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)leftBarButtonTapped:(id)a3
{
  id v4;

  -[DMCEnrollmentAuthenticationViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticationViewControllerDidCancel:", self);

}

- (void)continueButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (-[DMCEnrollmentAuthenticationViewController isDisplayingPasswordCell](self, "isDisplayingPasswordCell"))
  {
    -[DMCEnrollmentAuthenticationViewController passwordCell](self, "passwordCell");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resignFirstResponder");

    -[DMCEnrollmentAuthenticationViewController delegate](self, "delegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentAuthenticationViewController passwordCell](self, "passwordCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentAuthenticationViewController usernameCell](self, "usernameCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "authenticationViewController:didReceivePassword:forUsername:", self, v7, v10);

  }
  else
  {
    -[DMCEnrollmentAuthenticationViewController usernameCell](self, "usernameCell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resignFirstResponder");

    -[DMCEnrollmentAuthenticationViewController delegate](self, "delegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentAuthenticationViewController usernameCell](self, "usernameCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "authenticationViewController:didReceiveUsername:", self, v9);
  }

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[DMCEnrollmentAuthenticationViewController usernameCell](self, "usernameCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return !v7 || -[DMCEnrollmentAuthenticationViewController isUsernameEditable](self, "isUsernameEditable");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    if (-[DMCEnrollmentAuthenticationViewController isDisplayingPasswordCell](self, "isDisplayingPasswordCell")
      && (-[DMCEnrollmentAuthenticationViewController usernameCell](self, "usernameCell"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "textField"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v4, "isEqual:", v10),
          v10,
          v9,
          v11))
    {
      -[DMCEnrollmentAuthenticationViewController passwordCell](self, "passwordCell");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "becomeFirstResponder");

    }
    else
    {
      -[DMCEnrollmentAuthenticationViewController continueButtonTapped](self, "continueButtonTapped");
    }
  }

  return v8 != 0;
}

- (void)textFieldDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  NSString *v10;
  void *username;
  id v12;

  v12 = a3;
  -[DMCEnrollmentAuthenticationViewController usernameCell](self, "usernameCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(v12, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DMCEnrollmentAuthenticationViewController isUsernameEditable](self, "isUsernameEditable")
      || (-[DMCEnrollmentAuthenticationViewController username](self, "username"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqualToString:", v8),
          v8,
          (v9 & 1) != 0))
    {
      v10 = v7;
      username = self->_username;
      self->_username = v10;
    }
    else
    {
      -[DMCEnrollmentAuthenticationViewController username](self, "username");
      username = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", username);
    }

  }
  -[DMCEnrollmentAuthenticationViewController updateContinueButtonStatus](self, "updateContinueButtonStatus");

}

- (DMCEnrollmentAuthenticationViewControllerDelegate)delegate
{
  return (DMCEnrollmentAuthenticationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isUsernameEditable
{
  return self->_usernameEditable;
}

- (unint64_t)style
{
  return self->_style;
}

- (DMCEnrollmentTableViewTextFieldCell)usernameCell
{
  return self->_usernameCell;
}

- (void)setUsernameCell:(id)a3
{
  objc_storeStrong((id *)&self->_usernameCell, a3);
}

- (DMCEnrollmentTableViewTextFieldCell)passwordCell
{
  return self->_passwordCell;
}

- (void)setPasswordCell:(id)a3
{
  objc_storeStrong((id *)&self->_passwordCell, a3);
}

- (NSString)username
{
  return self->_username;
}

- (unint64_t)userInputSection
{
  return self->_userInputSection;
}

- (void)setUserInputSection:(unint64_t)a3
{
  self->_userInputSection = a3;
}

- (BOOL)isDisplayingPasswordCell
{
  return self->_isDisplayingPasswordCell;
}

- (void)setIsDisplayingPasswordCell:(BOOL)a3
{
  self->_isDisplayingPasswordCell = a3;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (NSString)bottomViewText
{
  return self->_bottomViewText;
}

- (void)setBottomViewText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (DMCEnrollmentConfirmationView)confirmationView
{
  return self->_confirmationView;
}

- (void)setConfirmationView:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationView, a3);
}

- (DMCEnrollmentLinkLabelView)bottomLinkView
{
  return self->_bottomLinkView;
}

- (void)setBottomLinkView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLinkView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLinkView, 0);
  objc_storeStrong((id *)&self->_confirmationView, 0);
  objc_storeStrong((id *)&self->_bottomViewText, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_usernameCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
