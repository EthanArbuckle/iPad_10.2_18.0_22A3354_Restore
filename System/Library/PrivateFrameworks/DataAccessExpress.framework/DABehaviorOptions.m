@implementation DABehaviorOptions

+ (void)_startListeningForNotifications
{
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__DABehaviorOptions__startListeningForNotifications__block_invoke_7;
  block[3] = &unk_1E68DB178;
  v3 = &__block_literal_global_6;
  if (_startListeningForNotifications_once != -1)
    dispatch_once(&_startListeningForNotifications_once, block);

}

uint64_t __52__DABehaviorOptions__startListeningForNotifications__block_invoke()
{
  NSObject *v0;
  uint64_t result;
  uint8_t v2[16];

  DALoggingwithCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1B5244000, v0, OS_LOG_TYPE_DEBUG, "Bumping behavior token number", v2, 2u);
  }

  result = CFPreferencesSynchronize(CFSTR("com.apple.DataAccess.BehaviorOptions"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  ++sDABehaviorToken;
  return result;
}

void __52__DABehaviorOptions__startListeningForNotifications__block_invoke_7(uint64_t a1)
{
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", &_startListeningForNotifications_token, v2, *(notify_handler_t *)(a1 + 32));

  notify_register_dispatch("com.apple.dataaccess.BehaviorOptionsChanged", (int *)&_startListeningForNotifications_token2, v2, *(notify_handler_t *)(a1 + 32));
}

+ (BOOL)ignoreSupportedCommands
{
  void *v3;
  void *v4;
  void *v5;

  if (ignoreSupportedCommands___haveCheckedGetOptionsIgnore != 1
    || ignoreSupportedCommands___lastToken != sDABehaviorToken)
  {
    ignoreSupportedCommands___lastToken = sDABehaviorToken;
    ignoreSupportedCommands___haveCheckedGetOptionsIgnore = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("GetOptionsIgnoresCommands"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ignoreSupportedCommands___ignoreSupportedCommands = objc_msgSend(v5, "intValue") != 0;

    }
  }
  return ignoreSupportedCommands___ignoreSupportedCommands;
}

+ (int)refreshThrottleTime
{
  int result;
  void *v4;
  void *v5;
  int v6;

  result = refreshThrottleTime___sThrottleTime;
  if (refreshThrottleTime___sThrottleTime == -1 || refreshThrottleTime___lastToken != sDABehaviorToken)
  {
    refreshThrottleTime___lastToken = sDABehaviorToken;
    v4 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RefreshThrottleTime"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && (objc_msgSend(v5, "intValue") & 0x80000000) == 0)
    {
      v6 = objc_msgSend(v5, "intValue");
    }
    else
    {
      v6 = 300;
    }
    refreshThrottleTime___sThrottleTime = v6;

    return refreshThrottleTime___sThrottleTime;
  }
  return result;
}

+ (BOOL)ignoreBadLDAPCerts
{
  void *v3;
  void *v4;
  void *v5;

  if (ignoreBadLDAPCerts___haveCheckedIgnoreBadLDAPCerts != 1 || ignoreBadLDAPCerts___lastToken != sDABehaviorToken)
  {
    ignoreBadLDAPCerts___lastToken = sDABehaviorToken;
    ignoreBadLDAPCerts___haveCheckedIgnoreBadLDAPCerts = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("IgnoreBadLDAPCerts"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ignoreBadLDAPCerts___ignoreBadLDAPCerts = objc_msgSend(v5, "intValue") != 0;

    }
  }
  return ignoreBadLDAPCerts___ignoreBadLDAPCerts;
}

+ (double)defaultEASTaskTimeoutOutWasFound:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (defaultEASTaskTimeoutOutWasFound____haveCheckedDefaultEASTaskTimeout != 1
    || defaultEASTaskTimeoutOutWasFound____lastToken != sDABehaviorToken)
  {
    defaultEASTaskTimeoutOutWasFound____lastToken = sDABehaviorToken;
    defaultEASTaskTimeoutOutWasFound____haveCheckedDefaultEASTaskTimeout = 1;
    v5 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DefaultEASTaskTimeout"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        defaultEASTaskTimeoutOutWasFound____defaultWasFound = 1;
        objc_msgSend(v7, "doubleValue");
        defaultEASTaskTimeoutOutWasFound____defaultEASTaskTimeout = v9;
      }

    }
  }
  if (a3)
    *a3 = defaultEASTaskTimeoutOutWasFound____defaultWasFound;
  return *(double *)&defaultEASTaskTimeoutOutWasFound____defaultEASTaskTimeout;
}

