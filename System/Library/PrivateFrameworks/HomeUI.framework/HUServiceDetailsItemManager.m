@implementation HUServiceDetailsItemManager

- (HUServiceDetailsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithServiceItem_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsItemManager.m"), 200, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUServiceDetailsItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUServiceDetailsItemManager)initWithServiceItem:(id)a3 delegate:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  HUServiceDetailsItemManager *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  HUAccessorySettingsItemModule *v15;
  HUAccessorySettingsItemModule *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  HMHomeManager *homeManager;
  void *v27;
  void *v28;
  uint64_t v29;
  HMAccessorySettingsController *settingsController;
  NSObject *v31;
  HMHomeManager *v33;
  void *v34;
  void *v35;
  objc_super v36;
  uint8_t buf[4];
  HMHomeManager *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(v7, "copy");
  v36.receiver = self;
  v36.super_class = (Class)HUServiceDetailsItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v36, sel_initWithDelegate_sourceItem_, v8, v9);

  if (v10)
  {
    objc_opt_class();
    v11 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addDiagnosticInfoObserver:", v10);

      if ((_os_feature_enabled_impl() & 1) == 0)
        NSLog(&CFSTR("If coordination get disabled, and we are back to using HomeKit to sync alarms, we need to revisit how Hom"
                     "eKit is calling settings:didUpdateForIdentifier:keyPath: because it currently does not work for alarms").isa);
      if ((objc_msgSend(v13, "isHomePod") & 1) != 0 || objc_msgSend(v13, "isHomePodMediaSystem"))
        objc_msgSend(MEMORY[0x1E0CBA830], "hf_resetAllowlists");
      v15 = [HUAccessorySettingsItemModule alloc];
      v4 = (void *)objc_msgSend(v13, "copy");
      v16 = -[HUAccessorySettingsItemModule initWithItemUpdater:mediaAccessoryItem:](v15, "initWithItemUpdater:mediaAccessoryItem:", v10, v4);
      -[HUServiceDetailsItemManager setAccessorySettingsItemModule:](v10, "setAccessorySettingsItemModule:", v16);

      v10->_groupedAccessoryReachableOverRapport = 0;
      if (-[HUServiceDetailsItemManager _isGroupedHomePod](v10, "_isGroupedHomePod"))
      {
        HFLogForCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "Grouped HomePod", buf, 2u);
        }

        -[HUServiceDetailsItemManager _setupDeviceOptionsAdapterUtilityForGroupedAccessories:](v10, "_setupDeviceOptionsAdapterUtilityForGroupedAccessories:", v13);
      }
      else if (-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:](v10, "shouldShowDeviceOptionsForAccessoryItem:", v13))
      {
        HFLogForCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "Solo HomePod", buf, 2u);
        }

        -[HUServiceDetailsItemManager _setupDeviceOptionsAdapterForMediaAccessoryItem:](v10, "_setupDeviceOptionsAdapterForMediaAccessoryItem:", v13);
      }
    }
    objc_msgSend(v11, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "home");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v10->_overrideHome, v20);
    if (!v19)
    {

    }
    objc_msgSend(v11, "accessories");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "anyObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v22, "hf_siriEndpointProfile");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "homeManager");
        v25 = objc_claimAutoreleasedReturnValue();
        homeManager = v10->_homeManager;
        v10->_homeManager = (HMHomeManager *)v25;

        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "accessorySettingsDataSource");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObserver:", v10);

        -[HMHomeManager hf_accessorySettingsController](v10->_homeManager, "hf_accessorySettingsController");
        v29 = objc_claimAutoreleasedReturnValue();
        settingsController = v10->_settingsController;
        v10->_settingsController = (HMAccessorySettingsController *)v29;

        HFLogForCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v33 = v10->_homeManager;
          objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "accessorySettingsDataSource");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v38 = v33;
          v39 = 2112;
          v40 = v35;
          _os_log_debug_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEBUG, "Created Home Manager = [%@] and DataSource = [%@]", buf, 0x16u);

        }
      }
    }

  }
  return v10;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUServiceDetailsItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)tearDown
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessorySettingsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDiagnosticInfoObserver:", self);

}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUServiceDetailsItemManager;
  -[HFItemManager _registerForExternalUpdates](&v4, sel__registerForExternalUpdates);
  -[HUServiceDetailsItemManager accessorySettingsItemModule](self, "accessorySettingsItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForExternalUpdates");

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUServiceDetailsItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v4, sel__unregisterForExternalUpdates);
  -[HUServiceDetailsItemManager accessorySettingsItemModule](self, "accessorySettingsItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterForExternalUpdates");

}

- (BOOL)isItemGroup
{
  void *v2;
  void *v3;
  id v4;
  char v5;

  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2AC600))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "isItemGroup");
  return v5;
}

- (BOOL)isAccessory
{
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[HUServiceDetailsItemManager isItemGroup](self, "isItemGroup"))
  {
    isKindOfClass = 0;
  }
  else
  {
    -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        isKindOfClass = 1;
      }
      else
      {
        -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          isKindOfClass = 1;
        }
        else
        {
          -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            isKindOfClass = 1;
          }
          else
          {
            -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              isKindOfClass = 1;
            }
            else
            {
              -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                isKindOfClass = 1;
              }
              else
              {
                -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

              }
            }

          }
        }

      }
    }

  }
  return isKindOfClass & 1;
}

- (BOOL)sourceItemIsSingleServiceAccessory
{
  void *v2;
  char v3;

  -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isSingleServiceAccessory");

  return v3;
}

- (BOOL)sourceItemIsService
{
  void *v2;
  char isKindOfClass;

  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)sourceItemIsHomePod
{
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_opt_class();
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    if ((objc_msgSend(v5, "isHomePod") & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v5, "isHomePodMediaSystem");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)sourceItemIsHomePodConfiguredForMultiUser
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  HUServiceDetailsItemManager *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6
    && ((objc_msgSend(v6, "isHomePod") & 1) != 0 || objc_msgSend(v6, "isHomePodMediaSystem"))
    && objc_msgSend(v6, "supportsMultiUser"))
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsItemManager supportedVoiceRecognitionLanguages](self, "supportedVoiceRecognitionLanguages");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsItemManager supportedVoiceRecognitionLanguages](self, "supportedVoiceRecognitionLanguages");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138413058;
      v19 = self;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      v24 = 2048;
      v25 = objc_msgSend(v17, "count");
      _os_log_debug_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEBUG, "%@:%@ supported voice recognition languages %@ (%lu)", (uint8_t *)&v18, 0x2Au);

    }
    v8 = (void *)MEMORY[0x1E0D31530];
    objc_msgSend(v6, "mediaProfileContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "siriLanguageOptionFor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "recognitionLanguage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsItemManager supportedVoiceRecognitionLanguages](self, "supportedVoiceRecognitionLanguages");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v11);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setShowRoomsList:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  if (self->_showRoomsList != a3)
  {
    self->_showRoomsList = a3;
    -[HUServiceDetailsItemManager staticItemProvider](self, "staticItemProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    -[HUServiceDetailsItemManager existingRoomItemProvider](self, "existingRoomItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    -[HUServiceDetailsItemManager suggestedRoomItemProvider](self, "suggestedRoomItemProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    -[HUServiceDetailsItemManager selectedRoomItemProvider](self, "selectedRoomItemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v9, a2);
  }
}

- (NSArray)orderedRoomSectionItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  -[HUServiceDetailsItemManager existingRoomItemProvider](self, "existingRoomItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_dashboardSectionReorderableItemComparator");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = &__block_literal_global_256;
  objc_msgSend(v6, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObjectsFromArray:", v11);
  -[HUServiceDetailsItemManager suggestedRoomItemProvider](self, "suggestedRoomItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_256);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObjectsFromArray:", v15);
  return (NSArray *)v3;
}

uint64_t __54__HUServiceDetailsItemManager_orderedRoomSectionItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D30D98];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D98]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v5, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "BOOLValue");

  if (v9 == (_DWORD)v8)
  {
    objc_msgSend(v4, "latestResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D30D18];
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "latestResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v15, "compare:", v17);
  }
  else if (v9)
  {
    v12 = -1;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)setShowAssociatedServiceTypeList:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  if (self->_showAssociatedServiceTypeList != a3)
  {
    self->_showAssociatedServiceTypeList = a3;
    -[HUServiceDetailsItemManager staticItemProvider](self, "staticItemProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    -[HUServiceDetailsItemManager existingRoomItemProvider](self, "existingRoomItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    -[HUServiceDetailsItemManager suggestedRoomItemProvider](self, "suggestedRoomItemProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    -[HUServiceDetailsItemManager associatedServiceTypeOptionItemProvider](self, "associatedServiceTypeOptionItemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v9, a2);

  }
}

- (HFItem)selectedAssociatedServiceTypeItem
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsItemManager.m"), 425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.sourceServiceItem isKindOfClass:[HFServiceItem class]]"));

  }
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "associatedServiceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager associatedServiceTypeOptionItemProvider](self, "associatedServiceTypeOptionItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__HUServiceDetailsItemManager_selectedAssociatedServiceTypeItem__block_invoke;
  v17[3] = &unk_1E6F4EEA8;
  v18 = v8;
  v19 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "na_firstObjectPassingTest:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFItem *)v14;
}

BOOL __64__HUServiceDetailsItemManager_selectedAssociatedServiceTypeItem__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30488]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || !*(_QWORD *)(a1 + 32) && (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) != 0;

  return v5;
}

- (void)setShouldHideAccessoryItem:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  self->_shouldHideAccessoryItem = a3;
  -[HUServiceDetailsItemManager staticItemProvider](self, "staticItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUServiceDetailsItemManager staticItemProvider](self, "staticItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v7, a2);

  }
}

- (HMAccessory)sourceItemAccessory
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  char v24;

  -[HFItemManager sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[HFItemManager sourceItem](self, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
    goto LABEL_18;
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();

  -[HFItemManager sourceItem](self, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) != 0)
    goto LABEL_18;
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) != 0)
  {
    objc_opt_class();
    -[HFItemManager sourceItem](self, "sourceItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeKitObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v5;
    else
      v9 = 0;
    v10 = v9;

    if (!v10)
    {
      objc_opt_class();
      -[HFItemManager sourceItem](self, "sourceItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "homeKitObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
      v18 = v21;

      v5 = 0;
      goto LABEL_20;
    }
    v11 = v10;
    goto LABEL_19;
  }
  -[HFItemManager sourceItem](self, "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = objc_opt_isKindOfClass();

  -[HFItemManager sourceItem](self, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 & 1) != 0)
    goto LABEL_18;
  objc_opt_class();
  v14 = objc_opt_isKindOfClass();

  -[HFItemManager sourceItem](self, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 & 1) != 0)
    goto LABEL_18;
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  -[HFItemManager sourceItem](self, "sourceItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  if ((v15 & 1) == 0)
  {
    objc_opt_class();
    v22 = objc_opt_isKindOfClass();

    -[HFItemManager sourceItem](self, "sourceItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v22 & 1) == 0)
    {
      objc_opt_class();
      v24 = objc_opt_isKindOfClass();

      if ((v24 & 1) == 0)
      {
        v18 = 0;
        return (HMAccessory *)v18;
      }
      -[HFItemManager sourceItem](self, "sourceItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v11;
      goto LABEL_19;
    }
LABEL_18:
    v11 = v5;
LABEL_19:
    objc_msgSend(v11, "accessory");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  objc_msgSend(v16, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accessory");
  v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return (HMAccessory *)v18;
}

- (HFHomeKitObject)sourceItemHomeKitObject
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;

  -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[HFItemManager sourceItem](self, "sourceItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      v9 = objc_opt_isKindOfClass();

      if ((v9 & 1) == 0)
      {
        v4 = 0;
        return (HFHomeKitObject *)v4;
      }
      -[HFItemManager sourceItem](self, "sourceItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
    }
    objc_msgSend(v7, "homeKitObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (HFHomeKitObject *)v4;
}

- (id)selectRoom:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  -[HUServiceDetailsItemManager serviceLikeBuilder](self, "serviceLikeBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRoom:", v5);

  v7 = (void *)MEMORY[0x1E0C99E60];
  -[HUServiceDetailsItemManager roomItem](self, "roomItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v9, a2);

  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)selectAssociatedServiceType:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_opt_class();
  -[HUServiceDetailsItemManager serviceLikeBuilder](self, "serviceLikeBuilder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

LABEL_7:
    v8 = 0;
  }

  objc_msgSend(v8, "setAssociatedServiceType:", v4);
  objc_msgSend(v8, "commitItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isRoomItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager existingRoomItemProvider](self, "existingRoomItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v8);

  -[HUServiceDetailsItemManager suggestedRoomItemProvider](self, "suggestedRoomItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v10);

  LOBYTE(v9) = objc_msgSend(v6, "containsObject:", v5);
  return (char)v9;
}

- (BOOL)isCharacteristicStateItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[HUServiceDetailsItemManager serviceDetailsControlStateAndCharacteristicItemModule](self, "serviceDetailsControlStateAndCharacteristicItemModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characteristicStateItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  return v8;
}

- (BOOL)isAccessoryInfoItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUServiceDetailsItemManager accessoryInfoItemProvider](self, "accessoryInfoItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (BOOL)supportsWiFiStrengthDisplay:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HUServiceDetailsItemManager accessoryInfoItemProvider](self, "accessoryInfoItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsWiFiStrengthDisplay:", v4);

  return v6;
}

- (BOOL)canToggleAccessoryInfoItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HUServiceDetailsItemManager accessoryInfoItemProvider](self, "accessoryInfoItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canToggleAccessoryInfoItem:", v4);

  return v6;
}

- (void)toggleAccessoryInfoItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v5 = a3;
  -[HUServiceDetailsItemManager accessoryInfoItemProvider](self, "accessoryInfoItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toggleAccessoryInfoItem:", v5);

  v7 = (void *)MEMORY[0x1E0D314C0];
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HUServiceDetailsItemManager accessoryInfoItemProvider](self, "accessoryInfoItemProvider");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestToReloadItemProviders:senderSelector:", v9, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HFItemManager performItemUpdateRequest:](self, "performItemUpdateRequest:", v10);

}

- (void)updateCameraStatusLight:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  HUServiceDetailsItemManager *v14;
  SEL v15;

  v3 = a3;
  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HUServiceDetailsItemManager cameraStatusLightItem](self, "cameraStatusLightItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateUserSettingsWithValue:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__HUServiceDetailsItemManager_updateCameraStatusLight___block_invoke;
    v12[3] = &unk_1E6F5DF90;
    v13 = v8;
    v14 = self;
    v15 = a2;
    v11 = (id)objc_msgSend(v10, "addCompletionBlock:", v12);

  }
}

void __55__HUServiceDetailsItemManager_updateCameraStatusLight___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v14 = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Failed to update camera status light for camera: '%@' error:%@", (uint8_t *)&v14, 0x16u);
    }

  }
  v7 = (void *)a1[5];
  v8 = (void *)MEMORY[0x1E0D314C0];
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "staticItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestToReloadItemProviders:senderSelector:", v11, a1[6]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v7, "performItemUpdateRequest:", v12);

}

- (void)updateCameraNightMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  HUServiceDetailsItemManager *v14;
  SEL v15;

  v3 = a3;
  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HUServiceDetailsItemManager cameraNightModeItem](self, "cameraNightModeItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateUserSettingsWithValue:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__HUServiceDetailsItemManager_updateCameraNightMode___block_invoke;
    v12[3] = &unk_1E6F5DF90;
    v13 = v8;
    v14 = self;
    v15 = a2;
    v11 = (id)objc_msgSend(v10, "addCompletionBlock:", v12);

  }
}

void __53__HUServiceDetailsItemManager_updateCameraNightMode___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v14 = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Failed to update night mode for camera: '%@' error:%@", (uint8_t *)&v14, 0x16u);
    }

  }
  v7 = (void *)a1[5];
  v8 = (void *)MEMORY[0x1E0D314C0];
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "staticItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestToReloadItemProviders:senderSelector:", v11, a1[6]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v7, "performItemUpdateRequest:", v12);

}

- (void)updateDoorbellChimeMuteMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  objc_opt_class();
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "profile");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hf_updateDoorbellChime:", v3);
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HUNameItemModule *v10;
  void *v11;
  void *v12;
  HUNameItemModule *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  HUAccessoryRepresentableItemModuleContext *v19;
  id v20;
  HUAccessoryRepresentableItemModule *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  HUAssociatedSceneAndTriggerModule *v29;
  void *v30;
  HUAssociatedSceneAndTriggerModule *v31;
  HUAssociatedSceneAndTriggerModule *sceneAndTriggerModule;
  void *v33;
  void *v34;
  int v35;
  HUMatterConnectedServicesItemModule *v36;
  void *v37;
  HUMatterConnectedServicesItemModule *v38;
  HUMatterConnectedServicesItemModule *connectedServicesItemModule;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HUAvailableRelatedTriggerItemModule *v45;
  HUAvailableRelatedTriggerItemModule *relatedTriggerItemModule;
  void *v47;
  NSObject *v48;
  char *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  NSObject *v71;
  id v72;
  void *v73;
  void *v75;
  char *v76;
  void *v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  id v82;
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  _BYTE v86[10];
  void *v87;
  _QWORD v88[2];

  v88[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HFItemManager sourceItem](self, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2AC4F0) & 1) != 0)
  {
    -[HUServiceDetailsItemManager sourceItemHomeKitObject](self, "sourceItemHomeKitObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HFItemManager sourceItem](self, "sourceItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serviceLikeBuilderInHome:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsItemManager setServiceLikeBuilder:](self, "setServiceLikeBuilder:", v9);

      v10 = [HUNameItemModule alloc];
      -[HFItemManager sourceItem](self, "sourceItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsItemManager serviceLikeBuilder](self, "serviceLikeBuilder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HUNameItemModule initWithItemUpdater:sourceServiceLikeItem:itemBuilder:](v10, "initWithItemUpdater:sourceServiceLikeItem:itemBuilder:", self, v11, v12);
      -[HUServiceDetailsItemManager setNameModule:](self, "setNameModule:", v13);

      -[HUServiceDetailsItemManager nameModule](self, "nameModule");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v14);

      if (-[HUServiceDetailsItemManager _shouldShowContainedAccessoriesList](self, "_shouldShowContainedAccessoriesList"))
      {
        -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = &unk_1EF2AC2D0;
        if (objc_msgSend(v15, "conformsToProtocol:", v16))
          v17 = v15;
        else
          v17 = 0;
        v18 = v17;

        v19 = objc_alloc_init(HUAccessoryRepresentableItemModuleContext);
        -[HUAccessoryRepresentableItemModuleContext setObjectLevel:](v19, "setObjectLevel:", 4);
        -[HUAccessoryRepresentableItemModuleContext setSectionGroupingType:](v19, "setSectionGroupingType:", 0);
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __56__HUServiceDetailsItemManager__buildItemModulesForHome___block_invoke;
        v81[3] = &unk_1E6F4F000;
        v82 = v18;
        v20 = v18;
        -[HUAccessoryRepresentableItemModuleContext setFilter:](v19, "setFilter:", v81);
        v21 = -[HUAccessoryRepresentableItemModule initWithContext:in:itemUpdater:]([HUAccessoryRepresentableItemModule alloc], "initWithContext:in:itemUpdater:", v19, v4, self);
        -[HUServiceDetailsItemManager setAccessoryRepresentableItemModule:](self, "setAccessoryRepresentableItemModule:", v21);

        -[HUServiceDetailsItemManager accessoryRepresentableItemModule](self, "accessoryRepresentableItemModule");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v22);

      }
      objc_opt_class();
      -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
      v25 = v24;

      if (!-[HUServiceDetailsItemManager sourceItemIsService](self, "sourceItemIsService")
        || (-[NSObject service](v25, "service"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v26, "accessory"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v27, "hf_isSingleServiceAccessory"),
            v27,
            v26,
            v28))
      {
        v29 = [HUAssociatedSceneAndTriggerModule alloc];
        -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[HUAssociatedSceneAndTriggerModule initWithItemUpdater:home:serviceLikeItem:context:](v29, "initWithItemUpdater:home:serviceLikeItem:context:", self, v4, v30, 1);
        sceneAndTriggerModule = self->_sceneAndTriggerModule;
        self->_sceneAndTriggerModule = v31;

        -[HUServiceDetailsItemManager sceneAndTriggerModule](self, "sceneAndTriggerModule");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v33);

      }
      -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "supportsCHIP");

      if (v35)
      {
        v36 = [HUMatterConnectedServicesItemModule alloc];
        -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[HUMatterConnectedServicesItemModule initWithItemUpdater:accessory:](v36, "initWithItemUpdater:accessory:", self, v37);
        connectedServicesItemModule = self->_connectedServicesItemModule;
        self->_connectedServicesItemModule = v38;

        -[HUServiceDetailsItemManager connectedServicesItemModule](self, "connectedServicesItemModule");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v40);

      }
      -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = v42;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        +[HUAvailableRelatedTriggerItemModule defaultContext](HUAvailableRelatedTriggerItemModule, "defaultContext");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setAnalyticsPresentationContext:", CFSTR("serviceDetails"));
        v45 = -[HUAvailableRelatedTriggerItemModule initWithItems:itemUpdater:home:context:]([HUAvailableRelatedTriggerItemModule alloc], "initWithItems:itemUpdater:home:context:", v43, self, v4, v44);
        relatedTriggerItemModule = self->_relatedTriggerItemModule;
        self->_relatedTriggerItemModule = v45;

        -[HUServiceDetailsItemManager relatedTriggerItemModule](self, "relatedTriggerItemModule");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v47);

      }
      HFLogForCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "hf_siriEndpointProfile");
        v49 = (char *)objc_claimAutoreleasedReturnValue();
        -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v25;
        v52 = v5;
        v53 = v4;
        v54 = objc_msgSend(v50, "hf_needsOnboarding");
        -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "hf_siriEndpointProfile");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "supportsOnboarding");
        *(_DWORD *)buf = 138412802;
        v84 = v49;
        v85 = 1024;
        *(_DWORD *)v86 = v54;
        v4 = v53;
        v5 = v52;
        v25 = v51;
        *(_WORD *)&v86[4] = 1024;
        *(_DWORD *)&v86[6] = v57;
        _os_log_impl(&dword_1B8E1E000, v48, OS_LOG_TYPE_DEFAULT, "SiriEndPoint Profile:[%@] needsOnboarding:[%{BOOL}d] supportsOnboarding:[%{BOOL}d]", buf, 0x18u);

      }
      -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "hf_siriEndpointProfile");
      v59 = objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        v60 = (void *)v59;
        -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "hf_siriEndpointProfile");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "supportsOnboarding");

        if (!v63)
        {
LABEL_26:
          v72 = v5;
          goto LABEL_31;
        }
        objc_msgSend(MEMORY[0x1E0D31120], "hf_accessorySettingsDictionary");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D31120], "hf_groupKeyPaths");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFItemManager sourceItem](self, "sourceItem");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUServiceDetailsItemManager settingsController](self, "settingsController");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        +[HUAccessorySettingsUtilities generateModulesFromSettingsDictionary:itemUpdater:home:sourceItem:usageOptions:settingsController:](HUAccessorySettingsUtilities, "generateModulesFromSettingsDictionary:itemUpdater:home:sourceItem:usageOptions:settingsController:", v58, self, v4, v65, 0, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUServiceDetailsItemManager setHomeKitAccessorySettingsModules:](self, "setHomeKitAccessorySettingsModules:", v67);

        -[HUServiceDetailsItemManager homeKitAccessorySettingsModules](self, "homeKitAccessorySettingsModules");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __56__HUServiceDetailsItemManager__buildItemModulesForHome___block_invoke_173;
        v79[3] = &unk_1E6F59F78;
        v80 = v64;
        v69 = v64;
        objc_msgSend(v68, "sortedArrayUsingComparator:", v79);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUServiceDetailsItemManager setHomeKitAccessorySettingsModules:](self, "setHomeKitAccessorySettingsModules:", v70);

        HFLogForCategory();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "hf_siriEndpointProfile");
          v76 = (char *)objc_claimAutoreleasedReturnValue();
          -[HUServiceDetailsItemManager homeKitAccessorySettingsModules](self, "homeKitAccessorySettingsModules");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v84 = v76;
          v85 = 2112;
          *(_QWORD *)v86 = v58;
          *(_WORD *)&v86[8] = 2112;
          v87 = v77;
          _os_log_debug_impl(&dword_1B8E1E000, v71, OS_LOG_TYPE_DEBUG, "Found Siri EndPoint Profile [%@]. settingsDict = [%@] Generated homeKitAccessorySettingsModules = [%@]", buf, 0x20u);

        }
      }

      goto LABEL_26;
    }
  }
  else
  {

  }
  HFLogForCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v84 = "-[HUServiceDetailsItemManager _buildItemModulesForHome:]";
    v85 = 2112;
    *(_QWORD *)v86 = v73;
    _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%s: Unexpected sourceItem: %@", buf, 0x16u);

  }
  v72 = (id)MEMORY[0x1E0C9AA60];
