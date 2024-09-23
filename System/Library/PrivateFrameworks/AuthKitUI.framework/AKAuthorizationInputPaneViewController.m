@implementation AKAuthorizationInputPaneViewController

- (AKAuthorizationInputPaneViewController)init
{
  -[AKAuthorizationInputPaneViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AKAuthorizationInputPaneViewController)initWithPresentationContext:(id)a3 scopeChoices:(id)a4
{
  id v7;
  id v8;
  AKAuthorizationInputPaneViewController *v9;
  AKAuthorizationInputPaneViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationInputPaneViewController;
  v9 = -[AKAuthorizationPaneViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentationContext, a3);
    objc_storeStrong((id *)&v10->_editableScopeChoices, a4);
    -[AKAuthorizationInputPaneViewController _setupAnalyticsReport](v10, "_setupAnalyticsReport");
    -[AKAuthorizationInputPaneViewController _setupValidatedScopes](v10, "_setupValidatedScopes");
    -[AKAuthorizationInputPaneViewController _setupEditableScopeChoices](v10, "_setupEditableScopeChoices");
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[AKCAReporter sendReport](self->_analyticsReport, "sendReport");
  v3.receiver = self;
  v3.super_class = (Class)AKAuthorizationInputPaneViewController;
  -[AKAuthorizationInputPaneViewController dealloc](&v3, sel_dealloc);
}

- (void)_setupEditableScopeChoices
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  AKAuthorizationScopeChoices *editableScopeChoices;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isManagedAppleID");

  -[AKAuthorizationScopeChoices userInformation](self->_editableScopeChoices, "userInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reachableEmails");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[AKAuthorizationScopeChoices userInformation](self->_editableScopeChoices, "userInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previouslySelectedEmail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AKAuthorizationInputPaneViewController _setEditableScopeChoicesForManagedAppleID](self, "_setEditableScopeChoicesForManagedAppleID");
  }
  else if (-[AKAuthorizationInputPaneViewController _isUnderageUser](self, "_isUnderageUser")
         && (objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager"),
             v9 = (void *)objc_claimAutoreleasedReturnValue(),
             v10 = objc_msgSend(v9, "isTiburonU13Enabled"),
             v9,
             v10))
  {
    -[AKAuthorizationInputPaneViewController _setEditableScopeChoicesForUnderageUser](self, "_setEditableScopeChoicesForUnderageUser");
  }
  else
  {
    -[AKAuthorizationScopeChoices setIndexOfChosenEmail:](self->_editableScopeChoices, "setIndexOfChosenEmail:", objc_msgSend(v16, "indexOfObject:", v8));
    editableScopeChoices = self->_editableScopeChoices;
    -[AKAuthorizationScopeChoices userInformation](editableScopeChoices, "userInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "previouslyWantedPrivateEmail");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationScopeChoices setWantsPrivateEmail:](editableScopeChoices, "setWantsPrivateEmail:", objc_msgSend(v13, "BOOLValue"));

  }
  -[AKAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
    -[AKAuthorizationScopeChoices setIndexOfChosenLogin:](self->_editableScopeChoices, "setIndexOfChosenLogin:", 0);

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
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationInputPaneViewController;
  -[AKAuthorizationPaneViewController viewDidLoad](&v12, sel_viewDidLoad);
  +[AKAuthorizationAppearance paneBackgroundColor](AKAuthorizationAppearance, "paneBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[AKAuthorizationInputPaneViewController _setupTableView](self, "_setupTableView");
  -[AKAuthorizationPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _addShimToStackView:](self, "_addShimToStackView:", v5);

  -[AKAuthorizationInputPaneViewController _setupAppIconView](self, "_setupAppIconView");
  -[AKAuthorizationInputPaneViewController _setupInfoLabel](self, "_setupInfoLabel");
  -[AKAuthorizationInputPaneViewController _setupLoginChoiceView](self, "_setupLoginChoiceView");
  -[AKAuthorizationPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _addShimToStackView:](self, "_addShimToStackView:", v6);

  -[AKAuthorizationInputPaneViewController _setupNameAndEmailScopeViews](self, "_setupNameAndEmailScopeViews");
  -[AKAuthorizationInputPaneViewController _setupPrivacyLink](self, "_setupPrivacyLink");
  -[AKAuthorizationPaneViewController paneFooterStackView](self, "paneFooterStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _addShimToStackView:](self, "_addShimToStackView:", v7);

  -[AKAuthorizationPaneViewController footerPaneContext](self, "footerPaneContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _addAuthorizationButtonToPaneContext:](self, "_addAuthorizationButtonToPaneContext:", v8);

  -[AKAuthorizationInputPaneViewController _setupAlternateButton](self, "_setupAlternateButton");
  -[AKAuthorizationPaneViewController paneFooterStackView](self, "paneFooterStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _addShimToStackView:](self, "_addShimToStackView:", v9);

  -[AKAuthorizationInputPaneViewController _updatePaneTitleForEditing:](self, "_updatePaneTitleForEditing:", 0);
  -[AKAuthorizationInputPaneViewController _setupEscapeKeyListener](self, "_setupEscapeKeyListener");
  v10 = (void *)MEMORY[0x1E0CB3718];
  -[AKAuthorizationPaneViewController mutableConstraints](self, "mutableConstraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationInputPaneViewController;
  -[AKAuthorizationPaneViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (-[AKAuthorizationInputPaneViewController editableScopeChoicesChanged](self, "editableScopeChoicesChanged"))
  {
    -[AKAuthorizationInputPaneViewController setEditableScopeChoicesChanged:](self, "setEditableScopeChoicesChanged:", 0);
    -[AKAuthorizationPaneViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
  -[AKAuthorizationInputPaneViewController _enableOrDisableConfirmButton](self, "_enableOrDisableConfirmButton");
  if (-[AKAuthorizationInputPaneViewController isViewLoaded](self, "isViewLoaded"))
  {
    if ((-[AKAuthorizationInputPaneViewController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
    {
      -[AKAuthorizationInputPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      -[AKAuthorizationPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationInputPaneViewController;
  -[AKAuthorizationPaneViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (-[AKAuthorizationInputPaneViewController isEditingName](self, "isEditingName"))
    -[AKAuthorizationInputPaneViewController _beginEditing](self, "_beginEditing");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationInputPaneViewController;
  -[AKAuthorizationInputPaneViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[AKAuthorizationInputPaneViewController _updateDataSourceWithValidEditingName](self, "_updateDataSourceWithValidEditingName");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationInputPaneViewController;
  -[AKAuthorizationInputPaneViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFaceIDCapable");

  if (v5)
  {
    -[AKAuthorizationInputPaneViewController confirmButton](self, "confirmButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enableAuthorizationCapability:", 0);

  }
}

- (void)_setupAnalyticsReport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  AKCATiburonInputUIReporter *v7;
  AKCATiburonInputUIReporter *analyticsReport;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credentialRequestContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AKCATiburonInputUIReporter initWithRequestID:]([AKCATiburonInputUIReporter alloc], "initWithRequestID:", v6);
  analyticsReport = self->_analyticsReport;
  self->_analyticsReport = v7;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loginChoices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__AKAuthorizationInputPaneViewController__setupAnalyticsReport__block_invoke;
  v11[3] = &unk_1E76791F0;
  v11[4] = &v16;
  v11[5] = &v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

  -[AKCATiburonInputUIReporter didShowAppleID:](self->_analyticsReport, "didShowAppleID:", *((unsigned __int8 *)v17 + 24));
  -[AKCATiburonInputUIReporter setPasswordCredentialCount:](self->_analyticsReport, "setPasswordCredentialCount:", v13[3]);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

}

uint64_t __63__AKAuthorizationInputPaneViewController__setupAnalyticsReport__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isAppleIDAuthorization");
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  else
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)_setupValidatedScopes
{
  NSArray *v3;
  NSArray *validatedScopes;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[AKAuthorizationInputPaneViewController _hasNameScope](self, "_hasNameScope"))
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0CFFFD8]);
  if (-[AKAuthorizationInputPaneViewController _hasEmailScope](self, "_hasEmailScope"))
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0CFFFD0]);
  v3 = (NSArray *)objc_msgSend(v5, "copy");
  validatedScopes = self->_validatedScopes;
  self->_validatedScopes = v3;

}

- (void)_setupTableView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKAuthorizationScopeDetailTableViewCell-Name"));

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKAuthorizationScopeEditTableViewCell-Name"));

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKAuthorizationScopeDetailTableViewCell-Email-Summary"));

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKAuthorizationScopeDetailTableViewCell-Email-Single"));

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "isSiwaCredentialSharingEnabled");

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKAuthorizationLoginChoiceCell"));

  -[AKAuthorizationInputPaneViewController authorizationViewController](self, "authorizationViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_isManagedAppleID");

  if ((v10 & 1) != 0)
  {
    v11 = 0;
  }
  else if (-[AKAuthorizationInputPaneViewController _isUnderageUser](self, "_isUnderageUser"))
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "isTiburonU13Enabled") ^ 1;

  }
  else
  {
    v11 = 1;
  }
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsSelection:", v11);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDataSource:", self);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

}

- (void)_setupAppIconView
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKIcon iconWithPresentationContext:](AKIcon, "iconWithPresentationContext:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "iconType") == 1)
  {
    +[AKAuthorizationPaneMetrics iconSize](AKAuthorizationPaneMetrics, "iconSize");
    +[AKIcon iconWithName:size:](AKIcon, "iconWithName:size:", CFSTR("AppleLogo"));
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v4;
  }
  else
  {
    v5 = v6;
  }
  v7 = v5;
  -[AKAuthorizationInputPaneViewController _createAppIconViewWithIcon:](self, "_createAppIconViewWithIcon:", v5);
  -[AKAuthorizationInputPaneViewController _loadAppIconViewImage](self, "_loadAppIconViewImage");

}

- (void)_setupInfoLabel
{
  AKAuthorizationSubPaneInfoLabel *v3;
  void *v4;
  AKAuthorizationSubPaneInfoLabel *v5;
  AKAuthorizationSubPaneInfoLabel *infoLabel;
  AKAuthorizationSubPaneInfoLabel *v7;
  id v8;

  v3 = [AKAuthorizationSubPaneInfoLabel alloc];
  -[AKAuthorizationInputPaneViewController _localizedInfoString](self, "_localizedInfoString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AKAuthorizationSubPaneInfoLabel initWithString:](v3, "initWithString:", v4);
  infoLabel = self->_infoLabel;
  self->_infoLabel = v5;

  v7 = self->_infoLabel;
  +[AKAuthorizationPaneMetrics infoLabelBottomSpacing](AKAuthorizationPaneMetrics, "infoLabelBottomSpacing");
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v7, "setCustomSpacingAfter:");
  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubPane:", self->_infoLabel);

}

- (void)_setupLoginChoiceView
{
  if (-[AKAuthorizationInputPaneViewController _shouldPresentUpgradeFlow](self, "_shouldPresentUpgradeFlow"))
    -[AKAuthorizationInputPaneViewController _setupUpgradeFromPasswordBulletPointViews](self, "_setupUpgradeFromPasswordBulletPointViews");
}

- (void)_setupUpgradeFromPasswordBulletPointViews
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  __CFString *v11;
  char v12;
  int v13;
  void *v14;
  AKAuthorizationBulletPointSubPane *v15;
  void *v16;
  void *v17;
  void *v18;
  AKAuthorizationBulletPointSubPane *v19;
  AKAuthorizationBulletPointSubPane *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  AKAuthorizationBulletPointSubPane *v26;
  void *v27;
  void *v28;
  id v29;

  v3 = (void *)0x1E0D00000;
  objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBiometricAuthCapable");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isFaceIDCapable");

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      v10 = CFSTR("AUTHORIZE_UPGRADE_MESSAGE_1_FACEID");
    else
      v10 = CFSTR("AUTHORIZE_UPGRADE_MESSAGE_1_TOUCHID");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E7679C68, CFSTR("Localizable"));
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("AUTHORIZE_UPGRADE_MESSAGE_1_NOBIO");
    v12 = objc_msgSend(CFSTR("AUTHORIZE_UPGRADE_MESSAGE_1_NOBIO"), "containsString:", CFSTR("REBRAND"));
    if ((v12 & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "isAABrandingEnabled"))
      {
        objc_msgSend(CFSTR("AUTHORIZE_UPGRADE_MESSAGE_1_NOBIO"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v13 = 1;
      }
      else
      {
        v13 = 0;
      }
    }
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E7679C68, CFSTR("Localizable"));
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)

    if ((v12 & 1) == 0)
  }

  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics upgradeAccountTopSpacing](AKAuthorizationPaneMetrics, "upgradeAccountTopSpacing");
  objc_msgSend(v14, "addEmptyViewWithSpacing:");

  v15 = [AKAuthorizationBulletPointSubPane alloc];
  +[AKAuthorizationBiometricImage biometricImage](AKAuthorizationBiometricImage, "biometricImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_UPGRADE_TITLE_1"), &stru_1E7679C68, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[AKAuthorizationBulletPointSubPane initWithImage:title:message:](v15, "initWithImage:title:message:", v16, v18, v29);

  v20 = [AKAuthorizationBulletPointSubPane alloc];
  objc_msgSend(MEMORY[0x1E0CEA638], "ak_imageNamed:", CFSTR("lock.fill"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_UPGRADE_TITLE_2"), &stru_1E7679C68, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_UPGRADE_MESSAGE_2"), &stru_1E7679C68, CFSTR("Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[AKAuthorizationBulletPointSubPane initWithImage:title:message:](v20, "initWithImage:title:message:", v21, v23, v25);

  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubPane:", v19);

  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubPane:", v26);

  +[AKAuthorizationPaneMetrics upgradeAccountInterItemSpacing](AKAuthorizationPaneMetrics, "upgradeAccountInterItemSpacing");
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v19, "setCustomSpacingAfter:");

}

- (void)_setupAlternateButton
{
  id v3;

  -[AKAuthorizationPaneViewController footerPaneContext](self, "footerPaneContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _addUseOtherIDButtonToContext:](self, "_addUseOtherIDButtonToContext:", v3);

}

- (void)_createAppIconViewWithIcon:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  AKAuthorizationSubPaneImage *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  AKAuthorizationSubPaneImage *imageSubPane;
  void *v33;
  void *v34;
  AKAuthorizationInputPaneViewController *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CEABB0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addArrangedSubview:", v6);

  v35 = self;
  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics iconTopSpacing](AKAuthorizationPaneMetrics, "iconTopSpacing");
  v34 = v6;
  objc_msgSend(v10, "setCustomSpacing:afterView:", v6);

  objc_msgSend(v5, "automaskedImage");
  v11 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v11;
  v12 = -[AKAuthorizationSubPaneImage initWithImage:]([AKAuthorizationSubPaneImage alloc], "initWithImage:", v11);
  -[AKAuthorizationSubPaneImage image](v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  if (v14 == 0.0)
  {
    v20 = 1.0;
  }
  else
  {
    -[AKAuthorizationSubPaneImage image](v12, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v16;
    -[AKAuthorizationSubPaneImage image](v12, "image");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "size");
    v20 = v17 / v19;

  }
  -[AKAuthorizationSubPaneImage imageView](v12, "imageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics iconSize](AKAuthorizationPaneMetrics, "iconSize");
  objc_msgSend(v22, "constraintEqualToConstant:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v24;
  -[AKAuthorizationSubPaneImage imageView](v12, "imageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPaneImage imageView](v12, "imageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:multiplier:", v28, v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPaneImage setImageViewConstraints:](v12, "setImageViewConstraints:", v30);

  -[AKAuthorizationPaneViewController headerPaneContext](v35, "headerPaneContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubPane:", v12);

  +[AKAuthorizationPaneMetrics iconBottomSpacing](AKAuthorizationPaneMetrics, "iconBottomSpacing");
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v12, "setCustomSpacingAfter:");
  imageSubPane = v35->_imageSubPane;
  v35->_imageSubPane = v12;

}

- (void)_loadAppIconViewImage
{
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke;
  v7[3] = &unk_1E7679240;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3B760D8](v7);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke_3;
  v5[3] = &unk_1E7679290;
  objc_copyWeak(&v6, &location);
  ((void (**)(_QWORD, _QWORD *))v4)[2](v4, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke_2;
  v19[3] = &unk_1E7679218;
  v5 = v3;
  v20 = v5;
  v6 = (void *)MEMORY[0x1C3B760D8](v19);
  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKIcon iconWithPresentationContext:](AKIcon, "iconWithPresentationContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "presentationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "credentialRequestContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_isSubscriptionLogin");

  if (v11)
  {
    objc_msgSend(v8, "automaskedImageData");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = objc_msgSend(v8, "iconType");

      if (v14 == 2)
      {
LABEL_9:
        objc_msgSend(v8, "automaskedImage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD, _QWORD))v5 + 2))(v5, v18, 0, 0);
        goto LABEL_10;
      }
    }
  }
  else
  {
    if (objc_msgSend(v8, "iconType") == 2)
      goto LABEL_9;
    objc_msgSend(*(id *)(a1 + 32), "presentationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "credentialRequestContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "_isWebLogin");

    if ((v17 & 1) == 0)
      goto LABEL_9;
    if (!WeakRetained)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);
      goto LABEL_11;
    }
  }
  objc_msgSend(WeakRetained, "paneDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "authorizationPaneViewController:didRequestIconWithCompletion:", WeakRetained, v6);
LABEL_10:

LABEL_11:
}

void __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11)
  {
    +[AKIcon iconWithIconContext:](AKIcon, "iconWithIconContext:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v6, "iconType");
  v8 = *(_QWORD *)(a1 + 32);
  if (v7 == 2)
  {
    objc_msgSend(v6, "automaskedImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v8 + 16))(v8, v9, v10, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v8 + 16))(v8, 0, 0, v5);
  }

}

void __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke_4;
  block[3] = &unk_1E7679268;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "imageSubPane");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:animated:", *(_QWORD *)(a1 + 32), 1);

    WeakRetained = v4;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v4, "_updateInfoLabelStringWithAppName:");
    WeakRetained = v4;
  }

}

