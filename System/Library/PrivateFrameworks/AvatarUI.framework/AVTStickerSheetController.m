@implementation AVTStickerSheetController

- (AVTStickerSheetController)initWithStickerSheetModel:(id)a3 taskScheduler:(id)a4 allowsPeel:(BOOL)a5
{
  id v9;
  id v10;
  AVTStickerSheetController *v11;
  AVTStickerSheetController *v12;
  int v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AVTStickerSheetController;
  v11 = -[AVTStickerSheetController init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_allowsPeel = a5;
    objc_storeStrong((id *)&v11->_model, a3);
    objc_storeStrong((id *)&v12->_taskScheduler, a4);
    v13 = AVTUIShowPrereleaseStickerPack_once();
    if (v13)
      LOBYTE(v13) = AVTUIShowPrereleaseStickerLabel_once();
    v12->_showPrereleaseSticker = v13;
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[AVTStickerSheetController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stickerRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopUsingResources");

  v5.receiver = self;
  v5.super_class = (Class)AVTStickerSheetController;
  -[AVTStickerSheetController dealloc](&v5, sel_dealloc);
}

- (UIView)view
{
  UIView *view;

  view = self->_view;
  if (!view)
  {
    -[AVTStickerSheetController loadView](self, "loadView");
    view = self->_view;
  }
  return view;
}

- (double)topPadding
{
  void *v3;
  void *v4;
  double result;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;

  -[AVTStickerSheetController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "deviceIsPad"))
  {

    return 8.0;
  }
  else
  {
    -[AVTStickerSheetController model](self, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "deviceIsMac");

    result = 8.0;
    if ((v8 & 1) == 0)
    {
      -[AVTStickerSheetController model](self, "model", 8.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "environment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "deviceIsVision");

      result = 12.0;
      if (v11)
        return 16.0;
    }
  }
  return result;
}

- (CGSize)minimumContentSizeForSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[AVTStickerSheetController sectionInsets](self, "sectionInsets");
  v7 = v6;
  -[AVTStickerSheetController sectionInsets](self, "sectionInsets");
  v9 = height + v7 + v8;
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (CGPoint)maxedContentOffset:(CGPoint)a3
{
  double y;
  CGFloat x;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[AVTStickerSheetController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  v8 = v7;
  -[AVTStickerSheetController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v8 - v10;
  -[AVTStickerSheetController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adjustedContentInset");
  v14 = v11 + v13;

  if (y <= v14)
    v15 = y;
  else
    v15 = v14;
  v16 = x;
  result.y = v15;
  result.x = v16;
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  char v5;
  double v6;
  void *v7;
  void *v8;
  int v9;
  AVTStickerSheetCollectionView *v10;
  AVTStickerSheetCollectionView *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  AVTNotifyingContainerView *v15;
  AVTNotifyingContainerView *v16;
  AVTMinimumContentSizeCollectionViewLayout *v17;

  v17 = objc_alloc_init(AVTMinimumContentSizeCollectionViewLayout);
  -[AVTStickerSheetController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceIsMac");

  v6 = 10.0;
  if ((v5 & 1) == 0)
  {
    -[AVTStickerSheetController model](self, "model", 10.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "deviceIsVision");

    v6 = 16.0;
    if (v9)
      v6 = 10.0;
  }
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v17, "setMinimumInteritemSpacing:", v6);
  -[UICollectionViewFlowLayout minimumInteritemSpacing](v17, "minimumInteritemSpacing");
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v17, "setMinimumLineSpacing:");
  v10 = [AVTStickerSheetCollectionView alloc];
  v11 = -[AVTStickerSheetCollectionView initWithFrame:collectionViewLayout:](v10, "initWithFrame:collectionViewLayout:", v17, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerSheetCollectionView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[AVTStickerSheetCollectionView setDataSource:](v11, "setDataSource:", self);
  -[AVTStickerSheetCollectionView setDelegate:](v11, "setDelegate:", self);
  -[AVTStickerSheetCollectionView setShowsVerticalScrollIndicator:](v11, "setShowsVerticalScrollIndicator:", 0);
  -[AVTStickerSheetCollectionView setContentInsetAdjustmentBehavior:](v11, "setContentInsetAdjustmentBehavior:", 2);
  v13 = objc_opt_class();
  +[AVTStickerCollectionViewCell cellIdentifier](AVTStickerCollectionViewCell, "cellIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerSheetCollectionView registerClass:forCellWithReuseIdentifier:](v11, "registerClass:forCellWithReuseIdentifier:", v13, v14);

  -[AVTStickerSheetCollectionView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
  -[AVTStickerSheetController setCollectionView:](self, "setCollectionView:", v11);
  v15 = [AVTNotifyingContainerView alloc];
  -[AVTStickerSheetCollectionView frame](v11, "frame");
  v16 = -[AVTNotifyingContainerView initWithFrame:](v15, "initWithFrame:");
  -[AVTNotifyingContainerView setDelegate:](v16, "setDelegate:", self);
  -[AVTNotifyingContainerView addSubview:](v16, "addSubview:", v11);
  -[AVTStickerSheetController setView:](self, "setView:", v16);

}

- (void)setSectionInsets:(UIEdgeInsets)a3
{
  void *v6;
  id v7;

  if (a3.left != self->_sectionInsets.left
    || a3.top != self->_sectionInsets.top
    || a3.right != self->_sectionInsets.right
    || a3.bottom != self->_sectionInsets.bottom)
  {
    self->_sectionInsets = a3;
    -[AVTStickerSheetController collectionView](self, "collectionView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateLayout");

  }
}

- (AVTAvatarRecord)avatarRecord
{
  void *v2;
  void *v3;

  -[AVTStickerSheetController model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatarRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVTAvatarRecord *)v3;
}

- (void)sheetDidDisappear
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[AVTStickerSheetController setIsPageVisible:](self, "setIsPageVisible:", 0);
  -[AVTStickerSheetController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTStickerSheetController taskScheduler](self, "taskScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelStickerSheetTasksForAvatarRecordIdentifier:", v5);

  -[AVTStickerSheetController discardStickerItems](self, "discardStickerItems");
  -[AVTStickerSheetController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[AVTStickerSheetController collectionView](self, "collectionView", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visibleCells");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13++), "purgeImageContents");
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    -[AVTStickerSheetController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_purgeReuseQueues");

  }
  -[AVTStickerSheetController model](self, "model");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stickerRenderer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stopUsingResources");

}

- (void)sheetWillAppear
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  if (!-[AVTStickerSheetController isPageVisible](self, "isPageVisible"))
  {
    if (!self->_view)
      -[AVTStickerSheetController loadView](self, "loadView");
    -[AVTStickerSheetController setIsPageVisible:](self, "setIsPageVisible:", 1);
    -[AVTStickerSheetController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathsForVisibleItems");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      -[AVTStickerSheetController taskScheduler](self, "taskScheduler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setVisibleIndexPaths:", v7);

      v5 = (void *)MEMORY[0x1E0CEABB0];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __44__AVTStickerSheetController_sheetWillAppear__block_invoke;
      v8[3] = &unk_1EA51D570;
      v8[4] = self;
      v6 = v7;
      v9 = v6;
      objc_msgSend(v5, "performWithoutAnimation:", v8);
      -[AVTStickerSheetController startAllSchedulerTasksExcludingVisibleIndexPaths:](self, "startAllSchedulerTasksExcludingVisibleIndexPaths:", v6);

    }
  }
}

void __44__AVTStickerSheetController_sheetWillAppear__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadItemsAtIndexPaths:", *(_QWORD *)(a1 + 40));

}

- (void)startAllSchedulerTasks
{
  -[AVTStickerSheetController startAllSchedulerTasksExcludingVisibleIndexPaths:](self, "startAllSchedulerTasksExcludingVisibleIndexPaths:", 0);
}

- (void)startAllSchedulerTasksExcludingVisibleIndexPaths:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  AVTStickerSheetController *v9;

  v6 = a3;
  if (!-[AVTStickerSheetController areAllStickersRendered](self, "areAllStickersRendered"))
  {
    -[AVTStickerSheetController model](self, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stickerItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__AVTStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke;
    v7[3] = &unk_1EA51D6A0;
    v8 = v6;
    v9 = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  }
}

void __78__AVTStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;
  id from;
  id location;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) == 0
    && (objc_msgSend(v5, "hasBeenRendered") & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    objc_initWeak(&from, v5);
    objc_msgSend(v5, "resourceProvider");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __78__AVTStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke_2;
    v12 = &unk_1EA51D678;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    ((void (**)(_QWORD, uint64_t *, _QWORD))v7)[2](v7, &v9, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "scheduleSheetStickerTask:withIndexPath:", v8, v6, v9, v10, v11, v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

void __78__AVTStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateItem:withStickerResource:reloadCell:", v5, v4, 1);

}

- (void)scheduleSheetPlaceholderTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    -[AVTStickerSheetController model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avatarRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTStickerTask stickerTaskForSchedulerTask:avatarRecordIdentifier:indexPath:stickerType:](AVTStickerTask, "stickerTaskForSchedulerTask:avatarRecordIdentifier:indexPath:stickerType:", v4, v7, 0, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTStickerSheetController taskScheduler](self, "taskScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scheduleStickerTask:", v9);

  }
}

- (void)scheduleSheetStickerTask:(id)a3 withIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[AVTStickerSheetController model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "avatarRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTStickerTask stickerTaskForSchedulerTask:avatarRecordIdentifier:indexPath:stickerType:](AVTStickerTask, "stickerTaskForSchedulerTask:avatarRecordIdentifier:indexPath:stickerType:", v7, v10, v6, 2);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTStickerSheetController taskScheduler](self, "taskScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scheduleStickerTask:", v12);

  }
}

- (id)firstStickerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AVTStickerSheetController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTStickerSheetController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellForItemAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)discardStickerItems
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[AVTStickerSheetController model](self, "model", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stickerItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "discardContent");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)areAllStickersRendered
{
  BOOL v2;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_areAllStickersRendered)
    return 1;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[AVTStickerSheetController model](self, "model", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hasBeenRendered"))
        {
          v2 = 0;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
  v2 = 1;
LABEL_13:

  self->_areAllStickersRendered = v2;
  return v2;
}

- (void)clearStickerRendererIfNeeded
{
  void *v3;
  id v4;

  if (-[AVTStickerSheetController areAllStickersRendered](self, "areAllStickersRendered"))
  {
    -[AVTStickerSheetController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTStickerSheetController avatarRecord](self, "avatarRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stickerSheetController:didFinishRenderingStickersForRecord:", self, v3);

  }
}

- (double)numberOfItemsPerRow
{
  void *v2;
  double v3;
  double v4;
  double result;

  -[AVTStickerSheetController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  result = 3.0;
  if (v4 > 600.0)
    return 6.0;
  return result;
}

- (void)updateItem:(id)a3 withStickerResource:(id)a4 reloadCell:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "hasBeenRendered");
  if (v10)
    v12 = 1;
  else
    v12 = v11;
  objc_msgSend(v8, "setHasBeenRendered:", v12);

  -[AVTStickerSheetController clearStickerRendererIfNeeded](self, "clearStickerRendererIfNeeded");
  objc_msgSend(v9, "clippingRect");
  objc_msgSend(v8, "setClippingRect:");
  if (-[AVTStickerSheetController isPageVisible](self, "isPageVisible"))
  {
    -[AVTStickerSheetController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "cachedMSSticker");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {

      }
      else
      {
        objc_msgSend(v9, "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[AVTStickerSheetController delegate](self, "delegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_opt_respondsToSelector();

          if ((v17 & 1) == 0)
            goto LABEL_11;
          -[AVTStickerSheetController delegate](self, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "URL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "localizedName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stickerSheetController:requestsStickerForFileURL:localizedDescription:forItemWithIdentifier:", self, v19, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
LABEL_11:
            v23 = objc_alloc(MEMORY[0x1E0CC6950]);
            objc_msgSend(v9, "URL");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "localizedName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = 0;
            v22 = (void *)objc_msgSend(v23, "initWithContentsOfFileURL:localizedDescription:error:", v24, v25, &v26);

          }
          objc_msgSend(v8, "setCachedMSSticker:", v22);
          if (v5)
            -[AVTStickerSheetController reloadCollectionViewItemForStickerItem:](self, "reloadCollectionViewItemForStickerItem:", v8);

        }
      }
    }
  }

}

- (void)reloadCollectionViewItemForStickerItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v13 = a3;
  -[AVTStickerSheetController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVTStickerSheetController model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stickerItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v13);

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTStickerSheetController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "indexPathsForVisibleItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v8);

      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0CEABB0];
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __68__AVTStickerSheetController_reloadCollectionViewItemForStickerItem___block_invoke;
        v14[3] = &unk_1EA51D570;
        v14[4] = self;
        v15 = v8;
        objc_msgSend(v12, "performWithoutAnimation:", v14);

      }
    }
  }

}

void __68__AVTStickerSheetController_reloadCollectionViewItemForStickerItem___block_invoke(uint64_t a1)
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
  objc_msgSend(v2, "reloadItemsAtIndexPaths:", v3);

}

- (id)placeholderProvider
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__AVTStickerSheetController_placeholderProvider__block_invoke;
  v8[3] = &unk_1EA51D6F0;
  objc_copyWeak(&v9, &location);
  v2 = (void *)objc_msgSend(v8, "copy");
  v6 = (void *)MEMORY[0x1DF0D0754](v2, v3, v4, v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

id __48__AVTStickerSheetController_placeholderProvider__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  _QWORD v13[4];
  void (**v14)(id, void *);
  id v15;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "placeholderImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "placeholderImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v6);

    v7 = 0;
  }
  else
  {
    objc_initWeak(&location, WeakRetained);
    objc_msgSend(WeakRetained, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeholderProviderFactory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeholderProvider");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__AVTStickerSheetController_placeholderProvider__block_invoke_2;
    v13[3] = &unk_1EA51D6C8;
    objc_copyWeak(&v15, &location);
    v14 = v3;
    ((void (**)(_QWORD, _QWORD *, _QWORD))v10)[2](v10, v13, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1DF0D0754](v11);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __48__AVTStickerSheetController_placeholderProvider__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "placeholderImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPlaceholderImage:", v5);

  }
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "placeholderImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[AVTStickerSheetController model](self, "model", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  id v26;
  void *v27;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id from;
  id location[2];

  v6 = a3;
  v7 = a4;
  +[AVTStickerCollectionViewCell cellIdentifier](AVTStickerCollectionViewCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisplaySessionUUID:", v10);
  objc_msgSend(v9, "setAllowsPeel:", -[AVTStickerSheetController allowsPeel](self, "allowsPeel"));
  objc_msgSend(v9, "setDelegate:", self);
  -[AVTStickerSheetController disclosureValidationDelegate](self, "disclosureValidationDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisclosureValidationDelegate:", v11);

  objc_msgSend(v9, "setShowPrereleaseSticker:", -[AVTStickerSheetController showPrereleaseSticker](self, "showPrereleaseSticker"));
  -[AVTStickerSheetController model](self, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stickerItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v7, "row"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "clippingRect");
  objc_msgSend(v9, "setClippingRect:");
  objc_msgSend(v14, "cachedMSSticker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v14, "cachedMSSticker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateWithImage:sticker:animated:", 0, v16, 0);

  }
  else
  {
    objc_initWeak(location, self);
    objc_initWeak(&from, v14);
    -[AVTStickerSheetController placeholderImage](self, "placeholderImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = MEMORY[0x1E0C809B0];
    v29 = v6;
    if (v17)
    {
      -[AVTStickerSheetController placeholderImage](self, "placeholderImage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cachedMSSticker");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateWithImage:sticker:animated:", v19, v20, 0);
      v21 = v18;

    }
    else
    {
      -[AVTStickerSheetController placeholderProvider](self, "placeholderProvider");
      v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v36[0] = v18;
      v36[1] = 3221225472;
      v36[2] = __67__AVTStickerSheetController_collectionView_cellForItemAtIndexPath___block_invoke;
      v36[3] = &unk_1EA51D718;
      objc_copyWeak(&v39, &from);
      v37 = v9;
      v38 = v10;
      ((void (**)(_QWORD, _QWORD *, _QWORD))v22)[2](v22, v36, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVTStickerSheetController scheduleSheetPlaceholderTask:](self, "scheduleSheetPlaceholderTask:", v23);
      v21 = v18;

      objc_destroyWeak(&v39);
    }
    v24 = (void *)objc_opt_new();
    objc_msgSend(v14, "resourceProvider");
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30[0] = v21;
    v30[1] = 3221225472;
    v30[2] = __67__AVTStickerSheetController_collectionView_cellForItemAtIndexPath___block_invoke_2;
    v30[3] = &unk_1EA51D740;
    objc_copyWeak(&v34, location);
    objc_copyWeak(&v35, &from);
    v31 = v9;
    v32 = v10;
    v26 = v24;
    v33 = v26;
    ((void (**)(_QWORD, _QWORD *, uint64_t))v25)[2](v25, v30, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTStickerSheetController scheduleSheetStickerTask:withIndexPath:](self, "scheduleSheetStickerTask:withIndexPath:", v27, v7);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v34);

    objc_destroyWeak(&from);
    objc_destroyWeak(location);
    v6 = v29;
  }

  return v9;
}

