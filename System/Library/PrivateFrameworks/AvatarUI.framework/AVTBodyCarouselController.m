@implementation AVTBodyCarouselController

+ (id)newCollectionViewLayoutForEngagedCellSize:(CGSize)a3 boundsSize:(CGSize)a4 environment:(id)a5
{
  double width;
  double height;
  double v7;
  id v8;
  int v9;
  _BOOL4 v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  AVTEngagementLayout *v16;
  AVTEngagementLayout *v17;
  AVTZIndexEngagementListCollectionViewLayout *v18;
  _QWORD v20[6];
  char v21;

  width = a4.width;
  height = a3.height;
  v7 = a3.width;
  v8 = a5;
  v9 = objc_msgSend(v8, "deviceIsPad");
  v10 = width > 400.0;
  v11 = v9 & v10;
  v12 = 0.3;
  if ((v9 & v10) != 0)
    v13 = 0.2;
  else
    v13 = 0.3;
  if ((v9 & v10) == 0)
    v12 = 0.7;
  v14 = v7 * v12;
  v15 = height * v12;
  v16 = [AVTEngagementLayout alloc];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__AVTBodyCarouselController_newCollectionViewLayoutForEngagedCellSize_boundsSize_environment___block_invoke;
  v20[3] = &__block_descriptor_49_e8_d16__0d8l;
  *(double *)&v20[4] = v14;
  *(double *)&v20[5] = v15;
  v21 = v11;
  v17 = -[AVTEngagementLayout initWithDefaultCellSize:engagedCellSize:useEngagementSpacing:interItemSpacingProvider:](v16, "initWithDefaultCellSize:engagedCellSize:useEngagementSpacing:interItemSpacingProvider:", v11, v20, v14, v15, v7, height);
  v18 = -[AVTZIndexEngagementListCollectionViewLayout initWithEngagementLayout:minAlphaFactor:environment:]([AVTZIndexEngagementListCollectionViewLayout alloc], "initWithEngagementLayout:minAlphaFactor:environment:", v17, v8, v13);

  return v18;
}

double __94__AVTBodyCarouselController_newCollectionViewLayoutForEngagedCellSize_boundsSize_environment___block_invoke(uint64_t a1, double a2)
{
  double v2;

  v2 = 24.0;
  if (!*(_BYTE *)(a1 + 48))
    v2 = -22.0;
  return v2 + (*(double *)(a1 + 32) / -3.0 - v2) * a2;
}

- (AVTBodyCarouselController)initWithEnvironment:(id)a3 avatarRecord:(id)a4
{
  return -[AVTBodyCarouselController initWithEnvironment:avatarRecord:editorPresentationContext:](self, "initWithEnvironment:avatarRecord:editorPresentationContext:", a3, a4, 0);
}

- (AVTBodyCarouselController)initWithEnvironment:(id)a3 avatarRecord:(id)a4 editorPresentationContext:(unint64_t)a5
{
  return -[AVTBodyCarouselController initWithEnvironment:initialAVTViewLayout:avatarRecord:editorPresentationContext:](self, "initWithEnvironment:initialAVTViewLayout:avatarRecord:editorPresentationContext:", a3, 0, a4, a5);
}

