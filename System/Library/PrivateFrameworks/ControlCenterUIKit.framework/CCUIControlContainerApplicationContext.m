@implementation CCUIControlContainerApplicationContext

- (CCUIControlContainerApplicationContext)initWithApplicationBundleIdentifier:(id)a3
{
  id v4;
  CCUIControlContainerApplicationContext *v5;
  uint64_t v6;
  NSString *applicationBundleIdentifier;
  uint64_t SerialWithQoS;
  OS_dispatch_queue *menuItemsFetchQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCUIControlContainerApplicationContext;
  v5 = -[CCUIControlContainerApplicationContext init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v6;

    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    menuItemsFetchQueue = v5->_menuItemsFetchQueue;
    v5->_menuItemsFetchQueue = (OS_dispatch_queue *)SerialWithQoS;

    -[CCUIControlContainerApplicationContext _updateApplicationShortcutsActionsIfNecessary](v5, "_updateApplicationShortcutsActionsIfNecessary");
  }

  return v5;
}

- (NSArray)applicationShortcuts
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_fetchedStaticMenuItems)
    objc_msgSend(v3, "addObjectsFromArray:");
  if (self->_fetchedDynamicMenuItems)
    objc_msgSend(v4, "addObjectsFromArray:");
  return (NSArray *)v4;
}

- (UIMenu)contextMenuForApplicationShortcuts
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CCUIControlContainerApplicationContext _updateApplicationShortcutsActionsIfNecessary](self, "_updateApplicationShortcutsActionsIfNecessary");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CCUIControlContainerApplicationContext applicationShortcuts](self, "applicationShortcuts", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "menuElement");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return (UIMenu *)v10;
}

- (void)_updateApplicationShortcutsActionsIfNecessary
{
  uint64_t v3;
  NSObject *menuItemsFetchQueue;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  if (!self->_fetchedStaticMenuItems)
  {
    menuItemsFetchQueue = self->_menuItemsFetchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__CCUIControlContainerApplicationContext__updateApplicationShortcutsActionsIfNecessary__block_invoke;
    block[3] = &unk_1E8E20590;
    block[4] = self;
    dispatch_async(menuItemsFetchQueue, block);
  }
  v5 = self->_menuItemsFetchQueue;
  if (self->_fetchedDynamicMenuItems)
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __87__CCUIControlContainerApplicationContext__updateApplicationShortcutsActionsIfNecessary__block_invoke_3;
    v6[3] = &unk_1E8E20590;
    v6[4] = self;
    dispatch_sync(v5, v6);
  }
  else
  {
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __87__CCUIControlContainerApplicationContext__updateApplicationShortcutsActionsIfNecessary__block_invoke_2;
    v7[3] = &unk_1E8E20590;
    v7[4] = self;
    dispatch_async(v5, v7);
  }
}

uint64_t __87__CCUIControlContainerApplicationContext__updateApplicationShortcutsActionsIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateStaticApplicationShortcutsActions");
}

uint64_t __87__CCUIControlContainerApplicationContext__updateApplicationShortcutsActionsIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateDynamicApplicationShortcutsActions");
}

uint64_t __87__CCUIControlContainerApplicationContext__updateApplicationShortcutsActionsIfNecessary__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateDynamicApplicationShortcutsActions");
}

- (id)_application
{
  -[CCUIControlContainerApplicationContext _fetchApplicationIfNeeded](self, "_fetchApplicationIfNeeded");
  return self->_application;
}

