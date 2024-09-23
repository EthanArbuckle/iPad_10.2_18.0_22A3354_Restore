@implementation GKLocalPlayer(AuthenticationPrivate)

+ (id)authenticationPersonality
{
  if (sAuthenticationPersonality)
    return (id)sAuthenticationPersonality;
  objc_msgSend(MEMORY[0x24BE3A238], "localPlayer");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)setAuthenticationPersonality:()AuthenticationPrivate
{
  objc_storeStrong((id *)&sAuthenticationPersonality, obj);
}

+ (id)sharedLocalPlayerAuthenticator
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__GKLocalPlayer_AuthenticationPrivate__sharedLocalPlayerAuthenticator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLocalPlayerAuthenticator_onceToken != -1)
    dispatch_once(&sharedLocalPlayerAuthenticator_onceToken, block);
  return (id)sharedLocalPlayerAuthenticator_authenticator;
}

- (uint64_t)isAuthenticating
{
  void *v0;
  uint64_t v1;

  objc_msgSend((id)objc_opt_class(), "sharedLocalPlayerAuthenticator");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isAuthenticating");

  return v1;
}

- (void)_showWelcomeBannerWithSignInOrigin:()AuthenticationPrivate uponReturnToForeground:
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  char v23;
  char v24;
  uint8_t buf[16];

  if (!*MEMORY[0x24BE3A308])
    v7 = (id)GKOSLoggers();
  v8 = *MEMORY[0x24BE3A320];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219F71000, v8, OS_LOG_TYPE_INFO, "_showWelcomeBanner is called", buf, 2u);
  }
  objc_msgSend((id)objc_opt_class(), "sharedLocalPlayerAuthenticator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastAuthDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastAuthPlayerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = objc_msgSend(a1, "isBannerVisible");
  else
    v12 = 0;
  objc_msgSend(MEMORY[0x24BE3A178], "proxyForLocalPlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke;
  v18[3] = &unk_24DC27820;
  v23 = v12;
  v18[4] = a1;
  v19 = v11;
  v20 = v10;
  v21 = v9;
  v24 = a4;
  v22 = a3;
  v15 = v9;
  v16 = v10;
  v17 = v11;
  objc_msgSend(v14, "isAppUnlistedAndDisallowed:", v18);

}

- (uint64_t)startAuthenticationForExistingPrimaryPlayer
{
  return objc_msgSend(a1, "startAuthenticationForExistingPrimaryPlayerUponReturnToForeground:", 0);
}

- (void)startAuthenticationForExistingPrimaryPlayerUponReturnToForeground:()AuthenticationPrivate
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  char v8;

  objc_msgSend(a1, "reportAuthenticationStartForPlayer");
  v5 = (void *)MEMORY[0x24BE3A150];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKLocalPlayer+Authentication_iOS.m", 264, "-[GKLocalPlayer(AuthenticationPrivate) startAuthenticationForExistingPrimaryPlayerUponReturnToForeground:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke;
  v7[3] = &unk_24DC27898;
  v7[4] = a1;
  v8 = a3;
  objc_msgSend(v5, "named:execute:", v6, v7);

}

- (void)presentAuthenticationUIForLocalPlayer:()AuthenticationPrivate
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE3A238];
  v4 = a3;
  objc_msgSend(v3, "authenticationPersonality");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authenticationShowSignInUIForLocalPlayer:origin:dismiss:", v4, 1, 0);

}

- (uint64_t)showOnboardingUIWithSignInOrigin:()AuthenticationPrivate
{
  uint64_t result;

  result = objc_msgSend(a1, "didShowOnboardingInOverlayWithSignInOrigin:");
  if ((result & 1) == 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a1, "showOnboardingUIFromViewController:signInOrigin:", 0, a3);
  }
  return result;
}

