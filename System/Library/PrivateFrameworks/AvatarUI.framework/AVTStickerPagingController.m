@implementation AVTStickerPagingController

+ (id)stickerCacheWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  AVTInMemoryResourceCache *v6;
  void *v7;
  void *v8;
  AVTPassThroughResourceCache *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (AVTUIStickersCaching())
  {
    if (AVTUIFlushStickersCache())
    {
      objc_msgSend(v3, "stickerImageStoreLocation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "logger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v4, v5);

      AVTUISetFlushStickersCache();
    }
    v6 = [AVTInMemoryResourceCache alloc];
    objc_msgSend(v3, "lockProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AVTInMemoryResourceCache initWithLockProvider:totalCostLimit:logger:](v6, "initWithLockProvider:totalCostLimit:logger:", v7, 980000, v8);

  }
  else
  {
    objc_msgSend(v3, "stickerImageStoreLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v10, v11);

    AVTUISetFlushStickersCache();
    v9 = objc_alloc_init(AVTPassThroughResourceCache);
  }

  return v9;
}

- (AVTStickerPagingController)initWithRecordDataSource:(id)a3 recordImageProvider:(id)a4 stickerConfigurationProvider:(id)a5 taskScheduler:(id)a6 environment:(id)a7 allowsPeel:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  AVTStickerPagingController *v18;
  AVTStickerPagingController *v19;
  AVTUIStickerGeneratorPool *v20;
  void *v21;
  uint64_t v22;
  AVTUIStickerGeneratorPool *stickerGeneratorPool;
  uint64_t v24;
  OS_dispatch_queue *renderingQueue;
  uint64_t v26;
  OS_dispatch_queue *encodingQueue;
  uint64_t v28;
  NSMutableDictionary *pageForRecords;
  uint64_t v30;
  AVTResourceCache *cache;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v35.receiver = self;
  v35.super_class = (Class)AVTStickerPagingController;
  v18 = -[AVTStickerPagingController init](&v35, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dataSource, a3);
    objc_storeStrong((id *)&v19->_environment, a7);
    v19->_allowsPeel = a8;
    v20 = [AVTUIStickerGeneratorPool alloc];
    objc_msgSend(v17, "logger", v33, v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[AVTUIStickerGeneratorPool initWithMaxStickerGeneratorCount:logger:](v20, "initWithMaxStickerGeneratorCount:logger:", 2, v21);
    stickerGeneratorPool = v19->_stickerGeneratorPool;
    v19->_stickerGeneratorPool = (AVTUIStickerGeneratorPool *)v22;

    objc_storeStrong((id *)&v19->_taskScheduler, a6);
    objc_msgSend(v17, "backgroundRenderingQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    renderingQueue = v19->_renderingQueue;
    v19->_renderingQueue = (OS_dispatch_queue *)v24;

    objc_msgSend(v17, "backgroundEncodingQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    encodingQueue = v19->_encodingQueue;
    v19->_encodingQueue = (OS_dispatch_queue *)v26;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    pageForRecords = v19->_pageForRecords;
    v19->_pageForRecords = (NSMutableDictionary *)v28;

    objc_msgSend((id)objc_opt_class(), "stickerCacheWithEnvironment:", v17);
    v30 = objc_claimAutoreleasedReturnValue();
    cache = v19->_cache;
    v19->_cache = (AVTResourceCache *)v30;

    objc_storeStrong((id *)&v19->_imageProvider, a4);
    objc_storeStrong((id *)&v19->_stickerConfigurationProvider, a5);
  }

  return v19;
}

- (UIView)view
{
  UIView *view;

  view = self->_view;
  if (!view)
  {
    -[AVTStickerPagingController loadView](self, "loadView");
    view = self->_view;
  }
  return view;
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  AVTNotifyingContainerView *v11;
  id v12;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  objc_msgSend(v12, "setScrollDirection:", 1);
  objc_msgSend(v12, "setMinimumInteritemSpacing:", 0.0);
  objc_msgSend(v12, "setMinimumLineSpacing:", 0.0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA410]), "initWithFrame:collectionViewLayout:", v12, v3, v4, v5, v6);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setDataSource:", self);
  objc_msgSend(v7, "setPrefetchDataSource:", self);
  objc_msgSend(v7, "setPrefetchingEnabled:", 1);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v7, "setPagingEnabled:", 1);
  objc_msgSend(v7, "setContentInsetAdjustmentBehavior:", 2);
  v9 = objc_opt_class();
  +[AVTStickerPagingCollectionViewCell cellIdentifier](AVTStickerPagingCollectionViewCell, "cellIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v9, v10);

  objc_msgSend(v7, "setAutoresizingMask:", 18);
  -[AVTStickerPagingController setCollectionView:](self, "setCollectionView:", v7);
  v11 = -[AVTNotifyingContainerView initWithFrame:]([AVTNotifyingContainerView alloc], "initWithFrame:", v3, v4, v5, v6);
  -[AVTNotifyingContainerView setDelegate:](v11, "setDelegate:", self);
  -[AVTNotifyingContainerView addSubview:](v11, "addSubview:", v7);
  -[AVTStickerPagingController setView:](self, "setView:", v11);
  -[AVTStickerPagingController reloadData](self, "reloadData");

}

