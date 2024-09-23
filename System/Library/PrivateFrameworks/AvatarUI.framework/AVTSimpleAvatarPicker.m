@implementation AVTSimpleAvatarPicker

- (AVTSimpleAvatarPicker)initWithStore:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  return -[AVTSimpleAvatarPicker initWithStore:environment:allowAddItem:interItemSpacing:shouldReverseNaturalLayout:](self, "initWithStore:environment:allowAddItem:interItemSpacing:shouldReverseNaturalLayout:", a3, a4, a5, 0, 8.0);
}

- (AVTSimpleAvatarPicker)initWithStore:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5 interItemSpacing:(double)a6
{
  return -[AVTSimpleAvatarPicker initWithStore:environment:allowAddItem:interItemSpacing:shouldReverseNaturalLayout:](self, "initWithStore:environment:allowAddItem:interItemSpacing:shouldReverseNaturalLayout:", a3, a4, a5, 0, a6);
}

- (AVTSimpleAvatarPicker)initWithStore:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5 interItemSpacing:(double)a6 shouldReverseNaturalLayout:(BOOL)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  AVTAvatarRecordDataSource *v13;
  void *v14;
  AVTAvatarRecordDataSource *v15;
  AVTAvatarPickerDataSource *v16;
  void *v17;
  _AVTAvatarRecordImageProvider *v18;
  void *v19;
  _AVTAvatarRecordImageProvider *v20;
  AVTViewSessionProvider *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  AVTViewSessionProvider *v29;
  AVTSimpleAvatarPicker *v30;
  _BOOL4 v32;

  v32 = a7;
  v8 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [AVTAvatarRecordDataSource alloc];
  objc_msgSend(MEMORY[0x1E0D00840], "requestForAllAvatars");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AVTAvatarRecordDataSource initWithRecordStore:fetchRequest:environment:](v13, "initWithRecordStore:fetchRequest:environment:", v12, v14, v11);

  v16 = -[AVTAvatarPickerDataSource initWithRecordDataSource:environment:allowAddItem:]([AVTAvatarPickerDataSource alloc], "initWithRecordDataSource:environment:allowAddItem:", v15, v11, v8);
  +[AVTStickerTaskScheduler schedulerWithRecordDataSource:](AVTStickerTaskScheduler, "schedulerWithRecordDataSource:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [_AVTAvatarRecordImageProvider alloc];
  -[AVTAvatarPickerDataSource environment](v16, "environment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[_AVTAvatarRecordImageProvider initWithEnvironment:taskScheduler:](v18, "initWithEnvironment:taskScheduler:", v19, 0);

  v21 = [AVTViewSessionProvider alloc];
  -[AVTAvatarPickerDataSource environment](v16, "environment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTViewSessionProvider backingSizeForEnvironment:](AVTViewSessionProvider, "backingSizeForEnvironment:", v22);
  v24 = v23;
  v26 = v25;
  +[AVTViewSessionProvider creatorForAVTView](AVTViewSessionProvider, "creatorForAVTView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarPickerDataSource environment](v16, "environment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:](v21, "initWithAVTViewBackingSize:viewCreator:environment:", v27, v28, v24, v26);

  v30 = -[AVTSimpleAvatarPicker initWithDataSource:recordImageProvider:avtViewSessionProvider:taskScheduler:allowEditing:interItemSpacing:shouldReverseNaturalLayout:](self, "initWithDataSource:recordImageProvider:avtViewSessionProvider:taskScheduler:allowEditing:interItemSpacing:shouldReverseNaturalLayout:", v16, v20, v29, v17, v8, v32, a6);
  return v30;
}

- (AVTSimpleAvatarPicker)initWithDataSource:(id)a3 recordImageProvider:(id)a4 avtViewSessionProvider:(id)a5 taskScheduler:(id)a6 allowEditing:(BOOL)a7
{
  return -[AVTSimpleAvatarPicker initWithDataSource:recordImageProvider:avtViewSessionProvider:taskScheduler:allowEditing:interItemSpacing:shouldReverseNaturalLayout:](self, "initWithDataSource:recordImageProvider:avtViewSessionProvider:taskScheduler:allowEditing:interItemSpacing:shouldReverseNaturalLayout:", a3, a4, a5, a6, a7, 0, 8.0);
}

- (AVTSimpleAvatarPicker)initWithDataSource:(id)a3 recordImageProvider:(id)a4 avtViewSessionProvider:(id)a5 taskScheduler:(id)a6 allowEditing:(BOOL)a7 interItemSpacing:(double)a8
{
  return -[AVTSimpleAvatarPicker initWithDataSource:recordImageProvider:avtViewSessionProvider:taskScheduler:allowEditing:interItemSpacing:shouldReverseNaturalLayout:](self, "initWithDataSource:recordImageProvider:avtViewSessionProvider:taskScheduler:allowEditing:interItemSpacing:shouldReverseNaturalLayout:", a3, a4, a5, a6, a7, 0, a8);
}

- (AVTSimpleAvatarPicker)initWithDataSource:(id)a3 recordImageProvider:(id)a4 avtViewSessionProvider:(id)a5 taskScheduler:(id)a6 allowEditing:(BOOL)a7 interItemSpacing:(double)a8 shouldReverseNaturalLayout:(BOOL)a9
{
  id v17;
  id v18;
  id v19;
  AVTSimpleAvatarPicker *v20;
  AVTSimpleAvatarPicker *v21;
  uint64_t v22;
  AVTRenderingScope *renderingScope;
  AVTImageStore *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  AVTImageStore *imageStore;
  uint64_t v31;
  NSMutableDictionary *itemsToTasksMap;
  id v34;
  objc_super v35;

  v17 = a3;
  v34 = a4;
  v18 = a5;
  v19 = a6;
  v35.receiver = self;
  v35.super_class = (Class)AVTSimpleAvatarPicker;
  v20 = -[AVTSimpleAvatarPicker init](&v35, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_dataSource, a3);
    +[AVTRenderingScope simplePickerThumbnailScope](AVTRenderingScope, "simplePickerThumbnailScope");
    v22 = objc_claimAutoreleasedReturnValue();
    renderingScope = v21->_renderingScope;
    v21->_renderingScope = (AVTRenderingScope *)v22;

    objc_storeStrong((id *)&v21->_imageProvider, a4);
    v21->_minimumInteritemSpacing = a8;
    v21->_allowEditing = a7;
    v21->_doesDisplayEditIconWhenAvailable = 1;
    objc_storeStrong((id *)&v21->_taskScheduler, a6);
    objc_storeStrong((id *)&v21->_viewSessionProvider, a5);
    v21->_shouldReverseNaturalLayout = a9;
    v24 = [AVTImageStore alloc];
    objc_msgSend(v17, "environment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "coreEnvironment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "environment");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "imageStoreLocation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[AVTImageStore initWithEnvironment:validateImages:location:](v24, "initWithEnvironment:validateImages:location:", v26, 0, v28);
    imageStore = v21->_imageStore;
    v21->_imageStore = (AVTImageStore *)v29;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = objc_claimAutoreleasedReturnValue();
    itemsToTasksMap = v21->_itemsToTasksMap;
    v21->_itemsToTasksMap = (NSMutableDictionary *)v31;

  }
  return v21;
}

- (UIView)view
{
  UIView *view;

  view = self->_view;
  if (!view)
  {
    -[AVTSimpleAvatarPicker loadView](self, "loadView");
    view = self->_view;
  }
  return view;
}

- (void)setMinimumInteritemSpacing:(double)a3
{
  id v4;

  if (self->_minimumInteritemSpacing != a3)
  {
    self->_minimumInteritemSpacing = a3;
    -[AVTSimpleAvatarPicker collectionViewLayout](self, "collectionViewLayout");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMinimumLineSpacing:", a3);
    objc_msgSend(v4, "setMinimumInteritemSpacing:", a3);
    objc_msgSend(v4, "invalidateLayout");

  }
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  AVTNotifyingContainerView *v20;
  AVTEdgeDisappearingCollectionViewLayout *v21;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v21 = objc_alloc_init(AVTEdgeDisappearingCollectionViewLayout);
  -[AVTSimpleAvatarPicker minimumInteritemSpacing](self, "minimumInteritemSpacing");
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v21, "setMinimumInteritemSpacing:");
  -[AVTSimpleAvatarPicker minimumInteritemSpacing](self, "minimumInteritemSpacing");
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v21, "setMinimumLineSpacing:");
  -[UICollectionViewFlowLayout setScrollDirection:](v21, "setScrollDirection:", 1);
  -[AVTEdgeDisappearingCollectionViewLayout setPinHeaderToVisible:](v21, "setPinHeaderToVisible:", 1);
  -[AVTEdgeDisappearingCollectionViewLayout setEnableEdgeDisappearing:](v21, "setEnableEdgeDisappearing:", -[AVTSimpleAvatarPicker shouldShowHeaderButton](self, "shouldShowHeaderButton"));
  -[AVTSimpleAvatarPicker setCollectionViewLayout:](self, "setCollectionViewLayout:", v21);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA410]), "initWithFrame:collectionViewLayout:", v21, v3, v4, v5, v6);
  objc_msgSend(v7, "setDataSource:", self);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowsHorizontalScrollIndicator:", objc_msgSend(v10, "deviceIsMac"));

  objc_msgSend(v7, "setDelaysContentTouches:", 0);
  -[AVTSimpleAvatarPicker contentInset](self, "contentInset");
  objc_msgSend(v7, "setContentInset:");
  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "setAllowsMultipleSelection:", 0);
  v11 = objc_opt_class();
  +[AVTSimpleAvatarPickerCollectionViewCell cellIdentifier](AVTSimpleAvatarPickerCollectionViewCell, "cellIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v11, v12);

  v13 = objc_opt_class();
  v14 = *MEMORY[0x1E0CEB3B8];
  +[AVTSimpleAvatarPickerHeaderView reuseIdentifier](AVTSimpleAvatarPickerHeaderView, "reuseIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v13, v14, v15);

  if (-[AVTSimpleAvatarPicker shouldReverseNaturalLayout](self, "shouldReverseNaturalLayout"))
  {
    -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "environment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "userInterfaceLayoutDirection"))
      v18 = 3;
    else
      v18 = 4;
    objc_msgSend(v7, "setSemanticContentAttribute:", v18);

  }
  objc_msgSend(v7, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMasksToBounds:", 0);

  -[AVTSimpleAvatarPicker setCollectionView:](self, "setCollectionView:", v7);
  v20 = -[AVTNotifyingContainerView initWithFrame:]([AVTNotifyingContainerView alloc], "initWithFrame:", v3, v4, v5, v6);
  -[AVTNotifyingContainerView setDelegate:](v20, "setDelegate:", self);
  -[AVTNotifyingContainerView addSubview:](v20, "addSubview:", v7);
  -[AVTSimpleAvatarPicker setView:](self, "setView:", v20);
  -[AVTSimpleAvatarPicker renderThumbnailsIfNeeded](self, "renderThumbnailsIfNeeded");

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v7;
  id v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self->_contentInset.top;
  if (self->_contentInset.left != a3.left
    || v7 != top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset.top = top;
    self->_contentInset.left = a3.left;
    self->_contentInset.bottom = a3.bottom;
    self->_contentInset.right = a3.right;
    -[AVTSimpleAvatarPicker collectionView](self, "collectionView", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentInset:", top, left, bottom, right);

  }
}

- (void)setAllowEditing:(BOOL)a3
{
  if (self->_allowEditing != a3)
  {
    self->_allowEditing = a3;
    -[AVTSimpleAvatarPicker reloadData](self, "reloadData");
  }
}

- (void)renderThumbnailsIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItems");

  if (v4 >= 1)
  {
    v5 = 0;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "itemAtIndex:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __49__AVTSimpleAvatarPicker_renderThumbnailsIfNeeded__block_invoke;
      v9[3] = &unk_1EA520208;
      v9[4] = self;
      objc_msgSend(v8, "downcastWithRecordHandler:viewHandler:", v9, 0);

      ++v5;
    }
    while (v4 != v5);
  }
}

void __49__AVTSimpleAvatarPicker_renderThumbnailsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  AVTAvatarRecordCacheableResource *v6;
  void *v7;
  void *v8;
  void *v9;
  AVTAvatarRecordCacheableResource *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  uint64_t v25;
  id v26;

  v3 = a2;
  objc_msgSend(v3, "cachedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "renderingScope");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [AVTAvatarRecordCacheableResource alloc];
    objc_msgSend(v3, "avatar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AVTAvatarRecordCacheableResource initWithAvatarRecord:includeAvatarData:environment:](v6, "initWithAvatarRecord:includeAvatarData:environment:", v7, 0, v9);

    objc_msgSend(*(id *)(a1 + 32), "imageStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageForItem:scope:", v10, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "imageProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "avatar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "providerForRecord:scope:", v14, v5);
      v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __49__AVTSimpleAvatarPicker_renderThumbnailsIfNeeded__block_invoke_2;
      v24 = &unk_1EA51E968;
      v25 = *(_QWORD *)(a1 + 32);
      v16 = v3;
      v26 = v16;
      ((void (**)(_QWORD, uint64_t *, _QWORD))v15)[2](v15, &v21, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "scheduleRenderingTask:forRecordItem:", v17, v16, v21, v22, v23, v24, v25);
      objc_msgSend(*(id *)(a1 + 32), "taskScheduler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "avatar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lowerStickerPickerTaskPriority:avatarRecordIdentifier:", v17, v20);

    }
  }

}

void __49__AVTSimpleAvatarPicker_renderThumbnailsIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "unregisterCurrentRenderingTaskForRecordItem:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "cachedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 40), "setCachedImage:", v4);

}