LABEL_31:

  return v72;
}

uint64_t __56__HUServiceDetailsItemManager__buildItemModulesForHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "hf_containedProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_165);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "intersectsSet:", v5);

  return v6;
}

uint64_t __56__HUServiceDetailsItemManager__buildItemModulesForHome___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

uint64_t __56__HUServiceDetailsItemManager__buildItemModulesForHome___block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "settingGroupKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "settingGroupKeyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  if (v8 > v11)
    return 1;
  else
    return -1;
}

- (void)resetServiceLikeItemBuilder
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HFItemManager sourceItem](self, "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EF2AC4F0);

  if (v5)
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceLikeBuilderInHome:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsItemManager setServiceLikeBuilder:](self, "setServiceLikeBuilder:", v8);

    -[HFItemManager resetItemProvidersAndModules](self, "resetItemProvidersAndModules");
    v9 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
  }
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  HUServiceDetailsProgrammableSwitchItemModule *v7;
  void *v8;
  HUServiceDetailsProgrammableSwitchItemModule *v9;
  void *v10;
  void *v11;
  char v12;
  HUValveItemModule *v13;
  void *v14;
  HUValveItemModule *v15;
  void *v16;
  char v17;
  HUInputSourceItemModule *v18;
  void *v19;
  HUInputSourceItemModule *v20;
  HUTelevisionSettingsItemModule *v21;
  void *v22;
  HUTelevisionSettingsItemModule *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t *v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  HUServiceDetailsShowContainedItemsInGroupItem *v70;
  void *v71;
  HUServiceDetailsShowContainedItemsInGroupItem *v72;
  HUServiceDetailsAddGroupItem *v73;
  void *v74;
  HUServiceDetailsAddGroupItem *v75;
  HUServiceDetailsIdentifyHomePodItem *v76;
  void *v77;
  HUServiceDetailsIdentifyHomePodItem *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  HUServiceDetailsSeparateTileItem *v87;
  void *v88;
  HUServiceDetailsSeparateTileItem *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  HUServiceDetailsRoomItem *v102;
  void *v103;
  void *v104;
  HUServiceDetailsRoomItem *v105;
  HUServiceDetailsAssociatedServiceTypeItem *v106;
  void *v107;
  HUServiceDetailsAssociatedServiceTypeItem *v108;
  HUIncludedContextItem *v109;
  void *v110;
  void *v111;
  HUIncludedContextItem *v112;
  HUIncludedContextItem *v113;
  void *v114;
  void *v115;
  HUIncludedContextItem *v116;
  HUServiceDetailsPairingModeItem *v117;
  void *v118;
  HUServiceDetailsPairingModeItem *v119;
  HUServiceDetailsExportDiagnosticsItem *v120;
  void *v121;
  HUServiceDetailsExportDiagnosticsItem *v122;
  HUServiceDetailsRemoveItem *v123;
  void *v124;
  HUServiceDetailsRemoveItem *v125;
  HUServiceDetailsRemoveFromGroupItem *v126;
  void *v127;
  HUServiceDetailsRemoveFromGroupItem *v128;
  HUServiceDetailsResetAccessoryItem *v129;
  void *v130;
  HUServiceDetailsResetAccessoryItem *v131;
  HUServiceDetailsRestartAccessoriesItem *v132;
  void *v133;
  HUServiceDetailsRestartAccessoriesItem *v134;
  HUServiceDetailsAudioSettingsItem *v135;
  void *v136;
  HUServiceDetailsAudioSettingsItem *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  char v145;
  HUServiceDetailsLockPinCodesItem *v146;
  void *v147;
  HUServiceDetailsLockPinCodesItem *v148;
  HUServiceDetailsLockAddHomeKeyToWalletItem *v149;
  void *v150;
  HUServiceDetailsLockAddHomeKeyToWalletItem *v151;
  HUServiceDetailsStatusAndNotificationItem *v152;
  void *v153;
  HUServiceDetailsStatusAndNotificationItem *v154;
  HUServiceDetailsCameraActivityZonesItem *v155;
  void *v156;
  HUServiceDetailsCameraActivityZonesItem *v157;
  HUServiceDetailsCameraStatusLightItem *v158;
  void *v159;
  HUServiceDetailsCameraStatusLightItem *v160;
  HUServiceDetailsCameraNightModeItem *v161;
  void *v162;
  HUServiceDetailsCameraNightModeItem *v163;
  HUServiceDetailsCameraDoorbellChimeMuteItem *v164;
  void *v165;
  HUServiceDetailsCameraDoorbellChimeMuteItem *v166;
  id v167;
  void *v168;
  void *v169;
  int v170;
  int v171;
  int v172;
  id v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  uint64_t v182;
  int v183;
  void *v184;
  int v185;
  uint64_t v186;
  id v187;
  void *v188;
  uint64_t v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  HUServiceDetailsCollectDiagnosticsItem *v195;
  void *v196;
  HUServiceDetailsCollectDiagnosticsItem *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  id v222;
  void *v223;
  void *v224;
  id v225;
  void *v226;
  void *v227;
  id v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  HUServiceDetailsControlAndCharacteristicStateItemModule *v233;
  void *v234;
  HUServiceDetailsControlAndCharacteristicStateItemModule *v235;
  void *v236;
  HUSoftwareUpdateItemModule *v237;
  void *v238;
  HUSoftwareUpdateItemModule *v239;
  HULinkedApplicationItemProvider *v240;
  void *v241;
  HUFirmwareUpdateItemProvider *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t i;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  id v280;
  id v281;
  id v282;
  id v283;
  void *v284;
  id v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  id v300;
  id v301;
  void *v302;
  void *v303;
  void *v304;
  id v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  _QWORD v310[4];
  id v311;
  _QWORD v312[4];
  id v313;
  _QWORD v314[4];
  id v315;
  _QWORD v316[4];
  id v317;
  id v318;
  id v319;
  _QWORD v320[4];
  id v321;
  _QWORD v322[4];
  id v323;
  _QWORD aBlock[4];
  id v325;
  id location;
  _BYTE v327[128];
  _QWORD v328[4];
  _QWORD v329[20];
  _QWORD v330[4];
  _QWORD v331[4];
  _QWORD v332[4];
  _QWORD v333[4];
  uint64_t v334;
  void *v335;
  uint64_t v336;
  void *v337;
  uint64_t v338;
  void *v339;
  uint64_t v340;
  void *v341;
  _QWORD v342[2];
  _QWORD v343[2];
  uint64_t v344;
  _QWORD v345[3];

  v345[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[HFItemManager sourceItem](self, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = [HUServiceDetailsProgrammableSwitchItemModule alloc];
    -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HUServiceDetailsItemModule initWithItemUpdater:home:sourceItem:](v7, "initWithItemUpdater:home:sourceItem:", self, v4, v8);
    -[HUServiceDetailsItemManager setProgrammableSwitchItemModule:](self, "setProgrammableSwitchItemModule:", v9);

  }
  -[HFItemManager sourceItem](self, "sourceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) == 0)
      goto LABEL_7;
  }
  v13 = [HUValveItemModule alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HUChildServiceEditorItemModule initWithItemUpdater:home:sourceItem:mode:](v13, "initWithItemUpdater:home:sourceItem:mode:", self, v4, v14, 1);
  -[HUServiceDetailsItemManager setValveEditorItemModule:](self, "setValveEditorItemModule:", v15);

LABEL_7:
  -[HFItemManager sourceItem](self, "sourceItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v17 = objc_opt_isKindOfClass();

  if ((v17 & 1) != 0)
  {
    v18 = [HUInputSourceItemModule alloc];
    -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HUChildServiceEditorItemModule initWithItemUpdater:home:sourceItem:mode:](v18, "initWithItemUpdater:home:sourceItem:mode:", self, v4, v19, 0);
    -[HUServiceDetailsItemManager setInputSourceItemModule:](self, "setInputSourceItemModule:", v20);

    v21 = [HUTelevisionSettingsItemModule alloc];
    -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HUTelevisionSettingsItemModule initWithItemUpdater:home:accessory:](v21, "initWithItemUpdater:home:accessory:", self, v4, v22);
    -[HUServiceDetailsItemManager setTelevisionSettingsItemModule:](self, "setTelevisionSettingsItemModule:", v23);

  }
  if (-[HUServiceDetailsItemManager _shouldShowAccessoryInfoItems](self, "_shouldShowAccessoryInfoItems"))
  {
    v24 = objc_alloc(MEMORY[0x1E0D31090]);
    -[HFItemManager home](self, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v24, "initWithHome:accessory:", v25, v26);
    -[HUServiceDetailsItemManager setAccessoryInfoItemProvider:](self, "setAccessoryInfoItemProvider:", v27);

  }
  -[HUServiceDetailsItemManager sourceItemHomeKitObject](self, "sourceItemHomeKitObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (uint64_t *)MEMORY[0x1E0D30D18];
  if (v28)
  {
    v30 = HFPreferencesInternalDebuggingEnabled();

    if (v30)
    {
      v31 = objc_alloc(MEMORY[0x1E0D31840]);
      v344 = *v29;
      v345[0] = CFSTR("Internal Debugging");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v345, &v344, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v31, "initWithResults:", v32);
      -[HUServiceDetailsItemManager setInternalDebuggingItem:](self, "setInternalDebuggingItem:", v33);

    }
  }
  -[HUServiceDetailsItemManager _setUpHomeTheaterItem](self, "_setUpHomeTheaterItem");
  -[HUServiceDetailsItemManager _setUpManagedConfigurationProfilesItem](self, "_setUpManagedConfigurationProfilesItem");
  objc_opt_class();
  -[HUServiceDetailsItemManager serviceLikeBuilder](self, "serviceLikeBuilder");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v35 = v34;
  else
    v35 = 0;
  v301 = v35;

  objc_opt_class();
  -[HUServiceDetailsItemManager serviceLikeBuilder](self, "serviceLikeBuilder");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v37 = v36;
  else
    v37 = 0;
  v283 = v37;

  if (!v301)
  {
    if (v283)
    {
      objc_msgSend(v283, "accessory");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "hf_categoryOrPrimaryServiceType");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0CB7A58]))
      {

      }
      else
      {
        objc_msgSend(v283, "accessory");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "hf_isSiriEndpoint");

        if ((v41 & 1) == 0)
        {
          v280 = objc_alloc(MEMORY[0x1E0D31040]);
          objc_msgSend(v4, "hf_characteristicValueManager");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v287 = (void *)objc_msgSend(v280, "initWithAccessoryBuilder:valueSource:", v283, v42);
          goto LABEL_27;
        }
      }
    }
    -[HFItemManager sourceItem](self, "sourceItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v287 = (void *)objc_msgSend(v42, "copy");
LABEL_27:

    goto LABEL_28;
  }
  v287 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D317A8]), "initWithServiceBuilder:", v301);
LABEL_28:
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31920]), "initWithSourceItem:transformationBlock:", v287, &__block_literal_global_192);
  -[HUServiceDetailsItemManager setHeaderItem:](self, "setHeaderItem:", v43);

  -[HUServiceDetailsItemManager loggedInMediaAccountOnHomePod](self, "loggedInMediaAccountOnHomePod");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "username");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUServiceDetailsSplitAccountDescription"), CFSTR("%@"), v46, v47, v48, v49, v50, v51, (uint64_t)v45);
  v286 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = objc_alloc(MEMORY[0x1E0D31840]);
  v53 = *v29;
  v342[0] = v53;
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsSplitAccountTitle"), CFSTR("HUServiceDetailsSplitAccountTitle"), 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v342[1] = *MEMORY[0x1E0D30BF8];
  v343[0] = v54;
  v343[1] = v286;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v343, v342, 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v52, "initWithResults:", v55);
  -[HUServiceDetailsItemManager setSplitMediaAccountTitleItem:](self, "setSplitMediaAccountTitleItem:", v56);

  v57 = objc_alloc(MEMORY[0x1E0D31840]);
  v340 = v53;
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsSplitAccountUseAsDefaultAccount_Button_Title"), CFSTR("HUServiceDetailsSplitAccountUseAsDefaultAccount_Button_Title"), 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v341 = v58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v341, &v340, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v57, "initWithResults:", v59);
  -[HUServiceDetailsItemManager setSplitMediaAccountUseDefaultAccountItem:](self, "setSplitMediaAccountUseDefaultAccountItem:", v60);

  v61 = objc_alloc(MEMORY[0x1E0D31840]);
  v338 = v53;
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsSplitAccountSignOut_Button_Title"), CFSTR("HUServiceDetailsSplitAccountSignOut_Button_Title"), 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v339 = v62;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v339, &v338, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v61, "initWithResults:", v63);
  -[HUServiceDetailsItemManager setSplitMediaAccountSignoutAccountItem:](self, "setSplitMediaAccountSignoutAccountItem:", v64);

  v65 = objc_alloc(MEMORY[0x1E0D31840]);
  v336 = v53;
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsCreateNewRoomTitle"), CFSTR("HUServiceDetailsCreateNewRoomTitle"), 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v337 = v66;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v337, &v336, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v65, "initWithResults:", v67);
  -[HUServiceDetailsItemManager setCreateNewRoomItem:](self, "setCreateNewRoomItem:", v68);

  v69 = objc_alloc_init(MEMORY[0x1E0D31840]);
  -[HUServiceDetailsItemManager setRoomListItem:](self, "setRoomListItem:", v69);

  v70 = [HUServiceDetailsShowContainedItemsInGroupItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v70, "initWithSourceServiceItem:home:", v71, v4);
  -[HUServiceDetailsItemManager setShowContainedItems:](self, "setShowContainedItems:", v72);

  v73 = [HUServiceDetailsAddGroupItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v73, "initWithSourceServiceItem:home:", v74, v4);
  -[HUServiceDetailsItemManager setAddGroupItem:](self, "setAddGroupItem:", v75);

  v76 = [HUServiceDetailsIdentifyHomePodItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v76, "initWithSourceServiceItem:home:", v77, v4);
  -[HUServiceDetailsItemManager setIdentifyHomePodItem:](self, "setIdentifyHomePodItem:", v78);

  if (!-[HUServiceDetailsItemManager isItemGroup](self, "isItemGroup")
    && !-[HUServiceDetailsItemManager isAccessory](self, "isAccessory"))
  {
    objc_opt_class();
    -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "homeKitObject");
    v80 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v81 = v80;
    else
      v81 = 0;
    v82 = v81;

    v83 = objc_alloc(MEMORY[0x1E0D311A0]);
    objc_msgSend(v82, "serviceType");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager home](self, "home");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = (void *)objc_msgSend(v83, "initWithService:serviceType:home:", v82, v84, v85);
    -[HUServiceDetailsItemManager setAssociatedServiceTypeOptionItemProvider:](self, "setAssociatedServiceTypeOptionItemProvider:", v86);

  }
  v87 = [HUServiceDetailsSeparateTileItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v87, "initWithSourceServiceItem:home:", v88, v4);
  -[HUServiceDetailsItemManager setSeparateTileItem:](self, "setSeparateTileItem:", v89);

  -[HUServiceDetailsItemManager serviceLikeBuilder](self, "serviceLikeBuilder");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_2;
  aBlock[3] = &unk_1E6F5E018;
  v282 = v90;
  v325 = v282;
  v91 = _Block_copy(aBlock);
  v322[0] = MEMORY[0x1E0C809B0];
  v322[1] = 3221225472;
  v322[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_3;
  v322[3] = &unk_1E6F4D8E8;
  v92 = v4;
  v323 = v92;
  v93 = _Block_copy(v322);
  v94 = objc_alloc(MEMORY[0x1E0D31770]);
  -[HUServiceDetailsItemManager serviceLikeBuilder](self, "serviceLikeBuilder");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)objc_msgSend(v94, "initWithHome:serviceLikeBuilder:", v92, v95);
  -[HUServiceDetailsItemManager setSelectedRoomItemProvider:](self, "setSelectedRoomItemProvider:", v96);

  v320[0] = MEMORY[0x1E0C809B0];
  v320[1] = 3221225472;
  v320[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_4;
  v320[3] = &unk_1E6F5E040;
  v285 = v93;
  v321 = v285;
  -[HUServiceDetailsItemManager selectedRoomItemProvider](self, "selectedRoomItemProvider");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setFilter:", v320);

  v303 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31710]), "initWithHome:", v92);
  objc_msgSend(v303, "setFilter:", v285);
  v98 = objc_alloc(MEMORY[0x1E0D31928]);
  v316[0] = MEMORY[0x1E0C809B0];
  v316[1] = 3221225472;
  v316[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_5;
  v316[3] = &unk_1E6F5E090;
  objc_copyWeak(&v319, &location);
  v281 = v91;
  v318 = v281;
  v305 = v92;
  v317 = v305;
  v99 = (void *)objc_msgSend(v98, "initWithSourceProvider:transformationBlock:", v303, v316);
  -[HUServiceDetailsItemManager setExistingRoomItemProvider:](self, "setExistingRoomItemProvider:", v99);

  v284 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31720]), "initWithHome:", v305);
  v100 = objc_alloc(MEMORY[0x1E0D31928]);
  v314[0] = MEMORY[0x1E0C809B0];
  v314[1] = 3221225472;
  v314[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_7;
  v314[3] = &unk_1E6F5E0E0;
  objc_copyWeak(&v315, &location);
  v101 = (void *)objc_msgSend(v100, "initWithSourceProvider:transformationBlock:", v284, v314);
  -[HUServiceDetailsItemManager setSuggestedRoomItemProvider:](self, "setSuggestedRoomItemProvider:", v101);

  v102 = [HUServiceDetailsRoomItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager serviceLikeBuilder](self, "serviceLikeBuilder");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = -[HUServiceDetailsRoomItem initWithSourceServiceItem:home:serviceLikeBuilder:](v102, "initWithSourceServiceItem:home:serviceLikeBuilder:", v103, v305, v104);
  -[HUServiceDetailsItemManager setRoomItem:](self, "setRoomItem:", v105);

  v106 = [HUServiceDetailsAssociatedServiceTypeItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v106, "initWithSourceServiceItem:home:", v107, v305);
  -[HUServiceDetailsItemManager setAssociatedServiceTypeItem:](self, "setAssociatedServiceTypeItem:", v108);

  v109 = [HUIncludedContextItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "homeKitObject");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = -[HUIncludedContextItem initWithHomeKitObject:contextType:home:](v109, "initWithHomeKitObject:contextType:home:", v111, 3, v305);
  -[HUServiceDetailsItemManager setShowInHomeDashboardItem:](self, "setShowInHomeDashboardItem:", v112);

  v113 = [HUIncludedContextItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "homeKitObject");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = -[HUIncludedContextItem initWithHomeKitObject:contextType:home:](v113, "initWithHomeKitObject:contextType:home:", v115, 2, v305);
  -[HUServiceDetailsItemManager setFavoriteItem:](self, "setFavoriteItem:", v116);

  v117 = [HUServiceDetailsPairingModeItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v117, "initWithSourceServiceItem:home:", v118, v305);
  -[HUServiceDetailsItemManager setPairingModeItem:](self, "setPairingModeItem:", v119);

  v120 = [HUServiceDetailsExportDiagnosticsItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v120, "initWithSourceServiceItem:home:", v121, v305);
  -[HUServiceDetailsItemManager setExportDiagnosticsItem:](self, "setExportDiagnosticsItem:", v122);

  v123 = [HUServiceDetailsRemoveItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v123, "initWithSourceServiceItem:home:", v124, v305);
  -[HUServiceDetailsItemManager setRemoveItem:](self, "setRemoveItem:", v125);

  v126 = [HUServiceDetailsRemoveFromGroupItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v126, "initWithSourceServiceItem:home:", v127, v305);
  -[HUServiceDetailsItemManager setRemoveFromGroupItem:](self, "setRemoveFromGroupItem:", v128);

  v129 = [HUServiceDetailsResetAccessoryItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v129, "initWithSourceServiceItem:home:", v130, v305);
  -[HUServiceDetailsItemManager setResetItem:](self, "setResetItem:", v131);

  v132 = [HUServiceDetailsRestartAccessoriesItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v132, "initWithSourceServiceItem:home:", v133, v305);
  -[HUServiceDetailsItemManager setRestartItem:](self, "setRestartItem:", v134);

  v135 = [HUServiceDetailsAudioSettingsItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v135, "initWithSourceServiceItem:home:", v136, v305);
  -[HUServiceDetailsItemManager setAudioSettingsItem:](self, "setAudioSettingsItem:", v137);

  -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v138, "hf_isVisibleAsBridgedAccessory"))
  {

    goto LABEL_36;
  }
  -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v143, "hf_isVisibleAsBridge") & 1) == 0)
  {

    goto LABEL_41;
  }
  -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = objc_msgSend(v144, "hf_isPureBridge");

  if ((v145 & 1) == 0)
  {
LABEL_36:
    v139 = objc_alloc(MEMORY[0x1E0D31840]);
    v334 = v53;
    _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsBridgeTitle"), CFSTR("HUServiceDetailsBridgeTitle"), 1);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v335 = v140;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v335, &v334, 1);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = (void *)objc_msgSend(v139, "initWithResults:", v141);
    -[HUServiceDetailsItemManager setAccessoryItem:](self, "setAccessoryItem:", v142);

    -[HUServiceDetailsItemManager accessoryItem](self, "accessoryItem");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v304, "addObject:", v138);
