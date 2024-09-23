@implementation SearchToShareAppViewController

- (void)updateConstraintsForZKWBrowser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker view](self->_zkwPicker, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker view](self->_zkwPicker, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker view](self->_zkwPicker, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker view](self->_zkwPicker, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));

  -[NSMutableArray addObject:](self->_constraints, "addObject:", v23);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v12);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v17);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v22);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);

}

- (void)updateConstraintsForSearchBrowser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  id v22;

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController view](self->_searchBrowserRootViewController, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController view](self->_searchBrowserRootViewController, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController view](self->_searchBrowserRootViewController, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController view](self->_searchBrowserRootViewController, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));

  -[NSMutableArray addObject:](self->_constraints, "addObject:", v22);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v11);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v16);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v21);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);

}

- (void)awakeFromNib
{
  NSMutableArray *v3;
  NSMutableArray *recentResults;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchToShareAppViewController;
  -[SearchToShareAppViewController awakeFromNib](&v5, "awakeFromNib");
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  recentResults = self->_recentResults;
  self->_recentResults = v3;

  self->_updateRecents = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchToShareAppViewController;
  -[SearchToShareAppViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  -[SearchToShareAppViewController _setup](self, "_setup");
  -[SearchToShareAppViewController _updatePickerBottomInset](self, "_updatePickerBottomInset");
  -[STSPicker performZKWSearchQuery](self->_zkwPicker, "performZKWSearchQuery");
  -[STSSearchBrowserRootViewController fetchCategories](self->_searchBrowserRootViewController, "fetchCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
  objc_msgSend(v4, "searchViewDidAppearWithEvent:", 7);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchToShareAppViewController;
  -[SearchToShareAppViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[STSZKWBrowserHeaderView becomeFirstResponder](self->_zkwHeaderView, "becomeFirstResponder");
  -[SearchToShareAppViewController setEngagementFeedbackBlock:](self, "setEngagementFeedbackBlock:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchToShareAppViewController;
  -[SearchToShareAppViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  -[SearchToShareAppViewController setEngagementFeedbackBlock:](self, "setEngagementFeedbackBlock:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
  objc_msgSend(v4, "searchViewDidDisappear");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  STSSearchBrowserRootViewController *searchBrowserRootViewController;
  void *v9;
  STSSearchBrowserRootViewController *v10;
  void *v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SearchToShareAppViewController;
  -[SearchToShareAppViewController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker pickerView](self->_zkwPicker, "pickerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
  objc_msgSend(v4, "layoutMargins");
  objc_msgSend(v3, "setTopInset:");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker pickerView](self->_zkwPicker, "pickerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
  objc_msgSend(v6, "layoutMargins");
  objc_msgSend(v5, "setBottomInset:", v7);

  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
  objc_msgSend(v9, "layoutMargins");
  -[STSSearchBrowserRootViewController setTopInset:](searchBrowserRootViewController, "setTopInset:");

  v10 = self->_searchBrowserRootViewController;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
  objc_msgSend(v11, "layoutMargins");
  -[STSSearchBrowserRootViewController setBottomInset:](v10, "setBottomInset:", v12);

}

- (void)browser:(id)a3 didSelectCategoryResult:(id)a4
{
  -[SearchToShareAppViewController browserCategoryButtonClicked:result:](self, "browserCategoryButtonClicked:result:", a3, a4);
}

- (void)browser:(id)a3 didSelectProviderLink:(id)a4
{
  id v5;
  void *v6;
  id v7;

  if (a4)
  {
    v5 = a4;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController extensionContext](self, "extensionContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sts_providerHostPageURL"));

    objc_msgSend(v7, "openURL:completionHandler:", v6, 0);
  }
}

- (void)browser:(id)a3 didSelectResult:(id)a4 withPayload:(id)a5
{
  id v7;
  id v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;

  v7 = a4;
  v8 = a5;
  global_queue = dispatch_get_global_queue(-32768, 0);
  v10 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000022D8;
  block[3] = &unk_100008260;
  v11 = v8;
  v14 = v11;
  dispatch_async(v10, block);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageURL"));

  if (v12)
  {
    -[SearchToShareAppViewController _addResultToRecents:](self, "_addResultToRecents:", v7);
    self->_updateRecents = 1;
  }

}

- (void)browserSearchBarButtonClicked:(id)a3
{
  void *v4;
  void *v5;
  STSPicker *zkwPicker;
  STSSearchBrowserRootViewController *searchBrowserRootViewController;
  _QWORD v8[5];
  _QWORD v9[5];

  -[STSPicker cancelImageDownloads](self->_zkwPicker, "cancelImageDownloads", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController searchHeaderView](self->_searchBrowserRootViewController, "searchHeaderView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBar"));
  objc_msgSend(v5, "setText:", 0);

  -[STSSearchBrowserRootViewController showCategories](self->_searchBrowserRootViewController, "showCategories");
  zkwPicker = self->_zkwPicker;
  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000024D0;
  v9[3] = &unk_100008260;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000024D8;
  v8[3] = &unk_100008260;
  -[SearchToShareAppViewController _transitionContentFromViewController:toViewController:animations:completion:](self, "_transitionContentFromViewController:toViewController:animations:completion:", zkwPicker, searchBrowserRootViewController, v9, v8);
}

- (void)browser:(id)a3 didSearchFor:(id)a4
{
  id v5;
  STSPicker *zkwPicker;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[STSPicker cancelImageDownloads](self->_zkwPicker, "cancelImageDownloads");
  zkwPicker = self->_zkwPicker;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000025F8;
  v8[3] = &unk_100008288;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[SearchToShareAppViewController requestExpandedPresentationStyleForBrowser:completion:](self, "requestExpandedPresentationStyleForBrowser:completion:", zkwPicker, v8);

}

- (void)browserCategoryButtonClicked:(id)a3 result:(id)a4
{
  id v5;
  STSSearchBrowserRootViewController *searchBrowserRootViewController;
  void *v7;
  STSPicker *zkwPicker;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a4;
  -[STSPicker cancelImageDownloads](self->_zkwPicker, "cancelImageDownloads");
  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondaryTitle"));
  -[STSSearchBrowserRootViewController showPickerAndPerformQuery:requestType:](searchBrowserRootViewController, "showPickerAndPerformQuery:requestType:", v7, 5);

  zkwPicker = self->_zkwPicker;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100002814;
  v10[3] = &unk_100008288;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  -[SearchToShareAppViewController requestExpandedPresentationStyleForBrowser:completion:](self, "requestExpandedPresentationStyleForBrowser:completion:", zkwPicker, v10);

}

- (void)browserSuggestionButtonClicked:(id)a3 suggestion:(id)a4
{
  id v5;
  STSSearchBrowserRootViewController *searchBrowserRootViewController;
  void *v7;
  STSPicker *zkwPicker;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a4;
  -[STSPicker cancelImageDownloads](self->_zkwPicker, "cancelImageDownloads");
  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "query"));
  -[STSSearchBrowserRootViewController showPickerAndPerformQuery:requestType:](searchBrowserRootViewController, "showPickerAndPerformQuery:requestType:", v7, 3);

  zkwPicker = self->_zkwPicker;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000029F4;
  v10[3] = &unk_100008288;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  -[SearchToShareAppViewController requestExpandedPresentationStyleForBrowser:completion:](self, "requestExpandedPresentationStyleForBrowser:completion:", zkwPicker, v10);

}

- (BOOL)browserIsPresentedFullscreen:(id)a3
{
  return (id)-[SearchToShareAppViewController presentationStyle](self, "presentationStyle", a3) == (id)1;
}

- (void)requestExpandedPresentationStyleForBrowser:(id)a3 completion:(id)a4
{
  void (**v5)(void);

  v5 = (void (**)(void))a4;
  if ((id)-[SearchToShareAppViewController presentationStyle](self, "presentationStyle") != (id)1)
    -[SearchToShareAppViewController setRequestExpandedCompletion:](self, "setRequestExpandedCompletion:", v5);
  if (v5)
    v5[2]();

}

- (void)browserDidTapLogo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController parentViewController](self->_searchBrowserRootViewController, "parentViewController", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController searchHeaderView](self->_searchBrowserRootViewController, "searchHeaderView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchBar"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@?q=%@"), CFSTR("http://www.bing.com/images/search"), v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
    objc_msgSend(v11, "didEngageProviderLogo");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController extensionContext](self, "extensionContext"));
    objc_msgSend(v12, "openURL:completionHandler:", v10, 0);

  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("http://www.bing.com/images/search")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
    objc_msgSend(v13, "didEngageProviderLogo");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController extensionContext](self, "extensionContext"));
    objc_msgSend(v8, "openURL:completionHandler:", v14, 0);
  }

}

