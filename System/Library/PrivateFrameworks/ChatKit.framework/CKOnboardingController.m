@implementation CKOnboardingController

- (BOOL)_shouldOnboardCollaborationApps
{
  uint64_t v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[CKOnboardingController _isRunningTest](self, "_isRunningTest") || !CKIsRunningInMessages())
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v3 = -[CKOnboardingController currentCollaborationOnboardingVersion](self, "currentCollaborationOnboardingVersion");
    objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "defaultCollaborationAppsEnabled");

    if (v3 < 1)
      v6 = 1;
    else
      v6 = v5 ^ 1;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("NO");
        if (v6)
          v8 = CFSTR("YES");
        v10 = 138412546;
        v11 = v8;
        v12 = 2048;
        v13 = v3;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "shouldOnboard: %@ collaborationOnboardingVersion = %lu", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  return v6;
}

- (BOOL)shouldPresentOnboarding
{
  return -[CKOnboardingController _shouldPresentNewInMessages](self, "_shouldPresentNewInMessages")
      || -[CKOnboardingController _shouldShowNicknameOnboardingFlowOnLaunch](self, "_shouldShowNicknameOnboardingFlowOnLaunch")|| -[CKOnboardingController _shouldShowSyndicationOnboardingFlowOnLaunch](self, "_shouldShowSyndicationOnboardingFlowOnLaunch")|| -[CKOnboardingController _shouldOnboardCollaborationApps](self, "_shouldOnboardCollaborationApps");
}

- (BOOL)_shouldShowSyndicationOnboardingFlowOnLaunch
{
  NSObject *v3;
  int v4;
  NSObject *v5;
  unint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D397F8], "supportsSharedWithYou") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Don't show the syndication onboarding flow as this device does not support it.", (uint8_t *)&v14, 2u);
      }
      goto LABEL_17;
    }
LABEL_18:
    LOBYTE(v4) = 0;
    return v4;
  }
  if (-[CKOnboardingController _isRunningTest](self, "_isRunningTest") || !CKIsRunningInMessages())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Not showing onboarding because process is not Messages", (uint8_t *)&v14, 2u);
      }
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (-[CKOnboardingController alwaysShowSyndicationOnboarding](self, "alwaysShowSyndicationOnboarding"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Showing syndication onboarding because debugging with alwaysShowSyndicationOnboarding enabled", (uint8_t *)&v14, 2u);
      }

    }
    LOBYTE(v4) = 1;
  }
  else
  {
    v7 = -[CKOnboardingController syndicationOnboardingLastShownVersion](self, "syndicationOnboardingLastShownVersion");
    objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "sharedWithYouKeyExists");

    if (v7 < 3)
      v4 = 1;
    else
      v4 = v9 ^ 1;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = CFSTR("NO");
        if (v4)
          v12 = CFSTR("YES");
        else
          v12 = CFSTR("NO");
        if (v9)
          v13 = CFSTR("YES");
        else
          v13 = CFSTR("NO");
        v14 = 138412802;
        v15 = v12;
        v16 = 2112;
        v17 = v13;
        if (v7 < 3)
          v11 = CFSTR("YES");
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Syndication onboarding should present: %@ because sharedWithYouKeyExists: %@, onboardingVersionIsOutdated: %@", (uint8_t *)&v14, 0x20u);
      }

    }
  }
  return v4;
}

- (BOOL)_shouldPresentNewInMessages
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;

  if (-[CKOnboardingController _isRunningTest](self, "_isRunningTest"))
    return 0;
  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("DisableWhatsNewScreen"));

  if ((v4 & 1) != 0)
    return 0;
  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("AlwaysShowWhatsNewScreen"));

  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerForKey:", CFSTR("whatsNewInMessagesVersion"));

  if (v9 < -[CKOnboardingController _whatsNewLatestShippingVersion](self, "_whatsNewLatestShippingVersion")
    || v9 > -[CKOnboardingController _whatsNewVersion](self, "_whatsNewVersion"))
  {
    v9 = -[CKOnboardingController _whatsNewLatestShippingVersion](self, "_whatsNewLatestShippingVersion");
  }
  return (v7 & 1) != 0 || v9 < -[CKOnboardingController _whatsNewVersion](self, "_whatsNewVersion");
}

- (BOOL)_isRunningTest
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunningTest");

  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)syndicationOnboardingLastShownVersion
{
  void *v2;
  unint64_t v3;

  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("SyndicationOnboardingVersion"));

  return v3;
}

- (int64_t)currentCollaborationOnboardingVersion
{
  void *v2;
  int64_t v3;

  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("CollaborationOnboardingVersion"));

  return v3;
}

- (BOOL)alwaysShowSyndicationOnboarding
{
  void *v2;
  char v3;

  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("AlwaysShowSyndicationOnboarding"));

  return v3;
}

- (BOOL)alwaysShowNicknameOnboarding
{
  void *v2;
  char v3;

  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("AlwaysShowNicknameOnboarding"));

  return v3;
}

