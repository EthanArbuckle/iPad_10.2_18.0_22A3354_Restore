@implementation AVTMultiAvatarController

+ (id)newCollectionViewLayoutForEngagedCellSize:(CGSize)a3 boundsSize:(CGSize)a4 environment:(id)a5
{
  double height;
  double width;
  double v7;
  double v8;
  id v9;
  int v10;
  _BOOL4 v11;
  char v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  AVTEngagementLayout *v19;
  AVTEngagementLayout *v20;
  AVTZIndexEngagementListCollectionViewLayout *v21;
  _QWORD v23[5];
  char v24;

  height = a4.height;
  width = a4.width;
  v7 = a3.height;
  v8 = a3.width;
  v9 = a5;
  v10 = objc_msgSend(v9, "deviceIsPad");
  v11 = width > 400.0;
  v12 = v10 & v11;
  v13 = 0.3;
  if ((v10 & v11) != 0)
    v14 = 0.2;
  else
    v14 = 0.3;
  if ((v10 & v11) == 0)
    v13 = 0.7;
  v15 = v8 * v13;
  v16 = v7 * v13;
  +[AVTEngagementLayout minimumInterItemSpacingForVisibileBoundsSize:defaultCellSize:engagedCellSize:](AVTEngagementLayout, "minimumInterItemSpacingForVisibileBoundsSize:defaultCellSize:engagedCellSize:", width, height, v8 * v13, v7 * v13, v8, v7);
  v18 = v17;
  v19 = [AVTEngagementLayout alloc];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __93__AVTMultiAvatarController_newCollectionViewLayoutForEngagedCellSize_boundsSize_environment___block_invoke;
  v23[3] = &__block_descriptor_41_e8_d16__0d8l;
  v24 = v12;
  v23[4] = v18;
  v20 = -[AVTEngagementLayout initWithDefaultCellSize:engagedCellSize:interItemSpacingProvider:](v19, "initWithDefaultCellSize:engagedCellSize:interItemSpacingProvider:", v23, v15, v16, v8, v7);
  v21 = -[AVTZIndexEngagementListCollectionViewLayout initWithEngagementLayout:minAlphaFactor:environment:]([AVTZIndexEngagementListCollectionViewLayout alloc], "initWithEngagementLayout:minAlphaFactor:environment:", v20, v9, v14);

  return v21;
}

double __93__AVTMultiAvatarController_newCollectionViewLayoutForEngagedCellSize_boundsSize_environment___block_invoke(uint64_t a1, double a2)
{
  double v2;
  double v3;

  v2 = -42.0;
  if (!*(_BYTE *)(a1 + 40))
    v2 = -51.0;
  v3 = 24.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = -22.0;
  if (v2 < *(double *)(a1 + 32))
    v2 = *(double *)(a1 + 32);
  return v3 + (v2 - v3) * a2;
}

+ (id)listItemsForAvatarRecords:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVTAvatarListRecordItem *v11;
  AVTAvatarListRecordItem *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [AVTAvatarListRecordItem alloc];
        v12 = -[AVTAvatarListRecordItem initWithAvatar:](v11, "initWithAvatar:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (AVTMultiAvatarController)initWithDataSource:(id)a3 environment:(id)a4
{
  return -[AVTMultiAvatarController initWithDataSource:environment:initialAVTViewLayout:](self, "initWithDataSource:environment:initialAVTViewLayout:", a3, a4, 0);
}

- (AVTMultiAvatarController)initWithDataSource:(id)a3 environment:(id)a4 initialAVTViewLayout:(id)a5
{
  id v9;
  AVTUIEnvironment *v10;
  id v11;
  AVTMultiAvatarController *v12;
  AVTMultiAvatarController *v13;
  uint64_t v14;
  AVTUILogger *logger;
  uint64_t v16;
  AVTRenderingScope *renderingScope;
  _AVTAvatarRecordImageProvider *v18;
  _AVTAvatarRecordImageProvider *thumbnailRenderer;
  uint64_t v20;
  AVTTransitionCoordinator *transitionCoordinator;
  objc_super v23;

  v9 = a3;
  v10 = (AVTUIEnvironment *)a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)AVTMultiAvatarController;
  v12 = -[AVTMultiAvatarController init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    -[AVTAvatarRecordDataSource addObserver:](v13->_dataSource, "addObserver:", v13);
    -[AVTUIEnvironment logger](v10, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v14;

    v13->_environment = v10;
    +[AVTRenderingScope listControllerThumbnailScope](AVTRenderingScope, "listControllerThumbnailScope");
    v16 = objc_claimAutoreleasedReturnValue();
    renderingScope = v13->_renderingScope;
    v13->_renderingScope = (AVTRenderingScope *)v16;

    v18 = -[_AVTAvatarRecordImageProvider initWithEnvironment:]([_AVTAvatarRecordImageProvider alloc], "initWithEnvironment:", v10);
    thumbnailRenderer = v13->_thumbnailRenderer;
    v13->_thumbnailRenderer = v18;

    +[AVTTransitionCoordinator synchronousTransitionCoordinator](AVTTransitionCoordinator, "synchronousTransitionCoordinator");
    v20 = objc_claimAutoreleasedReturnValue();
    transitionCoordinator = v13->_transitionCoordinator;
    v13->_transitionCoordinator = (AVTTransitionCoordinator *)v20;

    v13->_decelerationRate = *(double *)MEMORY[0x1E0CEBBA0];
    objc_storeStrong((id *)&v13->_avtViewLayout, a5);
    v13->_allowsCreate = 1;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[AVTAvatarRecordDataSource removeObserver:](self->_dataSource, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)AVTMultiAvatarController;
  -[AVTMultiAvatarController dealloc](&v3, sel_dealloc);
}

- (id)listItemsForDisplay
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTMultiAvatarController getFirstItem](self, "getFirstItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[AVTMultiAvatarController recordListItems](self, "recordListItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

- (UIView)view
{
  if (!-[AVTMultiAvatarController isViewLoaded](self, "isViewLoaded"))
  {
    -[AVTMultiAvatarController loadView](self, "loadView");
    -[AVTMultiAvatarController preloadAll](self, "preloadAll");
  }
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
    -[AVTMultiAvatarController collectionView](self, "collectionView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDecelerationRate:", a3);

  }
}

- (void)updateCachedCanCreateValueIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  if (!self->_cachedCanCreateValue)
  {
    -[AVTMultiAvatarController dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "internalRecordStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v5 = objc_msgSend(v4, "canCreateAvatarWithError:", &v7);
    v6 = v7;

    if (!v6)
      self->_cachedCanCreateValue = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);

  }
}

