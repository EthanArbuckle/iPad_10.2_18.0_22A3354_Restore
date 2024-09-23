@implementation _SFAutomaticPasswordInputViewController

+ (void)inputViewControllerWithAutoFillContext:(id)a3 passwordRules:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "_inputViewControllerWithAutoFillContext:passwordRules:overrideApplicationIdentifier:completion:", a3, a4, 0, a5);
}

+ (void)_inputViewControllerWithAutoFillContext:(id)a3 passwordRules:(id)a4 overrideApplicationIdentifier:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  id v13;
  _SFAutomaticPasswordInputViewController *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *autoFillContextProtocolObjectUUID;
  _QWORD v21[4];
  id v22;
  id v23;
  void (**v24)(id, _QWORD);

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  if (v12)
  {
    if (v9)
    {
      if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled"))
      {
        v12[2](v12, 0);
        goto LABEL_12;
      }
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_automaticPasswordKeyboard"));
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        v14 = -[_SFAutomaticPasswordInputViewController initWithPassword:keyboardType:]([_SFAutomaticPasswordInputViewController alloc], "initWithPassword:keyboardType:", 0, 0);

        if (v14)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("strongPasswordAdditionalContext"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("SFAutoFillContextProviderIdentifierUserInfoKey"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "copy");
          autoFillContextProtocolObjectUUID = v14->_autoFillContextProtocolObjectUUID;
          v14->_autoFillContextProtocolObjectUUID = (NSString *)v19;

        }
      }
      else
      {
        v14 = 0;
      }
      ((void (**)(id, _SFAutomaticPasswordInputViewController *))v12)[2](v12, v14);
    }
    else
    {
      v13 = objc_alloc_init(MEMORY[0x1E0D8A028]);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __138___SFAutomaticPasswordInputViewController__inputViewControllerWithAutoFillContext_passwordRules_overrideApplicationIdentifier_completion___block_invoke;
      v21[3] = &unk_1E4AC4978;
      v22 = v13;
      v23 = v11;
      v24 = v12;
      v14 = (_SFAutomaticPasswordInputViewController *)v13;
      -[_SFAutomaticPasswordInputViewController getAutomaticStrongPasswordForAppWithPasswordRules:confirmPasswordRules:overrideApplicationIdentifier:completion:](v14, "getAutomaticStrongPasswordForAppWithPasswordRules:confirmPasswordRules:overrideApplicationIdentifier:completion:", v10, 0, v23, v21);

    }
  }
LABEL_12:

}

- (_SFAutomaticPasswordInputViewController)initWithPassword:(id)a3 keyboardType:(int64_t)a4
{
  id v6;
  _SFAutomaticPasswordInputViewController *v7;
  uint64_t v8;
  NSString *password;
  _SFAutomaticPasswordInputViewController *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFAutomaticPasswordInputViewController;
  v7 = -[UIInputViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    password = v7->_password;
    v7->_password = (NSString *)v8;

    v7->_keyboardType = a4;
    v10 = v7;
  }

  return v7;
}

- (void)_updateKeyboardMetricsAndInterfaceOrientationIfNeeded
{
  int64_t v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGSize *p_landscapeKeyboardSize;
  CGFloat v8;
  CGFloat v9;
  id v10;

  v3 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "interfaceOrientation");
  if (v3 != self->_currentInterfaceOrientation)
  {
    self->_currentInterfaceOrientation = v3;
    +[_SFKeyboardGeometry keyboardGeometryForInterfaceOrientation:](_SFKeyboardGeometry, "keyboardGeometryForInterfaceOrientation:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sizeWithBar");
    self->_portraitKeyboardSize.width = v5;
    self->_portraitKeyboardSize.height = v6;

    +[_SFKeyboardGeometry keyboardGeometryForInterfaceOrientation:](_SFKeyboardGeometry, "keyboardGeometryForInterfaceOrientation:", 4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    p_landscapeKeyboardSize = &self->_landscapeKeyboardSize;
    if (_SFDeviceIsPad())
      objc_msgSend(v10, "sizeWithoutBar");
    else
      objc_msgSend(v10, "sizeWithBar");
    p_landscapeKeyboardSize->width = v8;
    p_landscapeKeyboardSize->height = v9;

  }
}

