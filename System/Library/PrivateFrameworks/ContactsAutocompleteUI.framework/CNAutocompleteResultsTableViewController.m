@implementation CNAutocompleteResultsTableViewController

+ (BOOL)avatarsAreHidden
{
  void *v2;
  NSString *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0CEB3D8]) == NSOrderedDescending;

  return v4;
}

+ (id)log
{
  if (log_cn_once_token_2 != -1)
    dispatch_once(&log_cn_once_token_2, &__block_literal_global_0);
  return (id)log_cn_once_object_2;
}

void __47__CNAutocompleteResultsTableViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "tableview controller");
  v1 = (void *)log_cn_once_object_2;
  log_cn_once_object_2 = (uint64_t)v0;

}

- (CNAutocompleteResultsTableViewController)initWithOptions:(id)a3
{
  id v4;
  CNAutocompleteResultsTableViewController *v5;
  CNAutocompleteResultsTableViewController *v6;
  uint64_t v7;
  CNAutocompleteSearchControllerOptions *options;

  v4 = a3;
  v5 = -[CNAutocompleteResultsTableViewController init](self, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_msgSend(v4, "copy");
    options = v6->_options;
    v6->_options = (CNAutocompleteSearchControllerOptions *)v7;

  }
  return v6;
}

- (CNAutocompleteResultsTableViewController)initWithStyle:(int64_t)a3
{
  CNAutocompleteResultsTableViewController *v4;
  CNAutocompleteResultsTableView *v5;
  CNAutocompleteResultsTableView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CNAutocompleteResultsTableViewController;
  v4 = -[CNAutocompleteResultsTableViewController initWithStyle:](&v17, sel_initWithStyle_);
  if (v4)
  {
    v5 = [CNAutocompleteResultsTableView alloc];
    v6 = -[CNAutocompleteResultsTableView initWithFrame:style:](v5, "initWithFrame:style:", a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CNAutocompleteResultsTableViewController setTableView:](v4, "setTableView:", v6);

    v7 = (void *)objc_opt_new();
    -[CNAutocompleteResultsTableViewController setExpandedIdentifiers:](v4, "setExpandedIdentifiers:", v7);

    -[CNAutocompleteResultsTableViewController view](v4, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreservesSuperviewLayoutMargins:", 1);

    -[CNAutocompleteResultsTableViewController setShouldHideInfoButton:](v4, "setShouldHideInfoButton:", 0);
    -[CNAutocompleteResultsTableViewController setSupportsInfoButton:](v4, "setSupportsInfoButton:", objc_msgSend(MEMORY[0x1E0D13AB8], "isDevicePasscodeProtected") ^ 1);
    -[CNAutocompleteResultsTableViewController setClearsSelectionOnViewWillAppear:](v4, "setClearsSelectionOnViewWillAppear:", 0);
    -[CNAutocompleteResultsTableViewController view](v4, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v4, sel_didHover_);
    objc_msgSend(v9, "addGestureRecognizer:", v10);

    v11 = (void *)MEMORY[0x1E0C97480];
    CNAutocompleteSharedLocalOnlyContactStore();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "settingsWithContactStore:cacheSize:threeDTouchEnabled:", v12, 50, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultsTableViewController setSharedAvatarViewControllerSettings:](v4, "setSharedAvatarViewControllerSettings:", v13);

    -[CNAutocompleteResultsTableViewController tableView](v4, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAutoresizingMask:", 2);

    -[CNAutocompleteResultsTableViewController tableView](v4, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSectionHeaderTopPadding:", 0.0);

  }
  return v4;
}

- (void)didHover:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "state");
  if ((unint64_t)(v4 - 1) > 1)
  {
    if (v4 == 3)
      -[CNAutocompleteResultsTableViewController selectRowAtIndexPath:](self, "selectRowAtIndexPath:", 0);
  }
  else
  {
    -[CNAutocompleteResultsTableViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPathForRowAtPoint:", v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cellForRowAtIndexPath:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {

      v11 = 0;
    }
    -[CNAutocompleteResultsTableViewController selectRowAtIndexPath:](self, "selectRowAtIndexPath:", v11);

  }
}

- (void)selectRowAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 0, 1);

  }
  -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectRowAtIndexPath:animated:scrollPosition:", v6, 0, 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteResultsTableViewController;
  v4 = a3;
  -[CNAutocompleteResultsTableViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[CNAutocompleteResultsTableViewController traitCollection](self, "traitCollection", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v7);
  if ((v4 & 1) == 0)
  {
    -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_purgeReuseQueues");

  }
}

- (void)_updateTableViewModelAnimated:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  _CNAutocompleteResultsTableViewModel **p_tableViewModel;
  _CNAutocompleteResultsTableViewModel *tableViewModel;
  _CNAutocompleteResultsTableViewModel *v12;
  _CNAutocompleteResultsTableViewModel *v13;
  _CNAutocompleteResultsTableViewModel *v14;
  _CNAutocompleteResultsTableViewModel *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
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

  v49 = *MEMORY[0x1E0C80C00];
  if (self->_deferTableViewUpdates)
  {
    self->_tableViewNeedsReload = 1;
  }
  else
  {
    v4 = a3;
    -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0
      && (-[CNAutocompleteResultsTableViewController tableView](self, "tableView"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isHidden"),
          v7,
          (v8 & 1) == 0))
    {
      -[CNAutocompleteResultsTableViewController visibleRecipients](self, "visibleRecipients");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    p_tableViewModel = &self->_tableViewModel;
    tableViewModel = self->_tableViewModel;
    if (!tableViewModel)
    {
      v12 = -[_CNAutocompleteResultsTableViewModel initWithNumberOfSections:]([_CNAutocompleteResultsTableViewModel alloc], "initWithNumberOfSections:", 3);
      v13 = *p_tableViewModel;
      *p_tableViewModel = v12;

      tableViewModel = *p_tableViewModel;
    }
    v14 = tableViewModel;
    v15 = -[_CNAutocompleteResultsTableViewModel initWithNumberOfSections:]([_CNAutocompleteResultsTableViewModel alloc], "initWithNumberOfSections:", -[_CNAutocompleteResultsTableViewModel numberOfSections](v14, "numberOfSections"));
    -[_CNAutocompleteResultsTableViewModel setObject:atIndexedSubscript:](v15, "setObject:atIndexedSubscript:", self->_searchResults, 0);
    -[_CNAutocompleteResultsTableViewModel setObject:atIndexedSubscript:](v15, "setObject:atIndexedSubscript:", self->_suggestedSearchResults, 1);
    -[_CNAutocompleteResultsTableViewModel setObject:atIndexedSubscript:](v15, "setObject:atIndexedSubscript:", self->_serverSearchResults, 2);
    self->_ignoreDidEndDisplayingCell = 1;
    if (v4)
    {
      -[_CNAutocompleteResultsTableViewModel computeDiffForModel:](v14, "computeDiffForModel:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_tableViewModel, v15);
      -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "beginUpdates");

      objc_msgSend(v16, "insertedRows");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19)
      {
        -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "insertedRows");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "insertSections:withRowAnimation:", v21, 100);

      }
      objc_msgSend(v16, "deletedRows");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23)
      {
        -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "deletedRows");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "deleteSections:withRowAnimation:", v25, 3);

      }
      objc_msgSend(v16, "changedRows");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27)
      {
        -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "changedRows");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "reloadSections:withRowAnimation:", v29, 0);

      }
      -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "endUpdates");

    }
    else
    {
      objc_storeStrong((id *)&self->_tableViewModel, v15);
      -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "reloadData");
    }

    self->_ignoreDidEndDisplayingCell = 0;
    if ((v6 & 1) != 0 && ((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    {
      -[CNAutocompleteResultsTableViewController visibleRecipients](self, "visibleRecipients");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_cn_indexBy:", &__block_literal_global_74);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __74__CNAutocompleteResultsTableViewController__updateTableViewModelAnimated___block_invoke_2;
      v46[3] = &unk_1E62BEE78;
      v33 = v32;
      v47 = v33;
      v41 = v9;
      objc_msgSend(v9, "_cn_filter:", v46);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v43 != v37)
              objc_enumerationMutation(v34);
            v39 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "autocompleteResultsController:didEndDisplayingRowForRecipient:", self, v39);

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v36);
      }

      v9 = v41;
    }

  }
}

