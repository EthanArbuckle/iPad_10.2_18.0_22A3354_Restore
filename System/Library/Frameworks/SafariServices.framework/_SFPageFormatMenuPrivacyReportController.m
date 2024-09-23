@implementation _SFPageFormatMenuPrivacyReportController

- (_SFPageFormatMenuPrivacyReportController)initWithDocument:(id)a3
{
  id v5;
  _SFPageFormatMenuPrivacyReportController *v6;
  _SFPageFormatMenuPrivacyReportController *v7;
  _SFPageFormatMenuPrivacyReportController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPageFormatMenuPrivacyReportController;
  v6 = -[_SFPageFormatMenuPrivacyReportController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_document, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  char v3;
  MCProfileConnection *profileConnection;
  objc_super v5;

  v3 = objc_opt_respondsToSelector();
  profileConnection = self->_profileConnection;
  if ((v3 & 1) != 0)
    -[MCProfileConnection unregisterObserver:](profileConnection, "unregisterObserver:", self);
  else
    -[MCProfileConnection removeObserver:](profileConnection, "removeObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)_SFPageFormatMenuPrivacyReportController;
  -[_SFPageFormatMenuPrivacyReportController dealloc](&v5, sel_dealloc);
}

- (_SFSettingsAlertItem)alertItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("shield.lefthalf.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53___SFPageFormatMenuPrivacyReportController_alertItem__block_invoke;
  v21[3] = &unk_1E4AC05B8;
  v21[4] = self;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v3, v4, v5, 25, v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("ShowPrivacyReport"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_SFBrowserDocument trackerInfo](self->_document, "trackerInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[SFBrowserDocumentTrackerInfo trackingPreventionEnabled](SFBrowserDocumentTrackerInfo, "trackingPreventionEnabled");
    objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isPrivacyProxyOnForEitherTier");

    if ((v9 || (v11 & 1) != 0) && v9)
    {
      objc_msgSend(v7, "setSubtitle:", CFSTR(" "));
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = __53___SFPageFormatMenuPrivacyReportController_alertItem__block_invoke_2;
      v18[3] = &unk_1E4ABFB20;
      v19 = v8;
      v13 = v7;
      v20 = v13;
      objc_msgSend(v19, "updateKnownTrackingThirdPartiesWithCompletionHandler:", v18);
      v14 = v13;

    }
    else
    {
      _WBSLocalizedString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSubtitle:", v15);

      v16 = v7;
    }

  }
  else
  {
    v12 = v7;
  }

  return (_SFSettingsAlertItem *)v7;
}

- (BOOL)_presentPromptToTurnOnTrackingProtection
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  -[_SFPageFormatMenuPrivacyReportController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForPresentationForItemController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84___SFPageFormatMenuPrivacyReportController__presentPromptToTurnOnTrackingProtection__block_invoke;
  v14[3] = &unk_1E4AC05E0;
  v6 = v4;
  v15 = v6;
  +[SFPrivacyReportOnboardingController onboardingViewControllerWithCompletionHandler:](SFPrivacyReportOnboardingController, "onboardingViewControllerWithCompletionHandler:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_storeWeak((id *)&self->_enableTrackerProtectionViewController, v7);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __84___SFPageFormatMenuPrivacyReportController__presentPromptToTurnOnTrackingProtection__block_invoke_2;
    v11[3] = &unk_1E4ABFB20;
    v12 = v6;
    v13 = v8;
    v9 = v8;
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v11);

  }
  return v7 != 0;
}

- (void)_presentPrivacyReport
{
  SFPrivacyReportViewController *v3;
  void *v4;
  SFPrivacyReportViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = [SFPrivacyReportViewController alloc];
  -[_SFBrowserDocument webView](self->_document, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SFPrivacyReportViewController initWithWebView:](v3, "initWithWebView:", v4);

  -[SFPrivacyReportViewController setWebsiteDetailShouldSeparateBlockedTrackers:](v5, "setWebsiteDetailShouldSeparateBlockedTrackers:", -[_SFBrowserDocument privacyReportShouldSeparateBlockedTrackers](self->_document, "privacyReportShouldSeparateBlockedTrackers"));
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_SFBrowserDocument allBrowserHistories](self->_document, "allBrowserHistories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportViewController setHistories:](v5, "setHistories:", v6);

    -[_SFBrowserDocument allBrowserProfileIdentifiers](self->_document, "allBrowserProfileIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportViewController setProfileIdentifiers:](v5, "setProfileIdentifiers:", v7);

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  objc_msgSend(v8, "setModalPresentationStyle:", 1);
  -[_SFPageFormatMenuPrivacyReportController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllerForPresentationForItemController:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65___SFPageFormatMenuPrivacyReportController__presentPrivacyReport__block_invoke;
  v13[3] = &unk_1E4ABFB20;
  v14 = v10;
  v15 = v8;
  v11 = v8;
  v12 = v10;
  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v13);

}

- (void)_initializeManagedProfileConnection
{
  MCProfileConnection *v3;
  MCProfileConnection *profileConnection;
  char v5;
  MCProfileConnection *v6;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (MCProfileConnection *)objc_claimAutoreleasedReturnValue();
  profileConnection = self->_profileConnection;
  self->_profileConnection = v3;

  v5 = objc_opt_respondsToSelector();
  v6 = self->_profileConnection;
  if ((v5 & 1) != 0)
    -[MCProfileConnection registerObserver:](v6, "registerObserver:", self);
  else
    -[MCProfileConnection addObserver:](v6, "addObserver:", self);
}

- (void)_dismissPromptIfTrackerProtectionEnabled
{
  id WeakRetained;

  if (+[SFBrowserDocumentTrackerInfo trackingPreventionEnabled](SFBrowserDocumentTrackerInfo, "trackingPreventionEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_enableTrackerProtectionViewController);
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (_SFPageFormatMenuItemControllerDelegate)delegate
{
  return (_SFPageFormatMenuItemControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_SFBrowserDocument)document
{
  return self->_document;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_enableTrackerProtectionViewController);
  objc_storeStrong((id *)&self->_profileConnection, 0);
}

@end
