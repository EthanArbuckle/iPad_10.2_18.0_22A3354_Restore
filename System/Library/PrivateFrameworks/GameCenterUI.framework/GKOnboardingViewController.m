@implementation GKOnboardingViewController

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)GKOnboardingViewController;
  -[GKOnboardingViewController viewDidLoad](&v30, sel_viewDidLoad);
  -[GKOnboardingViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController setNextButton:](self, "setNextButton:", v4);

  -[GKOnboardingViewController nextButton](self, "nextButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIgnoresInvertColors:", 1);

  -[GKOnboardingViewController nextButton](self, "nextButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.Onboarding.WhatsNew.primaryButton"));

  -[GKOnboardingViewController nextButton](self, "nextButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_nextPressed_, 0x2000);

  -[GKOnboardingViewController nextButton](self, "nextButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);

  -[GKOnboardingViewController buttonContainer](self, "buttonContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController nextButton](self, "nextButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)MEMORY[0x1E0CB3718];
  -[GKOnboardingViewController nextButton](self, "nextButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController buttonContainer](self, "buttonContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v12, v13);

  -[GKOnboardingViewController bubbleImageView](self, "bubbleImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityIgnoresInvertColors:", 1);

  -[GKOnboardingViewController bubbleImageView](self, "bubbleImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.Onboarding.WhatsNew.onboardingIcon"));

  -[GKOnboardingViewController configureWhatsNewList](self, "configureWhatsNewList");
  -[GKOnboardingViewController addPrivacyLink](self, "addPrivacyLink");
  GKGameCenterUIFrameworkBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController mainTitle](self, "mainTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v17);

  -[GKOnboardingViewController mainTitle](self, "mainTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.Onboarding.WhatsNew.title"));

  objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4AE8], 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController mainTitle](self, "mainTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v20);

  -[GKOnboardingViewController subTitle](self, "subTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", &stru_1E59EB978);

  v23 = objc_alloc(MEMORY[0x1E0DC3990]);
  v24 = (void *)objc_msgSend(v23, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v25);

  objc_msgSend(v24, "setTextAlignment:", 1);
  -[GKOnboardingViewController mainTitle](self, "mainTitle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "text");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v27);

  objc_msgSend(v24, "setAlpha:", 0.0);
  objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B60], 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFont:", v28);

  objc_msgSend(v24, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v24, "setMinimumScaleFactor:", 0.2);
  -[GKOnboardingViewController navigationItem](self, "navigationItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTitleView:", v24);

  -[GKOnboardingViewController setNavigationTitleLabel:](self, "setNavigationTitleLabel:", v24);
  -[GKOnboardingViewController setupNavigationBar](self, "setupNavigationBar");
  -[GKOnboardingViewController updateUIBasedOnTraitCollection](self, "updateUIBasedOnTraitCollection");

}

- (void)configureWhatsNewList
{
  void *v3;
  void *v4;
  GKOnboardingWhatsNewListCell *v5;
  void *v6;
  GKOnboardingWhatsNewListCell *v7;
  void *v8;
  GKOnboardingWhatsNewListCell *v9;

  v9 = -[GKOnboardingWhatsNewListCell initWithType:]([GKOnboardingWhatsNewListCell alloc], "initWithType:", 3);
  -[GKOnboardingViewController whatsNewStackView](self, "whatsNewStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addArrangedSubview:", v9);

  -[GKOnboardingViewController whatsNewStackView](self, "whatsNewStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.Onboarding.WhatsNew.content"));

  v5 = -[GKOnboardingWhatsNewListCell initWithType:]([GKOnboardingWhatsNewListCell alloc], "initWithType:", 5);
  -[GKOnboardingViewController whatsNewStackView](self, "whatsNewStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addArrangedSubview:", v5);

  v7 = -[GKOnboardingWhatsNewListCell initWithType:]([GKOnboardingWhatsNewListCell alloc], "initWithType:", 4);
  -[GKOnboardingViewController whatsNewStackView](self, "whatsNewStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addArrangedSubview:", v7);

}

