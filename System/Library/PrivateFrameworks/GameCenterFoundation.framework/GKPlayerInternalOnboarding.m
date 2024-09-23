@implementation GKPlayerInternalOnboarding

- (GKPlayerInternalOnboarding)initWithLastWelcomeWhatsNewCopyVersionDisplayed:(unint64_t)a3 lastPrivacyNoticeVersionDisplayed:(unint64_t)a4 lastPersonalizationVersionDisplayed:(id)a5 lastProfilePrivacyVersionDisplayed:(id)a6 lastFriendSuggestionsVersionDisplayed:(id)a7 lastContactsIntegrationConsentVersionDisplayed:(id)a8
{
  id v15;
  id v16;
  id v17;
  GKPlayerInternalOnboarding *v18;
  GKPlayerInternalOnboarding *v19;
  id v21;
  objc_super v22;

  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)GKPlayerInternalOnboarding;
  v18 = -[GKPlayerInternalOnboarding init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_lastWelcomeWhatsNewCopyVersionDisplayed = a3;
    v18->_lastPrivacyNoticeVersionDisplayed = a4;
    objc_storeStrong((id *)&v18->_lastPersonalizationVersionDisplayed, a5);
    objc_storeStrong((id *)&v19->_lastProfilePrivacyVersionDisplayed, a6);
    objc_storeStrong((id *)&v19->_lastFriendSuggestionsVersionDisplayed, a7);
    objc_storeStrong((id *)&v19->_lastContactsIntegrationConsentVersionDisplayed, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[GKPlayerInternalOnboarding lastWelcomeWhatsNewCopyVersionDisplayed](self, "lastWelcomeWhatsNewCopyVersionDisplayed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("lastWelcomeWhatsNewCopyVersionDisplayed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[GKPlayerInternalOnboarding lastPrivacyNoticeVersionDisplayed](self, "lastPrivacyNoticeVersionDisplayed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("lastPrivacyNoticeVersionDisplayed"));

  -[GKPlayerInternalOnboarding lastPersonalizationVersionDisplayed](self, "lastPersonalizationVersionDisplayed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("lastPersonalizationVersionDisplayed"));

  -[GKPlayerInternalOnboarding lastProfilePrivacyVersionDisplayed](self, "lastProfilePrivacyVersionDisplayed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("lastProfilePrivacyVersionDisplayed"));

  -[GKPlayerInternalOnboarding lastFriendSuggestionsVersionDisplayed](self, "lastFriendSuggestionsVersionDisplayed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("lastFriendSuggestionsVersionDisplayed"));

  -[GKPlayerInternalOnboarding lastContactsIntegrationConsentVersionDisplayed](self, "lastContactsIntegrationConsentVersionDisplayed");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("lastContactsIntegrationConsentVersionDisplayed"));

}

- (GKPlayerInternalOnboarding)initWithCoder:(id)a3
{
  id v4;
  GKPlayerInternalOnboarding *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *lastPersonalizationVersionDisplayed;
  uint64_t v10;
  NSString *lastProfilePrivacyVersionDisplayed;
  uint64_t v12;
  NSString *lastFriendSuggestionsVersionDisplayed;
  uint64_t v14;
  NSString *lastContactsIntegrationConsentVersionDisplayed;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GKPlayerInternalOnboarding;
  v5 = -[GKPlayerInternalOnboarding init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastWelcomeWhatsNewCopyVersionDisplayed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lastWelcomeWhatsNewCopyVersionDisplayed = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastPrivacyNoticeVersionDisplayed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lastPrivacyNoticeVersionDisplayed = objc_msgSend(v7, "unsignedIntValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastPersonalizationVersionDisplayed"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastPersonalizationVersionDisplayed = v5->_lastPersonalizationVersionDisplayed;
    v5->_lastPersonalizationVersionDisplayed = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastProfilePrivacyVersionDisplayed"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastProfilePrivacyVersionDisplayed = v5->_lastProfilePrivacyVersionDisplayed;
    v5->_lastProfilePrivacyVersionDisplayed = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastFriendSuggestionsVersionDisplayed"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastFriendSuggestionsVersionDisplayed = v5->_lastFriendSuggestionsVersionDisplayed;
    v5->_lastFriendSuggestionsVersionDisplayed = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastContactsIntegrationConsentVersionDisplayed"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastContactsIntegrationConsentVersionDisplayed = v5->_lastContactsIntegrationConsentVersionDisplayed;
    v5->_lastContactsIntegrationConsentVersionDisplayed = (NSString *)v14;

  }
  return v5;
}

- (BOOL)shouldShowPersonalizationScreenIsUsingDefaultNickname:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v28;
  NSObject *v29;
  const __CFString *v30;
  int v31;
  _DWORD v32[7];

  v3 = a3;
  *(_QWORD *)&v32[5] = *MEMORY[0x1E0C80C00];
  v5 = _os_feature_enabled_impl();
  +[GKPreferences shared](GKPreferences, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAccountModificationRestricted");
  if (!v5)
  {
    if (v7)
    {

    }
    else
    {
      +[GKPreferences shared](GKPreferences, "shared");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isProfileModificationRestricted");

      if (!v14)
        goto LABEL_18;
    }
    if (!os_log_GKGeneral)
      v15 = GKOSLoggers();
    v16 = (void *)os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      v17 = v16;
      +[GKPreferences shared](GKPreferences, "shared");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isAccountModificationRestricted");
      +[GKPreferences shared](GKPreferences, "shared");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 67109376;
      v32[0] = v19;
      LOWORD(v32[1]) = 1024;
      *(_DWORD *)((char *)&v32[1] + 2) = objc_msgSend(v20, "isProfileModificationRestricted");
      _os_log_impl(&dword_1BCDE3000, v17, OS_LOG_TYPE_INFO, "shouldShowPersonalizationScreen? NO -- accountModificationRestricted=%d || profileModificationRestricted=%d", (uint8_t *)&v31, 0xEu);

    }
    goto LABEL_23;
  }
  if (v7)
  {

LABEL_8:
    if (!os_log_GKGeneral)
      v11 = GKOSLoggers();
    v12 = os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "shouldShowPersonalizationScreen? NO -- Avatar & Nickname and Profile Privacy Changes are restricted.", (uint8_t *)&v31, 2u);
    }
LABEL_23:
    LOBYTE(v3) = 0;
    return v3;
  }
  +[GKPreferences shared](GKPreferences, "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isProfileModificationRestricted") & 1) != 0)
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isProfilePrivacyModificationRestricted");

    if (v10)
      goto LABEL_8;
  }
  else
  {

  }
LABEL_18:
  -[GKPlayerInternalOnboarding lastPersonalizationVersionDisplayed](self, "lastPersonalizationVersionDisplayed");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (v22)
  {
    if (!os_log_GKGeneral)
      v23 = GKOSLoggers();
    v24 = (void *)os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      v25 = v24;
      -[GKPlayerInternalOnboarding lastPersonalizationVersionDisplayed](self, "lastPersonalizationVersionDisplayed");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412290;
      *(_QWORD *)v32 = v26;
      _os_log_impl(&dword_1BCDE3000, v25, OS_LOG_TYPE_INFO, "shouldShowPersonalizationScreen? NO -- lastPersonalizationVersionDisplayed=%@", (uint8_t *)&v31, 0xCu);

    }
    goto LABEL_23;
  }
  if (!os_log_GKGeneral)
    v28 = GKOSLoggers();
  v29 = os_log_GKOnboarding;
  if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v30 = CFSTR("NO");
    if (v3)
      v30 = CFSTR("YES");
    v31 = 138412290;
    *(_QWORD *)v32 = v30;
    _os_log_impl(&dword_1BCDE3000, v29, OS_LOG_TYPE_INFO, "shouldShowPersonalizationScreen? %@", (uint8_t *)&v31, 0xCu);
  }
  return v3;
}

