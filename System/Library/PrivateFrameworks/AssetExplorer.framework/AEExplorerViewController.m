@implementation AEExplorerViewController

- (void)associateAsset:(id)a3 withTile:(void *)a4
{
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v5 = a3;
    objc_msgSend(a4, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setAssociatedAssetUUID:", v6);
  }
}

- (BOOL)confirmAsset:(id)a3 matchesView:(id)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    v8 = a3;
    objc_msgSend(v6, "associatedAssetUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v10, "isEqualToString:", v9);
    if ((v7 & 1) == 0)
    {
      PLAssetExplorerGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v13 = 138543874;
        v14 = v10;
        v15 = 2114;
        v16 = v6;
        v17 = 2114;
        v18 = v9;
        _os_log_impl(&dword_21E23A000, v11, OS_LOG_TYPE_FAULT, "Outgoing asset mismatch. Tried to confirm asset with UUID %{public}@ but view (=%{public}@)'s associated asset UUID is %{public}@", (uint8_t *)&v13, 0x20u);
      }

    }
  }

  return v7;
}

- (AEExplorerViewController)initWithPackageTransport:(id)a3 mediaProvider:(id)a4 dataSourceManager:(id)a5 additionalGestureRecognizers:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AEExplorerViewController *v15;
  AEExplorerViewController *v16;
  void *v17;
  AEProgressViewModel *v18;
  AEProgressViewModel *progressModel;
  id v20;
  uint64_t v21;
  PXUIScrollViewController *scrollViewController;
  PXBasicUIViewTileAnimator *v23;
  PXBasicUIViewTileAnimator *tileAnimator;
  NSMutableSet *v25;
  NSMutableSet *tilesInUse;
  AECameraAssetPackageGenerator *v27;
  AECameraAssetPackageGenerator *cameraPackageGenerator;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)AEExplorerViewController;
  v15 = -[AEExplorerViewController init](&v30, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->__packageTransport, a3);
    -[AEPackageTransport registerChangeObserver:context:](v16->__packageTransport, "registerChangeObserver:context:", v16, AEExplorerViewControllerPackageTransportObserverContext);
    objc_storeStrong((id *)&v16->__dataSourceManager, a5);
    objc_storeStrong((id *)&v16->__mediaProvider, a4);
    objc_storeStrong((id *)&v16->__clientGestureRecognizers, a6);
    -[AEExplorerViewController _computeInitialResourcesIndexSetAsync](v16, "_computeInitialResourcesIndexSetAsync");
    objc_msgSend(MEMORY[0x24BDE35F0], "px_deprecated_appPhotoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_registerChangeObserver:", v16);

    v18 = -[AEProgressViewModel initWithDataSourceManager:]([AEProgressViewModel alloc], "initWithDataSourceManager:", v13);
    progressModel = v16->__progressModel;
    v16->__progressModel = v18;

    -[AEProgressViewModel registerChangeObserver:context:](v16->__progressModel, "registerChangeObserver:context:", v16, AEExplorerViewControllerProgressViewModelObserverContext);
    v20 = objc_alloc(MEMORY[0x24BE727D0]);
    v21 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    scrollViewController = v16->__scrollViewController;
    v16->__scrollViewController = (PXUIScrollViewController *)v21;

    v23 = (PXBasicUIViewTileAnimator *)objc_alloc_init(MEMORY[0x24BE72748]);
    tileAnimator = v16->__tileAnimator;
    v16->__tileAnimator = v23;

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    tilesInUse = v16->__tilesInUse;
    v16->__tilesInUse = v25;

    v27 = objc_alloc_init(AECameraAssetPackageGenerator);
    cameraPackageGenerator = v16->__cameraPackageGenerator;
    v16->__cameraPackageGenerator = v27;

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AEExplorerViewController _dismissViewControllerAboveKeyboardAnimated:](self, "_dismissViewControllerAboveKeyboardAnimated:", 0);
  objc_msgSend(MEMORY[0x24BDE35F0], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AEExplorerViewController;
  -[AEExplorerViewController dealloc](&v4, sel_dealloc);
}

