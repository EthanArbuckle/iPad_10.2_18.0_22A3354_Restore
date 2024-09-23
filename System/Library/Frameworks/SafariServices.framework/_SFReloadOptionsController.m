@implementation _SFReloadOptionsController

- (void)setTryUsingMobileIfPossible:(BOOL)a3
{
  self->_tryUsingMobileIfPossible = a3;
}

- (void)didUpdateRequestDesktopSitePerSitePreference:(id)a3
{
  NSDictionary *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSDictionary *perSitePreferenceValues;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (NSDictionary *)a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFReloadOptionsController didUpdateRequestDesktopSitePerSitePreference:].cold.1(v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_userVisibleHostWithoutWWWSubdomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_perSitePreferenceValues, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((WBSIsEqual() & 1) == 0)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = v11;
      _SFStringFromRequestDesktopSiteSetting(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _SFStringFromRequestDesktopSiteSetting(v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138478339;
      v17 = v8;
      v18 = 2114;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      _os_log_debug_impl(&dword_1A3B2D000, v13, OS_LOG_TYPE_DEBUG, "Request Desktop Website setting for domain '%{private}@' changed from %{public}@ to %{public}@; reloading web view",
        (uint8_t *)&v16,
        0x20u);

    }
    if (objc_msgSend(v10, "BOOLValue"))
      -[_SFReloadOptionsController _requestDesktopSiteWithFallbackURL:](self, "_requestDesktopSiteWithFallbackURL:", v7);
    else
      -[_SFReloadOptionsController _requestStandardSiteWithURL:](self, "_requestStandardSiteWithURL:", v7);
  }
  perSitePreferenceValues = self->_perSitePreferenceValues;
  self->_perSitePreferenceValues = v4;

}

- (BOOL)loadedUsingDesktopUserAgent
{
  id WeakRetained;
  void *v4;
  NSMutableDictionary *domainToUserAgentPolicyMap;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t effectiveContentMode;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  domainToUserAgentPolicyMap = self->_domainToUserAgentPolicyMap;
  objc_msgSend(v4, "safari_highLevelDomainFromHostFallingBackToHostOrAbsoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](domainToUserAgentPolicyMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8)
  {
    v9 = v8 == 1;
  }
  else
  {
    objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet containsObject:](self->_domainsOverridenAsMobile, "containsObject:", v10) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](self->_perSitePreferenceValues, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v9 = objc_msgSend(v11, "integerValue") == 1;
      }
      else
      {
        effectiveContentMode = self->_effectiveContentMode;
        v9 = -[NSNumber integerValue](self->_requestDesktopSiteDefaultValue, "integerValue") == 1
          && effectiveContentMode != 1;
      }

    }
  }

  return v9;
}

- (void)setSupportsAdvancedPrivacyProtections:(BOOL)a3
{
  self->_supportsAdvancedPrivacyProtections = a3;
}

- (void)didUpdateRequestDesktopSiteDefaultValue:(int64_t)a3
{
  NSObject *v5;
  NSNumber *v6;
  NSNumber *requestDesktopSiteDefaultValue;

  v5 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFReloadOptionsController didUpdateRequestDesktopSiteDefaultValue:].cold.1(v5, a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  requestDesktopSiteDefaultValue = self->_requestDesktopSiteDefaultValue;
  self->_requestDesktopSiteDefaultValue = v6;

}

- (_SFReloadOptionsController)initWithWebView:(id)a3 activityJSController:(id)a4 perSitePreferenceManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  _SFReloadOptionsController *v11;
  _SFReloadOptionsController *v12;
  _SFReloadOptionsController *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_SFReloadOptionsController;
  v11 = -[_SFReloadOptionsController init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_webView, v8);
    objc_storeStrong((id *)&v12->_activityJSController, a4);
    objc_storeStrong((id *)&v12->_perSitePreferenceManager, a5);
    -[_SFRequestDesktopSitePreferenceManager addRequestDesktopSitePerSitePreferenceObserver:](v12->_perSitePreferenceManager, "addRequestDesktopSitePerSitePreferenceObserver:", v12);
    -[_SFReloadOptionsController _loadPerSitePreferences](v12, "_loadPerSitePreferences");
    v13 = v12;
  }

  return v12;
}

