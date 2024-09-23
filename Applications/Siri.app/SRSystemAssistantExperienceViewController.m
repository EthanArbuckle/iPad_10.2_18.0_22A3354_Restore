@implementation SRSystemAssistantExperienceViewController

- (SRSystemAssistantExperienceViewController)init
{
  SRSystemAssistantExperienceViewController *v2;
  SRSystemAssistantExperienceViewController *v3;
  uint64_t v4;
  NSMutableArray *finalAndDisplayedSmartDialogs;
  SiriSharedUISystemAssistantExperienceContainerView *v6;
  SiriSharedUISystemAssistantExperienceContainerView *containerView;
  SRSystemAssistantExperienceRootViewController *v8;
  SRSystemAssistantExperienceRootViewController *rootViewController;
  SiriSharedUICompactResultViewController *v10;
  SiriSharedUICompactResultViewController *resultViewController;
  SiriUINavigationController *v12;
  SiriUINavigationController *navigationController;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  SiriSharedUICompactHostingInstrumentationSupplement *v19;
  SiriSharedUICompactHostingInstrumentationSupplement *instrumentationSupplement;
  id v21;
  SRUIFPreferences *v22;
  SRUIFPreferences *preferences;
  uint64_t v24;
  UIViewSpringAnimationBehavior *defaultSpringAnimationBehavior;
  uint64_t v26;
  UIViewSpringAnimationBehavior *pillMergeSpringAnimationBehavior;
  uint64_t v28;
  UIViewSpringAnimationBehavior *suggestionsSpringAnimationBehavior;
  SRTypeToSiriKeyboardReadinessObserver *v30;
  SRTypeToSiriKeyboardReadinessObserver *typeToSiriKeyboardReadinessObserver;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SRSystemAssistantExperienceViewController;
  v2 = -[SRSystemAssistantExperienceViewController initWithNibName:bundle:](&v33, "initWithNibName:bundle:", 0, 0);
  v3 = v2;
  if (v2)
  {
    v2->_animatingInActiveSmartDialogView = 0;
    v2->_animatingPillSize = 0;
    v2->_activeSmartDialogIsLatencyPill = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    finalAndDisplayedSmartDialogs = v3->_finalAndDisplayedSmartDialogs;
    v3->_finalAndDisplayedSmartDialogs = (NSMutableArray *)v4;

    v6 = (SiriSharedUISystemAssistantExperienceContainerView *)objc_alloc_init((Class)SiriSharedUISystemAssistantExperienceContainerView);
    containerView = v3->_containerView;
    v3->_containerView = v6;

    -[SiriSharedUISystemAssistantExperienceContainerView setDelegate:](v3->_containerView, "setDelegate:", v3);
    v8 = -[SRSystemAssistantExperienceRootViewController initWithContainerView:]([SRSystemAssistantExperienceRootViewController alloc], "initWithContainerView:", v3->_containerView);
    rootViewController = v3->_rootViewController;
    v3->_rootViewController = v8;

    v10 = (SiriSharedUICompactResultViewController *)objc_alloc_init((Class)SiriSharedUICompactResultViewController);
    resultViewController = v3->_resultViewController;
    v3->_resultViewController = v10;

    v12 = (SiriUINavigationController *)objc_msgSend(objc_alloc((Class)SiriUINavigationController), "initWithRootViewController:", v3->_rootViewController);
    navigationController = v3->_navigationController;
    v3->_navigationController = v12;

    -[SiriUINavigationController setDelegate:](v3->_navigationController, "setDelegate:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController view](v3->_navigationController, "view"));
    objc_msgSend(v14, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute());

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController navigationBar](v3->_navigationController, "navigationBar"));
    objc_msgSend(v15, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute());

    v16 = objc_alloc_init((Class)SiriUIBackgroundBlurViewController);
    -[SRSystemAssistantExperienceViewController setBackgroundBlurViewController:](v3, "setBackgroundBlurViewController:", v16);

    v17 = objc_alloc((Class)SiriSharedUICompactHostingInstrumentationSupplement);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _instrumentationManager](v3, "_instrumentationManager"));
    v19 = (SiriSharedUICompactHostingInstrumentationSupplement *)objc_msgSend(v17, "initWithInstrumentationManager:", v18);
    instrumentationSupplement = v3->_instrumentationSupplement;
    v3->_instrumentationSupplement = v19;

    -[SRSystemAssistantExperienceViewController _registerForAmbientPresentationTraitChange](v3, "_registerForAmbientPresentationTraitChange");
    v21 = objc_alloc((Class)SRUIFPreferences);
    v22 = (SRUIFPreferences *)objc_msgSend(v21, "initWithSuiteName:", SRUIFPreferencesDefaultDomain);
    preferences = v3->_preferences;
    v3->_preferences = v22;

    v24 = objc_claimAutoreleasedReturnValue(+[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", SiriSharedUISAEContainerSpringDampingRatio, SiriSharedUISAEContainerSpringResponse));
    defaultSpringAnimationBehavior = v3->_defaultSpringAnimationBehavior;
    v3->_defaultSpringAnimationBehavior = (UIViewSpringAnimationBehavior *)v24;

    v26 = objc_claimAutoreleasedReturnValue(+[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", SiriSharedUISAEContainerPillMergeSpringDampingRatio, SiriSharedUISAEContainerPillMergeSpringResponse));
    pillMergeSpringAnimationBehavior = v3->_pillMergeSpringAnimationBehavior;
    v3->_pillMergeSpringAnimationBehavior = (UIViewSpringAnimationBehavior *)v26;

    v28 = objc_claimAutoreleasedReturnValue(+[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", SiriSharedUISAESuggestionsSpringDampingRatio, SiriSharedUISAESuggestionsSpringResponse));
    suggestionsSpringAnimationBehavior = v3->_suggestionsSpringAnimationBehavior;
    v3->_suggestionsSpringAnimationBehavior = (UIViewSpringAnimationBehavior *)v28;

    v30 = -[SRTypeToSiriKeyboardReadinessObserver initWithDelegate:]([SRTypeToSiriKeyboardReadinessObserver alloc], "initWithDelegate:", v3);
    typeToSiriKeyboardReadinessObserver = v3->_typeToSiriKeyboardReadinessObserver;
    v3->_typeToSiriKeyboardReadinessObserver = v30;

    v3->_shouldShowSuggestions = 1;
  }
  return v3;
}

- (void)_executePreTransitionBlocks
{
  NSObject *v3;
  id serverUtteranceUpdateBlock;
  NSObject *v5;
  id smartDialogCardBlock;
  NSObject *v7;
  id smartDialogPluginBlock;
  NSObject *v9;
  id snippetUpdateBlock;
  int v11;
  const char *v12;

  -[SiriSharedUISmartDialogView updateUserUtteranceVisibilityIfNeeded](self->_activeSmartDialogView, "updateUserUtteranceVisibilityIfNeeded");
  if (self->serverUtteranceUpdateBlock)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[SRSystemAssistantExperienceViewController _executePreTransitionBlocks]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #smartdialog performing server utterance update", (uint8_t *)&v11, 0xCu);
    }
    (*((void (**)(void))self->serverUtteranceUpdateBlock + 2))();
    serverUtteranceUpdateBlock = self->serverUtteranceUpdateBlock;
    self->serverUtteranceUpdateBlock = 0;

  }
  if (self->smartDialogCardBlock)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[SRSystemAssistantExperienceViewController _executePreTransitionBlocks]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #smartdialog performing smart dialog card update", (uint8_t *)&v11, 0xCu);
    }
    (*((void (**)(void))self->smartDialogCardBlock + 2))();
    smartDialogCardBlock = self->smartDialogCardBlock;
    self->smartDialogCardBlock = 0;

  }
  if (self->smartDialogPluginBlock)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[SRSystemAssistantExperienceViewController _executePreTransitionBlocks]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #smartdialog performing smart dialog plugin update", (uint8_t *)&v11, 0xCu);
    }
    (*((void (**)(void))self->smartDialogPluginBlock + 2))();
    smartDialogPluginBlock = self->smartDialogPluginBlock;
    self->smartDialogPluginBlock = 0;

  }
  if (-[SiriSharedUISmartDialogView hasResult](self->_activeSmartDialogView, "hasResult"))
    -[SiriSharedUISmartDialogView triggerSmartDialogAnimationWithDelay:](self->_activeSmartDialogView, "triggerSmartDialogAnimationWithDelay:", 0.0);
  if (self->snippetUpdateBlock)
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[SRSystemAssistantExperienceViewController _executePreTransitionBlocks]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #smartdialog performing snippet update", (uint8_t *)&v11, 0xCu);
    }
    (*((void (**)(void))self->snippetUpdateBlock + 2))();
    snippetUpdateBlock = self->snippetUpdateBlock;
    self->snippetUpdateBlock = 0;

  }
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
      v10[2] = sub_10000A80C;
      v10[3] = &unk_1001225C0;
      v10[4] = self;
      v8 = v10;
    }
    else
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000A894;
      v9[3] = &unk_1001225E8;
      v9[4] = self;
      *(double *)&v9[5] = a3;
      v8 = v9;
    }
    +[UIView _animateWithDuration:delay:options:animations:start:completion:](UIView, "_animateWithDuration:delay:options:animations:start:completion:", 196608, v8, 0, 0, v7, 0.0);
  }
}

- (void)loadView
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  _TtC4Siri30SystemAssistantPromptEntryView *v13;
  void *v14;
  SiriSharedUIFeedbackController *v15;
  SiriSharedUIFeedbackController *feedbackController;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SRSystemAssistantExperienceViewController loadView]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  -[SRSystemAssistantExperienceViewController addChildViewController:](self, "addChildViewController:", v4);
  v6 = objc_alloc_init((Class)AFUITouchPassThroughView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v6, "setOpaque:", 0);
  objc_msgSend(v6, "setAutoresizingMask:", 18);
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v6, "addSubview:", v5);
  if (!_os_feature_enabled_impl("SiriUI", "type_to_siri_in_call"))
    goto LABEL_8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeRequestOptions](self, "activeRequestOptions"));
  if (objc_msgSend(v8, "requestSource") != (id)47)
  {

    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState"));
  v10 = objc_msgSend(v9, "isInActiveCall");

  if ((v10 & 1) == 0)
  {
LABEL_8:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("microphone")));
    objc_initWeak((id *)buf, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000ACBC;
    v19[3] = &unk_100122610;
    objc_copyWeak(&v20, (id *)buf);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("microphone"), v12, 0, v19));
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:
  v13 = -[SystemAssistantPromptEntryView initWithFrame:dictationReplacementAction:]([_TtC4Siri30SystemAssistantPromptEntryView alloc], "initWithFrame:dictationReplacementAction:", v11, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[SRSystemAssistantExperienceViewController setPromptEntryView:](self, "setPromptEntryView:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController promptEntryView](self, "promptEntryView"));
  objc_msgSend(v14, "setDelegate:", self);

  objc_msgSend(v4, "didMoveToParentViewController:", self);
  v15 = (SiriSharedUIFeedbackController *)objc_msgSend(objc_alloc((Class)SiriSharedUIFeedbackController), "initWithNibName:bundle:", 0, 0);
  feedbackController = self->_feedbackController;
  self->_feedbackController = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUIFeedbackController view](self->_feedbackController, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
  objc_msgSend(v18, "setAllowsHitTesting:", 0);

  -[SRSystemAssistantExperienceViewController setView:](self, "setView:", v6);
}

- (void)_didPressReportConcernButton
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  __CFString *v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIImage *v25;
  NSData *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v3, "cancelRequestForViewController:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v4, "siriSAEViewCOntrollerRequestStopAttending:", self);

  v5 = objc_alloc_init((Class)SiriSharedUIFeedbackModel);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "feedbackFormForCurrentRequest"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    v9 = objc_msgSend(v8, "isEqualToString:", SAUIFeedbackFormDomainDeviceExpertValue);

    objc_msgSend(v5, "setFeedbackDomain:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "input"));
    objc_msgSend(v5, "setUserInput:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "output"));
    objc_msgSend(v5, "setSiriDialog:", v11);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _smartDialogSpeechRecognitionHypothesis](self, "_smartDialogSpeechRecognitionHypothesis"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userUtterance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bestTextInterpretation"));
    objc_msgSend(v5, "setUserInput:", v14);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = self->_serverUtterances;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      v19 = &stru_100125588;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "text"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v21));

          v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingString:", CFSTR("\n")));
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v17);
    }
    else
    {
      v19 = &stru_100125588;
    }

    objc_msgSend(v5, "setSiriDialog:", v19);
    v7 = 0;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
  objc_msgSend(v24, "bounds");
  v25 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_imageFromRect:"));

  v26 = UIImageJPEGRepresentation(v25, 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  objc_msgSend(v5, "setImageRepresentationOfSnippet:", v27);

  v28 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v29 = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInput"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "siriDialog"));
    *(_DWORD *)buf = 136315650;
    v39 = "-[SRSystemAssistantExperienceViewController _didPressReportConcernButton]";
    v40 = 2112;
    v41 = v30;
    v42 = 2112;
    v43 = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s #feedback - donating feedback with input: %@, output: %@", buf, 0x20u);

  }
  -[SRSystemAssistantExperienceViewController addChildViewController:](self, "addChildViewController:", self->_feedbackController);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUIFeedbackController view](self->_feedbackController, "view"));
  objc_msgSend(v32, "insertSubview:atIndex:", v33, 0);

  -[SiriSharedUIFeedbackController didMoveToParentViewController:](self->_feedbackController, "didMoveToParentViewController:", self);
  -[SiriSharedUIFeedbackController userDidReportConcernWithModel:](self->_feedbackController, "userDidReportConcernWithModel:", v5);

}

- (id)_createNewSmartDialog
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)SiriSharedUISmartDialogView), "initWithResultView:", 0);
  -[SRSystemAssistantExperienceViewController configureSmartDialog:](self, "configureSmartDialog:", v3);
  return v3;
}