- (Class)assetsSceneClass
{
  return (Class)objc_opt_class();
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;

  -[AEExplorerViewController _scrollViewController](self, "_scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);
  -[AEExplorerViewController setView:](self, "setView:", v5);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  AESceneGroupedTilingLayout *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;
  CGSize v41;

  v40 = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)AEExplorerViewController;
  -[AEExplorerViewController viewDidLoad](&v36, sel_viewDidLoad);
  -[AEExplorerViewController _dataSourceManager](self, "_dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[AEExplorerViewController _currentLayoutStyle](self, "_currentLayoutStyle");
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "statusBarOrientation");

  v8 = -[AESceneGroupedTilingLayout initWithDataSource:layoutStyle:orientation:]([AESceneGroupedTilingLayout alloc], "initWithDataSource:layoutStyle:orientation:", v4, v5, v7);
  -[AEProgressViewModel progressSnapshot](self->__progressModel, "progressSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AESceneGroupedTilingLayout setProgressSnapshot:](v8, "setProgressSnapshot:", v9);

  -[AESceneGroupedTilingLayout setDelegate:](v8, "setDelegate:", self);
  -[AEExplorerViewController _scrollViewController](self, "_scrollViewController");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE727B0]), "initWithLayout:", v8);
  v31 = (void *)v10;
  objc_msgSend(v11, "setScrollController:", v10);
  -[AEExplorerViewController _tileAnimator](self, "_tileAnimator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTileAnimator:", v12);

  objc_msgSend(v11, "setScrollDelegate:", self);
  objc_msgSend(v11, "setTileSource:", self);
  objc_msgSend(v11, "setTransitionDelegate:", self);
  -[AEExplorerViewController _setTilingController:](self, "_setTilingController:", v11);
  v13 = objc_alloc(-[AEExplorerViewController assetsSceneClass](self, "assetsSceneClass"));
  -[AEExplorerViewController _tilingController](self, "_tilingController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEExplorerViewController _mediaProvider](self, "_mediaProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEExplorerViewController _dataSourceManager](self, "_dataSourceManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithTilingController:mediaProvider:dataSourceManager:delegate:", v14, v15, v16, self);

  objc_msgSend(v17, "setAnimatesContent:", 1);
  objc_msgSend(v17, "setAutoplayBehavior:", 3);
  -[AEExplorerViewController _maximumThumbnailSize](self, "_maximumThumbnailSize");
  v19 = v18;
  v21 = v20;
  PLAssetExplorerGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v41.width = v19;
    v41.height = v21;
    NSStringFromCGSize(v41);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v23;
    _os_log_impl(&dword_21E23A000, v22, OS_LOG_TYPE_DEFAULT, "Setting the maximum image request size to %{public}@", buf, 0xCu);

  }
  objc_msgSend(v17, "setMaximumImageSize:", v19, v21);
  objc_msgSend(v17, "viewTileReusePool");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[AEDecorativeTileSource registerCommonDecorativeTilesToReusePool:](AEDecorativeTileSource, "registerCommonDecorativeTilesToReusePool:", v24);
  -[AEExplorerViewController _setSceneController:](self, "_setSceneController:", v17);
  -[AEExplorerViewController _handleTransportStagingUpdateWithDataSource:](self, "_handleTransportStagingUpdateWithDataSource:", v4);
  -[AEExplorerViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEExplorerViewController _clientGestureRecognizers](self, "_clientGestureRecognizers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v33;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(v25, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v30++));
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v28);
  }

}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AEExplorerViewController;
  -[AEExplorerViewController viewSafeAreaInsetsDidChange](&v11, sel_viewSafeAreaInsetsDidChange);
  -[AEExplorerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[AEExplorerViewController _scrollViewController](self, "_scrollViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentInset:", v5, v7, 0.0, v9);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AEExplorerViewController;
  -[AEExplorerViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[AEExplorerViewController _tilingController](self, "_tilingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "layoutStyle");
  v6 = -[AEExplorerViewController _currentLayoutStyle](self, "_currentLayoutStyle");
  v7 = objc_msgSend(v4, "isPortraitOrientation");
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "statusBarOrientation");

  if (v6 == v5)
  {
    if (v7 != (unint64_t)(v9 - 1) < 2)
      objc_msgSend(v4, "setPortraitOrientation:", (unint64_t)(v9 - 1) < 2);
  }
  else
  {
    -[AEExplorerViewController _sceneController](self, "_sceneController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEExplorerViewController _currentDataSource](self, "_currentDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEExplorerViewController _createNewLayoutForDataSource:](self, "_createNewLayoutForDataSource:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "transitionToLayout:", v12);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AEExplorerViewController;
  -[AEExplorerViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
  PFSharedFigDecodeSessionDiscardCachedBuffers();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  -[AEExplorerViewController _scrollViewController](self, "_scrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AEExplorerViewController _scrollViewController](self, "_scrollViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentCoordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AEExplorerViewController _tilingController](self, "_tilingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v11 = v10;
  v13 = v12;

  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v6, v11, v13);
  if (v9)
    objc_msgSend(v9, "hitTestTileAtPoint:padding:passingTest:", &__block_literal_global_1130);

  return 0;
}

- (void)handleTap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "state") == 3)
  {
    -[AEExplorerViewController _scrollViewController](self, "_scrollViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "locationInView:", v5);
    -[AEExplorerViewController contentAssetReferenceAtPoint:outContentFrame:](self, "contentAssetReferenceAtPoint:outContentFrame:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[AEExplorerViewController _handleAttemptedSelectionToggleOfAssetReference:cancelIfAlreadySelected:suppressLivePhotoContent:](self, "_handleAttemptedSelectionToggleOfAssetReference:cancelIfAlreadySelected:suppressLivePhotoContent:", v6, 1, 0);

  }
}

- (void)handleLongPress:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "state") == 1)
  {
    -[AEExplorerViewController _scrollViewController](self, "_scrollViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "locationInView:", v5);
    -[AEExplorerViewController contentAssetReferenceAtPoint:outContentFrame:](self, "contentAssetReferenceAtPoint:outContentFrame:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[AEExplorerViewController _configureReviewControllerWithAssetReference:](self, "_configureReviewControllerWithAssetReference:", v6);
      -[AEExplorerViewController _reviewController](self, "_reviewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[AEExplorerViewController _presentViewControllerAboveKeyboard:animated:](self, "_presentViewControllerAboveKeyboard:animated:", v7, 1);

    }
  }

}

- (id)_stagedAssetUUIDs
{
  void *v2;
  void *v3;

  -[AEExplorerViewController _packageTransport](self, "_packageTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expectedPackageIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_cancelExpectedAssetUUIDs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[AEExplorerViewController _packageTransport](self, "_packageTransport");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unstagePackagesWithIdentifiers:", v5);

    -[AEExplorerViewController _progressModel](self, "_progressModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelProgressForAssetUUIDs:", v7);

  }
}

- (void)_configureReviewControllerWithAssetReference:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  AEReviewAssetProvider *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v4 = a3;
  -[AEExplorerViewController _dataSourceManager](self, "_dataSourceManager");
  v5 = objc_claimAutoreleasedReturnValue();
  -[AEExplorerViewController _tilingController](self, "_tilingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v7;
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "indexPathForAssetReference:", v4);
  PXIndexPathFromSimpleIndexPath();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEExplorerViewController _stagedAssetUUIDs](self, "_stagedAssetUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE727A8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v4;
  v13 = objc_msgSend(v12, "maxMessagesAssetLimit");

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72D38]), "initWithAssetsDataSourceManager:", v5);
  v15 = objc_alloc_init(MEMORY[0x24BE72D40]);
  v16 = objc_alloc_init(AEReviewAssetProvider);
  v17 = (void *)v5;
  v18 = objc_alloc(MEMORY[0x24BE72D30]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 0;
  v20 = (void *)objc_msgSend(v18, "initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:selectionCountLimit:sourceType:lowMemoryMode:options:", v14, v15, v16, v10, v11, 0, v19, 0, v21, 0);

  objc_msgSend(v20, "setDelegate:", self);
  -[AEExplorerViewController _setReviewController:](self, "_setReviewController:", v20);

}