void __67__AVTStickerSheetController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "displaySessionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);

  if (v4 == v5)
  {
    objc_msgSend(WeakRetained, "cachedMSSticker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(WeakRetained, "cachedMSSticker");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateWithImage:sticker:animated:", v9, v8, 0);

    }
  }

}

void __67__AVTStickerSheetController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  double v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v5 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "displaySessionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);

    objc_msgSend(WeakRetained, "updateItem:withStickerResource:reloadCell:", v5, v13, v6 != v7);
    if (v6 == v7 && objc_msgSend(WeakRetained, "isPageVisible"))
    {
      objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
      v9 = v8 < -0.1;
      objc_msgSend(v5, "clippingRect");
      objc_msgSend(*(id *)(a1 + 32), "setClippingRect:");
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v13, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cachedMSSticker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateWithImage:sticker:animated:", v11, v12, v9);

    }
  }

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  -[AVTStickerSheetController collectionView](self, "collectionView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForVisibleItems");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTStickerSheetController taskScheduler](self, "taskScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisibleIndexPaths:", v8);

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  v7 = a4;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v7);
  objc_msgSend(v7, "minimumInteritemSpacing");
  v10 = v9;
  -[AVTStickerSheetController sectionInsets](self, "sectionInsets");
  v12 = v11;
  -[AVTStickerSheetController topPadding](self, "topPadding");
  v14 = v12 + v13;
  objc_msgSend(v8, "safeAreaInsets");
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v10 + v16;
  v23 = v18 + 12.0;
  v24 = v10 + v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v8);
  v11 = v8;
  -[AVTStickerSheetController numberOfItemsPerRow](self, "numberOfItemsPerRow");
  v13 = v12;
  v14 = objc_msgSend(v9, "section");

  -[AVTStickerSheetController collectionView:layout:insetForSectionAtIndex:](self, "collectionView:layout:insetForSectionAtIndex:", v10, v11, v14);
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "bounds");
  v20 = v19;

  v21 = v20 - v16 - v18;
  objc_msgSend(v11, "minimumInteritemSpacing");
  v23 = v22;

  v24 = floor((v21 - v23 * (v13 + -1.0)) / v13);
  if (v24 <= 0.0)
    v25 = 300.0;
  else
    v25 = v24;

  v26 = v25;
  v27 = v25;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AVTStickerSheetController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVTStickerSheetController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentOffset");
    objc_msgSend(v5, "stickerSheetController:didScrollToContentOffset:", self);

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AVTStickerSheetController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVTStickerSheetController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stickerSheetController:scrollView:willEndDraggingWithTargetContentOffset:", self, v9, a5);

  }
}