- (id)_createSmartDialogViewsFromSuggestionViews:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = objc_alloc((Class)SiriSharedUISmartDialogView);
        v13 = objc_msgSend(v12, "initWithSuggestionView:", v11, (_QWORD)v15);
        -[SRSystemAssistantExperienceViewController configureSmartDialog:](self, "configureSmartDialog:", v13);
        objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)configureSmartDialog:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setInteractionDelegate:", self);
  objc_msgSend(v5, "setDropletContainerDelegate:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v4, "setAllowsGroupOpacity:", 0);

  objc_msgSend(v5, "setClipsToBounds:", 1);
  objc_msgSend(v5, "setAlwaysShowSpeech:", self->_alwaysShowSpeech);
  objc_msgSend(v5, "setPopoverViewController:", self);

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  SRSystemAssistantExperienceNavigationTransitionController *v5;
  SRSystemAssistantExperienceNavigationTransitionController *v6;
  id v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SRSystemAssistantExperienceViewController;
  -[SRSystemAssistantExperienceViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
  objc_msgSend(v3, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute());

  objc_initWeak(&location, self);
  v4 = objc_alloc((Class)SiriUIMultiNavigationTransitionController);
  v5 = [SRSystemAssistantExperienceNavigationTransitionController alloc];
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10000B490;
  v12 = &unk_100122638;
  objc_copyWeak(&v13, &location);
  v6 = -[SRSystemAssistantExperienceNavigationTransitionController initWithDismissalBlock:](v5, "initWithDismissalBlock:", &v9);
  v7 = objc_msgSend(v4, "initWithPrimaryTransitionController:", v6, v9, v10, v11, v12);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
  objc_msgSend(v8, "setTransitionController:", v7);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
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
  v15.super_class = (Class)SRSystemAssistantExperienceViewController;
  -[SRSystemAssistantExperienceViewController viewWillAppear:](&v15, "viewWillAppear:", a3);
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
  v8.super_class = (Class)SRSystemAssistantExperienceViewController;
  -[SRSystemAssistantExperienceViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  objc_msgSend(v4, "systemUptime");
  self->_presentationTime = v5;

  if (-[SRSystemAssistantExperienceViewController _alwaysObscureBackgroundContentWhenActive](self, "_alwaysObscureBackgroundContentWhenActive"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
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
  v5.super_class = (Class)SRSystemAssistantExperienceViewController;
  -[SRSystemAssistantExperienceViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
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
  v29.super_class = (Class)SRSystemAssistantExperienceViewController;
  -[SRSystemAssistantExperienceViewController viewDidDisappear:](&v29, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _smartDialogSpeechRecognitionHypothesis](self, "_smartDialogSpeechRecognitionHypothesis"));

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRUIFSpeechRecognitionHypothesis backingAceObject](self->_speechRecognitionHypothesis, "backingAceObject"));
    objc_msgSend(WeakRetained, "saeViewController:viewDidDisappearForAceObject:", self, v6);

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
        objc_msgSend(v13, "saeViewController:viewDidDisappearForAceObject:", self, v12);

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
  -[SRSystemAssistantExperienceViewController _setKeyboardState:](self, "_setKeyboardState:", 0);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SRSystemAssistantExperienceViewController;
  -[SRSystemAssistantExperienceViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  -[SRSystemAssistantExperienceViewController _updateSAEViewSize](self, "_updateSAEViewSize");
}

- (void)_updateSAEViewSize
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
  uint64_t v18;
  uint64_t v19;
  uint64_t IsPad;
  uint64_t v21;
  double v22;
  CGFloat v23;
  double Height;
  CGFloat v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double Width;
  CGFloat v34;
  void *v35;
  void *v36;
  double v37;
  int IsRTL;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  CGFloat v46;
  void *v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if ((SiriSharedUIDeviceIsPad() & 1) != 0)
  {
    v4 = v47;
  }
  else
  {
    IsMac = SiriSharedUIDeviceIsMac();
    v4 = v47;
    if (!IsMac)
      goto LABEL_14;
  }
  if (v4)
  {
    objc_msgSend(v4, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "windowScene"));
    v15 = SiriSharedUICompactSlideOverContentSpacingOnPad(objc_msgSend(v14, "interfaceOrientation"), v7, v9, v11, v13);
    v17 = v16;

    IsPad = SiriUIDeviceIsPad(v18, v19);
    if ((_DWORD)IsPad)
    {
      v22 = SiriSharedUICompactAmbientContentScaleAmount;
      if (!self->_isInAmbient)
        v22 = 1.0;
      v23 = SiriSharedUICompactContentMaxWidth * v22;
      v48.origin.x = v7;
      v48.origin.y = v9;
      v48.size.width = v11;
      v48.size.height = v13;
      Height = CGRectGetHeight(v48);
      v49.origin.x = v7;
      v49.origin.y = v9;
      v49.size.width = v11;
      v49.size.height = v13;
      v25 = (CGRectGetWidth(v49) - v23) * 0.5;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
      objc_msgSend(v26, "setFrame:", v25, 0.0, v23, Height);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
      objc_msgSend(v27, "safeAreaInsets");
      v29 = v28 + 16.0;

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
      objc_msgSend(v30, "safeAreaInsets");
      v32 = v31 + 20.0;

      v50.origin.y = 0.0;
      v50.origin.x = v25;
      v50.size.width = v23;
      v50.size.height = Height;
      Width = CGRectGetWidth(v50);
      v51.origin.y = 0.0;
      v51.origin.x = v25;
      v51.size.width = v23;
      v51.size.height = Height;
      v34 = CGRectGetHeight(v51) - v29 - v32;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "view"));
      objc_msgSend(v36, "setFrame:", 0.0, v29, Width, v34);

    }
    else
    {
      v37 = v15 + v17 + SiriSharedUICompactLeftPaddingForShadowOutsetsiPad;
      IsRTL = SiriLanguageIsRTL(IsPad, v21);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
      v39 = v7;
      v40 = v9;
      v41 = v11;
      v42 = v13;
      if (IsRTL)
      {
        v43 = CGRectGetHeight(*(CGRect *)&v39);
        v44 = 0.0;
        v45 = v35;
      }
      else
      {
        v46 = CGRectGetWidth(*(CGRect *)&v39) - v37;
        v52.origin.x = v7;
        v52.origin.y = v9;
        v52.size.width = v11;
        v52.size.height = v13;
        v43 = CGRectGetHeight(v52);
        v45 = v35;
        v44 = v46;
      }
      objc_msgSend(v45, "setFrame:", v44, 0.0, v37, v43);
    }

    v4 = v47;
  }
LABEL_14:

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SRSystemAssistantExperienceViewController;
  v6 = a3;
  -[SRSystemAssistantExperienceViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v11, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, a4);
  v7 = objc_msgSend(v6, "verticalSizeClass", v11.receiver, v11.super_class);

  if (v7 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    v9 = objc_msgSend(v8, "isDisplayingResponse");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController promptEntryView](self, "promptEntryView"));
      objc_msgSend(v10, "resignKeyboard");

    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  objc_super v7;

  height = a3.height;
  width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)SRSystemAssistantExperienceViewController;
  -[SRSystemAssistantExperienceViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, "viewWillTransitionToSize:withTransitionCoordinator:", a4);
  if (height <= width)
    -[SRSystemAssistantExperienceViewController _updateAmbientAvailability](self, "_updateAmbientAvailability");
  else
    -[SRSystemAssistantExperienceViewController setIsInAmbient:](self, "setIsInAmbient:", 0);
}

- (void)compactViewModelDidChange:(id)a3 withDiff:(unint64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t Description;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  unsigned int v32;
  BOOL v33;
  unsigned int v35;
  void *v36;
  int v37;
  int v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  char v44;
  uint64_t v45;
  void *i;
  void *v47;
  unsigned int v48;
  int v49;
  id v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  SiriSharedUISmartDialogView *v55;
  SiriSharedUISmartDialogView *activeSmartDialogView;
  unsigned int v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  unsigned int v64;
  BOOL v65;
  int v66;
  _BOOL4 v67;
  void *v68;
  SiriSharedUISmartDialogView *v69;
  SiriSharedUISmartDialogView *v70;
  NSObject *v71;
  SiriSharedUISmartDialogView *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  BOOL alwaysShowSpeech;
  void *v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  void *j;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  unsigned int v92;
  void *v93;
  SRSystemAssistantExperienceViewController *v94;
  SRSystemAssistantExperienceViewController *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  BOOL v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  char v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  uint8_t v116[128];
  uint8_t buf[4];
  const char *v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  void *v122;

  v6 = a3;
  v7 = v6;
  v106 = a4;
  if (a4 != 16)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resultTranscriptItems"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversationTranscriptItems"));
    v23 = objc_msgSend(v22, "mutableCopy");

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverUtterances"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "speechRecognitionHypothesis"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "latencyViewModel"));
    v26 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v118 = "-[SRSystemAssistantExperienceViewController compactViewModelDidChange:withDiff:]";
      v119 = 2112;
      v120 = (uint64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s #compact Setting active transcript items to : %@", buf, 0x16u);
    }
    v27 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v118 = "-[SRSystemAssistantExperienceViewController compactViewModelDidChange:withDiff:]";
      v119 = 2112;
      v120 = (uint64_t)v23;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s #compact Setting active conversation transcript items to : %@", buf, 0x16u);
    }
    v28 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v118 = "-[SRSystemAssistantExperienceViewController compactViewModelDidChange:withDiff:]";
      v119 = 2112;
      v120 = v24;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s #compact Setting server utterances to : %@", buf, 0x16u);
    }
    v29 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v118 = "-[SRSystemAssistantExperienceViewController compactViewModelDidChange:withDiff:]";
      v119 = 2112;
      v120 = (uint64_t)v25;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s #compact Setting speech recognition hypothesis to : %@", buf, 0x16u);
    }
    v30 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v118 = "-[SRSystemAssistantExperienceViewController compactViewModelDidChange:withDiff:]";
      v119 = 2112;
      v120 = (uint64_t)v104;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s #compact Setting latency view model to : %@", buf, 0x16u);
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "backingAceObject"));

    v103 = (void *)v24;
    if (self->_alwaysShowSpeech || !v31)
      v32 = 1;
    else
      v32 = -[SRUIFSpeechRecognitionHypothesis isFinal](self->_speechRecognitionHypothesis, "isFinal");
    v33 = (v106 & 0x47) == 0;
    if ((v106 & 8) != 0 && v32 != 0)
      v33 = 0;
    v100 = v33;
    v97 = objc_msgSend(v21, "count");
    v35 = -[SRSystemAssistantExperienceViewController requireFinalSpeechHypothesisBeforeAppearance](self, "requireFinalSpeechHypothesisBeforeAppearance");
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "userUtterance"));

    v102 = v23;
    v105 = v25;
    if (v35 && (objc_msgSend(v25, "isFinal") & 1) != 0)
      v37 = 1;
    else
      v37 = v35 ^ 1;
    if (v36)
      v38 = v37;
    else
      v38 = 0;
    v39 = v103;
    v101 = v21;
    if (objc_msgSend(v103, "count") && self->_isInAmbient)
    {
      v94 = self;
      v40 = v7;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v41 = v103;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v111, v116, 16);
      if (v42)
      {
        v43 = v42;
        v44 = 0;
        v45 = *(_QWORD *)v112;
        do
        {
          for (i = 0; i != v43; i = (char *)i + 1)
          {
            if (*(_QWORD *)v112 != v45)
              objc_enumerationMutation(v41);
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)i), "dialogIdentifier"));
            v48 = objc_msgSend(v47, "isEqual:", CFSTR("PlaybackControls#SilenceInterstitials"));

            if (v48)
              v44 = 1;
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v111, v116, 16);
        }
        while (v43);
      }
      else
      {
        v44 = 0;
      }

      v49 = v44 & 1;
      v7 = v40;
      self = v94;
      v21 = v101;
      v39 = v103;
    }
    else
    {
      v49 = 0;
    }
    if (objc_msgSend(v21, "count") || objc_msgSend(v102, "count"))
      goto LABEL_55;
    v50 = objc_msgSend(v39, "count");
    v51 = v49 ^ 1;
    if (!v50)
      v51 = 0;
    if ((v51 | v38) == 1)
    {
LABEL_55:
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
      objc_msgSend(v52, "didPresentContentForSAEViewController:", self);

    }
    if ((v106 & 1) != 0 && objc_msgSend(v21, "count"))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
      objc_msgSend(v53, "didBeginProcessingConversationItems");

    }
    v54 = v102;
    if (!self->_activeSmartDialogView)
    {
      v55 = (SiriSharedUISmartDialogView *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _createNewSmartDialog](self, "_createNewSmartDialog"));
      activeSmartDialogView = self->_activeSmartDialogView;
      self->_activeSmartDialogView = v55;

      self->_activeViewModelHasSnippets = 0;
      self->_activeSmartDialogPresented = 0;
    }
    if (v105)
      v57 = objc_msgSend(v105, "isFinal") ^ 1;
    else
      v57 = 0;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUISmartDialogView speechRecognitionHypothesis](self->_activeSmartDialogView, "speechRecognitionHypothesis"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "userUtterance"));
    v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "bestTextInterpretation"));

    v61 = (void *)v60;
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "userUtterance"));
    v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "bestTextInterpretation"));

    v64 = 0;
    if (v61 && v63)
    {
      if (objc_msgSend(v105, "isFinal"))
        v64 = objc_msgSend(v61, "isEqual:", v63) ^ 1;
      else
        v64 = 0;
    }
    v98 = (void *)v63;
    v99 = v61;
    if (v61)
      v65 = 1;
    else
      v65 = v63 == 0;
    v66 = !v65;
    if (objc_msgSend(v102, "count"))
    {
      v67 = 0;
    }
    else
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUISmartDialogView conversationSnippetViews](self->_activeSmartDialogView, "conversationSnippetViews"));
      v67 = objc_msgSend(v68, "count") != 0;

    }
    if (-[SiriSharedUISmartDialogView hasResult](self->_activeSmartDialogView, "hasResult"))
    {
      if ((objc_msgSend(v104, "shouldDisplay") | v57 | v64 | v67 | v66) == 1)
      {
        -[NSMutableArray addObject:](self->_finalAndDisplayedSmartDialogs, "addObject:", self->_activeSmartDialogView);
        v69 = (SiriSharedUISmartDialogView *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _createNewSmartDialog](self, "_createNewSmartDialog"));
        v70 = self->_activeSmartDialogView;
        self->_activeSmartDialogView = v69;

        self->_activeViewModelHasSnippets = 0;
        self->_activeSmartDialogPresented = 0;
        v71 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          v72 = self->_activeSmartDialogView;
          *(_DWORD *)buf = 136315394;
          v118 = "-[SRSystemAssistantExperienceViewController compactViewModelDidChange:withDiff:]";
          v119 = 2112;
          v120 = (uint64_t)v72;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%s #droplet set new activeSmartDialog to %@", buf, 0x16u);
        }
      }
    }
    -[SiriSharedUISmartDialogView setIsInAmbient:](self->_activeSmartDialogView, "setIsInAmbient:", self->_isInAmbient);
    -[SRSystemAssistantExperienceViewController _setSmartDialogSpeechRecognitionHypothesis:](self, "_setSmartDialogSpeechRecognitionHypothesis:", v105);
    -[SRSystemAssistantExperienceViewController _setSmartDialogLatencyViewModel:](self, "_setSmartDialogLatencyViewModel:", v104);
    if ((v106 & 2) == 0)
    {
      -[SRSystemAssistantExperienceViewController _setActiveConversationTranscriptItems:](self, "_setActiveConversationTranscriptItems:", v102);
      v73 = v103;
LABEL_110:
      -[SRSystemAssistantExperienceViewController _setSmartDialogServerUtterances:](self, "_setSmartDialogServerUtterances:", v73);
      v20 = v101;
      if ((v106 & 1) != 0)
        -[SRSystemAssistantExperienceViewController _updateActiveTranscriptItems:](self, "_updateActiveTranscriptItems:", v101);
      v91 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v118 = "-[SRSystemAssistantExperienceViewController compactViewModelDidChange:withDiff:]";
        _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%s #compact Applying updates", buf, 0xCu);
      }
      if ((v106 & 1) != 0)
        v92 = -[SRSystemAssistantExperienceViewController _updateActiveTranscriptItems:](self, "_updateActiveTranscriptItems:", v101);
      else
        v92 = 0;
      if (!v100)
      {
        if ((!v97 || !v92) && !self->_animatingInActiveSmartDialogView)
          -[SRSystemAssistantExperienceViewController _presentOrTransitionActiveSmartDialogView](self, "_presentOrTransitionActiveSmartDialogView");
        v93 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
        objc_msgSend(v93, "contentDidUpdate");

      }
      goto LABEL_124;
    }
    v74 = objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _filterTranscriptItemsForSAEDialogBoxContent:](self, "_filterTranscriptItemsForSAEDialogBoxContent:", v102));
    v75 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIUtilities filterTranscriptItemsForRFPluginContent:](SiriSharedUIUtilities, "filterTranscriptItemsForRFPluginContent:", v102));
    v76 = (void *)v75;
    v73 = v103;
    if (v74 | v75)
    {
      self->_hasSmartDialogSnippet = 1;
      if (v74 && v75)
      {
        v77 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          sub_10009D698(v77);
        goto LABEL_92;
      }
      if (v74)
      {
LABEL_92:
        -[SRSystemAssistantExperienceViewController _setActiveConversationTranscriptItems:](self, "_setActiveConversationTranscriptItems:", v102);
        -[SRSystemAssistantExperienceViewController _setSmartDialogCard:](self, "_setSmartDialogCard:", v74);
LABEL_109:

        goto LABEL_110;
      }
      if (v75)
      {
        v95 = self;
        v96 = v7;
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v82 = v102;
        v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
        if (v83)
        {
          v84 = v83;
          v85 = *(_QWORD *)v108;
          do
          {
            for (j = 0; j != v84; j = (char *)j + 1)
            {
              if (*(_QWORD *)v108 != v85)
                objc_enumerationMutation(v82);
              v87 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)j);
              v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "aceObject"));
              v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "aceId"));
              v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "aceId"));

              if (v89 != v90)
                objc_msgSend(v81, "addObject:", v87);
            }
            v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
          }
          while (v84);
        }

        self = v95;
        -[SRSystemAssistantExperienceViewController _setActiveConversationTranscriptItems:](v95, "_setActiveConversationTranscriptItems:", v81);
        -[SRSystemAssistantExperienceViewController _setSmartDialogPlugin:](v95, "_setSmartDialogPlugin:", v76);

        v7 = v96;
        v54 = v102;
        v73 = v103;
        v74 = 0;
        goto LABEL_109;
      }
    }
    else if (objc_msgSend(v103, "count"))
    {
      self->_hasSmartDialogSnippet = 1;
    }
    else
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "serverUtterances"));
      if (objc_msgSend(v79, "count"))
        alwaysShowSpeech = 1;
      else
        alwaysShowSpeech = self->_alwaysShowSpeech;
      self->_hasSmartDialogSnippet = alwaysShowSpeech;

      v73 = v103;
    }
    -[SRSystemAssistantExperienceViewController _setActiveConversationTranscriptItems:](self, "_setActiveConversationTranscriptItems:", v102);
    goto LABEL_109;
  }
  v8 = -[SRSystemAssistantExperienceViewController _inputType](self, "_inputType");
  v9 = objc_msgSend(v7, "inputType");
  v10 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    Description = SiriSharedUIViewModelInputTypeGetDescription(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(Description);
    *(_DWORD *)buf = 136315394;
    v118 = "-[SRSystemAssistantExperienceViewController compactViewModelDidChange:withDiff:]";
    v119 = 2112;
    v120 = (uint64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #compact Setting input type to : %@", buf, 0x16u);

  }
  -[SRSystemAssistantExperienceViewController _setInputType:](self, "_setInputType:", v9);
  if (v8 == 1 && v9 == (id)2)
  {
    v14 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = SiriSharedUIViewModelInputTypeGetDescription(1);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = SiriSharedUIViewModelInputTypeGetDescription(2);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 136315650;
      v118 = "-[SRSystemAssistantExperienceViewController compactViewModelDidChange:withDiff:]";
      v119 = 2112;
      v120 = (uint64_t)v17;
      v121 = 2112;
      v122 = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s #compact Switched input type from : %@ to : %@", buf, 0x20u);

    }
    v20 = objc_msgSend(objc_alloc((Class)SASRequestOptions), "initWithRequestSource:uiPresentationIdentifier:", 2, CFSTR("com.apple.siri.SystemAssistantExperience"));
    objc_msgSend(v20, "setPreviousInteractionInputType:", 1);
    -[SRSystemAssistantExperienceViewController handleVoiceActivationRequestWithRequestOptions:](self, "handleVoiceActivationRequestWithRequestOptions:", v20);
LABEL_124:

  }
}

