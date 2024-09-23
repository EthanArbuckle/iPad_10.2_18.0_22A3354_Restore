@implementation SRCompactTextRequestView

- (SRCompactTextRequestView)initWithFrame:(CGRect)a3
{
  SRCompactTextRequestView *v3;
  uint64_t v4;
  UIButton *cancelButton;
  UIButton *v6;
  id v7;
  void *v8;
  void *v9;
  SRCompactTextRequestField *v10;
  SRCompactTextRequestField *textField;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  __CFString *v17;
  SRCompactTextRequestField *v18;
  id v19;
  void *v20;
  UIGestureRecognizer *v21;
  UIGestureRecognizer *beginEditingGestureRecognizer;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  SRCompactTextRequestView *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)SRCompactTextRequestView;
  v3 = -[SRCompactTextRequestView initWithFrame:](&v31, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (UIButton *)v4;

    v6 = v3->_cancelButton;
    v7 = sub_10003A850(CFSTR("TYPE_TO_SIRI_CANCEL_BUTTON_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[UIButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    -[UIButton sizeToFit](v3->_cancelButton, "sizeToFit");
    -[UIButton setAlpha:](v3->_cancelButton, "setAlpha:", 0.0);
    -[UIButton addTarget:action:forControlEvents:](v3->_cancelButton, "addTarget:action:forControlEvents:", v3, "_cancelButtonWasTapped:", 64);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, "_accessibilityBoldStatusDidChange:", UIAccessibilityBoldTextStatusDidChangeNotification, 0);

    -[SRCompactTextRequestView addSubview:](v3, "addSubview:", v3->_cancelButton);
    -[SRCompactTextRequestView _updateCancelButtonFont](v3, "_updateCancelButtonFont");
    v10 = objc_alloc_init(SRCompactTextRequestField);
    textField = v3->_textField;
    v3->_textField = v10;

    -[SRCompactTextRequestField setInlinePredictionType:](v3->_textField, "setInlinePredictionType:", 2);
    -[SRCompactTextRequestField setDelegate:](v3->_textField, "setDelegate:", v3);
    v12 = -[SRCompactTextRequestField setButtonDelegate:](v3->_textField, "setButtonDelegate:", v3);
    if (AFDeviceSupportsSystemAssistantExperience(v12, v13))
      v14 = 13;
    else
      v14 = 1;
    v15 = -[SRCompactTextRequestField setKeyboardAppearance:](v3->_textField, "setKeyboardAppearance:", v14);
    if (AFDeviceSupportsSystemAssistantExperience(v15, v16))
      v17 = CFSTR("TYPE_TO_SIRI_TEXT_PLACEHOLDER_SAE");
    else
      v17 = CFSTR("TYPE_TO_SIRI_TEXT_PLACEHOLDER");
    v18 = v3->_textField;
    v19 = sub_10003A850(v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[SRCompactTextRequestField setPlaceholder:](v18, "setPlaceholder:", v20);

    -[SRCompactTextRequestView addSubview:](v3, "addSubview:", v3->_textField);
    v21 = (UIGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v3, "_beginEditingGestureWasRecognized:");
    beginEditingGestureRecognizer = v3->_beginEditingGestureRecognizer;
    v3->_beginEditingGestureRecognizer = v21;

    -[UIGestureRecognizer setDelegate:](v3->_beginEditingGestureRecognizer, "setDelegate:", v3);
    v23 = -[SRCompactTextRequestField addGestureRecognizer:](v3->_textField, "addGestureRecognizer:", v3->_beginEditingGestureRecognizer);
    if (AFDeviceSupportsSystemAssistantExperience(v23, v24))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField inputAssistantItem](v3->_textField, "inputAssistantItem"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("siri")));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000630BC;
      v29[3] = &unk_100123F28;
      v30 = v3;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("siri"), v26, 0, v29));
      objc_msgSend(v25, "_setDictationReplacementAction:", v27);

    }
  }
  return v3;
}

- (void)textFieldDidChangeSelection:(id)a3
{
  SRCompactTextRequestViewDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));

  objc_msgSend(WeakRetained, "textRequestView:didChangeTextFieldText:", self, v6);
}

- (void)_beginEditing
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView delegate](self, "delegate"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000631E4;
  v4[3] = &unk_100123C00;
  v4[4] = self;
  objc_msgSend(v3, "textRequestView:requestsKeyboardWithCompletion:", self, v4);

}

- (void)_beginEditingGestureWasRecognized:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)3)
    -[SRCompactTextRequestView _beginEditing](self, "_beginEditing");
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return 1;
}