- (AVTBodyCarouselController)initWithEnvironment:(id)a3 initialAVTViewLayout:(id)a4 avatarRecord:(id)a5 editorPresentationContext:(unint64_t)a6
{
  AVTUIEnvironment *v10;
  id v11;
  id v12;
  AVTBodyCarouselController *v13;
  uint64_t v14;
  AVTUILogger *logger;
  uint64_t v16;
  AVTTransitionCoordinator *transitionCoordinator;
  uint64_t v18;
  NSArray *configurations;
  void *v20;
  uint64_t v21;
  AVTStickerConfiguration *displayedConfiguration;
  uint64_t v23;
  AVTSerialTaskScheduler *scheduler;
  AVTUIStickerGeneratorPool *v25;
  AVTUIStickerGeneratorPool *generatorPool;
  AVTUIStickerRenderer *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  AVTUIStickerRenderer *renderer;
  objc_super v33;

  v10 = (AVTUIEnvironment *)a3;
  v11 = a4;
  v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)AVTBodyCarouselController;
  v13 = -[AVTBodyCarouselController init](&v33, sel_init);
  if (v13)
  {
    -[AVTUIEnvironment logger](v10, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v14;

    v13->_environment = v10;
    +[AVTTransitionCoordinator synchronousTransitionCoordinator](AVTTransitionCoordinator, "synchronousTransitionCoordinator");
    v16 = objc_claimAutoreleasedReturnValue();
    transitionCoordinator = v13->_transitionCoordinator;
    v13->_transitionCoordinator = (AVTTransitionCoordinator *)v16;

    v13->_decelerationRate = *(double *)MEMORY[0x1E0CEBBA0];
    objc_storeStrong((id *)&v13->_avtViewLayout, a4);
    -[AVTBodyCarouselController configurationsForEditorPresentationContext:](v13, "configurationsForEditorPresentationContext:", a6);
    v18 = objc_claimAutoreleasedReturnValue();
    configurations = v13->_configurations;
    v13->_configurations = (NSArray *)v18;

    -[AVTBodyCarouselController configurations](v13, "configurations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v21 = objc_claimAutoreleasedReturnValue();
    displayedConfiguration = v13->_displayedConfiguration;
    v13->_displayedConfiguration = (AVTStickerConfiguration *)v21;

    +[AVTSerialTaskScheduler fifoScheduler](AVTSerialTaskScheduler, "fifoScheduler");
    v23 = objc_claimAutoreleasedReturnValue();
    scheduler = v13->_scheduler;
    v13->_scheduler = (AVTSerialTaskScheduler *)v23;

    v25 = -[AVTUIStickerGeneratorPool initWithMaxStickerGeneratorCount:]([AVTUIStickerGeneratorPool alloc], "initWithMaxStickerGeneratorCount:", 1);
    generatorPool = v13->_generatorPool;
    v13->_generatorPool = v25;

    objc_storeStrong((id *)&v13->_displayedRecord, a5);
    v27 = [AVTUIStickerRenderer alloc];
    -[AVTBodyCarouselController generatorPool](v13, "generatorPool");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTBodyCarouselController scheduler](v13, "scheduler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[AVTUIStickerRenderer initWithAvatarRecord:stickerGeneratorPool:scheduler:imageStore:](v27, "initWithAvatarRecord:stickerGeneratorPool:scheduler:imageStore:", v12, v28, v29, 0);
    renderer = v13->_renderer;
    v13->_renderer = (AVTUIStickerRenderer *)v30;

  }
  return v13;
}

- (id)configurationsForEditorPresentationContext:(unint64_t)a3
{
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = (id *)MEMORY[0x1E0D006B8];
  if (a3 == 1)
    v3 = (id *)MEMORY[0x1E0D006C0];
  v4 = *v3;
  if (AVTUIShowPrereleaseStickerPack_once())
  {
    AVTPrereleaseStickerPackForStickerPack();
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  objc_msgSend(MEMORY[0x1E0D00690], "stickerConfigurationsForMemojiInStickerPack:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIView)view
{
  if (!-[AVTBodyCarouselController isViewLoaded](self, "isViewLoaded"))
    -[AVTBodyCarouselController loadView](self, "loadView");
  return self->_view;
}

- (BOOL)isViewLoaded
{
  return self->_view != 0;
}

- (void)setDecelerationRate:(double)a3
{
  id v4;

  if (self->_decelerationRate != a3)
  {
    self->_decelerationRate = a3;
    -[AVTBodyCarouselController collectionView](self, "collectionView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDecelerationRate:", a3);

  }
}

- (id)configureLayoutIfNeededWithHeight:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;

  -[AVTBodyCarouselController avtViewLayout](self, "avtViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVTBodyCarouselController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7 * 0.85;

    -[AVTBodyCarouselController avtViewLayout](self, "avtViewLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avatarViewSizeForAvailableContentSize:", v8, a3 * 0.85);
    -[AVTBodyCarouselController setCenterCellSize:](self, "setCenterCellSize:");

    -[AVTBodyCarouselController collectionViewLayout](self, "collectionViewLayout");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_6;
    v11 = (void *)v10;
    -[AVTBodyCarouselController collectionViewLayout](self, "collectionViewLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "engagementLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "engagedCellSize");
    v15 = v14;
    v17 = v16;
    -[AVTBodyCarouselController centerCellSize](self, "centerCellSize");
    v19 = v18;
    v21 = v20;

    if (v15 != v19)
      goto LABEL_6;
    if (v17 == v21)
    {
      v5 = 0;
    }
    else
    {
LABEL_6:
      -[AVTBodyCarouselController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v24 = v23;

      v25 = (void *)objc_opt_class();
      -[AVTBodyCarouselController centerCellSize](self, "centerCellSize");
      v27 = v26;
      v29 = v28;
      -[AVTBodyCarouselController environment](self, "environment");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v25, "newCollectionViewLayoutForEngagedCellSize:boundsSize:environment:", v30, v27, v29, v24, a3);

      -[AVTBodyCarouselController configurations](self, "configurations");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTBodyCarouselController displayedConfiguration](self, "displayedConfiguration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "indexOfObject:", v32);

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v33, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackIndexPath:", v34);

      -[AVTBodyCarouselController setCollectionViewLayout:](self, "setCollectionViewLayout:", v5);
      -[AVTBodyCarouselController collectionView](self, "collectionView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        -[AVTBodyCarouselController collectionView](self, "collectionView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setCollectionViewLayout:", v5);

      }
    }
  }
  return v5;
}

- (void)buildCollectionViewAndConfigureLayoutIfNeeded
{
  void *v3;
  double v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  AVTCenteringCollectionViewDelegate *v9;
  void *v10;
  AVTCenteringCollectionViewDelegate *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[AVTBodyCarouselController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[AVTBodyCarouselController configureLayoutIfNeededWithHeight:](self, "configureLayoutIfNeededWithHeight:", v4);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && v19)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEA410]);
    -[AVTBodyCarouselController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = (void *)objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v19);

    v9 = [AVTCenteringCollectionViewDelegate alloc];
    -[AVTBodyCarouselController environment](self, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AVTCenteringCollectionViewDelegate initWithCollectionView:delegate:environment:](v9, "initWithCollectionView:delegate:environment:", v8, self, v10);
    -[AVTBodyCarouselController setCenteringDelegate:](self, "setCenteringDelegate:", v11);

    -[AVTBodyCarouselController centeringDelegate](self, "centeringDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v12);

    objc_msgSend(v8, "setDataSource:", self);
    -[AVTBodyCarouselController decelerationRate](self, "decelerationRate");
    objc_msgSend(v8, "setDecelerationRate:");
    objc_msgSend(v8, "setAllowsSelection:", 0);
    v13 = objc_opt_class();
    +[AVTAvatarListCell reuseIdentifier](AVTAvatarListCell, "reuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", v13, v14);

    v15 = objc_opt_class();
    +[AVTCollectionViewCell reuseIdentifier](AVTCollectionViewCell, "reuseIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", v15, v16);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v17);

    objc_msgSend(v8, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v8, "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(v8, "setContentInsetAdjustmentBehavior:", 2);
    objc_msgSend(v8, "setAutoresizingMask:", 18);
    -[AVTBodyCarouselController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v8);

    -[AVTBodyCarouselController setCollectionView:](self, "setCollectionView:", v8);
  }

}

- (void)loadView
{
  AVTNotifyingContainerView *v3;
  AVTNotifyingContainerView *v4;

  v3 = [AVTNotifyingContainerView alloc];
  v4 = -[AVTNotifyingContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AVTNotifyingContainerView setDelegate:](v4, "setDelegate:", self);
  -[AVTBodyCarouselController setView:](self, "setView:", v4);

}

- (void)reloadDisplayedSticker
{
  void *v3;
  void *v4;
  id v5;
  uint64_t (**v6)(id, void *, _QWORD);

  -[AVTBodyCarouselController renderer](self, "renderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTBodyCarouselController displayedConfiguration](self, "displayedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduledStickerResourceProviderForStickerConfiguration:correctClipping:", v4, 0);
  v6 = (uint64_t (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();

  v5 = (id)v6[2](v6, &__block_literal_global_1, 0);
}

- (void)scrollToDisplayedConfiguration
{
  id v3;

  -[AVTBodyCarouselController displayedConfiguration](self, "displayedConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTBodyCarouselController scrollToViewForConfiguration:animated:](self, "scrollToViewForConfiguration:animated:", v3, 0);

}

- (void)scrollToViewForConfiguration:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (v8)
  {
    -[AVTBodyCarouselController configurations](self, "configurations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v8);

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
  }
  else
  {
    v7 = 0;
  }
  -[AVTBodyCarouselController scrollToViewAtIndex:animated:](self, "scrollToViewAtIndex:animated:", v7, v4);
LABEL_6:

}

- (void)scrollToViewAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTBodyCarouselController collectionViewLayout](self, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v26, "item");
  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  objc_msgSend(v6, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v7, v10, v12, v14, v15);
  v17 = v16;
  v19 = v18;

  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v20, v17, v19);
  v22 = v21;
  v24 = v23;

  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setContentOffset:animated:", v4, v22, v24);

}

- (id)indexPathForItemClosestToCenter
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v8, v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)cellForConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AVTBodyCarouselController configurations](self, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("List item not found %@"), v4);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)shouldCurrentlyDisplayedConfigurationTransitionToLive
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;

  -[AVTBodyCarouselController configurations](self, "configurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTBodyCarouselController displayedConfiguration](self, "displayedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[AVTBodyCarouselController collectionViewLayout](self, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  objc_msgSend(v7, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v5, v10, v12, v14, v15);
  v17 = v16;
  v19 = v18;

  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v20, v17, v19);
  v22 = v21;

  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentOffset");
  v6 = vabdd_f64(v22, v24) < 1.0;

  return v6;
}

