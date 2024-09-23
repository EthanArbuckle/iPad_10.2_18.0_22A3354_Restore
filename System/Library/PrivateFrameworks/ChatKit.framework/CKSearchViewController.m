@implementation CKSearchViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CKSearchViewController;
  -[CKViewController viewWillAppear:](&v22, sel_viewWillAppear_, a3);
  if (-[CKSearchViewController mode](self, "mode") == 2)
  {
    -[CKSearchViewController visibleSearchControllers](self, "visibleSearchControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKSearchViewController searchText](self, "searchText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationBarTitleSummaryForSearchText:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (-[CKSearchViewController mode](self, "mode") == 4)
    {
      -[CKSearchViewController visibleSearchControllers](self, "visibleSearchControllers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "sectionTitle");
    }
    else
    {
      CKFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SEARCH"), &stru_1E276D870, CFSTR("ChatKit"));
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[CKSearchViewController setTitle:](self, "setTitle:", v7);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CKSearchViewController collectionView](self, "collectionView", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathsForSelectedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        -[CKSearchViewController collectionView](self, "collectionView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "deselectItemAtIndexPath:animated:", v15, 1);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v12);
  }

  -[CKSearchViewController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLargeTitleDisplayMode:", 2);

}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKSearchViewController)initWithSearchControllerClasses:(id)a3
{
  id v4;
  CKSearchViewController *v5;
  CKConversationListCellLayout *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKSearchViewController;
  v5 = -[CKSearchViewController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_alloc_init(CKConversationListCellLayout);
    -[CKSearchViewController setCellLayout:](v5, "setCellLayout:", v6);

    -[CKSearchViewController setIsInitialLoad:](v5, "setIsInitialLoad:", 1);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = objc_alloc_init(*(Class *)(*((_QWORD *)&v17 + 1) + 8 * v12));
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "setDelegate:", v5, (_QWORD)v17);
            objc_msgSend(v7, "addObject:", v14);
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

    -[CKSearchViewController setSearchControllers:](v5, "setSearchControllers:", v7);
    v15 = (void *)objc_opt_new();
    -[CKSearchViewController setSearchCompleteControllerSet:](v5, "setSearchCompleteControllerSet:", v15);

  }
  return v5;
}

- (void)setSearchControllers:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  NSArray *v16;
  NSArray *visibleSearchControllers;
  NSDictionary *v18;
  NSDictionary *searchControllerMap;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_searchControllers, a3);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        if (objc_msgSend((id)objc_opt_class(), "isVisibleInCollectionView", (_QWORD)v20))
          objc_msgSend(v6, "addObject:", v13);
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v13, v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v16 = (NSArray *)objc_msgSend(v6, "copy");
  visibleSearchControllers = self->_visibleSearchControllers;
  self->_visibleSearchControllers = v16;

  v18 = (NSDictionary *)objc_msgSend(v7, "copy");
  searchControllerMap = self->__searchControllerMap;
  self->__searchControllerMap = v18;

}

- (void)setSearchCompleteControllerSet:(id)a3
{
  objc_storeStrong((id *)&self->_searchCompleteControllerSet, a3);
}

- (void)setIsInitialLoad:(BOOL)a3
{
  self->_isInitialLoad = a3;
}

- (void)setCellLayout:(id)a3
{
  objc_storeStrong((id *)&self->_cellLayout, a3);
}

