@implementation _SFPerSitePreferencesVendor

- (_SFRequestDesktopSitePreferenceManager)requestDesktopSitePreferenceManager
{
  _SFRequestDesktopSitePreferenceManager *requestDesktopSitePreferenceManager;
  _SFRequestDesktopSitePreferenceManager *v4;
  void *v5;
  void *v6;
  _SFRequestDesktopSitePreferenceManager *v7;
  _SFRequestDesktopSitePreferenceManager *v8;

  requestDesktopSitePreferenceManager = self->_requestDesktopSitePreferenceManager;
  if (!requestDesktopSitePreferenceManager)
  {
    v4 = [_SFRequestDesktopSitePreferenceManager alloc];
    objc_msgSend(MEMORY[0x1E0D8AAE0], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_SFRequestDesktopSiteQuirksManager sharedManager](_SFRequestDesktopSiteQuirksManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_SFRequestDesktopSitePreferenceManager initWithPerSitePreferencesStore:quirksManager:](v4, "initWithPerSitePreferencesStore:quirksManager:", v5, v6);
    v8 = self->_requestDesktopSitePreferenceManager;
    self->_requestDesktopSitePreferenceManager = v7;

    requestDesktopSitePreferenceManager = self->_requestDesktopSitePreferenceManager;
  }
  return requestDesktopSitePreferenceManager;
}

- (_SFPerSitePreferencesVendor)initWithExtensionsController:(id)a3 profileProvider:(id)a4
{
  id v7;
  id v8;
  _SFPerSitePreferencesVendor *v9;
  _SFPerSitePreferencesVendor *v10;
  _SFPerSitePreferencesVendor *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SFPerSitePreferencesVendor;
  v9 = -[_SFPerSitePreferencesVendor init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extensionsController, a3);
    objc_storeStrong((id *)&v10->_profileProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[_SFContentBlockersPreferenceManager invalidate](self->_contentBlockersPreferenceManager, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SFPerSitePreferencesVendor;
  -[_SFPerSitePreferencesVendor dealloc](&v3, sel_dealloc);
}

- (WBSAutomaticReaderActivationManager)automaticReaderActivationManager
{
  WBSAutomaticReaderActivationManager *automaticReaderPreferenceManager;
  id v4;
  void *v5;
  WBSAutomaticReaderActivationManager *v6;
  WBSAutomaticReaderActivationManager *v7;

  automaticReaderPreferenceManager = self->_automaticReaderPreferenceManager;
  if (!automaticReaderPreferenceManager)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8A7A0]);
    objc_msgSend(MEMORY[0x1E0D8AAE0], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (WBSAutomaticReaderActivationManager *)objc_msgSend(v4, "initWithPerSitePreferencesStore:", v5);
    v7 = self->_automaticReaderPreferenceManager;
    self->_automaticReaderPreferenceManager = v6;

    automaticReaderPreferenceManager = self->_automaticReaderPreferenceManager;
  }
  return automaticReaderPreferenceManager;
}

- (_SFContentBlockersPreferenceManager)contentBlockersPreferenceManager
{
  _SFContentBlockersPreferenceManager *contentBlockersPreferenceManager;
  _SFContentBlockersPreferenceManager *v4;
  void *v5;
  _SFContentBlockersPreferenceManager *v6;
  _SFContentBlockersPreferenceManager *v7;

  contentBlockersPreferenceManager = self->_contentBlockersPreferenceManager;
  if (!contentBlockersPreferenceManager)
  {
    v4 = [_SFContentBlockersPreferenceManager alloc];
    objc_msgSend(MEMORY[0x1E0D8AAE0], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_SFContentBlockersPreferenceManager initWithPerSitePreferencesStore:extensionsController:](v4, "initWithPerSitePreferencesStore:extensionsController:", v5, self->_extensionsController);
    v7 = self->_contentBlockersPreferenceManager;
    self->_contentBlockersPreferenceManager = v6;

    contentBlockersPreferenceManager = self->_contentBlockersPreferenceManager;
  }
  return contentBlockersPreferenceManager;
}

