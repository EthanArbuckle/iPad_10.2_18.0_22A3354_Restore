@implementation STSMessagesAppViewController

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker view](self->_zkwPicker, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "superview"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker view](self->_zkwPicker, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker view](self->_zkwPicker, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
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
  void *v22;
  id v23;

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController view](self->_searchBrowserRootViewController, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController view](self->_searchBrowserRootViewController, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "superview"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController view](self->_searchBrowserRootViewController, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController view](self->_searchBrowserRootViewController, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));

  -[NSMutableArray addObject:](self->_constraints, "addObject:", v23);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v12);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v17);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v22);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);

}

- (void)awakeFromNib
{
  NSMutableArray *v3;
  NSMutableArray *recentResults;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSMessagesAppViewController;
  -[STSMessagesAppViewController awakeFromNib](&v5, "awakeFromNib");
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  recentResults = self->_recentResults;
  self->_recentResults = v3;

  self->_updateRecents = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STSMessagesAppViewController;
  -[STSMessagesAppViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[STSMessagesAppViewController _updatePickerBottomInset](self, "_updatePickerBottomInset");
}

- (void)viewDidLoad
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)viewDidAppear:(BOOL)a3
{
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSMessagesAppViewController;
  -[STSMessagesAppViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  if (+[UIScribbleInteraction isPencilInputExpected](UIScribbleInteraction, "isPencilInputExpected"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Launching app to expanded presentation because the user is expected to use handwriting", v4, 2u);
    }
    -[STSMessagesAppViewController requestPresentationStyle:](self, "requestPresentationStyle:", 1);
  }
  -[STSMessagesAppViewController setEngagementFeedbackBlock:](self, "setEngagementFeedbackBlock:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STSMessagesAppViewController;
  -[STSMessagesAppViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[STSMessagesAppViewController setEngagementFeedbackBlock:](self, "setEngagementFeedbackBlock:", 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  STSSearchBrowserRootViewController *searchBrowserRootViewController;
  void *v8;
  STSSearchBrowserRootViewController *v9;
  void *v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STSMessagesAppViewController;
  -[STSMessagesAppViewController viewDidLayoutSubviews](&v12, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker pickerView](self->_zkwPicker, "pickerView"));
  objc_msgSend(v3, "setTopInset:", 4.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker pickerView](self->_zkwPicker, "pickerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  objc_msgSend(v5, "layoutMargins");
  objc_msgSend(v4, "setBottomInset:", v6);

  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  objc_msgSend(v8, "layoutMargins");
  -[STSSearchBrowserRootViewController setTopInset:](searchBrowserRootViewController, "setTopInset:");

  v9 = self->_searchBrowserRootViewController;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  objc_msgSend(v10, "layoutMargins");
  -[STSSearchBrowserRootViewController setBottomInset:](v9, "setBottomInset:", v11);

}

- (void)willBecomeActiveWithConversation:(id)a3
{
  MSConversation **p_currentConversation;
  id v6;
  STSSearchModel *zkwSearchModel;
  void *v8;
  STSSearchModel *searchBrowserSearchModel;
  void *v10;
  id v11;

  p_currentConversation = &self->_currentConversation;
  objc_storeStrong((id *)&self->_currentConversation, a3);
  v6 = a3;
  -[STSMessagesAppViewController _setup](self, "_setup");
  zkwSearchModel = self->_zkwSearchModel;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSConversation conversationIdentifier](*p_currentConversation, "conversationIdentifier"));
  -[STSSearchModel setConversationID:](zkwSearchModel, "setConversationID:", v8);

  searchBrowserSearchModel = self->_searchBrowserSearchModel;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSConversation conversationIdentifier](*p_currentConversation, "conversationIdentifier"));
  -[STSSearchModel setConversationID:](searchBrowserSearchModel, "setConversationID:", v10);

  -[STSPicker performZKWSearchQuery](self->_zkwPicker, "performZKWSearchQuery");
  -[STSSearchBrowserRootViewController fetchCategories](self->_searchBrowserRootViewController, "fetchCategories");
  v11 = (id)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));

  objc_msgSend(v11, "searchViewDidAppearWithEvent:", 7);
}

