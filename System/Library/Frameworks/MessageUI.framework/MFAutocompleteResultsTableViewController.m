@implementation MFAutocompleteResultsTableViewController

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", 0);

  -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  v5.receiver = self;
  v5.super_class = (Class)MFAutocompleteResultsTableViewController;
  -[MFAutocompleteResultsTableViewController dealloc](&v5, sel_dealloc);
}

- (MFAutocompleteResultsTableViewController)initWithStyle:(int64_t)a3
{
  MFAutocompleteResultsTableViewController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFAutocompleteResultsTableViewController;
  v3 = -[MFAutocompleteResultsTableViewController initWithStyle:](&v6, sel_initWithStyle_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailAutoCompleteTableViewCellBackgroundColorForPopoverDisplay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAutocompleteResultsTableViewController setCellBackgroundColor:](v3, "setCellBackgroundColor:", v4);

    -[MFAutocompleteResultsTableViewController setShouldDimIrrelevantInformation:](v3, "setShouldDimIrrelevantInformation:", 1);
    -[MFAutocompleteResultsTableViewController setShouldHighlightCompleteMatches:](v3, "setShouldHighlightCompleteMatches:", 1);
    -[MFAutocompleteResultsTableViewController setDeferTableViewUpdates:](v3, "setDeferTableViewUpdates:", 0);
  }
  return v3;
}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setAutoresizingMask:", 2);
  objc_msgSend(v4, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", 1);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "_setMarginWidth:", 16.0);
  +[MFRecipientTableViewCell height](MFRecipientTableViewCell, "height");
  objc_msgSend(v4, "setEstimatedRowHeight:");
  objc_msgSend(v4, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v4, "setContentInset:", -1.0, 0.0, -1.0, 0.0);
  -[MFAutocompleteResultsTableViewController setView:](self, "setView:", v4);

}

- (void)_updateTableViewModelAnimated:(BOOL)a3
{
  _BOOL4 v4;
  _MFAutocompleteResultsTableViewModel **p_tableViewModel;
  _MFAutocompleteResultsTableViewModel *tableViewModel;
  _MFAutocompleteResultsTableViewModel *v7;
  _MFAutocompleteResultsTableViewModel *v8;
  _MFAutocompleteResultsTableViewModel *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _MFAutocompleteResultsTableViewModel *v25;

  if (self->_deferTableViewUpdates)
  {
    self->_tableViewNeedsReload = 1;
  }
  else
  {
    v4 = a3;
    p_tableViewModel = &self->_tableViewModel;
    tableViewModel = self->_tableViewModel;
    if (!tableViewModel)
    {
      v7 = -[_MFAutocompleteResultsTableViewModel initWithNumberOfSections:]([_MFAutocompleteResultsTableViewModel alloc], "initWithNumberOfSections:", 3);
      v8 = *p_tableViewModel;
      *p_tableViewModel = v7;

      tableViewModel = *p_tableViewModel;
    }
    v25 = tableViewModel;
    v9 = -[_MFAutocompleteResultsTableViewModel initWithNumberOfSections:]([_MFAutocompleteResultsTableViewModel alloc], "initWithNumberOfSections:", -[_MFAutocompleteResultsTableViewModel numberOfSections](v25, "numberOfSections"));
    -[_MFAutocompleteResultsTableViewModel setObject:atIndexedSubscript:](v9, "setObject:atIndexedSubscript:", self->_searchResults, 0);
    -[_MFAutocompleteResultsTableViewModel setObject:atIndexedSubscript:](v9, "setObject:atIndexedSubscript:", self->_suggestedSearchResults, 1);
    -[_MFAutocompleteResultsTableViewModel setObject:atIndexedSubscript:](v9, "setObject:atIndexedSubscript:", self->_serverSearchResults, 2);
    if (v4)
    {
      -[_MFAutocompleteResultsTableViewModel computeDiffForModel:](v25, "computeDiffForModel:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_tableViewModel, v9);
      -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "beginUpdates");

      objc_msgSend(v10, "insertedRows");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "insertedRows");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertSections:withRowAnimation:", v15, 100);

      }
      objc_msgSend(v10, "deletedRows");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deletedRows");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "deleteSections:withRowAnimation:", v19, 3);

      }
      objc_msgSend(v10, "changedRows");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21)
      {
        -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "changedRows");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "reloadSections:withRowAnimation:", v23, 0);

      }
      -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "endUpdates");

    }
    else
    {
      objc_storeStrong((id *)&self->_tableViewModel, v9);
      -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reloadData");
    }

  }
}