- (void)updateDisplayedConfigurationIfNeeded
{
  void *v3;
  id v4;

  -[AVTBodyCarouselController indexPathForItemClosestToCenter](self, "indexPathForItemClosestToCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[AVTBodyCarouselController setDisplayedConfigurationFromIndex:](self, "setDisplayedConfigurationFromIndex:", objc_msgSend(v3, "item"));
    v3 = v4;
  }

}

- (void)setDisplayedConfigurationFromIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[AVTBodyCarouselController configurations](self, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't find configuration for index %ld"), a3);
  -[AVTBodyCarouselController configurations](self, "configurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTBodyCarouselController displayedConfiguration](self, "displayedConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    -[AVTBodyCarouselController setDisplayedConfiguration:](self, "setDisplayedConfiguration:", v17);
    -[AVTBodyCarouselController collectionViewLayout](self, "collectionViewLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackIndexPath:", v13);

    -[AVTBodyCarouselController collectionViewLayout](self, "collectionViewLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidateLayout");

    -[AVTBodyCarouselController logger](self, "logger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logCarouselChangesCenterItemTo:", v16);

  }
}

- (void)updateStickersforVisibleCells
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  -[AVTBodyCarouselController collectionView](self, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[AVTBodyCarouselController updateImageForStaticCellForIndexPath:](self, "updateImageForStaticCellForIndexPath:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setStaticImageOnCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v7 = a4;
  -[AVTBodyCarouselController configurations](self, "configurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setConfiguration:", v9);
  -[AVTBodyCarouselController displayedRecord](self, "displayedRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAvatar:", v10);

  -[AVTBodyCarouselController renderer](self, "renderer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scheduledStickerResourceProviderForStickerConfiguration:correctClipping:", v9, 0);
  v12 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__AVTBodyCarouselController_setStaticImageOnCell_forIndexPath___block_invoke;
  v16[3] = &unk_1EA51D350;
  v13 = v6;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  v19 = &v20;
  v15 = (id)((uint64_t (**)(_QWORD, _QWORD *, _QWORD))v12)[2](v12, v16, 0);
  *((_BYTE *)v21 + 24) = 1;

  _Block_object_dispose(&v20, 8);
}

void __63__AVTBodyCarouselController_setStaticImageOnCell_forIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:animated:", v6, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

  }
}

