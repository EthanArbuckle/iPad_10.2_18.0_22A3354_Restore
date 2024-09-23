@implementation CSStatusTextViewController

- (CSStatusTextViewController)init
{
  CSStatusTextViewController *v2;
  uint64_t v3;
  MCProfileConnection *profileConnection;
  uint64_t v5;
  SBFRemoteBasebandLoggingManager *basebandLoggingManager;
  SBLockScreenDefaults *v7;
  SBLockScreenDefaults *lockScreenDefaults;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSStatusTextViewController;
  v2 = -[CSStatusTextViewController init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    profileConnection = v2->_profileConnection;
    v2->_profileConnection = (MCProfileConnection *)v3;

    objc_msgSend(MEMORY[0x1E0DA9EC0], "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    basebandLoggingManager = v2->_basebandLoggingManager;
    v2->_basebandLoggingManager = (SBFRemoteBasebandLoggingManager *)v5;

    -[SBFRemoteBasebandLoggingManager addObserver:](v2->_basebandLoggingManager, "addObserver:", v2);
    v7 = (SBLockScreenDefaults *)objc_alloc_init(MEMORY[0x1E0DA9FA8]);
    lockScreenDefaults = v2->_lockScreenDefaults;
    v2->_lockScreenDefaults = v7;

    v2->_activationLockNotifyToken = -1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFRemoteBasebandLoggingManager removeObserver:](self->_basebandLoggingManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)CSStatusTextViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v3, sel_dealloc);
}

- (void)setOverrideFooterText:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_overrideFooterText != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_overrideFooterText, a3);
    -[CSStatusTextViewController _updateText](self, "_updateText");
    v5 = v6;
  }

}

- (void)setTribecaText:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_tribecaText != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_tribecaText, a3);
    -[CSStatusTextViewController _updateText](self, "_updateText");
    v5 = v6;
  }

}

- (void)loadView
{
  CSStatusTextView *v3;
  CSStatusTextView *v4;
  CSStatusTextView *view;

  v3 = [CSStatusTextView alloc];
  v4 = -[CSStatusTextView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  view = self->_view;
  self->_view = v4;

  -[CSStatusTextView bs_setHitTestingDisabled:](self->_view, "bs_setHitTestingDisabled:", 1);
  -[CSStatusTextViewController setView:](self, "setView:", self->_view);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  const char *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CSStatusTextViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v15, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__profileStateChangedNotification_, *MEMORY[0x1E0D471E8], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__profileStateChangedNotification_, *MEMORY[0x1E0D46EC0], 0);
  tribeca_supported_text();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (self->_activationLockNotifyToken < 0)
    {
      objc_initWeak(&location, self);
      v6 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D21388], "UTF8String");
      v7 = MEMORY[0x1E0C80D38];
      v8 = MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __45__CSStatusTextViewController_viewWillAppear___block_invoke;
      v12 = &unk_1E8E2F010;
      objc_copyWeak(&v13, &location);
      notify_register_dispatch(v6, &self->_activationLockNotifyToken, v7, &v9);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    -[CSStatusTextViewController _updateTribecaText](self, "_updateTribecaText", v9, v10, v11, v12);
  }
  -[CSStatusTextViewController _updateText](self, "_updateText");

}

void __45__CSStatusTextViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTribecaText");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int activationLockNotifyToken;
  objc_super v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  activationLockNotifyToken = self->_activationLockNotifyToken;
  if ((activationLockNotifyToken & 0x80000000) == 0)
  {
    notify_cancel(activationLockNotifyToken);
    self->_activationLockNotifyToken = -1;
  }
  v7.receiver = self;
  v7.super_class = (Class)CSStatusTextViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (v4)
    -[CSStatusTextViewController _updateText](self, "_updateText");
  v5.receiver = self;
  v5.super_class = (Class)CSStatusTextViewController;
  -[CSStatusTextViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_, v4);

}