- (void)setDeferTableViewUpdates:(BOOL)a3
{
  _BOOL4 deferTableViewUpdates;

  deferTableViewUpdates = self->_deferTableViewUpdates;
  if (deferTableViewUpdates != a3)
  {
    self->_deferTableViewUpdates = a3;
    deferTableViewUpdates = a3;
  }
  if (!deferTableViewUpdates && self->_tableViewNeedsReload)
  {
    self->_tableViewNeedsReload = 0;
    -[MFAutocompleteResultsTableViewController _updateTableViewModelAnimated:](self, "_updateTableViewModelAnimated:", 0);
  }
}

- (void)presentSearchResults:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 cellAnimationsEnabled;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFAutocompleteResultsTableViewController.m"), 240, CFSTR("Current thread must be main"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "isSuggestedRecipient", (_QWORD)v23);
        v15 = v7;
        if ((v14 & 1) == 0)
        {
          if (objc_msgSend(v13, "isDirectoryServerResult"))
            v15 = v8;
          else
            v15 = v6;
        }
        objc_msgSend(v15, "addObject:", v13);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  objc_storeStrong((id *)&self->_searchResults, v6);
  objc_storeStrong((id *)&self->_suggestedSearchResults, v7);
  objc_storeStrong((id *)&self->_serverSearchResults, v8);
  -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "indexPathForSelectedRow");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  cellAnimationsEnabled = self->_cellAnimationsEnabled;
  if (self->_cellAnimationsEnabled)
  {
    -[MFAutocompleteResultsTableViewController _combinedResults](self, "_combinedResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "count") != 0;
  }
  else
  {
    v19 = 0;
  }
  -[MFAutocompleteResultsTableViewController _updateTableViewModelAnimated:](self, "_updateTableViewModelAnimated:", v19, (_QWORD)v23);
  if (cellAnimationsEnabled)

  if (v17)
  {
    -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scrollToRowAtIndexPath:atScrollPosition:animated:", v17, 0, 1);

    -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "selectRowAtIndexPath:animated:scrollPosition:", v17, 0, 0);

  }
}

- (id)_flattenedIndexPaths
{
  void *v3;
  _MFAutocompleteResultsTableViewModel *tableViewModel;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tableViewModel = self->_tableViewModel;
  v13 = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__MFAutocompleteResultsTableViewController__flattenedIndexPaths__block_invoke;
  v7[3] = &unk_1E5A65A08;
  v7[4] = &v8;
  -[_MFAutocompleteResultsTableViewModel enumerateSections:](tableViewModel, "enumerateSections:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __64__MFAutocompleteResultsTableViewController__flattenedIndexPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;

  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v8);

    }
  }
}