- (void)reloadData
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;

  if (self->_view)
  {
    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathsForSelectedItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[AVTSimpleAvatarPicker shouldShowHeaderButton](self, "shouldShowHeaderButton");
    -[AVTSimpleAvatarPicker collectionViewLayout](self, "collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnableEdgeDisappearing:", v5);

    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

    if (objc_msgSend(v4, "count"))
    {
      -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectItemAtIndexPath:animated:scrollPosition:", v10, 0, 16);

    }
    objc_sync_exit(obj);

  }
}

- (void)reloadDataSource
{
  void *v3;

  -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadModel");

  -[AVTSimpleAvatarPicker reloadData](self, "reloadData");
}

- (int64_t)indexForSelectedAvatar
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "item");

  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)selectedAvatar
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemAtIndex:", -[AVTSimpleAvatarPicker indexForSelectedAvatar](self, "indexForSelectedAvatar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__21;
  v12 = __Block_byref_object_dispose__21;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__AVTSimpleAvatarPicker_selectedAvatar__block_invoke;
  v7[3] = &unk_1EA51DF20;
  v7[4] = &v8;
  objc_msgSend(v4, "downcastWithRecordHandler:viewHandler:", v7, 0);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __39__AVTSimpleAvatarPicker_selectedAvatar__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "avatar");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)canCreateAvatar
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canCreateAvatar");

  return v5;
}

