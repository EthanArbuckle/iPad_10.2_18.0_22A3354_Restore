@implementation MFComposeHeaderView

+ (id)defaultFont
{
  void *v2;
  void *v3;

  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFont:forKey:", &__block_literal_global_7, CFSTR("MFComposeHeaderViewDefaultFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __34__MFComposeHeaderView_defaultFont__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0x8000, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (double)preferredHeight
{
  void *v3;
  double v4;
  double v5;
  _QWORD v7[5];

  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFComposeHeaderView_preferredHeight__block_invoke;
  v7[3] = &__block_descriptor_40_e5_d8__0l;
  v7[4] = a1;
  objc_msgSend(v3, "cachedFloat:forKey:", v7, CFSTR("MFComposeHeaderViewPreferredHeight"));
  v5 = v4;

  return v5;
}

double __38__MFComposeHeaderView_preferredHeight__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;

  objc_msgSend(*(id *)(a1 + 32), "defaultFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    objc_msgSend(v2, "capHeight");
    v4 = v3;
    objc_msgSend(v2, "lineHeight");
    v6 = v4 + v5;
  }
  else
  {
    objc_msgSend(v2, "ascender");
    objc_msgSend(v2, "capHeight");
    objc_msgSend(*(id *)(a1 + 32), "_labelTopPaddingSpecification");
    objc_msgSend(v2, "_bodyLeading");
    objc_msgSend(*(id *)(a1 + 32), "defaultFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_bodyLeading");

    objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale();
    v6 = v9;

  }
  return v6;
}

+ (double)separatorHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return 1.0 / v4;
}

+ (double)_labelTopPaddingSpecification
{
  void *v3;
  double v4;
  double v5;
  _QWORD v7[5];

  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__MFComposeHeaderView__labelTopPaddingSpecification__block_invoke;
  v7[3] = &__block_descriptor_40_e5_d8__0l;
  v7[4] = a1;
  objc_msgSend(v3, "cachedFloat:forKey:", v7, CFSTR("MFComposeHeaderViewLabelTopPaddingSpec"));
  v5 = v4;

  return v5;
}

double __52__MFComposeHeaderView__labelTopPaddingSpecification__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "defaultFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_bodyLeading");
  v3 = v2 * 0.89;

  return v3;
}

+ (id)defaultSeparatorColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
}

- (double)labelTopPadding
{
  double result;
  double v4;
  double v5;
  double v6;

  if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    -[MFComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_labelTopPaddingSpecification");
    v5 = v4;
    -[MFHeaderLabelView _capOffsetFromBoundsTop](self->_labelView, "_capOffsetFromBoundsTop");
    return v5 - v6;
  }
  return result;
}

- (id)labelColor
{
  return -[MFHeaderLabelView effectiveTextColor](self->_labelView, "effectiveTextColor");
}

