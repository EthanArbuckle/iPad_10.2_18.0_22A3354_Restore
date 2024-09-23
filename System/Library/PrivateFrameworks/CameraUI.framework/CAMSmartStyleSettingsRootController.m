@implementation CAMSmartStyleSettingsRootController

- (void)loadView
{
  NSMutableDictionary *v3;
  NSMutableDictionary *cachedStyles;
  NSArray *v5;
  NSArray *selectedAssetIdentifiers;
  double Current;
  id v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  CAMSmartStyleSettingsResourceLoadingManager *v27;
  CAMSmartStyleSettingsResourceLoadingManager *resourceLoadingManager;
  CAMSmartStyleSettingsView *v29;
  CAMSmartStyleSettingsView *settingsView;
  void *v31;
  _BOOL4 v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)CAMSmartStyleSettingsRootController;
  -[CAMSmartStyleSettingsRootController loadView](&v39, sel_loadView);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  cachedStyles = self->__cachedStyles;
  self->__cachedStyles = v3;

  -[CAMSmartStyleSettingsRootController _readSelectedAssetIdentifiers](self, "_readSelectedAssetIdentifiers");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  selectedAssetIdentifiers = self->__selectedAssetIdentifiers;
  self->__selectedAssetIdentifiers = v5;

  if (-[NSArray count](self->__selectedAssetIdentifiers, "count") <= 3)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v8 = objc_alloc_init(MEMORY[0x1E0CD1570]);
    objc_msgSend(MEMORY[0x1E0D71880], "predicateForStyleableAssets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInternalPredicate:", v9);

    objc_msgSend(v8, "setFetchLimit:", 4);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFAbsoluteTimeGetCurrent();
    v12 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 134218240;
      v42 = v13;
      v43 = 2048;
      v44 = v11 - Current;
      _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Settings: fetched %ld assets in %.3f seconds", buf, 0x16u);
    }

    v32 = (unint64_t)objc_msgSend(v10, "count") > 3;
  }
  else
  {
    v32 = 1;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = objc_msgSend(&unk_1EA3B3530, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(&unk_1EA3B3530);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D098]), "initWithPresetType:", objc_msgSend(v18, "integerValue"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->__cachedStyles, "setObject:forKeyedSubscript:", v19, v18);

      }
      v15 = objc_msgSend(&unk_1EA3B3530, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v15);
  }
  -[CAMSmartStyleSettingsRootController _readSystemStyleFromDefaultsWrites](self, "_readSystemStyleFromDefaultsWrites");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __47__CAMSmartStyleSettingsRootController_loadView__block_invoke;
  v33[3] = &unk_1EA32C1E8;
  v21 = v20;
  v34 = v21;
  v22 = objc_msgSend(&unk_1EA3B3530, "indexOfObjectPassingTest:", v33);
  if (v22 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v23 = 0;
  }
  else
  {
    v23 = v22;
    v24 = self->__cachedStyles;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "presetType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v21, v25);

  }
  objc_msgSend(&unk_1EA3B3530, "objectAtIndexedSubscript:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  self->__currentStylePreset = objc_msgSend(v26, "integerValue");

  objc_storeStrong((id *)&self->__persistedSystemStyle, v20);
  v27 = objc_alloc_init(CAMSmartStyleSettingsResourceLoadingManager);
  resourceLoadingManager = self->__resourceLoadingManager;
  self->__resourceLoadingManager = v27;

  -[CAMSmartStyleSettingsResourceLoadingManager setDelegate:](self->__resourceLoadingManager, "setDelegate:", self);
  if (v32)
    -[CAMSmartStyleSettingsResourceLoadingManager loadResourcesForAssetIdentifiers:unloadAllOthers:](self->__resourceLoadingManager, "loadResourcesForAssetIdentifiers:unloadAllOthers:", self->__selectedAssetIdentifiers, 1);
  v29 = -[CAMSmartStyleSettingsView initWithDelegate:stylePresets:selectedIndex:hasEnoughPhotos:usingMostCompatibleFormat:]([CAMSmartStyleSettingsView alloc], "initWithDelegate:stylePresets:selectedIndex:hasEnoughPhotos:usingMostCompatibleFormat:", self, &unk_1EA3B3530, v23, v32, objc_msgSend(MEMORY[0x1E0D75128], "newFormatsConfiguration") == 1);
  settingsView = self->__settingsView;
  self->__settingsView = v29;

  -[CAMSmartStyleSettingsRootController setView:](self, "setView:", self->__settingsView);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground, *MEMORY[0x1E0DC4768], 0);

}

