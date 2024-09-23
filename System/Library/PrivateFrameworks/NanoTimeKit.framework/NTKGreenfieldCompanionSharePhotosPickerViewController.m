@implementation NTKGreenfieldCompanionSharePhotosPickerViewController

- (NTKGreenfieldCompanionSharePhotosPickerViewController)initWithPhotosFace:(id)a3
{
  id v5;
  NTKCFaceDetailCustomPhotosFlowLayout *v6;
  NTKGreenfieldCompanionSharePhotosPickerViewController *v7;
  NTKGreenfieldCompanionSharePhotosPickerViewController *v8;
  uint64_t v9;
  NSMutableIndexSet *selectedIndexes;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v5 = a3;
  v6 = objc_alloc_init(NTKCFaceDetailCustomPhotosFlowLayout);
  v15.receiver = self;
  v15.super_class = (Class)NTKGreenfieldCompanionSharePhotosPickerViewController;
  v7 = -[NTKGreenfieldCompanionSharePhotosPickerViewController initWithCollectionViewLayout:](&v15, sel_initWithCollectionViewLayout_, v6);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_originalFace, a3);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v9 = objc_claimAutoreleasedReturnValue();
    selectedIndexes = v8->_selectedIndexes;
    v8->_selectedIndexes = (NSMutableIndexSet *)v9;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.NanoTimeKit.NTKGreenfieldCompanionSharePhotosPickerViewController", v11);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)NTKGreenfieldCompanionSharePhotosPickerViewController;
  -[NTKGreenfieldCompanionSharePhotosPickerViewController viewDidLoad](&v17, sel_viewDidLoad);
  NTKClockFaceLocalizedString(CFSTR("GREENFIELD_SHARING_PHOTOS_NAV_PROMPT_LOADING"), CFSTR("Share up to %d photos from this album"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v3, -[NSMutableIndexSet count](self->_selectedIndexes, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldCompanionSharePhotosPickerViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrompt:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldCompanionSharePhotosPickerViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[NTKGreenfieldCompanionSharePhotosPickerViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToolbarHidden:", 0);

  NTKCCustomizationLocalizedString(CFSTR("PHOTOS_DESELECT_ALL"), (uint64_t)CFSTR("Deselect All"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v10, 0, self, sel__didTapDeselectAll);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v18[0] = v12;
  v18[1] = v11;
  v18[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldCompanionSharePhotosPickerViewController setToolbarItems:](self, "setToolbarItems:", v13);

  -[NTKGreenfieldCompanionSharePhotosPickerViewController _setupNavigationItems](self, "_setupNavigationItems");
  -[NTKGreenfieldCompanionSharePhotosPickerViewController _setupCollectionView](self, "_setupCollectionView");
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__NTKGreenfieldCompanionSharePhotosPickerViewController_viewDidLoad__block_invoke;
  v14[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v15, &location);
  -[NTKGreenfieldCompanionSharePhotosPickerViewController _createPhotosEditorWithCompletionBlock:](self, "_createPhotosEditorWithCompletionBlock:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __68__NTKGreenfieldCompanionSharePhotosPickerViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleEditorDidCreated");

}

- (void)_setupNavigationItems
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  NTKCompanionSyncedAlbumEditor *v8;
  NTKCompanionSyncedAlbumEditor *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__didTapOnCancelButton);
  -[NTKGreenfieldCompanionSharePhotosPickerViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", v15);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__didTapOnDoneButton);
  -[NTKGreenfieldCompanionSharePhotosPickerViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  if (NTKPhotosIsCustomPhotosFace(self->_originalFace))
  {
    v6 = CFSTR("EDIT_OPTION_LABEL_PHOTOS_CUSTOM_COMPANION");
    v7 = CFSTR("Photos");
LABEL_5:
    NTKCompanionClockFaceLocalizedString(v6, v7);
    v8 = (NTKCompanionSyncedAlbumEditor *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldCompanionSharePhotosPickerViewController setTitle:](self, "setTitle:", v8);
    goto LABEL_6;
  }
  if (NTKPhotosIsMemoryPhotosFace(self->_originalFace))
  {
    v6 = CFSTR("EDIT_OPTION_LABEL_PHOTOS_MEMORY_COMPANION");
    v7 = CFSTR("Dynamic");
    goto LABEL_5;
  }
  if (!NTKPhotosIsSyncedAlbumPhotosFace(self->_originalFace))
    goto LABEL_7;
  v9 = [NTKCompanionSyncedAlbumEditor alloc];
  -[NTKFace resourceDirectory](self->_originalFace, "resourceDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace device](self->_originalFace, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NTKCompanionSinglePHAssetEditor initWithResourceDirectory:forDevice:shouldFinalize:](v9, "initWithResourceDirectory:forDevice:shouldFinalize:", v10, v11, 0);

  -[NTKCompanionSinglePHAssetEditor albumIdentifier](v8, "albumIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace device](self->_originalFace, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NTKAlbumNameForLocalIdentifier(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldCompanionSharePhotosPickerViewController setTitle:](self, "setTitle:", v14);

LABEL_6:
LABEL_7:

}

- (void)_didTapOnCancelButton
{
  -[NTKGreenfieldCompanionSharePhotosPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_didTapOnDoneButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  NTKCompanionCustomPhotosEditor *editor;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v3, "startAnimating");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v3);
  -[NTKGreenfieldCompanionSharePhotosPickerViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, -[NTKCompanionCustomPhotosEditor photosCount](self->_editor, "photosCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeIndexes:", self->_selectedIndexes);
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke;
  v15[3] = &unk_1E6BD1F60;
  v15[4] = self;
  objc_msgSend(v6, "enumerateIndexesWithOptions:usingBlock:", 2, v15);
  objc_initWeak(&location, self);
  if (-[NTKCompanionResourceDirectoryEditor state](self->_editor, "state") == 1)
  {
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke_2;
    v12[3] = &unk_1E6BCD7F0;
    v8 = &v13;
    objc_copyWeak(&v13, &location);
    -[NTKGreenfieldCompanionSharePhotosPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v12);
  }
  else
  {
    editor = self->_editor;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke_3;
    v10[3] = &unk_1E6BD1F88;
    v8 = &v11;
    objc_copyWeak(&v11, &location);
    -[NTKCompanionCustomPhotosEditor finalizeWithCompletion:](editor, "finalizeWithCompletion:", v10);
  }
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

}

uint64_t __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "deletePhotoAtIndex:", a2);
}

void __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "companionSharePhotosPickerViewController:didFinishWithFace:", v3, v3[126]);

    WeakRetained = v3;
  }

}

void __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke_4;
    v6[3] = &unk_1E6BCD778;
    v6[4] = WeakRetained;
    v7 = v3;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  }
}

