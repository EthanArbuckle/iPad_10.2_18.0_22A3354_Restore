@implementation MUExpandingLabel

- (void)_mkExpandingLabelComonInit
{
  id v3;
  NSTextContainer *v4;
  NSTextContainer *textContainer;
  NSLayoutManager *v6;
  NSLayoutManager *textLayoutManager;
  NSTextStorage *v8;
  NSTextStorage *textStorage;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UITextView *v15;
  UITextView *textView;
  void *v17;
  void *v18;
  void *v19;
  UIButton *v20;
  UIButton *showMoreButton;
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
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id location;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  self->_expansionMode = 0;
  self->_numberOfLinesWhenCollapsed = 10;
  v3 = objc_alloc(MEMORY[0x1E0DC12C0]);
  v4 = (NSTextContainer *)objc_msgSend(v3, "initWithSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  textContainer = self->_textContainer;
  self->_textContainer = v4;

  -[NSTextContainer setLineBreakMode:](self->_textContainer, "setLineBreakMode:", 4);
  -[NSTextContainer setLineFragmentPadding:](self->_textContainer, "setLineFragmentPadding:", 0.0);
  -[NSTextContainer setMaximumNumberOfLines:](self->_textContainer, "setMaximumNumberOfLines:", self->_numberOfLinesWhenCollapsed);
  -[NSTextContainer setHeightTracksTextView:](self->_textContainer, "setHeightTracksTextView:", 1);
  -[NSTextContainer setWidthTracksTextView:](self->_textContainer, "setWidthTracksTextView:", 1);
  v6 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x1E0DC1280]);
  textLayoutManager = self->_textLayoutManager;
  self->_textLayoutManager = v6;

  -[NSLayoutManager addTextContainer:](self->_textLayoutManager, "addTextContainer:", self->_textContainer);
  v8 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E0DC1320]);
  textStorage = self->_textStorage;
  self->_textStorage = v8;

  -[NSTextStorage addLayoutManager:](self->_textStorage, "addLayoutManager:", self->_textLayoutManager);
  v10 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v15 = (UITextView *)objc_msgSend(v10, "initWithFrame:textContainer:", self->_textContainer, *MEMORY[0x1E0C9D648], v12, v13, v14);
  textView = self->_textView;
  self->_textView = v15;

  -[UITextView setScrollEnabled:](self->_textView, "setScrollEnabled:", 0);
  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v17);

  -[UITextView setShowsVerticalScrollIndicator:](self->_textView, "setShowsVerticalScrollIndicator:", 0);
  -[UITextView setShowsHorizontalScrollIndicator:](self->_textView, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "subtitleFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_textView, "setFont:", v19);

  -[UITextView setTextAlignment:](self->_textView, "setTextAlignment:", 4);
  -[UITextView setDelegate:](self->_textView, "setDelegate:", self);
  -[UITextView setSelectable:](self->_textView, "setSelectable:", 1);
  -[UITextView setAccessibilityIdentifier:](self->_textView, "setAccessibilityIdentifier:", CFSTR("ExpandingLabelTextView"));
  -[MUExpandingLabel addSubview:](self, "addSubview:", self->_textView);
  v20 = (UIButton *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3518]), "initWithFrame:", v11, v12, v13, v14);
  showMoreButton = self->_showMoreButton;
  self->_showMoreButton = v20;

  -[UIButton setPreferredBehavioralStyle:](self->_showMoreButton, "setPreferredBehavioralStyle:", 1);
  objc_initWeak(&location, self);
  v37[1] = 3221225472;
  v37[2] = __46__MUExpandingLabel__mkExpandingLabelComonInit__block_invoke;
  v37[3] = &unk_1E2E02730;
  v37[0] = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v38, &location);
  -[UIButton setConfigurationUpdateHandler:](self->_showMoreButton, "setConfigurationUpdateHandler:", v37);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_showMoreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setAccessibilityIdentifier:](self->_showMoreButton, "setAccessibilityIdentifier:", CFSTR("ExpandingLabelMoreButton"));
  -[UIButton titleLabel](self->_showMoreButton, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAdjustsFontForContentSizeCategory:", 1);

  -[MUExpandingLabel setShowMoreText:](self, "setShowMoreText:", 0);
  -[MUExpandingLabel setShowMoreFont:](self, "setShowMoreFont:", 0);
  -[MUExpandingLabel setShowLessFont:](self, "setShowLessFont:", 0);
  -[MUExpandingLabel setShowLessText:](self, "setShowLessText:", 0);
  -[MUExpandingLabel addSubview:](self, "addSubview:", self->_showMoreButton);
  -[UIButton addTarget:action:forControlEvents:](self->_showMoreButton, "addTarget:action:forControlEvents:", self, sel__expand, 64);
  _NSDictionaryOfVariableBindings(CFSTR("_textView, _showMoreButton"), self->_textView, self->_showMoreButton, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[_textView]-0-|"), 0, 0, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v25);

  v26 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[_textView]-0-|"), 0, 0, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v27);

  v28 = (void *)MEMORY[0x1E0CB3718];
  -[UIButton firstBaselineAnchor](self->_showMoreButton, "firstBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView lastBaselineAnchor](self->_textView, "lastBaselineAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v31;
  -[UIButton titleLabel](self->_showMoreButton, "titleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel trailingAnchor](self, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v36);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __46__MUExpandingLabel__mkExpandingLabelComonInit__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "_mapsui_textButtonConfigurationWithFont:textColor:", WeakRetained[58], WeakRetained[64]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentInsets:", 20.0, 20.0, 20.0, 20.0);
    objc_msgSend(WeakRetained, "showMoreText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(WeakRetained, "showMoreText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v6);

    }
    objc_msgSend(WeakRetained, "showMoreFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(WeakRetained, "showMoreFont");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFont:", v8);

    }
    objc_msgSend(v10, "setConfiguration:", v4);

  }
}

