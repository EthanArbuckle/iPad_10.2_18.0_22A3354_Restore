@implementation KSListUserWordsController

- (id)mainTableView
{
  return -[UIView viewWithTag:](self->_contentView, "viewWithTag:", 1);
}

- (void)viewSafeAreaInsetsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  -[UIToolbar origin](self->_toolbar, "origin");
  v4 = v3;
  -[UIView frame](self->_contentView, "frame");
  v6 = v5;
  -[UIToolbar size](self->_toolbar, "size");
  v8 = v6 - v7;
  objc_msgSend((id)objc_msgSend((id)-[KSListUserWordsController navigationController](self, "navigationController"), "view"), "safeAreaInsets");
  -[UIToolbar setFrameOrigin:](self->_toolbar, "setFrameOrigin:", v4, v8 - v9);
  v10.receiver = self;
  v10.super_class = (Class)KSListUserWordsController;
  -[KSListUserWordsController viewSafeAreaInsetsDidChange](&v10, sel_viewSafeAreaInsetsDidChange);
}

- (id)_mainContentView
{
  id result;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UITableView *v9;
  id v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  void *v15;
  UISearchController *v16;
  UISearchBar *v17;
  void *v18;
  CGRect v19;

  result = self->_contentView;
  if (!result)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen"), "bounds");
    v5 = v4;
    v7 = v6;
    v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, v4, v6);
    self->_contentView = v8;
    -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    v9 = (UITableView *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F0]), "initWithFrame:style:", 0, 0.0, 0.0, v5, v7);
    -[UITableView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    -[UITableView setCountStringInsignificantRowCount:](v9, "setCountStringInsignificantRowCount:", 9);
    -[UITableView setDataSource:](v9, "setDataSource:", self);
    -[UITableView setDelegate:](v9, "setDelegate:", self);
    -[UITableView setEstimatedSectionHeaderHeight:](v9, "setEstimatedSectionHeaderHeight:", 0.0);
    -[UITableView setEstimatedSectionFooterHeight:](v9, "setEstimatedSectionFooterHeight:", 0.0);
    self->_tableView = v9;
    -[UITableView setTag:](v9, "setTag:", 1);
    -[UITableView setIndexHidden:animated:](v9, "setIndexHidden:animated:", 0, 0);
    -[UIView addSubview:](self->_contentView, "addSubview:", v9);
    v10 = objc_alloc(MEMORY[0x24BEBDA90]);
    self->_toolbar = (UIToolbar *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[UIToolbar setItems:](self->_toolbar, "setItems:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", -[KSListUserWordsController editButtonItem](self, "editButtonItem"), 0));
    -[UIToolbar setAutoresizingMask:](self->_toolbar, "setAutoresizingMask:", 10);
    -[UIToolbar sizeThatFits:](self->_toolbar, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    v12 = v11;
    -[UITableView frame](v9, "frame");
    v13 = CGRectGetMaxY(v19) - v12;
    objc_msgSend((id)objc_msgSend((id)-[KSListUserWordsController navigationController](self, "navigationController"), "view"), "safeAreaInsets");
    -[UIToolbar setFrame:](self->_toolbar, "setFrame:", 0.0, v13 - v14, v5, v12);
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_toolbar);
    -[UITableView setContentInset:](v9, "setContentInset:", 0.0, 0.0, v12, 0.0);
    self->_searchResultsController = -[KSSearchUserWordsController initWithNavigationController:]([KSSearchUserWordsController alloc], "initWithNavigationController:", -[KSListUserWordsController navigationController](self, "navigationController"));
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", self->_searchResultsController);
    objc_msgSend(v15, "setNavigationBarHidden:animated:", 1, 0);
    objc_msgSend(v15, "setDelegate:", self);
    v16 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", v15);
    self->_searchController = v16;
    -[UISearchController setSearchResultsUpdater:](v16, "setSearchResultsUpdater:", self->_searchResultsController);
    -[UISearchController setDelegate:](self->_searchController, "setDelegate:", self);
    -[KSListUserWordsController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);

    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
      -[UISearchController setHidesNavigationBarDuringPresentation:](self->_searchController, "setHidesNavigationBarDuringPresentation:", 0);
    }
    v17 = -[UISearchController searchBar](self->_searchController, "searchBar");
    -[UISearchBar setPlaceholder:](v17, "setPlaceholder:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SEARCH_LOCAL_PLACEHOLDER"), &stru_25107A038, CFSTR("Keyboard")));
    -[UISearchBar setAutoresizingMask:](v17, "setAutoresizingMask:", 2);
    -[UISearchBar setAutocorrectionType:](v17, "setAutocorrectionType:", 1);
    -[UISearchBar setDelegate:](v17, "setDelegate:", self);
    objc_msgSend((id)-[KSListUserWordsController navigationItem](self, "navigationItem"), "setSearchController:", self->_searchController);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 4, self, sel_addUserWord);
    objc_msgSend((id)-[KSListUserWordsController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", v18);

    return self->_contentView;
  }
  return result;
}

