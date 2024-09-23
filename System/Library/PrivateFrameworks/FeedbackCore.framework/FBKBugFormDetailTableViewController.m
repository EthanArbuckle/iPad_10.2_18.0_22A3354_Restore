@implementation FBKBugFormDetailTableViewController

- (void)viewDidLoad
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FBKBugFormDetailTableViewController;
  -[FBKBugFormDetailTableViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEstimatedSectionHeaderHeight:", 44.0);

  v4 = *MEMORY[0x24BEBE770];
  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSectionHeaderHeight:", v4);

  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEstimatedRowHeight:", 44.0);

  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRowHeight:", v4);

  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEstimatedSectionFooterHeight:", 0.0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemGroupedBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setHeaderAndFooterViewsFloat:", 0);

  -[FBKBugFormDetailTableViewController updateSearchBar](self, "updateSearchBar");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBKBugFormDetailTableViewController;
  -[FBKBugFormDetailTableViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[FBKBugFormDetailTableViewController recordCheckboxAnswers](self, "recordCheckboxAnswers");
  if (self->_answer)
  {
    -[FBKBugFormDetailTableViewController getPathToScrollTo](self, "getPathToScrollTo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[FBKBugFormDetailTableViewController tableView](self, "tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scrollToRowAtIndexPath:atScrollPosition:animated:", v4, 2, 0);

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBKBugFormDetailTableViewController;
  -[FBKBugFormDetailTableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[FBKBugFormDetailTableViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBKBugFormDetailTableViewController;
  -[FBKBugFormDetailTableViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[FBKBugFormDetailTableViewController updateCheckboxDelegateIfNeeded](self, "updateCheckboxDelegateIfNeeded");
  -[FBKBugFormDetailTableViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormDetailTableViewController question](self, "question");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editorDidDismissForQuestion:", v5);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("FBKClientSideResolvedChoicesDidChange"), 0);

  v4.receiver = self;
  v4.super_class = (Class)FBKBugFormDetailTableViewController;
  -[FBKBugFormDetailTableViewController dealloc](&v4, sel_dealloc);
}

- (void)setQuestion:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_question, a3);
  objc_msgSend(v8, "choiceSetResolver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_didGetClientSideResolvedNotification_, CFSTR("FBKClientSideResolvedChoicesDidChange"), 0);
  else
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("FBKClientSideResolvedChoicesDidChange"), 0);

  -[FBKBugFormDetailTableViewController updateChoices](self, "updateChoices");
}

- (void)updateChoices
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[FBKBugFormDetailTableViewController question](self, "question");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleChoices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormDetailTableViewController setVisibleChoices:](self, "setVisibleChoices:", v4);

  -[FBKBugFormDetailTableViewController visibleChoices](self, "visibleChoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormDetailTableViewController setSearchResultChoices:](self, "setSearchResultChoices:", v5);

  -[FBKBugFormDetailTableViewController updateSearchBar](self, "updateSearchBar");
  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (void)updateSearchBar
{
  double v3;
  double v4;
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  UISearchController *searchController;
  UISearchController *v12;
  UISearchController *v13;
  void *v14;
  UISearchController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("Choice"));
  objc_msgSend(v22, "frame");
  v4 = v3;
  -[FBKBugFormDetailTableViewController visibleChoices](self, "visibleChoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[FBKBugFormDetailTableViewController question](self, "question");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "answerType") != 2)
    goto LABEL_6;
  v8 = v4 * (double)v6;
  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  if (v8 <= v10)
  {

LABEL_6:
    goto LABEL_7;
  }
  searchController = self->_searchController;

  if (!searchController)
  {
    v12 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", 0);
    v13 = self->_searchController;
    self->_searchController = v12;

    -[FBKBugFormDetailTableViewController searchController](self, "searchController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSearchResultsUpdater:", self);

    v15 = self->_searchController;
    -[FBKBugFormDetailTableViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSearchController:", v15);

    -[FBKBugFormDetailTableViewController searchController](self, "searchController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", self);

    -[FBKBugFormDetailTableViewController searchController](self, "searchController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObscuresBackgroundDuringPresentation:", 0);

    -[FBKBugFormDetailTableViewController searchController](self, "searchController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "searchBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", self);

    -[FBKBugFormDetailTableViewController searchController](self, "searchController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidesNavigationBarDuringPresentation:", 0);

    -[FBKBugFormDetailTableViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  }
LABEL_7:

}

- (void)updateCheckboxDelegateIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[FBKBugFormDetailTableViewController question](self, "question");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "answerType");

  if (v4 == 4)
  {
    -[FBKBugFormDetailTableViewController checkboxAnswersAtStart](self, "checkboxAnswersAtStart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDBCF20];
    -[FBKBugFormDetailTableViewController answer](self, "answer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqualToSet:", v9);

    if ((v10 & 1) == 0)
    {
      +[FBKLog appHandle](FBKLog, "appHandle");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[FBKBugFormDetailTableViewController question](self, "question");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "role");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v13;
        _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_INFO, "Checkbox answers changed for question [%{public}@]", (uint8_t *)&v16, 0xCu);

      }
      -[FBKBugFormDetailTableViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugFormDetailTableViewController question](self, "question");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "answerDidChangeForQuestion:", v15);

    }
  }
}

- (void)recordCheckboxAnswers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[FBKBugFormDetailTableViewController question](self, "question");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "answerType");

  if (v4 == 4)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    -[FBKBugFormDetailTableViewController answer](self, "answer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormDetailTableViewController setCheckboxAnswersAtStart:](self, "setCheckboxAnswersAtStart:", v7);

  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v6 = a3;
  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("FBKDetailTableViewHeaderCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v10);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v11);

  -[FBKBugFormDetailTableViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  -[FBKBugFormDetailTableViewController question](self, "question");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "answerType");
  if (v16 == 4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CHECKBOX_FOOTER_TITLE"), &stru_24E15EAF8, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v8, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v17);

  if (v16 == 4)
  {

  }
  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int64_t v9;

  -[FBKBugFormDetailTableViewController searchController](self, "searchController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActive");

  if (v6)
  {
    -[FBKBugFormDetailTableViewController searchResultChoices](self, "searchResultChoices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[FBKBugFormDetailTableViewController searchResultChoices](self, "searchResultChoices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    -[FBKBugFormDetailTableViewController visibleChoices](self, "visibleChoices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "count");
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[FBKBugFormDetailTableViewController question](self, "question", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  FBKChoiceCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Choice"), v6);
  v7 = (FBKChoiceCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[FBKChoiceCell initWithStyle:reuseIdentifier:]([FBKChoiceCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("Choice"));
  -[FBKBugFormDetailTableViewController searchController](self, "searchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isActive") & 1) != 0)
    -[FBKBugFormDetailTableViewController searchResultChoices](self, "searchResultChoices");
  else
    -[FBKBugFormDetailTableViewController visibleChoices](self, "visibleChoices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKChoiceCell updateWithChoice:](v7, "updateWithChoice:", v10);
  -[FBKBugFormDetailTableViewController question](self, "question");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "answerType");

  if ((unint64_t)(v12 - 2) < 2)
  {
    -[FBKBugFormDetailTableViewController answer](self, "answer");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject value](v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKChoiceCell evaluateSelectionWithValue:](v7, "evaluateSelectionWithValue:", v14);
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  if (v12 == 4)
  {
    -[FBKBugFormDetailTableViewController answer](self, "answer");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject values](v13, "values");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKChoiceCell evaluateSelectionWithValues:](v7, "evaluateSelectionWithValues:", v14);
    goto LABEL_13;
  }
  if (v12 == 11)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[FBKBugFormDetailTableViewController tableView:cellForRowAtIndexPath:].cold.1(v13);
    goto LABEL_14;
  }
LABEL_15:

  return v7;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *searchResultChoices;
  NSArray *v12;
  void *v13;
  id v14;

  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("title CONTAINS[cd] %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormDetailTableViewController visibleChoices](self, "visibleChoices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredArrayUsingPredicate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSArray *)objc_msgSend(v9, "mutableCopy");
    searchResultChoices = self->_searchResultChoices;
    self->_searchResultChoices = v10;

  }
  else
  {
    -[FBKBugFormDetailTableViewController visibleChoices](self, "visibleChoices");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_searchResultChoices;
    self->_searchResultChoices = v12;
  }

  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadData");

}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[FBKBugFormDetailTableViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForSelectedRow");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FBKBugFormDetailTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v6, 1);

  }
}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v7;
  int v8;

  v7 = a3;
  v8 = objc_msgSend(a5, "isEqualToString:", CFSTR("\t"));
  if (v8)
  {
    objc_msgSend(v7, "endEditing:", 1);
    -[FBKBugFormDetailTableViewController becomeFirstResponder](self, "becomeFirstResponder");
    -[FBKBugFormDetailTableViewController selectNext](self, "selectNext");
  }

  return v8 ^ 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[5];

  v29 = a3;
  v6 = a4;
  objc_msgSend(v29, "deselectRowAtIndexPath:animated:", v6, 1);
  -[FBKBugFormDetailTableViewController searchController](self, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isActive") & 1) != 0)
    -[FBKBugFormDetailTableViewController searchResultChoices](self, "searchResultChoices");
  else
    -[FBKBugFormDetailTableViewController visibleChoices](self, "visibleChoices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKBugFormDetailTableViewController question](self, "question");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "answerType");

  if ((unint64_t)(v11 - 2) < 2)
  {
    objc_msgSend(v29, "visibleCells");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global);

    -[FBKBugFormDetailTableViewController answer](self, "answer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:", v14);

    objc_msgSend(v29, "cellForRowAtIndexPath:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormDetailTableViewController answer](self, "answer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "evaluateSelectionWithValue:", v17);

    -[FBKBugFormDetailTableViewController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormDetailTableViewController question](self, "question");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "answerDidChangeForQuestion:", v19);

    -[FBKBugFormDetailTableViewController searchController](self, "searchController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v20, "isActive");

    if ((_DWORD)v19)
      -[FBKBugFormDetailTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    -[FBKBugFormDetailTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    goto LABEL_13;
  }
  if (v11 == 4)
  {
    -[FBKAnswer values](self->_answer, "values");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "containsObject:", v22);

    -[FBKAnswer values](self->_answer, "values");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v25 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(v9, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "predicateWithFormat:", CFSTR("SELF != %@"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "filteredArrayUsingPredicate:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKAnswer setValues:](self->_answer, "setValues:", v28);

    }
    else
    {
      objc_msgSend(v9, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "arrayByAddingObject:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKAnswer setValues:](self->_answer, "setValues:", v27);
    }

    objc_msgSend(v29, "visibleCells");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __73__FBKBugFormDetailTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v30[3] = &unk_24E1569A8;
    v30[4] = self;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v30);
LABEL_13:

  }
}

uint64_t __73__FBKBugFormDetailTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccessoryType:", 0);
}

void __73__FBKBugFormDetailTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "answer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evaluateSelectionWithValues:", v4);

}