- (id)_userDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_syndicationIntroController, 0);
  objc_storeStrong((id *)&self->_sharedProfileOnboardingController, 0);
  objc_storeStrong((id *)&self->_avatarItemProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_nicknameFlowManager, 0);
  objc_storeStrong((id *)&self->_pendingMeCardSharingResult, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_memojiVideoPlayerLooper, 0);
  objc_storeStrong((id *)&self->_memojiVideoPlayer, 0);
  objc_storeStrong((id *)&self->_memojiCreationController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_syncState, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)presentOnboardingIfNeeded
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  if (-[CKOnboardingController _shouldPresentNewInMessages](self, "_shouldPresentNewInMessages"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Presenting onboarding flow", buf, 2u);
      }

    }
    -[CKOnboardingController prepareForOnboarding](self, "prepareForOnboarding");
    -[CKOnboardingController _introController](self, "_introController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKOnboardingController presentOnboarding:](self, "presentOnboarding:", v4);

    -[CKOnboardingController _writeDefaultWhatsNewDidShow](self, "_writeDefaultWhatsNewDidShow");
LABEL_19:
    LOBYTE(v7) = 1;
    return v7;
  }
  if (-[CKOnboardingController _shouldShowNicknameOnboardingFlowOnLaunch](self, "_shouldShowNicknameOnboardingFlowOnLaunch"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Presenting nickname onboarding flow", v12, 2u);
      }

    }
    -[CKOnboardingController prepareForOnboarding](self, "prepareForOnboarding");
    -[CKOnboardingController startNicknameOnboardingIfNeeded](self, "startNicknameOnboardingIfNeeded");
    goto LABEL_19;
  }
  if (-[CKOnboardingController _shouldShowSyndicationOnboardingFlowOnLaunch](self, "_shouldShowSyndicationOnboardingFlowOnLaunch"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Presenting Syndication onboarding flow", v11, 2u);
      }

    }
    -[CKOnboardingController prepareForOnboarding](self, "prepareForOnboarding");
    -[CKOnboardingController pushSyndicationIntroStep](self, "pushSyndicationIntroStep");
    goto LABEL_19;
  }
  v7 = -[CKOnboardingController _shouldOnboardCollaborationApps](self, "_shouldOnboardCollaborationApps");
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Onboarding collaboration apps", v10, 2u);
      }

    }
    -[CKOnboardingController onboardCollaborationApps](self, "onboardCollaborationApps");
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (unint64_t)nicknameOnboardingLastShownVersion
{
  void *v2;
  unint64_t v3;

  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("NicknameOnboardingVersion"));

  return v3;
}

- (BOOL)_shouldShowNicknameOnboardingFlow
{
  return -[CKOnboardingController _shouldShowNicknameOnboardingFlowIgnoringVersion:](self, "_shouldShowNicknameOnboardingFlowIgnoringVersion:", 0);
}

- (BOOL)_shouldShowNicknameOnboardingFlowIgnoringVersion:(BOOL)a3
{
  if (-[CKOnboardingController _isRunningTest](self, "_isRunningTest"))
    return 0;
  if (-[CKOnboardingController alwaysShowNicknameOnboarding](self, "alwaysShowNicknameOnboarding")
    || -[CKOnboardingController isUserInitiatedEditNameAndPhoto](self, "isUserInitiatedEditNameAndPhoto"))
  {
    return 1;
  }
  if (!a3 && -[CKOnboardingController nicknameOnboardingLastShownVersion](self, "nicknameOnboardingLastShownVersion"))
    return 0;
  return -[CKOnboardingController accountCanCreateNickname](self, "accountCanCreateNickname");
}

- (BOOL)accountCanCreateNickname
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAllowMultiplePhoneNumbersSNaPEnabled");

  v4 = IMSharedHelperNickNameEnabled();
  if (v3)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v5, "iCloudSignedInToUseNicknames");
LABEL_9:

      return v6;
    }
  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "iCloudSignedInToUseNicknames"))
      v6 = objc_msgSend(MEMORY[0x1E0D358A8], "multiplePhoneNumbersTiedToAppleID") ^ 1;
    else
      LOBYTE(v6) = 0;
    goto LABEL_9;
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)presentNicknameSharingSetupFlow
{
  return -[CKOnboardingController presentNicknameSharingSetupFlowWithMemoji:forUserInitiatedEdit:](self, "presentNicknameSharingSetupFlowWithMemoji:forUserInitiatedEdit:", 1, 1);
}

- (BOOL)presentNicknameSharingSetupFlowWithMemoji:(BOOL)a3 forUserInitiatedEdit:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location[2];

  v4 = a4;
  v5 = a3;
  v7 = -[CKOnboardingController _shouldShowNicknameOnboardingFlowIgnoringVersion:](self, "_shouldShowNicknameOnboardingFlowIgnoringVersion:", 1);
  if (v7)
  {
    -[CKOnboardingController setIsUserInitiatedEditNameAndPhoto:](self, "setIsUserInitiatedEditNameAndPhoto:", v4);
    -[CKOnboardingController prepareForOnboarding](self, "prepareForOnboarding");
    location[0] = 0;
    objc_initWeak(location, self);
    if (v5)
    {
      v8 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __89__CKOnboardingController_presentNicknameSharingSetupFlowWithMemoji_forUserInitiatedEdit___block_invoke;
      v16[3] = &unk_1E274B548;
      objc_copyWeak(&v17, location);
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __89__CKOnboardingController_presentNicknameSharingSetupFlowWithMemoji_forUserInitiatedEdit___block_invoke_2;
      v14[3] = &unk_1E274B548;
      objc_copyWeak(&v15, location);
      -[CKOnboardingController _presentMemojiCreationIfNeeded:skipAction:](self, "_presentMemojiCreationIfNeeded:skipAction:", v16, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
    }
    else
    {
      -[CKOnboardingController avatarRecord](self, "avatarRecord");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[CKOnboardingController _nameAndPhotoSharingIntroController](self, "_nameAndPhotoSharingIntroController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKOnboardingController presentOnboarding:](self, "presentOnboarding:", v11);

      }
      else
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __89__CKOnboardingController_presentNicknameSharingSetupFlowWithMemoji_forUserInitiatedEdit___block_invoke_3;
        v13[3] = &unk_1E27557B8;
        v13[4] = self;
        -[CKOnboardingController _fetchMemojiWithCompletionBlock:](self, "_fetchMemojiWithCompletionBlock:", v13);
      }
    }
    objc_destroyWeak(location);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Not showing onboarding flow for nicknames as feature is disabled or accounts mismatch", (uint8_t *)location, 2u);
    }

  }
  return v7;
}

void __89__CKOnboardingController_presentNicknameSharingSetupFlowWithMemoji_forUserInitiatedEdit___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "_memojiCreationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentOnboarding:", v1);

}

void __89__CKOnboardingController_presentNicknameSharingSetupFlowWithMemoji_forUserInitiatedEdit___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "_nameAndPhotoSharingIntroController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentOnboarding:", v1);

}