BOOL __47__CAMSmartStyleSettingsRootController_loadView__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "integerValue");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "presetType");
}

- (void)_applicationDidEnterBackground
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Settings: stopping all animations for DidEnterBackground", v5, 2u);
  }

  -[CAMSmartStyleSettingsRootController _settingsView](self, "_settingsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAllAnimations");

}

- (id)_cancelButtonItem
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v3 = (void *)MEMORY[0x1E0DC3428];
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __56__CAMSmartStyleSettingsRootController__cancelButtonItem__block_invoke;
  v10 = &unk_1EA32C210;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "actionWithHandler:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithBarButtonSystemItem:primaryAction:", 1, v4, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __56__CAMSmartStyleSettingsRootController__cancelButtonItem__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "User tapped Cancel button", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismiss");

}

- (id)previewViewController:(id)a3 requestsLoadResultForGridIndex:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[CAMSmartStyleSettingsRootController _selectedAssetIdentifiers](self, "_selectedAssetIdentifiers", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
  {
    v11 = 0;
  }
  else
  {
    -[CAMSmartStyleSettingsRootController _selectedAssetIdentifiers](self, "_selectedAssetIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMSmartStyleSettingsResourceLoadingManager resourceLoaderForAssetIdentifier:](self->__resourceLoadingManager, "resourceLoaderForAssetIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resourceLoadResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)previewViewController:(id)a3 didChangeAnimatingGrid:(BOOL)a4
{
  -[CAMSmartStyleSettingsView setScrollEnabled:](self->__settingsView, "setScrollEnabled:", !a4);
}

- (void)settingsView:(id)a3 requestsTitle:(id)a4 showBackButton:(BOOL)a5 showCancelButton:(BOOL)a6 cancelButtonOnLeft:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  BOOL v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id location;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  -[CAMSmartStyleSettingsRootController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v13);

  -[CAMSmartStyleSettingsRootController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v9)
  {
    objc_msgSend(v15, "backAction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_initWeak(&location, self);
      v18 = (void *)MEMORY[0x1E0DC3428];
      CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_SETTINGS_BACK_BUTTON_TITLE"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __117__CAMSmartStyleSettingsRootController_settingsView_requestsTitle_showBackButton_showCancelButton_cancelButtonOnLeft___block_invoke;
      v32 = &unk_1EA32C210;
      objc_copyWeak(&v33, &location);
      objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v19, 0, 0, &v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSmartStyleSettingsRootController navigationItem](self, "navigationItem", v29, v30, v31, v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setBackAction:", v20);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(v15, "setBackAction:", 0);

  }
  v22 = v8 && v7;
  if (v8 && v7)
  {
    -[CAMSmartStyleSettingsRootController _cancelButtonItem](self, "_cancelButtonItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  v24 = !v8;
  -[CAMSmartStyleSettingsRootController navigationItem](self, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLeftBarButtonItem:", v23);

  if (v22)
  v26 = v24 || v7;
  if (v24 || v7)
  {
    v27 = 0;
  }
  else
  {
    -[CAMSmartStyleSettingsRootController _cancelButtonItem](self, "_cancelButtonItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CAMSmartStyleSettingsRootController navigationItem](self, "navigationItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setRightBarButtonItem:", v27);

  if (!v26)
}

void __117__CAMSmartStyleSettingsRootController_settingsView_requestsTitle_showBackButton_showCancelButton_cancelButtonOnLeft___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "User tapped Back button", (uint8_t *)&v8, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_settingsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performBackAction");

  v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Completed back action %@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)settingsViewRequestsDismiss:(id)a3 completion:(id)a4
{
  -[CAMSmartStyleSettingsRootController _dismissWithCompletion:](self, "_dismissWithCompletion:", a4);
}

- (void)_dismiss
{
  -[CAMSmartStyleSettingsRootController _dismissWithCompletion:](self, "_dismissWithCompletion:", 0);
}

- (void)_dismissWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMSmartStyleSettingsRootController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v4);

}

- (void)settingsViewRequestsUserAssetSelection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CAMSmartStyleSettingsPickerViewController *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UINavigationController *v21;
  UINavigationController *pickerNavigationController;
  _QWORD v23[4];
  id v24;
  id location;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CD2168]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPhotoLibrary:", v6);

  objc_msgSend(v7, "setPreferredAssetRepresentationMode:", 1);
  objc_msgSend(v7, "setSelectionLimit:", 4);
  v8 = (void *)MEMORY[0x1E0CD2170];
  objc_msgSend(MEMORY[0x1E0CD2170], "_styleabilityFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v9;
  objc_msgSend(MEMORY[0x1E0CD2170], "imagesFilter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allFilterMatchingSubfilters:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilter:", v12);

  v13 = -[CAMSmartStyleSettingsPickerViewController initWithPickerConfiguration:selectedAssetIdentifiers:]([CAMSmartStyleSettingsPickerViewController alloc], "initWithPickerConfiguration:selectedAssetIdentifiers:", v7, self->__selectedAssetIdentifiers);
  -[CAMSmartStyleSettingsPickerViewController setDelegate:](v13, "setDelegate:", self);
  CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_SETTINGS_PICKER_TITLE"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerViewController navigationItem](v13, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", v14);

  objc_initWeak(&location, self);
  v16 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v17 = (void *)MEMORY[0x1E0DC3428];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__CAMSmartStyleSettingsRootController_settingsViewRequestsUserAssetSelection___block_invoke;
  v23[3] = &unk_1EA32C210;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v17, "actionWithHandler:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithBarButtonSystemItem:primaryAction:", 1, v18);
  -[CAMSmartStyleSettingsPickerViewController navigationItem](v13, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLeftBarButtonItem:", v19);

  v21 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v13);
  pickerNavigationController = self->__pickerNavigationController;
  self->__pickerNavigationController = v21;

  -[CAMSmartStyleSettingsRootController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->__pickerNavigationController, 1, 0);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __78__CAMSmartStyleSettingsRootController_settingsViewRequestsUserAssetSelection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "User tapped picker Cancel button", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pickerDidCancel");

}

- (id)settingsView:(id)a3 requestsViewControllerForPresetType:(int64_t)a4 pageIndex:(unint64_t)a5 parentViewController:(id *)a6
{
  void *v9;
  _BOOL8 v10;
  CAMSmartStylePreviewViewController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  unint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a6)
    *a6 = objc_retainAutorelease(self);
  -[CAMSmartStyleSettingsRootController _selectedAssetIdentifiers](self, "_selectedAssetIdentifiers", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") != 1;

  v11 = -[CAMSmartStylePreviewViewController initWithDelegate:gridLayout:pageIndex:]([CAMSmartStylePreviewViewController alloc], "initWithDelegate:gridLayout:pageIndex:", self, v10, a5);
  v12 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CEKDebugStringForSmartStylePresetType();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134218242;
    v19 = a5;
    v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Settings: created new view controller for page=%lu/%{public}@", (uint8_t *)&v18, 0x16u);

  }
  -[CAMSmartStyleSettingsRootController _cachedStyles](self, "_cachedStyles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMSmartStylePreviewViewController updateWithStyle:](v11, "updateWithStyle:", v16);
  return v11;
}

- (id)settingsView:(id)a3 requestsStyleForPresetType:(int64_t)a4
{
  return -[CAMSmartStyleSettingsRootController _styleForPresetType:](self, "_styleForPresetType:", a4);
}

- (id)_styleForPresetType:(int64_t)a3
{
  NSMutableDictionary *cachedStyles;
  void *v4;
  void *v5;

  cachedStyles = self->__cachedStyles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedStyles, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)settingsView:(id)a3 didUpdateStyle:(id)a4 forPresetType:(int64_t)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v7 = a4;
  -[NSMutableDictionary allKeys](self->__cachedStyles, "allKeys");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__CAMSmartStyleSettingsRootController_settingsView_didUpdateStyle_forPresetType___block_invoke;
  v10[3] = &unk_1EA32C238;
  v11 = v7;
  v12 = a5;
  v10[4] = self;
  v8 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __81__CAMSmartStyleSettingsRootController_settingsView_didUpdateStyle_forPresetType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(v12, "integerValue") == *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), v12);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "objectForKeyedSubscript:", v12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0D0D098]);
    v5 = objc_msgSend(v3, "presetType");
    objc_msgSend(v3, "castIntensity");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 40), "toneBias");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 40), "colorBias");
    v11 = (void *)objc_msgSend(v4, "initWithPresetType:castIntensity:toneBias:colorBias:", v5, v7, v9, v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setObject:forKeyedSubscript:", v11, v12);

  }
}