- (uint64_t)authenticationDidCompleteWithError:()AuthenticationPrivate
{
  return objc_msgSend(a1, "authenticationDidCompleteWithError:signInOrigin:uponReturnToForeground:", a3, 0, 0);
}

- (uint64_t)authenticationDidCompleteWithError:()AuthenticationPrivate uponReturnToForeground:
{
  return objc_msgSend(a1, "authenticationDidCompleteWithError:signInOrigin:uponReturnToForeground:", a3, 0, a4);
}

- (uint64_t)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:
{
  return objc_msgSend(a1, "authenticationDidCompleteWithError:signInOrigin:uponReturnToForeground:", a3, a4, 0);
}

- (void)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:uponReturnToForeground:
{
  id v7;
  uint64_t *v8;
  id v9;
  os_log_t *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  os_log_t v18;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  id v35;
  NSObject *v36;
  int v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  int v58;
  char v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *log;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  int v80;
  _QWORD block[5];
  id v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  void *v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (uint64_t *)MEMORY[0x24BE3A308];
  if (!*MEMORY[0x24BE3A308])
    v9 = (id)GKOSLoggers();
  v10 = (os_log_t *)MEMORY[0x24BE3A320];
  v11 = *MEMORY[0x24BE3A320];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219F71000, v11, OS_LOG_TYPE_INFO, "authenticationDidCompleteWithError being called", buf, 2u);
  }
  objc_msgSend(a1, "currentAlert");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "currentAlert");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", 0);

    objc_msgSend(a1, "currentAlert");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dismissAnimated:", 1);

    objc_msgSend(a1, "setCurrentAlert:", 0);
  }
  if (objc_msgSend(a1, "validatingAccount"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __111__GKLocalPlayer_AuthenticationPrivate__authenticationDidCompleteWithError_signInOrigin_uponReturnToForeground___block_invoke;
    block[3] = &unk_24DC278C0;
    block[4] = a1;
    v82 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_msgSend(a1, "setValidatingAccount:", 0);

    goto LABEL_68;
  }
  objc_msgSend((id)objc_opt_class(), "sharedLocalPlayerAuthenticator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "authenticationDidComplete");
  objc_msgSend(a1, "setEnteringForeground:", 0);
  if ((objc_msgSend(a1, "shouldPreserveOnboardingUI") & 1) == 0)
  {
    objc_msgSend(a1, "removeActiveViewControllerAnimated:completionHandler:", 1, 0);
    objc_msgSend(a1, "setSignInViewController:", 0);
  }
  v80 = objc_msgSend(v7, "gkIsNotConnectedToInternetError");
  if (v80)
  {
    if (!*v8)
      v16 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2E0], OS_LOG_TYPE_DEBUG))
      -[GKLocalPlayer(AuthenticationPrivate) authenticationDidCompleteWithError:signInOrigin:uponReturnToForeground:].cold.4();
    objc_msgSend(a1, "reportAuthenticationErrorNoInternetConnection");
  }
  if (!objc_msgSend(a1, "isAuthenticated"))
  {
    objc_msgSend(v7, "description");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = *v8;
    if (v38)
    {
      if (!v39)
        v40 = (id)GKOSLoggers();
      v41 = (void *)*MEMORY[0x24BE3A2E0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2E0], OS_LOG_TYPE_ERROR))
        -[GKLocalPlayer(AuthenticationPrivate) authenticationDidCompleteWithError:signInOrigin:uponReturnToForeground:].cold.3(v41, v7);
    }
    else
    {
      if (!v39)
        v42 = (id)GKOSLoggers();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2E0], OS_LOG_TYPE_DEBUG))
        -[GKLocalPlayer(AuthenticationPrivate) authenticationDidCompleteWithError:signInOrigin:uponReturnToForeground:].cold.2();
    }
    objc_msgSend(MEMORY[0x24BE3A238], "localPlayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "authStartTimeStamp");
    v45 = v44;

    if (v45 <= 0.0)
    {
      v52 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "timeIntervalSince1970");
      v48 = v47;
      objc_msgSend(MEMORY[0x24BE3A238], "localPlayer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "authStartTimeStamp");
      *(double *)&v51 = v48 - v50;

      v52 = v51;
    }
    if (!*v8)
      v53 = (id)GKOSLoggers();
    v54 = *MEMORY[0x24BE3A300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
      -[GKLocalPlayer(AuthenticationPrivate) authenticationDidCompleteWithError:signInOrigin:uponReturnToForeground:].cold.1(v52, v54, v55);
    objc_msgSend(MEMORY[0x24BE3A278], "reporter");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "reportPlayerAuthenticationFailure:", v7);

    objc_msgSend(v15, "setLastAuthPlayerID:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "reloadAccessPoint");
      objc_msgSend(a1, "showAccessPoint");
    }
    objc_msgSend(MEMORY[0x24BDD1540], "userErrorForCode:underlyingError:", 6, v7);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "callAuthHandlerWithError:", v57);

    goto LABEL_62;
  }
  if (!*v8)
    v17 = (id)GKOSLoggers();
  v18 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    v76 = a4;
    v77 = v15;
    v19 = (void *)MEMORY[0x24BDD16E0];
    v20 = (void *)MEMORY[0x24BE3A260];
    log = v18;
    objc_msgSend(v20, "shared");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithBool:", objc_msgSend(v75, "isAddingFriendsRestricted"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE3A260], "shared");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithBool:", objc_msgSend(v74, "isMultiplayerGamingRestricted"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE3A260], "shared");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithBool:", objc_msgSend(v73, "isGameCenterRestricted"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE3A260], "shared");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "numberWithBool:", objc_msgSend(v71, "isCustomizedCommunicationRestricted"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE3A260], "shared");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithBool:", objc_msgSend(v70, "isNearbyMultiplayerRestricted"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE3A260], "shared");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithBool:", objc_msgSend(v69, "isProfileModificationRestricted"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE3A260], "shared");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithBool:", objc_msgSend(v68, "isProfilePrivacyModificationRestricted"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE3A260], "shared");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v65, "multiplayerAllowedPlayerType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE3A260], "shared");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithBool:", objc_msgSend(v31, "isFriendsSharingRestricted"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414338;
    v84 = v78;
    v85 = 2112;
    v86 = v66;
    v87 = 2112;
    v88 = v23;
    v89 = 2112;
    v90 = v67;
    v91 = 2112;
    v92 = v63;
    v93 = 2112;
    v94 = v64;
    v95 = 2112;
    v96 = v62;
    v97 = 2112;
    v98 = v29;
    v99 = 2112;
    v100 = v32;
    _os_log_impl(&dword_219F71000, log, OS_LOG_TYPE_INFO, "Screen-Time Restrictions:                    \n\taddingFriendsRestricted : %@,                    \n\tmultiplayerGamingRestricted : %@,                    \n\tgameCenterRestricted : %@,                    \n\tcustomizedCommunicationRestricted : %@,                    \n\tnearbyMultiplayerRestricted : %@,                    \n\tprofileModificationRestricted : %@,                    \n\tprofilePrivacyModificationRestricted : %@                    \n\t,multiplayerAllowedPlayerType : %@,                    \n\tfriendsSharingRestricted : %@", buf, 0x5Cu);

    a4 = v76;
    v10 = (os_log_t *)MEMORY[0x24BE3A320];

    v8 = (uint64_t *)MEMORY[0x24BE3A308];
    v15 = v77;

  }
  objc_msgSend(a1, "reportAuthenticationPlayerAuthenticated");
  v33 = v80 ^ 1;
  if (!v7)
    v33 = 1;
  if ((v33 & 1) != 0)
  {
    if (!v7)
      goto LABEL_26;
LABEL_42:
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "reloadAccessPoint");
      objc_msgSend(a1, "showAccessPoint");
    }
    goto LABEL_46;
  }
  objc_msgSend(a1, "gamePlayerID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
    goto LABEL_42;
LABEL_26:
  if (!*v8)
    v35 = (id)GKOSLoggers();
  v36 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219F71000, v36, OS_LOG_TYPE_INFO, "authenticationDidCompleteWithError:Local Player Authenticated", buf, 2u);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v37 = objc_msgSend(a1, "shouldShowOnBoardingUI");
    if (a4 != 7 && v37 && objc_msgSend(a1, "shouldShowAnyOnboardingScreen"))
    {
      if ((objc_msgSend(a1, "shouldPreserveOnboardingUI") & 1) == 0)
        objc_msgSend(a1, "showOnboardingUIWithSignInOrigin:", a4);
      goto LABEL_62;
    }
  }
  objc_msgSend(a1, "_showWelcomeBannerWithSignInOrigin:uponReturnToForeground:", a4, a5);