- (void)updateImageForStaticCellForIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AVTBodyCarouselController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[AVTBodyCarouselController setStaticImageOnCell:forIndexPath:](self, "setStaticImageOnCell:forIndexPath:", v5, v7);
  }
  else
  {
    -[AVTBodyCarouselController logger](self, "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logErrorUpdatingBodyCarouselVisibleCellAtIndexPath:", v7);

  }
}

- (void)transitionCurrentDisplayedConfigurationAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  -[AVTBodyCarouselController configurations](self, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTBodyCarouselController displayedConfiguration](self, "displayedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTBodyCarouselController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[AVTBodyCarouselController shouldCurrentlyDisplayedConfigurationTransitionToLive](self, "shouldCurrentlyDisplayedConfigurationTransitionToLive"))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __77__AVTBodyCarouselController_transitionCurrentDisplayedConfigurationAnimated___block_invoke;
      v11[3] = &unk_1EA51D378;
      v11[4] = self;
      v12 = v8;
      v13 = a3;
      objc_msgSend(v10, "downcastWithCellHandler:listCellHandler:", 0, v11);

    }
  }
}

void __77__AVTBodyCarouselController_transitionCurrentDisplayedConfigurationAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "liveCell");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v3 == v10)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActive");

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend(v7, "avtViewSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionCell:indexPath:toStartFocusingAnimated:session:completionHandler:", v10, v8, v9, v4, 0);
LABEL_4:

  }
}