uint64_t __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidFinishWithNewResourcesDirectory:", *(_QWORD *)(a1 + 40));
}

- (void)_createPhotosEditorWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__NTKGreenfieldCompanionSharePhotosPickerViewController__createPhotosEditorWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E6BD00B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __96__NTKGreenfieldCompanionSharePhotosPickerViewController__createPhotosEditorWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 IsCustomPhotosFace;
  NTKCompanionCustomPhotosEditor *v4;
  NTKCompanionCustomPhotosEditor *v5;
  void *v6;
  NTKCompanionCustomPhotosEditor *v7;
  uint64_t v8;
  void *v9;
  NTKCompanionCustomPhotosEditor *v10;
  id v11;

  v11 = *(id *)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsCustomPhotosFace = NTKPhotosIsCustomPhotosFace(*(void **)(*(_QWORD *)(a1 + 32) + 1008));
  v4 = [NTKCompanionCustomPhotosEditor alloc];
  v5 = v4;
  if (IsCustomPhotosFace)
  {
    objc_msgSend(v11, "resourceDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NTKCompanionCustomPhotosEditor initWithResourceDirectory:forDevice:](v5, "initWithResourceDirectory:forDevice:", v6, v2);
  }
  else
  {
    v7 = -[NTKCompanionCustomPhotosEditor initWithResourceDirectory:forDevice:](v4, "initWithResourceDirectory:forDevice:", 0, v2);
    objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAssets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCompanionCustomPhotosEditor addAssetsFromAssetList:maxPhotosCount:](v7, "addAssetsFromAssetList:maxPhotosCount:", v6, -1);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 1016);
  *(_QWORD *)(v8 + 1016) = v7;
  v10 = v7;

  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
}