- (BOOL)shouldShowHeaderButton
{
  void *v3;
  BOOL v4;

  if (-[AVTSimpleAvatarPicker allowEditing](self, "allowEditing"))
  {
    -[AVTSimpleAvatarPicker selectedAvatar](self, "selectedAvatar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (-[AVTSimpleAvatarPicker doesDisplayEditIconWhenAvailable](self, "doesDisplayEditIconWhenAvailable"))
      {
        if ((objc_msgSend(v3, "isEditable") & 1) != 0)
          goto LABEL_5;
        if ((objc_msgSend(v3, "isEditable") & 1) != 0)
        {
          v4 = 0;
          goto LABEL_10;
        }
      }
      v4 = -[AVTSimpleAvatarPicker canCreateAvatar](self, "canCreateAvatar");
      goto LABEL_10;
    }
LABEL_5:
    v4 = 1;
LABEL_10:

    return v4;
  }
  return 0;
}

- (void)presentActionsForSelectedAvatar
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  id v7;

  -[AVTSimpleAvatarPicker selectedAvatar](self, "selectedAvatar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEditable")
    && -[AVTSimpleAvatarPicker doesDisplayEditIconWhenAvailable](self, "doesDisplayEditIconWhenAvailable"))
  {
    -[AVTSimpleAvatarPicker presentActionsForAvatarRecord:](self, "presentActionsForAvatarRecord:", v7);
  }
  else
  {
    -[AVTSimpleAvatarPicker avatarPickerDelegate](self, "avatarPickerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) == 0
      || (-[AVTSimpleAvatarPicker avatarPickerDelegate](self, "avatarPickerDelegate"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "avatarPicker:shouldPresentMemojiEditorForAvatarRecord:", self, v7),
          v5,
          v6))
    {
      -[AVTSimpleAvatarPicker presentMemojiEditorForCreation](self, "presentMemojiEditorForCreation");
    }
  }

}