- (void)layoutDidChangeWhileMoving:(BOOL)a3 offset:(CGPoint)a4
{
  if (a3)
  {
    -[AVTBodyCarouselController transitionCenterCellIfPresentToStopFocusingAnimated:](self, "transitionCenterCellIfPresentToStopFocusingAnimated:", 1, a4.x, a4.y);
    -[AVTBodyCarouselController updateDisplayedConfigurationIfNeeded](self, "updateDisplayedConfigurationIfNeeded");
  }
  else
  {
    -[AVTBodyCarouselController scrollToDisplayedConfiguration](self, "scrollToDisplayedConfiguration", a4.x, a4.y);
  }
}

- (void)notifyingContainerViewDidChangeSize:(CGSize)a3
{
  if (-[AVTBodyCarouselController isViewLoaded](self, "isViewLoaded", a3.width, a3.height))
  {
    if (!-[AVTBodyCarouselController isAnimatingExpansion](self, "isAnimatingExpansion"))
      -[AVTBodyCarouselController buildCollectionViewAndConfigureLayoutIfNeeded](self, "buildCollectionViewAndConfigureLayoutIfNeeded");
  }
}

- (void)prepareViewWithLayout:(id)a3
{
  -[AVTBodyCarouselController setAvtViewLayout:](self, "setAvtViewLayout:", a3);
  -[AVTBodyCarouselController buildCollectionViewAndConfigureLayoutIfNeeded](self, "buildCollectionViewAndConfigureLayoutIfNeeded");
}