- (void)_setupFeedbackButton
{
  _TtC4Siri16SRFeedbackButton *v3;
  _TtC4Siri16SRFeedbackButton *feedbackButton;
  id v5;

  if (!self->_feedbackButton)
  {
    v3 = (_TtC4Siri16SRFeedbackButton *)objc_claimAutoreleasedReturnValue(+[SRFeedbackButton buttonWithType:](_TtC4Siri16SRFeedbackButton, "buttonWithType:", 1));
    feedbackButton = self->_feedbackButton;
    self->_feedbackButton = v3;

    -[SRFeedbackButton addTarget:action:forControlEvents:](self->_feedbackButton, "addTarget:action:forControlEvents:", self, "_didPressReportConcernButton", 64);
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    objc_msgSend(v5, "setBottomFloatingButton:", self->_feedbackButton);

  }
}

- (id)_snippetFromTranscriptItems
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _activeConversationTranscriptItems](self, "_activeConversationTranscriptItems", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewController"));
        objc_opt_class(_TtC4Siri34SiriUIVisualResponseViewController, v9);
        if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
        {

LABEL_13:
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewController"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));

          goto LABEL_14;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewController"));
        objc_opt_class(SiriUICardSnippetViewController, v12);
        isKindOfClass = objc_opt_isKindOfClass(v11, v13);

        if ((isKindOfClass & 1) != 0)
          goto LABEL_13;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v15 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_14:

  return v15;
}

- (id)_createBackgroundView:(id)a3
{
  id v4;
  NSObject *v5;
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
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  int v32;
  const char *v33;

  v4 = objc_alloc_init((Class)SiriSharedUISmartDialogBackgroundView);
  if (!self->_hasSmartDialogSnippet)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "traitCollection"));
    v26 = objc_msgSend(v25, "userInterfaceStyle");

    if (v26 == (id)1)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 13));
      objc_msgSend(v4, "setEffect:", v27);

      v28 = AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        return v4;
      v32 = 136315138;
      v33 = "-[SRSystemAssistantExperienceViewController _createBackgroundView:]";
      v29 = "%s #background: set light material";
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 18));
      objc_msgSend(v4, "setEffect:", v30);

      v28 = AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        return v4;
      v32 = 136315138;
      v33 = "-[SRSystemAssistantExperienceViewController _createBackgroundView:]";
      v29 = "%s #background: set dark material";
    }
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v32, 0xCu);
    return v4;
  }
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v32 = 136315138;
    v33 = "-[SRSystemAssistantExperienceViewController _createBackgroundView:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #background: snippet insecting in SmartDialogContainer, use GM material for background", (uint8_t *)&v32, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUISystemAssistantExperienceContainerView createDefaultMaterialBackgroundView](self->_containerView, "createDefaultMaterialBackgroundView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v7, "addSubview:", v6);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  objc_msgSend(v15, "setActive:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v19, "setActive:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  objc_msgSend(v23, "setActive:", 1);

  return v4;
}

- (id)_snippetBackgroundViewInSmartDialog
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "snippetBackgroundView"));

  objc_opt_class(SiriSharedUISmartDialogBackgroundView, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)requireFinalSpeechHypothesisBeforeAppearance
{
  return !self->_isInAmbient;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[SRSystemAssistantExperienceViewController _updateStatusViewVisibility](self, "_updateStatusViewVisibility");
}

- (BOOL)_updateActiveTranscriptItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSArray *v7;
  NSArray *activeTranscriptItems;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  SRCompactResultPlatterViewController *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  id v22;
  NSArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;

  v4 = a3;
  if (-[NSArray isEqualToArray:](self->_activeTranscriptItems, "isEqualToArray:", v4))
    goto LABEL_20;
  if (!-[SRSystemAssistantExperienceViewController contentDiffersBetweenItems:andItems:](self, "contentDiffersBetweenItems:andItems:", self->_activeTranscriptItems, v4))
  {
    v20 = AFSiriLogContextConnection;
    v19 = 0;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 136315394;
    v30 = "-[SRSystemAssistantExperienceViewController _updateActiveTranscriptItems:]";
    v31 = 2112;
    v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s #compact: Transcript items %@ have the same content, not updating our compact view", buf, 0x16u);
LABEL_20:
    v19 = 0;
    goto LABEL_21;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
  v6 = objc_msgSend(v5, "popToRootViewControllerAnimated:", 1);

  v22 = v4;
  v7 = (NSArray *)objc_msgSend(v4, "copy");
  activeTranscriptItems = self->_activeTranscriptItems;
  self->_activeTranscriptItems = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_activeTranscriptItems;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(obj);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "viewController"));
        objc_msgSend(v9, "addObject:", v14);
        objc_opt_class(SiriUISnippetViewController, v15);
        if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
          objc_msgSend(v14, "setDelegate:", self);
        if ((objc_opt_respondsToSelector(v14, "setIsInAmbient:") & 1) != 0)
          objc_msgSend(v14, "setIsInAmbient:", self->_isInAmbient);
        if (-[NSArray count](self->_serverUtterances, "count")
          && (objc_opt_respondsToSelector(v14, "setIsPresentedWithSmartDialogText:") & 1) != 0)
        {
          objc_msgSend(v14, "setIsPresentedWithSmartDialogText:", 1);
        }

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  v17 = objc_alloc_init(SRCompactResultPlatterViewController);
  -[SRCompactResultPlatterViewController setSiriContentViewControllers:](v17, "setSiriContentViewControllers:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _resultViewController](self, "_resultViewController"));
  objc_msgSend(v18, "setContentPlatterViewController:", v17);

  v19 = 1;
  v4 = v22;
LABEL_21:

  return v19;
}

- (void)_setActiveConversationTranscriptItems:(id)a3
{
  id v4;
  NSObject *v5;
  NSArray *v6;
  NSArray *activeConversationTranscriptItems;
  NSArray *v8;
  NSArray *storedConversationTranscriptItems;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  unsigned int v22;
  char v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;

  v4 = a3;
  if (-[NSArray isEqualToArray:](self->_activeConversationTranscriptItems, "isEqualToArray:", v4)
    || !-[SRSystemAssistantExperienceViewController contentDiffersBetweenItems:andItems:](self, "contentDiffersBetweenItems:andItems:", v4, self->_activeConversationTranscriptItems))
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[SRSystemAssistantExperienceViewController _setActiveConversationTranscriptItems:]";
      v36 = 2112;
      v37 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: Conversation Transcript has the same content, not updating our compact view for items: %@", buf, 0x16u);
    }
  }
  v27 = v4;
  v6 = (NSArray *)objc_msgSend(v4, "copy");
  activeConversationTranscriptItems = self->_activeConversationTranscriptItems;
  self->_activeConversationTranscriptItems = v6;

  if (-[NSArray count](self->_activeConversationTranscriptItems, "count"))
  {
    v8 = (NSArray *)-[NSArray copy](self->_activeConversationTranscriptItems, "copy");
    storedConversationTranscriptItems = self->_storedConversationTranscriptItems;
    self->_storedConversationTranscriptItems = v8;

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = self->_activeConversationTranscriptItems;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "viewController"));
        v17 = v16;
        if (v16)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "parentViewController"));

          if (!v18)
          {
            -[SRSystemAssistantExperienceRootViewController addChildViewController:](self->_rootViewController, "addChildViewController:", v17);
            objc_msgSend(v17, "didMoveToParentViewController:", self->_rootViewController);
          }
          objc_opt_class(SiriUISnippetViewController, v19);
          if ((objc_opt_isKindOfClass(v17, v20) & 1) != 0)
          {
            v21 = v17;
            v22 = objc_msgSend(v15, "isHintItem");
            if (v22)
              objc_msgSend(v21, "setIsHint:", 1);
            objc_msgSend(v21, "setDelegate:", self);

          }
          else
          {
            LOBYTE(v22) = 0;
          }
          if ((objc_opt_respondsToSelector(v17, "setIsInAmbient:") & 1) != 0)
            objc_msgSend(v17, "setIsInAmbient:", self->_isInAmbient);
          v23 = v22 ^ 1;
          if (!self->_isInAmbient)
            v23 = 1;
          if ((v23 & 1) != 0)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
            objc_msgSend(v28, "addObject:", v25);

            if (!v18)
              goto LABEL_34;
          }
          else
          {
            v24 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v35 = "-[SRSystemAssistantExperienceViewController _setActiveConversationTranscriptItems:]";
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s #ambient removed hint view in ambient mode from conversationSnippets", buf, 0xCu);
            }
            if (v18)
              goto LABEL_28;
LABEL_34:
            objc_msgSend(v17, "didMoveToParentViewController:", self->_rootViewController);
          }
LABEL_28:
          if (-[NSArray count](self->_serverUtterances, "count")
            && (objc_opt_respondsToSelector(v17, "setIsPresentedWithSmartDialogText:") & 1) != 0)
          {
            objc_msgSend(v17, "setIsPresentedWithSmartDialogText:", 1);
          }
        }

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v12 = v26;
    }
    while (v26);
  }

  -[SRSystemAssistantExperienceViewController _setSmartDialogConversationSnippetViews:](self, "_setSmartDialogConversationSnippetViews:", v28);
}

- (void)_setSmartDialogServerUtterances:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *serverUtterances;
  id v7;
  _QWORD *v8;
  id serverUtteranceUpdateBlock;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;
  _BYTE v24[128];

  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  serverUtterances = self->_serverUtterances;
  self->_serverUtterances = v5;

  v7 = objc_msgSend(v4, "count");
  if (v7)
  {
    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000D9B4;
    v20[3] = &unk_100122660;
    objc_copyWeak(&v22, &location);
    v21 = v4;
    v8 = objc_retainBlock(v20);
    serverUtteranceUpdateBlock = self->serverUtteranceUpdateBlock;
    self->serverUtteranceUpdateBlock = v8;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _allTranscriptItems](self, "_allTranscriptItems", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "viewController"));
        if ((objc_opt_respondsToSelector(v15, "setIsPresentedWithSmartDialogText:") & 1) != 0)
          objc_msgSend(v15, "setIsPresentedWithSmartDialogText:", v7 != 0);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

}

- (void)_setSmartDialogSpeechRecognitionHypothesis:(id)a3
{
  SRUIFSpeechRecognitionHypothesis *v4;
  SRUIFSpeechRecognitionHypothesis *speechRecognitionHypothesis;
  id v6;

  if (self->_speechRecognitionHypothesis != a3)
  {
    v6 = a3;
    v4 = (SRUIFSpeechRecognitionHypothesis *)objc_msgSend(v6, "copy");
    speechRecognitionHypothesis = self->_speechRecognitionHypothesis;
    self->_speechRecognitionHypothesis = v4;

    -[SiriSharedUISmartDialogView setSpeechRecognitionHypothesis:](self->_activeSmartDialogView, "setSpeechRecognitionHypothesis:", v6);
  }
}

- (void)updateSpeechRecognitionHypothesisForSuggestion:(id)a3
{
  -[SiriSharedUISmartDialogView setSpeechRecognitionHypothesisForSuggestion:](self->_activeSmartDialogView, "setSpeechRecognitionHypothesisForSuggestion:", a3);
}

- (void)_setSmartDialogLatencyViewModel:(id)a3
{
  SiriSharedUILatencyViewModel *v4;
  SiriSharedUILatencyViewModel *latencyViewModel;
  id v6;

  v6 = a3;
  if ((-[SiriSharedUILatencyViewModel isEqualToViewModel:](self->_latencyViewModel, "isEqualToViewModel:") & 1) == 0)
  {
    v4 = (SiriSharedUILatencyViewModel *)objc_msgSend(v6, "copy");
    latencyViewModel = self->_latencyViewModel;
    self->_latencyViewModel = v4;

    -[SiriSharedUISmartDialogView setLatencyViewModel:](self->_activeSmartDialogView, "setLatencyViewModel:", v6);
  }

}

- (void)_setSmartDialogConversationSnippetViews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  id snippetUpdateBlock;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _snippetFromTranscriptItems](self, "_snippetFromTranscriptItems"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _createBackgroundView:](self, "_createBackgroundView:", v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView"));
      objc_msgSend(v7, "setSnippetBackgroundView:", v6);

    }
    self->_activeViewModelHasSnippets = objc_msgSend(v4, "count") != 0;
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000DC30;
    v10[3] = &unk_100122660;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    v8 = objc_retainBlock(v10);
    snippetUpdateBlock = self->snippetUpdateBlock;
    self->snippetUpdateBlock = v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