- (_SFUserMediaPermissionController)sharedUserMediaPermissionController
{
  return (_SFUserMediaPermissionController *)+[WBSUserMediaPermissionController sharedController](_SFUserMediaPermissionController, "sharedController");
}

- (_SFGeolocationPermissionManager)sharedGeolocationPermissionManager
{
  return (_SFGeolocationPermissionManager *)+[_SFGeolocationPermissionManager sharedManager](_SFGeolocationPermissionManager, "sharedManager");
}

- (WBSLockdownModePreferenceManager)lockdownModePreferenceManager
{
  WBSLockdownModePreferenceManager *lockdownModePreferenceManager;
  id v4;
  void *v5;
  WBSLockdownModePreferenceManager *v6;
  WBSLockdownModePreferenceManager *v7;

  lockdownModePreferenceManager = self->_lockdownModePreferenceManager;
  if (!lockdownModePreferenceManager)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8AA18]);
    objc_msgSend(MEMORY[0x1E0D8AAE0], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (WBSLockdownModePreferenceManager *)objc_msgSend(v4, "initWithPerSitePreferenceStore:", v5);
    v7 = self->_lockdownModePreferenceManager;
    self->_lockdownModePreferenceManager = v6;

    lockdownModePreferenceManager = self->_lockdownModePreferenceManager;
  }
  return lockdownModePreferenceManager;
}

- (_SFPageZoomPreferenceManager)pageZoomPreferenceManager
{
  _SFPageZoomPreferenceManager *pageZoomPreferenceManager;
  _SFPageZoomPreferenceManager *v4;
  _SFPageZoomPreferenceManager *v5;

  pageZoomPreferenceManager = self->_pageZoomPreferenceManager;
  if (!pageZoomPreferenceManager)
  {
    +[_SFPageZoomPreferenceManager sharedManager](_SFPageZoomPreferenceManager, "sharedManager");
    v4 = (_SFPageZoomPreferenceManager *)objc_claimAutoreleasedReturnValue();
    v5 = self->_pageZoomPreferenceManager;
    self->_pageZoomPreferenceManager = v4;

    pageZoomPreferenceManager = self->_pageZoomPreferenceManager;
  }
  return pageZoomPreferenceManager;
}

- (_SFAppInfoOverlayPreferenceManager)appInfoOverlayPreferenceManager
{
  _SFAppInfoOverlayPreferenceManager *appInfoOverlayPreferenceManager;
  _SFAppInfoOverlayPreferenceManager *v4;
  void *v5;
  _SFAppInfoOverlayPreferenceManager *v6;
  _SFAppInfoOverlayPreferenceManager *v7;

  appInfoOverlayPreferenceManager = self->_appInfoOverlayPreferenceManager;
  if (!appInfoOverlayPreferenceManager)
  {
    v4 = [_SFAppInfoOverlayPreferenceManager alloc];
    objc_msgSend(MEMORY[0x1E0D8AAE0], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_SFAppInfoOverlayPreferenceManager initWithPerSitePreferencesStore:](v4, "initWithPerSitePreferencesStore:", v5);
    v7 = self->_appInfoOverlayPreferenceManager;
    self->_appInfoOverlayPreferenceManager = v6;

    appInfoOverlayPreferenceManager = self->_appInfoOverlayPreferenceManager;
  }
  return appInfoOverlayPreferenceManager;
}