- (CKSearchCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[CKSearchViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuppressDatasourceUpdates:", 1);

  -[CKSearchViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchViewController contextMenuInteraction](self, "contextMenuInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeInteraction:", v5);

  -[CKSearchViewController setContextMenuInteraction:](self, "setContextMenuInteraction:", 0);
  v6.receiver = self;
  v6.super_class = (Class)CKSearchViewController;
  -[CKSearchViewController dealloc](&v6, sel_dealloc);
}

- (void)loadView
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CKSearchCollectionView *v9;
  void *v10;
  CKSearchCollectionView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id (*v27)(uint64_t, void *, void *, void *);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CKSearchViewController;
  -[CKSearchViewController loadView](&v35, sel_loadView);
  location = 0;
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0CEA428]);
  v4 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __34__CKSearchViewController_loadView__block_invoke;
  v32[3] = &unk_1E274BDC0;
  objc_copyWeak(&v33, &location);
  v5 = (void *)objc_msgSend(v3, "initWithSectionProvider:", v32);
  -[CKSearchViewController setCollectionViewLayout:](self, "setCollectionViewLayout:", v5);
  -[CKSearchViewController collectionViewLayout](self, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchViewController globalLayoutConfiguration](self, "globalLayoutConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v6, "setConfiguration:", v8);

  v9 = [CKSearchCollectionView alloc];
  -[CKSearchViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = -[CKSearchCollectionView initWithFrame:collectionViewLayout:](v9, "initWithFrame:collectionViewLayout:", v5);

  -[CKSearchCollectionView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
  -[CKSearchCollectionView setDelegate:](v11, "setDelegate:", self);
  -[CKSearchViewController setCollectionView:](self, "setCollectionView:", v11);
  -[CKSearchViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

  -[CKSearchViewController _registerCells](self, "_registerCells");
  -[CKSearchViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "theme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "spotlightSearchBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v16);

  -[CKSearchViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlwaysBounceVertical:", 1);

  -[CKSearchViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlwaysBounceHorizontal:", 0);

  v19 = objc_alloc(MEMORY[0x1E0CEA440]);
  v30[0] = v4;
  v30[1] = 3221225472;
  v30[2] = __34__CKSearchViewController_loadView__block_invoke_2;
  v30[3] = &unk_1E2750800;
  objc_copyWeak(&v31, &location);
  v20 = (void *)objc_msgSend(v19, "initWithCollectionView:cellProvider:", v11, v30);
  v25 = v4;
  v26 = 3221225472;
  v27 = __34__CKSearchViewController_loadView__block_invoke_3;
  v28 = &unk_1E2750828;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v20, "setSupplementaryViewProvider:", &v25);
  -[CKSearchViewController setDataSource:](self, "setDataSource:", v20, v25, v26, v27, v28);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA4B8]), "initWithDelegate:", self);
  -[CKSearchViewController setContextMenuInteraction:](self, "setContextMenuInteraction:", v21);

  -[CKSearchViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchViewController contextMenuInteraction](self, "contextMenuInteraction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addInteraction:", v23);

  -[CKSearchViewController collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDragDelegate:", self);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

id __34__CKSearchViewController_loadView__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "layoutSectionForSection:withEnvironment:", a2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __34__CKSearchViewController_loadView__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "cellForItemInCollectionView:atIndexPath:withIdentifier:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __34__CKSearchViewController_loadView__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "cellForSupplementaryItemInCollectionView:atIndexPath:forSupplementaryViewKind:", v9, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_registerCells
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[CKSearchViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[CKSearchResultsTitleHeaderCell supplementaryViewType](CKSearchResultsTitleHeaderCell, "supplementaryViewType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSearchResultsTitleHeaderCell reuseIdentifier](CKSearchResultsTitleHeaderCell, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v4, v5, v6);

  -[CKSearchViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSearchAvatarSupplementryView reuseIdentifier](CKSearchAvatarSupplementryView, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v8, v9, v10);

  -[CKSearchViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  +[CKPhotosSearchResultsModeHeaderReusableView supplementaryViewType](CKPhotosSearchResultsModeHeaderReusableView, "supplementaryViewType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKPhotosSearchResultsModeHeaderReusableView reuseIdentifier](CKPhotosSearchResultsModeHeaderReusableView, "reuseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v12, v13, v14);

  if (CKIsRunningInMacCatalyst())
  {
    -[CKSearchViewController collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    +[CKPhotosSearchResultsTitleHeaderCell supplementaryViewType](CKPhotosSearchResultsTitleHeaderCell, "supplementaryViewType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKPhotosSearchResultsTitleHeaderCell reuseIdentifier](CKPhotosSearchResultsTitleHeaderCell, "reuseIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v16, v17, v18);

  }
  -[CKSearchViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_class();
  +[CKSearchIndexingFooterCell supplementaryViewType](CKSearchIndexingFooterCell, "supplementaryViewType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSearchIndexingFooterCell reuseIdentifier](CKSearchIndexingFooterCell, "reuseIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v20, v21, v22);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[CKSearchViewController visibleSearchControllers](self, "visibleSearchControllers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v23)
  {
    v24 = v23;
    v35 = *(_QWORD *)v41;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v41 != v35)
          objc_enumerationMutation(obj);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend((id)objc_opt_class(), "supportedCellClasses");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v37;
          do
          {
            v30 = 0;
            do
            {
              if (*(_QWORD *)v37 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v30);
              if (v31)
              {
                -[CKSearchViewController collectionView](self, "collectionView");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "reuseIdentifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "registerClass:forCellWithReuseIdentifier:", v31, v33);

              }
              ++v30;
            }
            while (v28 != v30);
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v28);
        }

        ++v25;
      }
      while (v25 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v24);
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  char v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void (**v17)(void);
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CKSearchViewController;
  -[CKSearchViewController viewDidLayoutSubviews](&v26, sel_viewDidLayoutSubviews);
  if (-[CKSearchViewController mode](self, "mode") == 3 || -[CKSearchViewController mode](self, "mode") == 4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchDetailsLeadingAndTrailingMaxPadding");
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchLeadingAndTrailingMaxPadding");
  }
  v5 = v4;

  -[CKSearchViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "insetsLayoutMarginsFromSafeArea");

  if ((v7 & 1) != 0)
  {
    v8 = v5;
  }
  else
  {
    -[CKSearchViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaInsets");
    v11 = v10;
    v13 = v12;

    if (v11 >= v5)
      v14 = v11;
    else
      v14 = v5;
    if (v13 >= v5)
      v8 = v13;
    else
      v8 = v5;
    v5 = v14;
  }
  -[CKSearchViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMarginInsets:", 0.0, v5, 0.0, v8);

  if (-[CKSearchViewController isInitialLoad](self, "isInitialLoad"))
  {
    -[CKSearchViewController setIsInitialLoad:](self, "setIsInitialLoad:", 0);
    -[CKSearchViewController performAfterInitialLoadBlock](self, "performAfterInitialLoadBlock");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[CKSearchViewController performAfterInitialLoadBlock](self, "performAfterInitialLoadBlock");
      v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v17[2]();

      -[CKSearchViewController setPerformAfterInitialLoadBlock:](self, "setPerformAfterInitialLoadBlock:", 0);
    }
  }
  -[CKScrollViewController updateScrollGeometryWithInheritedAnimationForReason:](self, "updateScrollGeometryWithInheritedAnimationForReason:", CFSTR("LayoutSubviews"));
  if (-[CKSearchViewController mode](self, "mode") == 2)
  {
    -[CKSearchViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentInset");
    v20 = v19;
    v22 = v21;
    v24 = v23;

    -[CKSearchViewController collectionView](self, "collectionView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setContentInset:", 0.0, v20, v22, v24);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v8;
  _QWORD v9[6];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CKSearchViewController;
  v8 = a4;
  -[CKSearchViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__CKSearchViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E275A4E8;
  v9[4] = self;
  v9[5] = a2;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v9, 0);

}

uint64_t __77__CKSearchViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "cellLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("CKSearchViewController.m"), 288, CFSTR("%@ needs a cell layout."), v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "cellLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  result = CKIsRunningInMacCatalyst();
  if (!(_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_searchImmediately");
  return result;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSearchViewController;
  -[CKViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CKSearchViewController searchEnded](self, "searchEnded");
}

- (void)setMode:(unint64_t)a3
{
  id v4;

  self->_mode = a3;
  -[CKSearchViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMode:", a3);

}

- (id)layoutSectionForSection:(int64_t)a3 withEnvironment:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v14 = 134217984;
        v15 = a3;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "CKSearchController - Asked to provide a layout section for a section we don't have! section is %lu", (uint8_t *)&v14, 0xCu);
      }

    }
    v11 = 0;
  }
  else
  {
    -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKSearchViewController layoutSectionForController:withEnvironment:](self, "layoutSectionForController:withEnvironment:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  const __CFString *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v29;
  objc_class *v30;
  void *v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v10, "section");
  -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 >= v14)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "CKSearchController - Asked to provide a cell for a section we don't have!", buf, 2u);
      }

    }
    v17 = 0;
  }
  else
  {
    -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "cellForItemInCollectionView:atIndexPath:withIdentifier:", v9, v10, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CKSearchViewController cellLayout](self, "cellLayout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKSearchViewController.m"), 382, CFSTR("%@ needs a cell layout."), v31);

      }
      -[CKSearchViewController cellLayout](self, "cellLayout");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCellLayout:", v19);

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        -[CKSearchViewController collectionView](self, "collectionView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "_ck_isEditing");
        v23 = (void *)objc_opt_class();
        v24 = CFSTR("NO");
        if (v22)
          v24 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v33 = v24;
        v34 = 2112;
        v35 = v23;
        v25 = v23;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Setting editing %@ for cell class %@", buf, 0x16u);

      }
    }
    -[CKSearchViewController collectionView](self, "collectionView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_ck_setEditing:", objc_msgSend(v26, "_ck_isEditing"));

  }
  return v17;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 forSupplementaryViewKind:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "section");
  -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11 >= v13)
  {
    v15 = 0;
  }
  else
  {
    -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v9, "section"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v15, "headerOverrideClass") && CKIsRunningInMacCatalyst())
    v16 = (objc_class *)objc_msgSend(v15, "headerOverrideClass");
  else
    v16 = -[CKSearchViewController _searchResultsHeaderClass](self, "_searchResultsHeaderClass");
  -[objc_class supplementaryViewType](v16, "supplementaryViewType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v10, "isEqualToString:", v17);

  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && CKIsRunningInMacCatalyst())
    {
      +[CKPhotosSearchResultsTitleHeaderCell supplementaryViewType](CKPhotosSearchResultsTitleHeaderCell, "supplementaryViewType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKPhotosSearchResultsTitleHeaderCell reuseIdentifier](CKPhotosSearchResultsTitleHeaderCell, "reuseIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v19, v20, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "control");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addTarget:action:forControlEvents:", v15, sel__filterControlTapped_, 4096);

      -[CKSearchViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "frame");
      objc_msgSend(v21, "updateSegmentedControlToFitWidth:", v24);
    }
    else
    {
      -[objc_class supplementaryViewType](-[CKSearchViewController _searchResultsHeaderClass](self, "_searchResultsHeaderClass"), "supplementaryViewType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class reuseIdentifier](-[CKSearchViewController _searchResultsHeaderClass](self, "_searchResultsHeaderClass"), "reuseIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v23, v29, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v15)
    {
      objc_msgSend(v21, "setDelegate:", self);
      objc_msgSend((id)objc_opt_class(), "sectionTitle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTitle:", v30);

      objc_msgSend(v21, "showAllButton");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setHidden:", -[CKSearchViewController _shouldHideShowAllButtonForController:](self, "_shouldHideShowAllButtonForController:", v15));

      objc_msgSend(v21, "setSectionIndex:", objc_msgSend(v9, "section"));
      v32 = objc_msgSend(v9, "section");
      v33 = v32 - 1;
      if (v32 >= 1
        && -[CKSearchViewController _isSectionShowingTokenSuggestions:](self, "_isSectionShowingTokenSuggestions:", v33))
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "searchSuggestionsSeparatorLeadingInset");
        objc_msgSend(v21, "setLeadingSeparatorInsets:");

      }
      else
      {
        objc_msgSend(v21, "setLeadingSeparatorInsets:", v33, 0.0);
      }
    }
  }
  else
  {
    +[CKSearchIndexingFooterCell supplementaryViewType](CKSearchIndexingFooterCell, "supplementaryViewType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v10, "isEqualToString:", v25);

    if (v26)
    {
      +[CKSearchIndexingFooterCell supplementaryViewType](CKSearchIndexingFooterCell, "supplementaryViewType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKSearchIndexingFooterCell reuseIdentifier](CKSearchIndexingFooterCell, "reuseIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v27, v28, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKSearchViewController _configureIndexingCell:](self, "_configureIndexingCell:", v21);
    }
    else
    {
      objc_msgSend(v15, "cellForSupplementaryItemInCollectionView:atIndexPath:supplementaryViewKind:", v8, v9, v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v21;
}

- (BOOL)_isSectionShowingTokenSuggestions:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  if (a3 < 0)
    return 0;
  -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 0;
  -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isTokenizationSearchController"))
  {
    objc_msgSend(v8, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (IMSpotlightClientStateMonitor)clientStateMonitor
{
  IMSpotlightClientStateMonitor *clientStateMonitor;
  id v4;
  IMSpotlightClientStateMonitor *v5;
  IMSpotlightClientStateMonitor *v6;
  _QWORD v8[5];

  clientStateMonitor = self->_clientStateMonitor;
  if (!clientStateMonitor)
  {
    v4 = objc_alloc(MEMORY[0x1E0D36128]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__CKSearchViewController_clientStateMonitor__block_invoke;
    v8[3] = &unk_1E275A510;
    v8[4] = self;
    v5 = (IMSpotlightClientStateMonitor *)objc_msgSend(v4, "initWithChangeHandler:", v8);
    v6 = self->_clientStateMonitor;
    self->_clientStateMonitor = v5;

    clientStateMonitor = self->_clientStateMonitor;
  }
  return clientStateMonitor;
}

void __44__CKSearchViewController_clientStateMonitor__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CKSearchViewController_clientStateMonitor__block_invoke_2;
  block[3] = &unk_1E274A208;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __44__CKSearchViewController_clientStateMonitor__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (id)_spotlightClientState
{
  void *v2;
  void *v3;

  -[CKSearchViewController clientStateMonitor](self, "clientStateMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_configureIndexingCell:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  BOOL v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  __CFString *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[CKSearchViewController visibleSearchControllers](self, "visibleSearchControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v56;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v56 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "hasMoreResults") & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v4, "setTitleLabelHidden:", v6);
  if (!-[CKSearchViewController _needsIndexing](self, "_needsIndexing"))
  {
    v14 = 0;
    v10 = 0;
    goto LABEL_21;
  }
  if (-[CKSearchViewController mode](self, "mode") == 1)
  {
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SEARCH_SUGGESTIONS_INDEXING_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("SEARCH_SUGGESTIONS_INDEXING_SUBTITLE");
LABEL_19:
    objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (-[CKSearchViewController mode](self, "mode") != 2 && -[CKSearchViewController mode](self, "mode") != 4)
  {
    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SEARCH_RESULTS_INDEXING_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("SEARCH_RESULTS_INDEXING_SUBTITLE");
    goto LABEL_19;
  }
  -[CKSearchViewController visibleSearchControllers](self, "visibleSearchControllers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "indexingString");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 0;
LABEL_20:

LABEL_21:
  if (-[CKSearchViewController _wantsInternalDebugInformation](self, "_wantsInternalDebugInformation"))
  {
    MEMORY[0x193FF3624](CFSTR("com.apple.IMCoreSpotlight"), CFSTR("IMCSIndexLastIndexDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v17, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SEARCH_RESULTS_INTERNAL_NO_DATE"), &stru_1E276D870, CFSTR("ChatKit"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (-[CKSearchViewController _needsIndexing](self, "_needsIndexing"))
    {
      -[CKSearchViewController _spotlightClientState](self, "_spotlightClientState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = IMGetCachedDomainIntForKeyWithDefaultValue();
        -[CKSearchViewController _spotlightClientState](self, "_spotlightClientState");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v52, "lastIndexedRowID");
        v54 = v19;
        v24 = objc_msgSend(v52, "initialReindexRowID");
        v25 = objc_msgSend(v52, "indexRevision");
        objc_msgSend(MEMORY[0x1E0D397C8], "descriptionForReindexReason:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu / %lu"), v24 - v23, v24);
        v53 = v21;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("SEARCH_RESULTS_INDEXING_INTERNAL"), &stru_1E276D870, CFSTR("ChatKit"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", v31, v26, v27, v28, v54);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "userInterfaceLayoutDirection");

        v35 = v34 == 1;
        v19 = v54;
        if (v35)
          v36 = CFSTR("\u200F");
        else
          v36 = CFSTR("\u200E");
        -[__CFString stringByAppendingString:](v36, "stringByAppendingString:", v32);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = v52;
        v21 = v53;

      }
      else
      {
        v45 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("LOADING_SEARCH_RESULTS_INDEXING_STATE_INTERNAL"), &stru_1E276D870, CFSTR("ChatKit"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringWithFormat:", v47);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "userInterfaceLayoutDirection");

        if (v49 == 1)
          v50 = CFSTR("\u200F");
        else
          v50 = CFSTR("\u200E");
        -[__CFString stringByAppendingString:](v50, "stringByAppendingString:", v38);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v39 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("SEARCH_RESULTS_INTERNAL"), &stru_1E276D870, CFSTR("ChatKit"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", v41, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "userInterfaceLayoutDirection");

      if (v43 == 1)
        v44 = CFSTR("\u200F");
      else
        v44 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v44, "stringByAppendingString:", v21);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@"), v14, v37);
      v51 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v51;
    }
    else
    {
      v14 = v37;
    }

  }
  objc_msgSend(v4, "setTitleString:", v10);
  objc_msgSend(v4, "setSubtitleString:", v14);

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "section");
  -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 < v9)
  {
    -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v6, "row");
    objc_msgSend(v11, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v12 < v14)
    {
      objc_msgSend(v11, "results");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v6, "row"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "didSelectResult:", v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CKSearchViewController _insertTokenToSearchTextField:](self, "_insertTokenToSearchTextField:", v16);
        objc_msgSend(v22, "deselectItemAtIndexPath:animated:", v6, 0);
      }
      else
      {
        objc_msgSend(v16, "conversation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "chat");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "guid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKSearchViewController delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "messageGUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "searchController:didSelectItem:inChat:", self, v21, v19);

      }
    }

  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  -[CKSearchViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchControllerDidBeginDragging:", self);

}

- (void)scrollViewDidScroll:(id)a3
{
  int v4;
  id v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "searchSectionHeadersPinToBounds"))
  {
    v4 = -[CKSearchViewController isViewLoaded](self, "isViewLoaded");

    if (v4)
      -[CKSearchViewController _updateSectionHeaders](self, "_updateSectionHeaders");
  }
  else
  {

  }
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a4;
  v8 = a5;
  -[objc_class supplementaryViewType](-[CKSearchViewController _searchResultsHeaderClass](self, "_searchResultsHeaderClass"), "supplementaryViewType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", v9))
  {

LABEL_4:
    objc_msgSend(v12, "setNeedsLayout");
    objc_msgSend(v12, "layoutIfNeeded");
    goto LABEL_5;
  }
  +[CKPhotosSearchResultsModeHeaderReusableView supplementaryViewType](CKPhotosSearchResultsModeHeaderReusableView, "supplementaryViewType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if (v11)
    goto LABEL_4;
LABEL_5:

}

- (void)_updateSectionHeaders
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  -[objc_class supplementaryViewType](-[CKSearchViewController _searchResultsHeaderClass](self, "_searchResultsHeaderClass"), "supplementaryViewType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  +[CKPhotosSearchResultsTitleHeaderCell supplementaryViewType](CKPhotosSearchResultsTitleHeaderCell, "supplementaryViewType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[CKSearchCollectionView indexPathsForVisibleSupplementaryElementsOfKind:](self->_collectionView, "indexPathsForVisibleSupplementaryElementsOfKind:", v11, (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKSearchViewController __updateSectionHeadersAtIndexPaths:elementKind:](self, "__updateSectionHeadersAtIndexPaths:elementKind:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)__updateSectionHeadersAtIndexPaths:(id)a3 elementKind:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  CKSearchCollectionView *collectionView;
  double MaxY;
  double v24;
  double v25;
  CKSearchCollectionView *v26;
  double MinY;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  id obj;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;

  v43 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v37 = a4;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v9);
        -[CKSearchCollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "layoutAttributesForItemAtIndexPath:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "frame");
          v14 = v13;
          v16 = v15;
          v18 = v17;
          v20 = v19;
          -[CKSearchCollectionView supplementaryViewForElementKind:atIndexPath:](self->_collectionView, "supplementaryViewForElementKind:atIndexPath:", v37, v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (objc_class *)objc_opt_class();
              NSStringFromClass(v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKSearchViewController.m"), 628, CFSTR("Found a cell ('%@') with an unexpected class. Expected the cell to be an instance of %@."), v21, v34);

            }
            collectionView = self->_collectionView;
            objc_msgSend(v21, "frame");
            MaxY = CGRectGetMaxY(v44);
            -[CKSearchCollectionView contentScaleFactor](collectionView, "contentScaleFactor");
            v25 = round(MaxY * v24) / v24;
            v26 = self->_collectionView;
            v45.origin.x = v14;
            v45.origin.y = v16;
            v45.size.width = v18;
            v45.size.height = v20;
            MinY = CGRectGetMinY(v45);
            -[CKSearchCollectionView contentScaleFactor](v26, "contentScaleFactor");
            objc_msgSend(v21, "setPinnedEffectVisible:", round(MinY * v28) / v28 < v25);
            if (CKIsRunningInMacCatalyst())
            {
              +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "theme");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "spotlightSearchSegmentedControlBackgroundColor");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setBackgroundColor:", v31);

            }
            else
            {
              objc_msgSend(v21, "setBackgroundColor:", 0);
            }
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v7);
  }

}

- (void)searchResultsTitleCellShowAllButtonTapped:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  CKSearchViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    -[CKSearchViewController _searchResultHeaderButtonTapped:](self, "_searchResultHeaderButtonTapped:", v4);
  }
  else
  {
    v5 = objc_msgSend(v4, "sectionIndex");

    -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v5 >= v7)
      return;
    -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v5);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v15[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CKSearchViewController initWithSearchControllerClasses:]([CKSearchViewController alloc], "initWithSearchControllerClasses:", v9);
    -[CKSearchViewController setMode:](v10, "setMode:", 2);
    -[CKSearchViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchViewController setDelegate:](v10, "setDelegate:", v11);

    -[CKSearchViewController searchText](self, "searchText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchViewController setSearchText:](v10, "setSearchText:", v12);

    -[CKSearchViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchViewController:requestsPushOfSearchController:", self, v10);

    -[CKSearchViewController searchText](self, "searchText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchViewController searchWithText:](v10, "searchWithText:", v14);

  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  _BOOL4 dismissingSearchController;
  const __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isActive");
  if (v5 && !self->_dismissingSearchController)
  {
    objc_msgSend(v4, "searchBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKSearchViewController searchWithText:](self, "searchWithText:", v11);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      dismissingSearchController = self->_dismissingSearchController;
      if (v5)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v12 = 136315650;
      v13 = "-[CKSearchViewController updateSearchResultsForSearchController:]";
      v14 = 2112;
      v15 = v9;
      if (dismissingSearchController)
        v7 = CFSTR("YES");
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "%s Not searching because ([searchController isActive]==[%@] || dismissingSearchController==[%@])", (uint8_t *)&v12, 0x20u);
    }

  }
}

- (void)_hideInlineSearchSuggestions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CKSearchViewController searchControllers](self, "searchControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v5)
        objc_enumerationMutation(v3);
      v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
      v8 = objc_opt_class();
      if (v8 == objc_opt_class())
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v9 = v7;

    if (!v9)
      goto LABEL_12;
    objc_msgSend(v9, "discardSuggestionResults");
    -[CKSearchViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionViewLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateLayout");

    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_reloadData, 0);
    -[CKSearchViewController reloadData](self, "reloadData");

  }
  else
  {
LABEL_9:

LABEL_12:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Unable to find the tokenization search controller within self.searchControllers.", v13, 2u);
      }

    }
  }
}