- (void)useAVTViewFromSession:(id)a3
{
  -[AVTBodyCarouselController setAvtViewSession:](self, "setAvtViewSession:", a3);
  -[AVTBodyCarouselController buildCollectionViewAndConfigureLayoutIfNeeded](self, "buildCollectionViewAndConfigureLayoutIfNeeded");
  if (-[AVTBodyCarouselController shouldCurrentlyDisplayedConfigurationTransitionToLive](self, "shouldCurrentlyDisplayedConfigurationTransitionToLive"))
  {
    -[AVTBodyCarouselController transitionCenterCellIfPresentToStartFocusing](self, "transitionCenterCellIfPresentToStartFocusing");
  }
}

- (void)stopUsingAVTViewSessionSynchronously:(BOOL)a3 completionHandler:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[AVTBodyCarouselController transitionCoordinator](self, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllTransitions");

  -[AVTBodyCarouselController transitionCenterCellIfPresentToStopFocusingAnimated:](self, "transitionCenterCellIfPresentToStopFocusingAnimated:", 0);
  -[AVTBodyCarouselController setAvtViewSession:](self, "setAvtViewSession:", 0);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    v6 = v7;
  }

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AVTBodyCarouselController configurations](self, "configurations", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  +[AVTAvatarListCell reuseIdentifier](AVTAvatarListCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTBodyCarouselController centerCellSize](self, "centerCellSize");
  objc_msgSend(v9, "setAspectRatio:");
  v10 = v9;

  return v10;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AVTBodyCarouselController setStaticImageOnCell:forIndexPath:](self, "setStaticImageOnCell:forIndexPath:", v7, v8);
  v9 = objc_msgSend(v8, "item");
  -[AVTBodyCarouselController configurations](self, "configurations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTBodyCarouselController displayedConfiguration](self, "displayedConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "indexOfObject:", v11);

  if (v9 == v12)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__AVTBodyCarouselController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
    v13[3] = &unk_1EA51D3A0;
    v13[4] = self;
    v14 = v8;
    objc_msgSend(v7, "downcastWithCellHandler:listCellHandler:", 0, v13);

  }
}

uint64_t __79__AVTBodyCarouselController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionCenterCellToStartFocusing:indexPath:", a2, *(_QWORD *)(a1 + 40));
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__AVTBodyCarouselController_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke;
  v5[3] = &unk_1EA51D3C8;
  v5[4] = self;
  objc_msgSend(a4, "downcastWithCellHandler:listCellHandler:", 0, v5, a5);
}

void __84__AVTBodyCarouselController_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "transitionCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelTransitionsMatchingModel:", v3);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "avtui_isMoving");
  objc_msgSend(v4, "contentOffset");
  v7 = v6;
  v9 = v8;

  -[AVTBodyCarouselController layoutDidChangeWhileMoving:offset:](self, "layoutDidChangeWhileMoving:offset:", v5, v7, v9);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[AVTBodyCarouselController transitionCurrentDisplayedConfigurationAnimated:](self, "transitionCurrentDisplayedConfigurationAnimated:", 0);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[AVTBodyCarouselController transitionCurrentDisplayedConfigurationAnimated:](self, "transitionCurrentDisplayedConfigurationAnimated:", 0);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  -[AVTBodyCarouselController transitionCurrentDisplayedConfigurationAnimated:](self, "transitionCurrentDisplayedConfigurationAnimated:", 0);
}

- (void)transitionCenterCellIfPresentToStartFocusing
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  -[AVTBodyCarouselController configurations](self, "configurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTBodyCarouselController displayedConfiguration](self, "displayedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  -[AVTBodyCarouselController displayedConfiguration](self, "displayedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTBodyCarouselController cellForConfiguration:](self, "cellForConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__AVTBodyCarouselController_transitionCenterCellIfPresentToStartFocusing__block_invoke;
  v10[3] = &unk_1EA51D3A0;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v7, "downcastWithCellHandler:listCellHandler:", 0, v10);

}