- (void)_updateInfoLabelStringWithAppName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  AKAuthorizationSubPaneInfoLabel *infoLabel;
  void *v8;
  id v9;

  v9 = a3;
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedAppName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocalizedAppName:", v9);

    infoLabel = self->_infoLabel;
    -[AKAuthorizationInputPaneViewController _localizedInfoString](self, "_localizedInfoString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationSubPaneInfoLabel setString:animated:](infoLabel, "setString:animated:", v8, 1);

  }
}

- (void)_setupPrivacyLink
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  AKAuthorizationSubPaneInfoLabel *v10;
  AKAuthorizationSubPanePrivacyLink *v11;
  id v12;

  -[AKAuthorizationInputPaneViewController authorizationViewController](self, "authorizationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isManagedAppleID");

  if (v4)
  {
    -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "credentialRequestContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authorizationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "existingStatus");

    if (v8 == 2)
    {
      -[AKAuthorizationPaneViewController footerPaneContext](self, "footerPaneContext");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      +[AKAuthorizationPaneMetrics privacyInfoTopSpacing](AKAuthorizationPaneMetrics, "privacyInfoTopSpacing");
      objc_msgSend(v12, "addEmptyViewWithSpacing:");
      -[AKAuthorizationInputPaneViewController _localizedPrivacyMessageStringForManagedAppleID](self, "_localizedPrivacyMessageStringForManagedAppleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[AKAuthorizationSubPaneInfoLabel initWithString:]([AKAuthorizationSubPaneInfoLabel alloc], "initWithString:", v9);
      -[AKAuthorizationSubPaneInfoLabel setInfoLabelType:](v10, "setInfoLabelType:", 4);
      +[AKAuthorizationPaneMetrics privacyInfoToLinkBottomSpacing](AKAuthorizationPaneMetrics, "privacyInfoToLinkBottomSpacing");
      -[AKAuthorizationSubPane setCustomSpacingAfter:](v10, "setCustomSpacingAfter:");
      objc_msgSend(v12, "addSubPane:", v10);

      v11 = -[AKAuthorizationSubPanePrivacyLink initWithPrivacyLinkType:]([AKAuthorizationSubPanePrivacyLink alloc], "initWithPrivacyLinkType:", 1);
      objc_msgSend(v12, "addSubPane:", v11);
      +[AKAuthorizationPaneMetrics privacyLinkBottomSpacing](AKAuthorizationPaneMetrics, "privacyLinkBottomSpacing");
      objc_msgSend(v12, "addEmptyViewWithSpacing:");

    }
  }
}

- (void)_useOtherIDButtonSelected:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7038);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:](self, "_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:", 0, v4);

}

- (void)_addAuthorizationButtonToPaneContext:(id)a3
{
  id v4;
  AKAuthorizationSubPaneConfirmButton *v5;
  void *v6;
  void *v7;
  void *v8;
  AKAuthorizationSubPaneConfirmButton *v9;

  v4 = a3;
  v5 = [AKAuthorizationSubPaneConfirmButton alloc];
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AKAuthorizationSubPaneConfirmButton initWithPresentationContext:](v5, "initWithPresentationContext:", v6);

  objc_msgSend(v4, "addSubPane:", v9);
  -[AKAuthorizationSubPaneConfirmButton setDelegate:](v9, "setDelegate:", self);
  -[AKAuthorizationSubPaneConfirmButton setUpButtonToPaneContext:](v9, "setUpButtonToPaneContext:", v4);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("BIO_BUTTON_SELECT_EMAIL"), &stru_1E7679C68, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPaneConfirmButton setBioTextForInactiveState:](v9, "setBioTextForInactiveState:", v8);

  -[AKAuthorizationInputPaneViewController setConfirmButton:](self, "setConfirmButton:", v9);
  -[AKAuthorizationInputPaneViewController _enableOrDisableConfirmButton](self, "_enableOrDisableConfirmButton");

}

- (void)_addUseOtherIDButtonToContext:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "credentialRequestContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isWebLogin");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(CFSTR("USE_DIFFERENT_APPLE_ID"), "containsString:", CFSTR("REBRAND")))
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("USE_DIFFERENT_APPLE_ID"), &stru_1E7679C68, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isAABrandingEnabled"))
      {
        objc_msgSend(CFSTR("USE_DIFFERENT_APPLE_ID"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", v10, &stru_1E7679C68, CFSTR("Localizable"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("USE_DIFFERENT_APPLE_ID"), &stru_1E7679C68, CFSTR("Localizable"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    +[AKTextualLinkButton buttonWithText:fontSize:target:action:](AKTextualLinkButton, "buttonWithText:fontSize:target:action:", v8, self, sel__useOtherIDButtonSelected_, 13.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addArrangedSubview:", v11);

    objc_msgSend(v20, "stackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKAuthorizationPaneMetrics useOtherAppleIDTopSpacing](AKAuthorizationPaneMetrics, "useOtherAppleIDTopSpacing");
    v15 = v14;
    objc_msgSend(v20, "stackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrangedSubviews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCustomSpacing:afterView:", v18, v15);

    objc_msgSend(v20, "stackView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKAuthorizationPaneMetrics useOtherAppleIDBottomSpacing](AKAuthorizationPaneMetrics, "useOtherAppleIDBottomSpacing");
    objc_msgSend(v19, "setCustomSpacing:afterView:", v11);

  }
}

- (void)_addShimToStackView:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CEABB0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "addArrangedSubview:", v5);

}

- (void)_setupEscapeKeyListener
{
  void *v3;
  uint64_t v4;
  id v5;

  -[AKAuthorizationInputPaneViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB740], 0, sel__escapeKeyPressed);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationInputPaneViewController addKeyCommand:](self, "addKeyCommand:", v5);

  }
}

- (void)_escapeKeyPressed
{
  NSObject *v3;
  uint8_t v4[16];

  _AKLogSiwa();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Escape key pressed", v4, 2u);
  }

  -[AKAuthorizationInputPaneViewController _userCanceledPanel](self, "_userCanceledPanel");
}

- (void)_userCanceledPanel
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  -[AKCATiburonInputUIReporter didComplete:](self->_analyticsReport, "didComplete:", 0);
  -[AKCAReporter sendReport](self->_analyticsReport, "sendReport");
  _AKLogSiwa();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling the panel", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:](self, "_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:", 0, v4);

}

- (void)_setEditableScopeChoicesForManagedAppleID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedEmailForManagedAppleID");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInformation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reachableEmails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", v9);

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[AKAuthorizationScopeChoices setIndexOfChosenEmail:](self->_editableScopeChoices, "setIndexOfChosenEmail:", v8);
  -[AKAuthorizationScopeChoices setWantsPrivateEmail:](self->_editableScopeChoices, "setWantsPrivateEmail:", 0);

}

- (void)_setEditableScopeChoicesForUnderageUser
{
  -[AKAuthorizationScopeChoices setWantsPrivateEmail:](self->_editableScopeChoices, "setWantsPrivateEmail:", 1);
}

- (id)_localizedPrivacyMessageStringForManagedAppleID
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedAppName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "length");
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_MANAGED_ACCOUNT_PRIVACY_MESSAGE_APPNAME_FORMAT"), &stru_1E7679C68, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v8, v3, v3);
  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_MANAGED_ACCOUNT_PRIVACY_MESSAGE"), &stru_1E7679C68, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v8, v11, v12);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_nameCellDetailLabelTextForManagedAppleID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedEmailForManagedAppleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInformation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedOrganizationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)_hasSharedAccountLoginChoices
{
  void *v2;
  char v3;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSharedAccountLoginChoices");

  return v3;
}

- (BOOL)_shouldPresentCreateFlow
{
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSiwaCredentialSharingEnabled"))
  {
    v4 = -[AKAuthorizationInputPaneViewController _shouldPresentUpgradeFlow](self, "_shouldPresentUpgradeFlow");

    if (!v4
      && -[AKAuthorizationInputPaneViewController _hasSharedAccountLoginChoices](self, "_hasSharedAccountLoginChoices"))
    {
      return 0;
    }
  }
  else
  {

  }
  -[AKAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "credentialRequestContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "passwordRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10 == 0;

    return v7;
  }
  return 0;
}