- (id)actionsModelForRecord:(id)a3
{
  id v4;
  id v5;
  AVTAvatarActionsProvider *v6;
  void *v7;
  void *v8;
  AVTAvatarActionsProvider *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEditable"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v4);
    v5 = v4;
    v6 = [AVTAvatarActionsProvider alloc];
    -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AVTAvatarActionsProvider initWithAvatarRecord:dataSource:allowCreate:](v6, "initWithAvatarRecord:dataSource:allowCreate:", v5, v8, 1);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)presentActionsForAvatarRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  AVTAvatarInlineActionsController *v7;
  void *v8;
  void *v9;
  void *v10;
  AVTAvatarInlineActionsController *v11;
  AVTAvatarActionsViewController *v12;
  void *v13;
  AVTAvatarActionsViewController *v14;
  id v15;

  v15 = a3;
  if ((objc_msgSend(v15, "isEditable") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Record %@ is not editable!"), v15);
  -[AVTSimpleAvatarPicker actionsModelForRecord:](self, "actionsModelForRecord:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [AVTAvatarInlineActionsController alloc];
  -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPicker viewSessionProvider](self, "viewSessionProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVTAvatarInlineActionsController initWithDataSource:avtViewProvider:environment:](v7, "initWithDataSource:avtViewProvider:environment:", v9, v10, v6);

  -[AVTAvatarInlineActionsController setShouldHideUserInfoView:](v11, "setShouldHideUserInfoView:", -[AVTSimpleAvatarPicker shouldHideUserInfoView](self, "shouldHideUserInfoView"));
  -[AVTAvatarInlineActionsController updateWithActionsModel:](v11, "updateWithActionsModel:", v4);
  v12 = [AVTAvatarActionsViewController alloc];
  -[AVTSimpleAvatarPicker viewSessionProvider](self, "viewSessionProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AVTAvatarActionsViewController initWithAVTViewSessionProvider:actionsController:environment:](v12, "initWithAVTViewSessionProvider:actionsController:environment:", v13, v11, v6);

  -[AVTAvatarActionsViewController setDelegate:](v14, "setDelegate:", self);
  -[AVTAvatarActionsViewController setShouldHideUserInfoView:](v14, "setShouldHideUserInfoView:", -[AVTSimpleAvatarPicker shouldHideUserInfoView](self, "shouldHideUserInfoView"));
  -[AVTSimpleAvatarPicker wrapAndPresentViewController:animated:](self, "wrapAndPresentViewController:animated:", v14, 1);

}

- (void)presentMemojiEditorForCreation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AVTSimpleAvatarPicker presenterDelegate](self, "presenterDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSimpleAvatarPicker viewSessionProvider](self, "viewSessionProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTAvatarEditorViewController viewControllerForCreatingAvatarInStore:avtViewSessionProvider:](AVTAvatarEditorViewController, "viewControllerForCreatingAvatarInStore:avtViewSessionProvider:", v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v7, "setShouldHideUserInfoView:", -[AVTSimpleAvatarPicker shouldHideUserInfoView](self, "shouldHideUserInfoView"));
    -[AVTSimpleAvatarPicker wrapAndPresentViewController:animated:](self, "wrapAndPresentViewController:animated:", v7, 1);

  }
}

- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4
{
  void *v5;
  id v6;

  +[AVTUIControllerPresentation presentationWithWrappingForController:](AVTUIControllerPresentation, "presentationWithWrappingForController:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPicker presenterDelegate](self, "presenterDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentAvatarUIController:animated:", v6, 1);

}

- (void)deselectPreviousSelectedItemExcludingIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_4;
  -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v12);

  if ((v9 & 1) == 0)
  {
    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPathsForSelectedItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deselectItemAtIndexPath:animated:", v4, 1);
LABEL_4:

  }
}