+ (double)defaultDAVProbeTimeout
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (defaultDAVProbeTimeout___haveCheckedDAVProbeTimeout != 1
    || defaultDAVProbeTimeout___lastToken != sDABehaviorToken)
  {
    defaultDAVProbeTimeout___lastToken = sDABehaviorToken;
    defaultDAVProbeTimeout___haveCheckedDAVProbeTimeout = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DAVProbeTimeout"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "doubleValue");
          defaultDAVProbeTimeout___defaultDAVProbeTimeout = v6;
        }
      }

    }
  }
  return *(double *)&defaultDAVProbeTimeout___defaultDAVProbeTimeout;
}

+ (id)whitelistedEASProtocols
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (whitelistedEASProtocols___haveCheckedWhitelistedEASProtocols != 1
    || whitelistedEASProtocols___lastToken != sDABehaviorToken)
  {
    whitelistedEASProtocols___lastToken = sDABehaviorToken;
    whitelistedEASProtocols___haveCheckedWhitelistedEASProtocols = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WhitelistedEASProtocols"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)whitelistedEASProtocols___whitelistedEASProtocols;
      whitelistedEASProtocols___whitelistedEASProtocols = v5;

    }
  }
  return (id)whitelistedEASProtocols___whitelistedEASProtocols;
}

+ (BOOL)_shouldForceCookies:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (_shouldForceCookies____haveCheckedEnableCookies != 1 || _shouldForceCookies____lastToken != sDABehaviorToken)
  {
    _shouldForceCookies____lastToken = sDABehaviorToken;
    _shouldForceCookies____haveCheckedEnableCookies = 1;
    v5 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EnableCookies"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _shouldForceCookies____isSet = v7 != 0;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EnableCookies"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _shouldForceCookies____enableCookies = objc_msgSend(v8, "intValue") != 0;

    }
  }
  if (a3)
    *a3 = _shouldForceCookies____isSet;
  return _shouldForceCookies____enableCookies;
}

+ (BOOL)cookiesEnabled
{
  NSObject *v3;
  _BOOL4 v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  char v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (cookiesEnabled___flagChecked != 1 || cookiesEnabled___lastToken != sDABehaviorToken)
  {
    cookiesEnabled___lastToken = sDABehaviorToken;
    cookiesEnabled___flagChecked = 1;
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      DALoggingwithCategory(0);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B5244000, v3, OS_LOG_TYPE_DEFAULT, "Turning off cookie support because we are running on older hardware", buf, 2u);
      }

      cookiesEnabled___cookiesEnabled = 1;
    }
  }
  v9 = 0;
  v4 = +[DABehaviorOptions _shouldForceCookies:](DABehaviorOptions, "_shouldForceCookies:", &v9);
  if (v9)
  {
    v5 = v4;
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("dis");
      if (v5)
        v7 = CFSTR("en");
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1B5244000, v6, OS_LOG_TYPE_DEFAULT, "Due to a profile setting, we are forcing cookies to be %@abled", buf, 0xCu);
    }

  }
  else
  {
    LOBYTE(v5) = cookiesEnabled___cookiesEnabled ^ 1;
  }
  return v5 & 1;
}

+ (BOOL)calDAVRemindersForAll
{
  void *v3;
  void *v4;
  void *v5;

  if (calDAVRemindersForAll___haveCheckedRemindersForAll != 1 || calDAVRemindersForAll___lastToken != sDABehaviorToken)
  {
    calDAVRemindersForAll___lastToken = sDABehaviorToken;
    calDAVRemindersForAll___haveCheckedRemindersForAll = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RemindersForAll"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      calDAVRemindersForAll___remindersForAll = objc_msgSend(v5, "intValue") != 0;

    }
  }
  return calDAVRemindersForAll___remindersForAll;
}

+ (BOOL)promptForAllCerts
{
  void *v3;
  void *v4;
  void *v5;

  if (promptForAllCerts___haveCheckedPromptForAllCerts != 1 || promptForAllCerts___lastToken != sDABehaviorToken)
  {
    promptForAllCerts___lastToken = sDABehaviorToken;
    promptForAllCerts___haveCheckedPromptForAllCerts = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PromptForAllCerts"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      promptForAllCerts___promptForAllCerts = objc_msgSend(v5, "intValue") != 0;

    }
  }
  return promptForAllCerts___promptForAllCerts;
}