- (void)_presentConfidentialityAlertWithConfirmAction:(id)a3 abortAction:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BEBD3A8];
  v7 = a4;
  v8 = a3;
  PULocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v9, 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BEBD3A8];
  PULocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BE727A0];
  v17[0] = v10;
  v17[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "confidentialityAlertWithActions:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[AEExplorerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  return (a4 < 7) & (0x7Bu >> a4);
}

- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  -[AEExplorerViewController _stagedAssetUUIDs](self, "_stagedAssetUUIDs");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v37, "mutableCopy");
  objc_msgSend(v13, "minusSet:", v10);
  if (objc_msgSend(v13, "count"))
    -[AEExplorerViewController _cancelExpectedAssetUUIDs:](self, "_cancelExpectedAssetUUIDs:", v13);

  -[AEExplorerViewController _packageTransport](self, "_packageTransport");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "packagesWithLivePhotoContent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v14;
  if (objc_msgSend(v14, "count"))
  {
    v35 = v12;
    v36 = v10;
    v15 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (!v17)
      goto LABEL_20;
    v18 = v17;
    v19 = *(_QWORD *)v45;
    while (1)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v45 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v21, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v11, "containsObject:", v22);
        v24 = objc_msgSend(v21, "containsSuppressedLivePhoto");
        if (v23)
        {
          if ((v24 & 1) == 0)
          {
            v25 = (void *)objc_msgSend(v21, "mutableCopy");
            objc_msgSend(v25, "beginSupressingLivePhoto");
            if (v25)
              goto LABEL_15;
          }
        }
        else if (v24)
        {
          v25 = (void *)objc_msgSend(v21, "mutableCopy");
          objc_msgSend(v25, "endSuppressingLivePhoto");
          if (v25)
          {
LABEL_15:
            objc_msgSend(v15, "addObject:", v25);

          }
        }
        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(v15, "allObjects");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stagePackages:", v26);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (!v18)
      {
LABEL_20:

        v12 = v35;
        v10 = v36;
        v14 = v38;
        break;
      }
    }
  }
  if (objc_msgSend(v12, "count"))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v12, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v41 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
          v33 = objc_msgSend(v11, "containsObject:", v32);
          objc_msgSend(v12, "objectForKeyedSubscript:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[AEExplorerViewController _immediatelyGenerateAndStagePackageFromReviewAsset:suppressLivePhoto:mediaOrigin:](self, "_immediatelyGenerateAndStagePackageFromReviewAsset:suppressLivePhoto:mediaOrigin:", v34, v33, 0);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v29);
    }

    v14 = v38;
  }
  -[AEExplorerViewController _dismissReviewScreenViewController](self, "_dismissReviewScreenViewController");

}

- (void)_dismissReviewScreenViewController
{
  void *v3;
  id v4;

  -[AEExplorerViewController _reviewController](self, "_reviewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[AEExplorerViewController _dismissViewControllerAboveKeyboardAnimated:](self, "_dismissViewControllerAboveKeyboardAnimated:", 1);
    -[AEExplorerViewController _setReviewController:](self, "_setReviewController:", 0);
    v3 = v4;
  }

}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  -[AEExplorerViewController _dismissViewControllerAboveKeyboardAnimated:](self, "_dismissViewControllerAboveKeyboardAnimated:", 0);
}

- (id)_presentViewControllerAboveKeyboard:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  AEExplorerViewController *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = self;
  -[AEExplorerViewController delegate](v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "explorerViewController:presentViewController:animated:completion:", v7, v6, v4, 0);

  return v7;
}

- (void)_dismissViewControllerAboveKeyboardAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AEExplorerViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "explorerViewController:dismissViewControllerAnimated:completion:", self, v3, 0);

}

- (void)_immediatelyGenerateAndStagePackageFromReviewAsset:(id)a3 suppressLivePhoto:(BOOL)a4 mediaOrigin:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;
  BOOL v15;

  v8 = a3;
  -[AEExplorerViewController _packageTransport](self, "_packageTransport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEExplorerViewController _cameraPackageGenerator](self, "_cameraPackageGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __109__AEExplorerViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke;
  v12[3] = &unk_24E23B950;
  v15 = a4;
  v13 = v9;
  v14 = a5;
  v11 = v9;
  objc_msgSend(v10, "generatePackageFromReviewAsset:withCompletionHandler:", v8, v12);

}