- (void)_insertTokenToSearchTextField:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CKSearchViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBarForSearchViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "searchTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(v13, "associatedStagedFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v13, "associatedStagedFilter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CKSearchViewController _indexForExistingConversationToken:](self, "_indexForExistingConversationToken:", v10);

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "removeTokenAtIndex:", v11);
      v8 = v11;
    }
  }
  objc_msgSend(v13, "searchToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertToken:atIndex:", v12, v8);

  objc_msgSend(v6, "setText:", &stru_1E276D870);
  -[CKSearchViewController searchWithText:](self, "searchWithText:", &stru_1E276D870);

}

- (BOOL)_hasSearchBarInput
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  -[CKSearchViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBarForSearchViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "searchTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tokens");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "count") != 0;

  }
  return v7;
}

- (void)searchWithText:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  CKSearchViewController *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __41__CKSearchViewController_searchWithText___block_invoke;
  v10 = &unk_1E274A108;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = (void (**)(_QWORD))_Block_copy(&v7);
  if (-[CKSearchViewController isInitialLoad](self, "isInitialLoad", v7, v8, v9, v10, v11))
    -[CKSearchViewController setPerformAfterInitialLoadBlock:](self, "setPerformAfterInitialLoadBlock:", v6);
  else
    v6[2](v6);

}