- (BOOL)_shouldPresentUpgradeFlow
{
  void *v2;
  void *v3;
  char v4;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialRequestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isEligibleForUpgradeFromPassword");

  return v4;
}

- (BOOL)_hasOneLoginChoice
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[AKAuthorizationInputPaneViewController authorizationViewController](self, "authorizationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isManagedAppleID");

  if (v4)
  {
    -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInformation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharedEmailForManagedAppleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length") != 0;

  }
  else
  {
    -[AKAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "count") == 1;
  }

  return v8;
}

- (id)_firstLoginChoice
{
  void *v2;
  void *v3;
  void *v4;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loginChoices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_hasNameScope
{
  void *v2;
  void *v3;
  char v4;

  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scopes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CFFFD8]);

  return v4;
}

- (BOOL)_hasEmailScope
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0CFFFD0]))
  {
    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInformation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reachableEmails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_nameScopeAllowsAuthorization
{
  return !-[AKAuthorizationInputPaneViewController _hasNameScope](self, "_hasNameScope")
      || !-[AKAuthorizationInputPaneViewController isEditingName](self, "isEditingName")
      || -[AKAuthorizationInputPaneViewController _isValidEditingName](self, "_isValidEditingName");
}

- (BOOL)_emailScopeAllowsAuthorization
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  _BOOL4 v9;
  BOOL v10;

  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsPrivateEmail");

  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfChosenEmail");

  -[AKAuthorizationInputPaneViewController authorizationViewController](self, "authorizationViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isManagedAppleID");

  v9 = -[AKAuthorizationInputPaneViewController _hasEmailScope](self, "_hasEmailScope");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = v8;
  else
    v10 = 1;
  if ((v4 & 1) != 0)
    v10 = 1;
  return !v9 || v10;
}

- (BOOL)_shouldAllowAuthorization
{
  BOOL v3;
  void *v4;
  int v5;
  void *v7;

  if (!-[AKAuthorizationInputPaneViewController _shouldPresentCreateFlow](self, "_shouldPresentCreateFlow"))
  {
    if (-[AKAuthorizationInputPaneViewController _hasOneLoginChoice](self, "_hasOneLoginChoice"))
      return 1;
    -[AKAuthorizationInputPaneViewController authorizationViewController](self, "authorizationViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_isManagedAppleID");

    if (!v5)
    {
      -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "indexOfChosenLogin") != 0x7FFFFFFFFFFFFFFFLL;

      return v3;
    }
    return -[AKAuthorizationInputPaneViewController _emailScopeAllowsAuthorization](self, "_emailScopeAllowsAuthorization");
  }
  if (-[AKAuthorizationInputPaneViewController _nameScopeAllowsAuthorization](self, "_nameScopeAllowsAuthorization"))
    return -[AKAuthorizationInputPaneViewController _emailScopeAllowsAuthorization](self, "_emailScopeAllowsAuthorization");
  return 0;
}

- (BOOL)_isValidEditingName
{
  return -[AKAuthorizationInputPaneViewController _getValidEditingGivenName:familyName:](self, "_getValidEditingGivenName:familyName:", 0, 0);
}