- (MUExpandingLabel)init
{
  MUExpandingLabel *v2;
  MUExpandingLabel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUExpandingLabel;
  v2 = -[MUExpandingLabel init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MUExpandingLabel _mkExpandingLabelComonInit](v2, "_mkExpandingLabelComonInit");
  return v3;
}

- (MUExpandingLabel)initWithCoder:(id)a3
{
  MUExpandingLabel *v3;
  MUExpandingLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUExpandingLabel;
  v3 = -[MUExpandingLabel initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[MUExpandingLabel _mkExpandingLabelComonInit](v3, "_mkExpandingLabelComonInit");
  return v4;
}

- (MUExpandingLabel)initWithFrame:(CGRect)a3
{
  MUExpandingLabel *v3;
  MUExpandingLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUExpandingLabel;
  v3 = -[MUExpandingLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MUExpandingLabel _mkExpandingLabelComonInit](v3, "_mkExpandingLabelComonInit");
  return v4;
}

- (void)infoCardThemeChanged
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUExpandingLabel;
  -[MUExpandingLabel infoCardThemeChanged](&v3, sel_infoCardThemeChanged);
  if (!self->_showMoreTextColor)
    -[UIButton setNeedsUpdateConfiguration](self->_showMoreButton, "setNeedsUpdateConfiguration");
}

- (void)setText:(id)a3
{
  -[UITextView setText:](self->_textView, "setText:", a3);
}

- (NSString)text
{
  return -[UITextView text](self->_textView, "text");
}

- (void)setAttributedText:(id)a3
{
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", a3);
}

- (NSAttributedString)attributedText
{
  return -[UITextView attributedText](self->_textView, "attributedText");
}

- (void)setFont:(id)a3
{
  -[UITextView setFont:](self->_textView, "setFont:", a3);
}

- (UIFont)font
{
  return -[UITextView font](self->_textView, "font");
}

- (void)setTextColor:(id)a3
{
  -[UITextView setTextColor:](self->_textView, "setTextColor:", a3);
}

- (UIColor)textColor
{
  return -[UITextView textColor](self->_textView, "textColor");
}

- (int64_t)textAlignment
{
  return -[UITextView textAlignment](self->_textView, "textAlignment");
}

- (void)setTextAlignment:(int64_t)a3
{
  -[UITextView setTextAlignment:](self->_textView, "setTextAlignment:", a3);
}