uint64_t __74__CNAutocompleteResultsTableViewController__updateTableViewModelAnimated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringForEqualityTesting");
}

BOOL __74__CNAutocompleteResultsTableViewController__updateTableViewModelAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringForEqualityTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (id)visibleRecipients
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__CNAutocompleteResultsTableViewController_visibleRecipients__block_invoke;
  v8[3] = &unk_1E62BEF58;
  v8[4] = self;
  objc_msgSend(v4, "_cn_map:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_flatten");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __61__CNAutocompleteResultsTableViewController_visibleRecipients__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recipientAtIndexPath:", a2);
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
    -[CNAutocompleteResultsTableViewController _updateTableViewModelAnimated:](self, "_updateTableViewModelAnimated:", 0);
  }
}

- (void)setRecipients:(id)a3
{
  -[CNAutocompleteResultsTableViewController updateRecipients:disambiguatingRecipient:](self, "updateRecipients:disambiguatingRecipient:", a3, 0);
}

- (id)unificationIdentifierForRecipient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if ((objc_msgSend(v3, "isGroup") & 1) != 0)
  {
    objc_msgSend(v3, "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "autocompleteResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v3, "address");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v8;

  }
  return v4;
}

- (void)updateRecipients:(id)a3 disambiguatingRecipient:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  NSArray *recipients;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  char v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  _CNAutocompleteResultsTableViewModel *tableViewModel;
  void *v44;
  CNAutocompleteResultsTableViewController *v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  id obj;
  _QWORD v53[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    -[CNAutocompleteResultsTableViewController updateRecipients:disambiguatingRecipient:].cold.1();
  v8 = (NSArray *)objc_msgSend(v6, "copy");
  recipients = self->_recipients;
  self->_recipients = v8;

  -[CNAutocompleteResultsTableViewController setInDisambiguationMode:](self, "setInDisambiguationMode:", v7 != 0);
  -[CNAutocompleteResultsTableViewController setHasPerformedRecipientExpansion:](self, "setHasPerformedRecipientExpansion:", 0);
  -[CNAutocompleteResultsTableViewController expandedIdentifiers](self, "expandedIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[CNAutocompleteResultsTableViewController unificationIdentifierForRecipient:](self, "unificationIdentifierForRecipient:", v7);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[CNAutocompleteResultsTableViewController expandedIdentifiers](self, "expandedIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v11);

  }
  v45 = self;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v11);
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v6;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v63;
    v47 = v13;
    v48 = v7;
    v46 = *(_QWORD *)v63;
    do
    {
      v17 = 0;
      v51 = v15;
      do
      {
        if (*(_QWORD *)v63 != v16)
          objc_enumerationMutation(obj);
        v18 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * v17);
        v19 = objc_msgSend(v18, "isSuggestedRecipient");
        v20 = v13;
        if ((v19 & 1) == 0)
        {
          v21 = objc_msgSend(v18, "isDirectoryServerResult");
          v20 = v50;
          if (v21)
            v20 = v49;
        }
        v22 = v20;
        objc_msgSend(v22, "addObject:", v18);
        if (v18 == v7)
        {
          objc_msgSend(v7, "sortedChildren");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObjectsFromArray:", v23);

        }
        if (objc_msgSend(v18, "isGroup"))
        {
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          objc_msgSend(v18, "children");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v59;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v59 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                v54 = 0u;
                v55 = 0u;
                v56 = 0u;
                v57 = 0u;
                objc_msgSend(v29, "children");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "arrayByAddingObject:", v29);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
                if (v32)
                {
                  v33 = v32;
                  v34 = *(_QWORD *)v55;
                  do
                  {
                    for (j = 0; j != v33; ++j)
                    {
                      if (*(_QWORD *)v55 != v34)
                        objc_enumerationMutation(v31);
                      objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "setIsMemberOfGroup:", 1);
                    }
                    v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
                  }
                  while (v33);
                }

              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
            }
            while (v26);
          }

          v13 = v47;
          v7 = v48;
          v16 = v46;
          v15 = v51;
        }

        ++v17;
      }
      while (v17 != v15);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    }
    while (v15);
  }

  objc_storeStrong((id *)&v45->_searchResults, v50);
  objc_storeStrong((id *)&v45->_suggestedSearchResults, v13);
  objc_storeStrong((id *)&v45->_serverSearchResults, v49);
  -[CNAutocompleteResultsTableViewController tableView](v45, "tableView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "indexPathForSelectedRow");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteResultsTableViewController _updateTableViewModelAnimated:](v45, "_updateTableViewModelAnimated:", 0);
  -[CNAutocompleteResultsTableViewController tableView](v45, "tableView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layoutIfNeeded");

  if (v37
    && (-[_CNAutocompleteResultsTableViewModel objectAtIndexedSubscript:](v45->_tableViewModel, "objectAtIndexedSubscript:", objc_msgSend(v37, "section")), v39 = (void *)objc_claimAutoreleasedReturnValue(), v40 = objc_msgSend(v39, "count"), v41 = objc_msgSend(v37, "row"), v39, v40 > v41))
  {
    -[CNAutocompleteResultsTableViewController selectRowAtIndexPath:](v45, "selectRowAtIndexPath:", v37);
    v42 = v44;
  }
  else
  {
    v42 = v44;
    if (objc_msgSend(MEMORY[0x1E0CEA6C8], "isInHardwareKeyboardMode"))
    {
      tableViewModel = v45->_tableViewModel;
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __85__CNAutocompleteResultsTableViewController_updateRecipients_disambiguatingRecipient___block_invoke;
      v53[3] = &unk_1E62BEF80;
      v53[4] = v45;
      -[_CNAutocompleteResultsTableViewModel enumerateSections:](tableViewModel, "enumerateSections:", v53);
    }
  }

}

uint64_t __85__CNAutocompleteResultsTableViewController_updateRecipients_disambiguatingRecipient___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;
  void *v8;
  void *v9;

  result = objc_msgSend(a3, "count");
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollToRowAtIndexPath:atScrollPosition:animated:", v9, 0, 0);

    result = objc_msgSend(*(id *)(a1 + 32), "selectNextSearchResult");
    *a4 = 1;
  }
  return result;
}