- (id)_queue_fetchAssets
{
  NTKGreenfieldCompanionSharePhotosPickerViewController *v2;
  id *p_originalFace;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  NSObject *v32;
  uint64_t v33;
  NTKGreenfieldCompanionSharePhotosPickerViewController *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  NSObject *v52;
  uint64_t v53;

  v2 = self;
  v53 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_originalFace = (id *)&v2->_originalFace;
  -[NTKFace device](v2->_originalFace, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (NTKPhotosIsSyncedAlbumPhotosFace(v2->_originalFace))
  {
    objc_msgSend(*p_originalFace, "resourceDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "assetCollectionIdentifier");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38)
      v7 = 4;
    else
      v7 = 1;

  }
  else
  {
    if (!NTKPhotosIsMemoryPhotosFace(*p_originalFace))
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[NTKGreenfieldCompanionSharePhotosPickerViewController _queue_fetchAssets].cold.2((uint64_t *)&v2->_originalFace, v38);
      v22 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_44;
    }
    v38 = 0;
    v7 = 3;
  }
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v50 = v7;
    v51 = 2112;
    v52 = v38;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Fetching assets with collectionTarget:%ld albumIdentifier:%@", buf, 0x16u);
  }

  v9 = objc_alloc(MEMORY[0x1E0D515F8]);
  objc_msgSend(v4, "nrDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCollectionTarget:device:", v7, v10);

  if (!v38 || v7 == 3)
  {
    objc_msgSend(v11, "assetCollections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v11, "assetCollections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v13)
    {
      v35 = v2;
      v36 = v11;
      v37 = v4;
      v14 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v44 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
          v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(MEMORY[0x1E0CD14D8], "uuidFromLocalIdentifier:", v38);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "initWithUUIDString:", v18);

          NTK_npto_uuid(v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqual:", v20);

          if (v21)
          {
            v13 = v16;

            goto LABEL_26;
          }

        }
        v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v13)
          continue;
        break;
      }
LABEL_26:
      v4 = v37;
      v2 = v35;
    }
  }

  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = (uint64_t)v13;
    _os_log_impl(&dword_1B72A3000, v23, OS_LOG_TYPE_DEFAULT, "Fetching assets with assetCollection: %@", buf, 0xCu);
  }

  if (v13)
  {
    -[NTKGreenfieldCompanionSharePhotosPickerViewController _queue_fetchOptions](v2, "_queue_fetchOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchAssetsInAssetCollection:options:", v13, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v27 = v25;
    v28 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(v26, "addObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j), v35, v36, v37);
        }
        v29 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v29);
    }

    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_msgSend(v26, "count");
      *(_DWORD *)buf = 134217984;
      v50 = v33;
      _os_log_impl(&dword_1B72A3000, v32, OS_LOG_TYPE_DEFAULT, "Fetching assets. Found %lu assets.", buf, 0xCu);
    }

    v22 = (void *)objc_msgSend(v26, "copy");
  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[NTKGreenfieldCompanionSharePhotosPickerViewController _queue_fetchAssets].cold.1(v27);
    v22 = (void *)MEMORY[0x1E0C9AA60];
  }

LABEL_44:
  return v22;
}

- (id)_queue_fetchOptions
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CD1570]);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v4);

  v7 = *MEMORY[0x1E0CD1A18];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addFetchPropertySets:", v5);

  return v2;
}

