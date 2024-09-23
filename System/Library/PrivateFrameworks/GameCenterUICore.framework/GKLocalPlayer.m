@implementation GKLocalPlayer

void __43__GKLocalPlayer_Alerts__currentLocalPlayer__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE3A238], "local");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)currentLocalPlayer_sCurrentLocalPlayer;
  currentLocalPlayer_sCurrentLocalPlayer = v0;

  if ((objc_msgSend((id)currentLocalPlayer_sCurrentLocalPlayer, "isAuthenticated") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE3A238], "authenticatedLocalPlayers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isAuthenticated"))
    {
      objc_msgSend(v5, "internal");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)currentLocalPlayer_sCurrentLocalPlayer, "setInternal:", v3);

      v4 = objc_msgSend(v5, "isAuthenticated");
      objc_msgSend((id)currentLocalPlayer_sCurrentLocalPlayer, "setAuthenticated:", v4);
    }

  }
}

void __70__GKLocalPlayer_AuthenticationPrivate__sharedLocalPlayerAuthenticator__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "localPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayerAuthenticator authenticatorForExistingPlayer:](GKLocalPlayerAuthenticator, "authenticatorForExistingPlayer:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedLocalPlayerAuthenticator_authenticator;
  sharedLocalPlayerAuthenticator_authenticator = v1;

}

void __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke(uint64_t a1, int a2)
{
  int v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject **v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[4];
  id v46;
  uint8_t buf[4];
  const __CFString *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 72))
  {
    v3 = 0;
  }
  else
  {
    +[GKWelcomeBannerVisibility shared](GKWelcomeBannerVisibility, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isShowingRemoteUI") & 1) != 0)
      v3 = 0;
    else
      v3 = objc_msgSend(*(id *)(a1 + 32), "shouldDisplayWelcomeBannerForPlayer:lastAuthDate:remoteUI:timeBetweenBanners:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *MEMORY[0x24BE3A2C0], 0.0) & (a2 ^ 1);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
  v8 = v7;

  v9 = (NSObject **)MEMORY[0x24BE3A308];
  if (!*MEMORY[0x24BE3A308])
    v10 = (id)GKOSLoggers();
  v11 = *MEMORY[0x24BE3A320];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
  {
    if ((v3 & (v8 >= 480.0)) != 0)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v48 = v12;
    _os_log_impl(&dword_219F71000, v11, OS_LOG_TYPE_INFO, "_showWelcomeBanner will show Welcome Banner? %@", buf, 0xCu);
  }
  v13 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playerID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setLastAuthPlayerID:", v15);

  if (v3)
  {
    if (v8 < 480.0)
    {
      objc_msgSend(*v13, "updateAccessPointUponReturnToForeground");
      return;
    }
    if ((objc_msgSend(*v13, "didShowWelcomeBannerInOverlayWithNewUserState:uponReturnToForeground:", objc_msgSend(*v13, "isNewToGameCenter"), *(unsigned __int8 *)(a1 + 73)) & 1) != 0)return;
    objc_msgSend(MEMORY[0x24BE3A238], "local");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hideAccessPoint");

    if (objc_msgSend(*v13, "isWelcomeBannerTooLate"))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(*v13, "reloadAccessPoint");
        objc_msgSend(*v13, "showAccessPoint");
      }
      return;
    }
    objc_msgSend(*v13, "alias");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v13, "internal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isDefaultNickname");

    objc_msgSend(*v13, "internal");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isDefaultPrivacyVisibility");

    objc_msgSend(*v13, "internal");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isDefaultContactsIntegrationConsent");

    if (!*v9)
      v24 = (id)GKOSLoggers();
    v25 = (void *)*MEMORY[0x24BE3A2F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2F0], OS_LOG_TYPE_INFO))
    {
      v26 = (void *)MEMORY[0x24BDD16E0];
      v27 = v25;
      objc_msgSend(v26, "numberWithBool:", v19);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v21);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v48 = v17;
      v49 = 2112;
      v50 = v28;
      v51 = 2112;
      v52 = v29;
      v53 = 2112;
      v54 = v30;
      _os_log_impl(&dword_219F71000, v27, OS_LOG_TYPE_INFO, "is the current player nickname? (%@) a default nickname? (%@) default privacy? (%@) default Contacts Integration Consent? (%@)", buf, 0x2Au);

    }
    v31 = *v13;
    if (v17)
    {
      objc_msgSend(v31, "isNewToGameCenter");
    }
    else
    {
      objc_msgSend(v31, "displayNameWithOptions:", 0);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v36 = *v9;
        if (!*v9)
        {
          v37 = (id)GKOSLoggers();
          v36 = *v9;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_cold_2((uint64_t *)(a1 + 32), v36);
        objc_msgSend(*v13, "isNewToGameCenter");
        GKGameCenterUIFrameworkBundle();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        goto LABEL_37;
      }
      objc_msgSend(*v13, "isNewToGameCenter");
    }
    v32 = (void *)MEMORY[0x24BDD17C8];
    GKGameCenterUIFrameworkBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringWithFormat:", v34, v17);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_37:
    objc_initWeak((id *)buf, *v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (*(_QWORD *)(a1 + 64))
      {
        objc_msgSend(MEMORY[0x24BE3A288], "stringForOrigin:");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = 0;
      }
      objc_msgSend(MEMORY[0x24BE3A138], "reporter");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "recordPageWithID:pageContext:pageType:refApp:", CFSTR("welcomeBannerPage"), CFSTR("thirdParty"), CFSTR("welcomeBanner"), v38);

      v41 = *v13;
      v42 = MEMORY[0x24BDAC760];
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_96;
      v45[3] = &unk_24DC277D0;
      objc_copyWeak(&v46, (id *)buf);
      v43[0] = v42;
      v43[1] = 3221225472;
      v43[2] = __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_2;
      v43[3] = &unk_24DC277F8;
      v43[4] = *v13;
      objc_copyWeak(&v44, (id *)buf);
      objc_msgSend(v41, "showWelcomeBannerWithTitle:message:touchHandler:completionHandler:", v35, 0, v45, v43);
      objc_destroyWeak(&v44);
      objc_destroyWeak(&v46);

    }
    else
    {
      if (!*v9)
        v39 = (id)GKOSLoggers();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
        __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_cold_1();
    }
    objc_destroyWeak((id *)buf);

  }
}