void __89__CKOnboardingController_presentNicknameSharingSetupFlowWithMemoji_forUserInitiatedEdit___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setAvatarRecord:");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_nameAndPhotoSharingIntroController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentOnboarding:", v3);

}

- (void)presentNicknameOnboardingOrEditFlow
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CKOnboardingController sharedProfileOnboardingController](self, "sharedProfileOnboardingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (_ContactsUIForwardDeclareInit_onceToken != -1)
      dispatch_once(&_ContactsUIForwardDeclareInit_onceToken, &__block_literal_global_397_1);
    v4 = objc_alloc((Class)_CKCNSharedProfileOnboardingController);
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getContactStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithContactStore:", v6);
    -[CKOnboardingController setSharedProfileOnboardingController:](self, "setSharedProfileOnboardingController:", v7);

  }
  -[CKOnboardingController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentingViewControllerForOnboardingController:", self);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CKOnboardingController sharedProfileOnboardingController](self, "sharedProfileOnboardingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startOnboardingOrEditForMode:fromViewController:", 0, v10);

}

- (void)prepareForSuspend
{
  void *v2;
  id v3;

  -[CKOnboardingController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)prepareForOnboarding
{
  if (_OnBoardingKitInit_onceToken != -1)
    dispatch_once(&_OnBoardingKitInit_onceToken, &__block_literal_global_408_0);
  if (_AvatarUIInit_onceToken != -1)
    dispatch_once(&_AvatarUIInit_onceToken, &__block_literal_global_421_1);
  if (_ContactsUIForwardDeclareInit_onceToken != -1)
    dispatch_once(&_ContactsUIForwardDeclareInit_onceToken, &__block_literal_global_397_1);
}

- (void)presentOnboarding:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  void *v13;
  uint64_t v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int16 v32;
  uint8_t buf[2];

  v4 = a3;
  -[CKOnboardingController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerForOnboardingController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_29;
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "Onboarding: no presenting view controller!";
      v12 = buf;
      goto LABEL_19;
    }
LABEL_28:

    goto LABEL_29;
  }
  if (_CKOBWelcomeController)
    v7 = _CKOBBoldTrayButton == 0;
  else
    v7 = 1;
  if (v7 || _CKOBLinkTrayButton == 0 || _CKOBWelcomeFullCenterContentController == 0)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_29;
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v32 = 0;
      v11 = "Onboarding: OnBoardingKit classes not linked!";
      v12 = (uint8_t *)&v32;
LABEL_19:
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
      goto LABEL_28;
    }
    goto LABEL_28;
  }
  if (v4)
  {
    if ((unint64_t)(objc_msgSend(v6, "interfaceOrientation") - 1) < 2
      || (objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "userInterfaceIdiom"),
          v13,
          v14))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v4);
      -[CKOnboardingController setNavigationController:](self, "setNavigationController:", v15);

      -[CKOnboardingController navigationController](self, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setModalPresentationStyle:", 2);

      -[CKOnboardingController navigationController](self, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "interactivePopGestureRecognizer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setEnabled:", 0);

      -[CKOnboardingController navigationController](self, "navigationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setModalInPresentation:", 0);

      -[CKOnboardingController navigationController](self, "navigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "navigationBar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_opt_new();
      objc_msgSend(v21, "setBackgroundImage:forBarMetrics:", v22, 0);

      -[CKOnboardingController navigationController](self, "navigationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "navigationBar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_setHidesShadow:", 1);

      -[CKOnboardingController navigationController](self, "navigationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setDelegate:", self);

      -[CKOnboardingController navigationController](self, "navigationController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "presentationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDelegate:", self);

      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "userInterfaceIdiom");

      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setOrientation:animated:", 1, 1);

      }
      if (-[CKOnboardingController _shouldShowSyndicationOnboardingFlowOnLaunch](self, "_shouldShowSyndicationOnboardingFlowOnLaunch"))
      {
        -[CKOnboardingController navigationController](self, "navigationController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setNavigationBarHidden:", 1);

      }
      -[CKOnboardingController navigationController](self, "navigationController");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentViewController:animated:completion:", v10, 1, 0);
      goto LABEL_28;
    }
  }
LABEL_29:

}

- (id)_introController
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_IN_MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc((Class)_CKOBWelcomeController), "initWithTitle:detailText:icon:", v28, 0, 0);
  objc_msgSend((id)_CKOBBoldTrayButton, "boldButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v7, 0);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_pushMemojiCreationStepIfNeeded, 64);
  objc_msgSend(v4, "buttonTray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addButton:", v5);

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("WhatsNew_NameAndPhoto"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_NAME_AND_PHOTO_SHARING_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_NAME_AND_PHOTO_SHARING_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addBulletedListItemWithTitle:description:image:", v12, v14, v10);

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("WhatsNew_Memoji"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "imageWithRenderingMode:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_ANIMOJI_STICKER_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_ANIMOJI_STICKER_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addBulletedListItemWithTitle:description:image:", v18, v20, v16);

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("WhatsNew_Search"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "imageWithRenderingMode:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_LINK_AND_ATTACHMENT_SEARCH_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_LINK_AND_ATTACHMENT_SEARCH_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addBulletedListItemWithTitle:description:image:", v24, v26, v22);

  return v4;
}

- (void)startNicknameOnboardingIfNeeded
{
  uint64_t v3;
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);
  uint8_t buf[8];
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CKOnboardingController_startNicknameOnboardingIfNeeded__block_invoke;
  aBlock[3] = &unk_1E274A208;
  aBlock[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[CKOnboardingController alwaysShowNicknameOnboarding](self, "alwaysShowNicknameOnboarding"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Always show nickname onboarding flag set, showing onboarding regardless of current nickname", buf, 2u);
      }

    }
    v4[2](v4);
  }
  else
  {
    -[CKOnboardingController _nicknameController](self, "_nicknameController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __57__CKOnboardingController_startNicknameOnboardingIfNeeded__block_invoke_64;
    v7[3] = &unk_1E27557E0;
    v8 = v4;
    objc_msgSend(v6, "fetchPersonalNicknameWithCompletion:", v7);

  }
}