- (CGSize)_maximumThumbnailSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(MEMORY[0x24BE72240], "defaultFormatChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "masterThumbnailFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sizeWithFallBackSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)scrollView
{
  void *v2;
  void *v3;

  -[AEExplorerViewController _scrollViewController](self, "_scrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_handleInProgressPackageGenerator:(id)a3 suppressLivePhotoContent:(BOOL)a4 mediaOrigin:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  AEExplorerViewController *v27;
  id v28;
  id v29;
  int64_t v30;
  BOOL v31;

  v10 = a6;
  v11 = a3;
  objc_msgSend(v11, "sourceAssetReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEExplorerViewController _packageTransport](self, "_packageTransport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEExplorerViewController _progressModel](self, "_progressModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "progress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProgress:forAssetReference:", v22, v12);
  objc_msgSend(v12, "asset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addPendingPackageIdentifier:", v16);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __117__AEExplorerViewController__handleInProgressPackageGenerator_suppressLivePhotoContent_mediaOrigin_completionHandler___block_invoke;
  v23[3] = &unk_24E23B978;
  v29 = v10;
  v30 = a5;
  v31 = a4;
  v24 = v13;
  v25 = v16;
  v26 = v12;
  v27 = self;
  v28 = v14;
  v17 = v14;
  v18 = v12;
  v19 = v16;
  v20 = v13;
  v21 = v10;
  objc_msgSend(v11, "retrieveGeneratedPackageWithCompletion:", v23);

}

- (void)_handleAttemptedSelectionToggleOfAssetReference:(id)a3 cancelIfAlreadySelected:(BOOL)a4 suppressLivePhotoContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
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
  objc_class *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  BOOL v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[3];
  _QWORD v35[5];

  v5 = a5;
  v6 = a4;
  v35[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v32 = 0u;
  v33 = 0u;
  -[AEExplorerViewController _currentDataSource](self, "_currentDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "indexPathForAssetReference:", v8);
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
  }

  objc_msgSend(v8, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[AEExplorerViewController _sceneController](self, "_sceneController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectionSnapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v32;
    v31 = v33;
    if (objc_msgSend(v14, "isIndexPathSelected:", &v30))
    {
      if (!v6)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v11, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AEExplorerViewController _packageTransport](self, "_packageTransport");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unstagePackageWithIdentifier:", v15);

    }
    else
    {
      -[AEExplorerViewController _progressModel](self, "_progressModel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "progressSnapshot");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v32;
      v31 = v33;
      if (objc_msgSend(v15, "hasProgressForIndexPath:", &v30))
      {
        v30 = v32;
        v31 = v33;
        objc_msgSend(v15, "progressForIndexPath:", &v30);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "cancel");
        -[AEExplorerViewController _progressModel](self, "_progressModel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setProgress:forAssetReference:", 0, v8);

      }
      else
      {
        v20 = (void *)MEMORY[0x24BE121D0];
        v34[0] = *MEMORY[0x24BE121C0];
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *MEMORY[0x24BE121B8];
        v35[0] = v22;
        v35[1] = v11;
        v34[1] = v23;
        v34[2] = CFSTR("selectedIndex");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (_QWORD)v33);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v35[2] = v24;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.selectPhotoInAssetExplorer"), v25);

        if (objc_msgSend(MEMORY[0x24BE727A0], "confidentialityCheckRequired")
          && objc_msgSend(MEMORY[0x24BE727A0], "confidentialWarningRequiredForAsset:", v11))
        {
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __125__AEExplorerViewController__handleAttemptedSelectionToggleOfAssetReference_cancelIfAlreadySelected_suppressLivePhotoContent___block_invoke;
          v26[3] = &unk_24E23B9A0;
          v26[4] = self;
          v27 = v11;
          v28 = v8;
          v29 = v5;
          -[AEExplorerViewController _presentConfidentialityAlertWithConfirmAction:abortAction:](self, "_presentConfidentialityAlertWithConfirmAction:abortAction:", v26, 0);

        }
        else
        {
          -[AEExplorerViewController _stageAsset:withReference:suppressLivePhotoContent:mediaOrigin:completionHandler:](self, "_stageAsset:withReference:suppressLivePhotoContent:mediaOrigin:completionHandler:", v11, v8, v5, 0, 0);
        }
      }
    }

    goto LABEL_15;
  }
LABEL_16:

}

- (void)_stageAsset:(id)a3 withReference:(id)a4 suppressLivePhotoContent:(BOOL)a5 mediaOrigin:(int64_t)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  AEPhotosAssetPackageGenerator *v17;
  AEPhotosAssetPackageGenerator *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v9 = a5;
  v27 = a3;
  v12 = a4;
  v13 = a7;
  -[AEExplorerViewController _packageTransport](self, "_packageTransport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE727A8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "maxMessagesAssetLimit");

  if (objc_msgSend(v14, "expectedPackageCount") >= v16)
  {
    PXLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PFStringWithValidatedFormat();
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v19, v21, 1, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BEBD3A8];
    PXLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAction:", v25);

    -[AEExplorerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);
  }
  else
  {
    v17 = [AEPhotosAssetPackageGenerator alloc];
    if (v12)
      v18 = -[AEPhotosAssetPackageGenerator initWithAssetReference:](v17, "initWithAssetReference:", v12);
    else
      v18 = -[AEPhotosAssetPackageGenerator initWithAsset:](v17, "initWithAsset:", v27);
    v19 = v18;
    v26 = -[AEPhotosAssetPackageGenerator beginGenerating](v18, "beginGenerating");
    -[AEExplorerViewController _handleInProgressPackageGenerator:suppressLivePhotoContent:mediaOrigin:completionHandler:](self, "_handleInProgressPackageGenerator:suppressLivePhotoContent:mediaOrigin:completionHandler:", v19, v9, a6, v13);
  }

}

- (int64_t)_layoutStyleForSize:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  v5 = v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (AEIsModernAspectScreen_onceToken != -1)
    dispatch_once(&AEIsModernAspectScreen_onceToken, &__block_literal_global_6);
  v8 = 2;
  if (v5 <= 768.0)
    v8 = 1;
  v9 = 3;
  if (!AEIsModernAspectScreen_isModernScreen)
    v9 = 0;
  if (v7 == 1)
    return v8;
  else
    return v9;
}

- (int64_t)_currentLayoutStyle
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[AEExplorerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  return -[AEExplorerViewController _layoutStyleForSize:](self, "_layoutStyleForSize:", v5, v7);
}

- (id)_currentDataSource
{
  void *v2;
  void *v3;
  void *v4;

  -[AEExplorerViewController _sceneController](self, "_sceneController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_createNewLayoutForDataSource:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  AESceneGroupedTilingLayout *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = -[AEExplorerViewController _currentLayoutStyle](self, "_currentLayoutStyle");
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "statusBarOrientation");

  v8 = -[AESceneGroupedTilingLayout initWithDataSource:layoutStyle:orientation:]([AESceneGroupedTilingLayout alloc], "initWithDataSource:layoutStyle:orientation:", v4, v5, v7);
  -[AEExplorerViewController _progressModel](self, "_progressModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "progressSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "correspondingDataSourceIdentifier");
  v12 = objc_msgSend(v4, "identifier");

  if (v11 == v12)
    -[AESceneGroupedTilingLayout setProgressSnapshot:](v8, "setProgressSnapshot:", v10);
  -[AESceneGroupedTilingLayout setDelegate:](v8, "setDelegate:", self);

  return v8;
}

- (id)_validateAssetReference:(id)a3 forScrollViewPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEExplorerViewController _scrollViewController](self, "_scrollViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertPoint:fromView:", v11, x, y);
    objc_msgSend(v12, "hitTest:withEvent:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEExplorerViewController confirmAsset:matchesView:](self, "confirmAsset:matchesView:", v9, v13);
    v14 = v8;

  }
  return v8;
}