- (MFComposeHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  MFComposeHeaderView *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  double *v10;
  double v11;
  uint64_t v12;
  UIView *separator;
  UIView *v14;
  void *v15;
  MFHeaderLabelView *v16;
  MFHeaderLabelView *labelView;
  MFHeaderLabelView *v18;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  v21.receiver = self;
  v21.super_class = (Class)MFComposeHeaderView;
  v5 = -[MFComposeHeaderView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailComposeHeaderBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeHeaderView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[MFComposeHeaderView setPreservesSuperviewLayoutMargins:](v5, "setPreservesSuperviewLayoutMargins:", 1);
    -[MFComposeHeaderView setInsetsLayoutMarginsFromSafeArea:](v5, "setInsetsLayoutMarginsFromSafeArea:", 0);
    +[MFComposeHeaderView separatorHeight](MFComposeHeaderView, "separatorHeight");
    v8 = v7;
    v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v10 = (double *)MEMORY[0x1E0C9D648];
    v11 = *MEMORY[0x1E0C9D648];
    v12 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], height - v8, width, v8);
    separator = v5->_separator;
    v5->_separator = (UIView *)v12;

    -[UIView setAutoresizingMask:](v5->_separator, "setAutoresizingMask:", 2);
    v14 = v5->_separator;
    +[MFComposeHeaderView defaultSeparatorColor](MFComposeHeaderView, "defaultSeparatorColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[MFComposeHeaderView addSubview:](v5, "addSubview:", v5->_separator);
    v16 = -[MFHeaderLabelView initWithFrame:]([MFHeaderLabelView alloc], "initWithFrame:", v11, v10[1], v10[2], v10[3]);
    labelView = v5->_labelView;
    v5->_labelView = v16;

    -[MFHeaderLabelView setAutoresizingMask:](v5->_labelView, "setAutoresizingMask:", 0);
    v18 = v5->_labelView;
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFHeaderLabelView setFont:](v18, "setFont:", v19);

    -[MFHeaderLabelView sizeToFit](v5->_labelView, "sizeToFit");
    -[MFComposeHeaderView addSubview:](v5, "addSubview:", v5->_labelView);
  }
  return v5;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MFComposeHeaderView frame](self, "frame");
  if (width != v9 || height != v8)
    -[MFComposeHeaderView setNeedsLayout](self, "setNeedsLayout");
  v11.receiver = self;
  v11.super_class = (Class)MFComposeHeaderView;
  -[MFComposeHeaderView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MFComposeHeaderView bounds](self, "bounds");
  if (width != v9 || height != v8)
    -[MFComposeHeaderView setNeedsLayout](self, "setNeedsLayout");
  v11.receiver = self;
  v11.super_class = (Class)MFComposeHeaderView;
  -[MFComposeHeaderView setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setLabel:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    -[MFHeaderLabelView setText:](self->_labelView, "setText:", v4);
    -[MFHeaderLabelView sizeToFit](self->_labelView, "sizeToFit");
  }

}

