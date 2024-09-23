@implementation HUAppleMusicAccountItemManager

- (HUAppleMusicAccountItemManager)initWithMediaProfileContainer:(id)a3 delegate:(id)a4
{
  id v7;
  HUAppleMusicAccountItemManager *v8;
  HUAppleMusicAccountItemManager *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUAppleMusicAccountItemManager;
  v8 = -[HFItemManager initWithDelegate:](&v11, sel_initWithDelegate_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_mediaProfileContainer, a3);

  return v9;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  void *v5;
  HUAppleMusicAccountModule *v6;
  void *v7;
  HUAppleMusicAccountModule *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  HUPrimaryUserSettingsItemModule *v12;
  void *v13;
  HUPrimaryUserSettingsItemModule *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (-[HUAppleMusicAccountItemManager _showAppleMusicSettings](self, "_showAppleMusicSettings"))
  {
    v6 = [HUAppleMusicAccountModule alloc];
    -[HUAppleMusicAccountItemManager mediaProfileContainer](self, "mediaProfileContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HUAppleMusicAccountModule initWithMediaProfileContainer:itemUpdater:](v6, "initWithMediaProfileContainer:itemUpdater:", v7, self);
    -[HUAppleMusicAccountItemManager setAppleMusicAccountModule:](self, "setAppleMusicAccountModule:", v8);

    objc_initWeak(location, self);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__HUAppleMusicAccountItemManager__buildItemModulesForHome___block_invoke;
    v19[3] = &unk_1E6F5FC90;
    objc_copyWeak(&v20, location);
    -[HUAppleMusicAccountItemManager appleMusicAccountModule](self, "appleMusicAccountModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStateChangeObserver:", v19);

    -[HUAppleMusicAccountItemManager appleMusicAccountModule](self, "appleMusicAccountModule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  else
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[HUAppleMusicAccountItemManager mediaProfileContainer](self, "mediaProfileContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v17;
      _os_log_debug_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEBUG, "Not showing AppleMusic Module for %@", (uint8_t *)location, 0xCu);

    }
  }
  if (-[HUAppleMusicAccountItemManager _showPrimaryUserSettings](self, "_showPrimaryUserSettings"))
  {
    v12 = [HUPrimaryUserSettingsItemModule alloc];
    -[HUAppleMusicAccountItemManager mediaProfileContainer](self, "mediaProfileContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HUPrimaryUserSettingsItemModule initWithItemUpdater:home:mediaProfileContainer:](v12, "initWithItemUpdater:home:mediaProfileContainer:", self, v4, v13);
    -[HUAppleMusicAccountItemManager setPrimaryUserSettingsItemModule:](self, "setPrimaryUserSettingsItemModule:", v14);

    -[HUAppleMusicAccountItemManager primaryUserSettingsItemModule](self, "primaryUserSettingsItemModule");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);
  }
  else
  {
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[HUAppleMusicAccountItemManager mediaProfileContainer](self, "mediaProfileContainer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v18;
      _os_log_debug_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEBUG, "Not showing Primary User Module for %@", (uint8_t *)location, 0xCu);

    }
  }

  return v5;
}

void __59__HUAppleMusicAccountItemManager__buildItemModulesForHome___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_moduleStateDidChangeFrom:to:", a2, a3);

}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUAppleMusicAccountItemManager primaryUserSettingsItemModule](self, "primaryUserSettingsItemModule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[HUAppleMusicAccountItemManager primaryUserSettingsItemModule](self, "primaryUserSettingsItemModule");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "buildSectionsWithDisplayedItems:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObjectsFromArray:", v8);
    }
    -[HUAppleMusicAccountItemManager appleMusicAccountModule](self, "appleMusicAccountModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildSectionsWithDisplayedItems:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObjectsFromArray:", v10);
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (void)_moduleStateDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  _BOOL8 v5;

  v5 = a3 < 2 && a4 > 1;
  -[HUAppleMusicAccountItemManager setShouldDisableUpdates:](self, "setShouldDisableUpdates:", v5, a4);
}

- (void)setShouldDisableUpdates:(BOOL)a3
{
  if (self->_shouldDisableUpdates != a3)
  {
    self->_shouldDisableUpdates = a3;
    if (a3)
      -[HFItemManager disableExternalUpdatesWithReason:](self, "disableExternalUpdatesWithReason:", CFSTR("HUAppleMusicAccountItemManager_StateTransition"));
    else
      -[HFItemManager endDisableExternalUpdatesWithReason:](self, "endDisableExternalUpdatesWithReason:", CFSTR("HUAppleMusicAccountItemManager_StateTransition"));
  }
}

- (BOOL)_showPrimaryUserSettings
{
  void *v2;
  char v3;

  -[HUAppleMusicAccountItemManager mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_supportsPreferredMediaUser");

  return v3;
}

- (BOOL)_showAppleMusicSettings
{
  void *v2;
  void *v3;
  char v4;

  -[HUAppleMusicAccountItemManager mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isSiriEndpoint") ^ 1;

  return v4;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HUAppleMusicAccountModule)appleMusicAccountModule
{
  return self->_appleMusicAccountModule;
}

- (void)setAppleMusicAccountModule:(id)a3
{
  objc_storeStrong((id *)&self->_appleMusicAccountModule, a3);
}

- (HUPrimaryUserSettingsItemModule)primaryUserSettingsItemModule
{
  return self->_primaryUserSettingsItemModule;
}

- (void)setPrimaryUserSettingsItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_primaryUserSettingsItemModule, a3);
}

- (BOOL)shouldDisableUpdates
{
  return self->_shouldDisableUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryUserSettingsItemModule, 0);
  objc_storeStrong((id *)&self->_appleMusicAccountModule, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