- (BOOL)_isUnderageUser
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isUnderage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)_paneTitleString
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialRequestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isFirstPartyLogin");

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6 = CFSTR("AUTHORIZATION_VIEWCONTROLLER_TITLE_MODERN");
    goto LABEL_5;
  }
  if (objc_msgSend(CFSTR("AUTHORIZATION_VIEWCONTROLLER_TITLE"), "containsString:", CFSTR("REBRAND")))
  {
    v6 = CFSTR("AUTHORIZATION_VIEWCONTROLLER_TITLE");
LABEL_5:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1E7679C68, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isAABrandingEnabled"))
  {
    objc_msgSend(CFSTR("AUTHORIZATION_VIEWCONTROLLER_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v9, &stru_1E7679C68, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_VIEWCONTROLLER_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v7;
}

- (id)_localizedInfoString
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  if (-[AKAuthorizationInputPaneViewController _shouldPresentUpgradeFlow](self, "_shouldPresentUpgradeFlow"))
  {
    -[AKAuthorizationInputPaneViewController _localizedUpgradeString](self, "_localizedUpgradeString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "credentialRequestContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isSubscriptionLogin");

    if (v6)
    {
      -[AKAuthorizationInputPaneViewController _localizedSubscriptionString](self, "_localizedSubscriptionString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (-[AKAuthorizationInputPaneViewController _shouldPresentCreateFlow](self, "_shouldPresentCreateFlow"))
    {
      -[AKAuthorizationInputPaneViewController _localizedAuthorizationString](self, "_localizedAuthorizationString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[AKAuthorizationInputPaneViewController _hasSharedAccountLoginChoices](self, "_hasSharedAccountLoginChoices"))
      {
        -[AKAuthorizationInputPaneViewController _localizedSharedAccountsChoiceString](self, "_localizedSharedAccountsChoiceString");
      }
      else
      {
        -[AKAuthorizationInputPaneViewController _localizedChoiceString](self, "_localizedChoiceString");
      }
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)_localizedAuthorizationString
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  char v38;
  char v39;
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
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  void *v66;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedAppName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "credentialRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_proxiedDeviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "credentialRequestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_proxiedDeviceClass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v5, "length");
  v15 = objc_msgSend(v7, "length");
  v66 = v10;
  v65 = v5;
  v16 = v13;
  if (objc_msgSend(v10, "length"))
    v17 = objc_msgSend(v13, "length") == 0;
  else
    v17 = 1;
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "userInformation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isManagedAppleID");

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "credentialRequestContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "_isFirstPartyLogin");

  if (!v23 || !v15 || !v14)
  {
    -[AKAuthorizationInputPaneViewController _localizedAuthorizationPrefix:](self, "_localizedAuthorizationPrefix:", v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v20)
    {
      -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "userInformation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "managedOrganizationName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = objc_msgSend(v30, "length");
      if (v15)
        v32 = v17;
      else
        v32 = 1;
      if ((v32 & 1) == 0 && v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_PROXIED_FORMAT"), v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedStringForKey:value:table:", v33, &stru_1E7679C68, CFSTR("Localizable"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v66;
        objc_msgSend(v34, "stringWithFormat:", v36, v7, v16, v66, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
        v24 = v65;

        goto LABEL_41;
      }
      if (v15 && v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_APPNAME_ORGNAME_FORMAT"), v27);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringForKey:value:table:", v45, &stru_1E7679C68, CFSTR("Localizable"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", v48, v7, v30);
      }
      else
      {
        if (!v15)
        {
          _AKLogSiwa();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            -[AKAuthorizationInputPaneViewController _localizedAuthorizationString].cold.1();

          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "localizedStringForKey:value:table:", v27, &stru_1E7679C68, CFSTR("Localizable"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_39;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_APPNAME_FORMAT"), v27);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringForKey:value:table:", v45, &stru_1E7679C68, CFSTR("Localizable"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "stringWithFormat:", v48, v7, v64);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_39:
      v26 = v66;
      goto LABEL_40;
    }
    if (v14)
      v37 = v15 == 0;
    else
      v37 = 1;
    v38 = v37;
    v39 = v37 || v17;
    if ((v39 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_PROXIED_FORMAT"), v27);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "localizedStringForKey:value:table:", v49, &stru_1E7679C68, CFSTR("Localizable"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v66;
      objc_msgSend(v50, "stringWithFormat:", v52, v7, v16, v66, v65);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v65;
LABEL_41:

      goto LABEL_42;
    }
    if ((v38 & 1) != 0)
    {
      if (!v15)
      {
        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_APPLEID_FORMAT"), v27);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "localizedStringForKey:value:table:", v40, &stru_1E7679C68, CFSTR("Localizable"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v65;
          objc_msgSend(v41, "stringWithFormat:", v43, v65, v64);
LABEL_44:
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v44;
          v26 = v66;
          goto LABEL_41;
        }
        _AKLogSiwa();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          -[AKAuthorizationInputPaneViewController _localizedAuthorizationString].cold.1();

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedStringForKey:value:table:", v27, &stru_1E7679C68, CFSTR("Localizable"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "isAABrandingEnabled");

      if ((v54 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_FORMAT"), v27);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "localizedStringForKey:value:table:", v40, &stru_1E7679C68, CFSTR("Localizable"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v65;
        objc_msgSend(v61, "stringWithFormat:", v43, v7, v65);
        goto LABEL_44;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_APPNAME_FORMAT"), v27);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "localizedStringForKey:value:table:", v55, &stru_1E7679C68, CFSTR("Localizable"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "stringWithFormat:", v58, v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_35:
    v24 = v65;
    v26 = v66;
    goto LABEL_41;
  }
  v24 = v65;
  -[AKAuthorizationInputPaneViewController _localizedFirstPartyAuthorizationStringWithAppName:accountName:](self, "_localizedFirstPartyAuthorizationStringWithAppName:accountName:", v7, v65);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v66;
LABEL_42:

  return v25;
}

- (id)_localizedFirstPartyAuthorizationStringWithAppName:(id)a3 accountName:(id)a4
{
  void *v4;
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __CFString *v14;
  char v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a4;
  v8 = a3;
  v9 = CFSTR("AUTHORIZE_APPLE_ID_1ST_PARTY_LOGIN");
  if ((objc_msgSend(CFSTR("AUTHORIZE_APPLE_ID_1ST_PARTY_LOGIN"), "containsString:", CFSTR("REBRAND")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("AUTHORIZE_APPLE_ID_1ST_PARTY_LOGIN"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "signInAllowsPCSKeyAccess");

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0D001D8];
    v14 = CFSTR("AUTHORIZE_APPLE_ID_1ST_PARTY_LOGIN_KEY_ACCESS");
    v15 = objc_msgSend(CFSTR("AUTHORIZE_APPLE_ID_1ST_PARTY_LOGIN_KEY_ACCESS"), "containsString:", CFSTR("REBRAND"));
    if ((v15 & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isAABrandingEnabled"))
      {
        objc_msgSend(CFSTR("AUTHORIZE_APPLE_ID_1ST_PARTY_LOGIN_KEY_ACCESS"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v16 = 1;
      }
      else
      {
        v16 = 0;
      }
    }
    objc_msgSend(v13, "deviceSpecificLocalizedStringWithKey:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    if ((v15 & 1) == 0)

  }
  else
  {
    v17 = v9;
  }
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", v17, &stru_1E7679C68, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", v20, v8, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_localizedAuthorizationPrefix:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  v3 = a3;
  v4 = -[AKAuthorizationInputPaneViewController _shouldPresentCreateFlow](self, "_shouldPresentCreateFlow");
  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAABrandingEnabled");

  v7 = CFSTR("AUTHORIZE_APPLE_ID_WELCOME");
  if (v6)
    v7 = CFSTR("AUTHORIZE_APPLE_ACCOUNT_WELCOME_BACK");
  v8 = CFSTR("AUTHORIZE_MANAGED_APPLEID_WELCOME");
  if (v6)
    v8 = CFSTR("AUTHORIZE_MANAGED_APPLE_ACCOUNT_WELCOME_BACK");
  if (v3)
    v7 = v8;
  v9 = CFSTR("AUTHORIZE_APPLEID_CREATE");
  if (v6)
    v9 = CFSTR("AUTHORIZE_APPLE_ACCOUNT_CREATE");
  v10 = CFSTR("AUTHORIZE_MANAGED_APPLEID_CREATE");
  if (v6)
    v10 = CFSTR("AUTHORIZE_MANAGED_APPLE_ACCOUNT_CREATE");
  if (v3)
    v9 = v10;
  if (v4)
    return (id)v9;
  else
    return (id)v7;
}

- (id)_localizedUpgradeString
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAABrandingEnabled");

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    v8 = CFSTR("AUTHORIZE_APPLE_ACCOUNT_UPGRADE_LOGIN");
  else
    v8 = CFSTR("AUTHORIZE_APPLE_ID_UPGRADE_LOGIN");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E7679C68, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedAppName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_localizedSubscriptionString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credentialRequestContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authorizationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "existingStatus");

  if (v6 == 1)
    v7 = CFSTR("AUTHORIZE_APPLE_ID_WELCOME_SUBSCRIPTION");
  else
    v7 = CFSTR("AUTHORIZE_APPLEID_CREATE_SUBSCRIPTION");
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedAppName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_APPNAME_FORMAT"), v7);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v7, &stru_1E7679C68, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v7, &stru_1E7679C68, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_localizedSharedAccountsChoiceString
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedAppName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCreateAccountLoginChoice");

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    v10 = CFSTR("AUTHORIZE_CREATE_ACCOUNT_OR_SHARED_ACCOUNT_MESSAGE");
  else
    v10 = CFSTR("AUTHORIZE_EXISTING_ACCOUNT_OR_SHARED_ACCOUNT_MESSAGE");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E7679C68, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_localizedChoiceString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_APPLE_ACCOUNT_WELCOME_BACK_APPNAME_FORMAT"), &stru_1E7679C68, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedAppName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_localizedNameKey
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_FULL_NAME"), &stru_1E7679C68, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_localizedEmailKey
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_EMAIL_CONTACT"), &stru_1E7679C68, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_defaultSharedEmail
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[AKAuthorizationInputPaneViewController authorizationViewController](self, "authorizationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isManagedAppleID");

  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4
    || (v7 = objc_msgSend(v5, "indexOfChosenEmail"),
        v6,
        -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = v8,
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v6, "chosenEmail");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "emailAtIndex:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)_selectedLoginChoice
{
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[AKAuthorizationInputPaneViewController _shouldPresentCreateFlow](self, "_shouldPresentCreateFlow"))
    return 0;
  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfChosenLogin");

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loginChoices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v8, "indexOfChosenLogin"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;

  if (-[AKAuthorizationInputPaneViewController isEditingName](self, "isEditingName", a3))
    return 1;
  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSiwaCredentialSharingEnabled");

  if (v6)
  {
    if (!-[AKAuthorizationInputPaneViewController _shouldPresentUpgradeFlow](self, "_shouldPresentUpgradeFlow"))
    {
      -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loginChoices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
        return 1;
      return -[NSArray count](self->_validatedScopes, "count");
    }
    return 0;
  }
  if (-[AKAuthorizationInputPaneViewController _hasOneLoginChoice](self, "_hasOneLoginChoice"))
  {
    -[AKAuthorizationInputPaneViewController _firstLoginChoice](self, "_firstLoginChoice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAppleIDAuthorization");

    if ((v11 & 1) != 0)
      return 0;
  }
  return -[NSArray count](self->_validatedScopes, "count");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  int64_t v8;
  void *v10;
  int64_t v11;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loginChoices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (-[AKAuthorizationInputPaneViewController isEditingName](self, "isEditingName"))
    return 2;
  if (-[AKAuthorizationInputPaneViewController _shouldPresentCreateFlow](self, "_shouldPresentCreateFlow"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_validatedScopes, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AKAuthorizationInputPaneViewController _numberOfRowsInScope:](self, "_numberOfRowsInScope:", v10);

    return v11;
  }
  else if (v8 <= 1)
  {
    return 1;
  }
  else
  {
    return v8;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  v7 = objc_msgSend(v5, "row");
  if (-[AKAuthorizationInputPaneViewController isEditingName](self, "isEditingName"))
  {
    -[AKAuthorizationInputPaneViewController _editingNameCellForRow:](self, "_editingNameCellForRow:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v10 = (void *)v8;
    goto LABEL_11;
  }
  if (!-[AKAuthorizationInputPaneViewController _shouldPresentCreateFlow](self, "_shouldPresentCreateFlow"))
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isSiwaCredentialSharingEnabled"))
    {
      v12 = -[AKAuthorizationInputPaneViewController _shouldPresentUpgradeFlow](self, "_shouldPresentUpgradeFlow");

      if (!v12)
      {
        -[AKAuthorizationInputPaneViewController _loginChoiceTableViewCellForRow:](self, "_loginChoiceTableViewCellForRow:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    else
    {

    }
    -[AKAuthorizationInputPaneViewController _loginChoiceCellForRow:](self, "_loginChoiceCellForRow:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[NSArray objectAtIndexedSubscript:](self->_validatedScopes, "objectAtIndexedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _cellForScope:localRow:](self, "_cellForScope:localRow:", v9, objc_msgSend(v5, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return !-[AKAuthorizationInputPaneViewController isEditingName](self, "isEditingName", a3, a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  v9 = objc_msgSend(v7, "row");
  if (!-[AKAuthorizationInputPaneViewController _shouldPresentCreateFlow](self, "_shouldPresentCreateFlow"))
  {
    -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loginChoices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v9 >= v13)
    {
      _AKLogSiwa();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AKAuthorizationInputPaneViewController tableView:didSelectRowAtIndexPath:].cold.2(v7, self);
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isSiwaCredentialSharingEnabled"))
    {
      v15 = -[AKAuthorizationInputPaneViewController _hasSharedAccountLoginChoices](self, "_hasSharedAccountLoginChoices");

      if (v15)
      {
        -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "indexOfChosenLogin");

        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = (void *)MEMORY[0x1E0CB36B0];
          -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "indexPathForRow:inSection:", objc_msgSend(v19, "indexOfChosenLogin"), 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "cellForRowAtIndexPath:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setChecked:", 0);

        }
        -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "loginChoices");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v24 >= 2)
          -[AKAuthorizationInputPaneViewController _selectLoginChoiceCell:](self, "_selectLoginChoiceCell:", v7);
        -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "hasCreateAccountLoginChoice") & 1) != 0)
        {
          -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "loginChoices");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndex:", v9);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "shouldCreateAppleID");

          if (v29)
          {
            -[AKAuthorizationInputPaneViewController confirmButton](self, "confirmButton");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "switchToAccountCreation");
LABEL_25:

LABEL_26:
            -[AKAuthorizationInputPaneViewController _enableOrDisableConfirmButton](self, "_enableOrDisableConfirmButton");
            goto LABEL_27;
          }
        }
        else
        {

        }
        -[AKAuthorizationInputPaneViewController confirmButton](self, "confirmButton");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "resetToDefault");
        goto LABEL_25;
      }
    }
    else
    {

    }
    _AKLogSiwa();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[AKAuthorizationInputPaneViewController tableView:didSelectRowAtIndexPath:].cold.1(v7, v31);

    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "indexOfChosenLogin");

    if (v33 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v34 = (void *)MEMORY[0x1E0CB36B0];
      -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "indexPathForRow:inSection:", objc_msgSend(v35, "indexOfChosenLogin"), 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "cellForRowAtIndexPath:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setAccessoryType:", 0);

    }
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAccessoryType:", 3);

    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setIndexOfChosenLogin:", v9);

    goto LABEL_26;
  }
  if (!-[AKAuthorizationInputPaneViewController isEditingName](self, "isEditingName"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_validatedScopes, "objectAtIndexedSubscript:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationInputPaneViewController _selectScope:localRow:](self, "_selectScope:localRow:", v10, objc_msgSend(v7, "row"));
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
LABEL_16:

  }
LABEL_27:

}

- (id)_loginChoiceTableViewCellForRow:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  AKAuthorizationLoginChoiceTableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loginChoices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AKAuthorizationLoginChoiceTableViewCell initWithLoginChoice:reuseIdentifier:]([AKAuthorizationLoginChoiceTableViewCell alloc], "initWithLoginChoice:reuseIdentifier:", v7, CFSTR("AKAuthorizationLoginChoiceCell"));
  -[AKAuthorizationLoginChoiceTableViewCell setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("SIWA_ACCOUNT_CELL"));
  +[AKAuthorizationPaneMetrics nameCellHeight](AKAuthorizationPaneMetrics, "nameCellHeight");
  -[AKAuthorizationScopeDetailTableViewCell setMinimumHeight:](v8, "setMinimumHeight:");
  if ((objc_msgSend(v7, "isAppleIDAuthorization") & 1) == 0)
  {
    -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKIcon iconWithPresentationContext:](AKIcon, "iconWithPresentationContext:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "automaskedImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationLoginChoiceTableViewCell setIconImage:](v8, "setIconImage:", v11);

  }
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loginChoices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14 == 1)
  {
    -[AKAuthorizationScopeDetailTableViewCell setCheckmarkStyle:](v8, "setCheckmarkStyle:", 0);
    -[AKAuthorizationLoginChoiceTableViewCell setSelectionStyle:](v8, "setSelectionStyle:", 0);
  }
  else
  {
    -[AKAuthorizationScopeDetailTableViewCell setCheckmarkStyle:](v8, "setCheckmarkStyle:", 2);
  }
  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell setChecked:](v8, "setChecked:", objc_msgSend(v15, "indexOfChosenLogin") == a3);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v7;
    objc_msgSend(v16, "sharedAccount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shareInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "participantHandle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKAuthorizationLoginChoiceTableViewCell sharedIconImageView](v8, "sharedIconImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sharedAccount");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "shareInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", objc_msgSend(v22, "isCurrentUser"));

    +[AKAuthorizationSubPaneMetrics scopeImageViewSize](AKAuthorizationSubPaneMetrics, "scopeImageViewSize");
    +[AKSignInWithAppleAvatarManager avatarImageForUserHandle:diameter:](AKSignInWithAppleAvatarManager, "avatarImageForUserHandle:diameter:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationScopeDetailTableViewCell setScopeImage:](v8, "setScopeImage:", v23);

  }
  else
  {
    -[AKAuthorizationLoginChoiceTableViewCell sharedIconImageView](v8, "sharedIconImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 1);

    +[AKAuthorizationSubPaneMetrics scopeImageViewSize](AKAuthorizationSubPaneMetrics, "scopeImageViewSize");
    +[AKSignInWithAppleAvatarManager avatarImageForPrimaryAccountOwnerWithDiameter:](AKSignInWithAppleAvatarManager, "avatarImageForPrimaryAccountOwnerWithDiameter:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationScopeDetailTableViewCell setScopeImage:](v8, "setScopeImage:", v19);
  }

  return v8;
}

- (void)_selectLoginChoiceCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectRowAtIndexPath:animated:scrollPosition:", v4, 1, 1);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setChecked:", 1);
  v7 = objc_msgSend(v4, "row");
  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIndexOfChosenLogin:", v7);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v4, 1);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "tag");
  v6 = objc_msgSend(v4, "returnKeyType");
  if (v6 == 9)
  {
    -[AKAuthorizationInputPaneViewController _nameEditDone](self, "_nameEditDone");
    goto LABEL_5;
  }
  if (v6 == 4)
  {
    -[AKAuthorizationInputPaneViewController _beginEditingRow:](self, "_beginEditingRow:", v5 + 1);
LABEL_5:
    v7 = 1;
    goto LABEL_9;
  }
  _AKLogSiwa();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[AKAuthorizationInputPaneViewController textFieldShouldReturn:].cold.1(v4, v8);

  v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  AKAuthorizationNameFormatter *v15;
  AKAuthorizationNameFormatter *nameFormatter;
  void *v17;
  void *v18;
  char v19;
  id v20;
  id v22;
  _QWORD v23[2];

  length = a4.length;
  location = a4.location;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v9, "length");
  v23[0] = v13 + location;
  v23[1] = 0;
  -[AKAuthorizationInputPaneViewController nameFormatter](self, "nameFormatter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = objc_alloc_init(AKAuthorizationNameFormatter);
    nameFormatter = self->_nameFormatter;
    self->_nameFormatter = v15;

  }
  -[AKAuthorizationInputPaneViewController nameFormatter](self, "nameFormatter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v12;
  objc_msgSend(v10, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v17, "isPartialStringValid:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:", &v22, v23, v18, location, length, 0);
  v20 = v22;

  return v19;
}

- (id)_cellForScope:(id)a3 localRow:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CFFFD8]))
  {
    -[AKAuthorizationInputPaneViewController _nameCell](self, "_nameCell");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CFFFD0]))
  {
    -[AKAuthorizationInputPaneViewController _emailCellForLocalRow:](self, "_emailCellForLocalRow:", a4);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  _AKLogSiwa();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[AKAuthorizationInputPaneViewController _cellForScope:localRow:].cold.1();

  v8 = 0;
LABEL_9:

  return v8;
}

- (id)_nameCell
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
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
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", CFSTR("AKAuthorizationScopeDetailTableViewCell-Name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("SIWA_NAME_SCOPE_CELL"));
  +[AKAuthorizationPaneMetrics nameCellHeight](AKAuthorizationPaneMetrics, "nameCellHeight");
  objc_msgSend(v4, "setMinimumHeight:");
  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLisbonAvailable");

  if (v6)
  {
    objc_msgSend(v4, "scopeLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", 0);

    -[AKAuthorizationInputPaneViewController _localizedNameKey](self, "_localizedNameKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainDetailLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("person.fill"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScopeImage:", v13);
  }
  else
  {
    -[AKAuthorizationInputPaneViewController _localizedNameKey](self, "_localizedNameKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedUppercaseString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scopeLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    objc_msgSend(v4, "mainDetailLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", 0);
  }

  -[AKAuthorizationInputPaneViewController authorizationViewController](self, "authorizationViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "_isManagedAppleID");

  if (v21)
  {
    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v23);

    -[AKAuthorizationInputPaneViewController _nameCellDetailLabelTextForManagedAppleID](self, "_nameCellDetailLabelTextForManagedAppleID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainDetailLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v25);

  }
  else
  {
    -[AKAuthorizationInputPaneViewController _clearButton](self, "_clearButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessoryView:", v25);
  }

  return v4;
}

- (id)_emailCellForLocalRow:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;

  if (!-[AKAuthorizationInputPaneViewController _isUnderageUser](self, "_isUnderageUser")
    || (objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isTiburonU13Enabled"),
        v5,
        !v6))
  {
    if (!a3)
    {
      -[AKAuthorizationInputPaneViewController _shareMyEmailCell](self, "_shareMyEmailCell");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
    if (-[AKAuthorizationInputPaneViewController _numberOfRowsInScope:](self, "_numberOfRowsInScope:", *MEMORY[0x1E0CFFFD0])- 1 != a3)
    {
      -[AKAuthorizationInputPaneViewController _singleEmailCellForIndex:](self, "_singleEmailCellForIndex:", a3 - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
  }
  -[AKAuthorizationInputPaneViewController _hideMyEmailCell](self, "_hideMyEmailCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)_shareMyEmailCell
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
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
  void *v18;
  void *v19;
  void *v20;

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", CFSTR("AKAuthorizationScopeDetailTableViewCell-Email-Summary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("SIWA_SHARE_MY_EMAIL_SCOPE_CELL"));
  -[AKAuthorizationInputPaneViewController authorizationViewController](self, "authorizationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isManagedAppleID");

  if (v6)
  {
    -[AKAuthorizationInputPaneViewController _defaultSharedEmail](self, "_defaultSharedEmail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userInformation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "managedOrganizationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainDetailLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    objc_msgSend(v4, "setCheckmarkStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("envelope.fill"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScopeImage:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_SHARE_MY_EMAIL"), &stru_1E7679C68, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

    -[AKAuthorizationInputPaneViewController _defaultSharedEmail](self, "_defaultSharedEmail");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainDetailLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    objc_msgSend(v4, "setCheckmarkStyle:", 2);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("envelope.fill"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScopeImage:", v19);

    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "wantsPrivateEmail"))
    {
      objc_msgSend(v4, "setChecked:", 0);
    }
    else
    {
      -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setChecked:", objc_msgSend(v20, "indexOfChosenEmail") != 0x7FFFFFFFFFFFFFFFLL);

    }
  }

  +[AKAuthorizationPaneMetrics emailCellHeight](AKAuthorizationPaneMetrics, "emailCellHeight");
  objc_msgSend(v4, "setMinimumHeight:");
  objc_msgSend(v4, "_setSeparatorIndentToMainLabel");
  return v4;
}

- (id)_hideMyEmailCell
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", CFSTR("AKAuthorizationScopeDetailTableViewCell-Email-Summary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("SIWA_HIDE_MY_EMAIL_SCOPE_CELL"));
  +[AKAuthorizationPaneMetrics emailCellHeight](AKAuthorizationPaneMetrics, "emailCellHeight");
  objc_msgSend(v4, "setMinimumHeight:");
  objc_msgSend(v4, "scopeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", &stru_1E7679C68);

  objc_msgSend(v4, "setScopeImage:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_HIDE_MY_EMAIL"), &stru_1E7679C68, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_FORWARD_TO_FORMAT"), &stru_1E7679C68, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "forwardingEmail");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainDetailLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  objc_msgSend(v4, "setCheckmarkStyle:", 2);
  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChecked:", objc_msgSend(v16, "wantsPrivateEmail"));

  objc_msgSend(v4, "_setSeparatorIndentToMainLabel");
  if (-[AKAuthorizationInputPaneViewController _isUnderageUser](self, "_isUnderageUser"))
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isTiburonU13Enabled");

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("envelope.fill"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setScopeImage:", v19);

    }
  }
  return v4;
}

- (id)_editingNameCellForRow:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("AKAuthorizationScopeEditTableViewCell-Name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "detailTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  objc_msgSend(v6, "detailTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTag:", a3);

  if (self->_editingGivenNameIndex == a3)
  {
    -[AKAuthorizationInputPaneViewController _setupGivenNameCell:](self, "_setupGivenNameCell:", v6);
  }
  else if (self->_editingFamilyNameIndex == a3)
  {
    -[AKAuthorizationInputPaneViewController _setupFamilyNameCell:](self, "_setupFamilyNameCell:", v6);
  }
  else
  {
    _AKLogSiwa();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKAuthorizationInputPaneViewController _editingNameCellForRow:].cold.1(a3, v9);

  }
  return v6;
}