- (id)getFirstItem
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  AVTAvatarListViewItem *v6;
  void *v7;
  AVTAvatarListViewItem *v8;
  void *v9;

  -[AVTMultiAvatarController updateCachedCanCreateValueIfNeeded](self, "updateCachedCanCreateValueIfNeeded");
  if (!AVTUIIsAvatarUIEnabled())
    goto LABEL_8;
  -[AVTMultiAvatarController cachedCanCreateValue](self, "cachedCanCreateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLValue") & 1) == 0)
  {

    goto LABEL_8;
  }
  v4 = -[AVTMultiAvatarController allowsCreate](self, "allowsCreate");

  if (!v4)
  {
LABEL_8:
    v9 = 0;
    return v9;
  }
  -[AVTMultiAvatarController addListItem](self, "addListItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [AVTAvatarListViewItem alloc];
    -[AVTMultiAvatarController addItemView](self, "addItemView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AVTAvatarListViewItem initWithView:](v6, "initWithView:", v7);
    -[AVTMultiAvatarController setAddListItem:](self, "setAddListItem:", v8);

  }
  -[AVTMultiAvatarController addListItem](self, "addListItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (AVTCarouselPlusButtonView)addItemView
{
  -[AVTMultiAvatarController createAddItemViewIfNeeded](self, "createAddItemViewIfNeeded");
  return self->_addItemView;
}

- (void)createAddItemViewIfNeeded
{
  AVTCarouselPlusButtonView *v3;
  void *v4;
  AVTCarouselPlusButtonView *v5;
  AVTCarouselPlusButtonView *addItemView;
  void *v7;
  void *v8;
  id v9;

  if (!self->_addItemView)
  {
    v3 = [AVTCarouselPlusButtonView alloc];
    -[AVTMultiAvatarController environment](self, "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AVTCarouselPlusButtonView initWithFrame:environment:](v3, "initWithFrame:environment:", v4, 0.0, 0.0, 100.0, 100.0);
    addItemView = self->_addItemView;
    self->_addItemView = v5;

    -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "engagementLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "engagedCellSize");
      -[AVTCarouselPlusButtonView setMaxItemSize:](self->_addItemView, "setMaxItemSize:");

    }
  }
}

- (void)setAllowsCreate:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD v63[5];
  BOOL v64;
  BOOL v65;

  if (self->_allowsCreate != a3)
  {
    v5 = a3;
    self->_allowsCreate = a3;
    -[AVTMultiAvatarController updateCachedCanCreateValueIfNeeded](self, "updateCachedCanCreateValueIfNeeded");
    if (AVTUIIsAvatarUIEnabled())
    {
      -[AVTMultiAvatarController cachedCanCreateValue](self, "cachedCanCreateValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      if (v8)
      {
        -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v5)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setPlusButtonIndexPath:", v11);

        }
        else
        {
          objc_msgSend(v9, "setPlusButtonIndexPath:", 0);
        }

        -[AVTMultiAvatarController indexPathForItemClosestToCenter](self, "indexPathForItemClosestToCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "item");

        -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[AVTMultiAvatarController listItemIndexForRecord:](self, "listItemIndexForRecord:", v14);

        -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v15, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBackIndexPath:", v17);

        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABC8]), "initWithDuration:curve:animations:", 2 * (v13 != 0), 0, dbl_1DCA6A070[v13 == 0]);
        v19 = MEMORY[0x1E0C809B0];
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __53__AVTMultiAvatarController_setAllowsCreate_animated___block_invoke;
        v63[3] = &unk_1EA51DEA8;
        v63[4] = self;
        v64 = v13 == 0;
        v65 = a4;
        objc_msgSend(v18, "addCompletion:", v63);
        if (v5)
        {
          -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTMultiAvatarController collectionView](self, "collectionView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bounds");
          v23 = v22;
          v25 = v24;
          -[AVTMultiAvatarController collectionView](self, "collectionView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "bounds");
          objc_msgSend(v20, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v13 + 1, v23, v25, v27, v28);
          v30 = v29;
          v32 = v31;

          -[AVTMultiAvatarController collectionView](self, "collectionView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v33, v30, v32);
          v35 = v34;
          v37 = v36;

          -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setTargetContentOffsetForAnimations:", v35, v37);

          -[AVTMultiAvatarController collectionView](self, "collectionView");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = v19;
          v62[1] = 3221225472;
          v62[2] = __53__AVTMultiAvatarController_setAllowsCreate_animated___block_invoke_2;
          v62[3] = &unk_1EA51D188;
          v62[4] = self;
          objc_msgSend(v39, "performBatchUpdates:withAnimator:", v62, v18);

          objc_msgSend(v18, "startAnimation");
        }
        else
        {
          if (v13)
          {
            -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVTMultiAvatarController collectionView](self, "collectionView");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "bounds");
            v43 = v42;
            v45 = v44;
            -[AVTMultiAvatarController collectionView](self, "collectionView");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "bounds");
            objc_msgSend(v40, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v13 - 1, v43, v45, v47, v48);
            v50 = v49;
            v52 = v51;

            -[AVTMultiAvatarController collectionView](self, "collectionView");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v53, v50, v52);
            v55 = v54;
            v57 = v56;

            -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "setTargetContentOffsetForAnimations:", v55, v57);

          }
          -[AVTMultiAvatarController collectionView](self, "collectionView");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v61[0] = v19;
          v61[1] = 3221225472;
          v61[2] = __53__AVTMultiAvatarController_setAllowsCreate_animated___block_invoke_3;
          v61[3] = &unk_1EA51D188;
          v61[4] = self;
          objc_msgSend(v59, "performBatchUpdates:withAnimator:", v61, v18);

          objc_msgSend(v18, "startAnimation");
          if (!v13)
          {
            -[AVTMultiAvatarController collectionView](self, "collectionView");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "contentOffset");
            -[AVTMultiAvatarController layoutDidChangeWhileMoving:offset:](self, "layoutDidChangeWhileMoving:offset:", 1);

          }
        }

      }
    }
  }
}

void __53__AVTMultiAvatarController_setAllowsCreate_animated___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearTargetContentOffsetForAnimations");

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "transitionCurrentDisplayedRecordAnimated:", *(unsigned __int8 *)(a1 + 41));
}

void __53__AVTMultiAvatarController_setAllowsCreate_animated___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertItemsAtIndexPaths:", v3);

}

void __53__AVTMultiAvatarController_setAllowsCreate_animated___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteItemsAtIndexPaths:", v3);

}