- (void)updateHeaderButtonForSelectedAvatar:(id)a3 invalidateLayout:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v6 = a4;
  v12 = a3;
  -[AVTSimpleAvatarPicker headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v8)
  {
    if (objc_msgSend(v12, "isEditable"))
      v9 = -[AVTSimpleAvatarPicker doesDisplayEditIconWhenAvailable](self, "doesDisplayEditIconWhenAvailable");
    else
      v9 = 0;
    -[AVTSimpleAvatarPicker headerView](self, "headerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateForEditMode:animated:", v9, v5);

  }
  -[AVTSimpleAvatarPicker collectionViewLayout](self, "collectionViewLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnableEdgeDisappearing:", -[AVTSimpleAvatarPicker shouldShowHeaderButton](self, "shouldShowHeaderButton"));
  if (v6)
    objc_msgSend(v11, "invalidateLayout");

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AVTSimpleAvatarPicker dataSource](self, "dataSource", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItems");

  return v5;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x1E0CEB3B8];
  +[AVTSimpleAvatarPickerHeaderView reuseIdentifier](AVTSimpleAvatarPickerHeaderView, "reuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v11, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __86__AVTSimpleAvatarPicker_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
  v19 = &unk_1EA51D7E8;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v13, "setButtonPressedBlock:", &v16);
  -[AVTSimpleAvatarPicker setHeaderView:](self, "setHeaderView:", v13, v16, v17, v18, v19);
  -[AVTSimpleAvatarPicker selectedAvatar](self, "selectedAvatar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPicker updateHeaderButtonForSelectedAvatar:invalidateLayout:animated:](self, "updateHeaderButtonForSelectedAvatar:invalidateLayout:animated:", v14, 0, 0);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v13;
}

void __86__AVTSimpleAvatarPicker_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentActionsForSelectedAvatar");

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
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  AVTSimpleAvatarPicker *v22;
  _QWORD v23[4];
  id v24;
  AVTSimpleAvatarPicker *v25;
  id v26;
  id v27;
  id v28;

  v6 = a4;
  v7 = a3;
  -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemAtIndex:", objc_msgSend(v6, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[AVTSimpleAvatarPickerCollectionViewCell cellIdentifier](AVTSimpleAvatarPickerCollectionViewCell, "cellIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisplaySessionUUID:", v12);
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __63__AVTSimpleAvatarPicker_collectionView_cellForItemAtIndexPath___block_invoke;
  v23[3] = &unk_1EA520258;
  v24 = v11;
  v25 = self;
  v26 = v9;
  v27 = v6;
  v28 = v12;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __63__AVTSimpleAvatarPicker_collectionView_cellForItemAtIndexPath___block_invoke_3;
  v20[3] = &unk_1EA51E6E0;
  v14 = v24;
  v21 = v14;
  v22 = self;
  v15 = v12;
  v16 = v6;
  v17 = v9;
  objc_msgSend(v17, "downcastWithRecordHandler:imageHandler:viewHandler:", v23, v20, 0);
  v18 = v14;

  return v18;
}

void __63__AVTSimpleAvatarPicker_collectionView_cellForItemAtIndexPath___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  AVTAvatarRecordCacheableResource *v13;
  void *v14;
  void *v15;
  void *v16;
  AVTAvatarRecordCacheableResource *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  id v27;
  void (*v28)(_QWORD *, _QWORD *, _QWORD);
  id v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;

  v3 = a2;
  objc_msgSend(a1[4], "setShowSelectedState:", 1);
  objc_msgSend(v3, "cachedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "avatar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEditable");

    if (v6)
      v7 = 1;
    else
      v7 = 2;
    objc_msgSend(a1[4], "setImageInsetSize:", v7);
    v10 = a1 + 4;
    v9 = a1[4];
    v8 = v10[1];
    objc_msgSend(v3, "cachedImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateCell:withImage:animated:", v9, v11, 0);

  }
  else
  {
    objc_msgSend(a1[5], "renderingScope");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [AVTAvatarRecordCacheableResource alloc];
    objc_msgSend(v3, "avatar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "environment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[AVTAvatarRecordCacheableResource initWithAvatarRecord:includeAvatarData:environment:](v13, "initWithAvatarRecord:includeAvatarData:environment:", v14, 0, v16);

    objc_msgSend(a1[5], "imageStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageForItem:scope:", v17, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v3, "avatar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEditable");

      if (v21)
        v22 = 1;
      else
        v22 = 2;
      objc_msgSend(a1[4], "setImageInsetSize:", v22);
      objc_msgSend(a1[5], "updateCell:withImage:animated:", a1[4], v19, 0);
    }
    else
    {
      v23 = (void *)objc_opt_new();
      objc_msgSend(a1[5], "imageProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "avatar");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "providerForRecord:scope:", v25, v12);
      v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[5], "cancelCurrentRenderingTaskForRecordItem:", v3);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __63__AVTSimpleAvatarPicker_collectionView_cellForItemAtIndexPath___block_invoke_2;
      v34[3] = &unk_1EA520230;
      v34[4] = a1[5];
      v27 = v3;
      v35 = v27;
      v36 = a1[6];
      v37 = a1[7];
      v38 = a1[8];
      v39 = a1[4];
      v40 = v23;
      v28 = (void (*)(_QWORD *, _QWORD *, _QWORD))v26[2];
      v29 = v23;
      v28(v26, v34, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "scheduleRenderingTask:forRecordItem:", v30, v27);
      objc_msgSend(v27, "avatar");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEditable");

      if (v32)
        v33 = 1;
      else
        v33 = 2;
      objc_msgSend(a1[4], "setImageInsetSize:", v33);

    }
  }

}

