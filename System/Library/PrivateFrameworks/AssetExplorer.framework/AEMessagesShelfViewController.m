@implementation AEMessagesShelfViewController

- (AEMessagesShelfViewController)initWithPackageTransport:(id)a3
{
  return -[AEMessagesShelfViewController initWithPackageTransport:options:](self, "initWithPackageTransport:options:", a3, 0);
}

- (AEMessagesShelfViewController)initWithPackageTransport:(id)a3 options:(unint64_t)a4
{
  id v7;
  AEMessagesShelfViewController *v8;
  AEMessagesShelfViewController *v9;
  PUReviewDataSource *v10;
  PUReviewDataSource *dataSource;
  uint64_t v12;
  PUReviewAssetsDataSourceManager *internalReviewDataSourceManager;
  PUReviewAssetsMediaProvider *v14;
  PUReviewAssetsMediaProvider *internalReviewMediaProvider;
  AEWrappedMediaProvider *v16;
  AEWrappedDataSourceManager *v17;
  AEWrappedDataSourceManager *wrappedDataSourceManager;
  void *v19;
  AEMessagesShelfLayout *v20;
  id v21;
  void *v22;
  PXScrollViewController *scrollViewController;
  id v24;
  PXBasicUIViewTileAnimator *v25;
  PXBasicUIViewTileAnimator *tileAnimator;
  uint64_t v27;
  PXTilingController *tilingController;
  void *v29;
  PXAssetsScene *sceneController;
  id v31;
  NSMutableSet *v32;
  NSMutableSet *tilesInUse;
  objc_super v35;

  v7 = a3;
  v35.receiver = self;
  v35.super_class = (Class)AEMessagesShelfViewController;
  v8 = -[AEMessagesShelfViewController init](&v35, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->__options = a4;
    objc_storeStrong((id *)&v8->__packageTransport, a3);
    -[AEPackageTransport registerChangeObserver:context:](v9->__packageTransport, "registerChangeObserver:context:", v9, AEMessagesShelfViewControllerTransportPackageTransportObserverContext);
    v10 = (PUReviewDataSource *)objc_alloc_init(MEMORY[0x24BE72D68]);
    dataSource = v9->__dataSource;
    v9->__dataSource = v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BE72D58]), "initWithReviewDataSource:", v9->__dataSource);
    internalReviewDataSourceManager = v9->__internalReviewDataSourceManager;
    v9->__internalReviewDataSourceManager = (PUReviewAssetsDataSourceManager *)v12;

    v14 = (PUReviewAssetsMediaProvider *)objc_alloc_init(MEMORY[0x24BE72D60]);
    internalReviewMediaProvider = v9->__internalReviewMediaProvider;
    v9->__internalReviewMediaProvider = v14;

    v16 = -[AEWrappedMediaProvider initWithMediaProvider:]([AEWrappedMediaProvider alloc], "initWithMediaProvider:", v9->__internalReviewMediaProvider);
    v17 = objc_alloc_init(AEWrappedDataSourceManager);
    wrappedDataSourceManager = v9->__wrappedDataSourceManager;
    v9->__wrappedDataSourceManager = v17;

    -[AEWrappedDataSourceManager attachDataSourceManager:](v9->__wrappedDataSourceManager, "attachDataSourceManager:", v9->__internalReviewDataSourceManager);
    -[PXSectionedDataSourceManager dataSource](v9->__wrappedDataSourceManager, "dataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PXAssetsTilingLayout initWithDataSource:]([AEMessagesShelfLayout alloc], "initWithDataSource:", v19);
    v21 = objc_alloc(MEMORY[0x24BE727D0]);
    v22 = (void *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v22, "registerObserver:", v9);
    scrollViewController = v9->__scrollViewController;
    v9->__scrollViewController = (PXScrollViewController *)v22;
    v24 = v22;

    v25 = (PXBasicUIViewTileAnimator *)objc_alloc_init(MEMORY[0x24BE72748]);
    tileAnimator = v9->__tileAnimator;
    v9->__tileAnimator = v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BE727B0]), "initWithLayout:", v20);
    tilingController = v9->__tilingController;
    v9->__tilingController = (PXTilingController *)v27;

    -[PXTilingController setScrollController:](v9->__tilingController, "setScrollController:", v9->__scrollViewController);
    -[PXTilingController setTileAnimator:](v9->__tilingController, "setTileAnimator:", v9->__tileAnimator);
    -[PXTilingController setScrollDelegate:](v9->__tilingController, "setScrollDelegate:", v9);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE727C8]), "initWithTilingController:mediaProvider:dataSourceManager:delegate:", v9->__tilingController, v16, v9->__wrappedDataSourceManager, v9);
    objc_msgSend(v29, "setContentTileCornerRadius:", 12.5);
    objc_msgSend(v29, "setAnimatesContent:", 1);
    objc_msgSend(v29, "setAutoplayBehavior:", 3);
    -[PXTilingController setTileSource:](v9->__tilingController, "setTileSource:", v9);
    -[PXTilingController setTransitionDelegate:](v9->__tilingController, "setTransitionDelegate:", v29);
    sceneController = v9->__sceneController;
    v9->__sceneController = (PXAssetsScene *)v29;
    v31 = v29;

    v32 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    tilesInUse = v9->__tilesInUse;
    v9->__tilesInUse = v32;

    v9->__indexToScrollTo = -1;
    -[AEMessagesShelfViewController _transportStagingStateDidChange](v9, "_transportStagingStateDidChange");

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[AEMessagesShelfViewController _dismissPresentedReviewController:animated:](self, "_dismissPresentedReviewController:animated:", self->_presentedReviewController, 0);
  v3.receiver = self;
  v3.super_class = (Class)AEMessagesShelfViewController;
  -[AEMessagesShelfViewController dealloc](&v3, sel_dealloc);
}