- (void)setPageContentInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (a3.left != self->_pageContentInsets.left
    || a3.top != self->_pageContentInsets.top
    || a3.right != self->_pageContentInsets.right
    || a3.bottom != self->_pageContentInsets.bottom)
  {
    self->_pageContentInsets = a3;
    -[AVTStickerPagingController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentOffset");
    -[AVTStickerPagingController centeredPageWithOffset:](self, "centeredPageWithOffset:");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTStickerPagingController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionViewLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateLayout");

    objc_msgSend(v14, "setSectionInsets:", top, left, bottom, right);
  }
}

- (void)prefetchDataForRecord:(id)a3
{
  id v3;

  -[AVTStickerPagingController sheetControllerForRecord:](self, "sheetControllerForRecord:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAllSchedulerTasks");

}

- (void)cancelPrefetchingDataForRecord:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AVTStickerPagingController taskScheduler](self, "taskScheduler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cancelStickerSheetTasksForAvatarRecordIdentifier:", v5);
}

- (void)reloadData
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerPagingController setPageForRecords:](self, "setPageForRecords:", v3);

  -[AVTStickerPagingController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (id)sheetControllerForRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AVTStickerSheetController *v8;
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
  AVTStickerSheetController *v21;
  AVTStickerSheetController *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  -[AVTStickerPagingController pageForRecords](self, "pageForRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[AVTStickerPagingController stickerConfigurationProvider](self, "stickerConfigurationProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stickerConfigurationsForAvatarRecord:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTStickerPagingController cache](self, "cache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController renderingQueue](self, "renderingQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController encodingQueue](self, "encodingQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController stickerGeneratorPool](self, "stickerGeneratorPool");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController imageProvider](self, "imageProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController environment](self, "environment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTStickerSheetModel sheetModelForAvatarRecord:withConfigurations:cache:taskScheduler:renderingQueue:encodingQueue:stickerGeneratorPool:imageProvider:environment:](AVTStickerSheetModel, "sheetModelForAvatarRecord:withConfigurations:cache:taskScheduler:renderingQueue:encodingQueue:stickerGeneratorPool:imageProvider:environment:", v4, v10, v11, 0, v12, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTStickerPagingController stickerSheetControllerProvider](self, "stickerSheetControllerProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[AVTStickerPagingController stickerSheetControllerProvider](self, "stickerSheetControllerProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTStickerPagingController taskScheduler](self, "taskScheduler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stickerSheetControllerForSelectedAvatar:stickerSheetModel:taskScheduler:", v4, v17, v20);
      v21 = (AVTStickerSheetController *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = [AVTStickerSheetController alloc];
      -[AVTStickerPagingController taskScheduler](self, "taskScheduler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[AVTStickerSheetController initWithStickerSheetModel:taskScheduler:allowsPeel:](v22, "initWithStickerSheetModel:taskScheduler:allowsPeel:", v17, v19, -[AVTStickerPagingController allowsPeel](self, "allowsPeel"));
    }

    -[AVTStickerSheetController setDelegate:](v21, "setDelegate:", self);
    -[AVTStickerPagingController disclosureValidationDelegate](self, "disclosureValidationDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerSheetController setDisclosureValidationDelegate:](v21, "setDisclosureValidationDelegate:", v23);

    -[AVTStickerPagingController pageForRecords](self, "pageForRecords");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v21, v25);

    v8 = v21;
  }

  return v8;
}

- (id)reloadSheetControllerForRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[AVTStickerPagingController pageForRecords](self, "pageForRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVTStickerPagingController pageForRecords](self, "pageForRecords");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

    objc_msgSend(v7, "sheetDidDisappear");
  }
  -[AVTStickerPagingController stickerGeneratorPool](self, "stickerGeneratorPool");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flushGeneratorForRecord:", v4);

  -[AVTStickerPagingController sheetControllerForRecord:](self, "sheetControllerForRecord:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)sheetControllerAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[AVTStickerPagingController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTStickerPagingController sheetControllerForRecord:](self, "sheetControllerForRecord:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)insertPageForRecord:(id)a3 atIndex:(int64_t)a4
{
  void *v5;
  id v6;

  -[AVTStickerPagingController reloadSheetControllerForRecord:](self, "reloadSheetControllerForRecord:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);
  -[AVTStickerPagingController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)deletePageForRecord:(id)a3 atIndex:(int64_t)a4
{
  id v6;
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
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  -[AVTStickerPagingController pageForRecords](self, "pageForRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForItemAtIndexPath:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController setLastDeletedCell:](self, "setLastDeletedCell:", v12);

    -[AVTStickerPagingController stickerGeneratorPool](self, "stickerGeneratorPool");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "flushGeneratorForRecord:", v6);

    -[AVTStickerPagingController pageForRecords](self, "pageForRecords");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v15);

    -[AVTStickerPagingController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__AVTStickerPagingController_deletePageForRecord_atIndex___block_invoke;
    v20[3] = &unk_1EA51D570;
    v20[4] = self;
    v21 = v10;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__AVTStickerPagingController_deletePageForRecord_atIndex___block_invoke_2;
    v18[3] = &unk_1EA51D250;
    v19 = v9;
    v17 = v10;
    objc_msgSend(v16, "performBatchUpdates:completion:", v20, v18);

  }
}

void __58__AVTStickerPagingController_deletePageForRecord_atIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteItemsAtIndexPaths:", v3);

}

uint64_t __58__AVTStickerPagingController_deletePageForRecord_atIndex___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sheetDidDisappear");
}

- (void)reloadPageForRecord:(id)a3 atIndex:(int64_t)a4
{
  id v5;
  id v6;

  v5 = -[AVTStickerPagingController reloadSheetControllerForRecord:](self, "reloadSheetControllerForRecord:", a3, a4);
  -[AVTStickerPagingController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (void)setPageContentOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  id v8;

  y = a3.y;
  x = a3.x;
  if (a3.x != self->_pageContentOffset.x || a3.y != self->_pageContentOffset.y)
    self->_pageContentOffset = a3;
  -[AVTStickerPagingController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentOffset");
  -[AVTStickerPagingController centeredPageWithOffset:](self, "centeredPageWithOffset:");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "scrollToContentOffset:animated:", 0, x, y);
}

- (id)centeredPageWithOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  -[AVTStickerPagingController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v6, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTStickerPagingController sheetControllerAtIndex:](self, "sheetControllerAtIndex:", objc_msgSend(v7, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)scrollToAvatarWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v6;

  v4 = a4;
  v6 = -[AVTStickerPagingController pageIndexForAvatarRecordIdentifier:](self, "pageIndexForAvatarRecordIdentifier:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[AVTStickerPagingController scrollToPageAtIndex:animated:](self, "scrollToPageAtIndex:animated:", v6, v4);
}

- (void)scrollToPageAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  -[AVTStickerPagingController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfRecords");

  if (v8 > a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController setFocusedPageRecordIdentifier:](self, "setFocusedPageRecordIdentifier:", v11);

    if (v13)
    {
      -[AVTStickerPagingController collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scrollToItemAtIndexPath:atScrollPosition:animated:", v13, 16, v4);

    }
  }
}

- (void)updateForEndingScrollWithTargetContentOffset:(CGPoint)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AVTStickerPagingController centeredPageWithOffset:](self, "centeredPageWithOffset:", a3.x, a3.y);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avatarRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerPagingController setFocusedPageRecordIdentifier:](self, "setFocusedPageRecordIdentifier:", v5);

  -[AVTStickerPagingController avatarPickerDelegate](self, "avatarPickerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avatarRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarPicker:didSelectAvatarRecord:", self, v7);

}

- (int64_t)pageIndexForAvatarRecordIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[AVTStickerPagingController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__AVTStickerPagingController_pageIndexForAvatarRecordIdentifier___block_invoke;
  v9[3] = &unk_1EA51DCC8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfRecordPassingTest:", v9);

  return v7;
}

uint64_t __65__AVTStickerPagingController_pageIndexForAvatarRecordIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4
{
  void *v5;
  id v6;

  +[AVTUIControllerPresentation presentationWithWrappingForController:](AVTUIControllerPresentation, "presentationWithWrappingForController:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTStickerPagingController presenterDelegate](self, "presenterDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentAvatarUIController:animated:", v6, 1);

}

- (void)willStartDisplaying
{
  id v2;

  -[AVTStickerPagingController collectionView](self, "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)willEndDisplaying
{
  void *v3;
  id v4;

  -[AVTStickerPagingController taskScheduler](self, "taskScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllTasks");

  -[AVTStickerPagingController stickerGeneratorPool](self, "stickerGeneratorPool");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flush");

}

- (void)didEndDisplaying
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AVTStickerPagingController pageForRecords](self, "pageForRecords", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[AVTStickerPagingController pageForRecords](self, "pageForRecords");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "sheetDidDisappear");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (id)firstPageItemView
{
  void *v3;
  void *v4;
  void *v5;

  -[AVTStickerPagingController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  -[AVTStickerPagingController centeredPageWithOffset:](self, "centeredPageWithOffset:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstStickerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AVTStickerPagingController dataSource](self, "dataSource", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRecords");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  +[AVTStickerPagingCollectionViewCell cellIdentifier](AVTStickerPagingCollectionViewCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "item");
  -[AVTStickerPagingController sheetControllerAtIndex:](self, "sheetControllerAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerPagingController pageContentInsets](self, "pageContentInsets");
  objc_msgSend(v11, "setSectionInsets:");
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPageContentView:", v12);

  return v9;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  id v7;

  -[AVTStickerPagingController sheetControllerAtIndex:](self, "sheetControllerAtIndex:", objc_msgSend(a5, "item", a3, a4));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sheetWillAppear");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AVTStickerPagingController selectedStickerIdentifier](self, "selectedStickerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectStickerWithIdentifier:", v6);

  }
  -[AVTStickerPagingController pageContentOffset](self, "pageContentOffset");
  objc_msgSend(v7, "scrollToContentOffset:animated:", 0);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a5;
  v7 = a4;
  -[AVTStickerPagingController lastDeletedCell](self, "lastDeletedCell");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[AVTStickerPagingController setLastDeletedCell:](self, "setLastDeletedCell:", 0);
  }
  else
  {
    -[AVTStickerPagingController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathsForVisibleItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v13);

    if ((v11 & 1) == 0)
    {
      -[AVTStickerPagingController sheetControllerAtIndex:](self, "sheetControllerAtIndex:", objc_msgSend(v13, "item"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sheetDidDisappear");

    }
  }

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[AVTStickerPagingController dataSource](self, "dataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "recordAtIndex:", objc_msgSend(v10, "item"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[AVTStickerPagingController prefetchDataForRecord:](self, "prefetchDataForRecord:", v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[AVTStickerPagingController dataSource](self, "dataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "recordAtIndex:", objc_msgSend(v10, "item"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[AVTStickerPagingController cancelPrefetchingDataForRecord:](self, "cancelPrefetchingDataForRecord:", v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  -[AVTStickerPagingController setEndDraggingTargetContentOffset:](self, "setEndDraggingTargetContentOffset:", a3, a5->x, a5->y);
  -[AVTStickerPagingController updateForEndingScrollWithTargetContentOffset:](self, "updateForEndingScrollWithTargetContentOffset:", a5->x, a5->y);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "avtui_isMoving") & 1) != 0
    || (-[AVTStickerPagingController endDraggingTargetContentOffset](self, "endDraggingTargetContentOffset"),
        v5 = v4,
        objc_msgSend(v7, "contentOffset"),
        v5 == v6))
  {
    objc_msgSend(v7, "contentOffset");
    -[AVTStickerPagingController setEndDraggingTargetContentOffset:](self, "setEndDraggingTargetContentOffset:");
  }
  else
  {
    objc_msgSend(v7, "contentOffset");
    -[AVTStickerPagingController updateForEndingScrollWithTargetContentOffset:](self, "updateForEndingScrollWithTargetContentOffset:");
  }

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "avtui_isMoving") & 1) != 0
    || (-[AVTStickerPagingController endDraggingTargetContentOffset](self, "endDraggingTargetContentOffset"),
        v5 = v4,
        objc_msgSend(v7, "contentOffset"),
        v5 == v6))
  {
    objc_msgSend(v7, "contentOffset");
    -[AVTStickerPagingController setEndDraggingTargetContentOffset:](self, "setEndDraggingTargetContentOffset:");
  }
  else
  {
    objc_msgSend(v7, "contentOffset");
    -[AVTStickerPagingController updateForEndingScrollWithTargetContentOffset:](self, "updateForEndingScrollWithTargetContentOffset:");
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  v5 = a3;
  objc_msgSend(v5, "bounds");
  v7 = 0x4072C00000000000;
  if (v8 <= 0.0)
  {
    v9 = 0x4072C00000000000;
  }
  else
  {
    v9 = 0x4072C00000000000;
    if (v6 > 0.0)
    {
      objc_msgSend(v5, "bounds");
      v7 = v10;
      v9 = v11;
    }
  }

  v12 = *(double *)&v7;
  v13 = *(double *)&v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)stickerSheetController:(id)a3 didScrollToContentOffset:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  id v8;

  y = a4.y;
  x = a4.x;
  self->_pageContentOffset = a4;
  -[AVTStickerPagingController delegate](self, "delegate", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVTStickerPagingController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stickerPagingController:pageDidScrollToOffset:", self, x, y);

  }
}

- (void)stickerSheetController:(id)a3 scrollView:(id)a4 willEndDraggingWithTargetContentOffset:(CGPoint *)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double y;
  BOOL v13;
  double v14;

  v7 = a4;
  -[AVTStickerPagingController pageContentInsets](self, "pageContentInsets");
  v9 = v8;
  objc_msgSend(v7, "contentOffset");
  v11 = v10;

  if (v11 < v9)
  {
    y = a5->y;
    if (y < v9)
    {
      v13 = y < v9 * 0.25;
      v14 = 0.0;
      if (!v13)
        v14 = v9;
      a5->y = v14;
    }
  }
}