- (void)_setupGivenNameCell:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  +[AKAuthorizationScopeChoices localizedGivenNameLabel](AKAuthorizationScopeChoices, "localizedGivenNameLabel");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLisbonAvailable");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v19, "localizedUppercaseString");
    v7 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v7;
  }
  objc_msgSend(v4, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v19);

  +[AKAuthorizationScopeChoices localizedGivenNameLabel](AKAuthorizationScopeChoices, "localizedGivenNameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

  -[AKAuthorizationInputPaneViewController editingUserInformation](self, "editingUserInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "givenName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailTextField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  v14 = *MEMORY[0x1E0CEBC78];
  objc_msgSend(v4, "detailTextField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextContentType:", v14);

  objc_msgSend(v4, "detailTextField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setReturnKeyType:", 4);

  objc_msgSend(v4, "detailTextField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeTarget:action:forControlEvents:", self, 0, 0x20000);

  objc_msgSend(v4, "detailTextField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__setGivenNameFromTextField_, 0x20000);
}

- (void)_setupFamilyNameCell:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  +[AKAuthorizationScopeChoices localizedFamilyNameLabel](AKAuthorizationScopeChoices, "localizedFamilyNameLabel");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLisbonAvailable");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v19, "localizedUppercaseString");
    v7 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v7;
  }
  objc_msgSend(v4, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v19);

  +[AKAuthorizationScopeChoices localizedFamilyNameLabel](AKAuthorizationScopeChoices, "localizedFamilyNameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

  -[AKAuthorizationInputPaneViewController editingUserInformation](self, "editingUserInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "familyName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailTextField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  v14 = *MEMORY[0x1E0CEBC60];
  objc_msgSend(v4, "detailTextField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextContentType:", v14);

  objc_msgSend(v4, "detailTextField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setReturnKeyType:", 9);

  objc_msgSend(v4, "detailTextField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeTarget:action:forControlEvents:", self, 0, 0x20000);

  objc_msgSend(v4, "detailTextField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__setFamilyNameFromTextField_, 0x20000);
}

- (id)_loginChoiceCellForRow:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  AKAuthorizationLoginChoiceCell *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  uint64_t v20;

  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loginChoices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a3)
  {
    -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loginChoices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[AKAuthorizationLoginChoiceCell initWithLoginChoice:reuseIdentifier:]([AKAuthorizationLoginChoiceCell alloc], "initWithLoginChoice:reuseIdentifier:", v10, CFSTR("AKAuthorizationLoginChoiceCell"));
    if ((objc_msgSend(v10, "isAppleIDAuthorization") & 1) == 0)
    {
      -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[AKIcon iconWithPresentationContext:](AKIcon, "iconWithPresentationContext:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "automaskedImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationLoginChoiceCell setIconImage:](v11, "setIconImage:", v14);

    }
    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "indexOfChosenLogin") == a3)
    {

    }
    else
    {
      -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "loginChoices");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20 != 1)
        goto LABEL_11;
    }
    -[AKAuthorizationLoginChoiceCell setAccessoryType:](v11, "setAccessoryType:", 3);
LABEL_11:

    return v11;
  }
  _AKLogSiwa();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[AKAuthorizationInputPaneViewController _loginChoiceCellForRow:].cold.1(self);

  return 0;
}

- (int64_t)_numberOfRowsInValidatedScopes
{
  NSArray *validatedScopes;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  validatedScopes = self->_validatedScopes;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__AKAuthorizationInputPaneViewController__numberOfRowsInValidatedScopes__block_invoke;
  v5[3] = &unk_1E76792B8;
  v5[4] = self;
  v5[5] = &v6;
  -[NSArray enumerateObjectsUsingBlock:](validatedScopes, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __72__AKAuthorizationInputPaneViewController__numberOfRowsInValidatedScopes__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_numberOfRowsInScope:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

- (unint64_t)_numberOfRowsInScope:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFFFD8]) & 1) != 0)
    goto LABEL_2;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFFFD0]))
  {
    -[AKAuthorizationInputPaneViewController authorizationViewController](self, "authorizationViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_isManagedAppleID");

    if (v7)
    {
      -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userInformation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sharedEmailForManagedAppleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v10, "length") != 0;

    }
    else
    {
      if (-[AKAuthorizationInputPaneViewController _isUnderageUser](self, "_isUnderageUser"))
      {
        objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isTiburonU13Enabled");

        if ((v13 & 1) != 0)
        {
LABEL_2:
          v5 = 1;
          goto LABEL_15;
        }
      }
      if (!-[AKAuthorizationInputPaneViewController isEmailExpanded](self, "isEmailExpanded"))
      {
        v5 = 2;
        goto LABEL_15;
      }
      -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "emailCount") + 2;
    }

    goto LABEL_15;
  }
  _AKLogSiwa();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[AKAuthorizationInputPaneViewController _cellForScope:localRow:].cold.1();

  v5 = 0;
LABEL_15:

  return v5;
}

- (id)_singleEmailCellForIndex:(int64_t)a3
{
  void *v5;
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

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("AKAuthorizationScopeDetailTableViewCell-Email-Single"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("SIWA_SINGLE_EMAIL_SCOPE_CELL"));
  +[AKAuthorizationPaneMetrics selectEmailCellHeight](AKAuthorizationPaneMetrics, "selectEmailCellHeight");
  objc_msgSend(v6, "setMinimumHeight:");
  objc_msgSend(v6, "scopeLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", &stru_1E7679C68);

  objc_msgSend(v6, "mainLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "emailAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  +[AKAuthorizationAppearance scopeSelectionTitleFont](AKAuthorizationAppearance, "scopeSelectionTitleFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  objc_msgSend(v6, "mainDetailLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", 0);

  -[AKAuthorizationInputPaneViewController authorizationViewController](self, "authorizationViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v14, "_isManagedAppleID");

  if ((_DWORD)v12)
  {
    objc_msgSend(v6, "setCheckmarkStyle:", 0);
  }
  else
  {
    objc_msgSend(v6, "setCheckmarkStyle:", 1);
    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "wantsPrivateEmail"))
    {
      objc_msgSend(v6, "setChecked:", 0);
    }
    else
    {
      -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setChecked:", objc_msgSend(v16, "indexOfChosenEmail") == a3);

    }
  }
  objc_msgSend(v6, "_setSeparatorIndentToMainLabel");
  return v6;
}

- (void)_selectRow:(int64_t)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_validatedScopes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      v10 = a3;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v12 = -[AKAuthorizationInputPaneViewController _numberOfRowsInScope:](self, "_numberOfRowsInScope:", v11, (_QWORD)v13);
        a3 = v10 - v12;
        if (v10 < v12)
        {
          -[AKAuthorizationInputPaneViewController _selectScope:localRow:](self, "_selectScope:localRow:", v11, v10);
          goto LABEL_11;
        }
        ++v9;
        v10 -= v12;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_selectScope:(id)a3 localRow:(int64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;

  v6 = a3;
  v7 = *MEMORY[0x1E0CFFFD8];
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CFFFD8]))
  {
    -[AKAuthorizationInputPaneViewController _didSelectEditScope:options:](self, "_didSelectEditScope:options:", v7, MEMORY[0x1E0C9AA70]);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CFFFD0]))
  {
    -[AKAuthorizationInputPaneViewController _selectEmailLocalRow:](self, "_selectEmailLocalRow:", a4);
  }
  else
  {
    _AKLogSiwa();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AKAuthorizationInputPaneViewController _selectScope:localRow:].cold.1();

  }
}

- (void)_selectEmailLocalRow:(int64_t)a3
{
  if (a3)
  {
    if (-[AKAuthorizationInputPaneViewController _numberOfRowsInScope:](self, "_numberOfRowsInScope:", *MEMORY[0x1E0CFFFD0])- 1 == a3)-[AKAuthorizationInputPaneViewController _selectHideMyEmail](self, "_selectHideMyEmail");
    else
      -[AKAuthorizationInputPaneViewController _selectSingleEmailAtIndex:](self, "_selectSingleEmailAtIndex:", a3 - 1);
  }
  else
  {
    -[AKAuthorizationInputPaneViewController _selectShareMyEmail](self, "_selectShareMyEmail");
  }
}

- (void)_selectSingleEmailAtIndex:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;

  if (a3 < 0
    || (-[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "emailCount"),
        v5,
        v6 <= a3))
  {
    _AKLogSiwa();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKAuthorizationInputPaneViewController _selectSingleEmailAtIndex:].cold.1(a3, self);

  }
  else
  {
    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWantsPrivateEmail:", 0);

    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIndexOfChosenEmail:", a3);

    -[AKAuthorizationInputPaneViewController setEditableScopeChoicesChanged:](self, "setEditableScopeChoicesChanged:", 1);
    -[AKAuthorizationInputPaneViewController _enableOrDisableConfirmButton](self, "_enableOrDisableConfirmButton");
    -[AKAuthorizationInputPaneViewController setEmailExpanded:animated:](self, "setEmailExpanded:animated:", 0, 1);
  }
}

- (void)_selectLoginChoiceCell
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!-[AKAuthorizationInputPaneViewController _shouldPresentCreateFlow](self, "_shouldPresentCreateFlow")
    && !-[AKAuthorizationInputPaneViewController _hasOneLoginChoice](self, "_hasOneLoginChoice"))
  {
    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "indexOfChosenLogin");

    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[AKAuthorizationPaneViewController tableView](self, "tableView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0CB36B0];
      -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "indexPathForRow:inSection:", objc_msgSend(v6, "indexOfChosenLogin"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectRowAtIndexPath:animated:scrollPosition:", v7, 1, 1);

    }
  }
}

