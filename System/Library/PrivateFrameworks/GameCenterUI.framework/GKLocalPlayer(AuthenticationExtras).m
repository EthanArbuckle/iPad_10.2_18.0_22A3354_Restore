@implementation GKLocalPlayer(AuthenticationExtras)

- (void)showSignInBannerForLocalPlayer:()AuthenticationExtras completionHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "utilityService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = *MEMORY[0x1E0D25228];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__GKLocalPlayer_AuthenticationExtras__showSignInBannerForLocalPlayer_completionHandler___block_invoke;
  v13[3] = &unk_1E59C8088;
  v14 = v6;
  v15 = v7;
  v13[4] = a1;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "getStoreBagValuesForKeys:handler:", v10, v13);

}

- (void)showBannerWithTitle:()AuthenticationExtras message:touchHandler:completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "dismissOnboardingUIIfPresent");
  objc_msgSend(a1, "setIsWelcomeOrSignInBannerEnqueued:", 1);
  +[GKNotificationBanner showBannerWithTitle:message:touchHandler:completionHandler:](GKNotificationBanner, "showBannerWithTitle:message:touchHandler:completionHandler:", v13, v12, v11, v10);

}

- (void)showWelcomeBannerWithTitle:()AuthenticationExtras message:touchHandler:completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "dismissOnboardingUIIfPresent");
  objc_msgSend(a1, "setIsWelcomeOrSignInBannerEnqueued:", 1);
  +[GKNotificationBanner showWelcomeBannerWithTitle:message:touchHandler:completionHandler:](GKNotificationBanner, "showWelcomeBannerWithTitle:message:touchHandler:completionHandler:", v13, v12, v11, v10);

}

- (BOOL)isWelcomeOrSignInBannerEnqueued
{
  return +[GKNotificationBanner isWelcomeOrSignInBannerEnqueued](GKNotificationBanner, "isWelcomeOrSignInBannerEnqueued");
}

- (uint64_t)setIsWelcomeOrSignInBannerEnqueued:()AuthenticationExtras
{
  return +[GKNotificationBanner setIsWelcomeOrSignInBannerEnqueued:](GKNotificationBanner, "setIsWelcomeOrSignInBannerEnqueued:");
}

- (void)showDashboardFromWelcomeBanner
{
  id v0;

  +[GKAccessPoint shared](GKAccessPoint, "shared");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "showDashboardWithState:handler:", -1, &__block_literal_global_44);

}

- (uint64_t)shouldShowOnBoardingUI
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_gkIsEligibleForOnboardingUI");

  return v1;
}