- (void)setAllowsCancellation:(BOOL)a3
{
  self->_allowsCancellation = a3 & ~AFDeviceSupportsSystemAssistantExperience(self, a2);
  -[SRCompactTextRequestView _setShowingCancelButton:](self, "_setShowingCancelButton:", -[SRCompactTextRequestView _shouldShowCancelButton](self, "_shouldShowCancelButton"));
}

- (BOOL)_shouldShowCancelButton
{
  _BOOL4 v3;

  v3 = -[SRCompactTextRequestView allowsCancellation](self, "allowsCancellation");
  if (v3)
    LOBYTE(v3) = -[SRCompactTextRequestView isFirstResponder](self, "isFirstResponder");
  return v3;
}

- (void)_setShowingCancelButton:(BOOL)a3
{
  -[SRCompactTextRequestView _setShowingCancelButton:animated:](self, "_setShowingCancelButton:animated:", a3, 0);
}

- (void)_setShowingCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v7;
  _QWORD *v8;
  void *v9;
  BOOL v10;
  _QWORD v11[5];

  if (self->_showingCancelButton != a3)
  {
    v4 = a4;
    v7 = +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock");
    self->_showingCancelButton = a3;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000633BC;
    v11[3] = &unk_1001225C0;
    v11[4] = self;
    v8 = objc_retainBlock(v11);
    v9 = v8;
    if (v7)
      v10 = 1;
    else
      v10 = !v4;
    if (v10)
      ((void (*)(_QWORD *))v8[2])(v8);
    else
      +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v8, 0);

  }
}

- (void)_cancelButtonWasTapped:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _textField](self, "_textField", a3));
  objc_msgSend(v4, "setText:", &stru_100125588);

  -[SRCompactTextRequestView resignFirstResponder](self, "resignFirstResponder");
}

- (void)_updateCancelButtonFont
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  v5 = sub_10006A898(v4, UIContentSizeCategoryExtraSmall, UIContentSizeCategoryAccessibilityExtraExtraLarge);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v10));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _cancelButton](self, "_cancelButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "titleLabel"));
  objc_msgSend(v9, "setFont:", v7);

  objc_msgSend(v8, "sizeToFit");
}

- (double)_preferredHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _textField](self, "_textField"));
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;

  return v4;
}

- (void)_accessibilityBoldStatusDidChange:(id)a3
{
  -[SRCompactTextRequestView _updateCancelButtonFont](self, "_updateCancelButtonFont", a3);
  -[SRCompactTextRequestView setNeedsLayout](self, "setNeedsLayout");
  -[SRCompactTextRequestView layoutIfNeeded](self, "layoutIfNeeded");
}

- (BOOL)_laysOutContentRightToLeft
{
  return -[SRCompactTextRequestView semanticContentAttribute](self, "semanticContentAttribute") == (id)4;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _textField](self, "_textField"));
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;

  -[SRCompactTextRequestView _preferredHeight](self, "_preferredHeight");
  v7 = v6;
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _textField](self, "_textField"));
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;

  -[SRCompactTextRequestView _preferredHeight](self, "_preferredHeight");
  v10 = v9;
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double left;
  double bottom;
  double right;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MidY;
  unsigned int v20;
  unsigned int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __n128 v26;
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
  double v40;
  double rect;
  double y;
  objc_super v43;
  CGRect v44;

  v43.receiver = self;
  v43.super_class = (Class)SRCompactTextRequestView;
  -[SRCompactTextRequestView layoutSubviews](&v43, "layoutSubviews");
  -[SRCompactTextRequestView bounds](self, "bounds");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _textField](self, "_textField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _cancelButton](self, "_cancelButton"));
  -[SRCompactTextRequestView safeAreaInsets](self, "safeAreaInsets");
  UIEdgeInsetsAdd(15);
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = objc_msgSend(v4, "frame");
  v7 = v6;
  y = CGPointZero.y;
  v39 = UIRectCenteredIntegralRect(v5);
  v40 = v8;
  rect = v9;
  v38 = v10;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v37 = v7;
  if (-[SRCompactTextRequestView _isShowingCancelButton](self, "_isShowingCancelButton"))
  {
    if (-[SRCompactTextRequestView _laysOutContentRightToLeft](self, "_laysOutContentRightToLeft"))
      left = v7 + 12.0 + left;
    else
      right = v7 + 12.0 + right;
  }
  UIRectGetCenter(objc_msgSend(v3, "setBounds:", CGPointZero.x, y, rect - (left + right), v38 - (UIEdgeInsetsZero.top + bottom)), v39 + left, UIEdgeInsetsZero.top + v40, rect - (left + right), v38 - v14);
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(v4, "frame");
  v16 = v15;
  v18 = v17;
  v44.origin.x = v39;
  v44.origin.y = v40;
  v44.size.width = rect;
  v44.size.height = v38;
  MidY = CGRectGetMidY(v44);
  v20 = -[SRCompactTextRequestView _isShowingCancelButton](self, "_isShowingCancelButton");
  v21 = -[SRCompactTextRequestView _laysOutContentRightToLeft](self, "_laysOutContentRightToLeft");
  if (v20)
  {
    v22 = v39;
    v23 = v40;
    v24 = rect;
    v25 = v38;
    if (v21)
    {
      v26.n128_f64[0] = CGRectGetMinX(*(CGRect *)&v22);
      v27 = -4.0;
    }
    else
    {
      v26.n128_f64[0] = CGRectGetMaxX(*(CGRect *)&v22) - v37;
      v27 = 4.0;
    }
    v26.n128_f64[0] = v26.n128_f64[0] + v27;
  }
  else
  {
    v28 = v37 + 12.0;
    v29 = v39;
    v30 = v40;
    v31 = rect;
    v32 = v38;
    if (v21)
      v26.n128_f64[0] = CGRectGetMinX(*(CGRect *)&v29) - v28;
    else
      v26.n128_f64[0] = v28 + CGRectGetMaxX(*(CGRect *)&v29);
  }
  v33 = UIRectIntegralWithScale(v26, MidY + v18 * -0.5, v16, v18, 0.0);
  UIRectGetCenter(objc_msgSend(v4, "setBounds:", CGPointZero.x, y), v33, v34, v35, v36);
  objc_msgSend(v4, "setCenter:");

}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _textField](self, "_textField"));
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  -[SRCompactTextRequestView _beginEditing](self, "_beginEditing");
  return 1;
}