- (id)_flattenedIndexPaths
{
  void *v3;
  _CNAutocompleteResultsTableViewModel *tableViewModel;
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
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tableViewModel = self->_tableViewModel;
  v13 = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CNAutocompleteResultsTableViewController__flattenedIndexPaths__block_invoke;
  v7[3] = &unk_1E62BEEC8;
  v7[4] = &v8;
  -[_CNAutocompleteResultsTableViewModel enumerateSections:](tableViewModel, "enumerateSections:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __64__CNAutocompleteResultsTableViewController__flattenedIndexPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  unint64_t v5;
  uint64_t v6;
  id v7;

  -[CNAutocompleteResultsTableViewController _flattenedIndexPaths](self, "_flattenedIndexPaths");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathForSelectedRow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(v7, "indexOfObject:", v4) + 1;
      if (v5 >= objc_msgSend(v7, "count"))
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(v7, "objectAtIndex:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    else
    {
      objc_msgSend(v7, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CNAutocompleteResultsTableViewController selectRowAtIndexPath:](self, "selectRowAtIndexPath:", v4);
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
  id v7;

  -[CNAutocompleteResultsTableViewController _flattenedIndexPaths](self, "_flattenedIndexPaths");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathForSelectedRow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(v7, "indexOfObject:", v4);
      if (!v5)
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(v7, "objectAtIndex:", v5 - 1);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    else
    {
      objc_msgSend(v7, "lastObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CNAutocompleteResultsTableViewController selectRowAtIndexPath:](self, "selectRowAtIndexPath:", v4);
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)confirmSelectedRecipient
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSelectedRow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (-[CNAutocompleteResultsTableViewController tableView](self, "tableView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isHidden"),
        v5,
        (v6 & 1) == 0))
  {
    -[CNAutocompleteResultsTableViewController _selectSearchResultsRecipientAtIndexPath:](self, "_selectSearchResultsRecipientAtIndexPath:", v4);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)expandSelectedRecipient
{
  return -[CNAutocompleteResultsTableViewController attemptDisambiguationToggleAtSelectedRowIsExpand:](self, "attemptDisambiguationToggleAtSelectedRowIsExpand:", 1);
}

- (BOOL)collapseSelectedRecipient
{
  return -[CNAutocompleteResultsTableViewController attemptDisambiguationToggleAtSelectedRowIsExpand:](self, "attemptDisambiguationToggleAtSelectedRowIsExpand:", 0);
}

- (BOOL)attemptDisambiguationToggleAtSelectedRowIsExpand:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (!objc_msgSend(v8, "canCollapseRecipient"))
      goto LABEL_3;
LABEL_5:
    -[CNAutocompleteResultsTableViewController didToggleDisambiguationAtIndexPath:](self, "didToggleDisambiguationAtIndexPath:", v6);
    v9 = 1;
    goto LABEL_6;
  }
  if ((objc_msgSend(v8, "canExpandRecipient") & 1) != 0)
    goto LABEL_5;
LABEL_3:
  v9 = 0;
LABEL_6:

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[_CNAutocompleteResultsTableViewModel numberOfSections](self->_tableViewModel, "numberOfSections", a3);
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

- (id)_indexPathForRecipient:(id)a3
{
  id v4;
  _CNAutocompleteResultsTableViewModel *tableViewModel;
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
  v9[2] = __67__CNAutocompleteResultsTableViewController__indexPathForRecipient___block_invoke;
  v9[3] = &unk_1E62BEFA8;
  v11 = &v17;
  v6 = v4;
  v10 = v6;
  v12 = &v13;
  -[_CNAutocompleteResultsTableViewModel enumerateSections:](tableViewModel, "enumerateSections:", v9);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v18[3], v14[3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __67__CNAutocompleteResultsTableViewController__indexPathForRecipient___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "indexOfObject:", a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (id)_recipientAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[_CNAutocompleteResultsTableViewModel numberOfSections](self->_tableViewModel, "numberOfSections");
  if (v5 <= objc_msgSend(v4, "section"))
  {
    v9 = 0;
  }
  else
  {
    -[_CNAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (v7 <= objc_msgSend(v4, "row"))
    {
      v9 = 0;
    }
    else
    {
      -[_CNAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)_unifiedRecipientForRecipientAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  id v16;

  v4 = a3;
  -[CNAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");
  if (v6 < 0)
  {
LABEL_7:
    v16 = 0;
  }
  else
  {
    v7 = v6;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, objc_msgSend(v4, "section"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNAutocompleteResultsTableViewController unificationIdentifierForRecipient:](self, "unificationIdentifierForRecipient:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAutocompleteResultsTableViewController unificationIdentifierForRecipient:](self, "unificationIdentifierForRecipient:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
      {
        v16 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v9, "children");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
        break;

      if (v7-- <= 0)
        goto LABEL_7;
    }
    v16 = v9;
LABEL_10:

  }
  return v16;
}

- (id)_parentRecipientForRecipientAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CNAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isMemberOfGroup") & 1) != 0)
  {
    v6 = objc_msgSend(v4, "row");
    if (v6 < 0)
    {
LABEL_7:
      v9 = 0;
    }
    else
    {
      v7 = v6;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, objc_msgSend(v4, "section"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v9, "isMemberOfGroup"))
          break;

        if (v7-- <= 0)
          goto LABEL_7;
      }
    }
  }
  else
  {
    -[CNAutocompleteResultsTableViewController _unifiedRecipientForRecipientAtIndexPath:](self, "_unifiedRecipientForRecipientAtIndexPath:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_selectSearchResultsRecipientAtIndexPath:(id)a3
{
  id v4;
  id WeakRetained;
  CNUnifiedComposeRecipient *v6;
  CNUnifiedComposeRecipient *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _BOOL4 v16;
  void *v17;
  void *v18;
  id v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double MinY;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  _BOOL4 IsNull;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  uint64_t v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  _QWORD v96[4];
  id v97;
  id v98;
  CNAutocompleteResultsTableViewController *v99;
  id v100;
  CNUnifiedComposeRecipient *v101;
  id v102;
  _QWORD v103[4];
  id v104;
  double v105;
  double v106;
  double v107;
  double v108;
  _QWORD v109[4];
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  uint64_t v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;

  v116 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:", v4);
    v6 = (CNUnifiedComposeRecipient *)(id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!-[CNComposeRecipient isGroup](v6, "isGroup"))
    {
      -[CNAutocompleteResultsTableViewController _unifiedRecipientForRecipientAtIndexPath:](self, "_unifiedRecipientForRecipientAtIndexPath:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "children");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v6;
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        v7 = -[CNUnifiedComposeRecipient initWithChildren:defaultChild:]([CNUnifiedComposeRecipient alloc], "initWithChildren:defaultChild:", v9, v6);

      }
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      -[CNUnifiedComposeRecipient children](v7, "children");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObject:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v111, v115, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v112;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v112 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * i), "setIsMemberOfGroup:", 0);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v111, v115, 16);
        }
        while (v13);
      }

    }
    v16 = -[CNAutocompleteResultsTableViewController recipientIsExpanded:](self, "recipientIsExpanded:", v6);
    -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cellForRowAtIndexPath:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CNAutocompleteResultsTableViewController recipientIsDisambiguationRecipient:](self, "recipientIsDisambiguationRecipient:", v6))
    {
      v19 = v18;
      if (v19)
        v20 = v16;
      else
        v20 = 0;
      if (v20)
      {
        -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setUserInteractionEnabled:", 0);

        -[CNAutocompleteResultsTableViewController _unifiedRecipientForRecipientAtIndexPath:](self, "_unifiedRecipientForRecipientAtIndexPath:", v4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "children");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v109[0] = MEMORY[0x1E0C809B0];
        v109[1] = 3221225472;
        v109[2] = __85__CNAutocompleteResultsTableViewController__selectSearchResultsRecipientAtIndexPath___block_invoke;
        v109[3] = &unk_1E62BEE78;
        v110 = v22;
        v95 = v22;
        objc_msgSend(v23, "_cn_firstObjectPassingTest:", v109);
        v24 = objc_claimAutoreleasedReturnValue();

        -[CNAutocompleteResultsTableViewController _indexPathForRecipient:](self, "_indexPathForRecipient:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v93 = (void *)v25;
        v94 = (void *)v24;
        if (v24)
        {
          v26 = v25;
          -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "cellForRowAtIndexPath:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v92 = v28;
          if (v28)
          {
            objc_msgSend(v28, "setCheckmarkVisible:", 0);
            -[CNAutocompleteResultsTableViewController view](self, "view");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "checkmarkView");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "bounds");
            v32 = v31;
            v34 = v33;
            v36 = v35;
            v38 = v37;
            objc_msgSend(v28, "checkmarkView");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "convertRect:fromView:", v39, v32, v34, v36, v38);
            v41 = v40;
            MinY = v42;
            v45 = v44;
            v47 = v46;

          }
          else
          {
            v48 = v26;
            -[CNAutocompleteResultsTableViewController view](self, "view");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "checkmarkView");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "bounds");
            v51 = v50;
            v53 = v52;
            v55 = v54;
            v57 = v56;
            objc_msgSend(v19, "checkmarkView");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "convertRect:fromView:", v58, v51, v53, v55, v57);
            v41 = v59;
            v45 = v60;
            v47 = v61;

            -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "rectForRowAtIndexPath:", v48);
            MinY = CGRectGetMinY(v117);
          }

        }
        else
        {
          v41 = *MEMORY[0x1E0C9D628];
          MinY = *(double *)(MEMORY[0x1E0C9D628] + 8);
          v45 = *(double *)(MEMORY[0x1E0C9D628] + 16);
          v47 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        }
        -[CNAutocompleteResultsTableViewController view](self, "view");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "checkmarkView");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "bounds");
        v65 = v64;
        v67 = v66;
        v69 = v68;
        v71 = v70;
        objc_msgSend(v19, "checkmarkView");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "convertRect:fromView:", v72, v65, v67, v69, v71);
        v74 = v73;
        v76 = v75;
        v78 = v77;
        v80 = v79;

        +[CNAutocompleteDisambiguatingTableViewCell createCheckmarkView](CNAutocompleteDisambiguatingTableViewCell, "createCheckmarkView");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setFrame:", v41, MinY, v45, v47);
        -[CNAutocompleteResultsTableViewController view](self, "view");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "addSubview:", v81);

        v118.origin.x = v41;
        v118.origin.y = MinY;
        v118.size.width = v45;
        v118.size.height = v47;
        IsNull = CGRectIsNull(v118);
        if (IsNull)
          v84 = v80;
        else
          v84 = v47;
        if (IsNull)
          v85 = v78;
        else
          v85 = v45;
        if (IsNull)
          v86 = v76;
        else
          v86 = MinY;
        if (IsNull)
          v87 = v74;
        else
          v87 = v41;
        objc_msgSend(v81, "setFrame:", v87, v86, v85, v84);
        v119.origin.x = v41;
        v119.origin.y = MinY;
        v119.size.width = v45;
        v119.size.height = v47;
        objc_msgSend(v81, "setAlpha:", (double)!CGRectIsNull(v119));
        v88 = (void *)MEMORY[0x1E0CEABB0];
        v89 = MEMORY[0x1E0C809B0];
        v103[0] = MEMORY[0x1E0C809B0];
        v103[1] = 3221225472;
        v103[2] = __85__CNAutocompleteResultsTableViewController__selectSearchResultsRecipientAtIndexPath___block_invoke_2;
        v103[3] = &unk_1E62BEFD0;
        v104 = v81;
        v105 = v74;
        v106 = v76;
        v107 = v78;
        v108 = v80;
        v96[0] = v89;
        v96[1] = 3221225472;
        v96[2] = __85__CNAutocompleteResultsTableViewController__selectSearchResultsRecipientAtIndexPath___block_invoke_3;
        v96[3] = &unk_1E62BEFF8;
        v97 = v104;
        v19 = v19;
        v98 = v19;
        v99 = self;
        v100 = WeakRetained;
        v101 = v7;
        v102 = v4;
        v90 = v104;
        objc_msgSend(v88, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v103, v96);

        goto LABEL_39;
      }
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(WeakRetained, "autocompleteResultsController:didSelectRecipient:atIndex:", self, v7, objc_msgSend(v4, "row"));
LABEL_39:
    -[CNAutocompleteResultsTableViewController endDisplayOfVisibleCellsExcludingIndexPath:](self, "endDisplayOfVisibleCellsExcludingIndexPath:", v4);

  }
}