- (void)showOnboardingUIFromViewController:()AuthenticationExtras signInOrigin:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
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
  GKHostedAuthenticateViewController *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!*MEMORY[0x1E0D25460])
    v7 = (id)GKOSLoggers();
  v8 = (void *)*MEMORY[0x1E0D25478];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25478], OS_LOG_TYPE_INFO))
  {
    v24 = a4;
    v25 = v6;
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = v8;
    objc_msgSend(v9, "numberWithBool:", objc_msgSend(a1, "hasPhoto"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", GKIsAvatarEditingSupported());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isDefaultNickname"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "internal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "isDefaultPrivacyVisibility"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "internal");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithBool:", objc_msgSend(v20, "isDefaultContactsIntegrationConsent"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v15;
    v32 = 2112;
    v33 = v18;
    v34 = 2112;
    v35 = v21;
    _os_log_impl(&dword_1AB361000, v10, OS_LOG_TYPE_INFO, "showOnboardingUIFromViewController: starting onboarding flow\n Player Avatar: %@\n Can edit: %@\n Default Nickname: %@\n Default Privacy: %@\n Default Contacts Integration Consent: %@", buf, 0x34u);

    a4 = v24;
    v6 = v25;

  }
  v22 = objc_alloc_init(GKHostedAuthenticateViewController);
  -[GKHostedAuthenticateViewController setOrigin:](v22, "setOrigin:", a4);
  objc_msgSend(a1, "setSignInViewController:", v22);
  -[GKHostedAuthenticateViewController setCompletionHandler:](v22, "setCompletionHandler:", &__block_literal_global_24);
  -[GKHostedAuthenticateViewController setRemoteViewReadyHandler:](v22, "setRemoteViewReadyHandler:", &__block_literal_global_27);
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hideAccessPoint");

  -[GKHostedAuthenticateViewController continueWithMode:](v22, "continueWithMode:", 2);
  objc_msgSend(a1, "setShouldPreserveOnboardingUI:", 1);

}

- (void)authenticationShowGreenBuddyUIForLocalPlayer:()AuthenticationExtras withCompletionHandler:
{
  id v6;
  id v7;
  NSObject **v8;
  id v9;
  NSObject *v10;
  GKHostedAuthenticateViewController *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  GKHostedAuthenticateViewController *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (NSObject **)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v9 = (id)GKOSLoggers();
  v10 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v10, OS_LOG_TYPE_INFO, "authenticationShowGreenBuddyUIForLocalPlayer", buf, 2u);
  }
  objc_msgSend(a1, "reportAuthenticatingWithGreenBuddyInvocation");
  if ((objc_msgSend(MEMORY[0x1E0D252C0], "isGameCenter") & 1) == 0)
  {
    v11 = objc_alloc_init(GKHostedAuthenticateViewController);
    -[GKHostedAuthenticateViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 0);
    objc_msgSend(v6, "setSignInViewController:", v11);
    v12 = *v8;
    if (!*v8)
    {
      v13 = (id)GKOSLoggers();
      v12 = *v8;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl(&dword_1AB361000, v12, OS_LOG_TYPE_INFO, "Creating sign in view controller for authorise: %@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, a1);
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke;
    v22[3] = &unk_1E59C8158;
    objc_copyWeak(&v24, (id *)buf);
    v15 = v6;
    v23 = v15;
    -[GKHostedAuthenticateViewController setCompletionHandler:](v11, "setCompletionHandler:", v22);
    v16 = v14;
    v17 = 3221225472;
    v18 = __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke_3;
    v19 = &unk_1E59C8180;
    v20 = v15;
    v21 = a1;
    -[GKHostedAuthenticateViewController setRemoteViewReadyHandler:](v11, "setRemoteViewReadyHandler:", &v16);
    -[GKHostedAuthenticateViewController continueWithMode:](v11, "continueWithMode:", 1, v16, v17, v18, v19);
    objc_msgSend(a1, "setShowingInGameUI:", 1);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);

  }
}

- (void)authenticationShowSignInUIForLocalPlayer:()AuthenticationExtras origin:dismiss:
{
  id v8;
  id v9;
  NSObject **v10;
  id v11;
  NSObject *v12;
  GKHostedAuthenticateViewController *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28[2];
  uint8_t buf[4];
  GKHostedAuthenticateViewController *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (NSObject **)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v11 = (id)GKOSLoggers();
  v12 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v12, OS_LOG_TYPE_INFO, "authenticationShowSignInUIForLocalPlayer", buf, 2u);
  }
  objc_msgSend(a1, "reportAuthenticatingWithAuthKitInvocation");
  if (objc_msgSend(a1, "didShowOnboardingInOverlayWithSignInOrigin:", a4))
  {
    objc_msgSend(MEMORY[0x1E0D25AD0], "didShowFullscreen");
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v13 = (GKHostedAuthenticateViewController *)objc_claimAutoreleasedReturnValue();
    -[GKHostedAuthenticateViewController accountService](v13, "accountService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "didShowFullscreenSignIn");

LABEL_16:
    goto LABEL_17;
  }
  if ((objc_msgSend(MEMORY[0x1E0D252C0], "isGameCenter") & 1) == 0)
  {
    if (!objc_msgSend(v8, "enteringForeground")
      || (objc_msgSend(v8, "signInViewController"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
      || (v16 = objc_msgSend(a1, "isAuthenticating"), v15, v16))
    {
      v13 = objc_alloc_init(GKHostedAuthenticateViewController);
      objc_msgSend(v8, "setSignInViewController:", v13);
      v17 = *v10;
      if (!*v10)
      {
        v18 = (id)GKOSLoggers();
        v17 = *v10;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v30 = v13;
        v31 = 2112;
        v32 = v8;
        _os_log_impl(&dword_1AB361000, v17, OS_LOG_TYPE_INFO, "Creating sign in view controller for authenticate: %@ for localPlayer:%@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, a1);
      v19 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke;
      v25[3] = &unk_1E59C81D0;
      objc_copyWeak(v28, (id *)buf);
      v20 = v8;
      v26 = v20;
      v28[1] = a4;
      v27 = v9;
      -[GKHostedAuthenticateViewController setCompletionHandler:](v13, "setCompletionHandler:", v25);
      v23[0] = v19;
      v23[1] = 3221225472;
      v23[2] = __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke_3;
      v23[3] = &unk_1E59C7448;
      v24 = v20;
      -[GKHostedAuthenticateViewController setRemoteViewReadyHandler:](v13, "setRemoteViewReadyHandler:", v23);
      -[GKHostedAuthenticateViewController continueWithMode:](v13, "continueWithMode:", 0);
      objc_msgSend(MEMORY[0x1E0D25AD0], "didShowFullscreen");
      objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "accountService");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "didShowFullscreenSignIn");

      objc_msgSend(a1, "setShowingInGameUI:", 1);
      objc_destroyWeak(v28);
      objc_destroyWeak((id *)buf);
      goto LABEL_16;
    }
  }
LABEL_17:

}

- (uint64_t)alertView:()AuthenticationExtras didDismissWithButtonIndex:
{
  return objc_msgSend(a1, "setCurrentAlert:", 0);
}

- (void)showAccessPoint
{
  id v0;

  if ((objc_msgSend(MEMORY[0x1E0CB34D0], "_gkMainBundleIsGameCenterSystemProcess") & 1) == 0)
  {
    +[GKAccessPoint shared](GKAccessPoint, "shared");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "showAccessPoint");

  }
}

- (void)hideAccessPoint
{
  id v0;

  if ((objc_msgSend(MEMORY[0x1E0CB34D0], "_gkMainBundleIsGameCenterSystemProcess") & 1) == 0)
  {
    +[GKAccessPoint shared](GKAccessPoint, "shared");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "hideAccessPoint");

  }
}

