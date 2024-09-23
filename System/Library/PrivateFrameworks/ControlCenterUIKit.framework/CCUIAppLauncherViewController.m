@implementation CCUIAppLauncherViewController

- (void)buttonTouchDown:(id)a3 forEvent:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  objc_msgSend(a4, "allTouches", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  objc_msgSend(WeakRetained, "handleTouchDownWithTouchType:", v7);

}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  objc_msgSend(a4, "allTouches", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  objc_msgSend(WeakRetained, "handleTapWithTouchType:", v7);

}

- (id)leadingImageForMenuItem:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)viewDidLoad
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  OS_dispatch_queue *SerialWithQoS;
  OS_dispatch_queue *menuItemsFetchQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CCUIAppLauncherViewController;
  -[CCUIMenuModuleViewController viewDidLoad](&v9, sel_viewDidLoad);
  WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  objc_msgSend(WeakRetained, "iconGlyph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setGlyphImage:](self, "setGlyphImage:", v4);

  v5 = objc_loadWeakRetained((id *)&self->_module);
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setTitle:](self, "setTitle:", v6);

  -[CCUIButtonModuleViewController setValueText:](self, "setValueText:", 0);
  -[CCUIButtonModuleViewController setSelectedValueText:](self, "setSelectedValueText:", 0);
  -[CCUIMenuModuleViewController setIndentation:](self, "setIndentation:", 3);
  SerialWithQoS = (OS_dispatch_queue *)BSDispatchQueueCreateSerialWithQoS();
  menuItemsFetchQueue = self->_menuItemsFetchQueue;
  self->_menuItemsFetchQueue = SerialWithQoS;

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIAppLauncherViewController;
  -[CCUIAppLauncherViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CCUIAppLauncherViewController _updateApplicationShortcutsActionsIfNecessary](self, "_updateApplicationShortcutsActionsIfNecessary");
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  id WeakRetained;
  int v4;
  NSObject *menuItemsFetchQueue;
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  v4 = objc_msgSend(WeakRetained, "supportsApplicationShortcuts");

  if (v4)
  {
    -[CCUIAppLauncherViewController _updateApplicationShortcutsActionsIfNecessary](self, "_updateApplicationShortcutsActionsIfNecessary");
    menuItemsFetchQueue = self->_menuItemsFetchQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__CCUIAppLauncherViewController_shouldBeginTransitionToExpandedContentModule__block_invoke;
    v8[3] = &unk_1E8E20AF0;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(menuItemsFetchQueue, v8);
    -[CCUIAppLauncherViewController _updateWithFetchedMenuItemsIfNecessary](self, "_updateWithFetchedMenuItemsIfNecessary");
  }
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __77__CCUIAppLauncherViewController_shouldBeginTransitionToExpandedContentModule__block_invoke(uint64_t a1)
{
  uint64_t result;
  objc_super v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "count"))
  {
    result = 1;
  }
  else
  {
    v3.receiver = *(id *)(a1 + 32);
    v3.super_class = (Class)CCUIAppLauncherViewController;
    result = (uint64_t)objc_msgSendSuper2(&v3, sel_shouldBeginTransitionToExpandedContentModule);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *menuItemsFetchQueue;
  _QWORD block[5];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CCUIAppLauncherViewController;
  -[CCUIMenuModuleViewController didTransitionToExpandedContentMode:](&v7, sel_didTransitionToExpandedContentMode_);
  if (v3)
  {
    menuItemsFetchQueue = self->_menuItemsFetchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__CCUIAppLauncherViewController_didTransitionToExpandedContentMode___block_invoke;
    block[3] = &unk_1E8E20590;
    block[4] = self;
    dispatch_async(menuItemsFetchQueue, block);
  }
  else
  {
    -[CCUIAppLauncherViewController _updateApplicationShortcutsActionsIfNecessary](self, "_updateApplicationShortcutsActionsIfNecessary");
  }
}

