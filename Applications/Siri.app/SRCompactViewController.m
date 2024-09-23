@implementation SRCompactViewController

- (SRCompactViewController)init
{
  SRCompactViewController *v2;
  SiriSharedUIViewStackContainerController *v3;
  SiriSharedUIViewStackContainerController *viewStackContainerController;
  SiriSharedUICompactResultViewController *v5;
  SiriSharedUICompactResultViewController *resultViewController;
  SRCompactTextRequestViewController *v7;
  SRCompactTextRequestViewController *textRequestViewController;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  SiriUINavigationController *v13;
  SiriUINavigationController *navigationController;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  SiriSharedUICompactHostingInstrumentationSupplement *v22;
  SiriSharedUICompactHostingInstrumentationSupplement *instrumentationSupplement;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SRCompactViewController;
  v2 = -[SRCompactViewController initWithNibName:bundle:](&v25, "initWithNibName:bundle:", 0, 0);
  if (v2)
  {
    v3 = (SiriSharedUIViewStackContainerController *)objc_alloc_init((Class)SiriSharedUIViewStackContainerController);
    viewStackContainerController = v2->_viewStackContainerController;
    v2->_viewStackContainerController = v3;

    v5 = (SiriSharedUICompactResultViewController *)objc_alloc_init((Class)SiriSharedUICompactResultViewController);
    resultViewController = v2->_resultViewController;
    v2->_resultViewController = v5;

    v7 = objc_alloc_init(SRCompactTextRequestViewController);
    textRequestViewController = v2->_textRequestViewController;
    v2->_textRequestViewController = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController view](v2->_textRequestViewController, "view"));
    objc_msgSend(v9, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(v9, v10));

    v11 = objc_alloc((Class)SiriUINavigationController);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _viewStackContainerController](v2, "_viewStackContainerController"));
    v13 = (SiriUINavigationController *)objc_msgSend(v11, "initWithRootViewController:", v12);
    navigationController = v2->_navigationController;
    v2->_navigationController = v13;

    -[SiriUINavigationController setDelegate:](v2->_navigationController, "setDelegate:", v2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController view](v2->_navigationController, "view"));
    objc_msgSend(v15, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(v15, v16));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController navigationBar](v2->_navigationController, "navigationBar"));
    objc_msgSend(v17, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(v17, v18));

    v2->_siriViewControllerIsEditing = 0;
    v19 = objc_alloc_init((Class)SiriUIBackgroundBlurViewController);
    -[SRCompactViewController setBackgroundBlurViewController:](v2, "setBackgroundBlurViewController:", v19);

    -[SRCompactTextRequestViewController setDelegate:](v2->_textRequestViewController, "setDelegate:", v2);
    v20 = objc_alloc((Class)SiriSharedUICompactHostingInstrumentationSupplement);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _instrumentationManager](v2, "_instrumentationManager"));
    v22 = (SiriSharedUICompactHostingInstrumentationSupplement *)objc_msgSend(v20, "initWithInstrumentationManager:", v21);
    instrumentationSupplement = v2->_instrumentationSupplement;
    v2->_instrumentationSupplement = v22;

    -[SRCompactViewController _registerForAmbientPresentationTraitChange](v2, "_registerForAmbientPresentationTraitChange");
  }
  return v2;
}

- (SiriSharedUICompactView)_compactView
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
  objc_opt_class(SiriSharedUICompactView, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Expected -view to return an SiriSharedUICompactView instance, but got %@ instead"), v2));
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v6, 0));

    objc_exception_throw(v7);
  }
  return (SiriSharedUICompactView *)v2;
}

- (void)updateTopInset:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  _QWORD *v8;
  _QWORD v9[6];
  _QWORD v10[5];

  v4 = a4;
  self->_topInset = a3;
  if ((char *)objc_msgSend(UIApp, "activeInterfaceOrientation") - 1 <= (char *)1)
  {
    v7 = 0.3;
    if (!v4)
      v7 = 0.0;
    if (self->_isDrilledIntoSnippet)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10001EDF4;
      v10[3] = &unk_1001225C0;
      v10[4] = self;
      v8 = v10;
    }
    else
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10001EE7C;
      v9[3] = &unk_1001225E8;
      v9[4] = self;
      *(double *)&v9[5] = a3;
      v8 = v9;
    }
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, v7);
  }
}

- (void)loadView
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double y;
  double width;
  double height;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  id v20;
  id v21;
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
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[SRCompactViewController loadView]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController backgroundBlurViewController](self, "backgroundBlurViewController"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v31 = v4;
  -[SRCompactViewController addChildViewController:](self, "addChildViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v27 = v5;
  -[SRCompactViewController addChildViewController:](self, "addChildViewController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _viewStackContainerController](self, "_viewStackContainerController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewStackContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _resultViewController](self, "_resultViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "compactResultView"));
  v25 = v7;
  v26 = v6;
  objc_msgSend(v6, "addChildViewController:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _textRequestViewController](self, "_textRequestViewController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  if (v8)
    -[SRCompactViewController addChildViewController:](self, "addChildViewController:", v8);
  v24 = v8;
  v9 = objc_alloc((Class)SiriSharedUICompactConversationView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SiriSharedUITranscriptItem additionalContentViewPlatterCategories](SiriSharedUITranscriptItem, "additionalContentViewPlatterCategories"));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(objc_alloc((Class)SiriSharedUICompactAdditionalContentView), "initWithFrame:platterCategory:", objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), "integerValue"), CGRectZero.origin.x, y, width, height);
        objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v17);
  }

  v21 = objc_msgSend(objc_alloc((Class)SiriSharedUICompactView), "initWithFrame:backgroundBlurView:navigationView:resultView:conversationView:additionalContentViews:textRequestView:viewStackContainer:", v30, v29, v23, v13, v14, v22, CGRectZero.origin.x, y, width, height, v28);
  objc_msgSend(v21, "setAutoresizingMask:", 18);
  objc_msgSend(v21, "setDelegate:", self);
  objc_msgSend(v31, "didMoveToParentViewController:", self);
  objc_msgSend(v27, "didMoveToParentViewController:", self);
  objc_msgSend(v25, "didMoveToParentViewController:", v26);
  objc_msgSend(v24, "didMoveToParentViewController:", self);
  -[SRCompactViewController setView:](self, "setView:", v21);

}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int IsPad;
  SRCardStackNavigationTransitionController *v8;
  void *v9;
  SRCardStackNavigationTransitionController *v10;
  uint64_t v11;
  id v12;
  SRBarSlideNavigationTransitionController *v13;
  SRBlurFromRootNavigationTransitionController *v14;
  void *v15;
  SiriSharedUIPanDismissalGestureRecognizer *v16;
  SiriSharedUIPanDismissalGestureRecognizer *dismissalPanGestureRecognizer;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SRCompactViewController;
  -[SRCompactViewController viewDidLoad](&v25, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
  objc_msgSend(v3, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(v3, v4));

  IsPad = SiriUIDeviceIsPad(v5, v6);
  if (IsPad)
  {
    v8 = [SRCardStackNavigationTransitionController alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _resultViewController](self, "_resultViewController"));
    v10 = -[SRCardStackNavigationTransitionController initWithCompactResultViewController:](v8, "initWithCompactResultViewController:", v9);

    -[SRCompactViewController _setNavigationStackLayoutController:](self, "_setNavigationStackLayoutController:", v10);
    v11 = 2;
  }
  else
  {
    v12 = objc_alloc((Class)SiriUIMultiNavigationTransitionController);
    v13 = objc_alloc_init(SRBarSlideNavigationTransitionController);
    v10 = (SRCardStackNavigationTransitionController *)objc_msgSend(v12, "initWithPrimaryTransitionController:", v13);

    v14 = -[SRBlurFromRootNavigationTransitionController initWithDelegate:]([SRBlurFromRootNavigationTransitionController alloc], "initWithDelegate:", self);
    -[SRCardStackNavigationTransitionController addAdditionalCoordinationController:](v10, "addAdditionalCoordinationController:", v14);

    v11 = 1;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
  objc_msgSend(v15, "setTransitionController:", v10);

  v16 = (SiriSharedUIPanDismissalGestureRecognizer *)objc_msgSend(objc_alloc((Class)SiriSharedUIPanDismissalGestureRecognizer), "initWithDismissalDelegate:dismissalStyle:", self, v11);
  dismissalPanGestureRecognizer = self->_dismissalPanGestureRecognizer;
  self->_dismissalPanGestureRecognizer = v16;

  if (IsPad)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
    objc_msgSend(v19, "setAllowsGroupOpacity:", 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
    objc_msgSend(v20, "addGestureRecognizer:", self->_dismissalPanGestureRecognizer);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "resultView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "hostingView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
    objc_msgSend(v23, "setAllowsGroupOpacity:", 0);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "resultView"));
    objc_msgSend(v24, "setDismissalGestureRecognizer:", self->_dismissalPanGestureRecognizer);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v15.receiver = self;
  v15.super_class = (Class)SRCompactViewController;
  -[SRCompactViewController viewWillAppear:](&v15, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = sub_10000B664();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "addObserver:selector:name:object:", self, "_updateKeyboardStateFromNotification:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), 0, (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_keyboardWillShowForAmbient:", UIKeyboardWillShowNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_keyboardWillHideForAmbient:", UIKeyboardWillHideNotification, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double v5;
  void *v6;
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SRCompactViewController;
  -[SRCompactViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  objc_msgSend(v4, "systemUptime");
  self->_presentationTime = v5;

  if (-[SRCompactViewController _alwaysObscureBackgroundContentWhenActive](self, "_alwaysObscureBackgroundContentWhenActive"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
    objc_msgSend(v6, "viewController:requestsHostBackgroundBlurVisible:reason:fence:", self, 1, 1, 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "viewControllerDidPresentUserInterface:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SRCompactViewController;
  -[SRCompactViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  -[SRCompactEditableUtterancePresenter dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:](self->_editableUtterancePresenter, "dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:", 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v4, "viewControllerViewWillDisappear:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v29.receiver = self;
  v29.super_class = (Class)SRCompactViewController;
  -[SRCompactViewController viewDidDisappear:](&v29, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _speechRecognitionHypothesis](self, "_speechRecognitionHypothesis"));

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRUIFSpeechRecognitionHypothesis backingAceObject](self->_speechRecognitionHypothesis, "backingAceObject"));
    objc_msgSend(WeakRetained, "compactViewController:viewDidDisappearForAceObject:", self, v6);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = self->_serverUtterances;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v11);
        v13 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v13, "compactViewController:viewDidDisappearForAceObject:", self, v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = sub_10000B664();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v14, "removeObserver:name:object:", self, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v20), 0, (_QWORD)v21);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v18);
  }

  objc_msgSend(v14, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);
  objc_msgSend(v14, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);
  -[SRCompactViewController _setKeyboardState:](self, "_setKeyboardState:", 0);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SRCompactViewController;
  -[SRCompactViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  -[SRCompactViewController _updateCompactViewSize](self, "_updateCompactViewSize");
}

