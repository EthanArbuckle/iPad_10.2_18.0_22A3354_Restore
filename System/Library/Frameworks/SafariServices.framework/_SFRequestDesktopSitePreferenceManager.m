@implementation _SFRequestDesktopSitePreferenceManager

- (id)preferenceNameForPreference:(id)a3
{
  return (id)*MEMORY[0x1E0D8B2A0];
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_SFRequestDesktopSitePreferenceManager _defaultPreferenceValue](self, "_defaultPreferenceValue", a3));
}

- (int64_t)_defaultPreferenceValue
{
  return _SFDeviceSupportsDesktopSitesByDefault() && !self->_clientPrefersMobileUserAgentByDefault;
}

- (_SFRequestDesktopSitePreferenceManager)initWithPerSitePreferencesStore:(id)a3 quirksManager:(id)a4
{
  id v7;
  id v8;
  _SFRequestDesktopSitePreferenceManager *v9;
  _SFRequestDesktopSitePreferenceManager *v10;
  id v11;
  uint64_t v12;
  WBSPerSitePreference *requestDesktopSitePreference;
  void *v14;
  _SFRequestDesktopSitePreferenceManager *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_SFRequestDesktopSitePreferenceManager;
  v9 = -[_SFRequestDesktopSitePreferenceManager init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_perSitePreferencesStore, a3);
    v11 = objc_alloc(MEMORY[0x1E0D8AAD0]);
    v12 = objc_msgSend(v11, "initWithIdentifier:", *MEMORY[0x1E0D8B380]);
    requestDesktopSitePreference = v10->_requestDesktopSitePreference;
    v10->_requestDesktopSitePreference = (WBSPerSitePreference *)v12;

    objc_storeStrong((id *)&v10->_quirksManager, a4);
    -[WBSPerSitePreferenceManager setStorageDelegate:](v10, "setStorageDelegate:", v10);
    -[WBSPerSitePreferenceManager setDefaultsDelegate:](v10, "setDefaultsDelegate:", v10);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v10, sel__requestDesktopSitePerSitePreferenceDidChange_, CFSTR("com.apple.SafariServices.RequestDesktopSitePerSitePreferenceDidChange"), 0);

    v15 = v10;
  }

  return v10;
}

- (void)addRequestDesktopSitePerSitePreferenceObserver:(id)a3
{
  id v4;
  NSMutableSet *observers;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSMutableSet addObject:](observers, "addObject:", v4);

}

- (WBSPerSitePreference)requestDesktopSitePreference
{
  return self->_requestDesktopSitePreference;
}

- (void)getDefaultPreferenceValueForPreference:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, id);
  NSObject *v6;
  id v7;
  objc_super v9;

  if (self->_clientPrefersMobileUserAgentByDefault)
  {
    v5 = (void (**)(id, id))a4;
    v6 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_SFRequestDesktopSitePreferenceManager getDefaultPreferenceValueForPreference:completionHandler:].cold.1(v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_SFRequestDesktopSitePreferenceManager _defaultPreferenceValue](self, "_defaultPreferenceValue"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v7);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_SFRequestDesktopSitePreferenceManager;
    v7 = a4;
    -[WBSPerSitePreferenceManager getDefaultPreferenceValueForPreference:completionHandler:](&v9, sel_getDefaultPreferenceValueForPreference_completionHandler_, a3, v7);
  }

}

