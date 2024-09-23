@implementation CCUIMenuModuleItemView

+ (double)defaultMenuItemHeightForContentSizeCategory:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "_titleFontForContentSizeCategory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 52.0);
  v5 = v4;

  return v5;
}

+ (id)_titleFontForContentSizeCategory:(id)a3 shouldLimitContentSizeCategory:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:shouldLimitContentSizeCategory:", *MEMORY[0x1E0DC4A88], 8, a3, a4);
}

+ (id)_titleFontForContentSizeCategory:(id)a3
{
  return (id)objc_msgSend(a1, "_titleFontForContentSizeCategory:shouldLimitContentSizeCategory:", a3, 0);
}

+ (id)_preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4 contentSizeCategory:(id)a5 shouldLimitContentSizeCategory:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  if (objc_msgSend(a1, "_shouldLimitContentSizeCategory:forceLimitContentSizeCategory:", v11, v6))
  {
    v12 = (id)*MEMORY[0x1E0DC48D0];

    v11 = v12;
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v10, a4, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)_shouldLimitContentSizeCategory:(id)a3 forceLimitContentSizeCategory:(BOOL)a4
{
  NSString *v5;
  BOOL v6;

  v5 = (NSString *)a3;
  v6 = (a4 || (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") - 3) <= 1)
    && UIContentSizeCategoryCompareToCategory(v5, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending;

  return v6;
}

+ (id)_subtitleFontForContentSizeCategory:(id)a3
{
  return (id)objc_msgSend(a1, "_subtitleFontForContentSizeCategory:shouldLimitContentSizeCategory:", a3, 0);
}

+ (id)_subtitleFontForContentSizeCategory:(id)a3 shouldLimitContentSizeCategory:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:shouldLimitContentSizeCategory:", *MEMORY[0x1E0DC4B10], 8, a3, a4);
}

- (CCUIMenuModuleItemView)initWithMenuItem:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CCUIMenuModuleItemView *v10;
  CCUIMenuModuleItemView *v11;
  uint64_t v12;
  UIView *highlightedBackgroundView;
  uint64_t v14;
  BSUIEmojiLabelView *titleLabel;
  BSUIEmojiLabelView *v16;
  void *v17;
  BSUIEmojiLabelView *v18;
  void *v19;
  uint64_t v20;
  BSUIEmojiLabelView *subtitleLabel;
  BSUIEmojiLabelView *v22;
  void *v23;
  BSUIEmojiLabelView *v24;
  void *v25;
  UIView *v26;
  UIView *separatorView;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_super v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CCUIMenuModuleItemView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[CCUIMenuModuleItemView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_menuItem, a3);
    +[CCUIControlCenterMaterialView _tertiaryView](CCUIControlCenterMaterialView, "_tertiaryView");
    v12 = objc_claimAutoreleasedReturnValue();
    highlightedBackgroundView = v11->_highlightedBackgroundView;
    v11->_highlightedBackgroundView = (UIView *)v12;

    -[UIView setAutoresizingMask:](v11->_highlightedBackgroundView, "setAutoresizingMask:", 18);
    -[UIView setAlpha:](v11->_highlightedBackgroundView, "setAlpha:", 0.0);
    -[CCUIMenuModuleItemView addSubview:](v11, "addSubview:", v11->_highlightedBackgroundView);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01920]), "initWithFrame:", v6, v7, v8, v9);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (BSUIEmojiLabelView *)v14;

    -[CCUIMenuModuleItemView addSubview:](v11, "addSubview:", v11->_titleLabel);
    v16 = v11->_titleLabel;
    -[CCUIMenuModuleItemView _titleFont](v11, "_titleFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIEmojiLabelView setFont:](v16, "setFont:", v17);

    -[BSUIEmojiLabelView setUserInteractionEnabled:](v11->_titleLabel, "setUserInteractionEnabled:", 0);
    v18 = v11->_titleLabel;
    objc_msgSend(v5, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIEmojiLabelView setText:](v18, "setText:", v19);

    -[BSUIEmojiLabelView setNumberOfLines:](v11->_titleLabel, "setNumberOfLines:", 0);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01920]), "initWithFrame:", v6, v7, v8, v9);
    subtitleLabel = v11->_subtitleLabel;
    v11->_subtitleLabel = (BSUIEmojiLabelView *)v20;

    -[CCUIMenuModuleItemView addSubview:](v11, "addSubview:", v11->_subtitleLabel);
    v22 = v11->_subtitleLabel;
    -[CCUIMenuModuleItemView _subtitleFont](v11, "_subtitleFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIEmojiLabelView setFont:](v22, "setFont:", v23);

    -[BSUIEmojiLabelView setUserInteractionEnabled:](v11->_subtitleLabel, "setUserInteractionEnabled:", 0);
    v24 = v11->_subtitleLabel;
    objc_msgSend(v5, "subtitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIEmojiLabelView setText:](v24, "setText:", v25);

    -[BSUIEmojiLabelView setNumberOfLines:](v11->_subtitleLabel, "setNumberOfLines:", 0);
    v11->_separatorVisible = 0;
    v26 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v11->_separatorView;
    v11->_separatorView = v26;

    -[CCUIMenuModuleItemView addSubview:](v11, "addSubview:", v11->_separatorView);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "userInterfaceIdiom");

    if (v29 == 1)
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v11);
      -[CCUIMenuModuleItemView addInteraction:](v11, "addInteraction:", v30);

    }
    objc_opt_self();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (id)-[CCUIMenuModuleItemView registerForTraitChanges:withAction:](v11, "registerForTraitChanges:withAction:", v32, sel__contentSizeCategoryDidChange);

  }
  return v11;
}

