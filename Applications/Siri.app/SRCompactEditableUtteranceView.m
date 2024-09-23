@implementation SRCompactEditableUtteranceView

- (SRCompactEditableUtteranceView)initWithFrame:(CGRect)a3 userUtterance:(id)a4 delegate:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  SRCompactEditableUtteranceView *v14;
  SRCompactEditableUtteranceView *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SRCompactEditableUtteranceView;
  v14 = -[SRCompactEditableUtteranceView initWithFrame:](&v17, "initWithFrame:", x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_userUtterance, a4);
    -[SRCompactEditableUtteranceView _setupTextView](v15, "_setupTextView");
    -[SRCompactEditableUtteranceView _setupConstraints](v15, "_setupConstraints");
    -[SRCompactEditableUtteranceView _setDelegate:](v15, "_setDelegate:", v13);
  }

  return v15;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  NSLayoutConstraint *textViewTopAnchor;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SRCompactEditableUtteranceView;
  -[SRCompactEditableUtteranceView layoutSubviews](&v12, "layoutSubviews");
  -[SRCompactEditableUtteranceView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  objc_msgSend(v7, "sizeThatFits:", v4, v6);
  v9 = v8;

  -[NSLayoutConstraint setConstant:](self->_textViewHeightAnchor, "setConstant:", v9);
  textViewTopAnchor = self->_textViewTopAnchor;
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  -[NSLayoutConstraint setConstant:](textViewTopAnchor, "setConstant:", v11 + 24.0);
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SRCompactEditableUtteranceView;
  -[SRCompactEditableUtteranceView safeAreaInsetsDidChange](&v3, "safeAreaInsetsDidChange");
  -[SRCompactEditableUtteranceView setNeedsLayout](self, "setNeedsLayout");
}

- (void)beginEditing
{
  -[SREditableTextView beginEditing](self->_textView, "beginEditing");
}

- (void)setAuxiliaryView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SRCompactEditableUtteranceView addSubview:](self, "addSubview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView leadingAnchor](self, "leadingAnchor"));
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, v7));
  objc_msgSend(v8, "setActive:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView trailingAnchor](self, "trailingAnchor"));
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, v11));
  objc_msgSend(v12, "setActive:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 0.0));
  objc_msgSend(v16, "setActive:", 1);

  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView bottomAnchor](self, "bottomAnchor"));
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v17, v18));
  objc_msgSend(v19, "setActive:", 1);

}

- (void)_setupTextView
{
  SREditableTextView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;

  v3 = -[SREditableTextView initWithFrame:presentationStyle:]([SREditableTextView alloc], "initWithFrame:presentationStyle:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[SRCompactEditableUtteranceView _setTextView:](self, "_setTextView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  objc_msgSend(v5, "setDelegate:", self);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[AFUserUtterance bestTextInterpretation](self->_userUtterance, "bestTextInterpretation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  objc_msgSend(v6, "setText:", v13);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFUserUtterance allPhrases](self->_userUtterance, "allPhrases"));
  v8 = objc_claimAutoreleasedReturnValue(-[AFUserUtterance correctionIdentifier](self->_userUtterance, "correctionIdentifier"));
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
    objc_msgSend(v11, "setDictationResult:withCorrectionIdentifier:", v7, v9);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  -[SRCompactEditableUtteranceView addSubview:](self, "addSubview:", v12);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *textViewTopAnchor;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *textViewHeightAnchor;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView leadingAnchor](self, "leadingAnchor"));
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, v6));
  objc_msgSend(v7, "setActive:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView trailingAnchor](self, "trailingAnchor"));
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, v11));
  objc_msgSend(v12, "setActive:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView topAnchor](self, "topAnchor"));
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15));
  textViewTopAnchor = self->_textViewTopAnchor;
  self->_textViewTopAnchor = v16;

  -[NSLayoutConstraint setActive:](self->_textViewTopAnchor, "setActive:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "heightAnchor"));
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 0.0));
  textViewHeightAnchor = self->_textViewHeightAnchor;
  self->_textViewHeightAnchor = v20;

  -[NSLayoutConstraint setActive:](self->_textViewHeightAnchor, "setActive:", 1);
}

- (void)editableTextViewRequestKeyboardForTapToEditWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SRCompactEditableUtteranceView editableTextViewRequestKeyboardForTapToEditWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: requesting keyboard for tap to edit", (uint8_t *)&v7, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _delegate](self, "_delegate"));
  objc_msgSend(v6, "editableUtteranceView:requestsKeyboardWithCompletion:", self, v4);

}

- (void)editableTextViewTextDidFinishCorrecting:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SRCompactEditableUtteranceView editableTextViewTextDidFinishCorrecting:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: #tap2edit: correction finished with editedText: %@", (uint8_t *)&v7, 0x16u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _delegate](self, "_delegate"));
  objc_msgSend(v6, "editableUtteranceView:didFinishEditingWithText:", self, v4);

}

- (void)editableTextViewTextDidResignFirstResponder:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SRCompactEditableUtteranceView editableTextViewTextDidResignFirstResponder:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #compact: did resign first responder", (uint8_t *)&v6, 0xCu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _delegate](self, "_delegate"));
  objc_msgSend(v5, "didResignFirstResponderFromUtteranceView:", self);

}

- (BOOL)editableTextViewTextShouldPreventCorrection:(id)a3
{
  return 0;
}

- (void)editableTextViewTextWillBeginCorrecting:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _delegate](self, "_delegate", a3));
  objc_msgSend(v4, "willBeginEditingFromUtteranceView:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics"));
  objc_msgSend(v5, "logEventWithType:context:", 1424, 0);

}

- (SREditableTextView)_textView
{
  return self->_textView;
}

- (void)_setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (SRCompactEditableUtteranceViewDelegate)_delegate
{
  return (SRCompactEditableUtteranceViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_storeStrong((id *)&self->_textViewTopAnchor, 0);
  objc_storeStrong((id *)&self->_textViewHeightAnchor, 0);
}

@end