- (void)settingsViewDidConfirmStyle:(id)a3
{
  NSMutableDictionary *cachedStyles;
  void *v5;
  id v6;

  cachedStyles = self->__cachedStyles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMSmartStyleSettingsRootController _currentStylePreset](self, "_currentStylePreset", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedStyles, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMSmartStyleSettingsRootController _persistSystemStyle:](self, "_persistSystemStyle:", v6);
}

- (void)settingsViewRequestsResetToStandardStyleAndDismiss:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D098]), "initWithPresetType:", 1);
  -[CAMSmartStyleSettingsRootController _persistSystemStyle:](self, "_persistSystemStyle:", v4);
  -[CAMSmartStyleSettingsRootController _dismiss](self, "_dismiss");

}

- (void)addChildViewController:(id)a3 toView:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[CAMSmartStyleSettingsRootController addChildViewController:](self, "addChildViewController:", v8);
  objc_msgSend(v8, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  objc_msgSend(v8, "didMoveToParentViewController:", self);
}

- (void)_persistSystemStyle:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->__persistedSystemStyle, a3);
  +[CAMCaptureConversions AVCaptureSmartStyleForCEKSmartStyle:](CAMCaptureConversions, "AVCaptureSmartStyleForCEKSmartStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMSmartStyleUtilities writeAVCaptureSystemStyle:](CAMSmartStyleUtilities, "writeAVCaptureSystemStyle:", v6);
  v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Settings: set SystemStyle: %{public}@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)settingsView:(id)a3 didChangeToStylePreset:(int64_t)a4
{
  -[CAMSmartStyleSettingsRootController set_currentStylePreset:](self, "set_currentStylePreset:", a4);
}