void __63__AVTSimpleAvatarPicker_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "unregisterCurrentRenderingTaskForRecordItem:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "cachedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 40), "setCachedImage:", v6);
  objc_msgSend(*(id *)(a1 + 32), "currentCellForRecordItem:atIndexPath:displaySessionUUID:previousCell:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 80), "timeIntervalSinceNow");
    objc_msgSend(*(id *)(a1 + 32), "updateCell:withImage:animated:", v4, v6, v5 < -0.1);
  }

}

void __63__AVTSimpleAvatarPicker_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setShowSelectedState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setImageInsetSize:", 0);
  v7 = a1 + 32;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v7 + 8);
  objc_msgSend(v4, "image");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateCell:withImage:animated:", v5, v8, 0);
}

- (id)currentCellForRecordItem:(id)a3 atIndexPath:(id)a4 displaySessionUUID:(id)a5 previousCell:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  objc_msgSend(v12, "displaySessionUUID");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v15 = v12;
  if (v14 == v13)
  {
LABEL_8:
    v19 = v15;
    v18 = v19;
    goto LABEL_9;
  }
  -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "itemAtIndex:", objc_msgSend(v11, "item"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 == v10)
  {
    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cellForItemAtIndexPath:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "visibleCells");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "containsObject:", v21))
      v24 = v21;
    else
      v24 = 0;
    v15 = v24;

    goto LABEL_8;
  }
  v18 = 0;
  v19 = v12;
LABEL_9:

  return v18;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  v6 = a5;
  -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "item");

  objc_msgSend(v7, "itemAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__AVTSimpleAvatarPicker_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke;
  v10[3] = &unk_1EA520208;
  v10[4] = self;
  objc_msgSend(v9, "downcastWithRecordHandler:viewHandler:", v10, 0);

}

uint64_t __80__AVTSimpleAvatarPicker_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelCurrentRenderingTaskForRecordItem:", a2);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;

  v5 = a4;
  -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  v8 = objc_msgSend(v6, "isItemAtIndexAddItem:", v7);
  if (v8)
    -[AVTSimpleAvatarPicker presentMemojiEditorForCreation](self, "presentMemojiEditorForCreation");
  return v8 ^ 1;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v9, "indexPathsForSelectedItems");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isEqual:", v5);
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v9, "cellForItemAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelected:", 0);

  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__AVTSimpleAvatarPicker_collectionView_didUnhighlightItemAtIndexPath___block_invoke;
  v9[3] = &unk_1EA51D570;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __70__AVTSimpleAvatarPicker_collectionView_didUnhighlightItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "indexPathsForSelectedItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSelected:", 1);

  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v6 = a3;
  v7 = a4;
  -[AVTSimpleAvatarPicker avatarPickerDelegate](self, "avatarPickerDelegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isItemAtIndexAddItem:", objc_msgSend(v7, "item"));

    if ((v11 & 1) == 0)
    {
      -[AVTSimpleAvatarPicker deselectPreviousSelectedItemExcludingIndexPath:](self, "deselectPreviousSelectedItemExcludingIndexPath:", v7);
      if (-[AVTSimpleAvatarPicker isItemAtIndexPathOffscreen:](self, "isItemAtIndexPathOffscreen:", v7))
        objc_msgSend(v6, "scrollToItemAtIndexPath:atScrollPosition:animated:", v7, 16, 1);
      -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "itemAtIndex:", objc_msgSend(v7, "item"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __65__AVTSimpleAvatarPicker_collectionView_didSelectItemAtIndexPath___block_invoke;
      v14[3] = &unk_1EA520208;
      v14[4] = self;
      objc_msgSend(v13, "downcastWithRecordHandler:imageHandler:viewHandler:", v14, 0, 0);

    }
  }

}

void __65__AVTSimpleAvatarPicker_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "avatarPickerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "avatar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatarPicker:didSelectAvatarRecord:", v6, v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v4, "avatar");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "updateHeaderButtonForSelectedAvatar:invalidateLayout:animated:", v9, 1, 1);
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)scheduleRenderingTask:(id)a3 forRecordItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v6, "avatar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTStickerTask stickerTaskForSchedulerTask:avatarRecordIdentifier:indexPath:stickerType:](AVTStickerTask, "stickerTaskForSchedulerTask:avatarRecordIdentifier:indexPath:stickerType:", v7, v9, 0, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTSimpleAvatarPicker taskScheduler](self, "taskScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scheduleStickerTask:", v11);

    -[AVTSimpleAvatarPicker registerRenderingTask:forRecordItem:](self, "registerRenderingTask:forRecordItem:", v7, v6);
  }
}

- (id)currentRenderingTaskForRecordItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[AVTSimpleAvatarPicker itemsToTasksMap](self, "itemsToTasksMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)registerRenderingTask:(id)a3 forRecordItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = (id)objc_msgSend(a3, "copy");
  -[AVTSimpleAvatarPicker itemsToTasksMap](self, "itemsToTasksMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v9);

}

- (void)cancelCurrentRenderingTaskForRecordItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AVTSimpleAvatarPicker currentRenderingTaskForRecordItem:](self, "currentRenderingTaskForRecordItem:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AVTSimpleAvatarPicker taskScheduler](self, "taskScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "avatar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelPickerTask:avatarRecordIdentifier:", v4, v7);

    -[AVTSimpleAvatarPicker unregisterCurrentRenderingTaskForRecordItem:](self, "unregisterCurrentRenderingTaskForRecordItem:", v8);
  }

}

