@implementation CKFocusStatusAuthorizationManager

- (void)presentFocusStatusAuthorizationAlertIfNecessaryFromViewController:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint8_t v15[16];

  v4 = a3;
  if (CKIsRunningInMessages())
  {
    if (objc_msgSend(MEMORY[0x1E0D396B8], "isInAppleStoreDemoMode"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          v6 = "Not checking Focus Status Authorization. Device is in Apple Store Demo Mode.";
LABEL_32:
          _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, v6, v15, 2u);
          goto LABEL_33;
        }
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    if (-[CKFocusStatusAuthorizationManager isPresentingFocusStatusAuthorizationPrompt](self, "isPresentingFocusStatusAuthorizationPrompt"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          v6 = "Focus Status Authorization prompt is already presented, not re-presenting.";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    if (-[CKFocusStatusAuthorizationManager isPresentingInconsistentFocusStatusAuthorizationPrompt](self, "isPresentingInconsistentFocusStatusAuthorizationPrompt"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          v6 = "Inconsistent Focus Status Authorization prompt is already presented, not re-presenting.";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    if (!-[CKFocusStatusAuthorizationManager deviceSupportsFocusStatusAuthorizationPrompt](self, "deviceSupportsFocusStatusAuthorizationPrompt"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          v6 = "Not checking Focus Status Authorization. Device does not support prompting for Focus Status TCC.";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    if (CKIsRunningInMacCatalyst())
    {
      objc_msgSend(v4, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8
        || !+[CKApplicationState isWindowForegroundActive:](CKApplicationState, "isWindowForegroundActive:", v8))
      {
        if (!IMOSLoggingEnabled())
        {
LABEL_53:

          goto LABEL_34;
        }
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
LABEL_52:

          goto LABEL_53;
        }
        *(_WORD *)v15 = 0;
        v13 = "Not checking Focus Status Authorization. Messages window is not foreground active.";
LABEL_38:
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, v13, v15, 2u);
        goto LABEL_52;
      }

    }
    objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeIMessageAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_34;
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        goto LABEL_33;
      *(_WORD *)v15 = 0;
      v6 = "Not checking Focus Status Authorization. There is no active iMessage account.";
      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x1E0CBD8C8], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v8, "authorizationStatus"))
    {
      case 0:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Focus Status authorization status is not determined. Prompting for authorization.", v15, 2u);
          }

        }
        -[CKFocusStatusAuthorizationManager promptForFocusStatusAuthorizationFromViewController:](self, "promptForFocusStatusAuthorizationFromViewController:", v4);
        goto LABEL_53;
      case 1:
        IMLogHandleForCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[CKFocusStatusAuthorizationManager presentFocusStatusAuthorizationAlertIfNecessaryFromViewController:].cold.1();
        goto LABEL_52;
      case 2:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Focus Status authorization status is denied, checking for inconsistent cross-device state.", v15, 2u);
          }

        }
        -[CKFocusStatusAuthorizationManager verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController:](self, "verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController:", v4);
        goto LABEL_53;
      case 3:
        if (!IMOSLoggingEnabled())
          goto LABEL_53;
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          goto LABEL_52;
        *(_WORD *)v15 = 0;
        v13 = "Focus Status authorization status is authorized.";
        break;
      default:
        goto LABEL_53;
    }
    goto LABEL_38;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      v6 = "Not checking Focus Status Authorization. Not running in Messages.";
      goto LABEL_32;
    }
LABEL_33:

  }
LABEL_34:

}

- (BOOL)isPresentingInconsistentFocusStatusAuthorizationPrompt
{
  return self->_presentingInconsistentFocusStatusAuthorizationPrompt;
}

- (BOOL)isPresentingFocusStatusAuthorizationPrompt
{
  return self->_presentingFocusStatusAuthorizationPrompt;
}

- (BOOL)deviceSupportsFocusStatusAuthorizationPrompt
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "This device is capable of prompting for TCC", v4, 2u);
    }

  }
  return 1;
}

+ (CKFocusStatusAuthorizationManager)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_149);
  return (CKFocusStatusAuthorizationManager *)(id)sharedInstance_sharedInstance_1;
}