- (void)_setSmartDialogCard:(id)a3
{
  id v4;
  _QWORD *v5;
  id smartDialogCardBlock;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000DD84;
    v7[3] = &unk_100122660;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    v5 = objc_retainBlock(v7);
    smartDialogCardBlock = self->smartDialogCardBlock;
    self->smartDialogCardBlock = v5;

    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);

}

- (void)_setSmartDialogPlugin:(id)a3
{
  id v4;
  _QWORD *v5;
  id smartDialogPluginBlock;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000DE94;
    v7[3] = &unk_100122660;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    v5 = objc_retainBlock(v7);
    smartDialogPluginBlock = self->smartDialogPluginBlock;
    self->smartDialogPluginBlock = v5;

    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);

}

- (void)_prepareSmartDialogForUpdatesWithDiff:(unint64_t)a3 updateBlock:(id)a4
{
  id v6;
  SiriSharedUISmartDialogView *activeSmartDialogView;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  activeSmartDialogView = self->_activeSmartDialogView;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000DF98;
  v9[3] = &unk_100122688;
  v10 = v6;
  v8 = v6;
  -[SiriSharedUISmartDialogView prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecognitionHypothesis:latencyViewModel:updateBlock:](activeSmartDialogView, "prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecognitionHypothesis:latencyViewModel:updateBlock:", (a3 >> 2) & 1, (a3 >> 1) & 1, (a3 >> 3) & 1, (a3 >> 6) & 1, v9);

}

- (void)_presentOrTransitionActiveSmartDialogView
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUISmartDialogView latencyViewModel](self->_activeSmartDialogView, "latencyViewModel"));
  if ((objc_msgSend(v3, "shouldDisplay") & 1) != 0)
  {

  }
  else
  {
    v4 = -[SiriSharedUISmartDialogView ongoingASR](self->_activeSmartDialogView, "ongoingASR");

    if ((v4 & 1) == 0)
    {
LABEL_5:
      if (self->serverUtteranceUpdateBlock
        || self->snippetUpdateBlock
        || self->smartDialogCardBlock
        || self->smartDialogPluginBlock)
      {
        -[SRSystemAssistantExperienceViewController _popToRootViewControllerIfNeeded](self, "_popToRootViewControllerIfNeeded");
        -[SRSystemAssistantExperienceViewController endTypeToSiriLatencyStateIfNeeded](self, "endTypeToSiriLatencyStateIfNeeded");
        -[SiriSharedUISmartDialogView transitionToExpandablePlatterStyle:](self->_activeSmartDialogView, "transitionToExpandablePlatterStyle:", 4);
        if (self->_activeSmartDialogIsLatencyPill)
          -[SRSystemAssistantExperienceViewController _presentResultWithLatencyAnimation](self, "_presentResultWithLatencyAnimation");
        else
          -[SRSystemAssistantExperienceViewController _presentResultWithNoLatencyAnimation](self, "_presentResultWithNoLatencyAnimation");
      }
      return;
    }
  }
  if ((id)-[SRSystemAssistantExperienceViewController _inputType](self, "_inputType") == (id)1)
    goto LABEL_5;
  -[SRSystemAssistantExperienceViewController _presentLatencyPill](self, "_presentLatencyPill");
  if (!self->_alwaysShowSpeech)
    -[SiriSharedUISystemAssistantExperienceContainerView startLatencyLightOnActivePill](self->_containerView, "startLatencyLightOnActivePill");
}

- (void)endTypeToSiriLatencyStateIfNeeded
{
  NSObject *v3;
  int v4;
  const char *v5;

  if ((id)-[SRSystemAssistantExperienceViewController _inputType](self, "_inputType") == (id)1)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[SRSystemAssistantExperienceViewController endTypeToSiriLatencyStateIfNeeded]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Stopping type-to-Siri latency animation", (uint8_t *)&v4, 0xCu);
    }
    -[SystemAssistantPromptEntryView stopLatencyAnimationIfNeeded](self->_promptEntryView, "stopLatencyAnimationIfNeeded");
  }
}

- (void)_presentResultWithNoLatencyAnimation
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  char v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resultContentView"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    LODWORD(v6) = 1053609165;
    objc_msgSend(v5, "preFollowupPulseWithDuration:", v6);

    v7 = dispatch_time(0, 100000000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000E280;
    v8[3] = &unk_1001226B0;
    v8[4] = self;
    v9 = 0;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);
  }
  else
  {
    -[SRSystemAssistantExperienceViewController _transitionSmartDialogWithNoLatency:](self, "_transitionSmartDialogWithNoLatency:", 1);
  }
}

- (void)_transitionSmartDialogWithNoLatency:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  int64_t v7;
  _QWORD *v8;
  id renderResultBlock;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  id location;

  v5 = objc_claimAutoreleasedReturnValue(-[SiriSharedUISmartDialogView superview](self->_activeSmartDialogView, "superview"));
  if (!v5
    || (v6 = (void *)v5,
        v7 = -[SRSystemAssistantExperienceViewController _inputType](self, "_inputType"),
        v6,
        v7 == 1))
  {
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000E378;
    v10[3] = &unk_1001226D8;
    objc_copyWeak(&v11, &location);
    v12 = a3;
    v8 = objc_retainBlock(v10);
    renderResultBlock = self->renderResultBlock;
    self->renderResultBlock = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  -[SRSystemAssistantExperienceViewController _executePreTransitionBlocks](self, "_executePreTransitionBlocks");
}

- (void)_renderResult
{
  id renderResultBlock;
  void (**v4)(void);

  v4 = (void (**)(void))objc_retainBlock(self->renderResultBlock);
  renderResultBlock = self->renderResultBlock;
  self->renderResultBlock = 0;

  v4[2]();
}

- (BOOL)_shouldRenderResult
{
  void *v2;
  BOOL v3;

  if (self->_activeSmartDialogSize.height <= 0.0 || !self->renderResultBlock)
    return 0;
  if (!self->_activeViewModelHasSnippets)
    return 1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUISmartDialogView conversationSnippetViews](self->_activeSmartDialogView, "conversationSnippetViews"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_prepContainerForFirstSnippetPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  objc_msgSend(v3, "setIsFirstSnippet:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "blurrableView"));
  objc_msgSend(v5, "setAlpha:", 0.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "bounds");
  v8 = v7 * 0.5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  objc_msgSend(v9, "frame");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  objc_msgSend(v12, "frame");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  objc_msgSend(v15, "setFrame:", 0.0, v8, v11, v14);

  v19 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _blurAnimationWithDuration:blurIn:](self, "_blurAnimationWithDuration:blurIn:", 1, 0.6));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "blurrableView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
  objc_msgSend(v18, "addAnimation:forKey:", v19, CFSTR("blurIn"));

}

- (id)_blurAnimationWithDuration:(double)a3 blurIn:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("filters.blurFilter.inputRadius")));
  objc_msgSend(v6, "setAdditive:", 1);
  objc_msgSend(v6, "setDuration:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn));
  objc_msgSend(v6, "setTimingFunction:", v7);

  if (v4)
    v8 = 15;
  else
    v8 = 0;
  if (v4)
    v9 = 0;
  else
    v9 = 15;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
  objc_msgSend(v6, "setFromValue:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
  objc_msgSend(v6, "setToValue:", v11);

  return v6;
}

- (void)_performResultAnimation:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  CGFloat width;
  CGFloat height;
  NSObject *v9;
  NSString *v10;
  void *v11;
  UIViewSpringAnimationBehavior *defaultSpringAnimationBehavior;
  _QWORD v13[5];
  BOOL v14;
  _QWORD v15[5];
  BOOL v16;
  _QWORD v17[5];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  NSSize v22;

  self->_activeSmartDialogPresented = 1;
  if (a3)
    -[SRSystemAssistantExperienceViewController _prepContainerForFirstSnippetPresentation](self, "_prepContainerForFirstSnippetPresentation");
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SRSystemAssistantExperienceViewController _performResultAnimation:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #droplet presenting result with no latency", buf, 0xCu);
  }
  v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    width = self->_activeSmartDialogSize.width;
    height = self->_activeSmartDialogSize.height;
    v9 = v6;
    v22.width = width;
    v22.height = height;
    v10 = NSStringFromSize(v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 136315394;
    v19 = "-[SRSystemAssistantExperienceViewController _performResultAnimation:]";
    v20 = 2112;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #droplet present snippet now with size:%@!", buf, 0x16u);

  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000E90C;
  v17[3] = &unk_1001225C0;
  v17[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);
  defaultSpringAnimationBehavior = self->_defaultSpringAnimationBehavior;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E974;
  v15[3] = &unk_1001226B0;
  v16 = a3;
  v15[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000EA54;
  v13[3] = &unk_100122700;
  v13[4] = self;
  v14 = a3;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", defaultSpringAnimationBehavior, 0, v15, v13);
}

- (void)_presentResultWithLatencyAnimation
{
  self->_animatingInActiveSmartDialogView = 1;
  self->_activeSmartDialogIsLatencyPill = 0;
  if (-[SRSystemAssistantExperienceViewController _previousSmartDialogExists](self, "_previousSmartDialogExists"))
    -[SRSystemAssistantExperienceViewController _performPillMergeAndCrossfadeAnimation](self, "_performPillMergeAndCrossfadeAnimation");
  else
    -[SRSystemAssistantExperienceViewController _performSinglePillExpandAnimation](self, "_performSinglePillExpandAnimation");
}

- (void)_performSinglePillExpandAnimation
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  _QWORD v9[5];

  self->_activeSmartDialogPresented = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resultContentView"));
  v5 = v4 == 0;

  -[SRSystemAssistantExperienceViewController _executePreTransitionBlocks](self, "_executePreTransitionBlocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.0));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000EC90;
  v9[3] = &unk_1001225C0;
  v9[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000ECE0;
  v7[3] = &unk_100122700;
  v7[4] = self;
  v8 = v5;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v6, 0, v9, v7);

}

- (void)_addFeedbackButton
{
  if (AFIsInternalInstall(self, a2))
    -[SRSystemAssistantExperienceViewController _setupFeedbackButton](self, "_setupFeedbackButton");
}

- (void)_performPillMergeAndCrossfadeAnimation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  dispatch_time_t v7;
  dispatch_time_t v8;
  _QWORD v9[5];
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  objc_msgSend(v3, "setTransitionLoadingToResultWithResultSize:", self->_activeSmartDialogSize.width, self->_activeSmartDialogSize.height);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  v5 = SiriSharedUIMitosisDuration;
  *(float *)&v6 = SiriSharedUIMitosisDuration;
  objc_msgSend(v4, "mitoseWithDuration:", v6);

  v7 = dispatch_time(0, (uint64_t)(v5 * 0.5 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EFFC;
  block[3] = &unk_1001225C0;
  block[4] = self;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  v8 = dispatch_time(0, (uint64_t)(v5 * 0.625 * 1000000000.0));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F0E8;
  v9[3] = &unk_1001225C0;
  v9[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);

}

- (BOOL)_previousSmartDialogExists
{
  return -[NSMutableArray count](self->_finalAndDisplayedSmartDialogs, "count") != 0;
}

- (void)_trimFinalSmartDialogs
{
  if ((unint64_t)-[NSMutableArray count](self->_finalAndDisplayedSmartDialogs, "count") >= 2)
    -[NSMutableArray removeObjectAtIndex:](self->_finalAndDisplayedSmartDialogs, "removeObjectAtIndex:", 0);
}

- (void)_presentLatencyPill
{
  void *v3;
  SRUIFSpeechRecognitionHypothesis *speechRecognitionHypothesis;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUISmartDialogView superview](self->_activeSmartDialogView, "superview"));

  if (!v3)
  {
    -[SRSystemAssistantExperienceViewController _popToRootViewControllerIfNeeded](self, "_popToRootViewControllerIfNeeded");
    self->_activeViewModelHasSnippets = 0;
    speechRecognitionHypothesis = self->_speechRecognitionHypothesis;
    v5 = AFSiriLogContextConnection;
    v6 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (speechRecognitionHypothesis)
    {
      if (v6)
      {
        *(_DWORD *)buf = 136315138;
        v10 = "-[SRSystemAssistantExperienceViewController _presentLatencyPill]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #droplet presenting latency pill", buf, 0xCu);
      }
      self->_activeSmartDialogIsLatencyPill = 1;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
      objc_msgSend(v7, "setVoiceLoading:", self->_activeSmartDialogView);

      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000F5B8;
      v8[3] = &unk_1001225C0;
      v8[4] = self;
      +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v8);
    }
    else if (v6)
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SRSystemAssistantExperienceViewController _presentLatencyPill]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #droplet not presenting pill because we do not have ASR or latency text", buf, 0xCu);
    }
  }
}

- (void)_popToRootViewControllerIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  if (self->_isDrilledIntoSnippet)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
    objc_msgSend(v3, "setPopToRootViewController:", 1);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
    v5 = objc_msgSend(v4, "popToRootViewControllerAnimated:", 1);

    self->_isDrilledIntoSnippet = 0;
  }
}

- (void)removeResponseElementsIfNeeded:(unint64_t)a3
{
  UIViewSpringAnimationBehavior *defaultSpringAnimationBehavior;
  _QWORD v4[6];
  _QWORD v5[6];

  defaultSpringAnimationBehavior = self->_defaultSpringAnimationBehavior;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F760;
  v5[3] = &unk_1001225E8;
  v5[4] = self;
  v5[5] = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F7A0;
  v4[3] = &unk_100122750;
  v4[4] = self;
  v4[5] = a3;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", defaultSpringAnimationBehavior, 0, v5, v4);
}

- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;

  if ((a4 == 24 || a4 == 6) && self->_inputType != 1)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[SRSystemAssistantExperienceViewController animatedDisappearanceDidBeginWithDuration:reason:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #dismissal Performing snippet blur-out", (uint8_t *)&v11, 0xCu);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _blurAnimationWithDuration:blurIn:](self, "_blurAnimationWithDuration:blurIn:", 0, a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "blurrableView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
    objc_msgSend(v10, "addAnimation:forKey:", v7, CFSTR("blurOut"));

  }
}

