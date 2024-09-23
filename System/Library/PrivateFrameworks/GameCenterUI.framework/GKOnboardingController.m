@implementation GKOnboardingController

+ (GKOnboardingController)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_10);
  return (GKOnboardingController *)(id)shared_sShared;
}

void __32__GKOnboardingController_shared__block_invoke()
{
  GKOnboardingController *v0;
  void *v1;

  v0 = objc_alloc_init(GKOnboardingController);
  v1 = (void *)shared_sShared;
  shared_sShared = (uint64_t)v0;

}

- (id)landingViewControllerWithGameBundleId:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  id v9;
  os_log_t *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  os_log_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  GKWelcomeOnboardingViewController *v23;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D25330];
  v5 = a3;
  objc_msgSend(v4, "authenticatedLocalPlayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v9 = (id)GKOSLoggers();
  v10 = (os_log_t *)MEMORY[0x1E0D25478];
  v11 = (void *)*MEMORY[0x1E0D25478];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25478], OS_LOG_TYPE_INFO))
  {
    v12 = (void *)MEMORY[0x1E0D25330];
    v13 = v11;
    objc_msgSend(v12, "local");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKOnboardingController describePlayerComparisonsBetween:and:](GKOnboardingController, "describePlayerComparisonsBetween:and:", v7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v15;
    _os_log_impl(&dword_1AB361000, v13, OS_LOG_TYPE_INFO, "landingViewController before update -- authFirst.internal VS local.internal\n%@", (uint8_t *)&v25, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateFromLocalPlayer:", v7);

  if (!*v8)
    v17 = (id)GKOSLoggers();
  v18 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    v19 = (void *)MEMORY[0x1E0D25330];
    v20 = v18;
    objc_msgSend(v19, "local");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKOnboardingController describePlayerComparisonsBetween:and:](GKOnboardingController, "describePlayerComparisonsBetween:and:", v7, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v22;
    _os_log_impl(&dword_1AB361000, v20, OS_LOG_TYPE_INFO, "landingViewController after update -- authFirst.internal VS local.internal\n%@", (uint8_t *)&v25, 0xCu);

  }
  -[GKOnboardingController setGameBundleId:](self, "setGameBundleId:", v5);

  v23 = objc_alloc_init(GKWelcomeOnboardingViewController);
  return v23;
}

+ (id)describePlayerComparisonsBetween:(id)a3 and:(id)a4
{
  void *v5;
  id v6;
  id v7;
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
  void *v20;
  unsigned int v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  v45 = (void *)MEMORY[0x1E0CB3940];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "internal");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "onboarding");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v55, "lastWelcomeWhatsNewCopyVersionDisplayed"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "internal");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "onboarding");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v53, "lastWelcomeWhatsNewCopyVersionDisplayed"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "internal");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "onboarding");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v51, "lastPrivacyNoticeVersionDisplayed"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "internal");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "onboarding");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v49, "lastPrivacyNoticeVersionDisplayed"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v48, "isDefaultNickname");
  objc_msgSend(v6, "internal");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v47, "isDefaultNickname");
  objc_msgSend(v7, "internal");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "onboarding");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "lastPersonalizationVersionDisplayed");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internal");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "onboarding");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "lastPersonalizationVersionDisplayed");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v40, "isDefaultPrivacyVisibility");
  objc_msgSend(v6, "internal");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v39, "isDefaultPrivacyVisibility");
  objc_msgSend(v7, "internal");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "onboarding");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "lastProfilePrivacyVersionDisplayed");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internal");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "onboarding");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "lastProfilePrivacyVersionDisplayed");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v32, "isDefaultContactsIntegrationConsent");
  objc_msgSend(v6, "internal");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v31, "isDefaultContactsIntegrationConsent");
  objc_msgSend(v7, "internal");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "onboarding");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastContactsIntegrationConsentVersionDisplayed");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internal");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "onboarding");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastContactsIntegrationConsentVersionDisplayed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "onboarding");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastFriendSuggestionsVersionDisplayed");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "onboarding");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastFriendSuggestionsVersionDisplayed");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "stringWithFormat:", CFSTR(" WhatsNew copy version %@ VS %@\n privacy notice version %@ VS %@\n nickname: default %d VS %d | version %@ VS %@\n profile privacy: default %d VS %d | version %@ VS %@\n contacts integration: default %d VS %d | version %@ VS %@ friend suggestions: version %@ VS %@"), v61, v60, v59, v58, v36, v33, v57, v30, v29, v26, v23, v24, v22, v21, v20, v12,
    v15,
    v18);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

- (void)presentProfilePrivacyScreen:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GKProfilePrivacyViewController *v7;
  uint8_t v8[16];

  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25478];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25478], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "presentProfilePrivacyScreen", v8, 2u);
  }
  v7 = objc_alloc_init(GKProfilePrivacyViewController);
  -[GKOnboardingController presentViewController:presentingViewController:](self, "presentViewController:presentingViewController:", v7, v4);

}

- (void)presentFriendSuggestionsScreen:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GKOnboardingFriendsSuggestionsViewController *v7;
  void *v8;
  GKOnboardingFriendsSuggestionsViewController *v9;
  uint8_t v10[16];

  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25478];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25478], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "presentFriendSuggestionsScreen", v10, 2u);
  }
  v7 = [GKOnboardingFriendsSuggestionsViewController alloc];
  -[GKOnboardingController gameBundleId](self, "gameBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GKOnboardingFriendsSuggestionsViewController initWithGameBundleId:](v7, "initWithGameBundleId:", v8);
  -[GKOnboardingController presentViewController:presentingViewController:](self, "presentViewController:presentingViewController:", v9, v4);

}

- (void)presentContactsIntegrationConsentScreen:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GKContactsIntegrationConsentViewController *v7;
  uint8_t v8[16];

  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25478];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25478], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "presentContactsIntegrationConsentScreen", v8, 2u);
  }
  v7 = objc_alloc_init(GKContactsIntegrationConsentViewController);
  -[GKOnboardingController presentViewController:presentingViewController:](self, "presentViewController:presentingViewController:", v7, v4);

}

- (void)presentPersonalizationScreen:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  __objc2_class **v8;
  id v9;
  uint8_t v10[16];

  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25478];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25478], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "presentPersonalizationScreen", v10, 2u);
  }
  v7 = _os_feature_enabled_impl();
  v8 = off_1E59C2CE8;
  if (!v7)
    v8 = off_1E59C2CF8;
  v9 = objc_alloc_init(*v8);
  -[GKOnboardingController presentViewController:presentingViewController:](self, "presentViewController:presentingViewController:", v9, v4);

}

- (void)presentProfileCreatedScreen:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GKProfileCreatedViewController *v7;
  uint8_t v8[16];

  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25478];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25478], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "presentProfileCreatedScreen", v8, 2u);
  }
  v7 = objc_alloc_init(GKProfileCreatedViewController);
  -[GKOnboardingController presentViewController:presentingViewController:](self, "presentViewController:presentingViewController:", v7, v4);

}

- (void)presentViewController:(id)a3 presentingViewController:(id)a4
{
  objc_msgSend(a4, "pushViewController:animated:", a3, 1);
}

- (NSString)gameBundleId
{
  return self->_gameBundleId;
}

- (void)setGameBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (GKOnboardingFlowDelegate)delegate
{
  return (GKOnboardingFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gameBundleId, 0);
}

@end
