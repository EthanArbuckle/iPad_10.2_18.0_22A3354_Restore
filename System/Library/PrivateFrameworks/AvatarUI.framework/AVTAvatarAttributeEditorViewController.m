@implementation AVTAvatarAttributeEditorViewController

+ (id)colorRowIdentifier
{
  return CFSTR("AVTAttributeCollectionViewCell_Color");
}

+ (id)attributeRowIdentifier
{
  return CFSTR("AVTAttributeValueCollectionViewCell_Attribute");
}

- (AVTAvatarAttributeEditorViewController)init
{
  void *v3;
  AVTViewSessionProvider *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  AVTViewSessionProvider *v10;
  id v11;
  AVTAvatarAttributeEditorViewController *v12;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [AVTViewSessionProvider alloc];
  +[AVTViewSessionProvider backingSizeForEnvironment:](AVTViewSessionProvider, "backingSizeForEnvironment:", v3);
  v6 = v5;
  v8 = v7;
  +[AVTViewSessionProvider creatorForAVTRecordView](AVTViewSessionProvider, "creatorForAVTRecordView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:](v4, "initWithAVTViewBackingSize:viewCreator:environment:", v9, v3, v6, v8);

  v11 = objc_alloc_init(MEMORY[0x1E0D00850]);
  v12 = -[AVTAvatarAttributeEditorViewController initWithAvatarRecord:avtViewSessionProvider:environment:isCreating:](self, "initWithAvatarRecord:avtViewSessionProvider:environment:isCreating:", v11, v10, v3, 1);

  return v12;
}

- (AVTAvatarAttributeEditorViewController)initWithAvatarRecord:(id)a3 avtViewSessionProvider:(id)a4 environment:(id)a5 isCreating:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  AVTAvatarAttributeEditorViewController *v13;
  AVTAvatarAttributeEditorViewController *v14;
  void *v15;
  uint64_t v16;
  AVTTaskScheduler *imageProviderScheduler;
  id v18;
  void *v19;
  AVTPresetResourceLoader *v20;
  uint64_t v21;
  AVTAvatarAttributeEditorPreloader *v22;
  void *v23;
  AVTAvatarAttributeEditorPreloader *v24;
  AVTUIStickerGeneratorPool *v25;
  AVTClippableImageStore *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  AVTUIStickerRenderer *v30;
  BOOL v31;
  void *v32;
  AVTUIStickerRenderer *v33;
  AVTAvatarAttributeEditorModelManager *v34;
  void *v35;
  uint64_t v36;
  AVTAvatarAttributeEditorModelManager *modelManager;
  void *v38;
  AVTAvatarAttributeEditorDataSource *v39;
  uint64_t v40;
  AVTAvatarAttributeEditorDataSource *dataSource;
  void *v42;
  _AVTAvatarRecordImageProvider *v43;
  _AVTAvatarRecordImageProvider *headerPreviewImageRenderer;
  void *v45;
  uint64_t v46;
  AVTTaskScheduler *headerPreviewScheduler;
  AVTColorLayerProvider *v49;
  void *v50;
  AVTUIStickerGeneratorPool *v51;
  void *v52;
  id v53;
  AVTPresetImageProvider *v54;
  objc_super v55;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v55.receiver = self;
  v55.super_class = (Class)AVTAvatarAttributeEditorViewController;
  v13 = -[AVTAvatarAttributeEditorViewController initWithNibName:bundle:](&v55, sel_initWithNibName_bundle_, 0, 0);
  v14 = v13;
  if (v13)
  {
    v53 = v11;
    objc_storeStrong((id *)&v13->_environment, a5);
    objc_storeStrong((id *)&v14->_avtViewSessionProvider, a4);
    objc_msgSend(v12, "coreEnvironment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTSerialTaskScheduler fifoSchedulerWithEnvironment:](AVTSerialTaskScheduler, "fifoSchedulerWithEnvironment:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    imageProviderScheduler = v14->_imageProviderScheduler;
    v14->_imageProviderScheduler = (AVTTaskScheduler *)v16;

    v18 = v10;
    v54 = -[AVTPresetImageProvider initWithRenderingScheduler:environment:]([AVTPresetImageProvider alloc], "initWithRenderingScheduler:environment:", v14->_imageProviderScheduler, v12);
    objc_msgSend(v12, "deviceResourceManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerConsumer:", v54);

    v49 = objc_alloc_init(AVTColorLayerProvider);
    v20 = [AVTPresetResourceLoader alloc];
    v21 = -[AVTPresetResourceLoader initWithEnvironment:renderingScheduler:callbackQueue:](v20, "initWithEnvironment:renderingScheduler:callbackQueue:", v12, v14->_imageProviderScheduler, MEMORY[0x1E0C80D38]);
    v22 = [AVTAvatarAttributeEditorPreloader alloc];
    objc_msgSend(v12, "logger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)v21;
    v24 = -[AVTAvatarAttributeEditorPreloader initWithResourceLoader:logger:](v22, "initWithResourceLoader:logger:", v21, v23);

    v25 = -[AVTUIStickerGeneratorPool initWithMaxStickerGeneratorCount:]([AVTUIStickerGeneratorPool alloc], "initWithMaxStickerGeneratorCount:", 2);
    v26 = [AVTClippableImageStore alloc];
    objc_msgSend(v12, "coreEnvironment");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageCacheStoreLocation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[AVTImageStore initWithEnvironment:validateImages:location:](v26, "initWithEnvironment:validateImages:location:", v27, 0, v28);

    v30 = [AVTUIStickerRenderer alloc];
    objc_msgSend(v12, "editorThumbnailAvatar");
    v31 = a6;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)v29;
    v51 = v25;
    v33 = -[AVTUIStickerRenderer initWithAvatarRecord:avatar:stickerGeneratorPool:scheduler:imageStore:environment:](v30, "initWithAvatarRecord:avatar:stickerGeneratorPool:scheduler:imageStore:environment:", v18, v32, v25, v14->_imageProviderScheduler, v29, v12);

    v34 = [AVTAvatarAttributeEditorModelManager alloc];
    objc_msgSend(v12, "editorCoreModel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v18;
    v36 = -[AVTAvatarAttributeEditorModelManager initWithAvatarRecord:coreModel:imageProvider:colorLayerProvider:preloader:environment:stickerRenderer:](v34, "initWithAvatarRecord:coreModel:imageProvider:colorLayerProvider:preloader:environment:stickerRenderer:", v18, v35, v54, v49, v24, v12, v33);
    modelManager = v14->_modelManager;
    v14->_modelManager = (AVTAvatarAttributeEditorModelManager *)v36;

    if (v31)
    {
      v38 = 0;
    }
    else
    {
      AVTUIEditorMostRecentGroupName();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v39 = [AVTAvatarAttributeEditorDataSource alloc];
    v40 = -[AVTAvatarAttributeEditorDataSource initWithCategories:currentCategoryIdentifier:renderingScheduler:environment:](v39, "initWithCategories:currentCategoryIdentifier:renderingScheduler:environment:", MEMORY[0x1E0C9AA60], v38, v14->_imageProviderScheduler, v12);
    dataSource = v14->_dataSource;
    v14->_dataSource = (AVTAvatarAttributeEditorDataSource *)v40;

    -[AVTAvatarAttributeEditorModelManager setDelegate:](v14->_modelManager, "setDelegate:", v14->_dataSource);
    -[AVTAvatarAttributeEditorModelManager buildUIModel](v14->_modelManager, "buildUIModel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorDataSource reloadWithCategories:currentCategoryIndex:](v14->_dataSource, "reloadWithCategories:currentCategoryIndex:", v42, +[AVTAvatarAttributeEditorDataSource indexForCurrentCategoryGivenPreferredIdentifier:categories:](AVTAvatarAttributeEditorDataSource, "indexForCurrentCategoryGivenPreferredIdentifier:categories:", v38, v42));
    v14->_isCreating = v31;
    v14->_allowFacetracking = AVTUIIsFacetrackingSupported();
    v43 = -[_AVTAvatarRecordImageProvider initWithEnvironment:]([_AVTAvatarRecordImageProvider alloc], "initWithEnvironment:", v12);
    headerPreviewImageRenderer = v14->_headerPreviewImageRenderer;
    v14->_headerPreviewImageRenderer = v43;

    if (!v14->_allowFacetracking)
    {
      objc_msgSend(v12, "coreEnvironment");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTSerialTaskScheduler fifoSchedulerWithEnvironment:](AVTSerialTaskScheduler, "fifoSchedulerWithEnvironment:", v45);
      v46 = objc_claimAutoreleasedReturnValue();
      headerPreviewScheduler = v14->_headerPreviewScheduler;
      v14->_headerPreviewScheduler = (AVTTaskScheduler *)v46;

    }
    v11 = v53;
  }

  return v14;
}

- (AVTAvatarRecord)avatarRecord
{
  void *v2;
  void *v3;

  -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatarRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVTAvatarRecord *)v3;
}

- (AVTMemoji)avatar
{
  void *v2;
  void *v3;

  -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVTMemoji *)v3;
}

- (void)loadView
{
  AVTNotifyingContainerView *v3;
  void *v4;
  AVTNotifyingContainerView *v5;

  v3 = [AVTNotifyingContainerView alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[AVTNotifyingContainerView initWithFrame:](v3, "initWithFrame:");

  -[AVTNotifyingContainerView setDelegate:](v5, "setDelegate:", self);
  -[AVTAvatarAttributeEditorViewController setView:](self, "setView:", v5);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  UIView *v7;
  UIView *attributesContainerView;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIView *v16;
  UIView *sideGroupContainerView;
  void *v18;
  void *v19;
  AVTAvatarAttributeEditorFlowLayout *v20;
  UICollectionView *v21;
  UICollectionView *attributesCollectionView;
  void *v23;
  UICollectionView *v24;
  uint64_t v25;
  void *v26;
  UICollectionView *v27;
  uint64_t v28;
  void *v29;
  UICollectionView *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  UICollectionView *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  UIView *v38;
  UIView *headerMaskingView;
  void *v40;
  AVTShadowView *v41;
  AVTShadowView *shadowView;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)AVTAvatarAttributeEditorViewController;
  -[AVTAvatarAttributeEditorViewController viewDidLoad](&v48, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[AVTAvatarAttributeEditorViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v7 = (UIView *)objc_msgSend(v5, "initWithFrame:");
  attributesContainerView = self->_attributesContainerView;
  self->_attributesContainerView = v7;

  -[UIView setAutoresizingMask:](self->_attributesContainerView, "setAutoresizingMask:", 18);
  +[AVTUIColorRepository editorBackgroundColor](AVTUIColorRepository, "editorBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_attributesContainerView, "setBackgroundColor:", v9);

  -[AVTAvatarAttributeEditorViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_attributesContainerView);

  v11 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16 = (UIView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
  sideGroupContainerView = self->_sideGroupContainerView;
  self->_sideGroupContainerView = v16;

  +[AVTUIColorRepository groupListBackgroundColor](AVTUIColorRepository, "groupListBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_sideGroupContainerView, "setBackgroundColor:", v18);

  -[UIView setClipsToBounds:](self->_sideGroupContainerView, "setClipsToBounds:", 1);
  -[AVTAvatarAttributeEditorViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_sideGroupContainerView);

  v20 = objc_alloc_init(AVTAvatarAttributeEditorFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v20, "setScrollDirection:", 0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v20, "setMinimumLineSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v20, "setMinimumInteritemSpacing:", 0.0);
  v21 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA410]), "initWithFrame:collectionViewLayout:", v20, v12, v13, v14, v15);
  attributesCollectionView = self->_attributesCollectionView;
  self->_attributesCollectionView = v21;

  -[UICollectionView setDataSource:](self->_attributesCollectionView, "setDataSource:", self);
  -[UICollectionView setPrefetchDataSource:](self->_attributesCollectionView, "setPrefetchDataSource:", self);
  -[UICollectionView setDelegate:](self->_attributesCollectionView, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_attributesCollectionView, "setBackgroundColor:", v23);

  v24 = self->_attributesCollectionView;
  v25 = objc_opt_class();
  +[AVTAttributeCollectionViewCell cellIdentifier](AVTAttributeCollectionViewCell, "cellIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v24, "registerClass:forCellWithReuseIdentifier:", v25, v26);

  v27 = self->_attributesCollectionView;
  v28 = objc_opt_class();
  +[AVTAttributeLabeledCollectionViewCell cellIdentifier](AVTAttributeLabeledCollectionViewCell, "cellIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v27, "registerClass:forCellWithReuseIdentifier:", v28, v29);

  v30 = self->_attributesCollectionView;
  v31 = objc_opt_class();
  v32 = *MEMORY[0x1E0CEB3B0];
  +[AVTAttributeSectionSeparator reuseIdentifier](AVTAttributeSectionSeparator, "reuseIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v30, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v31, v32, v33);

  v34 = self->_attributesCollectionView;
  v35 = objc_opt_class();
  v36 = *MEMORY[0x1E0CEB3B8];
  +[AVTAttributeEditorSectionHeaderView reuseIdentifier](AVTAttributeEditorSectionHeaderView, "reuseIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v34, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v35, v36, v37);

  -[UIView addSubview:](self->_attributesContainerView, "addSubview:", self->_attributesCollectionView);
  v38 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v12, v13, v14, v15);
  headerMaskingView = self->_headerMaskingView;
  self->_headerMaskingView = v38;

  -[UIView backgroundColor](self->_attributesContainerView, "backgroundColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_headerMaskingView, "setBackgroundColor:", v40);

  v41 = -[AVTShadowView initWithFrame:]([AVTShadowView alloc], "initWithFrame:", v12, v13, v14, v15);
  shadowView = self->_shadowView;
  self->_shadowView = v41;

  -[UIView addSubview:](self->_headerMaskingView, "addSubview:", self->_shadowView);
  -[UIView addSubview:](self->_attributesContainerView, "addSubview:", self->_headerMaskingView);
  -[AVTAvatarAttributeEditorViewController navigationItem](self, "navigationItem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setLargeTitleDisplayMode:", 2);

  -[AVTAvatarAttributeEditorViewController navigationItem](self, "navigationItem");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_setBackgroundHidden:", 1);

  -[AVTAvatarAttributeEditorViewController setUpHeaderView](self, "setUpHeaderView");
  if (AVTUIShowAssetsWarning_once())
  {
    -[AVTAvatarAttributeEditorViewController createAlphaAssetsLabel](self, "createAlphaAssetsLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorViewController setAlphaAssetsLabel:](self, "setAlphaAssetsLabel:", v45);

    -[AVTAvatarAttributeEditorViewController view](self, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorViewController alphaAssetsLabel](self, "alphaAssetsLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addSubview:", v47);

  }
}

- (void)setUpHeaderView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *headerContainerView;
  void *v10;
  AVTImageTransitioningContainerView *v11;
  AVTImageTransitioningContainerView *transitioningContainer;
  AVTBodyCarouselController *v13;
  void *v14;
  void *v15;
  void *v16;
  AVTBodyCarouselController *v17;
  AVTBodyCarouselController *bodyEditorHeaderViewController;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  headerContainerView = self->_headerContainerView;
  self->_headerContainerView = v8;

  -[AVTAvatarAttributeEditorViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_headerContainerView);

  v11 = -[AVTImageTransitioningContainerView initWithFrame:layoutMode:]([AVTImageTransitioningContainerView alloc], "initWithFrame:layoutMode:", 1, v4, v5, v6, v7);
  transitioningContainer = self->_transitioningContainer;
  self->_transitioningContainer = v11;

  -[AVTImageTransitioningContainerView setAutoresizingMask:](self->_transitioningContainer, "setAutoresizingMask:", 18);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__AVTAvatarAttributeEditorViewController_setUpHeaderView__block_invoke;
  v25[3] = &unk_1EA51D188;
  v25[4] = self;
  -[AVTAvatarAttributeEditorViewController updateImageViewWithPosedAvatarRecordForcingRender:completionHandler:](self, "updateImageViewWithPosedAvatarRecordForcingRender:completionHandler:", 0, v25);
  v13 = [AVTBodyCarouselController alloc];
  -[AVTAvatarAttributeEditorViewController environment](self, "environment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "avatarRecord");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AVTBodyCarouselController initWithEnvironment:avatarRecord:editorPresentationContext:](v13, "initWithEnvironment:avatarRecord:editorPresentationContext:", v14, v16, -[AVTAvatarAttributeEditorViewController editorPresentationContext](self, "editorPresentationContext"));
  bodyEditorHeaderViewController = self->_bodyEditorHeaderViewController;
  self->_bodyEditorHeaderViewController = v17;

  -[AVTBodyCarouselController view](self->_bodyEditorHeaderViewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAutoresizingMask:", 18);

  -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reloadDisplayedSticker");

  -[AVTAvatarAttributeEditorViewController avtViewSessionProvider](self, "avtViewSessionProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "avtViewBackingSize");
  +[AVTViewCarouselLayout adaptativeLayoutWithAVTViewAspectRatio:](AVTViewCarouselLayout, "adaptativeLayoutWithAVTViewAspectRatio:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController setAvtViewLayout:](self, "setAvtViewLayout:", v22);

  -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController avtViewLayout](self, "avtViewLayout");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "prepareViewWithLayout:", v24);

  -[UIView addSubview:](self->_headerContainerView, "addSubview:", self->_transitioningContainer);
}

uint64_t __57__AVTAvatarAttributeEditorViewController_setUpHeaderView__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "allowFacetracking");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setHeaderPreviewImageRenderer:", 0);
  return result;
}

- (void)setTransitioningContainerFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  id v30;

  -[AVTAvatarAttributeEditorViewController avtViewLayout](self, "avtViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorViewController headerContainerView](self, "headerContainerView");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v8 = v7;
  if (v3)
  {
    -[AVTAvatarAttributeEditorViewController headerContainerView](self, "headerContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10 * 0.85;

    -[AVTAvatarAttributeEditorViewController avtViewLayout](self, "avtViewLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "avatarViewSizeForAvailableContentSize:", v8 * 0.85, v11);
    v14 = v13;

    -[AVTAvatarAttributeEditorViewController headerContainerView](self, "headerContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    -[AVTAvatarAttributeEditorViewController headerContainerView](self, "headerContainerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v17 + (v19 - v14) * 0.5;

    -[AVTAvatarAttributeEditorViewController headerContainerView](self, "headerContainerView");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v22 = v21;
    -[AVTAvatarAttributeEditorViewController headerContainerView](self, "headerContainerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v25 = v24;
    -[AVTAvatarAttributeEditorViewController transitioningContainer](self, "transitioningContainer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v22, v20, v25, v14);

  }
  else
  {
    v27 = v4;
    v28 = v5;
    v29 = v6;
    -[AVTAvatarAttributeEditorViewController transitioningContainer](self, "transitioningContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", v27, v28, v8, v29);
  }

}

- (void)didFinishEditing
{
  void *v3;
  id v4;

  -[AVTAvatarAttributeEditorViewController headerPreviewScheduler](self, "headerPreviewScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllTasks");

  -[AVTAvatarAttributeEditorViewController imageProviderScheduler](self, "imageProviderScheduler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllTasks");

}

- (void)setupGroupSelectorIfNeeded
{
  void *v3;
  void *v4;
  UIView *groupDialContainerView;
  void *v6;
  AVTGroupListCollectionView *groupListView;
  AVTGroupListCollectionView *v8;
  void *v9;
  AVTGroupListCollectionView *v10;
  AVTGroupListCollectionView *v11;
  AVTGroupListCollectionView *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  UIView *v20;
  UIView *v21;
  void *v22;
  AVTGroupDial *v23;
  void *v24;
  AVTGroupDial *v25;
  AVTGroupDial *groupDial;
  AVTGroupDial *v27;
  void *v28;
  id v29;

  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupPickerItemsForCategories");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "showSideGroupPicker") & 1) != 0)
  {

  }
  else
  {
    groupDialContainerView = self->_groupDialContainerView;

    if (!groupDialContainerView)
    {
      +[AVTUIFontRepository groupDialBoldLabelFont](AVTUIFontRepository, "groupDialBoldLabelFont");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_scaledValueForValue:", 18.0);
      if (v14 <= 30.0)
        v15 = v14;
      else
        v15 = 30.0;
      v16 = objc_alloc(MEMORY[0x1E0CEABB0]);
      objc_msgSend(v6, "ascender");
      v18 = v17;
      objc_msgSend(v6, "descender");
      v20 = (UIView *)objc_msgSend(v16, "initWithFrame:", 0.0, 0.0, 50.0, v18 - v19 + v15 * 2.0);
      v21 = self->_groupDialContainerView;
      self->_groupDialContainerView = v20;

      -[AVTAvatarAttributeEditorViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", self->_groupDialContainerView);

      v23 = [AVTGroupDial alloc];
      -[AVTAvatarAttributeEditorViewController environment](self, "environment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[AVTGroupDial initWithGroupItems:environment:](v23, "initWithGroupItems:environment:", v29, v24);
      groupDial = self->_groupDial;
      self->_groupDial = v25;

      -[AVTGroupDial setDelegate:](self->_groupDial, "setDelegate:", self);
      v27 = self->_groupDial;
      -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTGroupDial setSelectedGroupIndex:animated:](v27, "setSelectedGroupIndex:animated:", objc_msgSend(v28, "currentCategoryIndex"), 0);

      -[UIView bounds](self->_groupDialContainerView, "bounds");
      -[AVTGroupDial setFrame:](self->_groupDial, "setFrame:");
      -[AVTGroupDial setAutoresizingMask:](self->_groupDial, "setAutoresizingMask:", 18);
      -[AVTGroupDial setContentPadding:](self->_groupDial, "setContentPadding:", v15);
      -[UIView addSubview:](self->_groupDialContainerView, "addSubview:", self->_groupDial);
      goto LABEL_11;
    }
  }
  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "showSideGroupPicker"))
  {
LABEL_11:

    goto LABEL_12;
  }
  groupListView = self->_groupListView;

  if (!groupListView)
  {
    v8 = [AVTGroupListCollectionView alloc];
    -[AVTAvatarAttributeEditorViewController environment](self, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AVTGroupListCollectionView initWithGroupItems:environment:](v8, "initWithGroupItems:environment:", v29, v9);
    v11 = self->_groupListView;
    self->_groupListView = v10;

    v12 = self->_groupListView;
    -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTGroupListCollectionView setSelectedGroupIndex:animated:](v12, "setSelectedGroupIndex:animated:", objc_msgSend(v13, "currentCategoryIndex"), 0);

    -[AVTGroupListCollectionView setDelegate:](self->_groupListView, "setDelegate:", self);
    -[UIView bounds](self->_sideGroupContainerView, "bounds");
    -[AVTGroupListCollectionView setFrame:](self->_groupListView, "setFrame:");
    -[AVTGroupListCollectionView setAutoresizingMask:](self->_groupListView, "setAutoresizingMask:", 18);
    -[UIView addSubview:](self->_sideGroupContainerView, "addSubview:", self->_groupListView);
  }
LABEL_12:

}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTAvatarAttributeEditorViewController;
  -[AVTAvatarAttributeEditorViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__AVTAvatarAttributeEditorViewController_viewWillAppear___block_invoke;
  v4[3] = &unk_1EA51D1D8;
  objc_copyWeak(&v5, &location);
  -[AVTAvatarAttributeEditorViewController setupPreview:](self, "setupPreview:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__AVTAvatarAttributeEditorViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentLayout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "currentLayout");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "applyLayout:", v2);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarAttributeEditorViewController;
  -[AVTAvatarAttributeEditorViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

  -[AVTAvatarAttributeEditorViewController environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "usageTrackingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didEnterEditor");

  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "currentCategoryIndex");

  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "categoryAtIndex:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "previewMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController updateHeaderViewForPreviewModeType:](self, "updateHeaderViewForPreviewModeType:", objc_msgSend(v11, "type"));

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTAvatarAttributeEditorViewController;
  -[AVTAvatarAttributeEditorViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB3F0], 0);

  -[AVTAvatarAttributeEditorViewController environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "usageTrackingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didLeaveEditor");

  if (-[AVTAvatarAttributeEditorViewController allowFacetracking](self, "allowFacetracking"))
  {
    -[AVTAvatarAttributeEditorViewController avtViewSession](self, "avtViewSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tearDownWithCompletionHandler:", 0);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarAttributeEditorViewController;
  v4 = a3;
  -[AVTAvatarAttributeEditorViewController traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "layoutDirection", v11.receiver, v11.super_class);

  -[AVTAvatarAttributeEditorViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "layoutDirection");

  if (v5 != v7)
    -[AVTAvatarAttributeEditorViewController updateLayoutAttributes](self, "updateLayoutAttributes");
  objc_msgSend(MEMORY[0x1E0CEA478], "colorNamed:", CFSTR("verticalRuleColor"));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");
  -[AVTAvatarAttributeEditorViewController verticleRule](self, "verticleRule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

}

- (UIEdgeInsets)adjustedSafeAreaInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[AVTAvatarAttributeEditorViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4 + -40.0;
  if (v4 <= 40.0)
    v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)notifyingContainerViewDidChangeSize:(CGSize)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForVisibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "section");
        -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sectionControllerForSectionIndex:inCategoryAtIndex:", v12, objc_msgSend(v13, "currentCategoryIndex"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[AVTAvatarAttributeEditorViewController view](self, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bounds");
        objc_msgSend(v14, "invalidateLayoutForNewContainerSize:", v16, v17);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  -[AVTAvatarAttributeEditorViewController environment](self, "environment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "deviceIsPad"))
  {

  }
  else
  {
    -[AVTAvatarAttributeEditorViewController environment](self, "environment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "deviceIsMac");

    if (!v20)
      return;
  }
  -[AVTAvatarAttributeEditorViewController reloadCollectionViewDataWithCompletion:](self, "reloadCollectionViewDataWithCompletion:", 0);
}

- (void)prepareForAnimatedTransitionWithLayout:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__AVTAvatarAttributeEditorViewController_prepareForAnimatedTransitionWithLayout_completionBlock___block_invoke;
  v10[3] = &unk_1EA51F208;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[AVTAvatarAttributeEditorViewController setupPreview:](self, "setupPreview:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __97__AVTAvatarAttributeEditorViewController_prepareForAnimatedTransitionWithLayout_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "applyLayout:layoutAvatarView:recalculateOffsetIfNeeded:", *(_QWORD *)(a1 + 32), 1, 0);
  objc_msgSend(WeakRetained, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "attributesContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (void)updateHeaderViewForPreviewModeType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  void (**v33)(_QWORD);
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[4];
  void *v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];

  if (-[AVTAvatarAttributeEditorViewController previewModeType](self, "previewModeType") != a3)
  {
    -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AVTAvatarAttributeEditorViewController setPreviewModeType:](self, "setPreviewModeType:", a3);
      if (a3 == 1)
      {
        -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "superview");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          return;
        -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAlpha:", 1.0);

        -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateStickersforVisibleCells");

        v12 = MEMORY[0x1E0C809B0];
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke;
        v41[3] = &unk_1EA51D188;
        v41[4] = self;
        v13 = (void *)MEMORY[0x1DF0D0754](v41);
        -[AVTAvatarAttributeEditorViewController avtViewSession](self, "avtViewSession");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "displayedConfiguration");
          v16 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

          -[AVTAvatarAttributeEditorViewController avtViewSession](self, "avtViewSession");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "avtView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = v12;
          v39[1] = 3221225472;
          v39[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_2;
          v39[3] = &unk_1EA51D810;
          v40 = v13;
          v19 = v13;
          objc_msgSend(v18, "transitionToStickerConfiguration:duration:style:completionHandler:", v16, 2, v39, 0.25);

LABEL_15:
          return;
        }
        v38[0] = v12;
        v38[1] = 3221225472;
        v38[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_3;
        v38[3] = &unk_1EA51D188;
        v38[4] = self;
        v27 = (void *)MEMORY[0x1DF0D0754](v38);
        v29 = (void *)MEMORY[0x1E0CEABB0];
        v36[0] = v12;
        v36[1] = 3221225472;
        v36[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_4;
        v36[3] = &unk_1EA51D3F0;
        v37 = v13;
        v16 = v13;
        objc_msgSend(v29, "animateWithDuration:animations:completion:", v27, v36, 0.25);
        v30 = v37;
      }
      else
      {
        -[AVTAvatarAttributeEditorViewController transitioningContainer](self, "transitioningContainer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "superview");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          return;
        -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "avatar");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setShowsBody:", 0);

        -[AVTAvatarAttributeEditorViewController transitioningContainer](self, "transitioningContainer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setAlpha:", 1.0);

        v25 = MEMORY[0x1E0C809B0];
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_5;
        v35[3] = &unk_1EA51D188;
        v35[4] = self;
        v16 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](v35);
        -[AVTAvatarAttributeEditorViewController avtViewSession](self, "avtViewSession");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v16[2](v16);
          if (!-[AVTAvatarAttributeEditorViewController allowFacetracking](self, "allowFacetracking"))
            goto LABEL_15;
          -[AVTAvatarAttributeEditorViewController avtViewSession](self, "avtViewSession");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "avtView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "transitionToFaceTrackingWithDuration:style:completionHandler:", 2, 0, 0.25);

LABEL_14:
          goto LABEL_15;
        }
        v34[0] = v25;
        v34[1] = 3221225472;
        v34[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_6;
        v34[3] = &unk_1EA51D188;
        v34[4] = self;
        v27 = (void *)MEMORY[0x1DF0D0754](v34);
        v31 = (void *)MEMORY[0x1E0CEABB0];
        v32[0] = v25;
        v32[1] = 3221225472;
        v32[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_7;
        v32[3] = &unk_1EA51D3F0;
        v16 = v16;
        v33 = v16;
        objc_msgSend(v31, "animateWithDuration:animations:completion:", v27, v32, 0.25);
        v30 = v33;
      }

      goto LABEL_14;
    }
  }
}

void __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "avtViewSessionProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "faceTrackingManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFaceTrackingManagementPaused:", 1);

    objc_msgSend(*(id *)(a1 + 32), "transitioningContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLiveView:", 0);

    objc_msgSend(*(id *)(a1 + 32), "bodyEditorHeaderViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "useAVTViewFromSession:", v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "headerContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bodyEditorHeaderViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v10);

  objc_msgSend(*(id *)(a1 + 32), "transitioningContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "headerContainerView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(*(id *)(a1 + 32), "bodyEditorHeaderViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);

}

uint64_t __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "transitioningContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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

  objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "bodyEditorHeaderViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopUsingAVTViewSessionSynchronously:completionHandler:", 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "avtViewSessionProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "faceTrackingManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFaceTrackingManagementPaused:", 0);

    objc_msgSend(*(id *)(a1 + 32), "transitioningContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "avtViewContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLiveView:", v9);

    objc_msgSend(*(id *)(a1 + 32), "transitioningContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transitionLiveViewToFront");

  }
  else
  {
    objc_msgSend(v3, "updateImageViewWithPosedAvatarRecordForcingRender:completionHandler:", 1, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "headerContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitioningContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  objc_msgSend(*(id *)(a1 + 32), "bodyEditorHeaderViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setTransitioningContainerFrame");
}

void __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_6(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "bodyEditorHeaderViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_7(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)updateImageViewWithPosedAvatarRecordForcingRender:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
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
  void *v17;
  void *v18;
  _QWORD *v19;
  uint64_t (*v20)(_QWORD *, _QWORD *, _QWORD);
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  void (**v25)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[AVTAvatarAttributeEditorViewController avatarRecord](self, "avatarRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (self->_isCreating && !v4)
    {
      v8 = (void *)MEMORY[0x1E0CEA638];
      AVTAvatarUIBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("newMemojiThumbnail"), v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarAttributeEditorViewController transitioningContainer](self, "transitioningContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setStaticImage:", v10);

      if (!v6)
        goto LABEL_10;
      goto LABEL_7;
    }
    -[AVTAvatarAttributeEditorViewController headerPreviewImageRenderer](self, "headerPreviewImageRenderer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[AVTAvatarAttributeEditorViewController avatarRecord](self, "avatarRecord");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTRenderingScope listControllerThumbnailScope](AVTRenderingScope, "listControllerThumbnailScope");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarAttributeEditorViewController headerPreviewImageRenderer](self, "headerPreviewImageRenderer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "avatar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "providerForAvatar:forRecord:scope:usingCache:", v18, v14, v15, !v4);
      v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __110__AVTAvatarAttributeEditorViewController_updateImageViewWithPosedAvatarRecordForcingRender_completionHandler___block_invoke;
      v23[3] = &unk_1EA520000;
      v23[4] = self;
      v24 = v14;
      v25 = v6;
      v20 = (uint64_t (*)(_QWORD *, _QWORD *, _QWORD))v19[2];
      v21 = v14;
      v22 = (id)v20(v19, v23, 0);

    }
  }
  else
  {
    -[AVTAvatarAttributeEditorViewController transitioningContainer](self, "transitioningContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStaticImage:", 0);

    if (v6)
LABEL_7:
      v6[2](v6);
  }
LABEL_10:

}

void __110__AVTAvatarAttributeEditorViewController_updateImageViewWithPosedAvatarRecordForcingRender_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "avatarRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "transitioningContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStaticImage:", v7);

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (void)transitionToLiveViewAnimated:(BOOL)a3
{
  AVTAvatarToLiveTransition *v4;
  void *v5;
  void *v6;
  AVTAvatarToLiveTransition *v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (a3)
  {
    v9 = 0;
    v10 = (id *)&v9;
    v11 = 0x3042000000;
    v12 = __Block_byref_object_copy__18;
    v13 = __Block_byref_object_dispose__18;
    v14 = 0;
    v4 = [AVTAvatarToLiveTransition alloc];
    -[AVTAvatarAttributeEditorViewController environment](self, "environment", MEMORY[0x1E0C809B0], 3221225472, __71__AVTAvatarAttributeEditorViewController_transitionToLiveViewAnimated___block_invoke, &unk_1EA520028, self, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AVTAvatarToLiveTransition initWithModel:animated:setupHandler:completionHandler:logger:](v4, "initWithModel:animated:setupHandler:completionHandler:logger:", self, 1, 0, &v8, v6);

    objc_storeWeak(v10 + 5, v7);
    -[AVTAvatarAttributeEditorViewController setCurrentTransition:](self, "setCurrentTransition:", v7);
    -[AVTTransition start](v7, "start");

    _Block_object_dispose(&v9, 8);
    objc_destroyWeak(&v14);
  }
  else
  {
    -[AVTAvatarAttributeEditorViewController transitionLiveViewToFront](self, "transitionLiveViewToFront");
  }
}

void __71__AVTAvatarAttributeEditorViewController_transitionToLiveViewAnimated___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id v4;
  id WeakRetained;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "transitioningContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStaticImage:", 0);

    objc_msgSend(*(id *)(a1 + 32), "currentTransition");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    if (v4 == WeakRetained)
      objc_msgSend(*(id *)(a1 + 32), "setCurrentTransition:", 0);
  }
}

- (void)transitionStaticViewToFront
{
  id v2;

  -[AVTAvatarAttributeEditorViewController transitioningContainer](self, "transitioningContainer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionStaticViewToFront");

}

- (void)transitionLiveViewToFront
{
  id v2;

  -[AVTAvatarAttributeEditorViewController transitioningContainer](self, "transitioningContainer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionLiveViewToFront");

}

- (id)liveView
{
  void *v2;
  void *v3;

  -[AVTAvatarAttributeEditorViewController avtViewSession](self, "avtViewSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avtView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setupPreview:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (-[AVTAvatarAttributeEditorViewController allowFacetracking](self, "allowFacetracking"))
  {
    -[AVTAvatarAttributeEditorViewController beginAVTViewSessionWithDidBeginBlock:](self, "beginAVTViewSessionWithDidBeginBlock:", v4);
  }
  else
  {
    -[AVTAvatarAttributeEditorViewController setupImageView](self, "setupImageView");
    v4[2](v4, 0);
  }

}

- (void)setupImageView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;

  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "avatarContainerFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[AVTAvatarAttributeEditorViewController headerContainerView](self, "headerContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    -[AVTAvatarAttributeEditorViewController setTransitioningContainerFrame](self, "setTransitioningContainerFrame");
    -[AVTAvatarAttributeEditorViewController headerContainerView](self, "headerContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v16, v18, v20, v22);

  }
  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController setupCollapsibleHeaderIfNeededForLayout:withSession:](self, "setupCollapsibleHeaderIfNeededForLayout:withSession:", v25, 0);

}

- (void)beginAVTViewSessionWithDidBeginBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  BOOL v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = (void (**)(id, void *))a3;
  -[AVTAvatarAttributeEditorViewController avtViewSession](self, "avtViewSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isActive") & 1) != 0)
  {

    goto LABEL_7;
  }
  v6 = -[AVTAvatarAttributeEditorViewController allowFacetracking](self, "allowFacetracking");

  if (!v6)
  {
LABEL_7:
    if (v4)
    {
      -[AVTAvatarAttributeEditorViewController avtViewSession](self, "avtViewSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v12);

    }
    goto LABEL_9;
  }
  -[AVTAvatarAttributeEditorViewController postSessionDidBecomeActiveHandler](self, "postSessionDidBecomeActiveHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVTAvatarAttributeEditorViewController postSessionDidBecomeActiveHandler](self, "postSessionDidBecomeActiveHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0);

  }
  -[AVTAvatarAttributeEditorViewController setPostSessionDidBecomeActiveHandler:](self, "setPostSessionDidBecomeActiveHandler:", v4);
  objc_initWeak(&location, self);
  -[AVTAvatarAttributeEditorViewController avtViewSessionProvider](self, "avtViewSessionProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__AVTAvatarAttributeEditorViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke;
  v15[3] = &unk_1EA51D1D8;
  objc_copyWeak(&v16, &location);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __79__AVTAvatarAttributeEditorViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_3;
  v13[3] = &unk_1EA51D200;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v9, "sessionWithDidBecomeActiveHandler:tearDownHandler:", v15, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController setAvtViewSession:](self, "setAvtViewSession:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
LABEL_9:

}

void __79__AVTAvatarAttributeEditorViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  char v57;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "avtView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "configureThrottlerForAVTView:", v5);

  objc_msgSend(WeakRetained, "currentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "currentLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avatarContainerFrame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(WeakRetained, "headerContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    objc_msgSend(WeakRetained, "headerContainerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(WeakRetained, "bodyEditorHeaderViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrame:", v19, v21, v23, v25);

    objc_msgSend(WeakRetained, "setTransitioningContainerFrame");
  }
  objc_msgSend(v3, "aspectRatio");
  v29 = v28;
  v31 = v30;
  objc_msgSend(WeakRetained, "transitioningContainer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAspectRatio:", v29, v31);

  objc_msgSend(WeakRetained, "avtViewSessionProvider");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "faceTrackingManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setDelegate:", WeakRetained);

  objc_msgSend(WeakRetained, "configureAVTViewFromSession:", v3);
  objc_msgSend(WeakRetained, "transitioningContainer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avtViewContainer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setLiveView:", v36);

  objc_msgSend(WeakRetained, "avtViewSessionProvider");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "faceTrackingManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFaceTrackingManagementPaused:", 0);

  objc_msgSend(WeakRetained, "avtViewSessionProvider");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "faceTrackingManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "resumeFaceTrackingIfNeededAnimated:", 0);

  objc_msgSend(WeakRetained, "configureUserInfoLabel");
  objc_msgSend(WeakRetained, "currentLayout");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setupCollapsibleHeaderIfNeededForLayout:withSession:", v41, v3);

  objc_msgSend(WeakRetained, "transitioningContainer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setupTapGestureForView:", v42);

  objc_msgSend(WeakRetained, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setNeedsLayout");

  objc_msgSend(v3, "avtViewUpdater");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "modelManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "avatarRecord");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v44, "willUpdateViewForRecord:avatar:", v46, 0);

  if ((v47 & 1) == 0)
    objc_msgSend(WeakRetained, "transitionToLiveViewAnimated:", 0);
  objc_initWeak(&location, WeakRetained);
  objc_msgSend(v3, "avtViewUpdater");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "modelManager");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "avatarRecord");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "modelManager");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "avatar");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __79__AVTAvatarAttributeEditorViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_2;
  v54[3] = &unk_1EA520050;
  objc_copyWeak(&v56, &location);
  v57 = v47;
  v53 = v3;
  v55 = v53;
  objc_msgSend(v48, "setAvatarRecord:avatar:completionHandler:", v50, v52, v54);

  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);

}

void __79__AVTAvatarAttributeEditorViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (a2)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(WeakRetained, "avtViewSession");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = v8;
      if (v5)
      {
        objc_msgSend(v8, "transitionToLiveViewAnimated:", 1);
        WeakRetained = v8;
      }
    }
  }
  objc_msgSend(WeakRetained, "postSessionDidBecomeActiveHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "postSessionDidBecomeActiveHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(v8, "setPostSessionDidBecomeActiveHandler:", 0);

}

void __79__AVTAvatarAttributeEditorViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  id WeakRetained;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tearDownThrottler");
  objc_msgSend(WeakRetained, "transitioningContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "tapGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", v8);

  if ((objc_msgSend(WeakRetained, "disableAvatarSnapshotting") & 1) != 0)
  {
    objc_msgSend(WeakRetained, "transitioningContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStaticImage:", 0);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D006A8];
    objc_msgSend(v25, "avtView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "transitioningContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "liveView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "environment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "snapshotAVTView:matchingViewSize:highQuality:logger:", v11, v13, 0, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "transitioningContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setStaticImage:", v9);

  }
  objc_msgSend(WeakRetained, "transitioningContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "transitionStaticViewToFront");

  objc_msgSend(WeakRetained, "visibleLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setCurrentLayout:", v18);

  objc_msgSend(WeakRetained, "currentTransition");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cancel");

  objc_msgSend(WeakRetained, "setCurrentTransition:", 0);
  objc_msgSend(WeakRetained, "setAvtViewSession:", 0);
  objc_msgSend(WeakRetained, "tearDownCollapsibleHeaderIfNeeded");
  if ((objc_msgSend(WeakRetained, "shouldHideUserInfoView") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "avtViewSessionProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "faceTrackingManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "userInfoView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeFromSuperview");

  }
  objc_msgSend(WeakRetained, "avtViewSessionProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "faceTrackingManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDelegate:", 0);

  v5[2](v5);
}

- (void)configureThrottlerForAVTView:(id)a3
{
  AVTViewThrottler *v4;
  void *v5;
  AVTViewThrottler *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (AVTUIAdaptativeFrameRate())
  {
    v4 = [AVTViewThrottler alloc];
    -[AVTAvatarAttributeEditorViewController environment](self, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AVTViewThrottler initWithAVTView:environment:](v4, "initWithAVTView:environment:", v10, v5);
    -[AVTAvatarAttributeEditorViewController setAvtViewThrottler:](self, "setAvtViewThrottler:", v6);

    -[AVTAvatarAttributeEditorViewController environment](self, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceResourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorViewController avtViewThrottler](self, "avtViewThrottler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerConsumer:", v9);

  }
}

- (void)tearDownThrottler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AVTAvatarAttributeEditorViewController avtViewThrottler](self, "avtViewThrottler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTAvatarAttributeEditorViewController avtViewThrottler](self, "avtViewThrottler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unthrottle");

    -[AVTAvatarAttributeEditorViewController environment](self, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceResourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorViewController avtViewThrottler](self, "avtViewThrottler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unregisterConsumer:", v7);

    -[AVTAvatarAttributeEditorViewController setAvtViewThrottler:](self, "setAvtViewThrottler:", 0);
  }
}