- (void)buildCollectionViewAndConfigureLayoutIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  AVTCenteringCollectionViewDelegate *v42;
  void *v43;
  AVTCenteringCollectionViewDelegate *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;

  -[AVTMultiAvatarController avtViewLayout](self, "avtViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTMultiAvatarController avtViewLayout](self, "avtViewLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTMultiAvatarController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v4, "avatarViewSizeForAvailableContentSize:", v6, v7);
    v9 = v8;
    v11 = v10;

    -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_6;
    v13 = (void *)v12;
    -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "engagementLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "engagedCellSize");
    v17 = v16;
    v19 = v18;

    if (v17 != v9 || v19 != v11)
    {
LABEL_6:
      v20 = (void *)objc_opt_class();
      -[AVTMultiAvatarController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bounds");
      v23 = v22;
      v25 = v24;
      -[AVTMultiAvatarController environment](self, "environment");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (id)objc_msgSend(v20, "newCollectionViewLayoutForEngagedCellSize:boundsSize:environment:", v26, v9, v11, v23, v25);

      if (-[AVTMultiAvatarController allowsCreate](self, "allowsCreate"))
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setPlusButtonIndexPath:", v27);

      }
      else
      {
        objc_msgSend(v52, "setPlusButtonIndexPath:", 0);
      }
      -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[AVTMultiAvatarController listItemIndexForRecord:](self, "listItemIndexForRecord:", v28);

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v29, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setBackIndexPath:", v30);

      -[AVTMultiAvatarController setCollectionViewLayout:](self, "setCollectionViewLayout:", v52);
      -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "engagementLayout");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "engagedCellSize");
      v34 = v33;
      v36 = v35;
      -[AVTMultiAvatarController addItemView](self, "addItemView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setMaxItemSize:", v34, v36);

      -[AVTMultiAvatarController collectionView](self, "collectionView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        -[AVTMultiAvatarController collectionView](self, "collectionView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setCollectionViewLayout:", v52);
      }
      else
      {
        v40 = objc_alloc(MEMORY[0x1E0CEA410]);
        -[AVTMultiAvatarController view](self, "view");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "bounds");
        v39 = (void *)objc_msgSend(v40, "initWithFrame:collectionViewLayout:", v52);

        v42 = [AVTCenteringCollectionViewDelegate alloc];
        -[AVTMultiAvatarController environment](self, "environment");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[AVTCenteringCollectionViewDelegate initWithCollectionView:delegate:environment:](v42, "initWithCollectionView:delegate:environment:", v39, self, v43);
        -[AVTMultiAvatarController setCenteringDelegate:](self, "setCenteringDelegate:", v44);

        -[AVTMultiAvatarController centeringDelegate](self, "centeringDelegate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setDelegate:", v45);

        objc_msgSend(v39, "setDataSource:", self);
        -[AVTMultiAvatarController decelerationRate](self, "decelerationRate");
        objc_msgSend(v39, "setDecelerationRate:");
        v46 = objc_opt_class();
        +[AVTAvatarListCell reuseIdentifier](AVTAvatarListCell, "reuseIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "registerClass:forCellWithReuseIdentifier:", v46, v47);

        v48 = objc_opt_class();
        +[AVTCollectionViewCell reuseIdentifier](AVTCollectionViewCell, "reuseIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "registerClass:forCellWithReuseIdentifier:", v48, v49);

        objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setBackgroundColor:", v50);

        objc_msgSend(v39, "setShowsHorizontalScrollIndicator:", 0);
        objc_msgSend(v39, "setContentInsetAdjustmentBehavior:", 2);
        objc_msgSend(v39, "setAutoresizingMask:", 18);
        -[AVTMultiAvatarController view](self, "view");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addSubview:", v39);

        -[AVTMultiAvatarController setCollectionView:](self, "setCollectionView:", v39);
      }

    }
  }
}

- (void)loadView
{
  AVTNotifyingContainerView *v3;
  AVTNotifyingContainerView *v4;

  v3 = [AVTNotifyingContainerView alloc];
  v4 = -[AVTNotifyingContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AVTNotifyingContainerView setDelegate:](v4, "setDelegate:", self);
  -[AVTMultiAvatarController setView:](self, "setView:", v4);

}

- (void)preloadAll
{
  void *v3;
  void *v4;
  id v5;

  if (AVTUIAvatarPreLoadOnLaunch())
  {
    v3 = (void *)MEMORY[0x1E0D00858];
    -[AVTMultiAvatarController dataSource](self, "dataSource");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preloadAllAvatarsWithStore:completionHandler:", v4, 0);

  }
}

- (id)loadRecords
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;

  -[AVTMultiAvatarController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfRecords");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[AVTMultiAvatarController dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recordAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v8);
    }
  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (void)createAvatar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[AVTMultiAvatarController allowsCreate](self, "allowsCreate"))
  {
    -[AVTMultiAvatarController indexPathForItemClosestToCenter](self, "indexPathForItemClosestToCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB36B0];
    -[AVTMultiAvatarController listItemsForDisplay](self, "listItemsForDisplay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTMultiAvatarController addListItem](self, "addListItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathForItem:inSection:", objc_msgSend(v4, "indexOfObject:", v5), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isEqual:", v6))
    {
      -[AVTMultiAvatarController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayingControllerWantsToPresentEditorForCreation:", self);

    }
  }
}

- (void)scrollToDisplayedRecord
{
  id v3;

  -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTMultiAvatarController scrollToViewForAvatarRecord:animated:](self, "scrollToViewForAvatarRecord:animated:", v3, 0);

}

- (void)scrollToViewForAvatarRecord:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  unint64_t v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  v9 = v6;
  if (v6
    || (-[AVTMultiAvatarController getFirstItem](self, "getFirstItem"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6 = 0,
        !v8))
  {
    v7 = -[AVTMultiAvatarController listItemIndexForRecord:](self, "listItemIndexForRecord:", v6);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_7;
  }
  else
  {
    v7 = 0;
  }
  -[AVTMultiAvatarController scrollToViewAtIndex:animated:](self, "scrollToViewAtIndex:animated:", v7, v4);
LABEL_7:

}

- (void)scrollToViewAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  void *v9;
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
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v29, "item");
  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  objc_msgSend(v7, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v8, v11, v13, v15, v16);
  v18 = v17;
  v20 = v19;

  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v21, v18, v20);
  v23 = v22;
  v25 = v24;

  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setContentOffset:animated:", v4, v23, v25);

  if (!v4)
  {
    -[AVTMultiAvatarController listItemsForDisplay](self, "listItemsForDisplay");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTMultiAvatarController notifyDelegateForScrollingTowardItem:ratio:](self, "notifyDelegateForScrollingTowardItem:ratio:", v28, 1.0);

  }
}

- (unint64_t)listItemIndexForRecord:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[AVTMultiAvatarController listItemsForDisplay](self, "listItemsForDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__AVTMultiAvatarController_listItemIndexForRecord___block_invoke;
  v9[3] = &unk_1EA51DEF8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __51__AVTMultiAvatarController_listItemIndexForRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__AVTMultiAvatarController_listItemIndexForRecord___block_invoke_2;
  v6[3] = &unk_1EA51DED0;
  v8 = &v9;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "downcastWithRecordHandler:viewHandler:", v6, 0);
  v4 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __51__AVTMultiAvatarController_listItemIndexForRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "avatar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

}