void __41__CKSearchViewController_searchWithText___block_invoke(uint64_t a1)
{
  id v2;
  unint64_t v3;
  int v4;
  NSObject *v5;
  void *v6;
  double v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];
  uint8_t v17[16];
  __int16 v18;
  uint8_t v19[2];

  if (objc_msgSend(*(id *)(a1 + 32), "mode") == 1 && (objc_msgSend(*(id *)(a1 + 32), "_hasSearchBarInput") & 1) == 0)
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_20;
    *(_WORD *)v19 = 0;
    v11 = "Already in ZKW mode, not reloading";
    v12 = v19;
    goto LABEL_19;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "mode"))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "searchText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 40));

      if (v9)
      {
        if (!IMOSLoggingEnabled())
          return;
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          goto LABEL_20;
        v18 = 0;
        v11 = "Search text has not changed, not reloading";
        v12 = (uint8_t *)&v18;
LABEL_19:
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
LABEL_20:

        return;
      }
    }
  }
  v2 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(*(id *)(a1 + 32), "setTimingCollection:", v2);
  objc_msgSend(v2, "startTimingForKey:", CFSTR("Search"));
  objc_msgSend(v2, "startTimingForKey:", CFSTR("CSSearch"));
  if (objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "length");
    v4 = IMOSLoggingEnabled();
    if (v3 < 3)
    {
      if (v4)
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "User is typing and has not met the minimum search text length, deferring search for a longer duration", v15, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "setSearchText:", *(_QWORD *)(a1 + 40));
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__searchImmediately, 0);
      v6 = *(void **)(a1 + 32);
      v7 = 0.8;
    }
    else
    {
      if (v4)
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "User is typing, deferring search", buf, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "setSearchText:", *(_QWORD *)(a1 + 40));
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__searchImmediately, 0);
      v6 = *(void **)(a1 + 32);
      v7 = 0.4;
    }
    objc_msgSend(v6, "performSelector:withObject:afterDelay:", sel__searchImmediately, 0, v7);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "New or current search text is zero len, searching now!", v17, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "setSearchText:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_searchImmediately");
  }

}