- (BOOL)shouldShowProfilePrivacyScreenIsUsingDefaultPrivacyVisibility:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  __CFString *v18;
  id v20;
  NSObject *v21;
  const __CFString *v22;
  int v23;
  const __CFString *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "shouldShowProfilePrivacyScreen? NO -- crystal_onboarding_enhancements FF is on", (uint8_t *)&v23, 2u);
    }
LABEL_16:
    LOBYTE(v3) = 0;
    return v3;
  }
  +[GKPreferences shared](GKPreferences, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isProfilePrivacyModificationRestricted");

  if (v8)
  {
    if (!os_log_GKGeneral)
      v9 = GKOSLoggers();
    v10 = (void *)os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      +[GKPreferences shared](GKPreferences, "shared");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 67109120;
      LODWORD(v24) = objc_msgSend(v12, "isProfilePrivacyModificationRestricted");
      _os_log_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_INFO, "shouldShowProfilePrivacyScreen? NO -- profilePrivacyModificationRestricted=%d", (uint8_t *)&v23, 8u);

    }
    goto LABEL_16;
  }
  -[GKPlayerInternalOnboarding lastProfilePrivacyVersionDisplayed](self, "lastProfilePrivacyVersionDisplayed");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    if (!os_log_GKGeneral)
      v15 = GKOSLoggers();
    v16 = (void *)os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      v17 = v16;
      -[GKPlayerInternalOnboarding lastProfilePrivacyVersionDisplayed](self, "lastProfilePrivacyVersionDisplayed");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v18;
      _os_log_impl(&dword_1BCDE3000, v17, OS_LOG_TYPE_INFO, "shouldShowProfilePrivacyScreen? NO -- lastProfilePrivacyVersionDisplayed=%@", (uint8_t *)&v23, 0xCu);

    }
    goto LABEL_16;
  }
  if (!os_log_GKGeneral)
    v20 = GKOSLoggers();
  v21 = os_log_GKOnboarding;
  if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v22 = CFSTR("NO");
    if (v3)
      v22 = CFSTR("YES");
    v23 = 138412290;
    v24 = v22;
    _os_log_impl(&dword_1BCDE3000, v21, OS_LOG_TYPE_INFO, "shouldShowProfilePrivacyScreen? %@", (uint8_t *)&v23, 0xCu);
  }
  return v3;
}