void __51__CKFocusStatusAuthorizationManager_sharedInstance__block_invoke()
{
  CKFocusStatusAuthorizationManager *v0;
  void *v1;

  v0 = objc_alloc_init(CKFocusStatusAuthorizationManager);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (void)promptForFocusStatusAuthorizationFromViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CBD8C8], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFocusStatusAuthorizationManager setPresentingFocusStatusAuthorizationPrompt:](self, "setPresentingFocusStatusAuthorizationPrompt:", 1);
  location = 0;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__CKFocusStatusAuthorizationManager_promptForFocusStatusAuthorizationFromViewController___block_invoke;
  v7[3] = &unk_1E2756750;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "requestAuthorizationWithCompletionHandler:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __89__CKFocusStatusAuthorizationManager_promptForFocusStatusAuthorizationFromViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setPresentingFocusStatusAuthorizationPrompt:", 0);
  objc_msgSend(WeakRetained, "notifyDNDFocusStatusAuthorizationChanged");
  switch(a2)
  {
    case 0:
      IMLogHandleForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __89__CKFocusStatusAuthorizationManager_promptForFocusStatusAuthorizationFromViewController___block_invoke_cold_1();
      goto LABEL_14;
    case 1:
      IMLogHandleForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __89__CKFocusStatusAuthorizationManager_promptForFocusStatusAuthorizationFromViewController___block_invoke_cold_2();
      goto LABEL_14;
    case 2:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Focus Status authorization was denied, after prompting for authorization. Checking for inconsistent cross-device state.", buf, 2u);
        }

      }
      objc_msgSend(WeakRetained, "verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController:", *(_QWORD *)(a1 + 32));
      goto LABEL_15;
    case 3:
      if (!IMOSLoggingEnabled())
        goto LABEL_15;
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Focus Status authorization status was authorized when prompting for authorization.", v7, 2u);
      }
LABEL_14:

LABEL_15:
      return;
    default:
      goto LABEL_15;
  }
}

- (void)notifyDNDFocusStatusAuthorizationChanged
{
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Notifying DND that focus status authorization has changed.", v5, 2u);
    }

  }
  v4 = -[CKFocusStatusAuthorizationManager newDNDGlobalConfigurationService](self, "newDNDGlobalConfigurationService");
  objc_msgSend(v4, "didChangeFocusStatusSharingSettingForApplicationIdentifier:", CFSTR("com.apple.MobileSMS"));

}

- (id)newDNDGlobalConfigurationService
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;

  v2 = (void *)MEMORY[0x193FF3C18](CFSTR("DNDGlobalConfigurationService"), CFSTR("DoNotDisturb"));
  if (v2)
  {
    objc_msgSend(v2, "serviceForClientIdentifier:", CFSTR("com.apple.messages"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v4 = v3;
      v5 = v4;
    }
    else
    {
      IMLogHandleForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CKFocusStatusAuthorizationManager newDNDGlobalConfigurationService].cold.2();

      v5 = 0;
    }
  }
  else
  {
    IMLogHandleForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CKFocusStatusAuthorizationManager newDNDGlobalConfigurationService].cold.1();
    v5 = 0;
  }

  return v5;
}

- (void)verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[8];

  v4 = a3;
  v5 = -[CKFocusStatusAuthorizationManager newDNDGlobalConfigurationService](self, "newDNDGlobalConfigurationService");
  if ((objc_msgSend(v5, "isCloudSyncActive") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D35838], "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Fetching personal availability to verify published status is consistent with denied focus status authorization.", buf, 2u);
      }

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __123__CKFocusStatusAuthorizationManager_verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController___block_invoke;
    v8[3] = &unk_1E2756750;
    objc_copyWeak(&v10, (id *)buf);
    v9 = v4;
    -[NSObject fetchPersonalAvailabilityWithCompletion:](v6, "fetchPersonalAvailabilityWithCompletion:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
LABEL_10:

    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Not verifying published status, share across devices is disabled for this device", buf, 2u);
    }
    goto LABEL_10;
  }
LABEL_11:

}

void __123__CKFocusStatusAuthorizationManager_verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 == 2)
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __123__CKFocusStatusAuthorizationManager_verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController___block_invoke_cold_2();

    objc_msgSend(WeakRetained, "displayFocusStatusAuthorizationInconsistencyRepairAlertIfNotPreviouslyShownFromViewController:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (a2 == 1)
    {
      IMLogHandleForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __123__CKFocusStatusAuthorizationManager_verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController___block_invoke_cold_1();
      goto LABEL_9;
    }
    if (!a2 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Personal availability is unknown. That is consistent with denied focus status authorization.", v7, 2u);
      }
LABEL_9:

    }
  }

}