- (void)_searchImmediately
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CKSearchViewController setSearchInProgress:](self, "setSearchInProgress:", 1);
  -[CKSearchViewController searchCompleteControllerSet](self, "searchCompleteControllerSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[CKSearchViewController searchText](self, "searchText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchViewController cancelCurrentQuery](self, "cancelCurrentQuery");
  v5 = -[CKSearchViewController mode](self, "mode");
  if (v5 != 2 && !-[CKSearchViewController _currentModeIsDetails](self, "_currentModeIsDetails"))
    v5 = -[CKSearchViewController _hasSearchBarInput](self, "_hasSearchBarInput") ^ 1;
  -[CKSearchViewController setMode:](self, "setMode:", v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CKSearchViewController searchControllers](self, "searchControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v18;
    *(_QWORD *)&v8 = 138412290;
    v16 = v8;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        if ((objc_msgSend(MEMORY[0x1E0D397F8], "supportsSpotlight", v16) & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v11, "searchWithText:mode:", v4, -[CKSearchViewController mode](self, "mode"));
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              v13 = (void *)objc_opt_class();
              *(_DWORD *)buf = v16;
              v22 = v13;
              v14 = v13;
              _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "not processing %@, spotlight is not supported.", buf, 0xCu);

            }
          }
          -[CKSearchViewController searchCompleteControllerSet](self, "searchCompleteControllerSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", objc_opt_class());

          -[CKSearchViewController searchControllerContentsDidChange:](self, "searchControllerContentsDidChange:", v11);
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

}

- (void)searchControllerContentsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _BYTE v31[22];
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[CKSearchViewController searchInProgress](self, "searchInProgress") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v31 = 138412290;
      *(_QWORD *)&v31[4] = objc_opt_class();
      v6 = *(id *)&v31[4];
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%@ checked in but search ended, dropping", v31, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_reloadData, 0, *(_OWORD *)v31);
  -[CKSearchViewController searchCompleteControllerSet](self, "searchCompleteControllerSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", objc_opt_class());

  -[CKSearchViewController searchCompleteControllerSet](self, "searchCompleteControllerSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[CKSearchViewController searchControllers](self, "searchControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = IMOSLoggingEnabled();
  if (v9 >= v11)
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[CKSearchViewController searchCompleteControllerSet](self, "searchCompleteControllerSet");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");
        v22 = (id)objc_opt_class();
        -[CKSearchViewController searchControllers](self, "searchControllers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");
        *(_DWORD *)v31 = 134218498;
        *(_QWORD *)&v31[4] = v21;
        *(_WORD *)&v31[12] = 2112;
        *(_QWORD *)&v31[14] = v22;
        v32 = 2048;
        v33 = v24;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "%lu (%@) of %lu controllers checked in, updating now", v31, 0x20u);

      }
    }
    -[CKSearchViewController reloadData](self, "reloadData");
    -[CKSearchViewController collectionViewLayout](self, "collectionViewLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchViewController globalLayoutConfiguration](self, "globalLayoutConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v25, "setConfiguration:", v27);

    -[CKSearchViewController timingCollection](self, "timingCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stopTimingForKey:", CFSTR("Search"));

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        -[CKSearchViewController timingCollection](self, "timingCollection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v31 = 138412290;
        *(_QWORD *)&v31[4] = v30;
        _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "Search timing %@", v31, 0xCu);

      }
    }
  }
  else
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        -[CKSearchViewController searchCompleteControllerSet](self, "searchCompleteControllerSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");
        v16 = (id)objc_opt_class();
        -[CKSearchViewController searchControllers](self, "searchControllers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");
        *(_DWORD *)v31 = 134218498;
        *(_QWORD *)&v31[4] = v15;
        *(_WORD *)&v31[12] = 2112;
        *(_QWORD *)&v31[14] = v16;
        v32 = 2048;
        v33 = v18;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "%lu (%@) of %lu controllers checked in, delaying update", v31, 0x20u);

      }
    }
    -[CKSearchViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_reloadData, 0, 0.5);
  }

}

- (id)searchController:(id)a3 conversationForChatGUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[CKSearchViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchController:conversationForChatGUID:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)searchController:(id)a3 conversationsForExistingChatsWithGUIDs:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[CKSearchViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchController:conversationsForExistingChatsWithGUIDs:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)searchController:(id)a3 requestsPresentationOfShareController:(id)a4 atRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a4;
  objc_msgSend(v14, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CKSearchViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "popoverPresentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourceView:", v11);

    objc_msgSend(v14, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceRect:", x, y, width, height);

  }
  -[CKSearchViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

}

- (void)searchController:(id)a3 requestsPresentationOfAlertController:(id)a4 atRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a4;
  objc_msgSend(v14, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CKSearchViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "popoverPresentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourceView:", v11);

    objc_msgSend(v14, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceRect:", x, y, width, height);

  }
  -[CKSearchViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

}

- (id)contextMenusForConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKSearchViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextMenusForConversation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)searchTokenFiltersForSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKSearchViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBarForSearchViewController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v6, "searchTextField", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "representedObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v4;
}

