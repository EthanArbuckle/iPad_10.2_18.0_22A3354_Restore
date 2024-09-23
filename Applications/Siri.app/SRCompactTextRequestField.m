@implementation SRCompactTextRequestField

- (SRCompactTextRequestField)initWithFrame:(CGRect)a3
{
  SRCompactTextRequestField *v3;
  SRCompactTextRequestField *v4;
  id v5;
  uint64_t v6;
  SRCompactTextRequestSiriSuggestionsButton *v7;
  SRCompactTextRequestSiriSuggestionsButton *suggestionsButton;
  uint64_t v9;
  MTMaterialView *backgroundView;
  void *v11;
  MTMaterialView *v12;
  uint64_t v13;
  NSHashTable *styledViews;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SRCompactTextRequestField;
  v3 = -[SRCompactTextRequestField initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SRCompactTextRequestField setLoadKeyboardsForSiriLanguage:](v3, "setLoadKeyboardsForSiriLanguage:", 1);
    v5 = -[SRCompactTextRequestField setBorderStyle:](v4, "setBorderStyle:", 0);
    if (AFDeviceSupportsSystemAssistantExperience(v5, v6))
    {
      v7 = -[SRCompactTextRequestSiriSuggestionsButton initWithFrame:]([SRCompactTextRequestSiriSuggestionsButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      suggestionsButton = v4->_suggestionsButton;
      v4->_suggestionsButton = v7;

      -[SRCompactTextRequestSiriSuggestionsButton setDelegate:](v4->_suggestionsButton, "setDelegate:", v4);
      -[SRCompactTextRequestField setLeftView:](v4, "setLeftView:", v4->_suggestionsButton);
      -[SRCompactTextRequestField setLeftViewMode:](v4, "setLeftViewMode:", 3);
    }
    v9 = objc_claimAutoreleasedReturnValue(+[MTMaterialView materialViewWithRecipe:configuration:](MTMaterialView, "materialViewWithRecipe:configuration:", 19, 1));
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (MTMaterialView *)v9;

    -[MTMaterialView setTranslatesAutoresizingMaskIntoConstraints:](v4->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTMaterialView layer](v4->_backgroundView, "layer"));
    objc_msgSend(v11, "setBorderWidth:", 0.300000012);

    -[SRCompactTextRequestField _updateBorderVisualStyling](v4, "_updateBorderVisualStyling");
    -[MTMaterialView setAutoresizingMask:](v4->_backgroundView, "setAutoresizingMask:", 18);
    v12 = v4->_backgroundView;
    -[SRCompactTextRequestField bounds](v4, "bounds");
    -[MTMaterialView setFrame:](v12, "setFrame:");
    -[MTMaterialView setUserInteractionEnabled:](v4->_backgroundView, "setUserInteractionEnabled:", 0);
    -[SRCompactTextRequestField addSubview:](v4, "addSubview:", v4->_backgroundView);
    -[SRCompactTextRequestField sendSubviewToBack:](v4, "sendSubviewToBack:", v4->_backgroundView);
    -[SRCompactTextRequestField setReturnKeyType:](v4, "setReturnKeyType:", 9);
    -[SRCompactTextRequestField setEnablesReturnKeyAutomatically:](v4, "setEnablesReturnKeyAutomatically:", 1);
    -[SRCompactTextRequestField setEnablesReturnKeyOnNonWhiteSpaceContent:](v4, "setEnablesReturnKeyOnNonWhiteSpaceContent:", 1);
    -[SRCompactTextRequestField setMinimumFontSize:](v4, "setMinimumFontSize:", 10.0);
    -[SRCompactTextRequestField _updateVisualStyling](v4, "_updateVisualStyling");
    v13 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    styledViews = v4->_styledViews;
    v4->_styledViews = (NSHashTable *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v4, "_didEndEditing:", UITextFieldTextDidEndEditingNotification, v4);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v4, "_didBeginEditing:", UITextFieldTextDidBeginEditingNotification, v4);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v4, "_textDidChange:", UITextFieldTextDidChangeNotification, v4);

    -[SRCompactTextRequestField _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 16.0);
    -[SRCompactTextRequestField _updateTextAlignmentForEditing:animated:](v4, "_updateTextAlignmentForEditing:animated:", 0, 0);
  }
  return v4;
}

- (id)_borderColorForUserInterfaceStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 <= 2)
    self = (SRCompactTextRequestField *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", dbl_1000C0ED0[a3], 0.08, v3, v4));
  return self;
}

- (void)_updateBorderVisualStyling
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _borderColorForUserInterfaceStyle:](self, "_borderColorForUserInterfaceStyle:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _backgroundView](self, "_backgroundView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));

  v8 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

}

- (double)_preferredHeight
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField font](self, "font"));
  objc_msgSend(v2, "lineHeight");
  v4 = v3 + 26.0;
  objc_msgSend(v2, "descender");
  v6 = fmax(v4 + v5, 48.0);

  return v6;
}

- (UIColor)_secondaryTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.32, 0.32, 0.32, 1.0);
}

- (void)_updateVisualStyling
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  v5 = sub_10006A898(v4, UIContentSizeCategorySmall, UIContentSizeCategoryAccessibilityExtraExtraLarge);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleTitle3, v7));
  -[SRCompactTextRequestField setFont:](self, "setFont:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _secondaryTintColor](self, "_secondaryTintColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _clearButton](self, "_clearButton"));
  global_queue = dispatch_get_global_queue(21, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_10006B234;
  v22 = &unk_100122E70;
  v23 = v9;
  v24 = v10;
  v13 = v10;
  v14 = v9;
  dispatch_async(v12, &v19);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor", v19, v20, v21, v22));
  -[SRCompactTextRequestField setTintColor:](self, "setTintColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[SRCompactTextRequestField setTextColor:](self, "setTextColor:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _placeholderLabel](self, "_placeholderLabel"));
  objc_msgSend(v17, "setTextColor:", v14);
  -[SRCompactTextRequestField _updateStyleForLeftView](self, "_updateStyleForLeftView");
  -[SRCompactTextRequestField _updateStyleForRightView](self, "_updateStyleForRightView");
  -[SRCompactTextRequestField _updateStyleForClearButton](self, "_updateStyleForClearButton");
  -[SRCompactTextRequestField _updateStyleForPlaceholderView](self, "_updateStyleForPlaceholderView");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField layer](self, "layer"));
  objc_msgSend(v18, "setAllowsGroupBlending:", 0);

}

- (void)_updateStyleForPlaceholderView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _placeholderView](self, "_placeholderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _styledViews](self, "_styledViews"));
  if ((objc_msgSend(v3, "containsObject:", v12) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _backgroundView](self, "_backgroundView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visualStylingProviderForCategory:", 1));
    objc_msgSend(v6, "automaticallyUpdateView:withStyle:", v12, 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterPlusL));
    objc_msgSend(v7, "setCompositingFilter:", v8);

    objc_msgSend(v3, "addObject:", v12);
  }
  objc_opt_class(UILabel, v4);
  v10 = sub_100007944(v9, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);

}

- (void)_updateStyleForAccessoryView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _styledViews](self, "_styledViews"));
  if ((objc_msgSend(v4, "containsObject:", v9) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _backgroundView](self, "_backgroundView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visualStylingProviderForCategory:", 1));
    objc_msgSend(v6, "automaticallyUpdateView:withStyle:", v9, 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterPlusL));
    objc_msgSend(v7, "setCompositingFilter:", v8);

    objc_msgSend(v9, "setContentMode:", 1);
    objc_msgSend(v4, "addObject:", v9);

  }
}

- (void)_updateStyleForLeftView
{
  id v3;

  if ((AFDeviceSupportsSystemAssistantExperience(self, a2) & 1) == 0)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField leftView](self, "leftView"));
    -[SRCompactTextRequestField _updateStyleForAccessoryView:](self, "_updateStyleForAccessoryView:", v3);

  }
}