uint64_t __68__CCUIAppLauncherViewController_didTransitionToExpandedContentMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setFetchedMenuItems:", 0);
}

- (BOOL)shouldRequestAuthenticationForTransitionToExpandedContent
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  v3 = objc_msgSend(WeakRetained, "requestAuthenticationForExpandedModule");

  return v3;
}

- (void)requestAuthenticationForTransitionToExpandedContentModuleWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  id WeakRetained;
  int v6;
  void *v7;
  void (**v8)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v8 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_module);
    v6 = objc_msgSend(WeakRetained, "requestAuthenticationForExpandedModule");

    if (v6)
    {
      -[CCUIMenuModuleViewController contentModuleContext](self, "contentModuleContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "requestAuthenticationWithCompletionHandler:", v8);

    }
    else
    {
      v8[2](v8, 1);
    }
    v4 = v8;
  }

}

- (void)willResignActive
{
  NSObject *menuItemsFetchQueue;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD block[5];

  menuItemsFetchQueue = self->_menuItemsFetchQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CCUIAppLauncherViewController_willResignActive__block_invoke;
  block[3] = &unk_1E8E20590;
  block[4] = self;
  dispatch_async(menuItemsFetchQueue, block);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __49__CCUIAppLauncherViewController_willResignActive__block_invoke_2;
  v5[3] = &unk_1E8E20590;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
}

uint64_t __49__CCUIAppLauncherViewController_willResignActive__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setFetchedMenuItems:", 0);
}

uint64_t __49__CCUIAppLauncherViewController_willResignActive__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMenuItems:", MEMORY[0x1E0C9AA60]);
}

- (BOOL)_canShowWhileLocked
{
  uint64_t v2;

  v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (void)_updateApplicationShortcutsActionsIfNecessary
{
  NSObject *menuItemsFetchQueue;
  _QWORD block[5];

  if (!self->_fetchedMenuItems)
  {
    menuItemsFetchQueue = self->_menuItemsFetchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__CCUIAppLauncherViewController__updateApplicationShortcutsActionsIfNecessary__block_invoke;
    block[3] = &unk_1E8E20590;
    block[4] = self;
    dispatch_async(menuItemsFetchQueue, block);
  }
}

uint64_t __78__CCUIAppLauncherViewController__updateApplicationShortcutsActionsIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateApplicationShortcutsActions");
}

- (void)_queue_setFetchedMenuItems:(id)a3
{
  CCUIAppLauncherViewController *v5;
  NSArray *v6;

  v6 = (NSArray *)a3;
  BSDispatchQueueAssert();
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_fetchedMenuItems != v6)
    objc_storeStrong((id *)&v5->_fetchedMenuItems, a3);
  objc_sync_exit(v5);

}

- (void)_updateWithFetchedMenuItemsIfNecessary
{
  _QWORD v3[5];

  BSDispatchQueueAssertMain();
  if (self->_fetchedMenuItems)
  {
    if (!-[CCUIMenuModuleViewController menuItemCount](self, "menuItemCount"))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __71__CCUIAppLauncherViewController__updateWithFetchedMenuItemsIfNecessary__block_invoke;
      v3[3] = &unk_1E8E20590;
      v3[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
    }
  }
}

uint64_t __71__CCUIAppLauncherViewController__updateWithFetchedMenuItemsIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMenuItems:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1264));
}