- (void)setNumberOfLinesWhenCollapsed:(unint64_t)a3
{
  unint64_t v4;
  unint64_t numberOfLinesWhenCollapsed;

  if (self->_numberOfLinesWhenCollapsed != a3)
  {
    v4 = 10;
    if (a3)
      v4 = a3;
    self->_numberOfLinesWhenCollapsed = v4;
    if (-[MUExpandingLabel isShowingExpanded](self, "isShowingExpanded"))
      numberOfLinesWhenCollapsed = 0;
    else
      numberOfLinesWhenCollapsed = self->_numberOfLinesWhenCollapsed;
    -[NSTextContainer setMaximumNumberOfLines:](self->_textContainer, "setMaximumNumberOfLines:", numberOfLinesWhenCollapsed);
    -[MUExpandingLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowMoreText:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_showMoreText != v5 || !-[NSString isEqualToString:](v5, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_showMoreText, a3);
    -[UIButton setNeedsUpdateConfiguration](self->_showMoreButton, "setNeedsUpdateConfiguration");
    -[MUExpandingLabel setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)showMoreText
{
  NSString *showMoreText;

  showMoreText = self->_showMoreText;
  if (showMoreText)
    return showMoreText;
  _MULocalizedStringFromThisBundle(CFSTR("More▼ [Expandable Label"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setShowMoreFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_showMoreFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_showMoreFont, a3);
    -[UIButton setNeedsUpdateConfiguration](self->_showMoreButton, "setNeedsUpdateConfiguration");
    -[MUExpandingLabel setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (UIFont)showMoreFont
{
  UIFont *showMoreFont;
  UIFont *v3;
  void *v4;

  showMoreFont = self->_showMoreFont;
  if (showMoreFont)
  {
    v3 = showMoreFont;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitleFont");
    v3 = (UIFont *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setShowMoreTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_showMoreTextColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_showMoreTextColor, a3);
    -[UIButton setNeedsUpdateConfiguration](self->_showMoreButton, "setNeedsUpdateConfiguration");
    v5 = v6;
  }

}

- (UIColor)showMoreTextColor
{
  UIColor *showMoreTextColor;

  showMoreTextColor = self->_showMoreTextColor;
  if (showMoreTextColor)
    return showMoreTextColor;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setShowLessTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_showLessTextColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_showLessTextColor, a3);
    v5 = v6;
  }

}

- (UIColor)showLessTextColor
{
  UIColor *showLessTextColor;
  UIColor *v3;
  void *v4;

  showLessTextColor = self->_showLessTextColor;
  if (showLessTextColor)
  {
    v3 = showLessTextColor;
  }
  else
  {
    -[MUExpandingLabel mk_theme](self, "mk_theme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lightTextColor");
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setShowLessText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (!v4)
  {
    _MULocalizedStringFromThisBundle(CFSTR("Less [Expanding Label]"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_showLessText, v4);
  v5 = v6;
  if (!v6)
  {

    v5 = 0;
  }

}

- (NSString)showLessText
{
  return self->_showLessText;
}

- (void)setShowLessFont:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subtitleFont");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_showLessFont, v5);
  v6 = v7;
  if (!v7)
  {

    v6 = 0;
  }

}

- (UIFont)showLessFont
{
  return self->_showLessFont;
}

- (void)setEditable:(BOOL)a3
{
  -[UITextView setEditable:](self->_textView, "setEditable:", a3);
}

- (BOOL)isEditable
{
  return -[UITextView isEditable](self->_textView, "isEditable");
}

- (void)setSelectable:(BOOL)a3
{
  -[UITextView setSelectable:](self->_textView, "setSelectable:", a3);
}

- (BOOL)isSelectable
{
  return -[UITextView isSelectable](self->_textView, "isSelectable");
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUExpandingLabel;
  -[MUExpandingLabel layoutSubviews](&v4, sel_layoutSubviews);
  if (!self->_isPerformingLayout)
  {
    self->_isPerformingLayout = 1;
    if (self->_expansionMode == 2
      || (v3 = -[MUExpandingLabel isShowingExpanded](self, "isShowingExpanded"),
          -[MUExpandingLabel _setExpansionMode:](self, "_setExpansionMode:", -[MUExpandingLabel _canShowAllText](self, "_canShowAllText")), v3 == -[MUExpandingLabel isShowingExpanded](self, "isShowingExpanded")))
    {
      -[MUExpandingLabel _setTextExclusionPath](self, "_setTextExclusionPath");
    }
    self->_isPerformingLayout = 0;
  }
}

- (void)_setTextExclusionPath
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v15[1] = *MEMORY[0x1E0C80C00];
  if (-[MUExpandingLabel isShowingExpanded](self, "isShowingExpanded"))
  {
    -[NSTextContainer setExclusionPaths:](self->_textContainer, "setExclusionPaths:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    -[UIButton titleLabel](self->_showMoreButton, "titleLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    -[MUExpandingLabel convertRect:fromView:](self, "convertRect:fromView:", self->_showMoreButton);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    v17 = CGRectInset(v16, -5.0, 0.0);
    v12 = (void *)MEMORY[0x1E0DC3508];
    v18 = CGRectIntegral(v17);
    objc_msgSend(v12, "bezierPathWithRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSTextContainer setExclusionPaths:](self->_textContainer, "setExclusionPaths:", v14);

  }
}

- (void)_expand
{
  -[MUExpandingLabel setExpanded:](self, "setExpanded:", 1);
}

- (void)setExpanded:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  -[MUExpandingLabel _setExpansionMode:](self, "_setExpansionMode:", v3);
}

- (BOOL)isExpanded
{
  return self->_expansionMode == 2;
}

- (void)_setExpansionMode:(unint64_t)a3
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t numberOfLinesWhenCollapsed;
  void (**labelResizedBlock)(void);
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  if (self->_expansionMode != a3)
  {
    v5 = -[MUExpandingLabel isShowingExpanded](self, "isShowingExpanded");
    self->_expansionMode = a3;
    v6 = -[MUExpandingLabel isShowingExpanded](self, "isShowingExpanded");
    if (v5 != v6)
    {
      v7 = v6;
      -[UIButton setHidden:](self->_showMoreButton, "setHidden:", v6);
      if (v7 && -[MUExpandingLabel _canShowLess](self, "_canShowLess"))
      {
        v32[0] = *MEMORY[0x1E0DC1138];
        -[MUExpandingLabel showLessFont](self, "showLessFont");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v8;
        v32[1] = *MEMORY[0x1E0DC1140];
        -[MUExpandingLabel showLessTextColor](self, "showLessTextColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v33[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[MUExpandingLabel attributedText](self, "attributedText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        v13 = objc_alloc(MEMORY[0x1E0CB3498]);
        -[MUExpandingLabel _showLessTextSeparator](self, "_showLessTextSeparator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithString:", v14);
        objc_msgSend(v12, "appendAttributedString:", v15);

        v16 = objc_alloc(MEMORY[0x1E0CB3778]);
        -[MUExpandingLabel showLessText](self, "showLessText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithString:attributes:", v17, v10);

        v19 = *MEMORY[0x1E0DC1160];
        v20 = (void *)objc_opt_new();
        objc_msgSend(v18, "addAttribute:value:range:", v19, v20, 0, objc_msgSend(v18, "length"));

        -[UITextView setLinkTextAttributes:](self->_textView, "setLinkTextAttributes:", v10);
        objc_msgSend(v12, "appendAttributedString:", v18);
        -[MUExpandingLabel setAttributedText:](self, "setAttributedText:", v12);

      }
      else
      {
        if (v5 && -[MUExpandingLabel allowLessText](self, "allowLessText"))
        {
          -[MUExpandingLabel attributedText](self, "attributedText");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v21, "mutableCopy");

          -[MUExpandingLabel _showLessTextSeparator](self, "_showLessTextSeparator");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "length");
          -[MUExpandingLabel showLessText](self, "showLessText");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "length") + v24;

          -[MUExpandingLabel attributedText](self, "attributedText");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "string");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "length") - v26;

          objc_msgSend(v22, "deleteCharactersInRange:", v29, v26);
          -[MUExpandingLabel setAttributedText:](self, "setAttributedText:", v22);

        }
        if (!v7)
        {
          numberOfLinesWhenCollapsed = self->_numberOfLinesWhenCollapsed;
LABEL_12:
          -[NSTextContainer setMaximumNumberOfLines:](self->_textContainer, "setMaximumNumberOfLines:", numberOfLinesWhenCollapsed);
          -[NSTextContainer setExclusionPaths:](self->_textContainer, "setExclusionPaths:", MEMORY[0x1E0C9AA60]);
          -[UITextView invalidateIntrinsicContentSize](self->_textView, "invalidateIntrinsicContentSize");
          -[MUExpandingLabel setNeedsLayout](self, "setNeedsLayout");
          labelResizedBlock = (void (**)(void))self->_labelResizedBlock;
          if (labelResizedBlock)
            labelResizedBlock[2]();
          return;
        }
      }
      numberOfLinesWhenCollapsed = 0;
      goto LABEL_12;
    }
  }
}

- (BOOL)isShowingExpanded
{
  return self->_expansionMode != 0;
}

- (BOOL)_isShowingUserExpanded
{
  return self->_expansionMode == 2;
}

- (BOOL)_canShowLess
{
  _BOOL4 v3;

  v3 = -[MUExpandingLabel _isShowingUserExpanded](self, "_isShowingUserExpanded");
  if (v3)
    LOBYTE(v3) = -[MUExpandingLabel allowLessText](self, "allowLessText");
  return v3;
}

- (BOOL)_canShowAllText
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  NSUInteger v6;
  BOOL v7;
  unint64_t v8;

  v3 = -[NSLayoutManager numberOfGlyphs](self->_textLayoutManager, "numberOfGlyphs");
  if (!v3)
    return 1;
  v4 = v3;
  -[NSTextContainer exclusionPaths](self->_textContainer, "exclusionPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTextContainer setExclusionPaths:](self->_textContainer, "setExclusionPaths:", MEMORY[0x1E0C9AA60]);
  -[NSLayoutManager glyphRangeForTextContainer:](self->_textLayoutManager, "glyphRangeForTextContainer:", self->_textContainer);
  v7 = v6 >= v4
    && -[NSLayoutManager truncatedGlyphRangeInLineFragmentForGlyphAtIndex:](self->_textLayoutManager, "truncatedGlyphRangeInLineFragmentForGlyphAtIndex:", v4 - 1) == 0x7FFFFFFFFFFFFFFFLL&& v8 < 0x14;
  -[NSTextContainer setExclusionPaths:](self->_textContainer, "setExclusionPaths:", v5);

  return v7;
}

- (id)_showLessTextSeparator
{
  return _MULocalizedStringFromThisBundle(CFSTR("Expandable label separator"));
}

- (id)viewForFirstBaselineLayout
{
  return (id)-[UITextView viewForFirstBaselineLayout](self->_textView, "viewForFirstBaselineLayout");
}

- (id)viewForLastBaselineLayout
{
  return (id)-[UITextView viewForLastBaselineLayout](self->_textView, "viewForLastBaselineLayout");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  -[MUExpandingLabel setExpanded:](self, "setExpanded:", 0, a4, a5.location, a5.length, a6);
  return 0;
}

- (unint64_t)numberOfLinesWhenCollapsed
{
  return self->_numberOfLinesWhenCollapsed;
}

- (id)labelResizedBlock
{
  return self->_labelResizedBlock;
}

- (void)setLabelResizedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (BOOL)allowLessText
{
  return self->_allowLessText;
}

- (void)setAllowLessText:(BOOL)a3
{
  self->_allowLessText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_labelResizedBlock, 0);
  objc_storeStrong((id *)&self->_showLessTextColor, 0);
  objc_storeStrong((id *)&self->_showMoreTextColor, 0);
  objc_storeStrong((id *)&self->_showMoreTapRecognizer, 0);
  objc_storeStrong((id *)&self->_showLessFont, 0);
  objc_storeStrong((id *)&self->_showLessText, 0);
  objc_storeStrong((id *)&self->_showMoreText, 0);
  objc_storeStrong((id *)&self->_showMoreFont, 0);
  objc_storeStrong((id *)&self->_showMoreButton, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
}

@end