- (void)_updateCompactViewSize
{
  void *v3;
  void *v4;
  int IsMac;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double Height;
  double v27;
  void *v28;
  CGRect v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if ((SiriSharedUIDeviceIsPad() & 1) != 0)
  {
    v4 = v28;
  }
  else
  {
    IsMac = SiriSharedUIDeviceIsMac();
    v4 = v28;
    if (!IsMac)
      goto LABEL_9;
  }
  if (v4)
  {
    objc_msgSend(v4, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "windowScene"));
    v15 = SiriSharedUICompactSlideOverContentSpacingOnPad(objc_msgSend(v14, "interfaceOrientation"), v7, v9, v11, v13);
    v17 = v16;

    v18 = v15 + v17 + SiriSharedUICompactLeftPaddingForShadowOutsetsiPad;
    LODWORD(v14) = SiriLanguageIsRTL(v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
    v22 = v7;
    v23 = v9;
    v24 = v11;
    v25 = v13;
    if ((_DWORD)v14)
    {
      Height = CGRectGetHeight(*(CGRect *)&v22);
      v27 = 0.0;
    }
    else
    {
      v27 = CGRectGetWidth(*(CGRect *)&v22) - v18;
      v29.origin.x = v7;
      v29.origin.y = v9;
      v29.size.width = v11;
      v29.size.height = v13;
      Height = CGRectGetHeight(v29);
    }
    objc_msgSend(v21, "setFrame:", v27, 0.0, v18, Height);

    v4 = v28;
  }
LABEL_9:

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)SRCompactViewController;
  v7 = a4;
  -[SRCompactViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  -[SRCompactViewController _updateAmbientAvailability](self, "_updateAmbientAvailability");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationStackLayoutController](self, "_navigationStackLayoutController"));
  v9[4] = v8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001FCEC;
  v10[3] = &unk_100122D00;
  v10[4] = v8;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001FCF4;
  v9[3] = &unk_100122D00;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, v9);

}

- (void)compactViewModelDidChange:(id)a3 withDiff:(unint64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t Description;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  unsigned int v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *i;
  id v23;
  int v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  int v34;
  int v35;
  BOOL v36;
  id v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45[2];
  char v46;
  BOOL v47;
  BOOL v48;
  BOOL v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  void *v63;

  v39 = a4;
  v4 = a3;
  v37 = objc_msgSend(v4, "inputType");
  v43 = v4;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resultTranscriptItems"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversationTranscriptItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "additionalPlatterTranscriptItems"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serverUtterances"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "speechRecognitionHypothesis"));
  v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    Description = SiriSharedUIViewModelInputTypeGetDescription(v37);
    v9 = (void *)objc_claimAutoreleasedReturnValue(Description);
    *(_DWORD *)buf = 136315394;
    v61 = "-[SRCompactViewController compactViewModelDidChange:withDiff:]";
    v62 = 2112;
    v63 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #compact Setting input type to : %@", buf, 0x16u);

  }
  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v61 = "-[SRCompactViewController compactViewModelDidChange:withDiff:]";
    v62 = 2112;
    v63 = v42;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #compact Setting active transcript items to : %@", buf, 0x16u);
  }
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v61 = "-[SRCompactViewController compactViewModelDidChange:withDiff:]";
    v62 = 2112;
    v63 = v38;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #compact Setting active conversation transcript items to : %@", buf, 0x16u);
  }
  v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v61 = "-[SRCompactViewController compactViewModelDidChange:withDiff:]";
    v62 = 2112;
    v63 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #compact Setting additional active platter transcript items to : %@", buf, 0x16u);
  }
  v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v61 = "-[SRCompactViewController compactViewModelDidChange:withDiff:]";
    v62 = 2112;
    v63 = v41;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #compact Setting server utterances to : %@", buf, 0x16u);
  }
  v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v61 = "-[SRCompactViewController compactViewModelDidChange:withDiff:]";
    v62 = 2112;
    v63 = v40;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #compact Setting speech recognition hypothesis to : %@", buf, 0x16u);
  }
  v36 = objc_msgSend(v42, "count") != 0;
  v15 = -[SRCompactViewController requireFinalSpeechHypothesisBeforeAppearance](self, "requireFinalSpeechHypothesisBeforeAppearance");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "userUtterance"));

  if (v15 && (objc_msgSend(v40, "isFinal") & 1) != 0)
    v17 = 1;
  else
    v17 = v15 ^ 1;
  if (!v16)
    v17 = 0;
  v35 = v17;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v18 = v5;
  v19 = 0;
  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v21)
          objc_enumerationMutation(v18);
        v19 += (uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i), "count");
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v41, "count") && self->_isInAmbient)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v23 = v41;
    v24 = 0;
    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(_QWORD *)v51 != v26)
            objc_enumerationMutation(v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j), "dialogIdentifier"));
          v29 = objc_msgSend(v28, "isEqual:", CFSTR("PlaybackControls#SilenceInterstitials"));

          if (v29)
            LOBYTE(v24) = 1;
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v25);
      v24 &= 1u;
    }

  }
  else
  {
    v24 = 0;
  }
  if (objc_msgSend(v42, "count") || objc_msgSend(v38, "count") || v19 > 0)
    goto LABEL_41;
  v33 = objc_msgSend(v41, "count");
  v34 = v24 ^ 1;
  if (!v33)
    v34 = 0;
  if ((v34 | v35) == 1)
  {
LABEL_41:
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
    objc_msgSend(v30, "didPresentContentForCompactViewController:", self);

  }
  if ((v39 & 1) != 0 && objc_msgSend(v42, "count"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
    objc_msgSend(v31, "didBeginProcessingConversationItems");

  }
  objc_initWeak((id *)buf, self);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
  objc_copyWeak(v45, (id *)buf);
  v46 = v39 & 1;
  v45[1] = v37;
  v47 = (v39 & 0x2F) != 0;
  v48 = v36;
  v49 = (v39 & 0x20) != 0;
  objc_msgSend(v32, "prepareForUpdatesWithDiff:updateBlock:");

  objc_destroyWeak(v45);
  objc_destroyWeak((id *)buf);

}

- (BOOL)requireFinalSpeechHypothesisBeforeAppearance
{
  return !self->_isInAmbient;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[SRCompactViewController _updateStatusViewVisibility](self, "_updateStatusViewVisibility");
}

- (BOOL)_updateActiveTranscriptItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSArray *v8;
  NSArray *activeTranscriptItems;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  _UNKNOWN **v15;
  void *i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  SRCompactViewController *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  BOOL v31;
  SRCompactResultPlatterViewController *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *j;
  void *v40;
  uint64_t v41;
  void *v43;
  id v44;
  NSArray *obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  id v59;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
  if (-[NSArray isEqualToArray:](self->_activeTranscriptItems, "isEqualToArray:", v4))
  {
LABEL_19:
    objc_msgSend(v5, "setShowSnippetView:animated:", 1, 1);
    v31 = 0;
    goto LABEL_33;
  }
  if (!-[SRCompactViewController contentDiffersBetweenItems:andItems:](self, "contentDiffersBetweenItems:andItems:", self->_activeTranscriptItems, v4))
  {
    v30 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v57 = "-[SRCompactViewController _updateActiveTranscriptItems:]";
      v58 = 2112;
      v59 = v4;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s #compact: Transcript items %@ have the same content, not updating our compact view", buf, 0x16u);
    }
    goto LABEL_19;
  }
  v43 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
  v7 = objc_msgSend(v6, "popToRootViewControllerAnimated:", 1);

  v44 = v4;
  v8 = (NSArray *)objc_msgSend(v4, "copy");
  activeTranscriptItems = self->_activeTranscriptItems;
  self->_activeTranscriptItems = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = self->_activeTranscriptItems;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v51;
    v15 = NSArray_ptr;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v14)
          objc_enumerationMutation(obj);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i), "viewController"));
        objc_msgSend(v10, "addObject:", v17);
        objc_opt_class(v15[215], v18);
        if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
        {
          v20 = v14;
          v21 = v10;
          v22 = v13;
          v23 = v17;
          v24 = self;
          objc_msgSend(v23, "setDelegate:", self);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sashItem"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "applicationBundleIdentifier"));

          objc_opt_class(_TtC4Siri34SiriUIVisualResponseViewController, v27);
          if ((objc_opt_isKindOfClass(v23, v28) & 1) != 0)
          {
            v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "appBundleId"));

            v26 = (void *)v29;
          }

          v13 = v26;
          self = v24;
          v10 = v21;
          v14 = v20;
          v15 = NSArray_ptr;
        }
        if ((objc_opt_respondsToSelector(v17, "setIsInAmbient:") & 1) != 0)
          objc_msgSend(v17, "setIsInAmbient:", self->_isInAmbient);

      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  v5 = v43;
  if (self->_isInAmbient)
    objc_msgSend(v43, "configureAmbientAppIconForBundleIdentifier:", v13);
  v32 = objc_alloc_init(SRCompactResultPlatterViewController);
  -[SRCompactResultPlatterViewController setSiriContentViewControllers:](v32, "setSiriContentViewControllers:", v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _resultViewController](self, "_resultViewController"));
  objc_msgSend(v33, "setContentPlatterViewController:", v32);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v34 = v10;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v35)
  {
    v37 = v35;
    v38 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v37; j = (char *)j + 1)
      {
        if (*(_QWORD *)v47 != v38)
          objc_enumerationMutation(v34);
        v40 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
        objc_opt_class(_TtC4Siri34SiriUIVisualResponseViewController, v36);
        if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0)
          objc_msgSend(v40, "updateBackgroundIfNeeded");
      }
      v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v37);
  }

  v31 = 1;
  v4 = v44;