- (void)willResignActiveWithConversation:(id)a3
{
  STSPicker *zkwPicker;
  id v5;
  void *v6;
  id v7;

  zkwPicker = self->_zkwPicker;
  v5 = a3;
  -[STSPicker willResignActiveWithConversation:](zkwPicker, "willResignActiveWithConversation:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController pickerViewController](self->_searchBrowserRootViewController, "pickerViewController"));
  objc_msgSend(v6, "willResignActiveWithConversation:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
  objc_msgSend(v7, "searchViewDidDisappear");

}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  STSSearchBrowserRootViewController **p_searchBrowserRootViewController;
  void *v6;
  void (**v7)(void);
  void *v8;

  p_searchBrowserRootViewController = &self->_searchBrowserRootViewController;
  -[STSSearchBrowserRootViewController setPresentationStyle:](self->_searchBrowserRootViewController, "setPresentationStyle:");
  if (a3 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController requestExpandedCompletion](self, "requestExpandedCompletion"));

    if (v6)
    {
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController requestExpandedCompletion](self, "requestExpandedCompletion"));
      v7[2]();

    }
  }
  -[STSMessagesAppViewController setRequestExpandedCompletion:](self, "setRequestExpandedCompletion:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController parentViewController](*p_searchBrowserRootViewController, "parentViewController"));

  if (!v8)
    p_searchBrowserRootViewController = &self->_zkwPicker;
  -[STSSearchBrowserRootViewController sendVisibleResultsFeedback](*p_searchBrowserRootViewController, "sendVisibleResultsFeedback");
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  STSSearchBrowserRootViewController *searchBrowserRootViewController;
  STSPicker *zkwPicker;
  id v11;
  _QWORD v12[5];

  if (!a3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController parentViewController](self->_searchBrowserRootViewController, "parentViewController"));
    if (v4
      && (v5 = (void *)v4,
          v6 = -[STSSearchBrowserRootViewController isPickerVisible](self->_searchBrowserRootViewController, "isPickerVisible"), v5, (v6 & 1) == 0))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController pickerViewController](self->_searchBrowserRootViewController, "pickerViewController"));
      objc_msgSend(v7, "willTransitionToPresentationStyle:", 0);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController pickerViewController](self->_searchBrowserRootViewController, "pickerViewController"));
      objc_msgSend(v8, "resetContent");

      searchBrowserRootViewController = self->_searchBrowserRootViewController;
      zkwPicker = self->_zkwPicker;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000264C;
      v12[3] = &unk_100008280;
      v12[4] = self;
      -[STSMessagesAppViewController _transitionContentFromViewController:toViewController:animations:completion:](self, "_transitionContentFromViewController:toViewController:animations:completion:", searchBrowserRootViewController, zkwPicker, v12, 0);
    }
    else
    {
      -[STSPicker willTransitionToPresentationStyle:](self->_zkwPicker, "willTransitionToPresentationStyle:", 0);
      v11 = (id)objc_claimAutoreleasedReturnValue(-[STSSearchBrowserRootViewController pickerViewController](self->_searchBrowserRootViewController, "pickerViewController"));
      objc_msgSend(v11, "willTransitionToPresentationStyle:", 0);

    }
  }
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  STSPicker *zkwPicker;
  void (**v4)(id, id);
  id v5;

  zkwPicker = self->_zkwPicker;
  v4 = (void (**)(id, id))a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[STSPicker snapshotImage](zkwPicker, "snapshotImage"));
  v4[2](v4, v5);

}

- (void)browser:(id)a3 didSelectCategoryResult:(id)a4
{
  -[STSMessagesAppViewController browserCategoryButtonClicked:result:](self, "browserCategoryButtonClicked:result:", a3, a4);
}

- (void)browser:(id)a3 didSelectProviderLink:(id)a4
{
  id v5;
  void *v6;
  id v7;

  if (a4)
  {
    v5 = a4;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController extensionContext](self, "extensionContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sts_providerHostPageURL"));

    objc_msgSend(v7, "openURL:completionHandler:", v6, 0);
  }
}