+ (BOOL)enablePromptForServerTrust
{
  void *v3;
  void *v4;
  void *v5;

  if (enablePromptForServerTrust___haveCheckedEnablePromptForServerTrust != 1
    || enablePromptForServerTrust___lastToken != sDABehaviorToken)
  {
    enablePromptForServerTrust___lastToken = sDABehaviorToken;
    enablePromptForServerTrust___haveCheckedEnablePromptForServerTrust = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EnableServerTrustProcessing"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      enablePromptForServerTrust___enablePromptForServerTrust = objc_msgSend(v5, "intValue") != 0;

    }
  }
  return enablePromptForServerTrust___enablePromptForServerTrust;
}

+ (BOOL)compressRequests
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (compressRequests___haveCheckedCompressRequests != 1 || compressRequests___lastToken != sDABehaviorToken)
  {
    compressRequests___lastToken = sDABehaviorToken;
    compressRequests___haveCheckedCompressRequests = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CompressRequests"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CompressRequests"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        compressRequests___compressRequests = objc_msgSend(v6, "intValue") != 0;

      }
    }

  }
  return compressRequests___compressRequests;
}

+ (BOOL)useThunderhillBetaServers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (useThunderhillBetaServers___haveCheckedThunderhillBeta != 1
    || useThunderhillBetaServers___lastToken != sDABehaviorToken)
  {
    useThunderhillBetaServers___lastToken = sDABehaviorToken;
    useThunderhillBetaServers___haveCheckedThunderhillBeta = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ThunderhillBeta"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ThunderhillBeta"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        useThunderhillBetaServers___ThunderhillBeta = objc_msgSend(v6, "intValue") != 0;

      }
    }

  }
  return useThunderhillBetaServers___ThunderhillBeta;
}

+ (BOOL)perfLogging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (perfLogging___haveCheckedPerfLogging != 1 || perfLogging___lastToken != sDABehaviorToken)
  {
    perfLogging___lastToken = sDABehaviorToken;
    perfLogging___haveCheckedPerfLogging = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PerfLogging"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PerfLogging"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        perfLogging___PerfLogging = objc_msgSend(v6, "intValue") != 0;

      }
    }

  }
  return perfLogging___PerfLogging;
}

+ (BOOL)CFNetworkLogging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (CFNetworkLogging___haveCheckedCFNetworkLogging != 1 || CFNetworkLogging___lastToken != sDABehaviorToken)
  {
    CFNetworkLogging___lastToken = sDABehaviorToken;
    CFNetworkLogging___haveCheckedCFNetworkLogging = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CFNetworkLogging"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CFNetworkLogging"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        CFNetworkLogging___CFNetworkLogging = objc_msgSend(v6, "intValue") != 0;

      }
    }

  }
  return CFNetworkLogging___CFNetworkLogging;
}

+ (id)APSEnv
{
  void *v3;
  void *v4;
  CFPropertyListRef v5;
  void *v6;
  id v7;

  if (APSEnv___APSEnvChecked == 1 && APSEnv___lastToken == sDABehaviorToken)
  {
    v4 = 0;
  }
  else
  {
    APSEnv___lastToken = sDABehaviorToken;
    APSEnv___APSEnvChecked = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("APSEnv"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&APSEnv___sAPSEnv, v4);
    }
    if (!APSEnv___sAPSEnv)
    {
      v5 = CFPreferencesCopyAppValue(CFSTR("DAAPSEnv"), (CFStringRef)*MEMORY[0x1E0C9B228]);
      v6 = (void *)APSEnv___sAPSEnv;
      APSEnv___sAPSEnv = (uint64_t)v5;

    }
  }
  v7 = (id)APSEnv___sAPSEnv;

  return v7;
}

+ (BOOL)allIMAPServersSupportNotesSearch
{
  void *v3;
  void *v4;
  void *v5;

  if (allIMAPServersSupportNotesSearch___haveCheckedAllIMAPServersSupportNotesSearch != 1
    || allIMAPServersSupportNotesSearch___lastToken != sDABehaviorToken)
  {
    allIMAPServersSupportNotesSearch___lastToken = sDABehaviorToken;
    allIMAPServersSupportNotesSearch___haveCheckedAllIMAPServersSupportNotesSearch = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AllIMAPServersSupportNotesSearch"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      allIMAPServersSupportNotesSearch___allIMAPServersSupportNotesSearch = objc_msgSend(v5, "intValue") != 0;

    }
  }
  return allIMAPServersSupportNotesSearch___allIMAPServersSupportNotesSearch;
}

