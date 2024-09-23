@implementation AVTStickerRecentsViewController

+ (id)layoutForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  AVTStickerRecentsLayout *v10;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  AVTStickerRecentsLayout *v17;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CEA6D8], "emojiGraphicsTraitsForCurrentScreenTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumInteritemSpacing");
  v7 = v6;
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v10 = [AVTStickerRecentsLayout alloc];
  if (height == v9 && width == v8 || height < width)
  {
    v13 = 4;
    v14 = 2;
    v15 = v7;
    v16 = 7;
  }
  else
  {
    v13 = 3;
    v14 = 3;
    v15 = v7;
    v16 = 8;
  }
  v17 = -[AVTStickerRecentsLayout initWithNumberOfItemsPerRow:numberOfItemsPerColumn:interitemPadding:appButtonIndex:laysOutVertically:](v10, "initWithNumberOfItemsPerRow:numberOfItemsPerColumn:interitemPadding:appButtonIndex:laysOutVertically:", v13, v14, v16, 1, v15);

  return v17;
}

+ (id)stickerForRecentItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CC6950]);
    objc_msgSend(v3, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "initWithContentsOfFileURL:localizedDescription:error:", v6, v7, 0);

  }
  return v4;
}

+ (id)stickerCacheWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  AVTInMemoryResourceCache *v6;
  void *v7;
  void *v8;
  AVTPassThroughResourceCache *v9;

  v3 = a3;
  if (!AVTUIStickersCaching() || AVTUIFlushStickersCache())
  {
    objc_msgSend(v3, "stickerImageStoreLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v4, v5);

    AVTUISetFlushStickersCache();
  }
  if ((AVTUIStickersCaching() & 1) != 0)
  {
    v6 = [AVTInMemoryResourceCache alloc];
    objc_msgSend(v3, "lockProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AVTInMemoryResourceCache initWithLockProvider:totalCostLimit:logger:](v6, "initWithLockProvider:totalCostLimit:logger:", v7, 980000, v8);

  }
  else
  {
    v9 = objc_alloc_init(AVTPassThroughResourceCache);
  }

  return v9;
}

+ (id)imageStoreWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  AVTClippableImageStore *v7;
  void *v8;
  void *v9;
  AVTClippableImageStore *v10;

  v3 = a3;
  if (!AVTUIStickersCaching() || AVTUIFlushStickersCache())
  {
    objc_msgSend(v3, "stickerImageStoreLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v4, v5);

    AVTUISetFlushStickersCache();
  }
  +[AVTUIStickerRenderer imageEncoder](AVTUIStickerRenderer, "imageEncoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [AVTClippableImageStore alloc];
  objc_msgSend(v3, "coreEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stickerImageStoreLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AVTImageStore initWithEnvironment:validateImages:location:encoder:](v7, "initWithEnvironment:validateImages:location:encoder:", v8, 1, v9, v6);

  return v10;
}

+ (id)stickerRecentsController
{
  void *v3;
  id v4;
  AVTAvatarStore *v5;
  void *v6;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc((Class)a1);
  v5 = objc_alloc_init(AVTAvatarStore);
  v6 = (void *)objc_msgSend(v4, "initWithAvatarStore:environment:", v5, v3);

  return v6;
}

+ (id)stickerRecentsControllerForStore:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAvatarStore:environment:", v4, v6);

  return v7;
}

- (AVTStickerRecentsViewController)initWithAvatarStore:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  AVTStickerRecentsViewController *v9;
  AVTStickerRecentsButtonItem *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  AVTStickerRecentsItem *buttonItem;
  uint64_t v15;
  AVTStickerRecentsLayout *stickerRecentsLayout;
  uint64_t v17;
  AVTClippableImageStore *imageStore;
  id v19;
  uint64_t v20;
  NSArray *stickerItems;
  int v22;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)AVTStickerRecentsViewController;
  v9 = -[AVTStickerRecentsViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
  if (v9)
  {
    v10 = [AVTStickerRecentsButtonItem alloc];
    AVTAvatarUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("STICKER_RECENTS_BUTTON_TITLE"), &stru_1EA5207B8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AVTStickerRecentsButtonItem initWithLocalizedDescription:](v10, "initWithLocalizedDescription:", v12);
    buttonItem = v9->_buttonItem;
    v9->_buttonItem = (AVTStickerRecentsItem *)v13;

    objc_storeStrong((id *)&v9->_environment, a4);
    objc_msgSend((id)objc_opt_class(), "layoutForSize:", 50.0, 50.0);
    v15 = objc_claimAutoreleasedReturnValue();
    stickerRecentsLayout = v9->_stickerRecentsLayout;
    v9->_stickerRecentsLayout = (AVTStickerRecentsLayout *)v15;

    objc_msgSend((id)objc_opt_class(), "imageStoreWithEnvironment:", v9->_environment);
    v17 = objc_claimAutoreleasedReturnValue();
    imageStore = v9->_imageStore;
    v9->_imageStore = (AVTClippableImageStore *)v17;

    if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1F03E3D60) & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object protocol for %@"), v7);
    v19 = v7;
    objc_msgSend(v19, "setStickerBackendDelegate:", v9);
    objc_storeStrong((id *)&v9->_avatarStore, a3);
    -[AVTStickerRecentsViewController placeholderItems](v9, "placeholderItems");
    v20 = objc_claimAutoreleasedReturnValue();
    stickerItems = v9->_stickerItems;
    v9->_stickerItems = (NSArray *)v20;

    -[AVTStickerRecentsViewController updateDisplayItems](v9, "updateDisplayItems");
    v22 = AVTUIShowPrereleaseStickerPack_once();
    if (v22)
      LOBYTE(v22) = AVTUIShowPrereleaseStickerLabel_once();
    v9->_showPrereleaseSticker = v22;

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  NSObject *avatarStoreChangeObserver;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_avatarStoreChangeObserver);

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVTStickerRecentsViewController;
  -[AVTStickerRecentsViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UICollectionViewFlowLayout *v5;
  UICollectionViewFlowLayout *collectionViewLayout;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  UICollectionView *v16;
  UICollectionView *collectionView;
  void *v18;
  void *v19;
  UICollectionView *v20;
  uint64_t v21;
  void *v22;
  UICollectionView *v23;
  uint64_t v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  OS_dispatch_queue *v27;
  OS_dispatch_queue *recentsWorkQueue;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)AVTStickerRecentsViewController;
  -[AVTStickerRecentsViewController viewDidLoad](&v33, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecentsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E0CEA450]);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v5;

  v7 = (double)-[AVTStickerRecentsLayout interitemPadding](self->_stickerRecentsLayout, "interitemPadding");
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_collectionViewLayout, "setMinimumLineSpacing:", v7);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_collectionViewLayout, "setMinimumInteritemSpacing:", v7);
  -[AVTStickerRecentsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  -[AVTStickerRecentsViewController updateItemSizeForContainerSize:](self, "updateItemSizeForContainerSize:", v9, v10);

  -[AVTStickerRecentsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  -[AVTStickerRecentsViewController edgeInsetsForContainerSize:](self, "edgeInsetsForContainerSize:", v12, v13);
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:");

  v14 = objc_alloc(MEMORY[0x1E0CEA410]);
  -[AVTStickerRecentsViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v16 = (UICollectionView *)objc_msgSend(v14, "initWithFrame:collectionViewLayout:", self->_collectionViewLayout);
  collectionView = self->_collectionView;
  self->_collectionView = v16;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v18);

  -[UICollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", 0);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[AVTStickerRecentsViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_collectionView);

  v20 = self->_collectionView;
  v21 = objc_opt_class();
  +[AVTStickerRecentsStickerCollectionViewCell identifier](AVTStickerRecentsStickerCollectionViewCell, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v20, "registerClass:forCellWithReuseIdentifier:", v21, v22);

  v23 = self->_collectionView;
  v24 = objc_opt_class();
  +[AVTStickerRecentsButtonCollectionViewCell identifier](AVTStickerRecentsButtonCollectionViewCell, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v23, "registerClass:forCellWithReuseIdentifier:", v24, v25);

  -[AVTUIEnvironment serialQueueProvider](self->_environment, "serialQueueProvider");
  v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const char *))v26)[2](v26, "com.apple.AvatarUI.StickerRecentsWorkQueue");
  v27 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  recentsWorkQueue = self->_recentsWorkQueue;
  self->_recentsWorkQueue = v27;

  objc_initWeak(&location, self);
  v29 = self->_recentsWorkQueue;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke;
  v30[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v31, &location);
  dispatch_async(v29, v30);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke_2;
  v6[3] = &unk_1EA51DB18;
  objc_copyWeak(&v7, v1);
  objc_msgSend(WeakRetained, "determineOverlayTypeWithCompletionBlock:", v6);
  objc_msgSend(WeakRetained, "setupRenderingDependentPieces");
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke_3;
  v4[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v5, v1);
  objc_msgSend(WeakRetained, "buildRecentsItemsWithCompletionBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);

}