uint64_t __85__CNAutocompleteResultsTableViewController__selectSearchResultsRecipientAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __85__CNAutocompleteResultsTableViewController__selectSearchResultsRecipientAtIndexPath___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __85__CNAutocompleteResultsTableViewController__selectSearchResultsRecipientAtIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "setCheckmarkVisible:", 1);
  objc_msgSend(*(id *)(a1 + 48), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 48), "setInDisambiguationMode:", 0);
  return objc_msgSend(*(id *)(a1 + 56), "autocompleteResultsController:didSelectRecipient:atIndex:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 72), "row"));
}

- (void)endDisplayOfVisibleCellsExcludingIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CNAutocompleteResultsTableViewController tableView](self, "tableView", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathsForVisibleRows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isEqual:", v4) & 1) == 0)
            -[CNAutocompleteResultsTableViewController callEndDisplayingRowForRecipientIndex:](self, "callEndDisplayingRowForRecipientIndex:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)invalidateSearchResultRecipient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CNAutocompleteResultsTableViewController _indexPathForRecipient:](self, "_indexPathForRecipient:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "row") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginUpdates");

    -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteRowsAtIndexPaths:withRowAnimation:", v7, 2);

    -[_CNAutocompleteResultsTableViewModel sectionAtIndex:](self->_tableViewModel, "sectionAtIndex:", objc_msgSend(v4, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v4, "row"));

    -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endUpdates");

  }
}

- (void)didTapDisambiguationChevronForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[CNAutocompleteResultsTableViewController didToggleDisambiguationAtIndexPath:](self, "didToggleDisambiguationAtIndexPath:", v7);
    v6 = v7;
  }

}

- (void)didToggleDisambiguationAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  id v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  BOOL v58;

  v4 = a3;
  -[CNAutocompleteResultsTableViewController setHasPerformedRecipientExpansion:](self, "setHasPerformedRecipientExpansion:", 1);
  v48 = v4;
  -[CNAutocompleteResultsTableViewController _parentRecipientForRecipientAtIndexPath:](self, "_parentRecipientForRecipientAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultsTableViewController _indexPathForRecipient:](self, "_indexPathForRecipient:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultsTableViewController unificationIdentifierForRecipient:](self, "unificationIdentifierForRecipient:", v5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNAutocompleteResultsTableViewController recipientIsExpanded:](self, "recipientIsExpanded:", v5);
  -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "autocompleteResultsController:willCollapseSelectedRecipient:", self, v5);
      v11 = 2;
LABEL_6:

      goto LABEL_9;
    }
    v11 = 2;
  }
  else
  {
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "autocompleteResultsController:willExpandSelectedRecipient:", self, v5);
      v11 = 3;
      goto LABEL_6;
    }
    v11 = 3;
  }