- (void)viewDidLoad
{
  void *v3;
  SFAutoFillStrongPasswordContainerInputView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SFAutoFillStrongPasswordContainerInputView *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *heightConstraint;
  SFAutomaticPasswordInputView *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_SFAutomaticPasswordInputViewController;
  -[UIInputViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[_SFAutomaticPasswordInputViewController strongPasswordIntroductionViewControllerIfNeeded](self, "strongPasswordIntroductionViewControllerIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_SFAutomaticPasswordInputViewController addChildViewController:](self, "addChildViewController:", v3);
    v4 = [SFAutoFillStrongPasswordContainerInputView alloc];
    -[UIInputViewController inputView](self, "inputView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "inputViewStyle");
    objc_msgSend(v3, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SFAutoFillStrongPasswordContainerInputView initWithInputViewStyle:containingView:](v4, "initWithInputViewStyle:containingView:", v6, v7);

    -[SFAutoFillStrongPasswordContainerInputView setInputViewSizing:](v8, "setInputViewSizing:", self);
    -[UIInputViewController setInputView:](self, "setInputView:", v8);
    -[SFAutoFillStrongPasswordContainerInputView heightAnchor](v8, "heightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToConstant:", 100.0);
    v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    heightConstraint = self->_heightConstraint;
    self->_heightConstraint = v10;

    -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 1);
    objc_msgSend(v3, "didMoveToParentViewController:", self);
    objc_storeStrong((id *)&self->_passwordManagerIntroductionViewController, v3);
  }
  else
  {
    v12 = [SFAutomaticPasswordInputView alloc];
    -[UIInputViewController inputView](self, "inputView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SFAutomaticPasswordInputView initWithInputViewStyle:keyboardType:](v12, "initWithInputViewStyle:keyboardType:", objc_msgSend(v13, "inputViewStyle"), self->_keyboardType);

    -[SFAutoFillStrongPasswordContainerInputView setShouldAllowSelfSizing:](v8, "setShouldAllowSelfSizing:", 1);
    -[SFAutoFillStrongPasswordContainerInputView setInputViewSizing:](v8, "setInputViewSizing:", self);
    -[UIInputViewController setInputView:](self, "setInputView:", v8);
    -[SFAutoFillStrongPasswordContainerInputView heightAnchor](v8, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", 100.0);
    v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v16 = self->_heightConstraint;
    self->_heightConstraint = v15;

    -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 1);
    -[SFAutoFillStrongPasswordContainerInputView setDelegate:](v8, "setDelegate:", self);
  }

}

- (void)_postButtonPressedNotificationForButton:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (!self->_autoFillContextProtocolObjectUUID)
  {
    self->_autoFillContextProtocolObjectUUID = (NSString *)&stru_1E4AC8470;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("_SFAutomaticPasswordInputViewNotificationPressedButtonUserInfoKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("SFAutoFillContextProviderIdentifierUserInfoKey");
  v9[0] = v6;
  v9[1] = self->_autoFillContextProtocolObjectUUID;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("_SFAutomaticPasswordInputViewButtonPressedNotification"), self, v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFAutomaticPasswordInputViewController;
  -[_SFAutomaticPasswordInputViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[_SFAutomaticPasswordInputViewController _updateKeyboardHeight](self, "_updateKeyboardHeight");
  if (-[_SFAutomaticPasswordInputViewController _inputViewControllerShouldDirectlyInsertPassword](self, "_inputViewControllerShouldDirectlyInsertPassword"))
  {
    -[UIInputViewController textDocumentProxy](self, "textDocumentProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertText:", self->_password);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__dismissKeyboard_, CFSTR("_SFAutomaticPasswordDismissedByUser"), 0);

  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled"))
  {
    if (self->_passwordManagerIntroductionViewController)
    {
      -[_SFAutomaticPasswordInputViewController _postContextProviderRequiredNotificationIfNeeded](self, "_postContextProviderRequiredNotificationIfNeeded");
      -[_SFAutomaticPasswordInputViewController autoFillContextProvider](self, "autoFillContextProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "autoFillController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hideInputAccessoryView");

    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFAutomaticPasswordInputViewController;
  -[_SFAutomaticPasswordInputViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", CFSTR("_SFAutomaticPasswordDismissedByUser"));

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFAutomaticPasswordInputViewController;
  -[_SFAutomaticPasswordInputViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[_SFAutomaticPasswordInputViewController _updateKeyboardHeight](self, "_updateKeyboardHeight");
}

- (BOOL)_inputViewControllerShouldDirectlyInsertPassword
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;

  if (!self->_password)
    return 0;
  -[UIInputViewController textDocumentProxy](self, "textDocumentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentContextAfterInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "documentContextBeforeInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (CGSize)_currentKeyboardSize
{
  int *v3;
  double *v4;
  double v5;
  double v6;
  UIViewController *passwordManagerIntroductionViewController;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  if ((unint64_t)(objc_msgSend((id)*MEMORY[0x1E0DC4730], "interfaceOrientation") - 3) >= 2)
    v3 = &OBJC_IVAR____SFAutomaticPasswordInputViewController__portraitKeyboardSize;
  else
    v3 = &OBJC_IVAR____SFAutomaticPasswordInputViewController__landscapeKeyboardSize;
  v4 = (double *)((char *)self + *v3);
  v6 = *v4;
  v5 = v4[1];
  passwordManagerIntroductionViewController = self->_passwordManagerIntroductionViewController;
  if (passwordManagerIntroductionViewController)
  {
    -[UIViewController view](passwordManagerIntroductionViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdateConstraints");

    -[UIViewController view](self->_passwordManagerIntroductionViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutIfNeeded");

    -[UIViewController view](self->_passwordManagerIntroductionViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1144750080;
    LODWORD(v12) = 1112014848;
    objc_msgSend(v10, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, 1.79769313e308, v11, v12);
    v6 = v13;
    v15 = v14;

    v16 = v5 * 1.5;
    if (v15 <= v5 * 1.5)
      v16 = v15;
    v5 = fmax(v16, v5) + 4.0;
  }
  v17 = v6;
  v18 = v5;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)_updateKeyboardHeight
{
  double v3;

  -[_SFAutomaticPasswordInputViewController _updateKeyboardMetricsAndInterfaceOrientationIfNeeded](self, "_updateKeyboardMetricsAndInterfaceOrientationIfNeeded");
  -[_SFAutomaticPasswordInputViewController _currentKeyboardSize](self, "_currentKeyboardSize");
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v3);
}

- (id)strongPasswordIntroductionViewControllerIfNeeded
{
  UIViewController *passwordManagerIntroductionViewController;
  UIViewController *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  objc_class *v9;
  uint64_t v10;

  if (!objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled"))
  {
    v4 = 0;
    return v4;
  }
  passwordManagerIntroductionViewController = self->_passwordManagerIntroductionViewController;
  if (!passwordManagerIntroductionViewController)
  {
    -[_SFAutomaticPasswordInputViewController _postContextProviderRequiredNotificationIfNeeded](self, "_postContextProviderRequiredNotificationIfNeeded");
    -[_SFAutomaticPasswordInputViewController autoFillContextProvider](self, "autoFillContextProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "autoFillFormType");
    objc_msgSend(v5, "autoFillController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hideInputAccessoryView");

    if (v6 == 3)
    {
      if (objc_msgSend(MEMORY[0x1E0D6C088], "shouldShowLoginIntroduction"))
      {
        v10 = 0;
        v9 = (objc_class *)MEMORY[0x1E0D6C088];
        goto LABEL_14;
      }
    }
    else if (v6 == 4)
    {
      v8 = objc_msgSend(MEMORY[0x1E0D6C088], "shouldShowLoginIntroduction");
      v9 = (objc_class *)MEMORY[0x1E0D6C088];
      if ((v8 & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        if (!objc_msgSend(MEMORY[0x1E0D6C088], "shouldShowStrongPasswordIntroduction"))
        {
          v4 = 0;
          goto LABEL_15;
        }
        v9 = (objc_class *)MEMORY[0x1E0D6C088];
        v10 = 1;
      }
LABEL_14:
      v4 = (UIViewController *)objc_msgSend([v9 alloc], "initWithMode:", v10);
LABEL_15:
      -[UIViewController setDelegate:](v4, "setDelegate:", self);
      goto LABEL_16;
    }
    v4 = 0;
LABEL_16:

    return v4;
  }
  v4 = passwordManagerIntroductionViewController;
  return v4;
}

- (id)_editingStrongPasswordInformationViewControllerIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[_SFAutomaticPasswordInputViewController _postContextProviderRequiredNotificationIfNeeded](self, "_postContextProviderRequiredNotificationIfNeeded");
  -[_SFAutomaticPasswordInputViewController autoFillContextProvider](self, "autoFillContextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D6C080]);
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_highLevelDomainForPasswordManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithWebsiteTitle:url:", v7, v4);

  objc_msgSend(v8, "setDelegate:", self);
  return v8;
}

- (CGSize)intrinsicContentSizeForInputView:(id)a3
{
  double v4;
  double v5;
  CGSize result;

  -[_SFAutomaticPasswordInputViewController _updateKeyboardMetricsAndInterfaceOrientationIfNeeded](self, "_updateKeyboardMetricsAndInterfaceOrientationIfNeeded", a3);
  -[_SFAutomaticPasswordInputViewController _currentKeyboardSize](self, "_currentKeyboardSize");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)inputViewControllerDidSelectUseStrongPassword:(id)a3
{
  -[_SFAutomaticPasswordInputViewController _postButtonPressedNotificationForButton:](self, "_postButtonPressedNotificationForButton:", 0);
  -[_SFAutomaticPasswordInputViewController dismissKeyboardPreservingFirstResponderIfNecessary](self, "dismissKeyboardPreservingFirstResponderIfNecessary");
}

- (void)inputViewControllerDidSelectUseCustomPassword:(id)a3
{
  void *v4;

  -[_SFAutomaticPasswordInputViewController _postButtonPressedNotificationForButton:](self, "_postButtonPressedNotificationForButton:", 1);
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didChooseCustomPassword");

  -[UIInputViewController advanceToNextInputMode](self, "advanceToNextInputMode");
}

- (void)dismissKeyboardPreservingFirstResponderIfNecessary
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "accessoryDone");
  else
    -[UIInputViewController dismissKeyboard](self, "dismissKeyboard");
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled"))
  {
    -[_SFAutomaticPasswordInputViewController autoFillContextProvider](self, "autoFillContextProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "makeStrongPasswordFieldViewableAndEditable:", 0);

  }
}

- (id)inputViewControllerOtherOptionsMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
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
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD v68[5];
  id v69;
  _QWORD v70[3];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[3];

  v73[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.pencil"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke;
  v68[3] = &unk_1E4AC0B80;
  v68[4] = self;
  v9 = v4;
  v69 = v9;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v68);
  v57 = objc_claimAutoreleasedReturnValue();

  if (self->_autoFillContextProtocolObjectUUID)
  {
    -[_SFAutomaticPasswordInputViewController _postContextProviderRequiredNotificationIfNeeded](self, "_postContextProviderRequiredNotificationIfNeeded");
    -[_SFAutomaticPasswordInputViewController autoFillContextProvider](self, "autoFillContextProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentStrongPassword");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultStrongPassword");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("character.cursor.ibeam"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v8;
    v65[1] = 3221225472;
    v65[2] = __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_2;
    v65[3] = &unk_1E4AC0B80;
    v16 = v10;
    v66 = v16;
    v67 = v12;
    v55 = v12;
    objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v14, v15, 0, v65);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "defaultStrongPassword");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    objc_msgSend(v17, "setDiscoverabilityTitle:", v18);

    v20 = v11;
    v53 = v11;
    objc_msgSend(v19, "setState:", objc_msgSend(v11, "isEqual:", v55));
    objc_msgSend(v16, "alphanumericStrongPassword");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v23 = v8;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("textformat.123"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v23;
    v62[1] = 3221225472;
    v62[2] = __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_3;
    v62[3] = &unk_1E4AC0B80;
    v26 = v16;
    v63 = v26;
    v64 = v21;
    v54 = v21;
    objc_msgSend(v22, "actionWithTitle:image:identifier:handler:", v24, v25, 0, v62);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "setDiscoverabilityTitle:", v54);
    objc_msgSend(v52, "setState:", objc_msgSend(v20, "isEqual:", v54));
    v27 = (void *)MEMORY[0x1E0DC39D0];
    v72[0] = v19;
    v72[1] = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 33, v28);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.and.pencil.and.ellipsis"));
    v56 = v9;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_4;
    v60[3] = &unk_1E4ABFA58;
    v33 = v26;
    v61 = v33;
    objc_msgSend(v29, "actionWithTitle:image:identifier:handler:", v30, v31, 0, v60);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v32;
    v58[1] = 3221225472;
    v58[2] = __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_5;
    v58[3] = &unk_1E4ABFA58;
    v59 = v33;
    v38 = v33;
    objc_msgSend(v35, "actionWithTitle:image:identifier:handler:", v36, v37, 0, v58);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)MEMORY[0x1E0DC39D0];
    v71[0] = v34;
    v71[1] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 33, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = (void *)MEMORY[0x1E0DC39D0];
    v70[0] = v51;
    v70[1] = v42;
    v44 = (void *)v57;
    v70[2] = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v43;
    v47 = v53;
    objc_msgSend(v46, "menuWithChildren:", v45);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v56;
  }
  else
  {
    v49 = (void *)MEMORY[0x1E0DC39D0];
    v44 = (void *)v57;
    v73[0] = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "menuWithChildren:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v48;
}

- (void)_postContextProviderRequiredNotificationIfNeeded
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Tried to post autofill context provider notification without valid UUID", v1, 2u);
}

- (void)strongPasswordIntroductionViewController:(id)a3 shouldPerformAction:(unint64_t)a4 willShowAdditionalView:(BOOL)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[_SFAutomaticPasswordInputViewController _postContextProviderRequiredNotificationIfNeeded](self, "_postContextProviderRequiredNotificationIfNeeded", a3);
  -[_SFAutomaticPasswordInputViewController autoFillContextProvider](self, "autoFillContextProvider");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (a4 == 2)
  {
    v9 = (void *)*MEMORY[0x1E0DC4730];
    v10 = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0D8AAA0], "passwordManagerURLWithDictionary:", MEMORY[0x1E0C9AA70]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "openURL:options:completionHandler:", v11, v10, 0);

  }
  else if (!a4)
  {
    objc_msgSend(v12, "autoFillController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDidCloseStrongPasswordIntroductionView:", 1);

LABEL_6:
    -[_SFAutomaticPasswordInputViewController dismissKeyboardPreservingFirstResponderIfNecessary](self, "dismissKeyboardPreservingFirstResponderIfNecessary");
    goto LABEL_7;
  }
  if (!a5)
    goto LABEL_6;
LABEL_7:

}

- (void)imageForStrongPasswordIntroductionViewController:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[_SFAutomaticPasswordInputViewController autoFillContextProvider](self, "autoFillContextProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "autoFillController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchIconForURLWithCompletionHandler:", v5);

}

- (id)placeholderImageForStrongPasswordIntroductionViewController:(id)a3
{
  return 0;
}

- (void)strongPasswordIntroductionViewController:(id)a3 shouldFillPasswordWithFormat:(unint64_t)a4
{
  void *v4;
  id v5;

  -[_SFAutomaticPasswordInputViewController autoFillContextProvider](self, "autoFillContextProvider", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "autoFillController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generateAndFillStrongPassword");

}

- (id)strongPasswordIntroductionViewController:(id)a3 automaticStrongPasswordWithFormat:(unint64_t)a4
{
  void *v4;
  void *v6;
  void *v7;
  uint64_t v8;

  -[_SFAutomaticPasswordInputViewController autoFillContextProvider](self, "autoFillContextProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4 == 1)
  {
    objc_msgSend(v6, "alphanumericStrongPassword");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a4)
  {
    objc_msgSend(v6, "defaultStrongPassword");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = (void *)v8;
  }

  return v4;
}

- (void)strongPasswordIntroductionViewControllerDidFinishIntroduction:(id)a3
{
  void *v3;
  id v4;

  -[_SFAutomaticPasswordInputViewController autoFillContextProvider](self, "autoFillContextProvider", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoFillController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadFirstResponderInputViews");

}

- (void)strongPasswordIntroductionViewControllerShowOtherPasswords:(id)a3
{
  void *v3;
  id v4;

  -[_SFAutomaticPasswordInputViewController autoFillContextProvider](self, "autoFillContextProvider", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoFillController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDidSelectShowMorePasswords");

}

- (void)strongPasswordIntroductionViewControllerShowKeyboard:(id)a3
{
  void *v3;
  id v4;

  -[_SFAutomaticPasswordInputViewController autoFillContextProvider](self, "autoFillContextProvider", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoFillController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDidSelectUseKeyboard");

}

- (_SFAutoFillContextProviding)autoFillContextProvider
{
  return (_SFAutoFillContextProviding *)objc_loadWeakRetained((id *)&self->_autoFillContextProvider);
}

- (void)setAutoFillContextProvider:(id)a3
{
  objc_storeWeak((id *)&self->_autoFillContextProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_autoFillContextProvider);
  objc_storeStrong((id *)&self->_passwordManagerIntroductionViewController, 0);
  objc_storeStrong((id *)&self->_autoFillContextProtocolObjectUUID, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
}

@end