- (WBSProfilePreferenceManager)profilePreferenceManager
{
  WBSProfilePreferenceManager *profilePreferenceManager;
  id v4;
  void *v5;
  WBSProfilePreferenceManager *v6;
  WBSProfilePreferenceManager *v7;

  profilePreferenceManager = self->_profilePreferenceManager;
  if (!profilePreferenceManager)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8AB38]);
    objc_msgSend(MEMORY[0x1E0D8AAE0], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (WBSProfilePreferenceManager *)objc_msgSend(v4, "initWithPerSitePreferencesStore:profileProvider:", v5, self->_profileProvider);
    v7 = self->_profilePreferenceManager;
    self->_profilePreferenceManager = v6;

    profilePreferenceManager = self->_profilePreferenceManager;
  }
  return profilePreferenceManager;
}

- (id)managerForPreference:(id)a3
{
  id v4;
  NSMutableDictionary *preferenceToManager;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  NSMutableDictionary *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;

  v4 = a3;
  preferenceToManager = self->_preferenceToManager;
  if (!preferenceToManager)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_preferenceToManager;
    self->_preferenceToManager = v6;

    -[_SFPerSitePreferencesVendor automaticReaderActivationManager](self, "automaticReaderActivationManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_preferenceToManager;
    objc_msgSend(v38, "readerPreference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v38, v9);

    -[_SFPerSitePreferencesVendor contentBlockersPreferenceManager](self, "contentBlockersPreferenceManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_preferenceToManager;
    objc_msgSend(v37, "contentBlockersPreference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v37, v11);

    -[_SFPerSitePreferencesVendor sharedUserMediaPermissionController](self, "sharedUserMediaPermissionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_preferenceToManager;
    objc_msgSend(v12, "cameraMediaCapturePreference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

    v15 = self->_preferenceToManager;
    objc_msgSend(v12, "microphoneMediaCapturePreference");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v12, v16);

    -[_SFPerSitePreferencesVendor sharedGeolocationPermissionManager](self, "sharedGeolocationPermissionManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_preferenceToManager;
    objc_msgSend(v36, "geolocationPreference");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v36, v18);

    -[_SFPerSitePreferencesVendor requestDesktopSitePreferenceManager](self, "requestDesktopSitePreferenceManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self->_preferenceToManager;
    objc_msgSend(v19, "requestDesktopSitePreference");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v19, v21);

    -[_SFPerSitePreferencesVendor pageZoomPreferenceManager](self, "pageZoomPreferenceManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = self->_preferenceToManager;
    objc_msgSend(v22, "pageZoomPreference");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v22, v24);

    -[_SFPerSitePreferencesVendor appInfoOverlayPreferenceManager](self, "appInfoOverlayPreferenceManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = self->_preferenceToManager;
    objc_msgSend(v25, "appInfoOverlayPreference");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v25, v27);

    -[_SFPerSitePreferencesVendor lockdownModePreferenceManager](self, "lockdownModePreferenceManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = self->_preferenceToManager;
    objc_msgSend(v28, "lockdownPreference");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v28, v30);

    -[_SFPerSitePreferencesVendor profilePreferenceManager](self, "profilePreferenceManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = self->_preferenceToManager;
    objc_msgSend(v31, "profilePreference");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v31, v33);

    preferenceToManager = self->_preferenceToManager;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](preferenceToManager, "objectForKeyedSubscript:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (WBSProfileProviding)profileProvider
{
  return self->_profileProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileProvider, 0);
  objc_storeStrong((id *)&self->_profilePreferenceManager, 0);
  objc_storeStrong((id *)&self->_lockdownModePreferenceManager, 0);
  objc_storeStrong((id *)&self->_appInfoOverlayPreferenceManager, 0);
  objc_storeStrong((id *)&self->_pageZoomPreferenceManager, 0);
  objc_storeStrong((id *)&self->_requestDesktopSitePreferenceManager, 0);
  objc_storeStrong((id *)&self->_contentBlockersPreferenceManager, 0);
  objc_storeStrong((id *)&self->_automaticReaderPreferenceManager, 0);
  objc_storeStrong((id *)&self->_extensionsController, 0);
  objc_storeStrong((id *)&self->_preferenceToManager, 0);
}

@end