- (id)contentAssetReferenceAtPoint:(CGPoint)a3 outContentFrame:(CGRect *)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  void *v23;
  _OWORD v24[2];
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  const char *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  y = a3.y;
  x = a3.x;
  -[AEExplorerViewController _scrollViewController](self, "_scrollViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AEExplorerViewController _scrollViewController](self, "_scrollViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentCoordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AEExplorerViewController _tilingController](self, "_tilingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromCoordinateSpace:", v9, x, y);
  v32 = 0;
  v33 = (double *)&v32;
  v34 = 0xE010000000;
  v35 = "";
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v31 = 0;
  v30 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __73__AEExplorerViewController_contentAssetReferenceAtPoint_outContentFrame___block_invoke;
  v25[3] = &unk_24E23B9C8;
  v25[4] = &v32;
  if (v12 && (objc_msgSend(v12, "hitTestTileAtPoint:padding:passingTest:", v25), (_QWORD)v26))
  {
    v13 = v27;
    v14 = v28;
    objc_msgSend(v12, "currentLayout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    v24[1] = v14;
    objc_msgSend(v15, "assetReferenceAtItemIndexPath:", v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(v11, "convertRect:toCoordinateSpace:", v9, v33[4], v33[5], v33[6], v33[7]);
      a4->origin.x = v17;
      a4->origin.y = v18;
      a4->size.width = v19;
      a4->size.height = v20;
    }
    -[AEExplorerViewController _validateAssetReference:forScrollViewPoint:](self, "_validateAssetReference:forScrollViewPoint:", v16, x, y);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  _Block_object_dispose(&v32, 8);

  return v21;
}

- (void)_handleTransportStagingUpdateWithDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v19 = v4;
  objc_msgSend(v4, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEExplorerViewController _sceneController](self, "_sceneController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[AEExplorerViewController _packageTransport](self, "_packageTransport");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "orderedStagedIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v5, "indexPathForFirstAsset");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "indexPathForAssetWithUUID:orBurstIdentifier:hintIndexPath:hintCollection:", v13, 0, v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          if (!v10)
          {
            objc_msgSend(MEMORY[0x24BE72758], "indexPathSet");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v23 = 0u;
          v24 = 0u;
          PXSimpleIndexPathFromIndexPath();
          v22[0] = v23;
          v22[1] = v24;
          objc_msgSend(v10, "addIndexPath:", v22);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __72__AEExplorerViewController__handleTransportStagingUpdateWithDataSource___block_invoke;
  v20[3] = &unk_24E23B9F0;
  v21 = v10;
  v16 = v10;
  objc_msgSend(v18, "performChanges:", v20);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v8 = a3;
  if ((void *)AEExplorerViewControllerProgressViewModelObserverContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      v15 = v8;
      -[AEExplorerViewController _tilingController](self, "_tilingController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "targetLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "identifier");

      -[AEExplorerViewController _progressModel](self, "_progressModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "progressSnapshot");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "correspondingDataSourceIdentifier") == v12)
        objc_msgSend(v9, "setProgressSnapshot:", v14);

      goto LABEL_9;
    }
  }
  else if ((v6 & 1) != 0 && (void *)AEExplorerViewControllerPackageTransportObserverContext == a5)
  {
    v15 = v8;
    -[AEExplorerViewController _currentDataSource](self, "_currentDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEExplorerViewController _handleTransportStagingUpdateWithDataSource:](self, "_handleTransportStagingUpdateWithDataSource:", v9);
LABEL_9:

    v8 = v15;
  }

}

- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v6 = a4;
  v7 = a3;
  -[AEExplorerViewController _sceneController](self, "_sceneController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tilingController:initialVisibleOriginForLayout:", v7, v6);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4
{
  return -[AEExplorerViewController _createNewLayoutForDataSource:](self, "_createNewLayoutForDataSource:", a4);
}

- (void)assetsScene:(id)a3 willTransitionToDataSource:(id)a4
{
  void *v5;
  void *v6;

  -[AEExplorerViewController _pendingMissingThumbnailAssetIndexes](self, "_pendingMissingThumbnailAssetIndexes", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[AEExplorerViewController _setMissingThumbnailAssetIndexes:](self, "_setMissingThumbnailAssetIndexes:", v5);
    -[AEExplorerViewController _setPendingMissingThumbnailAssetIndexes:](self, "_setPendingMissingThumbnailAssetIndexes:", 0);
    v5 = v6;
  }

}

- (void)assetsScene:(id)a3 didTransitionToDataSource:(id)a4
{
  -[AEExplorerViewController _handleTransportStagingUpdateWithDataSource:](self, "_handleTransportStagingUpdateWithDataSource:", a4);
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1115;
  v21 = __Block_byref_object_dispose__1116;
  v22 = 0;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__AEExplorerViewController_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_24E23BA18;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  objc_msgSend(v4, "changeDetailsForFetchResult:", v18[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "fetchResultAfterChanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchedObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEExplorerViewController _thumbnailResourcesIndexSetForAssets:](self, "_thumbnailResourcesIndexSetForAssets:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __57__AEExplorerViewController_prepareForPhotoLibraryChange___block_invoke_2;
    v14[3] = &unk_24E23BC48;
    v14[4] = self;
    v15 = v10;
    v11 = v10;
    v12 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_sync(MEMORY[0x24BDAC9B8], v14);

  }
  _Block_object_dispose(&v17, 8);

  return 0;
}

- (id)_thumbnailResourcesIndexSetForAssets:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDE3640], "indexesForAssetsWithoutThumbnails:requestType:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_addThumbnailIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  -[AEExplorerViewController _missingThumbnailAssetIndexes](self, "_missingThumbnailAssetIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;

  objc_msgSend(v10, "addIndexes:", v4);
  -[AEExplorerViewController _setMissingThumbnailAssetIndexes:](self, "_setMissingThumbnailAssetIndexes:", v10);
  -[PXTilingController currentLayout](self->__tilingController, "currentLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateLayout");

}

- (void)_computeInitialResourcesIndexSetAsync
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  char *v10;
  void *v11;
  NSObject *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  _QWORD v17[4];
  id v18;
  id v19[2];
  id location;

  if (_computeInitialResourcesIndexSetAsync_predicate != -1)
    dispatch_once(&_computeInitialResourcesIndexSetAsync_predicate, &__block_literal_global_218);
  -[AEExplorerViewController _dataSourceManager](self, "_dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetsInSection:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v6, "count");
    v8 = 0;
    if (v7 >= 5)
      v9 = 5;
    else
      v9 = v7;
    do
    {
      v10 = &v8[v9];
      if ((unint64_t)&v8[v9] > objc_msgSend(v6, "count"))
        break;
      objc_msgSend(v6, "subarrayWithRange:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v12 = _computeInitialResourcesIndexSetAsync__serialQueue;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __65__AEExplorerViewController__computeInitialResourcesIndexSetAsync__block_invoke_2;
      v17[3] = &unk_24E23BAA8;
      objc_copyWeak(v19, &location);
      v13 = v11;
      v18 = v13;
      v19[1] = v8;
      dispatch_async(v12, v17);
      v14 = objc_msgSend(v6, "count");
      if ((unint64_t)v10 < v14)
      {
        v15 = objc_msgSend(v6, "count");
        v16 = (double)v9 + (double)v9;
        if (v16 >= (double)(unint64_t)(v15 - (_QWORD)v10))
          v16 = (double)(unint64_t)(v15 - (_QWORD)v10);
        v9 = (unint64_t)v16;
        v8 = v10;
      }

      objc_destroyWeak(v19);
      objc_destroyWeak(&location);

    }
    while ((unint64_t)v10 < v14);
  }

}

- (BOOL)layout:(id)a3 shouldShowVideoDecorationAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  __int128 v9;
  void *v10;
  _OWORD v12[2];

  v6 = a3;
  if (-[AEExplorerViewController _fakeAllCloudAndVideo](self, "_fakeAllCloudAndVideo"))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_OWORD *)&a4->item;
    v12[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v12[1] = v9;
    objc_msgSend(v8, "assetAtItemIndexPath:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "playbackStyle") == 4;

  }
  return v7;
}