- (void)searchBrowserRootViewControllerDidSelectCancel:(id)a3
{
  STSSearchModel *zkwSearchModel;
  id v5;
  STSSearchModel *v6;
  STSSearchBrowserRootViewController *searchBrowserRootViewController;
  STSPicker *zkwPicker;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  if (self->_updateRecents)
  {
    self->_updateRecents = 0;
    zkwSearchModel = self->_zkwSearchModel;
    v5 = -[NSMutableArray copy](self->_recentResults, "copy", a3);
    -[STSSearchModel setRecentResults:](zkwSearchModel, "setRecentResults:", v5);

    v6 = self->_zkwSearchModel;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100002E3C;
    v11[3] = &unk_1000082B0;
    v11[4] = self;
    -[STSSearchModel performZKWSearchQueryWithCompletion:](v6, "performZKWSearchQueryWithCompletion:", v11);
  }
  else
  {
    searchBrowserRootViewController = self->_searchBrowserRootViewController;
    zkwPicker = self->_zkwPicker;
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100002F00;
    v10[3] = &unk_100008260;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002F08;
    v9[3] = &unk_100008260;
    -[SearchToShareAppViewController _transitionContentFromViewController:toViewController:animations:completion:](self, "_transitionContentFromViewController:toViewController:animations:completion:", searchBrowserRootViewController, zkwPicker, v10, v9);
  }
  -[STSSearchBrowserRootViewController setPresentationStyle:](self->_searchBrowserRootViewController, "setPresentationStyle:", 0);
}