uint64_t __57__CKOnboardingController_startNicknameOnboardingIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushMemojiCreationStepIfNeeded");
}

void __57__CKOnboardingController_startNicknameOnboardingIfNeeded__block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "User has nickname, bailing from nickname onboarding", v7, 2u);
      }

    }
  }
  else
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Daemon didn't have nickname, showing onboarding", buf, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)pushMemojiCreationStepIfNeeded
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__CKOnboardingController_pushMemojiCreationStepIfNeeded__block_invoke;
  v6[3] = &unk_1E274B548;
  objc_copyWeak(&v7, &location);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __56__CKOnboardingController_pushMemojiCreationStepIfNeeded__block_invoke_2;
  v4[3] = &unk_1E274B548;
  objc_copyWeak(&v5, &location);
  -[CKOnboardingController _presentMemojiCreationIfNeeded:skipAction:](self, "_presentMemojiCreationIfNeeded:skipAction:", v6, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __56__CKOnboardingController_pushMemojiCreationStepIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pushMemojiCreationStep");

}

void __56__CKOnboardingController_pushMemojiCreationStepIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pushNameAndPhotoSharingIntroStepIfNeeded");

}

- (void)_fetchMemojiWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (CKIsRunningInMacCatalyst())
    goto LABEL_5;
  if (_fetchMemojiWithCompletionBlock___pred_AVTUIAreAvatarsSupportedAvatarUI != -1)
    dispatch_once(&_fetchMemojiWithCompletionBlock___pred_AVTUIAreAvatarsSupportedAvatarUI, &__block_literal_global_115);
  if ((_fetchMemojiWithCompletionBlock___AVTUIAreAvatarsSupported() & 1) != 0)
  {
LABEL_5:
    v5 = objc_alloc_init((Class)_CKAVTAvatarStore);
    -[CKOnboardingController setAvatarStore:](self, "setAvatarStore:", v5);

    objc_msgSend((id)_CKAVTAvatarFetchRequest, "requestForCustomAvatarsWithLimit:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKOnboardingController avatarStore](self, "avatarStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && v6)
    {
      -[CKOnboardingController avatarStore](self, "avatarStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __58__CKOnboardingController__fetchMemojiWithCompletionBlock___block_invoke_70;
      v12[3] = &unk_1E2755808;
      v13 = v4;
      objc_msgSend(v8, "fetchAvatarsForFetchRequest:completionHandler:", v6, v12);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          -[CKOnboardingController avatarStore](self, "avatarStore");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v15 = v10;
          v16 = 2112;
          v17 = v6;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Onboarding: nil avatar store %@ or fetch request %@. Going to memoji creation flow.", buf, 0x16u);

        }
      }
      (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Running on device which does not support avatars. Skipping memoji creation.", buf, 2u);
      }

    }
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void *__58__CKOnboardingController__fetchMemojiWithCompletionBlock___block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("AVTUIAreAvatarsSupported", CFSTR("AvatarUI"));
  _fetchMemojiWithCompletionBlock___AVTUIAreAvatarsSupported = result;
  return result;
}

void __58__CKOnboardingController__fetchMemojiWithCompletionBlock___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__CKOnboardingController__fetchMemojiWithCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E274C2E0;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __58__CKOnboardingController__fetchMemojiWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, 1, v4);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40), 1, 0);
  }
}

- (void)_presentMemojiCreationIfNeeded:(id)a3 skipAction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__CKOnboardingController__presentMemojiCreationIfNeeded_skipAction___block_invoke;
  v10[3] = &unk_1E2755830;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[CKOnboardingController _fetchMemojiWithCompletionBlock:](self, "_fetchMemojiWithCompletionBlock:", v10);

}

_QWORD *__68__CKOnboardingController__presentMemojiCreationIfNeeded_skipAction___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD *v4;

  if (a3 || (a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAvatarRecord:");
    v4 = (_QWORD *)(a1 + 40);
  }
  else
  {
    v4 = (_QWORD *)(a1 + 48);
  }
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v4 + 16))(v4);
}