LABEL_9:
  v49 = v7;
  v45 = !v7;
  -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cellForRowAtIndexPath:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v14;
  objc_msgSend(v14, "setActionType:animated:", v11, 1);
  v15 = objc_msgSend(v6, "row") + 1;
  objc_msgSend(v5, "children");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  v20 = (void *)objc_opt_new();
  if (v17)
  {
    v21 = v49 & v19;
    v22 = v15;
    v23 = v17;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v22, objc_msgSend(v6, "section"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v24);
      if (v21)
        -[CNAutocompleteResultsTableViewController callEndDisplayingRowForRecipientIndex:](self, "callEndDisplayingRowForRecipientIndex:", v24);

      ++v22;
      --v23;
    }
    while (v23);
  }
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v15, v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
    self->_ignoreDidEndDisplayingCell = 1;
  -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __79__CNAutocompleteResultsTableViewController_didToggleDisambiguationAtIndexPath___block_invoke;
  v52[3] = &unk_1E62BF020;
  v58 = v45;
  v52[4] = self;
  v47 = v46;
  v53 = v47;
  v29 = v26;
  v54 = v29;
  v30 = v5;
  v55 = v30;
  v31 = v25;
  v56 = v31;
  v32 = v20;
  v57 = v32;
  v51[0] = v28;
  v51[1] = 3221225472;
  v51[2] = __79__CNAutocompleteResultsTableViewController_didToggleDisambiguationAtIndexPath___block_invoke_2;
  v51[3] = &unk_1E62BF048;
  v51[4] = self;
  objc_msgSend(v27, "performBatchUpdates:completion:", v52, v51);

  -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v34 = objc_opt_respondsToSelector();

    if ((v34 & 1) != 0)
    {
      -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "autocompleteResultsController:didCollapseSelectedRecipient:", self, v30);

    }
    if ((v49 & objc_msgSend(MEMORY[0x1E0CEA6C8], "isInHardwareKeyboardMode")) == 1)
      -[CNAutocompleteResultsTableViewController selectRowAtIndexPath:](self, "selectRowAtIndexPath:", v6);
  }
  else
  {
    v36 = objc_opt_respondsToSelector();

    if ((v36 & 1) != 0)
    {
      -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "autocompleteResultsController:didExpandSelectedRecipient:", self, v30);

    }
    objc_msgSend(MEMORY[0x1E0CEA6C8], "isInHardwareKeyboardMode");
  }
  v38 = v50;
  if (v50)
    -[CNAutocompleteResultsTableViewController updateBackgroundAndSeparatorsForCell:atIndexPath:](self, "updateBackgroundAndSeparatorsForCell:atIndexPath:", v50, v6);
  if (objc_msgSend(v6, "row") >= 1)
  {
    v39 = (void *)MEMORY[0x1E0CB36B0];
    v40 = objc_msgSend(v6, "row");
    if (v40 <= 1)
      v41 = 1;
    else
      v41 = v40;
    objc_msgSend(v39, "indexPathForRow:inSection:", v41 - 1, objc_msgSend(v6, "section"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "cellForRowAtIndexPath:", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
      -[CNAutocompleteResultsTableViewController updateBackgroundAndSeparatorsForCell:atIndexPath:](self, "updateBackgroundAndSeparatorsForCell:atIndexPath:", v44, v42);

    v38 = v50;
  }

}

void __79__CNAutocompleteResultsTableViewController_didToggleDisambiguationAtIndexPath___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(unsigned __int8 *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "expandedIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "addObject:", v5);

    v6 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "sortedChildren");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObjects:atIndexes:", v7, *(_QWORD *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 72), 3);
  }
  else
  {
    objc_msgSend(v3, "removeObject:", v5);

    objc_msgSend(*(id *)(a1 + 48), "removeObjectsAtIndexes:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 72), 3);
  }

}

uint64_t __79__CNAutocompleteResultsTableViewController_didToggleDisambiguationAtIndexPath___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1049) = 0;
  return result;
}

- (BOOL)willProvideOverrideImageDataForCell:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recipient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "autocompleteResultsController:willOverrideImageDataForRecipient:completion:", self, v11, v7);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)_tableViewHeaderHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
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
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MaxX;
  double v40;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v6 = a3;
  if (a4 < 1
    || (-[_CNAutocompleteResultsTableViewModel sectionAtIndex:](self->_tableViewModel, "sectionAtIndex:", a4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
    v12 = 0;
    goto LABEL_13;
  }
  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("FOUND_ON_SERVERS");
  }
  else
  {
    if (a4 != 1)
    {
      v13 = 0;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("FOUND_IN_MAIL");
  }
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E62C0368, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  v14 = MEMORY[0x1E0C9D648];
  v15 = *MEMORY[0x1E0C9D648];
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(v6, "frame");
  v18 = v17;
  -[CNAutocompleteResultsTableViewController _tableViewHeaderHeight](self, "_tableViewHeaderHeight");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v15, v16, v18, v19);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v20);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v15, v16, *(double *)(v14 + 16), *(double *)(v14 + 24));
  objc_msgSend(v13, "localizedUppercaseString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v23);

  objc_msgSend(v22, "setFont:", v21);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTextColor:", v24);

  objc_msgSend(v22, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v21, "_bodyLeading");
  v26 = v25 * -0.444444444;
  objc_msgSend(v12, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v28 = v27;
  objc_msgSend(v12, "frame");
  v30 = v29 - v28 + v26;
  objc_msgSend(v6, "layoutMargins");
  v32 = v31;
  objc_msgSend(v12, "frame");
  v34 = v33;
  objc_msgSend(v6, "layoutMargins");
  v36 = v34 - v35;
  objc_msgSend(v6, "layoutMargins");
  v38 = v36 - v37;
  if (objc_msgSend(MEMORY[0x1E0CEABB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v6, "semanticContentAttribute")) == 1)
  {
    objc_msgSend(v6, "bounds");
    MaxX = CGRectGetMaxX(v42);
    v43.origin.x = v32;
    v43.origin.y = v30;
    v43.size.width = v38;
    v43.size.height = v28;
    v40 = MaxX - CGRectGetWidth(v43);
    v44.origin.x = v32;
    v44.origin.y = v30;
    v44.size.width = v38;
    v44.size.height = v28;
    v32 = v40 - CGRectGetMinX(v44);
  }
  objc_msgSend(v22, "setFrame:", v32, v30, v38, v28);
  objc_msgSend(v12, "addSubview:", v22);

LABEL_13:
  return v12;
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
    && (-[_CNAutocompleteResultsTableViewModel sectionAtIndex:](self->_tableViewModel, "sectionAtIndex:", a4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    -[CNAutocompleteResultsTableViewController _tableViewHeaderHeight](self, "_tableViewHeaderHeight");
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

  -[_CNAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)CNAutocompleteResultsTableViewController;
  -[CNAutocompleteResultsTableViewController viewLayoutMarginsDidChange](&v16, sel_viewLayoutMarginsDidChange);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNAutocompleteResultsTableViewController tableView](self, "tableView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cellForRowAtIndexPath:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          -[CNAutocompleteResultsTableViewController updateBackgroundAndSeparatorsForCell:atIndexPath:](self, "updateBackgroundAndSeparatorsForCell:atIndexPath:", v11, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a5;
  -[CNAutocompleteResultsTableViewController updateBackgroundAndSeparatorsForCell:atIndexPath:](self, "updateBackgroundAndSeparatorsForCell:atIndexPath:", a4);
  -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "autocompleteResultsController:willDisplayRowForRecipient:", self, v9);

  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  char v8;
  id v9;

  v6 = a5;
  if (!self->_ignoreDidEndDisplayingCell)
  {
    v9 = v6;
    -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    v6 = v9;
    if ((v8 & 1) != 0)
    {
      -[CNAutocompleteResultsTableViewController callEndDisplayingRowForRecipientIndex:](self, "callEndDisplayingRowForRecipientIndex:", v9);
      v6 = v9;
    }
  }

}

- (void)callEndDisplayingRowForRecipientIndex:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;

  -[CNAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autocompleteResultsController:didEndDisplayingRowForRecipient:", self, v4);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CNAutocompleteResultsTableViewController callEndDisplayingRowForRecipientIndex:].cold.1(v6);

  }
}

+ (BOOL)shouldUseTransparentCell
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = CFSTR("com.apple.siri");
  v6[1] = CFSTR("com.apple.Spotlight");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v4, "containsObject:", v3);

  return (char)v2;
}