- (void)addPrivacyLink
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
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(MEMORY[0x1E0D65190], "linkWithBundleIdentifier:", *MEMORY[0x1E0D651E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController setPrivacyLink:](self, "setPrivacyLink:", v3);

  objc_msgSend(MEMORY[0x1E0CB34D0], "_gkPreferredSystemLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController privacyLink](self, "privacyLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayLanguage:", v4);

  -[GKOnboardingViewController privacyLink](self, "privacyLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController addChildViewController:](self, "addChildViewController:", v6);

  -[GKOnboardingViewController privacyContainer](self, "privacyContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController privacyLink](self, "privacyLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v9);

  -[GKOnboardingViewController privacyLink](self, "privacyLink");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKOnboardingViewController privacyLink](self, "privacyLink");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDisplayLargeIcon:", 0);

  v13 = (void *)MEMORY[0x1E0CB3718];
  -[GKOnboardingViewController privacyLink](self, "privacyLink");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController privacyContainer](self, "privacyContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v15, v16);

  -[GKOnboardingViewController privacyLink](self, "privacyLink");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setModalPresentationStyle:", 2);

  -[GKOnboardingViewController privacyLink](self, "privacyLink");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "didMoveToParentViewController:", self);

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v19, "hasAcknowledgedLatestGDPR");

  if ((_DWORD)v14)
  {
    -[GKOnboardingViewController privacyContainer](self, "privacyContainer");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", 1);

  }
}

- (void)constrainTextInView:(id)a3 toFontSize:(double)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v6;
    objc_msgSend(v7, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pointSize");
    v10 = v9;

    if (v10 > a4)
    {
      objc_msgSend(v7, "font");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fontWithSize:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFont:", v12);

    }
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v6, "subviews", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          -[GKOnboardingViewController constrainTextInView:toFontSize:](self, "constrainTextInView:toFontSize:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), a4);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v15);
    }

  }
}

- (void)signOutPressed:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0D25238], "reporter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("dismiss"), CFSTR("signOut"), CFSTR("button"), CFSTR("whatsNew"), CFSTR("onboarding"));

  -[GKOnboardingViewController showSignOutAlert](self, "showSignOutAlert");
}

- (void)notNowPressed:(id)a3
{
  void *v3;
  id v4;

  +[GKOnboardingController shared](GKOnboardingController, "shared", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onboardingFlowFinishedWithAction:", 5);

}

- (void)nextPressed:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
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
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;

  objc_msgSend(MEMORY[0x1E0D25238], "reporter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), CFSTR("continue"), CFSTR("button"), CFSTR("whatsNew"), CFSTR("onboarding"));

  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountServicePrivate");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:", 3);

  -[GKOnboardingViewController privacyContainer](self, "privacyContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v7, "isHidden");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountServicePrivate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKOnboardingViewController privacyLink](self, "privacyLink");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "flow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:", objc_msgSend(v11, "contentVersion"));

    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "profileServicePrivate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKOnboardingViewController privacyLink](self, "privacyLink");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "flow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPrivacyNoticeVersion:withCompletionHandler:", objc_msgSend(v15, "contentVersion"), &__block_literal_global_0);

    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D25168]);

  }
  -[GKOnboardingViewController navigationController](self, "navigationController");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldShowPersonalizationScreen");

  if (v18)
  {
    +[GKOnboardingController shared](GKOnboardingController, "shared");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "presentPersonalizationScreen:", v26);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25330], "local");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "shouldShowProfilePrivacyScreen");

    if (v21)
    {
      +[GKOnboardingController shared](GKOnboardingController, "shared");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentProfilePrivacyScreen:", v26);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D25330], "local");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "shouldShowContactsIntegrationConsentScreen");

      +[GKOnboardingController shared](GKOnboardingController, "shared");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v24;
      if (v23)
      {
        objc_msgSend(v24, "presentContactsIntegrationConsentScreen:", v26);
      }
      else
      {
        objc_msgSend(v24, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "onboardingFlowFinishedWithAction:", 3);

      }
    }
  }

}

- (void)showSignOutAlert
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
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
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = v4 == 1;
  v6 = (void *)MEMORY[0x1E0DC3450];
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v10, v5);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 2, &__block_literal_global_114);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 1, &__block_literal_global_119);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v18);

  -[GKOnboardingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);
}

void __46__GKOnboardingViewController_showSignOutAlert__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "signOutWithCompletionHandler:", &__block_literal_global_115);

}