- (void)loadView
{
  UIView *v3;

  v3 = -[KSListUserWordsController _mainContentView](self, "_mainContentView");
  self->_contentView = v3;
  -[KSListUserWordsController setView:](self, "setView:", v3);
}

- (void)reloadSections
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t j;
  uint64_t v14;
  id v15;
  uint64_t v16;
  UITableView *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BEBD738], "currentCollation");
  v4 = objc_msgSend((id)objc_msgSend(v3, "sectionTitles"), "count");
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4);
  if (v4)
  {
    v6 = v4;
    do
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v5, "addObject:", v7);

      --v6;
    }
    while (v6);
  }
  v8 = -[KSUserWordsManager entries](-[KSListUserWordsController dictionaryController](self, "dictionaryController"), "entries");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v3, "sectionForObject:collationStringSelector:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), sel_shortcutForSorting)), "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }
  if (v4)
  {
    for (j = 0; j != v4; ++j)
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", j, objc_msgSend(v3, "sortedArrayFromArray:collationStringSelector:", objc_msgSend(v5, "objectAtIndex:", j), sel_shortcutForSorting));
  }
  -[KSListUserWordsController setCollation:](self, "setCollation:", v3);
  -[KSListUserWordsController setSections:](self, "setSections:", v5);
  -[UITableView reloadData](-[KSListUserWordsController tableView](self, "tableView"), "reloadData");
  if (-[KSListUserWordsController currentShortcut](self, "currentShortcut")
    && -[NSArray count](-[KSListUserWordsController sections](self, "sections"), "count"))
  {
    v14 = 0;
    while (1)
    {
      v15 = -[NSArray objectAtIndexedSubscript:](-[KSListUserWordsController sections](self, "sections"), "objectAtIndexedSubscript:", v14);
      if (objc_msgSend(v15, "count"))
        break;
LABEL_21:
      if (++v14 >= -[NSArray count](-[KSListUserWordsController sections](self, "sections"), "count"))
        goto LABEL_22;
    }
    v16 = 0;
    while ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16), "shortcut"), "isEqualToString:", -[KSListUserWordsController currentShortcut](self, "currentShortcut")) & 1) == 0)
    {
      if (++v16 >= (unint64_t)objc_msgSend(v15, "count"))
        goto LABEL_21;
    }
    v17 = -[KSListUserWordsController tableView](self, "tableView");
    -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](v17, "scrollToRowAtIndexPath:atScrollPosition:animated:", objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v16, v14), 1, 1);
  }
  else
  {
LABEL_22:
    if (self->_restoreEditing)
    {
      self->_restoreEditing = 0;
      -[KSListUserWordsController setEditing:animated:](self, "setEditing:animated:", 1, 0);
    }
  }
}

- (void)viewDidLoad
{
  KSUserWordsManager *v3;
  KSUserWordsManager *v4;
  _QWORD v5[5];
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KSListUserWordsController;
  -[KSListUserWordsController viewDidLoad](&v7, sel_viewDidLoad);
  -[KSListUserWordsController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SHORTCUTS"), &stru_25107A038, CFSTR("Keyboard")));
  -[KSListUserWordsController parentController](self, "parentController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (KSUserWordsManager *)objc_msgSend((id)-[KSListUserWordsController parentController](self, "parentController"), "dictionaryController");
  else
    v3 = objc_alloc_init(KSUserWordsManager);
  -[KSListUserWordsController setDictionaryController:](self, "setDictionaryController:", v3);
  -[KSSearchUserWordsController setDictionaryController:](self->_searchResultsController, "setDictionaryController:", -[KSListUserWordsController dictionaryController](self, "dictionaryController"));
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = __Block_byref_object_copy__1;
  v6[4] = __Block_byref_object_dispose__1;
  v6[5] = self;
  v4 = -[KSListUserWordsController dictionaryController](self, "dictionaryController");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__KSListUserWordsController_viewDidLoad__block_invoke;
  v5[3] = &unk_251079800;
  v5[4] = v6;
  self->_observerToken = -[KSUserWordsManager addObserver:](v4, "addObserver:", v5);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_userWordDidUpdate_, CFSTR("EditUserWordShortcutDidUpdateNotification"), 0);
  if (-[KSListUserWordsController savedSearchTerm](self, "savedSearchTerm"))
  {
    -[UISearchBar setText:](-[UISearchController searchBar](self->_searchController, "searchBar"), "setText:", self->savedSearchTerm);
    -[UISearchController setActive:](self->_searchController, "setActive:", -[KSListUserWordsController searchIsActive](self, "searchIsActive"));
    -[KSListUserWordsController setSavedSearchTerm:](self, "setSavedSearchTerm:", 0);
  }
  -[KSUserWordsManager requestSync](-[KSListUserWordsController dictionaryController](self, "dictionaryController"), "requestSync");
  _Block_object_dispose(v6, 8);
}

uint64_t __40__KSListUserWordsController_viewDidLoad__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "searchIsActive");
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "searchController"), "searchResultsUpdater"), "updateSearchResultsForSearchController:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "searchController"));
  else
    return objc_msgSend(v3, "reloadSections");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KSListUserWordsController;
  -[KSListUserWordsController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[KSListUserWordsController reloadSections](self, "reloadSections");
}

