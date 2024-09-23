@implementation CKAlertUtilities

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_didFinishCheckingMissingCarrierSetting
{
  void *v3;
  char v4;
  id v5;

  -[CKAlertUtilities delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKAlertUtilities delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didFinishCheckingMissingCarrierSetting");

  }
}

- (CKAlertUtilitiesProtocol)delegate
{
  return (CKAlertUtilitiesProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)checkMissingCarrierSetting
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "missingAlertTypeToNotify");
  if (v3)
    -[CKAlertUtilities _displayMissingInformationAlert:](self, "_displayMissingInformationAlert:", v3);
  else
    -[CKAlertUtilities _didFinishCheckingMissingCarrierSetting](self, "_didFinishCheckingMissingCarrierSetting");
}

+ (int64_t)missingAlertTypeToNotify
{
  void *v2;
  int64_t v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_getCTPhoneNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (objc_msgSend(MEMORY[0x1E0D39730], "IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:simID:", v2, 0))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "showMMSSetup");

    if (!v5)
    {
LABEL_7:
      v3 = 0;
      goto LABEL_27;
    }
    if (objc_msgSend(MEMORY[0x1E0D39730], "IMShouldShowMMSEmailAddress:simID:", v2, 0))
    {
      objc_msgSend(MEMORY[0x1E0D39730], "IMMMSEmailAddressToMatchForPhoneNumber:simID:", v2, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "length"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v15 = 138412290;
            v16 = v2;
            _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Missing email for phoneNumber: %@", (uint8_t *)&v15, 0xCu);
          }

        }
        v3 = 2;
        goto LABEL_26;
      }

    }
    if ((MEMORY[0x193FF3B1C](v2) & 1) != 0)
      goto LABEL_7;
    v7 = objc_msgSend((id)objc_opt_class(), "_isNumberEditable");
    objc_msgSend((id)objc_opt_class(), "_grabCTSIMStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (v7 && objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CA7818]))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v15 = 138412290;
          v16 = v2;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Missing phone for phoneNumber: %@", (uint8_t *)&v15, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("SkipMissingPhoneNumberAlert"));

      if (!v11)
      {
        v3 = 1;
        goto LABEL_26;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Bypassing missing phone alert, running in automation", (uint8_t *)&v15, 2u);
        }

      }
    }
    v3 = 0;
LABEL_26:

  }
LABEL_27:

  return v3;
}

+ (id)_getCTPhoneNumber
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_phoneNumberInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "_phoneNumberInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayPhoneNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_phoneNumberInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_phoneNumberInfo)
  {
    objc_msgSend((id)_phoneNumberInfo, "number");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
      return (id)_phoneNumberInfo;
  }
  objc_msgSend(a1, "coreTelephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedSubscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "getPhoneNumber:error:", v6, &v12);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = (void *)_phoneNumberInfo;
  _phoneNumberInfo = v7;

  if (!v8)
    return (id)_phoneNumberInfo;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Error occurred while trying to get CTPhoneNumberInfo - %@", buf, 0xCu);
    }

  }
  return 0;
}

+ (id)coreTelephonyClient
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_coreTelephonyClient;
  if (!_coreTelephonyClient)
  {
    v3 = objc_opt_new();
    v4 = (void *)_coreTelephonyClient;
    _coreTelephonyClient = v3;

    v2 = (void *)_coreTelephonyClient;
  }
  return v2;
}

+ (id)selectedSubscriptionContext
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)_selectedSubscriptionContext;
  if (_selectedSubscriptionContext)
    goto LABEL_2;
  objc_msgSend(a1, "coreTelephonyClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "getActiveContexts:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (!v6)
  {
    objc_msgSend(v5, "voicePreferred");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "findForUuid:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "context");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_selectedSubscriptionContext;
    _selectedSubscriptionContext = v11;

    v2 = (void *)_selectedSubscriptionContext;
LABEL_2:
    v3 = v2;
    return v3;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Error occurred while trying to get active contexts - %@", buf, 0xCu);
    }

  }
  v3 = 0;
  return v3;
}

- (void)checkFirstTimeRCS
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D39728], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "carrierRequiresFirstTimeOnAlert");

  if (v4)
    -[CKAlertUtilities _displayFirstTimeRCSAlert](self, "_displayFirstTimeRCSAlert");
}