- (void)scrollToContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[AVTStickerSheetController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AVTStickerSheetController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutIfNeeded");

    -[AVTStickerSheetController collectionView](self, "collectionView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTStickerSheetController maxedContentOffset:](self, "maxedContentOffset:", x, y);
    objc_msgSend(v10, "setContentOffset:animated:", v4);

  }
}

- (void)stickerCellDidTapSticker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[AVTStickerSheetController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTStickerSheetController model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stickerItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v10, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTStickerSheetController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stickerSheetController:didInteractWithStickerItem:atIndex:byPeeling:", self, v8, objc_msgSend(v10, "item"), 0);

}

- (void)stickerCellDidPeelSticker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[AVTStickerSheetController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTStickerSheetController model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stickerItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v10, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTStickerSheetController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stickerSheetController:didInteractWithStickerItem:atIndex:byPeeling:", self, v8, objc_msgSend(v10, "item"), 1);

}

- (id)dragPreviewContainerForLiftingStickerInStickerCell:(id)a3
{
  void *v3;
  void *v4;

  -[AVTStickerSheetController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)notifyingContainerViewWillChangeSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  id v8;

  height = a3.height;
  width = a3.width;
  -[AVTStickerSheetController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AVTStickerSheetController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionViewLayout");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTStickerSheetController minimumContentSizeForSize:](self, "minimumContentSizeForSize:", width, height);
    objc_msgSend(v8, "setMinimumContentSize:");
    objc_msgSend(v8, "invalidateLayout");

  }
}