- (void)configureAVTViewFromSession:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "avtView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateInterfaceOrientation");

  v5 = AVTUIShowTrackingLostReticle_once();
  objc_msgSend(v12, "avtView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnableReticle:", v5);

  objc_msgSend(v12, "avtView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnableFaceTracking:", 1);

  -[AVTAvatarAttributeEditorViewController attributesContainerView](self, "attributesContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "avtView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  if (AVTUIShowPerfHUD_once())
  {
    objc_msgSend(v12, "avtView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShowPerfHUD:", 1);

  }
}

- (void)configureUserInfoLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!-[AVTAvatarAttributeEditorViewController shouldHideUserInfoView](self, "shouldHideUserInfoView")
    && -[AVTAvatarAttributeEditorViewController allowFacetracking](self, "allowFacetracking"))
  {
    -[AVTAvatarAttributeEditorViewController avtViewSessionProvider](self, "avtViewSessionProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "faceTrackingManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfoView");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInfoFrame");
      objc_msgSend(v10, "setFrame:");

    }
    -[AVTAvatarAttributeEditorViewController attributesContainerView](self, "attributesContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContainerBackgroundColor:", v8);

    -[AVTAvatarAttributeEditorViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

  }
}

- (void)setupCollapsibleHeaderIfNeededForLayout:(id)a3 withSession:(id)a4
{
  id v6;
  void *v7;
  AVTCollapsibleHeaderController *v8;
  void *v9;
  void *v10;
  AVTCollapsibleHeaderController *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if ((!-[AVTAvatarAttributeEditorViewController allowFacetracking](self, "allowFacetracking")
     || -[AVTAvatarAttributeEditorViewController allowFacetracking](self, "allowFacetracking")
     && objc_msgSend(v6, "isActive"))
    && objc_msgSend(v17, "supportedLayoutOrientation") == 1)
  {
    -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = [AVTCollapsibleHeaderController alloc];
      -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarAttributeEditorViewController headerContainerView](self, "headerContainerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[AVTCollapsibleHeaderController initWithScrollView:headerView:minHeight:maxHeight:](v8, "initWithScrollView:headerView:minHeight:maxHeight:", v9, v10, 0.0, 0.0);
      -[AVTAvatarAttributeEditorViewController setCollapsibleHeaderController:](self, "setCollapsibleHeaderController:", v11);

      -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShouldOnlyExpandWhenScrollingAtEdge:", 1);

      -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDelegate:", self);

      objc_msgSend(v17, "groupDialContainerFrame");
      v15 = v14;
      -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAdditionalTopContentInset:", v15);

      -[AVTAvatarAttributeEditorViewController updateCollapsibleHeaderHeightConstraintsAnimated:](self, "updateCollapsibleHeaderHeightConstraintsAnimated:", 0);
    }
  }

}