LABEL_41:

  }
  v146 = [HUServiceDetailsLockPinCodesItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v146, "initWithSourceServiceItem:home:", v147, v305);
  -[HUServiceDetailsItemManager setLockPinCodesItem:](self, "setLockPinCodesItem:", v148);

  v149 = [HUServiceDetailsLockAddHomeKeyToWalletItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v149, "initWithSourceServiceItem:home:", v150, v305);
  -[HUServiceDetailsItemManager setLockAddHomeKeyToWalletItem:](self, "setLockAddHomeKeyToWalletItem:", v151);

  v152 = [HUServiceDetailsStatusAndNotificationItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v152, "initWithSourceServiceItem:home:", v153, v305);
  -[HUServiceDetailsItemManager setStatusAndNotificationItem:](self, "setStatusAndNotificationItem:", v154);

  v155 = [HUServiceDetailsCameraActivityZonesItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v155, "initWithSourceServiceItem:home:", v156, v305);
  -[HUServiceDetailsItemManager setCameraActivityZonesItem:](self, "setCameraActivityZonesItem:", v157);

  v158 = [HUServiceDetailsCameraStatusLightItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v158, "initWithSourceServiceItem:home:", v159, v305);
  -[HUServiceDetailsItemManager setCameraStatusLightItem:](self, "setCameraStatusLightItem:", v160);

  v161 = [HUServiceDetailsCameraNightModeItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v161, "initWithSourceServiceItem:home:", v162, v305);
  -[HUServiceDetailsItemManager setCameraNightModeItem:](self, "setCameraNightModeItem:", v163);

  v164 = [HUServiceDetailsCameraDoorbellChimeMuteItem alloc];
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v164, "initWithSourceServiceItem:home:", v165, v305);
  -[HUServiceDetailsItemManager setCameraDoorbellChimeMuteItem:](self, "setCameraDoorbellChimeMuteItem:", v166);

  objc_opt_class();
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v167 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v168 = v167;
  else
    v168 = 0;
  v300 = v168;

  objc_msgSend(v300, "profile");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = objc_msgSend(v169, "hf_supportsRecordingEvents");

  if (objc_msgSend(v305, "hf_currentUserIsAdministrator"))
    v171 = objc_msgSend(v305, "hf_currentUserIsOwner") ^ 1;
  else
    v171 = 0;
  v172 = objc_msgSend(v305, "hf_hasResidentDeviceCapableOfSupportingEnhancedDetectionModes");
  v173 = objc_alloc(MEMORY[0x1E0D31840]);
  v332[0] = v53;
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRecordingOptionsDisplayTitle"), CFSTR("HUServiceDetailsRecordingOptionsDisplayTitle"), 1);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v333[0] = v174;
  v175 = *MEMORY[0x1E0D30D70];
  v332[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v170 ^ 1u);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v333[1] = v176;
  v332[2] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v171 & (v172 ^ 1u));
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v332[3] = *MEMORY[0x1E0D30BA0];
  v333[2] = v177;
  v333[3] = CFSTR("AccessoryDetails.RecordingOptions");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v333, v332, 4);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = (void *)objc_msgSend(v173, "initWithResults:", v178);
  -[HUServiceDetailsItemManager setCameraRecordingOptionsItem:](self, "setCameraRecordingOptionsItem:", v179);

  objc_msgSend(v305, "currentUser");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v305, "homeAccessControlForUser:", v180);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = objc_msgSend(v181, "camerasAccessLevel");

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) != 0)
    v183 = 1;
  else
    v183 = objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode");
  if (objc_msgSend(v305, "hf_isFaceRecognitionAvailable"))
  {
    objc_msgSend(v300, "profile");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = objc_msgSend(v184, "hf_supportsRecordingEvents");

    v186 = ((v182 != 2) | ~v185) & (v183 ^ 1u);
  }
  else
  {
    v186 = v183 ^ 1u;
  }
  v187 = objc_alloc(MEMORY[0x1E0D31840]);
  v330[0] = v53;
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsCameraFaceRecognitionDisplayTitle"), CFSTR("HUServiceDetailsCameraFaceRecognitionDisplayTitle"), 1);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = *MEMORY[0x1E0D30D20];
  v331[0] = v188;
  v331[1] = CFSTR("HUServiceDetailsCameraFaceRecognitionDisplayTitle");
  v330[1] = v189;
  v330[2] = v175;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v186);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v331[2] = v190;
  v330[3] = *MEMORY[0x1E0D30CE8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v183 ^ 1u);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v331[3] = v191;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v331, v330, 4);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = (void *)objc_msgSend(v187, "initWithResults:", v192);
  -[HUServiceDetailsItemManager setCameraFaceRecognitionItem:](self, "setCameraFaceRecognitionItem:", v193);

  -[HFItemManager home](self, "home");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v191) = objc_msgSend(v194, "hf_currentUserIsAdministrator");

  if ((_DWORD)v191)
  {
    v195 = [HUServiceDetailsCollectDiagnosticsItem alloc];
    -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](v195, "initWithSourceServiceItem:home:", v196, v305);
    -[HUServiceDetailsItemManager setCollectDiagnosticsItem:](self, "setCollectDiagnosticsItem:", v197);

  }
  -[HUServiceDetailsItemManager headerItem](self, "headerItem");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  v329[0] = v299;
  -[HUServiceDetailsItemManager splitMediaAccountTitleItem](self, "splitMediaAccountTitleItem");
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v329[1] = v298;
  -[HUServiceDetailsItemManager splitMediaAccountUseDefaultAccountItem](self, "splitMediaAccountUseDefaultAccountItem");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v329[2] = v297;
  -[HUServiceDetailsItemManager splitMediaAccountSignoutAccountItem](self, "splitMediaAccountSignoutAccountItem");
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v329[3] = v296;
  -[HUServiceDetailsItemManager createNewRoomItem](self, "createNewRoomItem");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  v329[4] = v295;
  -[HUServiceDetailsItemManager showContainedItems](self, "showContainedItems");
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v329[5] = v294;
  -[HUServiceDetailsItemManager addGroupItem](self, "addGroupItem");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  v329[6] = v293;
  -[HUServiceDetailsItemManager identifyHomePodItem](self, "identifyHomePodItem");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v329[7] = v292;
  -[HUServiceDetailsItemManager separateTileItem](self, "separateTileItem");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v329[8] = v291;
  -[HUServiceDetailsItemManager roomItem](self, "roomItem");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  v329[9] = v290;
  -[HUServiceDetailsItemManager roomListItem](self, "roomListItem");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v329[10] = v289;
  -[HUServiceDetailsItemManager associatedServiceTypeItem](self, "associatedServiceTypeItem");
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v329[11] = v288;
  -[HUServiceDetailsItemManager statusAndNotificationItem](self, "statusAndNotificationItem");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v329[12] = v198;
  -[HUServiceDetailsItemManager audioSettingsItem](self, "audioSettingsItem");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v329[13] = v199;
  -[HUServiceDetailsItemManager cameraStatusLightItem](self, "cameraStatusLightItem");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v329[14] = v200;
  -[HUServiceDetailsItemManager cameraNightModeItem](self, "cameraNightModeItem");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v329[15] = v201;
  -[HUServiceDetailsItemManager cameraDoorbellChimeMuteItem](self, "cameraDoorbellChimeMuteItem");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v329[16] = v202;
  -[HUServiceDetailsItemManager cameraRecordingOptionsItem](self, "cameraRecordingOptionsItem");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v329[17] = v203;
  -[HUServiceDetailsItemManager cameraFaceRecognitionItem](self, "cameraFaceRecognitionItem");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v329[18] = v204;
  -[HUServiceDetailsItemManager cameraActivityZonesItem](self, "cameraActivityZonesItem");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v329[19] = v205;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v329, 20);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "addObjectsFromArray:", v206);

  -[HUServiceDetailsItemManager removeFromGroupItem](self, "removeFromGroupItem");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v328[0] = v207;
  -[HUServiceDetailsItemManager removeItem](self, "removeItem");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v328[1] = v208;
  -[HUServiceDetailsItemManager resetItem](self, "resetItem");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v328[2] = v209;
  -[HUServiceDetailsItemManager restartItem](self, "restartItem");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v328[3] = v210;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v328, 4);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v302, "addObjectsFromArray:", v211);

  -[HUServiceDetailsItemManager alarmItem](self, "alarmItem");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "na_safeAddObject:", v212);

  -[HUServiceDetailsItemManager homeTheaterAudioOutputItem](self, "homeTheaterAudioOutputItem");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "na_safeAddObject:", v213);

  -[HUServiceDetailsItemManager showInHomeDashboardItem](self, "showInHomeDashboardItem");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "na_safeAddObject:", v214);

  -[HUServiceDetailsItemManager favoriteItem](self, "favoriteItem");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "na_safeAddObject:", v215);

  -[HUServiceDetailsItemManager managedConfigurationProfilesItem](self, "managedConfigurationProfilesItem");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "na_safeAddObject:", v216);

  -[HUServiceDetailsItemManager lockPinCodesItem](self, "lockPinCodesItem");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "na_safeAddObject:", v217);

  -[HUServiceDetailsItemManager lockAddHomeKeyToWalletItem](self, "lockAddHomeKeyToWalletItem");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "na_safeAddObject:", v218);

  -[HUServiceDetailsItemManager pairingModeItem](self, "pairingModeItem");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "na_safeAddObject:", v219);

  -[HUServiceDetailsItemManager collectDiagnosticsItem](self, "collectDiagnosticsItem");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "na_safeAddObject:", v220);

  -[HUServiceDetailsItemManager internalDebuggingItem](self, "internalDebuggingItem");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "na_safeAddObject:", v221);

  v222 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v304);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v224 = (void *)objc_msgSend(v222, "initWithItems:", v223);
  -[HUServiceDetailsItemManager setStaticItemProvider:](self, "setStaticItemProvider:", v224);

  v225 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v302);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = (void *)objc_msgSend(v225, "initWithItems:", v226);
  -[HUServiceDetailsItemManager setAccessoryResetAndRemoveItemProvider:](self, "setAccessoryResetAndRemoveItemProvider:", v227);

  v228 = objc_alloc(MEMORY[0x1E0D31848]);
  v229 = (void *)MEMORY[0x1E0C99E60];
  -[HUServiceDetailsItemManager exportDiagnosticsItem](self, "exportDiagnosticsItem");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "setWithObject:", v230);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v232 = (void *)objc_msgSend(v228, "initWithItems:", v231);
  -[HUServiceDetailsItemManager setExportDiagnosticsItemProvider:](self, "setExportDiagnosticsItemProvider:", v232);

  v233 = [HUServiceDetailsControlAndCharacteristicStateItemModule alloc];
  -[HFItemManager sourceItem](self, "sourceItem");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v235 = -[HUServiceDetailsControlAndCharacteristicStateItemModule initWithItemUpdater:home:sourceItem:delegate:](v233, "initWithItemUpdater:home:sourceItem:delegate:", self, v305, v234, self);
  -[HUServiceDetailsItemManager setServiceDetailsControlStateAndCharacteristicItemModule:](self, "setServiceDetailsControlStateAndCharacteristicItemModule:", v235);

  -[HFItemManager sourceItem](self, "sourceItem");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v235) = objc_msgSend(v236, "conformsToProtocol:", &unk_1EF2AC2D0);

  if ((_DWORD)v235)
  {
    v237 = [HUSoftwareUpdateItemModule alloc];
    -[HFItemManager sourceItem](self, "sourceItem");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    v239 = -[HUSoftwareUpdateItemModule initWithItemUpdater:home:sourceItem:](v237, "initWithItemUpdater:home:sourceItem:", self, v305, v238);
    -[HUServiceDetailsItemManager setSoftwareUpdateItemModule:](self, "setSoftwareUpdateItemModule:", v239);

  }
  v240 = -[HULinkedApplicationItemProvider initWithHome:]([HULinkedApplicationItemProvider alloc], "initWithHome:", v305);
  -[HUServiceDetailsItemManager setLinkedApplicationItemProvider:](self, "setLinkedApplicationItemProvider:", v240);

  v312[0] = MEMORY[0x1E0C809B0];
  v312[1] = 3221225472;
  v312[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_9;
  v312[3] = &unk_1E6F5E108;
  objc_copyWeak(&v313, &location);
  -[HUServiceDetailsItemManager linkedApplicationItemProvider](self, "linkedApplicationItemProvider");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "setFilter:", v312);

  v242 = -[HUFirmwareUpdateItemProvider initWithHome:style:]([HUFirmwareUpdateItemProvider alloc], "initWithHome:style:", v305, 1);
  -[HUServiceDetailsItemManager setFirmwareUpdateItemProvider:](self, "setFirmwareUpdateItemProvider:", v242);

  v310[0] = MEMORY[0x1E0C809B0];
  v310[1] = 3221225472;
  v310[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_10;
  v310[3] = &unk_1E6F5E108;
  objc_copyWeak(&v311, &location);
  -[HUServiceDetailsItemManager firmwareUpdateItemProvider](self, "firmwareUpdateItemProvider");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "setFilter:", v310);

  v244 = (void *)MEMORY[0x1E0C99E20];
  -[HUServiceDetailsItemManager staticItemProvider](self, "staticItemProvider");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "setWithObject:", v245);
  v246 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUServiceDetailsItemManager exportDiagnosticsItemProvider](self, "exportDiagnosticsItemProvider");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "na_safeAddObject:", v247);

  -[HUServiceDetailsItemManager accessoryResetAndRemoveItemProvider](self, "accessoryResetAndRemoveItemProvider");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "na_safeAddObject:", v248);

  -[HUServiceDetailsItemManager accessoryInfoItemProvider](self, "accessoryInfoItemProvider");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "na_safeAddObject:", v249);

  -[HUServiceDetailsItemManager associatedServiceTypeOptionItemProvider](self, "associatedServiceTypeOptionItemProvider");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "na_safeAddObject:", v250);

  -[HUServiceDetailsItemManager existingRoomItemProvider](self, "existingRoomItemProvider");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "na_safeAddObject:", v251);

  -[HUServiceDetailsItemManager suggestedRoomItemProvider](self, "suggestedRoomItemProvider");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "na_safeAddObject:", v252);

  -[HUServiceDetailsItemManager linkedApplicationItemProvider](self, "linkedApplicationItemProvider");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "na_safeAddObject:", v253);

  -[HUServiceDetailsItemManager firmwareUpdateItemProvider](self, "firmwareUpdateItemProvider");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "na_safeAddObject:", v254);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager programmableSwitchItemModule](self, "programmableSwitchItemModule");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "itemProviders");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "unionSet:", v257);

  -[HUServiceDetailsItemManager serviceDetailsControlStateAndCharacteristicItemModule](self, "serviceDetailsControlStateAndCharacteristicItemModule");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v258, "itemProviders");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "unionSet:", v259);

  -[HUServiceDetailsItemManager accessorySettingsItemModule](self, "accessorySettingsItemModule");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v260, "itemProviders");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "unionSet:", v261);

  v308 = 0u;
  v309 = 0u;
  v306 = 0u;
  v307 = 0u;
  -[HUServiceDetailsItemManager homeKitAccessorySettingsModules](self, "homeKitAccessorySettingsModules");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v263 = objc_msgSend(v262, "countByEnumeratingWithState:objects:count:", &v306, v327, 16);
  if (v263)
  {
    v264 = *(_QWORD *)v307;
    do
    {
      for (i = 0; i != v263; ++i)
      {
        if (*(_QWORD *)v307 != v264)
          objc_enumerationMutation(v262);
        objc_msgSend(*(id *)(*((_QWORD *)&v306 + 1) + 8 * i), "itemProviders");
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "unionSet:", v266);

      }
      v263 = objc_msgSend(v262, "countByEnumeratingWithState:objects:count:", &v306, v327, 16);
    }
    while (v263);
  }

  -[HUServiceDetailsItemManager softwareUpdateItemModule](self, "softwareUpdateItemModule");
  v267 = (void *)objc_claimAutoreleasedReturnValue();

  if (v267)
  {
    -[HUServiceDetailsItemManager softwareUpdateItemModule](self, "softwareUpdateItemModule");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v268, "itemProviders");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v255, "unionSet:", v269);

  }
  -[HUServiceDetailsItemManager valveEditorItemModule](self, "valveEditorItemModule");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "itemProviders");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "unionSet:", v271);

  -[HUServiceDetailsItemManager televisionSettingsItemModule](self, "televisionSettingsItemModule");
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "itemProviders");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "unionSet:", v273);

  -[HUServiceDetailsItemManager inputSourceItemModule](self, "inputSourceItemModule");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "itemProviders");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "unionSet:", v275);

  -[HUServiceDetailsItemManager debugAccessoryItemModule](self, "debugAccessoryItemModule");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v276, "itemProviders");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "unionSet:", v277);

  objc_msgSend(v246, "unionSet:", v255);
  objc_msgSend(v246, "allObjects");
  v278 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v311);
  objc_destroyWeak(&v313);

  objc_destroyWeak(&v315);
  objc_destroyWeak(&v319);

  objc_destroyWeak(&location);
  return v278;
}