LABEL_46:
  objc_msgSend(a1, "callAuthHandlerWithError:", v7);
LABEL_62:
  objc_msgSend(a1, "setNewToGameCenter:", 0);
  v58 = objc_msgSend(MEMORY[0x24BE3A1A0], "isGameCenter");
  v59 = v80 ^ 1;
  if (!v7)
    v59 = 0;
  if ((v59 & 1) == 0 && !v58)
  {
    objc_msgSend(a1, "matchmaker");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "finishedAuthenticating");

    objc_msgSend(MEMORY[0x24BE3A2A0], "sharedTurnBasedEventHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "lookForEvent");

    objc_msgSend(MEMORY[0x24BE3A1A8], "fetchAndEmitMostRecentGameActivity");
  }

LABEL_68:
}

- (void)cancelAuthentication
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (!*MEMORY[0x24BE3A308])
    v2 = (id)GKOSLoggers();
  v3 = *MEMORY[0x24BE3A320];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219F71000, v3, OS_LOG_TYPE_INFO, "cancelAuthentication", v5, 2u);
  }
  objc_msgSend(a1, "reportAuthenticationLoginCanceled");
  objc_msgSend(MEMORY[0x24BDD1540], "userErrorForCode:underlyingError:", 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "authenticationDidCompleteWithError:", v4);

}

