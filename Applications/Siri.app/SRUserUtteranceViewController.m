@implementation SRUserUtteranceViewController

- (void)loadView
{
  SRUserUtteranceView *v3;
  SRUserUtteranceView *utteranceView;
  void *v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *tapRecognizer;
  SRUserUtteranceContainerView *v8;
  SRUserUtteranceContainerView *containerView;

  if (!self->_utteranceView)
  {
    v3 = -[SRUserUtteranceView initWithFrame:]([SRUserUtteranceView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    utteranceView = self->_utteranceView;
    self->_utteranceView = v3;

    -[SRUserUtteranceView setEditable:](self->_utteranceView, "setEditable:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    -[SRUserUtteranceViewController _updateViewWithUserUtterance:](self, "_updateViewWithUserUtterance:", v5);

    v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_utteranceViewDidSelect:");
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v6;

    -[SRUserUtteranceView addGestureRecognizer:](self->_utteranceView, "addGestureRecognizer:", self->_tapRecognizer);
    v8 = objc_alloc_init(SRUserUtteranceContainerView);
    containerView = self->_containerView;
    self->_containerView = v8;

    -[SRUserUtteranceContainerView addSubview:](self->_containerView, "addSubview:", self->_utteranceView);
    -[SRUserUtteranceContainerView setDisplayView:](self->_containerView, "setDisplayView:", self->_utteranceView);
    -[SRUserUtteranceViewController setView:](self, "setView:", self->_containerView);
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SRUserUtteranceViewController;
  -[SRUserUtteranceViewController viewWillLayoutSubviews](&v14, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (self->_previousBounds.size.width != v9 || self->_previousBounds.size.height != v11)
  {
    if (self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView collectionViewLayout](self->_speechAlternativeCollectionView, "collectionViewLayout"));
      objc_msgSend(v13, "invalidateLayout");

    }
    self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews = 1;
    self->_previousBounds.origin.x = v5;
    self->_previousBounds.origin.y = v7;
    self->_previousBounds.size.width = v9;
    self->_previousBounds.size.height = v11;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  objc_super v15;
  _QWORD block[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  if (v10 != width || v12 != height)
  {
    self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView collectionViewLayout](self->_speechAlternativeCollectionView, "collectionViewLayout"));
    objc_msgSend(v14, "invalidateLayout");

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000324C4;
    block[3] = &unk_1001225C0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  v15.receiver = self;
  v15.super_class = (Class)SRUserUtteranceViewController;
  -[SRUserUtteranceViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  CGFloat Width;
  CGFloat Height;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)SRUserUtteranceViewController;
  -[SRUserUtteranceViewController viewDidLayoutSubviews](&v15, "viewDidLayoutSubviews");
  -[SRUserUtteranceView frame](self->_utteranceView, "frame");
  v6 = v5;
  v8 = v7;
  if (self->_oldUtteranceViewSize.width != v3 || self->_oldUtteranceViewSize.height != v4)
  {
    v10 = v3;
    v11 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
    objc_msgSend(v12, "siriViewControllerHeightDidChange:", self);

    v16.origin.x = v6;
    v16.origin.y = v8;
    v16.size.width = v10;
    v16.size.height = v11;
    Width = CGRectGetWidth(v16);
    v17.origin.x = v6;
    v17.origin.y = v8;
    v17.size.width = v10;
    v17.size.height = v11;
    Height = CGRectGetHeight(v17);
    self->_oldUtteranceViewSize.width = Width;
    self->_oldUtteranceViewSize.height = Height;
  }
}

- (void)_updateViewWithUserUtterance:(id)a3
{
  SRUserUtteranceView *utteranceView;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  utteranceView = self->_utteranceView;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bestTextInterpretation"));
  -[SRUserUtteranceView setText:](utteranceView, "setText:", v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allPhrases"));
  if (v9)
  {
    self->_changeUtteranceShouldDisplay = 1;
    self->_receivedFinalRecognitionResult = 1;
    -[SRUserUtteranceViewController _updateViewWithChangeUtteranceIfNeeded:](self, "_updateViewWithChangeUtteranceIfNeeded:", self->_changeUtteranceCommand);
    if (self->_editableUtteranceView)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
      -[SRUserUtteranceViewController restoreOriginalEditTextContents:](self, "restoreOriginalEditTextContents:", v7);

    }
    else
    {
      -[SRUserUtteranceViewController createEditableUtteranceView](self, "createEditableUtteranceView");
    }
    -[SRUserUtteranceView setBlendEffectEnabled:](self->_utteranceView, "setBlendEffectEnabled:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
    objc_msgSend(v8, "siriViewControllerHeightDidChange:", self);

  }
}

- (void)_updateViewWithChangeUtteranceIfNeeded:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    if (self->_changeUtteranceShouldDisplay)
    {
      v10 = v4;
      v5 = (uint64_t)objc_msgSend(v4, "utteranceIndex");
      v4 = v10;
      if (v5 >= 1)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
        v7 = objc_msgSend(v6, "numberOfAlternativeUtterances");

        v4 = v10;
        if (v5 < (uint64_t)v7)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textOfUtteranceAtIndex:", v5));

          -[SRUserUtteranceView setText:](self->_utteranceView, "setText:", v9);
          v4 = v10;
        }
      }
    }
  }

}

- (void)setUtteranceUserInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  SRUserUtteranceView *utteranceView;
  UITapGestureRecognizer *tapRecognizer;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SRUserUtteranceViewController;
  -[SRUserUtteranceViewController setUtteranceUserInteractionEnabled:](&v8, "setUtteranceUserInteractionEnabled:");
  v5 = !v3;
  -[SRUserUtteranceView setChevronHidden:](self->_utteranceView, "setChevronHidden:", v5);
  utteranceView = self->_utteranceView;
  tapRecognizer = self->_tapRecognizer;
  if (v5)
    -[SRUserUtteranceView removeGestureRecognizer:](utteranceView, "removeGestureRecognizer:", tapRecognizer);
  else
    -[SRUserUtteranceView addGestureRecognizer:](utteranceView, "addGestureRecognizer:", tapRecognizer);
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SRUserUtteranceViewController;
  v3 = -[SRUserUtteranceViewController description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("%@"), v5));

  return (NSString *)v6;
}