- (BOOL)isEmailExpanded
{
  return self->_isEmailExpanded;
}

- (void)setEmailExpanded:(BOOL)a3
{
  -[AKAuthorizationInputPaneViewController setEmailExpanded:animated:](self, "setEmailExpanded:animated:", a3, 0);
}

- (void)setEmailExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  if (self->_isEmailExpanded != a3)
  {
    self->_isEmailExpanded = a3;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __68__AKAuthorizationInputPaneViewController_setEmailExpanded_animated___block_invoke;
    v4[3] = &unk_1E76792E0;
    v4[4] = self;
    v5 = a3;
    -[AKAuthorizationInputPaneViewController _reloadDataAnimated:heightChange:](self, "_reloadDataAnimated:heightChange:", a4, v4);
  }
}

void __68__AKAuthorizationInputPaneViewController_setEmailExpanded_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "userInterfaceIdiom"))
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 0.0;
  if (v4 == 6)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "editableScopeChoices", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emailCount");
    +[AKAuthorizationPaneMetrics selectEmailCellHeight](AKAuthorizationPaneMetrics, "selectEmailCellHeight");

  }
}

- (void)_transitionToEditingNameAnimated:(BOOL)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__AKAuthorizationInputPaneViewController__transitionToEditingNameAnimated___block_invoke;
  v4[3] = &unk_1E7679308;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__AKAuthorizationInputPaneViewController__transitionToEditingNameAnimated___block_invoke_2;
  v3[3] = &unk_1E76789A0;
  -[AKAuthorizationInputPaneViewController _reloadDataAnimated:heightChange:animation:](self, "_reloadDataAnimated:heightChange:animation:", a3, v4, v3);
}

double __75__AKAuthorizationInputPaneViewController__transitionToEditingNameAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_computeNameEditHeightChange");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088) = v2;
  return *(double *)(*(_QWORD *)(a1 + 32) + 1088);
}

uint64_t __75__AKAuthorizationInputPaneViewController__transitionToEditingNameAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSavedRightBarButtonItem:", v3);

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSavedLeftBarButtonItem:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_doneBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithTitle:style:target:action:", &stru_1E7679C68, 0, *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItem:", v8);

  return objc_msgSend(*(id *)(a1 + 32), "_updatePaneTitleForEditing:", 1);
}

- (void)_transitionFromEditingNameAnimated:(BOOL)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__AKAuthorizationInputPaneViewController__transitionFromEditingNameAnimated___block_invoke;
  v4[3] = &unk_1E7679308;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__AKAuthorizationInputPaneViewController__transitionFromEditingNameAnimated___block_invoke_2;
  v3[3] = &unk_1E76789A0;
  -[AKAuthorizationInputPaneViewController _reloadDataAnimated:heightChange:animation:](self, "_reloadDataAnimated:heightChange:animation:", a3, v4, v3);
}

double __77__AKAuthorizationInputPaneViewController__transitionFromEditingNameAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double result;

  v1 = *(_QWORD *)(a1 + 32);
  result = -*(double *)(v1 + 1088);
  *(_QWORD *)(v1 + 1088) = 0;
  return result;
}

uint64_t __77__AKAuthorizationInputPaneViewController__transitionFromEditingNameAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "savedRightBarButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", v2);

  objc_msgSend(*(id *)(a1 + 32), "savedLeftBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setSavedRightBarButtonItem:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSavedLeftBarButtonItem:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_updatePaneTitleForEditing:", 0);
}

- (void)_beginEditingRow:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[AKAuthorizationInputPaneViewController _textFieldForRow:](self, "_textFieldForRow:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "becomeFirstResponder");
  -[AKAuthorizationInputPaneViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[AKAuthorizationInputPaneViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (void)_beginEditing
{
  -[AKAuthorizationInputPaneViewController _beginEditingRow:](self, "_beginEditingRow:", 0);
}

- (id)_textFieldForRow:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "detailTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_nameEditDone
{
  void *v3;
  AKAuthorizationInputPaneViewController *v4;

  -[AKAuthorizationInputPaneViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (AKAuthorizationInputPaneViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    -[AKAuthorizationInputPaneViewController setEditingName:animated:](self, "setEditingName:animated:", 0, 1);
}

- (void)_setGivenNameFromTextField:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[AKAuthorizationInputPaneViewController _textFromTextField:](self, "_textFromTextField:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController editingUserInformation](self, "editingUserInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v8);

  if ((v6 & 1) == 0)
  {
    -[AKAuthorizationInputPaneViewController editingUserInformation](self, "editingUserInformation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setGivenName:", v8);

  }
}

- (void)_setFamilyNameFromTextField:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[AKAuthorizationInputPaneViewController _textFromTextField:](self, "_textFromTextField:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController editingUserInformation](self, "editingUserInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v8);

  if ((v6 & 1) == 0)
  {
    -[AKAuthorizationInputPaneViewController editingUserInformation](self, "editingUserInformation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFamilyName:", v8);

  }
}

- (id)_textFromTextField:(id)a3
{
  return (id)objc_msgSend(a3, "text");
}

- (BOOL)_getValidEditingGivenName:(id *)a3 familyName:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  -[AKAuthorizationInputPaneViewController editingUserInformation](self, "editingUserInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "familyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length") || objc_msgSend(v11, "length"))
  {
    if (a3)
      *a3 = objc_retainAutorelease(v9);
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_updateDataSourceWithValidEditingName
{
  _BOOL4 v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];
  id v16;
  id v17;

  if (-[AKAuthorizationInputPaneViewController isEditingName](self, "isEditingName"))
  {
    v16 = 0;
    v17 = 0;
    v3 = -[AKAuthorizationInputPaneViewController _getValidEditingGivenName:familyName:](self, "_getValidEditingGivenName:familyName:", &v17, &v16);
    v4 = v17;
    v5 = v16;
    if (v3)
    {
      -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInformation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "givenName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v4))
      {
        -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "userInformation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "familyName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5) ^ 1;

      }
      else
      {
        v12 = 1;
      }

      -[AKCATiburonInputUIReporter didModifyName:](self->_analyticsReport, "didModifyName:", v12);
      -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setGivenName:familyName:", v4, v5);

      -[AKAuthorizationPaneViewController editableDataSources](self, "editableDataSources");
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject setEditableScopeChoicesChanged:](v13, "setEditableScopeChoicesChanged:", 1);
    }
    else
    {
      _AKLogSiwa();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1BD795000, v13, OS_LOG_TYPE_DEFAULT, "Name change not accepted.", v15, 2u);
      }
    }

  }
}

- (double)_computeNameEditHeightChange
{
  void *v3;
  uint64_t v4;
  double result;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    -[AKAuthorizationInputPaneViewController _padNameEditHeightChange](self, "_padNameEditHeightChange");
  }
  else if (v4)
  {
    _AKLogSiwa();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AKAuthorizationInputPaneViewController _computeNameEditHeightChange].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    return 0.0;
  }
  else
  {
    -[AKAuthorizationInputPaneViewController _phoneNameEditHeightChange](self, "_phoneNameEditHeightChange");
  }
  return result;
}

- (double)_phoneNameEditHeightChange
{
  void *v3;
  int v4;
  void *v5;
  double MaxY;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLisbonAvailable");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    MaxY = CGRectGetMaxY(v27);

    -[AKAuthorizationInputPaneViewController preferredContentSize](self, "preferredContentSize");
    v8 = v7;
    -[AKAuthorizationInputPaneViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v11 = v8 + CGRectGetHeight(v28);

    return MaxY - v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA6C8], "sizeForInterfaceOrientation:", -[AKAuthorizationInputPaneViewController interfaceOrientation](self, "interfaceOrientation"));
    v14 = v13;
    +[AKAuthorizationPaneMetrics keyboardAccessoryViewHeight](AKAuthorizationPaneMetrics, "keyboardAccessoryViewHeight");
    v16 = v14 + v15;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v18 = CGRectGetMaxY(v29);

    -[AKAuthorizationInputPaneViewController _mainSectionScreenMaxY](self, "_mainSectionScreenMaxY");
    v20 = v19;
    -[AKAuthorizationPaneViewController tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentOffset");
    v23 = v22;
    -[AKAuthorizationInputPaneViewController navigationController](self, "navigationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "navigationBar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v26 = v20 + v23 + CGRectGetHeight(v30);

    return v16 - (v18 - v26);
  }
}

