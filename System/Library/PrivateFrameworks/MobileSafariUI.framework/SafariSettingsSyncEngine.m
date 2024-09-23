@implementation SafariSettingsSyncEngine

- (SafariSettingsSyncEngine)init
{
  SafariSettingsSyncEngine *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  WBSUserDefaultObservation *wallpaperDefaultsObservation;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  WBSUserDefaultObservation *defaultBrowserSelectionObservation;
  SafariSettingsSyncEngine *v21;
  SafariSettingsSyncEngine *v22;
  _QWORD v24[4];
  SafariSettingsSyncEngine *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)SafariSettingsSyncEngine;
  v2 = -[WBSSafariSettingsSyncEngine init](&v31, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__cloudBackgroundImageDidUpdateOnServer_, *MEMORY[0x1E0D8B398], 0);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__cloudBackgroundImageWasDeletedOnServer_, *MEMORY[0x1E0D8B390], 0);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__cloudSettingsDidUpdateOnServer_, *MEMORY[0x1E0D8B3A8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__backgroundImageChanged_, *MEMORY[0x1E0D8B5E0], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__didUpdateStartPageVisibility_, *MEMORY[0x1E0D8B408], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__didUpdateStartPageSectionOrder_, *MEMORY[0x1E0D8B620], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__customizationPaletteWasDismissed_, *MEMORY[0x1E0D8B410], 0);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D8B598];
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __32__SafariSettingsSyncEngine_init__block_invoke;
    v28[3] = &unk_1E9CF5680;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v7, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", v8, v9, 0, v28);
    v12 = objc_claimAutoreleasedReturnValue();
    wallpaperDefaultsObservation = v2->_wallpaperDefaultsObservation;
    v2->_wallpaperDefaultsObservation = (WBSUserDefaultObservation *)v12;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SFDefaultBrowserSelectionStateKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "integerForKey:", v15);

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      SFDefaultBrowserSelectionStateKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v11;
      v26[1] = 3221225472;
      v26[2] = __32__SafariSettingsSyncEngine_init__block_invoke_2;
      v26[3] = &unk_1E9CF5680;
      objc_copyWeak(&v27, &location);
      objc_msgSend(v17, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", v18, MEMORY[0x1E0C80D38], 0, v26);
      v19 = objc_claimAutoreleasedReturnValue();
      defaultBrowserSelectionObservation = v2->_defaultBrowserSelectionObservation;
      v2->_defaultBrowserSelectionObservation = (WBSUserDefaultObservation *)v19;

      objc_destroyWeak(&v27);
    }
    objc_msgSend(v6, "safari_addObserver:selector:forUserDefaultKey:", v2, sel__didUpdateCloudTabsOnStartPageConsent_, *MEMORY[0x1E0D8AF38]);
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __32__SafariSettingsSyncEngine_init__block_invoke_3;
    v24[3] = &unk_1E9CF56A8;
    v21 = v2;
    v25 = v21;
    -[WBSSafariSettingsSyncEngine registerDiagnosticWithPayloadProvider:](v21, "registerDiagnosticWithPayloadProvider:", v24);
    v22 = v21;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __32__SafariSettingsSyncEngine_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_didUpdateStartPageBackgroundImageVisibility");

}

void __32__SafariSettingsSyncEngine_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_didUpdateDefaultBrowserState");

}