LABEL_33:

  return v31;
}

- (void)_setActiveConversationTranscriptItems:(id)a3
{
  id v4;
  NSObject *v5;
  NSArray *v6;
  NSArray *activeConversationTranscriptItems;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  unsigned int v20;
  char v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;

  v4 = a3;
  if (-[NSArray isEqualToArray:](self->_activeConversationTranscriptItems, "isEqualToArray:", v4)
    || !-[SRCompactViewController contentDiffersBetweenItems:andItems:](self, "contentDiffersBetweenItems:andItems:", v4, self->_activeConversationTranscriptItems))
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[SRCompactViewController _setActiveConversationTranscriptItems:]";
      v35 = 2112;
      v36 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: Conversation Transcript has the same content, not updating our compact view for items: %@", buf, 0x16u);
    }
  }
  v26 = v4;
  v6 = (NSArray *)objc_msgSend(v4, "copy");
  activeConversationTranscriptItems = self->_activeConversationTranscriptItems;
  self->_activeConversationTranscriptItems = v6;

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = self->_activeConversationTranscriptItems;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewController"));
        v15 = v14;
        if (v14)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parentViewController"));

          if (!v16)
            -[SiriSharedUIViewStackContainerController addChildViewController:](self->_viewStackContainerController, "addChildViewController:", v15);
          objc_opt_class(SiriUISnippetViewController, v17);
          if ((objc_opt_isKindOfClass(v15, v18) & 1) != 0)
          {
            v19 = v15;
            v20 = objc_msgSend(v13, "isHintItem");
            if (v20)
              objc_msgSend(v19, "setIsHint:", 1);
            objc_msgSend(v19, "setDelegate:", self);

          }
          else
          {
            LOBYTE(v20) = 0;
          }
          if ((objc_opt_respondsToSelector(v15, "setIsInAmbient:") & 1) != 0)
            objc_msgSend(v15, "setIsInAmbient:", self->_isInAmbient);
          v21 = v20 ^ 1;
          if (!self->_isInAmbient)
            v21 = 1;
          if ((v21 & 1) != 0)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
            objc_msgSend(v27, "addObject:", v23);

            if (v16)
              goto LABEL_26;
LABEL_29:
            objc_msgSend(v15, "didMoveToParentViewController:", self->_viewStackContainerController);
            goto LABEL_26;
          }
          v22 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v34 = "-[SRCompactViewController _setActiveConversationTranscriptItems:]";
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s #ambient removed hint view in ambient mode from conversationSnippets", buf, 0xCu);
          }
          if (!v16)
            goto LABEL_29;
        }
LABEL_26:

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v10 = v24;
    }
    while (v24);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
  objc_msgSend(v25, "setConversationSnippetViews:", v27);

}

- (void)_setActiveAdditionalPlatterTranscriptItems:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  NSArray *v7;
  NSArray *activeAdditionalPlatterTranscriptItems;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSArray *obj;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;

  v4 = a3;
  if (-[NSArray isEqualToArray:](self->_activeAdditionalPlatterTranscriptItems, "isEqualToArray:", v4)
    || !-[SRCompactViewController _contentDiffersBetweenPlatterItems:andItems:](self, "_contentDiffersBetweenPlatterItems:andItems:", v4, self->_activeAdditionalPlatterTranscriptItems))
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[SRCompactViewController _setActiveAdditionalPlatterTranscriptItems:]";
      v41 = 2112;
      v42 = v4;
      v6 = "%s #compact: Additional Platter Transcripts have the same content, not updating our compact view for items: %@";
      goto LABEL_8;
    }
  }
  else if (self->_isInAmbient)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[SRCompactViewController _setActiveAdditionalPlatterTranscriptItems:]";
      v41 = 2112;
      v42 = v4;
      v6 = "%s #compact #ambient: Additional Platter Transcripts should not show in ambient, not updating our compact view for items: %@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0x16u);
    }
  }
  else
  {
    v7 = (NSArray *)objc_msgSend(v4, "copy");
    activeAdditionalPlatterTranscriptItems = self->_activeAdditionalPlatterTranscriptItems;
    self->_activeAdditionalPlatterTranscriptItems = v7;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = self->_activeAdditionalPlatterTranscriptItems;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v27)
    {
      v25 = *(_QWORD *)v34;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(obj);
          v28 = v9;
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v12 = v10;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v30;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(_QWORD *)v30 != v15)
                  objc_enumerationMutation(v12);
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1)
                                                                                   + 8 * (_QWORD)i), "viewController"));
                v18 = v17;
                if (v17)
                {
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "parentViewController"));

                  if (!v19)
                    -[SiriSharedUIViewStackContainerController addChildViewController:](self->_viewStackContainerController, "addChildViewController:", v18);
                  objc_opt_class(SiriUISnippetViewController, v20);
                  if ((objc_opt_isKindOfClass(v18, v21) & 1) != 0)
                    objc_msgSend(v18, "setDelegate:", self);
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
                  objc_msgSend(v11, "addObject:", v22);

                  if (!v19)
                    objc_msgSend(v18, "didMoveToParentViewController:", self->_viewStackContainerController);
                }

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v14);
          }

          objc_msgSend(v26, "addObject:", v11);
          v9 = v28 + 1;
        }
        while ((id)(v28 + 1) != v27);
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v27);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    objc_msgSend(v23, "setAdditionalContentSnippetViews:", v26);

  }
}

- (void)_setServerUtterances:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *serverUtterances;
  id v7;

  if (self->_serverUtterances != a3)
  {
    v4 = a3;
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    serverUtterances = self->_serverUtterances;
    self->_serverUtterances = v5;

    v7 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    objc_msgSend(v7, "setServerUtterances:", v4);

  }
}

- (void)_setSpeechRecognitionHypothesis:(id)a3
{
  id v4;
  SRUIFSpeechRecognitionHypothesis *v5;
  SRUIFSpeechRecognitionHypothesis *speechRecognitionHypothesis;
  id v7;

  if (self->_speechRecognitionHypothesis != a3)
  {
    v4 = a3;
    v5 = (SRUIFSpeechRecognitionHypothesis *)objc_msgSend(v4, "copy");
    speechRecognitionHypothesis = self->_speechRecognitionHypothesis;
    self->_speechRecognitionHypothesis = v5;

    v7 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    objc_msgSend(v7, "setSpeechRecognitionHypothesis:", v4);

  }
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y;
  double x;
  SRCompactViewControllerContentTester *v6;
  void *v7;
  SRCompactViewControllerMutableContentTesterState *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;

  y = a3.y;
  x = a3.x;
  v6 = objc_alloc_init(SRCompactViewControllerContentTester);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
  v8 = objc_alloc_init(SRCompactViewControllerMutableContentTesterState);
  -[SRCompactViewControllerMutableContentTesterState setDeviceIsPad:](v8, "setDeviceIsPad:", SiriUIDeviceIsPad(v8, v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController transitionController](self->_navigationController, "transitionController"));
  -[SRCompactViewControllerMutableContentTesterState setNavigationStackIsPopping:](v8, "setNavigationStackIsPopping:", objc_msgSend(v10, "operation") == (id)2);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController viewControllers](self->_navigationController, "viewControllers"));
  -[SRCompactViewControllerMutableContentTesterState setNavigationStackSize:](v8, "setNavigationStackSize:", objc_msgSend(v11, "count"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController viewControllers](self->_navigationController, "viewControllers"));
  if ((unint64_t)objc_msgSend(v12, "count") <= 1)
  {
    v13 = -[SRCompactViewControllerMutableContentTesterState navigationStackIsPopping](v8, "navigationStackIsPopping");

    if ((v13 & 1) == 0)
      goto LABEL_7;
  }
  else
  {

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController visibleViewController](self->_navigationController, "visibleViewController"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  objc_msgSend(v7, "convertPoint:toView:", v15, x, y);
  v17 = v16;
  v19 = v18;

  -[SRCompactViewControllerMutableContentTesterState setNavigationBarHasContent:](v8, "setNavigationBarHasContent:", -[SRCompactViewController _navigationBarHasContentAtPoint:](self, "_navigationBarHasContentAtPoint:", x, y));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController visibleViewController](self->_navigationController, "visibleViewController"));
  objc_opt_class(SiriUINavigationContentViewController, v21);
  LOBYTE(v15) = objc_opt_isKindOfClass(v20, v22);

  if ((v15 & 1) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController visibleViewController](self->_navigationController, "visibleViewController"));
    -[SRCompactViewControllerMutableContentTesterState setMultiLevelViewHasContent:](v8, "setMultiLevelViewHasContent:", objc_msgSend(v23, "hasContentAtPoint:", v17, v19));

  }
  else
  {
    -[SRCompactViewControllerMutableContentTesterState setMultiLevelViewHasContent:](v8, "setMultiLevelViewHasContent:", 1);
  }
LABEL_7:
  -[SRCompactViewControllerMutableContentTesterState setKeyboardHasContent:](v8, "setKeyboardHasContent:", -[SRCompactViewController _keyboardHasContentAtPoint:](self, "_keyboardHasContentAtPoint:", x, y));
  -[SRCompactViewControllerMutableContentTesterState setEditableUtteranceViewHasContent:](v8, "setEditableUtteranceViewHasContent:", -[SRCompactEditableUtterancePresenter hasContentAtPoint:](self->_editableUtterancePresenter, "hasContentAtPoint:", x, y));
  -[SRCompactViewControllerMutableContentTesterState setCompactViewHasContent:](v8, "setCompactViewHasContent:", objc_msgSend(v7, "hasContentAtPoint:", x, y));
  if (self->_siriViewControllerIsEditing
    && !-[SRCompactViewControllerContentTester hasContentForState:](v6, "hasContentForState:", v8))
  {
    -[SRCompactViewController siriDidTapOutsideContent](self, "siriDidTapOutsideContent");
  }
  -[SRCompactViewControllerMutableContentTesterState setSiriViewControllerIsEditing:](v8, "setSiriViewControllerIsEditing:", self->_siriViewControllerIsEditing);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "window"));

  if (v25)
    -[SRCompactViewControllerMutableContentTesterState setContextMenuIsPresented:](v8, "setContextMenuIsPresented:", objc_msgSend(v25, "contextMenuIsPresented"));
  v26 = -[SRCompactViewControllerContentTester hasContentForState:](v6, "hasContentForState:", v8);

  return v26;
}