- (void)browser:(id)a3 didSelectResult:(id)a4 withPayload:(id)a5
{
  STSPicker *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  STSPicker *zkwPicker;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MSConversation *v19;
  void *v20;
  void *v21;
  MSConversation *currentConversation;
  void *v23;
  id v24;
  dispatch_time_t v25;
  _QWORD block[4];
  id v27;
  id location;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;

  v8 = (STSPicker *)a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "copy");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageURL"));

  if (v12)
  {
    zkwPicker = self->_zkwPicker;
    if (zkwPicker != v8)
      -[STSPicker resetContent](zkwPicker, "resetContent");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sts_appProviderName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeIdentifier"));
    v16 = v15;
    if (v15)
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v15, "integerValue")));
    else
      v17 = 0;
    currentConversation = self->_currentConversation;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageURL"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100002A0C;
    v32[3] = &unk_1000082A8;
    v32[4] = self;
    v33 = v9;
    -[MSConversation _insertAttachment:adamID:appName:completionHandler:](currentConversation, "_insertAttachment:adamID:appName:completionHandler:", v23, v17, v14, v32);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "videoURL"));

    if (v18)
    {
      v19 = self->_currentConversation;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "videoURL"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "absoluteString"));
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100002AE0;
      v31[3] = &unk_1000082D0;
      v31[4] = self;
      -[MSConversation insertText:completionHandler:](v19, "insertText:completionHandler:", v21, v31);

    }
    else
    {
      -[STSMessagesAppViewController requestPresentationStyle:](self, "requestPresentationStyle:", 0);
    }
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100002AEC;
  v29[3] = &unk_100008280;
  v30 = v11;
  v24 = v11;
  -[STSMessagesAppViewController setEngagementFeedbackBlock:](self, "setEngagementFeedbackBlock:", v29);
  objc_initWeak(&location, self);
  v25 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002B30;
  block[3] = &unk_1000082F8;
  objc_copyWeak(&v27, &location);
  dispatch_after(v25, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

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
  v9[2] = sub_100002C98;
  v9[3] = &unk_100008280;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002CA0;
  v8[3] = &unk_100008280;
  -[STSMessagesAppViewController _transitionContentFromViewController:toViewController:animations:completion:](self, "_transitionContentFromViewController:toViewController:animations:completion:", zkwPicker, searchBrowserRootViewController, v9, v8);
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
  v8[2] = sub_100002E04;
  v8[3] = &unk_100008320;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[STSMessagesAppViewController requestExpandedPresentationStyleForBrowser:completion:](self, "requestExpandedPresentationStyleForBrowser:completion:", zkwPicker, v8);

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
  v10[2] = sub_100003020;
  v10[3] = &unk_100008320;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  -[STSMessagesAppViewController requestExpandedPresentationStyleForBrowser:completion:](self, "requestExpandedPresentationStyleForBrowser:completion:", zkwPicker, v10);

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
  v10[2] = sub_100003200;
  v10[3] = &unk_100008320;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  -[STSMessagesAppViewController requestExpandedPresentationStyleForBrowser:completion:](self, "requestExpandedPresentationStyleForBrowser:completion:", zkwPicker, v10);

}

- (BOOL)browserIsPresentedFullscreen:(id)a3
{
  return -[STSMessagesAppViewController presentationStyle](self, "presentationStyle", a3) == (id)1;
}

- (void)requestExpandedPresentationStyleForBrowser:(id)a3 completion:(id)a4
{
  void (**v5)(void);

  v5 = (void (**)(void))a4;
  if (-[STSMessagesAppViewController presentationStyle](self, "presentationStyle") == (id)1)
  {
    if (v5)
      v5[2]();
  }
  else
  {
    -[STSMessagesAppViewController setRequestExpandedCompletion:](self, "setRequestExpandedCompletion:", v5);
    -[STSMessagesAppViewController requestPresentationStyle:](self, "requestPresentationStyle:", 1);
  }

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

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController extensionContext](self, "extensionContext"));
    objc_msgSend(v12, "openURL:completionHandler:", v10, 0);

  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("http://www.bing.com/images/search")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
    objc_msgSend(v13, "didEngageProviderLogo");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController extensionContext](self, "extensionContext"));
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
    v11[2] = sub_100003644;
    v11[3] = &unk_100008348;
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
    v10[2] = sub_100003708;
    v10[3] = &unk_100008280;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100003710;
    v9[3] = &unk_100008280;
    -[STSMessagesAppViewController _transitionContentFromViewController:toViewController:animations:completion:](self, "_transitionContentFromViewController:toViewController:animations:completion:", searchBrowserRootViewController, zkwPicker, v10, v9);
  }
}