- (id)_readSystemStyleFromDefaultsWrites
{
  void *v2;
  id v3;
  void *v4;
  int64_t v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[CAMSmartStyleUtilities readAVCaptureSystemStyle](CAMSmartStyleUtilities, "readAVCaptureSystemStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D0D098]);
  objc_msgSend(v2, "cast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CAMCaptureConversions CEKSmartStylePresetTypeForAVSmartStyleCastType:](CAMCaptureConversions, "CEKSmartStylePresetTypeForAVSmartStyleCastType:", v4);
  objc_msgSend(v2, "intensity");
  v7 = v6;
  objc_msgSend(v2, "toneBias");
  v9 = v8;
  objc_msgSend(v2, "colorBias");
  v11 = (void *)objc_msgSend(v3, "initWithPresetType:castIntensity:toneBias:colorBias:", v5, v7, v9, v10);

  v12 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = v11;
    _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Settings: read SystemStyle: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  return v11;
}

- (CAMSmartStyleSettingsPickerViewController)_currentPickerViewController
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[CAMSmartStyleSettingsRootController _pickerNavigationController](self, "_pickerNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (CAMSmartStyleSettingsPickerViewController *)v5;
}

- (BOOL)_validateIsCurrentPicker:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  -[CAMSmartStyleSettingsRootController _currentPickerViewController](self, "_currentPickerViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CAMSmartStyleSettingsRootController _validateIsCurrentPicker:].cold.1((uint64_t)v4, self, v6);

  }
  return v5 == v4;
}

- (void)smartStyleSettingsPickerDidUpdateSelectedAssetIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CAMSmartStyleSettingsRootController _validateIsCurrentPicker:](self, "_validateIsCurrentPicker:", v4))
  {
    objc_msgSend(v4, "selectedAssetIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "initialSelectedAssetIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMSmartStyleSettingsResourceLoadingManager logIdentifierForAssetIdentifiers:](self->__resourceLoadingManager, "logIdentifierForAssetIdentifiers:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Settings: didUpdateSelectedAssetIdentifiers %{public}@", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSmartStyleSettingsResourceLoadingManager loadResourcesForAssetIdentifiers:unloadAllOthers:](self->__resourceLoadingManager, "loadResourcesForAssetIdentifiers:unloadAllOthers:", v9, 1);
    if (!-[NSArray isEqualToArray:](self->__selectedAssetIdentifiers, "isEqualToArray:", v5))
    {
      objc_storeStrong((id *)&self->__selectedAssetIdentifiers, v5);
      -[CAMSmartStyleSettingsRootController _settingsView](self, "_settingsView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateImageViews");

    }
  }

}