- (void)updateBackgroundAndSeparatorsForCell:(id)a3 atIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _BOOL4 v45;
  uint64_t v46;
  void *v47;
  id v48;

  v48 = a3;
  v9 = a4;
  objc_msgSend(v48, "recipient");
  v10 = objc_claimAutoreleasedReturnValue();
  v45 = -[CNAutocompleteResultsTableViewController recipientIsExpandedParent:](self, "recipientIsExpandedParent:", v10);
  v47 = (void *)v10;
  v11 = -[CNAutocompleteResultsTableViewController recipientIsExpandedChild:](self, "recipientIsExpandedChild:", v10);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
  v44 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
  v46 = objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultsTableViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v42 = objc_claimAutoreleasedReturnValue();
    if (!v42)
    {
      v14 = 0;
      v43 = 0;
LABEL_7:
      v15 = objc_msgSend((id)objc_opt_class(), "shouldUseTransparentCell");
      if (!v14)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  -[CNAutocompleteResultsTableViewController view](self, "view", v42);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    v14 = 1;
    goto LABEL_7;
  }
  v15 = 0;
LABEL_8:

LABEL_9:
  if (!v13)
  {

    v16 = (void *)v44;
    if ((v15 & 1) != 0)
      goto LABEL_11;
LABEL_13:
    v19 = (void *)v46;
    v20 = v45;
    if (v11)
    {
      objc_msgSend(v48, "setBackgroundColor:", v16);
    }
    else
    {
      -[CNAutocompleteResultsTableViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setBackgroundColor:", v22);

    }
    goto LABEL_16;
  }

  v16 = (void *)v44;
  if (!v15)
    goto LABEL_13;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor", v43);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "backgroundView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v17);

  v19 = (void *)v46;
  v20 = v45;
LABEL_16:
  if (v20)
    v23 = v19;
  else
    v23 = 0;
  objc_msgSend(v48, "contentView", v43);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v23);

  v25 = (void *)MEMORY[0x1E0CB36B0];
  v26 = objc_msgSend(v9, "row") + 1;
  v27 = objc_msgSend(v9, "section");

  objc_msgSend(v25, "indexPathForRow:inSection:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v30 = !-[CNAutocompleteResultsTableViewController recipientIsExpandedChild:](self, "recipientIsExpandedChild:", v29);
  else
    v30 = 0;
  v31 = -[CNAutocompleteResultsTableViewController recipientIsExpandedParent:](self, "recipientIsExpandedParent:", v29) | v30;
  if (v31 == 1)
  {
    v32 = *MEMORY[0x1E0CEB4B0];
    v33 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v34 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v35 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    v36 = v48;
  }
  else
  {
    v35 = *MEMORY[0x1E0CEBC10];
    -[CNAutocompleteResultsTableViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutMargins");
    v38 = v37;
    objc_msgSend((id)objc_opt_class(), "additionalSeparatorInset");
    v36 = v48;
    v33 = v38 + v39;
    v34 = v35;
    v32 = v35;
  }
  objc_msgSend(v36, "setSeparatorInset:", v32, v33, v34, v35);
  if ((v31 & 1) == 0)

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setSeparatorColor:", v40);
  }
  else
  {
    -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "separatorColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setSeparatorColor:", v41);

  }
}