- (BOOL)hasAcknowledgedLatestGDPR
{
  unint64_t v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_opt_class(), "currentContentVersion");
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v5;
    objc_msgSend(v6, "numberWithUnsignedInteger:", -[GKPlayerInternalOnboarding lastPrivacyNoticeVersionDisplayed](self, "lastPrivacyNoticeVersionDisplayed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "hasAcknowledgedLatestGDPR Local State=%@ VS OBPrivacyFlow=%@", (uint8_t *)&v11, 0x16u);

  }
  return -[GKPlayerInternalOnboarding lastPrivacyNoticeVersionDisplayed](self, "lastPrivacyNoticeVersionDisplayed") >= v3;
}

- (BOOL)shouldShowFriendSuggestionsScreen
{
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  int v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[GKPreferences shared](GKPreferences, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFriendRequestsRestricted");

  if (v4)
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "shouldShowFriendSuggestionsScreen? NO -- Adding Friends is restricted.", (uint8_t *)&v16, 2u);
    }
    return 0;
  }
  else
  {
    -[GKPlayerInternalOnboarding lastFriendSuggestionsVersionDisplayed](self, "lastFriendSuggestionsVersionDisplayed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    v7 = v9 == 0;

    if (!os_log_GKGeneral)
      v10 = GKOSLoggers();
    v11 = (void *)os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      if (v9)
        v12 = CFSTR("NO");
      else
        v12 = CFSTR("YES");
      v13 = v11;
      -[GKPlayerInternalOnboarding lastFriendSuggestionsVersionDisplayed](self, "lastFriendSuggestionsVersionDisplayed");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "shouldShowFriendSuggestionsScreen? %@ -- lastFriendSuggestionsVersionDisplayed=%@", (uint8_t *)&v16, 0x16u);

    }
  }
  return v7;
}

- (BOOL)shouldShowContactsIntegrationConsentScreenIsUsingDefaultContactsIntegrationConsent:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  __CFString *v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GKPlayerInternalOnboarding lastContactsIntegrationConsentVersionDisplayed](self, "lastContactsIntegrationConsentVersionDisplayed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = (void *)os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      -[GKPlayerInternalOnboarding lastContactsIntegrationConsentVersionDisplayed](self, "lastContactsIntegrationConsentVersionDisplayed");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "shouldShowContactsIntegrationConsentScreen? NO -- lastContactsIntegrationConsentVersionDisplayed=%@", (uint8_t *)&v15, 0xCu);

    }
    LOBYTE(v3) = 0;
  }
  else
  {
    if (!os_log_GKGeneral)
      v11 = GKOSLoggers();
    v12 = os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      v13 = CFSTR("NO");
      if (v3)
        v13 = CFSTR("YES");
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "shouldShowContactsIntegrationConsentScreen? %@", (uint8_t *)&v15, 0xCu);
    }
  }
  return v3;
}