- (void)_updateStyleForRightView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField rightView](self, "rightView"));
  -[SRCompactTextRequestField _updateStyleForAccessoryView:](self, "_updateStyleForAccessoryView:", v3);

}

- (void)_updateStyleForClearButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _clearButton](self, "_clearButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _styledViews](self, "_styledViews"));
  if ((objc_msgSend(v3, "containsObject:", v8) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _backgroundView](self, "_backgroundView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visualStylingProviderForCategory:", 1));
    objc_msgSend(v5, "automaticallyUpdateView:withStyle:", v8, 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterPlusL));
    objc_msgSend(v6, "setCompositingFilter:", v7);

    objc_msgSend(v8, "setContentMode:", 1);
    objc_msgSend(v3, "addObject:", v8);

  }
}

- (int64_t)_preferredTextAlignmentForEditing:(BOOL)a3
{
  if (a3)
    return 4;
  else
    return 1;
}

- (int64_t)_preferredTextAlignment
{
  return -[SRCompactTextRequestField _preferredTextAlignmentForEditing:](self, "_preferredTextAlignmentForEditing:", -[SRCompactTextRequestField isEditing](self, "isEditing"));
}

- (void)_updateTextAlignmentForEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[6];

  v4 = a4;
  v6 = -[SRCompactTextRequestField _preferredTextAlignmentForEditing:](self, "_preferredTextAlignmentForEditing:", a3);
  if (v6 != -[SRCompactTextRequestField textAlignment](self, "textAlignment"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006B800;
    v9[3] = &unk_1001225E8;
    v9[4] = self;
    v9[5] = v6;
    v7 = objc_retainBlock(v9);
    v8 = v7;
    if (v4)
      +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v7, 0);
    else
      ((void (*)(_QWORD *))v7[2])(v7);

  }
}