- (void)_loadPerSitePreferences
{
  _SFRequestDesktopSitePreferenceManager *perSitePreferenceManager;
  void *v4;
  uint64_t v5;
  _SFRequestDesktopSitePreferenceManager *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  perSitePreferenceManager = self->_perSitePreferenceManager;
  -[_SFRequestDesktopSitePreferenceManager requestDesktopSitePreference](perSitePreferenceManager, "requestDesktopSitePreference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke;
  v9[3] = &unk_1E4AC4748;
  objc_copyWeak(&v10, &location);
  -[_SFRequestDesktopSitePreferenceManager getDefaultPreferenceValueForPreference:completionHandler:](perSitePreferenceManager, "getDefaultPreferenceValueForPreference:completionHandler:", v4, v9);

  v6 = self->_perSitePreferenceManager;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke_3;
  v7[3] = &unk_1E4AC1E08;
  objc_copyWeak(&v8, &location);
  -[_SFRequestDesktopSitePreferenceManager getAllRequestDesktopSitePerSitePreferenceValues:](v6, "getAllRequestDesktopSitePerSitePreferenceValues:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (_SFReloadOptionsController)init
{
  return -[_SFReloadOptionsController initWithWebView:activityJSController:perSitePreferenceManager:](self, "initWithWebView:activityJSController:perSitePreferenceManager:", 0, 0, 0);
}

- (void)invalidate
{
  -[_SFRequestDesktopSitePreferenceManager removeRequestDesktopSitePerSitePreferenceObserver:](self->_perSitePreferenceManager, "removeRequestDesktopSitePerSitePreferenceObserver:", self);
}

- (BOOL)_updateSettingSource:(unint64_t)a3 domain:(id)a4
{
  id v6;
  NSMutableSet *domainsOverridenAsMobile;
  NSMutableSet *v8;
  NSMutableSet *v9;
  BOOL v10;

  v6 = a4;
  if (!self->_tryUsingMobileIfPossible)
  {
    -[NSMutableSet removeObject:](self->_domainsOverridenAsMobile, "removeObject:", v6);
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  domainsOverridenAsMobile = self->_domainsOverridenAsMobile;
  if (!domainsOverridenAsMobile)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_domainsOverridenAsMobile;
    self->_domainsOverridenAsMobile = v8;

    domainsOverridenAsMobile = self->_domainsOverridenAsMobile;
  }
  -[NSMutableSet addObject:](domainsOverridenAsMobile, "addObject:", v6);
  v10 = 1;
LABEL_8:

  return v10;
}

- (void)_overrideSettingIfNeeded:(int64_t)a3 source:(unint64_t)a4 domain:(id)a5 completion:(id)a6
{
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  void (*v13)(_QWORD *, int64_t, unint64_t);
  int64_t v14;
  unint64_t v15;
  id v16;

  v16 = a5;
  v10 = a6;
  v11 = v10;
  if (!a3)
  {
    v13 = (void (*)(_QWORD *, int64_t, unint64_t))v10[2];
    v14 = 0;
LABEL_6:
    v15 = a4;
    goto LABEL_7;
  }
  v12 = -[_SFReloadOptionsController _updateSettingSource:domain:](self, "_updateSettingSource:domain:", a4, v16);
  v13 = (void (*)(_QWORD *, int64_t, unint64_t))v11[2];
  if (!v12)
  {
    v10 = v11;
    v14 = a3;
    goto LABEL_6;
  }
  v10 = v11;
  v14 = 0;
  v15 = 3;
LABEL_7:
  v13(v10, v14, v15);

}

- (void)customUserAgentSettingForMainFrameURL:(id)a3 withTimeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  _SFReloadOptionsController *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  _SFRequestDesktopSitePreferenceManager *perSitePreferenceManager;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  if (-[NSMutableDictionary count](self->_domainToUserAgentPolicyMap, "count"))
  {
    objc_msgSend(v8, "safari_highLevelDomainFromHostFallingBackToHostOrAbsoluteString");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_domainToUserAgentPolicyMap, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    v13 = WBS_LOG_CHANNEL_PREFIXRequestDesktopSite();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[_SFReloadOptionsController customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:].cold.6();
      if (v12)
        goto LABEL_4;
    }
    else if (v12)
    {
LABEL_4:
      -[_SFReloadOptionsController _overrideSettingIfNeeded:source:domain:completion:](self, "_overrideSettingIfNeeded:source:domain:completion:", v12 == 1, 1, v10, v9);
      goto LABEL_26;
    }

  }
  objc_msgSend(v8, "safari_userVisibleHostWithoutWWWSubdomain");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_perSitePreferenceValues)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[_SFReloadOptionsController customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:].cold.5(v14, v15, v16, v17, v18, v19, v20, v21);
    v22 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[_SFReloadOptionsController customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:].cold.4();
    -[NSDictionary objectForKeyedSubscript:](self->_perSitePreferenceValues, "objectForKeyedSubscript:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[_SFReloadOptionsController customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:].cold.3(v24);
      v25 = objc_msgSend(v23, "integerValue");
      v26 = self;
      v27 = 2;
LABEL_20:
      -[_SFReloadOptionsController _overrideSettingIfNeeded:source:domain:completion:](v26, "_overrideSettingIfNeeded:source:domain:completion:", v25, v27, v10, v9);

      goto LABEL_26;
    }
    if (self->_requestDesktopSiteDefaultValue)
    {
      v28 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[_SFReloadOptionsController customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:].cold.2((uint64_t)&self->_requestDesktopSiteDefaultValue, v28);
      v25 = -[NSNumber integerValue](self->_requestDesktopSiteDefaultValue, "integerValue");
      v26 = self;
      v27 = 0;
      goto LABEL_20;
    }
  }
  v29 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3B2D000, v29, OS_LOG_TYPE_INFO, "Request Desktop Website per site preferences haven't been cached yet, falling back to fetching the preference directly", buf, 2u);
  }
  v30 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    -[_SFReloadOptionsController customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:].cold.1();
  perSitePreferenceManager = self->_perSitePreferenceManager;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __98___SFReloadOptionsController_customUserAgentSettingForMainFrameURL_withTimeout_completionHandler___block_invoke;
  v32[3] = &unk_1E4AC6638;
  v32[4] = self;
  v10 = v10;
  v33 = v10;
  v34 = v9;
  -[_SFRequestDesktopSitePreferenceManager getRequestDesktopSitePreferenceForDomain:withTimeout:completionHandler:](perSitePreferenceManager, "getRequestDesktopSitePreferenceForDomain:withTimeout:completionHandler:", v10, v32, a4);