- (BOOL)recipientIsExpandedParent:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[CNAutocompleteResultsTableViewController recipientIsExpanded:](self, "recipientIsExpanded:", v4))
  {
    objc_msgSend(v4, "children");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)recipientIsExpandedChild:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfGroup") & 1) != 0)
  {
    v5 = 1;
  }
  else if (-[CNAutocompleteResultsTableViewController recipientIsExpanded:](self, "recipientIsExpanded:", v4))
  {
    objc_msgSend(v4, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)recipientIsExpanded:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNAutocompleteResultsTableViewController expandedIdentifiers](self, "expandedIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultsTableViewController unificationIdentifierForRecipient:](self, "unificationIdentifierForRecipient:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (BOOL)recipientIsDisambiguationRecipient:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  if (-[CNAutocompleteResultsTableViewController recipientIsExpanded:](self, "recipientIsExpanded:", v4))
  {
    objc_msgSend(v4, "children");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      LOBYTE(v6) = 0;
    else
      v6 = objc_msgSend(v4, "isMemberOfGroup") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  CNAutocompleteDisambiguatingTableViewCell *v11;
  CNAutocompleteDisambiguatingTableViewCell *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CNAutocompleteGroupExpansionTableViewCell *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  CNComposeRecipientTableViewCell *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  -[CNAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNAutocompleteResultsTableViewController recipientIsExpanded:](self, "recipientIsExpanded:", v8);
  if (-[CNAutocompleteResultsTableViewController recipientIsDisambiguationRecipient:](self, "recipientIsDisambiguationRecipient:", v8))
  {
    +[CNAutocompleteDisambiguatingTableViewCell identifier](CNAutocompleteDisambiguatingTableViewCell, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v10);
    v11 = (CNAutocompleteDisambiguatingTableViewCell *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = [CNAutocompleteDisambiguatingTableViewCell alloc];
      +[CNAutocompleteDisambiguatingTableViewCell identifier](CNAutocompleteDisambiguatingTableViewCell, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CNAutocompleteDisambiguatingTableViewCell initWithStyle:reuseIdentifier:](v12, "initWithStyle:reuseIdentifier:", 0, v13);

    }
    objc_msgSend(v8, "address");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultsTableViewController _unifiedRecipientForRecipientAtIndexPath:](self, "_unifiedRecipientForRecipientAtIndexPath:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "address");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteDisambiguatingTableViewCell setCheckmarkVisible:](v11, "setCheckmarkVisible:", objc_msgSend(v14, "isEqualToString:", v16));

LABEL_22:
    goto LABEL_31;
  }
  if (objc_msgSend(v8, "isMemberOfGroup"))
  {
    +[CNAutocompleteGroupExpansionTableViewCell identifier](CNAutocompleteGroupExpansionTableViewCell, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v17);
    v11 = (CNAutocompleteDisambiguatingTableViewCell *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v18 = [CNAutocompleteGroupExpansionTableViewCell alloc];
      +[CNAutocompleteGroupExpansionTableViewCell identifier](CNAutocompleteGroupExpansionTableViewCell, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CNAutocompleteGroupExpansionTableViewCell initWithStyle:reuseIdentifier:](v18, "initWithStyle:reuseIdentifier:", 0, v19);

    }
    if (-[CNAutocompleteResultsTableViewController supportsInfoButton](self, "supportsInfoButton"))
      v20 = -[CNAutocompleteResultsTableViewController shouldHideInfoButton](self, "shouldHideInfoButton") ^ 1;
    else
      v20 = 0;
    -[CNAutocompleteDisambiguatingTableViewCell setActionType:animated:](v11, "setActionType:animated:", v20, 0);
    -[CNAutocompleteDisambiguatingTableViewCell setDelegate:](v11, "setDelegate:", self);
    -[CNAutocompleteResultsTableViewController sharedAvatarViewControllerSettings](self, "sharedAvatarViewControllerSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteDisambiguatingTableViewCell setupAvatarViewControllerWithSettings:](v11, "setupAvatarViewControllerWithSettings:", v14);
    goto LABEL_22;
  }
  +[CNComposeRecipientTableViewCell identifier](CNComposeRecipientTableViewCell, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v21);
  v11 = (CNAutocompleteDisambiguatingTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v22 = [CNComposeRecipientTableViewCell alloc];
    +[CNComposeRecipientTableViewCell identifier](CNComposeRecipientTableViewCell, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CNComposeRecipientTableViewCell initWithStyle:reuseIdentifier:](v22, "initWithStyle:reuseIdentifier:", 0, v23);

  }
  -[CNAutocompleteDisambiguatingTableViewCell setDelegate:](v11, "setDelegate:", self);
  -[CNAutocompleteResultsTableViewController sharedAvatarViewControllerSettings](self, "sharedAvatarViewControllerSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteDisambiguatingTableViewCell setupAvatarViewControllerWithSettings:](v11, "setupAvatarViewControllerWithSettings:", v24);

  if (-[CNAutocompleteResultsTableViewController inDisambiguationMode](self, "inDisambiguationMode")
    && !objc_msgSend(v8, "isGroup")
    || (objc_msgSend(v8, "isMemberOfGroup") & 1) != 0)
  {
LABEL_25:
    v25 = 1;
    goto LABEL_26;
  }
  if (-[CNAutocompleteResultsTableViewController inDisambiguationMode](self, "inDisambiguationMode")
    || !objc_msgSend(v8, "showsChevronButton"))
  {
    if ((objc_msgSend(v8, "isSuggestedRecipient") & 1) == 0
      && (objc_msgSend(v8, "isRemovableFromSearchResults") & 1) == 0)
    {
      if (objc_msgSend(v8, "kind") == 6 || objc_msgSend(v8, "kind") == 7)
        v25 = 4;
      else
        v25 = 0;
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v9)
    v25 = 3;
  else
    v25 = 2;
LABEL_26:
  if ((!-[CNAutocompleteResultsTableViewController supportsInfoButton](self, "supportsInfoButton")
     || -[CNAutocompleteResultsTableViewController shouldHideInfoButton](self, "shouldHideInfoButton"))
    && v25 == 1)
  {
    v25 = 0;
  }
  -[CNAutocompleteDisambiguatingTableViewCell setActionType:animated:](v11, "setActionType:animated:", v25, 0);
LABEL_31:
  -[CNAutocompleteDisambiguatingTableViewCell setRecipient:](v11, "setRecipient:", v8);
  -[CNComposeTableViewCell setLabelColor:](v11, "setLabelColor:", 0);
  objc_msgSend(v8, "address");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[CNAutocompleteResultsTableViewController unificationIdentifierForRecipient:](self, "unificationIdentifierForRecipient:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
      LOBYTE(v9) = 0;

    if (v9)
      goto LABEL_36;
  }
  if (!-[CNAutocompleteResultsTableViewController updatePreferredRecipientForCell:isInvalidation:](self, "updatePreferredRecipientForCell:isInvalidation:", v11, 0))LABEL_36:-[CNAutocompleteResultsTableViewController updateLabelColorForCell:](self, "updateLabelColorForCell:", v11);
  -[CNAutocompleteResultsTableViewController trailingButtonMidlineInsetFromLayoutMargin](self, "trailingButtonMidlineInsetFromLayoutMargin");
  -[CNComposeTableViewCell setTrailingButtonMidlineInsetFromLayoutMargin:](v11, "setTrailingButtonMidlineInsetFromLayoutMargin:");

  return v11;
}

- (void)setTintColor:(id)a3 forRecipient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNAutocompleteResultsTableViewController _indexPathForRecipient:](self, "_indexPathForRecipient:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "setLabelColor:", v9);

}

- (void)setPreferredRecipient:(id)a3 forRecipient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;

  v12 = a3;
  -[CNAutocompleteResultsTableViewController _indexPathForRecipient:](self, "_indexPathForRecipient:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "recipient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isGroup") & 1) == 0)
    {
      objc_msgSend(v9, "children");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v12)
      {
        if (v11 >= 2)
          -[CNAutocompleteResultsTableViewController updateCell:withPreferredRecipient:isInvalidation:](self, "updateCell:withPreferredRecipient:isInvalidation:", v8, v12, 1);
      }
    }

  }
}

- (void)invalidateAddressTintColors
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
  -[CNAutocompleteResultsTableViewController tableView](self, "tableView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
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
        -[CNAutocompleteResultsTableViewController updateLabelColorForCell:](self, "updateLabelColorForCell:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)invalidatePreferredRecipients
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
  -[CNAutocompleteResultsTableViewController tableView](self, "tableView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
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
        -[CNAutocompleteResultsTableViewController updatePreferredRecipientForCell:isInvalidation:](self, "updatePreferredRecipientForCell:isInvalidation:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (void)dispatchMainIfNecessary:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void (**block)(void);

  v3 = (void *)MEMORY[0x1E0CB3978];
  block = (void (**)(void))a3;
  objc_msgSend(v3, "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainThread");

  if (v5)
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)updateLabelColorForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "recipient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "kind") == 6 || objc_msgSend(v5, "kind") == 7)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLabelColor:", v6);

  }
  else
  {
    -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __68__CNAutocompleteResultsTableViewController_updateLabelColorForCell___block_invoke;
      v10[3] = &unk_1E62BF0A8;
      v10[4] = self;
      v11 = v5;
      v12 = v4;
      objc_msgSend(v9, "autocompleteResultsController:tintColorForRecipient:completion:", self, v11, v10);

    }
  }

}

void __68__CNAutocompleteResultsTableViewController_updateLabelColorForCell___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__CNAutocompleteResultsTableViewController_updateLabelColorForCell___block_invoke_2;
  v6[3] = &unk_1E62BF080;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "dispatchMainIfNecessary:", v6);

}

void __68__CNAutocompleteResultsTableViewController_updateLabelColorForCell___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1 + 40), "setLabelColor:", *(_QWORD *)(a1 + 48));
}

- (BOOL)updatePreferredRecipientForCell:(id)a3 isInvalidation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  BOOL v18;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "recipient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isGroup") & 1) == 0)
  {
    objc_msgSend(v7, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 >= 2)
    {
      -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if ((v11 & 1) != 0)
      {
        objc_msgSend(v12, "autocompleteResultsController:preferredRecipientForRecipient:", self, v7);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v7 == v14)
        {
          v15 = 0;
        }
        else
        {
          v14 = v14;
          v15 = v14;
        }
        goto LABEL_11;
      }
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "children");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "autocompleteResultsController:preferredRecipientForRecipients:", self, v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        v18 = -[CNAutocompleteResultsTableViewController updateCell:withPreferredRecipient:isInvalidation:](self, "updateCell:withPreferredRecipient:isInvalidation:", v6, v15, v4);

        goto LABEL_9;
      }
    }
  }
  v18 = 0;
LABEL_9:

  return v18;
}

- (BOOL)updateCell:(id)a3 withPreferredRecipient:(id)a4 isInvalidation:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  CNUnifiedComposeRecipient *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  CNUnifiedComposeRecipient *v32;
  void *v33;
  char v34;
  void *v35;
  id v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v5 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "recipient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = objc_msgSend(v12, "containsObject:", v9);
  if (v13)
  {
    objc_msgSend(v12, "removeObject:", v9);
    objc_msgSend(v12, "_cn_insertNonNilObject:atIndex:", v9, 0);
    v14 = -[CNUnifiedComposeRecipient initWithChildren:defaultChild:]([CNUnifiedComposeRecipient alloc], "initWithChildren:defaultChild:", v12, v9);
    -[CNAutocompleteResultsTableViewController _indexPathForRecipient:](self, "_indexPathForRecipient:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNAutocompleteResultsTableViewModel sectionAtIndex:](self->_tableViewModel, "sectionAtIndex:", objc_msgSend(v15, "section"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "replaceObjectAtIndex:withObject:", objc_msgSend(v15, "row"), v14);

    objc_msgSend(v8, "setRecipient:", v14);
    -[CNAutocompleteResultsTableViewController updateLabelColorForCell:](self, "updateLabelColorForCell:", v8);
    if (-[CNAutocompleteResultsTableViewController hasPerformedRecipientExpansion](self, "hasPerformedRecipientExpansion")&& v5)
    {
      v31 = v15;
      v32 = v14;
      v33 = v12;
      v34 = v13;
      v35 = v10;
      v36 = v8;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "indexPathsForVisibleRows");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v18;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (!v19)
        goto LABEL_19;
      v20 = v19;
      v21 = *(_QWORD *)v40;
      while (1)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          -[CNAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[CNAutocompleteResultsTableViewController shouldShowCheckmarkForRecipient:preferredRecipient:](self, "shouldShowCheckmarkForRecipient:preferredRecipient:", v24, v9))
          {
            -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "cellForRowAtIndexPath:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "address");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27 || (objc_msgSend(v9, "address"), (v37 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              objc_msgSend(v24, "address");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "address");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setCheckmarkVisible:", objc_msgSend(v28, "isEqual:", v29));

              if (!v27)
LABEL_15:

              goto LABEL_17;
            }
            objc_msgSend(v26, "setCheckmarkVisible:", 1);
            v37 = 0;
            goto LABEL_15;
          }