- (void)_setBottomContentInsetComponents:(id)a3 animatedWithDuration:(double)a4 animationOptions:(unint64_t)a5
{
  double var0;
  void *v9;
  id v10;

  self->_bottomContentInsetComponents = ($0C5975B48BE0F00762E4FBCC1DCF0A72)a3;
  if (a3.var0 >= a3.var1)
    var0 = a3.var0;
  else
    var0 = a3.var1;
  v10 = objc_alloc_init((Class)SiriSharedUIAnimationContext);
  objc_msgSend(v10, "setAnimationOptions:", a5);
  objc_msgSend(v10, "setAnimationDuration:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
  objc_msgSend(v9, "setBottomContentInset:animatedWithContext:", v10, var0);

}

- (void)_setBottomContentInsetComponents:(id)a3
{
  -[SRCompactViewController _setBottomContentInsetComponents:animatedWithDuration:animationOptions:](self, "_setBottomContentInsetComponents:animatedWithDuration:animationOptions:", 0, a3.var0, a3.var1, 0.0);
}

- (void)setBottomContentInset:(double)a3
{
  -[SRCompactViewController _bottomContentInsetComponents](self, "_bottomContentInsetComponents");
  -[SRCompactViewController _setBottomContentInsetComponents:](self, "_setBottomContentInsetComponents:", a3);
}

- (void)setTopContentInset:(double)a3 animated:(BOOL)a4
{
  if (self->_topInset != a3)
    -[SRCompactViewController updateTopInset:animated:](self, "updateTopInset:animated:", a4);
}

- (void)_updateBottomContentInsetKeyboardComponent
{
  double v3;
  double v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  id v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  -[SRCompactViewController _bottomContentInsetComponents](self, "_bottomContentInsetComponents");
  v4 = v3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _keyboardState](self, "_keyboardState"));
  objc_msgSend(v14, "frameForAnimation");
  -[SRCompactViewController _convertRectFromKeyboard:](self, "_convertRectFromKeyboard:");
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  v9 = 0.0;
  if (CGRectGetHeight(v15) != 0.0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    objc_msgSend(v10, "bounds");
    v11 = CGRectGetHeight(v16);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v9 = v11 - CGRectGetMinY(v17);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "animation"));
  objc_msgSend(v12, "duration");
  -[SRCompactViewController _setBottomContentInsetComponents:animatedWithDuration:animationOptions:](self, "_setBottomContentInsetComponents:animatedWithDuration:animationOptions:", objc_msgSend(v12, "options"), v4, v9, v13);

}

- (void)siriDidActivate
{
  void *v3;
  id v4;

  if ((id)-[SRCompactViewController _inputType](self, "_inputType") == (id)1)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _textRequestViewController](self, "_textRequestViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v3, "becomeFirstResponder");

  }
}

- (void)siriDidDeactivate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((id)-[SRCompactViewController _inputType](self, "_inputType") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _textRequestViewController](self, "_textRequestViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
    objc_msgSend(v4, "resignFirstResponder");

  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "visibleViewController"));
  -[SRCompactViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v5, &stru_100122D48);

}

- (int)viewRegionForPresentedAceObject:(id)a3
{
  return -[SiriSharedUICompactHostingInstrumentationSupplement viewRegionForPresentedAceObject:resultTrasncriptItems:conversationTranscriptItems:serverUtterances:](self->_instrumentationSupplement, "viewRegionForPresentedAceObject:resultTrasncriptItems:conversationTranscriptItems:serverUtterances:", a3, self->_activeTranscriptItems, self->_activeConversationTranscriptItems, self->_serverUtterances);
}

- (double)lastPresentationTime
{
  return self->_presentationTime;
}

- (id)_instrumentationManager
{
  return +[SRUIFInstrumentationManager sharedManager](SRUIFInstrumentationManager, "sharedManager");
}

- (void)showFullScreenEffect:(id)a3
{
  SRFullScreenEffects *v4;
  SRFullScreenEffects *fullScreenEffects;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!self->_fullScreenEffects)
  {
    v4 = objc_alloc_init(SRFullScreenEffects);
    fullScreenEffects = self->_fullScreenEffects;
    self->_fullScreenEffects = v4;

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRFullScreenEffects effectForAceObject:](self->_fullScreenEffects, "effectForAceObject:", v8));
  objc_msgSend(v6, "showFullScreenEffect:", v7);

}

- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void **p_vtable;
  _UNKNOWN **v12;
  void *i;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _UNKNOWN **v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  void *v26;
  BOOL v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v4 = a3;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewId"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUICompactResultViewController contentPlatterViewController](self->_resultViewController, "contentPlatterViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentViewControllers"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v9 = v7;
    v29 = v4;
    v10 = *(_QWORD *)v32;
    p_vtable = _TtC4Siri31SiriUISpokenSuggestionsProvider.vtable;
    v12 = NSArray_ptr;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        objc_opt_class(p_vtable + 169, v8);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v16 = v14;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "aceObject"));
          objc_opt_class(v12[50], v18);
          if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
          {
            v20 = v6;
            v21 = v12;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "aceObject"));
            v23 = v10;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "viewId"));
            v25 = objc_msgSend(v24, "isEqualToString:", v30);

            v10 = v23;
            v12 = v21;
            v6 = v20;
            p_vtable = (void **)(_TtC4Siri31SiriUISpokenSuggestionsProvider + 24);

            if (v25)
            {
              v4 = v29;
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stateData"));
              objc_msgSend(v16, "updateSharedState:", v26);

              v27 = 1;
              goto LABEL_16;
            }
          }
          else
          {

          }
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v9);
    v27 = 0;
    v4 = v29;
  }
  else
  {
    v27 = 0;
  }
LABEL_16:

  return v27;
}

- (void)setActiveRequestOptions:(id)a3
{
  SASRequestOptions *v5;
  SASRequestOptions *v6;

  v5 = (SASRequestOptions *)a3;
  if (self->_activeRequestOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_activeRequestOptions, a3);
    -[SRCompactViewController _updateAmbientAvailability](self, "_updateAmbientAvailability");
    v5 = v6;
  }

}

- (void)_registerForAmbientPresentationTraitChange
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;
  void *v10;

  -[SRCompactViewController _updateAmbientAvailability](self, "_updateAmbientAvailability");
  objc_initWeak(&location, self);
  v3 = objc_opt_self(AMUIAmbientPresentationStateTrait);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v10 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021CA0;
  v7[3] = &unk_1001227B8;
  objc_copyWeak(&v8, &location);
  v6 = -[SRCompactViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v5, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateAmbientAvailability
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = objc_msgSend(v4, "isAmbientPresented");

  v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
    v9 = 136315394;
    v10 = "-[SRCompactViewController _updateAmbientAvailability]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #ambient - is Presented - %@", (uint8_t *)&v9, 0x16u);

  }
  -[SRCompactViewController setIsInAmbient:](self, "setIsInAmbient:", v5);
}

- (void)setIsInAmbient:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
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
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  void *v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  void *j;
  void *v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  void *k;
  void *v74;
  void *v75;
  uint64_t v76;
  SRCompactViewController *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];

  if (self->_isInAmbient != a3)
  {
    v3 = a3;
    self->_isInAmbient = a3;
    v76 = 48;
    if (a3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v5, "scale");
      v7 = v6 * SiriSharedUICompactAmbientContentScaleAmount;

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _viewStackContainerController](self, "_viewStackContainerController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitOverrides"));
      objc_msgSend(v9, "setDisplayScale:", v7);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _viewStackContainerController](self, "_viewStackContainerController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitOverrides"));
      objc_msgSend(v11, "setUserInterfaceStyle:", 2);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "traitOverrides"));
      objc_msgSend(v13, "setDisplayScale:", v7);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "traitOverrides"));
      objc_msgSend(v15, "setUserInterfaceStyle:", 2);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController traitOverrides](self, "traitOverrides"));
      objc_msgSend(v16, "setDisplayScale:", v7);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController traitOverrides](self, "traitOverrides"));
      objc_msgSend(v17, "setUserInterfaceStyle:", 2);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _viewStackContainerController](self, "_viewStackContainerController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "traitOverrides"));
      v20 = objc_opt_self(UITraitDisplayScale);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      objc_msgSend(v19, "removeTrait:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _viewStackContainerController](self, "_viewStackContainerController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "traitOverrides"));
      v24 = objc_opt_self(UITraitUserInterfaceStyle);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      objc_msgSend(v23, "removeTrait:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "traitOverrides"));
      v28 = objc_opt_self(UITraitDisplayScale);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      objc_msgSend(v27, "removeTrait:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "traitOverrides"));
      v32 = objc_opt_self(UITraitUserInterfaceStyle);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      objc_msgSend(v31, "removeTrait:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController traitOverrides](self, "traitOverrides"));
      v35 = objc_opt_self(UITraitDisplayScale);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      objc_msgSend(v34, "removeTrait:", v36);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController traitOverrides](self, "traitOverrides"));
      v37 = objc_opt_self(UITraitUserInterfaceStyle);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      objc_msgSend(v17, "removeTrait:", v38);

    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "resultView"));
    objc_msgSend(v40, "setIsInAmbient:", v3);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "conversationView"));
    objc_msgSend(v42, "setIsInAmbient:", v3);

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v77 = self;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "viewControllers"));

    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
    if (v45)
    {
      v47 = v45;
      v48 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v47; i = (char *)i + 1)
        {
          if (*(_QWORD *)v87 != v48)
            objc_enumerationMutation(v44);
          v50 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)i);
          objc_opt_class(SiriUINavigationContentViewController, v46);
          v52 = sub_100007944(v51, v50);
          v54 = (void *)objc_claimAutoreleasedReturnValue(v52);
          if (v54)
          {
            *(_QWORD *)&v55 = objc_opt_class(SiriSharedUIContentPlatterViewController, v53).n128_u64[0];
            v57 = v56;
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "contentViewController", v55));
            v59 = sub_100007944(v57, v58);
            v60 = (void *)objc_claimAutoreleasedReturnValue(v59);

            if (v60)
            {
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "contentPlatterView"));
              objc_msgSend(v61, "setIsInAmbient:", v3);

            }
          }

        }
        v47 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
      }
      while (v47);
    }

    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](v77, "_compactView"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "additionalContentViews"));

    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v83;
      do
      {
        for (j = 0; j != v65; j = (char *)j + 1)
        {
          if (*(_QWORD *)v83 != v66)
            objc_enumerationMutation(v63);
          objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)j), "setIsInAmbient:", v3, v76);
        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
      }
      while (v65);
    }

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](v77->_activeTranscriptItems, "arrayByAddingObjectsFromArray:", v77->_activeConversationTranscriptItems));
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
    v70 = v76;
    if (v69)
    {
      v71 = v69;
      v72 = *(_QWORD *)v79;
      do
      {
        for (k = 0; k != v71; k = (char *)k + 1)
        {
          if (*(_QWORD *)v79 != v72)
            objc_enumerationMutation(v68);
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)k), "viewController", v76));
          if ((objc_opt_respondsToSelector(v74, "setIsInAmbient:") & 1) != 0)
            objc_msgSend(v74, "setIsInAmbient:", *((unsigned __int8 *)&v77->super.super.super.isa + v70));

        }
        v71 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
      }
      while (v71);
    }
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](v77, "_compactView", v76));
    objc_msgSend(v75, "setIsInAmbient:", v3);

  }
}