+ (BOOL)completelyIgnoreNotes
{
  void *v3;
  void *v4;
  void *v5;

  if (completelyIgnoreNotes___haveCheckedCompletelyIgnoreNotes != 1
    || completelyIgnoreNotes___lastToken != sDABehaviorToken)
  {
    completelyIgnoreNotes___lastToken = sDABehaviorToken;
    completelyIgnoreNotes___haveCheckedCompletelyIgnoreNotes = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CompletelyIgnoreNotes"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      completelyIgnoreNotes___completelyIgnoreNotes = objc_msgSend(v5, "intValue") != 0;

    }
  }
  return completelyIgnoreNotes___completelyIgnoreNotes;
}

+ (BOOL)writeOutBrokenCancelationRequests
{
  void *v3;
  void *v4;
  void *v5;

  if (writeOutBrokenCancelationRequests___haveCheckedWriteOutBrokenCancelationRequests != 1
    || writeOutBrokenCancelationRequests___lastToken != sDABehaviorToken)
  {
    writeOutBrokenCancelationRequests___lastToken = sDABehaviorToken;
    writeOutBrokenCancelationRequests___haveCheckedWriteOutBrokenCancelationRequests = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WriteOutBrokenCancelationRequests"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      writeOutBrokenCancelationRequests___writeOutBrokenCancelationRequests = objc_msgSend(v5, "intValue") != 0;

    }
  }
  return writeOutBrokenCancelationRequests___writeOutBrokenCancelationRequests;
}

+ (BOOL)sendMeCardEverywhere
{
  void *v3;
  void *v4;
  void *v5;

  if (sendMeCardEverywhere___haveCheckedSendMeCardEverywhere != 1
    || sendMeCardEverywhere___lastToken != sDABehaviorToken)
  {
    sendMeCardEverywhere___lastToken = sDABehaviorToken;
    sendMeCardEverywhere___haveCheckedSendMeCardEverywhere = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SendMeCardEverywhere"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      sendMeCardEverywhere___sendMeCardEverywhere = objc_msgSend(v5, "intValue") != 0;

    }
  }
  return sendMeCardEverywhere___sendMeCardEverywhere;
}

+ (BOOL)isInHoldingPattern
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (isInHoldingPattern___haveCheckedIsInHoldingPattern != 1 || isInHoldingPattern___lastToken != sDABehaviorToken)
  {
    isInHoldingPattern___lastToken = sDABehaviorToken;
    isInHoldingPattern___haveCheckedIsInHoldingPattern = 1;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    isInHoldingPattern___isInHoldingPattern = objc_msgSend(v3, "BOOLForKey:", CFSTR("DAInHoldingPattern"));

    if (isInHoldingPattern___isInHoldingPattern)
    {
      DALoggingwithCategory(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B5244000, v4, OS_LOG_TYPE_ERROR, "\n*\n*\n*\n*\nDA is in a holding pattern.  We will not be syncing any time soon\n*\n*\n*\n*", v6, 2u);
      }

    }
  }
  return isInHoldingPattern___isInHoldingPattern;
}

+ (BOOL)enableAutomaticAttachmentDownloads
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (enableAutomaticAttachmentDownloads___haveCheckedEnableAutomaticAttachmentDownloads != 1
    || enableAutomaticAttachmentDownloads___lastToken != sDABehaviorToken)
  {
    enableAutomaticAttachmentDownloads___lastToken = sDABehaviorToken;
    enableAutomaticAttachmentDownloads___haveCheckedEnableAutomaticAttachmentDownloads = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3
      && (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EnableAutomaticAttachmentDownloads")),
          (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = v5;
      v7 = objc_msgSend(v5, "BOOLValue");

    }
    else
    {
      v7 = 0;
    }
    enableAutomaticAttachmentDownloads___enableAutomaticAttachmentDownloads = v7;

  }
  return enableAutomaticAttachmentDownloads___enableAutomaticAttachmentDownloads;
}

+ (BOOL)babysitterEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (babysitterEnabled___haveCheckedBabysitterEnabled != 1 || babysitterEnabled___lastToken != sDABehaviorToken)
  {
    babysitterEnabled___lastToken = sDABehaviorToken;
    babysitterEnabled___haveCheckedBabysitterEnabled = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BabysitterEnabled"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BabysitterEnabled"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        babysitterEnabled___babysitterEnabled = objc_msgSend(v6, "intValue") != 0;

      }
    }

  }
  return babysitterEnabled___babysitterEnabled;
}