+ (BOOL)_isNumberEditable
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  int v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_phoneNumberInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEditable");
  else
    v4 = 0;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(v3, "isEditable");
      v7 = CFSTR("NO");
      if (v6)
        v7 = CFSTR("YES");
      v9 = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Phone number: %@ - is editable: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  return v4 != 0;
}

+ (id)_grabCTSIMStatus
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "coreTelephonyClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedSubscriptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v3, "getSIMStatus:error:", v4, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v6;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Error occurred while trying to get SIM Status - %@", buf, 0xCu);
      }

    }
    v9 = 0;
  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a1, "selectedSubscriptionContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v5;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Sim status returned: %@ for selected subscription: %@", buf, 0x16u);

      }
    }
    v9 = v5;
  }

  return v9;
}

- (void)_displayMissingInformationAlert:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[5];

  if ((IMGetCachedDomainBoolForKey() & 1) != 0)
    return;
  v5 = (void *)MEMORY[0x1E0CEA2E0];
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MMS_INFORMATION_MISSING_CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __52__CKAlertUtilities__displayMissingInformationAlert___block_invoke;
  v26[3] = &unk_1E274B0D8;
  v26[4] = self;
  objc_msgSend(v5, "actionWithTitle:style:handler:", v7, 1, v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CEA2E0];
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MMS_INFORMATION_MISSING_SETTINGS"), &stru_1E276D870, CFSTR("ChatKit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __52__CKAlertUtilities__displayMissingInformationAlert___block_invoke_2;
  v25[3] = &unk_1E2755CE0;
  v25[4] = self;
  v25[5] = a3;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    CKFrameworkBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("MMS_PHONE_NUMBER_MISSING_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = CFSTR("MMS_PHONE_NUMBER_MISSING_BODY");
    goto LABEL_6;
  }
  v14 = 0;
  v15 = 0;
  if (a3 == 2)
  {
    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("MMS_EMAIL_MISSING_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = CFSTR("MMS_EMAIL_MISSING_BODY");
LABEL_6:
    objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1E276D870, CFSTR("ChatKit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v9);
  objc_msgSend(v21, "addAction:", v13);
  -[CKAlertUtilities delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    -[CKAlertUtilities delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "presentCKAlertController:", v21);

  }
}

uint64_t __52__CKAlertUtilities__displayMissingInformationAlert___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishCheckingMissingCarrierSetting");
}

uint64_t __52__CKAlertUtilities__displayMissingInformationAlert___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_showNetworkPrefs:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishCheckingMissingCarrierSetting");
}

- (void)_showNetworkPrefs:(int64_t)a3
{
  const __CFString *v3;
  void *v4;
  id v5;

  if (a3 == 2)
  {
    v3 = CFSTR("prefs:root=MESSAGES&path=MMS_EMAIL");
  }
  else
  {
    if (a3 != 1)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v3 = CFSTR("prefs:root=Phone&path=MY_NUMBER");
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v5, 0);

}

- (void)_displayFirstTimeRCSAlert
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
  _QWORD v19[5];

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FIRST_TIME_RCS_ALERT_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FIRST_TIME_RCS_ALERT_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA2E0];
  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FIRST_TIME_RCS_ALERT_OKAY"), &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __45__CKAlertUtilities__displayFirstTimeRCSAlert__block_invoke;
  v19[3] = &unk_1E274B0D8;
  v19[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v12);
  objc_msgSend(v8, "setPreferredAction:", v12);
  v13 = (void *)MEMORY[0x1E0CEA2E0];
  CKFrameworkBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FIRST_TIME_RCS_ALERT_CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v16);
  -[CKAlertUtilities delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[CKAlertUtilities delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presentCKAlertController:", v8);

  }
}

void __45__CKAlertUtilities__displayFirstTimeRCSAlert__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ctSubscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__im_subscriptionsWithRCSSupport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend((id)objc_opt_class(), "coreTelephonyClient");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        objc_msgSend(v9, "enableLazuli:withError:", v8, &v13);
        v10 = v13;

        if (v10 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v10;
            _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Error occurred while trying to enable Lazuli: %@", buf, 0xCu);
          }

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }

}

@end