- (BOOL)layout:(id)a3 shouldShowLoopDecorationAtIndexPath:(PXSimpleIndexPath *)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  BOOL v9;
  _OWORD v11[2];

  objc_msgSend(a3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a4->item;
  v11[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v11[1] = v6;
  objc_msgSend(v5, "assetAtItemIndexPath:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (layout_shouldShowLoopDecorationAtIndexPath__onceToken != -1)
    dispatch_once(&layout_shouldShowLoopDecorationAtIndexPath__onceToken, &__block_literal_global_220);
  v9 = objc_msgSend(v7, "playbackStyle") == 5 && layout_shouldShowLoopDecorationAtIndexPath__canShowLoopBadges != 0;

  return v9;
}

- (BOOL)layout:(id)a3 shouldShowCloudDecorationAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  _OWORD v13[2];

  v6 = a3;
  if (-[AEExplorerViewController _fakeAllCloudAndVideo](self, "_fakeAllCloudAndVideo"))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    -[AEExplorerViewController _missingThumbnailAssetIndexes](self, "_missingThumbnailAssetIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "containsIndex:", a4->item))
    {
      objc_msgSend(v6, "progressSnapshot");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_OWORD *)&a4->item;
      v13[0] = *(_OWORD *)&a4->dataSourceIdentifier;
      v13[1] = v11;
      v7 = objc_msgSend(v10, "hasProgressForIndexPath:", v13) ^ 1;

    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  return v7;
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[AEExplorerViewController _sceneController](self, "_sceneController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tilingController:tileIdentifierConverterForChange:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  AEDelegatingTransitionAnimationCoordinator *v12;

  v6 = a4;
  v7 = a3;
  -[AEExplorerViewController _sceneController](self, "_sceneController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tilingController:transitionAnimationCoordinatorForChange:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AEExplorerViewController _currentDataSource](self, "_currentDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AEExplorerViewController _createNewLayoutForDataSource:](self, "_createNewLayoutForDataSource:", v10);

  v12 = -[AEDelegatingTransitionAnimationCoordinator initWithWrappedCoordinator:]([AEDelegatingTransitionAnimationCoordinator alloc], "initWithWrappedCoordinator:", v9);
  -[AEDelegatingTransitionAnimationCoordinator setEnableDoubleSidedAnimations:](v12, "setEnableDoubleSidedAnimations:", 0);

  return v12;
}

- (void)_attachGestureRecognizersIfNeeded:(void *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gestureRecognizers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleTap_);
    objc_msgSend(v7, "setNumberOfTapsRequired:", 1);
    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v4, "addGestureRecognizer:", v7);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel_handleLongPress_);
    objc_msgSend(v4, "addGestureRecognizer:", v8);
    objc_msgSend(v4, "setUserInteractionEnabled:", 1);
    -[AEExplorerViewController _clientGestureRecognizers](self, "_clientGestureRecognizers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "requireGestureRecognizerToFail:", v8);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  AEGenericViewTile *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  AEProgressIndicatorView *v25;
  AEProgressIndicatorView *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  unint64_t v37;

  v6 = a4;
  -[AEExplorerViewController _sceneController](self, "_sceneController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a3->var1[1];
  v9 = a3->var1[2];
  v10 = a3->var1[3];
  v11 = a3->var1[4];
  if (v8 != *MEMORY[0x24BE72800] && v10 != 0x7FFFFFFFFFFFFFFFLL && v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v32 = v8;
    *((_QWORD *)&v32 + 1) = v9;
    *(_QWORD *)&v33 = v10;
    *((_QWORD *)&v33 + 1) = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v15, "assetAtItemIndexPath:", &v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  v16 = *(_OWORD *)&a3->var1[5];
  v34 = *(_OWORD *)&a3->var1[3];
  v35 = v16;
  v36 = *(_OWORD *)&a3->var1[7];
  v37 = a3->var1[9];
  v17 = *(_OWORD *)&a3->var1[1];
  v32 = *(_OWORD *)&a3->var0;
  v33 = v17;
  if (objc_msgSend(v7, "providesTileForIdentifier:", &v32))
  {
    v18 = *(_OWORD *)&a3->var1[5];
    v34 = *(_OWORD *)&a3->var1[3];
    v35 = v18;
    v36 = *(_OWORD *)&a3->var1[7];
    v37 = a3->var1[9];
    v19 = *(_OWORD *)&a3->var1[1];
    v32 = *(_OWORD *)&a3->var0;
    v33 = v19;
    v20 = (AEGenericViewTile *)objc_msgSend(v7, "checkOutTileForIdentifier:layout:", &v32, v6);
    if (a3->var0 == 5 && a3->var1[0] == *MEMORY[0x24BE727F0])
      -[AEExplorerViewController _attachGestureRecognizersIfNeeded:](self, "_attachGestureRecognizersIfNeeded:", v20);
    -[AEExplorerViewController associateAsset:withTile:](self, "associateAsset:withTile:", v14, v20);
  }
  else
  {
    v21 = a3->var1[0];
    v31 = v6;
    if (v21 == 795209731)
    {
      objc_msgSend(v7, "viewTileReusePool");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "checkOutReusableObjectWithReuseIdentifier:", 795209736);
      v20 = (AEGenericViewTile *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v21 != 112112321)
        abort();
      -[AEExplorerViewController _progressModel](self, "_progressModel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "progressSnapshot");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v32 = v8;
      *((_QWORD *)&v32 + 1) = v9;
      *(_QWORD *)&v33 = v10;
      *((_QWORD *)&v33 + 1) = v11;
      objc_msgSend(v23, "progressForIndexPath:", &v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = [AEProgressIndicatorView alloc];
      v26 = -[AEProgressIndicatorView initWithFrame:progress:](v25, "initWithFrame:progress:", v24, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      v20 = -[AEGenericViewTile initWithView:]([AEGenericViewTile alloc], "initWithView:", v26);

    }
    -[AEExplorerViewController _tilesInUse](self, "_tilesInUse");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v20);

    -[AEExplorerViewController _scrollViewController](self, "_scrollViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEGenericViewTile view](v20, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "ae_ensureSubview:", v29);

    -[AEExplorerViewController associateAsset:withTile:](self, "associateAsset:withTile:", v14, v20);
    v6 = v31;
  }

  return v20;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;

  -[AEExplorerViewController _sceneController](self, "_sceneController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a4->var1[5];
  v18 = *(_OWORD *)&a4->var1[3];
  v19 = v8;
  v20 = *(_OWORD *)&a4->var1[7];
  v21 = a4->var1[9];
  v9 = *(_OWORD *)&a4->var1[1];
  v16 = *(_OWORD *)&a4->var0;
  v17 = v9;
  if (objc_msgSend(v7, "providesTileForIdentifier:", &v16))
  {
    v10 = *(_OWORD *)&a4->var1[5];
    v18 = *(_OWORD *)&a4->var1[3];
    v19 = v10;
    v20 = *(_OWORD *)&a4->var1[7];
    v21 = a4->var1[9];
    v11 = *(_OWORD *)&a4->var1[1];
    v16 = *(_OWORD *)&a4->var0;
    v17 = v11;
    objc_msgSend(v7, "checkInTile:withIdentifier:", a3, &v16);
  }
  else
  {
    v12 = a3;
    if (a4->var1[0] == 795209731)
    {
      objc_msgSend(v7, "viewTileReusePool");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "checkInReusableObject:", v12);

    }
    objc_msgSend(v12, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromSuperview");

    -[AEExplorerViewController _tilesInUse](self, "_tilesInUse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObject:", v12);

  }
}

- (AEExplorerViewControllerDelegate)delegate
{
  return (AEExplorerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AEPackageTransport)_packageTransport
{
  return self->__packageTransport;
}

- (PXPhotoKitAssetsDataSourceManager)_dataSourceManager
{
  return self->__dataSourceManager;
}

- (PXMediaProvider)_mediaProvider
{
  return self->__mediaProvider;
}

- (NSArray)_clientGestureRecognizers
{
  return (NSArray *)objc_getProperty(self, a2, 1008, 1);
}

- (NSIndexSet)_missingThumbnailAssetIndexes
{
  return self->__missingThumbnailAssetIndexes;
}

- (void)_setMissingThumbnailAssetIndexes:(id)a3
{
  objc_storeStrong((id *)&self->__missingThumbnailAssetIndexes, a3);
}

- (NSIndexSet)_pendingMissingThumbnailAssetIndexes
{
  return self->__pendingMissingThumbnailAssetIndexes;
}

- (void)_setPendingMissingThumbnailAssetIndexes:(id)a3
{
  objc_storeStrong((id *)&self->__pendingMissingThumbnailAssetIndexes, a3);
}

- (PXBasicUIViewTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (PXUIScrollViewController)_scrollViewController
{
  return self->__scrollViewController;
}

- (PXTilingController)_tilingController
{
  return self->__tilingController;
}

- (void)_setTilingController:(id)a3
{
  objc_storeStrong((id *)&self->__tilingController, a3);
}

- (PXAssetsScene)_sceneController
{
  return self->__sceneController;
}

- (void)_setSceneController:(id)a3
{
  objc_storeStrong((id *)&self->__sceneController, a3);
}

- (AEProgressViewModel)_progressModel
{
  return self->__progressModel;
}

- (CAMCameraReviewAdapter)_cameraReviewAdapter
{
  return self->__cameraReviewAdapter;
}

- (AECameraAssetPackageGenerator)_cameraPackageGenerator
{
  return self->__cameraPackageGenerator;
}

- (UIView)_previousSuperview
{
  return self->__previousSuperview;
}

- (void)_setPreviousSuperview:(id)a3
{
  objc_storeStrong((id *)&self->__previousSuperview, a3);
}

- (NSMutableSet)_tilesInUse
{
  return self->__tilesInUse;
}

- (PUAssetExplorerReviewScreenViewController)_reviewController
{
  return self->__reviewController;
}

- (void)_setReviewController:(id)a3
{
  objc_storeStrong((id *)&self->__reviewController, a3);
}

- (BOOL)_fakeAllCloudAndVideo
{
  return self->__fakeAllCloudAndVideo;
}

- (void)_setFakeAllCloudAndVideo:(BOOL)a3
{
  self->__fakeAllCloudAndVideo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reviewController, 0);
  objc_storeStrong((id *)&self->__tilesInUse, 0);
  objc_storeStrong((id *)&self->__previousSuperview, 0);
  objc_storeStrong((id *)&self->__cameraPackageGenerator, 0);
  objc_storeStrong((id *)&self->__cameraReviewAdapter, 0);
  objc_storeStrong((id *)&self->__progressModel, 0);
  objc_storeStrong((id *)&self->__sceneController, 0);
  objc_storeStrong((id *)&self->__tilingController, 0);
  objc_storeStrong((id *)&self->__scrollViewController, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
  objc_storeStrong((id *)&self->__pendingMissingThumbnailAssetIndexes, 0);
  objc_storeStrong((id *)&self->__missingThumbnailAssetIndexes, 0);
  objc_storeStrong((id *)&self->__clientGestureRecognizers, 0);
  objc_storeStrong((id *)&self->__mediaProvider, 0);
  objc_storeStrong((id *)&self->__dataSourceManager, 0);
  objc_storeStrong((id *)&self->__packageTransport, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __71__AEExplorerViewController_layout_shouldShowLoopDecorationAtIndexPath___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  layout_shouldShowLoopDecorationAtIndexPath__canShowLoopBadges = objc_msgSend(v0, "BOOLForKey:", CFSTR("AssetExplorer_ShowLoopBadges"));

}

void __65__AEExplorerViewController__computeInitialResourcesIndexSetAsync__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_thumbnailResourcesIndexSetForAssets:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 48))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "shiftIndexesStartingAtIndex:by:", 0, *(_QWORD *)(a1 + 48));

    v4 = v5;
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__AEExplorerViewController__computeInitialResourcesIndexSetAsync__block_invoke_3;
  v7[3] = &unk_24E23BA80;
  objc_copyWeak(&v9, v2);
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

  objc_destroyWeak(&v9);
}

void __65__AEExplorerViewController__computeInitialResourcesIndexSetAsync__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_addThumbnailIndexes:", *(_QWORD *)(a1 + 32));

}

void __65__AEExplorerViewController__computeInitialResourcesIndexSetAsync__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("AEExplorerViewControllerSerialQueue", 0);
  v1 = (void *)_computeInitialResourcesIndexSetAsync__serialQueue;
  _computeInitialResourcesIndexSetAsync__serialQueue = (uint64_t)v0;

}

void __57__AEExplorerViewController_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_dataSourceManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetsInSection:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __57__AEExplorerViewController_prepareForPhotoLibraryChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPendingMissingThumbnailAssetIndexes:", *(_QWORD *)(a1 + 40));
}

uint64_t __72__AEExplorerViewController__handleTransportStagingUpdateWithDataSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedIndexPaths:", *(_QWORD *)(a1 + 32));
}

uint64_t __73__AEExplorerViewController_contentAssetReferenceAtPoint_outContentFrame___block_invoke(uint64_t a1, _QWORD *a2, uint64_t a3, __int128 *a4)
{
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  if (*a2 != 5 || a2[1] != *MEMORY[0x24BE727F0])
    return 0;
  v4 = *(_OWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a4[7];
  v7 = a4[4];
  v6 = a4[5];
  v4[8] = a4[6];
  v4[9] = v5;
  v4[6] = v7;
  v4[7] = v6;
  v8 = a4[11];
  v10 = a4[8];
  v9 = a4[9];
  v4[12] = a4[10];
  v4[13] = v8;
  v4[10] = v10;
  v4[11] = v9;
  v11 = *a4;
  v12 = a4[1];
  v13 = a4[3];
  v4[4] = a4[2];
  v4[5] = v13;
  v4[2] = v11;
  v4[3] = v12;
  return 1;
}

uint64_t __125__AEExplorerViewController__handleAttemptedSelectionToggleOfAssetReference_cancelIfAlreadySelected_suppressLivePhotoContent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stageAsset:withReference:suppressLivePhotoContent:mediaOrigin:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), 0, 0);
}

