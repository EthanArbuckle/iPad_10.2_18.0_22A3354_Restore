@implementation SRCompactEditableUtteranceViewController

- (SRCompactEditableUtteranceViewController)initWithUserUtterance:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  SRPreferences *v11;
  SRCompactEditableUtteranceViewController *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(SRPreferences);
  v12 = -[SRCompactEditableUtteranceViewController initWithUserUtterance:delegate:dataSource:preferences:](self, "initWithUserUtterance:delegate:dataSource:preferences:", v10, v9, v8, v11);

  return v12;
}

- (SRCompactEditableUtteranceViewController)initWithUserUtterance:(id)a3 delegate:(id)a4 dataSource:(id)a5 preferences:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SRCompactEditableUtteranceViewController *v15;
  SRCompactEditableUtteranceViewController *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SRCompactEditableUtteranceViewController;
  v15 = -[SRCompactEditableUtteranceViewController init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_userUtterance, a3);
    objc_storeStrong((id *)&v16->_dataSource, a5);
    -[SRCompactEditableUtteranceViewController _setDelegate:](v16, "_setDelegate:", v12);
    -[SRCompactEditableUtteranceViewController _setupAlternativesTableView](v16, "_setupAlternativesTableView");
    objc_storeStrong((id *)&v16->_userPreferences, a6);
    if (-[SRPreferences showTapToEditTipCount](v16->_userPreferences, "showTapToEditTipCount") <= 1)
      v16->_shouldShowTip = 1;
  }

  return v16;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SRCompactEditableUtteranceViewController;
  -[SRCompactEditableUtteranceViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[SRCompactEditableUtteranceView beginEditing](self->_editableUtteranceView, "beginEditing");
}

- (void)loadView
{
  SRCompactEditableUtteranceView *v3;
  double y;
  double width;
  double height;
  SRCompactEditableUtteranceView *v7;
  SRCompactEditableUtteranceView *editableUtteranceView;
  uint64_t v9;
  uint64_t v10;
  SRCompactEditableUtteranceView *v11;
  void *v12;
  SRCompactLinkTappableTextView *v13;
  UITextView *textViewForFooterText;
  UITextView *v15;
  void *v16;
  UITextView *v17;
  void *v18;
  SRCompactEditableUtteranceView *v19;
  id v20;

  v3 = [SRCompactEditableUtteranceView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[SRCompactEditableUtteranceView initWithFrame:userUtterance:delegate:](v3, "initWithFrame:userUtterance:delegate:", self->_userUtterance, self, CGRectZero.origin.x, y, width, height);
  editableUtteranceView = self->_editableUtteranceView;
  self->_editableUtteranceView = v7;

  -[SRCompactEditableUtteranceView recursive_setSemanticContentAttribute:](self->_editableUtteranceView, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(v9, v10));
  v11 = self->_editableUtteranceView;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[SRCompactEditableUtteranceView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[SRCompactEditableUtteranceViewController setView:](self, "setView:", self->_editableUtteranceView);
  v13 = -[SRCompactLinkTappableTextView initWithFrame:]([SRCompactLinkTappableTextView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  textViewForFooterText = self->_textViewForFooterText;
  self->_textViewForFooterText = &v13->super;

  v15 = self->_textViewForFooterText;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _attributedStringForTip](self, "_attributedStringForTip"));
  -[UITextView setAttributedText:](v15, "setAttributedText:", v16);

  v17 = self->_textViewForFooterText;
  +[UIFont smallSystemFontSize](UIFont, "smallSystemFontSize");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  -[UITextView setFont:](v17, "setFont:", v18);

  -[UITextView setEditable:](self->_textViewForFooterText, "setEditable:", 0);
  -[UITextView setScrollEnabled:](self->_textViewForFooterText, "setScrollEnabled:", 0);
  -[UITextView setTextContainerInset:](self->_textViewForFooterText, "setTextContainerInset:", 7.5, 15.0, 7.5, 15.0);
  -[UITextView setDelegate:](self->_textViewForFooterText, "setDelegate:", self);
  if (-[SRCompactEditableUtteranceViewController _shouldShowAlternativesTableView](self, "_shouldShowAlternativesTableView"))
  {
    v19 = self->_editableUtteranceView;
    v20 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    -[SRCompactEditableUtteranceView setAuxiliaryView:](v19, "setAuxiliaryView:", v20);

  }
  else if (-[SRCompactEditableUtteranceViewController _shouldShowTip](self, "_shouldShowTip"))
  {
    -[SRCompactEditableUtteranceView setAuxiliaryView:](self->_editableUtteranceView, "setAuxiliaryView:", self->_textViewForFooterText);
    -[SRCompactEditableUtteranceViewController _didShowTip](self, "_didShowTip");
  }
}

- (void)editableUtteranceView:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _delegate](self, "_delegate"));
  objc_msgSend(v6, "editableUtteranceViewController:requestsKeyboardWithCompletion:", self, v5);

}