- (void)selectNextSearchResult
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[MFAutocompleteResultsTableViewController _flattenedIndexPaths](self, "_flattenedIndexPaths");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathForSelectedRow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(v9, "indexOfObject:", v4);
      if (v5 + 1 >= (unint64_t)objc_msgSend(v9, "count"))
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(v9, "objectAtIndex:");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    else
    {
      objc_msgSend(v9, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollToRowAtIndexPath:atScrollPosition:animated:", v4, 0, 1);

    -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectRowAtIndexPath:animated:scrollPosition:", v4, 0, 0);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)selectPreviousSearchResult
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[MFAutocompleteResultsTableViewController _flattenedIndexPaths](self, "_flattenedIndexPaths");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathForSelectedRow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(v9, "indexOfObject:", v4);
      if (!v5)
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(v9, "objectAtIndex:", v5 - 1);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    else
    {
      objc_msgSend(v9, "lastObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollToRowAtIndexPath:atScrollPosition:animated:", v4, 0, 1);

    -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectRowAtIndexPath:animated:scrollPosition:", v4, 0, 0);

    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)confirmSelectedRecipient
{
  void *v3;
  void *v4;

  -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSelectedRow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[MFAutocompleteResultsTableViewController _selectSearchResultsRecipientAtIndexPath:](self, "_selectSearchResultsRecipientAtIndexPath:", v4);

  return v4 != 0;
}

- (void)resetScrollPosition
{
  id v2;

  -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

- (void)clear
{
  NSMutableArray *searchResults;
  NSMutableArray *suggestedSearchResults;
  NSMutableArray *serverSearchResults;

  searchResults = self->_searchResults;
  self->_searchResults = 0;

  suggestedSearchResults = self->_suggestedSearchResults;
  self->_suggestedSearchResults = 0;

  serverSearchResults = self->_serverSearchResults;
  self->_serverSearchResults = 0;

  -[MFAutocompleteResultsTableViewController _updateTableViewModelAnimated:](self, "_updateTableViewModelAnimated:", 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[_MFAutocompleteResultsTableViewModel numberOfSections](self->_tableViewModel, "numberOfSections", a3);
}

- (id)_combinedResults
{
  NSMutableArray *searchResults;
  NSMutableArray *suggestedSearchResults;
  NSMutableArray *serverSearchResults;
  NSMutableArray *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  searchResults = self->_searchResults;
  suggestedSearchResults = self->_suggestedSearchResults;
  serverSearchResults = self->_serverSearchResults;
  if (!searchResults)
    searchResults = (NSMutableArray *)MEMORY[0x1E0C9AA60];
  if (!suggestedSearchResults)
    suggestedSearchResults = (NSMutableArray *)MEMORY[0x1E0C9AA60];
  v7[0] = searchResults;
  v7[1] = suggestedSearchResults;
  if (serverSearchResults)
    v5 = serverSearchResults;
  else
    v5 = (NSMutableArray *)MEMORY[0x1E0C9AA60];
  v7[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)allRecipients
{
  void *v2;
  void *v3;

  -[MFAutocompleteResultsTableViewController _combinedResults](self, "_combinedResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_flatten");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)containsRecipient:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MFAutocompleteResultsTableViewController _combinedResults](self, "_combinedResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__MFAutocompleteResultsTableViewController_containsRecipient___block_invoke;
  v9[3] = &unk_1E5A65A58;
  v6 = v4;
  v10 = v6;
  v7 = objc_msgSend(v5, "ef_any:", v9);

  return v7;
}

uint64_t __62__MFAutocompleteResultsTableViewController_containsRecipient___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)numberOfResults
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MFAutocompleteResultsTableViewController _combinedResults](self, "_combinedResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__MFAutocompleteResultsTableViewController_numberOfResults__block_invoke;
  v5[3] = &unk_1E5A65A80;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__MFAutocompleteResultsTableViewController_numberOfResults__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "count");

}

- (id)_indexPathForRecipient:(id)a3
{
  id v4;
  _MFAutocompleteResultsTableViewModel *tableViewModel;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  tableViewModel = self->_tableViewModel;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__MFAutocompleteResultsTableViewController__indexPathForRecipient___block_invoke;
  v9[3] = &unk_1E5A65AA8;
  v11 = &v17;
  v6 = v4;
  v10 = v6;
  v12 = &v13;
  -[_MFAutocompleteResultsTableViewModel enumerateSections:](tableViewModel, "enumerateSections:", v9);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v18[3], v14[3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __67__MFAutocompleteResultsTableViewController__indexPathForRecipient___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v7, "indexOfObject:", a1[4]);
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
    *a4 = 1;
  }

}

- (id)_recipientAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_MFAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_selectSearchResultsRecipientAtIndexPath:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  -[MFAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "autocompleteResultsController:didSelectRecipient:atIndex:", self, v4, objc_msgSend(v6, "row"));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "autocompleteResultsController:didSelectRecipient:", self, v4);
  }

}

- (void)invalidateSearchResultRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFAutocompleteResultsTableViewController _indexPathForRecipient:](self, "_indexPathForRecipient:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "row") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginUpdates");

    -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteRowsAtIndexPaths:withRowAnimation:", v8, 2);

    -[_MFAutocompleteResultsTableViewModel sectionAtIndex:](self->_tableViewModel, "sectionAtIndex:", objc_msgSend(v5, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", objc_msgSend(v5, "row"));

    -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endUpdates");

  }
}

- (void)setCellBackgroundColor:(id)a3
{
  UIColor *v5;
  void *v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_cellBackgroundColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_cellBackgroundColor, a3);
    -[MFAutocompleteResultsTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    v5 = v7;
  }

}