- (void)updateRecentResults:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *recentResults;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  recentResults = self->_recentResults;
  self->_recentResults = v4;

  -[SearchToShareAppViewController saveRecents](self, "saveRecents");
}

- (void)_transitionContentFromViewController:(id)a3 toViewController:(id)a4 animations:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  double v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  SearchToShareAppViewController *v20;
  id v21;
  void (**v22)(_QWORD);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  -[SearchToShareAppViewController addChildViewController:](self, "addChildViewController:", v11);
  if (v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parentViewController"));

    if (!v14)
      -[SearchToShareAppViewController addChildViewController:](self, "addChildViewController:", v10);
    objc_msgSend(v10, "willMoveToParentViewController:", 0);
    if (v12)
      v15 = 0.25;
    else
      v15 = 0.0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100003124;
    v18[3] = &unk_1000082D8;
    v19 = v10;
    v20 = self;
    v21 = v11;
    v22 = v13;
    -[SearchToShareAppViewController transitionFromViewController:toViewController:duration:options:animations:completion:](self, "transitionFromViewController:toViewController:duration:options:animations:completion:", v19, v21, 5242880, v12, v18, v15);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchToShareAppViewController view](self, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    objc_msgSend(v16, "setContentView:", v17);

    objc_msgSend(v11, "didMoveToParentViewController:", self);
    if (v13)
      v13[2](v13);
  }

}