- (void)getAllRequestDesktopSitePerSitePreferenceValues:(id)a3
{
  id v4;
  WBSPerSitePreferencesSQLiteStore *perSitePreferencesStore;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  perSitePreferencesStore = self->_perSitePreferencesStore;
  v6 = *MEMORY[0x1E0D8B2A0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90___SFRequestDesktopSitePreferenceManager_getAllRequestDesktopSitePerSitePreferenceValues___block_invoke;
  v8[3] = &unk_1E4AC4720;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[WBSPerSitePreferencesSQLiteStore getAllPreferenceInformationForPreference:completionHandler:](perSitePreferencesStore, "getAllPreferenceInformationForPreference:completionHandler:", v6, v8);

}

- (_SFRequestDesktopSitePreferenceManager)init
{

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_SFRequestDesktopSitePreferenceManager;
  -[_SFRequestDesktopSitePreferenceManager dealloc](&v4, sel_dealloc);
}

- (void)removeRequestDesktopSitePerSitePreferenceObserver:(id)a3
{
  -[NSMutableSet removeObject:](self->_observers, "removeObject:", a3);
}

- (void)getRequestDesktopSitePreferenceForDomain:(id)a3 withTimeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  WBSPerSitePreference *requestDesktopSitePreference;
  _QWORD v11[5];
  id v12;
  id v13;
  double v14;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    requestDesktopSitePreference = self->_requestDesktopSitePreference;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __113___SFRequestDesktopSitePreferenceManager_getRequestDesktopSitePreferenceForDomain_withTimeout_completionHandler___block_invoke;
    v11[3] = &unk_1E4AC4680;
    v11[4] = self;
    v12 = v8;
    v14 = a4;
    v13 = v9;
    -[_SFRequestDesktopSitePreferenceManager getDefaultPreferenceValueIfNotCustomizedForPreference:domain:completionHandler:](self, "getDefaultPreferenceValueIfNotCustomizedForPreference:domain:completionHandler:", requestDesktopSitePreference, v12, v11);

  }
  else
  {
    (*((void (**)(id, int64_t, uint64_t))v9 + 2))(v9, -[_SFRequestDesktopSitePreferenceManager _defaultPreferenceValue](self, "_defaultPreferenceValue"), 1);
  }

}

- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  _SFRequestDesktopSitePreferenceManager *v17;
  id v18;
  id v19;

  v10 = a3;
  v15[1] = 3221225472;
  v15[2] = __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke;
  v15[3] = &unk_1E4AC46D0;
  v16 = a4;
  v17 = self;
  v18 = v10;
  v19 = a6;
  v14.receiver = self;
  v14.super_class = (Class)_SFRequestDesktopSitePreferenceManager;
  v15[0] = MEMORY[0x1E0C809B0];
  v11 = v10;
  v12 = v16;
  v13 = v19;
  -[WBSPerSitePreferenceManager getValueOfPreference:forDomain:withTimeout:usingBlock:](&v14, sel_getValueOfPreference_forDomain_withTimeout_usingBlock_, v11, v12, a5, v15);

}

- (void)getAllDomainsConfiguredForPreference:(id)a3 usingBlock:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFRequestDesktopSitePreferenceManager;
  -[WBSPerSitePreferenceManager getAllDomainsConfiguredForPreference:usingBlock:](&v4, sel_getAllDomainsConfiguredForPreference_usingBlock_, a3, a4);
}

- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5
{
  if (-[NSMutableSet count](self->_observers, "count", a3, a4, a5))
    -[_SFRequestDesktopSitePreferenceManager _notifyObserversOfPerSitePreferenceDomainValuesUpdate](self, "_notifyObserversOfPerSitePreferenceDomainValuesUpdate");
}

- (void)_requestDesktopSitePerSitePreferenceDidChange:(id)a3
{
  -[_SFRequestDesktopSitePreferenceManager _notifyObserversOfPerSitePreferenceDefaultValueUpdate](self, "_notifyObserversOfPerSitePreferenceDefaultValueUpdate", a3);
  -[_SFRequestDesktopSitePreferenceManager _notifyObserversOfPerSitePreferenceDomainValuesUpdate](self, "_notifyObserversOfPerSitePreferenceDomainValuesUpdate");
}