- (OBWelcomeFullCenterContentController)_memojiCreationController
{
  OBWelcomeFullCenterContentController *memojiCreationController;
  OBWelcomeFullCenterContentController **p_memojiCreationController;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
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
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  p_memojiCreationController = &self->_memojiCreationController;
  memojiCreationController = self->_memojiCreationController;
  if (memojiCreationController)
    return memojiCreationController;
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_MEMOJI_CREATION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_MEMOJI_CREATION_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = objc_claimAutoreleasedReturnValue();

  v42 = (void *)v9;
  v43 = (void *)v7;
  v10 = (void *)objc_msgSend(objc_alloc((Class)_CKOBWelcomeFullCenterContentController), "initWithTitle:detailText:symbolName:contentLayout:", v7, v9, 0, 3);
  _CKAVTAvatarEditorSplashVideo();
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B350], "playerWithPlayerItem:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAllowsExternalPlayback:", 0);
  -[CKOnboardingController setMemojiVideoPlayer:](self, "setMemojiVideoPlayer:", v12);
  v41 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0C8B338], "playerLooperWithPlayer:templateItem:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKOnboardingController setMemojiVideoPlayerLooper:](self, "setMemojiVideoPlayerLooper:", v13);

  v14 = objc_alloc_init((Class)_CKAVPlayerViewController);
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v16);

  objc_msgSend(v14, "setPlayer:", v12);
  objc_msgSend(v14, "setShowsPlaybackControls:", 0);
  objc_msgSend(v10, "addChildViewController:", v14);
  objc_msgSend(v14, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCenteredContentView:", v17);

  objc_msgSend(v14, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (!CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v44, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v18;
    objc_msgSend(v44, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v40 = v12;
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v23);
    objc_msgSend(v44, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "widthAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v28) = 1132068864;
    objc_msgSend(v27, "setPriority:", v28);
    objc_msgSend(v27, "setActive:", 1);

    v12 = v40;
  }
  objc_msgSend((id)_CKOBBoldTrayButton, "boldButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("GET_STARTED"), &stru_1E276D870, CFSTR("ChatKit"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTitle:forState:", v31, 0);

  objc_msgSend(v29, "addTarget:action:forControlEvents:", self, sel_presentMemojiSetup, 64);
  objc_msgSend(v10, "buttonTray");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addButton:", v29);

  objc_msgSend((id)_CKOBLinkTrayButton, "linkButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SETUP_LATER_MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTitle:forState:", v35, 0);

  objc_msgSend(v33, "addTarget:action:forControlEvents:", self, sel_pushNameAndPhotoSharingIntroStepIfNeeded, 64);
  objc_msgSend(v10, "buttonTray");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addButton:", v33);

  objc_storeStrong((id *)p_memojiCreationController, v10);
  return (OBWelcomeFullCenterContentController *)v10;
}

- (void)pushMemojiCreationStep
{
  void *v3;
  id v4;

  -[CKOnboardingController _memojiCreationController](self, "_memojiCreationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKOnboardingController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CKOnboardingController _pushOnboardingViewController:animated:](self, "_pushOnboardingViewController:animated:", v4, 1);
  else
    -[CKOnboardingController presentOnboarding:](self, "presentOnboarding:", v4);
  _CKAVTUISetHasDisplayedSplashScreen(1);

}

- (void)presentMemojiSetup
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)_CKAVTAvatarEditorViewController;
  -[CKOnboardingController avatarStore](self, "avatarStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForCreatingAvatarInStore:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDelegate:", self);
  -[CKOnboardingController _pushOnboardingViewController:animated:](self, "_pushOnboardingViewController:animated:", v5, 1);

}

- (id)contactForNicknameOnboarding
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D397A8], "keysForNicknameHandling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchMeContactWithKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[CKMeCardSharingNameProvider nameContactForPrimaryAccount](CKMeCardSharingNameProvider, "nameContactForPrimaryAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_nameAndPhotoSharingIntroController
{
  void *v3;
  void *v4;
  CKNicknameIntroViewController *v5;
  CKNicknamePreviewView *v6;
  void *v7;
  CKNicknamePreviewView *v8;
  void *v9;
  void *v10;
  CKOnboardingBoldButtonProvider *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_NAME_AND_PHOTO_SHARING_DETAIL_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_NAME_AND_PHOTO_SHARING_DETAIL_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[CKNicknameIntroViewController initWithTitle:detailText:icon:contentLayout:]([CKNicknameIntroViewController alloc], "initWithTitle:detailText:icon:contentLayout:", v28, v27, 0, 1);
  -[CKOnboardingController contactForNicknameOnboarding](self, "contactForNicknameOnboarding");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [CKNicknamePreviewView alloc];
  -[CKOnboardingController avatarRecord](self, "avatarRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKNicknamePreviewView initWithContact:avatarRecord:](v6, "initWithContact:avatarRecord:", v26, v7);

  -[CKNicknamePreviewView avatarItemProviderConfiguration](v8, "avatarItemProviderConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKOnboardingController setAvatarItemProviderConfiguration:](self, "setAvatarItemProviderConfiguration:", v9);

  -[CKNicknameIntroViewController contentView](v5, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v8);

  -[CKNicknameIntroViewController setNicknamePreviewView:](v5, "setNicknamePreviewView:", v8);
  -[CKNicknamePreviewView setNeedsLayout](v8, "setNeedsLayout");
  -[CKNicknamePreviewView layoutIfNeeded](v8, "layoutIfNeeded");
  -[CKNicknamePreviewView sizeToFit](v8, "sizeToFit");
  v11 = objc_alloc_init(CKOnboardingBoldButtonProvider);
  -[CKOnboardingBoldButtonProvider boldButton](v11, "boldButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = CKIsRunningInMacCatalyst();
  CKFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((_DWORD)v10)
    v15 = CFSTR("CONTINUE");
  else
    v15 = CFSTR("CHOOSE_NAME_AND_PHOTO");
  objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E276D870, CFSTR("ChatKit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:forState:", v16, 0);

  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_pushNameAndPhotoSharingConfigDataStep, 64);
  -[CKNicknameIntroViewController buttonTray](v5, "buttonTray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addButton:", v12);

  objc_msgSend((id)_CKOBLinkTrayButton, "linkButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CKIsRunningInMacCatalyst();
  CKFrameworkBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
    v22 = CFSTR("WHATS_NEW_SETUP_LATER");
  else
    v22 = CFSTR("WHATS_NEW_SETUP_LATER_SETTINGS");
  objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1E276D870, CFSTR("ChatKit"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:forState:", v23, 0);

  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel_completedOnboarding, 64);
  -[CKNicknameIntroViewController buttonTray](v5, "buttonTray");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addButton:", v18);

  return v5;
}

- (void)pushNameAndPhotoSharingIntroStepIfNeeded
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (-[CKOnboardingController _shouldShowNicknameOnboardingFlow](self, "_shouldShowNicknameOnboardingFlow")
    && _CKCNSharingProfileOnboardingFlowManager)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom"))
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "userInterfaceIdiom") == 1;

    }
    else
    {
      v5 = 1;
    }

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isNameAndPhotoC3Enabled");

    if (v7 && v5)
    {
      -[CKOnboardingController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentingViewControllerForOnboardingController:", self);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      -[CKOnboardingController sharedProfileOnboardingController](self, "sharedProfileOnboardingController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = objc_alloc((Class)_CKCNSharedProfileOnboardingController);
        objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "getContactStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v10, "initWithContactStore:", v12);
        -[CKOnboardingController setSharedProfileOnboardingController:](self, "setSharedProfileOnboardingController:", v13);

      }
      -[CKOnboardingController sharedProfileOnboardingController](self, "sharedProfileOnboardingController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "presentOnboardingFlowIfNeededForMode:fromViewController:", 0, v15);

    }
    else
    {
      -[CKOnboardingController pushNameAndPhotoSharingIntroStep](self, "pushNameAndPhotoSharingIntroStep");
    }
  }
  else
  {
    -[CKOnboardingController completedOnboarding](self, "completedOnboarding");
  }
}

