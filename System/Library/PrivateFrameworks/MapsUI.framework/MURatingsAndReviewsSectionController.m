@implementation MURatingsAndReviewsSectionController

- (MURatingsAndReviewsSectionController)initWithMapItem:(id)a3
{
  MURatingsAndReviewsSectionController *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MURatingsAndReviewsSectionController;
  v3 = -[MUPlaceSectionController initWithMapItem:](&v8, sel_initWithMapItem_, a3);
  if (v3)
  {
    MUGetPlaceCardLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MURatingsAndReviewsSectionControllerInit", ", v7, 2u);
    }

    -[MURatingsAndReviewsSectionController _setupRatingRows](v3, "_setupRatingRows");
    MUGetPlaceCardLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MURatingsAndReviewsSectionControllerInit", ", v7, 2u);
    }

  }
  return v3;
}

- (void)_setupRatingRows
{
  MUScrollableStackView *v3;
  MUScrollableStackView *v4;
  MUScrollableStackView *contentStackView;
  MUPagingScrollContainerView *v6;
  MUPagingScrollContainerView *v7;
  MUPlaceReviewAvatarGenerator *v8;
  MUPlaceReviewAvatarGenerator *avatarGenerator;
  id v10;
  MUPlaceRatingReviewTitleBuilder *v11;
  MUPlaceRatingReviewTitleBuilder *titleBuilder;
  MUPlaceSectionView *v13;
  void *v14;
  MUPlaceSectionView *v15;
  MUPlaceSectionView *sectionView;
  MUPlaceSectionView *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MUScrollableStackView *v29;
  void *v30;
  MUPlaceSectionView *v31;
  void *v32;
  MUPlaceSectionView *v33;
  MUPlaceSectionView *v34;
  MUPagingScrollContainerView *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = [MUScrollableStackView alloc];
  v4 = -[MUScrollableStackView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  contentStackView = self->_contentStackView;
  self->_contentStackView = v4;

  -[MUScrollableStackView setAxis:](self->_contentStackView, "setAxis:", 0);
  -[MUScrollableStackView setContentEdgeInsets:](self->_contentStackView, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  -[MUScrollableStackView setSpacing:](self->_contentStackView, "setSpacing:", 8.0);
  -[MUScrollableStackView setAccessibilityIdentifier:](self->_contentStackView, "setAccessibilityIdentifier:", CFSTR("RatingsAndReviews"));
  if (MapKitIdiomIsMacCatalyst())
    v6 = -[MUPagingScrollContainerView initWithHorizontalScrollView:]([MUPagingScrollContainerView alloc], "initWithHorizontalScrollView:", self->_contentStackView);
  else
    v6 = self->_contentStackView;
  v7 = v6;
  v8 = objc_alloc_init(MUPlaceReviewAvatarGenerator);
  avatarGenerator = self->_avatarGenerator;
  self->_avatarGenerator = v8;

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MUPlaceRatingReviewTitleBuilder);
  titleBuilder = self->_titleBuilder;
  self->_titleBuilder = v11;

  -[MURatingsAndReviewsSectionController _addAppleRatingsCategoryTileIfNeeded:](self, "_addAppleRatingsCategoryTileIfNeeded:", v10);
  -[MURatingsAndReviewsSectionController _addUserReviewCategoryTilesIfNeeded:](self, "_addUserReviewCategoryTilesIfNeeded:", v10);
  -[MURatingsAndReviewsSectionController _addPlaceCollectionPullQuotesIfNeeded:](self, "_addPlaceCollectionPullQuotesIfNeeded:", v10);
  if (objc_msgSend(v10, "count"))
  {
    v36 = v10;
    if (objc_msgSend(v10, "count") == 1)
    {
      v13 = [MUPlaceSectionView alloc];
      -[MURatingsAndReviewsSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:](v13, "initWithStyle:sectionHeaderViewModel:", 1, v14);
      sectionView = self->_sectionView;
      self->_sectionView = v15;

      v17 = self->_sectionView;
      objc_msgSend(v10, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ratingView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceSectionView attachViewToContentView:](v17, "attachViewToContentView:", v19);

    }
    else
    {
      v35 = v7;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v20 = v10;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v38 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            if (objc_msgSend(v25, "shouldApplyWidthConstraint", v35))
            {
              objc_msgSend(v25, "ratingView");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "widthAnchor");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "preferredWidth");
              objc_msgSend(v27, "constraintEqualToConstant:");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setActive:", 1);

            }
            v29 = self->_contentStackView;
            objc_msgSend(v25, "ratingView");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUScrollableStackView addArrangedSubview:](v29, "addArrangedSubview:", v30);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v22);
      }

      v31 = [MUPlaceSectionView alloc];
      -[MURatingsAndReviewsSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:](v31, "initWithStyle:sectionHeaderViewModel:", 0, v32);
      v34 = self->_sectionView;
      self->_sectionView = v33;

      v7 = v35;
      -[MUPlaceSectionView attachViewToContentView:](self->_sectionView, "attachViewToContentView:", v35);
    }
    -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self, v35);
    v10 = v36;
  }

}

- (void)_addAppleRatingsCategoryTileIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  MUAppleRatingSectionView *v16;
  NSObject *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[8];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_geoMapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_hasAppleRatings");

  if ((v7 & 1) != 0)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[MUPlaceSectionController mapItem](self, "mapItem", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_geoMapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_appleRatings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          -[NSObject addObject:](v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v13);
    }

    if (-[NSObject count](v8, "count"))
    {
      -[MUPlaceRatingReviewTitleBuilder setSupportsRatings:](self->_titleBuilder, "setSupportsRatings:", 1);
      v16 = [MUAppleRatingSectionView alloc];
      v17 = -[MUAppleRatingSectionView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v18 = -[NSObject copy](v8, "copy");
      -[NSObject setViewModels:](v17, "setViewModels:", v18);

      -[MURatingsAndReviewsSectionController _addHorizontalTileToContentStackView:items:](self, "_addHorizontalTileToContentStackView:items:", v17, v4);
    }
    else
    {
      MUGetPlaceCardLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191DB8000, v17, OS_LOG_TYPE_INFO, "MURatingsAndReviewsSectionController: Apple ratings are present but only the overall one is present. Exit early", buf, 2u);
      }
    }

  }
  else
  {
    MUGetPlaceCardLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_INFO, "MURatingsAndReviewsSectionController: No Apple ratings present, exit early", buf, 2u);
    }
  }

}

- (void)_addUserReviewCategoryTilesIfNeeded:(id)a3
{
  id v4;
  MUOverallRatingPlatterView *v5;
  void *v6;
  void *v7;
  char v8;
  MUOverallRatingPlatterView *v9;
  void *v10;
  MUPlatterView *v11;
  _MURatingCellItem *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint8_t v23[16];

  v4 = a3;
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v5 = (MUOverallRatingPlatterView *)objc_claimAutoreleasedReturnValue();
  if (-[MUOverallRatingPlatterView _hasUserRatingScore](v5, "_hasUserRatingScore"))
  {
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_geoMapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_hasAppleRatings");

    if ((v8 & 1) != 0)
      goto LABEL_5;
    v9 = [MUOverallRatingPlatterView alloc];
    v5 = -[MUOverallRatingPlatterView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUOverallRatingPlatterView setViewModel:](v5, "setViewModel:", v10);

    -[MUOverallRatingPlatterView addSelectionGestureWithTarget:action:](v5, "addSelectionGestureWithTarget:action:", self, sel__sectionHeaderAccessoryTapped);
    v11 = -[MUPlatterView initWithContentView:]([MUPlatterView alloc], "initWithContentView:", v5);
    v12 = objc_alloc_init(_MURatingCellItem);
    -[_MURatingCellItem setRatingView:](v12, "setRatingView:", v11);
    -[_MURatingCellItem setShouldApplyWidthConstraint:](v12, "setShouldApplyWidthConstraint:", 0);
    objc_msgSend(v4, "addObject:", v12);
    -[MUPlaceRatingReviewTitleBuilder setSupportsRatings:](self->_titleBuilder, "setSupportsRatings:", 1);

  }
LABEL_5:
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_reviews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  -[MUPlaceSectionController mapItem](self, "mapItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    objc_msgSend(v16, "_reviews");
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v21 = (void *)v18;
    -[MURatingsAndReviewsSectionController _addRatingSnippets:withCellItems:](self, "_addRatingSnippets:withCellItems:", v18, v4);

    goto LABEL_10;
  }
  objc_msgSend(v16, "_tips");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_tips");
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  MUGetPlaceCardLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_191DB8000, v22, OS_LOG_TYPE_DEBUG, "POI has neither reviews or tips", v23, 2u);
  }

LABEL_10:
}

- (void)_addRatingSnippets:(id)a3 withCellItems:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  MUPlaceReviewViewModel *v16;
  MUPlaceReviewPlatterView *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = a4;
  if (objc_msgSend(v6, "count"))
    -[MUPlaceRatingReviewTitleBuilder setSupportsReviews:](self->_titleBuilder, "setSupportsReviews:", 1);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v7);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14);
        v16 = -[MUPlaceReviewViewModel initWithRatingSnippet:avatarGenerator:]([MUPlaceReviewViewModel alloc], "initWithRatingSnippet:avatarGenerator:", v15, self->_avatarGenerator);
        v17 = -[MUPlaceReviewPlatterView initWithFrame:]([MUPlaceReviewPlatterView alloc], "initWithFrame:", v10, v11, v12, v13);
        -[MUPlaceReviewPlatterView setViewModel:](v17, "setViewModel:", v16);
        objc_initWeak(&location, self);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __73__MURatingsAndReviewsSectionController__addRatingSnippets_withCellItems___block_invoke;
        v20[3] = &unk_1E2E01610;
        objc_copyWeak(&v23, &location);
        v18 = v7;
        v21 = v18;
        v22 = v15;
        -[MUPlaceReviewPlatterView setActionHandler:](v17, "setActionHandler:", v20);
        -[MURatingsAndReviewsSectionController _addHorizontalTileToContentStackView:items:](self, "_addHorizontalTileToContentStackView:items:", v17, v19);

        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);

        ++v14;
      }
      while (v8 != v14);
      v8 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

}

