@implementation MRUMediaSuggestionsViewController

- (MRUMediaSuggestionsViewController)initWithMediaSuggestions:(id)a3
{
  id v5;
  MRUMediaSuggestionsViewController *v6;
  MRUMediaSuggestionsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUMediaSuggestionsViewController;
  v6 = -[MRUMediaSuggestionsViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaSuggestions, a3);

  return v7;
}

- (void)loadView
{
  MRUMediaSuggestionsView *v3;
  MRUMediaSuggestionsView *v4;

  v3 = [MRUMediaSuggestionsView alloc];
  v4 = -[MRUMediaSuggestionsView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MRUMediaSuggestionsViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  int64_t layout;
  void *v4;
  _BOOL8 supportsHorizontalLayout;
  void *v6;
  double top;
  double left;
  double bottom;
  double right;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  UICollectionViewDiffableDataSource *v22;
  UICollectionViewDiffableDataSource *dataSource;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)MRUMediaSuggestionsViewController;
  -[MRUMediaSuggestionsViewController viewDidLoad](&v29, sel_viewDidLoad);
  layout = self->_layout;
  -[MRUMediaSuggestionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayout:", layout);

  supportsHorizontalLayout = self->_supportsHorizontalLayout;
  -[MRUMediaSuggestionsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSupportsHorizontalLayout:", supportsHorizontalLayout);

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  -[MRUMediaSuggestionsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentEdgeInsets:", top, left, bottom, right);

  -[MRUMediaSuggestionsViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x1E0DC35C8];
  v15 = objc_opt_class();
  v16 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __48__MRUMediaSuggestionsViewController_viewDidLoad__block_invoke;
  v26[3] = &unk_1E5819CE0;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v14, "registrationWithCellClass:configurationHandler:", v15, v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[MRUMediaSuggestionsViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __48__MRUMediaSuggestionsViewController_viewDidLoad__block_invoke_2;
  v24[3] = &unk_1E5819D08;
  v21 = v17;
  v25 = v21;
  v22 = (UICollectionViewDiffableDataSource *)objc_msgSend(v18, "initWithCollectionView:cellProvider:", v20, v24);
  dataSource = self->_dataSource;
  self->_dataSource = v22;

  -[MRUMediaSuggestionsViewController updateSuggestions](self, "updateSuggestions");
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __48__MRUMediaSuggestionsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "updateCell:forIdentifier:", v7, v6);

}

uint64_t __48__MRUMediaSuggestionsViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRUMediaSuggestionsViewController;
  -[MRUMediaSuggestionsViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[MRUMediaSuggestionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateCollectionViewLayout");

  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[MRUMediaSuggestionsViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentOffset:", v5, v6);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)MRUMediaSuggestionsViewController;
  -[MRUMediaSuggestionsViewController viewWillDisappear:](&v19, sel_viewWillDisappear_);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MRUMediaSuggestionsViewController view](self, "view", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        -[MRUMediaSuggestionsViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "collectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "deselectItemAtIndexPath:animated:", v12, v3);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setMediaSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSuggestions, a3);
  if (-[MRUMediaSuggestionsViewController isViewLoaded](self, "isViewLoaded"))
    -[MRUMediaSuggestionsViewController updateSuggestions](self, "updateSuggestions");
}

- (void)setStylingProvider:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_stylingProvider, a3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MRUMediaSuggestionsViewController view](self, "view", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleCells");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setStylingProvider:", v5);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)setLayout:(int64_t)a3
{
  id v4;

  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUMediaSuggestionsViewController viewIfLoaded](self, "viewIfLoaded");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLayout:", a3);

  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
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
  v7 = self->_contentEdgeInsets.top;
  if (self->_contentEdgeInsets.left != a3.left
    || v7 != top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets.top = top;
    self->_contentEdgeInsets.left = a3.left;
    self->_contentEdgeInsets.bottom = a3.bottom;
    self->_contentEdgeInsets.right = a3.right;
    -[MRUMediaSuggestionsViewController viewIfLoaded](self, "viewIfLoaded", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentEdgeInsets:", top, left, bottom, right);

  }
}

- (void)setSupportsHorizontalLayout:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_supportsHorizontalLayout != a3)
  {
    v3 = a3;
    self->_supportsHorizontalLayout = a3;
    -[MRUMediaSuggestionsViewController viewIfLoaded](self, "viewIfLoaded");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSupportsHorizontalLayout:", v3);

  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") == 0;

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  UICollectionViewDiffableDataSource *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;
  id v12;
  UICollectionViewDiffableDataSource *v13;
  _QWORD v14[4];
  UICollectionViewDiffableDataSource *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = self->_dataSource;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v7, "itemIdentifierForIndexPath:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_suggestions, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__MRUMediaSuggestionsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v14[3] = &unk_1E5819160;
  v15 = v7;
  v16 = v8;
  v17 = v6;
  v11 = v6;
  v12 = v8;
  v13 = v7;
  objc_msgSend(WeakRetained, "mediaSuggestionsViewController:didSelectSuggestion:completion:", self, v9, v14);

}

void __77__MRUMediaSuggestionsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "indexPathForItemIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "deselectItemAtIndexPath:animated:", v2, 1);

}

- (void)updateSuggestions
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *suggestions;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_mediaSuggestions, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](self->_mediaSuggestions, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_mediaSuggestions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

          objc_msgSend(v10, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v13);

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v14 = (NSDictionary *)objc_msgSend(v4, "copy");
  suggestions = self->_suggestions;
  self->_suggestions = v14;

  v16 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  objc_msgSend(v16, "appendSectionsWithIdentifiers:", &unk_1E58784C8);
  objc_msgSend(v16, "appendItemsWithIdentifiers:", v3);
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v16, 0);

}