- (void)updateCollapsibleHeaderHeightConstraintsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  double v9;
  void *v10;
  double Height;
  id v12;
  CGRect v13;

  v3 = a3;
  -[AVTAvatarAttributeEditorViewController environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "deviceIsPad"))
  {

  }
  else
  {
    -[AVTAvatarAttributeEditorViewController environment](self, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "deviceIsMac");

    if (!v7)
    {
      v8 = 0x4064000000000000;
      goto LABEL_6;
    }
  }
  v8 = 0x4069000000000000;
LABEL_6:
  v9 = *(double *)&v8;
  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "avatarContainerFrame");
  Height = CGRectGetHeight(v13);

  -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateMinHeight:maxHeight:animated:", v3, v9, Height);

}

- (void)setupTapGestureForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AVTAvatarAttributeEditorViewController tapGestureRecognizer](self, "tapGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_didTapAvatarView_);
    -[AVTAvatarAttributeEditorViewController setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v6);

  }
  -[AVTAvatarAttributeEditorViewController tapGestureRecognizer](self, "tapGestureRecognizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v7);

}

- (void)tearDownCollapsibleHeaderIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headerView");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTAvatarAttributeEditorViewController setCollapsibleHeaderController:](self, "setCollapsibleHeaderController:", 0);
    -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarContainerFrame");
    objc_msgSend(v7, "setFrame:");

  }
}

- (void)didTapAvatarView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expandAnimated:", 1);

  -[AVTAvatarAttributeEditorViewController avtViewSessionProvider](self, "avtViewSessionProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceTrackingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeFaceTrackingIfNeededAnimated:", 1);

}

- (id)createAlphaAssetsLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", 0.0, 10.0, 300.0, 30.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v4);

  objc_msgSend(v2, "setText:", CFSTR("Warning: contains new and/or updated visuals. \nUse with disclosed users only."));
  +[AVTUIFontRepository groupDialLabelFont](AVTUIFontRepository, "groupDialLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v5);

  objc_msgSend(v2, "setNumberOfLines:", 0);
  objc_msgSend(v2, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v2, "setTextAlignment:", 1);
  objc_msgSend(v2, "setAutoresizingMask:", 34);
  return v2;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarAttributeEditorViewController;
  -[AVTAvatarAttributeEditorViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[AVTAvatarAttributeEditorViewController updateLayoutAttributes](self, "updateLayoutAttributes");
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;

  -[AVTAvatarAttributeEditorViewController groupDial](self, "groupDial", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[AVTAvatarAttributeEditorViewController reloadCollectionViewDataWithCompletion:](self, "reloadCollectionViewDataWithCompletion:", 0);
  -[AVTAvatarAttributeEditorViewController updateLayoutAttributes](self, "updateLayoutAttributes");
}

- (void)updateLayoutAttributes
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
  void *v12;
  void *v13;
  void *v14;
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
  void *v27;
  double v28;
  double v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  id v69;

  -[AVTAvatarAttributeEditorViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTShadowView defaultHeightForSuperview:](AVTShadowView, "defaultHeightForSuperview:", v3);
  v5 = v4;

  -[AVTAvatarAttributeEditorViewController headerMaskingView](self, "headerMaskingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7 - v5;
  -[AVTAvatarAttributeEditorViewController headerMaskingView](self, "headerMaskingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  -[AVTAvatarAttributeEditorViewController shadowView](self, "shadowView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", 0.0, v8, v11, v5);

  -[AVTAvatarAttributeEditorViewController shadowView](self, "shadowView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAutoresizingMask:", 10);

  -[AVTAvatarAttributeEditorViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  -[AVTAvatarAttributeEditorViewController adjustedSafeAreaInsets](self, "adjustedSafeAreaInsets");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "userInfoViewHeight");
  v29 = v28;
  -[AVTAvatarAttributeEditorViewController traitCollection](self, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "layoutDirection") == 1;
  -[AVTAvatarAttributeEditorViewController environment](self, "environment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController maxGroupLabelWidth](self, "maxGroupLabelWidth");
  +[AVTAvatarAttributeEditorLayoutProvider defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:](AVTAvatarAttributeEditorLayoutProvider, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:", v31, v32, v16, v18, v20, v22, v24, v26, v29, v33);
  v69 = (id)objc_claimAutoreleasedReturnValue();

  +[AVTUIFontRepository groupDialBoldLabelFont](AVTUIFontRepository, "groupDialBoldLabelFont");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_scaledValueForValue:", 18.0);
  if (v35 <= 30.0)
    v36 = v35;
  else
    v36 = 30.0;
  -[AVTAvatarAttributeEditorViewController groupDial](self, "groupDial");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setContentPadding:", v36);

  objc_msgSend(v69, "groupDialContainerFrame");
  v39 = v38;
  -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAdditionalTopContentInset:", v39);

  objc_msgSend(v69, "containerSize");
  v42 = v41;
  v44 = v43;
  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "containerSize");
  if (v42 == v47 && v44 == v46)
  {
    objc_msgSend(v69, "contentSizeCategory");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "contentSizeCategory");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "isEqualToString:", v50))
    {
      objc_msgSend(v69, "edgeInsets");
      v52 = v51;
      v54 = v53;
      v56 = v55;
      v58 = v57;
      -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "edgeInsets");
      if (v54 == v63 && v52 == v60 && v58 == v62 && v56 == v61)
      {
        objc_msgSend(v69, "userInfoViewHeight");
        v65 = v64;
        -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "userInfoViewHeight");
        v68 = v67;

        if (v65 == v68)
          goto LABEL_17;
        goto LABEL_16;
      }

    }
  }

LABEL_16:
  -[AVTAvatarAttributeEditorViewController applyLayout:layoutAvatarView:recalculateOffsetIfNeeded:](self, "applyLayout:layoutAvatarView:recalculateOffsetIfNeeded:", v69, 0, 1);
LABEL_17:

}

- (double)maxGroupLabelWidth
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupPickerItemsForCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = *MEMORY[0x1E0CEA098];
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "localizedName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[AVTUIFontRepository groupListLabelFont](AVTUIFontRepository, "groupListLabelFont");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v7;
        v20 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sizeWithAttributes:", v12);
        if (v8 < v13)
          v8 = v13;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }
  else
  {
    v8 = 0.0;
  }

  return ceil(v8);
}

- (void)applyLayout:(id)a3
{
  -[AVTAvatarAttributeEditorViewController applyLayout:layoutAvatarView:recalculateOffsetIfNeeded:](self, "applyLayout:layoutAvatarView:recalculateOffsetIfNeeded:", a3, 1, 1);
}

