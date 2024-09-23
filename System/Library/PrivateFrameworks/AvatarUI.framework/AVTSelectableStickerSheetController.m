@implementation AVTSelectableStickerSheetController

- (AVTSelectableStickerSheetController)initWithStickerSheetModel:(id)a3 taskScheduler:(id)a4 allowsPoseCapture:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  AVTSelectableStickerSheetController *v11;
  AVTSelectableStickerSheetController *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  AVTUIStickerItem *v17;
  void *v18;
  void *v19;
  AVTUIStickerItem *v20;
  objc_super v22;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AVTSelectableStickerSheetController;
  v11 = -[AVTSelectableStickerSheetController init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_allowsPoseCapture = v5;
    objc_storeStrong((id *)&v11->_model, a3);
    objc_storeStrong((id *)&v12->_taskScheduler, a4);
    v13 = AVTUIShowPrereleaseStickerPack_once();
    if (v13)
      LOBYTE(v13) = AVTUIShowPrereleaseStickerLabel_once();
    v12->_showPrereleaseSticker = v13;
    v14 = (void *)MEMORY[0x1E0C99DE8];
    -[AVTStickerSheetModel stickerItems](v12->_model, "stickerItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && AVTUIIsFacetrackingSupported())
    {
      v17 = [AVTUIStickerItem alloc];
      AVTAvatarUIBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CUSTOM_POSE"), &stru_1EA5207B8, CFSTR("Localized"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[AVTUIStickerItem initWithIdentifier:localizedName:resourceProvider:](v17, "initWithIdentifier:localizedName:resourceProvider:", CFSTR("cameraStickerItem"), v19, 0);

      objc_msgSend(v16, "insertObject:atIndex:", v20, 0);
      objc_storeWeak((id *)&v12->_cameraStickerItem, v20);

    }
    -[AVTSelectableStickerSheetController setStickerItems:](v12, "setStickerItems:", v16);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[AVTSelectableStickerSheetController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stickerRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopUsingResources");

  v5.receiver = self;
  v5.super_class = (Class)AVTSelectableStickerSheetController;
  -[AVTSelectableStickerSheetController dealloc](&v5, sel_dealloc);
}

- (UIView)view
{
  UIView *view;

  view = self->_view;
  if (!view)
  {
    -[AVTSelectableStickerSheetController loadView](self, "loadView");
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

  -[AVTSelectableStickerSheetController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "deviceIsPad"))
  {

    return 8.0;
  }
  else
  {
    -[AVTSelectableStickerSheetController model](self, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "deviceIsMac");

    result = 8.0;
    if ((v8 & 1) == 0)
    {
      -[AVTSelectableStickerSheetController model](self, "model", 8.0);
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
  -[AVTSelectableStickerSheetController sectionInsets](self, "sectionInsets");
  v7 = v6;
  -[AVTSelectableStickerSheetController sectionInsets](self, "sectionInsets");
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
  -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  v8 = v7;
  -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v8 - v10;
  -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
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
  int v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  AVTNotifyingContainerView *v12;
  AVTNotifyingContainerView *v13;
  AVTMinimumContentSizeCollectionViewLayout *v14;

  v14 = objc_alloc_init(AVTMinimumContentSizeCollectionViewLayout);
  -[AVTSelectableStickerSheetController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceIsMac");
  v6 = 16.0;
  if (v5)
    v6 = 10.0;
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v14, "setMinimumInteritemSpacing:", v6);

  -[UICollectionViewFlowLayout minimumInteritemSpacing](v14, "minimumInteritemSpacing");
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v14, "setMinimumLineSpacing:");
  v7 = objc_alloc(MEMORY[0x1E0CEA410]);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v14, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  objc_msgSend(v8, "setDataSource:", self);
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v8, "setContentInsetAdjustmentBehavior:", 2);
  v10 = objc_opt_class();
  +[AVTStickerCollectionViewCell cellIdentifier](AVTStickerCollectionViewCell, "cellIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", v10, v11);

  objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("cameraIconCell"));
  objc_msgSend(v8, "setAutoresizingMask:", 18);
  -[AVTSelectableStickerSheetController setCollectionView:](self, "setCollectionView:", v8);
  v12 = [AVTNotifyingContainerView alloc];
  objc_msgSend(v8, "frame");
  v13 = -[AVTNotifyingContainerView initWithFrame:](v12, "initWithFrame:");
  -[AVTNotifyingContainerView setDelegate:](v13, "setDelegate:", self);
  -[AVTNotifyingContainerView addSubview:](v13, "addSubview:", v8);
  -[AVTSelectableStickerSheetController setView:](self, "setView:", v13);

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
    -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
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

  -[AVTSelectableStickerSheetController model](self, "model");
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AVTSelectableStickerSheetController setIsPageVisible:](self, "setIsPageVisible:", 0);
  -[AVTSelectableStickerSheetController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTSelectableStickerSheetController taskScheduler](self, "taskScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelStickerSheetTasksForAvatarRecordIdentifier:", v5);

  -[AVTSelectableStickerSheetController discardStickerItems](self, "discardStickerItems");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AVTSelectableStickerSheetController collectionView](self, "collectionView", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleCells");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12++), "purgeImageContents");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_purgeReuseQueues");

  -[AVTSelectableStickerSheetController model](self, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stickerRenderer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stopUsingResources");

  -[AVTSelectableStickerSheetController clearStickerSelection](self, "clearStickerSelection");
}