- (PUAssetExplorerAnalytics)assetExplorerAnalytics
{
  PUAssetExplorerAnalytics *assetExplorerAnalytics;
  PUAssetExplorerAnalytics *v4;
  PUAssetExplorerAnalytics *v5;

  assetExplorerAnalytics = self->_assetExplorerAnalytics;
  if (!assetExplorerAnalytics)
  {
    v4 = (PUAssetExplorerAnalytics *)objc_alloc_init(MEMORY[0x24BE72D28]);
    v5 = self->_assetExplorerAnalytics;
    self->_assetExplorerAnalytics = v4;

    assetExplorerAnalytics = self->_assetExplorerAnalytics;
  }
  return assetExplorerAnalytics;
}

- (void)_presentReviewViewController:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *presentedReviewController;
  NSObject *v9;
  PUAssetExplorerReviewScreenViewController *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a3;
  -[AEMessagesShelfViewController entryViewDelegate](self, "entryViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  PLAssetExplorerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  presentedReviewController = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E23A000, presentedReviewController, OS_LOG_TYPE_DEFAULT, "Will present review controller.", buf, 2u);
    }

    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);
    PLAssetExplorerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21E23A000, v9, OS_LOG_TYPE_DEFAULT, "Did present review controller.", v12, 2u);
    }

    v10 = (PUAssetExplorerReviewScreenViewController *)v4;
    presentedReviewController = self->_presentedReviewController;
    self->_presentedReviewController = v10;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21E23A000, presentedReviewController, OS_LOG_TYPE_ERROR, "Unable to present review controller.", v11, 2u);
  }

}

- (void)_dismissPresentedReviewController:(id)a3 animated:(BOOL)a4
{
  PUAssetExplorerReviewScreenViewController *presentedReviewController;

  if (a3)
  {
    objc_msgSend(a3, "dismissViewControllerAnimated:completion:", a4, 0);
    presentedReviewController = self->_presentedReviewController;
    self->_presentedReviewController = 0;

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AEMessagesShelfViewController _scrollViewController](self, "_scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  objc_msgSend(v6, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);
  -[AEMessagesShelfViewController setView:](self, "setView:", v6);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleTap_);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v6, "addGestureRecognizer:", v5);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AEMessagesShelfViewController;
  -[AEMessagesShelfViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[AEMessagesShelfViewController _sceneController](self, "_sceneController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewTileReusePool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AEDecorativeTileSource registerCommonDecorativeTilesToReusePool:](AEDecorativeTileSource, "registerCommonDecorativeTilesToReusePool:", v4);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__AEMessagesShelfViewController_viewDidLoad__block_invoke;
  v12[3] = &unk_24E23B528;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "registerReusableObjectForReuseIdentifier:creationHandler:", 1313817680, v12);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_2;
  v10[3] = &unk_24E23B528;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "registerReusableObjectForReuseIdentifier:creationHandler:", 1295210292, v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_3;
  v8[3] = &unk_24E23B528;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "registerReusableObjectForReuseIdentifier:creationHandler:", 1295210293, v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_4;
  v6[3] = &unk_24E23B528;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "registerReusableObjectForReuseIdentifier:creationHandler:", 1277777777, v6);
  objc_msgSend(v4, "registerReusableObjectForReuseIdentifier:creationHandler:", 1500001338, &__block_literal_global);
  objc_msgSend(v4, "registerReusableObjectForReuseIdentifier:creationHandler:", 1215219281, &__block_literal_global_286);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_transportStagingStateDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  -[AEMessagesShelfViewController _packageTransport](self, "_packageTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedStagedIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEMessagesShelfViewController _dataSource](self, "_dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "minusOrderedSet:", v7);
  v10 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v10, "intersectOrderedSet:", v8);
  v11 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v11, "minusOrderedSet:", v8);
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __64__AEMessagesShelfViewController__transportStagingStateDidChange__block_invoke;
  v23 = &unk_24E23B590;
  v24 = v9;
  v12 = v5;
  v25 = v12;
  v26 = v10;
  v27 = v3;
  v28 = v11;
  v13 = v4;
  v29 = v13;
  v19 = v11;
  v18 = v3;
  v14 = v10;
  v15 = v9;
  objc_msgSend(v12, "performChanges:", &v20);
  objc_msgSend(v12, "orderedIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  if (v17 > objc_msgSend(v6, "count"))
    -[AEMessagesShelfViewController _setIndexToScrollTo:](self, "_setIndexToScrollTo:", objc_msgSend(v13, "count", v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29) - 1);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)AEMessagesShelfViewControllerTransportPackageTransportObserverContext == a5)
    -[AEMessagesShelfViewController _transportStagingStateDidChange](self, "_transportStagingStateDidChange", a3);
}

- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _OWORD v25[12];
  CGPoint result;

  v6 = a3;
  v7 = a4;
  -[AEMessagesShelfViewController _sceneController](self, "_sceneController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AEMessagesShelfViewController _indexToScrollTo](self, "_indexToScrollTo");
  if (v9 < 0)
  {
    objc_msgSend(v8, "tilingController:initialVisibleOriginForLayout:", v6, v7);
    v16 = v17;
    v15 = v18;
  }
  else
  {
    v10 = v9;
    v11 = v7;
    objc_msgSend(v11, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "identifier");
    memset(v25, 0, sizeof(v25));
    v14 = *MEMORY[0x24BE727F0];
    v22 = 0u;
    v23 = 0u;
    v24 = 0;
    v21[0] = 5;
    v21[1] = v14;
    v21[2] = v13;
    v21[3] = 0;
    v21[4] = v10;
    v21[5] = 0x7FFFFFFFFFFFFFFFLL;
    LODWORD(v10) = objc_msgSend(v11, "getGeometry:group:userData:forTileWithIdentifier:", v25, 0, 0, v21);

    -[AEMessagesShelfViewController _setIndexToScrollTo:](self, "_setIndexToScrollTo:", -1);
    v15 = 0.0;
    if ((_DWORD)v10)
      v16 = *(double *)v25;
    else
      v16 = 0.0;

  }
  v19 = v16;
  v20 = v15;
  result.y = v20;
  result.x = v19;
  return result;
}

