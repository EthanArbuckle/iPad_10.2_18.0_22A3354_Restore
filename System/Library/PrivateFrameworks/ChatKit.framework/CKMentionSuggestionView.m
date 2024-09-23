@implementation CKMentionSuggestionView

- (id)suggestionsLayoutSectionForEnvironment:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 1.0;
  if (!CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v4, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    v5 = 1.0 / v7;

  }
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalHeightDimension:", 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1A8], "layoutAnchorWithEdges:absoluteOffset:", 8, 0.0, 0.0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CEA200];
  +[CKMentionSuggestionAccessoryCell supplementryViewKind](CKMentionSuggestionAccessoryCell, "supplementryViewKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v10;
  v44 = (void *)v9;
  objc_msgSend(v11, "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v9, v12, v10);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "container");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentSize");
  v16 = v15;

  v47 = v4;
  if (-[CKMentionSuggestionView hasCompletedInitialLayoutPass](self, "hasCompletedInitialLayoutPass"))
  {
    -[CKMentionSuggestionView dataSource](self, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "numberOfSuggestionsInSuggestionView:forSection:", self, 0);

    if (v18)
    {
      v19 = 0;
      v20 = 86.0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v19, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMentionSuggestionView collectionView](self, "collectionView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cellForItemAtIndexPath:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v23, "frame");
          if (v24 >= v20)
            v20 = v24;
          objc_msgSend(v23, "frame");
          if (v25 >= v16)
            v16 = v25;
        }

        ++v19;
      }
      while (v18 != v19);
    }
    else
    {
      v20 = 86.0;
    }
    objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", v20);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", v16);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 86.0;
    objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 86.0);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", v16);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v27;
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v26, v27, v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0CEA1E0];
  v42 = (void *)v13;
  v49[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "itemWithLayoutSize:supplementaryItems:", v29, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", v20);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", v16);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0CEA1D0];
  v48 = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "horizontalGroupWithLayoutSize:subitems:", v35, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMentionSuggestionView setHasCompletedInitialLayoutPass:](self, "setHasCompletedInitialLayoutPass:", 1);

  return v39;
}