- (void)_updateIsInAmbientWithInteractivity:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  if (self->_isInAmbient)
  {
    v3 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v5, "scale");
    v7 = v6 * SiriSharedUICompactAmbientContentScaleAmountForInteractivity;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _viewStackContainerController](self, "_viewStackContainerController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitOverrides"));
    objc_msgSend(v9, "setDisplayScale:", v7);

    self->_isInAmbientInteractivity = v3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resultView"));
    objc_msgSend(v11, "setIsInAmbientInteractivity:", v3);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "conversationView"));
    objc_msgSend(v13, "setIsInAmbientInteractivity:", v3);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](self->_activeTranscriptItems, "arrayByAddingObjectsFromArray:", self->_activeConversationTranscriptItems));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "viewController"));
          if ((objc_opt_respondsToSelector(v19, "setIsInAmbientInteractivity:") & 1) != 0)
            objc_msgSend(v19, "setIsInAmbientInteractivity:", v3);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    objc_msgSend(v20, "setIsInAmbientInteractivity:", v3);

  }
}

- (void)siriDidStartSpeakingWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleViewController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100022780;
  v8[3] = &unk_1001228F8;
  v9 = v4;
  v7 = v4;
  -[SRCompactViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v6, v8);

}

- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "visibleViewController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100022888;
  v10[3] = &unk_100122920;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  -[SRCompactViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v8, v10);

}

- (void)siriDidUpdateASRWithRecognition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleViewController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100022984;
  v8[3] = &unk_1001228F8;
  v9 = v4;
  v7 = v4;
  -[SRCompactViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v6, v8);

}

- (void)siriDidTapOutsideContent
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleViewController"));
  -[SRCompactViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v3, &stru_100122D68);

}

- (void)siriWillStartRequest
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleViewController"));
  -[SRCompactViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v3, &stru_100122D88);

}

- (void)siriIsIdleAndQuiet
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleViewController"));
  -[SRCompactViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v3, &stru_100122DA8);

}

- (void)_recursivelyNotifyVisibleViewControllers:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___SiriSharedUIViewControlling))
    v7[2](v7, v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childViewControllers", 0));
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
        -[SRCompactViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), v7);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_pushQueuedNavigationContentViewController
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _queuedNavigationContentViewController](self, "_queuedNavigationContentViewController"));
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
    objc_msgSend(v3, "pushViewController:animated:", v4, 1);

    -[SRCompactViewController _setQueuedNavigationContentViewController:](self, "_setQueuedNavigationContentViewController:", 0);
    -[SRCompactViewController userDrilledIntoSnippet](self, "userDrilledIntoSnippet");
  }

}

- (void)dismissalGestureRecognizerDidFinish:(id)a3 shouldDismiss:(BOOL)a4
{
  id v5;

  if (a4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate", a3));
    objc_msgSend(v5, "endSiriSessionForViewController:withDismissalReason:", self, 24);

  }
}

- (BOOL)shouldBeginDismissalGestureRecognizer:(id)a3 withTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_opt_class(UIButton, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
  {

    v11 = 0;
LABEL_6:
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v7, "locationInView:", v13);
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    v12 = objc_msgSend(v18, "hasContentAtPoint:", v15, v17);

    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));

  if (!v11 || (objc_msgSend(v11, "isEnabled") & 1) == 0)
    goto LABEL_6;
  v12 = 0;
LABEL_7:

  return v12;
}

- (void)siriViewController:(id)a3 openURL:(id)a4 completion:(id)a5
{
  SiriSharedUICompactHostingInstrumentationSupplement *instrumentationSupplement;
  id v9;
  id v10;
  id v11;

  instrumentationSupplement = self->_instrumentationSupplement;
  v9 = a5;
  v10 = a4;
  -[SiriSharedUICompactHostingInstrumentationSupplement logPunchOutEventForSiriViewController:aceCommand:URL:appID:sashItem:](instrumentationSupplement, "logPunchOutEventForSiriViewController:aceCommand:URL:appID:sashItem:", a3, 0, v10, 0, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v11, "viewController:openURL:completion:", self, v10, v9);

}

- (void)siriViewController:(id)a3 performAceCommands:(id)a4
{
  -[SRCompactViewController siriSnippetViewController:performAceCommands:sashItem:](self, "siriSnippetViewController:performAceCommands:sashItem:", a3, a4, 0);
}

- (void)siriSnippetViewController:(id)a3 performAceCommands:(id)a4 sashItem:(id)a5
{
  SiriSharedUICompactHostingInstrumentationSupplement *instrumentationSupplement;
  id v9;
  id v10;

  instrumentationSupplement = self->_instrumentationSupplement;
  v9 = a4;
  -[SiriSharedUICompactHostingInstrumentationSupplement logPunchOutEventForSiriViewController:aceCommands:sashItem:](instrumentationSupplement, "logPunchOutEventForSiriViewController:aceCommands:sashItem:", a3, v9, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v10, "viewController:performAceCommands:completion:", self, v9, 0);

}

- (void)siriViewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v9, "viewController:performAceCommands:completion:", self, v8, v7);

}

- (id)additionalSpeechInterpretationsForSiriViewController:(id)a3
{
  return 0;
}

- (id)persistentDataStoreForSiriViewController:(id)a3
{
  return 0;
}

- (double)boundingWidthForSnippetViewController:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate", a3));
  objc_msgSend(v3, "expectedContentWidth");
  v5 = v4;

  return v5;
}

- (id)siriViewController:(id)a3 disambiguationItemForListItem:(id)a4 disambiguationKey:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUISnippetManager sharedInstance](SiriUISnippetManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "disambiguationItemForListItem:disambiguationKey:", v7, v6));

  return v9;
}

- (id)siriViewController:(id)a3 domainObjectForIdentifier:(id)a4
{
  return 0;
}

- (id)siriViewController:(id)a3 filteredDisambiguationListItems:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUISnippetManager sharedInstance](SiriUISnippetManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredDisambiguationListItems:", v4));

  return v6;
}

- (id)siriViewController:(id)a3 listItemToPickInAutodisambiguationForListItems:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUISnippetManager sharedInstance](SiriUISnippetManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "listItemToPickInAutodisambiguationForListItems:", v4));

  return v6;
}

- (UIEdgeInsets)siriViewControllerBackgroundInsets:(id)a3
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)siriViewControllerEffectiveBundleForCoreLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "effectiveCoreLocationBundleForCompactViewController:", self));

  if (!v6)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009DE58((uint64_t)v4, v7);
  }

  return v6;
}

- (double)siriViewControllerExpectedWidth:(id)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView", a3));
  objc_msgSend(v4, "resultViewContentSize");
  v6 = v5;

  if (self->_isInAmbient && !self->_isInAmbientInteractivity)
    return v6 / SiriSharedUICompactAmbientContentScaleAmount;
  return v6;
}

- (void)siriViewControllerHeightDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (v17)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController topViewController](self->_navigationController, "topViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewStackContainer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostingView"));

    if (v6 == v8)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
      objc_msgSend(v4, "snippetLayoutDidUpdateForView:", v13);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController topViewController](self->_navigationController, "topViewController"));
      objc_opt_class(SiriUINavigationContentViewController, v10);
      isKindOfClass = objc_opt_isKindOfClass(v9, v11);

      if ((isKindOfClass & 1) == 0)
        goto LABEL_7;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController topViewController](self->_navigationController, "topViewController"));
      objc_msgSend(v13, "contentViewDidUpdateSize");
    }

LABEL_7:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "transitionController"));
    if (objc_msgSend(v15, "operation"))
    {

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _queuedNavigationContentViewController](self, "_queuedNavigationContentViewController"));

      if (v16)
        goto LABEL_11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationStackLayoutController](self, "_navigationStackLayoutController"));
      objc_msgSend(v14, "layout");
    }

LABEL_11:
  }

}

- (void)siriViewControllerHeightDidChange:(id)a3 pinTopOfSnippet:(BOOL)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView", a3, a4));
  objc_msgSend(v4, "setNeedsLayout");

}

- (CGSize)siriViewControllerVisibleContentArea:(id)a3
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)statusBarHeightForSiriViewController:(id)a3
{
  return 0.0;
}