- (void)unregisterCurrentRenderingTaskForRecordItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AVTSimpleAvatarPicker itemsToTasksMap](self, "itemsToTasksMap");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v6);

}

- (CGSize)itemSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInset");
  v8 = v5 - v7;
  -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentInset");
  v11 = v8 - v10;

  v12 = 44.0;
  if (v11 > 0.0)
    v12 = v11;
  v13 = v12;
  result.height = v13;
  result.width = v12;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  v6 = -[AVTSimpleAvatarPicker shouldShowHeaderButton](self, "shouldShowHeaderButton", a3, a4, a5);
  v7 = 0.0;
  if (v6)
  {
    -[AVTSimpleAvatarPicker minimumInteritemSpacing](self, "minimumInteritemSpacing");
    v7 = v8;
  }
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  result.right = v11;
  result.bottom = v10;
  result.left = v7;
  result.top = v9;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v6;
  double v7;
  CGSize result;

  if (-[AVTSimpleAvatarPicker shouldShowHeaderButton](self, "shouldShowHeaderButton", a3, a4, a5))
  {
    -[AVTSimpleAvatarPicker itemSize](self, "itemSize");
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)selectAvatarRecordWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v18 = a4;
  v5 = a3;
  v6 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0x7FFFFFFFFFFFFFFFLL;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__21;
  v28 = __Block_byref_object_dispose__21;
  v29 = 0;
  v7 = MEMORY[0x1E0C809B0];
  do
  {
    -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "numberOfItems");

    if (v6 >= v9)
      break;
    -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemAtIndex:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __67__AVTSimpleAvatarPicker_selectAvatarRecordWithIdentifier_animated___block_invoke;
    v19[3] = &unk_1EA520280;
    v20 = v5;
    v21 = &v30;
    v22 = &v24;
    v23 = v6;
    objc_msgSend(v11, "downcastWithRecordHandler:imageHandler:viewHandler:", v19, 0, 0);
    v12 = v31[3];

    ++v6;
  }
  while (v12 == 0x7FFFFFFFFFFFFFFFLL);
  v13 = v31[3];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSimpleAvatarPicker deselectPreviousSelectedItemExcludingIndexPath:](self, "deselectPreviousSelectedItemExcludingIndexPath:", v14);
    if (-[AVTSimpleAvatarPicker isItemAtIndexPathOffscreen:](self, "isItemAtIndexPathOffscreen:", v14))
      v15 = 16;
    else
      v15 = 0;
    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutIfNeeded");

    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectItemAtIndexPath:animated:scrollPosition:", v14, v18, v15);

    -[AVTSimpleAvatarPicker updateHeaderButtonForSelectedAvatar:invalidateLayout:animated:](self, "updateHeaderButtonForSelectedAvatar:invalidateLayout:animated:", v25[5], 1, v18);
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

void __67__AVTSimpleAvatarPicker_selectAvatarRecordWithIdentifier_animated___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "avatar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", a1[4]);

  if (v5)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a1[7];
    objc_msgSend(v9, "avatar");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (BOOL)isItemAtIndexPathOffscreen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  double MaxX;
  void *v19;
  double MinX;
  void *v21;
  double v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL v38;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v4 = a3;
  -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentOffset");
  v17 = v8 - v16;

  v40.origin.x = v17;
  v40.origin.y = v10;
  v40.size.width = v12;
  v40.size.height = v14;
  MaxX = CGRectGetMaxX(v40);
  -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  if (MaxX > CGRectGetMaxX(v41))
  {

LABEL_7:
    v38 = 1;
    goto LABEL_8;
  }
  v42.origin.x = v17;
  v42.origin.y = v10;
  v42.size.width = v12;
  v42.size.height = v14;
  MinX = CGRectGetMinX(v42);
  -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v22 = CGRectGetMinX(v43);

  if (MinX < v22)
    goto LABEL_7;
  if (-[AVTSimpleAvatarPicker shouldShowHeaderButton](self, "shouldShowHeaderButton"))
  {
    -[AVTSimpleAvatarPicker headerView](self, "headerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[AVTSimpleAvatarPicker minimumInteritemSpacing](self, "minimumInteritemSpacing");
    v33 = -v32;
    v44.origin.x = v25;
    v44.origin.y = v27;
    v44.size.width = v29;
    v44.size.height = v31;
    v45 = CGRectInset(v44, v33, 0.0);
    x = v45.origin.x;
    y = v45.origin.y;
    width = v45.size.width;
    height = v45.size.height;

    objc_msgSend(v6, "frame");
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    if (CGRectIntersectsRect(v46, v47))
      goto LABEL_7;
  }
  v38 = 0;
LABEL_8:

  return v38;
}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  id v5;

  -[AVTSimpleAvatarPicker presentedAvatarRecord:](self, "presentedAvatarRecord:", a4);
  -[AVTSimpleAvatarPicker presenterDelegate](self, "presenterDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissAvatarUIControllerAnimated:", 1);

}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  id v3;

  -[AVTSimpleAvatarPicker presenterDelegate](self, "presenterDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAvatarUIControllerAnimated:", 1);

}