- (BOOL)isDisplayingResponse
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  v3 = objc_msgSend(v2, "isDisplayingResponse");

  return v3;
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y;
  double x;
  NSObject *v7;
  SRCompactViewControllerMutableContentTesterState *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  uint64_t v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  SRCompactViewControllerContentTester *v37;
  unsigned __int8 v38;
  int v39;
  const char *v40;
  CGPoint v41;
  CGRect v42;

  if (self->_shouldAbsorbSuggestionTap)
  {
    self->_shouldAbsorbSuggestionTap = 0;
    return 1;
  }
  y = a3.y;
  x = a3.x;
  if (-[SiriSharedUIFeedbackController isProvidingFeedback](self->_feedbackController, "isProvidingFeedback"))
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 136315138;
      v40 = "-[SRSystemAssistantExperienceViewController hasContentAtPoint:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #dismissal - tap during feedback session", (uint8_t *)&v39, 0xCu);
    }
    return 1;
  }
  v8 = objc_alloc_init(SRCompactViewControllerMutableContentTesterState);
  -[SRCompactViewControllerMutableContentTesterState setDeviceIsPad:](v8, "setDeviceIsPad:", SiriUIDeviceIsPad(v8, v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController transitionController](self->_navigationController, "transitionController"));
  -[SRCompactViewControllerMutableContentTesterState setNavigationStackIsPopping:](v8, "setNavigationStackIsPopping:", objc_msgSend(v10, "operation") == (id)2);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController viewControllers](self->_navigationController, "viewControllers"));
  -[SRCompactViewControllerMutableContentTesterState setNavigationStackSize:](v8, "setNavigationStackSize:", objc_msgSend(v11, "count"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  if (SiriUIDeviceIsPad(v12, v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
    objc_msgSend(v12, "convertPoint:fromView:", v14, x, y);
    v16 = v15;
    v18 = v17;

  }
  else
  {
    v18 = y;
    v16 = x;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController viewControllers](self->_navigationController, "viewControllers"));
  if ((unint64_t)objc_msgSend(v19, "count") > 1)
  {

    goto LABEL_13;
  }
  v20 = -[SRCompactViewControllerMutableContentTesterState navigationStackIsPopping](v8, "navigationStackIsPopping");

  if ((v20 & 1) != 0)
  {
LABEL_13:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "navigationBar"));
    objc_msgSend((id)v22, "bounds");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    v42.origin.x = v24;
    v42.origin.y = v26;
    v42.size.width = v28;
    v42.size.height = v30;
    v41.x = v16;
    v41.y = v18;
    -[SRCompactViewControllerMutableContentTesterState setNavigationBarHasContent:](v8, "setNavigationBarHasContent:", CGRectContainsPoint(v42, v41));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController visibleViewController](self->_navigationController, "visibleViewController"));
    objc_opt_class(SiriUINavigationContentViewController, v32);
    LOBYTE(v22) = objc_opt_isKindOfClass(v31, v33);

    if ((v22 & 1) != 0)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController visibleViewController](self->_navigationController, "visibleViewController"));
      -[SRCompactViewControllerMutableContentTesterState setMultiLevelViewHasContent:](v8, "setMultiLevelViewHasContent:", objc_msgSend(v34, "hasContentAtPoint:", v16, v18));

    }
    else
    {
      -[SRCompactViewControllerMutableContentTesterState setMultiLevelViewHasContent:](v8, "setMultiLevelViewHasContent:", 1);
    }
  }
  -[SRCompactViewControllerMutableContentTesterState setKeyboardHasContent:](v8, "setKeyboardHasContent:", -[SRSystemAssistantExperienceViewController _keyboardHasContentAtPoint:](self, "_keyboardHasContentAtPoint:", x, y));
  -[SRCompactViewControllerMutableContentTesterState setCompactViewHasContent:](v8, "setCompactViewHasContent:", objc_msgSend(v12, "hasContentAtPoint:", v16, v18));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "window"));

  if (v36)
    -[SRCompactViewControllerMutableContentTesterState setContextMenuIsPresented:](v8, "setContextMenuIsPresented:", objc_msgSend(v36, "contextMenuIsPresented"));
  v37 = objc_alloc_init(SRCompactViewControllerContentTester);
  v38 = -[SRCompactViewControllerContentTester hasContentForState:](v37, "hasContentForState:", v8);

  return v38;
}

- (CGSize)maxSizeForSnippet
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setShowsSensitiveUI:(BOOL)a3
{
  self->_sensitiveUIEnabled = a3;
  -[SiriSharedUISystemAssistantExperienceContainerView setShowsSensitiveUI:](self->_containerView, "setShowsSensitiveUI:");
}

- (void)_setBottomContentInsetComponents:(id)a3 animatedWithDuration:(double)a4 animationOptions:(unint64_t)a5
{
  double var0;
  void *v10;
  _QWORD v11[5];

  if (self->_bottomContentInsetComponents.external != a3.var0
    || self->_bottomContentInsetComponents.keyboard != a3.var1)
  {
    self->_bottomContentInsetComponents = ($0C5975B48BE0F00762E4FBCC1DCF0A72)a3;
    if (a3.var0 >= a3.var1)
      var0 = a3.var0;
    else
      var0 = a3.var1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    objc_msgSend(v10, "setBottomContentInset:", var0);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000FE20;
    v11[3] = &unk_1001225C0;
    v11[4] = self;
    +[UIView _animateWithDuration:delay:options:animations:start:completion:](UIView, "_animateWithDuration:delay:options:animations:start:completion:", a5, v11, 0, 0, a4, 0.0);
  }
}

- (void)_setBottomContentInsetComponents:(id)a3
{
  -[SRSystemAssistantExperienceViewController _setBottomContentInsetComponents:animatedWithDuration:animationOptions:](self, "_setBottomContentInsetComponents:animatedWithDuration:animationOptions:", 0, a3.var0, a3.var1, 0.0);
}

- (void)setBottomContentInset:(double)a3
{
  -[SRSystemAssistantExperienceViewController _bottomContentInsetComponents](self, "_bottomContentInsetComponents");
  -[SRSystemAssistantExperienceViewController _setBottomContentInsetComponents:](self, "_setBottomContentInsetComponents:", a3);
}

- (void)setTopContentInset:(double)a3 animated:(BOOL)a4
{
  if (self->_topInset != a3)
    -[SRSystemAssistantExperienceViewController updateTopInset:animated:](self, "updateTopInset:animated:", a4);
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
  void *v14;
  double v15;
  void *v16;
  double v17;
  id v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  -[SRSystemAssistantExperienceViewController _bottomContentInsetComponents](self, "_bottomContentInsetComponents");
  v4 = v3;
  v18 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _keyboardState](self, "_keyboardState"));
  objc_msgSend(v18, "frameForAnimation");
  -[SRSystemAssistantExperienceViewController _convertRectFromKeyboard:](self, "_convertRectFromKeyboard:");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  v9 = 0.0;
  if (CGRectGetHeight(v19) != 0.0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
    objc_msgSend(v10, "bounds");
    v11 = CGRectGetHeight(v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    objc_msgSend(v12, "bounds");
    v13 = (v11 - CGRectGetHeight(v21)) * 0.5;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    objc_msgSend(v14, "bounds");
    v15 = CGRectGetHeight(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v9 = v13 + v15 - CGRectGetMinY(v23);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "animation"));
  objc_msgSend(v16, "duration");
  -[SRSystemAssistantExperienceViewController _setBottomContentInsetComponents:animatedWithDuration:animationOptions:](self, "_setBottomContentInsetComponents:animatedWithDuration:animationOptions:", objc_msgSend(v16, "options"), v4, v9, v17);

}

- (void)siriDidActivate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((id)-[SRSystemAssistantExperienceViewController _inputType](self, "_inputType") == (id)1)
  {
    -[SRTypeToSiriKeyboardReadinessObserver start](self->_typeToSiriKeyboardReadinessObserver, "start");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController promptEntryView](self, "promptEntryView"));
    objc_msgSend(v4, "minimumTextFieldHeight");
    objc_msgSend(v3, "setTextFieldHeight:");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController promptEntryView](self, "promptEntryView"));
    objc_msgSend(v5, "setTextFieldWithTextFieldView:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController promptEntryView](self, "promptEntryView"));
    objc_msgSend(v7, "becomeFirstResponder");

    v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
    objc_msgSend(v8, "viewController:willChangeKeyboardVisibility:", self, 1);

  }
}

- (void)setUpConversationStarterSuggestionsWith:(int64_t)a3
{
  -[SRSystemAssistantExperienceViewController _setUpConversationStarterSuggestions:isVoiceTrigger:invocationSource:](self, "_setUpConversationStarterSuggestions:isVoiceTrigger:invocationSource:", -[SRSystemAssistantExperienceViewController _inputType](self, "_inputType"), a3 == 8, a3);
}

- (void)siriDidDeactivate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSTimer *userHesitationCountdownTimer;

  if ((id)-[SRSystemAssistantExperienceViewController _inputType](self, "_inputType") == (id)1)
  {
    -[SRTypeToSiriKeyboardReadinessObserver stop](self->_typeToSiriKeyboardReadinessObserver, "stop");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController promptEntryView](self, "promptEntryView"));
    objc_msgSend(v3, "resignFirstResponder");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
    objc_msgSend(v4, "viewController:willChangeKeyboardVisibility:", self, 0);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleViewController"));
  -[SRSystemAssistantExperienceViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v6, &stru_100122790);

  userHesitationCountdownTimer = self->_userHesitationCountdownTimer;
  self->_userHesitationCountdownTimer = 0;

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

- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  BOOL v23;
  void *v24;
  void *v25;
  NSArray *v26;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  char isKindOfClass;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  unsigned int v44;
  SRSystemAssistantExperienceViewController *v45;
  id v46;
  void *v47;
  NSArray *obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v46 = a3;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "viewId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _activeTranscriptItems](self, "_activeTranscriptItems"));
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v45 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _activeConversationTranscriptItems](self, "_activeConversationTranscriptItems"));
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v4;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (!v7)
  {
LABEL_14:

    if (-[NSArray count](obj, "count") || !-[NSArray count](v45->_storedConversationTranscriptItems, "count"))
    {
      v23 = 0;
      v24 = v46;
      goto LABEL_18;
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v26 = v45->_storedConversationTranscriptItems;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (!v28)
      goto LABEL_34;
    v29 = v28;
    v30 = *(_QWORD *)v50;
LABEL_22:
    v31 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v30)
        objc_enumerationMutation(v26);
      v32 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v31);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "viewController"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "superview"));
      if (!v34)
        goto LABEL_30;
      v35 = (void *)v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "viewController"));
      objc_opt_class(_TtC4Siri34SiriUIVisualResponseViewController, v37);
      isKindOfClass = objc_opt_isKindOfClass(v36, v38);

      if ((isKindOfClass & 1) != 0)
        break;
LABEL_32:
      if (v29 == (id)++v31)
      {
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        if (!v29)
        {
LABEL_34:
          v23 = 0;
          v24 = v46;
          goto LABEL_17;
        }
        goto LABEL_22;
      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "viewController"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "aceObject"));
    objc_opt_class(SAAceView, v40);
    if ((objc_opt_isKindOfClass(v33, v41) & 1) != 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "aceObject"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "viewId"));
      v44 = objc_msgSend(v43, "isEqualToString:", v47);

      if (v44)
      {
        v24 = v46;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stateData"));
        objc_msgSend(v16, "updateSharedState:", v25);
        goto LABEL_16;
      }
    }
    else
    {
LABEL_30:

    }
    goto LABEL_32;
  }
  v8 = v7;
  v9 = *(_QWORD *)v54;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v54 != v9)
      objc_enumerationMutation(obj);
    v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewController"));
    objc_opt_class(_TtC4Siri34SiriUIVisualResponseViewController, v13);
    v15 = objc_opt_isKindOfClass(v12, v14);

    if ((v15 & 1) == 0)
      goto LABEL_12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "aceObject"));
    objc_opt_class(SAAceView, v18);
    if ((objc_opt_isKindOfClass(v17, v19) & 1) == 0)
    {

      goto LABEL_11;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "aceObject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "viewId"));
    v22 = objc_msgSend(v21, "isEqualToString:", v47);

    if (v22)
      break;
LABEL_11:

LABEL_12:
    if (v8 == (id)++v10)
    {
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (!v8)
        goto LABEL_14;
      goto LABEL_3;
    }
  }
  v24 = v46;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stateData"));
  objc_msgSend(v16, "updateSharedState:", v25);
  v26 = obj;
LABEL_16:

  v23 = 1;
LABEL_17:

LABEL_18:
  return v23;
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
    -[SRSystemAssistantExperienceViewController _updateAmbientAvailability](self, "_updateAmbientAvailability");
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

  -[SRSystemAssistantExperienceViewController _updateAmbientAvailability](self, "_updateAmbientAvailability");
  objc_initWeak(&location, self);
  v3 = objc_opt_self(AMUIAmbientPresentationStateTrait);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v10 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001084C;
  v7[3] = &unk_1001227B8;
  objc_copyWeak(&v8, &location);
  v6 = -[SRSystemAssistantExperienceViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v5, v7);

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = objc_msgSend(v4, "isAmbientPresented");

  v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
    v9 = 136315394;
    v10 = "-[SRSystemAssistantExperienceViewController _updateAmbientAvailability]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #ambient - is Presented - %@", (uint8_t *)&v9, 0x16u);

  }
  -[SRSystemAssistantExperienceViewController setIsInAmbient:](self, "setIsInAmbient:", v5);
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *j;
  void *v53;
  SRSystemAssistantExperienceViewController *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];

  if (self->_isInAmbient != a3)
  {
    v3 = a3;
    self->_isInAmbient = a3;
    if (a3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v5, "scale");
      v7 = v6 * SiriSharedUICompactAmbientContentScaleAmount;

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitOverrides"));
      objc_msgSend(v9, "setDisplayScale:", v7);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitOverrides"));
      objc_msgSend(v11, "setUserInterfaceStyle:", 2);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController traitOverrides](self, "traitOverrides"));
      objc_msgSend(v12, "setDisplayScale:", v7);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController traitOverrides](self, "traitOverrides"));
      objc_msgSend(v13, "setUserInterfaceStyle:", 2);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "traitOverrides"));
      v16 = objc_opt_self(UITraitDisplayScale);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(v15, "removeTrait:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "traitOverrides"));
      v20 = objc_opt_self(UITraitUserInterfaceStyle);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      objc_msgSend(v19, "removeTrait:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController traitOverrides](self, "traitOverrides"));
      v23 = objc_opt_self(UITraitDisplayScale);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_msgSend(v22, "removeTrait:", v24);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController traitOverrides](self, "traitOverrides"));
      v25 = objc_opt_self(UITraitUserInterfaceStyle);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      objc_msgSend(v13, "removeTrait:", v26);

    }
    -[SiriSharedUISystemAssistantExperienceContainerView setIsInAmbient:](self->_containerView, "setIsInAmbient:", self->_isInAmbient);
    -[SiriSharedUISmartDialogView setIsInAmbient:](self->_activeSmartDialogView, "setIsInAmbient:", v3);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController promptEntryView](self, "promptEntryView"));
    v28 = v3;
    objc_msgSend(v27, "setIsInAmbient:", v3);

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v54 = self;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "viewControllers"));

    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v31)
    {
      v33 = v31;
      v34 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v34)
            objc_enumerationMutation(v30);
          v36 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          objc_opt_class(SiriUINavigationContentViewController, v32);
          v38 = sub_100007944(v37, v36);
          v40 = (void *)objc_claimAutoreleasedReturnValue(v38);
          if (v40)
          {
            *(_QWORD *)&v41 = objc_opt_class(SiriSharedUIContentPlatterViewController, v39).n128_u64[0];
            v43 = v42;
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "contentViewController", v41));
            v45 = sub_100007944(v43, v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue(v45);

            if (v46)
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "contentPlatterView"));
              objc_msgSend(v47, "setIsInAmbient:", v28);

            }
          }

        }
        v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v33);
    }

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _allTranscriptItems](v54, "_allTranscriptItems"));
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v50; j = (char *)j + 1)
        {
          if (*(_QWORD *)v56 != v51)
            objc_enumerationMutation(v48);
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j), "viewController"));
          if ((objc_opt_respondsToSelector(v53, "setIsInAmbient:") & 1) != 0)
            objc_msgSend(v53, "setIsInAmbient:", v54->_isInAmbient);

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v50);
    }

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
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (self->_isInAmbient)
  {
    v3 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v5, "scale");
    v7 = v6 * SiriSharedUICompactAmbientContentScaleAmountForInteractivity;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitOverrides"));
    objc_msgSend(v9, "setDisplayScale:", v7);

    self->_isInAmbientInteractivity = v3;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _allTranscriptItems](self, "_allTranscriptItems", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "viewController"));
          if ((objc_opt_respondsToSelector(v15, "setIsInAmbientInteractivity:") & 1) != 0)
            objc_msgSend(v15, "setIsInAmbientInteractivity:", v3);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

    -[SiriSharedUISmartDialogView setIsInAmbientInteractivity:](self->_activeSmartDialogView, "setIsInAmbientInteractivity:", v3);
  }
}

