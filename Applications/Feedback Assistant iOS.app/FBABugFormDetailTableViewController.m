@implementation FBABugFormDetailTableViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FBABugFormDetailTableViewController;
  -[FBABugFormDetailTableViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setEstimatedSectionHeaderHeight:", 44.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setSectionHeaderHeight:", UITableViewAutomaticDimension);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setEstimatedRowHeight:", 44.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setRowHeight:", UITableViewAutomaticDimension);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setEstimatedSectionFooterHeight:", 0.0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v10, "_setHeaderAndFooterViewsFloat:", 0);

  -[FBABugFormDetailTableViewController updateSearchBar](self, "updateSearchBar");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBABugFormDetailTableViewController;
  -[FBABugFormDetailTableViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  -[FBABugFormDetailTableViewController recordCheckboxAnswers](self, "recordCheckboxAnswers");
  if (self->_answer)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController getPathToScrollTo](self, "getPathToScrollTo"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
      objc_msgSend(v5, "scrollToRowAtIndexPath:atScrollPosition:animated:", v4, 2, 0);

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBABugFormDetailTableViewController;
  -[FBABugFormDetailTableViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[FBABugFormDetailTableViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBABugFormDetailTableViewController;
  -[FBABugFormDetailTableViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  -[FBABugFormDetailTableViewController updateCheckboxDelegateIfNeeded](self, "updateCheckboxDelegateIfNeeded");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
  objc_msgSend(v4, "editorDidDismissForQuestion:", v5);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, FBKClientSideResolvedChoicesDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)FBABugFormDetailTableViewController;
  -[FBABugFormDetailTableViewController dealloc](&v4, "dealloc");
}

- (void)setQuestion:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_question, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "choiceSetResolver"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "didGetClientSideResolvedNotification:", FBKClientSideResolvedChoicesDidChangeNotification, 0);
  else
    objc_msgSend(v6, "removeObserver:name:object:", self, FBKClientSideResolvedChoicesDidChangeNotification, 0);

  -[FBABugFormDetailTableViewController updateChoices](self, "updateChoices");
}

- (void)updateChoices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allChoices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isPrompt = NO")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));
  -[FBABugFormDetailTableViewController setVisibleChoices:](self, "setVisibleChoices:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController visibleChoices](self, "visibleChoices"));
  -[FBABugFormDetailTableViewController setSearchResultChoices:](self, "setSearchResultChoices:", v7);

  -[FBABugFormDetailTableViewController updateSearchBar](self, "updateSearchBar");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v8, "reloadData");

}

- (void)updateSearchBar
{
  double v3;
  double v4;
  void *v5;
  id v6;
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

  v22 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("Choice"));
  objc_msgSend(v22, "frame");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController visibleChoices](self, "visibleChoices"));
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
  if (objc_msgSend(v7, "answerType") != (id)2)
    goto LABEL_6;
  v8 = v4 * (double)(unint64_t)v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "frame");
  if (v8 <= v10)
  {

LABEL_6:
    goto LABEL_7;
  }
  searchController = self->_searchController;

  if (!searchController)
  {
    v12 = (UISearchController *)objc_msgSend(objc_alloc((Class)UISearchController), "initWithSearchResultsController:", 0);
    v13 = self->_searchController;
    self->_searchController = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchController](self, "searchController"));
    objc_msgSend(v14, "setSearchResultsUpdater:", self);

    v15 = self->_searchController;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v16, "setSearchController:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchController](self, "searchController"));
    objc_msgSend(v17, "setDelegate:", self);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchController](self, "searchController"));
    objc_msgSend(v18, "setObscuresBackgroundDuringPresentation:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchController](self, "searchController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "searchBar"));
    objc_msgSend(v20, "setDelegate:", self);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchController](self, "searchController"));
    objc_msgSend(v21, "setHidesNavigationBarDuringPresentation:", 0);

    -[FBABugFormDetailTableViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  }
LABEL_7:

}