LABEL_26:
}

- (id)customUserAgentForSetting:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;

  _SFCustomUserAgentStringIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBS_LOG_CHANNEL_PREFIXRequestDesktopSite();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      -[_SFReloadOptionsController customUserAgentForSetting:].cold.2(v6, v8, v9, v10, v11, v12, v13, v14);
    v15 = v5;
  }
  else
  {
    if (v7)
      -[_SFReloadOptionsController customUserAgentForSetting:].cold.1(v6, a3);
    if (a3 == 1)
    {
      _SFMacSafariUserAgentString();
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!self->_tryUsingMobileIfPossible)
      {
        v16 = 0;
        goto LABEL_12;
      }
      _SFIPhoneSafariUserAgentString();
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v16 = v15;
LABEL_12:

  return v16;
}

- (id)customNavigatorPlatformForSetting:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("MacIntel");
  else
    return 0;
}

- (void)requestDesktopSite
{
  -[_SFReloadOptionsController _requestDesktopSiteWithFallbackURL:](self, "_requestDesktopSiteWithFallbackURL:", 0);
}

- (void)_requestDesktopSiteWithFallbackURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _SFInjectedJavaScriptController *activityJSController;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = (void *)objc_msgSend(v5, "initWithBytesNoCopy:length:encoding:freeWhenDone:", requestDesktopSiteUIActivitySource, requestDesktopSiteUIActivitySourceLength, 4, 0);
  activityJSController = self->_activityJSController;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65___SFReloadOptionsController__requestDesktopSiteWithFallbackURL___block_invoke;
  v9[3] = &unk_1E4AC6660;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[_SFInjectedJavaScriptController runJavaScriptForActivity:withScript:object:invokeMethod:completionHandler:](activityJSController, "runJavaScriptForActivity:withScript:object:invokeMethod:completionHandler:", 0, v6, CFSTR("DesktopSiteDataFinderJS"), CFSTR("desktopSiteData"), v9);

}