- (id)_allTranscriptItems
{
  NSArray *activeTranscriptItems;
  NSArray *activeConversationTranscriptItems;
  NSArray *v5;

  activeTranscriptItems = self->_activeTranscriptItems;
  activeConversationTranscriptItems = self->_activeConversationTranscriptItems;
  if (activeTranscriptItems)
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](activeTranscriptItems, "arrayByAddingObjectsFromArray:", activeConversationTranscriptItems));
  else
    v5 = activeConversationTranscriptItems;
  return v5;
}

- (void)_setUpConversationStarterSuggestions:(int64_t)a3 isVoiceTrigger:(BOOL)a4 invocationSource:(int64_t)a5
{
  _BOOL8 v6;
  void *v9;
  id v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  SiriSharedUISuggestionsViewInterface *v14;
  SiriSharedUISuggestionsViewInterface *suggestionsViewProvider;
  NSTimer *v16;
  NSTimer *userHesitationCountdownTimer;
  SiriSharedUISuggestionsViewInterface *v18;
  int64_t v19;
  _QWORD v20[5];
  id v21;
  BOOL v22;
  char v23;
  id location;

  v6 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  v10 = objc_msgSend(v9, "lockStateForSAEViewController:", self);

  v11 = a3 == 1;
  v12 = -[SRUIFPreferences BOOLForKey:](self->_preferences, "BOOLForKey:", SRUIFPreferencesConversationStartersShownSinceOSInstalled);
  if (!self->_suggestionsDisplayed)
  {
    v13 = v12;
    if (!self->_suggestionsViewProvider)
    {
      v14 = (SiriSharedUISuggestionsViewInterface *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController createSuggestionsViewProvider](self, "createSuggestionsViewProvider"));
      suggestionsViewProvider = self->_suggestionsViewProvider;
      self->_suggestionsViewProvider = v14;

    }
    v16 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_suggestionsTimerComplete", 0, 0, 2.5));
    userHesitationCountdownTimer = self->_userHesitationCountdownTimer;
    self->_userHesitationCountdownTimer = v16;

    objc_initWeak(&location, self);
    v18 = self->_suggestionsViewProvider;
    v19 = -[SRSystemAssistantExperienceViewController _mapSASRequestSourceToSuggestionsInputOrigin:](self, "_mapSASRequestSourceToSuggestionsInputOrigin:", a5);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100011254;
    v20[3] = &unk_100122808;
    objc_copyWeak(&v21, &location);
    v20[4] = self;
    v22 = v11;
    v23 = v13;
    -[SiriSharedUISuggestionsViewInterface fetchConversationStarterViewsWithDeviceLocked:isVoiceTrigger:invocationSource:isFirstInvocationSinceOSInstalled:completion:](v18, "fetchConversationStarterViewsWithDeviceLocked:isVoiceTrigger:invocationSource:isFirstInvocationSinceOSInstalled:completion:", v10 == (id)2, v6, v19, v13 ^ 1, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (void)_addSuggestionsToContainer
{
  NSObject *v3;
  UIViewSpringAnimationBehavior *suggestionsSpringAnimationBehavior;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;

  if (!self->_userInputRecognizedForSuggestions
    && !self->_suggestionsDisplayed
    && -[NSArray count](self->_suggestionViews, "count"))
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[SRSystemAssistantExperienceViewController _addSuggestionsToContainer]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #suggestions: Adding suggestions starter views to container", buf, 0xCu);
    }
    if (self->_sensitiveUIEnabled)
      -[SiriSharedUISystemAssistantExperienceContainerView setSuggestions:](self->_containerView, "setSuggestions:", self->_suggestionViews);
    self->_suggestionsDisplayed = 1;
    -[SRSystemAssistantExperienceViewController _suggestionsWereShown](self, "_suggestionsWereShown");
    suggestionsSpringAnimationBehavior = self->_suggestionsSpringAnimationBehavior;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000115F4;
    v5[3] = &unk_1001225C0;
    v5[4] = self;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", suggestionsSpringAnimationBehavior, 0, v5, 0);
  }
}

- (void)_suggestionsTimerComplete
{
  NSObject *v3;
  NSTimer *userHesitationCountdownTimer;
  int v5;
  const char *v6;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SRSystemAssistantExperienceViewController _suggestionsTimerComplete]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #suggestions - timer fired", (uint8_t *)&v5, 0xCu);
  }
  self->_userHesitationTimerCompletedForSuggestions = 1;
  userHesitationCountdownTimer = self->_userHesitationCountdownTimer;
  self->_userHesitationCountdownTimer = 0;

  -[SRSystemAssistantExperienceViewController _addSuggestionsToContainer](self, "_addSuggestionsToContainer");
}

- (void)_suggestionsWereShown
{
  -[SiriSharedUISuggestionsViewInterface suggestionsWereShownForCallback](self->_suggestionsViewProvider, "suggestionsWereShownForCallback");
}

- (void)_siriRequestCommittedFromSuggestion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:siriRequestEnteredWithSuggestion:", self, v4);

}

- (void)_setUpConversationContinuerSuggestions:(int64_t)a3 forRequestId:(id)a4 currentMode:(id)a5
{
  id v7;
  id v8;
  UIViewSpringAnimationBehavior *suggestionsSpringAnimationBehavior;
  void *v10;
  id v11;
  SiriSharedUISuggestionsViewInterface *v12;
  SiriSharedUISuggestionsViewInterface *suggestionsViewProvider;
  BOOL v14;
  dispatch_time_t v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id location;
  _QWORD v24[5];

  v7 = a4;
  v8 = a5;
  suggestionsSpringAnimationBehavior = self->_suggestionsSpringAnimationBehavior;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000118E0;
  v24[3] = &unk_1001225C0;
  v24[4] = self;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", suggestionsSpringAnimationBehavior, 0, v24, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  v11 = objc_msgSend(v10, "lockStateForSAEViewController:", self);

  if (!self->_suggestionsViewProvider)
  {
    v12 = (SiriSharedUISuggestionsViewInterface *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController createSuggestionsViewProvider](self, "createSuggestionsViewProvider"));
    suggestionsViewProvider = self->_suggestionsViewProvider;
    self->_suggestionsViewProvider = v12;

  }
  v14 = v11 == (id)2;
  objc_initWeak(&location, self);
  v15 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011910;
  block[3] = &unk_100122858;
  objc_copyWeak(&v21, &location);
  block[4] = self;
  v19 = v7;
  v20 = v8;
  v22 = v14;
  v16 = v8;
  v17 = v7;
  dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (int64_t)_mapSASRequestSourceToSuggestionsInputOrigin:(int64_t)a3
{
  int64_t v3;
  uint64_t v4;

  v3 = 3;
  v4 = 2;
  if (a3 != 47)
    v4 = 0;
  if (a3 != 49)
    v3 = v4;
  if (a3 == 8)
    return 1;
  else
    return v3;
}

- (void)didRecognizeUserInputForConversationStarterSuggestions
{
  self->_userInputRecognizedForSuggestions = 1;
}

- (void)didRecognizeTwoShotSignalForConversationStarterSuggestions
{
  void *v3;
  id v4;
  SiriSharedUISuggestionsViewInterface *v5;
  SiriSharedUISuggestionsViewInterface *suggestionsViewProvider;
  SiriSharedUISuggestionsViewInterface *v7;
  _QWORD v8[5];
  id v9;
  id location;

  if (!self->_suggestionsDisplayed)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
    v4 = objc_msgSend(v3, "lockStateForSAEViewController:", self);

    if (!self->_suggestionsViewProvider)
    {
      v5 = (SiriSharedUISuggestionsViewInterface *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController createSuggestionsViewProvider](self, "createSuggestionsViewProvider"));
      suggestionsViewProvider = self->_suggestionsViewProvider;
      self->_suggestionsViewProvider = v5;

    }
    objc_initWeak(&location, self);
    v7 = self->_suggestionsViewProvider;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100011CDC;
    v8[3] = &unk_100122880;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    -[SiriSharedUISuggestionsViewInterface fetchConversationStarterViewsWithDeviceLocked:isVoiceTrigger:invocationSource:completion:](v7, "fetchConversationStarterViewsWithDeviceLocked:isVoiceTrigger:invocationSource:completion:", v4 == (id)2, 1, 1, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (id)createSuggestionsViewProvider
{
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc((Class)SiriSharedUISuggestionsViewInterface);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011FB4;
  v7[3] = &unk_1001228A8;
  objc_copyWeak(&v8, &location);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012004;
  v5[3] = &unk_1001228A8;
  objc_copyWeak(&v6, &location);
  v3 = objc_msgSend(v2, "initWithPressDownHandler:pressUpHandler:", v7, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v3;
}

- (void)didReceiveAddViewsSignalForSuggestions:(id)a3 currentMode:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[SRSystemAssistantExperienceViewController _setUpConversationContinuerSuggestions:forRequestId:currentMode:](self, "_setUpConversationContinuerSuggestions:forRequestId:currentMode:", -[SRSystemAssistantExperienceViewController _inputType](self, "_inputType"), v7, v6);

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleViewController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100012334;
  v8[3] = &unk_1001228F8;
  v9 = v4;
  v7 = v4;
  -[SRSystemAssistantExperienceViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v6, v8);

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
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "visibleViewController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001243C;
  v10[3] = &unk_100122920;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  -[SRSystemAssistantExperienceViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v8, v10);

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleViewController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100012538;
  v8[3] = &unk_1001228F8;
  v9 = v4;
  v7 = v4;
  -[SRSystemAssistantExperienceViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v6, v8);

}

- (void)siriDidTapOutsideContent
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleViewController"));
  -[SRSystemAssistantExperienceViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v3, &stru_100122940);

}

- (void)siriWillStartRequest
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleViewController"));
  -[SRSystemAssistantExperienceViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v3, &stru_100122960);

}

- (void)siriIsIdleAndQuiet
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleViewController"));
  -[SRSystemAssistantExperienceViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", v3, &stru_100122980);

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
        -[SRSystemAssistantExperienceViewController _recursivelyNotifyVisibleViewControllers:withBlock:](self, "_recursivelyNotifyVisibleViewControllers:withBlock:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), v7);
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

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _queuedNavigationContentViewController](self, "_queuedNavigationContentViewController"));
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _navigationController](self, "_navigationController"));
    objc_msgSend(v3, "pushViewController:animated:", v4, 1);

    -[SRSystemAssistantExperienceViewController _setQueuedNavigationContentViewController:](self, "_setQueuedNavigationContentViewController:", 0);
    -[SRSystemAssistantExperienceViewController userDrilledIntoSnippet](self, "userDrilledIntoSnippet");
  }

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
  v11 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v11, "viewController:openURL:completion:", self, v10, v9);

}

- (void)siriViewController:(id)a3 performAceCommands:(id)a4
{
  -[SRSystemAssistantExperienceViewController siriSnippetViewController:performAceCommands:sashItem:](self, "siriSnippetViewController:performAceCommands:sashItem:", a3, a4, 0);
}

- (void)siriSnippetViewController:(id)a3 performAceCommands:(id)a4 sashItem:(id)a5
{
  SiriSharedUICompactHostingInstrumentationSupplement *instrumentationSupplement;
  id v9;
  id v10;

  instrumentationSupplement = self->_instrumentationSupplement;
  v9 = a4;
  -[SiriSharedUICompactHostingInstrumentationSupplement logPunchOutEventForSiriViewController:aceCommands:sashItem:](instrumentationSupplement, "logPunchOutEventForSiriViewController:aceCommands:sashItem:", a3, v9, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v10, "viewController:performAceCommands:completion:", self, v9, 0);

}

- (void)siriViewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate", a3));
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "effectiveCoreLocationBundleForSAEViewController:", self));

  if (!v6)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009D714((uint64_t)v4, v7);
  }

  return v6;
}

- (double)siriViewControllerExpectedWidth:(id)a3
{
  double result;

  -[SiriSharedUISmartDialogView portraitContentSize](self->_activeSmartDialogView, "portraitContentSize", a3);
  if (self->_isInAmbient && !self->_isInAmbientInteractivity)
    return result / SiriSharedUICompactAmbientContentScaleAmount;
  return result;
}

- (void)siriViewControllerHeightDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController topViewController](self->_navigationController, "topViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUISystemAssistantExperienceContainerView superview](self->_containerView, "superview"));

    if (v5 == v6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
      -[SRSystemAssistantExperienceViewController _smartDialogSnippetLayoutDidUpdateForView:](self, "_smartDialogSnippetLayoutDidUpdateForView:", v11);
      goto LABEL_6;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController topViewController](self->_navigationController, "topViewController"));
    objc_opt_class(SiriUINavigationContentViewController, v8);
    isKindOfClass = objc_opt_isKindOfClass(v7, v9);

    if ((isKindOfClass & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUINavigationController topViewController](self->_navigationController, "topViewController"));
      objc_msgSend(v11, "contentViewDidUpdateSize");
LABEL_6:

    }
  }

}

- (void)_smartDialogSnippetLayoutDidUpdateForView:(id)a3
{
  SiriSharedUISmartDialogView *activeSmartDialogView;
  id v5;
  void *v6;
  unsigned int v7;

  activeSmartDialogView = self->_activeSmartDialogView;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUISmartDialogView conversationSnippetViews](activeSmartDialogView, "conversationSnippetViews"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
    -[SiriSharedUISmartDialogView snippetContentDidUpdate](self->_activeSmartDialogView, "snippetContentDidUpdate");
}

- (void)siriViewControllerHeightDidChange:(id)a3 pinTopOfSnippet:(BOOL)a4
{
  -[SiriSharedUISmartDialogView setNeedsLayout](self->_activeSmartDialogView, "setNeedsLayout", a3, a4);
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
  SRSystemAssistantExperienceViewController *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char isKindOfClass;
  unsigned int v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];

  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v4 = a4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (!v5)
    goto LABEL_26;
  v7 = v5;
  v8 = *(_QWORD *)v44;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v44 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
      objc_opt_class(SAAceView, v6);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
        goto LABEL_26;
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
        v23 = self;
        if ((objc_opt_respondsToSelector(v20, "shouldAutomaticallyScaleContentInAmbient") & 1) != 0)
          v24 = (uint64_t)objc_msgSend(v20, "shouldAutomaticallyScaleContentInAmbient");
        else
          v24 = 1;
        objc_msgSend(v21, "setIsInAmbient:", self->_isInAmbient);
        objc_msgSend(v21, "setDelegate:", self);
        -[SiriSharedUICompactHostingInstrumentationSupplement configureSiriViewControllerWithCurrentTurn:](self->_instrumentationSupplement, "configureSiriViewControllerWithCurrentTurn:", v21);
        v25 = objc_alloc_init((Class)SiriSharedUIContentPlatterViewController);
        v47 = v21;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
        objc_msgSend(v25, "setContentViewControllers:", v26);

        v27 = objc_alloc_init((Class)SiriUINavigationContentViewController);
        objc_msgSend(v27, "setContentViewController:", v25);
        if (self->_isInAmbient)
        {
          v41 = v24;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contentPlatterView"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _resultViewController](self, "_resultViewController"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "compactResultView"));
          objc_msgSend(v28, "setDelegate:", v30);

          v23 = self;
          v24 = v41;
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contentPlatterView"));
        objc_msgSend(v31, "setIsNextLevelCard:", 1);

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contentPlatterView"));
        objc_msgSend(v32, "setIsInAmbient:", v23->_isInAmbient);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contentPlatterView"));
        objc_msgSend(v33, "setAllowAutomaticContentViewsScaling:", v24);

        -[SRSystemAssistantExperienceViewController _updateAdditionalSafeAreaInsetsForNavigationContentViewController:](v23, "_updateAdditionalSafeAreaInsetsForNavigationContentViewController:", v27);
        -[SRSystemAssistantExperienceViewController _setQueuedNavigationContentViewController:](v23, "_setQueuedNavigationContentViewController:", v27);
        if (objc_msgSend(v21, "isLoading"))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aceObject"));
          objc_opt_class(SAUIVisualResponseSnippet, v35);
          if ((objc_opt_isKindOfClass(v34, v36) & 1) != 0)
          {

            v23 = self;
          }
          else
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aceObject"));
            objc_opt_class(SAUIPluginSnippet, v38);
            isKindOfClass = objc_opt_isKindOfClass(v37, v39);

            v23 = self;
            if ((isKindOfClass & 1) == 0)
            {
LABEL_25:
              -[SiriSharedUICompactHostingInstrumentationSupplement logDrillInInteractionForSnippetViewControllerIfNecessary:](v23->_instrumentationSupplement, "logDrillInInteractionForSnippetViewControllerIfNecessary:", v21);

              goto LABEL_26;
            }
          }
        }
        -[SRSystemAssistantExperienceViewController _pushQueuedNavigationContentViewController](v23, "_pushQueuedNavigationContentViewController");
        goto LABEL_25;
      }

    }
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v7)
      continue;
    break;
  }