id __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30D70]);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

uint64_t __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v3, "isEqual:", v6);
  else
    v7 = 0;

  return v7;
}

BOOL __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  _BOOL8 v12;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "roomForEntireHome");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    objc_msgSend(v6, "accessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") != 0;

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

uint64_t __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "room");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

id __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_5(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_6;
  v8[3] = &unk_1E6F5E068;
  objc_copyWeak(&v12, a1 + 6);
  v5 = v3;
  v9 = v5;
  v11 = a1[5];
  v10 = a1[4];
  v6 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v5, v8);

  objc_destroyWeak(&v12);
  return v6;
}

id __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "roomForEntireHome");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithBool:", objc_msgSend(v9, "isEqual:", v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30D98]);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E48]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "numberWithBool:", (*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v16));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30DA0]);

  v18 = objc_alloc(MEMORY[0x1E0D31700]);
  objc_msgSend(*(id *)(a1 + 32), "room");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithExistingObject:inHome:", v19, *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30E40]);

  return v6;
}

id __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_8;
  v7[3] = &unk_1E6F5E0B8;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v5 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v3, v7);
  objc_destroyWeak(&v8);

  return v5;
}

id __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serviceLikeBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E40]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "numberWithBool:", objc_msgSend(v8, "isEqual:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30DA0]);

  return v4;
}

uint64_t __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  void *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "isItemGroup") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(WeakRetained, "sourceServiceItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8
      && (objc_msgSend(v8, "accessory"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "hf_isBridge"),
          v11 = objc_msgSend(v9, "isEqual:", v3),
          v9,
          v11)
      && (v10 & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(WeakRetained, "sourceServiceItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessories");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = objc_msgSend(v13, "containsObject:", v3);
    }

  }
  return v5;
}

uint64_t __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_10(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "sourceServiceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v3);

  return v7;
}

- (void)_setUpHomeTheaterItem
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D31840]);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __52__HUServiceDetailsItemManager__setUpHomeTheaterItem__block_invoke;
  v8 = &unk_1E6F4C4E8;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_msgSend(v3, "initWithResultsBlock:", &v5);
  -[HUServiceDetailsItemManager setHomeTheaterAudioOutputItem:](self, "setHomeTheaterAudioOutputItem:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __52__HUServiceDetailsItemManager__setUpHomeTheaterItem__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hf_MediaAccessoryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2
    || objc_msgSend(v2, "mediaAccessoryItemType") != 1
    || (objc_msgSend(v3, "mediaProfileContainer"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "hf_supportsHomeTheater"),
        v4,
        !v5))
  {
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_backingAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_8:
    v13 = &stru_1E6F60E80;
    v14 = 1;
    v8 = &stru_1E6F60E80;
    goto LABEL_9;
  }
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsAudioOutputTitle"), CFSTR("HUServiceDetailsAudioOutputTitle"), 1);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioDestinationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "audioDestinationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "destination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "audioDestinationName");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUHomeTheaterSettings_DefaultOutput"), CFSTR("HUHomeTheaterSettings_DefaultOutput"), 1);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  v14 = 0;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30D18]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30BF8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_setUpManagedConfigurationProfilesItem
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D31840]);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke;
  v8 = &unk_1E6F4C4E8;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_msgSend(v3, "initWithResultsBlock:", &v5);
  -[HUServiceDetailsItemManager setManagedConfigurationProfilesItem:](self, "setManagedConfigurationProfilesItem:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sourceItemAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsManagedConfigurationProfile");

  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke_2;
    v11[3] = &unk_1E6F51698;
    v11[4] = WeakRetained;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithCompletionHandlerAdapterBlock:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke_3;
    v10[3] = &unk_1E6F4CD30;
    v10[4] = WeakRetained;
    objc_msgSend(v6, "flatMap:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recover:", &__block_literal_global_272);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = *MEMORY[0x1E0D30D70];
    v13[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithResult:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sourceItemAccessory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchManagedConfigurationProfilesWithCompletionHandler:", v3);

}

id __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUManagedConfigurationProfilesTitle"), CFSTR("HUManagedConfigurationProfilesTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30BF8]);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v4, "count");

  objc_msgSend(v8, "numberWithInt:", v9 == 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D70]);

  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "sourceItemAccessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_setWithSafeObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v2;
    _os_log_error_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_ERROR, "Error fetching profiles %@]", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x1E0D519C0];
  v8 = *MEMORY[0x1E0D30D70];
  v9 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v5;
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
  int v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  HUServiceDetailsItemManager *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  HUServiceDetailsItemManager *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  HUServiceDetailsItemManager *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  NSObject *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  void (**v143)(void *, void *);
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  int v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  char v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  char v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  char v178;
  uint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  char v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  BOOL v194;
  id v195;
  void *v196;
  void *v197;
  BOOL v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  uint64_t v205;
  void *v206;
  void *v207;
  void *v208;
  _BOOL4 v209;
  void *v210;
  void *v211;
  _BOOL4 v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  char v217;
  void *v218;
  uint64_t v219;
  void *v220;
  void *v221;
  void *v222;
  _BOOL4 v223;
  void *v224;
  id v225;
  void *v227;
  void *v228;
  const char *aSelector;
  char *aSelectora;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  HUServiceDetailsItemManager *v235;
  void *v236;
  id v237;
  void *v238;
  char v239;
  void *v240;
  void *v241;
  void *v242;
  id obj;
  id obja;
  _QWORD v245[5];
  id v246;
  id v247;
  _QWORD aBlock[4];
  id v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  _QWORD v267[2];
  uint8_t buf[4];
  HUServiceDetailsItemManager *v269;
  __int16 v270;
  id v271;
  __int16 v272;
  void *v273;
  void *v274;
  _QWORD v275[3];
  _BYTE v276[128];
  _QWORD v277[4];

  v277[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    v195 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_111;
  }
  aSelector = a2;
  -[HUServiceDetailsItemManager serviceDetailsControlStateAndCharacteristicItemModule](self, "serviceDetailsControlStateAndCharacteristicItemModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildSectionsWithDisplayedItems:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[HUServiceDetailsItemModule serviceDetailsItemSectionComparatorForSortStrategy:](HUServiceDetailsItemModule, "serviceDetailsItemSectionComparatorForSortStrategy:", CFSTR("HUServiceDetailsItemModuleSortStrategyDefault"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v234 = v7;
  objc_msgSend(v7, "sortedArrayUsingComparator:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setCharacteristicSections:](self, "setCharacteristicSections:", v9);

  -[HUServiceDetailsItemManager programmableSwitchItemModule](self, "programmableSwitchItemModule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buildSectionsWithDisplayedItems:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[HUServiceDetailsItemModule serviceDetailsItemSectionComparatorForSortStrategy:](HUServiceDetailsItemModule, "serviceDetailsItemSectionComparatorForSortStrategy:", CFSTR("HUServiceDetailsItemModuleSortStrategyProgrammableSwitch"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v233 = v11;
  objc_msgSend(v11, "sortedArrayUsingComparator:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setProgrammableSwitchSections:](self, "setProgrammableSwitchSections:", v13);

  -[HUServiceDetailsItemManager accessorySettingsItemModule](self, "accessorySettingsItemModule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v237 = v5;
  objc_msgSend(v14, "buildSectionsWithDisplayedItems:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUServiceDetailsItemManager managedConfigurationProfilesItem](self, "managedConfigurationProfilesItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v277[0] = *MEMORY[0x1E0D30B80];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v277, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "resultsContainRequiredProperties:", v17);
  v19 = (_QWORD *)MEMORY[0x1E0D30D70];
  v235 = self;
  if (!v18)
    goto LABEL_5;
  -[HUServiceDetailsItemManager managedConfigurationProfilesItem](self, "managedConfigurationProfilesItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "latestResults");
  v21 = v15;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", *v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  v15 = v21;
  if ((v24 & 1) == 0)
  {
    objc_msgSend(v21, "na_firstObjectPassingTest:", &__block_literal_global_275);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "items");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v25, "mutableCopy");

    -[HUServiceDetailsItemManager managedConfigurationProfilesItem](self, "managedConfigurationProfilesItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "na_safeAddObject:", v26);

    objc_msgSend(v16, "setItems:", v17);
LABEL_5:

  }
  v232 = v15;
  objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_277);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setAccessorySettingsSections:](self, "setAccessorySettingsSections:", v27);

  v236 = (void *)objc_opt_new();
  v28 = objc_opt_new();
  v250 = 0u;
  v251 = 0u;
  v252 = 0u;
  v253 = 0u;
  v29 = self;
  v30 = (void *)v28;
  -[HUServiceDetailsItemManager homeKitAccessorySettingsModules](v29, "homeKitAccessorySettingsModules");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v250, v276, 16);
  v238 = v30;
  if (!v31)
    goto LABEL_29;
  v32 = v31;
  v33 = *(_QWORD *)v251;
  v34 = (_QWORD *)MEMORY[0x1E0D30F28];
  do
  {
    v35 = 0;
    do
    {
      if (*(_QWORD *)v251 != v33)
        objc_enumerationMutation(obj);
      v36 = *(void **)(*((_QWORD *)&v250 + 1) + 8 * v35);
      objc_opt_class();
      v37 = v36;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v38 = v37;
      else
        v38 = 0;
      v39 = v38;

      objc_msgSend(v39, "settingGroupKeyPath");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v40, "isEqualToString:", *v34) & 1) != 0)
        goto LABEL_21;
      v41 = v32;
      v42 = v33;
      v43 = v34;
      objc_msgSend(v39, "settingGroupKeyPath");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v44, "isEqualToString:", *MEMORY[0x1E0D301B0]) & 1) != 0)
        goto LABEL_20;
      objc_msgSend(v39, "settingGroupKeyPath");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v45, "isEqualToString:", *MEMORY[0x1E0D30478]) & 1) != 0)
        goto LABEL_19;
      objc_msgSend(v39, "settingGroupKeyPath");
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v241, "isEqualToString:", *MEMORY[0x1E0D30490]) & 1) != 0)
      {

LABEL_19:
LABEL_20:

        v34 = v43;
        v33 = v42;
        v32 = v41;
LABEL_21:

LABEL_22:
        objc_msgSend(v39, "accessorySettingsItemProvider");
        v46 = (HUServiceDetailsItemManager *)objc_claimAutoreleasedReturnValue();
        -[HUServiceDetailsItemManager items](v46, "items");
        v47 = objc_claimAutoreleasedReturnValue();
        -[NSObject allObjects](v47, "allObjects");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObjectsFromArray:", v48);

        goto LABEL_23;
      }
      objc_msgSend(v39, "settingGroupKeyPath");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v239 = objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0D30590]);

      v30 = v238;
      v34 = v43;
      v33 = v42;
      v32 = v41;
      if ((v239 & 1) != 0)
        goto LABEL_22;
      objc_msgSend(v37, "buildSectionsWithDisplayedItems:", v237);
      v46 = (HUServiceDetailsItemManager *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "addObjectsFromArray:", v46);
      HFLogForCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v269 = v46;
        v270 = 2112;
        v271 = v37;
        _os_log_debug_impl(&dword_1B8E1E000, v47, OS_LOG_TYPE_DEBUG, "Built Setting Sections = [%@] for module = [%@]", buf, 0x16u);
      }
LABEL_23:

      ++v35;
    }
    while (v32 != v35);
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v250, v276, 16);
    v32 = v50;
  }
  while (v50);
LABEL_29:

  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("groupedHomeKitAccessorySettingsSection"));
  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v51, "setItems:", v30);
    objc_msgSend(v236, "insertObject:atIndex:", v51, 0);
  }
  obja = v51;
  v52 = v235;
  -[HUServiceDetailsItemManager setHomeKitAccessorySettingsSections:](v235, "setHomeKitAccessorySettingsSections:", v236);
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("splitAccount"));
  -[HUServiceDetailsItemManager splitMediaAccountTitleItem](v235, "splitMediaAccountTitleItem");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v275[0] = v54;
  -[HUServiceDetailsItemManager splitMediaAccountUseDefaultAccountItem](v235, "splitMediaAccountUseDefaultAccountItem");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v275[1] = v55;
  -[HUServiceDetailsItemManager splitMediaAccountSignoutAccountItem](v235, "splitMediaAccountSignoutAccountItem");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v275[2] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v275, 3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setItems:", v57);

  v58 = (void *)MEMORY[0x1E0D314B0];
  v242 = v53;
  v274 = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v274, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "filterSections:toDisplayedItems:", v59, v237);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setSplitMediaAccountSections:](v235, "setSplitMediaAccountSections:", v60);

  -[HUServiceDetailsItemManager nameModule](v235, "nameModule");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "buildSectionsWithDisplayedItems:", v237);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setNameAndIconSections:](v235, "setNameAndIconSections:", v62);

  -[HUServiceDetailsItemManager accessoryRepresentableItemModule](v235, "accessoryRepresentableItemModule");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    -[HUServiceDetailsItemManager accessoryRepresentableItemModule](v235, "accessoryRepresentableItemModule");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "buildSectionsWithDisplayedItems:", v237);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "na_map:", &__block_literal_global_287);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUServiceDetailsItemManager hf_MediaAccessoryItem](v235, "hf_MediaAccessoryItem");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v65) = objc_msgSend(v67, "isContainedWithinItemGroup");

    if ((_DWORD)v65)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsContainedSpeakersLabel"), CFSTR("HUServiceDetailsContainedSpeakersLabel"), 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "firstObject");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setHeaderTitle:", v68);

    }
    -[HUServiceDetailsItemManager setContainedAccessoriesSections:](v235, "setContainedAccessoriesSections:", v66);

  }
  if (-[HUServiceDetailsItemManager sourceItemIsService](v235, "sourceItemIsService")
    && (-[HUServiceDetailsItemManager sourceItemAccessory](v235, "sourceItemAccessory"),
        v70 = (void *)objc_claimAutoreleasedReturnValue(),
        v71 = objc_msgSend(v70, "hf_isHomePod"),
        v70,
        v71))
  {
    HFLogForCategory();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(aSelector);
      v73 = (id)objc_claimAutoreleasedReturnValue();
      -[HFItemManager sourceItem](v235, "sourceItem");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v269 = v235;
      v270 = 2112;
      v271 = v73;
      v272 = 2112;
      v273 = v74;
      _os_log_impl(&dword_1B8E1E000, v72, OS_LOG_TYPE_INFO, "%@:%@ Skip adding softwareUpdateSections for HomePod service: %@", buf, 0x20u);

      goto LABEL_40;
    }
  }
  else
  {
    -[HUServiceDetailsItemManager softwareUpdateItemModule](v235, "softwareUpdateItemModule");
    v72 = objc_claimAutoreleasedReturnValue();
    -[NSObject buildSectionsWithDisplayedItems:](v72, "buildSectionsWithDisplayedItems:", v237);
    v73 = (id)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsItemManager setSoftwareUpdateSections:](v235, "setSoftwareUpdateSections:", v73);
LABEL_40:

  }
  -[HUServiceDetailsItemManager relatedTriggerItemModule](v235, "relatedTriggerItemModule");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    -[HUServiceDetailsItemManager relatedTriggerItemModule](v235, "relatedTriggerItemModule");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "buildSectionsWithDisplayedItems:", v237);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsItemManager setRelatedTriggerSections:](v235, "setRelatedTriggerSections:", v77);

  }
  -[HUServiceDetailsItemManager valveEditorItemModule](v235, "valveEditorItemModule");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "buildSectionsWithDisplayedItems:", v237);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setValveEditorSections:](v235, "setValveEditorSections:", v79);

  -[HUServiceDetailsItemManager sceneAndTriggerModule](v235, "sceneAndTriggerModule");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "buildSectionsWithDisplayedItems:", v237);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setSceneAndTriggerSections:](v235, "setSceneAndTriggerSections:", v81);

  -[HUServiceDetailsItemManager connectedServicesItemModule](v235, "connectedServicesItemModule");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "buildSectionsWithDisplayedItems:", v237);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setConnectedServicesSections:](v235, "setConnectedServicesSections:", v83);

  -[HUServiceDetailsItemManager inputSourceItemModule](v235, "inputSourceItemModule");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "buildSectionsWithDisplayedItems:", v237);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setInputSourceEditorSections:](v235, "setInputSourceEditorSections:", v85);

  -[HUServiceDetailsItemManager televisionSettingsItemModule](v235, "televisionSettingsItemModule");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "buildSectionsWithDisplayedItems:", v237);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setTelevisionSettingsSections:](v235, "setTelevisionSettingsSections:", v87);

  v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("AdvancedCameraSettings"));
  -[HUServiceDetailsItemManager cameraRecordingOptionsItem](v235, "cameraRecordingOptionsItem");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v267[0] = v89;
  -[HUServiceDetailsItemManager cameraFaceRecognitionItem](v235, "cameraFaceRecognitionItem");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v267[1] = v90;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v267, 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setItems:", v91);

  v92 = (void *)MEMORY[0x1E0D314B0];
  v240 = v88;
  v266 = v88;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v266, 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "filterSections:toDisplayedItems:", v93, v237);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setAdvancedCameraSettingsSection:](v235, "setAdvancedCameraSettingsSection:", v94);

  v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("AudioOutput"));
  -[HUServiceDetailsItemManager homeTheaterAudioOutputItem](v235, "homeTheaterAudioOutputItem");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v265 = v96;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v265, 1);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setItems:", v97);

  v98 = (void *)MEMORY[0x1E0D314B0];
  v231 = v95;
  v264 = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v264, 1);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "filterSections:toDisplayedItems:", v99, v237);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setHomeTheaterAudioSections:](v235, "setHomeTheaterAudioSections:", v100);

  v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("cameraActivityZones"));
  -[HUServiceDetailsItemManager cameraActivityZonesItem](v235, "cameraActivityZonesItem");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v263 = v102;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v263, 1);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setItems:", v103);

  v104 = (void *)MEMORY[0x1E0D314B0];
  aSelectora = (char *)v101;
  v262 = v101;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v262, 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "filterSections:toDisplayedItems:", v105, v237);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setCameraActivityZonesSections:](v235, "setCameraActivityZonesSections:", v106);

  v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("cameraStatusLight"));
  -[HUServiceDetailsItemManager cameraStatusLightItem](v235, "cameraStatusLightItem");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v261 = v108;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v261, 1);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setItems:", v109);

  v110 = (void *)MEMORY[0x1E0D314B0];
  v228 = v107;
  v260 = v107;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v260, 1);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "filterSections:toDisplayedItems:", v111, v237);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setCameraStatusLightSections:](v235, "setCameraStatusLightSections:", v112);

  v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("cameraNightMode"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraNightModeFooterTitle"), CFSTR("HUCameraNightModeFooterTitle"), 1);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setFooterTitle:", v114);

  -[HUServiceDetailsItemManager cameraNightModeItem](v235, "cameraNightModeItem");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v259 = v115;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v259, 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setItems:", v116);

  v117 = (void *)MEMORY[0x1E0D314B0];
  v258 = v113;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v258, 1);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "filterSections:toDisplayedItems:", v118, v237);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setCameraNightModeSections:](v235, "setCameraNightModeSections:", v119);

  v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("doorbellChimeMute"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraDoorbellChimeMuteSwitchFooter"), CFSTR("HUCameraDoorbellChimeMuteSwitchFooter"), 1);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setFooterTitle:", v121);

  -[HUServiceDetailsItemManager cameraDoorbellChimeMuteItem](v235, "cameraDoorbellChimeMuteItem");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v257 = v122;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v257, 1);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setItems:", v123);

  v124 = (void *)MEMORY[0x1E0D314B0];
  v256 = v120;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v256, 1);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "filterSections:toDisplayedItems:", v125, v237);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setDoorbellMuteSections:](v235, "setDoorbellMuteSections:", v126);

  v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("collectDiagnostics"));
  v128 = (void *)MEMORY[0x1E0C99D20];
  -[HUServiceDetailsItemManager collectDiagnosticsItem](v235, "collectDiagnosticsItem");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "na_arrayWithSafeObject:", v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setItems:", v130);

  v131 = (void *)MEMORY[0x1E0D314B0];
  v227 = v127;
  v255 = v127;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v255, 1);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "filterSections:toDisplayedItems:", v132, v237);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setCollectDiagnosticsSections:](v235, "setCollectDiagnosticsSections:", v133);

  v134 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("lockAddHomeKeyToWalletItem"));
  v135 = (void *)MEMORY[0x1E0C99D20];
  -[HUServiceDetailsItemManager lockAddHomeKeyToWalletItem](v235, "lockAddHomeKeyToWalletItem");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "na_arrayWithSafeObject:", v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "setItems:", v137);

  v138 = (void *)MEMORY[0x1E0D314B0];
  v254 = v134;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v254, 1);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "filterSections:toDisplayedItems:", v139, v237);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setLockAddHomeKeyToWalletSections:](v235, "setLockAddHomeKeyToWalletSections:", v140);

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_311;
  aBlock[3] = &unk_1E6F50650;
  v142 = v141;
  v249 = v142;
  v143 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (-[HUServiceDetailsItemManager _shouldShowFirmwareUpdateSection](v235, "_shouldShowFirmwareUpdateSection"))
  {
    objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsFirmwareUpdateSectionPromptIdentifier"));
    objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsFirmwareUpdateAppStoreSectionIdentifier"));
  }
  objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsHeaderSectionIdentifier"));
  -[HUServiceDetailsItemManager softwareUpdateSections](v235, "softwareUpdateSections");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v144);

  -[HUServiceDetailsItemManager splitMediaAccountSections](v235, "splitMediaAccountSections");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v145);

  -[HUServiceDetailsItemManager nameAndIconSections](v235, "nameAndIconSections");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v146);

  -[HUServiceDetailsItemManager characteristicSections](v235, "characteristicSections");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v147);

  objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsPrimaryInfoSectionIdentifier"));
  -[HUServiceDetailsItemManager containedAccessoriesSections](v235, "containedAccessoriesSections");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v148);

  -[HUServiceDetailsItemManager addGroupItem](v235, "addGroupItem");
  v149 = objc_claimAutoreleasedReturnValue();
  if (v149)
  {
    v150 = (void *)v149;
    -[HUServiceDetailsItemManager addGroupItem](v235, "addGroupItem");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "latestResults");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = objc_msgSend(v153, "BOOLValue");

    v52 = v235;
    if (!v154)
      goto LABEL_49;
  }
  -[HUServiceDetailsItemManager separateTileItem](v52, "separateTileItem");
  v155 = objc_claimAutoreleasedReturnValue();
  if (v155)
  {
    v156 = (void *)v155;
    -[HUServiceDetailsItemManager separateTileItem](v52, "separateTileItem");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "latestResults");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = objc_msgSend(v159, "BOOLValue");

    v52 = v235;
    if ((v160 & 1) == 0)