void __73__MURatingsAndReviewsSectionController__addRatingSnippets_withCellItems___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "mapItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_reviewsAttribution");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "providerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", 6021, v3, 176, v6);

    objc_msgSend(WeakRetained, "actionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ratingsAndReviewsSectionController:didSelectViewReview:", WeakRetained, *(_QWORD *)(a1 + 40));

  }
}

- (void)_addPlaceCollectionPullQuotesIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MUPlaceCollectionPullQuotePlatterView *v23;
  NSObject *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[16];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_hasPlaceCollectionPullQuotes");

  if ((v6 & 1) != 0)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_geoMapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_placeCollections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v27;
      v14 = *MEMORY[0x1E0C9D648];
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v9);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v19, "publisherBlockQuote");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "plainTextDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "length");

          if (v22)
          {
            v23 = -[MUPlaceCollectionPullQuotePlatterView initWithFrame:]([MUPlaceCollectionPullQuotePlatterView alloc], "initWithFrame:", v14, v15, v16, v17);
            -[MUPlaceCollectionPullQuotePlatterView setDelegate:](v23, "setDelegate:", self);
            -[MUPlaceCollectionPullQuotePlatterView setViewModel:](v23, "setViewModel:", v19);
            -[MURatingsAndReviewsSectionController _addHorizontalTileToContentStackView:items:](self, "_addHorizontalTileToContentStackView:items:", v23, v25);

            v12 = 1;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    -[MUPlaceRatingReviewTitleBuilder setSupportsGuides:](self->_titleBuilder, "setSupportsGuides:", v12 & 1);
  }
  else
  {
    MUGetPlaceCardLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v24, OS_LOG_TYPE_INFO, "MURatingsAndReviewsSectionController: No place collection pull quotes present", buf, 2u);
    }

  }
}

- (void)_addHorizontalTileToContentStackView:(id)a3 items:(id)a4
{
  id v5;
  id v6;
  MUPlatterView *v7;
  _MURatingCellItem *v8;

  v5 = a4;
  v6 = a3;
  v8 = objc_alloc_init(_MURatingCellItem);
  -[_MURatingCellItem setShouldApplyWidthConstraint:](v8, "setShouldApplyWidthConstraint:", 1);
  -[_MURatingCellItem setPreferredWidth:](v8, "setPreferredWidth:", 307.0);
  v7 = -[MUPlatterView initWithContentView:]([MUPlatterView alloc], "initWithContentView:", v6);

  -[_MURatingCellItem setRatingView:](v8, "setRatingView:", v7);
  objc_msgSend(v5, "addObject:", v8);

}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  MUPlaceSectionHeaderViewModel *sectionHeaderViewModel;
  void *v4;
  void *v5;
  void *v6;
  MUPlaceSectionHeaderViewModel *v7;
  MUPlaceSectionHeaderViewModel *v8;

  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    -[MUPlaceRatingReviewTitleBuilder buildTitleString](self->_titleBuilder, "buildTitleString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_reviewsAttribution");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPlaceSectionHeaderViewModel viewModelForTitle:attribution:target:action:](MUPlaceSectionHeaderViewModel, "viewModelForTitle:attribution:target:action:", v4, v6, self, sel__sectionHeaderAccessoryTapped);
    v7 = (MUPlaceSectionHeaderViewModel *)objc_claimAutoreleasedReturnValue();
    v8 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v7;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
  }
  return sectionHeaderViewModel;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (void)_sectionHeaderAccessoryTapped
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MUPlaceSectionController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_reviewsAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", 6020, 0, 175, v5);

  -[MURatingsAndReviewsSectionController actionDelegate](self, "actionDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ratingsAndReviewsSectionControllerDidSelectViewAllReviews:", self);

}

- (void)pullQuoteViewDidTapMore:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MURatingsAndReviewsSectionController actionDelegate](self, "actionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ratingsAndReviewsSectionController:didSelectPlaceCollection:", self, v7);

  }
}

- (id)infoCardChildPossibleActions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_reviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v3, "addObject:", &unk_1E2E55158);
      ++v7;
      -[MUPlaceSectionController mapItem](self, "mapItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_reviews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v7 < v10);
  }
  objc_msgSend(v3, "addObject:", &unk_1E2E55170);
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (int)analyticsModuleType
{
  return 36;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MURatingsAndReviewsSectionControllerDelegate)actionDelegate
{
  return (MURatingsAndReviewsSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_titleBuilder, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end
