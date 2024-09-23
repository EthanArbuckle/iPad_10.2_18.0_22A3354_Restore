@implementation MFComposePhotoPickerController

void ___ef_log_MFComposePhotoPickerController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MFComposePhotoPickerController");
  v1 = (void *)_ef_log_MFComposePhotoPickerController_log;
  _ef_log_MFComposePhotoPickerController_log = (uint64_t)v0;

}

- (MFComposePhotoPickerController)initWithPreselectedAssetIdentifiers:(id)a3
{
  id v4;
  MFComposePhotoPickerController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableSet *existingAssets;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *assetLoadingQueue;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFComposePhotoPickerController;
  v5 = -[MFComposePhotoPickerController init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v4, "ef_compactMap:", &__block_literal_global_11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithSet:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    existingAssets = v5->_existingAssets;
    v5->_existingAssets = (NSMutableSet *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.email.photopicker.loadingQueue", v11);
    assetLoadingQueue = v5->_assetLoadingQueue;
    v5->_assetLoadingQueue = (OS_dispatch_queue *)v12;

    -[MFComposePhotoPickerController _setupPickerViewController](v5, "_setupPickerViewController");
  }

  return v5;
}

id __70__MFComposePhotoPickerController_initWithPreselectedAssetIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  +[MFComposePhotoPickerItem assetIdentifierFromContentIdentifier:](MFComposePhotoPickerItem, "assetIdentifierFromContentIdentifier:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setupPickerViewController
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  PHPickerViewController *v12;
  PHPickerViewController *pickerViewController;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v3 = (void *)getPHPickerConfigurationClass_softClass;
  v22 = getPHPickerConfigurationClass_softClass;
  if (!getPHPickerConfigurationClass_softClass)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __getPHPickerConfigurationClass_block_invoke;
    v17 = &unk_1E5A65EF8;
    v18 = &v19;
    __getPHPickerConfigurationClass_block_invoke((uint64_t)&v14);
    v3 = (void *)v20[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v19, 8);
  v5 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPhotoLibrary:", v6);

  objc_msgSend(v7, "setSelection:", 2);
  objc_msgSend(v7, "setSelectionLimit:", 0);
  -[MFComposePhotoPickerController existingAssets](self, "existingAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreselectedAssetIdentifiers:", v9);

  objc_msgSend(v7, "setPreferredAssetRepresentationMode:", 2);
  objc_msgSend(v7, "_setDisabledPrivateCapabilities:", 64);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v10 = (void *)getPHPickerViewControllerClass_softClass;
  v22 = getPHPickerViewControllerClass_softClass;
  if (!getPHPickerViewControllerClass_softClass)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __getPHPickerViewControllerClass_block_invoke;
    v17 = &unk_1E5A65EF8;
    v18 = &v19;
    __getPHPickerViewControllerClass_block_invoke((uint64_t)&v14);
    v10 = (void *)v20[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v19, 8);
  v12 = (PHPickerViewController *)objc_msgSend([v11 alloc], "initWithConfiguration:", v7);
  pickerViewController = self->_pickerViewController;
  self->_pickerViewController = v12;

  -[PHPickerViewController setDelegate:](self->_pickerViewController, "setDelegate:", self);
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFComposePhotoPickerController existingAssets](self, "existingAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "differenceFromSet:", v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFComposePhotoPickerController delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "hasChanges") & 1) == 0)
  {
    -[MFComposePhotoPickerController progressManager](self, "progressManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancelEverything");

    objc_msgSend(v21, "photoPickerControllerDidCancel:", self);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v23, "removals");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v10);
        -[MFComposePhotoPickerController _removeAssetWithIdentifier:](self, "_removeAssetWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v23, "insertions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v26;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18);
        v24[0] = v17;
        v24[1] = 3221225472;
        v24[2] = __58__MFComposePhotoPickerController_picker_didFinishPicking___block_invoke_2;
        v24[3] = &unk_1E5A65E58;
        v24[4] = v19;
        objc_msgSend(v5, "ef_firstObjectPassingTest:", v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          -[MFComposePhotoPickerController _loadAssetForPickerResult:](self, "_loadAssetForPickerResult:", v20);

        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v15);
  }

}

id __58__MFComposePhotoPickerController_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "assetIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __58__MFComposePhotoPickerController_picker_didFinishPicking___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "assetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  uint64_t v3;
  double result;

  v3 = objc_msgSend(a3, "verticalSizeClass");
  result = 300.0;
  if (v3 == 1)
    return 160.0;
  return result;
}