uint64_t __73__AVTBodyCarouselController_transitionCenterCellIfPresentToStartFocusing__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionCenterCellToStartFocusing:indexPath:", a2, *(_QWORD *)(a1 + 40));
}

- (void)transitionCenterCellIfPresentToStopFocusingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[AVTBodyCarouselController liveCell](self, "liveCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVTBodyCarouselController liveCell](self, "liveCell");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTBodyCarouselController transitionCell:toStopFocusingAnimated:completionHandler:](self, "transitionCell:toStopFocusingAnimated:completionHandler:", v6, v3, 0);

  }
}

- (void)transitionCenterCellToStartFocusing:(id)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    -[AVTBodyCarouselController liveCell](self, "liveCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[AVTBodyCarouselController collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "avtui_isMoving");

      if ((v9 & 1) == 0)
      {
        -[AVTBodyCarouselController avtViewSession](self, "avtViewSession");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isActive"))
          -[AVTBodyCarouselController transitionCell:indexPath:toStartFocusingAnimated:session:completionHandler:](self, "transitionCell:indexPath:toStartFocusingAnimated:session:completionHandler:", v11, v6, 0, v10, 0);

      }
    }
  }

}

- (void)transitionCell:(id)a3 indexPath:(id)a4 toStartFocusingAnimated:(BOOL)a5 session:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  AVTAvatarCellToLiveTransition *v16;
  id v17;
  id v18;
  void *v19;
  AVTAvatarCellToLiveTransition *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  -[AVTBodyCarouselController setLiveCell:](self, "setLiveCell:", v11);
  -[AVTBodyCarouselController transitionCoordinator](self, "transitionCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cancelTransitionsMatchingModel:", v11);

  v28 = 0;
  v29 = (id *)&v28;
  v30 = 0x3042000000;
  v31 = __Block_byref_object_copy__2;
  v32 = __Block_byref_object_dispose__2;
  v33 = 0;
  v16 = [AVTAvatarCellToLiveTransition alloc];
  v24 = MEMORY[0x1E0C809B0];
  v17 = v11;
  v25 = v17;
  v27 = &v28;
  v18 = v13;
  v26 = v18;
  -[AVTBodyCarouselController logger](self, "logger", v24, 3221225472, __104__AVTBodyCarouselController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke, &unk_1EA51D418, self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[AVTAvatarCellToLiveTransition initWithModel:animated:setupHandler:completionHandler:logger:](v16, "initWithModel:animated:setupHandler:completionHandler:logger:", v17, 0, &v24, v14, v19);

  objc_storeWeak(v29 + 5, v20);
  -[AVTBodyCarouselController logger](self, "logger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransition description](v20, "description");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logCarouselAddsTransitionToCoordinator:", v22);

  -[AVTBodyCarouselController transitionCoordinator](self, "transitionCoordinator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addTransition:", v20);

  _Block_object_dispose(&v28, 8);
  objc_destroyWeak(&v33);

}

void __104__AVTBodyCarouselController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(WeakRetained, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCarouselCellStartUsingLiveView:associatedTransition:", v5, v7);

  objc_msgSend(*(id *)(a1 + 40), "beginUsingAVTViewFromSession:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 48), "avtViewUpdater");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __104__AVTBodyCarouselController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke_2;
  v11[3] = &unk_1EA51D3F0;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v8, "setStickerConfiguration:completionHandler:", v9, v11);

}