- (void)applyLayout:(id)a3 layoutAvatarView:(BOOL)a4 recalculateOffsetIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  void *v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  void *v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  double v153;
  void *v154;
  double v155;
  double v156;
  void *v157;
  double v158;
  double v159;
  double v160;
  double v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;

  v5 = a5;
  v6 = a4;
  v168 = a3;
  -[AVTAvatarAttributeEditorViewController setCurrentLayout:](self, "setCurrentLayout:", v168);
  objc_msgSend(v168, "attributesContentViewFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[AVTAvatarAttributeEditorViewController attributesContainerView](self, "attributesContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[AVTAvatarAttributeEditorViewController setupGroupSelectorIfNeeded](self, "setupGroupSelectorIfNeeded");
  objc_msgSend(v168, "groupDialContainerFrame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[AVTAvatarAttributeEditorViewController groupDialContainerView](self, "groupDialContainerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  v26 = objc_msgSend(v168, "showSideGroupPicker");
  -[AVTAvatarAttributeEditorViewController groupDialContainerView](self, "groupDialContainerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", v26);

  objc_msgSend(v168, "sideGroupContainerFrame");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[AVTAvatarAttributeEditorViewController sideGroupContainerView](self, "sideGroupContainerView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

  v37 = objc_msgSend(v168, "showSideGroupPicker") ^ 1;
  -[AVTAvatarAttributeEditorViewController sideGroupContainerView](self, "sideGroupContainerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setHidden:", v37);

  if (!-[AVTAvatarAttributeEditorViewController allowFacetracking](self, "allowFacetracking")
    || (-[AVTAvatarAttributeEditorViewController avtViewSession](self, "avtViewSession"),
        v39 = (void *)objc_claimAutoreleasedReturnValue(),
        v40 = objc_msgSend(v39, "isActive"),
        v39,
        v40))
  {
    if (objc_msgSend(v168, "supportedLayoutOrientation") == 1)
    {
      -[AVTAvatarAttributeEditorViewController avtViewSession](self, "avtViewSession");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarAttributeEditorViewController setupCollapsibleHeaderIfNeededForLayout:withSession:](self, "setupCollapsibleHeaderIfNeededForLayout:withSession:", v168, v41);

    }
    else
    {
      -[AVTAvatarAttributeEditorViewController createVerticleRuleIfNeeded](self, "createVerticleRuleIfNeeded");
      -[AVTAvatarAttributeEditorViewController tearDownCollapsibleHeaderIfNeeded](self, "tearDownCollapsibleHeaderIfNeeded");
    }
    objc_msgSend(v168, "avatarContainerFrame");
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48;
    -[AVTAvatarAttributeEditorViewController headerContainerView](self, "headerContainerView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);

    -[AVTAvatarAttributeEditorViewController setTransitioningContainerFrame](self, "setTransitioningContainerFrame");
    -[AVTAvatarAttributeEditorViewController headerContainerView](self, "headerContainerView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bounds");
    v53 = v52;
    v55 = v54;
    v57 = v56;
    v59 = v58;
    -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "view");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setFrame:", v53, v55, v57, v59);

    objc_msgSend(v168, "avatarContainerAlpha");
    v63 = v62;
    -[AVTAvatarAttributeEditorViewController transitioningContainer](self, "transitioningContainer");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setAlpha:", v63);

    if (v6)
    {
      -[AVTAvatarAttributeEditorViewController headerContainerView](self, "headerContainerView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "layoutIfNeeded");

      -[AVTAvatarAttributeEditorViewController transitioningContainer](self, "transitioningContainer");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "layoutIfNeeded");

      -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "view");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "layoutIfNeeded");

    }
    -[AVTAvatarAttributeEditorViewController applyUserInfoViewLayout](self, "applyUserInfoViewLayout");
  }
  -[AVTAvatarAttributeEditorViewController updateAlphaAssetsLabelFrameIfNeeded](self, "updateAlphaAssetsLabelFrameIfNeeded");
  -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setShouldResizeHeaderForScrolling:", 0);

  -[AVTAvatarAttributeEditorViewController attributesContainerView](self, "attributesContainerView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bounds");
  v72 = v71;
  v74 = v73;
  v76 = v75;
  v78 = v77;
  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setFrame:", v72, v74, v76, v78);

  objc_msgSend(v168, "headerMaskingViewAlpha");
  v81 = v80;
  -[AVTAvatarAttributeEditorViewController headerMaskingView](self, "headerMaskingView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setAlpha:", v81);

  objc_msgSend(v168, "headerMaskingViewFrame");
  v84 = v83;
  v86 = v85;
  v88 = v87;
  v90 = v89;
  -[AVTAvatarAttributeEditorViewController headerMaskingView](self, "headerMaskingView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setFrame:", v84, v86, v88, v90);

  objc_msgSend(v168, "verticalRuleAlpha");
  v93 = v92;
  -[AVTAvatarAttributeEditorViewController verticleRuleContainer](self, "verticleRuleContainer");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setAlpha:", v93);

  objc_msgSend(v168, "verticalRuleFrame");
  v96 = v95;
  v98 = v97;
  v100 = v99;
  v102 = v101;
  -[AVTAvatarAttributeEditorViewController verticleRuleContainer](self, "verticleRuleContainer");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setFrame:", v96, v98, v100, v102);

  -[AVTAvatarAttributeEditorViewController verticleRuleContainer](self, "verticleRuleContainer");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "bounds");
  v106 = v105;
  v108 = v107;
  v110 = v109;
  v112 = v111;
  -[AVTAvatarAttributeEditorViewController verticleRule](self, "verticleRule");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setFrame:", v106, v108, v110, v112);

  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "contentInset");
  v116 = v115;
  v118 = v117;
  v120 = v119;
  v122 = v121;
  objc_msgSend(v168, "attributesContentViewInsets");
  if (v118 == v126 && v116 == v123 && v122 == v125)
  {
    v127 = v124;

    if (v120 == v127)
      goto LABEL_18;
  }
  else
  {

  }
  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "contentInset");
  v130 = v129;

  objc_msgSend(v168, "attributesContentViewInsets");
  v132 = v131;
  v134 = v133;
  v136 = v135;
  v138 = v137;
  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "setContentInset:", v132, v134, v136, v138);

  objc_msgSend(v168, "attributesContentViewScrollIndicatorInsets");
  v141 = v140;
  v143 = v142;
  v145 = v144;
  v147 = v146;
  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "setScrollIndicatorInsets:", v141, v143, v145, v147);

  if (v5)
  {
    -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "contentOffset");
    v151 = v150;
    v153 = v152;

    -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "contentInset");
    v156 = v130 - v155;
    -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "userInfoViewHeight");
    v159 = v156 + v158;
    +[AVTUserInfoView textVerticalPadding](AVTUserInfoView, "textVerticalPadding");
    v161 = ceil(v159 + v160);

    if (fabs(v161) > 0.00000011920929)
    {
      -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "setContentOffset:", v151, v153 + v161);

    }
  }
LABEL_18:
  -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "setShouldResizeHeaderForScrolling:", 1);

  -[AVTAvatarAttributeEditorViewController updateCollapsibleHeaderHeightConstraintsAnimated:](self, "updateCollapsibleHeaderHeightConstraintsAnimated:", 0);
  -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "updateInsetsIfNeeded");

  -[AVTAvatarAttributeEditorViewController delegate](self, "delegate");
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  v166 = v168;
  if (v165)
  {
    -[AVTAvatarAttributeEditorViewController delegate](self, "delegate");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "attributeEditor:didUpdateVisibleLayout:", self, v168);

    v166 = v168;
  }

}

- (void)applyUserInfoViewLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  if (-[AVTAvatarAttributeEditorViewController allowFacetracking](self, "allowFacetracking"))
  {
    if (!-[AVTAvatarAttributeEditorViewController shouldHideUserInfoView](self, "shouldHideUserInfoView"))
    {
      -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "userInfoFrame");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;

      -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "maxHeight");
      v14 = v13;
      -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentHeightForHeader");
      v17 = v14 - v16;

      -[AVTAvatarAttributeEditorViewController avtViewSessionProvider](self, "avtViewSessionProvider");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "faceTrackingManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "userInfoView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFrame:", v5, v7 - v17, v9, v11);

    }
  }
}

- (id)visibleLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  AVTAvatarAttributeEditorOverridingLayout *v12;
  void *v13;
  AVTAvatarAttributeEditorOverridingLayout *v14;

  -[AVTAvatarAttributeEditorViewController transitioningContainer](self, "transitioningContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = [AVTAvatarAttributeEditorOverridingLayout alloc];
  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AVTAvatarAttributeEditorOverridingLayout initWithLayout:](v12, "initWithLayout:", v13);

  -[AVTAvatarAttributeEditorOverridingLayout setAvatarContainerFrame:](v14, "setAvatarContainerFrame:", v5, v7, v9, v11);
  return v14;
}

- (void)createVerticleRuleIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[AVTAvatarAttributeEditorViewController verticleRule](self, "verticleRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[AVTAvatarAttributeEditorViewController setVerticleRuleContainer:](self, "setVerticleRuleContainer:", v5);

    -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "verticalRuleAlpha");
    v8 = v7;
    -[AVTAvatarAttributeEditorViewController verticleRuleContainer](self, "verticleRuleContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", v8);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorViewController setVerticleRule:](self, "setVerticleRule:", v10);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorNamed:", CFSTR("verticalRuleColor"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "CGColor");
    -[AVTAvatarAttributeEditorViewController verticleRule](self, "verticleRule");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

    -[AVTAvatarAttributeEditorViewController verticleRuleContainer](self, "verticleRuleContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorViewController verticleRule](self, "verticleRule");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSublayer:", v16);

    -[AVTAvatarAttributeEditorViewController attributesContainerView](self, "attributesContainerView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorViewController verticleRuleContainer](self, "verticleRuleContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v17);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  double v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  objc_super v27;

  height = a3.height;
  width = a3.width;
  v27.receiver = self;
  v27.super_class = (Class)AVTAvatarAttributeEditorViewController;
  v7 = a4;
  -[AVTAvatarAttributeEditorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v27, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[AVTAvatarAttributeEditorViewController adjustedSafeAreaInsets](self, "adjustedSafeAreaInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInfoViewHeight");
  v18 = v17;
  -[AVTAvatarAttributeEditorViewController traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "layoutDirection") == 1;
  -[AVTAvatarAttributeEditorViewController environment](self, "environment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController maxGroupLabelWidth](self, "maxGroupLabelWidth");
  +[AVTAvatarAttributeEditorLayoutProvider defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:](AVTAvatarAttributeEditorLayoutProvider, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:", v20, v21, width, height, v9, v11, v13, v15, v18, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __93__AVTAvatarAttributeEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v25[3] = &unk_1EA520078;
  v25[4] = self;
  v26 = v23;
  v24 = v23;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v25, 0);

}

uint64_t __93__AVTAvatarAttributeEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avtView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateInterfaceOrientation");

  objc_msgSend(*(id *)(a1 + 32), "applyLayout:layoutAvatarView:recalculateOffsetIfNeeded:", *(_QWORD *)(a1 + 40), 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "attributesCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateLayout");

  objc_msgSend(*(id *)(a1 + 32), "attributesContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "attributesCollectionView", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathsForVisibleItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
        objc_msgSend(*(id *)(a1 + 32), "dataSource");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "section");
        objc_msgSend(*(id *)(a1 + 32), "dataSource");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sectionControllerForSectionIndex:inCategoryAtIndex:", v19, objc_msgSend(v20, "currentCategoryIndex"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "invalidateLayoutForNewContainerSize:", v8, v10);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  return objc_msgSend(*(id *)(a1 + 32), "reloadCollectionViewDataWithCompletion:", 0);
}

- (void)updateHeaderDependentLayoutWithHeaderFrame:(CGRect)a3 fittingSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MaxY;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  CGFloat v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupDialContainerFrame");
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v47 = height;
  v48.size.height = height;
  MaxY = CGRectGetMaxY(v48);
  -[AVTAvatarAttributeEditorViewController groupDialContainerView](self, "groupDialContainerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v11, MaxY, v13, v15);

  -[AVTAvatarAttributeEditorViewController headerMaskingView](self, "headerMaskingView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlpha:", 1.0);

  -[AVTAvatarAttributeEditorViewController attributesContainerView](self, "attributesContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v49.origin.x = v11;
  v49.origin.y = MaxY;
  v49.size.width = v13;
  v49.size.height = v15;
  v22 = CGRectGetMaxY(v49);
  -[AVTAvatarAttributeEditorViewController headerMaskingView](self, "headerMaskingView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", 0.0, 0.0, v21, v22);

  -[AVTAvatarAttributeEditorViewController avtViewSession](self, "avtViewSession");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v24, "isActive"))
  {
LABEL_6:

    goto LABEL_7;
  }
  v25 = -[AVTAvatarAttributeEditorViewController shouldHideUserInfoView](self, "shouldHideUserInfoView");

  if (!v25)
  {
    -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "userInfoFrame");
    v28 = v27;
    v45 = v29;
    v31 = v30;

    +[AVTUIFontRepository groupDialBoldLabelFont](AVTUIFontRepository, "groupDialBoldLabelFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_scaledValueForValue:", 18.0);
    v33 = v32;
    v34 = v32 * 0.5;
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = v47;
    v35 = CGRectGetMaxY(v50);
    v36 = 15.0;
    if (v33 <= 30.0)
      v36 = v34;
    v37 = v35 + v36;
    -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout", v45);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "userInfoViewHeight");
    v40 = v37 - v39;

    -[AVTAvatarAttributeEditorViewController avtViewSessionProvider](self, "avtViewSessionProvider");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "faceTrackingManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "userInfoView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "setFrame:", v28, v40, v46, v31);
    -[AVTAvatarAttributeEditorViewController attributesContainerView](self, "attributesContainerView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bringSubviewToFront:", v43);

    goto LABEL_6;
  }
LABEL_7:
  -[AVTAvatarAttributeEditorViewController updateAlphaAssetsLabelFrameIfNeeded](self, "updateAlphaAssetsLabelFrameIfNeeded");
  -[AVTAvatarAttributeEditorViewController setTransitioningContainerFrame](self, "setTransitioningContainerFrame");
}