LABEL_17:

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (!v20)
        {
LABEL_19:

          v10 = v35;
          v8 = v36;
          LOBYTE(v13) = v34;
          v14 = v32;
          v12 = v33;
          v15 = v31;
          break;
        }
      }
    }

  }
  return v13;
}

- (BOOL)shouldShowCheckmarkForRecipient:(id)a3 preferredRecipient:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a3;
  v8 = a4;
  -[CNAutocompleteResultsTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isUserInteractionEnabled");

  if (v10)
  {
    if ((objc_msgSend(v7, "isMemberOfGroup") & 1) == 0)
    {
      objc_msgSend(v7, "children");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (!v12)
      {
        objc_msgSend(v7, "contact");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16
          || (objc_msgSend(v8, "contact"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v21, "identifier"),
              (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(v7, "contact");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "contact");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v18, "isEqual:", v20);

          if (v16)
          {
LABEL_12:

            goto LABEL_5;
          }
        }
        else
        {
          v13 = 1;
        }

        goto LABEL_12;
      }
    }
  }
  v13 = 0;
LABEL_5:

  return v13;
}

- (void)didTapInfoButtonForCell:(id)a3
{
  id WeakRetained;
  id v5;

  objc_msgSend(a3, "recipient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "autocompleteResultsController:didRequestInfoAboutRecipient:", self, v5);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[CNAutocompleteResultsTableViewController _selectSearchResultsRecipientAtIndexPath:](self, "_selectSearchResultsRecipientAtIndexPath:", v6);

}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  CNAutocompleteResultsTableViewController *v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isRemovableFromSearchResults"))
    {
      v9 = (void *)MEMORY[0x1E0CEA4C0];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOVE_TITLE"), &stru_1E62C0368, CFSTR("Localized"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
      v17[3] = &unk_1E62BF148;
      v18 = v8;
      v19 = self;
      v20 = v5;
      objc_msgSend(v9, "contextualActionWithStyle:title:handler:", 1, v11, v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CEAA28];
      v21[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "configurationWithActions:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(id *a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  int8x16_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  int8x16_t v32;
  id v33;
  id v34;

  v28 = a4;
  v6 = (void *)MEMORY[0x1E0CEA2E8];
  v7 = (void *)MEMORY[0x1E0CB34D0];
  v8 = a3;
  objc_msgSend(v7, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[4], "isGroup"))
    v10 = CFSTR("REMOVE_RECENT_GROUP_CONFIRM");
  else
    v10 = CFSTR("REMOVE_RECENT_CONFIRM");
  objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_1E62C0368, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "popoverPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourceView:", v8);

  objc_msgSend(v12, "popoverPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPermittedArrowDirections:", 3);

  v15 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECENT"), &stru_1E62C0368, CFSTR("Localized"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2;
  v31[3] = &unk_1E62BF0F8;
  v27 = *((int8x16_t *)a1 + 2);
  v19 = (id)v27.i64[0];
  v32 = vextq_s8(v27, v27, 8uLL);
  v33 = a1[6];
  v20 = v28;
  v34 = v20;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 2, v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v21);

  v22 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E62C0368, CFSTR("Localized"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_4;
  v29[3] = &unk_1E62BF120;
  v30 = v20;
  v25 = v20;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 1, v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v26);

  objc_msgSend(a1[5], "presentViewController:animated:completion:", v12, 1, 0);
}

void __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocompleteResultsController:didAskToRemoveRecipient:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "sectionAtIndex:", objc_msgSend(*(id *)(a1 + 48), "section"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 48), "row"));

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_3;
  v8[3] = &unk_1E62BF0D0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "performBatchUpdates:completion:", v8, 0);

  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 1, v5, v6, v7);
}

void __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteRowsAtIndexPaths:withRowAnimation:", v3, 2);

}

uint64_t __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNAutocompleteResultsTableViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "autocompleteResultsControllerWillBeginToScroll:", self);

  }
}

- (CNAutocompleteResultsTableViewControllerDelegate)delegate
{
  return (CNAutocompleteResultsTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (BOOL)isDeferringTableViewUpdates
{
  return self->_deferTableViewUpdates;
}

- (double)trailingButtonMidlineInsetFromLayoutMargin
{
  return self->_trailingButtonMidlineInsetFromLayoutMargin;
}

- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(double)a3
{
  self->_trailingButtonMidlineInsetFromLayoutMargin = a3;
}

- (NSMutableSet)expandedIdentifiers
{
  return self->_expandedIdentifiers;
}

- (void)setExpandedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_expandedIdentifiers, a3);
}

- (BOOL)inDisambiguationMode
{
  return self->_inDisambiguationMode;
}

- (void)setInDisambiguationMode:(BOOL)a3
{
  self->_inDisambiguationMode = a3;
}

- (BOOL)hasPerformedRecipientExpansion
{
  return self->_hasPerformedRecipientExpansion;
}

- (void)setHasPerformedRecipientExpansion:(BOOL)a3
{
  self->_hasPerformedRecipientExpansion = a3;
}

- (BOOL)supportsInfoButton
{
  return self->_supportsInfoButton;
}

- (void)setSupportsInfoButton:(BOOL)a3
{
  self->_supportsInfoButton = a3;
}

- (BOOL)shouldHideInfoButton
{
  return self->_shouldHideInfoButton;
}

- (void)setShouldHideInfoButton:(BOOL)a3
{
  self->_shouldHideInfoButton = a3;
}

- (CNAvatarViewControllerSettings)sharedAvatarViewControllerSettings
{
  return self->_sharedAvatarViewControllerSettings;
}

- (void)setSharedAvatarViewControllerSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAvatarViewControllerSettings, a3);
}

- (CNAutocompleteSearchControllerOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_sharedAvatarViewControllerSettings, 0);
  objc_storeStrong((id *)&self->_expandedIdentifiers, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableViewModel, 0);
  objc_storeStrong((id *)&self->_serverSearchResults, 0);
  objc_storeStrong((id *)&self->_suggestedSearchResults, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
}

- (void)updateRecipients:disambiguatingRecipient:.cold.1()
{
  __assert_rtn("-[CNAutocompleteResultsTableViewController updateRecipients:disambiguatingRecipient:]", "CNAutocompleteResultsTableViewController.m", 409, "[NSThread isMainThread]");
}

- (void)callEndDisplayingRowForRecipientIndex:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B10FF000, log, OS_LOG_TYPE_ERROR, "Prevented didEndDisplayingRowForRecipient on nil recipient", v1, 2u);
}

@end