void __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_96(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(MEMORY[0x24BE3A138], "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), CFSTR("dashboard"), CFSTR("welcomeBanner"), CFSTR("welcomeBannerPage"), CFSTR("welcomeBanner"));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showDashboardFromWelcomeBanner");

}

void __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setIsWelcomeOrSignInBannerEnqueued:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "reloadAccessPoint");
  objc_msgSend(WeakRetained, "showAccessPoint");

}

void __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  char v8;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BE3A238], "localPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuthStartTimeStamp:", v4);

  objc_msgSend((id)objc_opt_class(), "sharedLocalPlayerAuthenticator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDidAuthenticate:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setInsideAuthenticatorInvocation:", 1);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke_2;
  v7[3] = &unk_24DC27870;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v6, "authenticateWithCompletionHandler:", v7);

}

void __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43;
  id v44;
  id v45;
  char v46;
  id buf[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v11, "accessPointIsOnAutomatically");
  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessPointIsOnAutomatically:", v12);

  v14 = objc_msgSend(v11, "accessPointShowHighlights");
  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessPointShowHighlights:", v14);

  v16 = objc_msgSend(v11, "accessPointLocation");
  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessPointLocation:", v16);

  if (v10)
  {
    if (!*MEMORY[0x24BE3A308])
      v18 = (id)GKOSLoggers();
    v19 = *MEMORY[0x24BE3A2E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2E0], OS_LOG_TYPE_ERROR))
      __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke_2_cold_1((uint64_t)v10, v19, v20);
  }
  v21 = v9;
  if (!v9)
    v21 = *(void **)(a1 + 32);
  v22 = v21;

  switch(a2)
  {
    case 0:
      if (!*MEMORY[0x24BE3A308])
        v25 = (id)GKOSLoggers();
      v26 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_219F71000, v26, OS_LOG_TYPE_INFO, "startAuthenticationForExistingPrimaryPlayer:Local Player Authentication: Success", (uint8_t *)buf, 2u);
      }
      v27 = *(unsigned __int8 *)(a1 + 40);
      v28 = v22;
      v29 = 0;
      goto LABEL_34;
    case 1:
      if (!*MEMORY[0x24BE3A308])
        v30 = (id)GKOSLoggers();
      v31 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_219F71000, v31, OS_LOG_TYPE_INFO, "startAuthenticationForExistingPrimaryPlayer:Local Player Authentication: Authentication Error", (uint8_t *)buf, 2u);
      }
      goto LABEL_33;
    case 2:
      if (!*MEMORY[0x24BE3A308])
        v32 = (id)GKOSLoggers();
      v33 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_219F71000, v33, OS_LOG_TYPE_INFO, "startAuthenticationForExistingPrimaryPlayer:Local Player Authentication: Show Green Buddy", (uint8_t *)buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BE3A238], "authenticationPersonality");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "authenticationShowGreenBuddyUIForLocalPlayer:withCompletionHandler:", v22, 0);

      break;
    case 3:
      objc_msgSend(v22, "signInViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        if (!*MEMORY[0x24BE3A308])
          v36 = (id)GKOSLoggers();
        v37 = *MEMORY[0x24BE3A320];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_219F71000, v37, OS_LOG_TYPE_INFO, "startAuthenticationForExistingPrimaryPlayer:Local Player Authentication: Show Password Change UI", (uint8_t *)buf, 2u);
        }
      }
      else
      {
LABEL_33:
        v27 = *(unsigned __int8 *)(a1 + 40);
        v28 = v22;
        v29 = v10;
LABEL_34:
        objc_msgSend(v28, "authenticationDidCompleteWithError:uponReturnToForeground:", v29, v27);
      }
      break;
    case 4:
    case 6:
      if (!*MEMORY[0x24BE3A308])
        v23 = (id)GKOSLoggers();
      v24 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_219F71000, v24, OS_LOG_TYPE_INFO, "startAuthenticationForExistingPrimaryPlayer:Local Player Authentication: Show Authentication UI", (uint8_t *)buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "presentAuthenticationUIForLocalPlayer:", v22);
      break;
    case 5:
      objc_initWeak(buf, *(id *)(a1 + 32));
      v38 = *(void **)(a1 + 32);
      v39 = MEMORY[0x24BDAC760];
      v40 = 3221225472;
      v41 = __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke_107;
      v42 = &unk_24DC27848;
      objc_copyWeak(&v45, buf);
      v43 = v22;
      v44 = v10;
      v46 = *(_BYTE *)(a1 + 40);
      objc_msgSend(v38, "showSignInBannerForLocalPlayer:completionHandler:", v43, &v39);

      objc_destroyWeak(&v45);
      objc_destroyWeak(buf);
      break;
    default:
      break;
  }
  objc_msgSend(*(id *)(a1 + 32), "setInsideAuthenticatorInvocation:", 0, v39, v40, v41, v42);

}