- (void)smartStyleSettingsPickerDidConfirmSelection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CAMSmartStyleSettingsRootController _validateIsCurrentPicker:](self, "_validateIsCurrentPicker:", v4))
  {
    objc_msgSend(v4, "selectedAssetIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CAMSmartStyleSettingsResourceLoadingManager isWaitingOnLoadingForAssetIdentifiers:](self->__resourceLoadingManager, "isWaitingOnLoadingForAssetIdentifiers:", v5))
    {
      v6 = os_log_create("com.apple.camera", "SmartStyleSettings");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMSmartStyleSettingsResourceLoadingManager logIdentifierForAssetIdentifiers:](self->__resourceLoadingManager, "logIdentifierForAssetIdentifiers:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138543362;
        v9 = v7;
        _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Settings: didFinishPicking %{public}@ (waiting on loading)", (uint8_t *)&v8, 0xCu);

      }
      objc_msgSend(v4, "setWaitingOnLoading:", 1);
    }
    else
    {
      -[CAMSmartStyleSettingsRootController _didFinishPickingFromPicker:](self, "_didFinishPickingFromPicker:", v4);
    }

  }
}

- (void)_didFinishPickingFromPicker:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "selectedAssetIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CAMSmartStyleSettingsResourceLoadingManager logIdentifierForAssetIdentifiers:](self->__resourceLoadingManager, "logIdentifierForAssetIdentifiers:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Settings: didFinishPicking %{public}@", (uint8_t *)&v10, 0xCu);

  }
  if (!-[NSArray isEqualToArray:](self->__selectedAssetIdentifiers, "isEqualToArray:", v4))
  {
    objc_storeStrong((id *)&self->__selectedAssetIdentifiers, v4);
    -[CAMSmartStyleSettingsRootController _settingsView](self, "_settingsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateImageViews");

  }
  -[CAMSmartStyleSettingsResourceLoadingManager loadResourcesForAssetIdentifiers:unloadAllOthers:](self->__resourceLoadingManager, "loadResourcesForAssetIdentifiers:unloadAllOthers:", v4, 1);
  -[CAMSmartStyleSettingsRootController _writeSelectedAssetIdentifiers:](self, "_writeSelectedAssetIdentifiers:", v4);
  -[CAMSmartStyleSettingsRootController _settingsView](self, "_settingsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoomOutToGridAnimated:", 0);

  if (-[NSArray count](self->__selectedAssetIdentifiers, "count"))
  {
    -[CAMSmartStyleSettingsRootController _settingsView](self, "_settingsView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didFinishPickingAssets");

  }
  -[CAMSmartStyleSettingsRootController _dismissPicker](self, "_dismissPicker");

}

- (void)_pickerDidCancel
{
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int16 v12;

  -[CAMSmartStyleSettingsRootController _currentPickerViewController](self, "_currentPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWaitingOnLoading");
  v5 = os_log_create("com.apple.camera", "SmartStyleSettings");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6)
      goto LABEL_7;
    v12 = 0;
    v7 = "Settings: did cancel picker while waiting for loading";
    v8 = (uint8_t *)&v12;
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    LOWORD(v11) = 0;
    v7 = "Settings: did cancel";
    v8 = (uint8_t *)&v11;
  }
  _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
LABEL_7:

  objc_msgSend(v3, "initialSelectedAssetIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSArray isEqualToArray:](self->__selectedAssetIdentifiers, "isEqualToArray:", v9))
  {
    objc_storeStrong((id *)&self->__selectedAssetIdentifiers, v9);
    -[CAMSmartStyleSettingsRootController _settingsView](self, "_settingsView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateImageViews");

  }
  -[CAMSmartStyleSettingsRootController _dismissPicker](self, "_dismissPicker", v11);

}