- (void)_profileStateChangedNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CSStatusTextViewController__profileStateChangedNotification___block_invoke;
  block[3] = &unk_1E8E2DB38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __63__CSStatusTextViewController__profileStateChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTextForProfiles");
}

- (void)_updateTribecaText
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__CSStatusTextViewController__updateTribecaText__block_invoke;
  v4[3] = &unk_1E8E2F038;
  v4[4] = self;
  objc_msgSend(v3, "fmipStateWithCompletion:", v4);

}

void __48__CSStatusTextViewController__updateTribecaText__block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  _QWORD v8[5];
  __CFString *v9;

  v5 = a3;
  if (!v5)
  {
    if (a2 >= 3)
    {
      tribeca_supported_text();
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1E8E30B28;
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__CSStatusTextViewController__updateTribecaText__block_invoke_2;
    v8[3] = &unk_1E8E2DC00;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v7 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __48__CSStatusTextViewController__updateTribecaText__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTribecaText:", *(_QWORD *)(a1 + 40));
}

- (void)_updateText
{
  CSStatusTextView *view;
  id WeakRetained;
  _QWORD v5[5];

  if (-[CSStatusTextViewController isViewLoaded](self, "isViewLoaded"))
  {
    view = self->_view;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__CSStatusTextViewController__updateText__block_invoke;
    v5[3] = &unk_1E8E2DB38;
    v5[4] = self;
    -[CSStatusTextView updateTextsWithBlock:](view, "updateTextsWithBlock:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "coverSheetStatusTextViewControllerContentDidChange:", self);

  }
}

uint64_t __41__CSStatusTextViewController__updateText__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateTextForProfiles");
  return objc_msgSend(*(id *)(a1 + 32), "_updateTextForLegal");
}

- (void)_updateTextForProfiles
{
  CSStatusTextView *view;
  _QWORD v3[5];

  view = self->_view;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__CSStatusTextViewController__updateTextForProfiles__block_invoke;
  v3[3] = &unk_1E8E2DB38;
  v3[4] = self;
  -[CSStatusTextView updateTextsWithBlock:](view, "updateTextsWithBlock:", v3);
}

uint64_t __52__CSStatusTextViewController__updateTextForProfiles__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateTextForDeviceInformation");
  objc_msgSend(*(id *)(a1 + 32), "_updateTextForSupervision");
  return objc_msgSend(*(id *)(a1 + 32), "_updateTextForProvisionalEnrollment");
}

- (void)_updateTextForDeviceInformation
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (ct_green_tea_logging_enabled())
    objc_msgSend(v5, "addObject:", CFSTR("Regulatory Logging Enabled"));
  if (-[NSString length](self->_tribecaText, "length"))
    objc_msgSend(v5, "addObject:", self->_tribecaText);
  if (-[SBFRemoteBasebandLoggingManager isLogCollectionEnabled](self->_basebandLoggingManager, "isLogCollectionEnabled"))objc_msgSend(v5, "addObject:", *MEMORY[0x1E0DAA1B0]);
  if (-[NSString length](self->_overrideFooterText, "length"))
  {
    objc_msgSend(v5, "addObject:", self->_overrideFooterText);
  }
  else
  {
    -[MCProfileConnection deviceLockScreenFootnote](self->_profileConnection, "deviceLockScreenFootnote");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileConnection deviceAssetTag](self->_profileConnection, "deviceAssetTag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      objc_msgSend(v5, "addObject:", v3);
    if (objc_msgSend(v4, "length"))
      objc_msgSend(v5, "addObject:", v4);

  }
  -[CSStatusTextView setDeviceInformationText:](self->_view, "setDeviceInformationText:", v5);

}