- (void)flowManager:(id)a3 didFinishWithResult:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[CKOnboardingController _nicknameController](self, "_nicknameController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPersonalNicknameFromOnboardingResult:", v5);

  -[CKOnboardingController completedOnboarding](self, "completedOnboarding");
}

- (void)pushNameAndPhotoSharingIntroStep
{
  void *v3;
  id v4;

  -[CKOnboardingController _nameAndPhotoSharingIntroController](self, "_nameAndPhotoSharingIntroController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKOnboardingController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CKOnboardingController _pushOnboardingViewController:animated:](self, "_pushOnboardingViewController:animated:", v4, 1);
  else
    -[CKOnboardingController presentOnboarding:](self, "presentOnboarding:", v4);
  -[CKOnboardingController _writeDefaultNicknameOnboardingVersion](self, "_writeDefaultNicknameOnboardingVersion");

}

- (void)pushNameAndPhotoSharingConfigDataStep
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CKOnboardingController contactForNicknameOnboarding](self, "contactForNicknameOnboarding");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[CKMeCardSharingNameProvider nameProviderForContact:](CKMeCardSharingNameProvider, "nameProviderForContact:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[CKMeCardSharingNameProvider nameProviderForPrimaryAccount](CKMeCardSharingNameProvider, "nameProviderForPrimaryAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_alloc((Class)_CKCNSharingProfileOnboardingFlowManager);
  -[CKOnboardingController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKOnboardingController avatarRecord](self, "avatarRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKOnboardingController avatarItemProviderConfiguration](self, "avatarItemProviderConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithNavigationController:contact:avatarRecord:avatarItemProviderConfiguration:", v5, v11, v6, v7);

  objc_msgSend(v8, "setDelegate:", self);
  if (v8)
  {
    -[CKOnboardingController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setModalInPresentation:", 1);

    -[CKOnboardingController setNicknameFlowManager:](self, "setNicknameFlowManager:", v8);
    -[CKOnboardingController nicknameFlowManager](self, "nicknameFlowManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startFlow");

  }
  else
  {
    -[CKOnboardingController completedOnboardingWithCompletion:](self, "completedOnboardingWithCompletion:", 0);
  }

}

- (void)pushNameAndPhotoSharingConfigSharingPreferenceStep
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[CKOnboardingController _meCardSharingAudience](self, "_meCardSharingAudience");
  if (!v3)
  {
    -[CKOnboardingController _meCardSharingState](self, "_meCardSharingState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 1;
    objc_msgSend(v4, "setSharingAudience:", 1);

  }
  v5 = (void *)objc_msgSend(objc_alloc((Class)_CKCNMeCardSharingOnboardingAudienceViewController), "initWithSelectedSharingAudience:", v3);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setDelegate:", self);
    -[CKOnboardingController _pushOnboardingViewController:animated:](self, "_pushOnboardingViewController:animated:", v6, 1);
  }
  else
  {
    -[CKOnboardingController completedOnboardingWithCompletion:](self, "completedOnboardingWithCompletion:", 0);
  }

}

- (void)_pushOnboardingViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[CKOnboardingController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v10);

  if ((v8 & 1) == 0)
  {
    -[CKOnboardingController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v10, v4);

  }
}

- (void)onboardCollaborationApps
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sharedWithYouKeyExists");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v22 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Collaboration onboarding sharedWithYouKeyExists = %d", buf, 8u);
    }

  }
  if ((v4 & 1) != 0)
  {
    if (!-[CKOnboardingController currentCollaborationOnboardingVersion](self, "currentCollaborationOnboardingVersion"))
      -[CKOnboardingController _writeDefaultCollaborationOnboardingVersion](self, "_writeDefaultCollaborationOnboardingVersion");
    objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSharedWithYouEnabled");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(MEMORY[0x1E0D39AE8], "collaborationAppBundleIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v9)
    {
      v11 = *(_QWORD *)v18;
      *(_QWORD *)&v10 = 67109378;
      v16 = v10;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_msgSend(v6, "isSharedWithYouSetUpForApplicationWithBundleID:", v13, v16) & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v16;
                v22 = v7;
                v23 = 2112;
                v24 = v13;
                _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "App was not set up, setting Shared with You to %d for %@", buf, 0x12u);
              }

            }
            objc_msgSend(v6, "setSharedWithYouEnabled:forApplicationWithBundleID:", v7, v13);
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v9);
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Onboarding: sharedWithYouKey does not exist, skipping onboarding collaboration apps", buf, 2u);
    }

  }
}