- (void)displayFocusStatusAuthorizationInconsistencyRepairAlertIfNotPreviouslyShownFromViewController:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if ((IMGetCachedDomainBoolForKeyWithDefaultValue() & 1) != 0)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CKFocusStatusAuthorizationManager displayFocusStatusAuthorizationInconsistencyRepairAlertIfNotPreviouslyShownFromViewController:].cold.1();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Have not previously shown repair focus status authorization inconsistency repair alert, displaying now", v7, 2u);
      }

    }
    -[CKFocusStatusAuthorizationManager displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController:](self, "displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController:", v4);
  }

}

- (void)displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  v22 = a3;
  -[CKFocusStatusAuthorizationManager setPresentingInconsistentFocusStatusAuthorizationPrompt:](self, "setPresentingInconsistentFocusStatusAuthorizationPrompt:", 1);
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("INCONSISTENT_FOCUS_STATUS_AUTHORIZATION_ALERT_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = CKIsRunningInMacCatalyst();
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v4)
    v8 = CFSTR("INCONSISTENT_FOCUS_STATUS_AUTHORIZATION_ALERT_BODY_MAC");
  else
    v8 = CFSTR("INCONSISTENT_FOCUS_STATUS_AUTHORIZATION_ALERT_BODY");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)v5;
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CKIsRunningInMacCatalyst();
  CKFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
    v14 = CFSTR("INCONSISTENT_FOCUS_STATUS_AUTHORIZATION_SETTINGS_ACTION_TITLE_MAC");
  else
    v14 = CFSTR("INCONSISTENT_FOCUS_STATUS_AUTHORIZATION_SETTINGS_ACTION_TITLE");
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E276D870, CFSTR("ChatKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  location = 0;
  objc_initWeak(&location, self);
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __111__CKFocusStatusAuthorizationManager_displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController___block_invoke;
  v25[3] = &unk_1E274B7A0;
  objc_copyWeak(&v26, &location);
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v15, 0, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("INCONSISTENT_FOCUS_STATUS_AUTHORIZATION_CANCEL_ACTION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __111__CKFocusStatusAuthorizationManager_displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController___block_invoke_2;
  v23[3] = &unk_1E274B7A0;
  objc_copyWeak(&v24, &location);
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v19, 1, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v17);
  objc_msgSend(v10, "addAction:", v20);
  objc_msgSend(v10, "presentFromViewController:animated:completion:", v22, 1, 0);
  IMSetDomainBoolForKey();

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __111__CKFocusStatusAuthorizationManager_displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPresentingInconsistentFocusStatusAuthorizationPrompt:", 0);
  objc_msgSend(WeakRetained, "focusStatusPreferencesURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v1, 0);

}

void __111__CKFocusStatusAuthorizationManager_displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPresentingInconsistentFocusStatusAuthorizationPrompt:", 0);

}

- (id)focusStatusPreferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Privacy&path=FOCUS"));
}

- (void)setPresentingFocusStatusAuthorizationPrompt:(BOOL)a3
{
  self->_presentingFocusStatusAuthorizationPrompt = a3;
}

- (void)setPresentingInconsistentFocusStatusAuthorizationPrompt:(BOOL)a3
{
  self->_presentingInconsistentFocusStatusAuthorizationPrompt = a3;
}

- (void)presentFocusStatusAuthorizationAlertIfNecessaryFromViewController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Focus Status authorization status is restricted. Not recoverable. Taking no action.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __89__CKFocusStatusAuthorizationManager_promptForFocusStatusAuthorizationFromViewController___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Focus Status authorization status is not determined, after promting for authorization. Taking no action.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __89__CKFocusStatusAuthorizationManager_promptForFocusStatusAuthorizationFromViewController___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Focus Status authorization status is restricted, after prompting for authorization. Taking no action.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newDNDGlobalConfigurationService
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Unable to create DNDGlobalConfigurationService", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __123__CKFocusStatusAuthorizationManager_verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Personal availability is available. Having a published status is potentially inconsistent with denied focus status authorization, but the available state is consistent with the default UI. Not displaying repair TCC alert.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __123__CKFocusStatusAuthorizationManager_verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Personal availability is unavailable. This is inconsistent with a denied focus status authorization. This user will incorrectly appear unavailable to any person messaged, and there is no way to recover from this state as another device is likely publishing the status.  Displaying repair TCC alert if necessary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)displayFocusStatusAuthorizationInconsistencyRepairAlertIfNotPreviouslyShownFromViewController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Focus status authorization is inconsistent with published status, but user has already declined to fix this problem. We will not reprompt the user.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
