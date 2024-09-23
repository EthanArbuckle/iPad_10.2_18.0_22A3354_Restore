@implementation SFTabCollectionSearchController

- (BOOL)isSearching
{
  if (-[NSString length](self->_searchTerm, "length"))
    return 1;
  else
    return -[SFTabOverviewSearchBar isFirstResponder](self->_searchBar, "isFirstResponder");
}

- (BOOL)applySearchToItems:(id)a3
{
  id v5;
  NSArray *v6;
  _BOOL4 hasEmptyResults;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  NSIndexSet *v12;
  NSIndexSet *indexesMatchingSearchTerm;
  NSArray *v14;
  NSArray *itemsMatchingSearchTerm;
  NSObject *v16;
  NSIndexSet *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  NSIndexSet *v22;
  NSIndexSet *v23;
  BOOL v24;
  id v25;
  char v26;
  _QWORD v28[4];
  id v29;
  id v30;
  SFTabCollectionSearchController *v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_itemsMatchingSearchTerm;
  hasEmptyResults = self->_hasEmptyResults;
  if (-[SFTabCollectionSearchController isSearching](self, "isSearching")
    && -[NSString length](self->_searchTerm, "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabView);
    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __54__SFTabCollectionSearchController_applySearchToItems___block_invoke;
    v28[3] = &unk_1E9CF6CC8;
    v10 = v9;
    v29 = v10;
    v11 = WeakRetained;
    v30 = v11;
    v31 = self;
    objc_msgSend(v5, "indexesOfObjectsPassingTest:", v28);
    v12 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    indexesMatchingSearchTerm = self->_indexesMatchingSearchTerm;
    self->_indexesMatchingSearchTerm = v12;

    objc_msgSend(v5, "objectsAtIndexes:", self->_indexesMatchingSearchTerm);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    itemsMatchingSearchTerm = self->_itemsMatchingSearchTerm;
    self->_itemsMatchingSearchTerm = v14;

    v16 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_indexesMatchingSearchTerm;
      v18 = v16;
      v19 = -[NSIndexSet count](v17, "count");
      v20 = objc_msgSend(v5, "count");
      v21 = -[NSString length](self->_searchTerm, "length");
      *(_DWORD *)buf = 134218496;
      v33 = v19;
      v34 = 2048;
      v35 = v20;
      v36 = 1024;
      v37 = v21;
      _os_log_impl(&dword_1D7CA3000, v18, OS_LOG_TYPE_DEFAULT, "Update tab overview search with number of matching items: %ld, number of items: %ld, has search text: %d", buf, 0x1Cu);

    }
  }
  else
  {
    objc_storeStrong((id *)&self->_itemsMatchingSearchTerm, a3);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
    v22 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    v23 = self->_indexesMatchingSearchTerm;
    self->_indexesMatchingSearchTerm = v22;

  }
  if (-[NSString length](self->_searchTerm, "length"))
    v24 = -[NSIndexSet count](self->_indexesMatchingSearchTerm, "count") == 0;
  else
    v24 = 0;
  self->_hasEmptyResults = v24;
  v25 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((hasEmptyResults || self->_hasEmptyResults) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v25, "searchControllerDidUpdateHasEmptyResults:", self);
  v26 = WBSIsEqual();

  return v26 ^ 1;
}

- (void)setTabView:(id)a3
{
  objc_storeWeak((id *)&self->_tabView, a3);
}