- (int64_t)_indexForExistingConversationToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CKSearchViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBarForSearchViewController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "searchTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "representedObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "conversation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "conversation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
        break;
      if (++v9 >= (unint64_t)objc_msgSend(v8, "count"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (BOOL)shouldInsetResultsForSearchController:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CKSearchViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldInsetResultsForSearchController:", v4);

  return v6;
}

- (BOOL)searchControllerCanShowSectionHeader:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  BOOL result;

  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = CKIsRunningInMacCatalyst();
  result = 1;
  if (!v6 && v4 == v5)
    return !-[CKSearchViewController canShowTokenSuggestions](self, "canShowTokenSuggestions");
  return result;
}

- (UIEdgeInsets)parentMarginInsetsForSearchController:(id)a3
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
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchSectionMarginInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (double)widthForDeterminingAvatarVisibility
{
  void *v2;
  double v3;
  double v4;

  -[CKSearchViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  return v4;
}

- (double)containerWidthForController:(id)a3
{
  void *v4;
  double Width;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGRect v11;

  -[CKSearchViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v11);
  -[CKSearchViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v9 = Width - (v7 + v8);

  return v9;
}

- (id)searchController:(id)a3 cellForResult:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CKSearchViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE194F58))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v10, "resultIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqual:", v12);

            if ((v13 & 1) != 0)
            {
              v7 = v10;
              goto LABEL_13;
            }
          }
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

- (void)setCanShowTokenSuggestions:(BOOL)a3
{
  if (self->_canShowTokenSuggestions != a3)
  {
    self->_canShowTokenSuggestions = a3;
    if (!a3)
      -[CKSearchViewController _hideInlineSearchSuggestions](self, "_hideInlineSearchSuggestions");
  }
}

- (void)cancelCurrentQuery
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CKSearchViewController searchControllers](self, "searchControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancelCurrentSearch");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)searchEnded
{
  NSObject *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Search ended", buf, 2u);
    }

  }
  -[CKSearchViewController setSearchInProgress:](self, "setSearchInProgress:", 0);
  -[CKSearchViewController setSearchText:](self, "setSearchText:", &stru_1E276D870);
  -[CKSearchViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[CKSearchViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[CKSearchViewController setMode:](self, "setMode:", 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CKSearchViewController searchControllers](self, "searchControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "cancelCurrentSearch");
        objc_msgSend(v10, "searchEnded");
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

  -[CKSearchViewController contextMenuInteraction](self, "contextMenuInteraction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CKSearchViewController contextMenuInteraction](self, "contextMenuInteraction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissMenu");

  }
}

- (void)findNext
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  id v11;

  -[CKSearchViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 1);

  v11 = 0;
  v5 = -[CKSearchViewController _hasSelectedItemAtIndexPath:](self, "_hasSelectedItemAtIndexPath:", &v11);
  v6 = v11;
  v7 = v6;
  v8 = 0;
  v9 = (void *)MEMORY[0x1E0CB36B0];
  if (v5)
    v8 = -[CKSearchViewController rowIndexFindNextForIndex:numberOfTotalItems:](self, "rowIndexFindNextForIndex:numberOfTotalItems:", objc_msgSend(v6, "row", 0), v4);
  objc_msgSend(v9, "indexPathForRow:inSection:", v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchViewController _selectItemForFindAtIndexPath:](self, "_selectItemForFindAtIndexPath:", v10);

}

- (void)findPrevious
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  id v11;

  -[CKSearchViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 1);

  v11 = 0;
  v5 = -[CKSearchViewController _hasSelectedItemAtIndexPath:](self, "_hasSelectedItemAtIndexPath:", &v11);
  v6 = v11;
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0CB36B0];
  if (v5)
    v9 = -[CKSearchViewController rowIndexFindPreviousForIndex:numberOfTotalItems:](self, "rowIndexFindPreviousForIndex:numberOfTotalItems:", objc_msgSend(v6, "row"), v4);
  else
    v9 = v4 - 1;
  objc_msgSend(v8, "indexPathForRow:inSection:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchViewController _selectItemForFindAtIndexPath:](self, "_selectItemForFindAtIndexPath:", v10);

}

- (BOOL)conversationSearchHasResult
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  LODWORD(v3) = -[CKSearchViewController isViewLoaded](self, "isViewLoaded");
  if ((_DWORD)v3)
  {
    -[CKSearchViewController collectionView](self, "collectionView");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[CKSearchViewController collectionView](self, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "numberOfSections");

      if (v6 < 2)
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        -[CKSearchViewController collectionView](self, "collectionView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "numberOfItemsInSection:", 1);

        LOBYTE(v3) = v8 > 0;
      }
    }
  }
  return v3;
}

- (BOOL)_hasSelectedItemAtIndexPath:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CKSearchViewController collectionView](self, "collectionView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "section") == 1)
        {
          *a3 = objc_retainAutorelease(v10);
          v11 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)_selectItemForFindAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKSearchViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectItemAtIndexPath:animated:scrollPosition:", v4, 1, 0);

  -[CKSearchViewController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKSearchViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v6, v4);

}

- (int64_t)rowIndexFindNextForIndex:(int64_t)a3 numberOfTotalItems:(int64_t)a4
{
  return (a3 + 1) % a4;
}

- (int64_t)rowIndexFindPreviousForIndex:(int64_t)a3 numberOfTotalItems:(int64_t)a4
{
  return (a3 + a4 - 1) % a4;
}

- (void)reloadData
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  NSArray *v12;
  NSArray *searchControllersWithResults;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[8];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Updating search collection view!", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[CKSearchViewController visibleSearchControllers](self, "visibleSearchControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v33;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
        v10 = -[CKSearchViewController mode](self, "mode") == 4 || -[CKSearchViewController mode](self, "mode") == 2;
        objc_msgSend(v9, "results");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
          v10 = 1;

        if (v10)
          objc_msgSend(v4, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v6);
  }

  v12 = (NSArray *)objc_msgSend(v4, "copy");
  searchControllersWithResults = self->_searchControllersWithResults;
  self->_searchControllersWithResults = v12;

  v14 = -[CKSearchViewController _newSnapshotForCurrentControllerState](self, "_newSnapshotForCurrentControllerState");
  -[CKSearchViewController dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySnapshotUsingReloadData:", v14);

  -[CKSearchViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "visibleCells");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __36__CKSearchViewController_reloadData__block_invoke;
  v31[3] = &unk_1E275A538;
  v31[4] = self;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v31);

  +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "indexPathsForVisibleSupplementaryElementsOfKind:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __36__CKSearchViewController_reloadData__block_invoke_2;
  v29[3] = &unk_1E27552A8;
  v29[4] = self;
  v30 = v19;
  v22 = v19;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v29);

  -[objc_class supplementaryViewType](-[CKSearchViewController _searchResultsHeaderClass](self, "_searchResultsHeaderClass"), "supplementaryViewType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchViewController collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "indexPathsForVisibleSupplementaryElementsOfKind:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __36__CKSearchViewController_reloadData__block_invoke_3;
  v27[3] = &unk_1E27552A8;
  v27[4] = self;
  v28 = v23;
  v26 = v23;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v27);

}

void __36__CKSearchViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refreshForSearchTextIfNeeded:", v3);

  }
}

void __36__CKSearchViewController_reloadData__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "section");
  objc_msgSend(*(id *)(a1 + 32), "searchControllersWithResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 < v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchControllersWithResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v10, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supplementaryViewForElementKind:atIndexPath:", *(_QWORD *)(a1 + 40), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "updateSupplementryViewIfNeeded:atIndexPath:", v9, v10);
  }

}