- (void)_dismissPicker
{
  UINavigationController *pickerNavigationController;

  pickerNavigationController = self->__pickerNavigationController;
  self->__pickerNavigationController = 0;

  -[CAMSmartStyleSettingsRootController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)smartStyleSettingsResourceLoadingManager:(id)a3 didFinishLoadingForAssetIdentifier:(id)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CAMSmartStyleSettingsRootController _currentPickerViewController](self, "_currentPickerViewController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isWaitingOnLoading"))
  {
    objc_msgSend(v5, "selectedAssetIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CAMSmartStyleSettingsResourceLoadingManager isWaitingOnLoadingForAssetIdentifiers:](self->__resourceLoadingManager, "isWaitingOnLoadingForAssetIdentifiers:", v6))
    {
      v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMSmartStyleSettingsResourceLoadingManager logIdentifierForAssetIdentifiers:](self->__resourceLoadingManager, "logIdentifierForAssetIdentifiers:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Settings: did finish waiting for loading %{public}@", (uint8_t *)&v10, 0xCu);

      }
      -[CAMSmartStyleSettingsRootController _didFinishPickingFromPicker:](self, "_didFinishPickingFromPicker:", v5);
    }

  }
  -[CAMSmartStyleSettingsRootController _settingsView](self, "_settingsView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateImageViews");

}

- (id)_readSelectedAssetIdentifiers
{
  void *v2;
  id v3;
  void *v4;
  double Current;
  void *v6;
  double v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  uint8_t v26[128];
  _BYTE buf[24];
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CAMUserPreferencesSmartStylesSettingsSelectedAssetIdentifiers"), CFSTR("com.apple.camera"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v28 = 1;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __68__CAMSmartStyleSettingsRootController__readSelectedAssetIdentifiers__block_invoke;
    v25[3] = &unk_1EA32C260;
    v25[4] = buf;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v25);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      _Block_object_dispose(buf, 8);
      if (v2)
        goto LABEL_8;
    }
    else
    {

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {

  }
  v2 = (void *)MEMORY[0x1E0C9AA60];
LABEL_8:
  if (objc_msgSend(v2, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CD1570]);
    objc_msgSend(MEMORY[0x1E0D71880], "predicateForStyleableAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInternalPredicate:", v4);

    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFAbsoluteTimeGetCurrent();
    v8 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v7 - Current;
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Settings: Fetching assets for validation took %.3f seconds", buf, 0xCu);
    }

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v13), "localIdentifier", (_QWORD)v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);
    }

    v15 = objc_msgSend(v2, "count");
    if (v15 != objc_msgSend(v9, "count"))
    {
      v16 = os_log_create("com.apple.camera", "SmartStyleSettings");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(v9, "count");
        v18 = objc_msgSend(v2, "count");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v18;
        _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "Settings: Could only find %ld assets out of %ld", buf, 0x16u);
      }

      v19 = v9;
      v2 = v19;
    }

  }
  return v2;
}

void __68__CAMSmartStyleSettingsRootController__readSelectedAssetIdentifiers__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)_writeSelectedAssetIdentifiers:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("CAMUserPreferencesSmartStylesSettingsSelectedAssetIdentifiers"), a3, CFSTR("com.apple.camera"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CAMSmartStyleSettingsView)_settingsView
{
  return self->__settingsView;
}

- (NSArray)_selectedAssetIdentifiers
{
  return self->__selectedAssetIdentifiers;
}

- (CAMSmartStyleSettingsResourceLoadingManager)_resourceLoadingManager
{
  return self->__resourceLoadingManager;
}

- (int64_t)_currentStylePreset
{
  return self->__currentStylePreset;
}

- (void)set_currentStylePreset:(int64_t)a3
{
  self->__currentStylePreset = a3;
}

- (NSMutableDictionary)_cachedStyles
{
  return self->__cachedStyles;
}

- (CEKSmartStyle)_persistedSystemStyle
{
  return self->__persistedSystemStyle;
}

- (UINavigationController)_pickerNavigationController
{
  return self->__pickerNavigationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pickerNavigationController, 0);
  objc_storeStrong((id *)&self->__persistedSystemStyle, 0);
  objc_storeStrong((id *)&self->__cachedStyles, 0);
  objc_storeStrong((id *)&self->__resourceLoadingManager, 0);
  objc_storeStrong((id *)&self->__selectedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->__settingsView, 0);
}

- (void)_validateIsCurrentPicker:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "_currentPickerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "Settings: got picker callback from %{public}@ instead of expected %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