- (void)_setUserUtterance:(id)a3
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  if (v5)
  {
    v7 = v5;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));

    v5 = v7;
    if (v6 != v7)
    {
      self->_forceBestTextInterpretation = 0;
      -[SRUserUtteranceViewController _updateViewWithUserUtterance:](self, "_updateViewWithUserUtterance:", v7);
      objc_storeStrong((id *)&self->_userUtterance, a3);
      v5 = v7;
    }
  }

}

- (id)_correctionIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "correctionIdentifier"));

  return v3;
}

- (double)desiredHeightForWidth:(double)a3
{
  double v3;

  self->_latestGivenWidth = a3;
  if (self->_showSpeechAlternativeList)
    -[SiriUICollectionViewFlowLayout collectionViewContentSize](self->_speechAlternativeCollectionViewLayout, "collectionViewContentSize");
  else
    -[SRUserUtteranceView sizeThatFits:](self->_utteranceView, "sizeThatFits:");
  return v3;
}

- (void)removeSpeechAlternatives
{
  NSArray *speechAlternativeDisplayList;
  id v4;
  uint64_t v5;

  speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
  self->_speechAlternativeDisplayList = (NSArray *)&__NSArray0__struct;

  -[NSMutableArray removeAllObjects](self->_speechAlternativeList, "removeAllObjects");
  -[SRUserUtteranceViewController createViewArray](self, "createViewArray");
  v4 = -[UICollectionView reloadData](self->_speechAlternativeCollectionView, "reloadData");
  -[UICollectionView recursive_setSemanticContentAttribute:](self->_speechAlternativeCollectionView, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(v4, v5));
}

- (void)removeSpeechAlternativeViewAndUpdateUtteranceTextIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  SRUserUtteranceView *utteranceView;
  id v7;

  self->_showSpeechAlternativeList = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
  objc_msgSend(v3, "siriViewControllerHeightDidChange:pinTopOfSnippet:", self, 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
  objc_msgSend(v4, "siriViewControllerRequestToPin:", self);

  if (self->_textChanged)
  {
    -[SRUserUtteranceViewController removeSpeechAlternatives](self, "removeSpeechAlternatives");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    -[SRUserUtteranceViewController restoreOriginalEditTextContents:](self, "restoreOriginalEditTextContents:", v5);

    utteranceView = self->_utteranceView;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SREditableTextView text](self->_editableUtteranceView, "text"));
    -[SRUserUtteranceView setText:](utteranceView, "setText:", v7);

  }
}

- (void)handleAceCommand:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_opt_class(SAUIChangePrimaryUtterance, v5);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
  {
    objc_storeStrong((id *)&self->_changeUtteranceCommand, a3);
    -[SRUserUtteranceViewController handleChangeUtteranceCommand:](self, "handleChangeUtteranceCommand:", self->_changeUtteranceCommand);
  }
  else
  {
    objc_opt_class(SAUIShowSpeechAlternatives, v7);
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
      -[SRUserUtteranceViewController handleShowSpeechAlternativesCommand:](self, "handleShowSpeechAlternativesCommand:", v9);
  }

}

- (void)handleShowSpeechAlternativesCommand:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance", a3));
  -[SRUserUtteranceViewController restoreOriginalEditTextContents:](self, "restoreOriginalEditTextContents:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView window](self->_speechAlternativeCollectionView, "window"));
  if (v5)
    -[SREditableTextView beginEditing](self->_editableUtteranceView, "beginEditing");
  else
    -[SRUserUtteranceViewController _utteranceViewDidSelect:](self, "_utteranceViewDidSelect:", self->_utteranceView);
}