- (void)dealloc
{
  objc_super v3;

  -[KSUserWordsManager removeObserver:](-[KSListUserWordsController dictionaryController](self, "dictionaryController"), "removeObserver:", self->_observerToken);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);

  self->_searchController = 0;
  self->currentShortcut = 0;

  self->_dictionaryController = 0;
  self->_contentView = 0;

  self->_toolbar = 0;
  v3.receiver = self;
  v3.super_class = (Class)KSListUserWordsController;
  -[KSListUserWordsController dealloc](&v3, sel_dealloc);
}

- (BOOL)_shouldHideIndex
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"), "userInterfaceIdiom");
  v4 = -[KSListUserWordsController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", -[KSListUserWordsController tableView](self, "tableView"));
  v5 = 15;
  if (v3 == 1)
    v5 = 20;
  return v4 < v5;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)KSListUserWordsController;
  -[KSListUserWordsController setEditing:animated:](&v7, sel_setEditing_animated_);
  -[UITableView setEditing:animated:](-[KSListUserWordsController tableView](self, "tableView"), "setEditing:animated:", v5, v4);
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->_manualEditing = 1;
  -[KSListUserWordsController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  -[KSListUserWordsController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  self->_manualEditing = 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  BOOL v8;
  uint64_t v9;
  KSUserWordsManager *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a4 == 1)
  {
    if (-[KSListUserWordsController isEditing](self, "isEditing"))
      v8 = !self->_manualEditing;
    else
      v8 = 0;
    self->_restoreEditing = v8;
    objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a5, 1);
    v9 = objc_msgSend(-[NSArray objectAtIndex:](-[KSListUserWordsController sections](self, "sections"), "objectAtIndex:", objc_msgSend(a5, "section")), "objectAtIndex:", objc_msgSend(a5, "row"));
    v10 = -[KSListUserWordsController dictionaryController](self, "dictionaryController");
    v11[0] = v9;
    -[KSUserWordsManager addEntries:removeEntries:withCompletionHandler:](v10, "addEntries:removeEntries:withCompletionHandler:", 0, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1), &__block_literal_global_5);
    self->_manualEditing = 0;
    if (!v8)
      -[KSListUserWordsController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  KSEditUserWordController *v6;

  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
  v6 = -[KSEditUserWordController initWithUserWord:]([KSEditUserWordController alloc], "initWithUserWord:", objc_msgSend(-[NSArray objectAtIndex:](-[KSListUserWordsController sections](self, "sections"), "objectAtIndex:", objc_msgSend(a4, "section")), "objectAtIndex:", objc_msgSend(a4, "row")));
  -[KSEditUserWordController setDictionaryController:](v6, "setDictionaryController:", -[KSListUserWordsController dictionaryController](self, "dictionaryController"));
  -[KSListUserWordsController showController:](self, "showController:", v6);

}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](-[KSListUserWordsController sections](self, "sections", a3), "count");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return objc_msgSend(-[NSArray objectAtIndex:](-[KSListUserWordsController sections](self, "sections", a3), "objectAtIndex:", a4), "count");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;

  v6 = (id)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("kCellIdentifier"));
  if (!v6)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("kCellIdentifier"));
    objc_msgSend(v6, "setAccessoryType:", 0);
  }
  v7 = (void *)objc_msgSend(-[NSArray objectAtIndex:](-[KSListUserWordsController sections](self, "sections"), "objectAtIndex:", objc_msgSend(a4, "section")), "objectAtIndex:", objc_msgSend(a4, "row"));
  objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", objc_msgSend(v7, "phrase"));
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend(v7, "shortcut"));
  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id result;

  result = (id)objc_msgSend(-[NSArray objectAtIndex:](-[KSListUserWordsController sections](self, "sections", a3), "objectAtIndex:", a4), "count");
  if (result)
    return -[NSArray objectAtIndex:](-[UILocalizedIndexedCollation sectionTitles](-[KSListUserWordsController collation](self, "collation"), "sectionTitles"), "objectAtIndex:", a4);
  return result;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  if (-[KSListUserWordsController _shouldHideIndex](self, "_shouldHideIndex")
    || !objc_msgSend(-[NSArray objectAtIndex:](-[KSListUserWordsController sections](self, "sections"), "objectAtIndex:", a4), "count"))
  {
    return 0.0;
  }
  objc_msgSend(a3, "sectionHeaderHeight");
  return result;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if (-[KSListUserWordsController _shouldHideIndex](self, "_shouldHideIndex", a3))
    return 0;
  else
    return -[UILocalizedIndexedCollation sectionIndexTitles](-[KSListUserWordsController collation](self, "collation"), "sectionIndexTitles");
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  int64_t v7;
  NSInteger v8;
  int64_t v9;
  int64_t v11;
  uint64_t v12;

  if (-[KSListUserWordsController _shouldHideIndex](self, "_shouldHideIndex", a3, a4))
    return 0;
  v8 = -[UILocalizedIndexedCollation sectionForSectionIndexTitleAtIndex:](-[KSListUserWordsController collation](self, "collation"), "sectionForSectionIndexTitleAtIndex:", a5);
  v9 = -[NSArray count](-[KSListUserWordsController sections](self, "sections"), "count");
  if (v8 < 0)
  {
LABEL_8:
    v11 = v8 + 1;
    do
    {
      v7 = v11;
      if (v11 >= v9)
        break;
      v12 = objc_msgSend(-[NSArray objectAtIndex:](-[KSListUserWordsController sections](self, "sections"), "objectAtIndex:", v11), "count");
      v11 = v7 + 1;
    }
    while (!v12);
  }
  else
  {
    v7 = v8;
    while (!objc_msgSend(-[NSArray objectAtIndex:](-[KSListUserWordsController sections](self, "sections"), "objectAtIndex:", v7), "count"))
    {
      if (v7-- <= 0)
        goto LABEL_8;
    }
  }
  if (v7 < v9)
    return v7;
  return -[UILocalizedIndexedCollation sectionForSectionIndexTitleAtIndex:](-[KSListUserWordsController collation](self, "collation"), "sectionForSectionIndexTitleAtIndex:", a5);
}