+ (BOOL)alwaysUseCalendarHomeSync
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (alwaysUseCalendarHomeSync___haveCheckedAlwaysUseCalendarHomeSync != 1
    || alwaysUseCalendarHomeSync___lastToken != sDABehaviorToken)
  {
    alwaysUseCalendarHomeSync___lastToken = sDABehaviorToken;
    alwaysUseCalendarHomeSync___haveCheckedAlwaysUseCalendarHomeSync = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AlwaysUseCalendarHomeSync"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AlwaysUseCalendarHomeSync"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        alwaysUseCalendarHomeSync___alwaysUseCalendarHomeSync = objc_msgSend(v6, "intValue") != 0;

      }
    }

  }
  return alwaysUseCalendarHomeSync___alwaysUseCalendarHomeSync;
}

+ (BOOL)useContactsFramework
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (useContactsFramework___haveCheckedUseContactsFramework != 1
    || useContactsFramework___lastToken != sDABehaviorToken)
  {
    useContactsFramework___lastToken = sDABehaviorToken;
    useContactsFramework___haveCheckedUseContactsFramework = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UseContactsFramework"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UseContactsFramework"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        useContactsFramework___useContactsFramework = objc_msgSend(v6, "intValue") != 0;

      }
    }

  }
  return useContactsFramework___useContactsFramework;
}

+ (BOOL)earlyPingEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (earlyPingEnabled___haveCheckedEarlyPingEnabled != 1 || earlyPingEnabled___lastToken != sDABehaviorToken)
  {
    earlyPingEnabled___lastToken = sDABehaviorToken;
    earlyPingEnabled___haveCheckedEarlyPingEnabled = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EarlyPingEnabled"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EarlyPingEnabled"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        earlyPingEnabled___earlyPingEnabled = objc_msgSend(v6, "intValue") != 0;

      }
    }

  }
  return earlyPingEnabled___earlyPingEnabled;
}

+ (BOOL)customAutoDV2UserAgentEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (customAutoDV2UserAgentEnabled___haveCheckedCustomAutoDV2UserAgentEnabled != 1
    || customAutoDV2UserAgentEnabled___lastToken != sDABehaviorToken)
  {
    customAutoDV2UserAgentEnabled___lastToken = sDABehaviorToken;
    customAutoDV2UserAgentEnabled___haveCheckedCustomAutoDV2UserAgentEnabled = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CustomAutoDV2UserAgentEnabled"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CustomAutoDV2UserAgentEnabled"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        customAutoDV2UserAgentEnabled___customAutoDV2UserAgentEnabled = objc_msgSend(v6, "intValue") != 0;

      }
    }

  }
  return customAutoDV2UserAgentEnabled___customAutoDV2UserAgentEnabled;
}

+ (id)holidayCalendarURL
{
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (holidayCalendarURL___haveCheckedHolidayCalendarURL != 1 || holidayCalendarURL___lastToken != sDABehaviorToken)
  {
    holidayCalendarURL___lastToken = sDABehaviorToken;
    holidayCalendarURL___haveCheckedHolidayCalendarURL = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HolidayCalendarURL"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString length](v5, "length"))
        v6 = v5;
      else
        v6 = CFSTR("https://caldav.icloud.com/.well-known/calendarsearchdav");
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)holidayCalendarURL___holidayCalendarURL;
      holidayCalendarURL___holidayCalendarURL = v8;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://caldav.icloud.com/.well-known/calendarsearchdav"));
      v7 = objc_claimAutoreleasedReturnValue();
      v5 = (__CFString *)holidayCalendarURL___holidayCalendarURL;
      holidayCalendarURL___holidayCalendarURL = v7;
    }

  }
  return (id)holidayCalendarURL___holidayCalendarURL;
}

+ (double)holidayCalendarRefreshInterval
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (holidayCalendarRefreshInterval___haveCheckedHolidayCalendarRefreshInterval != 1
    || holidayCalendarRefreshInterval___lastToken != sDABehaviorToken)
  {
    holidayCalendarRefreshInterval___lastToken = sDABehaviorToken;
    holidayCalendarRefreshInterval___haveCheckedHolidayCalendarRefreshInterval = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HolidayCalendarRefreshInterval"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "doubleValue");
        holidayCalendarRefreshInterval___holidayCalendarRefreshInterval = v7;
      }

    }
  }
  return *(double *)&holidayCalendarRefreshInterval___holidayCalendarRefreshInterval;
}

