@implementation SAAuthorization

+ (BOOL)isInFlight
{
  void *v2;
  char v3;

  +[SAAuthorizationInFlight sharedInstance](SAAuthorizationInFlight, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInFlight");

  return v3;
}

+ (BOOL)currentConnectionAuthorizedForCrashDetection
{
  void *v2;
  void *v3;
  BOOL v4;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v7 = 0u;
  v8 = 0u;
  if (v2)
    objc_msgSend(v2, "auditToken");
  v6[0] = v7;
  v6[1] = v8;
  v4 = +[SAAuthorization auditTokenAuthorizedForCrashDetection:](SAAuthorization, "auditTokenAuthorizedForCrashDetection:", v6);

  return v4;
}

+ (BOOL)connectionAuthorizedForCrashDetection:(id)a3
{
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;

  v5 = 0u;
  v6 = 0u;
  if (a3)
    objc_msgSend(a3, "auditToken");
  v4[0] = v5;
  v4[1] = v6;
  return +[SAAuthorization auditTokenAuthorizedForCrashDetection:](SAAuthorization, "auditTokenAuthorizedForCrashDetection:", v4);
}

+ (BOOL)auditTokenAuthorizedForCrashDetection:(id *)a3
{
  return TCCAccessCheckAuditToken() != 0;
}

+ (BOOL)currentConnectionAuthorizedForAnyEmergency
{
  void *v2;
  void *v3;
  BOOL v4;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v7 = 0u;
  v8 = 0u;
  if (v2)
    objc_msgSend(v2, "auditToken");
  v6[0] = v7;
  v6[1] = v8;
  v4 = +[SAAuthorization auditTokenAuthorizedForCrashDetection:](SAAuthorization, "auditTokenAuthorizedForCrashDetection:", v6);

  return v4;
}

+ (BOOL)connectionAuthorizedForAnyEmergency:(id)a3
{
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;

  v5 = 0u;
  v6 = 0u;
  if (a3)
    objc_msgSend(a3, "auditToken");
  v4[0] = v5;
  v4[1] = v6;
  return +[SAAuthorization auditTokenAuthorizedForAnyEmergency:](SAAuthorization, "auditTokenAuthorizedForAnyEmergency:", v4);
}

+ (BOOL)auditTokenAuthorizedForAnyEmergency:(id *)a3
{
  return TCCAccessCheckAuditToken() != 0;
}

+ (int64_t)authorizationStatusWithTCCPreflightResult:(int)a3
{
  if (a3)
    return a3 == 1;
  else
    return 2;
}

+ (int64_t)authorizationStatusForCurrentConnection
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "auditToken");
  v4 = +[SAAuthorization authorizationStatusWithTCCPreflightResult:](SAAuthorization, "authorizationStatusWithTCCPreflightResult:", TCCAccessPreflightWithAuditToken(), (unsigned __int128)0, (unsigned __int128)0);

  return v4;
}

+ (BOOL)startAuthorizationForBundleURL:(id)a3 preflightAuthorizationStatus:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a5;
  +[SAAuthorizationInFlight sharedInstance](SAAuthorizationInFlight, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInFlight");
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v9, "setInFlight:", 1);
    objc_msgSend(v9, "setPreflightAuthorizationStatus:", a4);
    objc_msgSend(v9, "setCompletionHandler:", v8);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setToBundleId:", v12);

    objc_msgSend(v9, "toBundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SAAuthorization approvedAppExcludingBundleId:](SAAuthorization, "approvedAppExcludingBundleId:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFromApp:", v14);

    objc_msgSend(v9, "fromApp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFromBundleId:", v16);

    objc_msgSend((id)objc_opt_class(), "showAuthorizationPrompt");
  }

  return v10 ^ 1;
}

