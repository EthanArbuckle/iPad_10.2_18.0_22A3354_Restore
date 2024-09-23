@implementation iFBASurveyDetailViewController

- (iFBASurveyDetailViewController)initWithCoder:(id)a3
{
  iFBASurveyDetailViewController *v3;
  id v4;
  FBAAdaptiveWebView *v5;
  FBAAdaptiveWebView *webView;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *webViewHeightConstraint;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)iFBASurveyDetailViewController;
  v3 = -[iFBASurveyDetailViewController initWithCoder:](&v12, "initWithCoder:", a3);
  if (v3)
  {
    v4 = objc_alloc_init((Class)WKWebViewConfiguration);
    objc_msgSend(v4, "setSelectionGranularity:", 1);
    objc_msgSend(v4, "_setColorFilterEnabled:", 1);
    v5 = -[FBAAdaptiveWebView initWithFrame:configuration:]([FBAAdaptiveWebView alloc], "initWithFrame:configuration:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    webView = v3->_webView;
    v3->_webView = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[FBAAdaptiveWebView setBackgroundColor:](v3->_webView, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAAdaptiveWebView scrollView](v3->_webView, "scrollView"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    -[FBAAdaptiveWebView setNavigationDelegate:](v3->_webView, "setNavigationDelegate:", v3);
    webViewHeightConstraint = v3->_webViewHeightConstraint;
    v3->_webViewHeightConstraint = 0;

    v3->_isLoading = 0;
    v3->_isObserving = 0;

  }
  return v3;
}

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)iFBASurveyDetailViewController;
  -[iFBASurveyDetailViewController viewDidLoad](&v23, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setLargeTitleDisplayMode:", 2);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionView](self, "actionView"));
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionView](self, "actionView"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[iFBASurveyDetailViewController updateScrollView](self, "updateScrollView");
  -[iFBASurveyDetailViewController updateActionView](self, "updateActionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scrollView"));
  objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 0, off_1001151C0);

  objc_initWeak(&location, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mainQueueContext"));
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_100006BD8;
  v20 = &unk_1000E6190;
  objc_copyWeak(&v21, &location);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addObjectsDidChangeNotificationObserver:", &v17));
  -[iFBASurveyDetailViewController setDataChangeObserver:](self, "setDataChangeObserver:", v16, v17, v18, v19, v20);

  self->_isObserving = 1;
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  if (self->_isObserving)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notificationCenter"));
    objc_msgSend(v4, "removeObserver:", self);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notificationCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController dataChangeObserver](self, "dataChangeObserver"));
    objc_msgSend(v6, "removeObserver:", v7);

    -[iFBASurveyDetailViewController setDataChangeObserver:](self, "setDataChangeObserver:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollView"));
    objc_msgSend(v9, "removeObserver:forKeyPath:", self, CFSTR("contentSize"));

  }
  v10.receiver = self;
  v10.super_class = (Class)iFBASurveyDetailViewController;
  -[iFBASurveyDetailViewController dealloc](&v10, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if (off_1001151C0 == a6)
  {
    -[iFBASurveyDetailViewController updateWebViewFittingSize](self, "updateWebViewFittingSize", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)iFBASurveyDetailViewController;
    -[iFBASurveyDetailViewController observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (id)surveyBugForm
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController contentItem](self, "contentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "detailedItem"));

  return v3;
}

- (void)setContentItem:(id)a3
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];

  objc_storeStrong((id *)&self->_contentItem, a3);
  v5 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007194;
  v12[3] = &unk_1000E61B8;
  v12[4] = self;
  v6 = objc_retainBlock(v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController team](self, "team"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000071D0;
  v10[3] = &unk_1000E6208;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "refreshSurveyFromContentItem:forTeam:completion:", v5, v8, v10);

}

- (void)updateNavigation
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController surveyBugForm](self, "surveyBugForm"));
  if (v3
    && (v4 = (void *)v3,
        v5 = -[iFBASurveyDetailViewController isLoading](self, "isLoading"),
        v4,
        (v5 & 1) == 0))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController surveyBugForm](self, "surveyBugForm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v7, "setTitle:", v6);

  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v8, "setTitle:", &stru_1000EA660);
  }

}

- (void)updateScrollView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
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
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
      objc_msgSend(v8, "addSubview:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 7, 0, v12, 7, 1.0, 0.0));
      objc_msgSend(v10, "addConstraint:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 5, 0, v16, 5, 1.0, 0.0));
      objc_msgSend(v14, "addConstraint:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 3, 0, v20, 3, 1.0, 0.0));
      objc_msgSend(v18, "addConstraint:", v21);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionView](self, "actionView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "superview"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if ((v25 & 1) == 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionView](self, "actionView"));
      objc_msgSend(v26, "addSubview:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionView](self, "actionView"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 7, 0, v30, 7, 1.0, 0.0));
      objc_msgSend(v28, "addConstraint:", v31);

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionView](self, "actionView"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 5, 0, v34, 5, 1.0, 0.0));
      objc_msgSend(v32, "addConstraint:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionView](self, "actionView"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v37, 4, 0, v38, 3, 1.0, 0.0));
      objc_msgSend(v36, "addConstraint:", v39);

      v43 = (id)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController scrollView](self, "scrollView"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionView](self, "actionView"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, 4, 0, v41, 4, 1.0, 0.0));
      objc_msgSend(v43, "addConstraint:", v42);

    }
  }
}