- (void)faceTrackingManager:(id)a3 didUpdateUserInfoWithSize:(CGSize)a4
{
  double height;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  id v25;

  height = a4.height;
  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout", a3, a4.width);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerSize");
  v8 = v7;
  v10 = v9;
  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "RTL");
  -[AVTAvatarAttributeEditorViewController environment](self, "environment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "maxGroupLabelWidth");
  +[AVTAvatarAttributeEditorLayoutProvider defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:](AVTAvatarAttributeEditorLayoutProvider, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:", v21, v22, v8, v10, v13, v15, v17, v19, height, v24);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorViewController setCurrentLayout:](self, "setCurrentLayout:", v25);
  -[AVTAvatarAttributeEditorViewController applyUserInfoViewLayout](self, "applyUserInfoViewLayout");

}

- (void)updateAlphaAssetsLabelFrameIfNeeded
{
  void *v3;
  CGFloat v4;
  void *v5;
  double MaxY;
  void *v7;
  double v8;
  void *v9;
  CGFloat v10;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  -[AVTAvatarAttributeEditorViewController alphaAssetsLabel](self, "alphaAssetsLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "avatarContainerFrame");
    v4 = CGRectGetMinX(v13) + 16.0;
    -[AVTAvatarAttributeEditorViewController headerMaskingView](self, "headerMaskingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    MaxY = CGRectGetMaxY(v14);
    -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupDialContainerFrame");
    v8 = MaxY - CGRectGetHeight(v15) + -45.0;
    -[AVTAvatarAttributeEditorViewController currentLayout](self, "currentLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avatarContainerFrame");
    v10 = CGRectGetWidth(v16) + -32.0;
    -[AVTAvatarAttributeEditorViewController alphaAssetsLabel](self, "alphaAssetsLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v4, v8, v10, 45.0);

  }
}

- (void)reloadCollectionViewDataWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  AVTAvatarAttributeEditorViewController *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __81__AVTAvatarAttributeEditorViewController_reloadCollectionViewDataWithCompletion___block_invoke;
  v10 = &unk_1EA51D490;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](&v7);
  if (-[AVTAvatarAttributeEditorViewController collectionViewIsPerformingBatchUpdates](self, "collectionViewIsPerformingBatchUpdates", v7, v8, v9, v10, v11))
  {
    -[AVTAvatarAttributeEditorViewController setPendingCollectionViewReloadDataBlock:](self, "setPendingCollectionViewReloadDataBlock:", v6);
  }
  else
  {
    v6[2](v6);
  }

}

uint64_t __81__AVTAvatarAttributeEditorViewController_reloadCollectionViewDataWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "attributesCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)resetAllSectionControllersStateToDefault
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4 >= 1)
  {
    v5 = 0;
    do
    {
      -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sectionControllerForSectionIndex:inCategoryAtIndex:", v5, objc_msgSend(v7, "currentCategoryIndex"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "resetToDefaultState");
      ++v5;
      -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "numberOfSections");

    }
    while (v5 < v10);
  }
}

- (void)updateLayoutForAttributesCollectionMaskingView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double Width;
  double Height;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  if (self->_attributesCollectionViewMaskingView)
  {
    -[UIView frame](self->_headerMaskingView, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UICollectionView contentOffset](self->_attributesCollectionView, "contentOffset");
    v12 = v11;
    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    v13 = v12 + CGRectGetMaxY(v17);
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    Width = CGRectGetWidth(v18);
    -[AVTAvatarAttributeEditorViewController view](self, "view");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    Height = CGRectGetHeight(v19);
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    -[UIView setFrame:](self->_attributesCollectionViewMaskingView, "setFrame:", 0.0, v13, Width, Height - CGRectGetHeight(v20));

  }
}

- (void)collapsibleHeaderController:(id)a3 willUpdateHeaderToHeight:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;

  v6 = a3;
  objc_msgSend(v6, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[AVTAvatarAttributeEditorViewController attributesContainerView](self, "attributesContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  -[AVTAvatarAttributeEditorViewController updateHeaderDependentLayoutWithHeaderFrame:fittingSize:](self, "updateHeaderDependentLayoutWithHeaderFrame:fittingSize:", v9, v11, v13, a4, v15, v16);

  v25 = v6;
  objc_msgSend(v25, "minHeight");
  v18 = v17;
  objc_msgSend(v25, "maxHeight");
  v20 = v19;
  objc_msgSend(v25, "currentHeightForHeader");
  v22 = v21;

  -[AVTAvatarAttributeEditorViewController avtViewThrottler](self, "avtViewThrottler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (vabdd_f64(v22, v18) >= vabdd_f64(v22, v20))
    objc_msgSend(v23, "unthrottle");
  else
    objc_msgSend(v23, "throttle");

  -[AVTAvatarAttributeEditorViewController updateLayoutForAttributesCollectionMaskingView](self, "updateLayoutForAttributesCollectionMaskingView");
}

- (void)collapsibleHeaderController:(id)a3 isUpdatingHeaderWithIncrementalHeight:(double)a4
{
  void *v6;
  int v7;
  void *v8;
  id v9;

  -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAnimatingExpansion");

  if (v7)
  {
    -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "configureLayoutIfNeededWithHeight:", a4);

  }
  -[AVTAvatarAttributeEditorViewController updateLayoutForAttributesCollectionMaskingView](self, "updateLayoutForAttributesCollectionMaskingView");
}

- (void)collapsibleHeaderController:(id)a3 didUpdateHeaderToHeight:(double)a4
{
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;

  -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAnimatingExpansion");

  if (v7)
  {
    -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "configureLayoutIfNeededWithHeight:", a4);

    -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIsAnimatingExpansion:", 0);

  }
  -[AVTAvatarAttributeEditorViewController updateLayoutForAttributesCollectionMaskingView](self, "updateLayoutForAttributesCollectionMaskingView");
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "numberOfSectionsForCategoryAtIndex:", objc_msgSend(v5, "currentCategoryIndex"));

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionControllerForSectionIndex:inCategoryAtIndex:", a4, objc_msgSend(v7, "currentCategoryIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "numberOfItems");
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __objc2_class **v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  AVTAvatarAttributeEditorViewController *v22;
  void *v23;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "section");
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionControllerForSectionIndex:inCategoryAtIndex:", v9, objc_msgSend(v10, "currentCategoryIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "section");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "showsLabel");

  v15 = off_1EA51BDA0;
  if (!v14)
    v15 = off_1EA51BD88;
  -[__objc2_class cellIdentifier](*v15, "cellIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v16, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "updateCell:forItemAtIndex:", v17, objc_msgSend(v6, "row"));
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v6, "section");
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionCoordinatorForSectionAtIndex:inCategoryAtIndex:", v19, objc_msgSend(v20, "currentCategoryIndex"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v21, "delegate");
    v22 = (AVTAvatarAttributeEditorViewController *)objc_claimAutoreleasedReturnValue();

    if (v22 != self)
      objc_msgSend(v21, "setDelegate:", self);
  }
  objc_msgSend(v11, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    objc_msgSend(v11, "setDelegate:", self);

  return v17;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  _QWORD v31[2];
  CGSize result;

  v31[1] = *MEMORY[0x1E0C80C00];
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionForIndex:inCategoryAtIndex:", a5, objc_msgSend(v8, "currentCategoryIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "shouldDisplayTitle") & 1) != 0)
  {
    +[AVTUIFontRepository attributeTitleFont](AVTUIFontRepository, "attributeTitleFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13 + -40.0;
    objc_msgSend(v10, "lineHeight");
    v16 = v15 + v15;
    v30 = *MEMORY[0x1E0CEA098];
    v31[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 1, v17, 0, v14, v16);
    v19 = v18;

    +[AVTUIFontRepository attributeTitleFont](AVTUIFontRepository, "attributeTitleFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_scaledValueForValue:", 18.0);
    v22 = v21;

    if (v22 <= 30.0)
      v23 = v22;
    else
      v23 = 30.0;
    -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    v26 = v25;
    v27 = v19 + v23 * 2.0 + -12.0;

  }
  else
  {
    v26 = *MEMORY[0x1E0C9D820];
    v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v28 = v26;
  v29 = v27;
  result.height = v29;
  result.width = v28;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionForIndex:inCategoryAtIndex:", a5, objc_msgSend(v8, "currentCategoryIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionForIndex:inCategoryAtIndex:", a5 + 1, objc_msgSend(v11, "currentCategoryIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "shouldDisplaySeparatorBeforeSection:", v12) & 1) != 0)
  {
    -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;

    v16 = 1.0;
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D820];
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v17 = v15;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "section");
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionForIndex:inCategoryAtIndex:", v12, objc_msgSend(v13, "currentCategoryIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((id)*MEMORY[0x1E0CEB3B8] == v8)
  {
    +[AVTAttributeEditorSectionHeaderView reuseIdentifier](AVTAttributeEditorSectionHeaderView, "reuseIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v17, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "localizedName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDisplayString:", v18);

    objc_msgSend(v14, "supplementalPicker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSupplementalPicker:", v19);

    objc_msgSend(v16, "setDelegate:", self);
  }
  else
  {
    +[AVTAttributeSectionSeparator reuseIdentifier](AVTAttributeSectionSeparator, "reuseIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v15, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "separatorInsets");
    objc_msgSend(v16, "setEdgeInsets:");
  }

  return v16;
}

- (id)selectedItemInSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sectionItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "sectionItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "isSelected"))
        {
          v12 = v11;

          v5 = v12;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v6 = a5;
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "section");
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionControllerForSectionIndex:inCategoryAtIndex:", v8, objc_msgSend(v9, "currentCategoryIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "row");
  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v10, "sizeForItemAtIndex:fittingSize:", v11, v13, v14);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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

  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionControllerForSectionIndex:inCategoryAtIndex:", a5, objc_msgSend(v8, "currentCategoryIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "edgeInsetsFittingSize:", v11, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "section");
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionControllerForSectionIndex:inCategoryAtIndex:", v10, objc_msgSend(v11, "currentCategoryIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v7;
  v13 = objc_msgSend(v8, "item");

  objc_msgSend(v12, "cell:willDisplayAtIndex:", v14, v13);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "discardContent", a3);
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "section");
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionControllerForSectionIndex:inCategoryAtIndex:", v9, objc_msgSend(v10, "currentCategoryIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorViewController setIsAnimatingHighlight:](self, "setIsAnimatingHighlight:", 1);
  objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v13 = objc_msgSend(v7, "row");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__AVTAvatarAttributeEditorViewController_collectionView_didHighlightItemAtIndexPath___block_invoke;
  v14[3] = &unk_1EA51D520;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v11, "didHighlightItemAtIndex:cell:completionBlock:", v13, v12, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __85__AVTAvatarAttributeEditorViewController_collectionView_didHighlightItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsAnimatingHighlight:", 0);
  objc_msgSend(WeakRetained, "pendingUnhighlightBlock");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "pendingUnhighlightBlock");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  uint64_t v12;
  void (*v13)(id *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __87__AVTAvatarAttributeEditorViewController_collectionView_didUnhighlightItemAtIndexPath___block_invoke;
  v14 = &unk_1EA5200A0;
  objc_copyWeak(&v17, &location);
  v8 = v7;
  v15 = v8;
  v9 = v6;
  v16 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](&v11);
  -[AVTAvatarAttributeEditorViewController setPendingUnhighlightBlock:](self, "setPendingUnhighlightBlock:", v10, v11, v12, v13, v14);
  if (!-[AVTAvatarAttributeEditorViewController isAnimatingHighlight](self, "isAnimatingHighlight"))
    v10[2](v10);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __87__AVTAvatarAttributeEditorViewController_collectionView_didUnhighlightItemAtIndexPath___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1[4], "section");
  objc_msgSend(WeakRetained, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionControllerForSectionIndex:inCategoryAtIndex:", v4, objc_msgSend(v5, "currentCategoryIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "cellForItemAtIndexPath:", a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1[4], "row");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__AVTAvatarAttributeEditorViewController_collectionView_didUnhighlightItemAtIndexPath___block_invoke_2;
  v9[3] = &unk_1EA51D250;
  v9[4] = WeakRetained;
  objc_msgSend(v6, "didUnhighlightItemAtIndex:cell:completionBlock:", v8, v7, v9);

}

uint64_t __87__AVTAvatarAttributeEditorViewController_collectionView_didUnhighlightItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPendingUnhighlightBlock:", 0);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "section");

  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionControllerForSectionIndex:inCategoryAtIndex:", v7, objc_msgSend(v8, "currentCategoryIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend((id)objc_opt_class(), "supportsSelection");
  return (char)v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "section");
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionControllerForSectionIndex:inCategoryAtIndex:", v9, objc_msgSend(v10, "currentCategoryIndex"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v17, "selectedIndex"), objc_msgSend(v6, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateSelectedState:animated:", 0, 0);

  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "valueView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateSelectedState:animated:", 1, 1);

  v16 = objc_msgSend(v6, "row");
  objc_msgSend(v17, "didSelectItemAtIndex:cell:", v16, v14);

}

- (void)sectionHeaderView:(id)a3 didSelectItem:(id)a4 forPicker:(id)a5 sender:(id)a6
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;

  v35 = a4;
  v8 = a6;
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toView:", v18, v11, v13, v15, v17);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "collectionViewLayout");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layoutAttributesForElementsInRect:", v20, v22, v24, v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v29, "count"))
  {
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v20 = v31;
    v22 = v32;
    v24 = v33;
    v26 = v34;

  }
  -[AVTAvatarAttributeEditorViewController updateForSelectionOfSupplementalItem:senderRect:](self, "updateForSelectionOfSupplementalItem:senderRect:", v35, v20, v22, v24, v26);

}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[AVTAvatarAttributeEditorViewController presetSectionItemForIndexPath:](self, "presetSectionItemForIndexPath:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "preloader");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "preloadSectionItem:atIndexPath:", v11, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
  uint64_t v10;
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
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "preloader");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cancelPreloadForSectionItemIndexPath:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (id)presetSectionItemForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "numberOfSectionsForCategoryAtIndex:", objc_msgSend(v6, "currentCategoryIndex"));
  v8 = objc_msgSend(v4, "section");

  if (v7 <= v8)
  {
    v14 = 0;
  }
  else
  {
    -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "section");
    -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sectionControllerForSectionIndex:inCategoryAtIndex:", v10, objc_msgSend(v11, "currentCategoryIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "numberOfItems");
    if (v13 <= objc_msgSend(v4, "item"))
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v12, "prefetchingSectionItemForIndex:", objc_msgSend(v4, "item"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v14;
}