- (BOOL)_hasText
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField text](self, "text"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (void)_didBeginEditing:(id)a3
{
  -[SRCompactTextRequestField _updateTextAlignmentForEditing:animated:](self, "_updateTextAlignmentForEditing:animated:", 1, 1);
}

- (void)_textDidChange:(id)a3
{
  uint64_t v4;

  if (-[SRCompactTextRequestField _hasText](self, "_hasText", a3))
    v4 = 3;
  else
    v4 = 1;
  -[SRCompactTextRequestField setClearButtonMode:](self, "setClearButtonMode:", v4);
}

- (void)_didEndEditing:(id)a3
{
  -[SRCompactTextRequestField _updateTextAlignmentForEditing:animated:](self, "_updateTextAlignmentForEditing:animated:", 0, 1);
}

- (BOOL)_laysOutContentRightToLeft
{
  return -[SRCompactTextRequestField semanticContentAttribute](self, "semanticContentAttribute") == (id)4;
}

- (CGRect)_placeholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 layingOutContentRightToLeft:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v12;
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
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  CGRect result;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = -[SRCompactTextRequestField _frameForPlaceholderRectForBounds:alignment:layingOutContentRightToLeft:](self, "_frameForPlaceholderRectForBounds:alignment:layingOutContentRightToLeft:");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (a4 == 1)
  {
    v19 = UIRectCenteredXInRectScale(v12);
    v14 = v20;
    v16 = v21;
    v18 = v22;
  }
  else
  {
    -[SRCompactTextRequestField _textRectForBounds:alignment:layingOutContentRightToLeft:](self, "_textRectForBounds:alignment:layingOutContentRightToLeft:", a4, v5, x, y, width, height);
    v27 = v23;
    v28 = v24;
    v29 = v25;
    v30 = v26;
    if (v5)
    {
      v19 = CGRectGetMaxX(*(CGRect *)&v23) - (v16 + 8.0);
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField leftView](self, "leftView"));
      objc_msgSend(v31, "frame");
      v33 = v32;
      v38.origin.x = v27;
      v38.origin.y = v28;
      v38.size.width = v29;
      v38.size.height = v30;
      v19 = CGRectGetMinX(v38) + v33;

    }
  }
  v34 = v19;
  v35 = v14;
  v36 = v16;
  v37 = v18;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (CGRect)_frameForPlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 layingOutContentRightToLeft:(BOOL)a5
{
  double height;
  double width;
  double x;
  double v9;
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
  __n128 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double y;
  NSAttributedStringKey v27;
  void *v28;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a3.size.width - ((a3.size.height + -26.0) * 2.0 + 16.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField placeholder](self, "placeholder", a4, a5));
  v27 = NSFontAttributeName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField font](self, "font"));
  v28 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 0, v12, 0, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  if (v9 >= v18)
    v21.n128_f64[0] = v18;
  else
    v21.n128_f64[0] = v9;
  UIRectCenteredIntegralRectScale(v14, v16, v21, v20, x, y, width, height, 0.0);
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)_textRectForBounds:(CGRect)a3 alignment:(int64_t)a4 layingOutContentRightToLeft:(BOOL)a5
{
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4 == 1)
  {
    -[SRCompactTextRequestField _frameForPlaceholderRectForBounds:alignment:layingOutContentRightToLeft:](self, "_frameForPlaceholderRectForBounds:alignment:layingOutContentRightToLeft:", 1, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v12 = v11;
  }
  else
  {
    v12 = a3.size.height + -26.0;
    v13 = a3.size.height + -26.0 + 8.0 + 13.0;
    v14 = -[SRCompactTextRequestField _laysOutContentRightToLeft](self, "_laysOutContentRightToLeft", a4, a5);
    if (v14)
      v15 = v13;
    else
      v15 = 13.0;
    if (v14)
      v16 = 13.0;
    else
      v16 = v13;
    v8 = x + v15;
    v9 = y + 13.0;
    v10 = width - (v15 + v16);
  }
  v17 = v12;
  result.size.height = v17;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)_adjustTextOrEditingRect:(CGRect)a3 forBounds:(CGRect)a4
{
  double height;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double width;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v7 = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v12 = a4.size.height - (a3.origin.y + a3.size.height);
  -[SRCompactTextRequestField bounds](self, "bounds");
  v14 = v13 - v9 - v12;
  -[SRCompactTextRequestField _padding](self, "_padding");
  v16 = v14 - v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField font](self, "font"));
  objc_msgSend(v17, "lineHeight");
  v19 = v16 - v18;

  v20 = v7 - v19;
  UIRectCenteredRect(v10, v9, v8, v20, x, y, width, height);
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField leftView](self, "leftView"));
  objc_msgSend(v23, "frame");
  v25 = v10 + v24;

  v26 = v25;
  v27 = v22;
  v28 = v8;
  v29 = v20;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SRCompactTextRequestField _placeholderRectForBounds:alignment:layingOutContentRightToLeft:](self, "_placeholderRectForBounds:alignment:layingOutContentRightToLeft:", -[SRCompactTextRequestField _preferredTextAlignment](self, "_preferredTextAlignment"), -[SRCompactTextRequestField _laysOutContentRightToLeft](self, "_laysOutContentRightToLeft"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SRCompactTextRequestField _textRectForBounds:alignment:layingOutContentRightToLeft:](self, "_textRectForBounds:alignment:layingOutContentRightToLeft:", -[SRCompactTextRequestField _preferredTextAlignment](self, "_preferredTextAlignment"), -[SRCompactTextRequestField _laysOutContentRightToLeft](self, "_laysOutContentRightToLeft"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SRCompactTextRequestField _adjustTextOrEditingRect:forBounds:](self, "_adjustTextOrEditingRect:forBounds:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SRCompactTextRequestField _textRectForBounds:alignment:layingOutContentRightToLeft:](self, "_textRectForBounds:alignment:layingOutContentRightToLeft:", -[SRCompactTextRequestField _preferredTextAlignment](self, "_preferredTextAlignment"), -[SRCompactTextRequestField _laysOutContentRightToLeft](self, "_laysOutContentRightToLeft"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SRCompactTextRequestField _adjustTextOrEditingRect:forBounds:](self, "_adjustTextOrEditingRect:forBounds:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  unsigned int v8;
  __n128 v9;
  __n128 v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  void *v18;
  __n128 v19;
  __n128 v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[SRCompactTextRequestField _laysOutContentRightToLeft](self, "_laysOutContentRightToLeft");
  if (v8)
    v10.n128_f64[0] = height + -26.0;
  else
    v10.n128_u64[0] = *(_QWORD *)&CGSizeZero.height;
  if (v8)
    v9.n128_f64[0] = height + -26.0;
  else
    v9.n128_f64[0] = CGSizeZero.width;
  UIRectCenteredYInRectScale(CGPointZero.x, CGPointZero.y, v9, v10, x, y, width, height, 0.0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (-[SRCompactTextRequestField textAlignment](self, "textAlignment") == (id)1)
  {
    -[SRCompactTextRequestField _placeholderRectForBounds:alignment:layingOutContentRightToLeft:](self, "_placeholderRectForBounds:alignment:layingOutContentRightToLeft:", 1, 0, x, y, width, height);
    v17 = CGRectGetMinX(v28) - (height + -26.0 + 8.0);
  }
  else
  {
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v17 = CGRectGetMinX(v29) + 13.0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField leftView](self, "leftView"));

  if (v18)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField leftView](self, "leftView"));
    objc_msgSend(v21, "frame");
    v14 = v22;
    v16 = v23;

  }
  v19.n128_u64[0] = v14;
  v20.n128_u64[0] = v16;
  UIRectCenteredYInRectScale(v17, v12, v19, v20, x, y, width, height, 0.0);
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  unsigned int v8;
  __n128 v9;
  __n128 v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  __n128 v18;
  __n128 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[SRCompactTextRequestField _laysOutContentRightToLeft](self, "_laysOutContentRightToLeft");
  if (v8)
    v10.n128_u64[0] = *(_QWORD *)&CGSizeZero.height;
  else
    v10.n128_f64[0] = height + -26.0;
  if (v8)
    v9.n128_f64[0] = CGSizeZero.width;
  else
    v9.n128_f64[0] = height + -26.0;
  UIRectCenteredYInRectScale(CGPointZero.x, CGPointZero.y, v9, v10, x, y, width, height, 0.0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (-[SRCompactTextRequestField textAlignment](self, "textAlignment") == (id)1)
  {
    -[SRCompactTextRequestField _placeholderRectForBounds:alignment:layingOutContentRightToLeft:](self, "_placeholderRectForBounds:alignment:layingOutContentRightToLeft:", 1, 1, x, y, width, height);
    v17 = CGRectGetMaxX(v24) + -8.0;
  }
  else
  {
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v17 = CGRectGetMaxX(v25) - (height + -26.0 + 13.0);
  }
  v18.n128_u64[0] = v14;
  v19.n128_u64[0] = v16;
  UIRectCenteredYInRectScale(v17, v12, v18, v19, x, y, width, height, 0.0);
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[SRCompactTextRequestField _laysOutContentRightToLeft](self, "_laysOutContentRightToLeft"))
    -[SRCompactTextRequestField leftViewRectForBounds:](self, "leftViewRectForBounds:", x, y, width, height);
  else
    -[SRCompactTextRequestField rightViewRectForBounds:](self, "rightViewRectForBounds:", x, y, width, height);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGSize result;

  v8.receiver = self;
  v8.super_class = (Class)SRCompactTextRequestField;
  -[SRCompactTextRequestField intrinsicContentSize](&v8, "intrinsicContentSize");
  v4 = v3;
  -[SRCompactTextRequestField _preferredHeight](self, "_preferredHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
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
  objc_super v15;
  CGSize result;

  width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)SRCompactTextRequestField;
  -[SRCompactTextRequestField sizeThatFits:](&v15, "sizeThatFits:", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  -[SRCompactTextRequestField _preferredHeight](self, "_preferredHeight");
  v10 = v9;
  if (!sub_10006F024(width, v9, v6, v8))
  {
    v11 = sub_10006F038(v6, v8, width, v10);
    width = sub_10006F050(v11);
    v10 = v12;
  }
  v13 = width;
  v14 = v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  SRCompactTextRequestSiriSuggestionsButton *suggestionsButton;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double Height;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)SRCompactTextRequestField;
  -[SRCompactTextRequestField layoutSubviews](&v16, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _suggestionsButton](self, "_suggestionsButton"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  suggestionsButton = self->_suggestionsButton;
  -[SRCompactTextRequestField bounds](self, "bounds");
  -[SRCompactTextRequestSiriSuggestionsButton sizeThatFits:](suggestionsButton, "sizeThatFits:", v9, v10);
  v12 = v11;
  v14 = v13;
  -[SRCompactTextRequestField bounds](self, "bounds");
  Height = CGRectGetHeight(v17);
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v12;
  v18.size.height = v14;
  objc_msgSend(v3, "setFrame:", v5, (Height - CGRectGetHeight(v18)) * 0.5, v12, v14);
  -[SRCompactTextRequestField _updateVisualStyling](self, "_updateVisualStyling");

}