LABEL_49:
      objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsGroupSectionIdentifier"));
  }
  if ((!-[HUServiceDetailsItemManager _isGroupedHomePod](v52, "_isGroupedHomePod")
     || -[HUServiceDetailsItemManager _isSingleHomePodInGroup](v52, "_isSingleHomePodInGroup"))
    && HFPreferenceIdentifyHomePodButtonEnabled())
  {
    objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsIdentifyHomePodSectionIdentifier"));
  }
  -[HUServiceDetailsItemManager lockPinCodesItem](v52, "lockPinCodesItem");
  v161 = objc_claimAutoreleasedReturnValue();
  if (v161)
  {
    v162 = (void *)v161;
    -[HUServiceDetailsItemManager lockPinCodesItem](v52, "lockPinCodesItem");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "latestResults");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = objc_msgSend(v165, "BOOLValue");

    v52 = v235;
    if ((v166 & 1) == 0)
      objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsLockPinCodeSectionIdentifier"));
  }
  -[HUServiceDetailsItemManager lockAddHomeKeyToWalletSections](v52, "lockAddHomeKeyToWalletSections");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v167);

  -[HUServiceDetailsItemManager relatedTriggerSections](v52, "relatedTriggerSections");
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  if (v168)
  {
    -[HUServiceDetailsItemManager relatedTriggerSections](v52, "relatedTriggerSections");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v143[2](v143, v169);

  }
  -[HUServiceDetailsItemManager sceneAndTriggerSections](v52, "sceneAndTriggerSections");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v170);

  -[HUServiceDetailsItemManager programmableSwitchSections](v52, "programmableSwitchSections");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v171);

  -[HUServiceDetailsItemManager valveEditorSections](v52, "valveEditorSections");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v172);

  -[HUServiceDetailsItemManager alarmItem](v52, "alarmItem");
  v173 = objc_claimAutoreleasedReturnValue();
  if (v173)
  {
    v174 = (void *)v173;
    -[HUServiceDetailsItemManager alarmItem](v52, "alarmItem");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "latestResults");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = objc_msgSend(v177, "BOOLValue");

    v52 = v235;
    if ((v178 & 1) == 0)
      objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsAlarmSectionIdentifier"));
  }
  -[HUServiceDetailsItemManager statusAndNotificationItem](v52, "statusAndNotificationItem");
  v179 = objc_claimAutoreleasedReturnValue();
  if (v179)
  {
    v180 = (void *)v179;
    -[HUServiceDetailsItemManager statusAndNotificationItem](v52, "statusAndNotificationItem");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "latestResults");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = objc_msgSend(v183, "BOOLValue");

    v52 = v235;
    if ((v184 & 1) == 0)
      objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsStatusAndNotificationSectionIdentifier"));
  }
  -[HUServiceDetailsItemManager connectedServicesSections](v52, "connectedServicesSections");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v185);

  -[HUServiceDetailsItemManager inputSourceEditorSections](v52, "inputSourceEditorSections");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v186);

  -[HUServiceDetailsItemManager televisionSettingsSections](v52, "televisionSettingsSections");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v187);

  -[HUServiceDetailsItemManager doorbellMuteSections](v52, "doorbellMuteSections");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v188);

  objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsAdvancedCameraSettingsSectionIdentifier"));
  -[HUServiceDetailsItemManager cameraActivityZonesSections](v52, "cameraActivityZonesSections");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v189);

  -[HUServiceDetailsItemManager cameraStatusLightSections](v52, "cameraStatusLightSections");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v190);

  -[HUServiceDetailsItemManager cameraNightModeSections](v52, "cameraNightModeSections");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v191);

  -[HUServiceDetailsItemManager homeTheaterAudioSections](v52, "homeTheaterAudioSections");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v192);

  -[HUServiceDetailsItemManager sourceItemAccessory](v52, "sourceItemAccessory");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v193, "hf_isVisibleAsBridgedAccessory") & 1) != 0)
  {
    v194 = -[HUServiceDetailsItemManager shouldHideAccessoryItem](v52, "shouldHideAccessoryItem");

    if (!v194)
      goto LABEL_67;
    goto LABEL_76;
  }
  -[HUServiceDetailsItemManager sourceItemAccessory](v52, "sourceItemAccessory");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v196, "hf_isVisibleAsBridge") & 1) == 0)
  {
LABEL_75:

    goto LABEL_76;
  }
  -[HUServiceDetailsItemManager sourceItemAccessory](v52, "sourceItemAccessory");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v197, "hf_isPureBridge") & 1) != 0
    || !-[HUServiceDetailsItemManager sourceItemIsService](v52, "sourceItemIsService"))
  {

    goto LABEL_75;
  }
  v198 = -[HUServiceDetailsItemManager shouldHideAccessoryItem](v52, "shouldHideAccessoryItem");

  if (!v198)
LABEL_67:
    objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsBridgeSectionIdentifier"));
LABEL_76:
  -[HUServiceDetailsItemManager accessorySettingsSections](v52, "accessorySettingsSections");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "na_map:", &__block_literal_global_316);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "addObjectsFromArray:", v200);

  -[HUServiceDetailsItemManager homeKitAccessorySettingsSections](v52, "homeKitAccessorySettingsSections");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "na_map:", &__block_literal_global_317);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "addObjectsFromArray:", v202);

  if (!-[HUServiceDetailsItemManager isItemGroup](v52, "isItemGroup")
    && -[HUServiceDetailsItemManager _shouldShowLinkedApplicationSection](v52, "_shouldShowLinkedApplicationSection"))
  {
    objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsLinkedApplicationSectionIdentifier"));
  }
  if (!-[HUServiceDetailsItemManager isItemGroup](v52, "isItemGroup"))
    objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsAccessoryInfoSectionIdentifier"));
  -[HUServiceDetailsItemManager collectDiagnosticsSections](v52, "collectDiagnosticsSections");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2](v143, v203);

  -[HFItemManager home](v52, "home");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v204, "hf_currentUserIsAdministrator") & 1) == 0)
    goto LABEL_87;
  -[HUServiceDetailsItemManager resetItem](v52, "resetItem");
  v205 = objc_claimAutoreleasedReturnValue();
  if (!v205)
    goto LABEL_87;
  v206 = (void *)v205;
  -[HUServiceDetailsItemManager deviceOptionsAdapter](v52, "deviceOptionsAdapter");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v207, "isAccessoryReachableOverRapport") & 1) == 0)
  {

LABEL_87:
    goto LABEL_88;
  }
  -[HUServiceDetailsItemManager hf_MediaAccessoryItem](v52, "hf_MediaAccessoryItem");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = -[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:](v52, "shouldShowExportDiagnosticsItem:", v208);

  if (v209)
    objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsExportDiagnosticsSectionIdentifier"));
LABEL_88:
  -[HFItemManager home](v235, "home");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v210, "hf_currentUserIsAdministrator") & 1) == 0)
    goto LABEL_94;
  -[HUServiceDetailsItemManager restartItem](v235, "restartItem");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v211 || !-[HUServiceDetailsItemManager _isGroupedHomePod](v235, "_isGroupedHomePod"))
  {

LABEL_94:
    goto LABEL_95;
  }
  v212 = -[HUServiceDetailsItemManager groupedAccessoryReachableOverRapport](v235, "groupedAccessoryReachableOverRapport");

  if (v212)
    objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsRestartSectionIdentifier"));
LABEL_95:
  -[HFItemManager home](v235, "home");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v213, "hf_currentUserIsAdministrator") & 1) != 0)
  {
    -[HUServiceDetailsItemManager removeFromGroupItem](v235, "removeFromGroupItem");
    v214 = (void *)objc_claimAutoreleasedReturnValue();

    if (v214)
      objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsRemoveFromGroupSectionIdentifier"));
  }
  else
  {

  }
  -[HFItemManager home](v235, "home");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v215, "hf_currentUserIsAdministrator") & 1) != 0)
  {
    -[HUServiceDetailsItemManager deviceOptionsAdapter](v235, "deviceOptionsAdapter");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = objc_msgSend(v216, "isAccessoryReachableOverRapport");

    if ((v217 & 1) == 0)
      objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsRemoveSectionIdentifier"));
  }
  else
  {

  }
  -[HFItemManager home](v235, "home");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v218, "hf_currentUserIsAdministrator") & 1) == 0)
    goto LABEL_109;
  -[HUServiceDetailsItemManager resetItem](v235, "resetItem");
  v219 = objc_claimAutoreleasedReturnValue();
  if (!v219)
    goto LABEL_109;
  v220 = (void *)v219;
  -[HUServiceDetailsItemManager deviceOptionsAdapter](v235, "deviceOptionsAdapter");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v221, "isAccessoryReachableOverRapport") & 1) == 0)
  {

LABEL_109:
    v5 = v237;
    goto LABEL_110;
  }
  -[HUServiceDetailsItemManager hf_MediaAccessoryItem](v235, "hf_MediaAccessoryItem");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v223 = -[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:](v235, "shouldShowDeviceOptionsForAccessoryItem:", v222);

  v5 = v237;
  if (v223)
    objc_msgSend(v142, "addObject:", CFSTR("HUServiceDetailsResetSectionIdentifier"));
LABEL_110:
  v224 = (void *)objc_opt_new();
  v245[0] = MEMORY[0x1E0C809B0];
  v245[1] = 3221225472;
  v245[2] = __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_5;
  v245[3] = &unk_1E6F5E250;
  v245[4] = v235;
  v225 = v224;
  v246 = v225;
  v247 = v5;
  objc_msgSend(v142, "enumerateObjectsUsingBlock:", v245);
  v195 = v225;

LABEL_111:
  return v195;
}

uint64_t __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D30748]);

  return v3;
}

uint64_t __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUAccessorySettingsItemModuleSortKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HUAccessorySettingsItemModuleSortKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

id __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_285(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "mutableCopy");
}

void __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_311(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "na_map:", &__block_literal_global_314);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

uint64_t __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_2_312(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  HUServiceDetailsSectionFactory *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_characteristicSectionForIdentifier:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_allItemsForSectionIdentifier:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v4);
    objc_msgSend(v5, "intersectSet:", *(_QWORD *)(a1 + 48));
    if (objc_msgSend(v5, "count"))
    {
      v6 = objc_alloc_init(HUServiceDetailsSectionFactory);
      if (_MergedGlobals_4_7 != -1)
        dispatch_once(&_MergedGlobals_4_7, &__block_literal_global_322);
      v7 = (id)qword_1EF226BF0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_8;
      v13[3] = &unk_1E6F4E0D8;
      v8 = v12;
      v14 = v8;
      if (objc_msgSend(v7, "na_any:", v13))
      {
        objc_msgSend(MEMORY[0x1E0D319D0], "comparatorWithSortedObjects:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUServiceDetailsSectionFactory setCustomComparator:](v6, "setCustomComparator:", v9);

      }
      objc_msgSend(*(id *)(a1 + 32), "sourceItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsSectionFactory buildServiceDetailsItemSectionForSourceItem:sectionIdentifier:items:](v6, "buildServiceDetailsItemSectionForSourceItem:sectionIdentifier:items:", v10, v8, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v11);
    }

  }
}

void __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_7()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("HUServiceDetailsPrimaryInfoSectionIdentifier");
  v2[1] = CFSTR("HUServiceDetailsStatusAndNotificationSectionIdentifier");
  v2[2] = CFSTR("HUServiceDetailsAdvancedCameraSettingsSectionIdentifier");
  v2[3] = CFSTR("HUServiceDetailsRemoveFromGroupSectionIdentifier");
  v2[4] = CFSTR("HUServiceDetailsRemoveSectionIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EF226BF0;
  qword_1EF226BF0 = v0;

}

uint64_t __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
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
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char isKindOfClass;
  void *v57;
  void *v58;
  objc_super v60;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)HUServiceDetailsItemManager;
  -[HFItemManager _itemsToHideInSet:](&v60, sel__itemsToHideInSet_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager existingRoomItemProvider](self, "existingRoomItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v9);

  -[HUServiceDetailsItemManager suggestedRoomItemProvider](self, "suggestedRoomItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v11);

  if (-[HUServiceDetailsItemManager showRoomsList](self, "showRoomsList"))
  {
    -[HUServiceDetailsItemManager selectedRoomItemProvider](self, "selectedRoomItemProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v13);

  }
  else
  {
    -[HUServiceDetailsItemManager roomListItem](self, "roomListItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v14);

    -[HUServiceDetailsItemManager createNewRoomItem](self, "createNewRoomItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v12);
  }

  objc_msgSend(v4, "na_setByIntersectingWithSet:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v15);

  -[HUServiceDetailsItemManager relatedTriggerItemModule](self, "relatedTriggerItemModule");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HUServiceDetailsItemManager relatedTriggerItemModule](self, "relatedTriggerItemModule");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_setByIntersectingWithSet:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUServiceDetailsItemManager relatedTriggerItemModule](self, "relatedTriggerItemModule");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "itemsToHideInSet:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v21);

  }
  -[HUServiceDetailsItemManager associatedServiceTypeItem](self, "associatedServiceTypeItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "containsObject:", v22))
    goto LABEL_9;
  -[HUServiceDetailsItemManager associatedServiceTypeOptionItemProvider](self, "associatedServiceTypeOptionItemProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "items");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (!v25)
  {
    -[HUServiceDetailsItemManager associatedServiceTypeItem](self, "associatedServiceTypeItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v22);
LABEL_9:

  }
  if (-[HUServiceDetailsItemManager showAssociatedServiceTypeList](self, "showAssociatedServiceTypeList"))
  {
    -[HUServiceDetailsItemManager associatedServiceTypeItem](self, "associatedServiceTypeItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v4, "containsObject:", v26);

    if (v27)
    {
      -[HUServiceDetailsItemManager associatedServiceTypeItem](self, "associatedServiceTypeItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v28);

    }
  }
  if (!-[HUServiceDetailsItemManager showAssociatedServiceTypeList](self, "showAssociatedServiceTypeList"))
  {
    -[HUServiceDetailsItemManager associatedServiceTypeOptionItemProvider](self, "associatedServiceTypeOptionItemProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "items");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v30);

  }
  -[HFItemManager home](self, "home");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "hf_currentUserIsAdministrator");

  if ((v32 & 1) == 0)
  {
    -[HUServiceDetailsItemManager collectDiagnosticsItem](self, "collectDiagnosticsItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_safeAddObject:", v33);

  }
  if (-[HUServiceDetailsItemManager shouldHideAccessoryItem](self, "shouldHideAccessoryItem"))
  {
    -[HUServiceDetailsItemManager accessoryItem](self, "accessoryItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_safeAddObject:", v34);

  }
  if (-[HUServiceDetailsItemManager shouldHideSeparateTileItem](self, "shouldHideSeparateTileItem"))
  {
    -[HUServiceDetailsItemManager separateTileItem](self, "separateTileItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_safeAddObject:", v35);

  }
  -[HFItemManager home](self, "home");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "hf_currentUserIsAdministrator");
  if (v37)
  {
    -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
    v32 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)v32, "isBridged") & 1) == 0)
      goto LABEL_29;
  }
  -[HUServiceDetailsItemManager removeItem](self, "removeItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "containsObject:", v38))
  {

    if (!v37)
      goto LABEL_30;
LABEL_29:

    goto LABEL_30;
  }
  -[HUServiceDetailsItemManager deviceOptionsAdapter](self, "deviceOptionsAdapter");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "isAccessoryReachableOverRapport");

  if ((v37 & 1) != 0)
  if ((v40 & 1) == 0)
  {
    -[HUServiceDetailsItemManager removeItem](self, "removeItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v36);
LABEL_30:

  }
  -[HFItemManager home](self, "home");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v41, "hf_currentUserIsAdministrator") & 1) != 0)
  {
LABEL_36:

    goto LABEL_37;
  }
  -[HUServiceDetailsItemManager deviceOptionsAdapter](self, "deviceOptionsAdapter");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v42, "isAccessoryReachableOverRapport") & 1) == 0)
  {

    goto LABEL_36;
  }
  -[HUServiceDetailsItemManager hf_MediaAccessoryItem](self, "hf_MediaAccessoryItem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:](self, "shouldShowDeviceOptionsForAccessoryItem:", v43);

  if (v44)
  {
    -[HUServiceDetailsItemManager resetItem](self, "resetItem");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v41);
    goto LABEL_36;
  }
LABEL_37:
  -[HFItemManager home](self, "home");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v45, "hf_currentUserIsAdministrator") & 1) == 0
    && -[HUServiceDetailsItemManager _isGroupedHomePod](self, "_isGroupedHomePod"))
  {
    v46 = -[HUServiceDetailsItemManager groupedAccessoryReachableOverRapport](self, "groupedAccessoryReachableOverRapport");

    if (!v46)
      goto LABEL_42;
    -[HUServiceDetailsItemManager restartItem](self, "restartItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v45);
  }

LABEL_42:
  -[HFItemManager home](self, "home");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v47, "hf_currentUserIsAdministrator"))
  {
LABEL_47:

    goto LABEL_48;
  }
  -[HUServiceDetailsItemManager deviceOptionsAdapter](self, "deviceOptionsAdapter");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v48, "isAccessoryReachableOverRapport") & 1) == 0)
  {

    goto LABEL_47;
  }
  -[HUServiceDetailsItemManager hf_MediaAccessoryItem](self, "hf_MediaAccessoryItem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:](self, "shouldShowDeviceOptionsForAccessoryItem:", v49);

  if (!v50)
  {
LABEL_48:
    -[HUServiceDetailsItemManager exportDiagnosticsItem](self, "exportDiagnosticsItem");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v51);

  }
  if (!-[HUServiceDetailsItemManager _shouldShowSplitAccountUI](self, "_shouldShowSplitAccountUI"))
  {
    -[HUServiceDetailsItemManager splitMediaAccountTitleItem](self, "splitMediaAccountTitleItem");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v52);

    -[HUServiceDetailsItemManager splitMediaAccountUseDefaultAccountItem](self, "splitMediaAccountUseDefaultAccountItem");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v53);

    -[HUServiceDetailsItemManager splitMediaAccountSignoutAccountItem](self, "splitMediaAccountSignoutAccountItem");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v54);

  }
  -[HFItemManager sourceItem](self, "sourceItem");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HUServiceDetailsItemManager removeItem](self, "removeItem");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v57);

  }
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    -[HUServiceDetailsItemManager removeItem](self, "removeItem");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v58);

  }
  return v6;
}