- (void)sheetWillAppear
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  if (!-[AVTSelectableStickerSheetController isPageVisible](self, "isPageVisible"))
  {
    -[AVTSelectableStickerSheetController setIsPageVisible:](self, "setIsPageVisible:", 1);
    -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathsForVisibleItems");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      -[AVTSelectableStickerSheetController taskScheduler](self, "taskScheduler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setVisibleIndexPaths:", v5);

      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __54__AVTSelectableStickerSheetController_sheetWillAppear__block_invoke;
      v6[3] = &unk_1EA51D188;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v6);
      -[AVTSelectableStickerSheetController startAllSchedulerTasksExcludingVisibleIndexPaths:](self, "startAllSchedulerTasksExcludingVisibleIndexPaths:", v5);
    }

  }
}

void __54__AVTSelectableStickerSheetController_sheetWillAppear__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)startAllSchedulerTasks
{
  -[AVTSelectableStickerSheetController startAllSchedulerTasksExcludingVisibleIndexPaths:](self, "startAllSchedulerTasksExcludingVisibleIndexPaths:", 0);
}

- (void)startAllSchedulerTasksExcludingVisibleIndexPaths:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a3;
  if (!-[AVTSelectableStickerSheetController areAllStickersRendered](self, "areAllStickersRendered"))
  {
    -[AVTSelectableStickerSheetController stickerItems](self, "stickerItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __88__AVTSelectableStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke;
    v6[3] = &unk_1EA51D6A0;
    v6[4] = self;
    v7 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
}

void __88__AVTSelectableStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  if ((objc_msgSend(*(id *)(a1 + 32), "isCameraItem:", v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6) & 1) == 0
      && (objc_msgSend(v5, "hasBeenRendered") & 1) == 0)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      objc_initWeak(&from, v5);
      objc_msgSend(v5, "resourceProvider");
      v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __88__AVTSelectableStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke_2;
      v12 = &unk_1EA51D678;
      objc_copyWeak(&v13, &location);
      objc_copyWeak(&v14, &from);
      ((void (**)(_QWORD, uint64_t *, _QWORD))v7)[2](v7, &v9, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "scheduleSheetStickerTask:withIndexPath:", v8, v6, v9, v10, v11, v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }

  }
}

void __88__AVTSelectableStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "imageDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  objc_msgSend(WeakRetained, "updateItem:withStickerResource:reloadCell:", v5, v3, v7);
  objc_msgSend(WeakRetained, "imageDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(WeakRetained, "imageDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__AVTSelectableStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke_3;
    v11[3] = &unk_1EA51E968;
    v12 = v5;
    v13 = WeakRetained;
    objc_msgSend(v9, "viewWillUpdateWithImage:completion:", v10, v11);

  }
}