LABEL_26:

}

- (void)siriSnippetViewController:(id)a3 setStatusViewHidden:(BOOL)a4
{
  -[SRSystemAssistantExperienceViewController _setSnippetViewControllerRequestsStatusViewHidden:](self, "_setSnippetViewControllerRequestsStatusViewHidden:", a4);
}

- (BOOL)siriSnippetViewControllerIsVisible:(id)a3
{
  return 1;
}

- (void)siriSnippetViewControllerViewDidLoad:(id)a3
{
  void *v4;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
    -[SRSystemAssistantExperienceViewController _smartDialogSnippetLayoutDidUpdateForView:](self, "_smartDialogSnippetLayoutDidUpdateForView:", v4);

    -[SiriSharedUISmartDialogView setNeedsLayout](self->_activeSmartDialogView, "setNeedsLayout");
    -[SRSystemAssistantExperienceViewController _pushQueuedNavigationContentViewController](self, "_pushQueuedNavigationContentViewController");
  }
}

- (void)userTouchedSnippet
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v2, "userTouchedSnippet");

}

- (void)siriSnippetViewController:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v9, "saeViewController:handleStartLocalRequest:turnIdentifier:", self, v8, v7);

}

- (void)userDrilledIntoSnippet
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v2, "userDrilledIntoSnippet");

}

- (void)siriSnippetViewController:(id)a3 informHostOfBackgroundView:(id)a4 isSnippetAsyncColored:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _BOOL4 hasSmartDialogSnippet;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;

  v5 = a5;
  v8 = a3;
  v10 = a4;
  if (v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "snippetBackgroundView"));

    objc_opt_class(SiriSharedUISmartDialogBackgroundView, v13);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
    v15 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentView"));
    objc_msgSend(v16, "addSubview:", v10);

    objc_msgSend(v15, "bounds");
    objc_msgSend(v10, "setFrame:");
    objc_msgSend(v15, "setContinuousCornerRadius:", SiriSharedUICompactPlatterCornerRadius);
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[SRSystemAssistantExperienceViewController siriSnippetViewController:informHostOfBackgroundView:isSnippetAsyncColored:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s #background: get SearchUIBackgroundColorView", buf, 0xCu);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView"));
    if (!objc_msgSend(v18, "onlyContainsSnippet"))
    {
      v12 = v15;
LABEL_25:

      goto LABEL_26;
    }
    hasSmartDialogSnippet = self->_hasSmartDialogSnippet;

    if (hasSmartDialogSnippet)
    {
      v12 = v15;
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(v15, "removeFromSuperview");
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView"));
    objc_msgSend(v40, "setSnippetBackgroundView:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView"));
    objc_msgSend(v18, "updateBackgroundView:smartDialogView:isSnippetAsyncColored:", v10, v39, 1);
    v12 = v15;
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class(UIVisualEffectView, v9);
  if ((objc_opt_isKindOfClass(v10, v20) & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "snippetBackgroundView"));
    objc_opt_class(UIVisualEffectView, v23);
    isKindOfClass = objc_opt_isKindOfClass(v22, v24);

    if ((isKindOfClass & 1) != 0)
    {
      v12 = v10;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView"));
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "snippetBackgroundView"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "effect"));
      objc_msgSend(v15, "setEffect:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "backgroundColor"));
      objc_msgSend(v15, "setBackgroundColor:", v28);

      v29 = SiriSharedUICompactPlatterCornerRadius;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
      objc_msgSend(v30, "setCornerRadius:", v29);

      if (self->_hasSmartDialogSnippet)
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentView", 0));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "subviews"));

        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (*(_QWORD *)v42 != v35)
                objc_enumerationMutation(v32);
              objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          }
          while (v34);
        }

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView"));
      if (!objc_msgSend(v18, "onlyContainsSnippet"))
        goto LABEL_25;
      v37 = self->_hasSmartDialogSnippet;

      if (v37)
        goto LABEL_26;
      objc_msgSend(v15, "removeFromSuperview");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView"));
      objc_msgSend(v38, "setSnippetBackgroundView:", 0);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView"));
      objc_msgSend(v18, "updateBackgroundView:smartDialogView:isSnippetAsyncColored:", v15, v39, 0);
      goto LABEL_24;
    }
  }
LABEL_28:

}

- (void)siriSnippetViewController:(id)a3 isBackgroundColorUpdateSuccessful:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  unsigned int v7;
  id v8;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController activeSmartDialogView](self, "activeSmartDialogView", a3));
  v7 = objc_msgSend(v6, "onlyContainsSnippet");

  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    objc_msgSend(v8, "searchUIBackgroundColorUpdateSuccessful:", v4);

  }
}

- (void)cancelSpeakingForSiriViewController:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "stopSpeakingForSAEViewController:", self);

}

- (void)siriViewController:(id)a3 speakText:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v9, "saeViewController:speakText:isPhonetic:completion:", self, v8, 0, v7);

}

- (BOOL)siriViewControllerShouldPreventUserInteraction:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate", a3));
  v5 = objc_msgSend(v4, "lockStateForSAEViewController:", self);

  return v5 != 0;
}

- (id)localeForSiriViewController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localeForSAEViewController:", self));

  return v5;
}

- (void)siriSnippetViewController:(id)a3 willDismissViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v6, "siriSAEViewController:willDismissViewController:", self, v5);

}

- (void)siriSnippetViewController:(id)a3 willPresentViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v6, "siriSAEViewController:willPresentViewController:", self, v5);

}

- (void)siriViewControllerWillBeginEditing:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "cancelRequestForViewController:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v5, "saeViewControllerRequestsHIDEventDefferal:", self);

}

- (void)siriViewControllerDidEndEditing:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "saeViewControllerCancelHIDEventDefferal:", self);

}

- (void)siriViewControllerViewDidAppear:(id)a3 isTopLevelViewController:(BOOL)a4
{
  SRSystemAssistantExperienceViewControllerDelegate **p_delegate;
  id v6;
  void *v7;
  id WeakRetained;

  if (a4)
  {
    p_delegate = &self->_delegate;
    v6 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceObject"));

    objc_msgSend(WeakRetained, "saeViewController:viewDidAppearForAceObject:", self, v7);
  }
}

- (void)siriViewControllerViewDidDisappear:(id)a3 isTopLevelViewController:(BOOL)a4
{
  SRSystemAssistantExperienceViewControllerDelegate **p_delegate;
  id v6;
  void *v7;
  id WeakRetained;

  if (a4)
  {
    p_delegate = &self->_delegate;
    v6 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceObject"));

    objc_msgSend(WeakRetained, "saeViewController:viewDidDisappearForAceObject:", self, v7);
  }
}

- (void)_setStatusViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v5, "saeViewController:setStatusViewHidden:", self, v3);

}

- (void)_setSnippetViewControllerRequestsStatusViewHidden:(BOOL)a3
{
  self->_snippetViewControllerRequestsStatusViewHidden = a3;
  -[SRSystemAssistantExperienceViewController _updateStatusViewVisibility](self, "_updateStatusViewVisibility");
}

- (void)_updateStatusViewVisibility
{
  -[SRSystemAssistantExperienceViewController _setStatusViewHidden:](self, "_setStatusViewHidden:", -[SRSystemAssistantExperienceViewController _hidesStatusViewForInputType:](self, "_hidesStatusViewForInputType:", -[SRSystemAssistantExperienceViewController _inputType](self, "_inputType")) | -[SRSystemAssistantExperienceViewController _snippetViewControllerRequestsStatusViewHidden](self, "_snippetViewControllerRequestsStatusViewHidden"));
}

- (void)_willBeginEditingOfType:(int64_t)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v5, "saeViewController:willBeginEditingOfType:", self, a3);

}

- (void)_didEndEditing
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v3, "saeViewControllerDidEndEditing:", self);

}

- (void)_updateKeyboardStateFromNotification:(id)a3
{
  id v4;
  SRCompactKeyboardState *v5;

  v4 = a3;
  v5 = -[SRCompactKeyboardState initWithKeyboardNotification:]([SRCompactKeyboardState alloc], "initWithKeyboardNotification:", v4);

  -[SRSystemAssistantExperienceViewController _setKeyboardState:](self, "_setKeyboardState:", v5);
}

- (void)_keyboardWillHideForAmbient:(id)a3
{
  if (self->_isInAmbient)
    -[SRSystemAssistantExperienceViewController _updateIsInAmbientWithInteractivity:](self, "_updateIsInAmbientWithInteractivity:", 0);
}

- (void)_keyboardWillShowForAmbient:(id)a3
{
  if (self->_isInAmbient)
    -[SRSystemAssistantExperienceViewController _updateIsInAmbientWithInteractivity:](self, "_updateIsInAmbientWithInteractivity:", 1);
}

- (void)_setKeyboardState:(id)a3
{
  SRCompactKeyboardState *v4;
  SRCompactKeyboardState *keyboardState;

  v4 = (SRCompactKeyboardState *)objc_msgSend(a3, "copy");
  keyboardState = self->_keyboardState;
  self->_keyboardState = v4;

  -[SRSystemAssistantExperienceViewController _updateBottomContentInsetKeyboardComponent](self, "_updateBottomContentInsetKeyboardComponent");
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screen"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "coordinateSpace"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _keyboardState](self, "_keyboardState"));
  objc_msgSend(v3, "frame");
  -[SRSystemAssistantExperienceViewController _convertRectFromKeyboard:](self, "_convertRectFromKeyboard:");
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
  return !-[SRSystemAssistantExperienceViewController _hidesStatusViewForInputType:](self, "_hidesStatusViewForInputType:", a3);
}

- (void)_setInputType:(int64_t)a3
{
  void *v5;

  if (self->_inputType != a3)
  {
    self->_inputType = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    objc_msgSend(v5, "setInputType:", a3);

    -[SRSystemAssistantExperienceViewController _updateTextRequestViewVisibility](self, "_updateTextRequestViewVisibility");
    -[SRSystemAssistantExperienceViewController _updateStatusViewVisibility](self, "_updateStatusViewVisibility");
  }
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
  id v7;

  v5 = a3;
  if (!-[SRSystemAssistantExperienceViewController _alwaysObscureBackgroundContentWhenActive](self, "_alwaysObscureBackgroundContentWhenActive"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController backgroundBlurViewController](self, "backgroundBlurViewController"));
    objc_msgSend(v7, "requestBackgroundBlurVisible:forReason:", v5, a4);

  }
}

- (BOOL)_keyboardHasContentAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[SRSystemAssistantExperienceViewController _keyboardFrame](self, "_keyboardFrame");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (void)_requestKeyboardWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v5, "saeViewController:requestsKeyboardWithCompletion:", self, v4);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewControllers"));
  v10 = objc_msgSend(v9, "count");

  if (v10 == (id)2)
  {
    self->_isDrilledIntoSnippet = 1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationItem"));
    objc_msgSend(v11, "setHidesBackButton:", 1);

    goto LABEL_5;
  }
  if (v10 == (id)1)
  {
    self->_isDrilledIntoSnippet = 0;
    objc_msgSend(v12, "setNavigationBarHidden:animated:", 1, v5);
LABEL_5:
    -[SRSystemAssistantExperienceViewController updateTopInset:animated:](self, "updateTopInset:animated:", 1, self->_topInset);
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
        v12 = -[SRSystemAssistantExperienceViewController contentDiffersBetweenItems:andItems:](self, "contentDiffersBetweenItems:andItems:", v11, v10);

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

- (id)_filterTranscriptItemsForSAEDialogBoxContent:(id)a3
{
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  uint64_t v26;
  void *i;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  BOOL v48;
  __int128 v50;
  id v51;
  id v52;
  uint64_t v53;
  id obj;
  void *v55;
  void *v56;
  void *v57;
  BOOL v58;
  void *v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  id v73;
  _BYTE v74[128];
  _BYTE v75[128];

  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (!v3)
    goto LABEL_44;
  v5 = v3;
  v6 = *(_QWORD *)v67;
  v7 = NSArray_ptr;
  *(_QWORD *)&v4 = 136315394;
  v50 = v4;
  v53 = *(_QWORD *)v67;
  do
  {
    v8 = 0;
    v52 = v5;
    do
    {
      if (*(_QWORD *)v67 != v6)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aceObject", v50));
      objc_opt_class(v7[53], v11);
      isKindOfClass = objc_opt_isKindOfClass(v10, v12);

      if ((isKindOfClass & 1) == 0)
        goto LABEL_42;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aceObject"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "siriui_card_compact"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "backingCard"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cardSections"));
      v59 = v14;
      v56 = v9;
      if (v17)
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "siriui_card_compact"));
      else
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "siriui_card"));
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "backingCard"));

      v60 = objc_msgSend(v20, "copy");
      v61 = objc_alloc_init((Class)NSMutableArray);
      v21 = objc_alloc_init((Class)NSMutableArray);
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "cardSections"));
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      v58 = v23 != 0;
      if (v23)
      {
        v24 = v23;
        v57 = v20;
        v55 = v8;
        v25 = 0;
        v26 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v63 != v26)
              objc_enumerationMutation(v22);
            v28 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
            v29 = objc_msgSend(v28, "shouldShowInSmartDialog");
            objc_opt_class(SFCombinedCardSection, v30);
            v32 = objc_opt_isKindOfClass(v28, v31);
            if (v29)
            {
              if ((v32 & 1) != 0)
              {
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "cardSections"));
                objc_msgSend(v21, "addObjectsFromArray:", v33);

              }
              else
              {
                objc_msgSend(v21, "addObject:", v28);
              }
              v25 = 1;
            }
            else if ((v32 & 1) != 0)
            {
              v34 = v28;
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "cardSections"));
              v36 = objc_msgSend(v35, "count");

              if (v36)
              {
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "cardSections"));
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectAtIndexedSubscript:", 0));

                if (objc_msgSend(v38, "shouldShowInSmartDialog"))
                {
                  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "cardSections"));
                  objc_msgSend(v21, "addObjectsFromArray:", v39);

                  v25 = 1;
                }

              }
            }
            else
            {
              objc_msgSend(v61, "addObject:", v28);
            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
        }
        while (v24);

        if ((v25 & 1) == 0)
        {
          v48 = 0;
          v5 = v52;
          v6 = v53;
          v7 = NSArray_ptr;
          v8 = v55;
          v41 = v59;
          v20 = v57;
          goto LABEL_41;
        }
        v40 = AFSiriLogContextConnection;
        v7 = NSArray_ptr;
        v41 = v59;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v50;
          v71 = "-[SRSystemAssistantExperienceViewController _filterTranscriptItemsForSAEDialogBoxContent:]";
          v72 = 2112;
          v73 = v61;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%s #dialogbox found card content for dialog box: %@", buf, 0x16u);
        }
        objc_msgSend(v57, "setCardSections:", v61);
        v22 = objc_msgSend(v59, "copy");
        v42 = objc_msgSend(objc_alloc((Class)_SFPBCard), "initWithFacade:", v57);
        v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "data"));
        objc_msgSend(v22, "setCardData:", v43);

        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "viewController"));
        objc_opt_class(SiriUICardSnippetViewController, v45);
        LOBYTE(v43) = objc_opt_isKindOfClass(v44, v46);

        v5 = v52;
        v8 = v55;
        if ((v43 & 1) != 0)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "viewController"));
          if (objc_msgSend(v61, "count"))
            objc_msgSend(v47, "setSnippet:", v22);
          else
            objc_msgSend(v56, "setViewController:", 0);

        }
        objc_msgSend(v60, "setCardSections:", v21);
        v51 = v60;
        v20 = v57;
      }
      else
      {
        v41 = v59;
      }

      v48 = v58;
      v6 = v53;