+ (BOOL)isCustomerInstall
{
  const void *v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((isCustomerInstall___haveCheckedIsCustomerInstall & 1) == 0)
  {
    isCustomerInstall___haveCheckedIsCustomerInstall = 1;
    v2 = (const void *)MGCopyAnswer();
    isCustomerInstall___isCustomerInstall = v2 == 0;
    if (v2)
      CFRelease(v2);
    DALoggingwithCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      if (isCustomerInstall___isCustomerInstall)
        v4 = &stru_1E68DC130;
      else
        v4 = CFSTR("NON");
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1B5244000, v3, OS_LOG_TYPE_INFO, "Device is a %@customer install", (uint8_t *)&v6, 0xCu);
    }

  }
  return isCustomerInstall___isCustomerInstall;
}

+ (BOOL)isAppleInternalInstall
{
  const void *v2;
  const void *v3;

  if ((isAppleInternalInstall___haveCheckedIsAppleInternalInstall & 1) == 0)
  {
    isAppleInternalInstall___haveCheckedIsAppleInternalInstall = 1;
    v2 = (const void *)MGCopyAnswer();
    if (v2)
    {
      v3 = v2;
      isAppleInternalInstall___isAppleInternalInstall = CFEqual(v2, CFSTR("Internal")) != 0;
      CFRelease(v3);
    }
    else
    {
      isAppleInternalInstall___isAppleInternalInstall = 0;
    }
  }
  return isAppleInternalInstall___isAppleInternalInstall;
}

+ (int)numForgivable401s
{
  int result;
  void *v4;
  uint64_t v5;
  void *v6;

  result = numForgivable401s___sNumForgivable401s;
  if (numForgivable401s___sNumForgivable401s == -1 || numForgivable401s___lastToken != sDABehaviorToken)
  {
    numForgivable401s___lastToken = sDABehaviorToken;
    v4 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NumForgivable401s"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      objc_opt_class();
      if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        && (objc_msgSend(v6, "intValue") & 0x80000000) == 0)
      {
        LODWORD(v5) = objc_msgSend(v6, "intValue");
      }
      else
      {
        LODWORD(v5) = 0;
      }
    }
    numForgivable401s___sNumForgivable401s = v5;

    return numForgivable401s___sNumForgivable401s;
  }
  return result;
}

+ (BOOL)isEASParsingLogEnabled
{
  void *v3;
  void *v4;
  BOOL v5;

  if (isEASParsingLogEnabled___haveCheckedEASParsingLogEnabled != 1
    || isEASParsingLogEnabled___lastToken != sDABehaviorToken)
  {
    isEASParsingLogEnabled___haveCheckedEASParsingLogEnabled = 1;
    isEASParsingLogEnabled___lastToken = sDABehaviorToken;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EASParsingLogEnabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && objc_msgSend(v4, "intValue") != 0;
    isEASParsingLogEnabled___isEASParsingLogEnabled = v5;

  }
  return isEASParsingLogEnabled___isEASParsingLogEnabled;
}

+ (BOOL)orphanCheckEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (orphanCheckEnabled___haveCheckedOrphanCheckEnabled != 1 || orphanCheckEnabled___lastToken != sDABehaviorToken)
  {
    orphanCheckEnabled___lastToken = sDABehaviorToken;
    orphanCheckEnabled___haveCheckedOrphanCheckEnabled = 1;
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OrphanCheckEnabled"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OrphanCheckEnabled"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        orphanCheckEnabled___orphanCheckEnabled = objc_msgSend(v6, "intValue") != 0;

      }
    }

  }
  return orphanCheckEnabled___orphanCheckEnabled;
}

+ (id)DAManagedDefaultForKey:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.DataAccess.BehaviorOptions"));
}

+ (BOOL)addDAManagedDefaults:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const __CFString *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(const __CFString **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CFPreferencesSetAppValue(v8, v9, CFSTR("com.apple.DataAccess.BehaviorOptions"));

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return 1;
}

+ (void)removeDAManagedDefaults:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        CFPreferencesSetAppValue(*(CFStringRef *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0, CFSTR("com.apple.DataAccess.BehaviorOptions"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

@end
