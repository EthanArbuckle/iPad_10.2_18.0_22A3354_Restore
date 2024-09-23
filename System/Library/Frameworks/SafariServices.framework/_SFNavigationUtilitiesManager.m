@implementation _SFNavigationUtilitiesManager

- (_SFNavigationUtilitiesManager)initWithPerSitePreferencesVendor:(id)a3
{
  id v5;
  _SFNavigationUtilitiesManager *v6;
  _SFNavigationUtilitiesManager *v7;
  _SFNavigationUtilitiesManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFNavigationUtilitiesManager;
  v6 = -[_SFNavigationUtilitiesManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_preferencesVendor, a3);
    v8 = v7;
  }

  return v7;
}

- (void)setReloadOptionsController:(id)a3
{
  objc_storeWeak((id *)&self->_reloadOptionsController, a3);
}

- (void)setBrowserDocument:(id)a3
{
  objc_storeWeak((id *)&self->_browserDocument, a3);
}

+ (id)_sharedUserAgentQuirksManager
{
  if (_sharedUserAgentQuirksManager_onceToken != -1)
    dispatch_once(&_sharedUserAgentQuirksManager_onceToken, &__block_literal_global_46);
  return (id)_sharedUserAgentQuirksManager_quirksManager;
}

- (void)_applyAutoplayQuirksToWebsitePolicies:(id)a3 desktopSiteSetting:(int64_t)a4
{
  NSNumber *cachedPlayingPauseQuirkEnabled;
  void *v7;
  NSNumber *v8;
  NSNumber *v9;
  _BOOL4 v10;
  NSNumber *cachedPerDocumentAutoplayBehaviorQuirkEnabled;
  void *v12;
  NSNumber *v13;
  NSNumber *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  cachedPlayingPauseQuirkEnabled = self->_cachedPlayingPauseQuirkEnabled;
  if (!cachedPlayingPauseQuirkEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_numberForKey:", *MEMORY[0x1E0D4F3C0]);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_cachedPlayingPauseQuirkEnabled;
    self->_cachedPlayingPauseQuirkEnabled = v8;

    cachedPlayingPauseQuirkEnabled = self->_cachedPlayingPauseQuirkEnabled;
  }
  v10 = -[NSNumber BOOLValue](cachedPlayingPauseQuirkEnabled, "BOOLValue");
  cachedPerDocumentAutoplayBehaviorQuirkEnabled = self->_cachedPerDocumentAutoplayBehaviorQuirkEnabled;
  if (!cachedPerDocumentAutoplayBehaviorQuirkEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_numberForKey:", *MEMORY[0x1E0D4F5B0]);
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = self->_cachedPerDocumentAutoplayBehaviorQuirkEnabled;
    self->_cachedPerDocumentAutoplayBehaviorQuirkEnabled = v13;

    cachedPerDocumentAutoplayBehaviorQuirkEnabled = self->_cachedPerDocumentAutoplayBehaviorQuirkEnabled;
  }
  v15 = a4 == 1 || v10;
  if (-[NSNumber BOOLValue](cachedPerDocumentAutoplayBehaviorQuirkEnabled, "BOOLValue"))
    v16 = v15 | 8;
  else
    v16 = v15;
  objc_msgSend(v17, "_setAllowedAutoplayQuirks:", v16);

}