void __36__CKSearchViewController_reloadData__block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "section");
  objc_msgSend(*(id *)(a1 + 32), "searchControllersWithResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 < v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchControllersWithResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v11, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supplementaryViewForElementKind:atIndexPath:", *(_QWORD *)(a1 + 40), v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "showAllButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "_shouldHideShowAllButtonForController:", v7));

    objc_msgSend(v9, "setSectionIndex:", objc_msgSend(v11, "section"));
  }

}

- (id)_newSnapshotForCurrentControllerState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  CKSearchViewController *v14;
  id v15;

  v3 = (void *)objc_opt_new();
  -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByApplyingSelector:", sel_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByApplyingSelector:", sel_sectionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__CKSearchViewController__newSnapshotForCurrentControllerState__block_invoke;
  v12[3] = &unk_1E274B840;
  v13 = v4;
  v14 = self;
  v7 = v3;
  v15 = v7;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  v9 = v15;
  v10 = v7;

  return v10;
}

void __63__CKSearchViewController__newSnapshotForCurrentControllerState__block_invoke(id *a1, void *a2, unint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(a1[4], "count") >= a3)
  {
    objc_msgSend(a1[4], "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(a1[5], "_identifiersToAppendForResults:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = 138412546;
          v12 = v5;
          v13 = 2112;
          v14 = v9;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Section %@ appending %@", (uint8_t *)&v11, 0x16u);
        }

      }
      objc_msgSend(a1[6], "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v9, v5);

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "CKSearchController - Allocated search controllers and section counts do not match!!", (uint8_t *)&v11, 2u);
    }

  }
}

- (id)_identifiersToAppendForResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "identifier", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)layoutSectionForController:(id)a3 withEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  void *v35;
  id v36;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "customLayoutSectionForEnvironment:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v10, "contentInsets");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
  }
  else
  {
    objc_msgSend(v6, "layoutGroupWithEnvironment:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v19);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "searchResultsInsets");
    v12 = v21;
    v14 = v22;
    v16 = v23;
    v18 = v24;

  }
  objc_msgSend(v10, "setSupplementariesFollowContentInsets:", 0);
  if (objc_msgSend(v6, "applyLayoutMarginsToLayoutGroup"))
  {
    -[CKSearchViewController collectionView](self, "collectionView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "marginInsets");
    v14 = v14 + v26;

    -[CKSearchViewController collectionView](self, "collectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "marginInsets");
    v18 = v18 + v28;

  }
  objc_msgSend(v6, "additionalGroupInsets");
  objc_msgSend(v10, "setContentInsets:", v12 + v29, v14 + v30, v16 + v32, v18 + v31);
  objc_msgSend(v6, "interGroupSpacing");
  objc_msgSend(v10, "setInterGroupSpacing:");
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKSearchViewController headerBoundryItemsForController:withEnvironment:](self, "headerBoundryItemsForController:withEnvironment:", v6, v7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    objc_msgSend(v33, "addObjectsFromArray:", v34);
  -[CKSearchViewController footerBoundryItemsForController:withEnvironment:](self, "footerBoundryItemsForController:withEnvironment:", v6, v7);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    objc_msgSend(v33, "addObjectsFromArray:", v35);
  objc_msgSend(v10, "setBoundarySupplementaryItems:", v33);
  objc_msgSend(v10, "setOrthogonalScrollingBehavior:", objc_msgSend((id)objc_opt_class(), "orthogonalScrollingBehavior"));
  v36 = v10;

  return v36;
}

- (id)headerBoundryItemsForController:(id)a3 withEnvironment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "wantsHeaderSection"))
  {
    objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CEA1C0];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchHeaderHeight");
    objc_msgSend(v8, "estimatedDimension:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "headerOverrideClass"))
      v12 = (objc_class *)objc_msgSend(v5, "headerOverrideClass");
    else
      v12 = -[CKSearchViewController _searchResultsHeaderClass](self, "_searchResultsHeaderClass");
    v13 = (void *)MEMORY[0x1E0CEA1B0];
    -[objc_class supplementaryViewType](v12, "supplementaryViewType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v11, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPinToVisibleBounds:", objc_msgSend(v16, "searchSectionHeadersPinToBounds"));

    objc_msgSend(v15, "setZIndex:", 101);
    objc_msgSend(v6, "addObject:", v15);

  }
  return v6;
}

- (id)footerBoundryItemsForController:(id)a3 withEnvironment:(id)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "wantsFooterSection") && objc_msgSend(v4, "footerClass"))
  {
    objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 44.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "footerClass");
    v10 = (void *)MEMORY[0x1E0CEA1B0];
    objc_msgSend(v9, "supplementaryViewType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v8, v11, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v12);
  }

  return v5;
}

- (id)globalLayoutConfiguration
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA430], "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKSearchViewController searchInProgress](self, "searchInProgress")
    && (-[CKSearchViewController _needsIndexing](self, "_needsIndexing")
     || -[CKSearchViewController _wantsInternalDebugInformation](self, "_wantsInternalDebugInformation")))
  {
    -[CKSearchViewController searchCompleteControllerSet](self, "searchCompleteControllerSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    -[CKSearchViewController searchControllers](self, "searchControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v5 >= v7)
    {
      objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 120.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CEA1B0];
      +[CKSearchIndexingFooterCell supplementaryViewType](CKSearchIndexingFooterCell, "supplementaryViewType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v10, v12, 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v16[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setBoundarySupplementaryItems:", v14);

    }
  }
  return v3;
}

- (BOOL)_wantsInternalDebugInformation
{
  void *v3;
  char v4;

  if ((IMGetDomainBoolForKey() & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalInstall");

  return v4;
}

- (BOOL)_needsIndexing
{
  return objc_msgSend(MEMORY[0x1E0D397C8], "needsIndexing");
}

- (Class)_searchResultsHeaderClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_currentModeIsDetails
{
  return -[CKSearchViewController mode](self, "mode") == 3 || -[CKSearchViewController mode](self, "mode") == 4;
}

- (BOOL)_shouldHideShowAllButtonForController:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;

  v3 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    v4 = objc_msgSend(v3, "mode");
    if (v4 == 4 || v4 == 2)
      v6 = 1;
    else
      v6 = v4;
    v7 = objc_msgSend(v3, "queriedResultsCount");
    LOBYTE(v6) = v7 <= objc_msgSend(v3, "maxResultsForMode:", v6);
  }
  else
  {
    LODWORD(v6) = objc_msgSend(v3, "hasMoreResults") ^ 1;
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v5 = a3;
  -[CKSearchViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[CKSearchViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CKSearchViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForItemAtIndexPath:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", v14);
LABEL_10:

        goto LABEL_11;
      }
      IMLogHandleForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CKSearchViewController contextMenuInteraction:previewForHighlightingMenuWithConfiguration:].cold.1(v17);

    }
    v16 = 0;
    goto LABEL_10;
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  id v60;

  y = a4.y;
  x = a4.x;
  if (!-[CKSearchViewController contextMenuInteractionShouldBegin:](self, "contextMenuInteractionShouldBegin:", a3))
    goto LABEL_9;
  -[CKSearchViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "section");
  -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 >= v11)
  {
LABEL_8:

LABEL_9:
    v48 = 0;
    return v48;
  }
  -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v8, "section"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v8, "row");
  objc_msgSend(v13, "results");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v14 >= v16)
  {

    goto LABEL_8;
  }
  objc_msgSend(v13, "results");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v8, "row"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSearchViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  -[CKSearchViewController collectionView](self, "collectionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "cellForItemAtIndexPath:", v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v29, "bounds");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    -[CKSearchViewController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "convertRect:toView:", v38, v31, v33, v35, v37);
    v21 = v39;
    v23 = v40;
    v25 = v41;
    v27 = v42;

  }
  v43 = (void *)MEMORY[0x1E0CEA4B0];
  v44 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __80__CKSearchViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v58[3] = &unk_1E2757AC0;
  v59 = v13;
  v60 = v18;
  v50[0] = v44;
  v50[1] = 3221225472;
  v50[2] = __80__CKSearchViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v50[3] = &unk_1E275A560;
  v51 = v59;
  v52 = v60;
  v53 = v8;
  v54 = v21;
  v55 = v23;
  v56 = v25;
  v57 = v27;
  v45 = v8;
  v46 = v60;
  v47 = v59;
  objc_msgSend(v43, "configurationWithIdentifier:previewProvider:actionProvider:", v45, v58, v50);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