- (void)handleChangeUtteranceCommand:(id)a3
{
  id v4;
  NSObject *v5;
  SAUIChangePrimaryUtterance *changeUtteranceCommand;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSArray *v16;
  NSArray *speechAlternativeDisplayList;
  id v18;
  uint64_t v19;
  SRUserUtteranceView *utteranceView;
  void *v21;
  void *v22;
  void *v23;
  SAUIChangePrimaryUtterance *v24;
  int v25;
  const char *v26;
  __int16 v27;
  id v28;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 136315394;
    v26 = "-[SRUserUtteranceViewController handleChangeUtteranceCommand:]";
    v27 = 2112;
    v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s handleChangeUtteranceCommand: %@", (uint8_t *)&v25, 0x16u);
  }
  if (self->_receivedFinalRecognitionResult)
  {
    changeUtteranceCommand = (SAUIChangePrimaryUtterance *)v4;
    v7 = (uint64_t)-[SAUIChangePrimaryUtterance utteranceIndex](changeUtteranceCommand, "utteranceIndex");
    if (v7 >= 1)
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
      v10 = objc_msgSend(v9, "numberOfAlternativeUtterances");

      if (v8 < (uint64_t)v10)
      {
        self->_forceBestTextInterpretation = 1;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dictationResult"));

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
        v14 = objc_msgSend(v13, "updateDictationResult:withAlternativeUtteranceAtIndex:", v12, v8);

        v15 = -[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:](self, "speechAlternativeHighlightListWithScore:", SiriUIShowSpeechAlternativeScore());
        v16 = (NSArray *)objc_claimAutoreleasedReturnValue(v15);
        speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
        self->_speechAlternativeDisplayList = v16;

        -[SRUserUtteranceViewController createViewArray](self, "createViewArray");
        v18 = -[UICollectionView reloadData](self->_speechAlternativeCollectionView, "reloadData");
        -[UICollectionView recursive_setSemanticContentAttribute:](self->_speechAlternativeCollectionView, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(v18, v19));
        utteranceView = self->_utteranceView;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView text](self->_editableUtteranceView, "text"));
        -[SRUserUtteranceView setText:](utteranceView, "setText:", v21);

        -[SRUserUtteranceView setNeedsLayout](self->_utteranceView, "setNeedsLayout");
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
        objc_msgSend(v22, "siriViewControllerHeightDidChange:", self);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController view](self, "view"));
        objc_msgSend(v23, "setNeedsLayout");

      }
    }
  }
  else
  {
    v24 = (SAUIChangePrimaryUtterance *)v4;
    changeUtteranceCommand = self->_changeUtteranceCommand;
    self->_changeUtteranceCommand = v24;
  }

}

- (void)setAceObject:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSString *v10;
  NSString *speechAlternativeListTitle;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSString *v21;
  NSString *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *alternativeInfoMap;
  NSString *v25;
  NSString *sessionId;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  objc_super v36;
  const __CFString *v37;
  void *v38;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SRUserUtteranceViewController;
  -[SRUserUtteranceViewController setAceObject:](&v36, "setAceObject:", v4);
  objc_opt_class(SASSpeechRecognized, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v8 = v4;
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "af_userUtteranceValue"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    speechAlternativeListTitle = self->_speechAlternativeListTitle;
    self->_speechAlternativeListTitle = v10;

    if (!self->_speechAlternativeListTitle)
    {
      *(_QWORD *)&v13 = objc_opt_class(self, v12).n128_u64[0];
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v14, v13));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "siriUILocalizedStringForKey:table:", CFSTR("TITLE_FOR_SPEECH_ALTERNATIVE_LIST"), 0));
      v17 = objc_alloc((Class)NSLocale);
      v18 = AFUIGetLanguageCode();
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = objc_msgSend(v17, "initWithLocaleIdentifier:", v19);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uppercaseStringWithLocale:", v20));
      v22 = self->_speechAlternativeListTitle;
      self->_speechAlternativeListTitle = v21;

    }
    v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    alternativeInfoMap = self->_alternativeInfoMap;
    self->_alternativeInfoMap = v23;

    v25 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionId"));
    sessionId = self->_sessionId;
    self->_sessionId = v25;

    if (AFIsInternalInstall(v27, v28))
    {
      v37 = CFSTR("bestTextInterpretation");
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "af_bestTextInterpretation"));
      v38 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));

    }
    else
    {
      v30 = 0;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics"));
    objc_msgSend(v33, "logEventWithType:context:", 1507, v30);

LABEL_12:
    goto LABEL_13;
  }
  objc_opt_class(SASSpeechPartialResult, v7);
  if ((objc_opt_isKindOfClass(v4, v31) & 1) == 0)
  {
    objc_opt_class(SAUIUserUtteranceView, v32);
    if ((objc_opt_isKindOfClass(v4, v34) & 1) == 0)
    {
      v9 = 0;
      goto LABEL_13;
    }
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    v9 = objc_msgSend(objc_alloc((Class)AFUserUtterance), "initWithString:correctionIdentifier:", v8, 0);
    goto LABEL_12;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_userUtteranceValue"));
LABEL_13:
  -[SRUserUtteranceViewController _setUserUtterance:](self, "_setUserUtterance:", v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
  -[SRUserUtteranceViewController _updateViewWithUserUtterance:](self, "_updateViewWithUserUtterance:", v35);

}

- (double)desiredPinnedTopPadding
{
  double result;
  int v4;
  double v5;

  if ((SiriUIIsCompactWidth(self, a2) & 1) != 0)
  {
    -[SRUserUtteranceViewController _scaledPaddingForPadding:](self, "_scaledPaddingForPadding:", 52.0);
  }
  else
  {
    v4 = SiriUIIsCompactHeight();
    v5 = 84.0;
    if (v4)
      v5 = 52.0;
    -[SRUserUtteranceViewController _scaledPaddingForPadding:](self, "_scaledPaddingForPadding:", v5);
  }
  return result;
}

- (double)_scaledPaddingForPadding:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](UIFont, "siriui_userUtteranceFont"));
  objc_msgSend(v5, "_scaledValueForValue:", a3);
  v7 = v6;

  -[SRUserUtteranceContainerView firstLineBaselineOffsetFromTop](self->_containerView, "firstLineBaselineOffsetFromTop");
  return v7 - v8;
}

- (double)baselineOffsetFromBottom
{
  double result;

  -[SRUserUtteranceContainerView baselineOffsetFromBottom](self->_containerView, "baselineOffsetFromBottom");
  return result;
}

- (void)endEditingAndCorrect:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView window](self->_editableUtteranceView, "window"));

  if (v5)
    -[SREditableTextView endEditingAndCorrect:](self->_editableUtteranceView, "endEditingAndCorrect:", v3);
  if (!v3)
  {
    self->_showSpeechAlternativeList = 0;
    -[SRUserUtteranceViewController _hideEditableUtteranceView](self, "_hideEditableUtteranceView");
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
    objc_msgSend(v6, "siriViewControllerRequestTearDownEditingViewController:", self);

  }
}

- (void)endEditingAndCorrectByTouchPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  NSMutableArray *viewArray;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView hitTest:withEvent:](self->_speechAlternativeCollectionView, "hitTest:withEvent:", 0, a3.x, a3.y));
  v5 = v4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    viewArray = self->_viewArray;
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_100033464;
    v11 = &unk_100122F58;
    v12 = v4;
    v13 = &v14;
    -[NSMutableArray enumerateObjectsUsingBlock:](viewArray, "enumerateObjectsUsingBlock:", &v8);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate", v8, v9, v10, v11));
  objc_msgSend(v7, "siriViewControllerRequestTearDownEditingViewController:", self);

  if (v15[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SRUserUtteranceViewController removeSpeechAlternativeViewAndUpdateUtteranceTextIfNecessary](self, "removeSpeechAlternativeViewAndUpdateUtteranceTextIfNecessary");
    -[SRUserUtteranceViewController _hideEditableUtteranceView](self, "_hideEditableUtteranceView");
  }
  else
  {
    -[SRUserUtteranceViewController handleSelectRow:](self, "handleSelectRow:");
  }
  _Block_object_dispose(&v14, 8);

}

- (void)siriDidDeactivate
{
  if (-[SREditableTextView isFirstResponder](self->_editableUtteranceView, "isFirstResponder"))
    -[SRUserUtteranceViewController endEditingAndCorrect:](self, "endEditingAndCorrect:", 0);
}

- (int64_t)_pinAnimationType
{
  return 1;
}

- (int64_t)_insertionAnimation
{
  return SiriUIIsStreamingDictationEnabled(self, a2) ^ 1;
}

- (int64_t)_replacementAnimation
{
  if (SiriUIIsStreamingDictationEnabled(self, a2))
    return 0;
  else
    return 2;
}

- (double)_insertionAnimatedZPosition
{
  double result;

  +[SRUserUtteranceView insertionAnimatedZPosition](SRUserUtteranceView, "insertionAnimatedZPosition");
  return result;
}

- (void)_utteranceViewDidSelect:(id)a3
{
  SRUserUtteranceContainerView *containerView;
  _QWORD v5[5];

  if (self->_receivedFinalRecognitionResult)
  {
    -[SRUserUtteranceViewController _createSpeechAlternativeViewsIfNecessary](self, "_createSpeechAlternativeViewsIfNecessary", a3);
    self->_showSpeechAlternativeList = 1;
    -[SiriUICollectionViewFlowLayout invalidateLayout](self->_speechAlternativeCollectionViewLayout, "invalidateLayout");
    -[SREditableTextView beginEditing](self->_editableUtteranceView, "beginEditing");
    containerView = self->_containerView;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100033668;
    v5[3] = &unk_1001225C0;
    v5[4] = self;
    -[SRUserUtteranceContainerView animateToEditWithDuration:completion:](containerView, "animateToEditWithDuration:completion:", v5, 0.1);
  }
}

- (void)_hideEditableUtteranceView
{
  SRUserUtteranceView *utteranceView;
  void *v4;
  SRUserUtteranceContainerView *containerView;
  _QWORD v6[5];

  utteranceView = self->_utteranceView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView text](self->_editableUtteranceView, "text"));
  -[SRUserUtteranceView setText:](utteranceView, "setText:", v4);

  containerView = self->_containerView;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100033764;
  v6[3] = &unk_1001225C0;
  v6[4] = self;
  -[SRUserUtteranceContainerView animateToDisplayWithDuration:completion:](containerView, "animateToDisplayWithDuration:completion:", v6, 0.1);
}

- (void)createEditableUtteranceView
{
  SREditableTextView *v3;
  SREditableTextView *editableUtteranceView;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (!self->_editableUtteranceView)
  {
    v3 = -[SREditableTextView initWithFrame:presentationStyle:]([SREditableTextView alloc], "initWithFrame:presentationStyle:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    editableUtteranceView = self->_editableUtteranceView;
    self->_editableUtteranceView = v3;

    if (SiriLanguageIsRTL(v5, v6))
      v7 = 2;
    else
      v7 = 0;
    -[SREditableTextView setTextAlignment:](self->_editableUtteranceView, "setTextAlignment:", v7);
    -[SREditableTextView setDelegate:](self->_editableUtteranceView, "setDelegate:", self);
    -[SREditableTextView setAutoresizingMask:](self->_editableUtteranceView, "setAutoresizingMask:", 18);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    -[SRUserUtteranceViewController restoreOriginalEditTextContents:](self, "restoreOriginalEditTextContents:", v8);

  }
}

- (BOOL)editableTextViewTextShouldPreventCorrection:(id)a3
{
  SRUserUtteranceViewController *v3;
  void *v4;

  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate", a3));
  LOBYTE(v3) = objc_msgSend(v4, "siriViewControllerShouldPreventUserInteraction:", v3);

  return (char)v3;
}

- (void)editableTextViewRequestKeyboardForTapToEditWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
  objc_msgSend(v5, "siriViewControllerRequestKeyboardForTapToEditWithCompletion:", v4);

}