+ (id)approvedAppExcludingBundleId:(id)a3
{
  id v3;
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
  char v14;
  id v15;
  void *v16;
  char v17;
  id v19;

  v3 = a3;
  +[SABundleManager crashDetectionManager](SABundleManager, "crashDetectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "approvedApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
  {
    +[SAAuthorization SASyncedBundleId](SAAuthorization, "SASyncedBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v15 = 0;
      goto LABEL_19;
    }
    v19 = 0;
    +[SAAuthorization SASyncedBundleId](SAAuthorization, "SASyncedBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SABundleManager remoteApplicationWithBundleId:error:](SABundleManager, "remoteApplicationWithBundleId:error:", v10, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "bundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", v3))
      {

      }
      else
      {
        objc_msgSend(v11, "pairedBundleId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v3);

        if ((v17 & 1) == 0)
        {
          v15 = v11;
LABEL_18:

          goto LABEL_19;
        }
      }
    }
    if (!v19)
      +[SAAuthorization setThirdPartyBundleId:](SAAuthorization, "setThirdPartyBundleId:", 0);
    v15 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v3))
    {

    }
    else
    {
      objc_msgSend(v7, "pairedBundleId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v3);

      if ((v14 & 1) == 0)
      {
        v15 = v7;
        goto LABEL_11;
      }
    }
  }
  v15 = 0;
LABEL_11:

LABEL_19:
  return v15;
}

+ (id)approvedBundleId
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "approvedAppExcludingBundleId:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)showAuthorizationPrompt
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s - Authorization prompt for, authorization: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __42__SAAuthorization_showAuthorizationPrompt__block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  id v22;
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
  NSObject *v33;
  char v34;
  NSObject *v35;
  __CFUserNotification *v36;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Main;
  void *v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  uint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  SInt32 error;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fromApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = v3;
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    if (v3)
    {
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALERT_HEADER_LONG_PHONE"), &stru_2505B3B28, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "getToBundleLocalizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v7, v8, v3);
    }
    else
    {
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALERT_HEADER_LONG_MISSING_APP_PHONE"), &stru_2505B3B28, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "getToBundleLocalizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v7, v8, v44);
    }
    v45 = objc_claimAutoreleasedReturnValue();
    v22 = v3;

    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALERT_LONG_PHONE"), &stru_2505B3B28, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "getToBundleLocalizedName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", v13, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DEFAULT_BUTTON_TITLE_LONG"), &stru_2505B3B28, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getToBundleLocalizedName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", v26, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v28 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALTERNATE_BUTTON_TITLE_LONG"), &stru_2505B3B28, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", v29, v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALTERNATE_BUTTON_TITLE_MISSING_APP_LONG"), &stru_2505B3B28, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v45;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALERT_HEADER_SHORT_PHONE"), &stru_2505B3B28, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getToBundleLocalizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALERT_SHORT_PHONE"), &stru_2505B3B28, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "getToBundleLocalizedName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DEFAULT_BUTTON_TITLE_SHORT"), &stru_2505B3B28, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getToBundleLocalizedName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALTERNATE_BUTTON_TITLE_SHORT"), &stru_2505B3B28, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v30 = (void *)objc_opt_new();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDBD6D8]);
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDBD6E0]);
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BDBD6F8]);
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BDBD6F0]);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "valueForKey:", CFSTR("SAServerMockAuthorizationPromptAnswer"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    sa_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      __42__SAAuthorization_showAuthorizationPrompt__block_invoke_cold_3();

    v34 = objc_msgSend(v32, "BOOLValue") ^ 1;
    sa_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      __42__SAAuthorization_showAuthorizationPrompt__block_invoke_cold_2();

    authorizationPromptResponseHandler(0, v34);
    goto LABEL_19;
  }
  error = 0;
  v36 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, &error, (CFDictionaryRef)v30);
  if (v36 && !error)
  {
    RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v36, (CFUserNotificationCallBack)authorizationPromptResponseHandler, 0);
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    CFRelease(RunLoopSource);
LABEL_19:
    v39 = v47;
    goto LABEL_20;
  }
  v46 = v12;
  if (v36)
    CFRelease(v36);
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v40 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(*(id *)(a1 + 32), "preflightAuthorizationStatus");
  +[SAError errorWithCode:](SAError, "errorWithCode:", 4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, void *))v40)[2](v40, v41, v42);

  objc_msgSend(*(id *)(a1 + 32), "reset");
  sa_default_log();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    __42__SAAuthorization_showAuthorizationPrompt__block_invoke_cold_1(&error, v43);

  v12 = v46;
  v39 = v47;
