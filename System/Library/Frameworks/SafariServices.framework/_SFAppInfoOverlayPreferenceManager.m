@implementation _SFAppInfoOverlayPreferenceManager

- (_SFAppInfoOverlayPreferenceManager)init
{

  return 0;
}

- (_SFAppInfoOverlayPreferenceManager)initWithPerSitePreferencesStore:(id)a3
{
  id v5;
  _SFAppInfoOverlayPreferenceManager *v6;
  _SFAppInfoOverlayPreferenceManager *v7;
  uint64_t v8;
  WBSPerSitePreference *appInfoOverlayPreference;
  _SFAppInfoOverlayPreferenceManager *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFAppInfoOverlayPreferenceManager;
  v6 = -[_SFAppInfoOverlayPreferenceManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_perSitePreferencesStore, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8AAD0]), "initWithIdentifier:", CFSTR("AppInfoOverlayPreference"));
    appInfoOverlayPreference = v7->_appInfoOverlayPreference;
    v7->_appInfoOverlayPreference = (WBSPerSitePreference *)v8;

    -[WBSPerSitePreferenceManager setStorageDelegate:](v7, "setStorageDelegate:", v7);
    -[WBSPerSitePreferenceManager setDefaultsDelegate:](v7, "setDefaultsDelegate:", v7);
    v10 = v7;
  }

  return v7;
}

- (void)getAppInfoOverlayPreferenceForDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WBSPerSitePreference *appInfoOverlayPreference;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D8AAD8], "timeoutWithInterval:fallbackValue:", &unk_1E4B25B88, 0.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    appInfoOverlayPreference = self->_appInfoOverlayPreference;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __93___SFAppInfoOverlayPreferenceManager_getAppInfoOverlayPreferenceForDomain_completionHandler___block_invoke;
    v10[3] = &unk_1E4AC27C8;
    v11 = v7;
    -[WBSPerSitePreferenceManager getValueOfPreference:forDomain:withTimeout:usingBlock:](self, "getValueOfPreference:forDomain:withTimeout:usingBlock:", appInfoOverlayPreference, v6, v8, v10);

  }
  else
  {
    (*((void (**)(id, int64_t, uint64_t))v7 + 2))(v7, -[_SFAppInfoOverlayPreferenceManager _defaultPreferenceValue](self, "_defaultPreferenceValue"), 1);
  }

}

- (void)setAppInfoOverlayPreferenceForDomain:(id)a3 settings:(int64_t)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "numberWithInteger:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSPerSitePreferenceManager setValue:ofPreference:forDomain:completionHandler:](self, "setValue:ofPreference:forDomain:completionHandler:", v11, self->_appInfoOverlayPreference, v10, v9);

}

- (int64_t)_defaultPreferenceValue
{
  return 1;
}

- (id)preferences
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_appInfoOverlayPreference;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1E4B27280;
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
  -[_SFAppInfoOverlayPreferenceManager onValueForPreference:](self, "onValueForPreference:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  objc_msgSend(v6, "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8AAD0], "localizedStringForBinaryPreferenceValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)preferenceNameForPreference:(id)a3
{
  return (id)*MEMORY[0x1E0D8B298];
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_SFAppInfoOverlayPreferenceManager _defaultPreferenceValue](self, "_defaultPreferenceValue", a3));
}

- (id)onValueForPreference:(id)a3
{
  return &unk_1E4B25B88;
}

- (id)offValueForPreference:(id)a3
{
  return &unk_1E4B25BA0;
}

- (WBSPerSitePreference)appInfoOverlayPreference
{
  return self->_appInfoOverlayPreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInfoOverlayPreference, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

@end