- (BOOL)searchBrowserRootViewControllerSearchBarShouldBeginEditing:(id)a3
{
  id v4;
  BOOL v5;
  STSPicker *zkwPicker;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (-[STSMessagesAppViewController presentationStyle](self, "presentationStyle"))
  {
    v5 = 1;
  }
  else
  {
    zkwPicker = self->_zkwPicker;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100003808;
    v8[3] = &unk_100008280;
    v9 = v4;
    -[STSMessagesAppViewController requestExpandedPresentationStyleForBrowser:completion:](self, "requestExpandedPresentationStyleForBrowser:completion:", zkwPicker, v8);
    v5 = -[STSSearchBrowserRootViewController presentationStyle](self->_searchBrowserRootViewController, "presentationStyle") == (id)1;

  }
  return v5;
}

- (void)updateRecentResults:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *recentResults;
  int v7;
  id v8;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "updating recent results: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = (NSMutableArray *)objc_msgSend(v4, "mutableCopy");
  recentResults = self->_recentResults;
  self->_recentResults = v5;

  -[STSMessagesAppViewController saveRecents](self, "saveRecents");
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
  STSMessagesAppViewController *v20;
  id v21;
  void (**v22)(_QWORD);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  -[STSMessagesAppViewController addChildViewController:](self, "addChildViewController:", v11);
  if (v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parentViewController"));

    if (!v14)
      -[STSMessagesAppViewController addChildViewController:](self, "addChildViewController:", v10);
    objc_msgSend(v10, "willMoveToParentViewController:", 0);
    if (v12)
      v15 = 0.25;
    else
      v15 = 0.0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100003B7C;
    v18[3] = &unk_100008370;
    v19 = v10;
    v20 = self;
    v21 = v11;
    v22 = v13;
    -[STSMessagesAppViewController transitionFromViewController:toViewController:duration:options:animations:completion:](self, "transitionFromViewController:toViewController:duration:options:animations:completion:", v19, v21, 5242880, v12, v18, v15);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  STSZKWBrowserHeaderView *v35;
  STSZKWBrowserHeaderView *zkwHeaderView;
  void *v37;
  void *v38;
  NSMutableArray *v39;
  NSMutableArray *constraints;
  STSPicker *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  NSMutableArray **p_recentResults;
  NSMutableArray *v47;
  NSMutableArray *v48;
  STSSearchModel **p_zkwSearchModel;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[6];

  v3 = objc_msgSend(objc_alloc((Class)PARSessionConfiguration), "initWithId:userAgent:", CFSTR("Messages-searchToShare-session"), CFSTR("Messages/1.0"));
  objc_msgSend(v3, "setDontPreloadImages:", 1);
  v54 = v3;
  v4 = objc_claimAutoreleasedReturnValue(+[PARSession sessionWithConfiguration:delegate:startImmediately:](PARSession, "sessionWithConfiguration:delegate:startImmediately:", v3, self, 1));
  v5 = objc_alloc_init((Class)STSSearchModel);
  objc_storeStrong((id *)&self->_searchBrowserSearchModel, v5);
  v55 = (void *)v4;
  objc_msgSend(v5, "setParsecSession:", v4);
  v53 = v5;
  v6 = (STSSearchBrowserRootViewController *)objc_msgSend(objc_alloc((Class)STSSearchBrowserRootViewController), "initWithSearchModel:", v5);
  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  self->_searchBrowserRootViewController = v6;

  -[STSSearchBrowserRootViewController setSelectionDelegate:](self->_searchBrowserRootViewController, "setSelectionDelegate:", self);
  -[STSSearchBrowserRootViewController setPickerSelectionDelegate:](self->_searchBrowserRootViewController, "setPickerSelectionDelegate:", self);
  v8 = objc_alloc_init((Class)STSSearchModel);
  objc_msgSend(v8, "setParsecSession:", v4);
  objc_storeStrong((id *)&self->_zkwSearchModel, v8);
  p_zkwSearchModel = &self->_zkwSearchModel;
  -[STSSearchModel setRecentsDelegate:](self->_zkwSearchModel, "setRecentsDelegate:", self);
  v52 = v8;
  v9 = (STSPicker *)objc_msgSend(objc_alloc((Class)STSPicker), "initWithSearchModel:showSuggestions:", v8, 1);
  zkwPicker = self->_zkwPicker;
  self->_zkwPicker = v9;

  -[STSPicker setSelectionDelegate:](self->_zkwPicker, "setSelectionDelegate:", self);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController parentViewController](self, "parentViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController parentViewController](self, "parentViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "safeAreaLayoutGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v22));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController parentViewController](self, "parentViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v27));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[STSMessagesAppViewController parentViewController](self, "parentViewController"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v33));

  objc_msgSend(v51, "addObject:", v16);
  objc_msgSend(v51, "addObject:", v50);
  objc_msgSend(v51, "addObject:", v28);
  objc_msgSend(v51, "addObject:", v34);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v51);
  v35 = (STSZKWBrowserHeaderView *)objc_alloc_init((Class)STSZKWBrowserHeaderView);
  zkwHeaderView = self->_zkwHeaderView;
  self->_zkwHeaderView = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[STSPicker pickerView](self->_zkwPicker, "pickerView"));
  objc_msgSend(v37, "setHeaderView:", self->_zkwHeaderView);

  -[STSZKWBrowserHeaderView setDelegate:](self->_zkwHeaderView, "setDelegate:", self->_zkwPicker);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
  objc_msgSend(v38, "setParsecSession:", v55);

  v39 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  constraints = self->_constraints;
  self->_constraints = v39;

  v41 = self->_zkwPicker;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000041F8;
  v58[3] = &unk_100008280;
  v58[4] = self;
  -[STSMessagesAppViewController _transitionContentFromViewController:toViewController:animations:completion:](self, "_transitionContentFromViewController:toViewController:animations:completion:", 0, v41, 0, v58);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v42, "setObject:forKey:", 0, CFSTR("STSRecentResults"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKey:", CFSTR("STSRecentResults1")));
  v44 = objc_alloc_init((Class)NSMutableArray);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100004200;
  v56[3] = &unk_100008398;
  v56[4] = self;
  v45 = v44;
  v57 = v45;
  objc_msgSend(v43, "enumerateObjectsUsingBlock:", v56);
  p_recentResults = &self->_recentResults;
  objc_storeStrong((id *)p_recentResults, v44);
  if (!*p_recentResults)
  {
    v47 = objc_opt_new(NSMutableArray);
    v48 = *p_recentResults;
    *p_recentResults = v47;

  }
  -[STSSearchModel setRecentResults:](*p_zkwSearchModel, "setRecentResults:");

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
    v13[2] = sub_100004418;
    v13[3] = &unk_1000083C0;
    v8 = v12;
    v14 = v8;
    v9 = -[NSMutableArray indexOfObjectPassingTest:](recentResults, "indexOfObjectPassingTest:", v13);
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "setType:", 2);
      objc_msgSend(v8, "setFbr:", &stru_1000084C8);
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
      objc_msgSend(v11, "setFbr:", &stru_1000084C8);
      objc_msgSend(v11, "setSectionBundleIdentifier:", CFSTR("com.apple.parsec.image_search.msgs-zkw"));
      -[NSMutableArray removeObjectAtIndex:](self->_recentResults, "removeObjectAtIndex:", v10);
      -[NSMutableArray insertObject:atIndex:](self->_recentResults, "insertObject:atIndex:", v11, 0);

    }
    -[STSMessagesAppViewController saveRecents](self, "saveRecents");

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
  v8[2] = sub_100004558;
  v8[3] = &unk_1000083E8;
  v8[4] = self;
  v9 = v3;
  v7 = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](recentResults, "enumerateObjectsUsingBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v7, "copy");
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("STSRecentResults1"));

  objc_msgSend(v5, "synchronize");
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
      v8 = &stru_1000084C8;
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("url"));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = &stru_1000084C8;
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("id"));

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeIdentifier"));
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = &stru_1000084C8;
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("store-identifier"));

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sts_appProviderName"));
    v16 = (void *)v15;
    if (v15)
      v17 = (const __CFString *)v15;
    else
      v17 = &stru_1000084C8;
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("app-provider-name"));

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sts_providerName"));
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = &stru_1000084C8;
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("desc-provider-name"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "thumbnail"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "urlValue"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "absoluteString"));
    v24 = (void *)v23;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = &stru_1000084C8;
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("thumbnail-url"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sts_providerHostPageURL"));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "absoluteString"));
    v28 = (void *)v27;
    if (v27)
      v29 = (const __CFString *)v27;
    else
      v29 = &stru_1000084C8;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)engagementFeedbackBlock
{
  return self->_engagementFeedbackBlock;
}

- (void)setEngagementFeedbackBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
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
  objc_storeStrong((id *)&self->_currentConversation, 0);
}

@end