- (void)stickerSheetController:(id)a3 didFinishRenderingStickersForRecord:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AVTStickerPagingController stickerGeneratorPool](self, "stickerGeneratorPool");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flushGeneratorForRecord:", v5);

}

- (void)stickerSheetController:(id)a3 didInteractWithStickerItem:(id)a4 atIndex:(int64_t)a5 byPeeling:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AVTUIEnvironment *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  AVTUIEnvironment *v23;
  _QWORD v24[4];
  AVTUIEnvironment *v25;

  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "avatarRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerPagingController stickerConfigurationProvider](self, "stickerConfigurationProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stickerConfigurationsForAvatarRecord:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") > (unint64_t)a5)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_environment;
    objc_msgSend(v14, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avatarRecord");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTUIEnvironment usageTrackingSession](v15, "usageTrackingSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didSelectStickerFromStickersApp:withAvatar:", v16, v17);

    objc_msgSend(v10, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController setSelectedStickerIdentifier:](self, "setSelectedStickerIdentifier:", v19);

    -[AVTStickerPagingController stickerSelectionDelegate](self, "stickerSelectionDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "didSelectStickerWithConfiguration:avatar:", v14, v17);

    -[AVTAvatarRecordDataSource internalRecordStore](self->_dataSource, "internalRecordStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __98__AVTStickerPagingController_stickerSheetController_didInteractWithStickerItem_atIndex_byPeeling___block_invoke;
    v24[3] = &unk_1EA51DBE0;
    v25 = v15;
    v23 = v15;
    objc_msgSend(v21, "didUseStickerWithAvatarIdentifier:stickerIdentifier:completionHandler:", v22, v16, v24);

  }
}

void __98__AVTStickerPagingController_stickerSheetController_didInteractWithStickerItem_atIndex_byPeeling___block_invoke(uint64_t a1, char a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  if ((a2 & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a3;
    objc_msgSend(v3, "logger");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "logErrorSavingRecentSticker:", v5);
  }
}

- (void)avatarActionsViewControllerDidFinish:(id)a3
{
  id v3;

  -[AVTStickerPagingController presenterDelegate](self, "presenterDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAvatarUIControllerAnimated:", 1);

}

- (id)avatarActionsViewController:(id)a3 recordUpdateForDeletingRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  -[AVTStickerPagingController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarActionsRecordUpdate recordUpdateForDeletingRecord:withDataSource:](AVTAvatarActionsRecordUpdate, "recordUpdateForDeletingRecord:withDataSource:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "avatarRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "avatarRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTStickerPagingController scrollToAvatarWithIdentifier:animated:](self, "scrollToAvatarWithIdentifier:animated:", v10, 0);

      -[AVTStickerPagingController avatarPickerDelegate](self, "avatarPickerDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "avatarRecord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "avatarPicker:didSelectAvatarRecord:", self, v12);

    }
  }
  return v7;
}