- (void)groupPicker:(id)a3 didDeselectGroupAtIndex:(int64_t)a4
{
  AVTUISetHasDisplayedCategoriesDiscoverability();
}

- (void)groupPicker:(id)a3 didSelectGroupAtIndex:(int64_t)a4 tapped:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v5 = a5;
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "currentCategoryIndex");

  if (v9 == a4)
  {
    if (!v5)
      goto LABEL_11;
  }
  else
  {
    -[AVTAvatarAttributeEditorViewController imageProviderScheduler](self, "imageProviderScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancelAllTasks");

    -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "categoryAtIndex:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "buildUIModelWithSelectedCategory:atIndex:", v12, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTAvatarAttributeEditorViewController environment](self, "environment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inMemoryImageCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[AVTAvatarAttributeEditorViewController environment](self, "environment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "inMemoryImageCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "clearCache");

    }
    -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "reloadWithCategories:currentCategoryIndex:", v14, a4);

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __83__AVTAvatarAttributeEditorViewController_groupPicker_didSelectGroupAtIndex_tapped___block_invoke;
    v29[3] = &unk_1EA51D188;
    v29[4] = self;
    -[AVTAvatarAttributeEditorViewController reloadCollectionViewDataWithCompletion:](self, "reloadCollectionViewDataWithCompletion:", v29);
    -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentCategoryIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    AVTUIEditorSetMostRecentGroupName();
    objc_msgSend(v12, "previewMode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorViewController updateHeaderViewForPreviewModeType:](self, "updateHeaderViewForPreviewModeType:", objc_msgSend(v23, "type"));

  }
  -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v9 == a4;
  if (v24)
  {
    -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scrollToTopPreservingHeaderHeight:animated:", 1, v25);
  }
  else
  {
    -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scrollRectToVisible:animated:", v25, 0.0, 0.0, 1.0, 1.0);
  }

LABEL_11:
  -[AVTAvatarAttributeEditorViewController avtViewSessionProvider](self, "avtViewSessionProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "faceTrackingManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "resumeFaceTrackingIfNeededAnimated:", 1);

}

uint64_t __83__AVTAvatarAttributeEditorViewController_groupPicker_didSelectGroupAtIndex_tapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetAllSectionControllersStateToDefault");
}

- (void)attributeEditorSectionController:(id)a3 didSelectSectionItem:(id)a4
{
  id v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1F03C2B68))
  {
    objc_msgSend(v6, "avatarUpdater");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 1;
  }
  -[AVTAvatarAttributeEditorViewController updateForSelectionOfItem:controller:reloadSections:](self, "updateForSelectionOfItem:controller:reloadSections:", v6, v10, v8);
  if ((AVTUIHasDisplayedCategoriesDiscoverability() & 1) == 0)
  {
    -[AVTAvatarAttributeEditorViewController groupDial](self, "groupDial");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDiscoverability");

  }
}

- (void)attributeEditorSectionController:(id)a3 didDeleteSectionItems:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  objc_msgSend(v20, "section");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "indexOfObject:", v9);

  v11 = v10 - 1;
  if (v10 >= 1)
  {
    -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "editorState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "section");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabledMulticolorSubpickersIndex:forMulticolorPickerIdentifier:", v11, v15);

    objc_msgSend(v20, "section");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sectionItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateAvatarByDeletingSectionItems:animated:", v6, 1);

    -[AVTAvatarAttributeEditorViewController updateForSelectionOfItem:controller:reloadSections:](self, "updateForSelectionOfItem:controller:reloadSections:", v18, v20, 1);
  }

}

- (void)attributeEditorSectionController:(id)a3 didUpdateSectionItem:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v5 = a4;
  if (-[AVTAvatarAttributeEditorViewController allowFacetracking](self, "allowFacetracking"))
  {
    -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateAvatarBySelectingSectionItem:animated:", v5, 0);

  }
  else
  {
    -[AVTAvatarAttributeEditorViewController lastPosedAvatarImageRenderingTime](self, "lastPosedAvatarImageRenderingTime");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7
      || (v8 = (void *)v7,
          -[AVTAvatarAttributeEditorViewController lastPosedAvatarImageRenderingTime](self, "lastPosedAvatarImageRenderingTime"), v9 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v9, "timeIntervalSinceNow"), v11 = v10, v9, v8, v11 < -0.05))
    {
      v12 = (void *)objc_opt_new();
      -[AVTAvatarAttributeEditorViewController setLastPosedAvatarImageRenderingTime:](self, "setLastPosedAvatarImageRenderingTime:", v12);

      -[AVTAvatarAttributeEditorViewController headerPreviewScheduler](self, "headerPreviewScheduler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cancelAllTasks");

      -[AVTAvatarAttributeEditorViewController headerPreviewScheduler](self, "headerPreviewScheduler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __96__AVTAvatarAttributeEditorViewController_attributeEditorSectionController_didUpdateSectionItem___block_invoke;
      v15[3] = &unk_1EA5200C8;
      v15[4] = self;
      v16 = v5;
      objc_msgSend(v14, "scheduleTask:", v15);

    }
  }

}

void __96__AVTAvatarAttributeEditorViewController_attributeEditorSectionController_didUpdateSectionItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "modelManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateAvatarBySelectingSectionItem:animated:", *(_QWORD *)(a1 + 40), 0);

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__AVTAvatarAttributeEditorViewController_attributeEditorSectionController_didUpdateSectionItem___block_invoke_2;
  v7[3] = &unk_1EA51D810;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "updateImageViewWithPosedAvatarRecordForcingRender:completionHandler:", 1, v7);

}

uint64_t __96__AVTAvatarAttributeEditorViewController_attributeEditorSectionController_didUpdateSectionItem___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)attributeEditorSectionControllerNeedsLayoutUpdate:(id)a3
{
  id v3;

  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performBatchUpdates:completion:", 0, 0);

}

- (void)updateForSelectionOfItem:(id)a3 controller:(id)a4 reloadSections:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;

  v5 = a5;
  v31 = a3;
  v8 = a4;
  objc_msgSend(v8, "section");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "indexForItem:", v31);
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "indexForSection:inCategoryAtIndex:", v9, objc_msgSend(v12, "currentCategoryIndex"));

  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't get an index path for item %@ in section %@"), v31, v9);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "indexPathsForVisibleItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", v14);

  if (v17)
  {
    -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutAttributesForItemAtIndexPath:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "frame");
    v21 = v20;
    v23 = v22;
    -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    objc_msgSend(v8, "sizeForFocusingItemAtIndex:fittingSize:", v10, v25, v26);
    v28 = v27;
    v30 = v29;

    -[AVTAvatarAttributeEditorViewController updateForSelectionOfItem:inSection:senderRect:reloadSections:](self, "updateForSelectionOfItem:inSection:senderRect:reloadSections:", v31, v9, v5, v21, v23, v28, v30);
  }

}

- (void)updateForSelectionOfItem:(id)a3 inSection:(id)a4 senderRect:(CGRect)a5 reloadSections:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a4;
  v13 = a3;
  -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateAvatarBySelectingSectionItem:animated:", v13, 1);

  -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateEditorStateBySelectingSectionItem:animated:", v13, 1);

  -[AVTAvatarAttributeEditorViewController rebuildUIModelAfterSelectionInSection:senderRect:reloadSections:](self, "rebuildUIModelAfterSelectionInSection:senderRect:reloadSections:", v16, v6, x, y, width, height);
}

- (void)updateForSelectionOfSupplementalItem:(id)a3 senderRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateAvatarBySelectingSupplementalPickerItem:animated:", v9, 1);

  -[AVTAvatarAttributeEditorViewController rebuildUIModelAfterSelectionInSection:senderRect:](self, "rebuildUIModelAfterSelectionInSection:senderRect:", 0, x, y, width, height);
}

- (void)rebuildUIModelAfterSelectionInSection:(id)a3 senderRect:(CGRect)a4
{
  -[AVTAvatarAttributeEditorViewController rebuildUIModelAfterSelectionInSection:senderRect:reloadSections:](self, "rebuildUIModelAfterSelectionInSection:senderRect:reloadSections:", a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)rebuildUIModelAfterSelectionInSection:(id)a3 senderRect:(CGRect)a4 reloadSections:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[5];
  id v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[5];
  id v62;
  id v63;
  _QWORD v64[3];

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v64[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v56 = v11;
  if (v11)
  {
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
    v13 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = MEMORY[0x1E0C9AA60];
  }
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "currentCategoryIndex");

  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "categoryAtIndex:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorViewController modelManager](self, "modelManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "buildUIModelWithSelectedCategory:atIndex:", v17, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "objectAtIndex:", v15);
  v20 = objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController environment](self, "environment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "inMemoryImageCache");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    -[AVTAvatarAttributeEditorViewController environment](self, "environment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "inMemoryImageCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "clearCache");

  }
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v19;
  objc_msgSend(v26, "reloadWithCategories:currentCategoryIndex:", v19, v15);

  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "indexesForSectionsPresentIn:butNotIn:", v20, v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "indexesForSectionsExcludingSectionsWithIdentifiers:inCategoryAtIndex:", v13, v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addIndexes:", v31);

    objc_msgSend(v29, "removeIndexes:", v28);
  }
  v55 = (void *)v13;
  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v20;
  objc_msgSend(v32, "indexesForSectionsPresentIn:butNotIn:", v17, v20);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorViewController dataSource](self, "dataSource");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "numberOfSectionsForCategoryAtIndex:", v15);

  -[AVTAvatarAttributeEditorViewController setCollectionViewIsPerformingBatchUpdates:](self, "setCollectionViewIsPerformingBatchUpdates:", 1);
  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __106__AVTAvatarAttributeEditorViewController_rebuildUIModelAfterSelectionInSection_senderRect_reloadSections___block_invoke;
  v61[3] = &unk_1EA51D5C0;
  v61[4] = self;
  v38 = v33;
  v62 = v38;
  v39 = v28;
  v63 = v39;
  v57[0] = v37;
  v57[1] = 3221225472;
  v57[2] = __106__AVTAvatarAttributeEditorViewController_rebuildUIModelAfterSelectionInSection_senderRect_reloadSections___block_invoke_2;
  v57[3] = &unk_1EA5200F0;
  v57[4] = self;
  v59 = v15;
  v60 = v35;
  v40 = v29;
  v58 = v40;
  objc_msgSend(v36, "performBatchUpdates:completion:", v61, v57);

  if (!-[AVTAvatarAttributeEditorViewController allowFacetracking](self, "allowFacetracking"))
    -[AVTAvatarAttributeEditorViewController updateImageViewWithPosedAvatarRecordForcingRender:completionHandler:](self, "updateImageViewWithPosedAvatarRecordForcingRender:completionHandler:", 1, 0);
  -[AVTAvatarAttributeEditorViewController attributesCollectionView](self, "attributesCollectionView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  v43 = v42;
  -[AVTAvatarAttributeEditorViewController environment](self, "environment");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarAttributeEditorSectionController edgeLengthFittingWidth:environment:](AVTAvatarAttributeEditorSectionController, "edgeLengthFittingWidth:environment:", v44, v43);
  v46 = v45;

  objc_msgSend(v17, "previewMode");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "type");

  if (v48 == 1)
  {
    -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setIsAnimatingExpansion:", 1);

  }
  -[AVTAvatarAttributeEditorViewController collapsibleHeaderController](self, "collapsibleHeaderController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "expandAnimated:withFocusRect:standardItemHeight:", 1, x, y, width, height, v46);

  -[AVTAvatarAttributeEditorViewController updateForChangedSelectionIfNeeded](self, "updateForChangedSelectionIfNeeded");
  -[AVTAvatarAttributeEditorViewController avtViewSessionProvider](self, "avtViewSessionProvider");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "faceTrackingManager");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "resumeFaceTrackingIfNeededAnimated:", 1);

  -[AVTAvatarAttributeEditorViewController updateBodyEditorHeaderIfNeeded](self, "updateBodyEditorHeaderIfNeeded");
}

void __106__AVTAvatarAttributeEditorViewController_rebuildUIModelAfterSelectionInSection_senderRect_reloadSections___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "attributesCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteSections:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "attributesCollectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertSections:", *(_QWORD *)(a1 + 48));

}

void __106__AVTAvatarAttributeEditorViewController_rebuildUIModelAfterSelectionInSection_senderRect_reloadSections___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "setCollectionViewIsPerformingBatchUpdates:", 0);
  objc_msgSend(*(id *)(a1 + 32), "pendingCollectionViewReloadDataBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingCollectionViewReloadDataBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setPendingCollectionViewReloadDataBlock:", 0);
  }
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == objc_msgSend(v10, "currentCategoryIndex"))
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfSectionsForCategoryAtIndex:", *(_QWORD *)(a1 + 48));
    v7 = *(_QWORD *)(a1 + 56);

    if (v6 == v7)
    {
      v8 = (void *)MEMORY[0x1E0CEABB0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __106__AVTAvatarAttributeEditorViewController_rebuildUIModelAfterSelectionInSection_senderRect_reloadSections___block_invoke_3;
      v11[3] = &unk_1EA51D570;
      v9 = *(void **)(a1 + 40);
      v11[4] = *(_QWORD *)(a1 + 32);
      v12 = v9;
      objc_msgSend(v8, "performWithoutAnimation:", v11);

    }
  }
  else
  {

  }
}