uint64_t __88__AVTSelectableStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCachedImage:", a2);
  result = objc_msgSend(*(id *)(a1 + 40), "isPageVisible");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "reloadCollectionViewItemForStickerItem:", *(_QWORD *)(a1 + 32));
  return result;
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
    -[AVTSelectableStickerSheetController model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avatarRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTStickerTask stickerTaskForSchedulerTask:avatarRecordIdentifier:indexPath:stickerType:](AVTStickerTask, "stickerTaskForSchedulerTask:avatarRecordIdentifier:indexPath:stickerType:", v4, v7, 0, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTSelectableStickerSheetController taskScheduler](self, "taskScheduler");
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
    -[AVTSelectableStickerSheetController model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "avatarRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTStickerTask stickerTaskForSchedulerTask:avatarRecordIdentifier:indexPath:stickerType:](AVTStickerTask, "stickerTaskForSchedulerTask:avatarRecordIdentifier:indexPath:stickerType:", v7, v10, v6, 2);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTSelectableStickerSheetController taskScheduler](self, "taskScheduler");
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

  -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
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
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[AVTSelectableStickerSheetController stickerItems](self, "stickerItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (!-[AVTSelectableStickerSheetController isCameraItem:](self, "isCameraItem:", v8))
          objc_msgSend(v8, "discardContent");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)areAllStickersRendered
{
  BOOL v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
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
  -[AVTSelectableStickerSheetController stickerItems](self, "stickerItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!-[AVTSelectableStickerSheetController isCameraItem:](self, "isCameraItem:", v9)
          && !objc_msgSend(v9, "hasBeenRendered"))
        {
          v2 = 0;
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v2 = 1;
LABEL_14:

  self->_areAllStickersRendered = v2;
  return v2;
}

- (void)clearStickerRendererIfNeeded
{
  void *v3;
  id v4;

  if (-[AVTSelectableStickerSheetController areAllStickersRendered](self, "areAllStickersRendered"))
  {
    -[AVTSelectableStickerSheetController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTSelectableStickerSheetController avatarRecord](self, "avatarRecord");
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

  -[AVTSelectableStickerSheetController view](self, "view");
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
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;

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

  -[AVTSelectableStickerSheetController clearStickerRendererIfNeeded](self, "clearStickerRendererIfNeeded");
  objc_msgSend(v9, "clippingRect");
  objc_msgSend(v8, "setClippingRect:");
  if (-[AVTSelectableStickerSheetController isPageVisible](self, "isPageVisible"))
  {
    objc_msgSend(v8, "cachedMSSticker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else
    {
      objc_msgSend(v9, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[AVTSelectableStickerSheetController delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) == 0)
          goto LABEL_10;
        -[AVTSelectableStickerSheetController delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "URL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stickerSheetController:requestsStickerForFileURL:localizedDescription:forItemWithIdentifier:", self, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
LABEL_10:
          v22 = objc_alloc(MEMORY[0x1E0CC6950]);
          objc_msgSend(v9, "URL");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "localizedName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0;
          v21 = (void *)objc_msgSend(v22, "initWithContentsOfFileURL:localizedDescription:error:", v23, v24, &v25);

        }
        objc_msgSend(v8, "setCachedMSSticker:", v21);
        if (v5)
          -[AVTSelectableStickerSheetController reloadCollectionViewItemForStickerItem:](self, "reloadCollectionViewItemForStickerItem:", v8);

      }
    }
  }

}

- (void)reloadCollectionViewItemForStickerItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[AVTSelectableStickerSheetController stickerItems](self, "stickerItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathsForVisibleItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v11);

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CEABB0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __78__AVTSelectableStickerSheetController_reloadCollectionViewItemForStickerItem___block_invoke;
      v12[3] = &unk_1EA51D570;
      v12[4] = self;
      v13 = v11;
      objc_msgSend(v10, "performWithoutAnimation:", v12);

    }
  }
}

void __78__AVTSelectableStickerSheetController_reloadCollectionViewItemForStickerItem___block_invoke(uint64_t a1)
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
  v8[2] = __58__AVTSelectableStickerSheetController_placeholderProvider__block_invoke;
  v8[3] = &unk_1EA51D6F0;
  objc_copyWeak(&v9, &location);
  v2 = (void *)objc_msgSend(v8, "copy");
  v6 = (void *)MEMORY[0x1DF0D0754](v2, v3, v4, v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

id __58__AVTSelectableStickerSheetController_placeholderProvider__block_invoke(uint64_t a1, void *a2)
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
    v13[2] = __58__AVTSelectableStickerSheetController_placeholderProvider__block_invoke_2;
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

void __58__AVTSelectableStickerSheetController_placeholderProvider__block_invoke_2(uint64_t a1, void *a2)
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
  int64_t v5;

  -[AVTSelectableStickerSheetController stickerItems](self, "stickerItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[AVTSelectableStickerSheetController stickerItems](self, "stickerItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AVTSelectableStickerSheetController isCameraItem:](self, "isCameraItem:", v7))
    -[AVTSelectableStickerSheetController cellForCameraItemAtIndexPath:](self, "cellForCameraItemAtIndexPath:", v5);
  else
    -[AVTSelectableStickerSheetController cellForStickerItem:atIndexPath:](self, "cellForStickerItem:atIndexPath:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setShowSelectionLayer:", -[AVTSelectableStickerSheetController showCellSelectionLayer](self, "showCellSelectionLayer"));
  return v8;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  -[AVTSelectableStickerSheetController collectionView](self, "collectionView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForVisibleItems");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTSelectableStickerSheetController taskScheduler](self, "taskScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisibleIndexPaths:", v8);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  AVTSelectableStickerSheetController *v19;

  v6 = a3;
  v7 = a4;
  -[AVTSelectableStickerSheetController stickerItems](self, "stickerItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AVTSelectableStickerSheetController isCameraItem:](self, "isCameraItem:", v9))
  {
    if (-[AVTSelectableStickerSheetController showCellSelectionLayer](self, "showCellSelectionLayer"))
    {
      v10 = dispatch_time(0, 300000000);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __79__AVTSelectableStickerSheetController_collectionView_didSelectItemAtIndexPath___block_invoke;
      v17 = &unk_1EA51D570;
      v18 = v6;
      v19 = self;
      dispatch_after(v10, MEMORY[0x1E0C80D38], &v14);

    }
    -[AVTSelectableStickerSheetController stickerSheetDelegate](self, "stickerSheetDelegate", v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSelectableStickerSheetController avatarRecord](self, "avatarRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stickerSheetController:didSelectCameraViewForRecord:", self, v12);

  }
  else
  {
    -[AVTSelectableStickerSheetController imageDelegate](self, "imageDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[AVTSelectableStickerSheetController didInteractWithStickerAtIndexPath:byPeeling:](self, "didInteractWithStickerAtIndexPath:byPeeling:", v7, 0);
  }

}

void __79__AVTSelectableStickerSheetController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "selectedIndexPath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "selectItemAtIndexPath:animated:scrollPosition:", v2, 1, 0);

}