- (AVTPresenterDelegate)presenterDelegate
{
  return (AVTPresenterDelegate *)objc_loadWeakRetained((id *)&self->presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presenterDelegate, a3);
}

- (AVTStickerSheetControllerDelegate)delegate
{
  return (AVTStickerSheetControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (UIEdgeInsets)sectionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionInsets.top;
  left = self->_sectionInsets.left;
  bottom = self->_sectionInsets.bottom;
  right = self->_sectionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate
{
  return (AVTStickerDisclosureValidationDelegate *)objc_loadWeakRetained((id *)&self->disclosureValidationDelegate);
}

- (void)setDisclosureValidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->disclosureValidationDelegate, a3);
}

- (BOOL)allowsPeel
{
  return self->_allowsPeel;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (AVTStickerSheetCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (BOOL)isPageVisible
{
  return self->_isPageVisible;
}

- (void)setIsPageVisible:(BOOL)a3
{
  self->_isPageVisible = a3;
}

- (void)setAreAllStickersRendered:(BOOL)a3
{
  self->_areAllStickersRendered = a3;
}

- (AVTStickerSheetModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImage, a3);
}

- (AVTStickerTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (BOOL)showPrereleaseSticker
{
  return self->_showPrereleaseSticker;
}

- (void)setShowPrereleaseSticker:(BOOL)a3
{
  self->_showPrereleaseSticker = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->disclosureValidationDelegate);
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end