- (id)recordForItem:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__AVTMultiAvatarController_recordForItem___block_invoke;
  v6[3] = &unk_1EA51DF20;
  v6[4] = &v7;
  objc_msgSend(v3, "downcastWithRecordHandler:viewHandler:", v6, 0);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__AVTMultiAvatarController_recordForItem___block_invoke(uint64_t a1, void *a2)
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

- (id)indexPathForItemClosestToCenter
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v8, v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)cellForRecordItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AVTMultiAvatarController listItemsForDisplay](self, "listItemsForDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("List item not found %@"), v4);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)shouldCurrentlyDisplayedRecordTransitionToLive
{
  void *v3;
  unint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;

  -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AVTMultiAvatarController listItemIndexForRecord:](self, "listItemIndexForRecord:", v3);

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[AVTMultiAvatarController collectionViewLayout](self, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v6, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v4, v9, v11, v13, v14);
  v16 = v15;
  v18 = v17;

  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v19, v16, v18);
  v21 = v20;

  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentOffset");
  v5 = vabdd_f64(v21, v23) < 1.0;

  return v5;
}

- (void)updateDisplayedRecordIfNeeded
{
  void *v3;
  id v4;

  -[AVTMultiAvatarController indexPathForItemClosestToCenter](self, "indexPathForItemClosestToCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[AVTMultiAvatarController setDisplayedRecordFromIndex:](self, "setDisplayedRecordFromIndex:", objc_msgSend(v3, "item"));
    v3 = v4;
  }

}

- (void)setDisplayedRecordFromIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[AVTMultiAvatarController listItemsForDisplay](self, "listItemsForDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't find displayed record for index %ld"), a3);
  -[AVTMultiAvatarController listItemsForDisplay](self, "listItemsForDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__AVTMultiAvatarController_setDisplayedRecordFromIndex___block_invoke;
  v13[3] = &unk_1EA51DF48;
  v13[4] = self;
  v15 = a3;
  v10 = v8;
  v14 = v10;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __56__AVTMultiAvatarController_setDisplayedRecordFromIndex___block_invoke_2;
  v12[3] = &unk_1EA51DF70;
  v12[4] = self;
  v12[5] = &v16;
  objc_msgSend(v10, "downcastWithRecordHandler:viewHandler:", v13, v12);
  -[AVTMultiAvatarController addItemView](self, "addItemView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowHighlight:", *((unsigned __int8 *)v17 + 24));

  _Block_object_dispose(&v16, 8);
}

void __56__AVTMultiAvatarController_setDisplayedRecordFromIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
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

  v15 = a2;
  objc_msgSend(v15, "avatar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayedRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v15, "avatar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDisplayedRecord:", v6);

    objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 48), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackIndexPath:", v8);

    objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateLayout");

    objc_msgSend(*(id *)(a1 + 32), "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logCarouselChangesCenterItemTo:", v11);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "displayedRecord");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayingController:didChangeCurrentRecord:", v13, v14);

  }
}

void __56__AVTMultiAvatarController_setDisplayedRecordFromIndex___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  int v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addListItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (void)transitionCurrentDisplayedRecordAnimated:(BOOL)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVTMultiAvatarController listItemIndexForRecord:](self, "listItemIndexForRecord:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTMultiAvatarController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[AVTMultiAvatarController shouldCurrentlyDisplayedRecordTransitionToLive](self, "shouldCurrentlyDisplayedRecordTransitionToLive"))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __69__AVTMultiAvatarController_transitionCurrentDisplayedRecordAnimated___block_invoke;
      v10[3] = &unk_1EA51D378;
      v10[4] = self;
      v11 = v7;
      v12 = a3;
      objc_msgSend(v9, "downcastWithCellHandler:listCellHandler:", 0, v10);

    }
  }
}

void __69__AVTMultiAvatarController_transitionCurrentDisplayedRecordAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "liveCell");
  v4 = objc_claimAutoreleasedReturnValue();
  if ((id)v4 == v3)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isActive");

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "willBeginFocus:", *(_QWORD *)(a1 + 32));

      v9 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(unsigned __int8 *)(a1 + 48);
      objc_msgSend(v9, "avtViewSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __69__AVTMultiAvatarController_transitionCurrentDisplayedRecordAnimated___block_invoke_2;
      v13[3] = &unk_1EA51D250;
      v13[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v9, "transitionCell:indexPath:toStartFocusingAnimated:session:completionHandler:", v3, v10, v11, v12, v13);

    }
  }

}

void __69__AVTMultiAvatarController_transitionCurrentDisplayedRecordAnimated___block_invoke_2(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didBeginFocus:", *(_QWORD *)(a1 + 32));

  }
}

- (void)notifyDelegateForScrollingTowardItemFromOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  double v18;

  y = a3.y;
  x = a3.x;
  -[AVTMultiAvatarController indexPathForItemClosestToCenter](self, "indexPathForItemClosestToCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0.0;
  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentOffset");
  v9 = v8;
  v11 = v10;
  -[AVTMultiAvatarController listItemsForDisplay](self, "listItemsForDisplay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__AVTMultiAvatarController_notifyDelegateForScrollingTowardItemFromOffset___block_invoke;
  v17[3] = &unk_1EA51DF98;
  v17[4] = self;
  +[AVTCenteringCollectionViewHelper indexPathForItemBeingScrolledTowardFromOffset:currentOffset:nearestItemToCenter:itemCount:itemOffsetProvider:ratio:](AVTCenteringCollectionViewHelper, "indexPathForItemBeingScrolledTowardFromOffset:currentOffset:nearestItemToCenter:itemCount:itemOffsetProvider:ratio:", v6, v13, v17, &v18, x, y, v9, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AVTMultiAvatarController listItemsForDisplay](self, "listItemsForDisplay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v14, "item"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTMultiAvatarController notifyDelegateForScrollingTowardItem:ratio:](self, "notifyDelegateForScrollingTowardItem:ratio:", v16, v18);
  }

}

double __75__AVTMultiAvatarController_notifyDelegateForScrollingTowardItemFromOffset___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v5, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v6, v9, v11, v13, v14);
  v16 = v15;
  v18 = v17;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v19, v16, v18);
  v21 = v20;

  return v21;
}