- (void)_removeAssetWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ef_log_MFComposePhotoPickerController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v4;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "Remove asset with identifier %{public}@", buf, 0xCu);
  }

  -[MFComposePhotoPickerController existingAssets](self, "existingAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  -[MFComposePhotoPickerController progressManager](self, "progressManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelProgressFor:", v4);

  -[MFComposePhotoPickerController pickerViewController](self, "pickerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_stopActivityIndicatorsForAssetsWithIdentifiers:", v9);

  -[MFComposePhotoPickerController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoPickerController:didRemoveAsset:", self, v4);

}

- (void)_loadAssetForPickerResult:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "assetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ef_log_MFComposePhotoPickerController();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "itemProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registeredContentTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v5;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "Adding asset with identifier: %{public}@, registeredContentTypes: %{public}@", buf, 0x16u);

  }
  -[MFComposePhotoPickerController pickerViewController](self, "pickerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_startActivityIndicatorsForAssetsWithIdentifiers:", v10);

  -[MFComposePhotoPickerController assetLoadingQueue](self, "assetLoadingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke;
  v14[3] = &unk_1E5A65BD8;
  v14[4] = self;
  v15 = v4;
  v16 = v5;
  v12 = v5;
  v13 = v4;
  dispatch_async(v11, v14);

}

void __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke_2;
  v12[3] = &unk_1E5A65E80;
  v12[4] = v2;
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_loadAssetForPickerResult:completionHandler:", v3, v12);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke_4;
  v8[3] = &unk_1E5A65BD8;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performBlock:", v8);

}

void __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke_3;
  v8[3] = &unk_1E5A65BD8;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performBlock:", v8);

}

void __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoPickerController:didAddItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  else
  {
    objc_msgSend(v2, "pickerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deselectAssetsWithIdentifiers:", v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "progressManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelProgressFor:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "pickerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_stopActivityIndicatorsForAssetsWithIdentifiers:", v9);

}

void __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "existingAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "progressManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProgress:for:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

    _ef_log_MFComposePhotoPickerController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "Added asset with identifier: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v2, "pickerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deselectAssetsWithIdentifiers:", v9);

    objc_msgSend(*(id *)(a1 + 40), "pickerViewController");
    v6 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject _stopActivityIndicatorsForAssetsWithIdentifiers:](v6, "_stopActivityIndicatorsForAssetsWithIdentifiers:", v10);

  }
}

- (id)_loadAssetForPickerResult:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _BYTE buf[12];
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "itemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    _ef_log_MFComposePhotoPickerController();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MFComposePhotoPickerController _loadAssetForPickerResult:completionHandler:].cold.1((uint64_t)v9, v10, v18, v19, v20, v21, v22, v23);
    goto LABEL_11;
  }
  objc_msgSend(v8, "registeredContentTypes");
  v10 = objc_claimAutoreleasedReturnValue();
  +[MFComposePhotoPickerItem bestTypeToLoadFrom:](MFComposePhotoPickerItem, "bestTypeToLoadFrom:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ef_log_MFComposePhotoPickerController();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MFComposePhotoPickerController _loadAssetForPickerResult:completionHandler:].cold.2((uint64_t)v9);

LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  v14 = v12;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    v31 = 2114;
    v32 = v15;
    _os_log_impl(&dword_1AB96A000, v14, OS_LOG_TYPE_DEFAULT, "Loading representation for assetIdentifier: %{public}@ with type: %{public}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __78__MFComposePhotoPickerController__loadAssetForPickerResult_completionHandler___block_invoke;
  v25[3] = &unk_1E5A65EA8;
  objc_copyWeak(&v29, (id *)buf);
  v26 = v9;
  v16 = v11;
  v27 = v16;
  v28 = v7;
  objc_msgSend(v8, "loadFileRepresentationForContentType:openInPlace:completionHandler:", v16, 0, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);

LABEL_12:
  return v17;
}

void __78__MFComposePhotoPickerController__loadAssetForPickerResult_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v6 || v7)
  {
    _ef_log_MFComposePhotoPickerController();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __78__MFComposePhotoPickerController__loadAssetForPickerResult_completionHandler___block_invoke_cold_2(a1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v9, "mf_copyFileAtURLToContainer:securityScoped:preferredFileName:error:", v6, 0, 0, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    if (!v10 || v11)
    {
      _ef_log_MFComposePhotoPickerController();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __78__MFComposePhotoPickerController__loadAssetForPickerResult_completionHandler___block_invoke_cold_1(a1);

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      objc_msgSend(WeakRetained, "_photoPickerItemForAssetIdentifier:assetURL:contentType:completionHandler:", *(_QWORD *)(a1 + 32), v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }

  }
}

- (void)_photoPickerItemForAssetIdentifier:(id)a3 assetURL:(id)a4 contentType:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, MFComposePhotoPickerItem *);
  uint64_t v13;
  int v14;
  MFComposePhotoPickerItem *v15;
  id v16;
  MFComposePhotoPickerItem *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  MFComposePhotoPickerItem *v29;
  void (**v30)(id, MFComposePhotoPickerItem *);
  id v31;
  id v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, MFComposePhotoPickerItem *))a6;
  if (objc_msgSend(v11, "conformsToType:", *MEMORY[0x1E0CEC520]))
  {
    v32 = 0;
    v13 = *MEMORY[0x1E0C998E0];
    v31 = 0;
    v14 = objc_msgSend(v10, "getResourceValue:forKey:error:", &v32, v13, &v31);
    v15 = (MFComposePhotoPickerItem *)v32;
    v16 = v31;
    if (v14)
    {
      if ((-[MFComposePhotoPickerItem conformsToType:](v15, "conformsToType:", *MEMORY[0x1E0CEC530]) & 1) != 0
        || (-[MFComposePhotoPickerItem conformsToType:](v15, "conformsToType:", *MEMORY[0x1E0CEC580]) & 1) != 0
        || -[MFComposePhotoPickerItem conformsToType:](v15, "conformsToType:", *MEMORY[0x1E0CEC4F8]))
      {
        v17 = -[MFComposePhotoPickerItem initWithAssetIdentifier:assetURL:assetData:contentType:]([MFComposePhotoPickerItem alloc], "initWithAssetIdentifier:assetURL:assetData:contentType:", v9, v10, 0, v11);
        v12[2](v12, v17);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D46080], "dataWithContentsOfURL:", v10);
        v17 = (MFComposePhotoPickerItem *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "removeItemAtURL:error:", v10, 0);

        -[MFComposePhotoPickerItem identifier](v15, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __108__MFComposePhotoPickerController__photoPickerItemForAssetIdentifier_assetURL_contentType_completionHandler___block_invoke;
        v27[3] = &unk_1E5A65ED0;
        v28 = v9;
        v30 = v12;
        v29 = v15;
        +[MFMediaExporter jpegRepresentationForImageData:inputContentType:completion:](MFMediaExporter, "jpegRepresentationForImageData:inputContentType:completion:", v17, v26, v27);

      }
    }
    else
    {
      _ef_log_MFComposePhotoPickerController();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[MFComposePhotoPickerController _photoPickerItemForAssetIdentifier:assetURL:contentType:completionHandler:].cold.1((uint64_t)v10, v18, v19, v20, v21, v22, v23, v24);

      v12[2](v12, 0);
    }

  }
  else
  {
    v15 = -[MFComposePhotoPickerItem initWithAssetIdentifier:assetURL:assetData:contentType:]([MFComposePhotoPickerItem alloc], "initWithAssetIdentifier:assetURL:assetData:contentType:", v9, v10, 0, v11);
    v12[2](v12, v15);
  }

}