- (void)_updateTextForSupervision
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  if (-[SBLockScreenDefaults showSupervisionText](self->_lockScreenDefaults, "showSupervisionText")
    && -[MCProfileConnection isSupervised](self->_profileConnection, "isSupervised"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileConnection cloudConfigurationDetails](self->_profileConnection, "cloudConfigurationDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D47270]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("LOCK_SCREEN_SUPERVISION_NOTICE_WITH_ORGNAME"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", v7, &stru_1E8E30B28, CFSTR("CoverSheet"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v8, v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("LOCK_SCREEN_SUPERVISION_NOTICE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", v7, &stru_1E8E30B28, CFSTR("CoverSheet"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }

    v9 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = v9;
  -[CSStatusTextView setSupervisionText:](self->_view, "setSupervisionText:", v9);

}

- (void)_updateTextForProvisionalEnrollment
{
  CSStatusTextView *view;
  id v3;

  view = self->_view;
  -[MCProfileConnection deviceProvisionalEnrollmentFootnote](self->_profileConnection, "deviceProvisionalEnrollmentFootnote");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CSStatusTextView setProvisionalEnrollmentText:](view, "setProvisionalEnrollmentText:", v3);

}

- (void)_updateTextForLegal
{
  CSStatusTextView *view;
  id v4;

  if (-[CSStatusTextViewController _isSecurityResearchDevice](self, "_isSecurityResearchDevice")
    || os_variant_has_internal_content()
    && -[SBLockScreenDefaults showLegalText](self->_lockScreenDefaults, "showLegalText"))
  {
    view = self->_view;
    -[CSStatusTextViewController _legalString](self, "_legalString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CSStatusTextView setInternalLegalText:](view, "setInternalLegalText:", v4);

  }
  else
  {
    -[CSStatusTextView setInternalLegalText:](self->_view, "setInternalLegalText:", 0);
  }
}

- (BOOL)_isSecurityResearchDevice
{
  return MGGetBoolAnswer();
}

- (id)_legalString
{
  const __CFString *v3;
  void *v4;
  void *v5;

  if (-[CSStatusTextViewController _isSecurityResearchDevice](self, "_isSecurityResearchDevice"))
    v3 = CFSTR("Security Research Device");
  else
    v3 = CFSTR("Confidential & Proprietary");
  -[CSStatusTextViewController _legalContact](self, "_legalContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@ %@"), v3, CFSTR("Call"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_legalContact
{
  if (_legalContact_onceToken != -1)
    dispatch_once(&_legalContact_onceToken, &__block_literal_global_8);
  return (id)_legalContact_sLegalContact;
}

void __43__CSStatusTextViewController__legalContact__block_invoke()
{
  const __CFString *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = CFSTR("+1 855-499-6467");
  v1 = MGGetProductType();
  if (v1 <= 2032616840)
  {
    if (v1 > 1234705394)
    {
      if (v1 == 1234705395 || v1 == 1353145733)
        goto LABEL_20;
      v2 = 2001966017;
    }
    else
    {
      if (v1 == -1 || v1 == 341800273)
        goto LABEL_20;
      v2 = 910181310;
    }
  }
  else if (v1 <= 3196158496)
  {
    if (v1 == 2032616841 || v1 == 2236272848)
      goto LABEL_20;
    v2 = 2458172802;
  }
  else if (v1 > 3743999267)
  {
    if (v1 == 3743999268)
      goto LABEL_20;
    v2 = 3801472101;
  }
  else
  {
    if (v1 == 3196158497)
      goto LABEL_20;
    v2 = 3636345305;
  }
  if (v1 != v2)
    v0 = CFSTR("+1 877-595-1125");
LABEL_20:
  v3 = (void *)_legalContact_sLegalContact;
  _legalContact_sLegalContact = (uint64_t)v0;

}

- (NSString)overrideFooterText
{
  return self->_overrideFooterText;
}

- (CSStatusTextViewControllerDelegate)delegate
{
  return (CSStatusTextViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_basebandLoggingManager, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_tribecaText, 0);
  objc_storeStrong((id *)&self->_overrideFooterText, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