- (void)siriSnippetViewController:(id)a3 pushSirilandSnippets:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char isKindOfClass;
  uint64_t IsPad;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  id v54;
  void *v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  _BYTE v62[128];
  CGRect v63;

  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v4 = a4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (!v5)
    goto LABEL_32;
  v7 = v5;
  v8 = *(_QWORD *)v58;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v58 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
      objc_opt_class(SAAceView, v6);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
        goto LABEL_32;
      v12 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SRLocalSnippetManager transcriptItemForObject:](SRLocalSnippetManager, "transcriptItemForObject:", v12));
      if (!v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUISnippetManager sharedInstance](SiriUISnippetManager, "sharedInstance"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "transcriptItemForObject:sizeClass:", v12, 1));

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewController"));
      objc_msgSend(v15, "setAceObject:", v12);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewController"));
      objc_msgSend(v16, "wasAddedToTranscript");

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewController"));
      objc_opt_class(SiriUISnippetViewController, v18);
      if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
        objc_msgSend(v20, "layoutIfNeeded");
        v21 = v17;
        if (SiriUIDeviceIsPad(v21, v22))
          objc_msgSend(v21, "setNavigating:", 1);
        if ((objc_opt_respondsToSelector(v20, "shouldAutomaticallyScaleContentInAmbient") & 1) != 0)
          v23 = (uint64_t)objc_msgSend(v20, "shouldAutomaticallyScaleContentInAmbient");
        else
          v23 = 1;
        objc_msgSend(v21, "setIsInAmbient:", self->_isInAmbient);
        objc_msgSend(v21, "setDelegate:", self);
        -[SiriSharedUICompactHostingInstrumentationSupplement configureSiriViewControllerWithCurrentTurn:](self->_instrumentationSupplement, "configureSiriViewControllerWithCurrentTurn:", v21);
        v24 = objc_alloc_init((Class)SiriSharedUIContentPlatterViewController);
        v61 = v21;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v61, 1));
        objc_msgSend(v24, "setContentViewControllers:", v25);

        v26 = objc_alloc_init((Class)SiriUINavigationContentViewController);
        objc_msgSend(v26, "setContentViewController:", v24);
        v55 = v24;
        if (self->_isInAmbient)
        {
          v54 = v26;
          v27 = v23;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentPlatterView"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _resultViewController](self, "_resultViewController"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "compactResultView"));
          objc_msgSend(v28, "setDelegate:", v30);

          v23 = v27;
          v26 = v54;
          v24 = v55;
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentPlatterView"));
        objc_msgSend(v31, "setIsNextLevelCard:", 1);

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentPlatterView"));
        objc_msgSend(v32, "setIsInAmbient:", self->_isInAmbient);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentPlatterView"));
        objc_msgSend(v33, "setAllowAutomaticContentViewsScaling:", v23);

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aceObject"));
        objc_opt_class(SACardSnippet, v35);
        isKindOfClass = objc_opt_isKindOfClass(v34, v36);

        if ((isKindOfClass & 1) != 0)
        {
          IsPad = SiriUIDeviceIsPad(IsPad, v39);
          if ((_DWORD)IsPad)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "contentViewController"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "view"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
            objc_msgSend(v42, "frame");
            objc_msgSend(v41, "setFrame:", 0.0, 0.0, CGRectGetWidth(v63), 0.0);

            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "contentViewController"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "view"));
            objc_msgSend(v44, "setNeedsLayout");

            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "contentViewController"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "view"));
            objc_msgSend(v46, "layoutIfNeeded");

          }
        }
        if (SiriUIDeviceIsPad(IsPad, v39))
          objc_msgSend(v26, "setContentLayoutEnabled:", 0);
        else
          -[SRCompactViewController _updateAdditionalSafeAreaInsetsForNavigationContentViewController:](self, "_updateAdditionalSafeAreaInsetsForNavigationContentViewController:", v26);
        -[SRCompactViewController _setQueuedNavigationContentViewController:](self, "_setQueuedNavigationContentViewController:", v26);
        if (objc_msgSend(v21, "isLoading"))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aceObject"));
          objc_opt_class(SAUIVisualResponseSnippet, v48);
          if ((objc_opt_isKindOfClass(v47, v49) & 1) != 0)
          {

          }
          else
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aceObject"));
            objc_opt_class(SAUIPluginSnippet, v51);
            v53 = objc_opt_isKindOfClass(v50, v52);

            if ((v53 & 1) == 0)
            {
LABEL_31:
              -[SiriSharedUICompactHostingInstrumentationSupplement logDrillInInteractionForSnippetViewControllerIfNecessary:](self->_instrumentationSupplement, "logDrillInInteractionForSnippetViewControllerIfNecessary:", v21);

              goto LABEL_32;
            }
          }
        }
        -[SRCompactViewController _pushQueuedNavigationContentViewController](self, "_pushQueuedNavigationContentViewController");
        goto LABEL_31;
      }

    }
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v7)
      continue;
    break;
  }
LABEL_32:

}

- (void)_updateAdditionalSafeAreaInsetsForNavigationContentViewController:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  if ((SiriUIDeviceIsPad(v9, v4) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    objc_msgSend(v5, "safeAreaInsets");
    v7 = 0.0 - v6;
    objc_msgSend(v5, "effectiveBottomContentInset");
    objc_msgSend(v9, "setAdditionalSafeAreaInsets:", 0.0, 8.0, v7 + v8 + 14.0, 8.0);

  }
}

- (void)siriSnippetViewController:(id)a3 setStatusViewHidden:(BOOL)a4
{
  -[SRCompactViewController _setSnippetViewControllerRequestsStatusViewHidden:](self, "_setSnippetViewControllerRequestsStatusViewHidden:", a4);
}

- (BOOL)siriSnippetViewControllerIsVisible:(id)a3
{
  return 1;
}

- (void)siriSnippetViewControllerViewDidLoad:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  CGRect v17;

  v16 = a3;
  if (v16)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
    objc_msgSend(v4, "snippetLayoutDidUpdateForView:", v5);

    objc_msgSend(v4, "setNeedsLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "aceObject"));
    objc_opt_class(SACardSnippet, v7);
    isKindOfClass = objc_opt_isKindOfClass(v6, v8);

    if ((isKindOfClass & 1) != 0 && SiriUIDeviceIsPad(v10, v11))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
      objc_msgSend(v13, "frame");
      objc_msgSend(v12, "setFrame:", 0.0, 0.0, CGRectGetWidth(v17), 0.0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
      objc_msgSend(v14, "setNeedsLayout");

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
      objc_msgSend(v15, "layoutIfNeeded");

    }
    -[SRCompactViewController _pushQueuedNavigationContentViewController](self, "_pushQueuedNavigationContentViewController");

  }
}

- (void)userTouchedSnippet
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v2, "userTouchedSnippet");

}

- (void)siriSnippetViewController:(id)a3 informHostOfBackgroundView:(id)a4 isSnippetAsyncColored:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;

  v7 = a3;
  v8 = a4;
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[SRCompactViewController siriSnippetViewController:informHostOfBackgroundView:isSnippetAsyncColored:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v13, 0xCu);
  }
  v10 = v8;
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUICompactResultViewController contentPlatterViewController](self->_resultViewController, "contentPlatterViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentPlatterView"));
    objc_msgSend(v12, "setBackgroundView:", v10);

  }
}

- (void)siriSnippetViewController:(id)a3 isBackgroundColorUpdateSuccessful:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;

  v4 = a4;
  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v8 = 136315394;
    v9 = "-[SRCompactViewController siriSnippetViewController:isBackgroundColorUpdateSuccessful:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s isSuccessful %@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)siriSnippetViewController:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v9, "compactViewController:handleStartLocalRequest:turnIdentifier:", self, v8, v7);

}

- (void)userDrilledIntoSnippet
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v2, "userDrilledIntoSnippet");

}

- (void)cancelSpeakingForSiriViewController:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "stopSpeakingForCompactViewController:", self);

}

- (void)siriViewController:(id)a3 speakText:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v9, "compactViewController:speakText:isPhonetic:completion:", self, v8, 0, v7);

}

- (BOOL)siriViewControllerShouldPreventUserInteraction:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate", a3));
  v5 = objc_msgSend(v4, "lockStateForCompactViewController:", self);

  return v5 != 0;
}

- (id)localeForSiriViewController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localeForCompactViewController:", self));

  return v5;
}

- (void)siriSnippetViewController:(id)a3 willDismissViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v6, "siriCompactViewController:willDismissViewController:", self, v5);

}

- (void)siriSnippetViewController:(id)a3 willPresentViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v6, "siriCompactViewController:willPresentViewController:", self, v5);

}

- (void)siriViewControllerWillBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  self->_siriViewControllerIsEditing = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "cancelRequestForViewController:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v5, "compactViewControllerRequestsHIDEventDefferal:", self);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
  objc_msgSend(v6, "setConversationViewHidden:", 1);

}

- (void)siriViewControllerDidEndEditing:(id)a3
{
  void *v4;
  id v5;

  self->_siriViewControllerIsEditing = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "compactViewControllerCancelHIDEventDefferal:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
  objc_msgSend(v5, "setConversationViewHidden:", 0);

}

- (void)siriViewControllerViewDidAppear:(id)a3 isTopLevelViewController:(BOOL)a4
{
  SRCompactViewControllerDelegate **p_delegate;
  id v6;
  void *v7;
  id WeakRetained;

  if (a4)
  {
    p_delegate = &self->_delegate;
    v6 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceObject"));

    objc_msgSend(WeakRetained, "compactViewController:viewDidAppearForAceObject:", self, v7);
  }
}

- (void)siriViewControllerViewDidDisappear:(id)a3 isTopLevelViewController:(BOOL)a4
{
  SRCompactViewControllerDelegate **p_delegate;
  id v6;
  void *v7;
  id WeakRetained;

  if (a4)
  {
    p_delegate = &self->_delegate;
    v6 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceObject"));

    objc_msgSend(WeakRetained, "compactViewController:viewDidDisappearForAceObject:", self, v7);
  }
}

- (void)_setStatusViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v5, "compactViewController:setStatusViewHidden:", self, v3);

}

- (void)_setSnippetViewControllerRequestsStatusViewHidden:(BOOL)a3
{
  self->_snippetViewControllerRequestsStatusViewHidden = a3;
  -[SRCompactViewController _updateStatusViewVisibility](self, "_updateStatusViewVisibility");
}

- (void)_updateStatusViewVisibility
{
  -[SRCompactViewController _setStatusViewHidden:](self, "_setStatusViewHidden:", -[SRCompactViewController _hidesStatusViewForInputType:](self, "_hidesStatusViewForInputType:", -[SRCompactViewController _inputType](self, "_inputType")) | -[SRCompactViewController _snippetViewControllerRequestsStatusViewHidden](self, "_snippetViewControllerRequestsStatusViewHidden"));
}