- (NSString)label
{
  return (NSString *)-[MFHeaderLabelView text](self->_labelView, "text");
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double Width;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double MaxX;
  double v28;
  CGFloat v29;
  CGFloat MinX;
  MFHeaderLabelView *labelView;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double Height;
  double v41;
  double v42;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v3 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  -[MFComposeHeaderView _contentRect](self, "_contentRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MFHeaderLabelView sizeToFit](self->_labelView, "sizeToFit");
  -[MFHeaderLabelView frame](self->_labelView, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  rect_8 = v5;
  v48.origin.x = v5;
  rect_24 = v7;
  v48.origin.y = v7;
  v20 = v9;
  v48.size.width = v9;
  v48.size.height = v11;
  Width = CGRectGetWidth(v48);
  rect = v13;
  v49.origin.x = v13;
  v49.origin.y = v15;
  v49.size.width = v17;
  rect_16 = v19;
  v49.size.height = v19;
  v22 = fmin(CGRectGetWidth(v49), Width);
  -[MFComposeHeaderView labelTopPadding](self, "labelTopPadding");
  v24 = v23;
  if (-[MFComposeHeaderView _shouldEmbedLabelInTextView](self, "_shouldEmbedLabelInTextView"))
  {
    if (!v3)
    {
      MinX = 0.0;
      v26 = rect_24;
      v25 = rect_8;
      v29 = v19;
      goto LABEL_9;
    }
    v25 = rect_8;
    v50.origin.x = rect_8;
    v26 = rect_24;
    v50.origin.y = rect_24;
    v50.size.width = v9;
    v50.size.height = v11;
    MaxX = CGRectGetWidth(v50);
  }
  else
  {
    if (!v3)
    {
      v25 = rect_8;
      v53.origin.x = rect_8;
      v26 = rect_24;
      v53.origin.y = rect_24;
      v53.size.width = v9;
      v53.size.height = v11;
      MinX = CGRectGetMinX(v53);
      v29 = v19;
      goto LABEL_9;
    }
    v25 = rect_8;
    v51.origin.x = rect_8;
    v26 = rect_24;
    v51.origin.y = rect_24;
    v51.size.width = v9;
    v51.size.height = v11;
    MaxX = CGRectGetMaxX(v51);
  }
  v28 = MaxX;
  v52.origin.x = rect;
  v52.origin.y = v24;
  v52.size.width = v22;
  v29 = rect_16;
  v52.size.height = rect_16;
  MinX = v28 - CGRectGetWidth(v52);
LABEL_9:
  labelView = self->_labelView;
  v32 = v24;
  v33 = v22;
  v34 = v29;
  v54 = CGRectIntegral(*(CGRect *)&MinX);
  -[MFHeaderLabelView setFrame:](labelView, "setFrame:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
  -[MFComposeHeaderView directionalLayoutMargins](self, "directionalLayoutMargins");
  v36 = v35;
  -[UIView frame](self->_separator, "frame");
  v38 = v37;
  v55.origin.x = v25;
  v55.origin.y = v26;
  v55.size.width = v20;
  v55.size.height = v11;
  v39 = CGRectGetMinX(v55);
  -[MFComposeHeaderView frame](self, "frame");
  Height = CGRectGetHeight(v56);
  v57.origin.x = v25;
  v57.origin.y = v26;
  v57.size.width = v20;
  v57.size.height = v11;
  v41 = CGRectGetWidth(v57);
  if (v36 <= 30.0)
  {
    -[MFComposeHeaderView directionalLayoutMargins](self, "directionalLayoutMargins");
    v41 = v41 + v42;
    if (-[MFComposeHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      v39 = 0.0;
  }
  -[UIView setFrame:](self->_separator, "setFrame:", v39, Height + -1.0, v41, v38, *(_QWORD *)&rect);
  v47.receiver = self;
  v47.super_class = (Class)MFComposeHeaderView;
  -[MFComposeHeaderView layoutSubviews](&v47, sel_layoutSubviews);
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFComposeHeaderView;
  -[MFComposeHeaderView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[MFComposeHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_shouldEmbedLabelInTextView
{
  return 0;
}

- (CGRect)_contentRect
{
  double v3;
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
  CGRect result;

  -[MFComposeHeaderView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  -[MFComposeHeaderView bounds](self, "bounds");
  v9 = v4 + v8;
  v11 = v10 + 0.0;
  v13 = v12 - (v4 + v6);
  result.size.height = v7;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v9;
  return result;
}

- (CGRect)titleLabelBaselineAlignmentRectForLabel:(id)a3
{
  id v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double MaxY;
  double Height;
  double v32;
  double v33;
  double v34;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat rect;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect result;

  v4 = a3;
  -[MFHeaderLabelView layoutSubviews](self->_labelView, "layoutSubviews");
  -[MFHeaderLabelView frame](self->_labelView, "frame");
  rect = v5;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  -[MFComposeHeaderView _contentRect](self, "_contentRect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v4, "frame");
  v43 = v21;
  objc_msgSend(v4, "frame");
  v23 = v22;
  v45.origin.x = v14;
  v45.origin.y = v16;
  v45.size.width = v18;
  v45.size.height = v20;
  v24 = fmax(fmin(v23, CGRectGetWidth(v45) + -6.0 - v9), 0.0);
  v25 = rect;
  v26 = v7;
  v27 = v9;
  v28 = v11;
  if (v12 == 1)
    v29 = CGRectGetMinX(*(CGRect *)&v25) + -6.0 - v24;
  else
    v29 = CGRectGetMaxX(*(CGRect *)&v25) + 6.0;
  v46.origin.x = rect;
  v46.origin.y = v7;
  v46.size.width = v9;
  v46.size.height = v11;
  MaxY = CGRectGetMaxY(v46);
  objc_msgSend(v4, "frame");
  Height = CGRectGetHeight(v47);
  -[MFHeaderLabelView _baselineOffsetFromBottom](self->_labelView, "_baselineOffsetFromBottom");
  v33 = v32;
  objc_msgSend(v4, "_baselineOffsetFromBottom");
  v48.origin.y = MaxY - v33 - (Height - v34);
  v48.origin.x = v29;
  v48.size.width = v24;
  v48.size.height = v43;
  v49 = CGRectIntegral(v48);
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  v38 = v49.size.height;

  v39 = x;
  v40 = y;
  v41 = width;
  v42 = v38;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (BOOL)_canBecomeFirstResponder
{
  return 0;
}

- (void)handleTouchesEnded
{
  id WeakRetained;

  if (-[MFComposeHeaderView _canBecomeFirstResponder](self, "_canBecomeFirstResponder"))
  {
    -[MFComposeHeaderView becomeFirstResponder](self, "becomeFirstResponder");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "composeHeaderViewClicked:", self);

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)MFComposeHeaderView;
  -[MFComposeHeaderView touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v6, v7);
  if (-[MFComposeHeaderView showsHighlightWhenTouched](self, "showsHighlightWhenTouched"))
    -[MFComposeHeaderView setHighlighted:animated:](self, "setHighlighted:animated:", 1, 0);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[MFComposeHeaderView handleTouchesEnded](self, "handleTouchesEnded", a3, a4);
  if (-[MFComposeHeaderView showsHighlightWhenTouched](self, "showsHighlightWhenTouched"))
    -[MFComposeHeaderView setHighlighted:animated:](self, "setHighlighted:animated:", 0, 1);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)MFComposeHeaderView;
  -[MFComposeHeaderView touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_, v6, v7);
  if (-[MFComposeHeaderView showsHighlightWhenTouched](self, "showsHighlightWhenTouched"))
    -[MFComposeHeaderView setHighlighted:animated:](self, "setHighlighted:animated:", 0, 1);

}

- (id)_highlightedBackgroundView
{
  UIView *highlightBackgroundView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  UIView *v14;
  void *v15;

  highlightBackgroundView = self->_highlightBackgroundView;
  if (!highlightBackgroundView)
  {
    -[MFComposeHeaderView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10 + -1.0;
    objc_msgSend((id)objc_opt_class(), "separatorHeight");
    v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v11, v7, v9 + v12);
    v14 = self->_highlightBackgroundView;
    self->_highlightBackgroundView = v13;

    -[UIView setAutoresizingMask:](self->_highlightBackgroundView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_highlightBackgroundView, "setBackgroundColor:", v15);

    highlightBackgroundView = self->_highlightBackgroundView;
  }
  return highlightBackgroundView;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(void *, uint64_t);
  _QWORD v10[5];
  BOOL v11;
  _QWORD aBlock[5];
  BOOL v13;

  v4 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__MFComposeHeaderView_setHighlighted_animated___block_invoke;
  aBlock[3] = &unk_1E5A65D00;
  v13 = a3;
  aBlock[4] = self;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __47__MFComposeHeaderView_setHighlighted_animated___block_invoke_2;
  v10[3] = &unk_1E5A65D28;
  v11 = a3;
  v10[4] = self;
  v9 = (void (**)(void *, uint64_t))_Block_copy(v10);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v8, v9, 0.3);
  }
  else
  {
    v8[2](v8);
    v9[2](v9, 1);
  }

}

void __47__MFComposeHeaderView_setHighlighted_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;
  id v5;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "_highlightedBackgroundView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "insertSubview:above:");

    if (*(_BYTE *)(a1 + 40))
      v3 = 1.0;
    else
      v3 = 0.0;
  }
  else
  {
    v3 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_highlightedBackgroundView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v3);

}

void __47__MFComposeHeaderView_setHighlighted_animated___block_invoke_2(uint64_t a1)
{
  id v1;

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_highlightedBackgroundView");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeFromSuperview");

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)refreshPreferredContentSize
{
  void *v3;
  MFHeaderLabelView *labelView;
  void *v5;

  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ensureCacheIsValid");

  labelView = self->_labelView;
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFHeaderLabelView setFont:](labelView, "setFont:", v5);

  -[MFComposeHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_baseAttributes
{
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v3, "_bodyLeading");
  objc_msgSend(v4, "setLineSpacing:", v5 * 0.55);
  -[MFComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  objc_msgSend(v4, "setHeadIndent:", v6);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceLayoutDirection");

  if (v8 == 1)
    objc_msgSend(v4, "setBaseWritingDirection:", 1);
  v12[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = *MEMORY[0x1E0DC1178];
  v13[0] = v9;
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UIEdgeInsets)_recipientViewEdgeInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double MaxY;
  double v9;
  double v10;
  double v11;
  double v12;
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
  CGRect v25;
  UIEdgeInsets result;

  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capHeight");
  v5 = v4;
  objc_msgSend(v3, "descender");
  v7 = v6;
  -[MFHeaderLabelView frame](self->_labelView, "frame");
  MaxY = CGRectGetMaxY(v25);
  -[MFHeaderLabelView _baselineOffsetFromBottom](self->_labelView, "_baselineOffsetFromBottom");
  v10 = v9;
  if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    objc_msgSend(v3, "capHeight");
    v12 = round(v11 * 0.5);
  }
  else
  {
    v12 = floor(MaxY - v10 - (v5 - v7));
  }
  if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    objc_msgSend(v3, "capHeight");
    v14 = v13 * 0.5;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "preferredHeight");
    v16 = v15;
    objc_msgSend(v3, "_bodyLeading");
    v14 = v16 - v12 - v17;
  }
  v18 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v19 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v20 = round(v14);

  v21 = v12;
  v22 = v18;
  v23 = v20;
  v24 = v19;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (CGRect)_exclusionRectForView:(id)a3 alongEdge:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  MFComposeHeaderView *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double MinX;
  double Width;
  double v27;
  double v28;
  double MaxY;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  v6 = a3;
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "superview");
  v15 = (MFComposeHeaderView *)objc_claimAutoreleasedReturnValue();

  if (v15 != self)
  {
    objc_msgSend(v6, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "convertRect:toView:", self, v8, v10, v12, v14);
    v8 = v17;
    v10 = v18;
    v12 = v19;
    v14 = v20;

  }
  v21 = MEMORY[0x1E0C9D648];
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  if (a4 == 8)
  {
    v37.origin.x = v8;
    v37.origin.y = v10;
    v37.size.width = v12;
    v37.size.height = v14;
    MinX = CGRectGetMinX(v37);
    -[MFComposeHeaderView bounds](self, "bounds");
    Width = CGRectGetWidth(v38);
    v39.size.height = *(CGFloat *)(v21 + 24);
    v24 = MinX + -5.0;
    v39.origin.x = v24;
    v39.origin.y = v22;
    v39.size.width = v23;
    v23 = Width - CGRectGetMinX(v39);
  }
  else
  {
    v24 = *MEMORY[0x1E0C9D648];
    if (a4 == 2)
    {
      v36.origin.x = v8;
      v36.origin.y = v10;
      v36.size.width = v12;
      v36.size.height = v14;
      v23 = CGRectGetMaxX(v36) + 5.0;
    }
  }
  -[MFComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  v28 = v27;
  v40.origin.x = v8;
  v40.origin.y = v10;
  v40.size.width = v12;
  v40.size.height = v14;
  MaxY = CGRectGetMaxY(v40);
  -[MFComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  v31 = MaxY - v30;

  v32 = v24;
  v33 = v22 - v28;
  v34 = v23;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (NSString)navTitle
{
  return self->_navTitle;
}

- (void)setNavTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (MFHeaderLabelView)labelView
{
  return self->_labelView;
}

- (BOOL)showsHighlightWhenTouched
{
  return self->_showsHighlightWhenTouched;
}

- (void)setShowsHighlightWhenTouched:(BOOL)a3
{
  self->_showsHighlightWhenTouched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navTitle, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundView, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_destroyWeak(&self->_delegate);
}

- (id)_automationID
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;

  -[MFComposeHeaderView label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    -[MFComposeHeaderView label](self, "label");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("NoLabel");
  }
  objc_msgSend(CFSTR("BTN "), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)

  return v6;
}

@end