- (void)editableTextViewTextWillBeginCorrecting:(id)a3
{
  NSString *v4;
  NSString *preCorrectionText;
  SREditableTextView *editableUtteranceView;
  CGFloat v7;
  CGFloat v8;
  NSArray *speechAlternativeDisplayList;
  id v10;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  CGRect v19;

  v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[SREditableTextView text](self->_editableUtteranceView, "text", a3));
  preCorrectionText = self->_preCorrectionText;
  self->_preCorrectionText = v4;

  editableUtteranceView = self->_editableUtteranceView;
  -[SREditableTextView frame](editableUtteranceView, "frame");
  -[SREditableTextView sizeThatFits:](editableUtteranceView, "sizeThatFits:", CGRectGetWidth(v19), 1.79769313e308);
  self->_currentTextSize.width = v7;
  self->_currentTextSize.height = v8;
  self->_textChanged = 0;
  speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
  if (!speechAlternativeDisplayList)
  {
    v10 = -[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:](self, "speechAlternativeHighlightListWithScore:", SiriUIShowSpeechAlternativeScore());
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue(v10);
    v12 = self->_speechAlternativeDisplayList;
    self->_speechAlternativeDisplayList = v11;

    speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
  }
  if (-[NSArray count](speechAlternativeDisplayList, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
    objc_msgSend(v13, "siriViewControllerHeightDidChange:pinTopOfSnippet:", self, 1);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
  objc_msgSend(v14, "siriViewControllerWillBeginEditing:", self);

  v18 = (id)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController aceObject](self, "aceObject"));
  v16 = AFAnalyticsContextCreateWithCommand();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v18, "logEventWithType:context:", 1424, v17);

}

- (void)_checkUpdatedSizingForEditableTextView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v10;
  CGRect v11;

  v4 = a3;
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "sizeThatFits:", CGRectGetWidth(v11), 1.79769313e308);
  v6 = v5;
  v8 = v7;

  if (v6 != self->_currentTextSize.width || v8 != self->_currentTextSize.height)
  {
    self->_currentTextSize.width = v6;
    self->_currentTextSize.height = v8;
    -[SiriUICollectionViewFlowLayout invalidateLayout](self->_speechAlternativeCollectionViewLayout, "invalidateLayout");
    v10 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
    objc_msgSend(v10, "siriViewControllerHeightDidChange:", self);

  }
}

- (void)editableTextViewTextDidChange:(id)a3
{
  id v4;
  NSString *preCorrectionText;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SRUserUtteranceViewController _checkUpdatedSizingForEditableTextView:](self, "_checkUpdatedSizingForEditableTextView:", v4);
  objc_msgSend(v4, "setNeedsLayout");
  preCorrectionText = self->_preCorrectionText;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7));
  self->_textChanged = !-[NSString isEqualToString:](preCorrectionText, "isEqualToString:", v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
  objc_msgSend(v9, "siriViewControllerRequestToPin:", self);

}

- (void)editableTextViewTextDidFinishCorrecting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SRUserUtteranceView *utteranceView;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
  objc_msgSend(v5, "siriViewControllerDidEndEditing:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v7 = v6;
  self->_showSpeechAlternativeList = 0;
  if (!self->_textChanged)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    -[SRUserUtteranceViewController restoreOriginalEditTextContents:](self, "restoreOriginalEditTextContents:", v11);
    goto LABEL_6;
  }
  if (!objc_msgSend(v6, "length"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    -[SRUserUtteranceViewController restoreOriginalEditTextContents:](self, "restoreOriginalEditTextContents:", v18);

    utteranceView = self->_utteranceView;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bestTextInterpretation"));
    -[SRUserUtteranceView setText:](utteranceView, "setText:", v21);

    goto LABEL_11;
  }
  if (!-[NSString isEqualToString:](self->_preCorrectionText, "isEqualToString:", v7))
  {
    v8 = objc_alloc((Class)AFUserUtterance);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "correctionIdentifier"));
    v11 = objc_msgSend(v8, "initWithString:correctionIdentifier:", v7, v10);

    -[SRUserUtteranceViewController _setUserUtterance:](self, "_setUserUtterance:", v11);
    -[SRUserUtteranceViewController removeSpeechAlternatives](self, "removeSpeechAlternatives");
    objc_msgSend(v4, "setText:", v7);
    self->_newRequestSent = 1;
LABEL_6:

  }
  v12 = objc_alloc_init((Class)SAUIListItem);
  objc_msgSend(v12, "setSelectionText:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
  objc_msgSend(v13, "siriViewController:addSelectionResponse:", self, v12);

  v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v22 = 136315394;
    v23 = "-[SRUserUtteranceViewController editableTextViewTextDidFinishCorrecting:]";
    v24 = 2112;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s CorrectedText = %@", (uint8_t *)&v22, 0x16u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _correctionIdentifier](self, "_correctionIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController userSelectionResults:](self, "userSelectionResults:", v7));
  objc_msgSend(v15, "siriViewController:startCorrectedSpeechRequestWithText:correctionIdentifier:userSelectionResults:", self, v7, v16, v17);

LABEL_11:
  -[SRUserUtteranceViewController _hideEditableUtteranceView](self, "_hideEditableUtteranceView");

}

- (void)editableTextViewTextDidResignFirstResponder:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "siriViewControllerDidResignFirstResponder:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
    objc_msgSend(v6, "siriViewControllerDidResignFirstResponder:", self);

  }
}

- (void)restoreOriginalEditTextContents:(id)a3
{
  void *v4;
  SREditableTextView *v5;
  void *v6;
  SREditableTextView *editableUtteranceView;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allPhrases"));
  if (v4 && !self->_forceBestTextInterpretation)
  {
    editableUtteranceView = self->_editableUtteranceView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "correctionIdentifier"));
    -[SREditableTextView setDictationResult:withCorrectionIdentifier:](editableUtteranceView, "setDictationResult:withCorrectionIdentifier:", v4, v6);
  }
  else
  {
    v5 = self->_editableUtteranceView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bestTextInterpretation"));
    -[SREditableTextView setText:](v5, "setText:", v6);
  }

}