- (id)_transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  void *v8;
  int v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && (objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EB8]),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "BOOLValue"),
        v8,
        v9))
  {
    v10 = (id)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  else
  {
    v10 = v5;
  }

  return v10;
}

- (id)_allItemsForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsHeaderSectionIdentifier")))
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    -[HUServiceDetailsItemManager headerItem](self, "headerItem");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v27 = (void *)v6;
    objc_msgSend(v5, "na_arrayWithSafeObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsPrimaryInfoSectionIdentifier")))
  {
    v7 = (void *)objc_opt_new();
    -[HUServiceDetailsItemManager roomItem](self, "roomItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v8);

    -[HUServiceDetailsItemManager existingRoomItemProvider](self, "existingRoomItemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v11);

    -[HUServiceDetailsItemManager suggestedRoomItemProvider](self, "suggestedRoomItemProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v14);

    -[HUServiceDetailsItemManager roomListItem](self, "roomListItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v15);

    -[HUServiceDetailsItemManager createNewRoomItem](self, "createNewRoomItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v16);

    -[HUServiceDetailsItemManager associatedServiceTypeItem](self, "associatedServiceTypeItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v17);

    -[HUServiceDetailsItemManager associatedServiceTypeOptionItemProvider](self, "associatedServiceTypeOptionItemProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "items");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global_329);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v21);

    -[HUServiceDetailsItemManager showContainedItems](self, "showContainedItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v22);

    -[HUServiceDetailsItemManager audioSettingsItem](self, "audioSettingsItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v23);

    -[HUServiceDetailsItemManager internalDebuggingItem](self, "internalDebuggingItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v24);

    -[HUServiceDetailsItemManager showInHomeDashboardItem](self, "showInHomeDashboardItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v25);

    -[HUServiceDetailsItemManager favoriteItem](self, "favoriteItem");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsExportDiagnosticsSectionIdentifier")))
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    -[HUServiceDetailsItemManager exportDiagnosticsItem](self, "exportDiagnosticsItem");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsRemoveFromGroupSectionIdentifier")))
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    -[HUServiceDetailsItemManager removeFromGroupItem](self, "removeFromGroupItem");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsRemoveSectionIdentifier")))
  {
    v7 = (void *)objc_opt_new();
    -[HUServiceDetailsItemManager pairingModeItem](self, "pairingModeItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v28);

    -[HUServiceDetailsItemManager removeItem](self, "removeItem");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsResetSectionIdentifier")))
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    -[HUServiceDetailsItemManager resetItem](self, "resetItem");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsRestartSectionIdentifier")))
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    -[HUServiceDetailsItemManager restartItem](self, "restartItem");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsLinkedApplicationSectionIdentifier")))
  {
    -[HUServiceDetailsItemManager linkedApplicationItemProvider](self, "linkedApplicationItemProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
    v27 = v30;
    objc_msgSend(v30, "items");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
    v32 = v31;
    objc_msgSend(v31, "allObjects");
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_25:
    v7 = (void *)v33;

    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsAccessoryInfoSectionIdentifier")))
  {
    -[HUServiceDetailsItemManager accessoryInfoItemProvider](self, "accessoryInfoItemProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsGroupSectionIdentifier")))
  {
    v7 = (void *)objc_opt_new();
    -[HUServiceDetailsItemManager addGroupItem](self, "addGroupItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v34);

    -[HUServiceDetailsItemManager separateTileItem](self, "separateTileItem");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsIdentifyHomePodSectionIdentifier")))
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    -[HUServiceDetailsItemManager identifyHomePodItem](self, "identifyHomePodItem");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsFirmwareUpdateSectionPromptIdentifier")))
  {
    -[HUServiceDetailsItemManager firmwareUpdateItemProvider](self, "firmwareUpdateItemProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "instructionsItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsFirmwareUpdateAppStoreSectionIdentifier")))
  {
    -[HUServiceDetailsItemManager firmwareUpdateItemProvider](self, "firmwareUpdateItemProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "linkedApplicationItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsBridgeSectionIdentifier")))
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    -[HUServiceDetailsItemManager accessoryItem](self, "accessoryItem");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsAlarmSectionIdentifier")))
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    -[HUServiceDetailsItemManager alarmItem](self, "alarmItem");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsStatusAndNotificationSectionIdentifier")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsItemManager statusAndNotificationItem](self, "statusAndNotificationItem");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsAdvancedCameraSettingsSectionIdentifier")))
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsLockPinCodeSectionIdentifier")))
      {
        v7 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_18;
      }
      v5 = (void *)MEMORY[0x1E0C99D20];
      -[HUServiceDetailsItemManager lockPinCodesItem](self, "lockPinCodesItem");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v7 = (void *)objc_opt_new();
    -[HUServiceDetailsItemManager cameraRecordingOptionsItem](self, "cameraRecordingOptionsItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v35);

    -[HUServiceDetailsItemManager cameraFaceRecognitionItem](self, "cameraFaceRecognitionItem");
    v26 = objc_claimAutoreleasedReturnValue();
  }
LABEL_5:
  v27 = (void *)v26;
  objc_msgSend(v7, "na_safeAddObject:", v26);
LABEL_17:

LABEL_18:
  return v7;
}

uint64_t __61__HUServiceDetailsItemManager__allItemsForSectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "localizedStandardCompare:", v9);
  return v10;
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUServiceDetailsItemManager;
  v4 = a3;
  -[HFItemManager _didFinishUpdateTransactionWithAffectedItems:](&v8, sel__didFinishUpdateTransactionWithAffectedItems_, v4);
  -[HUServiceDetailsItemManager firmwareUpdateItemProvider](self, "firmwareUpdateItemProvider", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intersectsSet:", v4);

  if (v7)
    -[HFItemManager recalculateVisibilityAndSortAllItems](self, "recalculateVisibilityAndSortAllItems");
}

- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate
{
  return 0;
}

- (BOOL)controlAndCharacteristicStateItemModule:(id)a3 shouldShowControlPanelItem:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[HUServiceDetailsItemManager serviceDetailsDelegate](self, "serviceDetailsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "itemManager:shouldShowControlPanelItem:", self, v5);

  return (char)self;
}

- (BOOL)controlAndCharacteristicStateItemModule:(id)a3 shouldShowSectionTitleForControlPanelItem:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[HUServiceDetailsItemManager serviceDetailsDelegate](self, "serviceDetailsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "itemManager:shouldShowSectionTitleForControlPanelItem:", self, v5);

  return (char)self;
}

- (id)controlAndCharacteristicStateItemModule:(id)a3 childItemsForItem:(id)a4
{
  return -[HFItemManager childItemsForItem:](self, "childItemsForItem:", a4);
}

- (id)controlAndCharacteristicStateItemModule:(id)a3 sectionTitleForControlPanelItem:(id)a4 forServiceItem:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  -[HUServiceDetailsItemManager serviceDetailsDelegate](self, "serviceDetailsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemManager:sectionTitleForControlPanelItem:forServiceItem:", self, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)controlAndCharacteristicStateItemModule:(id)a3 sectionFooterForControlPanelItem:(id)a4 forServiceItem:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  -[HUServiceDetailsItemManager serviceDetailsDelegate](self, "serviceDetailsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemManager:sectionFooterForControlPanelItem:forServiceItem:", self, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)didUpdateDiagnosticInfo:(id)a3 forAccessory:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  id v10;

  v6 = a4;
  -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if (v8)
  {
    -[HUServiceDetailsItemManager _itemsToUpdateForDiagnosticInfoUpdate](self, "_itemsToUpdateForDiagnosticInfoUpdate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v10, a2);

  }
}

- (id)_characteristicSectionForIdentifier:(id)a3
{
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[24];

  v79[22] = *MEMORY[0x1E0C80C00];
  v76 = a3;
  -[HUServiceDetailsItemManager splitMediaAccountSections](self, "splitMediaAccountSections");
  v4 = objc_claimAutoreleasedReturnValue();
  v75 = (void *)v4;
  v5 = MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = v4;
  else
    v6 = MEMORY[0x1E0C9AA60];
  v79[0] = v6;
  -[HUServiceDetailsItemManager nameAndIconSections](self, "nameAndIconSections");
  v7 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v7;
  if (v7)
    v8 = v7;
  else
    v8 = v5;
  v79[1] = v8;
  -[HUServiceDetailsItemManager characteristicSections](self, "characteristicSections");
  v9 = objc_claimAutoreleasedReturnValue();
  v73 = (void *)v9;
  if (v9)
    v10 = v9;
  else
    v10 = v5;
  v79[2] = v10;
  -[HUServiceDetailsItemManager containedAccessoriesSections](self, "containedAccessoriesSections");
  v11 = objc_claimAutoreleasedReturnValue();
  v72 = (void *)v11;
  if (v11)
    v12 = v11;
  else
    v12 = v5;
  v79[3] = v12;
  -[HUServiceDetailsItemManager homeKitAccessorySettingsSections](self, "homeKitAccessorySettingsSections");
  v13 = objc_claimAutoreleasedReturnValue();
  v71 = (void *)v13;
  if (v13)
    v14 = v13;
  else
    v14 = v5;
  v79[4] = v14;
  -[HUServiceDetailsItemManager accessorySettingsSections](self, "accessorySettingsSections");
  v15 = objc_claimAutoreleasedReturnValue();
  v70 = (void *)v15;
  if (v15)
    v16 = v15;
  else
    v16 = v5;
  v79[5] = v16;
  -[HUServiceDetailsItemManager relatedTriggerSections](self, "relatedTriggerSections");
  v17 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v17;
  if (v17)
    v18 = v17;
  else
    v18 = v5;
  v79[6] = v18;
  -[HUServiceDetailsItemManager programmableSwitchSections](self, "programmableSwitchSections");
  v19 = objc_claimAutoreleasedReturnValue();
  v68 = (void *)v19;
  if (v19)
    v20 = v19;
  else
    v20 = v5;
  v79[7] = v20;
  -[HUServiceDetailsItemManager softwareUpdateSections](self, "softwareUpdateSections");
  v21 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)v21;
  if (v21)
    v22 = v21;
  else
    v22 = v5;
  v79[8] = v22;
  -[HUServiceDetailsItemManager valveEditorSections](self, "valveEditorSections");
  v23 = objc_claimAutoreleasedReturnValue();
  v66 = (void *)v23;
  if (v23)
    v24 = v23;
  else
    v24 = v5;
  v79[9] = v24;
  -[HUServiceDetailsItemManager sceneAndTriggerSections](self, "sceneAndTriggerSections");
  v25 = objc_claimAutoreleasedReturnValue();
  v65 = (void *)v25;
  if (v25)
    v26 = v25;
  else
    v26 = v5;
  v79[10] = v26;
  -[HUServiceDetailsItemManager connectedServicesSections](self, "connectedServicesSections");
  v27 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v27;
  if (v27)
    v28 = v27;
  else
    v28 = v5;
  v79[11] = v28;
  -[HUServiceDetailsItemManager inputSourceEditorSections](self, "inputSourceEditorSections");
  v29 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)v29;
  if (v29)
    v30 = v29;
  else
    v30 = v5;
  v79[12] = v30;
  -[HUServiceDetailsItemManager televisionSettingsSections](self, "televisionSettingsSections");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  if (v31)
    v33 = v31;
  else
    v33 = v5;
  v79[13] = v33;
  -[HUServiceDetailsItemManager advancedCameraSettingsSection](self, "advancedCameraSettingsSection");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (v34)
    v36 = v34;
  else
    v36 = v5;
  v79[14] = v36;
  -[HUServiceDetailsItemManager cameraActivityZonesSections](self, "cameraActivityZonesSections");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (v37)
    v39 = v37;
  else
    v39 = v5;
  v79[15] = v39;
  -[HUServiceDetailsItemManager cameraStatusLightSections](self, "cameraStatusLightSections");
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v40;
  if (v40)
    v42 = v40;
  else
    v42 = v5;
  v79[16] = v42;
  -[HUServiceDetailsItemManager cameraNightModeSections](self, "cameraNightModeSections");
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v43;
  if (v43)
    v45 = v43;
  else
    v45 = v5;
  v79[17] = v45;
  -[HUServiceDetailsItemManager doorbellMuteSections](self, "doorbellMuteSections");
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v46;
  if (v46)
    v48 = v46;
  else
    v48 = v5;
  v79[18] = v48;
  -[HUServiceDetailsItemManager collectDiagnosticsSections](self, "collectDiagnosticsSections");
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v49;
  if (v49)
    v51 = v49;
  else
    v51 = v5;
  v79[19] = v51;
  -[HUServiceDetailsItemManager lockAddHomeKeyToWalletSections](self, "lockAddHomeKeyToWalletSections");
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v52;
  if (v52)
    v54 = v52;
  else
    v54 = v5;
  v79[20] = v54;
  -[HUServiceDetailsItemManager homeTheaterAudioSections](self, "homeTheaterAudioSections");
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = (void *)v55;
  if (v55)
    v57 = v55;
  else
    v57 = v5;
  v79[21] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 22);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "na_arrayByFlattening");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __67__HUServiceDetailsItemManager__characteristicSectionForIdentifier___block_invoke;
  v77[3] = &unk_1E6F56038;
  v78 = v76;
  v59 = v76;
  objc_msgSend(v62, "na_firstObjectPassingTest:", v77);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  return v60;
}

uint64_t __67__HUServiceDetailsItemManager__characteristicSectionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)_shouldShowFirmwareUpdateSection
{
  void *v2;
  void *v3;
  char v4;

  -[HUServiceDetailsItemManager firmwareUpdateItemProvider](self, "firmwareUpdateItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_332);

  return v4;
}

uint64_t __63__HUServiceDetailsItemManager__shouldShowFirmwareUpdateSection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue") ^ 1;

  return v4;
}

- (BOOL)_shouldShowLinkedApplicationSection
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  char v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[HUServiceDetailsItemManager _shouldShowFirmwareUpdateSection](self, "_shouldShowFirmwareUpdateSection"))
    return 0;
  -[HFItemManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_currentUserIsRestrictedGuest");

  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[HFItemManager home](self, "home");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentUser");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hf_prettyDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[HUServiceDetailsItemManager _shouldShowLinkedApplicationSection]";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) Hiding linked application section because current user is a restricted guest: %@", (uint8_t *)&v13, 0x16u);

    }
    return 0;
  }
  -[HUServiceDetailsItemManager linkedApplicationItemProvider](self, "linkedApplicationItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "na_any:", &__block_literal_global_333);

  return v12;
}

uint64_t __66__HUServiceDetailsItemManager__shouldShowLinkedApplicationSection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue") ^ 1;

  return v4;
}

- (BOOL)_isGroupedHomePod
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;

  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC600))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_opt_class();
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (unint64_t)objc_msgSend(v5, "numberOfItemsContainedWithinGroup") >= 2
    && objc_msgSend(v5, "isItemGroup")
    && -[HUServiceDetailsItemManager _isRestartSupportedForGroupedHomePod:](self, "_isRestartSupportedForGroupedHomePod:", v8);

  return v9;
}

- (BOOL)_isSingleHomePodInGroup
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char v10;

  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC600))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_opt_class();
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = objc_msgSend(v5, "numberOfItemsContainedWithinGroup");
  if (v9 == 1)
    v10 = objc_msgSend(v8, "isContainedWithinItemGroup");
  else
    v10 = 0;

  return v10;
}

- (BOOL)_isRestartSupportedForGroupedHomePod:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_334);
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    v9 = 136315394;
    v10 = "-[HUServiceDetailsItemManager _isRestartSupportedForGroupedHomePod:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%s Restart Option Supported for Grouped HomePod %@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

uint64_t __68__HUServiceDetailsItemManager__isRestartSupportedForGroupedHomePod___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsCompanionInitiatedRestart");
}

- (BOOL)_areHomePodMediaAccountsMismatched
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[HUServiceDetailsItemManager sourceItemIsHomePod](self, "sourceItemIsHomePod"))
  {
    -[HUServiceDetailsItemManager loggedInMediaAccountOnHomePod](self, "loggedInMediaAccountOnHomePod");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[HUServiceDetailsItemManager homeMediaAccount](self, "homeMediaAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "HomePod logged in account = [%@], appleMusicAccountForCurrentHome = [%@]", (uint8_t *)&v12, 0x16u);
    }

    if (v3)
    {
      objc_msgSend(v3, "ams_altDSID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ams_altDSID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9) ^ 1;

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)_hasDismissedHomePodHasNonMemberMediaAccountWarning
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  objc_opt_class();
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hf_settingsValueManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForSettingAtKeyPath:", *MEMORY[0x1E0D30678]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (ACAccount)loggedInMediaAccountOnHomePod
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (-[HUServiceDetailsItemManager sourceItemIsHomePod](self, "sourceItemIsHomePod"))
  {
    objc_opt_class();
    -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    objc_msgSend(v5, "mediaProfileContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "hf_appleMusicCurrentLoggedInAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (ACAccount *)v7;
}

- (BOOL)shouldShowDeviceOptionsForAccessoryItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  char v11;
  char v13;
  _BOOL4 v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
      v8 = "%s mediaAccessoryItem is NIL, hence NOT showing Reset HomePod";
      goto LABEL_16;
    }
LABEL_17:
    LOBYTE(v6) = 0;
    goto LABEL_18;
  }
  objc_msgSend(v4, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (-[HUServiceDetailsItemManager isItemGroup](self, "isItemGroup"))
    {
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315138;
        v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
        v8 = "%s HomePod is a Grouped item part of Stereo Setup or PSG, hence NOT showing Reset HomePod";
LABEL_16:
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0xCu);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    objc_msgSend(v5, "mediaProfileContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_backingAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "supportsCompanionInitiatedRestart");

    if ((v11 & 1) == 0)
    {
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315138;
        v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
        v8 = "%s HomePod doesn't support restart functionality, hence NOT showing Reset HomePod";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    if (objc_msgSend(v5, "isHomePodMediaSystem"))
    {
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315138;
        v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
        v8 = "%s HomePod is part of Stereo Setup, hence NOT showing Reset HomePod";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    v13 = objc_msgSend(v5, "isHomePod");
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((v13 & 1) == 0)
    {
      if (!v14)
        goto LABEL_17;
      v15 = 136315138;
      v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
      v8 = "%s Accessory is not of type HomePod, hence NOT showing Reset HomePod";
      goto LABEL_16;
    }
    if (v14)
    {
      v15 = 136315138;
      v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%s All set, show Reset HomePod", (uint8_t *)&v15, 0xCu);
    }
    LOBYTE(v6) = 1;
  }
  else
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
      v8 = "%s mediaProfileContainer is NIL, hence NOT showing Reset HomePod";
      goto LABEL_16;
    }
  }
LABEL_18:

  return (char)v6;
}

- (BOOL)shouldShowExportDiagnosticsItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  char v9;
  _BOOL4 v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:]";
      v8 = "%s mediaAccessoryItem is NIL, hence NOT showing Export Diagnostics";
      goto LABEL_19;
    }
LABEL_20:
    LOBYTE(v6) = 0;
    goto LABEL_21;
  }
  objc_msgSend(v4, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (-[HUServiceDetailsItemManager isItemGroup](self, "isItemGroup"))
    {
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315138;
        v13 = "-[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:]";
        v8 = "%s HomePod is a Grouped item part of Stereo Setup or PSG, hence NOT showing Export Diagnostics";
LABEL_19:
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0xCu);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    if (objc_msgSend(v5, "isHomePodMediaSystem"))
    {
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315138;
        v13 = "-[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:]";
        v8 = "%s HomePod is part of Stereo Setup, hence NOT showing Export Diagnostics";
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    v9 = objc_msgSend(v5, "isHomePod");
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((v9 & 1) == 0)
    {
      if (v10)
      {
        v12 = 136315138;
        v13 = "-[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:]";
        v8 = "%s Accessory is not of type HomePod, hence NOT showing Export Diagnostics";
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (v10)
    {
      v12 = 136315138;
      v13 = "-[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:]";
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%s All set, show Export Diagnostics", (uint8_t *)&v12, 0xCu);
    }
    LOBYTE(v6) = 1;
  }
  else
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:]";
      v8 = "%s mediaProfileContainer is NIL, hence NOT showing Export Diagnostics";
      goto LABEL_19;
    }
  }