- (double)_padNameEditHeightChange
{
  double v3;
  double v4;
  void *v5;
  double Height;
  void *v7;
  void *v8;
  double v9;
  CGRect v11;
  CGRect v12;

  -[AKAuthorizationInputPaneViewController _mainSectionScreenMaxY](self, "_mainSectionScreenMaxY");
  v4 = v3;
  -[AKAuthorizationPaneViewController paneFooterStackView](self, "paneFooterStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Height = CGRectGetHeight(v11);

  -[AKAuthorizationInputPaneViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bounds");
  objc_msgSend(v8, "convertRect:toView:", 0);
  v9 = v4 + Height - CGRectGetMaxY(v12);

  return v9;
}

- (double)_mainSectionScreenMaxY
{
  void *v3;
  void *v4;
  double MaxY;
  void *v6;
  double Height;
  CGRect v9;
  CGRect v10;

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "convertRect:toView:", 0);
  MaxY = CGRectGetMaxY(v9);
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rectForSection:", 0);
  Height = CGRectGetHeight(v10);

  return MaxY + Height;
}

- (void)_reloadDataAnimated:(BOOL)a3 heightChange:(id)a4
{
  -[AKAuthorizationInputPaneViewController _reloadDataAnimated:heightChange:animation:completion:](self, "_reloadDataAnimated:heightChange:animation:completion:", a3, a4, 0, 0);
}

- (void)_reloadDataAnimated:(BOOL)a3 heightChange:(id)a4 animation:(id)a5
{
  -[AKAuthorizationInputPaneViewController _reloadDataAnimated:heightChange:animation:completion:](self, "_reloadDataAnimated:heightChange:animation:completion:", a3, a4, a5, 0);
}

- (void)_reloadDataAnimated:(BOOL)a3 heightChange:(id)a4 animation:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  void (**v10)(_QWORD, double);
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;

  v8 = a3;
  v10 = (void (**)(_QWORD, double))a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isLisbonAvailable");

  if (v14)
  {
    -[AKAuthorizationPaneViewController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reloadData");

    -[AKAuthorizationPaneViewController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "numberOfSections");

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v19 = 100;
  else
    v19 = 5;
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reloadSections:withRowAnimation:", v18, v19);

  v21 = 0.0;
  v22 = 0;
  if (v10)
    v10[2](v10, 0.0);
  v23 = !v8;
  v24 = (void *)MEMORY[0x1E0CEABB0];
  if (!v23)
    v21 = 0.3;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __96__AKAuthorizationInputPaneViewController__reloadDataAnimated_heightChange_animation_completion___block_invoke;
  v29[3] = &unk_1E7679330;
  v29[4] = self;
  v30 = v11;
  v31 = v22;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __96__AKAuthorizationInputPaneViewController__reloadDataAnimated_heightChange_animation_completion___block_invoke_2;
  v27[3] = &unk_1E7679358;
  v28 = v12;
  v25 = v12;
  v26 = v11;
  objc_msgSend(v24, "animateWithDuration:animations:completion:", v29, v27, v21);

}

uint64_t __96__AKAuthorizationInputPaneViewController__reloadDataAnimated_heightChange_animation_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutForHeightChange:", *(double *)(a1 + 48));
}

uint64_t __96__AKAuthorizationInputPaneViewController__reloadDataAnimated_heightChange_animation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateLayoutForHeightChange:(double)a3
{
  double v5;
  double v6;
  void *v7;
  id v8;
  CGRect v9;

  if (a3 != 0.0)
  {
    -[AKAuthorizationInputPaneViewController preferredContentSize](self, "preferredContentSize");
    v6 = v5 + a3;
    -[AKAuthorizationInputPaneViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[AKAuthorizationInputPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", CGRectGetWidth(v9), v6);

    -[AKAuthorizationInputPaneViewController view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

  }
}

- (BOOL)_shouldOverrideIntrinsicContentHeight
{
  return self->_isEditingName || self->_isEmailExpanded;
}

- (double)intrinsicContentHeight
{
  double v3;
  double result;
  objc_super v5;

  if (-[AKAuthorizationInputPaneViewController _shouldOverrideIntrinsicContentHeight](self, "_shouldOverrideIntrinsicContentHeight"))
  {
    -[AKAuthorizationInputPaneViewController preferredContentSize](self, "preferredContentSize");
    return v3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AKAuthorizationInputPaneViewController;
    -[AKAuthorizationPaneViewController intrinsicContentHeight](&v5, sel_intrinsicContentHeight);
  }
  return result;
}

- (double)contentScrollOffset
{
  void *v3;
  void *v4;
  double Height;
  CGFloat v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double MaxY;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isActive"))
  {
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    Height = CGRectGetHeight(v38);
    objc_msgSend(v3, "frame");
    v6 = Height - CGRectGetHeight(v39);

    objc_msgSend(v3, "frame");
    v41 = CGRectOffset(v40, 0.0, v6);
    x = v41.origin.x;
    y = v41.origin.y;
    width = v41.size.width;
    v10 = v41.size.height;
    objc_msgSend(v3, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationInputPaneViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[AKAuthorizationInputPaneViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertRect:fromView:", v21, v14, v16, v18, v20);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v42.origin.x = v23;
    v42.origin.y = v25;
    v42.size.width = v27;
    v42.size.height = v29;
    MaxY = CGRectGetMaxY(v42);
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = v10;
    v31 = MaxY - CGRectGetMinY(v43);
    v37.receiver = self;
    v37.super_class = (Class)AKAuthorizationInputPaneViewController;
    -[AKAuthorizationPaneViewController contentScrollOffset](&v37, sel_contentScrollOffset);
    v33 = fmax(v31, v32);
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)AKAuthorizationInputPaneViewController;
    -[AKAuthorizationPaneViewController contentScrollOffset](&v36, sel_contentScrollOffset);
    v33 = v34;
  }

  return v33;
}

- (void)_selectShareMyEmail
{
  AKAuthorizationInputPaneViewController *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  id v7;

  -[AKAuthorizationInputPaneViewController _updateEditableScopeChoicesWithPrivateEmail:](self, "_updateEditableScopeChoicesWithPrivateEmail:", 0);
  if (-[AKAuthorizationInputPaneViewController isEmailExpanded](self, "isEmailExpanded"))
  {
    v3 = self;
    v4 = 0;
LABEL_5:
    -[AKAuthorizationInputPaneViewController setEmailExpanded:animated:](v3, "setEmailExpanded:animated:", v4, 1);
    return;
  }
  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "emailCount");

  v3 = self;
  if (v6 >= 2)
  {
    v4 = 1;
    goto LABEL_5;
  }
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (void)_selectHideMyEmail
{
  id v3;

  -[AKAuthorizationInputPaneViewController _updateEditableScopeChoicesWithPrivateEmail:](self, "_updateEditableScopeChoicesWithPrivateEmail:", 1);
  if (-[AKAuthorizationInputPaneViewController isEmailExpanded](self, "isEmailExpanded"))
  {
    -[AKAuthorizationInputPaneViewController setEmailExpanded:animated:](self, "setEmailExpanded:animated:", 0, 1);
  }
  else
  {
    -[AKAuthorizationPaneViewController tableView](self, "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (void)_updateEditableScopeChoicesWithPrivateEmail:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (!a3)
  {
    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfChosenEmail");

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIndexOfChosenEmail:", 0);

    }
  }
  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWantsPrivateEmail:", v3);

  -[AKAuthorizationInputPaneViewController setEditableScopeChoicesChanged:](self, "setEditableScopeChoicesChanged:", 1);
  -[AKAuthorizationInputPaneViewController _enableOrDisableConfirmButton](self, "_enableOrDisableConfirmButton");
}

- (id)_clearButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__AKAuthorizationInputPaneViewController__clearButton__block_invoke;
  v12[3] = &unk_1E7678D98;
  v12[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithHandler:", v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CEA3A0];
  +[AKAuthorizationAppearance clearButtonConfiguration](AKAuthorizationAppearance, "clearButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonWithConfiguration:primaryAction:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[AKAuthorizationPaneMetrics clearButtonWidth](AKAuthorizationPaneMetrics, "clearButtonWidth");
  v7 = v6;
  +[AKAuthorizationPaneMetrics clearButtonWidth](AKAuthorizationPaneMetrics, "clearButtonWidth");
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v7, v8);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_VIEWCONTROLLER_CLEAR"), &stru_1E7679C68, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v10);

  return v5;
}

void __54__AKAuthorizationInputPaneViewController__clearButton__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = *MEMORY[0x1E0CFFFD8];
  v4 = CFSTR("shouldClear");
  v5[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_didSelectEditScope:options:", v2, v3);

}

- (id)_doneBarButtonItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CEA380]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_VIEWCONTROLLER_DONE"), &stru_1E7679C68, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, +[AKAuthorizationAppearance editingDoneButtonStyle](AKAuthorizationAppearance, "editingDoneButtonStyle"), self, sel__doneButtonSelected_);

  return v6;
}

- (void)_updatePaneTitleForEditing:(BOOL)a3
{
  void *v5;
  int v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLisbonAvailable");

  if (v6)
  {
    if (a3)
    {
      -[AKAuthorizationInputPaneViewController _paneTitleString](self, "_paneTitleString");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationInputPaneViewController setTitle:](self, "setTitle:", v7);

    }
    else
    {
      -[AKAuthorizationInputPaneViewController setTitle:](self, "setTitle:", 0);
    }
  }
}

- (void)_didSelectEditScope:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[AKAuthorizationPaneViewController paneDelegate](self, "paneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "authorizationPaneViewController:pushEditScope:presentationContext:options:", self, v9, v8, v6);

  }
}

- (void)_setCancelButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[AKAuthorizationInputPaneViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_enableOrDisableConfirmButton
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  v3 = -[AKAuthorizationInputPaneViewController isEditingName](self, "isEditingName");
  -[AKAuthorizationInputPaneViewController confirmButton](self, "confirmButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  if (!v3)
  {
    v6 = -[AKAuthorizationInputPaneViewController _shouldAllowAuthorization](self, "_shouldAllowAuthorization");
    -[AKAuthorizationInputPaneViewController confirmButton](self, "confirmButton");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enableAuthorizationCapability:", v6);

  }
}

- (BOOL)isEditingName
{
  return self->_isEditingName;
}

- (void)setEditingName:(BOOL)a3
{
  -[AKAuthorizationInputPaneViewController setEditingName:shouldClear:animated:](self, "setEditingName:shouldClear:animated:", a3, 0, 0);
}

- (void)setEditingName:(BOOL)a3 animated:(BOOL)a4
{
  -[AKAuthorizationInputPaneViewController setEditingName:shouldClear:animated:](self, "setEditingName:shouldClear:animated:", a3, 0, a4);
}

- (void)setEditingName:(BOOL)a3 shouldClear:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int *v12;
  int *v13;
  AKAuthorizationNameFormatter *nameFormatter;
  void *v15;
  void *v16;

  if (self->_isEditingName != a3)
  {
    v5 = a5;
    if (!a3)
    {
      -[AKAuthorizationInputPaneViewController _updateDataSourceWithValidEditingName](self, "_updateDataSourceWithValidEditingName", a3, a4);
      self->_isEditingName = 0;
      -[AKAuthorizationInputPaneViewController _endEditing](self, "_endEditing");
      -[AKAuthorizationInputPaneViewController _transitionFromEditingNameAnimated:](self, "_transitionFromEditingNameAnimated:", v5);
      nameFormatter = self->_nameFormatter;
      self->_nameFormatter = 0;

LABEL_12:
      -[AKAuthorizationInputPaneViewController _enableOrDisableConfirmButton](self, "_enableOrDisableConfirmButton");
      return;
    }
    v7 = a4;
    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInformation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationInputPaneViewController setEditingUserInformation:](self, "setEditingUserInformation:", v9);

    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "personNameComponentsOrder");

    if (v11)
    {
      if (v11 != 1)
      {
LABEL_9:
        if (v7)
        {
          -[AKAuthorizationInputPaneViewController editingUserInformation](self, "editingUserInformation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setGivenName:", &stru_1E7679C68);

          -[AKAuthorizationInputPaneViewController editingUserInformation](self, "editingUserInformation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setFamilyName:", &stru_1E7679C68);

        }
        self->_isEditingName = 1;
        -[AKAuthorizationInputPaneViewController _transitionToEditingNameAnimated:](self, "_transitionToEditingNameAnimated:", v5);
        -[AKAuthorizationInputPaneViewController _beginEditing](self, "_beginEditing");
        goto LABEL_12;
      }
      v12 = &OBJC_IVAR___AKAuthorizationInputPaneViewController__editingGivenNameIndex;
      v13 = &OBJC_IVAR___AKAuthorizationInputPaneViewController__editingFamilyNameIndex;
    }
    else
    {
      v12 = &OBJC_IVAR___AKAuthorizationInputPaneViewController__editingFamilyNameIndex;
      v13 = &OBJC_IVAR___AKAuthorizationInputPaneViewController__editingGivenNameIndex;
    }
    *(Class *)((char *)&self->super.super.super.super.isa + *v13) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + *v12) = (Class)1;
    goto LABEL_9;
  }
}

- (void)_performAuthorizationWithRawPassword:(id)a3
{
  -[AKAuthorizationInputPaneViewController _performAuthorizationWithRawPassword:completionHandler:](self, "_performAuthorizationWithRawPassword:completionHandler:", a3, 0);
}

- (void)_performAuthorizationWithRawPassword:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  AKAuthorizationInputPaneViewController *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _selectedLoginChoice](self, "_selectedLoginChoice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _prepareScopeChoices:withLoginChoice:](self, "_prepareScopeChoices:withLoginChoice:", v8, v9);

  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userResponse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setRawAccountPassword:", v6);
  -[AKAuthorizationInputPaneViewController _updateAnalyticsReport](self, "_updateAnalyticsReport");
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __97__AKAuthorizationInputPaneViewController__performAuthorizationWithRawPassword_completionHandler___block_invoke;
  v20 = &unk_1E7679380;
  v21 = self;
  v22 = v7;
  v12 = v7;
  -[AKAuthorizationInputPaneViewController _paneDelegate_didRequestAuthorizationWithUserProvidedInformation:completion:](self, "_paneDelegate_didRequestAuthorizationWithUserProvidedInformation:completion:", v11, &v17);
  _AKLogSiwa();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices", v17, v18, v19, v20, v21, v22);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = CFSTR("YES");
    if (!v6)
      v16 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v24 = v14;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_1BD795000, v13, OS_LOG_TYPE_DEFAULT, "AKAuthorizationInputPaneViewController: User requested authorization with scope choices: %@ \nContains password: %@", buf, 0x16u);

  }
}

void __97__AKAuthorizationInputPaneViewController__performAuthorizationWithRawPassword_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (!v6)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "sendReport");
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __97__AKAuthorizationInputPaneViewController__performAuthorizationWithRawPassword_completionHandler___block_invoke_2;
      block[3] = &unk_1E7678D18;
      block[4] = *(_QWORD *)(a1 + 32);
      v12 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v8 = v12;
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __97__AKAuthorizationInputPaneViewController__performAuthorizationWithRawPassword_completionHandler___block_invoke_3;
      v9[3] = &unk_1E7678D18;
      v9[4] = *(_QWORD *)(a1 + 32);
      v10 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], v9);
      v8 = v10;
    }

  }
}

uint64_t __97__AKAuthorizationInputPaneViewController__performAuthorizationWithRawPassword_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __97__AKAuthorizationInputPaneViewController__performAuthorizationWithRawPassword_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthorizationError:", *(_QWORD *)(a1 + 40));
}

- (void)_performPasswordAuthentication
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[AKAuthorizationPaneViewController paneDelegate](self, "paneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _AKLogSiwa();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "AKAuthorizationConfirmPaneViewController: Performing password authorization", v5, 2u);
    }

    objc_msgSend(v3, "performPasswordAuthenticationForPaneViewController:", self);
  }

}

- (void)_handleAuthorizationError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "ak_isAuthenticationErrorWithCode:", -7081))
  {
    if (!-[AKAuthorizationInputPaneViewController _nameScopeAllowsAuthorization](self, "_nameScopeAllowsAuthorization"))
    {
      -[AKAuthorizationInputPaneViewController confirmButton](self, "confirmButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("BIO_BUTTON_ENTER_NAME");
      goto LABEL_8;
    }
    if (!-[AKAuthorizationInputPaneViewController _emailScopeAllowsAuthorization](self, "_emailScopeAllowsAuthorization"))
    {
      -[AKAuthorizationInputPaneViewController confirmButton](self, "confirmButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("BIO_BUTTON_SELECT_EMAIL");
LABEL_8:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E7679C68, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bioAuthFailWithAlertString:", v8);

    }
  }
  else
  {
    if (objc_msgSend(v11, "ak_isAuthenticationErrorWithCode:", -7082))
    {
      -[AKAuthorizationInputPaneViewController confirmButton](self, "confirmButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("BIO_BUTTON_SELECT_ACCOUNT");
      goto LABEL_8;
    }
    v9 = objc_msgSend(v11, "code") == -7006 || objc_msgSend(v11, "code") == -7075;
    -[AKAuthorizationInputPaneViewController confirmButton](self, "confirmButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "showAlertAndContinueWithPassword:", v9);

    -[AKAuthorizationInputPaneViewController _paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:](self, "_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:", 0, v11);
  }

}

- (void)_prepareScopeChoices:(id)a3 withLoginChoice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSiwaCredentialSharingEnabled");

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "sharedAccount");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "credentialRequestContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "authorizationRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "set_sharedAccount:", v10);

    }
  }
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "credentialRequestContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "authorizationRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLoginChoice:", v7);
  if (v7 && !objc_msgSend(v7, "isAppleIDAuthorization"))
  {
    if (v16)
    {
      -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loginChoices");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __79__AKAuthorizationInputPaneViewController__prepareScopeChoices_withLoginChoice___block_invoke;
      v29[3] = &unk_1E76793A8;
      v30 = v6;
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v29);

    }
    -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
    v19 = objc_claimAutoreleasedReturnValue();
    -[NSObject credentialRequestContext](v19, "credentialRequestContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "passwordRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectedRequest:", v21);

    goto LABEL_13;
  }
  if (!v16)
  {
    _AKLogSiwa();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[AKAuthorizationInputPaneViewController _prepareScopeChoices:withLoginChoice:].cold.1(v19, v22, v23, v24, v25, v26, v27, v28);
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v6, "setSelectedRequest:", v16);
LABEL_14:

}