- (void)updateWebView
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v3 = objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController surveyBugForm](self, "surveyBugForm"));
  if (v3
    && (v4 = (void *)v3,
        v5 = -[iFBASurveyDetailViewController isLoading](self, "isLoading"),
        v4,
        (v5 & 1) == 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
    objc_msgSend(v10, "setScrollEnabled:", 0);

    v14 = (id)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController surveyBugForm](self, "surveyBugForm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fullAnnouncementHTML"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants appleSeedURL](iFBAConstants, "appleSeedURL"));
    v13 = objc_msgSend(v14, "loadHTMLString:baseURL:", v11, v12);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("about://blank")));
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v6));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
    v8 = objc_msgSend(v7, "loadRequest:", v14);
  }

}

- (void)updateWebViewFittingSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scrollView"));
  objc_msgSend(v7, "contentSize");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scrollView"));
  objc_msgSend(v11, "contentInset");
  v13 = v12;
  v15 = v14;

  if (v5 >= v9)
    v16 = v5;
  else
    v16 = v9;
  -[iFBASurveyDetailViewController updateWebViewHeight:](self, "updateWebViewHeight:", v15 + v16 + v13);
}

- (void)updateActionView
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v3 = objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController surveyBugForm](self, "surveyBugForm"));
  if (v3
    && (v4 = (void *)v3,
        v5 = -[iFBASurveyDetailViewController isLoading](self, "isLoading"),
        v4,
        (v5 & 1) == 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionButton](self, "actionButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController surveyBugForm](self, "surveyBugForm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController team](self, "team"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "surveyActionTextForTeam:", v9));
    objc_msgSend(v7, "setTitle:forState:", v10, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController surveyBugForm](self, "surveyBugForm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController team](self, "team"));
    v13 = objc_msgSend(v11, "canTakeForTeam:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionButton](self, "actionButton"));
    objc_msgSend(v14, "setEnabled:", v13);

    v15 = (id)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionButton](self, "actionButton"));
    objc_msgSend(v15, "setHidden:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionButton](self, "actionButton"));
    objc_msgSend(v6, "setHidden:", 1);

    v15 = (id)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController actionButton](self, "actionButton"));
    objc_msgSend(v15, "setTitle:forState:", &stru_1000EA660, 0);
  }

}

- (void)updateWebViewHeight:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webViewHeightConstraint](self, "webViewHeightConstraint"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webViewHeightConstraint](self, "webViewHeightConstraint"));
    objc_msgSend(v6, "constant");
    v8 = vabdd_f64(v7, a3);

    if (v8 <= 4.0)
      return;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webViewHeightConstraint](self, "webViewHeightConstraint"));
    objc_msgSend(v12, "setConstant:", a3);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 8, 0, 0, 0, 1.0, a3));
    -[iFBASurveyDetailViewController setWebViewHeightConstraint:](self, "setWebViewHeightConstraint:", v10);

    v12 = (id)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webView](self, "webView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController webViewHeightConstraint](self, "webViewHeightConstraint"));
    objc_msgSend(v12, "addConstraint:", v11);

  }
}

- (void)didPressTakeSurveyButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController surveyBugForm](self, "surveyBugForm", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController surveyBugForm](self, "surveyBugForm"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBADraftManager sharedInstance](FBADraftManager, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController contentItem](self, "contentItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBASurveyDetailViewController team](self, "team"));
    objc_msgSend(v5, "beginFeedbackForSurvey:contentItem:forTeam:", v8, v6, v7);

  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_opt_class(FBAAdaptiveWebView);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    objc_msgSend(v5, "updateViewport");

}

- (FBKContentItem)contentItem
{
  return self->_contentItem;
}

- (FBKTeam)team
{
  return self->_team;
}

- (void)setTeam:(id)a3
{
  objc_storeStrong((id *)&self->_team, a3);
}

- (UIView)actionView
{
  return self->_actionView;
}

- (void)setActionView:(id)a3
{
  objc_storeStrong((id *)&self->_actionView, a3);
}

- (UIButton)actionButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_actionButton);
}

- (void)setActionButton:(id)a3
{
  objc_storeWeak((id *)&self->_actionButton, a3);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (FBAAdaptiveWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (NSLayoutConstraint)webViewHeightConstraint
{
  return self->_webViewHeightConstraint;
}

- (void)setWebViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_webViewHeightConstraint, a3);
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (NSObject)dataChangeObserver
{
  return self->_dataChangeObserver;
}

- (void)setDataChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_dataChangeObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataChangeObserver, 0);
  objc_storeStrong((id *)&self->_webViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_actionButton);
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_team, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end