- (BOOL)shouldShowProfileCreatedScreenIsUsingDefaultNickname:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = a3;
  if (!_os_feature_enabled_impl())
    return -[GKPlayerInternalOnboarding shouldShowPersonalizationScreenIsUsingDefaultNickname:](self, "shouldShowPersonalizationScreenIsUsingDefaultNickname:", v3);
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKOnboarding;
  if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "shouldShowProfilePrivacyScreen? NO -- crystal_onboarding_enhancements FF is on", v8, 2u);
  }
  return 0;
}

- (BOOL)shouldShowAnyOnboardingScreenForBundleIdentifier:(id)a3 IsUsingDefaultNickname:(BOOL)a4 isUsingDefaultPrivacyVisibility:(BOOL)a5 isUsingDefaultContactsIntegrationConsent:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int v17;
  id v18;
  NSObject *v19;
  const __CFString *v20;
  BOOL v21;
  id v22;
  NSObject *v23;
  const char *v24;
  id v25;
  unint64_t v27;
  id v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  int v34;
  const __CFString *v35;
  __int16 v36;
  _BYTE v37[10];
  _BYTE v38[6];
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!+[GKReachability _gkIsOnline](GKReachability, "_gkIsOnline"))
  {
    if (!os_log_GKGeneral)
      v22 = GKOSLoggers();
    v23 = os_log_GKOnboarding;
    if (!os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
      goto LABEL_23;
    LOWORD(v34) = 0;
    v24 = "shouldShowAnyOnboardingScreen? NO, the player is offline";
    goto LABEL_22;
  }
  v11 = !-[GKPlayerInternalOnboarding hasAcknowledgedLatestGDPR](self, "hasAcknowledgedLatestGDPR");
  v12 = -[GKPlayerInternalOnboarding shouldShowPersonalizationScreenIsUsingDefaultNickname:](self, "shouldShowPersonalizationScreenIsUsingDefaultNickname:", v8);
  v13 = -[GKPlayerInternalOnboarding shouldShowProfilePrivacyScreenIsUsingDefaultPrivacyVisibility:](self, "shouldShowProfilePrivacyScreenIsUsingDefaultPrivacyVisibility:", v7);
  v14 = -[GKPlayerInternalOnboarding shouldShowFriendSuggestionsScreen](self, "shouldShowFriendSuggestionsScreen");
  v15 = -[GKPlayerInternalOnboarding shouldShowContactsIntegrationConsentScreenIsUsingDefaultContactsIntegrationConsent:](self, "shouldShowContactsIntegrationConsentScreenIsUsingDefaultContactsIntegrationConsent:", v6);
  v16 = +[GKGame isNewsApp:](GKGame, "isNewsApp:", v10);
  if (v16)
    v17 = v11;
  else
    v17 = v11 | v12 | (v13 || v14 || v15);
  if (!os_log_GKGeneral)
    v18 = GKOSLoggers();
  v19 = os_log_GKOnboarding;
  if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v20 = CFSTR("NO");
    v34 = 138413570;
    if (v17)
      v20 = CFSTR("YES");
    v35 = v20;
    v36 = 1024;
    *(_DWORD *)v37 = v11;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v12;
    *(_WORD *)v38 = 1024;
    *(_DWORD *)&v38[2] = v13;
    v39 = 1024;
    v40 = v14;
    v41 = 1024;
    v42 = v15;
    _os_log_impl(&dword_1BCDE3000, v19, OS_LOG_TYPE_INFO, "shouldShowAnyOnboardingScreen? %@, needConsentGDPR=%d || needPersonalization=%d ||needProfilePrivacy=%d || needFriendSuggestions=%d || needContactsIntegrationConsent=%d", (uint8_t *)&v34, 0x2Au);
  }
  if ((v17 & 1) != 0)
  {
    v21 = 1;
    goto LABEL_24;
  }
  if (v16)
  {
    if (!os_log_GKGeneral)
      v25 = GKOSLoggers();
    v23 = os_log_GKOnboarding;
    if (!os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
      goto LABEL_23;
    LOWORD(v34) = 0;
    v24 = "shouldShowAnyOnboardingScreen? NO (Skipping residual onboarding flow for News.)";
LABEL_22:
    _os_log_impl(&dword_1BCDE3000, v23, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v34, 2u);
LABEL_23:
    v21 = 0;
    goto LABEL_24;
  }
  v27 = -[GKPlayerInternalOnboarding lastWelcomeWhatsNewCopyVersionDisplayed](self, "lastWelcomeWhatsNewCopyVersionDisplayed");
  v21 = v27 < 3;
  if (!os_log_GKGeneral)
    v28 = GKOSLoggers();
  v29 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    if (v27 >= 3)
      v30 = CFSTR("NO");
    else
      v30 = CFSTR("YES");
    v31 = (void *)MEMORY[0x1E0CB37E8];
    v32 = v29;
    objc_msgSend(v31, "numberWithUnsignedInteger:", -[GKPlayerInternalOnboarding lastWelcomeWhatsNewCopyVersionDisplayed](self, "lastWelcomeWhatsNewCopyVersionDisplayed"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138412802;
    v35 = v30;
    v36 = 2112;
    *(_QWORD *)v37 = v33;
    *(_WORD *)&v37[8] = 1024;
    *(_DWORD *)v38 = 3;
    _os_log_impl(&dword_1BCDE3000, v32, OS_LOG_TYPE_INFO, "shouldShowAnyOnboardingScreen? %@, lastWelcomeWhatsNewCopyVersionDisplayed=%@ must be less than GKOnboardingWelcomeWhatsNewCopyVersion=%d", (uint8_t *)&v34, 0x1Cu);

  }
LABEL_24:

  return v21;
}

+ (unint64_t)currentContentVersion
{
  if (currentContentVersion_onceToken != -1)
    dispatch_once(&currentContentVersion_onceToken, &__block_literal_global_24);
  return currentContentVersion_result;
}

void __51__GKPlayerInternalOnboarding_currentContentVersion__block_invoke()
{
  void *v0;
  id v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v0 = (void *)getOBBundleClass_softClass;
  v16 = getOBBundleClass_softClass;
  if (!getOBBundleClass_softClass)
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = (uint64_t)__getOBBundleClass_block_invoke;
    v11 = &unk_1E75B3C18;
    v12 = &v13;
    __getOBBundleClass_block_invoke((uint64_t)&v8);
    v0 = (void *)v14[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v13, 8);
  v8 = 0;
  v9 = (uint64_t)&v8;
  v10 = 0x2020000000;
  v2 = (_QWORD *)getOBPrivacyGameCenterIdentifierSymbolLoc_ptr;
  v11 = (void *)getOBPrivacyGameCenterIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyGameCenterIdentifierSymbolLoc_ptr)
  {
    v3 = (void *)OnBoardingKitLibrary();
    v2 = dlsym(v3, "OBPrivacyGameCenterIdentifier");
    *(_QWORD *)(v9 + 24) = v2;
    getOBPrivacyGameCenterIdentifierSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
    __51__GKPlayerInternalOnboarding_currentContentVersion__block_invoke_cold_1();
  objc_msgSend(v1, "bundleWithIdentifier:", *v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)getOBPrivacyFlowClass_softClass;
  v16 = getOBPrivacyFlowClass_softClass;
  if (!getOBPrivacyFlowClass_softClass)
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = (uint64_t)__getOBPrivacyFlowClass_block_invoke;
    v11 = &unk_1E75B3C18;
    v12 = &v13;
    __getOBPrivacyFlowClass_block_invoke((uint64_t)&v8);
    v5 = (void *)v14[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v6, "flowWithBundle:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  currentContentVersion_result = objc_msgSend(v7, "contentVersion");

}

- (unint64_t)lastWelcomeWhatsNewCopyVersionDisplayed
{
  return self->_lastWelcomeWhatsNewCopyVersionDisplayed;
}

- (unint64_t)lastPrivacyNoticeVersionDisplayed
{
  return self->_lastPrivacyNoticeVersionDisplayed;
}

- (NSString)lastPersonalizationVersionDisplayed
{
  return self->_lastPersonalizationVersionDisplayed;
}

- (NSString)lastProfilePrivacyVersionDisplayed
{
  return self->_lastProfilePrivacyVersionDisplayed;
}

- (NSString)lastFriendSuggestionsVersionDisplayed
{
  return self->_lastFriendSuggestionsVersionDisplayed;
}

- (NSString)lastContactsIntegrationConsentVersionDisplayed
{
  return self->_lastContactsIntegrationConsentVersionDisplayed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastContactsIntegrationConsentVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastFriendSuggestionsVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastProfilePrivacyVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastPersonalizationVersionDisplayed, 0);
}

void __51__GKPlayerInternalOnboarding_currentContentVersion__block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getOBPrivacyGameCenterIdentifier(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("GKSoftLinkedClassesFoundation.h"), 29, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