- (void)updateCheckboxDelegateIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
  v4 = objc_msgSend(v3, "answerType");

  if (v4 == (id)4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController checkboxAnswersAtStart](self, "checkboxAnswersAtStart"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController answer](self, "answer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "values"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
    v9 = objc_msgSend(v5, "isEqualToSet:", v8);

    if ((v9 & 1) == 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "role"));
        v15 = 138543362;
        v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Checkbox answers changed for question [%{public}@]", (uint8_t *)&v15, 0xCu);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController delegate](self, "delegate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
      objc_msgSend(v13, "answerDidChangeForQuestion:", v14);

    }
  }
}

- (void)recordCheckboxAnswers
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
  v4 = objc_msgSend(v3, "answerType");

  if (v4 == (id)4)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController answer](self, "answer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "values"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
    -[FBABugFormDetailTableViewController setCheckboxAnswersAtStart:](self, "setCheckboxAnswersAtStart:", v6);

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
  id v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("FBADetailTableViewHeaderCell")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backgroundColor"));
  objc_msgSend(v8, "setBackgroundColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
  objc_msgSend(v12, "setTextColor:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
  objc_msgSend(v14, "setText:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
  v16 = objc_msgSend(v15, "answerType");
  if (v16 == (id)4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CHECKBOX_FOOTER_TITLE"), &stru_1000EA660, 0));
  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
  objc_msgSend(v18, "setText:", v17);

  if (v16 == (id)4)
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
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchController](self, "searchController", a3, a4));
  v6 = objc_msgSend(v5, "isActive");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchResultChoices](self, "searchResultChoices"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchResultChoices](self, "searchResultChoices"));
      v9 = objc_msgSend(v8, "count");

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController visibleChoices](self, "visibleChoices"));
    v9 = objc_msgSend(v7, "count");
  }

  return (int64_t)v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  FBAChoiceCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = (FBAChoiceCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Choice"), v6));
  if (!v7)
    v7 = -[FBAChoiceCell initWithStyle:reuseIdentifier:]([FBAChoiceCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("Choice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchController](self, "searchController"));
  if ((objc_msgSend(v8, "isActive") & 1) != 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchResultChoices](self, "searchResultChoices"));
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController visibleChoices](self, "visibleChoices"));
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row")));

  -[FBAChoiceCell updateWithChoice:](v7, "updateWithChoice:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
  v13 = (char *)objc_msgSend(v12, "answerType");

  if ((unint64_t)(v13 - 2) < 2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController answer](self, "answer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
    -[FBAChoiceCell evaluateSelectionWithValue:](v7, "evaluateSelectionWithValue:", v15);
LABEL_10:

    goto LABEL_11;
  }
  if (v13 == (char *)4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController answer](self, "answer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "values"));
    -[FBAChoiceCell evaluateSelectionWithValues:](v7, "evaluateSelectionWithValues:", v15);
    goto LABEL_10;
  }
LABEL_11:

  return v7;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *searchResultChoices;
  NSArray *v12;
  void *v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchBar"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  if (objc_msgSend(v14, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("title CONTAINS[cd] %@"), v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController visibleChoices](self, "visibleChoices"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v7));
    v10 = (NSArray *)objc_msgSend(v9, "mutableCopy");
    searchResultChoices = self->_searchResultChoices;
    self->_searchResultChoices = v10;

  }
  else
  {
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController visibleChoices](self, "visibleChoices"));
    v6 = self->_searchResultChoices;
    self->_searchResultChoices = v12;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v13, "reloadData");

}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForSelectedRow"));

  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
    objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v6, 1);

  }
}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v7;
  unsigned int v8;

  v7 = a3;
  v8 = objc_msgSend(a5, "isEqualToString:", CFSTR("\t"));
  if (v8)
  {
    objc_msgSend(v7, "endEditing:", 1);
    -[FBABugFormDetailTableViewController becomeFirstResponder](self, "becomeFirstResponder");
    -[FBABugFormDetailTableViewController selectNext](self, "selectNext");
  }

  return v8 ^ 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchController](self, "searchController"));
  if ((objc_msgSend(v8, "isActive") & 1) != 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchResultChoices](self, "searchResultChoices"));
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController visibleChoices](self, "visibleChoices"));
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
  v13 = (char *)objc_msgSend(v12, "answerType");

  if ((unint64_t)(v13 - 2) >= 2)
  {
    if (v13 == (char *)4)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBKAnswer values](self->_answer, "values"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
      v25 = objc_msgSend(v23, "containsObject:", v24);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[FBKAnswer values](self->_answer, "values"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
      if (v25)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF != %@"), v27));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "filteredArrayUsingPredicate:", v28));
        -[FBKAnswer setValues:](self->_answer, "setValues:", v29);

      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "arrayByAddingObject:", v27));
        -[FBKAnswer setValues:](self->_answer, "setValues:", v28);
      }

      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "visibleCells"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100040418;
      v30[3] = &unk_1000E6CA0;
      v30[4] = self;
      -[NSObject enumerateObjectsUsingBlock:](v17, "enumerateObjectsUsingBlock:", v30);
    }
    else
    {
      v17 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10009AFC0(self, v17);
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "visibleCells"));
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", &stru_1000E7820);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController answer](self, "answer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
    objc_msgSend(v15, "setValue:", v16);

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v7));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController answer](self, "answer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "value"));
    -[NSObject evaluateSelectionWithValue:](v17, "evaluateSelectionWithValue:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController delegate](self, "delegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
    objc_msgSend(v20, "answerDidChangeForQuestion:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchController](self, "searchController"));
    LODWORD(v21) = objc_msgSend(v22, "isActive");

    if ((_DWORD)v21)
      -[FBABugFormDetailTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    -[FBABugFormDetailTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)didGetClientSideResolvedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "choiceSetResolver"));
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController question](self, "question"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allChoices"));
      v11[0] = 67109120;
      v11[1] = objc_msgSend(v10, "count");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "updating choice set with [%i] choices", (uint8_t *)v11, 8u);

    }
    -[FBABugFormDetailTableViewController updateChoices](self, "updateChoices");
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
  id v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController visibleChoices](self, "visibleChoices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBKAnswer value](self->_answer, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("value ==[c] %@"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v5));

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController visibleChoices](self, "visibleChoices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v9 = objc_msgSend(v7, "indexOfObject:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, 0));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)beginSearch
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchController](self, "searchController"));

  if (v3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController searchController](self, "searchController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchBar"));
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