- (OBWelcomeController)syndicationIntroController
{
  OBWelcomeController *syndicationIntroController;
  OBWelcomeController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CKSyndicationPageViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  OBWelcomeController *v34;
  void *v36;
  void *v37;
  CKOnboardingController *v38;
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
  CKOnboardingBoldButtonProvider *v54;
  _QWORD v55[6];

  v55[4] = *MEMORY[0x1E0C80C00];
  syndicationIntroController = self->_syndicationIntroController;
  if (!syndicationIntroController)
  {
    v4 = (OBWelcomeController *)objc_msgSend(objc_alloc((Class)_CKOBWelcomeController), "initWithTitle:detailText:icon:", &stru_1E276D870, &stru_1E276D870, 0);
    v54 = objc_alloc_init(CKOnboardingBoldButtonProvider);
    -[CKOnboardingBoldButtonProvider boldButton](v54, "boldButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:forState:", v7, 0);

    v53 = v5;
    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_enableSyndication, 64);
    -[OBWelcomeController buttonTray](v4, "buttonTray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addButton:", v5);

    objc_msgSend((id)_CKOBLinkTrayButton, "linkButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SETUP_EDIT_SETTINGS"), &stru_1E276D870, CFSTR("ChatKit"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setTitle:forState:", v52, 0);
    v51 = v9;
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_setUpSyndicationLater, 64);
    -[OBWelcomeController buttonTray](v4, "buttonTray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addButton:", v9);

    -[OBWelcomeController buttonTray](v4, "buttonTray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKOnboardingController setButtonTray:](self, "setButtonTray:", v12);

    v13 = objc_alloc_init(CKSyndicationPageViewController);
    -[CKSyndicationPageViewController setDelegate:](v13, "setDelegate:", self);
    -[OBWelcomeController addChildViewController:](v4, "addChildViewController:", v13);
    -[OBWelcomeController view](v4, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationPageViewController view](v13, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

    -[CKSyndicationPageViewController didMoveToParentViewController:](v13, "didMoveToParentViewController:", v4);
    -[OBWelcomeController view](v4, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[CKSyndicationPageViewController view](v13, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    v41 = (void *)MEMORY[0x1E0CB3718];
    -[CKSyndicationPageViewController view](v13, "view");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](v4, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v46;
    -[CKSyndicationPageViewController view](v13, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController buttonTray](v4, "buttonTray");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v40;
    -[CKSyndicationPageViewController view](v13, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](v4, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "widthAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v27;
    -[CKSyndicationPageViewController view](v13, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController buttonTray](v4, "buttonTray");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v31);
    v38 = self;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v33);

    v34 = v38->_syndicationIntroController;
    v38->_syndicationIntroController = v4;

    syndicationIntroController = v38->_syndicationIntroController;
  }
  return syndicationIntroController;
}

- (void)pushSyndicationIntroStep
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CKOnboardingController syndicationIntroController](self, "syndicationIntroController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKOnboardingController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[CKOnboardingController navigationController](self, "navigationController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Push Syndication onboarding, navigationController: %@", (uint8_t *)&v9, 0xCu);

      }
    }
    -[CKOnboardingController _pushOnboardingViewController:animated:](self, "_pushOnboardingViewController:animated:", v3, 1);
  }
  else
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Present Syndication onboarding", (uint8_t *)&v9, 2u);
      }

    }
    -[CKOnboardingController presentOnboarding:](self, "presentOnboarding:", v3);
  }

}

- (void)enableSyndication
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Enabling syndication for SharedWithYouEnabled and all apps", v5, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedWithYouEnabled:", 1);

  -[CKOnboardingController initializeBundleIDsInAppPreferences:](self, "initializeBundleIDsInAppPreferences:", 1);
  -[CKOnboardingController _writeDefaultSyndicationOnboardingVersion](self, "_writeDefaultSyndicationOnboardingVersion");
  -[CKOnboardingController completedOnboarding](self, "completedOnboarding");
}

- (void)setUpSyndicationLater
{
  void *v3;
  id v4;

  -[CKOnboardingController enableSyndication](self, "enableSyndication");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=MESSAGES&path=SHARED_WITH_YOU_BUTTON"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v4, 0);

  -[CKOnboardingController completedOnboarding](self, "completedOnboarding");
}

- (void)initializeBundleIDsInAppPreferences:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultAppBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39AE8], "collaborationAppBundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager", (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSharedWithYouEnabled:forApplicationWithBundleID:", v3, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  objc_msgSend(a3, "presentedViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CKOnboardingController navigationController](self, "navigationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v4)
  {
    -[CKOnboardingController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKOnboardingController syndicationIntroController](self, "syndicationIntroController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if (v8)
    {
      -[CKOnboardingController _writeDefaultSyndicationOnboardingVersion](self, "_writeDefaultSyndicationOnboardingVersion");
      -[CKOnboardingController setSyndicationIntroController:](self, "setSyndicationIntroController:", 0);
    }
  }
  else
  {

  }
}

- (void)completedOnboarding
{
  -[CKOnboardingController completedOnboardingWithCompletion:](self, "completedOnboardingWithCompletion:", 0);
}

- (void)completedOnboardingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Onboarding completed", v11, 2u);
    }

  }
  -[CKOnboardingController setPendingMeCardSharingResult:](self, "setPendingMeCardSharingResult:", 0);
  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("OnboardingFinishTime"));

  -[CKOnboardingController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v4);

  -[CKOnboardingController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "onboardingControllerDidFinish:", self);

}

- (id)_nicknameController
{
  return (id)objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
}

- (void)_writeDefaultWhatsNewDidShow
{
  int64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[CKOnboardingController _whatsNewVersion](self, "_whatsNewVersion");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 134217984;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Writing WhatsNewInMessagessVersion %ld", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteger:forKey:", v3, CFSTR("whatsNewInMessagesVersion"));

}

- (void)_writeDefaultNicknameOnboardingVersion
{
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 134218242;
      v6 = 1;
      v7 = 2112;
      v8 = CFSTR("NicknameOnboardingVersion");
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Writing %li for %@", (uint8_t *)&v5, 0x16u);
    }

  }
  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", 1, CFSTR("NicknameOnboardingVersion"));

}

- (void)_writeDefaultSyndicationOnboardingVersion
{
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 134218242;
      v6 = 3;
      v7 = 2112;
      v8 = CFSTR("SyndicationOnboardingVersion");
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Writing %li for %@", (uint8_t *)&v5, 0x16u);
    }

  }
  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", 3, CFSTR("SyndicationOnboardingVersion"));

}

- (void)_writeDefaultCollaborationOnboardingVersion
{
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 134218242;
      v6 = 1;
      v7 = 2112;
      v8 = CFSTR("CollaborationOnboardingVersion");
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Writing %li for %@", (uint8_t *)&v5, 0x16u);
    }

  }
  -[CKOnboardingController _userDefaults](self, "_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", 1, CFSTR("CollaborationOnboardingVersion"));

}

- (int64_t)_whatsNewVersion
{
  return 5;
}

- (int64_t)_whatsNewLatestShippingVersion
{
  return 5;
}

- (id)_meCardSharingState
{
  return (id)objc_msgSend(MEMORY[0x1E0D398E8], "sharedInstance");
}