- (void)_setContinuousCornerRadius:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRCompactTextRequestField;
  -[SRCompactTextRequestField _setContinuousCornerRadius:](&v6, "_setContinuousCornerRadius:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _backgroundView](self, "_backgroundView"));
  objc_msgSend(v5, "_setContinuousCornerRadius:", a3);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SRCompactTextRequestField;
  -[SRCompactTextRequestField _dynamicUserInterfaceTraitDidChange](&v3, "_dynamicUserInterfaceTraitDidChange");
  -[SRCompactTextRequestField _updateBorderVisualStyling](self, "_updateBorderVisualStyling");
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SRCompactTextRequestField;
  v3 = -[SRCompactTextRequestField resignFirstResponder](&v5, "resignFirstResponder");
  if (v3)
    -[SRCompactTextRequestField setText:](self, "setText:", &stru_100125588);
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRCompactTextRequestField;
  -[SRCompactTextRequestField traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField _styledViews](self, "_styledViews"));
  objc_msgSend(v5, "removeAllObjects");

  -[SRCompactTextRequestField _updateVisualStyling](self, "_updateVisualStyling");
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField traitCollection](self, "traitCollection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredContentSizeCategory"));

    if (v6 != v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField traitCollection](self, "traitCollection"));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredContentSizeCategory"));
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

      if (IsAccessibilityCategory)
        -[SRCompactTextRequestField invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }

}

- (void)textRequestSuggestionsButton:(id)a3 didEnableSuggestions:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestField buttonDelegate](self, "buttonDelegate"));
  objc_msgSend(v7, "textRequestSuggestionsButton:didEnableSuggestions:", v6, v4);

}

- (SRCompactTextRequestSiriSuggestionsButtonDelegate)buttonDelegate
{
  return (SRCompactTextRequestSiriSuggestionsButtonDelegate *)objc_loadWeakRetained((id *)&self->_buttonDelegate);
}

- (void)setButtonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonDelegate, a3);
}

- (MTMaterialView)_backgroundView
{
  return self->_backgroundView;
}

- (SRCompactTextRequestSiriSuggestionsButton)_suggestionsButton
{
  return self->_suggestionsButton;
}

- (NSHashTable)_styledViews
{
  return self->_styledViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styledViews, 0);
  objc_storeStrong((id *)&self->_suggestionsButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_buttonDelegate);
}

@end