- (void)notifyDelegateForScrollingTowardItem:(id)a3 ratio:(double)a4
{
  _QWORD v4[6];
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__AVTMultiAvatarController_notifyDelegateForScrollingTowardItem_ratio___block_invoke;
  v5[3] = &unk_1EA51DFC0;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__AVTMultiAvatarController_notifyDelegateForScrollingTowardItem_ratio___block_invoke_2;
  v4[3] = &unk_1EA51DFE8;
  v4[4] = self;
  *(double *)&v4[5] = a4;
  objc_msgSend(a3, "downcastWithRecordHandler:viewHandler:", v5, v4);
}

void __71__AVTMultiAvatarController_notifyDelegateForScrollingTowardItem_ratio___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "avatar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayingController:didMoveTowardRecord:withFactor:", v5, v6, *(double *)(a1 + 40));
}

void __71__AVTMultiAvatarController_notifyDelegateForScrollingTowardItem_ratio___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayingController:didMoveTowardRecord:withFactor:", *(_QWORD *)(a1 + 32), 0, *(double *)(a1 + 40));

}

- (void)layoutDidChangeWhileMoving:(BOOL)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  _BOOL4 v6;
  double v8;
  double v9;
  double v10;
  double v11;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  -[AVTMultiAvatarController lastContentOffset](self, "lastContentOffset");
  v9 = v8;
  v11 = v10;
  -[AVTMultiAvatarController setLastContentOffset:](self, "setLastContentOffset:", x, y);
  if (v6)
  {
    -[AVTMultiAvatarController transitionCenterCellIfPresentToStopFocusingAnimated:](self, "transitionCenterCellIfPresentToStopFocusingAnimated:", 1);
    -[AVTMultiAvatarController notifyDelegateForScrollingTowardItemFromOffset:](self, "notifyDelegateForScrollingTowardItemFromOffset:", v9, v11);
    -[AVTMultiAvatarController updateDisplayedRecordIfNeeded](self, "updateDisplayedRecordIfNeeded");
  }
  else
  {
    -[AVTMultiAvatarController scrollToDisplayedRecord](self, "scrollToDisplayedRecord");
  }
}

- (void)notifyingContainerViewDidChangeSize:(CGSize)a3
{
  if (-[AVTMultiAvatarController isViewLoaded](self, "isViewLoaded", a3.width, a3.height))
  {
    -[AVTMultiAvatarController buildCollectionViewAndConfigureLayoutIfNeeded](self, "buildCollectionViewAndConfigureLayoutIfNeeded");
    -[AVTMultiAvatarController reloadData](self, "reloadData");
  }
}

- (void)displayAvatarForRecord:(id)a3 animated:(BOOL)a4
{
  void *v4;
  _BOOL8 v5;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v13 = a3;
  -[AVTMultiAvatarController loadRecordsIfNeeded](self, "loadRecordsIfNeeded");
  v7 = -[AVTMultiAvatarController listItemIndexForRecord:](self, "listItemIndexForRecord:", v13);
  v8 = v13;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v13
      || (-[AVTMultiAvatarController displayedRecord](self, "displayedRecord"),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v13, "isEqual:", v9) ^ 1;

      if (v13)
      {
        if (v5)
          goto LABEL_11;
LABEL_9:
        if (v10)
        {
          -[AVTMultiAvatarController transitionCenterCellIfPresentToStopFocusingAnimated:](self, "transitionCenterCellIfPresentToStopFocusingAnimated:", 0);
          -[AVTMultiAvatarController setDisplayedRecordFromIndex:](self, "setDisplayedRecordFromIndex:", v7);
          -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTMultiAvatarController scrollToViewForAvatarRecord:animated:](self, "scrollToViewForAvatarRecord:animated:", v11, 0);

          -[AVTMultiAvatarController transitionCenterCellIfPresentToStartFocusing](self, "transitionCenterCellIfPresentToStartFocusing");
LABEL_12:
          v8 = v13;
          goto LABEL_13;
        }
LABEL_11:
        -[AVTMultiAvatarController setDisplayedRecordFromIndex:](self, "setDisplayedRecordFromIndex:", v7);
        -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTMultiAvatarController scrollToViewForAvatarRecord:animated:](self, "scrollToViewForAvatarRecord:animated:", v12, v5);

        goto LABEL_12;
      }
    }
    else
    {
      v10 = 0;
    }

    if (v5)
      goto LABEL_11;
    goto LABEL_9;
  }
LABEL_13:

}

- (void)loadRecordsIfNeeded
{
  void *v3;

  -[AVTMultiAvatarController recordListItems](self, "recordListItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[AVTMultiAvatarController reloadRecordListItems](self, "reloadRecordListItems");
}

- (void)reloadRecordListItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[AVTMultiAvatarController loadRecords](self, "loadRecords");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "listItemsForAvatarRecords:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTMultiAvatarController setRecordListItems:](self, "setRecordListItems:", v3);

  -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[AVTMultiAvatarController displayedRecord](self, "displayedRecord"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v9, "containsObject:", v6),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    objc_msgSend(v9, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTMultiAvatarController setDisplayedRecordFromIndex:](self, "setDisplayedRecordFromIndex:", -[AVTMultiAvatarController listItemIndexForRecord:](self, "listItemIndexForRecord:", v8));

  }
}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;

  -[AVTMultiAvatarController reloadRecordListItems](self, "reloadRecordListItems");
  -[AVTMultiAvatarController liveCell](self, "liveCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTMultiAvatarController transitionCenterCellIfPresentToStopFocusingAnimated:](self, "transitionCenterCellIfPresentToStopFocusingAnimated:", 0);
    -[AVTMultiAvatarController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

    -[AVTMultiAvatarController scrollToDisplayedRecord](self, "scrollToDisplayedRecord");
    -[AVTMultiAvatarController transitionCenterCellIfPresentToStartFocusing](self, "transitionCenterCellIfPresentToStartFocusing");
  }
  else
  {
    -[AVTMultiAvatarController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

    -[AVTMultiAvatarController scrollToDisplayedRecord](self, "scrollToDisplayedRecord");
  }
}

- (void)prepareViewWithLayout:(id)a3
{
  -[AVTMultiAvatarController setAvtViewLayout:](self, "setAvtViewLayout:", a3);
  -[AVTMultiAvatarController buildCollectionViewAndConfigureLayoutIfNeeded](self, "buildCollectionViewAndConfigureLayoutIfNeeded");
}

- (void)useAVTViewFromSession:(id)a3 withLayout:(id)a4
{
  id v6;

  v6 = a3;
  -[AVTMultiAvatarController setAvtViewLayout:](self, "setAvtViewLayout:", a4);
  -[AVTMultiAvatarController setAvtViewSession:](self, "setAvtViewSession:", v6);

  -[AVTMultiAvatarController buildCollectionViewAndConfigureLayoutIfNeeded](self, "buildCollectionViewAndConfigureLayoutIfNeeded");
  if (-[AVTMultiAvatarController shouldCurrentlyDisplayedRecordTransitionToLive](self, "shouldCurrentlyDisplayedRecordTransitionToLive"))
  {
    -[AVTMultiAvatarController transitionCenterCellIfPresentToStartFocusing](self, "transitionCenterCellIfPresentToStartFocusing");
  }
}

- (void)stopUsingAVTViewSessionSynchronously:(BOOL)a3 completionHandler:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[AVTMultiAvatarController transitionCoordinator](self, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllTransitions");

  -[AVTMultiAvatarController transitionCenterCellIfPresentToStopFocusingAnimated:](self, "transitionCenterCellIfPresentToStopFocusingAnimated:", 0);
  -[AVTMultiAvatarController setAvtViewSession:](self, "setAvtViewSession:", 0);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    v6 = v7;
  }

}