LABEL_21:

  return (char)v6;
}

- (id)hf_MediaAccessoryItem
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)_setupDeviceOptionsAdapterForMediaAccessoryItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "mediaProfileContainer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_settingsAdapterManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adapterForIdentifier:", *MEMORY[0x1E0D30128]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager setDeviceOptionsAdapter:](self, "setDeviceOptionsAdapter:", v5);

}

- (void)registerKVO
{
  id v3;

  -[HUServiceDetailsItemManager deviceOptionsAdapter](self, "deviceOptionsAdapter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("isAccessoryReachableOverRapport"), 1, 0);

}

- (void)unregisterKVO
{
  void *v3;

  -[HUServiceDetailsItemManager deviceOptionsAdapter](self, "deviceOptionsAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("isAccessoryReachableOverRapport"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  SEL v48;
  uint64_t v49;
  void *v50;
  objc_super v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v11, "isEqualToString:", CFSTR("isAccessoryReachableOverRapport")))
  {
    v48 = a2;
    v14 = (void *)objc_opt_new();
    -[HUServiceDetailsItemManager accessoryResetAndRemoveItemProvider](self, "accessoryResetAndRemoveItemProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HUServiceDetailsItemManager accessoryResetAndRemoveItemProvider](self, "accessoryResetAndRemoveItemProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v16);

    }
    -[HUServiceDetailsItemManager exportDiagnosticsItemProvider](self, "exportDiagnosticsItemProvider", v48);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[HUServiceDetailsItemManager exportDiagnosticsItemProvider](self, "exportDiagnosticsItemProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v18);

    }
    v50 = v14;
    -[HUServiceDetailsItemManager hf_MediaAccessoryItem](self, "hf_MediaAccessoryItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsItemManager deviceOptionsAdapter](self, "deviceOptionsAdapter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isAccessoryReachableOverRapport");

    HFLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        objc_msgSend(v19, "mediaProfileContainer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "uniqueIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "UUIDString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v26;
        _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "Solo Accessory is reachable over Rapport..%@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0D31518], "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "mediaProfileContainer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hf_backingAccessory");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "uniqueIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "UUIDString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "markUUIDReachableViaRapport:", v31);

      objc_msgSend(MEMORY[0x1E0D31518], "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "mediaProfileContainer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "hf_backingAccessory");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "uniqueIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "UUIDString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v32;
      v38 = 3;
    }
    else
    {
      if (v23)
      {
        objc_msgSend(v19, "mediaProfileContainer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "uniqueIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "UUIDString");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v41;
        _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "Solo Accessory is NOT reachable over Rapport..%@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0D31518], "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "mediaProfileContainer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "hf_backingAccessory");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "uniqueIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "UUIDString");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "markUUIDUnreachableViaRapport:", v46);

      objc_msgSend(MEMORY[0x1E0D31518], "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "mediaProfileContainer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "hf_backingAccessory");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "uniqueIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "UUIDString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v32;
      v38 = 2;
    }
    objc_msgSend(v37, "updateHomePodAccessoryRestartState:with:", v38, v36);

    if (v50)
      v47 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v50, v49);

  }
  else
  {
    v51.receiver = self;
    v51.super_class = (Class)HUServiceDetailsItemManager;
    -[HUServiceDetailsItemManager observeValueForKeyPath:ofObject:change:context:](&v51, sel_observeValueForKeyPath_ofObject_change_context_, v11, v12, v13, a6);
  }

}

- (void)restartAccessory
{
  id v2;

  v2 = -[HUServiceDetailsItemManager _restartAccessory](self, "_restartAccessory");
}

- (id)_restartAccessory
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  void *v20;
  HUServiceDetailsItemManager *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  void *v25;
  HUServiceDetailsItemManager *v26;
  uint8_t buf[16];

  v3 = -[HUServiceDetailsItemManager _isGroupedHomePod](self, "_isGroupedHomePod");
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Sending restart message to solo homepod accessory", buf, 2u);
    }

    -[HUServiceDetailsItemManager deviceOptionsAdapter](self, "deviceOptionsAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HUServiceDetailsItemManager deviceOptionsAdapter](self, "deviceOptionsAdapter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "restartAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __48__HUServiceDetailsItemManager__restartAccessory__block_invoke_346;
      v20 = &unk_1E6F4C610;
      v21 = self;
      v10 = &v17;
      goto LABEL_10;
    }
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "deviceOptionsAdapter is nil";
      goto LABEL_17;
    }
LABEL_14:

    v15 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "futureWithError:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Sending restart message to grouped homepod accessory", buf, 2u);
  }

  -[HUServiceDetailsItemManager deviceOptionsAdapterUtility](self, "deviceOptionsAdapterUtility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "deviceOptionsAdapterUtility is nil";
LABEL_17:
      _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  -[HUServiceDetailsItemManager deviceOptionsAdapterUtility](self, "deviceOptionsAdapterUtility");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "restartAccessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __48__HUServiceDetailsItemManager__restartAccessory__block_invoke;
  v25 = &unk_1E6F4C610;
  v26 = self;
  v10 = &v22;
LABEL_10:
  objc_msgSend(v8, "addCompletionBlock:", v10, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v12;
}

void __48__HUServiceDetailsItemManager__restartAccessory__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[8];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Error sending restart message to group accessory", buf, 2u);
    }

    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "sourceServiceItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v7, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D31518], "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "uniqueIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "UUIDString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "updateHomePodAccessoryRestartState:with:", 3, v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v10);
    }
  }
  else
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "sourceServiceItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v7 = v18;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v7, "accessories", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v8);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0D31518], "sharedInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "uniqueIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUIDString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "updateHomePodAccessoryRestartState:with:", 1, v26);

        }
        v20 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v20);
    }
  }

}

void __48__HUServiceDetailsItemManager__restartAccessory__block_invoke_346(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  if (a3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Error sending restart message to accessory", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "hf_MediaAccessoryItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31518], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaProfileContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_backingAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateHomePodAccessoryRestartState:with:", 3, v10);

    v11 = (id)objc_msgSend(v5, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_MediaAccessoryItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31518], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaProfileContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_backingAccessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateHomePodAccessoryRestartState:with:", 1, v16);

    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "Successfully sent restart message to accessory", v18, 2u);
    }

  }
}

- (void)resetAccessory
{
  id v2;

  v2 = -[HUServiceDetailsItemManager _resetAccessory](self, "_resetAccessory");
}

- (id)_resetAccessory
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  if (-[HUServiceDetailsItemManager _isGroupedHomePod](self, "_isGroupedHomePod"))
    NSLog(CFSTR("Sending obliterate message to grouped homepod accessory is not allowed!"));
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Sending obliterate message to solo HomePod", buf, 2u);
  }

  -[HUServiceDetailsItemManager deviceOptionsAdapter](self, "deviceOptionsAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUServiceDetailsItemManager deviceOptionsAdapter](self, "deviceOptionsAdapter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addCompletionBlock:", &__block_literal_global_349);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "deviceOptionsAdapter is nil", v11, 2u);
    }

    v9 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithError:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __46__HUServiceDetailsItemManager__resetAccessory__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Error sending obliterate message: %@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(v6, "setObject:forKey:", v5, *MEMORY[0x1E0D30398]);
  }
  else
  {
    if (v8)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Successfully sent obliterate message", (uint8_t *)&v17, 2u);
    }

    objc_opt_class();
    v9 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_opt_class();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
      objc_msgSend(v6, "setObject:forKey:", v14, *MEMORY[0x1E0D303A0]);

  }
  v15 = (void *)MEMORY[0x1E0D31170];
  v16 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v15, "sendEvent:withData:", 56, v16);

}

- (void)_setupDeviceOptionsAdapterUtilityForGroupedAccessories:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0D310E8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "mediaProfileContainer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "initWithHomeKitSettingsVendor:mode:groupedAccessory:delegate:", v8, 0, 1, self);
  -[HUServiceDetailsItemManager setDeviceOptionsAdapterUtility:](self, "setDeviceOptionsAdapterUtility:", v7);

}

- (void)accessoryReachableOverRapport:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[5];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v3 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 136315394;
    v41 = "-[HUServiceDetailsItemManager accessoryReachableOverRapport:]";
    v42 = 2112;
    v43 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%s HomePod Stereo Setup Restart Button Available %@", buf, 0x16u);
  }

  -[HUServiceDetailsItemManager setGroupedAccessoryReachableOverRapport:](self, "setGroupedAccessoryReachableOverRapport:", v3);
  v8 = (void *)objc_opt_new();
  -[HUServiceDetailsItemManager accessoryResetAndRemoveItemProvider](self, "accessoryResetAndRemoveItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUServiceDetailsItemManager accessoryResetAndRemoveItemProvider](self, "accessoryResetAndRemoveItemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  -[HUServiceDetailsItemManager exportDiagnosticsItemProvider](self, "exportDiagnosticsItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HUServiceDetailsItemManager exportDiagnosticsItemProvider](self, "exportDiagnosticsItemProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  -[HUServiceDetailsItemManager hf_MediaAccessoryItem](self, "hf_MediaAccessoryItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUServiceDetailsItemManager _isGroupedHomePod](self, "_isGroupedHomePod"))
  {
    v14 = -[HUServiceDetailsItemManager groupedAccessoryReachableOverRapport](self, "groupedAccessoryReachableOverRapport");
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        objc_msgSend(v13, "mediaProfileContainer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUIDString");
        v19 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v41 = v19;
        _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Grouped Accessory is reachable over Rapport..%@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0D31518], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaProfileContainer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "uniqueIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "markUUIDReachableViaRapport:", v23);

      objc_msgSend(MEMORY[0x1E0D31518], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaProfileContainer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uniqueIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v24;
      v29 = 3;
    }
    else
    {
      if (v16)
      {
        objc_msgSend(v13, "mediaProfileContainer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "uniqueIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "UUIDString");
        v32 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v41 = v32;
        _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Grouped Accessory is NOT reachable over Rapport..%@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0D31518], "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaProfileContainer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "uniqueIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "UUIDString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "markUUIDUnreachableViaRapport:", v36);

      objc_msgSend(MEMORY[0x1E0D31518], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaProfileContainer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uniqueIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v24;
      v29 = 2;
    }
    objc_msgSend(v28, "updateHomePodAccessoryRestartState:with:", v29, v27);

  }
  if (v8)
  {
    -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v8, a2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __61__HUServiceDetailsItemManager_accessoryReachableOverRapport___block_invoke;
    v39[3] = &unk_1E6F52828;
    v39[4] = self;
    v38 = (id)objc_msgSend(v37, "addCompletionBlock:", v39);

  }
}

void __61__HUServiceDetailsItemManager_accessoryReachableOverRapport___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sourceItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "updateWithOptions:", MEMORY[0x1E0C9AA70]);

}

- (BOOL)_shouldShowAccessoryInfoItems
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_8;
  if (-[HUServiceDetailsItemManager isAccessory](self, "isAccessory"))
  {
    isKindOfClass = 1;
    return isKindOfClass & 1;
  }
  if (!-[HUServiceDetailsItemManager sourceItemIsService](self, "sourceItemIsService"))
  {
LABEL_8:
    isKindOfClass = 0;
    return isKindOfClass & 1;
  }
  -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hf_isMultiServiceAccessory"))
  {
    -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hf_showAsIndividualServices") & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      -[HUServiceDetailsItemManager sourceItemAccessory](self, "sourceItemAccessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hf_canShowAsIndividualServices"))
      {
        -[HFItemManager sourceItem](self, "sourceItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

      }
      else
      {
        isKindOfClass = 1;
      }

    }
  }
  else
  {
    isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

- (BOOL)_shouldShowSplitAccountUI
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  NSObject *v13;
  BOOL v14;
  _BOOL4 v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HUServiceDetailsItemManager sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  -[HUServiceDetailsItemManager homeMediaAccount](self, "homeMediaAccount");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v5, "mediaProfileContainer"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "hf_homePodIsCapableOfShowingSplitAccountError"),
        v8,
        v7,
        v9))
  {
    objc_msgSend(v5, "mediaProfileContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hf_supportsPreferredMediaUser");

  }
  else
  {
    v11 = 1;
  }
  v12 = -[HUServiceDetailsItemManager _hasDismissedHomePodHasNonMemberMediaAccountWarning](self, "_hasDismissedHomePodHasNonMemberMediaAccountWarning");
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    -[HUServiceDetailsItemManager homeMediaAccount](self, "homeMediaAccount");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = CFSTR("NO");
    if (v12)
      v22 = CFSTR("YES");
    v24 = 138412546;
    v25 = v20;
    v26 = 2112;
    v27 = v22;
    _os_log_debug_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEBUG, "Home Media Account = [%@], hasDismissedHomePodHasNonMemberMediaAccountWarning = [%@]", (uint8_t *)&v24, 0x16u);

  }
  if (((v11 | v12) & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    v15 = -[HUServiceDetailsItemManager sourceItemIsHomePodConfiguredForMultiUser](self, "sourceItemIsHomePodConfiguredForMultiUser");
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v24 = 67109120;
      LODWORD(v25) = v15;
      _os_log_debug_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEBUG, "Accessory IS HomePod and Supports MU = %d", (uint8_t *)&v24, 8u);
    }

    v17 = -[HUServiceDetailsItemManager _areHomePodMediaAccountsMismatched](self, "_areHomePodMediaAccountsMismatched");
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v23 = CFSTR("NO");
      if (v17)
        v23 = CFSTR("YES");
      v24 = 138412290;
      v25 = (uint64_t)v23;
      _os_log_debug_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEBUG, "Media Accounts Mismatched = [%@]", (uint8_t *)&v24, 0xCu);
    }

    v14 = v15 && v17;
  }

  return v14;
}

- (id)_itemsToUpdateWhenApplicationDidBecomeActive
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUServiceDetailsItemManager lockAddHomeKeyToWalletItem](self, "lockAddHomeKeyToWalletItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_itemsToUpdateForDiagnosticInfoUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HUServiceDetailsItemManager headerItem](self, "headerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemManager accessoryInfoItemProvider](self, "accessoryInfoItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_setByFlattening");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_shouldHideHomePodAnalyticsAndImprovementsSettings
{
  return 0;
}

- (BOOL)_shouldShowContainedAccessoriesList
{
  return 0;
}

- (HFItemBuilderItem)builderItem
{
  return self->_builderItem;
}

- (HFServiceLikeBuilder)serviceLikeBuilder
{
  return self->_serviceLikeBuilder;
}

- (void)setServiceLikeBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLikeBuilder, a3);
}

- (HFItemProvider)existingRoomItemProvider
{
  return self->_existingRoomItemProvider;
}

- (void)setExistingRoomItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_existingRoomItemProvider, a3);
}

- (HFItemProvider)suggestedRoomItemProvider
{
  return self->_suggestedRoomItemProvider;
}

- (void)setSuggestedRoomItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedRoomItemProvider, a3);
}

- (HFSelectedRoomItemProvider)selectedRoomItemProvider
{
  return self->_selectedRoomItemProvider;
}

- (void)setSelectedRoomItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRoomItemProvider, a3);
}

- (HFAccessoryInfoDetailsItemProvider)accessoryInfoItemProvider
{
  return self->_accessoryInfoItemProvider;
}

- (void)setAccessoryInfoItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryInfoItemProvider, a3);
}

- (HUNameItemModule)nameModule
{
  return self->_nameModule;
}

- (void)setNameModule:(id)a3
{
  objc_storeStrong((id *)&self->_nameModule, a3);
}

- (HUAccessoryRepresentableItemModule)accessoryRepresentableItemModule
{
  return self->_accessoryRepresentableItemModule;
}

- (void)setAccessoryRepresentableItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryRepresentableItemModule, a3);
}

- (HUAccessorySettingsItemModule)accessorySettingsItemModule
{
  return self->_accessorySettingsItemModule;
}

- (void)setAccessorySettingsItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsItemModule, a3);
}

- (HUSoftwareUpdateItemModule)softwareUpdateItemModule
{
  return self->_softwareUpdateItemModule;
}

- (void)setSoftwareUpdateItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateItemModule, a3);
}

- (HUAvailableRelatedTriggerItemModule)relatedTriggerItemModule
{
  return self->_relatedTriggerItemModule;
}

- (void)setRelatedTriggerItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_relatedTriggerItemModule, a3);
}

- (HFRemoteControlItemModule)serviceDetailsRemoteControlItemModule
{
  return self->_serviceDetailsRemoteControlItemModule;
}

- (HUTelevisionSettingsItemModule)televisionSettingsItemModule
{
  return self->_televisionSettingsItemModule;
}

- (void)setTelevisionSettingsItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_televisionSettingsItemModule, a3);
}

- (HUInputSourceItemModule)inputSourceItemModule
{
  return self->_inputSourceItemModule;
}

- (void)setInputSourceItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_inputSourceItemModule, a3);
}

- (HUValveItemModule)valveEditorItemModule
{
  return self->_valveEditorItemModule;
}

- (void)setValveEditorItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_valveEditorItemModule, a3);
}

- (HUAccessoryServicesItemModule)accessoryServicesEditorItemModule
{
  return self->_accessoryServicesEditorItemModule;
}

- (HUAssociatedSceneAndTriggerModule)sceneAndTriggerModule
{
  return self->_sceneAndTriggerModule;
}

- (HUMatterConnectedServicesItemModule)connectedServicesItemModule
{
  return self->_connectedServicesItemModule;
}

- (HUAccessoryDebugModule)debugAccessoryItemModule
{
  return self->_debugAccessoryItemModule;
}

- (HFItem)selectedRoomItem
{
  return self->_selectedRoomItem;
}

- (HFItem)headerItem
{
  return self->_headerItem;
}

- (void)setHeaderItem:(id)a3
{
  objc_storeStrong((id *)&self->_headerItem, a3);
}

- (HFItem)splitMediaAccountTitleItem
{
  return self->_splitMediaAccountTitleItem;
}

- (void)setSplitMediaAccountTitleItem:(id)a3
{
  objc_storeStrong((id *)&self->_splitMediaAccountTitleItem, a3);
}

- (HFItem)splitMediaAccountUseDefaultAccountItem
{
  return self->_splitMediaAccountUseDefaultAccountItem;
}

- (void)setSplitMediaAccountUseDefaultAccountItem:(id)a3
{
  objc_storeStrong((id *)&self->_splitMediaAccountUseDefaultAccountItem, a3);
}

- (HFItem)splitMediaAccountSignoutAccountItem
{
  return self->_splitMediaAccountSignoutAccountItem;
}

- (void)setSplitMediaAccountSignoutAccountItem:(id)a3
{
  objc_storeStrong((id *)&self->_splitMediaAccountSignoutAccountItem, a3);
}

- (HFItem)createNewRoomItem
{
  return self->_createNewRoomItem;
}

- (void)setCreateNewRoomItem:(id)a3
{
  objc_storeStrong((id *)&self->_createNewRoomItem, a3);
}

- (HFItem)roomListItem
{
  return self->_roomListItem;
}

- (void)setRoomListItem:(id)a3
{
  objc_storeStrong((id *)&self->_roomListItem, a3);
}

- (HFItem)addGroupItem
{
  return self->_addGroupItem;
}

- (void)setAddGroupItem:(id)a3
{
  objc_storeStrong((id *)&self->_addGroupItem, a3);
}

- (HFItem)identifyHomePodItem
{
  return self->_identifyHomePodItem;
}

- (void)setIdentifyHomePodItem:(id)a3
{
  objc_storeStrong((id *)&self->_identifyHomePodItem, a3);
}

- (HFItem)showContainedItems
{
  return self->_showContainedItems;
}

- (void)setShowContainedItems:(id)a3
{
  objc_storeStrong((id *)&self->_showContainedItems, a3);
}

- (HFItem)roomItem
{
  return self->_roomItem;
}

- (void)setRoomItem:(id)a3
{
  objc_storeStrong((id *)&self->_roomItem, a3);
}

- (HFItem)associatedServiceTypeItem
{
  return self->_associatedServiceTypeItem;
}

- (void)setAssociatedServiceTypeItem:(id)a3
{
  objc_storeStrong((id *)&self->_associatedServiceTypeItem, a3);
}

- (HFItem)favoriteItem
{
  return self->_favoriteItem;
}

- (void)setFavoriteItem:(id)a3
{
  objc_storeStrong((id *)&self->_favoriteItem, a3);
}

- (HFItem)showInHomeDashboardItem
{
  return self->_showInHomeDashboardItem;
}

- (void)setShowInHomeDashboardItem:(id)a3
{
  objc_storeStrong((id *)&self->_showInHomeDashboardItem, a3);
}