void __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke_107(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setShouldPreserveOnboardingUI:", 1);
  objc_msgSend(*(id *)(a1 + 32), "authenticationDidCompleteWithError:uponReturnToForeground:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

}

void __111__GKLocalPlayer_AuthenticationPrivate__authenticationDidCompleteWithError_signInOrigin_uponReturnToForeground___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "validateAccountCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "validateAccountCompletionHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "setValidateAccountCompletionHandler:", 0);
  }
}

void __73__GKLocalPlayer_AuthenticationPrivate___showViewControllerForLegacyApps___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setRotationDecider:", v3);
  objc_msgSend(*(id *)(a1 + 40), "setRootViewController:", v4);
  objc_msgSend(v4, "_presentViewController:sendingView:animated:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1);

}

uint64_t __73__GKLocalPlayer_AuthenticationPrivate___showViewControllerForLegacyApps___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __87__GKLocalPlayer_AuthenticationPrivate__startLegacyAuthenticationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "_showViewControllerForLegacyApps:", v8);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
  }

}

void __87__GKLocalPlayer_AuthenticationPrivate__startLegacyAuthenticationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isAuthenticated"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v2 = objc_msgSend(*(id *)(a1 + 32), "isAuthenticating");
      v3 = *(_QWORD *)(a1 + 40);
      if (v2)
        v4 = 7;
      else
        v4 = 2;
      objc_msgSend(MEMORY[0x24BDD1540], "userErrorForCode:underlyingError:", v4, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isAuthenticated"))
  {
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v14[0] = *MEMORY[0x24BE3A0F0];
      objc_msgSend(*(id *)(a1 + 32), "internal");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "playerID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v9;
      v14[1] = *MEMORY[0x24BE3A0E8];
      objc_msgSend(*(id *)(a1 + 32), "internal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "playerID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", *MEMORY[0x24BE3A0E0], *(_QWORD *)(a1 + 32), v12);

}

void __107__GKLocalPlayer_iOSAuthenticationUI__showViewController_usingPresentingViewController_wrapInNavController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "authenticateHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __91__GKLocalPlayer_iOSAuthenticationUI__removeActiveViewControllerAnimated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(void);
  void (**v4)(void);

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissCompletionHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      v3[2]();
      objc_msgSend(*(id *)(a1 + 32), "setDismissCompletionHandler:", 0);
      v3 = v4;
    }

  }
}

void __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_219F71000, v0, v1, "_showWelcomeBanner does not respond to selector showWelcomeBannerWithTitle:message:touchHandler:completionHandler:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_219F71000, a2, OS_LOG_TYPE_DEBUG, "name and alias missing for %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_219F71000, a2, a3, "startAuthenticationForExistingPrimaryPlayer:Failed to Authenticate player.Error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

@end