- (uint64_t)showAuthenticateViewControllerForGameCenter
{
  objc_msgSend(a1, "setValidatingAccount:", 0);
  return objc_msgSend(a1, "authenticationShowSignInUIForLocalPlayer:origin:dismiss:", a1, 0, 0);
}

- (void)applicationWillEnterForeground:()AuthenticationPrivate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "setAppIsInBackground:", 0);
  if (objc_msgSend(a1, "didAuthenticate") && (objc_msgSend(a1, "isAuthenticating") & 1) == 0)
  {
    objc_msgSend(a1, "currentAlert");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(a1, "currentAlert");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setDelegate:", 0);

      objc_msgSend(a1, "currentAlert");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dismissAnimated:", 1);

      objc_msgSend(a1, "setCurrentAlert:", 0);
    }
    objc_msgSend(a1, "setEnteringForeground:", 1);
    objc_msgSend((id)objc_opt_class(), "sharedLocalPlayerAuthenticator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reset");
    objc_msgSend(a1, "startAuthenticationForExistingPrimaryPlayerUponReturnToForeground:", 1);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", a1, sel_sharePlayEligibilityChanged_, *MEMORY[0x24BE3A0C8], 0);

}

- (void)sharePlayEligibilityChanged:()AuthenticationPrivate
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEligibleForGroupSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6 && (objc_msgSend(a1, "isAuthenticated") & 1) == 0)
  {
    if (!*MEMORY[0x24BE3A308])
      v7 = (id)GKOSLoggers();
    v8 = *MEMORY[0x24BE3A320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_219F71000, v8, OS_LOG_TYPE_INFO, "SharePlay is eligible. Calling startAuthenticationForExistingPrimaryPlayer.", v9, 2u);
    }
    objc_msgSend(a1, "startAuthenticationForExistingPrimaryPlayer");
  }

}