- (void)avatarActionsViewControllerDidFinish:(id)a3
{
  id v3;

  -[AVTSimpleAvatarPicker presenterDelegate](self, "presenterDelegate", a3);
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
  void *v13;

  v5 = a4;
  -[AVTSimpleAvatarPicker dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarActionsRecordUpdate recordUpdateForDeletingRecord:withDataSource:](AVTAvatarActionsRecordUpdate, "recordUpdateForDeletingRecord:withDataSource:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "avatarRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[AVTSimpleAvatarPicker avatarPickerDelegate](self, "avatarPickerDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "avatarRecord");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "avatarPicker:didSelectAvatarRecord:", self, v11);

      objc_msgSend(v8, "avatarRecord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTSimpleAvatarPicker presentedAvatarRecord:](self, "presentedAvatarRecord:", v12);

      objc_msgSend(v8, "avatarRecord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTSimpleAvatarPicker updateHeaderButtonForSelectedAvatar:invalidateLayout:animated:](self, "updateHeaderButtonForSelectedAvatar:invalidateLayout:animated:", v13, 1, 1);

    }
  }
  return v8;
}

- (void)avatarActionsViewController:(id)a3 willPresentAvatarRecord:(id)a4
{
  -[AVTSimpleAvatarPicker presentedAvatarRecord:](self, "presentedAvatarRecord:", a4);
}

- (void)presentedAvatarRecord:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AVTSimpleAvatarPicker presenterDelegate](self, "presenterDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVTSimpleAvatarPicker presenterDelegate](self, "presenterDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentedAvatarRecord:", v7);

  }
}

- (void)notifyingContainerViewWillChangeSize:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  id v13;

  -[AVTSimpleAvatarPicker view](self, "view", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);

  if (v6 != v9 || v8 != v10)
  {
    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionViewLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidateLayout");

  }
}

- (void)notifyingContainerViewDidChangeSize:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AVTSimpleAvatarPicker collectionView](self, "collectionView", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 && -[AVTSimpleAvatarPicker isItemAtIndexPathOffscreen:](self, "isItemAtIndexPathOffscreen:", v8))
  {
    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutIfNeeded");

    -[AVTSimpleAvatarPicker collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v8, 16, 1);

  }
}

- (void)updateCell:(id)a3 withImage:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[AVTSimpleAvatarPicker imageDelegate](self, "imageDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "displaySessionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSimpleAvatarPicker imageDelegate](self, "imageDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__AVTSimpleAvatarPicker_updateCell_withImage_animated___block_invoke;
    v14[3] = &unk_1EA5202A8;
    v15 = v8;
    v16 = v11;
    v17 = v5;
    v13 = v11;
    objc_msgSend(v12, "viewWillUpdateWithImage:completion:", v9, v14);

  }
  else
  {
    objc_msgSend(v8, "updateWithImage:animated:", v9, v5);
  }

}

void __55__AVTSimpleAvatarPicker_updateCell_withImage_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displaySessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
    objc_msgSend(*(id *)(a1 + 32), "updateWithImage:animated:", v5, *(unsigned __int8 *)(a1 + 48));

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

- (BOOL)allowEditing
{
  return self->_allowEditing;
}

- (double)minimumInteritemSpacing
{
  return self->_minimumInteritemSpacing;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (AVTStickerViewControllerImageDelegate)imageDelegate
{
  return (AVTStickerViewControllerImageDelegate *)objc_loadWeakRetained((id *)&self->_imageDelegate);
}

- (void)setImageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_imageDelegate, a3);
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (BOOL)shouldReverseNaturalLayout
{
  return self->_shouldReverseNaturalLayout;
}

- (void)setShouldReverseNaturalLayout:(BOOL)a3
{
  self->_shouldReverseNaturalLayout = a3;
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

- (AVTEdgeDisappearingCollectionViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (AVTAvatarPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (AVTImageStore)imageStore
{
  return self->_imageStore;
}

- (void)setImageStore:(id)a3
{
  objc_storeStrong((id *)&self->_imageStore, a3);
}

- (NSMutableDictionary)itemsToTasksMap
{
  return self->_itemsToTasksMap;
}

- (void)setItemsToTasksMap:(id)a3
{
  objc_storeStrong((id *)&self->_itemsToTasksMap, a3);
}

- (AVTStickerTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (_AVTAvatarRecordImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (AVTViewSessionProvider)viewSessionProvider
{
  return self->_viewSessionProvider;
}

- (AVTRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (AVTSimpleAvatarPickerHeaderView)headerView
{
  return (AVTSimpleAvatarPickerHeaderView *)objc_loadWeakRetained((id *)&self->_headerView);
}

- (void)setHeaderView:(id)a3
{
  objc_storeWeak((id *)&self->_headerView, a3);
}

- (BOOL)doesDisplayEditIconWhenAvailable
{
  return self->_doesDisplayEditIconWhenAvailable;
}

- (void)setDoesDisplayEditIconWhenAvailable:(BOOL)a3
{
  self->_doesDisplayEditIconWhenAvailable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_headerView);
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_storeStrong((id *)&self->_viewSessionProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_itemsToTasksMap, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_imageDelegate);
  objc_destroyWeak((id *)&self->avatarPickerDelegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end