id __32__SafariSettingsSyncEngine_init__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("Start Page Section Order");
  objc_msgSend(*(id *)(a1 + 32), "startPageSectionsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("Start Page Enabled Sections");
  objc_msgSend(*(id *)(a1 + 32), "startPageSectionsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledSectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("Background Image Exist");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "BOOLForKey:", *MEMORY[0x1E0D8B128]));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)syncEnabled
{
  void *v2;
  char v3;

  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudSyncAvailable");

  if ((v3 & 1) != 0)
    return objc_msgSend(MEMORY[0x1E0D89BE8], "isStartPageSettingSyncEnabled");
  else
    return 0;
}

- (id)startPageSectionsManager
{
  WBSStartPageSectionManager *lazyStartPageSectionsManager;
  WBSStartPageSectionManager *v4;
  WBSStartPageSectionManager *v5;

  lazyStartPageSectionsManager = self->_lazyStartPageSectionsManager;
  if (!lazyStartPageSectionsManager)
  {
    v4 = (WBSStartPageSectionManager *)objc_alloc_init(MEMORY[0x1E0D8ACC8]);
    v5 = self->_lazyStartPageSectionsManager;
    self->_lazyStartPageSectionsManager = v4;

    lazyStartPageSectionsManager = self->_lazyStartPageSectionsManager;
  }
  return lazyStartPageSectionsManager;
}

- (void)_cloudSettingsDidUpdateOnServer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99EA0];
  objc_msgSend(v7, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_notificationNameForUserDefaultsKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", v6, 0);

}

- (void)_customizationPaletteWasDismissed:(id)a3
{
  if (-[SafariSettingsSyncEngine syncEnabled](self, "syncEnabled", a3))
    -[WBSSafariSettingsSyncEngine triggerImmediateBackgroundImageSaveIfApplicable](self, "triggerImmediateBackgroundImageSaveIfApplicable");
}

- (void)_backgroundImageChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[SafariSettingsSyncEngine syncEnabled](self, "syncEnabled"))
  {
    objc_msgSend(v11, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D8B5D8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "integerForKey:", *MEMORY[0x1E0D8B128]);

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_startPageBackgroundImageFileURLForDefaultProfile");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D8ACA0], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSafariSettingsSyncEngine scheduleCloudBackgroundImageSaveWithURL:isLightAppearance:successCompletionHandler:](self, "scheduleCloudBackgroundImageSaveWithURL:isLightAppearance:successCompletionHandler:", v9, objc_msgSend(v10, "appearanceIfImageExists:", 1) == 1, &__block_literal_global_37_0);

      }
      else
      {
        -[WBSSafariSettingsSyncEngine deleteBackgroundImageFromCloudKitWithCompletionHandler:](self, "deleteBackgroundImageFromCloudKitWithCompletionHandler:", &__block_literal_global_23);
      }
    }

  }
}

void __52__SafariSettingsSyncEngine__backgroundImageChanged___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D7CA3000, v0, OS_LOG_TYPE_INFO, "Safari's background image has been deleted in CloudKit.", v1, 2u);
  }
}

void __52__SafariSettingsSyncEngine__backgroundImageChanged___block_invoke_35()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D7CA3000, v0, OS_LOG_TYPE_INFO, "Safari's background image has been updated in CloudKit", v1, 2u);
  }
}

- (void)_cloudBackgroundImageDidUpdateOnServer:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0D8B5D0], 0);

}

- (void)_cloudBackgroundImageWasDeletedOnServer:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0D8B5C0], 0);

}

- (void)_didUpdateStartPageBackgroundImageVisibility
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (-[SafariSettingsSyncEngine syncEnabled](self, "syncEnabled"))
  {
    v3 = *MEMORY[0x1E0D8AF28];
    v10[0] = *MEMORY[0x1E0D8B418];
    v4 = *MEMORY[0x1E0D8AF30];
    v9[0] = v3;
    v9[1] = v4;
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "BOOLForKey:", *MEMORY[0x1E0D8B598]));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSSafariSettingsSyncEngine saveSettingWithDictionaryRepresentation:successCompletionHandler:](self, "saveSettingWithDictionaryRepresentation:successCompletionHandler:", v8, &__block_literal_global_38);
  }
}

void __72__SafariSettingsSyncEngine__didUpdateStartPageBackgroundImageVisibility__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D7CA3000, v0, OS_LOG_TYPE_INFO, "Safari's background image visibility has been updated in CloudKit", v1, 2u);
  }
}

- (void)_didUpdateDefaultBrowserState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (-[SafariSettingsSyncEngine syncEnabled](self, "syncEnabled"))
  {
    v9[0] = *MEMORY[0x1E0D8AF28];
    SFDefaultBrowserSelectionStateKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    v9[1] = *MEMORY[0x1E0D8AF30];
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SFDefaultBrowserSelectionStateKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "integerForKey:", v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSSafariSettingsSyncEngine saveSettingWithDictionaryRepresentation:successCompletionHandler:](self, "saveSettingWithDictionaryRepresentation:successCompletionHandler:", v8, &__block_literal_global_39);
  }
}

void __57__SafariSettingsSyncEngine__didUpdateDefaultBrowserState__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D7CA3000, v0, OS_LOG_TYPE_INFO, "Safari's default browser state has been updated in CloudKit", v1, 2u);
  }
}