- (id)cellForCameraItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("cameraIconCell"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", v9);

  }
  return v6;
}

- (id)cellForStickerItem:(id)a3 atIndexPath:(id)a4
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
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(id *, void *);
  void *v29;
  id v30;
  id v31;
  id v32;
  AVTSelectableStickerSheetController *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  AVTSelectableStickerSheetController *v40;
  id v41;
  id from;
  id location[2];

  v6 = a3;
  v7 = a4;
  -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTStickerCollectionViewCell cellIdentifier](AVTStickerCollectionViewCell, "cellIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDisplaySessionUUID:", v11);
  objc_msgSend(v10, "setDelegate:", self);
  -[AVTSelectableStickerSheetController disclosureValidationDelegate](self, "disclosureValidationDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDisclosureValidationDelegate:", v12);

  objc_msgSend(v10, "setShowPrereleaseSticker:", -[AVTSelectableStickerSheetController showPrereleaseSticker](self, "showPrereleaseSticker"));
  objc_msgSend(v6, "clippingRect");
  objc_msgSend(v10, "setClippingRect:");
  objc_msgSend(v6, "cachedMSSticker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "cachedImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedMSSticker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSelectableStickerSheetController updateCell:withImage:sticker:animated:](self, "updateCell:withImage:sticker:animated:", v10, v14, v15, 0);

  }
  else
  {
    objc_initWeak(location, self);
    objc_initWeak(&from, v6);
    -[AVTSelectableStickerSheetController placeholderImage](self, "placeholderImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[AVTSelectableStickerSheetController placeholderImage](self, "placeholderImage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cachedMSSticker");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTSelectableStickerSheetController updateCell:withImage:sticker:animated:](self, "updateCell:withImage:sticker:animated:", v10, v17, v18, 0);

    }
    else
    {
      -[AVTSelectableStickerSheetController placeholderProvider](self, "placeholderProvider");
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke;
      v37[3] = &unk_1EA51EB90;
      objc_copyWeak(&v41, &from);
      v38 = v10;
      v39 = v11;
      v40 = self;
      ((void (**)(_QWORD, _QWORD *, _QWORD))v19)[2](v19, v37, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVTSelectableStickerSheetController scheduleSheetPlaceholderTask:](self, "scheduleSheetPlaceholderTask:", v20);
      objc_destroyWeak(&v41);
    }
    v21 = (void *)objc_opt_new();
    objc_msgSend(v6, "resourceProvider");
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke_2;
    v29 = &unk_1EA51EC08;
    objc_copyWeak(&v35, location);
    objc_copyWeak(&v36, &from);
    v30 = v10;
    v31 = v11;
    v23 = v21;
    v32 = v23;
    v33 = self;
    v34 = v6;
    ((void (**)(_QWORD, uint64_t *, uint64_t))v22)[2](v22, &v26, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTSelectableStickerSheetController scheduleSheetStickerTask:withIndexPath:](self, "scheduleSheetStickerTask:withIndexPath:", v24, v7, v26, v27, v28, v29);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v35);

    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }

  return v10;
}