- (void)_updateTextRequestViewVisibility
{
  _BOOL8 v3;
  id v4;

  v3 = -[SRCompactViewController _hidesTextRequestViewForInputType:](self, "_hidesTextRequestViewForInputType:", -[SRCompactViewController _inputType](self, "_inputType"));
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
  objc_msgSend(v4, "setHidesTextRequestView:", v3);

}

- (void)_willBeginEditingOfType:(int64_t)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v5, "compactViewController:willBeginEditingOfType:", self, a3);

}

- (void)_didEndEditing
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v3, "compactViewControllerDidEndEditing:", self);

}

- (void)scrollDidBeginFromView:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "viewController:reduceOrbOpacity:", self, 1);

}

- (void)scrollDidEndFromView:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "viewController:reduceOrbOpacity:", self, 0);

}

- (void)tapToEditRequestedFromView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  SRCompactEditableUtterancePresenter *v12;
  SRCompactEditableUtterancePresenter *editableUtterancePresenter;
  void *v14;
  SRCompactEditableUtterancePresenter *v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _speechRecognitionHypothesis](self, "_speechRecognitionHypothesis"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backingAceObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "refId"));

  v8 = objc_alloc((Class)SiriSharedUIUserUtteranceEditingDataManager);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _speechRecognitionHypothesis](self, "_speechRecognitionHypothesis"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userUtterance"));
  v11 = objc_msgSend(v8, "initWithUserUtterance:backingAceObjectRefId:", v10, v7);

  v12 = -[SRCompactEditableUtterancePresenter initWithUserEditingDataManager:delegate:]([SRCompactEditableUtterancePresenter alloc], "initWithUserEditingDataManager:delegate:", v11, self);
  editableUtterancePresenter = self->_editableUtterancePresenter;
  self->_editableUtterancePresenter = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v14, "tapToEditPresented");

  objc_initWeak(&location, self);
  v15 = self->_editableUtterancePresenter;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100024664;
  v16[3] = &unk_100122C18;
  objc_copyWeak(&v17, &location);
  -[SRCompactEditableUtterancePresenter presentUtteranceViewControllerFromViewController:animateAlongsideTransition:completion:](v15, "presentUtteranceViewControllerFromViewController:animateAlongsideTransition:completion:", self, v16, 0);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (BOOL)_shouldMoveViewStackForTapToEdit
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _resultViewController](self, "_resultViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentPlatterViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentViewControllers"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return 0;
  else
    return SiriUIDeviceIsPad(v6, v7) ^ 1;
}

- (void)compactView:(id)a3 viewDidAppearForAceObject:(id)a4
{
  SRCompactViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "compactViewController:viewDidAppearForAceObject:", self, v6);

}

- (void)compactView:(id)a3 viewDidDisappearForAceObject:(id)a4
{
  SRCompactViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "compactViewController:viewDidDisappearForAceObject:", self, v6);

}

- (void)compactView:(id)a3 didChangeEffectiveBottomContentInsetAnimatedWithContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllers"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v12);
        objc_opt_class(SiriUINavigationContentViewController, v9);
        v15 = sub_100007944(v14, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        if (v16)
        {
          -[SRCompactViewController _updateAdditionalSafeAreaInsetsForNavigationContentViewController:](self, "_updateAdditionalSafeAreaInsetsForNavigationContentViewController:", v16);
          objc_msgSend(v16, "contentViewDidUpdateSize");
          objc_msgSend(v5, "animationDuration");
          v18 = v17;
          v19 = objc_msgSend(v5, "animationOptions");
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_1000249F8;
          v20[3] = &unk_1001225C0;
          v21 = v16;
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v19, v20, 0, v18, 0.0);

        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

}

- (id)parserSpeakableObjectProviderForCompactView:(id)a3
{
  return +[SiriUISnippetManager sharedInstance](SiriUISnippetManager, "sharedInstance", a3);
}

- (double)maximumHeightForCompactView:(id)a3
{
  void *v3;
  void *v4;
  double Height;
  CGRect v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUIViewStackContainerController viewStackContainer](self->_viewStackContainerController, "viewStackContainer", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hostingView"));
  objc_msgSend(v4, "frame");
  Height = CGRectGetHeight(v7);

  return Height;
}

- (CGSize)maxSizeForSnippet
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
  objc_msgSend(v3, "resultViewContentSize");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _resultViewController](self, "_resultViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "compactResultView"));
  objc_msgSend(v6, "maximumHeightForResultView:", v8);
  v10 = v9;

  v11 = v5;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)editableUtterancePresenter:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  -[SRCompactViewController _requestKeyboardWithCompletion:](self, "_requestKeyboardWithCompletion:", a4);
}

- (void)willBeginEditingFromUtterancePresenter:(id)a3
{
  -[SRCompactViewController _willBeginEditingOfType:](self, "_willBeginEditingOfType:", 1);
}

- (void)didResignFirstResponderFromUtterancePresenter:(id)a3
{
  -[SRCompactViewController _didEndEditing](self, "_didEndEditing", a3);
}

- (void)editableUtterancePresenter:(id)a3 didFinishEditingWithText:(id)a4 selectionResults:(id)a5 shouldStartNewRequest:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id WeakRetained;
  void *v19;
  _QWORD block[5];

  v6 = a6;
  v9 = a4;
  v10 = a5;
  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
    v12 = objc_alloc((Class)AFUserUtterance);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _speechRecognitionHypothesis](self, "_speechRecognitionHypothesis"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userUtterance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "correctionIdentifier"));
    v16 = objc_msgSend(v12, "initWithString:correctionIdentifier:", v9, v15);

    v17 = objc_msgSend(objc_alloc((Class)SRUIFSpeechRecognitionHypothesis), "initWithUserUtterance:backingAceObject:isFinal:", v16, 0, 1);
    objc_msgSend(v11, "setSpeechRecognitionHypothesis:", v17);

    objc_msgSend(v11, "setServerUtterances:", &__NSArray0__struct);
    objc_msgSend(v11, "setShowSnippetView:animated:", 0, 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SRUIFSpeechRecognitionHypothesis userUtterance](self->_speechRecognitionHypothesis, "userUtterance"));
  objc_msgSend(WeakRetained, "viewController:didFinishEditingUtteranceWithText:originalUserUtterance:selectionResults:", self, v9, v19, v10);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024D18;
  block[3] = &unk_1001225C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)editableUtterancePresenter:(id)a3 openURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v6, "viewController:openURL:completion:", self, v5, 0);

}

- (void)willDismissEditableUtterancePresenter:(id)a3 transitionCoordinator:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  id location;
  _QWORD v13[3];
  char v14;

  v6 = a3;
  v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100024EDC;
  v10[3] = &unk_100122DD0;
  objc_copyWeak(&v11, &location);
  v10[4] = v13;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100024F64;
  v8[3] = &unk_100122DF8;
  v8[4] = v13;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(v13, 8);

}

- (void)_updateKeyboardStateFromNotification:(id)a3
{
  id v4;
  SRCompactKeyboardState *v5;

  v4 = a3;
  v5 = -[SRCompactKeyboardState initWithKeyboardNotification:]([SRCompactKeyboardState alloc], "initWithKeyboardNotification:", v4);

  -[SRCompactViewController _setKeyboardState:](self, "_setKeyboardState:", v5);
}

- (void)_keyboardWillHideForAmbient:(id)a3
{
  if (self->_isInAmbient)
    -[SRCompactViewController _updateIsInAmbientWithInteractivity:](self, "_updateIsInAmbientWithInteractivity:", 0);
}

- (void)_keyboardWillShowForAmbient:(id)a3
{
  if (self->_isInAmbient)
    -[SRCompactViewController _updateIsInAmbientWithInteractivity:](self, "_updateIsInAmbientWithInteractivity:", 1);
}

- (void)_setKeyboardState:(id)a3
{
  SRCompactKeyboardState *v4;
  SRCompactKeyboardState *keyboardState;

  v4 = (SRCompactKeyboardState *)objc_msgSend(a3, "copy");
  keyboardState = self->_keyboardState;
  self->_keyboardState = v4;

  -[SRCompactViewController _updateBottomContentInsetKeyboardComponent](self, "_updateBottomContentInsetKeyboardComponent");
}

- (CGRect)_convertRectFromKeyboard:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screen"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "coordinateSpace"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
  objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v11, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)_keyboardFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _keyboardState](self, "_keyboardState"));
  objc_msgSend(v3, "frame");
  -[SRCompactViewController _convertRectFromKeyboard:](self, "_convertRectFromKeyboard:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)_hidesStatusViewForInputType:(int64_t)a3
{
  return a3 == 1;
}

- (BOOL)_hidesTextRequestViewForInputType:(int64_t)a3
{
  return !-[SRCompactViewController _hidesStatusViewForInputType:](self, "_hidesStatusViewForInputType:", a3);
}

- (void)_setInputType:(int64_t)a3
{
  if (self->_inputType != a3)
  {
    self->_inputType = a3;
    -[SRCompactViewController _updateTextRequestViewVisibility](self, "_updateTextRequestViewVisibility");
    -[SRCompactViewController _updateStatusViewVisibility](self, "_updateStatusViewVisibility");
  }
}

- (void)textRequestController:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  -[SRCompactViewController _requestKeyboardWithCompletion:](self, "_requestKeyboardWithCompletion:", a4);
}

- (void)textRequestControllerWillBeginEditing:(id)a3
{
  -[SRCompactViewController _willBeginEditingOfType:](self, "_willBeginEditingOfType:", 0);
}

- (void)textRequestControllerDidEndEditing:(id)a3
{
  -[SRCompactViewController _didEndEditing](self, "_didEndEditing", a3);
}

- (void)textRequestControllerWillBeginTextEditMenuInteraction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "compactViewControllerWillBeginTextEditMenuInteraction:", self);

}

- (void)textRequestControllerDidEndTextEditMenuInteraction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "compactViewControllerDidEndTextEditMenuInteraction:", self);

}

- (void)textRequestController:(id)a3 siriRequestCommittedWithText:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v7, "viewController:siriRequestEnteredWithText:", self, v6);

  objc_msgSend(v10, "setAllowsCancellation:", SiriUIDeviceIsPad(v8, v9) ^ 1);
}