void __46__GKOnboardingViewController_showSignOutAlert__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  if (v2)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __46__GKOnboardingViewController_showSignOutAlert__block_invoke_2_cold_1((uint64_t)v2, v4);
  }
  else
  {
    +[GKOnboardingController shared](GKOnboardingController, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[GKOnboardingController shared](GKOnboardingController, "shared");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "onboardingFlowFinishedWithAction:", 4);

    }
  }

}

void __46__GKOnboardingViewController_showSignOutAlert__block_invoke_118()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D251A0]);

}

- (void)setupNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  -[GKOnboardingViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNavigationBarHidden:", 0);

  -[GKOnboardingViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeNavigationBarBackgroundTranslucent");

  -[GKOnboardingViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarTintColor:", v7);

  v8 = (void *)objc_opt_new();
  -[GKOnboardingViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowImage:", v8);

  if (-[GKOnboardingViewController allowSignOut](self, "allowSignOut"))
  {
    v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 2, self, sel_signOutPressed_);
    -[GKOnboardingViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLeftBarButtonItem:", v14);

    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isAccountModificationRestricted") ^ 1;
    -[GKOnboardingViewController navigationItem](self, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leftBarButtonItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEnabled:", v17);

    -[GKOnboardingViewController navigationItem](self, "navigationItem");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidesBackButton:", 1);

  }
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKOnboardingViewController;
  -[GKOnboardingViewController viewSafeAreaInsetsDidChange](&v4, sel_viewSafeAreaInsetsDidChange);
  -[GKOnboardingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKOnboardingViewController;
  -[GKOnboardingViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[GKOnboardingViewController nextButton](self, "nextButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", v6, 0);

  -[GKOnboardingViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollRectToVisible:animated:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKOnboardingViewController;
  -[GKOnboardingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordPageWithID:pageContext:pageType:", CFSTR("whatsNew"), CFSTR("NA"), CFSTR("onboarding"));

}

- (void)secondaryButtonPressed:(id)a3
{
  id v4;

  v4 = a3;
  if (-[GKOnboardingViewController allowSignOut](self, "allowSignOut"))
    -[GKOnboardingViewController signOutPressed:](self, "signOutPressed:", v4);
  else
    -[GKOnboardingViewController notNowPressed:](self, "notNowPressed:", v4);

}

- (BOOL)allowSignOut
{
  void *v2;
  char v3;

  -[GKOnboardingViewController privacyContainer](self, "privacyContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)updateUIBasedOnTraitCollection
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _BOOL8 v37;
  void *v38;
  id v39;

  -[GKOnboardingViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  -[GKOnboardingViewController privacyLink](self, "privacyLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IsAccessibilityCategory)
  {
    -[GKOnboardingViewController privacyContainerInScrollView](self, "privacyContainerInScrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKOnboardingViewController reparentView:toSuperview:](self, "reparentView:toSuperview:", v7, v8);

    -[GKOnboardingViewController nextButton](self, "nextButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKOnboardingViewController continueButtonContainerInScrollView](self, "continueButtonContainerInScrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKOnboardingViewController reparentView:toSuperview:](self, "reparentView:toSuperview:", v9, v10);

    -[GKOnboardingViewController mainTitle](self, "mainTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", 4);

    -[GKOnboardingViewController subTitle](self, "subTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextAlignment:", 4);

    -[GKOnboardingViewController bottomStackViewTopConstraint](self, "bottomStackViewTopConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstant:", 0.0);

    -[GKOnboardingViewController bottomContainerView](self, "bottomContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 1);

    -[GKOnboardingViewController scrollViewToBottomContainerConstraint](self, "scrollViewToBottomContainerConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 0;
    goto LABEL_9;
  }
  -[GKOnboardingViewController privacyContainer](self, "privacyContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController reparentView:toSuperview:](self, "reparentView:toSuperview:", v7, v18);

  -[GKOnboardingViewController nextButton](self, "nextButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController buttonContainer](self, "buttonContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController reparentView:toSuperview:](self, "reparentView:toSuperview:", v19, v20);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  if (v22 == 1)
  {
    -[GKOnboardingViewController mainTitle](self, "mainTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
LABEL_7:
    objc_msgSend(v23, "setTextAlignment:", 1);

    -[GKOnboardingViewController subTitle](self, "subTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = 1;
    goto LABEL_8;
  }
  -[GKOnboardingViewController traitCollection](self, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "verticalSizeClass");

  -[GKOnboardingViewController mainTitle](self, "mainTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v26 != 1)
    goto LABEL_7;
  objc_msgSend(v23, "setTextAlignment:", 4);

  -[GKOnboardingViewController subTitle](self, "subTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  v29 = 4;
LABEL_8:
  objc_msgSend(v27, "setTextAlignment:", v29);

  -[GKOnboardingViewController bottomStackViewTopConstraint](self, "bottomStackViewTopConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setConstant:", 16.0);

  -[GKOnboardingViewController bottomContainerView](self, "bottomContainerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setHidden:", 0);

  -[GKOnboardingViewController scrollViewToBottomContainerConstraint](self, "scrollViewToBottomContainerConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = 1;
LABEL_9:
  objc_msgSend(v15, "setActive:", v17);

  -[GKOnboardingViewController scrollViewToBottomContainerConstraint](self, "scrollViewToBottomContainerConstraint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isActive") ^ 1;
  -[GKOnboardingViewController scrollViewToBottomSafeAreaConstraint](self, "scrollViewToBottomSafeAreaConstraint");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", v33);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "userInterfaceIdiom");

  if (v36 != 1)
  {
    -[GKOnboardingViewController traitCollection](self, "traitCollection");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v39, "verticalSizeClass") == 1;
    -[GKOnboardingViewController subTitle](self, "subTitle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setHidden:", v37);

  }
}

- (void)reparentView:(id)a3 toSuperview:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v16, "superview");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    objc_msgSend(v16, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeFromSuperview");
    objc_msgSend(v6, "setHidden:", 0);
    objc_msgSend(v6, "addSubview:", v16);
    objc_msgSend(MEMORY[0x1E0CB3718], "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v16, v6);
    objc_msgSend(v8, "setHidden:", 1);
    -[GKOnboardingViewController privacyLink](self, "privacyLink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v16)
    {
      -[GKOnboardingViewController privacyContainerInScrollView](self, "privacyContainerInScrollView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v12 != v6;
      -[GKOnboardingViewController privacyContainerInScrollViewHeightConstraint](self, "privacyContainerInScrollViewHeightConstraint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[GKOnboardingViewController nextButton](self, "nextButton");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 != v16)
      {
LABEL_7:

        goto LABEL_8;
      }
      -[GKOnboardingViewController continueButtonContainerInScrollView](self, "continueButtonContainerInScrollView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v12 != v6;
      -[GKOnboardingViewController continueButtonContainerInScrollViewHeightConstraint](self, "continueButtonContainerInScrollViewHeightConstraint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    objc_msgSend(v14, "setActive:", v13);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)reparentGDPRToNewParent:(id)a3
{
  void *v4;
  void *v5;
  id v6;
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
  id v17;
  void *v18;
  id v19;

  v19 = a3;
  -[GKOnboardingViewController privacyLink](self, "privacyLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v19)
  {
    -[GKOnboardingViewController privacyLink](self, "privacyLink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKOnboardingViewController privacyLink](self, "privacyLink");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    objc_msgSend(v19, "setHidden:", 0);
    -[GKOnboardingViewController privacyLink](self, "privacyLink");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v13);

    v14 = (void *)MEMORY[0x1E0CB3718];
    -[GKOnboardingViewController privacyLink](self, "privacyLink");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v16, v19);

    objc_msgSend(v9, "setHidden:", 1);
    -[GKOnboardingViewController privacyContainerInScrollView](self, "privacyContainerInScrollView");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[GKOnboardingViewController privacyContainerInScrollViewHeightConstraint](self, "privacyContainerInScrollViewHeightConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", v17 != v19);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKOnboardingViewController;
  -[GKOnboardingViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[GKOnboardingViewController updateUIBasedOnTraitCollection](self, "updateUIBasedOnTraitCollection");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  _BOOL4 IsAccessibilityCategory;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  objc_super v83;

  -[GKOnboardingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController bottomContainerView](self, "bottomContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == 1)
  {
    if ((unint64_t)(-[GKOnboardingViewController interfaceOrientation](self, "interfaceOrientation") - 1) <= 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKOnboardingViewController bottomContainerView](self, "bottomContainerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v10);

    }
    -[GKOnboardingViewController welcomeStackView](self, "welcomeStackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSpacing:", 37.0);

    -[GKOnboardingViewController whatsNewStackView](self, "whatsNewStackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSpacing:", 26.0);

    -[GKOnboardingViewController bottomStackViewBottomConstraint](self, "bottomStackViewBottomConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConstant:", 44.0);

    -[GKOnboardingViewController continueButtonContainerWidthConstraint](self, "continueButtonContainerWidthConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[GKOnboardingViewController traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredContentSizeCategory");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

    -[GKOnboardingViewController welcomeStackViewLeadingConstraint](self, "welcomeStackViewLeadingConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (IsAccessibilityCategory)
    {
      objc_msgSend(v19, "setConstant:", 50.0);

      -[GKOnboardingViewController welcomeStackViewLeadingConstraint](self, "welcomeStackViewLeadingConstraint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constant");
      v23 = v22;
      -[GKOnboardingViewController whatsnewStackViewLeadingConstraint](self, "whatsnewStackViewLeadingConstraint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setConstant:", v23);

      -[GKOnboardingViewController welcomeStackViewLeadingConstraint](self, "welcomeStackViewLeadingConstraint");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constant");
      v27 = v26;
      -[GKOnboardingViewController whatsnewStackViewTrailingConstraint](self, "whatsnewStackViewTrailingConstraint");
    }
    else
    {
      objc_msgSend(v19, "setConstant:", 88.0);

      -[GKOnboardingViewController welcomeStackViewLeadingConstraint](self, "welcomeStackViewLeadingConstraint");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constant");
      v27 = v42 + 54.0;
      -[GKOnboardingViewController whatsnewStackViewLeadingConstraint](self, "whatsnewStackViewLeadingConstraint");
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setConstant:", v27);

    -[GKOnboardingViewController welcomeStackViewLeadingConstraint](self, "welcomeStackViewLeadingConstraint");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constant");
    v46 = v45;
    -[GKOnboardingViewController bottomStackViewLeadingConstraint](self, "bottomStackViewLeadingConstraint");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setConstant:", v46);

    -[GKOnboardingViewController bottomStackViewLeadingConstraint](self, "bottomStackViewLeadingConstraint");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constant");
    v50 = v49;
    -[GKOnboardingViewController bottomStackViewTrailingConstraint](self, "bottomStackViewTrailingConstraint");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setConstant:", v50);

    -[GKOnboardingViewController whatsnewStackViewLeadingConstraint](self, "whatsnewStackViewLeadingConstraint");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constant");
    v54 = v53;
    -[GKOnboardingViewController whatsnewStackViewTrailingConstraint](self, "whatsnewStackViewTrailingConstraint");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setConstant:", v54);

    -[GKOnboardingViewController welcomeStackViewLeadingConstraint](self, "welcomeStackViewLeadingConstraint");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constant");
    v58 = v57;
    -[GKOnboardingViewController welcomeStackViewTrailingConstraint](self, "welcomeStackViewTrailingConstraint");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GKOnboardingViewController whatsNewStackView](self, "whatsNewStackView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSpacing:", 26.0);

    -[GKOnboardingViewController bottomStackViewBottomConstraint](self, "bottomStackViewBottomConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setConstant:", 16.0);

    -[GKOnboardingViewController continueButtonContainerWidthConstraint](self, "continueButtonContainerWidthConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 0);

    -[GKOnboardingViewController traitCollection](self, "traitCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "verticalSizeClass");

    if (v32 == 1)
    {
      if (v5 < 667.0)
        v33 = 24.0;
      else
        v33 = 100.0;
      -[GKOnboardingViewController welcomeStackViewLeadingConstraint](self, "welcomeStackViewLeadingConstraint");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setConstant:", v33);

      -[GKOnboardingViewController bottomStackViewLeadingConstraint](self, "bottomStackViewLeadingConstraint");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setConstant:", 16.0);

      -[GKOnboardingViewController bottomStackView](self, "bottomStackView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAxis:", 0);

      -[GKOnboardingViewController bottomStackView](self, "bottomStackView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setSpacing:", 16.0);

      -[GKOnboardingViewController continueButtonEqualWidthPrivacyContainerConstraint](self, "continueButtonEqualWidthPrivacyContainerConstraint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setActive:", 0);

      -[GKOnboardingViewController continueButtonParitalWidthPrivacyContainerConstraint](self, "continueButtonParitalWidthPrivacyContainerConstraint");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      v41 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKOnboardingViewController bottomContainerView](self, "bottomContainerView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setBackgroundColor:", v60);

      -[GKOnboardingViewController welcomeStackViewLeadingConstraint](self, "welcomeStackViewLeadingConstraint");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setConstant:", 24.0);

      -[GKOnboardingViewController bottomStackViewLeadingConstraint](self, "bottomStackViewLeadingConstraint");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setConstant:", 24.0);

      -[GKOnboardingViewController bottomStackView](self, "bottomStackView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setAxis:", 1);

      -[GKOnboardingViewController bottomStackView](self, "bottomStackView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setSpacing:", 8.0);

      -[GKOnboardingViewController continueButtonEqualWidthPrivacyContainerConstraint](self, "continueButtonEqualWidthPrivacyContainerConstraint");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setActive:", 1);

      -[GKOnboardingViewController continueButtonParitalWidthPrivacyContainerConstraint](self, "continueButtonParitalWidthPrivacyContainerConstraint");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      v41 = 0;
    }
    objc_msgSend(v39, "setActive:", v41);

    -[GKOnboardingViewController bottomStackViewLeadingConstraint](self, "bottomStackViewLeadingConstraint");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constant");
    v69 = v68;
    -[GKOnboardingViewController bottomStackViewTrailingConstraint](self, "bottomStackViewTrailingConstraint");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setConstant:", v69);

    -[GKOnboardingViewController welcomeStackViewLeadingConstraint](self, "welcomeStackViewLeadingConstraint");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constant");
    v73 = v72;
    -[GKOnboardingViewController welcomeStackViewTrailingConstraint](self, "welcomeStackViewTrailingConstraint");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setConstant:", v73);

    -[GKOnboardingViewController welcomeStackViewLeadingConstraint](self, "welcomeStackViewLeadingConstraint");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constant");
    v77 = v76;
    -[GKOnboardingViewController whatsnewStackViewLeadingConstraint](self, "whatsnewStackViewLeadingConstraint");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setConstant:", v77);

    -[GKOnboardingViewController welcomeStackViewLeadingConstraint](self, "welcomeStackViewLeadingConstraint");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constant");
    v58 = v79;
    -[GKOnboardingViewController whatsnewStackViewTrailingConstraint](self, "whatsnewStackViewTrailingConstraint");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v80 = v59;
  objc_msgSend(v59, "setConstant:", v58);

  -[GKOnboardingViewController topConstraint](self, "topConstraint");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setConstant:", 14.0);

  v83.receiver = self;
  v83.super_class = (Class)GKOnboardingViewController;
  -[GKOnboardingViewController viewWillLayoutSubviews](&v83, sel_viewWillLayoutSubviews);
  if (-[GKOnboardingViewController isMainTitleVisible](self, "isMainTitleVisible"))
  {
    -[GKOnboardingViewController updateNavigationTitleLabelAlpha](self, "updateNavigationTitleLabelAlpha");
  }
  else
  {
    -[GKOnboardingViewController navigationTitleLabel](self, "navigationTitleLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setAlpha:", 1.0);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  if (-[GKOnboardingViewController isMainTitleVisible](self, "isMainTitleVisible", a3))
    -[GKOnboardingViewController updateNavigationTitleLabelAlpha](self, "updateNavigationTitleLabelAlpha");
}

- (BOOL)isMainTitleVisible
{
  void *v2;
  double v3;
  BOOL v4;

  -[GKOnboardingViewController mainTitle](self, "mainTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3 > 0.0;

  return v4;
}

- (void)updateNavigationTitleLabelAlpha
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  GKOnboardingViewController *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  GKOnboardingViewController *v38;

  -[GKOnboardingViewController welcomeStackView](self, "welcomeStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingViewController mainTitle](self, "mainTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  -[GKOnboardingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertPoint:toView:", v9, v6, v8);
  v11 = v10;

  -[GKOnboardingViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  -[GKOnboardingViewController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "navigationBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v15 + v18;

  v20 = v19 - v11;
  -[GKOnboardingViewController mainTitle](self, "mainTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v22 * 0.5;

  -[GKOnboardingViewController navigationTitleLabel](self, "navigationTitleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "alpha");
  v26 = v25;

  if (v20 <= v23)
  {
    if (v26 != 1.0)
      return;
    v27 = (void *)MEMORY[0x1E0DC3F10];
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __61__GKOnboardingViewController_updateNavigationTitleLabelAlpha__block_invoke_2;
    v32 = &unk_1E59C4148;
    v33 = self;
    v28 = &v29;
  }
  else
  {
    if (v26 != 0.0)
      return;
    v27 = (void *)MEMORY[0x1E0DC3F10];
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __61__GKOnboardingViewController_updateNavigationTitleLabelAlpha__block_invoke;
    v37 = &unk_1E59C4148;
    v38 = self;
    v28 = &v34;
  }
  objc_msgSend(v27, "animateWithDuration:animations:", v28, 0.2, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38);
}

void __61__GKOnboardingViewController_updateNavigationTitleLabelAlpha__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationTitleLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __61__GKOnboardingViewController_updateNavigationTitleLabelAlpha__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationTitleLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (UIView)privacyContainer
{
  return self->_privacyContainer;
}

- (void)setPrivacyContainer:(id)a3
{
  objc_storeStrong((id *)&self->_privacyContainer, a3);
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (UIView)buttonContainer
{
  return self->_buttonContainer;
}

- (void)setButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_buttonContainer, a3);
}

- (UIView)privacyContainerInScrollView
{
  return self->_privacyContainerInScrollView;
}

- (void)setPrivacyContainerInScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_privacyContainerInScrollView, a3);
}

- (UIView)continueButtonContainerInScrollView
{
  return self->_continueButtonContainerInScrollView;
}

- (void)setContinueButtonContainerInScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonContainerInScrollView, a3);
}

- (NSLayoutConstraint)welcomeStackViewTrailingConstraint
{
  return self->_welcomeStackViewTrailingConstraint;
}

- (void)setWelcomeStackViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeStackViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)welcomeStackViewLeadingConstraint
{
  return self->_welcomeStackViewLeadingConstraint;
}

- (void)setWelcomeStackViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeStackViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)whatsnewStackViewTrailingConstraint
{
  return self->_whatsnewStackViewTrailingConstraint;
}

- (void)setWhatsnewStackViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_whatsnewStackViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)whatsnewStackViewLeadingConstraint
{
  return self->_whatsnewStackViewLeadingConstraint;
}

- (void)setWhatsnewStackViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_whatsnewStackViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)privacyContainerInScrollViewHeightConstraint
{
  return self->_privacyContainerInScrollViewHeightConstraint;
}

- (void)setPrivacyContainerInScrollViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_privacyContainerInScrollViewHeightConstraint, a3);
}

- (NSLayoutConstraint)continueButtonContainerWidthConstraint
{
  return self->_continueButtonContainerWidthConstraint;
}

- (void)setContinueButtonContainerWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonContainerWidthConstraint, a3);
}

- (NSLayoutConstraint)continueButtonContainerInScrollViewHeightConstraint
{
  return self->_continueButtonContainerInScrollViewHeightConstraint;
}

- (void)setContinueButtonContainerInScrollViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonContainerInScrollViewHeightConstraint, a3);
}

- (NSLayoutConstraint)continueButtonEqualWidthPrivacyContainerConstraint
{
  return self->_continueButtonEqualWidthPrivacyContainerConstraint;
}

- (void)setContinueButtonEqualWidthPrivacyContainerConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonEqualWidthPrivacyContainerConstraint, a3);
}

- (NSLayoutConstraint)continueButtonParitalWidthPrivacyContainerConstraint
{
  return self->_continueButtonParitalWidthPrivacyContainerConstraint;
}

- (void)setContinueButtonParitalWidthPrivacyContainerConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonParitalWidthPrivacyContainerConstraint, a3);
}

- (NSLayoutConstraint)scrollViewToBottomContainerConstraint
{
  return self->_scrollViewToBottomContainerConstraint;
}

- (void)setScrollViewToBottomContainerConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewToBottomContainerConstraint, a3);
}

- (NSLayoutConstraint)scrollViewToBottomSafeAreaConstraint
{
  return self->_scrollViewToBottomSafeAreaConstraint;
}

- (void)setScrollViewToBottomSafeAreaConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewToBottomSafeAreaConstraint, a3);
}

- (NSLayoutConstraint)bottomStackViewTopConstraint
{
  return self->_bottomStackViewTopConstraint;
}

- (void)setBottomStackViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomStackViewTopConstraint, a3);
}

- (NSLayoutConstraint)bottomStackViewBottomConstraint
{
  return self->_bottomStackViewBottomConstraint;
}

- (void)setBottomStackViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomStackViewBottomConstraint, a3);
}

- (NSLayoutConstraint)bottomStackViewTrailingConstraint
{
  return self->_bottomStackViewTrailingConstraint;
}

- (void)setBottomStackViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomStackViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)bottomStackViewLeadingConstraint
{
  return self->_bottomStackViewLeadingConstraint;
}

- (void)setBottomStackViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomStackViewLeadingConstraint, a3);
}

- (UIImageView)bubbleImageView
{
  return self->_bubbleImageView;
}

- (void)setBubbleImageView:(id)a3
{
  objc_storeStrong((id *)&self->_bubbleImageView, a3);
}

- (UIView)bottomContainerView
{
  return self->_bottomContainerView;
}

- (void)setBottomContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomContainerView, a3);
}

- (OBBoldTrayButton)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextButton, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIStackView)welcomeStackView
{
  return self->_welcomeStackView;
}

- (void)setWelcomeStackView:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeStackView, a3);
}

- (UIStackView)bottomStackView
{
  return self->_bottomStackView;
}

- (void)setBottomStackView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomStackView, a3);
}

- (UILabel)navigationTitleLabel
{
  return self->_navigationTitleLabel;
}

- (void)setNavigationTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_navigationTitleLabel, a3);
}