- (void)setItemSource:(id)a3
{
  objc_storeWeak((id *)&self->_itemSource, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SFTabOverviewSearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchTerm:(id)a3
{
  __CFString *v4;
  NSString *v5;
  NSString *searchTerm;
  id WeakRetained;
  __CFString *v8;

  v4 = &stru_1E9CFDBB0;
  if (a3)
    v4 = (__CFString *)a3;
  v8 = v4;
  if ((WBSIsEqual() & 1) == 0)
  {
    v5 = (NSString *)-[__CFString copy](v8, "copy");
    searchTerm = self->_searchTerm;
    self->_searchTerm = v5;

    -[SFTabOverviewSearchBar setText:](self->_searchBar, "setText:", v8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_itemSource);
    objc_msgSend(WeakRetained, "searchControllerDidUpdateMatches:", self);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)kvoContext_0 == a6 && objc_msgSend(v10, "isEqual:", CFSTR("embeddedInToolbar")))
  {
    -[SFTabCollectionSearchController updateSearchBarDefaultCancelButtonAnimated:](self, "updateSearchBarDefaultCancelButtonAnimated:", 0);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SFTabCollectionSearchController;
    -[SFTabCollectionSearchController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (SFTabCollectionSearchController)init
{
  SFTabCollectionSearchController *v2;
  SFTabCollectionSearchController *v3;
  NSString *searchTerm;
  SFTabOverviewSearchBar *v5;
  SFTabOverviewSearchBar *searchBar;
  SFTabCollectionSearchController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFTabCollectionSearchController;
  v2 = -[SFTabCollectionSearchController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    searchTerm = v2->_searchTerm;
    v2->_searchTerm = (NSString *)&stru_1E9CFDBB0;

    v5 = objc_alloc_init(SFTabOverviewSearchBar);
    searchBar = v3->_searchBar;
    v3->_searchBar = v5;

    -[SFTabOverviewSearchBar setDelegate:](v3->_searchBar, "setDelegate:", v3);
    -[SFTabOverviewSearchBar addObserver:forKeyPath:options:context:](v3->_searchBar, "addObserver:forKeyPath:options:context:", v3, CFSTR("embeddedInToolbar"), 0, kvoContext_0);
    -[SFTabCollectionSearchController updateSearchBarDefaultCancelButtonAnimated:](v3, "updateSearchBarDefaultCancelButtonAnimated:", 0);
    v7 = v3;
  }

  return v3;
}

- (void)updateSearchBarDefaultCancelButtonAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  SFTabOverviewSearchBar *searchBar;
  NSUInteger v7;
  id v8;

  v3 = a3;
  v5 = -[SFTabOverviewSearchBar embeddedInToolbar](self->_searchBar, "embeddedInToolbar");
  searchBar = self->_searchBar;
  if (v5)
  {
    if (-[SFTabOverviewSearchBar showsCancelButton](searchBar, "showsCancelButton"))
      -[SFTabOverviewSearchBar setShowsCancelButton:animated:](self->_searchBar, "setShowsCancelButton:animated:", 0, v3);
    return;
  }
  if (-[SFTabOverviewSearchBar isFirstResponder](searchBar, "isFirstResponder"))
  {
    if ((-[SFTabOverviewSearchBar showsCancelButton](self->_searchBar, "showsCancelButton") & 1) != 0)
      return;
    -[SFTabOverviewSearchBar setShowsCancelButton:animated:](self->_searchBar, "setShowsCancelButton:animated:", 1, v3);
    goto LABEL_9;
  }
  v7 = -[NSString length](self->_searchTerm, "length");
  if ((v7 != 0) != -[SFTabOverviewSearchBar showsCancelButton](self->_searchBar, "showsCancelButton"))
  {
    -[SFTabOverviewSearchBar setShowsCancelButton:animated:](self->_searchBar, "setShowsCancelButton:animated:", v7 != 0, v3);
    if (v7)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0DC39D0], "sf_tabMenu");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[SFTabOverviewSearchBar setCancelButtonMenu:](self->_searchBar, "setCancelButtonMenu:", v8);

    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[SFTabOverviewSearchBar removeObserver:forKeyPath:context:](self->_searchBar, "removeObserver:forKeyPath:context:", self, CFSTR("embeddedInToolbar"), kvoContext_0);
  v3.receiver = self;
  v3.super_class = (Class)SFTabCollectionSearchController;
  -[SFTabCollectionSearchController dealloc](&v3, sel_dealloc);
}

- (void)beginSearching
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "searchControllerWillBeginSearch:", self);
  -[SFTabOverviewSearchBar becomeFirstResponder](self->_searchBar, "becomeFirstResponder");

}

- (void)endSearching
{
  id WeakRetained;

  -[SFTabOverviewSearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
  -[SFTabCollectionSearchController setSearchTerm:](self, "setSearchTerm:", &stru_1E9CFDBB0);
  -[SFTabCollectionSearchController updateSearchBarDefaultCancelButtonAnimated:](self, "updateSearchBarDefaultCancelButtonAnimated:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "searchControllerDidEndSearch:", self);

}

uint64_t __54__SFTabCollectionSearchController_applySearchToItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "tabCollectionView:item:matchesSearchText:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 64));
}

- (void)test_setIndexesMatchingSearch:(id)a3
{
  objc_storeStrong((id *)&self->_indexesMatchingSearchTerm, a3);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_DEFAULT, "Edit tab overview search", v7, 2u);
  }
  -[SFTabCollectionSearchController setSearchTerm:](self, "setSearchTerm:", v5);

}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id WeakRetained;

  -[SFTabCollectionSearchController updateSearchBarDefaultCancelButtonAnimated:](self, "updateSearchBarDefaultCancelButtonAnimated:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "searchControllerDidChangeEditing:", self);

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id WeakRetained;

  -[SFTabCollectionSearchController updateSearchBarDefaultCancelButtonAnimated:](self, "updateSearchBarDefaultCancelButtonAnimated:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "searchControllerDidChangeEditing:", self);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_DEFAULT, "Tap cancel tab overview search", v5, 2u);
  }
  objc_msgSend(v3, "resignFirstResponder");

}

- (SFTabCollectionSearchControllerDelegate)delegate
{
  return (SFTabCollectionSearchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SFTabCollectionSearchControllerItemSource)itemSource
{
  return (SFTabCollectionSearchControllerItemSource *)objc_loadWeakRetained((id *)&self->_itemSource);
}

- (TabThumbnailCollectionView)tabView
{
  return (TabThumbnailCollectionView *)objc_loadWeakRetained((id *)&self->_tabView);
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (NSArray)itemsMatchingSearchTerm
{
  return self->_itemsMatchingSearchTerm;
}

- (NSIndexSet)indexesMatchingSearchTerm
{
  return self->_indexesMatchingSearchTerm;
}

- (BOOL)hasEmptyResults
{
  return self->_hasEmptyResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_destroyWeak((id *)&self->_tabView);
  objc_destroyWeak((id *)&self->_itemSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indexesMatchingSearchTerm, 0);
  objc_storeStrong((id *)&self->_itemsMatchingSearchTerm, 0);
}

@end