- (void)setMenuItem:(id)a3
{
  CCUIMenuModuleItem *v4;
  void *v5;
  void *v6;
  CCUIMenuModuleItem *menuItem;

  v4 = (CCUIMenuModuleItem *)a3;
  -[CCUIMenuModuleItem title](v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleItemView _setTitle:](self, "_setTitle:", v5);

  -[CCUIMenuModuleItem subtitle](v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleItemView _setSubtitle:](self, "_setSubtitle:", v6);

  menuItem = self->_menuItem;
  self->_menuItem = v4;

}

- (void)_setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[CCUIMenuModuleItem title](self->_menuItem, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[BSUIEmojiLabelView setText:](self->_titleLabel, "setText:", v6);
    -[BSUIEmojiLabelView pl_performCrossFadeIfNecessary](self->_titleLabel, "pl_performCrossFadeIfNecessary");
    -[CCUIMenuModuleItemView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

- (void)_setSubtitle:(id)a3
{
  void *v4;
  char v5;
  BSUIEmojiLabelView *subtitleLabel;
  uint64_t v7;
  double v8;
  id v9;

  v9 = a3;
  -[CCUIMenuModuleItem subtitle](self->_menuItem, "subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[BSUIEmojiLabelView setText:](self->_subtitleLabel, "setText:", v9);
    -[BSUIEmojiLabelView pl_performCrossFadeIfNecessary](self->_subtitleLabel, "pl_performCrossFadeIfNecessary");
    -[CCUIMenuModuleItemView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  subtitleLabel = self->_subtitleLabel;
  v7 = objc_msgSend(v9, "length");
  v8 = 1.0;
  if (!v7)
    v8 = 0.0;
  -[BSUIEmojiLabelView setAlpha:](subtitleLabel, "setAlpha:", v8);

}

- (void)setLeadingView:(id)a3
{
  UIView *v5;
  UIView *leadingView;
  UIView *v7;
  UIView *v8;
  _QWORD v9[5];

  v5 = (UIView *)a3;
  leadingView = self->_leadingView;
  if (leadingView != v5)
  {
    v7 = v5;
    if (leadingView)
    {
      -[UIView removeFromSuperview](leadingView, "removeFromSuperview");
      -[CCUIMenuModuleItemView _stopAutomaticallyUpdatingView:recursivelyIfNeeded:](self, "_stopAutomaticallyUpdatingView:recursivelyIfNeeded:", self->_leadingView, 1);
    }
    objc_storeStrong((id *)&self->_leadingView, a3);
    if (v7)
    {
      -[CCUIMenuModuleItemView addSubview:](self, "addSubview:", v7);
      -[CCUIMenuModuleItemView _updateVisualStyleOfView:withStyle:recursivelyIfNeeded:](self, "_updateVisualStyleOfView:withStyle:recursivelyIfNeeded:", v7, 0, 1);
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__CCUIMenuModuleItemView_setLeadingView___block_invoke;
    v9[3] = &unk_1E8E20590;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9, v7);
    v5 = v8;
  }

}

uint64_t __41__CCUIMenuModuleItemView_setLeadingView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutLeadingCustomView");
}

- (void)setTrailingView:(id)a3
{
  UIView *v5;
  UIView *trailingView;
  UIView *v7;
  UIView *v8;
  _QWORD v9[5];

  v5 = (UIView *)a3;
  trailingView = self->_trailingView;
  if (trailingView != v5)
  {
    v7 = v5;
    if (trailingView)
    {
      -[UIView removeFromSuperview](trailingView, "removeFromSuperview");
      -[CCUIMenuModuleItemView _stopAutomaticallyUpdatingView:recursivelyIfNeeded:](self, "_stopAutomaticallyUpdatingView:recursivelyIfNeeded:", self->_trailingView, 1);
    }
    objc_storeStrong((id *)&self->_trailingView, a3);
    if (v7)
    {
      -[CCUIMenuModuleItemView addSubview:](self, "addSubview:", v7);
      -[CCUIMenuModuleItemView _updateVisualStyleOfView:withStyle:recursivelyIfNeeded:](self, "_updateVisualStyleOfView:withStyle:recursivelyIfNeeded:", v7, 0, 1);
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__CCUIMenuModuleItemView_setTrailingView___block_invoke;
    v9[3] = &unk_1E8E20590;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9, v7);
    v5 = v8;
  }

}

uint64_t __42__CCUIMenuModuleItemView_setTrailingView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutTrailingCustomViews");
}

- (void)setShouldLimitContentSizeCategory:(BOOL)a3
{
  if (self->_shouldLimitContentSizeCategory != a3)
  {
    self->_shouldLimitContentSizeCategory = a3;
    -[CCUIMenuModuleItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isEqual:(id)a3
{
  CCUIMenuModuleItemView *v4;
  CCUIMenuModuleItemView *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (CCUIMenuModuleItemView *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CCUIMenuModuleItemView menuItem](self, "menuItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIMenuModuleItemView menuItem](v5, "menuItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = BSEqualObjects();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleItemView menuItem](self, "menuItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = objc_msgSend(v3, "hash");
  return v6;
}

- (id)title
{
  return (id)-[BSUIEmojiLabelView text](self->_titleLabel, "text");
}

- (id)subtitle
{
  return (id)-[BSUIEmojiLabelView text](self->_subtitleLabel, "text");
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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  width = a3.width;
  -[CCUIMenuModuleItemView _labelInsets](self, "_labelInsets", a3.width, a3.height);
  v7 = width - v5 - v6;
  -[CCUIMenuModuleItemView _textHeightForEmojiLabel:width:](self, "_textHeightForEmojiLabel:width:", self->_titleLabel, v7);
  v9 = v8;
  -[CCUIMenuModuleItemView _textHeightForEmojiLabel:width:](self, "_textHeightForEmojiLabel:width:", self->_subtitleLabel, v7);
  v11 = v10;
  -[BSUIEmojiLabelView font](self->_titleLabel, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleItemView _titleBaselineToTop](self, "_titleBaselineToTop");
  objc_msgSend(v12, "_scaledValueForValue:");
  v14 = v11 + v9 + v13;
  -[CCUIMenuModuleItemView _titleBaselineToBottom](self, "_titleBaselineToBottom");
  objc_msgSend(v12, "_scaledValueForValue:");
  v16 = v14 + v15;

  v17 = width;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  CGSize result;

  -[CCUIMenuModuleItemView preferredMaxLayoutWidth](self, "preferredMaxLayoutWidth");
  -[CCUIMenuModuleItemView sizeThatFits:](self, "sizeThatFits:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  BSUIEmojiLabelView *titleLabel;
  void *v4;
  BSUIEmojiLabelView *subtitleLabel;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  uint64_t v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double Width;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  double MaxY;
  double v45;
  double v46;
  double v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v48.receiver = self;
  v48.super_class = (Class)CCUIMenuModuleItemView;
  -[CCUIMenuModuleItemView layoutSubviews](&v48, sel_layoutSubviews);
  titleLabel = self->_titleLabel;
  -[CCUIMenuModuleItemView _titleFont](self, "_titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIEmojiLabelView setFont:](titleLabel, "setFont:", v4);

  subtitleLabel = self->_subtitleLabel;
  -[CCUIMenuModuleItemView _subtitleFont](self, "_subtitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIEmojiLabelView setFont:](subtitleLabel, "setFont:", v6);

  -[CCUIMenuModuleItemView _layoutLeadingCustomView](self, "_layoutLeadingCustomView");
  -[CCUIMenuModuleItemView _layoutTrailingCustomViews](self, "_layoutTrailingCustomViews");
  -[CCUIMenuModuleItemView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  LODWORD(subtitleLabel) = -[CCUIMenuModuleItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CCUIMenuModuleItemView _labelInsets](self, "_labelInsets");
  v16 = v15;
  v18 = v17;
  v49.origin.x = v8;
  v49.origin.y = v10;
  v49.size.width = v12;
  v49.size.height = v14;
  v19 = CGRectGetWidth(v49) - v16 - v18;
  v50.origin.x = v8;
  v50.origin.y = v10;
  v50.size.width = v12;
  v50.size.height = v14;
  -[BSUIEmojiLabelView sizeThatFits:](self->_titleLabel, "sizeThatFits:", v19, CGRectGetHeight(v50));
  v21 = v20;
  v47 = v16;
  if ((_DWORD)subtitleLabel)
  {
    v16 = v18;
    v22 = 2;
  }
  else
  {
    v22 = 0;
  }
  UIRectCenteredYInRect();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[BSUIEmojiLabelView font](self->_titleLabel, "font");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleItemView _titleBaselineToTop](self, "_titleBaselineToTop");
  objc_msgSend(v31, "_scaledValueForValue:");
  v33 = v32;
  -[BSUIEmojiLabelView _firstLineBaselineOffsetFromBoundsTop](self->_titleLabel, "_firstLineBaselineOffsetFromBoundsTop");
  v35 = v33 - v34;

  v51.origin.x = v24;
  v51.origin.y = v26;
  v51.size.width = v28;
  v51.size.height = v30;
  Width = CGRectGetWidth(v51);
  -[BSUIEmojiLabelView text](self->_subtitleLabel, "text");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "length");

  if (v38)
    v39 = Width;
  else
    v39 = v28;
  if (v38)
    v40 = v35;
  else
    v40 = v26;
  if (v38)
    v41 = v16;
  else
    v41 = v24;
  if (v38)
    v42 = v21;
  else
    v42 = v30;
  -[BSUIEmojiLabelView setFrame:](self->_titleLabel, "setFrame:", v41, v40, v39, v42, *(_QWORD *)&v47);
  if (-[CCUIMenuModuleItemView _shouldHorizontallyCenterText](self, "_shouldHorizontallyCenterText"))
    v43 = 1;
  else
    v43 = v22;
  -[BSUIEmojiLabelView setTextAlignment:](self->_titleLabel, "setTextAlignment:", v43);
  v52.origin.x = v16;
  v52.origin.y = v35;
  v52.size.width = Width;
  v52.size.height = v21;
  MaxY = CGRectGetMaxY(v52);
  -[BSUIEmojiLabelView sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v28, v30);
  v46 = v45;
  v53.origin.x = v24;
  v53.origin.y = v26;
  v53.size.width = v28;
  v53.size.height = v30;
  -[BSUIEmojiLabelView setFrame:](self->_subtitleLabel, "setFrame:", v16, MaxY, CGRectGetWidth(v53), v46);
  -[CCUIMenuModuleItemView bounds](self, "bounds");
  CGRectGetHeight(v54);
  -[CCUIMenuModuleItemView _separatorHeight](self, "_separatorHeight");
  -[CCUIMenuModuleItemView bounds](self, "bounds");
  CGRectGetWidth(v55);
  -[CCUIMenuModuleItemView _separatorHeight](self, "_separatorHeight");
  UIRectIntegralWithScale();
  -[UIView setFrame:](self->_separatorView, "setFrame:");
  -[UIView setHidden:](self->_separatorView, "setHidden:", !self->_separatorVisible);
}

- (void)updateSubviewsAlpha:(double)a3
{
  -[BSUIEmojiLabelView setAlpha:](self->_titleLabel, "setAlpha:");
  -[BSUIEmojiLabelView setAlpha:](self->_subtitleLabel, "setAlpha:", a3);
  -[UIView setAlpha:](self->_leadingView, "setAlpha:", a3);
  -[UIView setAlpha:](self->_trailingView, "setAlpha:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleItemView;
  -[CCUIMenuModuleItemView setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[CCUIMenuModuleItemView _updateForStateChange](self, "_updateForStateChange");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleItemView;
  -[CCUIMenuModuleItemView setSelected:](&v4, sel_setSelected_, a3);
  -[CCUIMenuModuleItemView _updateForStateChange](self, "_updateForStateChange");
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleItemView;
  -[CCUIMenuModuleItemView setEnabled:](&v4, sel_setEnabled_, a3);
  -[CCUIMenuModuleItemView _updateForStateChange](self, "_updateForStateChange");
}

- (void)setSeparatorVisible:(BOOL)a3
{
  if (self->_separatorVisible != a3)
  {
    self->_separatorVisible = a3;
    -[CCUIMenuModuleItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIndentation:(unint64_t)a3
{
  if (self->_indentation != a3)
  {
    self->_indentation = a3;
    -[CCUIMenuModuleItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setUseTrailingCheckmarkLayout:(BOOL)a3
{
  if (self->_useTrailingCheckmarkLayout != a3)
  {
    self->_useTrailingCheckmarkLayout = a3;
    -[CCUIMenuModuleItemView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setUseTrailingInset:(BOOL)a3
{
  if (self->_useTrailingInset != a3)
  {
    self->_useTrailingInset = a3;
    -[CCUIMenuModuleItemView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  id v5;

  -[UIView _setContinuousCornerRadius:](self->_highlightedBackgroundView, "_setContinuousCornerRadius:");
  if (a3 > 0.0)
  {
    -[UIView layer](self->_highlightedBackgroundView, "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaskedCorners:", 12);

  }
}

- (void)didMoveToWindow
{
  void *v3;
  MTVisualStylingProvider *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIMenuModuleItemView;
  -[CCUIMenuModuleItemView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[CCUIMenuModuleItemView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CCUIMenuModuleItemView _contentSizeCategoryDidChange](self, "_contentSizeCategoryDidChange");
    -[CCUIMenuModuleItemView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v4 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    if (v4 != self->_visualStylingProvider)
    {
      -[CCUIMenuModuleItemView _stopAutomaticallyUpdatingView:recursivelyIfNeeded:](self, "_stopAutomaticallyUpdatingView:recursivelyIfNeeded:", self->_leadingView, 1);
      -[CCUIMenuModuleItemView _stopAutomaticallyUpdatingView:recursivelyIfNeeded:](self, "_stopAutomaticallyUpdatingView:recursivelyIfNeeded:", self->_trailingView, 1);
      -[CCUIMenuModuleItemView _stopAutomaticallyUpdatingView:recursivelyIfNeeded:](self, "_stopAutomaticallyUpdatingView:recursivelyIfNeeded:", self->_titleLabel, 0);
      -[CCUIMenuModuleItemView _stopAutomaticallyUpdatingView:recursivelyIfNeeded:](self, "_stopAutomaticallyUpdatingView:recursivelyIfNeeded:", self->_subtitleLabel, 0);
      -[CCUIMenuModuleItemView _stopAutomaticallyUpdatingView:recursivelyIfNeeded:](self, "_stopAutomaticallyUpdatingView:recursivelyIfNeeded:", self->_separatorView, 0);
      objc_storeStrong((id *)&self->_visualStylingProvider, v4);
      -[CCUIMenuModuleItemView _updateVisualStyleOfView:withStyle:recursivelyIfNeeded:](self, "_updateVisualStyleOfView:withStyle:recursivelyIfNeeded:", self->_leadingView, 0, 1);
      -[CCUIMenuModuleItemView _updateVisualStyleOfView:withStyle:recursivelyIfNeeded:](self, "_updateVisualStyleOfView:withStyle:recursivelyIfNeeded:", self->_trailingView, 0, 1);
      -[CCUIMenuModuleItemView _updateVisualStyleOfView:withStyle:recursivelyIfNeeded:](self, "_updateVisualStyleOfView:withStyle:recursivelyIfNeeded:", self->_titleLabel, 0, 0);
      -[CCUIMenuModuleItemView _updateVisualStyleOfView:withStyle:recursivelyIfNeeded:](self, "_updateVisualStyleOfView:withStyle:recursivelyIfNeeded:", self->_subtitleLabel, 1, 0);
      -[CCUIMenuModuleItemView _updateVisualStyleOfView:withStyle:recursivelyIfNeeded:](self, "_updateVisualStyleOfView:withStyle:recursivelyIfNeeded:", self->_separatorView, 5, 0);
    }

  }
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend(a3, "locationInView:", self);
  LOBYTE(a3) = -[CCUIMenuModuleItemView pointInside:withEvent:](self, "pointInside:withEvent:", v6);

  return (char)a3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B00], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)_separatorHeight
{
  void *v2;
  NSString *v3;
  double v4;
  void *v5;
  double v6;

  -[CCUIMenuModuleItemView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = 1.0;
  if (!UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v4 = v6;

  }
  return 1.0 / v4;
}

- (id)_titleFont
{
  void *v3;
  void *v4;
  void *v5;

  -[CCUIMenuModuleItemView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_titleFontForContentSizeCategory:shouldLimitContentSizeCategory:", v4, -[CCUIMenuModuleItemView shouldLimitContentSizeCategory](self, "shouldLimitContentSizeCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_subtitleFont
{
  void *v3;
  void *v4;
  void *v5;

  -[CCUIMenuModuleItemView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_subtitleFontForContentSizeCategory:shouldLimitContentSizeCategory:", v4, -[CCUIMenuModuleItemView shouldLimitContentSizeCategory](self, "shouldLimitContentSizeCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_textHeightForEmojiLabel:(id)a3 width:(double)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = a3;
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v5, "sizeThatFits:", a4, 0.0);
    v9 = v8;
    objc_msgSend(v5, "bounds");
    objc_msgSend(v5, "setBounds:");
    objc_msgSend(v5, "_firstLineBaselineOffsetFromBoundsTop");
    v11 = v9 - v10;
    objc_msgSend(v5, "_baselineOffsetFromBottom");
    v13 = v11 - v12;
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (BOOL)_shouldHorizontallyCenterText
{
  BOOL v2;
  void *v4;

  if (self->_leadingView || self->_trailingView || self->_indentation)
    return 0;
  -[BSUIEmojiLabelView text](self->_subtitleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "length") == 0;

  return v2;
}

- (double)_titleBaselineToTop
{
  double result;

  result = 23.0;
  if (!self->_subtitleLabel)
    return 30.0;
  return result;
}

- (double)_titleBaselineToBottom
{
  double result;

  result = 29.0;
  if (!self->_subtitleLabel)
    return 22.0;
  return result;
}

- (double)_labelLeadingInset
{
  double result;

  switch(self->_indentation)
  {
    case 0uLL:
      result = 45.0;
      if (!self->_leadingView)
        result = 0.0;
      break;
    case 1uLL:
      result = 20.0;
      break;
    case 2uLL:
      result = 45.0;
      break;
    case 3uLL:
      result = 64.0;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (double)_labelTrailingInset
{
  double result;

  if (self->_useTrailingInset)
    return 100.0;
  if (!self->_trailingView)
    return 0.0;
  -[CCUIMenuModuleItemView _trailingWidthForCustomViews](self, "_trailingWidthForCustomViews");
  return result;
}

- (double)_trailingWidthForCustomViews
{
  double v3;
  double v4;
  double v5;

  -[CCUIMenuModuleItemView bounds](self, "bounds");
  -[UIView sizeThatFits:](self->_trailingView, "sizeThatFits:", v3, v4);
  return v5 + 20.0 + 20.0;
}

- (NSDirectionalEdgeInsets)_labelInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSDirectionalEdgeInsets result;

  -[CCUIMenuModuleItemView _labelLeadingInset](self, "_labelLeadingInset");
  v4 = v3;
  -[CCUIMenuModuleItemView _labelTrailingInset](self, "_labelTrailingInset");
  v6 = v5;
  v7 = 0.0;
  v8 = 0.0;
  v9 = v4;
  result.trailing = v6;
  result.bottom = v8;
  result.leading = v9;
  result.top = v7;
  return result;
}

- (void)_updateForStateChange
{
  double v3;

  if (-[CCUIMenuModuleItem isPlaceholder](self->_menuItem, "isPlaceholder")
    || (v3 = 1.0, (-[CCUIMenuModuleItemView isHighlighted](self, "isHighlighted") & 1) == 0)
    && (-[CCUIMenuModuleItemView isSelected](self, "isSelected") & 1) == 0)
  {
    v3 = 0.0;
  }
  -[UIView setAlpha:](self->_highlightedBackgroundView, "setAlpha:", v3);
}

- (void)_contentSizeCategoryDidChange
{
  BSUIEmojiLabelView *titleLabel;
  void *v4;
  BSUIEmojiLabelView *subtitleLabel;
  id v6;

  -[CCUIMenuModuleItemView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  titleLabel = self->_titleLabel;
  -[CCUIMenuModuleItemView _titleFont](self, "_titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIEmojiLabelView setFont:](titleLabel, "setFont:", v4);

  subtitleLabel = self->_subtitleLabel;
  -[CCUIMenuModuleItemView _subtitleFont](self, "_subtitleFont");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BSUIEmojiLabelView setFont:](subtitleLabel, "setFont:", v6);

}

- (void)_layoutLeadingCustomView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;
  CGRect v12;

  if (self->_leadingView)
  {
    -[CCUIMenuModuleItemView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIView sizeThatFits:](self->_leadingView, "sizeThatFits:", v7, v9);
    -[CCUIMenuModuleItemView _labelLeadingInset](self, "_labelLeadingInset");
    if (-[CCUIMenuModuleItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v11.origin.x = v4;
      v11.origin.y = v6;
      v11.size.width = v8;
      v11.size.height = v10;
      CGRectGetMaxX(v11);
    }
    v12.origin.x = v4;
    v12.origin.y = v6;
    v12.size.width = v8;
    v12.size.height = v10;
    CGRectGetHeight(v12);
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_leadingView, "setFrame:");
  }
}

- (void)_layoutTrailingCustomViews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;
  CGRect v12;

  if (self->_trailingView)
  {
    -[CCUIMenuModuleItemView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIView sizeThatFits:](self->_trailingView, "sizeThatFits:", v7, v9);
    if (!-[CCUIMenuModuleItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v11.origin.x = v4;
      v11.origin.y = v6;
      v11.size.width = v8;
      v11.size.height = v10;
      CGRectGetMaxX(v11);
    }
    v12.origin.x = v4;
    v12.origin.y = v6;
    v12.size.width = v8;
    v12.size.height = v10;
    CGRectGetHeight(v12);
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_trailingView, "setFrame:");
  }
}

- (void)_updateVisualStyleOfView:(id)a3 withStyle:(int64_t)a4 recursivelyIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v5
    && (objc_msgSend(v8, "subviews"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v9, "subviews", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), a4);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
  else
  {
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", v9, a4);
  }

}

- (void)_stopAutomaticallyUpdatingView:(id)a3 recursivelyIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v4
    && (objc_msgSend(v6, "subviews"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v7, "subviews", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_visualStylingProvider, "stopAutomaticallyUpdatingView:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
  else
  {
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_visualStylingProvider, "stopAutomaticallyUpdatingView:", v7);
  }

}

- (BOOL)separatorVisible
{
  return self->_separatorVisible;
}

- (double)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  self->_preferredMaxLayoutWidth = a3;
}

- (BOOL)useTallLayout
{
  return self->_useTallLayout;
}

- (void)setUseTallLayout:(BOOL)a3
{
  self->_useTallLayout = a3;
}

- (BOOL)useTrailingCheckmarkLayout
{
  return self->_useTrailingCheckmarkLayout;
}

- (BOOL)useTrailingInset
{
  return self->_useTrailingInset;
}

- (unint64_t)indentation
{
  return self->_indentation;
}

- (CCUIMenuModuleItem)menuItem
{
  return self->_menuItem;
}

- (UIView)leadingView
{
  return self->_leadingView;
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (BOOL)shouldLimitContentSizeCategory
{
  return self->_shouldLimitContentSizeCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_menuItem, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