- (double)layout:(id)a3 aspectRatioForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  _OWORD v12[2];

  objc_msgSend(a3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a4->item;
  v12[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v12[1] = v6;
  objc_msgSend(v5, "assetReferenceAtItemIndexPath:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aspectRatio");
  v10 = v9;

  return v10;
}

- (int64_t)layout:(id)a3 irisToggleStateForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  void *v5;
  void *v6;
  unint64_t item;
  void *v8;
  void *v9;
  int64_t v10;

  -[AEMessagesShelfViewController _packageTransport](self, "_packageTransport", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedStagedIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  item = a4->item;
  if (item >= objc_msgSend(v6, "count"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", a4->item);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stagedPackageForIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsLivePhotoContent"))
    {
      if (objc_msgSend(v9, "containsSuppressedLivePhoto"))
        v10 = 1;
      else
        v10 = 2;
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (int64_t)layout:(id)a3 generationStateForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  void *v6;
  void *v7;
  unint64_t item;
  void *v9;
  void *v10;
  int v11;
  unsigned int v12;
  int64_t v13;

  if (!_os_feature_enabled_impl()
    || !_os_feature_enabled_impl()
    || !objc_msgSend(MEMORY[0x24BE3C8E8], "isAvailable"))
  {
    return 0;
  }
  -[AEMessagesShelfViewController _packageTransport](self, "_packageTransport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedStagedIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  item = a4->item;
  if (item >= objc_msgSend(v7, "count"))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", a4->item);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stagedPackageForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsGenerationRecipeData");
    v12 = objc_msgSend(v10, "containsGenerationSourceImage");
    if (v11)
      v13 = 2;
    else
      v13 = v12;

  }
  return v13;
}

- (BOOL)layout:(id)a3 itemAtIndexPathIsVideo:(PXSimpleIndexPath *)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  BOOL v8;
  _OWORD v10[2];

  objc_msgSend(a3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a4->item;
  v10[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v10[1] = v6;
  objc_msgSend(v5, "assetAtItemIndexPath:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "playbackStyle") == 4;

  return v8;
}

- (BOOL)layout:(id)a3 itemAtIndexPathIsLoop:(PXSimpleIndexPath *)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  BOOL v8;
  _OWORD v10[2];

  objc_msgSend(a3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a4->item;
  v10[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v10[1] = v6;
  objc_msgSend(v5, "assetAtItemIndexPath:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "playbackStyle") == 5;

  return v8;
}

- (BOOL)layout:(id)a3 itemAtIndexPathIsAnimatedImage:(PXSimpleIndexPath *)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  BOOL v8;
  _OWORD v10[2];

  objc_msgSend(a3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a4->item;
  v10[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v10[1] = v6;
  objc_msgSend(v5, "assetAtItemIndexPath:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "playbackStyle") == 2;

  return v8;
}

- (BOOL)layout:(id)a3 itemAtIndexPathIsSpatial:(PXSimpleIndexPath *)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  unint64_t v8;
  _OWORD v10[2];

  objc_msgSend(a3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a4->item;
  v10[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v10[1] = v6;
  objc_msgSend(v5, "assetAtItemIndexPath:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ((unint64_t)objc_msgSend(v7, "mediaSubtypes") >> 10) & 1;

  return v8;
}

- (double)layout:(id)a3 itemAtIndexPathDuration:(PXSimpleIndexPath *)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  double v8;
  double v9;
  _OWORD v11[2];

  objc_msgSend(a3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a4->item;
  v11[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v11[1] = v6;
  objc_msgSend(v5, "assetAtItemIndexPath:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "duration");
  v9 = v8;

  return v9;
}

- (BOOL)layoutShouldShowVideoDuration:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "statusBarOrientation");

  return (unint64_t)(v4 - 1) < 2;
}

- (BOOL)layoutShouldShowCancelButtons:(id)a3
{
  return (-[AEMessagesShelfViewController _options](self, "_options", a3) & 1) == 0;
}

- (BOOL)wantsEdgeToEdgeLayout
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  objc_msgSend(MEMORY[0x24BE15A60], "sharedBehaviors", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryViewMaxPluginShelfHeight");
  v6 = v5;

  v7 = width;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)framesOfVisibleContentViewInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v4 = a3;
  -[AEMessagesShelfViewController _scrollViewController](self, "_scrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentCoordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[AEMessagesShelfViewController _tilingController](self, "_tilingController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__AEMessagesShelfViewController_framesOfVisibleContentViewInCoordinateSpace___block_invoke;
  v22[3] = &unk_24E23B5B8;
  v23 = v6;
  v24 = v4;
  v25 = v16;
  v17 = v16;
  v18 = v4;
  v19 = v6;
  objc_msgSend(v15, "enumerateTilesInRect:withOptions:usingBlock:", 0, v22, v8, v10, v12, v14);
  v20 = (void *)objc_msgSend(v17, "copy");

  return v20;
}

- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4
{
  id v5;
  AEMessagesShelfLayout *v6;

  v5 = a4;
  v6 = -[PXAssetsTilingLayout initWithDataSource:]([AEMessagesShelfLayout alloc], "initWithDataSource:", v5);

  -[AEMessagesShelfLayout setDelegate:](v6, "setDelegate:", self);
  return v6;
}

- (id)assetsScene:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  AEDelegatingTransitionAnimationCoordinator *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "tilingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tilingController:transitionAnimationCoordinatorForChange:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "setDelayInsertions:", 1);
  v9 = -[AEDelegatingTransitionAnimationCoordinator initWithWrappedCoordinator:]([AEDelegatingTransitionAnimationCoordinator alloc], "initWithWrappedCoordinator:", v8);
  -[AEDelegatingTransitionAnimationCoordinator setEnableDoubleSidedAnimations:](v9, "setEnableDoubleSidedAnimations:", 1);

  return v9;
}

- (void)_removeFromShelf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AEMessagesShelfViewController _sceneController](self, "_sceneController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tilingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "tileIdentifierForTile:", v4);

}

- (void)_toggleIris:(id)a3
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
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;

  v4 = a3;
  v17 = 0u;
  -[AEMessagesShelfViewController _sceneController](self, "_sceneController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tilingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "tileIdentifierForTile:", v4);
  else
    v17 = 0u;

  if ((unint64_t)(v17 - 6) >= 0xFFFFFFFFFFFFFFFDLL)
  {
    -[AEMessagesShelfViewController _packageTransport](self, "_packageTransport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orderedStagedIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stagedPackageForIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    if (objc_msgSend(v11, "containsSuppressedLivePhoto"))
      objc_msgSend(v12, "endSuppressingLivePhoto");
    else
      objc_msgSend(v12, "beginSupressingLivePhoto");
    objc_msgSend(v8, "stagePackage:", v12, v17);
    -[AEMessagesShelfViewController assetExplorerAnalytics](self, "assetExplorerAnalytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BE72DC8];
    -[AEMessagesShelfViewController _dataSource](self, "_dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "orderedIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendEvent:view:source:currentAssetCount:", v14, 1, 1, objc_msgSend(v16, "count"));

  }
}

- (void)_didTapGenerationButton:(id)a3
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
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v4 = a3;
  v32 = 0;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  -[AEMessagesShelfViewController _sceneController](self, "_sceneController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tilingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "tileIdentifierForTile:", v4);
  }
  else
  {
    v32 = 0;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v27 = 0u;
  }

  if ((unint64_t)(v27 - 6) >= 0xFFFFFFFFFFFFFFFDLL && (_QWORD)v28 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[AEMessagesShelfViewController _packageTransport](self, "_packageTransport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orderedStagedIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", (_QWORD)v29);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stagedPackageForIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "generationRecipeData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEMessagesShelfViewController setEditingGeneratedPackageIdentifier:](self, "setEditingGeneratedPackageIdentifier:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3C8E8]), "initWithStyle:", 0);
    objc_msgSend(v14, "setDelegate:", self);
    if (objc_msgSend(v11, "containsGenerationRecipeData"))
    {
      v15 = objc_alloc(MEMORY[0x24BE3C8F0]);
      v25 = v12;
      v16 = (void *)objc_msgSend(v15, "initWithEncodedRecipe:prompt:contextElements:", v12, 0, MEMORY[0x24BDBD1A8]);
      objc_msgSend(v14, "setRecipe:", v16);
    }
    else
    {
      if (!objc_msgSend(v11, "containsGenerationSourceImage"))
      {
        PLAssetExplorerGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E23A000, v21, OS_LOG_TYPE_ERROR, "No recipe nor source image, unable to present generative playground controller.", buf, 2u);
        }
        goto LABEL_11;
      }
      v25 = v12;
      v17 = objc_alloc(MEMORY[0x24BDBCE50]);
      objc_msgSend(v11, "sourceImageURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v17, "initWithContentsOfURL:", v18);

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithData:", v16);
      objc_msgSend(v14, "setSourceImage:", v19);

    }
    -[AEMessagesShelfViewController entryViewDelegate](self, "entryViewDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "presentViewController:animated:completion:", v14, 1, 0);

    -[AEMessagesShelfViewController assetExplorerAnalytics](self, "assetExplorerAnalytics");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BE72DB0];
    -[AEMessagesShelfViewController _dataSource](self, "_dataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "orderedIdentifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject sendEvent:view:source:currentAssetCount:](v21, "sendEvent:view:source:currentAssetCount:", v22, 1, 1, objc_msgSend(v24, "count"));

    v12 = v25;
LABEL_11:

  }
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;

  v6 = a4;
  -[AEMessagesShelfViewController _sceneController](self, "_sceneController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a3->var1[5];
  v26 = *(_OWORD *)&a3->var1[3];
  v27 = v8;
  v28 = *(_OWORD *)&a3->var1[7];
  v29 = a3->var1[9];
  v9 = *(_OWORD *)&a3->var1[1];
  v24 = *(_OWORD *)&a3->var0;
  v25 = v9;
  if (!objc_msgSend(v7, "providesTileForIdentifier:", &v24))
  {
    objc_msgSend(v7, "viewTileReusePool");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = a3->var1[0];
    v16 = a3->var1[4];
    if (v15 > 1295210291)
    {
      switch(v15)
      {
        case 1295210292:
          v18 = 1295210292;
          if (v16 == 1)
          {
            v18 = 1295210293;
          }
          else if (v16 != 2)
          {
            if (v16)
              goto LABEL_21;
            goto LABEL_34;
          }
          break;
        case 1500001338:
          v18 = 1500001338;
          break;
        case 1313817680:
          v18 = 1313817680;
          break;
        default:
          goto LABEL_34;
      }
    }
    else
    {
      if (v15 == 795209731)
      {
        switch(v16)
        {
          case 0uLL:
            v18 = 795209731;
            goto LABEL_31;
          case 1uLL:
            v18 = 795209732;
            goto LABEL_31;
          case 2uLL:
          case 5uLL:
          case 6uLL:
            goto LABEL_34;
          case 3uLL:
            v18 = 795209734;
            goto LABEL_31;
          case 4uLL:
            v18 = 795209735;
            goto LABEL_31;
          case 7uLL:
            v18 = 795209738;
            goto LABEL_31;
          default:
            goto LABEL_21;
        }
      }
      if (v15 != 1215219281)
      {
        if (v15 == 1277777777)
        {
          objc_msgSend(v13, "checkOutReusableObjectWithReuseIdentifier:", 1277777777);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v17;
          if (v16 == 2)
          {
            v19 = 1;
          }
          else
          {
            if (v16 != 1)
            {
              if (v16)
              {
LABEL_32:
                -[AEMessagesShelfViewController _tilesInUse](self, "_tilesInUse");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "addObject:", v12);

                -[AEMessagesShelfViewController _scrollViewController](self, "_scrollViewController");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "view");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "ae_ensureSubview:", v22);

                goto LABEL_33;
              }

LABEL_21:
              v12 = 0;
              goto LABEL_32;
            }
            v19 = 0;
          }
          objc_msgSend(v17, "setIsGenerativeAssetAppearance:", v19);
          goto LABEL_32;
        }
LABEL_34:
        abort();
      }
      v18 = 1215219281;
    }
LABEL_31:
    objc_msgSend(v13, "checkOutReusableObjectWithReuseIdentifier:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  v10 = *(_OWORD *)&a3->var1[5];
  v26 = *(_OWORD *)&a3->var1[3];
  v27 = v10;
  v28 = *(_OWORD *)&a3->var1[7];
  v29 = a3->var1[9];
  v11 = *(_OWORD *)&a3->var1[1];
  v24 = *(_OWORD *)&a3->var0;
  v25 = v11;
  v12 = (void *)objc_msgSend(v7, "checkOutTileForIdentifier:layout:", &v24, v6);
LABEL_33:

  return v12;
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

  -[AEMessagesShelfViewController _sceneController](self, "_sceneController");
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
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");

    objc_msgSend(v7, "viewTileReusePool");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "checkInReusableObject:", v12);
    -[AEMessagesShelfViewController _tilesInUse](self, "_tilesInUse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObject:", v12);

  }
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
  -[AEMessagesShelfViewController _scrollViewController](self, "_scrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AEMessagesShelfViewController _scrollViewController](self, "_scrollViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentCoordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AEMessagesShelfViewController _tilingController](self, "_tilingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v11 = v10;
  v13 = v12;

  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v6, v11, v13);
  if (v9)
    objc_msgSend(v9, "hitTestTileAtPoint:padding:passingTest:", &__block_literal_global_306);

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
    -[AEMessagesShelfViewController _scrollViewController](self, "_scrollViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "locationInView:", v5);
    -[AEMessagesShelfViewController contentAssetReferenceAtPoint:](self, "contentAssetReferenceAtPoint:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && -[AEMessagesShelfViewController shouldPresentReviewController](self, "shouldPresentReviewController"))
      -[AEMessagesShelfViewController _presentReviewForAssetReference:](self, "_presentReviewForAssetReference:", v6);

  }
}

- (BOOL)shouldPresentReviewController
{
  void *v2;
  char v3;

  -[AEMessagesShelfViewController _packageTransport](self, "_packageTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldHideReviewController") ^ 1;

  return v3;
}

- (void)_presentReviewForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AEMessagesShelfViewController _currentAssetsDataSource](self, "_currentAssetsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEMessagesShelfViewController _internalReviewMediaProvider](self, "_internalReviewMediaProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  if (v5)
    objc_msgSend(v5, "indexPathForAssetReference:", v4);
  v23 = v5;
  v24 = v4;
  v29 = v31;
  v30 = v32;
  PXIndexPathFromSimpleIndexPath();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEMessagesShelfViewController _packageTransport](self, "_packageTransport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedStagedIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v6, "stagedPackageForIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "containsSuppressedLivePhoto"))
          objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v12);
  }

  -[AEMessagesShelfViewController _dataSource](self, "_dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72D58]), "initWithReviewDataSource:", v17);
  LOBYTE(v20) = 0;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72D30]), "initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:selectionCountLimit:sourceType:lowMemoryMode:options:", v18, v22, 0, v21, v8, v9, 0, 1, v20, 0);
  objc_msgSend(v19, "setDelegate:", self);
  objc_msgSend(v19, "setModalPresentationStyle:", 0);
  -[AEMessagesShelfViewController _presentReviewViewController:](self, "_presentReviewViewController:", v19);

}