- (void)notifyingContainerViewWillChangeSize:(CGSize)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[AVTStickerPagingController setIsResizing:](self, "setIsResizing:", 1, a3.width, a3.height);
  -[AVTStickerPagingController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerPagingController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;
  -[AVTStickerPagingController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:toView:", v10, v7, v9);
  v12 = v11;
  v14 = v13;

  -[AVTStickerPagingController focusedPageRecordIdentifier](self, "focusedPageRecordIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[AVTStickerPagingController dataSource](self, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "indexPathForItemAtPoint:", v12, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordAtIndex:", objc_msgSend(v18, "row"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController setFocusedPageRecordIdentifier:](self, "setFocusedPageRecordIdentifier:", v20);

  }
  -[AVTStickerPagingController collectionView](self, "collectionView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "collectionViewLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "invalidateLayout");

}

- (void)notifyingContainerViewDidChangeSize:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3.width > 0.0 && a3.height > 0.0)
  {
    -[AVTStickerPagingController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");

    -[AVTStickerPagingController focusedPageRecordIdentifier](self, "focusedPageRecordIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController scrollToAvatarWithIdentifier:animated:](self, "scrollToAvatarWithIdentifier:animated:", v5, 0);

    -[AVTStickerPagingController setIsResizing:](self, "setIsResizing:", 0);
    -[AVTStickerPagingController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentOffset");
    -[AVTStickerPagingController centeredPageWithOffset:](self, "centeredPageWithOffset:");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTStickerPagingController pageContentOffset](self, "pageContentOffset");
    objc_msgSend(v7, "scrollToContentOffset:animated:", 1);

  }
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  CGFloat y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  if (-[AVTStickerPagingController isResizing](self, "isResizing"))
  {
    -[AVTStickerPagingController focusedPageRecordIdentifier](self, "focusedPageRecordIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AVTStickerPagingController pageIndexForAvatarRecordIdentifier:](self, "pageIndexForAvatarRecordIdentifier:", v8);

    objc_msgSend(v7, "collectionViewLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingController collectionView:layout:sizeForItemAtIndexPath:](self, "collectionView:layout:sizeForItemAtIndexPath:", v7, v10, v11);
    v13 = v12;

    x = v13 * (double)v9;
  }

  v14 = x;
  v15 = y;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)clearStickerSelection
{
  void *v3;
  id v4;

  -[AVTStickerPagingController setSelectedStickerIdentifier:](self, "setSelectedStickerIdentifier:", 0);
  -[AVTStickerPagingController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  -[AVTStickerPagingController centeredPageWithOffset:](self, "centeredPageWithOffset:");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "clearStickerSelection");

}

- (AVTPresenterDelegate)presenterDelegate
{
  return (AVTPresenterDelegate *)objc_loadWeakRetained((id *)&self->presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presenterDelegate, a3);
}

- (AVTAvatarPickerDelegate)avatarPickerDelegate
{
  return (AVTAvatarPickerDelegate *)objc_loadWeakRetained((id *)&self->avatarPickerDelegate);
}

- (void)setAvatarPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->avatarPickerDelegate, a3);
}

- (UIEdgeInsets)pageContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_pageContentInsets.top;
  left = self->_pageContentInsets.left;
  bottom = self->_pageContentInsets.bottom;
  right = self->_pageContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGPoint)pageContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_pageContentOffset.x;
  y = self->_pageContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (AVTStickerPagingControllerDelegate)delegate
{
  return (AVTStickerPagingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate
{
  return (AVTStickerDisclosureValidationDelegate *)objc_loadWeakRetained((id *)&self->_disclosureValidationDelegate);
}

- (void)setDisclosureValidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_disclosureValidationDelegate, a3);
}