unint64_t __79__AKAuthorizationInputPaneViewController__prepareScopeChoices_withLoginChoice___block_invoke(uint64_t a1, void *a2, unint64_t a3, BOOL *a4)
{
  unint64_t result;

  if (objc_msgSend(a2, "isAppleIDAuthorization"))
    objc_msgSend(*(id *)(a1 + 32), "setIndexOfChosenLogin:", objc_msgSend(*(id *)(a1 + 32), "indexOfChosenLogin") - 1);
  result = objc_msgSend(*(id *)(a1 + 32), "indexOfChosenLogin");
  *a4 = result <= a3;
  return result;
}

- (void)_updateAnalyticsReport
{
  AKCATiburonInputUIReporter *analyticsReport;
  id v4;

  -[AKCATiburonInputUIReporter didSelectAppleID:](self->_analyticsReport, "didSelectAppleID:", 1);
  analyticsReport = self->_analyticsReport;
  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKCATiburonInputUIReporter didSelectAnonymousEmail:](analyticsReport, "didSelectAnonymousEmail:", objc_msgSend(v4, "wantsPrivateEmail"));

}

- (void)subPaneConfirmButtonDidEnterProcessingState:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id buf[2];

  v4 = a3;
  _AKLogSiwa();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Finished biometric authentication successfully.", (uint8_t *)buf, 2u);
  }

  if (-[AKAuthorizationInputPaneViewController _shouldAllowAuthorization](self, "_shouldAllowAuthorization"))
  {
    -[AKAuthorizationInputPaneViewController _setCancelButtonEnabled:](self, "_setCancelButtonEnabled:", 0);
    -[AKAuthorizationInputPaneViewController _updateDataSourceWithValidEditingName](self, "_updateDataSourceWithValidEditingName");
    objc_initWeak(buf, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__AKAuthorizationInputPaneViewController_subPaneConfirmButtonDidEnterProcessingState___block_invoke;
    v11[3] = &unk_1E76793D0;
    objc_copyWeak(&v13, buf);
    v12 = v4;
    -[AKAuthorizationInputPaneViewController _performAuthorizationWithRawPassword:completionHandler:](self, "_performAuthorizationWithRawPassword:completionHandler:", 0, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  else
  {
    v6 = -[AKAuthorizationInputPaneViewController _shouldPresentCreateFlow](self, "_shouldPresentCreateFlow");
    _AKLogSiwa();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1BD795000, v7, OS_LOG_TYPE_DEFAULT, "Selection does not satisfy scopes. Providing instructions for user.", (uint8_t *)buf, 2u);
      }
      v9 = -7081;
    }
    else
    {
      if (v8)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1BD795000, v7, OS_LOG_TYPE_DEFAULT, "No choice selection from user. Providing instructions for user.", (uint8_t *)buf, 2u);
      }
      v9 = -7082;
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateProcessingState");
    -[AKAuthorizationInputPaneViewController _handleAuthorizationError:](self, "_handleAuthorizationError:", v10);

  }
}

void __86__AKAuthorizationInputPaneViewController_subPaneConfirmButtonDidEnterProcessingState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id *v10;
  id *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v5)
  {
    v9 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __86__AKAuthorizationInputPaneViewController_subPaneConfirmButtonDidEnterProcessingState___block_invoke_2;
    v18[3] = &unk_1E7678D18;
    v10 = &v19;
    v19 = WeakRetained;
    v11 = &v20;
    v20 = v5;
    v12 = v8;
    objc_msgSend(v9, "finishProcessingWithCompletionHandler:", v18);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__AKAuthorizationInputPaneViewController_subPaneConfirmButtonDidEnterProcessingState___block_invoke_3;
    block[3] = &unk_1E7678CC8;
    v10 = &v15;
    v11 = &v16;
    v15 = *(id *)(a1 + 32);
    v16 = v8;
    v17 = v6;
    v13 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __86__AKAuthorizationInputPaneViewController_subPaneConfirmButtonDidEnterProcessingState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __86__AKAuthorizationInputPaneViewController_subPaneConfirmButtonDidEnterProcessingState___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateProcessingState");
  objc_msgSend(*(id *)(a1 + 40), "_setCancelButtonEnabled:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "_handleAuthorizationError:", *(_QWORD *)(a1 + 48));
}

- (void)subpaneConfirmButtonDidFailBiometry:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _AKLogSiwa();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Finished biometric authentication with failure.", v4, 2u);
  }

}

- (void)performPasswordAuthentication
{
  void *v3;
  id v4;

  -[AKAuthorizationInputPaneViewController _selectedLoginChoice](self, "_selectedLoginChoice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isAppleIDAuthorization") & 1) == 0)
    -[AKAuthorizationInputPaneViewController _performAuthorizationWithRawPassword:](self, "_performAuthorizationWithRawPassword:", 0);
  else
    -[AKAuthorizationInputPaneViewController _performPasswordAuthentication](self, "_performPasswordAuthentication");

}

- (void)performAuthorization
{
  -[AKAuthorizationInputPaneViewController _performAuthorizationWithRawPassword:](self, "_performAuthorizationWithRawPassword:", 0);
}

- (void)subPaneConfirmButtonPerformExternalAuthentication:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _AKLogSiwa();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "AKAuthorizationInputPaneViewController: Did continue -  User requested authorization with scope choices: %@", buf, 0xCu);

  }
  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _selectedLoginChoice](self, "_selectedLoginChoice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationInputPaneViewController _prepareScopeChoices:withLoginChoice:](self, "_prepareScopeChoices:withLoginChoice:", v6, v7);

  -[AKAuthorizationInputPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__AKAuthorizationInputPaneViewController_subPaneConfirmButtonPerformExternalAuthentication___block_invoke;
  v10[3] = &unk_1E7678D40;
  v10[4] = self;
  -[AKAuthorizationInputPaneViewController _paneDelegate_didRequestAuthorizationWithUserProvidedInformation:completion:](self, "_paneDelegate_didRequestAuthorizationWithUserProvidedInformation:completion:", v9, v10);

}

void __92__AKAuthorizationInputPaneViewController_subPaneConfirmButtonPerformExternalAuthentication___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__AKAuthorizationInputPaneViewController_subPaneConfirmButtonPerformExternalAuthentication___block_invoke_2;
    block[3] = &unk_1E7678D18;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __92__AKAuthorizationInputPaneViewController_subPaneConfirmButtonPerformExternalAuthentication___block_invoke_3;
    v6[3] = &unk_1E76789A0;
    v6[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }

}

uint64_t __92__AKAuthorizationInputPaneViewController_subPaneConfirmButtonPerformExternalAuthentication___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthorizationError:", *(_QWORD *)(a1 + 40));
}

uint64_t __92__AKAuthorizationInputPaneViewController_subPaneConfirmButtonPerformExternalAuthentication___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:", 0, 0);
}

- (BOOL)validateReadyForAuthorization
{
  BOOL v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[AKAuthorizationInputPaneViewController _shouldAllowAuthorization](self, "_shouldAllowAuthorization");
  if (v3)
  {
    -[AKAuthorizationInputPaneViewController _updateDataSourceWithValidEditingName](self, "_updateDataSourceWithValidEditingName");
  }
  else
  {
    _AKLogSiwa();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AKAuthorizationInputPaneViewController validateReadyForAuthorization].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return v3;
}

- (void)subPaneConfirmButtonPerformAccountCreation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AKAuthorizationInputPaneViewController authorizationViewController](self, "authorizationViewController", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D00168];
  -[AKAuthorizationInputPaneViewController presentationContext](self, "presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationContextForCreateAppleIDFlow:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "credentialRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPasswordRequest:", 0);

  objc_msgSend(v8, "setPresentationContext:", v6);
  objc_msgSend(v8, "presentInputPaneViewController");

}

- (void)passwordAuthenticationCompletedWithResults:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    _AKLogSiwa();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AKAuthorizationInputPaneViewController passwordAuthenticationCompletedWithResults:error:].cold.2();

  }
  else
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKAuthorizationInputPaneViewController passwordAuthenticationCompletedWithResults:error:].cold.1();

    -[AKAuthorizationInputPaneViewController _performAuthorizationWithRawPassword:](self, "_performAuthorizationWithRawPassword:", 0);
  }

}

- (void)_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[AKAuthorizationPaneViewController paneDelegate](self, "paneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "authorizationPaneViewController:dismissWithAuthorization:error:", self, v8, v6);

}

- (void)_paneDelegate_didRequestAuthorizationWithUserProvidedInformation:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[AKAuthorizationPaneViewController paneDelegate](self, "paneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "authorizationPaneViewController:didRequestAuthorizationWithUserProvidedInformation:completion:", self, v8, v6);

}

- (AKAuthorizationScopeChoices)editableScopeChoices
{
  return self->_editableScopeChoices;
}

- (BOOL)editableScopeChoicesChanged
{
  return self->_editableScopeChoicesChanged;
}

- (void)setEditableScopeChoicesChanged:(BOOL)a3
{
  self->_editableScopeChoicesChanged = a3;
}

- (AKAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (AKAuthorizationViewController)authorizationViewController
{
  return (AKAuthorizationViewController *)objc_loadWeakRetained((id *)&self->_authorizationViewController);
}

- (void)setAuthorizationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_authorizationViewController, a3);
}

- (AKUserInformation)editingUserInformation
{
  return self->_editingUserInformation;
}

- (void)setEditingUserInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (AKAuthorizationSubPaneImage)imageSubPane
{
  return self->_imageSubPane;
}

- (void)setImageSubPane:(id)a3
{
  objc_storeStrong((id *)&self->_imageSubPane, a3);
}

- (AKAuthorizationSubPaneConfirmButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (UIBarButtonItem)savedLeftBarButtonItem
{
  return self->_savedLeftBarButtonItem;
}

- (void)setSavedLeftBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_savedLeftBarButtonItem, a3);
}

- (UIBarButtonItem)savedRightBarButtonItem
{
  return self->_savedRightBarButtonItem;
}

- (void)setSavedRightBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_savedRightBarButtonItem, a3);
}

- (AKAuthorizationNameFormatter)nameFormatter
{
  return self->_nameFormatter;
}

- (void)setNameFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_nameFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameFormatter, 0);
  objc_storeStrong((id *)&self->_savedRightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_savedLeftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_imageSubPane, 0);
  objc_storeStrong((id *)&self->_editingUserInformation, 0);
  objc_destroyWeak((id *)&self->_authorizationViewController);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_editableScopeChoices, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_analyticsReport, 0);
  objc_storeStrong((id *)&self->_validatedScopes, 0);
}

- (void)_localizedAuthorizationString
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1BD795000, v0, v1, "Account/application information is missing, showing default text in %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "row");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD795000, a2, v3, "Setting login choice to cell at index %lu", v4);
  OUTLINED_FUNCTION_11();
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(void *)a2 .cold.2(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "row");
  objc_msgSend(a2, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loginChoices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");
  OUTLINED_FUNCTION_0_0(&dword_1BD795000, v5, v6, "Row %ld selected from %ld available login choices.", v7, v8, v9, v10, 0);

  OUTLINED_FUNCTION_1_0();
}

- (void)textFieldShouldReturn:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "returnKeyType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_1BD795000, a2, v4, "Text field of unexpected return key type %@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)_cellForScope:localRow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1BD795000, v0, v1, "Unknown scope: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_editingNameCellForRow:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_1BD795000, a2, v4, "_setupCell unknown row %@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)_loginChoiceCellForRow:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "presentationContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loginChoices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  OUTLINED_FUNCTION_0_0(&dword_1BD795000, v3, v4, "Cell row %ld >= %ld choices available.", v5, v6, v7, v8, 0);

  OUTLINED_FUNCTION_1_0();
}

- (void)_selectScope:localRow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1BD795000, v0, v1, "Unknown scope selected %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_selectSingleEmailAtIndex:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "editableScopeChoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "emailCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1BD795000, v6, v7, "Select email at index %@ beyond count %@.", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_computeNameEditHeightChange
{
  OUTLINED_FUNCTION_1(&dword_1BD795000, a1, a3, "Unexpected device idiom.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_prepareScopeChoices:(uint64_t)a3 withLoginChoice:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1BD795000, a1, a3, "No authorization request present on credential request context.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)validateReadyForAuthorization
{
  OUTLINED_FUNCTION_1(&dword_1BD795000, a1, a3, "Authorization button should have been disabled but was not", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)passwordAuthenticationCompletedWithResults:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD795000, v0, v1, "Password authenticate result: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)passwordAuthenticationCompletedWithResults:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1BD795000, v0, v1, "Error during password authentication %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