- (void)reloadAccessPoint
{
  id v0;

  if ((objc_msgSend(MEMORY[0x1E0CB34D0], "_gkMainBundleIsGameCenterSystemProcess") & 1) == 0)
  {
    +[GKAccessPoint shared](GKAccessPoint, "shared");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "loadModels");

  }
}

- (uint64_t)didShowWelcomeBannerInOverlayWithNewUserState:()AuthenticationExtras uponReturnToForeground:
{
  uint64_t v6;
  void *v7;

  v6 = objc_msgSend(MEMORY[0x1E0D25330], "usesGameOverlayUI");
  if ((_DWORD)v6)
  {
    +[GKAccessPoint shared](GKAccessPoint, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configureIfNeeded");

    objc_msgSend(MEMORY[0x1E0D25330], "presentWelcomeBannerInOverlayWithReturnToForeground:newToGameCenter:", a4, a3);
  }
  return v6;
}

- (uint64_t)didShowOnboardingInOverlayWithSignInOrigin:()AuthenticationExtras
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0D25330], "usesGameOverlayUI");
  if ((_DWORD)v4)
    objc_msgSend(MEMORY[0x1E0D25330], "presentOnboardingFlowInOverlayWithOrigin:sceneIdentifier:", a3, 0);
  return v4;
}

- (void)updateAccessPointUponReturnToForeground
{
  int v0;
  void *v1;
  id v2;

  +[GKAccessPoint shared](GKAccessPoint, "shared");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isActive"))
  {
    v0 = objc_msgSend(MEMORY[0x1E0D25330], "usesGameOverlayUI");

    if (v0)
    {
      +[GKAccessPoint shared](GKAccessPoint, "shared");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "configureIfNeeded");

      objc_msgSend(MEMORY[0x1E0D25330], "presentAccessPointInOverlayUponReturnToForeground:", 1);
    }
  }
  else
  {

  }
}

@end