- (id)contentAssetReferenceAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  y = a3.y;
  x = a3.x;
  -[AEMessagesShelfViewController _scrollViewController](self, "_scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AEMessagesShelfViewController _scrollViewController](self, "_scrollViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentCoordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AEMessagesShelfViewController _tilingController](self, "_tilingController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  if (v10 && (objc_msgSend(v10, "hitTestTileAtPoint:padding:passingTest:", &__block_literal_global_309), (_QWORD)v19))
  {
    v17 = v20;
    v12 = *((_QWORD *)&v21 + 1);
    v11 = v21;
    objc_msgSend(v10, "currentLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v17;
    v18[1] = __PAIR128__(v12, v11);
    objc_msgSend(v14, "assetReferenceAtItemIndexPath:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  return (a4 < 7) & (0x7Bu >> a4);
}

- (void)assetExplorerReviewScreenViewControllerDidPressCancel:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v4 = a3;
  PLAssetExplorerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E23A000, v5, OS_LOG_TYPE_DEFAULT, "Cancelled review; will dismiss.", buf, 2u);
  }

  -[AEMessagesShelfViewController _dismissPresentedReviewController:animated:](self, "_dismissPresentedReviewController:animated:", v4, 1);
  PLAssetExplorerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21E23A000, v6, OS_LOG_TYPE_DEFAULT, "Cancelled review; did dismiss.", v7, 2u);
  }

}

- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  AEMessagesShelfViewController *v47;
  id v48;
  uint8_t buf[16];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v46 = a3;
  v11 = a5;
  v12 = a6;
  v47 = self;
  v48 = a7;
  -[AEMessagesShelfViewController _packageTransport](self, "_packageTransport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orderedStagedIdentifiers");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v43, "mutableCopy");
  v45 = v11;
  objc_msgSend(v14, "minusSet:", v11);
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unstagePackagesWithIdentifiers:", v15);

  }
  v42 = v14;
  if (objc_msgSend(v48, "count"))
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v48, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v55 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v13, "stagedPackageForIdentifier:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "mediaOrigin");
          v24 = objc_msgSend(v12, "containsObject:", v21);
          objc_msgSend(v48, "objectForKeyedSubscript:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[AEMessagesShelfViewController _immediatelyGenerateAndStagePackageFromReviewAsset:suppressLivePhoto:mediaOrigin:](v47, "_immediatelyGenerateAndStagePackageFromReviewAsset:suppressLivePhoto:mediaOrigin:", v25, v24, v23);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v18);
    }

  }
  objc_msgSend(v13, "packagesWithLivePhotoContent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "count"))
  {
    v27 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v41 = v26;
    v28 = v26;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (!v29)
      goto LABEL_29;
    v30 = v29;
    v31 = *(_QWORD *)v51;
    while (1)
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v51 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v33, "identifier", v41);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v12, "containsObject:", v34);
        v36 = objc_msgSend(v33, "containsSuppressedLivePhoto");
        if (v35)
        {
          if ((v36 & 1) == 0)
          {
            v37 = (void *)objc_msgSend(v33, "mutableCopy");
            objc_msgSend(v37, "beginSupressingLivePhoto");
            if (v37)
              goto LABEL_24;
          }
        }
        else if (v36)
        {
          v37 = (void *)objc_msgSend(v33, "mutableCopy");
          objc_msgSend(v37, "endSuppressingLivePhoto");
          if (v37)
          {
LABEL_24:
            objc_msgSend(v27, "addObject:", v37);

          }
        }
        if (objc_msgSend(v27, "count"))
        {
          objc_msgSend(v27, "allObjects");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stagePackages:", v38);

        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (!v30)
      {
LABEL_29:

        v26 = v41;
        break;
      }
    }
  }
  PLAssetExplorerGetLog();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E23A000, v39, OS_LOG_TYPE_DEFAULT, "Finished review; will dismiss.", buf, 2u);
  }

  -[AEMessagesShelfViewController _dismissPresentedReviewController:animated:](v47, "_dismissPresentedReviewController:animated:", v46, 1);
  PLAssetExplorerGetLog();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E23A000, v40, OS_LOG_TYPE_DEFAULT, "Finished review; did dismiss.", buf, 2u);
  }

}