void __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "displaySessionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);

  if (v4 == v5)
  {
    objc_msgSend(WeakRetained, "cachedMSSticker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = *(void **)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "cachedMSSticker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateCell:withImage:sticker:animated:", v8, v10, v9, 0);

    }
  }

}

void __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void (**v13)(_QWORD);
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v3 = a2;
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke_3;
    v14[3] = &unk_1EA51EBB8;
    objc_copyWeak(&v19, a1 + 9);
    objc_copyWeak(&v20, a1 + 10);
    v15 = a1[4];
    v16 = a1[5];
    v6 = v3;
    v17 = v6;
    v18 = a1[6];
    v7 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](v14);
    objc_msgSend(a1[7], "imageDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(a1[7], "imageDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke_4;
      v11[3] = &unk_1EA51EBE0;
      v12 = a1[8];
      v13 = v7;
      objc_msgSend(v9, "viewWillUpdateWithImage:completion:", v10, v11);

    }
    else
    {
      v7[2](v7);
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
  }

}

void __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v2 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "displaySessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  objc_msgSend(WeakRetained, "updateItem:withStickerResource:reloadCell:", v2, *(_QWORD *)(a1 + 48), v3 != v4);
  if (v3 == v4 && objc_msgSend(WeakRetained, "isPageVisible"))
  {
    objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceNow");
    v6 = v5 < -0.1;
    objc_msgSend(v2, "clippingRect");
    objc_msgSend(*(id *)(a1 + 32), "setClippingRect:");
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "cachedImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cachedMSSticker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "updateCell:withImage:sticker:animated:", v7, v8, v9, v6);

  }
}

uint64_t __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setCachedImage:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
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
  -[AVTSelectableStickerSheetController sectionInsets](self, "sectionInsets");
  v12 = v11;
  -[AVTSelectableStickerSheetController topPadding](self, "topPadding");
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
  CGSize result;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v8);
  v11 = v8;
  -[AVTSelectableStickerSheetController numberOfItemsPerRow](self, "numberOfItemsPerRow");
  v13 = v12;
  v14 = objc_msgSend(v9, "section");

  -[AVTSelectableStickerSheetController collectionView:layout:insetForSectionAtIndex:](self, "collectionView:layout:insetForSectionAtIndex:", v10, v11, v14);
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "bounds");
  v20 = v19;

  v21 = v20 - v16 - v18;
  objc_msgSend(v11, "minimumInteritemSpacing");
  v23 = v22;

  v24 = floor((v21 - v23 * (v13 + -1.0)) / v13);
  v25 = v24;
  result.height = v25;
  result.width = v24;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AVTSelectableStickerSheetController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVTSelectableStickerSheetController delegate](self, "delegate");
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
  -[AVTSelectableStickerSheetController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVTSelectableStickerSheetController delegate](self, "delegate");
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
  -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutIfNeeded");

    -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTSelectableStickerSheetController maxedContentOffset:](self, "maxedContentOffset:", x, y);
    objc_msgSend(v10, "setContentOffset:animated:", v4);

  }
}

- (void)stickerCellDidTapSticker:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTSelectableStickerSheetController didInteractWithStickerAtIndexPath:byPeeling:](self, "didInteractWithStickerAtIndexPath:byPeeling:", v6, 0);
}

- (void)stickerCellDidPeelSticker:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTSelectableStickerSheetController didInteractWithStickerAtIndexPath:byPeeling:](self, "didInteractWithStickerAtIndexPath:byPeeling:", v6, 1);
}

- (void)notifyingContainerViewWillChangeSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  id v7;

  height = a3.height;
  width = a3.width;
  -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionViewLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTSelectableStickerSheetController minimumContentSizeForSize:](self, "minimumContentSizeForSize:", width, height);
  objc_msgSend(v7, "setMinimumContentSize:");
  objc_msgSend(v7, "invalidateLayout");

}

