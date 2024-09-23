@implementation _SFPageZoomPreferenceManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_50);
  return (id)sharedManager_sharedManager;
}

- (_SFPageZoomPreferenceManager)initWithPerSitePreferencesStore:(id)a3
{
  _SFPageZoomPreferenceManager *v3;
  void *v4;
  _SFPageZoomPreferenceManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFPageZoomPreferenceManager;
  v3 = -[WBSPageZoomPreferenceManager initWithPerSitePreferencesStore:](&v7, sel_initWithPerSitePreferencesStore_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__didRemoveHostnames_, *MEMORY[0x1E0D8B0D0], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__historyWasCleared_, *MEMORY[0x1E0D8B0F8], 0);
    v5 = v3;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_SFPageZoomPreferenceManager;
  -[_SFPageZoomPreferenceManager dealloc](&v4, sel_dealloc);
}

- (void)_didRemoveHostnames:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "copy");

  -[WBSPageZoomPreferenceManager removePageZoomPreferencesForHostnames:](self, "removePageZoomPreferencesForHostnames:", v5);
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6
{
  id v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v12[1] = 3221225472;
  v12[2] = __82___SFPageZoomPreferenceManager_setValue_ofPreference_forDomain_completionHandler___block_invoke;
  v12[3] = &unk_1E4AC0690;
  v13 = a6;
  v11.receiver = self;
  v11.super_class = (Class)_SFPageZoomPreferenceManager;
  v12[0] = MEMORY[0x1E0C809B0];
  v10 = v13;
  -[WBSPerSitePreferenceManager setValue:ofPreference:forDomain:completionHandler:](&v11, sel_setValue_ofPreference_forDomain_completionHandler_, a3, a4, a5, v12);

}

- (void)setDefaultValue:(id)a3 ofPreference:(id)a4 completionHandler:(id)a5
{
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v10[1] = 3221225472;
  v10[2] = __79___SFPageZoomPreferenceManager_setDefaultValue_ofPreference_completionHandler___block_invoke;
  v10[3] = &unk_1E4AC0690;
  v11 = a5;
  v9.receiver = self;
  v9.super_class = (Class)_SFPageZoomPreferenceManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v8 = v11;
  -[WBSPerSitePreferenceManager setDefaultValue:ofPreference:completionHandler:](&v9, sel_setDefaultValue_ofPreference_completionHandler_, a3, a4, v10);

}

- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5
{
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v10[1] = 3221225472;
  v10[2] = __98___SFPageZoomPreferenceManager_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke;
  v10[3] = &unk_1E4AC0690;
  v11 = a5;
  v9.receiver = self;
  v9.super_class = (Class)_SFPageZoomPreferenceManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v8 = v11;
  -[WBSPerSitePreferenceManager removePreferenceValuesForDomains:fromPreference:completionHandler:](&v9, sel_removePreferenceValuesForDomains_fromPreference_completionHandler_, a3, a4, v10);

}

@end