- (void)createViewArray
{
  NSMutableArray *v3;
  NSMutableArray *viewArray;
  SREditableTextView *editableUtteranceView;
  NSMutableArray *v6;
  SRSpeechAlternativeLabelCellView *v7;
  NSString *speechAlternativeListTitle;
  void *v9;
  SRSpeechAlternativeLabelCellView *v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  SRSpeechAlternativeCellView *v17;
  SRSpeechAlternativeCellView *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  viewArray = self->_viewArray;
  self->_viewArray = v3;

  editableUtteranceView = self->_editableUtteranceView;
  self->_editableUtteranceView = 0;

  -[SRUserUtteranceViewController createEditableUtteranceView](self, "createEditableUtteranceView");
  -[NSMutableArray addObject:](self->_viewArray, "addObject:", self->_editableUtteranceView);
  if (-[NSMutableArray count](self->_speechAlternativeList, "count"))
  {
    v6 = self->_viewArray;
    v7 = [SRSpeechAlternativeLabelCellView alloc];
    speechAlternativeListTitle = self->_speechAlternativeListTitle;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceFont](UIFont, "siriui_serverUtteranceFont"));
    v10 = -[SRSpeechAlternativeLabelCellView initWithTitle:font:](v7, "initWithTitle:font:", speechAlternativeListTitle, v9);
    -[NSMutableArray addObject:](v6, "addObject:", v10);

    self->_speechAlternativesStartIndex = (int64_t)-[NSMutableArray count](self->_viewArray, "count");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = self->_speechAlternativeDisplayList;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v15);
          v17 = [SRSpeechAlternativeCellView alloc];
          v18 = -[SRSpeechAlternativeCellView initWithTitle:](v17, "initWithTitle:", v16, (_QWORD)v19);
          -[NSMutableArray addObject:](self->_viewArray, "addObject:", v18);

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

  }
}

- (void)_createSpeechAlternativeViewsIfNecessary
{
  id v3;
  NSArray *v4;
  NSArray *speechAlternativeDisplayList;
  SiriUICollectionViewFlowLayout *v6;
  SiriUICollectionViewFlowLayout *speechAlternativeCollectionViewLayout;
  UICollectionView *v8;
  UICollectionView *speechAlternativeCollectionView;
  UICollectionView *v10;
  void *v11;
  UICollectionView *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;

  if (!self->_speechAlternativeDisplayList)
  {
    v3 = -[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:](self, "speechAlternativeHighlightListWithScore:", SiriUIShowSpeechAlternativeScore());
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(v3);
    speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
    self->_speechAlternativeDisplayList = v4;

  }
  if (!self->_speechAlternativeCollectionView)
  {
    v6 = (SiriUICollectionViewFlowLayout *)objc_alloc_init((Class)SiriUICollectionViewFlowLayout);
    speechAlternativeCollectionViewLayout = self->_speechAlternativeCollectionViewLayout;
    self->_speechAlternativeCollectionViewLayout = v6;

    -[SiriUICollectionViewFlowLayout setMinimumLineSpacing:](self->_speechAlternativeCollectionViewLayout, "setMinimumLineSpacing:", 0.0);
    -[SiriUICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_speechAlternativeCollectionViewLayout, "setMinimumInteritemSpacing:", 0.0);
    v8 = (UICollectionView *)objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", self->_speechAlternativeCollectionViewLayout, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    speechAlternativeCollectionView = self->_speechAlternativeCollectionView;
    self->_speechAlternativeCollectionView = v8;

    -[UICollectionView setDelegate:](self->_speechAlternativeCollectionView, "setDelegate:", self);
    -[UICollectionView setDataSource:](self->_speechAlternativeCollectionView, "setDataSource:", self);
    -[UICollectionView setScrollEnabled:](self->_speechAlternativeCollectionView, "setScrollEnabled:", 0);
    -[UICollectionView setShowsVerticalScrollIndicator:](self->_speechAlternativeCollectionView, "setShowsVerticalScrollIndicator:", 0);
    v10 = self->_speechAlternativeCollectionView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UICollectionView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = self->_speechAlternativeCollectionView;
    *(_QWORD *)&v14 = objc_opt_class(SiriUIContentCollectionViewCell, v13).n128_u64[0];
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIContentCollectionViewCell reuseIdentifier](SiriUIContentCollectionViewCell, "reuseIdentifier", v14));
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v12, "registerClass:forCellWithReuseIdentifier:", v16, v17);

    -[SRUserUtteranceViewController createViewArray](self, "createViewArray");
    v18 = -[UICollectionView reloadData](self->_speechAlternativeCollectionView, "reloadData");
    -[UICollectionView recursive_setSemanticContentAttribute:](self->_speechAlternativeCollectionView, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(v18, v19));
    -[SRUserUtteranceContainerView setTableView:](self->_containerView, "setTableView:", self->_speechAlternativeCollectionView);
  }
}