- (void)requestDesktopSiteWithURL:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *domainToUserAgentPolicyMap;
  void *v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "backForwardList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_9;
  }
  if (!self->_domainToUserAgentPolicyMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    domainToUserAgentPolicyMap = self->_domainToUserAgentPolicyMap;
    self->_domainToUserAgentPolicyMap = v9;

  }
  objc_msgSend(v5, "safari_highLevelDomainFromHostFallingBackToHostOrAbsoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_domainToUserAgentPolicyMap, "setObject:forKeyedSubscript:", &unk_1E4B25FC0, v11);
    -[_SFReloadOptionsController didMarkURLAsNeedingDesktopUserAgent:](self, "didMarkURLAsNeedingDesktopUserAgent:", v5);
  }

LABEL_9:
}

- (void)_requestStandardSiteWithURL:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *domainToUserAgentPolicyMap;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (v4)
    goto LABEL_11;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "backForwardList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "initialURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_11:
    if (!self->_domainToUserAgentPolicyMap)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      domainToUserAgentPolicyMap = self->_domainToUserAgentPolicyMap;
      self->_domainToUserAgentPolicyMap = v8;

    }
    objc_msgSend(v4, "safari_highLevelDomainFromHostFallingBackToHostOrAbsoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_domainToUserAgentPolicyMap, "setObject:forKeyedSubscript:", &unk_1E4B25FD8, v10);
      -[_SFReloadOptionsController didMarkURLAsNeedingStandardUserAgent:](self, "didMarkURLAsNeedingStandardUserAgent:", v4);
    }

  }
}

- (void)requestStandardSite
{
  -[_SFReloadOptionsController _requestStandardSiteWithURL:](self, "_requestStandardSiteWithURL:", 0);
}

- (void)didMarkURLAsNeedingDesktopUserAgent:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_requestBySettingAdvancedPrivacyProtectionsFlagIsEnabled:", self->_supportsAdvancedPrivacyProtections);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v6 = (id)objc_msgSend(WeakRetained, "loadRequest:", v7);

}

- (void)didMarkURLAsNeedingStandardUserAgent:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_requestBySettingAdvancedPrivacyProtectionsFlagIsEnabled:", self->_supportsAdvancedPrivacyProtections);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v6 = (id)objc_msgSend(WeakRetained, "loadRequest:", v7);

}

- (void)didSetRequestDesktopSiteDefaultValue:(int64_t)a3
{
  NSNumber *v4;
  NSNumber *requestDesktopSiteDefaultValue;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  requestDesktopSiteDefaultValue = self->_requestDesktopSiteDefaultValue;
  self->_requestDesktopSiteDefaultValue = v4;

}

- (void)didSetRequestDesktopSitePerSitePreferencesValues:(id)a3
{
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSDictionary *perSitePreferenceValues;
  id WeakRetained;

  v4 = (NSDictionary *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_userVisibleHostWithoutWWWSubdomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_perSitePreferenceValues, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(WeakRetained, "loadRequest:", v9);

  }
  perSitePreferenceValues = self->_perSitePreferenceValues;
  self->_perSitePreferenceValues = v4;

}