- (BOOL)canResignFirstResponder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _textField](self, "_textField"));
  v3 = objc_msgSend(v2, "canResignFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRCompactTextRequestView;
  -[SRCompactTextRequestView resignFirstResponder](&v6, "resignFirstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _textField](self, "_textField"));
  v4 = objc_msgSend(v3, "resignFirstResponder");

  return v4;
}

- (BOOL)isFirstResponder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _textField](self, "_textField"));
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  void *v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _beginEditingGestureRecognizer](self, "_beginEditingGestureRecognizer"));

  if (v5 == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView _textField](self, "_textField"));
    v6 = objc_msgSend(v7, "isEditing") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  void *v4;

  if (-[SRCompactTextRequestView allowsCancellation](self, "allowsCancellation", a3))
    -[SRCompactTextRequestView _setShowingCancelButton:animated:](self, "_setShowingCancelButton:animated:", 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView delegate](self, "delegate"));
  objc_msgSend(v4, "textRequestViewWillBeginEditing:", self);

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView delegate](self, "delegate"));
  objc_msgSend(v5, "textRequestView:siriRequestCommittedWithText:", self, v4);

  if ((AFDeviceSupportsSystemAssistantExperience(v6, v7) & 1) == 0)
    -[SRCompactTextRequestView resignFirstResponder](self, "resignFirstResponder");

  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;

  -[SRCompactTextRequestView _setShowingCancelButton:animated:](self, "_setShowingCancelButton:animated:", 0, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView delegate](self, "delegate"));
  objc_msgSend(v4, "textRequestViewDidEndEditing:", self);

}

- (void)textField:(id)a3 willPresentEditMenuWithAnimator:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView delegate](self, "delegate", a3, a4));
  objc_msgSend(v5, "textRequestViewWillBeginTextEditMenuInteraction:", self);

}

- (void)textField:(id)a3 willDismissEditMenuWithAnimator:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100063CE4;
  v8[3] = &unk_100122638;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "addCompletion:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SRCompactTextRequestView;
  -[SRCompactTextRequestView traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[SRCompactTextRequestView _updateCancelButtonFont](self, "_updateCancelButtonFont");
  -[SRCompactTextRequestView setNeedsLayout](self, "setNeedsLayout");
  -[SRCompactTextRequestView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)textRequestSuggestionsButton:(id)a3 didEnableSuggestions:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestView delegate](self, "delegate", a3));
  objc_msgSend(v6, "textRequestView:didEnableSuggestions:", self, v4);

}

- (NSString)text
{
  return self->_text;
}

- (BOOL)allowsCancellation
{
  return self->_allowsCancellation;
}

- (SRCompactTextRequestViewDelegate)delegate
{
  return (SRCompactTextRequestViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)_cancelButton
{
  return self->_cancelButton;
}

- (SRCompactTextRequestField)_textField
{
  return self->_textField;
}

- (BOOL)_isShowingCancelButton
{
  return self->_showingCancelButton;
}

- (UIGestureRecognizer)_beginEditingGestureRecognizer
{
  return self->_beginEditingGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginEditingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