- (BOOL)_alwaysObscureBackgroundContentWhenActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v3 = objc_msgSend(v2, "alwaysObscureBackgroundContentWhenActive");

  return v3;
}

- (void)_requestPresentationBackgroundBlurVisible:(BOOL)a3 forReason:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  v8 = objc_msgSend(v7, "lockStateForCompactViewController:", self);

  if (!v8
    && !-[SRCompactViewController _alwaysObscureBackgroundContentWhenActive](self, "_alwaysObscureBackgroundContentWhenActive"))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController backgroundBlurViewController](self, "backgroundBlurViewController"));
    objc_msgSend(v9, "requestBackgroundBlurVisible:forReason:", v5, a4);

  }
}

- (void)blurFromRootNavigationTransitionController:(id)a3 requestBackgroundBlurViewVisible:(BOOL)a4
{
  -[SRCompactViewController _requestPresentationBackgroundBlurVisible:forReason:](self, "_requestPresentationBackgroundBlurVisible:forReason:", a4, 4);
}

- (void)blurFromRootNavigationTransitionController:(id)a3 requestHostBlurVisible:(BOOL)a4 requestPresentationBlurVisible:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a5;
  v6 = a4;
  v14 = a3;
  v8 = objc_autoreleasePoolPush();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "windowScene"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_synchronizedDrawingFence"));

  -[SRCompactViewController _requestPresentationBackgroundBlurVisible:forReason:](self, "_requestPresentationBackgroundBlurVisible:forReason:", v5, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v13, "viewController:requestsHostBackgroundBlurVisible:reason:fence:", self, v6, 4, v12);

  objc_autoreleasePoolPop(v8);
}

- (BOOL)_navigationBarHasContentAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGPoint v24;
  CGRect v25;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _navigationController](self, "_navigationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationBar"));
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController navigationController](self, "navigationController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navigationBar"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _compactView](self, "_compactView"));
  objc_msgSend(v17, "convertPoint:fromView:", v18, x, y);
  v20 = v19;
  v22 = v21;

  v25.origin.x = v9;
  v25.origin.y = v11;
  v25.size.width = v13;
  v25.size.height = v15;
  v24.x = v20;
  v24.y = v22;
  return CGRectContainsPoint(v25, v24);
}

- (BOOL)_keyboardHasContentAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[SRCompactViewController _keyboardFrame](self, "_keyboardFrame");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (void)_requestKeyboardWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactViewController delegate](self, "delegate"));
  objc_msgSend(v5, "compactViewController:requestsKeyboardWithCompletion:", self, v4);

}

- (BOOL)_usesDefaultNavigationBar
{
  return SiriUIDeviceIsPad(self, a2) ^ 1;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewControllers"));
  v8 = objc_msgSend(v7, "count");

  if (v8 == (id)2)
  {
    self->_isDrilledIntoSnippet = 1;
    -[SRCompactViewController updateTopInset:animated:](self, "updateTopInset:animated:", 1, self->_topInset);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _dismissalPanGestureRecognizer](self, "_dismissalPanGestureRecognizer"));
    objc_msgSend(v10, "setEnabled:", 0);

    if (-[SRCompactViewController _usesDefaultNavigationBar](self, "_usesDefaultNavigationBar"))
      objc_msgSend(v11, "setNavigationBarHidden:animated:", 0, v5);
  }
  else if (v8 == (id)1)
  {
    self->_isDrilledIntoSnippet = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewController _dismissalPanGestureRecognizer](self, "_dismissalPanGestureRecognizer"));
    objc_msgSend(v9, "setEnabled:", 1);

    if (-[SRCompactViewController _usesDefaultNavigationBar](self, "_usesDefaultNavigationBar"))
      objc_msgSend(v11, "setNavigationBarHidden:animated:", 1, v5);
    -[SRCompactViewController updateTopInset:animated:](self, "updateTopInset:animated:", 1, self->_topInset);
  }

}

- (BOOL)_contentDiffersBetweenPlatterItems:(id)a3 andItems:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 == objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v6, "count"))
    {
      v9 = 0;
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v9));
        v12 = -[SRCompactViewController contentDiffersBetweenItems:andItems:](self, "contentDiffersBetweenItems:andItems:", v11, v10);

        if (v12)
          break;
        ++v9;
      }
      while ((unint64_t)objc_msgSend(v6, "count") > v9);
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (BOOL)contentDiffersBetweenItems:(id)a3 andItems:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v8 = 0;
      v9 = NSArray_ptr;
      v42 = v6;
      v43 = v5;
      while (1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v8, v42, v43));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "aceObject"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v8));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "aceObject"));

        objc_opt_class(v9[53], v14);
        if ((objc_opt_isKindOfClass(v11, v15) & 1) == 0
          || (objc_opt_class(v9[53], v16), (objc_opt_isKindOfClass(v13, v17) & 1) == 0))
        {

          goto LABEL_23;
        }
        v18 = v11;
        v19 = v13;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sash"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "applicationBundleIdentifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sash"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "applicationBundleIdentifier"));
        if (objc_msgSend(v21, "isEqualToString:", v23))
        {
          v45 = v20;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sash"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "title"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sash"));
          v44 = v18;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "title"));
          v28 = objc_msgSend(v25, "isEqualToString:", v27);

          if (!v28)
          {
            v33 = 0;
            v6 = v42;
            v5 = v43;
            v9 = NSArray_ptr;
            v18 = v44;
            goto LABEL_18;
          }
          v18 = v44;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "siriui_card_compact"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "backingCard"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "cardSections"));
          if (v31)
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "siriui_card_compact"));
          else
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "siriui_card"));
          v34 = v32;
          v6 = v42;
          v5 = v43;
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "backingCard"));

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "siriui_card_compact"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "backingCard"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "cardSections"));
          if (v37)
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "siriui_card_compact"));
          else
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "siriui_card"));
          v39 = v38;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "backingCard"));

          v20 = v46;
          v33 = objc_msgSend(v46, "afui_hasContentEqualTo:", v21);
          v9 = NSArray_ptr;
        }
        else
        {

          v33 = 0;
        }

LABEL_18:
        if ((v33 & 1) != 0 && (unint64_t)objc_msgSend(v5, "count") > ++v8)
          continue;
        v40 = v33 ^ 1;
        goto LABEL_24;
      }
    }
    v40 = 0;
  }
  else
  {
LABEL_23:
    v40 = 1;
  }
LABEL_24:

  return v40;
}

- (SRCompactTextRequestViewController)_textRequestViewController
{
  return self->_textRequestViewController;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (SRCompactViewControllerDelegate)delegate
{
  return (SRCompactViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)_activeTranscriptItems
{
  return self->_activeTranscriptItems;
}

- (void)_setActiveTranscriptItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)_activeConversationTranscriptItems
{
  return self->_activeConversationTranscriptItems;
}

- (NSArray)_activeAdditionalPlatterTranscriptItems
{
  return self->_activeAdditionalPlatterTranscriptItems;
}

- (NSArray)_serverUtterances
{
  return self->_serverUtterances;
}

- (SRUIFSpeechRecognitionHypothesis)_speechRecognitionHypothesis
{
  return self->_speechRecognitionHypothesis;
}

- (SiriUINavigationController)_navigationController
{
  return self->_navigationController;
}

- (SRCompactNavigationStackLayoutControlling)_navigationStackLayoutController
{
  return self->_navigationStackLayoutController;
}

- (void)_setNavigationStackLayoutController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationStackLayoutController, a3);
}

- (SiriSharedUICompactResultViewController)_resultViewController
{
  return self->_resultViewController;
}

- (SiriSharedUIViewStackContainerController)_viewStackContainerController
{
  return self->_viewStackContainerController;
}

- (UIViewController)_queuedNavigationContentViewController
{
  return self->_queuedNavigationContentViewController;
}

- (void)_setQueuedNavigationContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_queuedNavigationContentViewController, a3);
}

- (SiriSharedUIPanDismissalGestureRecognizer)_dismissalPanGestureRecognizer
{
  return self->_dismissalPanGestureRecognizer;
}

- (void)_setDismissalPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalPanGestureRecognizer, a3);
}

- (BOOL)_snippetViewControllerRequestsStatusViewHidden
{
  return self->_snippetViewControllerRequestsStatusViewHidden;
}

- (SRCompactEditableUtterancePresenter)_editableUtterancePresenter
{
  return self->_editableUtterancePresenter;
}

- (void)setEditableUtterancePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_editableUtterancePresenter, a3);
}

- (int64_t)_inputType
{
  return self->_inputType;
}

- (SRCompactKeyboardState)_keyboardState
{
  return self->_keyboardState;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_bottomContentInsetComponents
{
  double external;
  double keyboard;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  external = self->_bottomContentInsetComponents.external;
  keyboard = self->_bottomContentInsetComponents.keyboard;
  result.var1 = keyboard;
  result.var0 = external;
  return result;
}

- (SiriUIBackgroundBlurViewController)backgroundBlurViewController
{
  return self->_backgroundBlurViewController;
}

- (void)setBackgroundBlurViewController:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBlurViewController, a3);
}

- (SiriSharedUICompactHostingInstrumentationSupplement)instrumentationSupplement
{
  return self->_instrumentationSupplement;
}

- (SASRequestOptions)activeRequestOptions
{
  return self->_activeRequestOptions;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  self->_isInAmbientInteractivity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRequestOptions, 0);
  objc_storeStrong((id *)&self->_instrumentationSupplement, 0);
  objc_storeStrong((id *)&self->_backgroundBlurViewController, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_editableUtterancePresenter, 0);
  objc_storeStrong((id *)&self->_dismissalPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_queuedNavigationContentViewController, 0);
  objc_storeStrong((id *)&self->_viewStackContainerController, 0);
  objc_storeStrong((id *)&self->_resultViewController, 0);
  objc_storeStrong((id *)&self->_navigationStackLayoutController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_speechRecognitionHypothesis, 0);
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_storeStrong((id *)&self->_activeAdditionalPlatterTranscriptItems, 0);
  objc_storeStrong((id *)&self->_activeConversationTranscriptItems, 0);
  objc_storeStrong((id *)&self->_activeTranscriptItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textRequestViewController, 0);
  objc_storeStrong((id *)&self->_fullScreenEffects, 0);
}

@end