- (void)willBeginEditingFromUtteranceView:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _delegate](self, "_delegate", a3));
  objc_msgSend(v4, "willBeginEditingFromUtteranceViewController:", self);

}

- (void)didResignFirstResponderFromUtteranceView:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _delegate](self, "_delegate", a3));
  objc_msgSend(v4, "didResignFirstResponderFromUtteranceViewController:", self);

}

- (void)editableUtteranceView:(id)a3 didFinishEditingWithText:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _delegate](self, "_delegate"));
  objc_msgSend(v6, "editableUtteranceViewController:didFinishEditingWithText:", self, v5);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  result = (int64_t)-[SRCompactEditableUtteranceViewControllerDataSource numberOfAlternativeUtterances](self->_dataSource, "numberOfAlternativeUtterances", a3, a4);
  if (result >= 3)
    return 3;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  SRCompactEditableUtteranceViewControllerDataSource *dataSource;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = off_10014E970;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v8, "setBackgroundColor:", v9);

  dataSource = self->_dataSource;
  v11 = objc_msgSend(v7, "row");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewControllerDataSource attributedStringAtIndex:](dataSource, "attributedStringAtIndex:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
  objc_msgSend(v13, "setAttributedText:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  objc_msgSend(v14, "setFont:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
  objc_msgSend(v16, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(v16, v17));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
  objc_msgSend(v18, "setNumberOfLines:", 0);

  objc_msgSend(v8, "setSelectionStyle:", 0);
  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  *(_QWORD *)&v4 = objc_opt_class(self, a2).n128_u64[0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v5, v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "siriUILocalizedStringForKey:table:", CFSTR("TITLE_FOR_SPEECH_ALTERNATIVE_LIST"), 0));
  v8 = objc_alloc((Class)NSLocale);
  v9 = AFUIGetLanguageCode();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v8, "initWithLocaleIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uppercaseStringWithLocale:", v11));

  return v12;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_opt_class(UITableViewHeaderFooterView, v5);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    objc_msgSend(v7, "setTextColor:", v8);

  }
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v5;
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

  if (-[SRCompactEditableUtteranceViewController _shouldShowTip](self, "_shouldShowTip", a3, a4))
  {
    -[SRCompactEditableUtteranceViewController _didShowTip](self, "_didShowTip");
    v5 = objc_msgSend(objc_alloc((Class)UITableViewHeaderFooterView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textViewForFooterText, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", self->_textViewForFooterText);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView topAnchor](self->_textViewForFooterText, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
    objc_msgSend(v8, "setActive:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView bottomAnchor](self->_textViewForFooterText, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    objc_msgSend(v11, "setActive:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView leadingAnchor](self->_textViewForFooterText, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    objc_msgSend(v14, "setActive:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView trailingAnchor](self->_textViewForFooterText, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    objc_msgSend(v17, "setActive:", 1);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5;
  double v6;
  double v7;
  double v8;

  v5 = a3;
  v6 = 0.0;
  if (-[SRCompactEditableUtteranceViewController _shouldShowTip](self, "_shouldShowTip"))
  {
    objc_msgSend(v5, "bounds");
    -[UITextView sizeThatFits:](self->_textViewForFooterText, "sizeThatFits:", v7, 1.79769313e308);
    v6 = v8;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _delegate](self, "_delegate"));
  v6 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "editableUtteranceViewController:alternativeSelectedAtIndex:", self, v6);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  void *v8;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _delegate](self, "_delegate"));
  objc_msgSend(v8, "editableUtteranceViewController:openURL:", self, v7);

  return 0;
}