LABEL_41:

      if (v48)
        goto LABEL_45;
LABEL_42:
      v8 = (char *)v8 + 1;
    }
    while (v8 != v5);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  }
  while (v5);
LABEL_44:
  v51 = 0;
LABEL_45:

  return v51;
}

- (void)dropletContentWillUpdateLayout:(id)a3 withUpdatedContentSize:(CGSize)a4 animated:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  unsigned __int8 v9;
  UIViewSpringAnimationBehavior *defaultSpringAnimationBehavior;
  void *v11;
  void *v12;
  SiriSharedUISmartDialogView *activeSmartDialogView;
  void *v14;
  _QWORD v15[7];
  _QWORD v16[5];
  unsigned __int8 v17;
  _QWORD v18[7];

  height = a4.height;
  width = a4.width;
  v8 = a3;
  if (self->_activeSmartDialogIsLatencyPill)
  {
    v9 = -[SRUIFSpeechRecognitionHypothesis isFinal](self->_speechRecognitionHypothesis, "isFinal");
    defaultSpringAnimationBehavior = self->_defaultSpringAnimationBehavior;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100014E04;
    v18[3] = &unk_1001229A8;
    v18[4] = self;
    *(CGFloat *)&v18[5] = width;
    *(CGFloat *)&v18[6] = height;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100014E44;
    v16[3] = &unk_100122700;
    v17 = v9;
    v16[4] = self;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", defaultSpringAnimationBehavior, 0, v18, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
LABEL_3:
    v12 = v11;
    objc_msgSend(v11, "layoutSubviews");

    goto LABEL_4;
  }
  activeSmartDialogView = self->_activeSmartDialogView;
  if (activeSmartDialogView
    && -[SiriSharedUISmartDialogView hasResult](activeSmartDialogView, "hasResult"))
  {
    self->_activeSmartDialogSize.width = width;
    self->_activeSmartDialogSize.height = height;
    if (-[SRSystemAssistantExperienceViewController _shouldRenderResult](self, "_shouldRenderResult"))
    {
      -[SRSystemAssistantExperienceViewController _renderResult](self, "_renderResult");
      goto LABEL_4;
    }
    if (!self->_activeSmartDialogPresented)
      goto LABEL_4;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100014E88;
    v15[3] = &unk_1001229A8;
    v15[4] = self;
    *(CGFloat *)&v15[5] = width;
    *(CGFloat *)&v15[6] = height;
    +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self, "view"));
    objc_msgSend(v14, "layoutSubviews");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
    goto LABEL_3;
  }
LABEL_4:

}

- (double)dropletContentMaximumContainerWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  objc_msgSend(v2, "frame");
  v4 = v3;

  return v4;
}

- (double)dropletContentMaximumContainerHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  objc_msgSend(v2, "frame");
  v4 = v3;

  return v4;
}

- (void)siriSnippetViewControllerShouldPushSirilandSnippets:(id)a3
{
  -[SRSystemAssistantExperienceViewController siriSnippetViewController:pushSirilandSnippets:](self, "siriSnippetViewController:pushSirilandSnippets:", 0, a3);
}

- (void)siriSnippetViewControllerPerformAceCommands:(id)a3
{
  -[SRSystemAssistantExperienceViewController siriSnippetViewController:performAceCommands:sashItem:](self, "siriSnippetViewController:performAceCommands:sashItem:", 0, a3, 0);
}

- (void)siriViewControllerHeightDidChange
{
  -[SiriSharedUISmartDialogView snippetContentDidUpdate](self->_activeSmartDialogView, "snippetContentDidUpdate");
}

- (void)siriViewControllerShouldOpenUrl:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:openURL:completion:", self, v4, 0);

}

- (void)siriViewControllerSetStatusViewHidden:(BOOL)a3
{
  -[SRSystemAssistantExperienceViewController _setSnippetViewControllerRequestsStatusViewHidden:](self, "_setSnippetViewControllerRequestsStatusViewHidden:", a3);
}

- (void)siriViewControllerShouldRequestTextInputWithUtterance:(id)a3
{
  int64_t inputType;
  id v5;
  void *v6;
  id v7;

  inputType = self->_inputType;
  v5 = a3;
  if (inputType == 1)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController promptEntryView](self, "promptEntryView"));
    objc_msgSend(v7, "prefillWithText:", v5);

  }
  else
  {
    -[SRSystemAssistantExperienceViewController removeResponseElementsIfNeeded:](self, "removeResponseElementsIfNeeded:", 1);
    -[SRSystemAssistantExperienceViewController _setInputType:](self, "_setInputType:", 1);
    -[SRSystemAssistantExperienceViewController siriDidActivate](self, "siriDidActivate");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController promptEntryView](self, "promptEntryView"));
    objc_msgSend(v6, "prefillWithText:", v5);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
    objc_msgSend(v7, "siriSAEViewControllerRequestsTextActivation:withRequestSource:", self, 32);
  }

}

- (void)switchPresentationToTextInput
{
  -[SRSystemAssistantExperienceViewController _setInputType:](self, "_setInputType:", 1);
  -[SRSystemAssistantExperienceViewController siriDidActivate](self, "siriDidActivate");
}

- (void)promptEntryViewWillPresentEditMenu:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "siriSAEViewControllerWillBeginTextEditMenuInteraction:", self);

}

- (void)promptEntryDidDismissEditMenu:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "siriSAEViewControllerDidEndTextEditMenuInteraction:", self);

}

- (void)entryViewDidSubmit:(id)a3 text:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  objc_msgSend(v6, "removeSuggestions");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v7, "viewController:siriRequestEnteredWithText:", self, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController traitCollection](self, "traitCollection"));
  v9 = objc_msgSend(v8, "verticalSizeClass");

  if (v9 == (id)1)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController promptEntryView](self, "promptEntryView"));
    objc_msgSend(v10, "resignKeyboard");

  }
}

- (void)entryViewDidSubmit:(id)a3 suggestionText:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController containerView](self, "containerView"));
  objc_msgSend(v6, "removeSuggestions");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v7, "viewController:siriRequestEnteredWithSuggestion:", self, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController traitCollection](self, "traitCollection"));
  v9 = objc_msgSend(v8, "verticalSizeClass");

  if (v9 == (id)1)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController promptEntryView](self, "promptEntryView"));
    objc_msgSend(v10, "resignKeyboard");

  }
}

- (void)didChangeText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  SiriSharedUISuggestionsViewInterface *suggestionsViewProvider;
  void *v8;
  NSArray *v9;
  NSArray *suggestionViews;
  NSArray *suggestionTexts;
  _QWORD v12[5];
  id v13;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
    v6 = objc_msgSend(v5, "lockStateForSAEViewController:", self);

    objc_initWeak(&location, self);
    suggestionsViewProvider = self->_suggestionsViewProvider;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100015514;
    v12[3] = &unk_100122880;
    objc_copyWeak(&v13, &location);
    v12[4] = self;
    -[SiriSharedUISuggestionsViewInterface fetchAutoCompletionSuggestionsViewsWithQuery:deviceLocked:completion:](suggestionsViewProvider, "fetchAutoCompletionSuggestionsViewsWithQuery:deviceLocked:completion:", v4, v6 == (id)2, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUISuggestionsViewInterface getInitialSuggestionViews](self->_suggestionsViewProvider, "getInitialSuggestionViews"));
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _createSmartDialogViewsFromSuggestionViews:](self, "_createSmartDialogViewsFromSuggestionViews:", v8));
    suggestionViews = self->_suggestionViews;
    self->_suggestionViews = v9;

    -[SiriSharedUISystemAssistantExperienceContainerView setSuggestions:](self->_containerView, "setSuggestions:", self->_suggestionViews);
    suggestionTexts = self->_suggestionTexts;
    self->_suggestionTexts = (NSArray *)&__NSArray0__struct;

  }
}

- (void)handleVoiceActivationRequestWithRequestOptions:(id)a3
{
  id v4;
  void *v5;
  UIViewSpringAnimationBehavior *suggestionsSpringAnimationBehavior;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = a3;
  -[SRSystemAssistantExperienceViewController _setInputType:](self, "_setInputType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController promptEntryView](self, "promptEntryView"));
  objc_msgSend(v5, "resignFirstResponder");

  suggestionsSpringAnimationBehavior = self->_suggestionsSpringAnimationBehavior;
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000159DC;
  v9[3] = &unk_1001225C0;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015A0C;
  v8[3] = &unk_100122728;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", suggestionsSpringAnimationBehavior, 0, v9, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate"));
  objc_msgSend(v7, "siriSAEViewControllerRequestsVoiceActivation:withRequestOptions:", self, v4);

}

- (void)entryViewShouldShowSuggestions:(id)a3 showSuggestions:(BOOL)a4
{
  UIViewSpringAnimationBehavior *suggestionsSpringAnimationBehavior;
  _QWORD v5[5];

  self->_shouldShowSuggestions = a4;
  suggestionsSpringAnimationBehavior = self->_suggestionsSpringAnimationBehavior;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015B4C;
  v5[3] = &unk_1001225C0;
  v5[4] = self;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", suggestionsSpringAnimationBehavior, 0, v5, 0);
}

- (void)keyboardIsReadyToReceiveInput
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController _instrumentationManager](self, "_instrumentationManager"));
  v4 = SRUIFConstructLaunchContextForLaunchEnded();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "emitInstrumentation:", v5);

  -[SRTypeToSiriKeyboardReadinessObserver stop](self->_typeToSiriKeyboardReadinessObserver, "stop");
}

- (void)containerView:(id)a3 requestsDismissalWithReason:(int64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController delegate](self, "delegate", a3));
  objc_msgSend(v6, "endSiriSessionForViewController:withDismissalReason:", self, a4);

}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)alwaysShowSpeech
{
  return self->_alwaysShowSpeech;
}

- (void)setAlwaysShowSpeech:(BOOL)a3
{
  self->_alwaysShowSpeech = a3;
}

- (SRSystemAssistantExperienceViewControllerDelegate)delegate
{
  return (SRSystemAssistantExperienceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)_activeTranscriptItems
{
  return self->_activeTranscriptItems;
}

- (void)_setActiveTranscriptItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)_activeConversationTranscriptItems
{
  return self->_activeConversationTranscriptItems;
}

- (NSArray)_smartDialogServerUtterances
{
  return self->_serverUtterances;
}

- (SRUIFSpeechRecognitionHypothesis)_smartDialogSpeechRecognitionHypothesis
{
  return self->_speechRecognitionHypothesis;
}

- (SiriSharedUILatencyViewModel)_smartDialogLatencyViewModel
{
  return self->_latencyViewModel;
}

- (SiriUINavigationController)_navigationController
{
  return self->_navigationController;
}

- (SRSystemAssistantExperienceRootViewController)_rootViewController
{
  return self->_rootViewController;
}

- (SiriSharedUICompactResultViewController)_resultViewController
{
  return self->_resultViewController;
}

- (UIViewController)_queuedNavigationContentViewController
{
  return self->_queuedNavigationContentViewController;
}

- (void)_setQueuedNavigationContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_queuedNavigationContentViewController, a3);
}

- (NSMutableArray)finalAndDisplayedSmartDialogs
{
  return self->_finalAndDisplayedSmartDialogs;
}

- (void)setFinalAndDisplayedSmartDialogs:(id)a3
{
  objc_storeStrong((id *)&self->_finalAndDisplayedSmartDialogs, a3);
}

- (SiriSharedUISmartDialogView)activeSmartDialogView
{
  return self->_activeSmartDialogView;
}

- (void)setActiveSmartDialogView:(id)a3
{
  objc_storeStrong((id *)&self->_activeSmartDialogView, a3);
}

- (CGSize)activeSmartDialogSize
{
  double width;
  double height;
  CGSize result;

  width = self->_activeSmartDialogSize.width;
  height = self->_activeSmartDialogSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setActiveSmartDialogSize:(CGSize)a3
{
  self->_activeSmartDialogSize = a3;
}

- (SiriSharedUISystemAssistantExperienceContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (_TtC4Siri30SystemAssistantPromptEntryView)promptEntryView
{
  return self->_promptEntryView;
}

- (void)setPromptEntryView:(id)a3
{
  objc_storeStrong((id *)&self->_promptEntryView, a3);
}

- (BOOL)_snippetViewControllerRequestsStatusViewHidden
{
  return self->_snippetViewControllerRequestsStatusViewHidden;
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
  objc_storeStrong((id *)&self->_promptEntryView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_activeSmartDialogView, 0);
  objc_storeStrong((id *)&self->_finalAndDisplayedSmartDialogs, 0);
  objc_storeStrong((id *)&self->_queuedNavigationContentViewController, 0);
  objc_storeStrong((id *)&self->_resultViewController, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_latencyViewModel, 0);
  objc_storeStrong((id *)&self->_speechRecognitionHypothesis, 0);
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_storeStrong((id *)&self->_activeConversationTranscriptItems, 0);
  objc_storeStrong((id *)&self->_activeTranscriptItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedbackButton, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_storeStrong((id *)&self->_typeToSiriKeyboardReadinessObserver, 0);
  objc_storeStrong((id *)&self->_suggestionsSpringAnimationBehavior, 0);
  objc_storeStrong((id *)&self->_pillMergeSpringAnimationBehavior, 0);
  objc_storeStrong((id *)&self->_defaultSpringAnimationBehavior, 0);
  objc_storeStrong(&self->renderResultBlock, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong(&self->smartDialogPluginBlock, 0);
  objc_storeStrong(&self->smartDialogCardBlock, 0);
  objc_storeStrong(&self->snippetUpdateBlock, 0);
  objc_storeStrong(&self->serverUtteranceUpdateBlock, 0);
  objc_storeStrong((id *)&self->_suggestionViews, 0);
  objc_storeStrong((id *)&self->_suggestionTexts, 0);
  objc_storeStrong((id *)&self->_suggestionsViewProvider, 0);
  objc_storeStrong((id *)&self->_storedConversationTranscriptItems, 0);
  objc_storeStrong((id *)&self->_userHesitationCountdownTimer, 0);
  objc_storeStrong((id *)&self->_fullScreenEffects, 0);
}

@end