LABEL_20:

}

+ (BOOL)setAccess:(BOOL)a3 forBundleId:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (v4)
    {
      sa_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[SAAuthorization setAccess:forBundleId:].cold.1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

    }
    else if (TCCAccessSetForBundleId())
    {
      goto LABEL_10;
    }
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  if (!TCCAccessSetForBundleId())
    goto LABEL_12;
  if (!v4)
  {
LABEL_10:
    v8 = a1;
    v9 = 0;
    goto LABEL_11;
  }
  v8 = a1;
  v9 = v6;
LABEL_11:
  objc_msgSend(v8, "setThirdPartyBundleId:", v9);
  v17 = 1;
LABEL_13:

  return v17;
}

+ (id)SASyncedBundleId
{
  objc_msgSend(a1, "_synchronizePrefs");
  return (id)objc_msgSend(a1, "_copyPrefsValueForKey:", CFSTR("SAKappaThirdPartyBundleId"));
}

+ (void)setThirdPartyBundleId:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_23457A000, v5, OS_LOG_TYPE_DEFAULT, "setting third party bundleId: %@", buf, 0xCu);
  }

  v6 = (void *)objc_msgSend(a1, "_copyPrefsValueForKey:", CFSTR("SAKappaThirdPartyBundleId"));
  if ((objc_msgSend(v6, "isEqual:", v4) & 1) == 0)
  {
    objc_msgSend(a1, "_setPrefsValue:forKey:", v4, CFSTR("SAKappaThirdPartyBundleId"));
    dispatch_get_global_queue(2, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__SAAuthorization_setThirdPartyBundleId___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v7, block);

  }
}

void __41__SAAuthorization_setThirdPartyBundleId___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_synchronizePrefs");
  v2 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("SAKappaThirdPartyBundleId"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.SafetyKit"), v1);

}

+ (void)_copyPrefsValueForKey:(id)a3
{
  return (void *)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.SafetyKit"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]);
}

+ (void)_setPrefsValue:(id)a3 forKey:(id)a4
{
  CFPreferencesSetValue((CFStringRef)a4, a3, CFSTR("com.apple.SafetyKit"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]);
}

+ (BOOL)_synchronizePrefs
{
  return CFPreferencesSynchronize(CFSTR("com.apple.SafetyKit"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]) != 0;
}

void __42__SAAuthorization_showAuthorizationPrompt__block_invoke_cold_1(int *a1, NSObject *a2)
{
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 136315394;
  v4 = "+[SAAuthorization showAuthorizationPrompt]_block_invoke";
  v5 = 1024;
  v6 = v2;
  _os_log_error_impl(&dword_23457A000, a2, OS_LOG_TYPE_ERROR, "%s - CFUserNotificationCreate failed, error: %d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __42__SAAuthorization_showAuthorizationPrompt__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2[5];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_1();
  v3 = 2048;
  v4 = v0;
  _os_log_debug_impl(&dword_23457A000, v1, OS_LOG_TYPE_DEBUG, "%s - Mocking answer to authorization prompt, mockAnswer: %@, responseFlags: %lu", (uint8_t *)v2, 0x20u);
  OUTLINED_FUNCTION_10();
}

void __42__SAAuthorization_showAuthorizationPrompt__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s - Would have presented notification, details: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)setAccess:(uint64_t)a3 forBundleId:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_23457A000, a2, a3, "attempting to set third party bundleId that doesn't exist: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