- (id)speechAlternativeHighlightListWithScore:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *speechAlternativeList;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  int v30;
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;

  v3 = a3;
  if ((SiriUIDisableAlternativesFeature(self, a2) & 1) != 0)
    return 0;
  speechAlternativeList = self->_speechAlternativeList;
  if (speechAlternativeList)
    -[NSMutableArray removeAllObjects](speechAlternativeList, "removeAllObjects");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = self->_speechAlternativeList;
  self->_speechAlternativeList = v7;

  -[NSMutableDictionary removeAllObjects](self->_alternativeInfoMap, "removeAllObjects");
  self->_showOnDeviceResults = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allRecognitionStringsAndScores"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textOfUtteranceAtIndex:", 0));

  if (!v12)
  {
    v27 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009E148(v27);
    v26 = 0;
    goto LABEL_22;
  }
  v13 = objc_alloc_init((Class)SRUIFAlternativeInfo);
  objc_msgSend(v13, "setOriginalRank:", &off_100128BF0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v12));
  v15 = AFUserUtteranceConfidenceAverageKey;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", AFUserUtteranceConfidenceAverageKey));
  objc_msgSend(v13, "setOriginalScore:", v16);

  objc_msgSend(v13, "setIsFromDevice:", &__kCFBooleanFalse);
  -[NSMutableDictionary setObject:forKey:](self->_alternativeInfoMap, "setObject:forKey:", v13, v12);
  v17 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v12));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v15));
    v30 = 136315650;
    v31 = "-[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]";
    v32 = 2112;
    v33 = v12;
    v34 = 2112;
    v35 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Original utterance:  %@ (%@)", (uint8_t *)&v30, 0x20u);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
  v22 = objc_opt_respondsToSelector(v21, "updatedUserUtteranceForSiriViewController:");

  if ((v22 & 1) == 0)
  {
    v24 = 0;
LABEL_18:
    v28 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136315138;
      v31 = "-[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s server results only", (uint8_t *)&v30, 0xCu);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _processUserUtterance:isCombined:displayedText:withScore:](self, "_processUserUtterance:isCombined:displayedText:withScore:", v29, 0, v12, v3));

    goto LABEL_21;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "updatedUserUtteranceForSiriViewController:", self));

  if (!v24 || (uint64_t)objc_msgSend(v24, "numberOfAlternativeUtterances") < 1)
    goto LABEL_18;
  v25 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136315138;
    v31 = "-[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]";
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s combined results", (uint8_t *)&v30, 0xCu);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _processUserUtterance:isCombined:displayedText:withScore:](self, "_processUserUtterance:isCombined:displayedText:withScore:", v24, 1, v12, v3));
LABEL_21:

LABEL_22:
  return v26;
}

- (id)_processUserUtterance:(id)a3 isCombined:(BOOL)a4 displayedText:(id)a5 withScore:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  SRUserUtteranceViewController *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  BOOL v35;
  BOOL v36;
  NSAttributedStringKey v37;
  void *v38;
  NSAttributedStringKey v39;
  void *v40;

  v10 = a3;
  v11 = a5;
  v39 = NSForegroundColorAttributeName;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
  v40 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));

  v37 = NSForegroundColorAttributeName;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
  v38 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allRecognitionStringsAndScores"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "keysSortedByValueUsingComparator:", &stru_100122F98));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100034A5C;
  v27[3] = &unk_100122FC0;
  v28 = v11;
  v29 = v16;
  v30 = self;
  v31 = v15;
  v35 = a4;
  v32 = v10;
  v33 = v13;
  v36 = a6;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v34 = v18;
  v19 = v13;
  v20 = v10;
  v21 = v15;
  v22 = v16;
  v23 = v11;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v27);
  v24 = v34;
  v25 = v18;

  return v25;
}

- (void)handleSelectRow:(int64_t)a3
{
  int64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;

  if (-[NSMutableArray count](self->_speechAlternativeList, "count"))
  {
    v5 = a3 - self->_speechAlternativesStartIndex;
    if (v5 >= 0 && v5 < (unint64_t)-[NSMutableArray count](self->_speechAlternativeList, "count"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_speechAlternativeList, "objectAtIndex:", v5));
      v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v16 = 136315394;
        v17 = "-[SRUserUtteranceViewController handleSelectRow:]";
        v18 = 2112;
        v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s alternativeString = %@", (uint8_t *)&v16, 0x16u);
      }
      v8 = objc_alloc((Class)AFUserUtterance);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "correctionIdentifier"));
      v11 = objc_msgSend(v8, "initWithString:correctionIdentifier:", v6, v10);

      -[SRUserUtteranceViewController _setUserUtterance:](self, "_setUserUtterance:", v11);
      -[SRUserUtteranceView setText:](self->_utteranceView, "setText:", v6);
      -[SREditableTextView setText:](self->_editableUtteranceView, "setText:", v6);
      self->_showSpeechAlternativeList = 0;
      -[SRUserUtteranceViewController removeSpeechAlternatives](self, "removeSpeechAlternatives");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
      objc_msgSend(v12, "siriViewControllerHeightDidChange:pinTopOfSnippet:", self, 1);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _correctionIdentifier](self, "_correctionIdentifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController userSelectionResults:](self, "userSelectionResults:", v6));
      objc_msgSend(v13, "siriViewController:startCorrectedSpeechRequestWithText:correctionIdentifier:userSelectionResults:", self, v6, v14, v15);

      self->_newRequestSent = 1;
      -[SRUserUtteranceViewController _hideEditableUtteranceView](self, "_hideEditableUtteranceView");

    }
  }
  else
  {
    -[SREditableTextView beginEditing](self->_editableUtteranceView, "beginEditing");
  }
}