- (void)_fetchApplicationIfNeeded
{
  CCUIControlContainerApplicationContext *v2;
  id v3;
  void *v4;
  uint64_t v5;
  SBFApplication *application;
  CCUIControlContainerApplicationContext *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_application)
  {
    v3 = objc_alloc(MEMORY[0x1E0DA9D90]);
    -[CCUIControlContainerApplicationContext applicationBundleIdentifier](obj, "applicationBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithApplicationBundleIdentifier:", v4);
    application = obj->_application;
    obj->_application = (SBFApplication *)v5;

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- (void)_queue_updateStaticApplicationShortcutsActions
{
  id v3;

  BSDispatchQueueAssert();
  -[CCUIControlContainerApplicationContext _queue_fetchStaticApplicationShortcutItems](self, "_queue_fetchStaticApplicationShortcutItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUIControlContainerApplicationContext _queue_setFetchedStaticMenuItems:](self, "_queue_setFetchedStaticMenuItems:", v3);

}

- (id)_queue_fetchStaticApplicationShortcutItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIControlContainerApplicationContext _application](self, "_application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "staticApplicationShortcutItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[CCUIControlContainerApplicationContext _menuItemForShortcutItem:](self, "_menuItemForShortcutItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)_queue_updateDynamicApplicationShortcutsActions
{
  id v3;

  BSDispatchQueueAssert();
  -[CCUIControlContainerApplicationContext _queue_fetchDynamicApplicationShortcutItems](self, "_queue_fetchDynamicApplicationShortcutItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUIControlContainerApplicationContext _queue_setFetchedDynamicMenuItems:](self, "_queue_setFetchedDynamicMenuItems:", v3);

}

- (id)_queue_fetchDynamicApplicationShortcutItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIControlContainerApplicationContext _application](self, "_application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "dynamicApplicationShortcutItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[CCUIControlContainerApplicationContext _menuItemForShortcutItem:](self, "_menuItemForShortcutItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)_menuItemForShortcutItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CCUIApplicationShortcutMenuModuleItem *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  CCUIApplicationShortcutMenuModuleItem *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CCUIApplicationShortcutMenuModuleItem *v27;
  void *v28;
  void *v29;
  void *v30;
  CCUIContextMenuItem *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  CCUIApplicationShortcutMenuModuleItem *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_opt_class();
    v7 = v5;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v12 = v8;

    objc_msgSend(v12, "systemImageName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_opt_class();
      v10 = v5;
      if (v9)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v12 = v11;

      objc_msgSend(v12, "systemImageName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "icon");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[CCUIControlContainerApplicationContext _assetProvider](self, "_assetProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scui_iconImageWithAssetProvider:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
  }
  v15 = (void *)v14;

  v16 = [CCUIApplicationShortcutMenuModuleItem alloc];
  objc_msgSend(v4, "localizedTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __67__CCUIControlContainerApplicationContext__menuItemForShortcutItem___block_invoke;
  v38[3] = &unk_1E8E20B18;
  objc_copyWeak(&v40, &location);
  v21 = v4;
  v39 = v21;
  v22 = -[CCUIMenuModuleItem initWithTitle:identifier:handler:](v16, "initWithTitle:identifier:handler:", v17, v19, v38);

  objc_msgSend(v21, "localizedSubtitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleItem setSubtitle:](v22, "setSubtitle:", v23);

  -[CCUIApplicationShortcutMenuModuleItem setIcon:](v22, "setIcon:", v15);
  v24 = (void *)MEMORY[0x1E0DC3428];
  -[CCUIMenuModuleItem title](v22, "title");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIApplicationShortcutMenuModuleItem icon](v22, "icon");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v20;
  v34 = 3221225472;
  v35 = __67__CCUIControlContainerApplicationContext__menuItemForShortcutItem___block_invoke_2;
  v36 = &unk_1E8E20870;
  v27 = v22;
  v37 = v27;
  objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v25, v26, 0, &v33);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[CCUIMenuModuleItem subtitle](v27, "subtitle", v33, v34, v35, v36);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[CCUIMenuModuleItem subtitle](v27, "subtitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSubtitle:", v30);

  }
  v31 = -[CCUIContextMenuItem initWithMenuElement:]([CCUIContextMenuItem alloc], "initWithMenuElement:", v28);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  return v31;
}

uint64_t __67__CCUIControlContainerApplicationContext__menuItemForShortcutItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_activateApplicationForShortcutItem:", *(_QWORD *)(a1 + 32));

  return 1;
}

uint64_t __67__CCUIControlContainerApplicationContext__menuItemForShortcutItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAction");
}

- (id)_assetProvider
{
  SCUIAssetProvider *assetProvider;
  void *v4;
  id v5;
  void *v6;
  SCUIAssetProvider *v7;
  SCUIAssetProvider *v8;

  assetProvider = self->_assetProvider;
  if (!assetProvider)
  {
    -[CCUIControlContainerApplicationContext _application](self, "_application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0D97630]);
    objc_msgSend(v4, "bundleURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (SCUIAssetProvider *)objc_msgSend(v5, "initWithBundleURL:", v6);
    v8 = self->_assetProvider;
    self->_assetProvider = v7;

    assetProvider = self->_assetProvider;
  }
  return assetProvider;
}

- (void)_activateApplicationForShortcutItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CCUIContentModuleContext *v16;
  void *v17;
  CCUIContentModuleContext *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bundleIdentifierToLaunch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[CCUIControlContainerApplicationContext applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = objc_msgSend(v4, "activationMode") == 1;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3848]), "initWithSBSShortcutItem:", v4);

  v20[0] = *MEMORY[0x1E0D22D00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v20[1] = *MEMORY[0x1E0D22CE0];
  v19 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D22D88];
  v21[1] = v12;
  v21[2] = MEMORY[0x1E0C9AAB0];
  v14 = *MEMORY[0x1E0D22DA8];
  v20[2] = v13;
  v20[3] = v14;
  v20[4] = *MEMORY[0x1E0D22D58];
  v21[3] = MEMORY[0x1E0C9AAB0];
  v21[4] = CFSTR("CCUIAppLaunchOriginControlCenterControl");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [CCUIContentModuleContext alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CCUIContentModuleContext initWithModuleIdentifier:uniqueIdentifier:](v16, "initWithModuleIdentifier:uniqueIdentifier:", v8, v17);

  -[CCUIContentModuleContext openApplication:withOptions:completionHandler:](v18, "openApplication:withOptions:completionHandler:", v8, v15, 0);
}

- (void)_queue_setFetchedStaticMenuItems:(id)a3
{
  CCUIControlContainerApplicationContext *v5;
  NSArray *v6;

  v6 = (NSArray *)a3;
  BSDispatchQueueAssert();
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_fetchedStaticMenuItems != v6)
    objc_storeStrong((id *)&v5->_fetchedStaticMenuItems, a3);
  objc_sync_exit(v5);

}

- (void)_queue_setFetchedDynamicMenuItems:(id)a3
{
  CCUIControlContainerApplicationContext *v5;
  NSArray *v6;

  v6 = (NSArray *)a3;
  BSDispatchQueueAssert();
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_fetchedDynamicMenuItems != v6)
    objc_storeStrong((id *)&v5->_fetchedDynamicMenuItems, a3);
  objc_sync_exit(v5);

}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_menuItemsFetchQueue, 0);
  objc_storeStrong((id *)&self->_fetchedDynamicMenuItems, 0);
  objc_storeStrong((id *)&self->_fetchedStaticMenuItems, 0);
  objc_storeStrong((id *)&self->_assetProvider, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