- (double)_tableViewHeaderHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bodyLeading");
  v4 = v3;

  return v4 * 0.444444444 + v4 * 2.44444444;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MaxX;
  double Width;
  double v37;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v6 = a3;
  if (a4 < 1
    || (-[_MFAutocompleteResultsTableViewModel sectionAtIndex:](self->_tableViewModel, "sectionAtIndex:", a4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
    v11 = 0;
    goto LABEL_13;
  }
  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FOUND_ON_SERVERS"), &stru_1E5A6A588, CFSTR("Main"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 1)
    {
      v12 = 0;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FOUND_IN_MAIL"), &stru_1E5A6A588, CFSTR("Main"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

LABEL_10:
  objc_msgSend(v6, "frame");
  v14 = v13;
  -[MFAutocompleteResultsTableViewController _tableViewHeaderHeight](self, "_tableViewHeaderHeight");
  v16 = v15;
  v17 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v18 = MEMORY[0x1E0C9D648];
  v19 = *MEMORY[0x1E0C9D648];
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = (void *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], v20, v14, v16);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v19, v20, *(double *)(v18 + 16), *(double *)(v18 + 24));
  objc_msgSend(v12, "localizedUppercaseString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v23);

  objc_msgSend(v22, "setFont:", v21);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTextColor:", v24);

  objc_msgSend(v22, "sizeToFit");
  objc_msgSend(v21, "_bodyLeading");
  v26 = v25;
  objc_msgSend(v22, "frame");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  objc_msgSend(v6, "layoutMargins");
  v34 = v33;
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v6, "semanticContentAttribute")) == 1)
  {
    objc_msgSend(v6, "bounds");
    MaxX = CGRectGetMaxX(v39);
    v40.origin.x = v34;
    v40.origin.y = v28;
    v40.size.width = v30;
    v40.size.height = v32;
    Width = CGRectGetWidth(v40);
    v41.origin.x = v34;
    v41.origin.y = v28;
    v41.size.width = v30;
    v41.size.height = v32;
    v34 = MaxX - Width - CGRectGetMinX(v41);
  }
  objc_msgSend(v11, "frame");
  objc_msgSend(v22, "setFrame:", v34, v37 - v32 - v26 * 0.444444444, v30, v32);
  objc_msgSend(v11, "addSubview:", v22);

LABEL_13:
  return v11;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;

  v6 = a3;
  if (a4
    && (-[_MFAutocompleteResultsTableViewModel sectionAtIndex:](self->_tableViewModel, "sectionAtIndex:", a4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    -[MFAutocompleteResultsTableViewController _tableViewHeaderHeight](self, "_tableViewHeaderHeight");
    v10 = v9;
  }
  else
  {
    v10 = 2.22507386e-308;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 2.22507386e-308;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[_MFAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "_setShouldHaveFullLengthTopSeparator:", 0);
  objc_msgSend(v5, "_setShouldHaveFullLengthBottomSeparator:", 0);

}

- (Class)recipientTableViewCellClass
{
  return (Class)objc_opt_class();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[_MFAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFRecipientTableViewCell identifier](MFRecipientTableViewCell, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc(-[MFAutocompleteResultsTableViewController recipientTableViewCellClass](self, "recipientTableViewCellClass"));
    +[MFRecipientTableViewCell identifier](MFRecipientTableViewCell, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "initWithStyle:reuseIdentifier:", 0, v13);

  }
  objc_msgSend(v11, "setBackgroundColor:", self->_cellBackgroundColor);
  objc_msgSend(v11, "setShouldHighlightCompleteMatches:", self->_shouldHighlightCompleteMatches);
  objc_msgSend(v11, "setShouldDimIrrelevantInformation:", self->_shouldDimIrrelevantInformation);
  if (objc_msgSend(v9, "showsAccessoryButton"))
    v14 = 4;
  else
    v14 = 0;
  objc_msgSend(v11, "setAccessoryType:", v14);
  objc_msgSend(v11, "recipient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != v9)
    objc_msgSend(v11, "setRecipient:", v9);

  return v11;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = a4;
  -[_MFAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "autocompleteResultsController:didRequestInfoAboutRecipient:", self, v6);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  -[MFAutocompleteResultsTableViewController _selectSearchResultsRecipientAtIndexPath:](self, "_selectSearchResultsRecipientAtIndexPath:", v6);

}

- (NSArray)contactRecipients
{
  return &self->_searchResults->super;
}

- (NSArray)suggestedRecipients
{
  return &self->_suggestedSearchResults->super;
}

- (NSArray)directoryServerRecipients
{
  return &self->_serverSearchResults->super;
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (MFAutocompleteResultsTableViewControllerDelegate)delegate
{
  return (MFAutocompleteResultsTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)areCellAnimationsEnabled
{
  return self->_cellAnimationsEnabled;
}

- (void)setCellAnimationsEnabled:(BOOL)a3
{
  self->_cellAnimationsEnabled = a3;
}

- (BOOL)isDeferringTableViewUpdates
{
  return self->_deferTableViewUpdates;
}

- (BOOL)shouldHighlightCompleteMatches
{
  return self->_shouldHighlightCompleteMatches;
}

- (void)setShouldHighlightCompleteMatches:(BOOL)a3
{
  self->_shouldHighlightCompleteMatches = a3;
}

- (BOOL)shouldDimIrrelevantInformation
{
  return self->_shouldDimIrrelevantInformation;
}

- (void)setShouldDimIrrelevantInformation:(BOOL)a3
{
  self->_shouldDimIrrelevantInformation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tableViewModel, 0);
  objc_storeStrong((id *)&self->_serverSearchResults, 0);
  objc_storeStrong((id *)&self->_suggestedSearchResults, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
}

@end