void __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;

  if (a2)
  {
    v2 = (id *)(a1 + 32);
    v3 = a2;
    WeakRetained = objc_loadWeakRetained(v2);
    v4 = objc_msgSend(v3, "integerValue");

    if (v4 == 1)
    {
      +[AVTStickerRecentsOverlayView overlayViewForMemojiCreation](AVTStickerRecentsOverlayView, "overlayViewForMemojiCreation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4 == 2)
        +[AVTStickerRecentsOverlayView disclosureOverlayView](AVTStickerRecentsOverlayView, "disclosureOverlayView");
      else
        +[AVTStickerRecentsOverlayView standardOverlayView](AVTStickerRecentsOverlayView, "standardOverlayView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    objc_msgSend(v5, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v6, "setFrame:");

    objc_msgSend(v6, "setAutoresizingMask:", 18);
    objc_msgSend(WeakRetained, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v6);

    objc_msgSend(WeakRetained, "setOverlayView:", v6);
    objc_msgSend(WeakRetained, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 0.25);
    v10 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(v10, "setShadowRadius:", 10.0);
    LODWORD(v11) = 1.0;
    objc_msgSend(v10, "setShadowOpacity:", v11);
    objc_msgSend(v10, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setShadowColor:", objc_msgSend(v12, "CGColor"));

    objc_msgSend(WeakRetained, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMask:", v10);

    objc_msgSend(WeakRetained, "setEdgeMaskLayer:", v10);
  }
}

void __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke_4;
  block[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "beginObservingAvatarStoreChanges");
  objc_msgSend(WeakRetained, "collectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTStickerRecentsViewController;
  -[AVTStickerRecentsViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  kdebug_trace();
  if (perfLog_onceToken != -1)
    dispatch_once(&perfLog_onceToken, &__block_literal_global_8);
  v3 = perfLog_log;
  if (os_signpost_enabled((os_log_t)perfLog_log))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DC9A6000, v3, OS_SIGNPOST_INTERVAL_END, 0x33uLL, "recents-bringup", "enableTelemetry=YES", v7, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("com.apple.paddlefish.shouldNotifyOnAppear"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("PaddlefishRecentsViewDidAppear"), 0, 0, 1);

  }
}

- (void)setupRenderingDependentPieces
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *renderingQueue;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *encodingQueue;
  AVTResourceCache *v7;
  AVTResourceCache *cache;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  AVTStickerConfigurationProvider *v14;
  AVTStickerConfigurationProvider *configurationProvider;
  AVTStickerRecentsMigrator *v16;
  AVTStickerRecentsMigrator *stickerRecentsMigrator;
  void *v18;
  AVTSerialTaskScheduler *v19;
  AVTSerialTaskScheduler *taskScheduler;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[AVTUIEnvironment backgroundRenderingQueue](self->_environment, "backgroundRenderingQueue");
  v3 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  renderingQueue = self->_renderingQueue;
  self->_renderingQueue = v3;

  -[AVTUIEnvironment backgroundEncodingQueue](self->_environment, "backgroundEncodingQueue");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  encodingQueue = self->_encodingQueue;
  self->_encodingQueue = v5;

  objc_msgSend((id)objc_opt_class(), "stickerCacheWithEnvironment:", self->_environment);
  v7 = (AVTResourceCache *)objc_claimAutoreleasedReturnValue();
  cache = self->_cache;
  self->_cache = v7;

  if ((AVTUIShowPrereleaseStickerPack_once() & 1) != 0)
  {
    v9 = *MEMORY[0x1E0D006D0];
    v22 = *MEMORY[0x1E0D006B0];
    v23 = v9;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v22;
    v12 = 2;
  }
  else
  {
    v21 = *MEMORY[0x1E0D006B0];
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v21;
    v12 = 1;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v21, v22, v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AVTStickerConfigurationProvider initWithEnvironment:forStickerPacks:stickerConfigurationNames:]([AVTStickerConfigurationProvider alloc], "initWithEnvironment:forStickerPacks:stickerConfigurationNames:", self->_environment, v13, 0);
  configurationProvider = self->_configurationProvider;
  self->_configurationProvider = v14;

  v16 = -[AVTStickerRecentsMigrator initWithStore:stickerConfigurationProvider:environment:]([AVTStickerRecentsMigrator alloc], "initWithStore:stickerConfigurationProvider:environment:", self->_avatarStore, self->_configurationProvider, self->_environment);
  stickerRecentsMigrator = self->_stickerRecentsMigrator;
  self->_stickerRecentsMigrator = v16;

  -[AVTUIEnvironment coreEnvironment](self->_environment, "coreEnvironment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTSerialTaskScheduler fifoSchedulerWithEnvironment:](AVTSerialTaskScheduler, "fifoSchedulerWithEnvironment:", v18);
  v19 = (AVTSerialTaskScheduler *)objc_claimAutoreleasedReturnValue();
  taskScheduler = self->_taskScheduler;
  self->_taskScheduler = v19;

}

- (void)beginObservingAvatarStoreChanges
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *avatarStoreChangeObserver;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D006D8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke;
  v7[3] = &unk_1EA51DB40;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7);
  v5 = objc_claimAutoreleasedReturnValue();
  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "recentsWorkQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke_2;
  block[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v5, v1);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHasFetchedDefaultMemoji:", 0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke_3;
  v3[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "buildRecentsItemsWithCompletionBlock:", v3);
  objc_destroyWeak(&v4);

}

void __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke_4;
  block[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)endObservingAvatarStoreChanges
{
  void *v3;
  NSObject *avatarStoreChangeObserver;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_avatarStoreChangeObserver);

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

}

- (void)fetchDefaultMemojiIfNeeded
{
  void *v3;
  AVTAvatarStoreInternal *avatarStore;
  void *v5;
  id v6;
  AVTAvatarRecord *v7;
  AVTAvatarRecord *defaultMemoji;
  id v9;

  if (!self->_hasFetchedDefaultMemoji)
  {
    objc_msgSend(MEMORY[0x1E0D00840], "requestForCustomAvatarsWithLimit:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    avatarStore = self->_avatarStore;
    v9 = 0;
    -[AVTAvatarStoreInternal avatarsForFetchRequest:error:](avatarStore, "avatarsForFetchRequest:error:", v3, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    objc_msgSend(v5, "firstObject");
    v7 = (AVTAvatarRecord *)objc_claimAutoreleasedReturnValue();
    defaultMemoji = self->_defaultMemoji;
    self->_defaultMemoji = v7;

    self->_hasFetchedDefaultMemoji = 1;
  }
}

- (void)determineOverlayTypeWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  if ((AVTUIStickerRecentsShowDisclosureWarning() & 1) != 0)
  {
    v5 = &unk_1EA5715D8;
  }
  else if (AVTUIHasShownStickerRecentsSplashView()
         && !AVTUIAlwaysShowRecentStickersSplashScreen_once())
  {
    v5 = 0;
  }
  else
  {
    v5 = &unk_1EA5715F0;
    if ((AVTUIForceNoMemojiRecentStickersSplashScreen_once() & 1) == 0)
    {
      -[AVTStickerRecentsViewController fetchDefaultMemojiIfNeeded](self, "fetchDefaultMemojiIfNeeded");
      if (self->_defaultMemoji)
        v5 = &unk_1EA571608;
    }
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__AVTStickerRecentsViewController_determineOverlayTypeWithCompletionBlock___block_invoke;
  v7[3] = &unk_1EA51D058;
  v8 = v5;
  v9 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __75__AVTStickerRecentsViewController_determineOverlayTypeWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)placeholderItems
{
  void *v3;
  int64_t v4;
  AVTStickerRecentsPlaceholderItem *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[AVTStickerRecentsLayout numberOfItems](self->_stickerRecentsLayout, "numberOfItems") - 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVTStickerRecentsLayout numberOfItems](self->_stickerRecentsLayout, "numberOfItems") >= 2)
  {
    v4 = 0;
    do
    {
      v5 = objc_alloc_init(AVTStickerRecentsPlaceholderItem);
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[AVTStickerRecentsLayout numberOfItems](self->_stickerRecentsLayout, "numberOfItems") - 1);
  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (void)buildRecentsItemsWithCompletionBlock:(id)a3
{
  AVTUIStickerGeneratorPool *v4;
  void *v5;
  AVTUIStickerGeneratorPool *v6;
  AVTUIStickerGeneratorPool *generatorPool;
  uint64_t v8;
  void *v9;
  AVTAvatarStoreInternal *avatarStore;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AVTStickerConfigurationProvider *configurationProvider;
  void *v19;
  void *v20;
  AVTUIStickerRenderer *v21;
  AVTUIStickerGeneratorPool *v22;
  AVTUIEnvironment *environment;
  AVTSerialTaskScheduler *taskScheduler;
  OS_dispatch_queue *renderingQueue;
  void *v26;
  OS_dispatch_queue *encodingQueue;
  id v28;
  void *v29;
  AVTUIStickerRenderer *v30;
  void *v31;
  AVTStickerRecentsStickerItem *v32;
  void *v33;
  void *v34;
  void *v35;
  AVTStickerRecentsStickerItem *v36;
  NSArray *v37;
  NSArray *stickerItems;
  void *v39;
  void *v40;
  OS_dispatch_queue *v41;
  id v42;
  void (**v43)(void);
  void *v44;
  unint64_t v45;
  void *v46;
  AVTClippableImageStore *imageStore;
  AVTResourceCache *cache;
  _QWORD v49[6];
  _QWORD v50[6];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  v43 = (void (**)(void))a3;
  -[AVTStickerRecentsMigrator performMigrationIfNeeded](self->_stickerRecentsMigrator, "performMigrationIfNeeded");
  -[AVTStickerRecentsViewController fetchDefaultMemojiIfNeeded](self, "fetchDefaultMemojiIfNeeded");
  if (!self->_generatorPool)
  {
    v4 = [AVTUIStickerGeneratorPool alloc];
    -[AVTUIEnvironment logger](self->_environment, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AVTUIStickerGeneratorPool initWithMaxStickerGeneratorCount:logger:](v4, "initWithMaxStickerGeneratorCount:logger:", 1, v5);
    generatorPool = self->_generatorPool;
    self->_generatorPool = v6;

  }
  -[AVTStickerRecentsViewController recentStickersWithCount:](self, "recentStickersWithCount:", 8);
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__4;
  v61 = __Block_byref_object_dispose__4;
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v62 = v42;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__4;
  v55 = __Block_byref_object_dispose__4;
  v56 = 0;
  v8 = v58[5];
  -[AVTAvatarRecord identifier](self->_defaultMemoji, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  avatarStore = self->_avatarStore;
  v11 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __72__AVTStickerRecentsViewController_buildRecentsItemsWithCompletionBlock___block_invoke;
  v50[3] = &unk_1EA51DB68;
  v50[4] = &v57;
  v50[5] = &v51;
  +[AVTStickerRecentsPresetsProvider filteredAndPaddedStickerRecordsWithRecents:excludingRecords:paddingMemojiIdentifier:avatarStore:numberOfStickers:resultBlock:](AVTStickerRecentsPresetsProvider, "filteredAndPaddedStickerRecordsWithRecents:excludingRecords:paddingMemojiIdentifier:avatarStore:numberOfStickers:resultBlock:", v8, 0, v9, avatarStore, 8, v50);

  v49[0] = v11;
  v49[1] = 3221225472;
  v49[2] = __72__AVTStickerRecentsViewController_buildRecentsItemsWithCompletionBlock___block_invoke_2;
  v49[3] = &unk_1EA51DB90;
  v49[4] = self;
  v49[5] = &v57;
  objc_msgSend(v42, "enumerateObjectsUsingBlock:", v49);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = (void *)MEMORY[0x1E0C80D38];
  do
  {
    if (v12 >= objc_msgSend((id)v58[5], "count"))
      break;
    objc_msgSend((id)v58[5], "objectAtIndexedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)v52[5];
    objc_msgSend(v14, "avatarRecordIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    configurationProvider = self->_configurationProvider;
    objc_msgSend(v14, "stickerConfigurationIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerConfigurationProvider stickerConfigurationForAvatarRecord:stickerName:](configurationProvider, "stickerConfigurationForAvatarRecord:stickerName:", v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      -[AVTStickerRecentsMigrator setNeedsMigrationOnNextLaunch](self->_stickerRecentsMigrator, "setNeedsMigrationOnNextLaunch");
      -[AVTUIEnvironment logger](self->_environment, "logger");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "description");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "logFetchedRecentStickerWithNoStickerConfiguration:", v40);

      goto LABEL_10;
    }
    v45 = v12;
    v46 = v14;
    v21 = [AVTUIStickerRenderer alloc];
    imageStore = self->_imageStore;
    cache = self->_cache;
    v22 = self->_generatorPool;
    environment = self->_environment;
    taskScheduler = self->_taskScheduler;
    renderingQueue = self->_renderingQueue;
    v26 = v17;
    encodingQueue = self->_encodingQueue;
    v28 = v13;
    v41 = encodingQueue;
    v29 = v26;
    v30 = -[AVTUIStickerRenderer initWithAvatarRecord:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:](v21, "initWithAvatarRecord:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:", v26, cache, imageStore, v22, environment, taskScheduler, renderingQueue, v41, v13);

    -[AVTUIStickerRenderer scheduledStickerResourceProviderForStickerConfiguration:](v30, "scheduledStickerResourceProviderForStickerConfiguration:", v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = [AVTStickerRecentsStickerItem alloc];
    objc_msgSend(v26, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[AVTStickerRecentsStickerItem initWithAvatarIdentifier:stickerName:localizedName:stickerProvider:](v32, "initWithAvatarIdentifier:stickerName:localizedName:stickerProvider:", v33, v34, v35, v31);

    objc_msgSend(v44, "addObject:", v36);
    v12 = v45 + 1;
  }
  while (v45 != 7);
  v37 = (NSArray *)objc_msgSend(v44, "copy");
  stickerItems = self->_stickerItems;
  self->_stickerItems = v37;

  -[AVTStickerRecentsViewController updateDisplayItems](self, "updateDisplayItems");
  if (v43)
    v43[2]();
LABEL_10:

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

}

void __72__AVTStickerRecentsViewController_buildRecentsItemsWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __72__AVTStickerRecentsViewController_buildRecentsItemsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setNeedsMigrationOnNextLaunch");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logFetchedOrphanedRecentSticker:", v7);

    *a4 = 1;
  }

}

- (void)updateDisplayItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *displayItems;
  NSArray *v18;
  NSArray *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  NSArray *v29;
  void *v30;
  _QWORD v31[8];
  _QWORD v32[11];

  v32[9] = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_stickerItems, "count"))
  {
    -[AVTStickerRecentsViewController stickerRecentsLayout](self, "stickerRecentsLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "numberOfItems");

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 >= 1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (i == -[AVTStickerRecentsLayout appButtonIndex](self->_stickerRecentsLayout, "appButtonIndex"))
        {
          objc_msgSend(v5, "addObject:", self->_buttonItem);
        }
        else
        {
          -[NSArray objectAtIndexedSubscript:](self->_stickerItems, "objectAtIndexedSubscript:", i - (i >= -[AVTStickerRecentsLayout appButtonIndex](self->_stickerRecentsLayout, "appButtonIndex")));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v7);

        }
      }
    }
    if (-[AVTStickerRecentsLayout laysOutVertically](self->_stickerRecentsLayout, "laysOutVertically"))
    {
      if (-[AVTStickerRecentsLayout numberOfItemsPerRow](self->_stickerRecentsLayout, "numberOfItemsPerRow") == 3
        && -[AVTStickerRecentsLayout numberOfItemsPerColumn](self->_stickerRecentsLayout, "numberOfItemsPerColumn") == 3)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v30;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v8;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2] = v9;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v32[3] = v10;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v32[4] = v11;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v32[5] = v12;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v32[6] = v13;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v32[7] = v14;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32[8] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 9);
        v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
        displayItems = self->_displayItems;
        self->_displayItems = v16;

      }
      else
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v20;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v21;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v31[2] = v22;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31[3] = v23;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v31[4] = v24;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31[5] = v25;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 5);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31[6] = v26;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 7);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v31[7] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 8);
        v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v29 = self->_displayItems;
        self->_displayItems = v28;

      }
    }
    else
    {
      v18 = (NSArray *)objc_msgSend(v5, "copy");
      v19 = self->_displayItems;
      self->_displayItems = v18;

    }
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVTStickerRecentsViewController;
  -[AVTStickerRecentsViewController viewWillLayoutSubviews](&v16, sel_viewWillLayoutSubviews);
  v3 = (void *)objc_opt_class();
  -[AVTStickerRecentsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "layoutForSize:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqual:", self->_stickerRecentsLayout) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_stickerRecentsLayout, v7);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_collectionViewLayout, "setMinimumLineSpacing:", (double)objc_msgSend(v7, "interitemPadding"));
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_collectionViewLayout, "setMinimumInteritemSpacing:", (double)objc_msgSend(v7, "interitemPadding"));
    -[AVTStickerRecentsViewController updateDisplayItems](self, "updateDisplayItems");
    -[AVTStickerRecentsViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
  -[AVTStickerRecentsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  -[AVTStickerRecentsViewController updateItemSizeForContainerSize:](self, "updateItemSizeForContainerSize:", v10, v11);

  -[UICollectionViewFlowLayout invalidateLayout](self->_collectionViewLayout, "invalidateLayout");
  -[AVTStickerRecentsViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");

  -[AVTStickerRecentsViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  -[AVTStickerRecentsViewController edgeInsetsForContainerSize:](self, "edgeInsetsForContainerSize:", v14, v15);
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:");

}

- (void)viewDidLayoutSubviews
{
  double v3;
  CGFloat v4;
  CGPathRef v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  if (self->_edgeMaskLayer)
  {
    -[UICollectionView bounds](self->_collectionView, "bounds");
    v8 = CGRectInset(v7, 10.0, 10.0);
    -[CALayer setFrame:](self->_edgeMaskLayer, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
    -[CALayer shadowRadius](self->_edgeMaskLayer, "shadowRadius");
    v4 = v3;
    -[CALayer bounds](self->_edgeMaskLayer, "bounds");
    v10 = CGRectInset(v9, v4, v4);
    v5 = CGPathCreateWithRect(v10, 0);
    -[CALayer setShadowPath:](self->_edgeMaskLayer, "setShadowPath:", v5);
    CFRelease(v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVTStickerRecentsViewController;
  -[AVTStickerRecentsViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTStickerRecentsViewController;
  v4 = a3;
  -[AVTStickerRecentsViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v9.receiver, v9.super_class);

  -[AVTStickerRecentsViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    -[AVTStickerRecentsViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
}

- (id)recentStickersWithCount:(int64_t)a3
{
  void *v4;
  AVTAvatarStoreInternal *avatarStore;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  objc_msgSend(MEMORY[0x1E0D00880], "requestForMostRecentStickersWithResultLimit:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  avatarStore = self->_avatarStore;
  v11 = 0;
  -[AVTAvatarStoreInternal recentStickersForFetchRequest:error:](avatarStore, "recentStickersForFetchRequest:error:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v7)
  {
    -[AVTUIEnvironment logger](self->_environment, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logErrorFetchingRecentStickers:", v9);

  }
  return v6;
}

- (void)dismissOverlayViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  UICollectionView *v5;
  AVTStickerRecentsOverlayView *v6;
  CALayer *v7;
  AVTStickerRecentsOverlayView *overlayView;
  CALayer *edgeMaskLayer;
  double v10;
  double v11;
  CGPathRef v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  AVTStickerRecentsOverlayView *v17;
  CALayer *v18;
  _QWORD v19[4];
  UICollectionView *v20;
  CGRect v21;
  CGRect v22;

  v3 = a3;
  if ((AVTUIHasShownStickerRecentsSplashView() & 1) == 0)
    AVTUISetHasShownStickerRecentsSplashView();
  v5 = self->_collectionView;
  v6 = self->_overlayView;
  v7 = self->_edgeMaskLayer;
  overlayView = self->_overlayView;
  self->_overlayView = 0;

  edgeMaskLayer = self->_edgeMaskLayer;
  self->_edgeMaskLayer = 0;

  if (v3)
  {
    -[CALayer shadowRadius](v7, "shadowRadius");
    v11 = v10;
    -[CALayer bounds](v7, "bounds");
    v22 = CGRectInset(v21, -v11, -v11);
    v12 = CGPathCreateWithRect(v22, 0);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowPath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFromValue:", -[CALayer shadowPath](v7, "shadowPath"));
    objc_msgSend(v13, "setToValue:", v12);
    CFRelease(v12);
    objc_msgSend(v13, "setDuration:", 1.0);
    objc_msgSend(v13, "setRemovedOnCompletion:", 0);
    objc_msgSend(v13, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    -[CALayer addAnimation:forKey:](v7, "addAnimation:forKey:", v13, CFSTR("fadeAnimation"));
    -[AVTStickerRecentsOverlayView dismissAnimatedWithDuration:](v6, "dismissAnimatedWithDuration:", 1.0);
    v14 = (void *)MEMORY[0x1E0CEABB0];
    v15 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__AVTStickerRecentsViewController_dismissOverlayViewAnimated___block_invoke;
    v19[3] = &unk_1EA51D188;
    v20 = v5;
    v16[0] = v15;
    v16[1] = 3221225472;
    v16[2] = __62__AVTStickerRecentsViewController_dismissOverlayViewAnimated___block_invoke_2;
    v16[3] = &unk_1EA51D228;
    v17 = v6;
    v18 = v7;
    objc_msgSend(v14, "animateWithDuration:animations:completion:", v19, v16, 1.0);

  }
  else
  {
    -[UICollectionView setAlpha:](v5, "setAlpha:", 1.0);
    -[AVTStickerRecentsOverlayView removeFromSuperview](v6, "removeFromSuperview");
    -[CALayer removeFromSuperlayer](v7, "removeFromSuperlayer");
  }

}

uint64_t __62__AVTStickerRecentsViewController_dismissOverlayViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __62__AVTStickerRecentsViewController_dismissOverlayViewAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperlayer");
}

- (void)updateItemSizeForContainerSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  if (a3.width != 0.0)
  {
    height = a3.height;
    if (a3.height != 0.0)
    {
      width = a3.width;
      v6 = -[AVTStickerRecentsLayout numberOfItemsPerRow](self->_stickerRecentsLayout, "numberOfItemsPerRow");
      v7 = -[AVTStickerRecentsLayout numberOfItemsPerColumn](self->_stickerRecentsLayout, "numberOfItemsPerColumn");
      v8 = -[AVTStickerRecentsLayout interitemPadding](self->_stickerRecentsLayout, "interitemPadding");
      v9 = floor((width - (double)v8 * (double)(v6 - 1)) / (double)v6);
      v10 = floor((height - (double)v8 * (double)(v7 - 1)) / (double)v7);
      if (v10 >= v9)
        v10 = v9;
      -[UICollectionViewFlowLayout setItemSize:](self->_collectionViewLayout, "setItemSize:", v10, v10);
    }
  }
}

- (UIEdgeInsets)edgeInsetsForContainerSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  if (a3.width == 0.0 || (height = a3.height, a3.height == 0.0))
  {
    v14 = *MEMORY[0x1E0CEB4B0];
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v15 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v16 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  else
  {
    width = a3.width;
    v6 = -[AVTStickerRecentsLayout numberOfItemsPerRow](self->_stickerRecentsLayout, "numberOfItemsPerRow");
    v7 = -[AVTStickerRecentsLayout numberOfItemsPerColumn](self->_stickerRecentsLayout, "numberOfItemsPerColumn");
    v8 = (double)-[AVTStickerRecentsLayout interitemPadding](self->_stickerRecentsLayout, "interitemPadding");
    -[UICollectionViewFlowLayout itemSize](self->_collectionViewLayout, "itemSize");
    v10 = (double)(v6 - 1) * v8 + v9 * (double)v6;
    -[UICollectionViewFlowLayout itemSize](self->_collectionViewLayout, "itemSize");
    v12 = (double)(v7 - 1) * v8 + v11 * (double)v7;
    v13 = fmax(floor((width - v10) * 0.5), 0.0);
    v14 = fmax(floor((height - v12) * 0.5), 0.0);
    v15 = v14;
    v16 = v13;
  }
  result.right = v16;
  result.bottom = v15;
  result.left = v13;
  result.top = v14;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  NSUInteger v5;

  v5 = -[NSArray count](self->_displayItems, "count", a3, a4);
  if (v5 == -[AVTStickerRecentsLayout numberOfItems](self->_stickerRecentsLayout, "numberOfItems"))
    return -[AVTStickerRecentsLayout numberOfItems](self->_stickerRecentsLayout, "numberOfItems");
  else
    return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  NSArray *displayItems;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  AVTStickerRecentsViewController *v26;

  displayItems = self->_displayItems;
  v7 = a4;
  v8 = a3;
  -[NSArray objectAtIndexedSubscript:](displayItems, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisplaySessionUUID:", v12);
  objc_msgSend(v9, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v9, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateWithImage:", v14);

    if (-[AVTStickerRecentsViewController showPrereleaseSticker](self, "showPrereleaseSticker"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v11, "setShowPrereleaseSticker:", objc_msgSend(v9, "isPrereleaseSticker"));
    }
  }
  else
  {
    objc_msgSend(v9, "provider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v9, "provider");
      v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __73__AVTStickerRecentsViewController_collectionView_cellForItemAtIndexPath___block_invoke;
      v22 = &unk_1EA51DBB8;
      v23 = v11;
      v24 = v12;
      v25 = v9;
      v26 = self;
      ((void (**)(_QWORD, uint64_t *, _QWORD))v16)[2](v16, &v19, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        -[AVTSerialTaskScheduler scheduleTask:](self->_taskScheduler, "scheduleTask:", v17, v19, v20, v21, v22, v23, v24);

    }
  }

  return v11;
}

void __73__AVTStickerRecentsViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displaySessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v9, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateWithImage:", v6);

    objc_msgSend(v9, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setImage:", v7);

    objc_msgSend(v9, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setUrl:", v8);

    if (objc_msgSend(*(id *)(a1 + 56), "showPrereleaseSticker"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "setPrereleaseSticker:", objc_msgSend(v9, "isPrereleaseSticker"));
        objc_msgSend(*(id *)(a1 + 32), "setShowPrereleaseSticker:", objc_msgSend(v9, "isPrereleaseSticker"));
      }
    }
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  AVTStickerRecentsItem *v8;
  AVTUIEnvironment *v9;
  AVTUIEnvironment *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  AVTStickerRecentsItem *v14;
  void *v15;
  void *v16;
  void *v17;
  AVTAvatarStoreInternal *avatarStore;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  AVTUIEnvironment *v23;

  v6 = a3;
  v7 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_displayItems, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v8 = (AVTStickerRecentsItem *)objc_claimAutoreleasedReturnValue();
  v9 = self->_environment;
  v10 = v9;
  if (v8 == self->_buttonItem)
  {
    -[AVTUIEnvironment usageTrackingSession](v9, "usageTrackingSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "didOpenStickersAppFromRecents");

    -[AVTStickerRecentsViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stickerRecentsControllerDidTapAppButton:", self);
    goto LABEL_5;
  }
  objc_msgSend((id)objc_opt_class(), "stickerForRecentItem:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[AVTStickerRecentsViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stickerRecentsController:didTapSticker:", self, v12);

    v14 = v8;
    -[AVTUIEnvironment usageTrackingSession](v10, "usageTrackingSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerRecentsItem stickerName](v14, "stickerName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerRecentsItem avatarIdentifier](v14, "avatarIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didTapStickerFromRecents:withAvatarIdentifier:", v16, v17);

    avatarStore = self->_avatarStore;
    -[AVTStickerRecentsItem avatarIdentifier](v14, "avatarIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerRecentsItem stickerName](v14, "stickerName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__AVTStickerRecentsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v22[3] = &unk_1EA51DBE0;
    v23 = v10;
    -[AVTAvatarStoreInternal didUseStickerWithAvatarIdentifier:stickerIdentifier:completionHandler:](avatarStore, "didUseStickerWithAvatarIdentifier:stickerIdentifier:completionHandler:", v19, v20, v22);

LABEL_5:
    objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 1);
  }

}

void __75__AVTStickerRecentsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, char a2, void *a3)
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

- (void)recentStickersDidChange:(id)a3
{
  NSObject *recentsWorkQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  recentsWorkQueue = self->_recentsWorkQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVTStickerRecentsViewController_recentStickersDidChange___block_invoke;
  v5[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v6, &location);
  dispatch_async(recentsWorkQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __59__AVTStickerRecentsViewController_recentStickersDidChange___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__AVTStickerRecentsViewController_recentStickersDidChange___block_invoke_2;
  v3[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "buildRecentsItemsWithCompletionBlock:", v3);
  objc_destroyWeak(&v4);

}

void __59__AVTStickerRecentsViewController_recentStickersDidChange___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVTStickerRecentsViewController_recentStickersDidChange___block_invoke_3;
  block[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __59__AVTStickerRecentsViewController_recentStickersDidChange___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)overlayDidTapContentView:(id)a3
{
  -[AVTStickerRecentsViewController dismissOverlayViewAnimated:](self, "dismissOverlayViewAnimated:", 1);
}

- (void)overlayDidTapCloseButton:(id)a3
{
  -[AVTStickerRecentsViewController dismissOverlayViewAnimated:](self, "dismissOverlayViewAnimated:", 1);
}

- (void)overlayDidTapContinueButton:(id)a3
{
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];

  -[AVTStickerRecentsViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerRecentsControllerDidRequestMemojiEditor:", self);

  v5 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVTStickerRecentsViewController_overlayDidTapContinueButton___block_invoke;
  block[3] = &unk_1EA51D188;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
}

uint64_t __63__AVTStickerRecentsViewController_overlayDidTapContinueButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissOverlayViewAnimated:", 0);
}

- (AVTStickerRecentsViewControllerDelegate)delegate
{
  return (AVTStickerRecentsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTStickerRecentsMigrator)stickerRecentsMigrator
{
  return self->_stickerRecentsMigrator;
}

- (void)setStickerRecentsMigrator:(id)a3
{
  objc_storeStrong((id *)&self->_stickerRecentsMigrator, a3);
}

- (AVTStickerRecentsOverlayView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (NSObject)avatarStoreChangeObserver
{
  return self->_avatarStoreChangeObserver;
}

- (void)setAvatarStoreChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, a3);
}

- (BOOL)hasFetchedDefaultMemoji
{
  return self->_hasFetchedDefaultMemoji;
}

- (void)setHasFetchedDefaultMemoji:(BOOL)a3
{
  self->_hasFetchedDefaultMemoji = a3;
}

- (AVTAvatarRecord)defaultMemoji
{
  return self->_defaultMemoji;
}

- (void)setDefaultMemoji:(id)a3
{
  objc_storeStrong((id *)&self->_defaultMemoji, a3);
}

- (AVTClippableImageStore)imageStore
{
  return self->_imageStore;
}

- (void)setImageStore:(id)a3
{
  objc_storeStrong((id *)&self->_imageStore, a3);
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (AVTAvatarStoreInternal)avatarStore
{
  return self->_avatarStore;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTResourceCache)cache
{
  return self->_cache;
}

- (AVTStickerGenerator)stickerGenerator
{
  return self->_stickerGenerator;
}

- (OS_dispatch_queue)recentsWorkQueue
{
  return self->_recentsWorkQueue;
}

- (void)setRecentsWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_recentsWorkQueue, a3);
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

- (AVTStickerConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (void)setConfigurationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_configurationProvider, a3);
}

- (AVTSerialTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (void)setTaskScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_taskScheduler, a3);
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
{
  objc_storeStrong((id *)&self->_generatorPool, a3);
}

- (AVTStickerRecentsLayout)stickerRecentsLayout
{
  return self->_stickerRecentsLayout;
}

- (AVTStickerRecentsItem)buttonItem
{
  return self->_buttonItem;
}

- (void)setButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_buttonItem, a3);
}

- (NSArray)stickerItems
{
  return self->_stickerItems;
}

- (void)setStickerItems:(id)a3
{
  objc_storeStrong((id *)&self->_stickerItems, a3);
}

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (void)setDisplayItems:(id)a3
{
  objc_storeStrong((id *)&self->_displayItems, a3);
}

- (BOOL)showPrereleaseSticker
{
  return self->_showPrereleaseSticker;
}

- (void)setShowPrereleaseSticker:(BOOL)a3
{
  self->_showPrereleaseSticker = a3;
}

- (CALayer)edgeMaskLayer
{
  return self->_edgeMaskLayer;
}

- (void)setEdgeMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_edgeMaskLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeMaskLayer, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_stickerItems, 0);
  objc_storeStrong((id *)&self->_buttonItem, 0);
  objc_storeStrong((id *)&self->_stickerRecentsLayout, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_encodingQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_recentsWorkQueue, 0);
  objc_storeStrong((id *)&self->_stickerGenerator, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_defaultMemoji, 0);
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_stickerRecentsMigrator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