- (UIStackView)whatsNewStackView
{
  return self->_whatsNewStackView;
}

- (void)setWhatsNewStackView:(id)a3
{
  objc_storeStrong((id *)&self->_whatsNewStackView, a3);
}

- (UILabel)mainTitle
{
  return self->_mainTitle;
}

- (void)setMainTitle:(id)a3
{
  objc_storeStrong((id *)&self->_mainTitle, a3);
}

- (UILabel)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
  objc_storeStrong((id *)&self->_subTitle, a3);
}

- (OBPrivacyLinkController)privacyLink
{
  return self->_privacyLink;
}

- (void)setPrivacyLink:(id)a3
{
  objc_storeStrong((id *)&self->_privacyLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_mainTitle, 0);
  objc_storeStrong((id *)&self->_whatsNewStackView, 0);
  objc_storeStrong((id *)&self->_navigationTitleLabel, 0);
  objc_storeStrong((id *)&self->_bottomStackView, 0);
  objc_storeStrong((id *)&self->_welcomeStackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_bottomContainerView, 0);
  objc_storeStrong((id *)&self->_bubbleImageView, 0);
  objc_storeStrong((id *)&self->_bottomStackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomStackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomStackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bottomStackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewToBottomSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewToBottomContainerConstraint, 0);
  objc_storeStrong((id *)&self->_continueButtonParitalWidthPrivacyContainerConstraint, 0);
  objc_storeStrong((id *)&self->_continueButtonEqualWidthPrivacyContainerConstraint, 0);
  objc_storeStrong((id *)&self->_continueButtonContainerInScrollViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_continueButtonContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_privacyContainerInScrollViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_whatsnewStackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_whatsnewStackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_welcomeStackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_welcomeStackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_continueButtonContainerInScrollView, 0);
  objc_storeStrong((id *)&self->_privacyContainerInScrollView, 0);
  objc_storeStrong((id *)&self->_buttonContainer, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_privacyContainer, 0);
}

void __46__GKOnboardingViewController_showSignOutAlert__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AB361000, a2, OS_LOG_TYPE_ERROR, "showSignOutAlert: signOutWithCompletionHandler error: %@", (uint8_t *)&v2, 0xCu);
}

@end