- (void)_didUpdateStartPageVisibility:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (-[SafariSettingsSyncEngine syncEnabled](self, "syncEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SafariSettingsSyncEngine _sectionIdentifierToSettingName:](self, "_sectionIdentifierToSettingName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D8AF28]);

    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D8AF30]);

    if (objc_msgSend(v5, "count"))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __58__SafariSettingsSyncEngine__didUpdateStartPageVisibility___block_invoke;
      v11[3] = &unk_1E9CF31B0;
      v12 = v4;
      -[WBSSafariSettingsSyncEngine saveSettingWithDictionaryRepresentation:successCompletionHandler:](self, "saveSettingWithDictionaryRepresentation:successCompletionHandler:", v5, v11);

    }
  }

}

void __58__SafariSettingsSyncEngine__didUpdateStartPageVisibility___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("section"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1D7CA3000, v2, OS_LOG_TYPE_INFO, "Safari's %{public}@ has been updated in CloudKit", (uint8_t *)&v5, 0xCu);

  }
}

- (void)_didUpdateStartPageSectionOrder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (-[SafariSettingsSyncEngine syncEnabled](self, "syncEnabled", a3))
  {
    v4 = *MEMORY[0x1E0D8AF28];
    v10[0] = *MEMORY[0x1E0D8B458];
    v5 = *MEMORY[0x1E0D8AF30];
    v9[0] = v4;
    v9[1] = v5;
    -[SafariSettingsSyncEngine startPageSectionsManager](self, "startPageSectionsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudKitStartPageSectionOrder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSSafariSettingsSyncEngine saveSettingWithDictionaryRepresentation:successCompletionHandler:](self, "saveSettingWithDictionaryRepresentation:successCompletionHandler:", v8, &__block_literal_global_45);
  }
}

void __60__SafariSettingsSyncEngine__didUpdateStartPageSectionOrder___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D7CA3000, v0, OS_LOG_TYPE_INFO, "Safari's Start Page order has been updated in CloudKit", v1, 2u);
  }
}

- (id)_sectionIdentifierToSettingName:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[10];
  _QWORD v22[11];

  v22[10] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D8B420];
  v5 = *MEMORY[0x1E0D8B650];
  v21[0] = *MEMORY[0x1E0D8B5F8];
  v21[1] = v5;
  v6 = *MEMORY[0x1E0D8B448];
  v22[0] = v4;
  v22[1] = v6;
  v7 = *MEMORY[0x1E0D8B460];
  v8 = *MEMORY[0x1E0D8B630];
  v21[2] = *MEMORY[0x1E0D8B660];
  v21[3] = v8;
  v9 = *MEMORY[0x1E0D8B440];
  v22[2] = v7;
  v22[3] = v9;
  v10 = *MEMORY[0x1E0D8B430];
  v11 = *MEMORY[0x1E0D8B600];
  v21[4] = *MEMORY[0x1E0D8B608];
  v21[5] = v11;
  v12 = *MEMORY[0x1E0D8B428];
  v22[4] = v10;
  v22[5] = v12;
  v13 = *MEMORY[0x1E0D8B438];
  v14 = *MEMORY[0x1E0D8B668];
  v21[6] = *MEMORY[0x1E0D8B610];
  v21[7] = v14;
  v15 = *MEMORY[0x1E0D8B468];
  v22[6] = v13;
  v22[7] = v15;
  v16 = *MEMORY[0x1E0D8B670];
  v21[8] = *MEMORY[0x1E0D8B658];
  v21[9] = v16;
  v17 = *MEMORY[0x1E0D8B470];
  v22[8] = *MEMORY[0x1E0D8B450];
  v22[9] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)_didUpdateCloudTabsOnStartPageConsent:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D8AF28];
  v11[0] = *MEMORY[0x1E0D8B400];
  v5 = *MEMORY[0x1E0D8AF30];
  v10[0] = v4;
  v10[1] = v5;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "BOOLForKey:", *MEMORY[0x1E0D8AF38]));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSSafariSettingsSyncEngine saveSettingWithDictionaryRepresentation:successCompletionHandler:](self, "saveSettingWithDictionaryRepresentation:successCompletionHandler:", v9, &__block_literal_global_46);
}

void __66__SafariSettingsSyncEngine__didUpdateCloudTabsOnStartPageConsent___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D7CA3000, v0, OS_LOG_TYPE_INFO, "Cloud tabs on start page consent has been updated in CloudKit", v1, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyStartPageSectionsManager, 0);
  objc_storeStrong((id *)&self->_defaultBrowserSelectionObservation, 0);
  objc_storeStrong((id *)&self->_wallpaperDefaultsObservation, 0);
}

@end