void __117__AEExplorerViewController__handleInProgressPackageGenerator_suppressLivePhotoContent_mediaOrigin_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[8];
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v10, "setMediaOrigin:", *(_QWORD *)(a1 + 80));
    if (*(_BYTE *)(a1 + 88))
      objc_msgSend(v10, "beginSupressingLivePhoto");
    v11 = *(_QWORD *)(a1 + 72);
    if (v11)
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);
    objc_msgSend(*(id *)(a1 + 32), "stagePackage:", v10);
    goto LABEL_16;
  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "reportError:", v8);
    objc_msgSend(*(id *)(a1 + 32), "removePendingPackageIdentifier:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BE72D88]);
    v20[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v19 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithErrors:forAssets:fromSource:preparationType:", v13, v14, 2, 0);

    }
    else
    {
      v15 = (void *)objc_msgSend(v12, "initWithErrors:forAssets:fromSource:preparationType:", v13, MEMORY[0x24BDBD1A8], 2, 0);
    }

    objc_msgSend(v15, "setRadarDescription:", CFSTR("Error trying to pick an asset in PhotosMessagesApp."));
    objc_msgSend(v15, "setRadarComponentID:name:version:", CFSTR("512768"), CFSTR("Photos Backend (New Bugs)"), CFSTR("all"));
    objc_msgSend(v15, "alertControllerWithCompletion:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "presentViewController:animated:completion:", v17, 1, 0);

LABEL_16:
    goto LABEL_17;
  }
  if ((a4 & 1) == 0)
  {
    PLAssetExplorerGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21E23A000, v16, OS_LOG_TYPE_ERROR, "Nil package returned from package generator with no error!", v18, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "removePendingPackageIdentifier:", *(_QWORD *)(a1 + 40));
  }
LABEL_17:
  objc_msgSend(*(id *)(a1 + 64), "setProgress:forAssetReference:", 0, *(_QWORD *)(a1 + 48));

}

void __109__AEExplorerViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __109__AEExplorerViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke_2;
  block[3] = &unk_24E23B928;
  v16 = *(_BYTE *)(a1 + 48);
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v15 = v7;
  v13 = v8;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void *__109__AEExplorerViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke_2(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(result, "beginSupressingLivePhoto");
      result = *(void **)(a1 + 32);
    }
    objc_msgSend(result, "setMediaOrigin:", *(_QWORD *)(a1 + 56));
    return (void *)objc_msgSend(*(id *)(a1 + 40), "stagePackage:", *(_QWORD *)(a1 + 32));
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    return (void *)objc_msgSend(*(id *)(a1 + 40), "reportError:");
  }
  return result;
}

BOOL __57__AEExplorerViewController_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, _QWORD *a2)
{
  return *a2 == 5 && a2[1] == *MEMORY[0x24BE727F0];
}

@end