- (void)_setupCollectionView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldCompanionSharePhotosPickerViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[NTKGreenfieldCompanionSharePhotosPickerViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  +[NTKCPhotoListCell reuseIdentifier](NTKCPhotoListCell, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", v6, v7);

  -[NTKGreenfieldCompanionSharePhotosPickerViewController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlwaysBounceVertical:", 1);

}

- (void)_handleSelectionChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;

  NTKClockFaceLocalizedString(CFSTR("GREENFIELD_SHARING_PHOTOS_NAV_PROMPT"), CFSTR("Share up to %d photos from this album (%@)"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(CFSTR("GREENFIELD_SHARING_PHOTOS_NAV_PROMPT_SELECTED_COUNT"), CFSTR("%lu Selected"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v3, -[NSMutableIndexSet count](self->_selectedIndexes, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v10, 24, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldCompanionSharePhotosPickerViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrompt:", v5);

  v7 = -[NSMutableIndexSet count](self->_selectedIndexes, "count") != 0;
  -[NTKGreenfieldCompanionSharePhotosPickerViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

}

- (void)_handleDidFinishWithNewResourcesDirectory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[NTKFace deepCopy](self->_originalFace, "deepCopy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setResourceDirectory:", v8);
    -[NTKFace device](self->_originalFace, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKPhotosContentEditOption optionWithPhotosContent:forDevice:](NTKPhotosContentEditOption, "optionWithPhotosContent:forDevice:", 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectOption:forCustomEditMode:slot:", v6, 12, 0);
    -[NTKGreenfieldCompanionSharePhotosPickerViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "companionSharePhotosPickerViewController:didFinishWithFace:", self, v4);

  }
  else
  {
    -[NTKGreenfieldCompanionSharePhotosPickerViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "companionSharePhotosPickerViewController:didFinishWithFace:", self, 0);
  }

}

- (void)_handleEditorDidCreated
{
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;

  v3 = -[NTKCompanionCustomPhotosEditor photosCount](self->_editor, "photosCount");
  if (v3 >= 0x18)
    v4 = 24;
  else
    v4 = v3;
  if (v4)
  {
    for (i = 0; i != v4; ++i)
      -[NSMutableIndexSet addIndex:](self->_selectedIndexes, "addIndex:", i);
  }
  -[NTKGreenfieldCompanionSharePhotosPickerViewController _handleSelectionChanged](self, "_handleSelectionChanged");
  -[NTKGreenfieldCompanionSharePhotosPickerViewController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (void)_didTapDeselectAll
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NSMutableIndexSet removeAllIndexes](self->_selectedIndexes, "removeAllIndexes");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NTKGreenfieldCompanionSharePhotosPickerViewController collectionView](self, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "setSelected:", 0);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[NTKGreenfieldCompanionSharePhotosPickerViewController _handleSelectionChanged](self, "_handleSelectionChanged");
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NTKCompanionCustomPhotosEditor photosCount](self->_editor, "photosCount", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NTKCompanionCustomPhotosEditor *editor;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, double, double, double, double);
  void *v19;
  id v20;
  id v21[2];
  id location;

  v6 = a3;
  v7 = a4;
  -[NTKGreenfieldCompanionSharePhotosPickerViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKCPhotoListCell reuseIdentifier](NTKCPhotoListCell, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v7, "item");
  objc_msgSend(v10, "setIndex:", v11);
  objc_initWeak(&location, self);
  editor = self->_editor;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __95__NTKGreenfieldCompanionSharePhotosPickerViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v19 = &unk_1E6BD1FB0;
  v13 = v10;
  v20 = v13;
  v21[1] = v11;
  objc_copyWeak(v21, &location);
  -[NTKCompanionCustomPhotosEditor imageAndCropForPhotoAtIndex:completion:](editor, "imageAndCropForPhotoAtIndex:completion:", v11, &v16);
  objc_msgSend(v13, "setPhoto:", 0, v16, v17, v18, v19);
  objc_msgSend(v13, "setCrop:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v13, "setSelected:", -[NSMutableIndexSet containsIndex:](self->_selectedIndexes, "containsIndex:", v11));
  v14 = v13;
  objc_destroyWeak(v21);

  objc_destroyWeak(&location);
  return v14;
}

void __95__NTKGreenfieldCompanionSharePhotosPickerViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, double x, double y, double width, double height)
{
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  id *WeakRetained;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "index") == *(_QWORD *)(a1 + 48))
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    if (!CGRectIsEmpty(v17))
    {
      objc_msgSend(v11, "scale");
      v13 = 1.0 / v12;
      objc_msgSend(v11, "scale");
      CGAffineTransformMakeScale(&v16, v13, 1.0 / v14);
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      v19 = CGRectApplyAffineTransform(v18, &v16);
      x = v19.origin.x;
      y = v19.origin.y;
      width = v19.size.width;
      height = v19.size.height;
    }
    objc_msgSend(*(id *)(a1 + 32), "setPhoto:", v11);
    objc_msgSend(*(id *)(a1 + 32), "setCrop:", x, y, width, height);
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setSelected:", objc_msgSend(WeakRetained[128], "containsIndex:", *(_QWORD *)(a1 + 48)));

  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSMutableIndexSet *selectedIndexes;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "item");
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isSelected") & 1) != 0
    || (unint64_t)-[NSMutableIndexSet count](self->_selectedIndexes, "count") < 0x18)
  {
    objc_msgSend(v9, "setSelected:", objc_msgSend(v9, "isSelected") ^ 1);
    v10 = objc_msgSend(v9, "isSelected");
    selectedIndexes = self->_selectedIndexes;
    if (v10)
      -[NSMutableIndexSet addIndex:](selectedIndexes, "addIndex:", v8);
    else
      -[NSMutableIndexSet removeIndex:](selectedIndexes, "removeIndex:", v8);
    -[NTKGreenfieldCompanionSharePhotosPickerViewController _handleSelectionChanged](self, "_handleSelectionChanged");
  }

  return 0;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  NTKCompanionCustomPhotosEditor *editor;
  id v7;
  uint64_t v8;
  uint64_t v9;

  editor = self->_editor;
  v7 = a5;
  v8 = objc_msgSend(a4, "item");
  v9 = objc_msgSend(v7, "item");

  -[NTKCompanionCustomPhotosEditor movePhotoAtIndex:toIndex:](editor, "movePhotoAtIndex:toIndex:", v8, v9);
}

- (NTKGreenfieldCompanionSharePhotosPickerViewControllerDelegate)delegate
{
  return (NTKGreenfieldCompanionSharePhotosPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_selectedIndexes, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_originalFace, 0);
}

- (void)_queue_fetchAssets
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Can't handle photos face: %@", (uint8_t *)&v3, 0xCu);
}

@end
