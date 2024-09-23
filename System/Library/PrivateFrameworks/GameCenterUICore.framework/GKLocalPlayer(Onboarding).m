@implementation GKLocalPlayer(Onboarding)

- (uint64_t)hasAcknowledgedLatestGDPR
{
  void *v2;
  char isKindOfClass;
  _QWORD *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v4 = (_QWORD *)MEMORY[0x24BE3A308];
  if ((isKindOfClass & 1) != 0)
  {
    if (!*MEMORY[0x24BE3A308])
      v5 = (id)GKOSLoggers();
    v6 = *MEMORY[0x24BE3A300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
      -[GKLocalPlayer(Onboarding) hasAcknowledgedLatestGDPR].cold.1(v6);
  }
  if (!*v4)
    v7 = (id)GKOSLoggers();
  v8 = (void *)*MEMORY[0x24BE3A310];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A310], OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(a1, "internal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v11;
    _os_log_impl(&dword_219F71000, v9, OS_LOG_TYPE_INFO, "Getting GDPR state for player: %@", (uint8_t *)&v16, 0xCu);

  }
  objc_msgSend(a1, "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "onboarding");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasAcknowledgedLatestGDPR");

  return v14;
}

- (uint64_t)shouldShowPersonalizationScreen
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboarding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "shouldShowPersonalizationScreenIsUsingDefaultNickname:", objc_msgSend(v4, "isDefaultNickname"));

  return v5;
}

- (uint64_t)shouldShowProfilePrivacyScreen
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboarding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "shouldShowProfilePrivacyScreenIsUsingDefaultPrivacyVisibility:", objc_msgSend(v4, "isDefaultPrivacyVisibility"));

  return v5;
}

- (uint64_t)shouldShowFriendSuggestionsScreen
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "internal");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "onboarding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowFriendSuggestionsScreen");

  return v3;
}

- (uint64_t)shouldShowContactsIntegrationConsentScreen
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboarding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "shouldShowContactsIntegrationConsentScreenIsUsingDefaultContactsIntegrationConsent:", objc_msgSend(v4, "isDefaultContactsIntegrationConsent"));

  return v5;
}

- (uint64_t)shouldShowProfileCreatedScreen
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboarding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "shouldShowProfileCreatedScreenIsUsingDefaultNickname:", objc_msgSend(v4, "isDefaultNickname"));

  return v5;
}

- (uint64_t)shouldShowAnyOnboardingScreen
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "shouldShowAnyOnboardingScreenForBundleIdentifier:", v3);

  return v4;
}

- (uint64_t)shouldShowAnyOnboardingScreenForBundleIdentifier:()Onboarding
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a1, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "onboarding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDefaultNickname");
  objc_msgSend(a1, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDefaultPrivacyVisibility");
  objc_msgSend(a1, "internal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "shouldShowAnyOnboardingScreenForBundleIdentifier:IsUsingDefaultNickname:isUsingDefaultPrivacyVisibility:isUsingDefaultContactsIntegrationConsent:", v4, v8, v10, objc_msgSend(v11, "isDefaultContactsIntegrationConsent"));

  return v12;
}

- (void)hasAcknowledgedLatestGDPR
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219F71000, log, OS_LOG_TYPE_ERROR, "Attempting to get GDPR state for non-local player", v1, 2u);
}

@end