- (id)userSelectionResults:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = objc_alloc_init((Class)AFUserUtteranceSelectionResults);
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_alternativeInfoMap, "objectForKey:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "originalScore"));
    objc_msgSend(v6, "setOriginalScore:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "originalRank"));
    objc_msgSend(v6, "setOriginalRank:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "isFromDevice"));
    v11 = objc_msgSend(v10, "BOOLValue");

    v12 = &SASStartCorrectedSpeechRequestUtteranceSourceCLIENTValue;
    if (!v11)
      v12 = &SASStartCorrectedSpeechRequestUtteranceSourceSERVERValue;
    objc_msgSend(v6, "setUtteranceSource:", *v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "combinedRank"));
    objc_msgSend(v6, "setCombinedRank:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "combinedScore"));
    objc_msgSend(v6, "setCombinedScore:", v14);

  }
  else
  {
    objc_msgSend(v5, "setUtteranceSource:", SASStartCorrectedSpeechRequestUtteranceSourceUSER_EDITEDValue);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController aceObject](self, "aceObject"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "refId"));
  objc_msgSend(v6, "setInteractionId:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_showOnDeviceResults));
  objc_msgSend(v6, "setOnDeviceUtterancesPresent:", v17);

  objc_msgSend(v6, "setSessionId:", self->_sessionId);
  objc_msgSend(v6, "setPreviousUtterance:", self->_preCorrectionText);
  v18 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "-[SRUserUtteranceViewController userSelectionResults:]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s AFUserUtteranceSelectionResults = %@", (uint8_t *)&v20, 0x16u);
  }

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (int64_t)-[NSMutableArray count](self->_viewArray, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double Width;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
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
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGRect v49;
  CGRect v50;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIContentCollectionViewCell reuseIdentifier](SiriUIContentCollectionViewCell, "reuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6));

  objc_msgSend(v9, "setHasChevron:", 0);
  v10 = objc_msgSend(v6, "item");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v9, "setBackgroundColor:", v11);

  if (v10)
  {
    objc_msgSend(v9, "setKeylineType:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyline"));
    objc_msgSend(v12, "setCustomLeftPadding:", 44.0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyline"));
    objc_msgSend(v13, "setCustomRightPadding:", 44.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyline"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.5, 0.3));
    objc_msgSend(v14, "setCustomBackgroundColor:", v15);

  }
  else
  {
    objc_msgSend(v9, "setKeylineType:", 0);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_viewArray, "objectAtIndex:", v10));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
  objc_msgSend(v9, "bounds");
  Width = CGRectGetWidth(v49);
  objc_msgSend(v9, "bounds");
  objc_msgSend(v17, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v50));

  objc_opt_class(SRSpeechAlternativeCellView, v19);
  if ((objc_opt_isKindOfClass(v16, v20) & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
    objc_msgSend(v22, "addSubview:", v16);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
    objc_msgSend(v23, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    objc_msgSend(v16, "edgeInsets");
    v33 = v25 + v32;
    v35 = v27 + v34;
    v37 = v29 - (v32 + v36);
    v39 = v31 - (v34 + v38);
LABEL_9:

    objc_msgSend(v16, "setFrame:", v33, v35, v37, v39);
    goto LABEL_10;
  }
  objc_opt_class(SREditableTextView, v21);
  if ((objc_opt_isKindOfClass(v16, v40) & 1) != 0
    || (objc_opt_class(SRSpeechAlternativeLabelCellView, v41), (objc_opt_isKindOfClass(v16, v42) & 1) != 0))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
    objc_msgSend(v43, "addSubview:", v16);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
    objc_msgSend(v23, "bounds");
    v33 = v44;
    v35 = v45;
    v37 = v46;
    v39 = v47;
    goto LABEL_9;
  }
LABEL_10:

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", v6, 1);
  v7 = objc_msgSend(v6, "row");

  -[SRUserUtteranceViewController handleSelectRow:](self, "handleSelectRow:", v7);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double width;
  CGFloat height;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
  objc_msgSend(v7, "siriViewControllerExpectedWidth:", self);
  width = v8;

  height = CGSizeZero.height;
  v11 = objc_msgSend(v6, "item");

  if (v11 >= -[NSMutableArray count](self->_viewArray, "count"))
  {
    width = CGSizeZero.width;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_viewArray, "objectAtIndex:", v11));
    objc_opt_class(SRSpeechAlternativeCellView, v13);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0
      || (objc_opt_class(SREditableTextView, v15), (objc_opt_isKindOfClass(v12, v16) & 1) != 0)
      || (objc_opt_class(SRSpeechAlternativeLabelCellView, v17),
          (objc_opt_isKindOfClass(v12, v18) & 1) != 0))
    {
      objc_msgSend(v12, "sizeThatFits:", width, 1.79769313e308);
      height = v19;
    }

  }
  v20 = width;
  v21 = height;
  result.height = v21;
  result.width = v20;
  return result;
}

- (AFUserUtterance)_userUtterance
{
  return self->_userUtterance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_storeStrong((id *)&self->_changeUtteranceCommand, 0);
  objc_storeStrong((id *)&self->_preCorrectionText, 0);
  objc_storeStrong((id *)&self->_originalUtteranceText, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_alternativeInfoMap, 0);
  objc_storeStrong((id *)&self->_speechAlternativeListTitle, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_speechAlternativeCollectionViewLayout, 0);
  objc_storeStrong((id *)&self->_speechAlternativeCollectionView, 0);
  objc_storeStrong((id *)&self->_editableUtteranceView, 0);
  objc_storeStrong((id *)&self->_viewArray, 0);
  objc_storeStrong((id *)&self->_speechAlternativeList, 0);
  objc_storeStrong((id *)&self->_speechAlternativeDisplayList, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_utteranceView, 0);
}

@end