- (void)userWordDidUpdate:(id)a3
{
  -[KSListUserWordsController setCurrentShortcut:](self, "setCurrentShortcut:", objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("shortcut")));
}

- (void)addUserWord
{
  KSEditUserWordController *v3;

  v3 = objc_alloc_init(KSEditUserWordController);
  -[KSEditUserWordController setDictionaryController:](v3, "setDictionaryController:", -[KSListUserWordsController dictionaryController](self, "dictionaryController"));
  -[KSListUserWordsController showController:](self, "showController:", v3);

}

- (void)inlineUserDictionaryDoneEditing
{
  objc_msgSend((id)-[KSListUserWordsController navigationController](self, "navigationController"), "popViewControllerAnimated:", 1);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  KSListUserWordsController *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  KSListUserWordsController *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  KSListUserWordsController *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  KSListUserWordsController *v32;

  if (-[KSListUserWordsController searchNavControllerChanges](self, "searchNavControllerChanges", a3, a4, a5))
  {
    v8 = (id)objc_msgSend((id)objc_msgSend(a3, "viewControllers"), "firstObject");
    v9 = (void *)objc_msgSend(a3, "transitionCoordinator");
    v10 = -[UISearchBar superview](-[UISearchController searchBar](self->_searchController, "searchBar"), "superview");
    if (v8 == a4)
    {
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __82__KSListUserWordsController_navigationController_willShowViewController_animated___block_invoke;
      v31 = &unk_251079D80;
      v32 = self;
      v23 = MEMORY[0x24BDAC760];
      v24 = 3221225472;
      v25 = __82__KSListUserWordsController_navigationController_willShowViewController_animated___block_invoke_2;
      v26 = &unk_251079D80;
      v27 = self;
      v11 = &v28;
      v12 = &v23;
    }
    else
    {
      v17 = self;
      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __82__KSListUserWordsController_navigationController_willShowViewController_animated___block_invoke_3;
      v21 = &unk_251079D80;
      v22 = self;
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __82__KSListUserWordsController_navigationController_willShowViewController_animated___block_invoke_4;
      v16 = &unk_251079D80;
      v11 = &v18;
      v12 = &v13;
    }
    objc_msgSend(v9, "animateAlongsideTransitionInView:animation:completion:", v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
      v27,
      v28,
      v29,
      v30,
      v31,
      v32);
    objc_msgSend(a3, "setNavigationBarHidden:animated:", v8 == a4, 1);
  }
  -[KSListUserWordsController setSearchNavControllerChanges:](self, "setSearchNavControllerChanges:", -[KSListUserWordsController searchNavControllerChanges](self, "searchNavControllerChanges") + 1);
}