- (void)didGetClientSideResolvedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormDetailTableViewController question](self, "question");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "choiceSetResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[FBKBugFormDetailTableViewController question](self, "question");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allChoices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = 67109120;
      v11[1] = objc_msgSend(v10, "count");
      _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_INFO, "updating choice set with [%i] choices", (uint8_t *)v11, 8u);

    }
    -[FBKBugFormDetailTableViewController updateChoices](self, "updateChoices");
  }

}

- (id)getPathToScrollTo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[FBKBugFormDetailTableViewController visibleChoices](self, "visibleChoices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1758];
  -[FBKAnswer value](self->_answer, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("value ==[c] %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    -[FBKBugFormDetailTableViewController visibleChoices](self, "visibleChoices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "indexOfObject:", v9);

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)beginSearch
{
  void *v3;
  void *v4;
  id v5;

  -[FBKBugFormDetailTableViewController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKBugFormDetailTableViewController searchController](self, "searchController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

- (void)selectNext
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSelectedRow");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRowsInSection:", 0);

  v6 = objc_msgSend(v12, "row");
  if (!v12 && v5 >= 1)
  {
    -[FBKBugFormDetailTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD15D8];
    v9 = 0;
LABEL_6:
    objc_msgSend(v8, "indexPathForRow:inSection:", v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectRowAtIndexPath:animated:scrollPosition:", v11, 1, 2);

    goto LABEL_7;
  }
  v10 = v6 + 1;
  if (v6 + 1 < v5)
  {
    -[FBKBugFormDetailTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD15D8];
    v9 = v10;
    goto LABEL_6;
  }
LABEL_7:

}

- (void)selectPrevious
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSelectedRow");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRowsInSection:", 0);

  v6 = objc_msgSend(v11, "row");
  if (!v11 && (v7 = v5 < 1, v8 = v5 - 1, !v7) || (v8 = v6 - 1, v6 >= 1))
  {
    -[FBKBugFormDetailTableViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectRowAtIndexPath:animated:scrollPosition:", v10, 1, 2);

  }
}

- (void)commitSelection
{
  void *v3;
  void *v4;
  id v5;

  -[FBKBugFormDetailTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSelectedRow");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FBKBugFormDetailTableViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormDetailTableViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v4, v5);

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("f"), 0x100000, sel_beginSearch);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SEARCH"), &stru_24E15EAF8, CFSTR("CommonStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDiscoverabilityTitle:", v4);

  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3F8], 0, sel_selectPrevious);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3D8], 0, sel_selectNext);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_commitSelection);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v10[1] = v5;
  v10[2] = v6;
  v10[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (FBKBugFormEditorDelegate)delegate
{
  return (FBKBugFormEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBKQuestion)question
{
  return self->_question;
}

- (FBKAnswer)answer
{
  return self->_answer;
}

- (void)setAnswer:(id)a3
{
  objc_storeStrong((id *)&self->_answer, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (NSArray)visibleChoices
{
  return self->_visibleChoices;
}

- (void)setVisibleChoices:(id)a3
{
  objc_storeStrong((id *)&self->_visibleChoices, a3);
}

- (NSArray)searchResultChoices
{
  return self->_searchResultChoices;
}

- (void)setSearchResultChoices:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultChoices, a3);
}

- (NSSet)checkboxAnswersAtStart
{
  return self->_checkboxAnswersAtStart;
}

- (void)setCheckboxAnswersAtStart:(id)a3
{
  objc_storeStrong((id *)&self->_checkboxAnswersAtStart, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkboxAnswersAtStart, 0);
  objc_storeStrong((id *)&self->_searchResultChoices, 0);
  objc_storeStrong((id *)&self->_visibleChoices, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_answer, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)tableView:(os_log_t)log cellForRowAtIndexPath:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[FBKBugFormDetailTableViewController tableView:cellForRowAtIndexPath:]";
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "TODO handle Modal in %s", (uint8_t *)&v1, 0xCu);
}

@end