- (HFItem)alarmItem
{
  return self->_alarmItem;
}

- (void)setAlarmItem:(id)a3
{
  objc_storeStrong((id *)&self->_alarmItem, a3);
}

- (HFItem)statusAndNotificationItem
{
  return self->_statusAndNotificationItem;
}

- (void)setStatusAndNotificationItem:(id)a3
{
  objc_storeStrong((id *)&self->_statusAndNotificationItem, a3);
}

- (HFItem)separateTileItem
{
  return self->_separateTileItem;
}

- (void)setSeparateTileItem:(id)a3
{
  objc_storeStrong((id *)&self->_separateTileItem, a3);
}

- (HFItem)homeTheaterAudioOutputItem
{
  return self->_homeTheaterAudioOutputItem;
}

- (void)setHomeTheaterAudioOutputItem:(id)a3
{
  objc_storeStrong((id *)&self->_homeTheaterAudioOutputItem, a3);
}

- (HFItem)managedConfigurationProfilesItem
{
  return self->_managedConfigurationProfilesItem;
}

- (void)setManagedConfigurationProfilesItem:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfigurationProfilesItem, a3);
}

- (NSArray)homeKitAccessorySettingsModules
{
  return self->_homeKitAccessorySettingsModules;
}

- (void)setHomeKitAccessorySettingsModules:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitAccessorySettingsModules, a3);
}

- (NSArray)supportedVoiceRecognitionLanguages
{
  return self->_supportedVoiceRecognitionLanguages;
}

- (void)setSupportedVoiceRecognitionLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, a3);
}

- (ACAccount)homeMediaAccount
{
  return self->_homeMediaAccount;
}

- (void)setHomeMediaAccount:(id)a3
{
  objc_storeStrong((id *)&self->_homeMediaAccount, a3);
}

- (HFItem)pairingModeItem
{
  return self->_pairingModeItem;
}

- (void)setPairingModeItem:(id)a3
{
  objc_storeStrong((id *)&self->_pairingModeItem, a3);
}

- (HFItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeItem, a3);
}

- (HFItem)removeFromGroupItem
{
  return self->_removeFromGroupItem;
}

- (void)setRemoveFromGroupItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeFromGroupItem, a3);
}

- (HFItem)primaryUserItem
{
  return self->_primaryUserItem;
}

- (HFItem)resetItem
{
  return self->_resetItem;
}

- (void)setResetItem:(id)a3
{
  objc_storeStrong((id *)&self->_resetItem, a3);
}

- (HFItem)accessoryItem
{
  return self->_accessoryItem;
}

- (void)setAccessoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryItem, a3);
}

- (HFItem)audioSettingsItem
{
  return self->_audioSettingsItem;
}

- (void)setAudioSettingsItem:(id)a3
{
  objc_storeStrong((id *)&self->_audioSettingsItem, a3);
}

- (HFItem)cameraActivityZonesItem
{
  return self->_cameraActivityZonesItem;
}

- (void)setCameraActivityZonesItem:(id)a3
{
  objc_storeStrong((id *)&self->_cameraActivityZonesItem, a3);
}

- (HUServiceDetailsCameraStatusLightItem)cameraStatusLightItem
{
  return self->_cameraStatusLightItem;
}

- (void)setCameraStatusLightItem:(id)a3
{
  objc_storeStrong((id *)&self->_cameraStatusLightItem, a3);
}

- (HUServiceDetailsCameraNightModeItem)cameraNightModeItem
{
  return self->_cameraNightModeItem;
}

- (void)setCameraNightModeItem:(id)a3
{
  objc_storeStrong((id *)&self->_cameraNightModeItem, a3);
}

- (HFItem)cameraRecordingOptionsItem
{
  return self->_cameraRecordingOptionsItem;
}

- (void)setCameraRecordingOptionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_cameraRecordingOptionsItem, a3);
}

- (HFItem)cameraFaceRecognitionItem
{
  return self->_cameraFaceRecognitionItem;
}

- (void)setCameraFaceRecognitionItem:(id)a3
{
  objc_storeStrong((id *)&self->_cameraFaceRecognitionItem, a3);
}

- (HFItem)cameraDoorbellChimeMuteItem
{
  return self->_cameraDoorbellChimeMuteItem;
}

- (void)setCameraDoorbellChimeMuteItem:(id)a3
{
  objc_storeStrong((id *)&self->_cameraDoorbellChimeMuteItem, a3);
}

- (HFItem)collectDiagnosticsItem
{
  return self->_collectDiagnosticsItem;
}

- (void)setCollectDiagnosticsItem:(id)a3
{
  objc_storeStrong((id *)&self->_collectDiagnosticsItem, a3);
}

- (HFItem)internalDebuggingItem
{
  return self->_internalDebuggingItem;
}

- (void)setInternalDebuggingItem:(id)a3
{
  objc_storeStrong((id *)&self->_internalDebuggingItem, a3);
}

- (HFItem)exportDiagnosticsItem
{
  return self->_exportDiagnosticsItem;
}

- (void)setExportDiagnosticsItem:(id)a3
{
  objc_storeStrong((id *)&self->_exportDiagnosticsItem, a3);
}

- (HFItem)restartItem
{
  return self->_restartItem;
}

- (void)setRestartItem:(id)a3
{
  objc_storeStrong((id *)&self->_restartItem, a3);
}

- (BOOL)shouldHideAccessoryItem
{
  return self->_shouldHideAccessoryItem;
}

- (BOOL)shouldHideSeparateTileItem
{
  return self->_shouldHideSeparateTileItem;
}

- (void)setShouldHideSeparateTileItem:(BOOL)a3
{
  self->_shouldHideSeparateTileItem = a3;
}

- (BOOL)showRoomsList
{
  return self->_showRoomsList;
}

- (BOOL)showAssociatedServiceTypeList
{
  return self->_showAssociatedServiceTypeList;
}

- (HFItem)lockPinCodesItem
{
  return self->_lockPinCodesItem;
}

- (void)setLockPinCodesItem:(id)a3
{
  objc_storeStrong((id *)&self->_lockPinCodesItem, a3);
}

- (HFItem)lockAddHomeKeyToWalletItem
{
  return self->_lockAddHomeKeyToWalletItem;
}

- (void)setLockAddHomeKeyToWalletItem:(id)a3
{
  objc_storeStrong((id *)&self->_lockAddHomeKeyToWalletItem, a3);
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HUServiceDetailsProgrammableSwitchItemModule)programmableSwitchItemModule
{
  return self->_programmableSwitchItemModule;
}

- (void)setProgrammableSwitchItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_programmableSwitchItemModule, a3);
}

- (HUServiceDetailsControlAndCharacteristicStateItemModule)serviceDetailsControlStateAndCharacteristicItemModule
{
  return self->_serviceDetailsControlStateAndCharacteristicItemModule;
}

- (void)setServiceDetailsControlStateAndCharacteristicItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDetailsControlStateAndCharacteristicItemModule, a3);
}

- (NSArray)splitMediaAccountSections
{
  return self->_splitMediaAccountSections;
}

- (void)setSplitMediaAccountSections:(id)a3
{
  objc_storeStrong((id *)&self->_splitMediaAccountSections, a3);
}

- (NSArray)nameAndIconSections
{
  return self->_nameAndIconSections;
}

- (void)setNameAndIconSections:(id)a3
{
  objc_storeStrong((id *)&self->_nameAndIconSections, a3);
}

- (NSArray)characteristicSections
{
  return self->_characteristicSections;
}

- (void)setCharacteristicSections:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicSections, a3);
}

- (NSArray)containedAccessoriesSections
{
  return self->_containedAccessoriesSections;
}

- (void)setContainedAccessoriesSections:(id)a3
{
  objc_storeStrong((id *)&self->_containedAccessoriesSections, a3);
}

- (NSArray)relatedTriggerSections
{
  return self->_relatedTriggerSections;
}

- (void)setRelatedTriggerSections:(id)a3
{
  objc_storeStrong((id *)&self->_relatedTriggerSections, a3);
}

- (NSArray)programmableSwitchSections
{
  return self->_programmableSwitchSections;
}

- (void)setProgrammableSwitchSections:(id)a3
{
  objc_storeStrong((id *)&self->_programmableSwitchSections, a3);
}

- (NSArray)accessorySettingsSections
{
  return self->_accessorySettingsSections;
}

- (void)setAccessorySettingsSections:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsSections, a3);
}

- (NSArray)homeKitAccessorySettingsSections
{
  return self->_homeKitAccessorySettingsSections;
}

- (void)setHomeKitAccessorySettingsSections:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitAccessorySettingsSections, a3);
}

- (NSArray)softwareUpdateSections
{
  return self->_softwareUpdateSections;
}

- (void)setSoftwareUpdateSections:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateSections, a3);
}

- (NSArray)valveEditorSections
{
  return self->_valveEditorSections;
}

- (void)setValveEditorSections:(id)a3
{
  objc_storeStrong((id *)&self->_valveEditorSections, a3);
}

- (NSArray)sceneAndTriggerSections
{
  return self->_sceneAndTriggerSections;
}

- (void)setSceneAndTriggerSections:(id)a3
{
  objc_storeStrong((id *)&self->_sceneAndTriggerSections, a3);
}

- (NSArray)connectedServicesSections
{
  return self->_connectedServicesSections;
}

- (void)setConnectedServicesSections:(id)a3
{
  objc_storeStrong((id *)&self->_connectedServicesSections, a3);
}

- (NSArray)inputSourceEditorSections
{
  return self->_inputSourceEditorSections;
}

- (void)setInputSourceEditorSections:(id)a3
{
  objc_storeStrong((id *)&self->_inputSourceEditorSections, a3);
}

- (NSArray)televisionSettingsSections
{
  return self->_televisionSettingsSections;
}

- (void)setTelevisionSettingsSections:(id)a3
{
  objc_storeStrong((id *)&self->_televisionSettingsSections, a3);
}

- (NSArray)advancedCameraSettingsSection
{
  return self->_advancedCameraSettingsSection;
}

- (void)setAdvancedCameraSettingsSection:(id)a3
{
  objc_storeStrong((id *)&self->_advancedCameraSettingsSection, a3);
}

- (NSArray)cameraStatusLightSections
{
  return self->_cameraStatusLightSections;
}

- (void)setCameraStatusLightSections:(id)a3
{
  objc_storeStrong((id *)&self->_cameraStatusLightSections, a3);
}

- (NSArray)cameraNightModeSections
{
  return self->_cameraNightModeSections;
}

- (void)setCameraNightModeSections:(id)a3
{
  objc_storeStrong((id *)&self->_cameraNightModeSections, a3);
}

- (NSArray)cameraActivityZonesSections
{
  return self->_cameraActivityZonesSections;
}

- (void)setCameraActivityZonesSections:(id)a3
{
  objc_storeStrong((id *)&self->_cameraActivityZonesSections, a3);
}

- (NSArray)doorbellMuteSections
{
  return self->_doorbellMuteSections;
}

- (void)setDoorbellMuteSections:(id)a3
{
  objc_storeStrong((id *)&self->_doorbellMuteSections, a3);
}

- (NSArray)collectDiagnosticsSections
{
  return self->_collectDiagnosticsSections;
}

- (void)setCollectDiagnosticsSections:(id)a3
{
  objc_storeStrong((id *)&self->_collectDiagnosticsSections, a3);
}

- (NSArray)lockAddHomeKeyToWalletSections
{
  return self->_lockAddHomeKeyToWalletSections;
}

- (void)setLockAddHomeKeyToWalletSections:(id)a3
{
  objc_storeStrong((id *)&self->_lockAddHomeKeyToWalletSections, a3);
}

- (NSArray)homeTheaterAudioSections
{
  return self->_homeTheaterAudioSections;
}

- (void)setHomeTheaterAudioSections:(id)a3
{
  objc_storeStrong((id *)&self->_homeTheaterAudioSections, a3);
}

- (HFAssociatedServiceTypeOptionItemProvider)associatedServiceTypeOptionItemProvider
{
  return self->_associatedServiceTypeOptionItemProvider;
}

- (void)setAssociatedServiceTypeOptionItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_associatedServiceTypeOptionItemProvider, a3);
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (HFStaticItemProvider)accessoryResetAndRemoveItemProvider
{
  return self->_accessoryResetAndRemoveItemProvider;
}

- (void)setAccessoryResetAndRemoveItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryResetAndRemoveItemProvider, a3);
}

- (HFStaticItemProvider)exportDiagnosticsItemProvider
{
  return self->_exportDiagnosticsItemProvider;
}

- (void)setExportDiagnosticsItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_exportDiagnosticsItemProvider, a3);
}

- (HULinkedApplicationItemProvider)linkedApplicationItemProvider
{
  return self->_linkedApplicationItemProvider;
}

- (void)setLinkedApplicationItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_linkedApplicationItemProvider, a3);
}

- (HUFirmwareUpdateItemProvider)firmwareUpdateItemProvider
{
  return self->_firmwareUpdateItemProvider;
}

- (void)setFirmwareUpdateItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareUpdateItemProvider, a3);
}

- (HFAccessorySettingDeviceOptionsAdapter)deviceOptionsAdapter
{
  return self->_deviceOptionsAdapter;
}

- (void)setDeviceOptionsAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_deviceOptionsAdapter, a3);
}

- (HFAccessorySettingDeviceOptionsAdapterUtility)deviceOptionsAdapterUtility
{
  return self->_deviceOptionsAdapterUtility;
}

- (void)setDeviceOptionsAdapterUtility:(id)a3
{
  objc_storeStrong((id *)&self->_deviceOptionsAdapterUtility, a3);
}

- (BOOL)groupedAccessoryReachableOverRapport
{
  return self->_groupedAccessoryReachableOverRapport;
}

- (void)setGroupedAccessoryReachableOverRapport:(BOOL)a3
{
  self->_groupedAccessoryReachableOverRapport = a3;
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsController, a3);
}

- (void)setServiceDetailsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_serviceDetailsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceDetailsDelegate);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_deviceOptionsAdapterUtility, 0);
  objc_storeStrong((id *)&self->_deviceOptionsAdapter, 0);
  objc_storeStrong((id *)&self->_firmwareUpdateItemProvider, 0);
  objc_storeStrong((id *)&self->_linkedApplicationItemProvider, 0);
  objc_storeStrong((id *)&self->_exportDiagnosticsItemProvider, 0);
  objc_storeStrong((id *)&self->_accessoryResetAndRemoveItemProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_associatedServiceTypeOptionItemProvider, 0);
  objc_storeStrong((id *)&self->_homeTheaterAudioSections, 0);
  objc_storeStrong((id *)&self->_lockAddHomeKeyToWalletSections, 0);
  objc_storeStrong((id *)&self->_collectDiagnosticsSections, 0);
  objc_storeStrong((id *)&self->_doorbellMuteSections, 0);
  objc_storeStrong((id *)&self->_cameraActivityZonesSections, 0);
  objc_storeStrong((id *)&self->_cameraNightModeSections, 0);
  objc_storeStrong((id *)&self->_cameraStatusLightSections, 0);
  objc_storeStrong((id *)&self->_advancedCameraSettingsSection, 0);
  objc_storeStrong((id *)&self->_televisionSettingsSections, 0);
  objc_storeStrong((id *)&self->_inputSourceEditorSections, 0);
  objc_storeStrong((id *)&self->_connectedServicesSections, 0);
  objc_storeStrong((id *)&self->_sceneAndTriggerSections, 0);
  objc_storeStrong((id *)&self->_valveEditorSections, 0);
  objc_storeStrong((id *)&self->_softwareUpdateSections, 0);
  objc_storeStrong((id *)&self->_homeKitAccessorySettingsSections, 0);
  objc_storeStrong((id *)&self->_accessorySettingsSections, 0);
  objc_storeStrong((id *)&self->_programmableSwitchSections, 0);
  objc_storeStrong((id *)&self->_relatedTriggerSections, 0);
  objc_storeStrong((id *)&self->_containedAccessoriesSections, 0);
  objc_storeStrong((id *)&self->_characteristicSections, 0);
  objc_storeStrong((id *)&self->_nameAndIconSections, 0);
  objc_storeStrong((id *)&self->_splitMediaAccountSections, 0);
  objc_storeStrong((id *)&self->_serviceDetailsControlStateAndCharacteristicItemModule, 0);
  objc_storeStrong((id *)&self->_programmableSwitchItemModule, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_lockAddHomeKeyToWalletItem, 0);
  objc_storeStrong((id *)&self->_lockPinCodesItem, 0);
  objc_storeStrong((id *)&self->_restartItem, 0);
  objc_storeStrong((id *)&self->_exportDiagnosticsItem, 0);
  objc_storeStrong((id *)&self->_internalDebuggingItem, 0);
  objc_storeStrong((id *)&self->_collectDiagnosticsItem, 0);
  objc_storeStrong((id *)&self->_cameraDoorbellChimeMuteItem, 0);
  objc_storeStrong((id *)&self->_cameraFaceRecognitionItem, 0);
  objc_storeStrong((id *)&self->_cameraRecordingOptionsItem, 0);
  objc_storeStrong((id *)&self->_cameraNightModeItem, 0);
  objc_storeStrong((id *)&self->_cameraStatusLightItem, 0);
  objc_storeStrong((id *)&self->_cameraActivityZonesItem, 0);
  objc_storeStrong((id *)&self->_audioSettingsItem, 0);
  objc_storeStrong((id *)&self->_accessoryItem, 0);
  objc_storeStrong((id *)&self->_resetItem, 0);
  objc_storeStrong((id *)&self->_primaryUserItem, 0);
  objc_storeStrong((id *)&self->_removeFromGroupItem, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_pairingModeItem, 0);
  objc_storeStrong((id *)&self->_homeMediaAccount, 0);
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, 0);
  objc_storeStrong((id *)&self->_homeKitAccessorySettingsModules, 0);
  objc_storeStrong((id *)&self->_managedConfigurationProfilesItem, 0);
  objc_storeStrong((id *)&self->_homeTheaterAudioOutputItem, 0);
  objc_storeStrong((id *)&self->_separateTileItem, 0);
  objc_storeStrong((id *)&self->_statusAndNotificationItem, 0);
  objc_storeStrong((id *)&self->_alarmItem, 0);
  objc_storeStrong((id *)&self->_showInHomeDashboardItem, 0);
  objc_storeStrong((id *)&self->_favoriteItem, 0);
  objc_storeStrong((id *)&self->_associatedServiceTypeItem, 0);
  objc_storeStrong((id *)&self->_roomItem, 0);
  objc_storeStrong((id *)&self->_showContainedItems, 0);
  objc_storeStrong((id *)&self->_identifyHomePodItem, 0);
  objc_storeStrong((id *)&self->_addGroupItem, 0);
  objc_storeStrong((id *)&self->_roomListItem, 0);
  objc_storeStrong((id *)&self->_createNewRoomItem, 0);
  objc_storeStrong((id *)&self->_splitMediaAccountSignoutAccountItem, 0);
  objc_storeStrong((id *)&self->_splitMediaAccountUseDefaultAccountItem, 0);
  objc_storeStrong((id *)&self->_splitMediaAccountTitleItem, 0);
  objc_storeStrong((id *)&self->_headerItem, 0);
  objc_storeStrong((id *)&self->_selectedRoomItem, 0);
  objc_storeStrong((id *)&self->_debugAccessoryItemModule, 0);
  objc_storeStrong((id *)&self->_connectedServicesItemModule, 0);
  objc_storeStrong((id *)&self->_sceneAndTriggerModule, 0);
  objc_storeStrong((id *)&self->_accessoryServicesEditorItemModule, 0);
  objc_storeStrong((id *)&self->_valveEditorItemModule, 0);
  objc_storeStrong((id *)&self->_inputSourceItemModule, 0);
  objc_storeStrong((id *)&self->_televisionSettingsItemModule, 0);
  objc_storeStrong((id *)&self->_serviceDetailsRemoteControlItemModule, 0);
  objc_storeStrong((id *)&self->_relatedTriggerItemModule, 0);
  objc_storeStrong((id *)&self->_softwareUpdateItemModule, 0);
  objc_storeStrong((id *)&self->_accessorySettingsItemModule, 0);
  objc_storeStrong((id *)&self->_accessoryRepresentableItemModule, 0);
  objc_storeStrong((id *)&self->_nameModule, 0);
  objc_storeStrong((id *)&self->_accessoryInfoItemProvider, 0);
  objc_storeStrong((id *)&self->_selectedRoomItemProvider, 0);
  objc_storeStrong((id *)&self->_suggestedRoomItemProvider, 0);
  objc_storeStrong((id *)&self->_existingRoomItemProvider, 0);
  objc_storeStrong((id *)&self->_serviceLikeBuilder, 0);
  objc_storeStrong((id *)&self->_builderItem, 0);
}

@end