- (void)_setup
{
  id v3;
  uint64_t v4;
  id v5;
  STSSearchBrowserRootViewController *v6;
  STSSearchBrowserRootViewController *searchBrowserRootViewController;
  id v8;
  STSPicker *v9;
  STSPicker *zkwPicker;
  STSZKWBrowserHeaderView *v11;
  STSZKWBrowserHeaderView *zkwHeaderView;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *constraints;
  STSPicker *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSMutableArray **p_recentResults;
  NSMutableArray *v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];

  v3 = objc_msgSend(objc_alloc((Class)PARSessionConfiguration), "initWithId:userAgent:", CFSTR("Messages-searchToShare-session"), CFSTR("Messages/1.0"));
  objc_msgSend(v3, "setDontPreloadImages:", 1);
  v4 = objc_claimAutoreleasedReturnValue(+[PARSession sessionWithConfiguration:delegate:startImmediately:](PARSession, "sessionWithConfiguration:delegate:startImmediately:", v3, self, 1));
  v5 = objc_alloc_init((Class)STSSearchModel);
  objc_storeStrong((id *)&self->_searchBrowserSearchModel, v5);
  objc_msgSend(v5, "setParsecSession:", v4);
  v6 = (STSSearchBrowserRootViewController *)objc_msgSend(objc_alloc((Class)STSSearchBrowserRootViewController), "initWithSearchModel:", v5);
  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  self->_searchBrowserRootViewController = v6;

  -[STSSearchBrowserRootViewController setSelectionDelegate:](self->_searchBrowserRootViewController, "setSelectionDelegate:", self);
  -[STSSearchBrowserRootViewController setPickerSelectionDelegate:](self->_searchBrowserRootViewController, "setPickerSelectionDelegate:", self);
  v8 = objc_alloc_init((Class)STSSearchModel);
  objc_msgSend(v8, "setParsecSession:", v4);
  objc_storeStrong((id *)&self->_zkwSearchModel, v8);
  -[STSSearchModel setRecentsDelegate:](self->_zkwSearchModel, "setRecentsDelegate:", self);
  v9 = (STSPicker *)objc_msgSend(objc_alloc((Class)STSPicker), "initWithSearchModel:showSuggestions:", v8, 1);
  zkwPicker = self->_zkwPicker;
  self->_zkwPicker = v9;

  -[STSPicker setSelectionDelegate:](self->_zkwPicker, "setSelectionDelegate:", self);
  v11 = (STSZKWBrowserHeaderView *)objc_alloc_init((Class)STSZKWBrowserHeaderView);
  zkwHeaderView = self->_zkwHeaderView;
  self->_zkwHeaderView = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker pickerView](self->_zkwPicker, "pickerView"));
  objc_msgSend(v13, "setHeaderView:", self->_zkwHeaderView);

  -[STSZKWBrowserHeaderView setDelegate:](self->_zkwHeaderView, "setDelegate:", self->_zkwPicker);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
  objc_msgSend(v14, "setParsecSession:", v4);

  v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  constraints = self->_constraints;
  self->_constraints = v15;

  v17 = self->_zkwPicker;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100003530;
  v29[3] = &unk_100008260;
  v29[4] = self;
  -[SearchToShareAppViewController _transitionContentFromViewController:toViewController:animations:completion:](self, "_transitionContentFromViewController:toViewController:animations:completion:", 0, v17, v29, 0);
  v25 = (void *)v4;
  v26 = v3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v18, "setObject:forKey:", 0, CFSTR("STSRecentResults"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("STSRecentResults1")));
  v20 = objc_alloc_init((Class)NSMutableArray);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100003538;
  v27[3] = &unk_100008300;
  v27[4] = self;
  v21 = v20;
  v28 = v21;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v27);
  p_recentResults = &self->_recentResults;
  objc_storeStrong((id *)&self->_recentResults, v20);
  if (!self->_recentResults)
  {
    v23 = objc_opt_new(NSMutableArray);
    v24 = *p_recentResults;
    *p_recentResults = v23;

  }
  -[STSSearchModel setRecentResults:](self->_zkwSearchModel, "setRecentResults:");

  -[SearchToShareAppViewController updateConstraintsForZKWBrowser](self, "updateConstraintsForZKWBrowser");
}

- (void)_updatePickerBottomInset
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[STSPicker pickerView](self->_zkwPicker, "pickerView"));
  objc_msgSend(v2, "setBottomInset:", 44.0);

}

- (void)_addResultToRecents:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  NSMutableArray *recentResults;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resultType"));
  v5 = objc_msgSend(v4, "isEqualToString:", STSSearchModelResultTypeImage);

  v6 = v12;
  if (v5)
  {
    recentResults = self->_recentResults;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100003750;
    v13[3] = &unk_100008328;
    v8 = v12;
    v14 = v8;
    v9 = -[NSMutableArray indexOfObjectPassingTest:](recentResults, "indexOfObjectPassingTest:", v13);
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "setType:", 2);
      objc_msgSend(v8, "setFbr:", &stru_100008430);
      objc_msgSend(v8, "setSectionBundleIdentifier:", CFSTR("com.apple.parsec.image_search.msgs-zkw"));
      -[NSMutableArray insertObject:atIndex:](self->_recentResults, "insertObject:atIndex:", v8, 0);
      if ((unint64_t)-[NSMutableArray count](self->_recentResults, "count") >= 4)
        -[NSMutableArray removeLastObject](self->_recentResults, "removeLastObject");
    }
    else
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_recentResults, "objectAtIndex:", v9));
      objc_msgSend(v11, "setType:", 2);
      objc_msgSend(v11, "setFbr:", &stru_100008430);
      objc_msgSend(v11, "setSectionBundleIdentifier:", CFSTR("com.apple.parsec.image_search.msgs-zkw"));
      -[NSMutableArray removeObjectAtIndex:](self->_recentResults, "removeObjectAtIndex:", v10);
      -[NSMutableArray insertObject:atIndex:](self->_recentResults, "insertObject:atIndex:", v11, 0);

    }
    -[SearchToShareAppViewController saveRecents](self, "saveRecents");

    v6 = v12;
  }

}