- (void)selectNext
{
  void *v3;
  void *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  char *v8;
  char *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForSelectedRow"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  v5 = (uint64_t)objc_msgSend(v4, "numberOfRowsInSection:", 0);

  v6 = (char *)objc_msgSend(v11, "row");
  if (!v11 && v5 >= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
    v8 = 0;
LABEL_6:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, 0));
    objc_msgSend(v7, "selectRowAtIndexPath:animated:scrollPosition:", v10, 1, 2);

    goto LABEL_7;
  }
  v9 = v6 + 1;
  if ((uint64_t)(v6 + 1) < v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
    v8 = v9;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForSelectedRow"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  v5 = (uint64_t)objc_msgSend(v4, "numberOfRowsInSection:", 0);

  v6 = (uint64_t)objc_msgSend(v11, "row");
  if (!v11 && (v7 = v5 < 1, v8 = v5 - 1, !v7) || (v8 = v6 - 1, v6 >= 1))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, 0));
    objc_msgSend(v9, "selectRowAtIndexPath:animated:scrollPosition:", v10, 1, 2);

  }
}

- (void)commitSelection
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForSelectedRow"));

  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDetailTableViewController tableView](self, "tableView"));
    -[FBABugFormDetailTableViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v4, v5);

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
  _QWORD v10[4];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("f"), 0x100000, "beginSearch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SEARCH"), &stru_1000EA660, FBKCommonStrings));
  objc_msgSend(v2, "setDiscoverabilityTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputUpArrow, 0, "selectPrevious"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputDownArrow, 0, "selectNext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, "commitSelection"));
  v10[0] = v2;
  v10[1] = v5;
  v10[2] = v6;
  v10[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 4));

  return v8;
}

- (FBABugFormEditorDelegate)delegate
{
  return (FBABugFormEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

@end