- (void)prepareToTransitionToVisible:(BOOL)a3 completionHandler:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[6];
  BOOL v16;

  v5 = a3;
  -[AVTMultiAvatarController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[AVTMultiAvatarController indexPathForItemClosestToCenter](self, "indexPathForItemClosestToCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AVTMultiAvatarController setHideImageForDisplayedRecord:](self, "setHideImageForDisplayedRecord:", 1);
    -[AVTMultiAvatarController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__AVTMultiAvatarController_prepareToTransitionToVisible_completionHandler___block_invoke;
    v15[3] = &unk_1EA51E010;
    v16 = v5;
    v15[4] = self;
    v15[5] = a4;
    objc_msgSend(v10, "downcastWithCellHandler:listCellHandler:", 0, v15);

    if (v5)
    {
      -[AVTMultiAvatarController collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = 1;
    }
    else
    {
      -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTMultiAvatarController scrollToViewForAvatarRecord:animated:](self, "scrollToViewForAvatarRecord:animated:", v14, 1);

      -[AVTMultiAvatarController collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = 0;
    }
    objc_msgSend(v11, "setScrollEnabled:", v13);

  }
}

void __75__AVTMultiAvatarController_prepareToTransitionToVisible_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setImageViewVisible:", 0);
  if (*(_BYTE *)(a1 + 48))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __75__AVTMultiAvatarController_prepareToTransitionToVisible_completionHandler___block_invoke_2;
    v4[3] = &unk_1EA51D570;
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    **(_QWORD **)(a1 + 40) = (id)objc_msgSend(v4, "copy");

  }
}

uint64_t __75__AVTMultiAvatarController_prepareToTransitionToVisible_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHideImageForDisplayedRecord:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setImageViewVisible:", 1);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AVTMultiAvatarController listItemsForDisplay](self, "listItemsForDisplay", a3, a4);
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
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  AVTMultiAvatarController *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  -[AVTMultiAvatarController listItemsForDisplay](self, "listItemsForDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6;
  v28 = __Block_byref_object_dispose__6;
  v29 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__AVTMultiAvatarController_collectionView_cellForItemAtIndexPath___block_invoke;
  v19[3] = &unk_1EA51E060;
  v20 = v6;
  v21 = v7;
  v22 = self;
  v23 = &v24;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __66__AVTMultiAvatarController_collectionView_cellForItemAtIndexPath___block_invoke_3;
  v15[3] = &unk_1EA51E088;
  v11 = v20;
  v16 = v11;
  v12 = v21;
  v17 = v12;
  v18 = &v24;
  objc_msgSend(v9, "downcastWithRecordHandler:viewHandler:", v19, v15);
  v13 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v13;
}

void __66__AVTMultiAvatarController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t (**v21)(_QWORD, _QWORD, _QWORD);
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  +[AVTAvatarListCell reuseIdentifier](AVTAvatarListCell, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v5, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "avtViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "avatarViewSizeForAvailableContentSize:", v9, v10);
  v12 = v11;
  v14 = v13;

  objc_msgSend(v6, "setAspectRatio:", v12, v14);
  objc_msgSend(v6, "setImage:", 0);
  if (objc_msgSend(*(id *)(a1 + 48), "hideImageForDisplayedRecord"))
  {
    objc_msgSend(v3, "avatar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "displayedRecord");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (v17)
      objc_msgSend(v6, "setImageViewVisible:", 0);
  }
  objc_msgSend(v3, "avatar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAvatar:", v18);
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  objc_msgSend(*(id *)(a1 + 48), "thumbnailRenderer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "renderingScope");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "providerForRecord:scope:", v18, v20);
  v21 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __66__AVTMultiAvatarController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v29[3] = &unk_1EA51E038;
  v22 = v6;
  v30 = v22;
  v23 = v18;
  v24 = *(_QWORD *)(a1 + 48);
  v31 = v23;
  v32 = v24;
  v33 = &v34;
  v25 = (id)((uint64_t (**)(_QWORD, _QWORD *, _QWORD))v21)[2](v21, v29, 0);

  *((_BYTE *)v35 + 24) = 1;
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v22;
  v28 = v22;

  _Block_object_dispose(&v34, 8);
}

void __66__AVTMultiAvatarController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "avatar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    v5 = v7;
    if (!v7)
    {
      objc_msgSend(*(id *)(a1 + 48), "logger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logNilImageReturnedFromAVTAvatarRecordImageProvider");

      v5 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "setImage:animated:", v5, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  }

}

void __66__AVTMultiAvatarController_collectionView_cellForItemAtIndexPath___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)a1[4];
  v4 = a2;
  +[AVTCollectionViewCell reuseIdentifier](AVTCollectionViewCell, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v5, a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSubview:", v9);
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "item");
  -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVTMultiAvatarController listItemIndexForRecord:](self, "listItemIndexForRecord:", v10);

  if (v9 == v11)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__AVTMultiAvatarController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
    v12[3] = &unk_1EA51D3A0;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v7, "downcastWithCellHandler:listCellHandler:", 0, v12);

  }
}

uint64_t __78__AVTMultiAvatarController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionCenterCellToStartFocusing:indexPath:", a2, *(_QWORD *)(a1 + 40));
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__AVTMultiAvatarController_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke;
  v5[3] = &unk_1EA51D3C8;
  v5[4] = self;
  objc_msgSend(a4, "downcastWithCellHandler:listCellHandler:", 0, v5, a5);
}

void __83__AVTMultiAvatarController_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
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

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[AVTMultiAvatarController listItemsForDisplay](self, "listItemsForDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTMultiAvatarController addListItem](self, "addListItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
    -[AVTMultiAvatarController createAvatar](self, "createAvatar");
  objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v6, 1);

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

  -[AVTMultiAvatarController layoutDidChangeWhileMoving:offset:](self, "layoutDidChangeWhileMoving:offset:", v5, v7, v9);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[AVTMultiAvatarController transitionCurrentDisplayedRecordAnimated:](self, "transitionCurrentDisplayedRecordAnimated:", 1);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[AVTMultiAvatarController transitionCurrentDisplayedRecordAnimated:](self, "transitionCurrentDisplayedRecordAnimated:", 1);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  -[AVTMultiAvatarController transitionCurrentDisplayedRecordAnimated:](self, "transitionCurrentDisplayedRecordAnimated:", 1);
}