- (void)logCompletedPageloadToDifferentialPrivacy:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = _SFDeviceSupportsDesktopSitesByDefault();
  v5 = v7;
  if (v4)
  {
    objc_msgSend(v7, "safari_userVisibleHostWithoutWWWSubdomain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      -[_SFReloadOptionsController loadedUsingDesktopUserAgent](self, "loadedUsingDesktopUserAgent");
      WBSLogWithDifferentialPrivacy();
    }

    v5 = v7;
  }

}

- (_SFInjectedJavaScriptController)activityJSController
{
  return self->_activityJSController;
}

- (BOOL)tryUsingMobileIfPossible
{
  return self->_tryUsingMobileIfPossible;
}

- (int64_t)effectiveContentMode
{
  return self->_effectiveContentMode;
}

- (void)setEffectiveContentMode:(int64_t)a3
{
  self->_effectiveContentMode = a3;
}

- (BOOL)supportsAdvancedPrivacyProtections
{
  return self->_supportsAdvancedPrivacyProtections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityJSController, 0);
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_domainsOverridenAsMobile, 0);
  objc_storeStrong((id *)&self->_domainToUserAgentPolicyMap, 0);
  objc_storeStrong((id *)&self->_requestDesktopSiteDefaultValue, 0);
  objc_storeStrong((id *)&self->_perSitePreferenceValues, 0);
  objc_storeStrong((id *)&self->_perSitePreferenceManager, 0);
}

- (void)didUpdateRequestDesktopSiteDefaultValue:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _SFStringFromRequestDesktopSiteSetting(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_1(&dword_1A3B2D000, v4, v7, "Updating Request Desktop Website cached default value to %{public}@", v8);

  OUTLINED_FUNCTION_0_1();
}

- (void)didUpdateRequestDesktopSitePerSitePreference:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "count");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_1(&dword_1A3B2D000, v1, v2, "Updating Request Desktop Website cached mappings with %lu values", v3);

  OUTLINED_FUNCTION_6();
}

- (void)customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_1(&dword_1A3B2D000, v0, v1, "Fetching stored preference for domain '%{private}@'", v2);
  OUTLINED_FUNCTION_3_2();
}

- (void)customUserAgentSettingForMainFrameURL:(uint64_t)a1 withTimeout:(void *)a2 completionHandler:.cold.2(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)OUTLINED_FUNCTION_4_0();
  _SFStringFromRequestDesktopSiteSetting(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_1(&dword_1A3B2D000, v2, v6, "In-memory cache didn't have value for domain, using cached default value: %{public}@", v7);

  OUTLINED_FUNCTION_6();
}

- (void)customUserAgentSettingForMainFrameURL:(void *)a1 withTimeout:completionHandler:.cold.3(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_7(a1);
  v2 = (void *)OUTLINED_FUNCTION_4_0();
  _SFStringFromRequestDesktopSiteSetting(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_1(&dword_1A3B2D000, v1, v4, "Found Request Desktop Website in-memory cache value of %{public}@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_1(&dword_1A3B2D000, v0, v1, "Checking in-memory cache of Request Desktop Website per site preferences for domain '%{private}@'", v2);
  OUTLINED_FUNCTION_3_2();
}

- (void)customUserAgentSettingForMainFrameURL:(uint64_t)a3 withTimeout:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, a1, a3, "Checking in-memory cache of Request Desktop Website per site preferences", a5, a6, a7, a8, 0);
}

- (void)customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:.cold.6()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2048;
  v4 = v0;
  _os_log_debug_impl(&dword_1A3B2D000, v1, OS_LOG_TYPE_DEBUG, "Manual Request Desktop Website mapping for domain '%{private}@' gave value '%ld'", v2, 0x16u);
  OUTLINED_FUNCTION_3_2();
}

- (void)customUserAgentForSetting:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _SFStringFromRequestDesktopSiteSetting(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_1(&dword_1A3B2D000, v4, v7, "Using Request Desktop Website setting %{public}@", v8);

  OUTLINED_FUNCTION_0_1();
}

- (void)customUserAgentForSetting:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, a1, a3, "Using custom user agent string", a5, a6, a7, a8, 0);
}

@end