- (void)updateCell:(id)a3 withImage:(id)a4 sticker:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v6 = a6;
  v14 = a5;
  v10 = a4;
  v11 = a3;
  -[AVTSelectableStickerSheetController imageDelegate](self, "imageDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = 0;
  else
    v13 = v14;
  objc_msgSend(v11, "updateWithImage:sticker:animated:", v10, v13, v6);

}

- (void)didInteractWithStickerAtIndexPath:(id)a3 byPeeling:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  v6 = -[AVTSelectableStickerSheetController stickerIndexInModelforIndexPath:](self, "stickerIndexInModelforIndexPath:");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    -[AVTSelectableStickerSheetController setSelectedIndexPath:](self, "setSelectedIndexPath:", v11);
    -[AVTSelectableStickerSheetController stickerItems](self, "stickerItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v11, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTSelectableStickerSheetController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stickerSheetController:didInteractWithStickerItem:atIndex:byPeeling:", self, v9, v7, v4);

  }
}

- (unint64_t)stickerIndexInModelforIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  -[AVTSelectableStickerSheetController stickerItems](self, "stickerItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTSelectableStickerSheetController model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stickerItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v7);

  return v10;
}

- (void)selectStickerWithIdentifier:(id)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a3;
  v4 = -[AVTSelectableStickerSheetController showCellSelectionLayer](self, "showCellSelectionLayer");
  if (v10 && v4)
  {
    -[AVTSelectableStickerSheetController stickerItems](self, "stickerItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__AVTSelectableStickerSheetController_selectStickerWithIdentifier___block_invoke;
    v11[3] = &unk_1EA51EC30;
    v12 = v10;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v11);

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTSelectableStickerSheetController setSelectedIndexPath:](self, "setSelectedIndexPath:", v7);

      -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTSelectableStickerSheetController selectedIndexPath](self, "selectedIndexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectItemAtIndexPath:animated:scrollPosition:", v9, 1, 0);

    }
  }

}

uint64_t __67__AVTSelectableStickerSheetController_selectStickerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)clearStickerSelection
{
  void *v3;
  void *v4;
  void *v5;

  -[AVTSelectableStickerSheetController selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTSelectableStickerSheetController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSelectableStickerSheetController selectedIndexPath](self, "selectedIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deselectItemAtIndexPath:animated:", v5, 1);

    -[AVTSelectableStickerSheetController setSelectedIndexPath:](self, "setSelectedIndexPath:", 0);
  }
}

- (BOOL)isCameraItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTSelectableStickerSheetController cameraStickerItem](self, "cameraStickerItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
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
  return (AVTStickerDisclosureValidationDelegate *)objc_loadWeakRetained((id *)&self->_disclosureValidationDelegate);
}

- (void)setDisclosureValidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_disclosureValidationDelegate, a3);
}

- (AVTStickerViewControllerImageDelegate)imageDelegate
{
  return (AVTStickerViewControllerImageDelegate *)objc_loadWeakRetained((id *)&self->_imageDelegate);
}

- (void)setImageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_imageDelegate, a3);
}

- (AVTStickerSheetDelegate)stickerSheetDelegate
{
  return (AVTStickerSheetDelegate *)objc_loadWeakRetained((id *)&self->_stickerSheetDelegate);
}

- (void)setStickerSheetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stickerSheetDelegate, a3);
}

- (BOOL)showCellSelectionLayer
{
  return self->_showCellSelectionLayer;
}

- (void)setShowCellSelectionLayer:(BOOL)a3
{
  self->_showCellSelectionLayer = a3;
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

- (BOOL)allowsPoseCapture
{
  return self->_allowsPoseCapture;
}

- (void)setAllowsPoseCapture:(BOOL)a3
{
  self->_allowsPoseCapture = a3;
}

- (NSArray)stickerItems
{
  return self->_stickerItems;
}

- (void)setStickerItems:(id)a3
{
  objc_storeStrong((id *)&self->_stickerItems, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  self->_selectedIndexPath = (NSIndexPath *)a3;
}

- (AVTUIStickerItem)cameraStickerItem
{
  return (AVTUIStickerItem *)objc_loadWeakRetained((id *)&self->_cameraStickerItem);
}

- (void)setCameraStickerItem:(id)a3
{
  objc_storeWeak((id *)&self->_cameraStickerItem, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraStickerItem);
  objc_storeStrong((id *)&self->_stickerItems, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_stickerSheetDelegate);
  objc_destroyWeak((id *)&self->_imageDelegate);
  objc_destroyWeak((id *)&self->_disclosureValidationDelegate);
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end