void __106__AVTAvatarAttributeEditorViewController_rebuildUIModelAfterSelectionInSection_senderRect_reloadSections___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "attributesCollectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSections:", *(_QWORD *)(a1 + 40));

}

- (void)updateForChangedSelectionIfNeeded
{
  id v3;

  if (!-[AVTAvatarAttributeEditorViewController hasMadeAnySelection](self, "hasMadeAnySelection"))
  {
    -[AVTAvatarAttributeEditorViewController setHasMadeAnySelection:](self, "setHasMadeAnySelection:", 1);
    -[AVTAvatarAttributeEditorViewController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributeEditorDidMakeFirstSelection:", self);

  }
}

- (void)updateBodyEditorHeaderIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadDisplayedSticker");

    -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AVTAvatarAttributeEditorViewController bodyEditorHeaderViewController](self, "bodyEditorHeaderViewController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateStickersforVisibleCells");

    }
  }
}

- (int64_t)interfaceOrientationForFaceTrackingManager:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[AVTAvatarAttributeEditorViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_windowInterfaceOrientation");

  return v5;
}

- (AVTAvatarAttributeEditorViewControllerDelegate)delegate
{
  return (AVTAvatarAttributeEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)disableAvatarSnapshotting
{
  return self->_disableAvatarSnapshotting;
}

- (void)setDisableAvatarSnapshotting:(BOOL)a3
{
  self->_disableAvatarSnapshotting = a3;
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (unint64_t)editorPresentationContext
{
  return self->_editorPresentationContext;
}

- (void)setEditorPresentationContext:(unint64_t)a3
{
  self->_editorPresentationContext = a3;
}

- (AVTAvatarAttributeEditorLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayout, a3);
}

- (AVTAvatarAttributeEditorModelManager)modelManager
{
  return self->_modelManager;
}

- (AVTTaskScheduler)imageProviderScheduler
{
  return self->_imageProviderScheduler;
}

- (UIView)attributesContainerView
{
  return self->_attributesContainerView;
}

- (void)setAttributesContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_attributesContainerView, a3);
}

- (UIView)sideGroupContainerView
{
  return self->_sideGroupContainerView;
}

- (void)setSideGroupContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_sideGroupContainerView, a3);
}

- (UIView)groupDialContainerView
{
  return self->_groupDialContainerView;
}

- (void)setGroupDialContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_groupDialContainerView, a3);
}

- (AVTGroupDial)groupDial
{
  return self->_groupDial;
}

- (void)setGroupDial:(id)a3
{
  objc_storeStrong((id *)&self->_groupDial, a3);
}

- (AVTGroupListCollectionView)groupListView
{
  return self->_groupListView;
}

- (void)setGroupListView:(id)a3
{
  objc_storeStrong((id *)&self->_groupListView, a3);
}

- (AVTBodyCarouselController)bodyEditorHeaderViewController
{
  return self->_bodyEditorHeaderViewController;
}

- (void)setBodyEditorHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_bodyEditorHeaderViewController, a3);
}

- (UIView)attributesCollectionViewMaskingView
{
  return self->_attributesCollectionViewMaskingView;
}

- (void)setAttributesCollectionViewMaskingView:(id)a3
{
  objc_storeStrong((id *)&self->_attributesCollectionViewMaskingView, a3);
}

- (UIView)headerMaskingView
{
  return self->_headerMaskingView;
}

- (void)setHeaderMaskingView:(id)a3
{
  objc_storeStrong((id *)&self->_headerMaskingView, a3);
}

- (UIView)headerContainerView
{
  return self->_headerContainerView;
}

- (void)setHeaderContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_headerContainerView, a3);
}

- (AVTShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (UICollectionView)attributesCollectionView
{
  return self->_attributesCollectionView;
}

- (void)setAttributesCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_attributesCollectionView, a3);
}

- (AVTAvatarAttributeEditorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (AVTAttributeEditorAnimationCoordinator)animationCoordinator
{
  return self->_animationCoordinator;
}

- (void)setAnimationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_animationCoordinator, a3);
}

- (UILabel)alphaAssetsLabel
{
  return self->_alphaAssetsLabel;
}

- (void)setAlphaAssetsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_alphaAssetsLabel, a3);
}

- (UIView)verticleRuleContainer
{
  return self->_verticleRuleContainer;
}

- (void)setVerticleRuleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_verticleRuleContainer, a3);
}

- (CALayer)verticleRule
{
  return self->_verticleRule;
}

- (void)setVerticleRule:(id)a3
{
  objc_storeStrong((id *)&self->_verticleRule, a3);
}

- (AVTViewSessionProvider)avtViewSessionProvider
{
  return self->_avtViewSessionProvider;
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewSession, a3);
}

- (AVTCollapsibleHeaderController)collapsibleHeaderController
{
  return self->_collapsibleHeaderController;
}

- (void)setCollapsibleHeaderController:(id)a3
{
  objc_storeStrong((id *)&self->_collapsibleHeaderController, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (AVTViewThrottler)avtViewThrottler
{
  return self->_avtViewThrottler;
}

- (void)setAvtViewThrottler:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewThrottler, a3);
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarEditorColorsState)colorsState
{
  return self->_colorsState;
}

- (void)setColorsState:(id)a3
{
  objc_storeStrong((id *)&self->_colorsState, a3);
}

- (id)postSessionDidBecomeActiveHandler
{
  return self->_postSessionDidBecomeActiveHandler;
}

- (void)setPostSessionDidBecomeActiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (BOOL)isCreating
{
  return self->_isCreating;
}

- (BOOL)hasMadeAnySelection
{
  return self->_hasMadeAnySelection;
}

- (void)setHasMadeAnySelection:(BOOL)a3
{
  self->_hasMadeAnySelection = a3;
}

- (AVTImageTransitioningContainerView)transitioningContainer
{
  return self->_transitioningContainer;
}

- (void)setTransitioningContainer:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningContainer, a3);
}

- (AVTTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)setCurrentTransition:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransition, a3);
}

- (NSDate)lastPosedAvatarImageRenderingTime
{
  return self->_lastPosedAvatarImageRenderingTime;
}

- (void)setLastPosedAvatarImageRenderingTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastPosedAvatarImageRenderingTime, a3);
}

- (BOOL)isAnimatingHighlight
{
  return self->_isAnimatingHighlight;
}

- (void)setIsAnimatingHighlight:(BOOL)a3
{
  self->_isAnimatingHighlight = a3;
}

- (id)pendingUnhighlightBlock
{
  return self->_pendingUnhighlightBlock;
}

- (void)setPendingUnhighlightBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1232);
}

- (BOOL)allowFacetracking
{
  return self->_allowFacetracking;
}

- (void)setAllowFacetracking:(BOOL)a3
{
  self->_allowFacetracking = a3;
}

- (_AVTAvatarRecordImageProvider)headerPreviewImageRenderer
{
  return self->_headerPreviewImageRenderer;
}

- (void)setHeaderPreviewImageRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_headerPreviewImageRenderer, a3);
}

- (AVTTaskScheduler)headerPreviewScheduler
{
  return self->_headerPreviewScheduler;
}

- (BOOL)collectionViewIsPerformingBatchUpdates
{
  return self->_collectionViewIsPerformingBatchUpdates;
}

- (void)setCollectionViewIsPerformingBatchUpdates:(BOOL)a3
{
  self->_collectionViewIsPerformingBatchUpdates = a3;
}

- (id)pendingCollectionViewReloadDataBlock
{
  return self->_pendingCollectionViewReloadDataBlock;
}

- (void)setPendingCollectionViewReloadDataBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1256);
}

- (unint64_t)previewModeType
{
  return self->_previewModeType;
}

- (void)setPreviewModeType:(unint64_t)a3
{
  self->_previewModeType = a3;
}

- (AVTViewCarouselLayout)avtViewLayout
{
  return self->_avtViewLayout;
}

- (void)setAvtViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avtViewLayout, 0);
  objc_storeStrong(&self->_pendingCollectionViewReloadDataBlock, 0);
  objc_storeStrong((id *)&self->_headerPreviewScheduler, 0);
  objc_storeStrong((id *)&self->_headerPreviewImageRenderer, 0);
  objc_storeStrong(&self->_pendingUnhighlightBlock, 0);
  objc_storeStrong((id *)&self->_lastPosedAvatarImageRenderingTime, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_transitioningContainer, 0);
  objc_storeStrong(&self->_postSessionDidBecomeActiveHandler, 0);
  objc_storeStrong((id *)&self->_colorsState, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avtViewThrottler, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_collapsibleHeaderController, 0);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_avtViewSessionProvider, 0);
  objc_storeStrong((id *)&self->_verticleRule, 0);
  objc_storeStrong((id *)&self->_verticleRuleContainer, 0);
  objc_storeStrong((id *)&self->_alphaAssetsLabel, 0);
  objc_storeStrong((id *)&self->_animationCoordinator, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_attributesCollectionView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_headerContainerView, 0);
  objc_storeStrong((id *)&self->_headerMaskingView, 0);
  objc_storeStrong((id *)&self->_attributesCollectionViewMaskingView, 0);
  objc_storeStrong((id *)&self->_bodyEditorHeaderViewController, 0);
  objc_storeStrong((id *)&self->_groupListView, 0);
  objc_storeStrong((id *)&self->_groupDial, 0);
  objc_storeStrong((id *)&self->_groupDialContainerView, 0);
  objc_storeStrong((id *)&self->_sideGroupContainerView, 0);
  objc_storeStrong((id *)&self->_attributesContainerView, 0);
  objc_storeStrong((id *)&self->_imageProviderScheduler, 0);
  objc_storeStrong((id *)&self->_modelManager, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)selectCategory:(id)a3 withCompletionDelay:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  AVTAvatarAttributeEditorDataSource *dataSource;
  id v10;
  void *v11;
  uint64_t v12;
  dispatch_time_t v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  dataSource = self->_dataSource;
  v10 = a5;
  -[AVTAvatarAttributeEditorDataSource groupPickerItemsForCategories](dataSource, "groupPickerItemsForCategories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __117__AVTAvatarAttributeEditorViewController_UIApplicationTesting__selectCategory_withCompletionDelay_completionHandler___block_invoke;
  v15[3] = &unk_1EA520118;
  v16 = v8;
  v14 = v8;
  v12 = objc_msgSend(v11, "indexOfObjectPassingTest:", v15);

  -[AVTGroupDial setSelectedGroupIndex:animated:](self->_groupDial, "setSelectedGroupIndex:animated:", v12, 0);
  -[AVTAvatarAttributeEditorViewController groupPicker:didSelectGroupAtIndex:tapped:](self, "groupPicker:didSelectGroupAtIndex:tapped:", self->_groupDial, v12, 1);
  v13 = dispatch_time(0, 1000000000 * a4);
  dispatch_after(v13, MEMORY[0x1E0C80D38], v10);

}

uint64_t __117__AVTAvatarAttributeEditorViewController_UIApplicationTesting__selectCategory_withCompletionDelay_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)prepareForPresetsScrollTestOnCategory:(id)a3 readyHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __115__AVTAvatarAttributeEditorViewController_UIApplicationTesting__prepareForPresetsScrollTestOnCategory_readyHandler___block_invoke;
  v8[3] = &unk_1EA51D058;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[AVTAvatarAttributeEditorViewController selectCategory:withCompletionDelay:completionHandler:](self, "selectCategory:withCompletionDelay:completionHandler:", a3, 3, v8);

}

uint64_t __115__AVTAvatarAttributeEditorViewController_UIApplicationTesting__prepareForPresetsScrollTestOnCategory_readyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096));
}

- (void)configurePPTMemoji:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke;
  v6[3] = &unk_1EA51D490;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AVTAvatarAttributeEditorViewController selectCategory:withCompletionDelay:completionHandler:](self, "selectCategory:withCompletionDelay:completionHandler:", CFSTR("Skin"), 1, v6);

}

void __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 13, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "section");
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionControllerForSectionIndex:inCategoryAtIndex:", v4, objc_msgSend(v5, "currentCategoryIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "selectIndexPath:", v2);
  v7 = dispatch_time(0, 1000000000);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_2;
  v9[3] = &unk_1EA51D490;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  dispatch_after(v7, MEMORY[0x1E0C80D38], v9);

}

void __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_3;
  v2[3] = &unk_1EA51D490;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "selectCategory:withCompletionDelay:completionHandler:", CFSTR("Hairstyle"), 1, v2);

}

void __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "section");
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionControllerForSectionIndex:inCategoryAtIndex:", v4, objc_msgSend(v5, "currentCategoryIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "selectIndexPath:", v2);
  v7 = *(_QWORD **)(a1 + 32);
  v8 = v7[137];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 9, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView:didSelectItemAtIndexPath:", v8, v9);

  v10 = dispatch_time(0, 1000000000);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_4;
  v12[3] = &unk_1EA51D490;
  v11 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v11;
  dispatch_after(v10, MEMORY[0x1E0C80D38], v12);

}

void __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_5;
  v2[3] = &unk_1EA51D490;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "selectCategory:withCompletionDelay:completionHandler:", CFSTR("Eyes"), 1, v2);

}

void __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "section");
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionControllerForSectionIndex:inCategoryAtIndex:", v3, objc_msgSend(v4, "currentCategoryIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "selectIndexPath:", v7);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

@end