void __108__MFComposePhotoPickerController__photoPickerItemForAssetIdentifier_assetURL_contentType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MFComposePhotoPickerItem *v4;
  MFComposePhotoPickerItem *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = [MFComposePhotoPickerItem alloc];
    v5 = -[MFComposePhotoPickerItem initWithAssetIdentifier:assetURL:assetData:contentType:](v4, "initWithAssetIdentifier:assetURL:assetData:contentType:", *(_QWORD *)(a1 + 32), 0, v3, *MEMORY[0x1E0CEC530]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    _ef_log_MFComposePhotoPickerController();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __108__MFComposePhotoPickerController__photoPickerItemForAssetIdentifier_assetURL_contentType_completionHandler___block_invoke_cold_1(v7, v8, v9, v6);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (MFComposePhotoPickerControllerDelegate)delegate
{
  return (MFComposePhotoPickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHPickerViewController)pickerViewController
{
  return self->_pickerViewController;
}

- (NSMutableSet)existingAssets
{
  return self->_existingAssets;
}

- (void)setExistingAssets:(id)a3
{
  objc_storeStrong((id *)&self->_existingAssets, a3);
}

- (MFComposePhotoPickerProgressManager)progressManager
{
  return self->_progressManager;
}

- (void)setProgressManager:(id)a3
{
  objc_storeStrong((id *)&self->_progressManager, a3);
}

- (OS_dispatch_queue)assetLoadingQueue
{
  return self->_assetLoadingQueue;
}

- (void)setAssetLoadingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assetLoadingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLoadingQueue, 0);
  objc_storeStrong((id *)&self->_progressManager, 0);
  objc_storeStrong((id *)&self->_existingAssets, 0);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_loadAssetForPickerResult:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1AB96A000, a2, a3, "Could not load asset %{public}@ because no item provider was provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_loadAssetForPickerResult:(uint64_t)a1 completionHandler:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1AB96A000, v1, v2, "Cannot load asset %{public}@, because neither of the registeredContentTypes - %{public}@ are supported.", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_4();
}

void __78__MFComposePhotoPickerController__loadAssetForPickerResult_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1AB96A000, v1, v2, "Error copying asset %{public}@, error: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_4();
}

void __78__MFComposePhotoPickerController__loadAssetForPickerResult_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1AB96A000, v1, v2, "Error loading asset %{public}@, error: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_4();
}

- (void)_photoPickerItemForAssetIdentifier:(uint64_t)a3 assetURL:(uint64_t)a4 contentType:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1AB96A000, a2, a3, "Error getting contentType value from url: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __108__MFComposePhotoPickerController__photoPickerItemForAssetIdentifier_assetURL_contentType_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "Error exporting asset %{public}@ with contentType %{public}@ as JPEG", buf, 0x16u);

}

@end
