@implementation SRSuggestionsViewController

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)SiriUISuggestionsView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v4, "setDelegate:", self);
  -[SRSuggestionsViewController setView:](self, "setView:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v3, "setHidden:", 1);

}

- (id)_initialHeaderText
{
  double v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  *(_QWORD *)&v2 = objc_opt_class(self, a2).n128_u64[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v3, v2));
  v5 = objc_alloc((Class)SiriUISuggestionsHeaderText);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_INITIAL_QUERY_REGULAR"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_INITIAL_QUERY_COMPACT"), 0));
  v8 = objc_msgSend(v5, "initWithRegularString:compactString:", v6, v7);

  return v8;
}

- (id)_nudgeHeaderText
{
  double v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  *(_QWORD *)&v2 = objc_opt_class(self, a2).n128_u64[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v3, v2));
  v5 = objc_alloc((Class)SiriUISuggestionsHeaderText);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_LISTENING_NUDGE_REGULAR"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_LISTENING_NUDGE_COMPACT"), 0));
  v8 = objc_msgSend(v5, "initWithRegularString:compactString:", v6, v7);

  return v8;
}

- (void)showUnavailable
{
  double v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v4, v3));
  v5 = objc_alloc((Class)SiriUISuggestionsHeaderText);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_NOT_AVAILABLE_TITLE"), 0));
  v7 = objc_msgSend(v5, "initWithRegularString:compactString:", v6, 0);

  v8 = objc_alloc((Class)SiriUISuggestionsHeaderText);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_NO_NETWORK_SUBTITLE"), 0));
  v10 = objc_msgSend(v8, "initWithRegularString:compactString:", v9, 0);

  objc_msgSend(v7, "setTextAlignment:", 1);
  objc_msgSend(v10, "setTextAlignment:", 1);
  -[SRSuggestionsViewController _showHeaderText:subheaderText:largeSubheaderText:](self, "_showHeaderText:subheaderText:largeSubheaderText:", v7, v10, 0);

}

- (void)showGreeting
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController _initialHeaderText](self, "_initialHeaderText"));
  -[SRSuggestionsViewController _showHeaderText:subheaderText:largeSubheaderText:](self, "_showHeaderText:subheaderText:largeSubheaderText:", v3, 0, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v4, "clearCurrentSuggestions");

  objc_msgSend(UIApp, "finishedIPTest:", SUICPPTTestNameSiriBringupToInitialQuery);
}

- (void)showUserNudge
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController _nudgeHeaderText](self, "_nudgeHeaderText"));
  -[SRSuggestionsViewController _showHeaderText:subheaderText:largeSubheaderText:](self, "_showHeaderText:subheaderText:largeSubheaderText:", v3, 0, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v4, "setGuideHidden:", 1);

}

- (BOOL)isShowingUserNudge
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "headerText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "regularString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController _nudgeHeaderText](self, "_nudgeHeaderText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "regularString"));
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  return v8;
}

- (void)showEmptyView
{
  id v3;

  -[SRSuggestionsViewController _showHeaderText:subheaderText:largeSubheaderText:](self, "_showHeaderText:subheaderText:largeSubheaderText:", 0, 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v3, "setGuideHidden:", 1);

}

- (void)_showHeaderText:(id)a3 subheaderText:(id)a4 largeSubheaderText:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v11, "setHidden:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v12, "setSubheaderText:", v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v13, "setLargeSubheaderText:", v8);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v14, "setHeaderText:", v10);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v15, "setGuideHidden:animated:", 1, 1);

}

- (void)showAcousticIDSpinner
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v2, "showAcousticIDSpinner");

}

- (void)hideAcousticIDSpinner
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v2, "hideAcousticIDSpinner");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSuggestionsViewController;
  -[SRSuggestionsViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v4, "setOrientation:", objc_msgSend(UIApp, "statusBarOrientation"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v5, "setNeedsLayout");

}

- (BOOL)isShowingGuide
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  v3 = objc_msgSend(v2, "isGuideHidden") ^ 1;

  return v3;
}

- (void)animateOut
{
  id v2;
  _QWORD v3[4];
  id v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001E184;
  v3[3] = &unk_1001225C0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  v2 = v4;
  objc_msgSend(v2, "animateOutWithCompletion:", v3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSuggestionsViewController;
  -[SRSuggestionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v5, "setOrientation:", objc_msgSend(UIApp, "statusBarOrientation"));

}

- (void)_createGuideController
{
  id v3;
  void *v4;
  AFConversation *v5;
  AFConversation *conversation;
  id v7;
  id v8;

  v8 = objc_msgSend(objc_alloc((Class)AFUISiriLanguage), "initWithDelegate:", 0);
  v3 = objc_alloc((Class)AFConversation);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "spokenLanguageCode"));
  v5 = (AFConversation *)objc_msgSend(v3, "initWithLanguageCode:", v4);
  conversation = self->_conversation;
  self->_conversation = v5;

  -[AFConversation setDelegate:](self->_conversation, "setDelegate:", self);
  v7 = objc_alloc_init((Class)SAUIShowHelp);
  -[AFConversation addItemsForShowHelpCommand:](self->_conversation, "addItemsForShowHelpCommand:", v7);

}

- (void)didShowSuggestionsForSuggestionsView:(id)a3
{
  SRSuggestionsViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "suggestionsViewDidShowSuggestions:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "suggestionsViewDidShowSuggestions:", self);

  }
}

- (double)statusBarHeightForSuggestionsView:(id)a3
{
  void *v4;
  double MaxY;
  CGRect v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "statusBarFrameForSuggestionsViewController:", self);
  MaxY = CGRectGetMaxY(v7);

  return MaxY;
}

- (double)statusViewHeightForSuggestionsView:(id)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "statusViewHeightForSuggestionsViewController:", self);
  v6 = v5;

  return v6;
}

- (void)suggestionsView:(id)a3 didHideVibrantView:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "suggestionsViewController:didHideVibrantView:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "suggestionsViewController:didHideVibrantView:", self, v8);

  }
}

- (double)contentWidthForSuggestionsView:(id)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "contentWidthForSuggestionsViewController:", self);
  v6 = v5;

  return v6;
}

- (BOOL)suggestionsViewIsInTextInputMode:(id)a3
{
  SRSuggestionsViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  unsigned __int8 v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "inTextInputModeForSuggestionsViewController:");

  if ((v6 & 1) == 0)
    return 0;
  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_msgSend(v7, "inTextInputModeForSuggestionsViewController:", self);

  return v8;
}

- (SRSuggestionsViewControllerDelegate)delegate
{
  return (SRSuggestionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