- (AVTStickerSelectionDelegate)stickerSelectionDelegate
{
  return (AVTStickerSelectionDelegate *)objc_loadWeakRetained((id *)&self->_stickerSelectionDelegate);
}

- (void)setStickerSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stickerSelectionDelegate, a3);
}

- (AVTStickerSheetControllerProvider)stickerSheetControllerProvider
{
  return (AVTStickerSheetControllerProvider *)objc_loadWeakRetained((id *)&self->_stickerSheetControllerProvider);
}

- (void)setStickerSheetControllerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_stickerSheetControllerProvider, a3);
}

- (OS_dispatch_queue)renderingQueue
{
  return self->_renderingQueue;
}

- (void)setRenderingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_renderingQueue, a3);
}

- (OS_dispatch_queue)encodingQueue
{
  return self->_encodingQueue;
}

- (void)setEncodingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_encodingQueue, a3);
}

- (AVTAvatarRecordDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (AVTUIStickerGeneratorPool)stickerGeneratorPool
{
  return self->_stickerGeneratorPool;
}

- (void)setStickerGeneratorPool:(id)a3
{
  objc_storeStrong((id *)&self->_stickerGeneratorPool, a3);
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (NSMutableDictionary)pageForRecords
{
  return self->_pageForRecords;
}

- (void)setPageForRecords:(id)a3
{
  objc_storeStrong((id *)&self->_pageForRecords, a3);
}

- (BOOL)allowsPeel
{
  return self->_allowsPeel;
}

- (AVTStickerTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (AVTResourceCache)cache
{
  return self->_cache;
}

- (_AVTAvatarRecordImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (NSString)focusedPageRecordIdentifier
{
  return self->_focusedPageRecordIdentifier;
}

- (void)setFocusedPageRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_focusedPageRecordIdentifier, a3);
}

- (NSString)selectedStickerIdentifier
{
  return self->_selectedStickerIdentifier;
}

- (void)setSelectedStickerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_selectedStickerIdentifier, a3);
}

- (AVTStickerConfigurationProvider)stickerConfigurationProvider
{
  return self->_stickerConfigurationProvider;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CGPoint)endDraggingTargetContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_endDraggingTargetContentOffset.x;
  y = self->_endDraggingTargetContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setEndDraggingTargetContentOffset:(CGPoint)a3
{
  self->_endDraggingTargetContentOffset = a3;
}

- (BOOL)isResizing
{
  return self->_isResizing;
}

- (void)setIsResizing:(BOOL)a3
{
  self->_isResizing = a3;
}

- (UICollectionViewCell)lastDeletedCell
{
  return self->_lastDeletedCell;
}

- (void)setLastDeletedCell:(id)a3
{
  objc_storeStrong((id *)&self->_lastDeletedCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDeletedCell, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_stickerConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_selectedStickerIdentifier, 0);
  objc_storeStrong((id *)&self->_focusedPageRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_pageForRecords, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_stickerGeneratorPool, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_encodingQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_destroyWeak((id *)&self->_stickerSheetControllerProvider);
  objc_destroyWeak((id *)&self->_stickerSelectionDelegate);
  objc_destroyWeak((id *)&self->_disclosureValidationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->avatarPickerDelegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end