- (void)_setupAlternativesTableView
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;

  if (-[SRCompactEditableUtteranceViewController _shouldShowAlternativesTableView](self, "_shouldShowAlternativesTableView"))
  {
    v3 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[SRCompactEditableUtteranceViewController _setAlternativesTableView:](self, "_setAlternativesTableView:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    *(_QWORD *)&v6 = objc_opt_class(UITableViewCell, v5).n128_u64[0];
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v7, off_10014E970, v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    objc_msgSend(v8, "setScrollEnabled:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    objc_msgSend(v9, "setDelegate:", self);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    objc_msgSend(v10, "setDataSource:", self);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v11, "setBackgroundColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    objc_msgSend(v13, "setSeparatorColor:", v14);

    v19 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    *(_QWORD *)&v16 = objc_opt_class(UITableViewCell, v15).n128_u64[0];
    objc_msgSend(v19, "registerClass:forCellReuseIdentifier:", v17, off_10014E970, v16);

  }
  else
  {
    v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[SRCompactEditableUtteranceViewController _setupAlternativesTableView]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s #compact: no alternative utterances to display", buf, 0xCu);
    }
  }
}

- (BOOL)_shouldShowAlternativesTableView
{
  return (uint64_t)-[SRCompactEditableUtteranceViewControllerDataSource numberOfAlternativeUtterances](self->_dataSource, "numberOfAlternativeUtterances") > 0;
}

- (id)_attributedStringForTip
{
  double v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;

  *(_QWORD *)&v2 = objc_opt_class(self, a2).n128_u64[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v3, v2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "siriUILocalizedStringForKey:table:", CFSTR("TEXT_FOR_SPEECH_ALTERNATIVE_LIST_TIP"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "siriUILocalizedStringForKey:table:", CFSTR("TEXT_FOR_SPEECH_ALTERNATIVE_LIST_TIP_LINK"), 0));
  v7 = objc_msgSend(v5, "rangeOfString:options:", v6, 4);
  v9 = v8;
  v10 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v5);
  v11 = objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "addAttribute:value:range:", NSLinkAttributeName, CFSTR("prefs:root=SIRI%23-64&path=VOICE_FEEDBACK_ID%23-64"), v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v11, "addAttribute:value:range:", NSForegroundColorAttributeName, v12, 0, objc_msgSend(v11, "length"));

  return v11;
}

- (void)_didShowTip
{
  if (!-[SRCompactEditableUtteranceViewController _didUpdateShowTipCount](self, "_didUpdateShowTipCount"))
  {
    -[SRCompactEditableUtteranceViewController _setDidUpdateShowTipCount:](self, "_setDidUpdateShowTipCount:", 1);
    -[SRPreferences setShowTapToEditTipCount:](self->_userPreferences, "setShowTapToEditTipCount:", (char *)-[SRPreferences showTapToEditTipCount](self->_userPreferences, "showTapToEditTipCount") + 1);
  }
}

- (SRCompactEditableUtteranceViewControllerDelegate)_delegate
{
  return (SRCompactEditableUtteranceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITableView)_alternativesTableView
{
  return self->_alternativesTableView;
}

- (void)_setAlternativesTableView:(id)a3
{
  objc_storeStrong((id *)&self->_alternativesTableView, a3);
}

- (BOOL)_shouldShowTip
{
  return self->_shouldShowTip;
}

- (void)_setShouldShowTip:(BOOL)a3
{
  self->_shouldShowTip = a3;
}

- (BOOL)_didUpdateShowTipCount
{
  return self->_didUpdateShowTipCount;
}

- (void)_setDidUpdateShowTipCount:(BOOL)a3
{
  self->_didUpdateShowTipCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativesTableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textViewForFooterText, 0);
  objc_storeStrong((id *)&self->_userPreferences, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_alternativeUtterances, 0);
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_storeStrong((id *)&self->_editableUtteranceView, 0);
}

@end