- (void)websitePoliciesForURL:(id)a3 isForMainFrameNavigation:(BOOL)a4 navigationType:(int64_t)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  CFAbsoluteTime Current;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  dispatch_block_t v29;
  NSObject *v30;
  dispatch_time_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD block[5];
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD *v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[3];
  char v49;
  _QWORD v50[5];
  id v51;
  NSObject *v52;
  _QWORD v53[4];
  id v54;
  _SFNavigationUtilitiesManager *v55;
  id v56;
  NSObject *v57;
  CFAbsoluteTime v58;
  _QWORD v59[5];
  id v60;
  NSObject *v61;
  _QWORD v62[5];
  id v63;
  id v64;
  NSObject *v65;

  v7 = a4;
  v9 = a3;
  v10 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0CEF640]);
  -[_SFNavigationUtilitiesManager reloadOptionsController](self, "reloadOptionsController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = v7;
  else
    v13 = 0;
  if (v13 && _SFDeviceSupportsDesktopSitesByDefault())
    -[_SFNavigationUtilitiesManager _applyAutoplayQuirksToWebsitePolicies:desktopSiteSetting:](self, "_applyAutoplayQuirksToWebsitePolicies:desktopSiteSetting:", v11, 1);
  objc_msgSend(v9, "safari_userVisibleHostWithoutWWWSubdomain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    v36 = v10;
    v15 = dispatch_group_create();
    v16 = v15;
    v17 = MEMORY[0x1E0C809B0];
    if (v13)
    {
      dispatch_group_enter(v15);
      v62[0] = v17;
      v62[1] = 3221225472;
      v62[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke;
      v62[3] = &unk_1E4AC5838;
      v62[4] = self;
      v63 = v9;
      v64 = v11;
      v65 = v16;
      objc_msgSend(v12, "customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:", v63, v62, 0.02);

    }
    v35 = v12;
    objc_msgSend(v9, "host");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFNavigationUtilitiesManager userDefinedContentBlockerManager](self, "userDefinedContentBlockerManager");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v7
      && v19
      && objc_msgSend(v18, "length")
      && objc_msgSend(MEMORY[0x1E0D8A8F8], "isScribbleEnabled"))
    {
      dispatch_group_enter(v16);
      v59[0] = v17;
      v59[1] = 3221225472;
      v59[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_4;
      v59[3] = &unk_1E4AC5860;
      v59[4] = self;
      v60 = v11;
      v61 = v16;
      objc_msgSend(v20, "getAllPaintingAvoidanceSelectorsThatApplyToHost:completionHandler:", v18, v59);

    }
    v33 = v20;
    v34 = v18;
    Current = CFAbsoluteTimeGetCurrent();
    v22 = v17;
    v53[0] = v17;
    v53[1] = 3221225472;
    v53[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_5;
    v53[3] = &unk_1E4AC5888;
    v23 = v14;
    v58 = Current;
    v54 = v23;
    v55 = self;
    v24 = v11;
    v56 = v24;
    v25 = v16;
    v57 = v25;
    v26 = (void *)MEMORY[0x1A8598C40](v53);
    dispatch_group_enter(v25);
    -[_SFPerSitePreferencesVendor contentBlockersPreferenceManager](self->_preferencesVendor, "contentBlockersPreferenceManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "getContentBlockersEnabledStateForDomain:withTimeout:fallbackEnabledState:completionHandler:", v23, 1, v26, 0.02);

    if (objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari"))
    {
      dispatch_group_enter(v25);
      -[_SFPerSitePreferencesVendor lockdownModePreferenceManager](self->_preferencesVendor, "lockdownModePreferenceManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v22;
      v50[1] = 3221225472;
      v50[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_18;
      v50[3] = &unk_1E4AC2D58;
      v50[4] = self;
      v51 = v24;
      v52 = v25;
      objc_msgSend(v28, "getLockdownModeEnabledForDomain:withTimeout:fallbackEnabledState:usingBlock:", v23, 1, v50, 0.02);

    }
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    v49 = 0;
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = __Block_byref_object_copy__7;
    v46[4] = __Block_byref_object_dispose__7;
    v42[0] = v22;
    v42[1] = 3221225472;
    v42[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_19;
    v42[3] = &unk_1E4AC58B0;
    v45 = v48;
    v42[4] = self;
    v44 = v36;
    v43 = v24;
    v47 = (id)MEMORY[0x1A8598C40](v42);
    block[0] = v22;
    block[1] = 3221225472;
    block[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_2_20;
    block[3] = &unk_1E4ABFC78;
    block[4] = v46;
    v29 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    v30 = MEMORY[0x1E0C80D38];
    dispatch_group_notify(v25, MEMORY[0x1E0C80D38], v29);
    v31 = dispatch_time(0, 20000000);
    v37[0] = v22;
    v37[1] = 3221225472;
    v37[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_3_21;
    v37[3] = &unk_1E4AC58D8;
    v39 = v48;
    v40 = v46;
    v38 = v29;
    v32 = v29;
    dispatch_after(v31, v30, v37);

    v10 = v36;
    _Block_object_dispose(v46, 8);

    _Block_object_dispose(v48, 8);
    v12 = v35;
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v11);
  }

}

- (BOOL)_shouldOverrideUserAgentSettingForFacebookAuthURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = v4;
  if (self->_persona == 1)
  {
    objc_msgSend(v4, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "safari_isCaseInsensitiveEqualToString:", CFSTR("m.facebook.com")))
    {
      objc_msgSend(v5, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hasSuffix:", CFSTR("/dialog/oauth"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_SFReloadOptionsController)reloadOptionsController
{
  return (_SFReloadOptionsController *)objc_loadWeakRetained((id *)&self->_reloadOptionsController);
}

- (int64_t)persona
{
  return self->_persona;
}

- (void)setPersona:(int64_t)a3
{
  self->_persona = a3;
}

- (_SFBrowserDocument)browserDocument
{
  return (_SFBrowserDocument *)objc_loadWeakRetained((id *)&self->_browserDocument);
}

- (WBSUserDefinedContentBlockerManager)userDefinedContentBlockerManager
{
  return (WBSUserDefinedContentBlockerManager *)objc_loadWeakRetained((id *)&self->_userDefinedContentBlockerManager);
}

- (void)setUserDefinedContentBlockerManager:(id)a3
{
  objc_storeWeak((id *)&self->_userDefinedContentBlockerManager, a3);
}

- (BOOL)isContentBlockersPerSiteSettingEnabled
{
  return self->_isContentBlockersPerSiteSettingEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userDefinedContentBlockerManager);
  objc_destroyWeak((id *)&self->_browserDocument);
  objc_destroyWeak((id *)&self->_reloadOptionsController);
  objc_storeStrong((id *)&self->_cachedPerDocumentAutoplayBehaviorQuirkEnabled, 0);
  objc_storeStrong((id *)&self->_cachedPlayingPauseQuirkEnabled, 0);
  objc_storeStrong((id *)&self->_preferencesVendor, 0);
}

@end