uint64_t __80__CKSearchViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "previewViewControllerForResult:", *(_QWORD *)(a1 + 40));
}

id __80__CKSearchViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "menuElementsForResult:atIndexPath:sourceRect:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v7 = a5;
  objc_msgSend(a4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "section");
  -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 < v11)
  {
    -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v8, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend((id)objc_opt_class(), "previewControllerPresentsModally") & 1) == 0)
    {
      v14 = objc_msgSend(v8, "row");
      objc_msgSend(v13, "results");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v14 < v16)
      {
        objc_msgSend(v13, "results");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v8, "row"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v13, "previewViewControllerForResult:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __107__CKSearchViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
          v21[3] = &unk_1E274A108;
          v21[4] = self;
          v22 = v19;
          v20 = v19;
          objc_msgSend(v7, "addAnimations:", v21);

        }
      }
    }

  }
}

void __107__CKSearchViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchViewController:requestsPushOfSearchController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)contextMenuInteractionShouldBegin:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;

  v4 = a3;
  -[CKSearchViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_ck_isEditing");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[CKSearchViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    -[CKSearchViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathForItemAtPoint:", v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKSearchViewController collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cellForItemAtIndexPath:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16
      && (v17 = objc_msgSend(v14, "section"),
          -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "count"),
          v18,
          v17 < v19))
    {
      -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v14, "section"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend((id)objc_opt_class(), "supportsMenuInteraction")
        && (v22 = objc_msgSend(v14, "row"),
            objc_msgSend(v21, "results"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v24 = objc_msgSend(v23, "count"),
            v23,
            v22 < v24))
      {
        objc_msgSend(v21, "results");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndex:", objc_msgSend(v14, "row"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = objc_msgSend(v21, "shouldStartMenuInteractionForResult:", v26);
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
      v21 = 0;
    }

  }
  return v7;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v28;
  uint64_t v29;
  id (*v30)(uint64_t);
  void *v31;
  id v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "section");
  -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11 >= v13)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "CKSearchController - Asked to provide a cell for a section we don't have!", buf, 2u);
      }

    }
    v22 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[CKSearchViewController searchControllersWithResults](self, "searchControllersWithResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "results");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v10, "item");
    if (v17 >= objc_msgSend(v16, "count"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "CKSearchController - Index path is out of range for search results", buf, 2u);
        }

      }
      v22 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v10, "item"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "itemProviderForSearchResult:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v8, "cellForItemAtIndexPath:", v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v19);
          objc_msgSend(v21, "setLocalObject:", v18);
          v28 = MEMORY[0x1E0C809B0];
          v29 = 3221225472;
          v30 = __82__CKSearchViewController_collectionView_itemsForBeginningDragSession_atIndexPath___block_invoke;
          v31 = &unk_1E2756B20;
          v32 = v20;
          objc_msgSend(v21, "setPreviewProvider:", &v28);
          v33 = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1, v28, v29, v30, v31);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v10;
              _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Couldn't get cell for indexPath: %@", buf, 0xCu);
            }

          }
          v22 = (void *)MEMORY[0x1E0C9AA60];
        }

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Failed to create item provider for search drag item", buf, 2u);
          }

        }
        v22 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
  }

  return v22;
}

id __82__CKSearchViewController_collectionView_itemsForBeginningDragSession_atIndexPath___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CEA560]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = objc_alloc_init(MEMORY[0x1E0CEA568]);
  v5 = (void *)objc_msgSend(v2, "initWithView:parameters:", v3, v4);

  return v5;
}

- (CKContainerSearchControllerDelegate)delegate
{
  return (CKContainerSearchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)dismissingSearchController
{
  return self->_dismissingSearchController;
}

- (void)setDismissingSearchController:(BOOL)a3
{
  self->_dismissingSearchController = a3;
}

- (BOOL)canShowTokenSuggestions
{
  return self->_canShowTokenSuggestions;
}

- (NSArray)searchControllers
{
  return self->_searchControllers;
}

- (NSDictionary)_searchControllerMap
{
  return self->__searchControllerMap;
}

- (void)set_searchControllerMap:(id)a3
{
  objc_storeStrong((id *)&self->__searchControllerMap, a3);
}

- (NSArray)visibleSearchControllers
{
  return self->_visibleSearchControllers;
}

- (void)setVisibleSearchControllers:(id)a3
{
  objc_storeStrong((id *)&self->_visibleSearchControllers, a3);
}

- (NSArray)searchControllersWithResults
{
  return self->_searchControllersWithResults;
}

- (void)setSearchControllersWithResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchControllersWithResults, a3);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1136);
}

- (BOOL)searchInProgress
{
  return self->_searchInProgress;
}

- (void)setSearchInProgress:(BOOL)a3
{
  self->_searchInProgress = a3;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UICollectionViewCompositionalLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (id)performAfterInitialLoadBlock
{
  return self->_performAfterInitialLoadBlock;
}

- (void)setPerformAfterInitialLoadBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (NSMutableSet)searchCompleteControllerSet
{
  return self->_searchCompleteControllerSet;
}

- (IMTimingCollection)timingCollection
{
  return self->_timingCollection;
}

- (void)setTimingCollection:(id)a3
{
  objc_storeStrong((id *)&self->_timingCollection, a3);
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
}

- (CKConversationListCellLayout)cellLayout
{
  return self->_cellLayout;
}

- (void)setClientStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_clientStateMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientStateMonitor, 0);
  objc_storeStrong((id *)&self->_cellLayout, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_timingCollection, 0);
  objc_storeStrong((id *)&self->_searchCompleteControllerSet, 0);
  objc_storeStrong(&self->_performAfterInitialLoadBlock, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_searchControllersWithResults, 0);
  objc_storeStrong((id *)&self->_visibleSearchControllers, 0);
  objc_storeStrong((id *)&self->__searchControllerMap, 0);
  objc_storeStrong((id *)&self->_searchControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)contextMenuInteraction:(os_log_t)log previewForHighlightingMenuWithConfiguration:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Tried to initialize UITargetedPreview with a view that is not in a window", v1, 2u);
}

@end