uint64_t __104__AVTBodyCarouselController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transitionCell:(id)a3 toStopFocusingAnimated:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AVTAvatarCellToStaticTransition *v15;
  void *v16;
  AVTAvatarCellToStaticTransition *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v7 = a3;
  v8 = a5;
  -[AVTBodyCarouselController setLiveCell:](self, "setLiveCell:", 0);
  -[AVTBodyCarouselController logger](self, "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTBodyCarouselController displayedRecord](self, "displayedRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logCarouselStopsFocusingOnCenterItem:withCell:", v11, v12);

  -[AVTBodyCarouselController transitionCoordinator](self, "transitionCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cancelTransitionsMatchingModel:", v7);

  objc_msgSend(v7, "avtView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v25 = 0;
    v26 = (id *)&v25;
    v27 = 0x3042000000;
    v28 = __Block_byref_object_copy__2;
    v29 = __Block_byref_object_dispose__2;
    v30 = 0;
    v15 = [AVTAvatarCellToStaticTransition alloc];
    v21 = MEMORY[0x1E0C809B0];
    v24 = &v25;
    v22 = v7;
    v23 = v8;
    -[AVTBodyCarouselController logger](self, "logger", v21, 3221225472, __85__AVTBodyCarouselController_transitionCell_toStopFocusingAnimated_completionHandler___block_invoke, &unk_1EA51D440, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[AVTAvatarCellToStaticTransition initWithModel:animated:completionHandler:logger:](v15, "initWithModel:animated:completionHandler:logger:", v22, 0, &v21, v16);

    objc_storeWeak(v26 + 5, v17);
    -[AVTBodyCarouselController logger](self, "logger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTTransition description](v17, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logCarouselAddsTransitionToCoordinator:", v19);

    -[AVTBodyCarouselController transitionCoordinator](self, "transitionCoordinator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addTransition:", v17);

    _Block_object_dispose(&v25, 8);
    objc_destroyWeak(&v30);
  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

uint64_t __85__AVTBodyCarouselController_transitionCell_toStopFocusingAnimated_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t result;

  if ((a2 & 1) != 0
    || (v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)),
        v5 = objc_msgSend(v4, "state"),
        v4,
        v5 == 2))
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(WeakRetained, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logCarouselCellStopUsingLiveView:associatedTransition:", v7, v9);

    objc_msgSend(*(id *)(a1 + 40), "endUsingAVTView");
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (AVTPresenterDelegate)presenterDelegate
{
  return (AVTPresenterDelegate *)objc_loadWeakRetained((id *)&self->presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presenterDelegate, a3);
}

- (double)decelerationRate
{
  return self->_decelerationRate;
}

- (AVTRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (AVTStickerConfiguration)displayedConfiguration
{
  return self->_displayedConfiguration;
}

- (void)setDisplayedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_displayedConfiguration, a3);
}

- (BOOL)isAnimatingExpansion
{
  return self->_isAnimatingExpansion;
}

- (void)setIsAnimatingExpansion:(BOOL)a3
{
  self->_isAnimatingExpansion = a3;
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

- (AVTZIndexEngagementListCollectionViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (AVTCenteringCollectionViewDelegate)centeringDelegate
{
  return self->_centeringDelegate;
}

- (void)setCenteringDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_centeringDelegate, a3);
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewSession, a3);
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_configurations, a3);
}

- (AVTUIStickerRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (AVTSerialTaskScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
{
  objc_storeStrong((id *)&self->_generatorPool, a3);
}

- (AVTAvatarRecord)displayedRecord
{
  return self->_displayedRecord;
}

- (void)setDisplayedRecord:(id)a3
{
  objc_storeStrong((id *)&self->_displayedRecord, a3);
}

- (AVTAvatarListCell)liveCell
{
  return self->_liveCell;
}

- (void)setLiveCell:(id)a3
{
  objc_storeStrong((id *)&self->_liveCell, a3);
}

- (CGSize)centerCellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_centerCellSize.width;
  height = self->_centerCellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCenterCellSize:(CGSize)a3
{
  self->_centerCellSize = a3;
}

- (AVTTransitionCoordinator)transitionCoordinator
{
  return self->_transitionCoordinator;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
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
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_liveCell, 0);
  objc_storeStrong((id *)&self->_displayedRecord, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_centeringDelegate, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_displayedConfiguration, 0);
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end