- (void)saveRecents
{
  id v3;
  NSMutableArray *recentResults;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init((Class)NSMutableArray);
  recentResults = self->_recentResults;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000038A0;
  v8[3] = &unk_100008350;
  v8[4] = self;
  v7 = v3;
  v9 = v7;
  -[NSMutableArray enumerateObjectsUsingBlock:](recentResults, "enumerateObjectsUsingBlock:", v8);
  if (objc_msgSend(v7, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = objc_msgSend(v7, "copy");
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("STSRecentResults1"));

    objc_msgSend(v5, "synchronize");
  }

}

- (id)dictForSearchResult:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  id v30;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v4, "setObject:forKey:", CFSTR("image_search"), CFSTR("result-type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_100008430;
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("url"));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = &stru_100008430;
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("id"));

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeIdentifier"));
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = &stru_100008430;
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("store-identifier"));

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sts_appProviderName"));
    v16 = (void *)v15;
    if (v15)
      v17 = (const __CFString *)v15;
    else
      v17 = &stru_100008430;
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("app-provider-name"));

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sts_providerName"));
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = &stru_100008430;
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("desc-provider-name"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "thumbnail"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "urlValue"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "absoluteString"));
    v24 = (void *)v23;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = &stru_100008430;
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("thumbnail-url"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sts_providerHostPageURL"));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "absoluteString"));
    v28 = (void *)v27;
    if (v27)
      v29 = (const __CFString *)v27;
    else
      v29 = &stru_100008430;
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("meta-hostpage-url"));

    v30 = objc_msgSend(v4, "copy");
  }
  else
  {
    v30 = 0;
  }
  return v30;
}

- (id)searchResultForDict:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v26[2];

  v3 = a3;
  v4 = objc_alloc_init((Class)SFSearchResult);
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("result-type")));
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("image_search");
  objc_msgSend(v4, "setResultType:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("url")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
  objc_msgSend(v4, "setUrl:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("id")));
  objc_msgSend(v4, "setIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("store-identifier")));
  objc_msgSend(v4, "setStoreIdentifier:", v11);

  objc_msgSend(v4, "setType:", 2);
  objc_msgSend(v4, "setSectionBundleIdentifier:", CFSTR("com.apple.parsec.image_search.msgs-zkw"));
  v12 = objc_alloc((Class)SFURLImage);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("thumbnail-url")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
  v15 = objc_msgSend(v12, "initWithURL:", v14);

  objc_msgSend(v4, "setThumbnail:", v15);
  v16 = objc_alloc_init((Class)SFDescriptionCardSection);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("desc-provider-name")));
  objc_msgSend(v16, "setTitle:", v17);

  v18 = objc_alloc_init((Class)SFMetaInfoCardSection);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("meta-hostpage-url")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v19));
  objc_msgSend(v18, "setHostPageURL:", v20);

  v21 = objc_alloc_init((Class)SFCard);
  v26[0] = v16;
  v26[1] = v18;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
  objc_msgSend(v21, "setCardSections:", v22);

  v23 = objc_alloc_init((Class)SFPunchout);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("app-provider-name")));

  objc_msgSend(v23, "setLabel:", v24);
  objc_msgSend(v4, "setPunchout:", v23);
  objc_msgSend(v4, "setInlineCard:", v21);

  return v4;
}

- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5
{
  id v7;
  id v8;
  id v9;
  _BOOL4 v10;
  const char *v11;
  int v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      v12 = 138412290;
      v13 = v7;
      v11 = "session %@ parsec bag failed to load";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (v10)
  {
    v12 = 138412290;
    v13 = v7;
    v11 = "session %@ parsec bag loaded";
    goto LABEL_6;
  }

}

- (id)requestExpandedCompletion
{
  return self->_requestExpandedCompletion;
}

- (void)setRequestExpandedCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)engagementFeedbackBlock
{
  return self->_engagementFeedbackBlock;
}

- (void)setEngagementFeedbackBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_engagementFeedbackBlock, 0);
  objc_storeStrong(&self->_requestExpandedCompletion, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_recentResults, 0);
  objc_storeStrong((id *)&self->_searchBrowserSearchModel, 0);
  objc_storeStrong((id *)&self->_zkwSearchModel, 0);
  objc_storeStrong((id *)&self->_searchBrowserRootViewController, 0);
  objc_storeStrong((id *)&self->_zkwHeaderView, 0);
  objc_storeStrong((id *)&self->_zkwPicker, 0);
}

@end