- (void)applicationDidEnterBackground:()AuthenticationPrivate
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:name:object:", a1, *MEMORY[0x24BE3A0C8], 0);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("GameControllerNavigation_GKGameBackgrounded"), 0, 0, 1);

}

- (void)_showViewControllerForLegacyApps:()AuthenticationPrivate
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(_QWORD, _QWORD);
  _QWORD v27[4];
  id v28;
  void *v29;
  id v30;
  id v31;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isAccountModificationRestricted") & 1) != 0)
  {
LABEL_18:

    goto LABEL_19;
  }
  v6 = objc_msgSend(MEMORY[0x24BE3A1A0], "isGameCenter");

  if ((v6 & 1) == 0)
  {
    v7 = v4;
    objc_opt_class();
    v5 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "visibleViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_opt_respondsToSelector();
    objc_msgSend(a1, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windows");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyWindow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "rootViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    objc_msgSend(v14, "rootViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v14, "rootViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      v17 = v14;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_12:
        v18 = MEMORY[0x24BDAC760];
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __73__GKLocalPlayer_AuthenticationPrivate___showViewControllerForLegacyApps___block_invoke;
        v27[3] = &unk_24DC278E8;
        v19 = v14;
        v28 = v19;
        v29 = a1;
        v30 = v7;
        v20 = v17;
        v31 = v20;
        v21 = (void (**)(_QWORD, _QWORD))MEMORY[0x220737704](v27);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "presentedViewController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v24[0] = v18;
            v24[1] = 3221225472;
            v24[2] = __73__GKLocalPlayer_AuthenticationPrivate___showViewControllerForLegacyApps___block_invoke_2;
            v24[3] = &unk_24DC27910;
            v26 = v21;
            v25 = v8;
            objc_msgSend(v25, "dismissViewControllerAnimated:completion:", 1, v24);

          }
          else
          {
            ((void (**)(_QWORD, void *))v21)[2](v21, v8);
          }
        }
        else
        {
          v23 = objc_alloc_init(MEMORY[0x24BDF70B0]);
          ((void (**)(_QWORD, id))v21)[2](v21, v23);

        }
        goto LABEL_18;
      }
      objc_msgSend(v13, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
    }

    goto LABEL_12;
  }
LABEL_19:

}

- (void)startLegacyAuthenticationWithCompletionHandler:()AuthenticationPrivate
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_msgSend(a1, "authenticateHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, a1);
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__GKLocalPlayer_AuthenticationPrivate__startLegacyAuthenticationWithCompletionHandler___block_invoke;
  v10[3] = &unk_24DC27938;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  objc_msgSend(a1, "setAuthenticateHandler:", v10);
  if (v5)
  {
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __87__GKLocalPlayer_AuthenticationPrivate__startLegacyAuthenticationWithCompletionHandler___block_invoke_2;
    block[3] = &unk_24DC27910;
    block[4] = a1;
    v9 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)dismissOnboardingUIIfPresent
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE3A238], "local");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "signInViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(MEMORY[0x24BE3A238], "local");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "signInViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:uponReturnToForeground:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_219F71000, a2, a3, "reportAuthenticationFailedForPlayer: Authentication failed for player in %g seconds", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

- (void)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:uponReturnToForeground:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_219F71000, v0, v1, "authenticationDidCompleteWithError: didn't find a player to log in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:uponReturnToForeground:.cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_1(&dword_219F71000, v3, v5, "authenticationDidCompleteWithError: Authentication failed for player with error: %@", (uint8_t *)&v6);

}

- (void)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:uponReturnToForeground:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_219F71000, v0, v1, "authenticationDidCompleteWithError: Error: No Internet Connection - will work offline if already authenticated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