- (void)_queue_updateApplicationShortcutsActions
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD block[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  objc_msgSend(WeakRetained, "_application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "staticApplicationShortcutItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        -[CCUIAppLauncherViewController _menuItemForShortcutItem:](self, "_menuItemForShortcutItem:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "dynamicApplicationShortcutItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        -[CCUIAppLauncherViewController _menuItemForShortcutItem:](self, "_menuItemForShortcutItem:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  -[CCUIAppLauncherViewController _queue_setFetchedMenuItems:](self, "_queue_setFetchedMenuItems:", v3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CCUIAppLauncherViewController__queue_updateApplicationShortcutsActions__block_invoke;
  block[3] = &unk_1E8E20590;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __73__CCUIAppLauncherViewController__queue_updateApplicationShortcutsActions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWithFetchedMenuItemsIfNecessary");
}

- (id)_assetProvider
{
  SCUIAssetProvider *assetProvider;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  SCUIAssetProvider *v8;
  SCUIAssetProvider *v9;

  assetProvider = self->_assetProvider;
  if (!assetProvider)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_module);
    objc_msgSend(WeakRetained, "_application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0D97630]);
    objc_msgSend(v5, "bundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (SCUIAssetProvider *)objc_msgSend(v6, "initWithBundleURL:", v7);
    v9 = self->_assetProvider;
    self->_assetProvider = v8;

    assetProvider = self->_assetProvider;
  }
  return assetProvider;
}

- (id)_menuItemForShortcutItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CCUIAppShortcutMenuModuleItem *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CCUIAppShortcutMenuModuleItem *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIAppLauncherViewController _assetProvider](self, "_assetProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scui_iconImageWithAssetProvider:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [CCUIAppShortcutMenuModuleItem alloc];
  objc_msgSend(v4, "localizedTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__CCUIAppLauncherViewController__menuItemForShortcutItem___block_invoke;
  v16[3] = &unk_1E8E20B18;
  objc_copyWeak(&v18, &location);
  v12 = v4;
  v17 = v12;
  v13 = -[CCUIMenuModuleItem initWithTitle:identifier:handler:](v8, "initWithTitle:identifier:handler:", v9, v11, v16);

  objc_msgSend(v12, "localizedSubtitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleItem setSubtitle:](v13, "setSubtitle:", v14);

  -[CCUIAppShortcutMenuModuleItem setIcon:](v13, "setIcon:", v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return v13;
}

uint64_t __58__CCUIAppLauncherViewController__menuItemForShortcutItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_activateApplicationForShortcutItem:", *(_QWORD *)(a1 + 32));

  return 1;
}

- (void)_activateApplicationForShortcutItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
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
    WeakRetained = objc_loadWeakRetained((id *)&self->_module);
    objc_msgSend(WeakRetained, "applicationIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = objc_msgSend(v4, "activationMode") == 1;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3848]), "initWithSBSShortcutItem:", v4);

  v19[0] = *MEMORY[0x1E0D22D00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v19[1] = *MEMORY[0x1E0D22CE0];
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D22DA8];
  v19[2] = *MEMORY[0x1E0D22D88];
  v19[3] = v13;
  v19[4] = *MEMORY[0x1E0D22D58];
  v20[1] = v12;
  v20[2] = MEMORY[0x1E0C9AAB0];
  v20[3] = MEMORY[0x1E0C9AAB0];
  v20[4] = CFSTR("CCUIAppLaunchOriginControlCenter");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_loadWeakRetained((id *)&self->_module);
  objc_msgSend(v15, "contentModuleContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__CCUIAppLauncherViewController__activateApplicationForShortcutItem___block_invoke;
  v17[3] = &unk_1E8E207F8;
  v17[4] = self;
  objc_msgSend(v16, "openApplication:withOptions:completionHandler:", v7, v14, v17);

}

void __69__CCUIAppLauncherViewController__activateApplicationForShortcutItem___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1272));
    objc_msgSend(WeakRetained, "contentModuleContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissModule");

  }
}

- (CCUIAppLauncherModule)module
{
  return (CCUIAppLauncherModule *)objc_loadWeakRetained((id *)&self->_module);
}

- (void)setModule:(id)a3
{
  objc_storeWeak((id *)&self->_module, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_module);
  objc_storeStrong((id *)&self->_fetchedMenuItems, 0);
  objc_storeStrong((id *)&self->_menuItemsFetchQueue, 0);
  objc_storeStrong((id *)&self->_assetProvider, 0);
}

@end