- (id)suggestionsLayout
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA430]);
  objc_msgSend(v3, "setScrollDirection:", 1);
  location = 0;
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0CEA428]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CKMentionSuggestionView_suggestionsLayout__block_invoke;
  v7[3] = &unk_1E274BDC0;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_msgSend(v4, "initWithSectionProvider:configuration:", v7, v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

id __44__CKMentionSuggestionView_suggestionsLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id *v4;
  id v5;
  id WeakRetained;

  if (a2)
  {
    v3 = 0;
  }
  else
  {
    v4 = (id *)(a1 + 32);
    v5 = a3;
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "suggestionsLayoutSectionForEnvironment:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (CKMentionSuggestionView)initWithFrame:(CGRect)a3
{
  CKMentionSuggestionView *v3;
  CKMentionSuggestionView *v4;
  uint64_t v5;
  UICollectionViewCompositionalLayout *suggestionViewLayout;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
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
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;
  _QWORD v41[6];

  v41[4] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)CKMentionSuggestionView;
  v3 = -[CKMentionSuggestionView initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKMentionSuggestionView suggestionsLayout](v3, "suggestionsLayout");
    v5 = objc_claimAutoreleasedReturnValue();
    suggestionViewLayout = v4->_suggestionViewLayout;
    v4->_suggestionViewLayout = (UICollectionViewCompositionalLayout *)v5;

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA410]), "initWithFrame:collectionViewLayout:", v4->_suggestionViewLayout, 0.0, 0.0, 64.0, 64.0);
    v8 = objc_opt_class();
    +[CKMentionSuggestionCell reuseIdentifier](CKMentionSuggestionCell, "reuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v8, v9);

    v10 = objc_opt_class();
    +[CKMentionSuggestionAccessoryCell supplementryViewKind](CKMentionSuggestionAccessoryCell, "supplementryViewKind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKMentionSuggestionAccessoryCell reuseIdentifier](CKMentionSuggestionAccessoryCell, "reuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v10, v11, v12);

    objc_msgSend(v7, "setClipsToBounds:", 1);
    objc_msgSend(v7, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v13);

    objc_msgSend(v7, "setAllowsSelection:", 1);
    objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(v7, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("suggestionSelectionIdentifier"));
    objc_msgSend(v7, "setDelegate:", v4);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "paddleOverlayRadius");
    objc_msgSend(v7, "_setContinuousCornerRadius:");

    objc_storeStrong((id *)&v4->_collectionView, v7);
    -[CKMentionSuggestionView addSubview:](v4, "addSubview:", v7);
    v29 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionView topAnchor](v4, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v32;
    objc_msgSend(v7, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionView bottomAnchor](v4, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v15;
    objc_msgSend(v7, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionView leadingAnchor](v4, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v18;
    objc_msgSend(v7, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionView trailingAnchor](v4, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v22);

    location = 0;
    objc_initWeak(&location, v4);
    v23 = objc_alloc(MEMORY[0x1E0CEA440]);
    -[CKMentionSuggestionView collectionView](v4, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __41__CKMentionSuggestionView_initWithFrame___block_invoke;
    v37[3] = &unk_1E2750800;
    objc_copyWeak(&v38, &location);
    v26 = (void *)objc_msgSend(v23, "initWithCollectionView:cellProvider:", v24, v37);
    -[CKMentionSuggestionView setDiffableDataSource:](v4, "setDiffableDataSource:", v26);

    v35[0] = v25;
    v35[1] = 3221225472;
    v35[2] = __41__CKMentionSuggestionView_initWithFrame___block_invoke_2;
    v35[3] = &unk_1E2750828;
    objc_copyWeak(&v36, &location);
    -[CKMentionSuggestionView diffableDataSource](v4, "diffableDataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSupplementaryViewProvider:", v35);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

  }
  return v4;
}

id __41__CKMentionSuggestionView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(v4);
  objc_msgSend(v8, "suggestionView:entityAtIndex:", v9, objc_msgSend(v5, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKMentionSuggestionCell reuseIdentifier](CKMentionSuggestionCell, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSuggestedEntity:", v10);
  return v12;
}

id __41__CKMentionSuggestionView_initWithFrame___block_invoke_2(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id WeakRetained;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a2;
  +[CKMentionSuggestionAccessoryCell supplementryViewKind](CKMentionSuggestionAccessoryCell, "supplementryViewKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKMentionSuggestionAccessoryCell reuseIdentifier](CKMentionSuggestionAccessoryCell, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "item");
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained(a1);
  objc_msgSend(v10, "setHidden:", v11 >= objc_msgSend(v13, "numberOfSuggestionsInSuggestionView:forSection:", v14, 0) - 1);

  return v10;
}

- (CKMentionSuggestionView)init
{
  return -[CKMentionSuggestionView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)dealloc
{
  UICollectionView *collectionView;
  UICollectionViewCompositionalLayout *suggestionViewLayout;
  objc_super v5;

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  collectionView = self->_collectionView;
  self->_collectionView = 0;

  suggestionViewLayout = self->_suggestionViewLayout;
  self->_suggestionViewLayout = 0;

  v5.receiver = self;
  v5.super_class = (Class)CKMentionSuggestionView;
  -[CKMentionSuggestionView dealloc](&v5, sel_dealloc);
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CKMentionSuggestionView suggestionViewLayout](self, "suggestionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

  -[CKMentionSuggestionView layoutIfNeeded](self, "layoutIfNeeded");
  -[CKMentionSuggestionView suggestionViewLayout](self, "suggestionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewContentSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
  -[CKMentionSuggestionView reloadData](self, "reloadData");
}

- (void)reloadData
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CEA210]);
  v18[0] = CFSTR("MainSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[CKMentionSuggestionView dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "numberOfSuggestionsInSuggestionView:forSection:", self, 0));

  -[CKMentionSuggestionView dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfSuggestionsInSuggestionView:forSection:", self, 0);

  if (v9)
  {
    v10 = 0;
    do
    {
      -[CKMentionSuggestionView dataSource](self, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "suggestionView:entityAtIndex:", self, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "defaultIMHandle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "length"))
        objc_msgSend(v7, "addObject:", v14);

      ++v10;
      -[CKMentionSuggestionView dataSource](self, "dataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "numberOfSuggestionsInSuggestionView:forSection:", self, 0);

    }
    while (v10 < v16);
  }
  objc_msgSend(v3, "appendItemsWithIdentifiers:", v7);
  -[CKMentionSuggestionView diffableDataSource](self, "diffableDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "applySnapshot:animatingDifferences:", v3, 0);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  -[CKMentionSuggestionView dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "suggestionView:entityAtIndex:", self, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CKMentionSuggestionView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestionView:didSelectEntity:", self, v9);

}

- (CKMentionSuggestionViewDelegate)delegate
{
  return (CKMentionSuggestionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKMentionSuggestionViewDataSource)dataSource
{
  return (CKMentionSuggestionViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (UICollectionViewCompositionalLayout)suggestionViewLayout
{
  return self->_suggestionViewLayout;
}

- (void)setSuggestionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionViewLayout, a3);
}

- (BOOL)hasCompletedInitialLayoutPass
{
  return self->_hasCompletedInitialLayoutPass;
}

- (void)setHasCompletedInitialLayoutPass:(BOOL)a3
{
  self->_hasCompletedInitialLayoutPass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionViewLayout, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