- (void)updateCell:(id)a3 forIdentifier:(id)a4
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
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_suggestions, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuggestionIdentifier:", v7);
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v9);

  objc_msgSend(v8, "artist");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSubtitle:", v10);

  +[MRUMediaSuggestionsCache sharedCache](MRUMediaSuggestionsCache, "sharedCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "artworkForMediaSuggestion:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setArtworkImage:", v12);

  +[MRUAssetsProvider sharedAssetsProvider](MRUAssetsProvider, "sharedAssetsProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaSuggestionsViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__MRUMediaSuggestionsViewController_updateCell_forIdentifier___block_invoke;
  v21[3] = &unk_1E5819D30;
  v22 = v6;
  v23 = v7;
  v24 = v8;
  v17 = v8;
  v18 = v7;
  v19 = v6;
  objc_msgSend(v13, "applicationIconForBundleIdentifier:traitCollection:completion:", v14, v16, v21);

  -[MRUMediaSuggestionsViewController stylingProvider](self, "stylingProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setStylingProvider:", v20);

  objc_msgSend(v19, "setLayout:", self->_layout);
}

void __62__MRUMediaSuggestionsViewController_updateCell_forIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD block[4];
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "suggestionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40));

  MCLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 48), "bundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEBUG, "[MRUMediaSuggestionsVC] Loaded icon(%@) into cell", buf, 0xCu);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MRUMediaSuggestionsViewController_updateCell_forIdentifier___block_invoke_18;
    block[3] = &unk_1E5819160;
    v13 = *(id *)(a1 + 32);
    v14 = v3;
    v15 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v6 = v13;
  }
  else if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "suggestionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEBUG, "[MRUMediaSuggestionsVC] Did not load icon(%@) into cell; Identifier mismatch (%@, %@)",
      buf,
      0x20u);

  }
}

void __62__MRUMediaSuggestionsViewController_updateCell_forIdentifier___block_invoke_18(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setIconImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "bundleID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[MRUStringsProvider localizedNameForBundleIdentifier:](MRUStringsProvider, "localizedNameForBundleIdentifier:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iconImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

- (NSArray)mediaSuggestions
{
  return self->_mediaSuggestions;
}

- (MRUMediaSuggestionsViewControllerDelegate)delegate
{
  return (MRUMediaSuggestionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)supportsHorizontalLayout
{
  return self->_supportsHorizontalLayout;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSDictionary)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaSuggestions, 0);
}

@end