- (void)transitionCenterCellIfPresentToStartFocusing
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AVTMultiAvatarController listItemIndexForRecord:](self, "listItemIndexForRecord:", v3);

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't find a displayed record"));
  -[AVTMultiAvatarController listItemsForDisplay](self, "listItemsForDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTMultiAvatarController cellForRecordItem:](self, "cellForRecordItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__AVTMultiAvatarController_transitionCenterCellIfPresentToStartFocusing__block_invoke;
  v10[3] = &unk_1EA51D3A0;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v7, "downcastWithCellHandler:listCellHandler:", 0, v10);

}

uint64_t __72__AVTMultiAvatarController_transitionCenterCellIfPresentToStartFocusing__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionCenterCellToStartFocusing:indexPath:", a2, *(_QWORD *)(a1 + 40));
}

- (void)transitionCenterCellIfPresentToStopFocusingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v3 = a3;
  -[AVTMultiAvatarController liveCell](self, "liveCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVTMultiAvatarController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willEndFocus:", self);

    if (v3)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __80__AVTMultiAvatarController_transitionCenterCellIfPresentToStopFocusingAnimated___block_invoke;
      v11[3] = &unk_1EA51D250;
      v7 = v11;
      v11[4] = self;
    }
    else
    {
      v7 = 0;
    }
    v8 = (void *)MEMORY[0x1DF0D0754](v7);
    -[AVTMultiAvatarController liveCell](self, "liveCell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTMultiAvatarController transitionCell:toStopFocusingAnimated:completionHandler:](self, "transitionCell:toStopFocusingAnimated:completionHandler:", v9, v3, v8);

    if (!v3)
    {
      -[AVTMultiAvatarController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didEndFocus:", self);

    }
  }
}

void __80__AVTMultiAvatarController_transitionCenterCellIfPresentToStopFocusingAnimated___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didEndFocus:", *(_QWORD *)(a1 + 32));

  }
}

- (void)transitionCenterCellToStartFocusing:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[AVTMultiAvatarController liveCell](self, "liveCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[AVTMultiAvatarController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "avtui_isMoving");

      if ((v10 & 1) == 0)
      {
        -[AVTMultiAvatarController avtViewSession](self, "avtViewSession");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isActive"))
        {
          objc_msgSend(v11, "avtViewUpdater");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "avatarRecord");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14) ^ 1;

          -[AVTMultiAvatarController delegate](self, "delegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "willBeginFocus:", self);

          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __74__AVTMultiAvatarController_transitionCenterCellToStartFocusing_indexPath___block_invoke;
          v17[3] = &unk_1EA51D250;
          v17[4] = self;
          -[AVTMultiAvatarController transitionCell:indexPath:toStartFocusingAnimated:session:completionHandler:](self, "transitionCell:indexPath:toStartFocusingAnimated:session:completionHandler:", v6, v7, v15, v11, v17);
        }

      }
    }
  }

}

void __74__AVTMultiAvatarController_transitionCenterCellToStartFocusing_indexPath___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didBeginFocus:", *(_QWORD *)(a1 + 32));

  }
}

- (void)transitionCell:(id)a3 indexPath:(id)a4 toStartFocusingAnimated:(BOOL)a5 session:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  AVTAvatarToLiveTransition *v17;
  id v18;
  id v19;
  void *v20;
  AVTAvatarToLiveTransition *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[AVTMultiAvatarController setLiveCell:](self, "setLiveCell:", v12);
  -[AVTMultiAvatarController transitionCoordinator](self, "transitionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cancelTransitionsMatchingModel:", v12);

  v29 = 0;
  v30 = (id *)&v29;
  v31 = 0x3042000000;
  v32 = __Block_byref_object_copy__38;
  v33 = __Block_byref_object_dispose__39;
  v34 = 0;
  v17 = [AVTAvatarToLiveTransition alloc];
  v25 = MEMORY[0x1E0C809B0];
  v18 = v12;
  v26 = v18;
  v28 = &v29;
  v19 = v14;
  v27 = v19;
  -[AVTMultiAvatarController logger](self, "logger", v25, 3221225472, __103__AVTMultiAvatarController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke, &unk_1EA51D418, self);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[AVTAvatarToLiveTransition initWithModel:animated:setupHandler:completionHandler:logger:](v17, "initWithModel:animated:setupHandler:completionHandler:logger:", v18, v9, &v25, v15, v20);

  objc_storeWeak(v30 + 5, v21);
  -[AVTMultiAvatarController logger](self, "logger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransition description](v21, "description");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logCarouselAddsTransitionToCoordinator:", v23);

  -[AVTMultiAvatarController transitionCoordinator](self, "transitionCoordinator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addTransition:", v21);

  _Block_object_dispose(&v29, 8);
  objc_destroyWeak(&v34);

}

void __103__AVTMultiAvatarController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(*(id *)(a1 + 40), "avatar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __103__AVTMultiAvatarController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke_2;
  v11[3] = &unk_1EA51D3F0;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v8, "setAvatarRecord:completionHandler:", v9, v11);

}

uint64_t __103__AVTMultiAvatarController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transitionCell:(id)a3 toStopFocusingAnimated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AVTAvatarToStaticTransition *v16;
  void *v17;
  AVTAvatarToStaticTransition *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  id *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[AVTMultiAvatarController setLiveCell:](self, "setLiveCell:", 0);
  -[AVTMultiAvatarController logger](self, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTMultiAvatarController displayedRecord](self, "displayedRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logCarouselStopsFocusingOnCenterItem:withCell:", v12, v13);

  -[AVTMultiAvatarController transitionCoordinator](self, "transitionCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cancelTransitionsMatchingModel:", v8);

  objc_msgSend(v8, "avtView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v26 = 0;
    v27 = (id *)&v26;
    v28 = 0x3042000000;
    v29 = __Block_byref_object_copy__38;
    v30 = __Block_byref_object_dispose__39;
    v31 = 0;
    v16 = [AVTAvatarToStaticTransition alloc];
    v22 = MEMORY[0x1E0C809B0];
    v25 = &v26;
    v23 = v8;
    v24 = v9;
    -[AVTMultiAvatarController logger](self, "logger", v22, 3221225472, __84__AVTMultiAvatarController_transitionCell_toStopFocusingAnimated_completionHandler___block_invoke, &unk_1EA51D440, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[AVTAvatarToStaticTransition initWithModel:animated:completionHandler:logger:](v16, "initWithModel:animated:completionHandler:logger:", v23, v6, &v22, v17);

    objc_storeWeak(v27 + 5, v18);
    -[AVTMultiAvatarController logger](self, "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTTransition description](v18, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logCarouselAddsTransitionToCoordinator:", v20);

    -[AVTMultiAvatarController transitionCoordinator](self, "transitionCoordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addTransition:", v18);

    _Block_object_dispose(&v26, 8);
    objc_destroyWeak(&v31);
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }

}