- (void)imageEditionViewControllerDidFinishEditing:(id)a3 error:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AEGenerativePlaygroundAssetPackageGenerator *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "generatedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AEMessagesShelfViewController _packageTransport](self, "_packageTransport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEMessagesShelfViewController editingGeneratedPackageIdentifier](self, "editingGeneratedPackageIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unstagePackageWithIdentifier:", v8);

    v9 = objc_alloc_init(AEGenerativePlaygroundAssetPackageGenerator);
    -[AEGenerativePlaygroundAssetPackageGenerator generatePackageFromGenerativePlaygroundAsset:](v9, "generatePackageFromGenerativePlaygroundAsset:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEMessagesShelfViewController _packageTransport](self, "_packageTransport");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stagePackage:", v10);

  }
  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)imageEditionViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (UIColor)_roundedCornerOverlayFillColor
{
  UIColor *roundedCornerOverlayFillColor;
  void *v4;
  void *v5;
  UIColor *v6;
  UIColor *v7;

  roundedCornerOverlayFillColor = self->__roundedCornerOverlayFillColor;
  if (!roundedCornerOverlayFillColor)
  {
    -[AEMessagesShelfViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[AEMessagesShelfViewController _traverseHierarchyForFillColorStartingWithView:](self, "_traverseHierarchyForFillColorStartingWithView:", v5);
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v7 = self->__roundedCornerOverlayFillColor;
    self->__roundedCornerOverlayFillColor = v6;

    roundedCornerOverlayFillColor = self->__roundedCornerOverlayFillColor;
  }
  return roundedCornerOverlayFillColor;
}

- (id)_traverseHierarchyForFillColorStartingWithView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  do
  {
    v5 = v4;
    objc_msgSend(v4, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (!v6 && v4);

  return v6;
}

- (void)_immediatelyGenerateAndStagePackageFromReviewAsset:(id)a3 suppressLivePhoto:(BOOL)a4 mediaOrigin:(int64_t)a5
{
  id v8;
  void *v9;
  AECameraAssetPackageGenerator *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;
  BOOL v15;

  v8 = a3;
  -[AEMessagesShelfViewController _packageTransport](self, "_packageTransport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(AECameraAssetPackageGenerator);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __114__AEMessagesShelfViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke;
  v12[3] = &unk_24E23B950;
  v15 = a4;
  v13 = v9;
  v14 = a5;
  v11 = v9;
  -[AECameraAssetPackageGenerator generatePackageFromReviewAsset:withCompletionHandler:](v10, "generatePackageFromReviewAsset:withCompletionHandler:", v8, v12);

}

- (id)_currentAssetsDataSource
{
  void *v2;
  void *v3;
  void *v4;

  -[AEMessagesShelfViewController _sceneController](self, "_sceneController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[AEMessagesShelfViewController assetExplorerAnalytics](self, "assetExplorerAnalytics", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE72DC0];
  -[AEMessagesShelfViewController _dataSource](self, "_dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendEvent:view:source:currentAssetCount:", v4, 1, 1, objc_msgSend(v6, "count"));

}

- (CKPluginEntryViewControllerDelegate)entryViewDelegate
{
  return (CKPluginEntryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_entryViewDelegate);
}

- (void)setEntryViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_entryViewDelegate, a3);
}

- (PXTilingController)_tilingController
{
  return self->__tilingController;
}

- (PXBasicUIViewTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (PXAssetsScene)_sceneController
{
  return self->__sceneController;
}

- (PXScrollViewController)_scrollViewController
{
  return self->__scrollViewController;
}

- (PUReviewDataSource)_dataSource
{
  return self->__dataSource;
}

- (PUReviewAssetsDataSourceManager)_internalReviewDataSourceManager
{
  return self->__internalReviewDataSourceManager;
}

- (PUReviewAssetsMediaProvider)_internalReviewMediaProvider
{
  return self->__internalReviewMediaProvider;
}

- (AEWrappedDataSourceManager)_wrappedDataSourceManager
{
  return self->__wrappedDataSourceManager;
}

- (AEPackageTransport)_packageTransport
{
  return self->__packageTransport;
}

- (NSString)editingGeneratedPackageIdentifier
{
  return self->_editingGeneratedPackageIdentifier;
}

- (void)setEditingGeneratedPackageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_editingGeneratedPackageIdentifier, a3);
}

- (NSMutableSet)_tilesInUse
{
  return self->__tilesInUse;
}

- (int64_t)_indexToScrollTo
{
  return self->__indexToScrollTo;
}

- (void)_setIndexToScrollTo:(int64_t)a3
{
  self->__indexToScrollTo = a3;
}

- (void)set_roundedCornerOverlayFillColor:(id)a3
{
  objc_storeStrong((id *)&self->__roundedCornerOverlayFillColor, a3);
}

- (PUAssetExplorerReviewScreenViewController)presentedReviewController
{
  return self->_presentedReviewController;
}

- (void)setPresentedReviewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedReviewController, a3);
}