- (void)_notifyObserversOfPerSitePreferenceDefaultValueUpdate
{
  WBSPerSitePreference *requestDesktopSitePreference;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[NSMutableSet count](self->_observers, "count"))
  {
    objc_initWeak(&location, self);
    requestDesktopSitePreference = self->_requestDesktopSitePreference;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __95___SFRequestDesktopSitePreferenceManager__notifyObserversOfPerSitePreferenceDefaultValueUpdate__block_invoke;
    v4[3] = &unk_1E4AC4748;
    objc_copyWeak(&v5, &location);
    -[_SFRequestDesktopSitePreferenceManager getDefaultPreferenceValueForPreference:completionHandler:](self, "getDefaultPreferenceValueForPreference:completionHandler:", requestDesktopSitePreference, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_notifyObserversOfPerSitePreferenceDomainValuesUpdate
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __95___SFRequestDesktopSitePreferenceManager__notifyObserversOfPerSitePreferenceDomainValuesUpdate__block_invoke;
  v3[3] = &unk_1E4AC1E08;
  objc_copyWeak(&v4, &location);
  -[_SFRequestDesktopSitePreferenceManager getAllRequestDesktopSitePerSitePreferenceValues:](self, "getAllRequestDesktopSitePerSitePreferenceValues:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)preferences
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_requestDesktopSitePreference;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1E4B272C8;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  -[_SFRequestDesktopSitePreferenceManager onValueForPreference:](self, "onValueForPreference:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  objc_msgSend(v6, "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8AAD0], "localizedStringForBinaryPreferenceValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)getDefaultPreferenceValueIfNotCustomizedForPreference:(id)a3 domain:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  _SFRequestDesktopSiteQuirksManager *quirksManager;
  _QWORD v10[5];
  id v11;

  v7 = a5;
  v8 = v7;
  quirksManager = self->_quirksManager;
  if (quirksManager)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __121___SFRequestDesktopSitePreferenceManager_getDefaultPreferenceValueIfNotCustomizedForPreference_domain_completionHandler___block_invoke;
    v10[3] = &unk_1E4AC4770;
    v10[4] = self;
    v11 = v7;
    -[_SFRequestDesktopSiteQuirksManager quirksValueForDomain:completionHandler:](quirksManager, "quirksValueForDomain:completionHandler:", a4, v10);

  }
  else
  {
    -[_SFRequestDesktopSitePreferenceManager getDefaultPreferenceValueForPreference:completionHandler:](self, "getDefaultPreferenceValueForPreference:completionHandler:", self->_requestDesktopSitePreference, v7);
  }

}

- (id)onValueForPreference:(id)a3
{
  return &unk_1E4B25CD8;
}

- (id)offValueForPreference:(id)a3
{
  return &unk_1E4B25CC0;
}

- (void)setClientPrefersMobileUserAgentByDefault:(BOOL)a3
{
  NSObject *v5;

  if (self->_clientPrefersMobileUserAgentByDefault != a3)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_SFRequestDesktopSitePreferenceManager setClientPrefersMobileUserAgentByDefault:].cold.1(a3, v5);
    self->_clientPrefersMobileUserAgentByDefault = a3;
    -[_SFRequestDesktopSitePreferenceManager _notifyObserversOfPerSitePreferenceDefaultValueUpdate](self, "_notifyObserversOfPerSitePreferenceDefaultValueUpdate");
  }
}

- (BOOL)clientPrefersMobileUserAgentByDefault
{
  return self->_clientPrefersMobileUserAgentByDefault;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDesktopSitePreference, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_quirksManager, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

- (void)getDefaultPreferenceValueForPreference:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_DEBUG, "Client can't support Desktop user agent by default, so forcing Mobile default for this client only", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setClientPrefersMobileUserAgentByDefault:(char)a1 .cold.1(char a1, NSObject *a2)
{
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  v4 = v3;
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_3_1(&dword_1A3B2D000, a2, v5, "Updating client preference for loading Mobile user agent by default: %{public}@", (uint8_t *)&v6);

}

@end