uint64_t __84__AVTMultiAvatarController_transitionCell_toStopFocusingAnimated_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
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

- (void)dataSource:(id)a3 didAddRecord:(id)a4 atIndex:(unint64_t)a5
{
  self->_cachedCanCreateValue = 0;
}

- (void)dataSource:(id)a3 didEditRecord:(id)a4 atIndex:(unint64_t)a5
{
  self->_cachedCanCreateValue = 0;
}

- (void)dataSource:(id)a3 didRemoveRecord:(id)a4 atIndex:(unint64_t)a5
{
  self->_cachedCanCreateValue = 0;
}

- (void)significantRecordChangeInDataSource:(id)a3
{
  self->_cachedCanCreateValue = 0;
}

- (AVTAvatarDisplayingControllerDelegate)delegate
{
  return (AVTAvatarDisplayingControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
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

- (BOOL)allowsCreate
{
  return self->_allowsCreate;
}

- (void)setAllowsCreate:(BOOL)a3
{
  self->_allowsCreate = a3;
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

- (NSArray)recordListItems
{
  return self->_recordListItems;
}

- (void)setRecordListItems:(id)a3
{
  objc_storeStrong((id *)&self->_recordListItems, a3);
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewSession, a3);
}

- (void)setAddItemView:(id)a3
{
  objc_storeStrong((id *)&self->_addItemView, a3);
}

- (AVTAvatarListItem)addListItem
{
  return self->_addListItem;
}

- (void)setAddListItem:(id)a3
{
  objc_storeStrong((id *)&self->_addListItem, a3);
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

- (NSNumber)cachedCanCreateValue
{
  return self->_cachedCanCreateValue;
}

- (void)setCachedCanCreateValue:(id)a3
{
  self->_cachedCanCreateValue = (NSNumber *)a3;
}

- (AVTTransitionCoordinator)transitionCoordinator
{
  return self->_transitionCoordinator;
}

- (AVTAvatarRecordDataSource)dataSource
{
  return self->_dataSource;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (_AVTAvatarRecordImageProvider)thumbnailRenderer
{
  return self->_thumbnailRenderer;
}

- (AVTViewCarouselLayout)avtViewLayout
{
  return self->_avtViewLayout;
}

- (void)setAvtViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewLayout, a3);
}

- (CGPoint)lastContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastContentOffset.x;
  y = self->_lastContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastContentOffset:(CGPoint)a3
{
  self->_lastContentOffset = a3;
}

- (BOOL)hideImageForDisplayedRecord
{
  return self->_hideImageForDisplayedRecord;
}

- (void)setHideImageForDisplayedRecord:(BOOL)a3
{
  self->_hideImageForDisplayedRecord = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avtViewLayout, 0);
  objc_storeStrong((id *)&self->_thumbnailRenderer, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_liveCell, 0);
  objc_storeStrong((id *)&self->_displayedRecord, 0);
  objc_storeStrong((id *)&self->_addListItem, 0);
  objc_storeStrong((id *)&self->_addItemView, 0);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_recordListItems, 0);
  objc_storeStrong((id *)&self->_centeringDelegate, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_destroyWeak((id *)&self->presenterDelegate);
  objc_destroyWeak((id *)&self->delegate);
}

+ (id)snapshotProviderFocusedOnRecordWithIdentifier:(id)a3 size:(CGSize)a4 avtViewAspectRatio:(CGSize)a5 dataSource:(id)a6 environment:(id)a7
{
  double height;
  double width;
  double v11;
  double v12;
  id v13;
  id v14;
  id v15;
  AVTMultiAvatarController *v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _AVTAvatarRecordImageProvider *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  uint64_t (**v30)(_QWORD, _QWORD, _QWORD);
  id v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  height = a5.height;
  width = a5.width;
  v11 = a4.height;
  v12 = a4.width;
  v49 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  +[AVTViewCarouselLayout adaptativeLayoutWithAVTViewAspectRatio:](AVTViewCarouselLayout, "adaptativeLayoutWithAVTViewAspectRatio:", width, height);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AVTMultiAvatarController initWithDataSource:environment:initialAVTViewLayout:]([AVTMultiAvatarController alloc], "initWithDataSource:environment:initialAVTViewLayout:", v14, v15, v39);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __135__AVTMultiAvatarController_Snapshotting__snapshotProviderFocusedOnRecordWithIdentifier_size_avtViewAspectRatio_dataSource_environment___block_invoke;
  v46[3] = &unk_1EA51DCC8;
  v17 = v13;
  v47 = v17;
  v18 = objc_msgSend(v14, "indexOfRecordPassingTest:", v46);
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't find record with identifier %@ for snapshotting"), v17);
  v38 = v17;
  objc_msgSend(v14, "recordAtIndex:", v18);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v14, "recordAtIndex:", v18 - 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

  }
  if (v18 < objc_msgSend(v14, "numberOfRecords") - 1)
  {
    objc_msgSend(v14, "recordAtIndex:", v18 + 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v21);

  }
  v41 = v14;
  v40 = v15;
  v22 = -[_AVTAvatarRecordImageProvider initWithEnvironment:]([_AVTAvatarRecordImageProvider alloc], "initWithEnvironment:", v15);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v23 = v19;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v43 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        -[AVTMultiAvatarController renderingScope](v16, "renderingScope");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[_AVTAvatarRecordImageProvider providerForRecord:scope:](v22, "providerForRecord:scope:", v28, v29);
        v30 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        v31 = (id)((uint64_t (**)(_QWORD, void *, uint64_t))v30)[2](v30, &__block_literal_global_27, 1);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v25);
  }

  -[AVTMultiAvatarController displayAvatarForRecord:animated:](v16, "displayAvatarForRecord:animated:", v37, 0);
  -[AVTMultiAvatarController reloadData](v16, "reloadData");
  v32 = *MEMORY[0x1E0C9D648];
  v33 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[AVTMultiAvatarController view](v16, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v32, v33, v12, v11);

  objc_msgSend(v40, "logger");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "logCarouselSnapshotForIndex:size:", v18, v12, v11);

  return v16;
}

uint64_t __135__AVTMultiAvatarController_Snapshotting__snapshotProviderFocusedOnRecordWithIdentifier_size_avtViewAspectRatio_dataSource_environment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)snapshotInBlock:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[AVTMultiAvatarController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

@end