- (BOOL)_meCardSharingEnabled
{
  void *v2;
  char v3;

  -[CKOnboardingController _meCardSharingState](self, "_meCardSharingState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharingEnabled");

  return v3;
}

- (unint64_t)_meCardSharingNameFormat
{
  void *v2;
  unint64_t v3;

  -[CKOnboardingController _meCardSharingState](self, "_meCardSharingState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nameFormat");

  return v3;
}

- (unint64_t)_meCardSharingAudience
{
  void *v2;
  unint64_t v3;

  -[CKOnboardingController _meCardSharingState](self, "_meCardSharingState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharingAudience");

  return v3;
}

- (void)sharingPickerDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "sharingEnabled"))
  {
    -[CKOnboardingController _meCardSharingState](self, "_meCardSharingState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSharingEnabled:", objc_msgSend(v7, "sharingEnabled"));

    -[CKOnboardingController _meCardSharingState](self, "_meCardSharingState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSharingAudience:", objc_msgSend(v7, "selectedSharingAudience"));

    -[CKOnboardingController _meCardSharingState](self, "_meCardSharingState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNameFormat:", objc_msgSend(v7, "selectedNameFormat"));

  }
  -[CKOnboardingController completedOnboarding](self, "completedOnboarding");

}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  -[CKOnboardingController setAvatarRecord:](self, "setAvatarRecord:", a4);
  -[CKOnboardingController pushNameAndPhotoSharingIntroStepIfNeeded](self, "pushNameAndPhotoSharingIntroStepIfNeeded");
}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  id v3;
  id v4;

  -[CKOnboardingController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)meCardSharingOnboardingEditController:(id)a3 didFinishWithOnboardingResult:(id)a4
{
  -[CKOnboardingController setPendingMeCardSharingResult:](self, "setPendingMeCardSharingResult:", a4);
  -[CKOnboardingController pushNameAndPhotoSharingConfigSharingPreferenceStep](self, "pushNameAndPhotoSharingConfigSharingPreferenceStep");
}

- (void)meCardSharingOnboardingAudienceViewControllerDidFinish:(id)a3 withSharingAudience:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CKOnboardingController _meCardSharingState](self, "_meCardSharingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSharingEnabled:", 1);

  -[CKOnboardingController _meCardSharingState](self, "_meCardSharingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSharingAudience:", a4);

  -[CKOnboardingController pendingMeCardSharingResult](self, "pendingMeCardSharingResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[CKOnboardingController pendingMeCardSharingResult](self, "pendingMeCardSharingResult");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 134218242;
        v15 = a4;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Sharing audience chosen: %lu, sharing enabled, uploading pending me card sharing result: %@", (uint8_t *)&v14, 0x16u);

      }
    }
    -[CKOnboardingController _nicknameController](self, "_nicknameController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKOnboardingController pendingMeCardSharingResult](self, "pendingMeCardSharingResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updatePersonalNicknameIfNecessaryWithMeCardSharingResult:", v13);

  }
  -[CKOnboardingController completedOnboarding](self, "completedOnboarding");

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v5;

  if (self->_memojiCreationController != a4)
  {
    -[CKOnboardingController memojiVideoPlayer](self, "memojiVideoPlayer", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pause");

  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v5;

  if (self->_memojiCreationController == a4)
  {
    -[CKOnboardingController memojiVideoPlayer](self, "memojiVideoPlayer", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "play");

  }
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 30;
  else
    return 2;
}

- (CKOnboardingControllerDelegate)delegate
{
  return (CKOnboardingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (IMCloudKitSyncState)syncState
{
  return self->_syncState;
}

- (void)setSyncState:(id)a3
{
  objc_storeStrong((id *)&self->_syncState, a3);
}

- (int)micLayout
{
  return self->_micLayout;
}

- (void)setMicLayout:(int)a3
{
  self->_micLayout = a3;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void)setMemojiCreationController:(id)a3
{
  objc_storeStrong((id *)&self->_memojiCreationController, a3);
}

- (AVPlayer)memojiVideoPlayer
{
  return self->_memojiVideoPlayer;
}

- (void)setMemojiVideoPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_memojiVideoPlayer, a3);
}

- (AVPlayerLooper)memojiVideoPlayerLooper
{
  return self->_memojiVideoPlayerLooper;
}

- (void)setMemojiVideoPlayerLooper:(id)a3
{
  objc_storeStrong((id *)&self->_memojiVideoPlayerLooper, a3);
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (void)setAvatarStore:(id)a3
{
  objc_storeStrong((id *)&self->_avatarStore, a3);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (IMCNMeCardSharingResult)pendingMeCardSharingResult
{
  return self->_pendingMeCardSharingResult;
}

- (void)setPendingMeCardSharingResult:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMeCardSharingResult, a3);
}

- (CKCNSharingProfileOnboardingFlowManager)nicknameFlowManager
{
  return self->_nicknameFlowManager;
}

- (void)setNicknameFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameFlowManager, a3);
}

- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration
{
  return self->_avatarItemProviderConfiguration;
}

- (void)setAvatarItemProviderConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_avatarItemProviderConfiguration, a3);
}

- (CKCNSharedProfileOnboardingController)sharedProfileOnboardingController
{
  return self->_sharedProfileOnboardingController;
}

- (void)setSharedProfileOnboardingController:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileOnboardingController, a3);
}

- (BOOL)presentingFromPrefs
{
  return self->_presentingFromPrefs;
}

- (void)setPresentingFromPrefs:(BOOL)a3
{
  self->_presentingFromPrefs = a3;
}

- (BOOL)isUserInitiatedEditNameAndPhoto
{
  return self->_isUserInitiatedEditNameAndPhoto;
}

- (void)setIsUserInitiatedEditNameAndPhoto:(BOOL)a3
{
  self->_isUserInitiatedEditNameAndPhoto = a3;
}

- (void)setSyndicationIntroController:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationIntroController, a3);
}

- (OBButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTray, a3);
}

@end