uint64_t __82__KSListUserWordsController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showSearchBar");
}

uint64_t __82__KSListUserWordsController_navigationController_willShowViewController_animated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_hideSearchBar");
  return result;
}

uint64_t __82__KSListUserWordsController_navigationController_willShowViewController_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideSearchBar");
}

uint64_t __82__KSListUserWordsController_navigationController_willShowViewController_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "searchBar"), "setHidden:", 1);
}

- (void)willPresentSearchController:(id)a3
{
  -[KSListUserWordsController setSearchNavControllerChanges:](self, "setSearchNavControllerChanges:", 0);
  -[KSListUserWordsController setSearchIsActive:](self, "setSearchIsActive:", 1);
}

- (void)willDismissSearchController:(id)a3
{
  -[KSListUserWordsController setSearchIsActive:](self, "setSearchIsActive:", 0);
}

- (void)_hideSearchBar
{
  CGRect v3;

  -[UISearchBar frame](-[UISearchController searchBar](self->_searchController, "searchBar"), "frame");
  -[UISearchBar setFrame:](-[UISearchController searchBar](self->_searchController, "searchBar"), "setFrame:", v3.origin.x - CGRectGetWidth(v3), v3.origin.y, v3.size.width, v3.size.height);
  -[UISearchBar resignFirstResponder](-[UISearchController searchBar](self->_searchController, "searchBar"), "resignFirstResponder");
}

- (void)_showSearchBar
{
  double y;
  double width;
  double height;
  CGFloat v6;
  _QWORD v7[9];
  CGRect v8;

  -[UISearchBar frame](-[UISearchController searchBar](self->_searchController, "searchBar"), "frame");
  y = v8.origin.y;
  width = v8.size.width;
  height = v8.size.height;
  v6 = CGRectGetWidth(v8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__KSListUserWordsController__showSearchBar__block_invoke;
  v7[3] = &unk_251079DA8;
  v7[4] = self;
  *(double *)&v7[5] = -v6;
  *(double *)&v7[6] = y;
  *(double *)&v7[7] = width;
  *(double *)&v7[8] = height;
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v7);
  -[UISearchBar setFrame:](-[UISearchController searchBar](self->_searchController, "searchBar"), "setFrame:", 0.0, y, width, height);
  -[UISearchBar becomeFirstResponder](-[UISearchController searchBar](self->_searchController, "searchBar"), "becomeFirstResponder");
}

uint64_t __43__KSListUserWordsController__showSearchBar__block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "searchBar"), "setHidden:", 0);
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "searchBar"), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1016);
}

- (KSUserWordsManager)dictionaryController
{
  return self->_dictionaryController;
}

- (void)setDictionaryController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1120);
}

- (UILocalizedIndexedCollation)collation
{
  return self->_collation;
}

- (void)setCollation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1128);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1136);
}

- (NSString)savedSearchTerm
{
  return self->savedSearchTerm;
}

- (void)setSavedSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (BOOL)searchIsActive
{
  return self->searchIsActive;
}

- (void)setSearchIsActive:(BOOL)a3
{
  self->searchIsActive = a3;
}

- (NSString)currentShortcut
{
  return self->currentShortcut;
}

- (void)setCurrentShortcut:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1144);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1152);
}

- (unint64_t)searchNavControllerChanges
{
  return self->_searchNavControllerChanges;
}

- (void)setSearchNavControllerChanges:(unint64_t)a3
{
  self->_searchNavControllerChanges = a3;
}

@end