- (unint64_t)_options
{
  return self->__options;
}

- (void)setAssetExplorerAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_assetExplorerAnalytics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetExplorerAnalytics, 0);
  objc_storeStrong((id *)&self->_presentedReviewController, 0);
  objc_storeStrong((id *)&self->__roundedCornerOverlayFillColor, 0);
  objc_storeStrong((id *)&self->__tilesInUse, 0);
  objc_storeStrong((id *)&self->_editingGeneratedPackageIdentifier, 0);
  objc_storeStrong((id *)&self->__packageTransport, 0);
  objc_storeStrong((id *)&self->__wrappedDataSourceManager, 0);
  objc_storeStrong((id *)&self->__internalReviewMediaProvider, 0);
  objc_storeStrong((id *)&self->__internalReviewDataSourceManager, 0);
  objc_storeStrong((id *)&self->__dataSource, 0);
  objc_storeStrong((id *)&self->__scrollViewController, 0);
  objc_storeStrong((id *)&self->__sceneController, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
  objc_storeStrong((id *)&self->__tilingController, 0);
  objc_destroyWeak((id *)&self->_entryViewDelegate);
}

void __114__AEMessagesShelfViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __114__AEMessagesShelfViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke_2;
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

void *__114__AEMessagesShelfViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke_2(uint64_t a1)
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

BOOL __62__AEMessagesShelfViewController_contentAssetReferenceAtPoint___block_invoke(uint64_t a1, _QWORD *a2)
{
  return *a2 == 5 && a2[1] == *MEMORY[0x24BE727F0];
}

BOOL __62__AEMessagesShelfViewController_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, _QWORD *a2)
{
  return *a2 == 5 && a2[1] == *MEMORY[0x24BE727F0];
}

void __77__AEMessagesShelfViewController_framesOfVisibleContentViewInCoordinateSpace___block_invoke(uint64_t a1, _QWORD *a2, uint64_t a3, double *a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v10;
  void *v11;
  id v12;

  v10 = a7;
  if (*a2 == 5 && a2[1] == *MEMORY[0x24BE727F0])
  {
    v12 = v10;
    objc_msgSend(*(id *)(a1 + 32), "convertRect:toCoordinateSpace:", *(_QWORD *)(a1 + 40), *a4, a4[1], a4[2], a4[3]);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);

    v10 = v12;
  }

}

void __64__AEMessagesShelfViewController__transportStagingStateDidChange__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v33;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v33 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "removeAssetWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v4);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = *(id *)(a1 + 48);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(a1 + 56), "stagedPackageForIdentifier:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "reviewAssetFromPackageMetadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "replaceAsset:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v9);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = *(id *)(a1 + 64);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(a1 + 56), "stagedPackageForIdentifier:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18), (_QWORD)v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "reviewAssetFromPackageMetadata");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(a1 + 72);
        objc_msgSend(v19, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "indexOfObject:", v22);

        objc_msgSend(*(id *)(a1 + 40), "insertAsset:atIndex:", v20, v23);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v16);
  }

}

id __44__AEMessagesShelfViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  +[AEMessagesShelfRoundButton roundButtonWithStyle:](AEMessagesShelfRoundButton, "roundButtonWithStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "addTarget:action:forControlEvents:", WeakRetained, sel__removeFromShelf_, 64);

  return v2;
}

id __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  +[AEMessagesShelfRoundButton roundButtonWithStyle:](AEMessagesShelfRoundButton, "roundButtonWithStyle:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "addTarget:action:forControlEvents:", WeakRetained, sel__toggleIris_, 64);

  return v2;
}

id __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  +[AEMessagesShelfRoundButton roundButtonWithStyle:](AEMessagesShelfRoundButton, "roundButtonWithStyle:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "addTarget:action:forControlEvents:", WeakRetained, sel__toggleIris_, 64);

  return v2;
}

id __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  +[AEGenerativePlaygroundButton buttonWithType:](_TtC13AssetExplorer28AEGenerativePlaygroundButton, "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "addTarget:action:forControlEvents:", WeakRetained, sel__didTapGenerationButton_, 64);

  return v2;
}

_AEDurationLabelTile *__44__AEMessagesShelfViewController_viewDidLoad__block_invoke_6()
{
  _AEDurationLabelTile *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(_AEDurationLabelTile);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[_AEDurationLabelTile setBackgroundColor:](v0, "setBackgroundColor:", v1);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_AEDurationLabelTile setFont:](v0, "setFont:", v2);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_AEDurationLabelTile setTextColor:](v0, "setTextColor:", v3);

  -[_AEDurationLabelTile setTextAlignment:](v0, "setTextAlignment:", 2);
  return v0;
}

id __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_5()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "px_bundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("spatial"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v2);
  return v3;
}

@end
