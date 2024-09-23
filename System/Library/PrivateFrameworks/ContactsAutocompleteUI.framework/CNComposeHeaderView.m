@implementation CNComposeHeaderView

+ (id)os_log
{
  if (os_log_cn_once_token_6 != -1)
    dispatch_once(&os_log_cn_once_token_6, &__block_literal_global_11);
  return (id)os_log_cn_once_object_6;
}

void __29__CNComposeHeaderView_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "headerview");
  v1 = (void *)os_log_cn_once_object_6;
  os_log_cn_once_object_6 = (uint64_t)v0;

}

+ (id)defaultFont
{
  void *v2;
  void *v3;

  +[CNAutocompleteFontMetricCache sharedFontMetricCache](CNAutocompleteFontMetricCache, "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFont:forKey:", &__block_literal_global_14, CFSTR("CNComposeHeaderViewDefaultFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __34__CNComposeHeaderView_defaultFont__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB590], 0x8000, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)supplimentalMessageFont
{
  void *v2;
  void *v3;

  +[CNAutocompleteFontMetricCache sharedFontMetricCache](CNAutocompleteFontMetricCache, "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFont:forKey:", &__block_literal_global_18, CFSTR("CNComposeHeaderViewSupplimentalMessageFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __46__CNComposeHeaderView_supplimentalMessageFont__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB550], 0, 0);
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

  +[CNAutocompleteFontMetricCache sharedFontMetricCache](CNAutocompleteFontMetricCache, "sharedFontMetricCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__CNComposeHeaderView_preferredHeight__block_invoke;
  v7[3] = &__block_descriptor_40_e5_d8__0l;
  v7[4] = a1;
  objc_msgSend(v3, "cachedFloat:forKey:", v7, CFSTR("CNComposeHeaderViewPreferredHeight"));
  v5 = v4;

  return v5;
}

double __38__CNComposeHeaderView_preferredHeight__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  objc_msgSend(*(id *)(a1 + 32), "defaultFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    objc_msgSend(v2, "capHeight");
    v7 = v6;
    objc_msgSend(v2, "lineHeight");
    v9 = v7 + v8;
  }
  else
  {
    objc_msgSend(v2, "ascender");
    objc_msgSend(v2, "capHeight");
    objc_msgSend(*(id *)(a1 + 32), "_labelTopPaddingSpecification");
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    UIFloorToScale();

    objc_msgSend(v2, "_bodyLeading");
    objc_msgSend(*(id *)(a1 + 32), "defaultFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_bodyLeading");

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToScreenScale();
    *(float *)&v13 = v13;
    v9 = roundf(*(float *)&v13);

  }
  return v9;
}

+ (double)separatorHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
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

  +[CNAutocompleteFontMetricCache sharedFontMetricCache](CNAutocompleteFontMetricCache, "sharedFontMetricCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CNComposeHeaderView__labelTopPaddingSpecification__block_invoke;
  v7[3] = &__block_descriptor_40_e5_d8__0l;
  v7[4] = a1;
  objc_msgSend(v3, "cachedFloat:forKey:", v7, CFSTR("CNComposeHeaderViewLabelTopPaddingSpec"));
  v5 = v4;

  return v5;
}

double __52__CNComposeHeaderView__labelTopPaddingSpecification__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;

  objc_msgSend(*(id *)(a1 + 32), "defaultFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineHeight");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "defaultFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "defaultFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descender");
  v10 = v7 + v9;
  objc_msgSend(*(id *)(a1 + 32), "defaultFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "xHeight");
  v13 = v4 - (v10 + v12 * 0.5);

  objc_msgSend(*(id *)(a1 + 32), "defaultFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_bodyLeading");
  v16 = v15 - v13;

  return floor(v16);
}

+ (id)defaultSeparatorColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
}

- (double)labelTopPadding
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    -[CNComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
    return v6;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_labelTopPaddingSpecification");
    v9 = v8;
    -[CNComposeHeaderView labelView](self, "labelView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_capOffsetFromBoundsTop");
    v7 = v9 - v11;

  }
  return v7;
}

- (id)labelColor
{
  void *v2;
  void *v3;

  -[CNComposeHeaderView labelView](self, "labelView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNComposeHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  CNComposeHeaderView *v5;
  void *v6;
  double *v7;
  double v8;
  double v9;
  uint64_t v10;
  UIView *separator;
  UIView *v12;
  void *v13;
  CNComposeHeaderLabelView *v14;
  CNComposeHeaderLabelView *labelView;
  CNComposeHeaderLabelView *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  v19.receiver = self;
  v19.super_class = (Class)CNComposeHeaderView;
  v5 = -[CNComposeHeaderView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeHeaderView setBackgroundColor:](v5, "setBackgroundColor:", v6);
    -[CNComposeHeaderView setPreservesSuperviewLayoutMargins:](v5, "setPreservesSuperviewLayoutMargins:", 1);
    -[CNComposeHeaderView setInsetsLayoutMarginsFromSafeArea:](v5, "setInsetsLayoutMarginsFromSafeArea:", 0);
    v7 = (double *)MEMORY[0x1E0C9D648];
    v8 = *MEMORY[0x1E0C9D648];
    +[CNComposeHeaderView separatorHeight](CNComposeHeaderView, "separatorHeight");
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v8, height - v9, width, v9);
    separator = v5->_separator;
    v5->_separator = (UIView *)v10;

    -[UIView setAutoresizingMask:](v5->_separator, "setAutoresizingMask:", 2);
    v12 = v5->_separator;
    +[CNComposeHeaderView defaultSeparatorColor](CNComposeHeaderView, "defaultSeparatorColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[CNComposeHeaderView addSubview:](v5, "addSubview:", v5->_separator);
    v14 = -[CNComposeHeaderLabelView initWithFrame:]([CNComposeHeaderLabelView alloc], "initWithFrame:", v8, v7[1], v7[2], v7[3]);
    labelView = v5->_labelView;
    v5->_labelView = v14;

    -[CNComposeHeaderLabelView setAutoresizingMask:](v5->_labelView, "setAutoresizingMask:", 0);
    v16 = v5->_labelView;
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeHeaderLabelView setFont:](v16, "setFont:", v17);

    -[CNComposeHeaderLabelView sizeToFit](v5->_labelView, "sizeToFit");
    -[CNComposeHeaderView addSubview:](v5, "addSubview:", v5->_labelView);

  }
  return v5;
}

- (void)setLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[CNComposeHeaderView labelView](self, "labelView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v4);

    -[CNComposeHeaderView labelView](self, "labelView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeToFit");

  }
}

- (NSString)label
{
  void *v2;
  void *v3;

  -[CNComposeHeaderView labelView](self, "labelView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)createComposeFieldInfoLabelIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CNComposeHeaderView setComposeFieldInfoLabel:](self, "setComposeFieldInfoLabel:", v5);

    -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 3);

    -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);

    objc_msgSend((id)objc_opt_class(), "supplimentalMessageFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v11);

  }
}

- (void)setComposeFieldInfoText:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *composeFieldInfoText;
  NSString *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  CNComposeHeaderView *v34;
  void *v35;
  void *v36;
  CNComposeHeaderView *v37;
  double v38;
  NSString *v39;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_composeFieldInfoText != v4)
  {
    v39 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v39;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v39, "copy");
      composeFieldInfoText = self->_composeFieldInfoText;
      self->_composeFieldInfoText = v7;

      if (v39 && -[NSString length](v39, "length"))
      {
        -[CNComposeHeaderView createComposeFieldInfoLabelIfNeeded](self, "createComposeFieldInfoLabelIfNeeded");
        v9 = self->_composeFieldInfoText;
        -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setText:", v9);

        -[CNComposeHeaderView _contentRect](self, "_contentRect");
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        -[CNComposeHeaderView labelView](self, "labelView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "frame");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;

        -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bounds");
        v38 = v29;

        -[CNComposeHeaderView layoutComposeFieldInfoLabelWithContentRect:labelRect:](self, "layoutComposeFieldInfoLabelWithContentRect:labelRect:", v12, v14, v16, v18, v21, v23, v25, v27);
        -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "bounds");
        v32 = v31;

        -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "superview");
        v34 = (CNComposeHeaderView *)objc_claimAutoreleasedReturnValue();

        if (v34 == self)
        {
          v5 = v39;
          if (v38 == v32)
            goto LABEL_11;
          goto LABEL_10;
        }
        -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNComposeHeaderView addSubview:](self, "addSubview:", v35);
LABEL_9:

LABEL_10:
        -[CNComposeHeaderView _notifyDelegateOfSizeChange](self, "_notifyDelegateOfSizeChange", *(_QWORD *)&v38);
        v5 = v39;
        goto LABEL_11;
      }
      -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "superview");
      v37 = (CNComposeHeaderView *)objc_claimAutoreleasedReturnValue();

      v5 = v39;
      if (v37 == self)
      {
        -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "removeFromSuperview");
        goto LABEL_9;
      }
    }
  }
LABEL_11:

}

- (void)layoutComposeFieldInfoLabelWithContentRect:(CGRect)a3 labelRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double MinX;
  double MaxY;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeHeaderView bounds](self, "bounds");
  objc_msgSend(v9, "sizeThatFits:", v10, 1.79769313e308);
  v12 = v11;

  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MinX = CGRectGetMinX(v23);
  -[CNComposeHeaderView bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v24);
  objc_msgSend((id)objc_opt_class(), "separatorHeight");
  v16 = MaxY - (v12 + v15 + 5.0);
  -[CNComposeHeaderView bounds](self, "bounds");
  v17 = CGRectGetWidth(v25) + MinX * -2.0;
  -[CNComposeHeaderView separatorDirectionalEdgeInsets](self, "separatorDirectionalEdgeInsets");
  v19 = v17 - v18;
  -[CNComposeHeaderView separatorDirectionalEdgeInsets](self, "separatorDirectionalEdgeInsets");
  v21 = v19 - v20;
  -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", MinX, v16, v21, v12);

}

- (void)layoutSubviews
{
  int v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double Width;
  double v23;
  double v24;
  double v25;
  double MinX;
  double MaxX;
  double v28;
  void *v29;
  void *v30;
  CNComposeHeaderView *v31;
  void *v32;
  double v33;
  double v34;
  double Height;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  CGRect recta;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v3 = -[CNComposeHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CNComposeHeaderView _contentRect](self, "_contentRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CNComposeHeaderView labelView](self, "labelView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;

  -[CNComposeHeaderView labelView](self, "labelView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeThatFits:", v9, v11);
  v19 = v18;
  v21 = v20;

  recta.origin.x = v5;
  v49.origin.x = v5;
  v49.origin.y = v7;
  v49.size.width = v9;
  v49.size.height = v11;
  Width = CGRectGetWidth(v49);
  v50.origin.x = v14;
  v50.origin.y = v16;
  v50.size.width = v19;
  v50.size.height = v21;
  v23 = fmin(CGRectGetWidth(v50), Width);
  -[CNComposeHeaderView labelTopPadding](self, "labelTopPadding");
  v25 = v24;
  if (-[CNComposeHeaderView _shouldEmbedLabelInTextView](self, "_shouldEmbedLabelInTextView"))
  {
    MinX = 0.0;
    if (!v3)
      goto LABEL_8;
    v51.origin.x = recta.origin.x;
    v51.origin.y = v7;
    v51.size.width = v9;
    v51.size.height = v11;
    MaxX = CGRectGetWidth(v51);
    goto LABEL_6;
  }
  if ((v3 & 1) != 0)
  {
    v52.origin.x = recta.origin.x;
    v52.origin.y = v7;
    v52.size.width = v9;
    v52.size.height = v11;
    MaxX = CGRectGetMaxX(v52);
LABEL_6:
    v28 = MaxX;
    v53.origin.x = v14;
    v53.origin.y = v25;
    v53.size.width = v23;
    v53.size.height = v21;
    MinX = v28 - CGRectGetWidth(v53);
    goto LABEL_8;
  }
  v54.origin.x = recta.origin.x;
  v54.origin.y = v7;
  v54.size.width = v9;
  v54.size.height = v11;
  MinX = CGRectGetMinX(v54);
LABEL_8:
  -[CNComposeHeaderView labelView](self, "labelView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", MinX, v25, v23, v21);

  -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "superview");
  v31 = (CNComposeHeaderView *)objc_claimAutoreleasedReturnValue();

  if (v31 == self)
    -[CNComposeHeaderView layoutComposeFieldInfoLabelWithContentRect:labelRect:](self, "layoutComposeFieldInfoLabelWithContentRect:labelRect:", recta.origin.x, v7, v9, v11, MinX, v25, v23, v21);
  -[CNComposeHeaderView separator](self, "separator");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  v34 = v33;

  -[CNComposeHeaderView frame](self, "frame");
  Height = CGRectGetHeight(v55);
  objc_msgSend((id)objc_opt_class(), "separatorHeight");
  v37 = v36;
  -[CNComposeHeaderView separatorDirectionalEdgeInsets](self, "separatorDirectionalEdgeInsets");
  if (v3)
    v40 = v39;
  else
    v40 = v38;
  v41 = Height - v37;
  -[CNComposeHeaderView bounds](self, "bounds");
  v42 = CGRectGetWidth(v56);
  -[CNComposeHeaderView separatorDirectionalEdgeInsets](self, "separatorDirectionalEdgeInsets");
  v44 = v42 - v43;
  -[CNComposeHeaderView separatorDirectionalEdgeInsets](self, "separatorDirectionalEdgeInsets");
  v46 = v44 - v45;
  -[CNComposeHeaderView separator](self, "separator");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v40, v41, v46, v34);

  *(_QWORD *)&recta.origin.y = self;
  *(_QWORD *)&recta.size.width = CNComposeHeaderView;
  -[CGFloat layoutSubviews]((objc_super *)&recta.origin.y, sel_layoutSubviews);
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNComposeHeaderView;
  -[CNComposeHeaderView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[CNComposeHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (id)headerViewDelegates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[CNComposeHeaderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[CNComposeHeaderView internalDelegate](self, "internalDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return v4;
  }
  -[CNComposeHeaderView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNComposeHeaderView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[CNComposeHeaderView internalDelegate](self, "internalDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CNComposeHeaderView internalDelegate](self, "internalDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObject:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  return v4;
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
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  -[CNComposeHeaderView overrideContentMargins](self, "overrideContentMargins");
  if (v6 == *(double *)(MEMORY[0x1E0CEB4B0] + 8)
    && v3 == *MEMORY[0x1E0CEB4B0]
    && v5 == *(double *)(MEMORY[0x1E0CEB4B0] + 24)
    && v4 == *(double *)(MEMORY[0x1E0CEB4B0] + 16))
  {
    -[CNComposeHeaderView layoutMargins](self, "layoutMargins");
    -[CNComposeHeaderView traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "displayScale");
    UIRoundToScale();
    v13 = v19;

    -[CNComposeHeaderView traitCollection](self, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayScale");
    UIRoundToScale();
    v17 = v21;

    v15 = 0.0;
    v11 = 0.0;
  }
  else
  {
    -[CNComposeHeaderView overrideContentMargins](self, "overrideContentMargins");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
  }
  -[CNComposeHeaderView bounds](self, "bounds");
  v23 = v13 + v22;
  v25 = v11 + v24;
  v27 = v26 - (v17 + v13);
  v29 = v28 - (v15 + v11);
  result.size.height = v29;
  result.size.width = v27;
  result.origin.y = v25;
  result.origin.x = v23;
  return result;
}

- (double)_additionalContentHeight
{
  void *v3;
  CNComposeHeaderView *v4;
  double v5;
  void *v6;
  double v7;

  -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (CNComposeHeaderView *)objc_claimAutoreleasedReturnValue();

  v5 = 0.0;
  if (v4 == self)
  {
    -[CNComposeHeaderView composeFieldInfoLabel](self, "composeFieldInfoLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v5 = v7;

  }
  return v5;
}

- (CGRect)titleLabelBaselineAlignmentRectForLabel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double MaxY;
  double Height;
  void *v33;
  double v34;
  double v35;
  double v36;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat rect;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect result;

  v4 = a3;
  -[CNComposeHeaderView labelView](self, "labelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutSubviews");

  -[CNComposeHeaderView labelView](self, "labelView");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "frame");
  v45 = v7;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  LOBYTE(v6) = -[CNComposeHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CNComposeHeaderView _contentRect](self, "_contentRect");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v4, "frame");
  rect = v22;
  objc_msgSend(v4, "frame");
  v24 = v23;
  v47.origin.x = v15;
  v47.origin.y = v17;
  v47.size.width = v19;
  v47.size.height = v21;
  v25 = fmax(fmin(v24, CGRectGetWidth(v47) + -6.0 - v11), 0.0);
  v26 = v45;
  v27 = v9;
  v28 = v11;
  v29 = v13;
  if ((v6 & 1) != 0)
    v30 = CGRectGetMinX(*(CGRect *)&v26) + -6.0 - v25;
  else
    v30 = CGRectGetMaxX(*(CGRect *)&v26) + 6.0;
  v48.origin.x = v45;
  v48.origin.y = v9;
  v48.size.width = v11;
  v48.size.height = v13;
  MaxY = CGRectGetMaxY(v48);
  objc_msgSend(v4, "frame");
  Height = CGRectGetHeight(v49);
  -[CNComposeHeaderView labelView](self, "labelView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_baselineOffsetFromBottom");
  v35 = v34;

  objc_msgSend(v4, "_baselineOffsetFromBottom");
  v50.origin.y = MaxY - v35 - (Height - v36);
  v50.origin.x = v30;
  v50.size.width = v25;
  v50.size.height = rect;
  v51 = CGRectIntegral(v50);
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  v40 = v51.size.height;

  v41 = x;
  v42 = y;
  v43 = width;
  v44 = v40;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (BOOL)_canBecomeFirstResponder
{
  return 0;
}

- (void)handleTouchesEnded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[CNComposeHeaderView _canBecomeFirstResponder](self, "_canBecomeFirstResponder"))
  {
    -[CNComposeHeaderView becomeFirstResponder](self, "becomeFirstResponder");
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[CNComposeHeaderView headerViewDelegates](self, "headerViewDelegates", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v8, "composeHeaderViewClicked:", self);
            goto LABEL_13;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNComposeHeaderView;
  -[CNComposeHeaderView touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  if (-[CNComposeHeaderView showsHighlightWhenTouched](self, "showsHighlightWhenTouched"))
    -[CNComposeHeaderView setHighlighted:animated:](self, "setHighlighted:animated:", 1, 0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[CNComposeHeaderView handleTouchesEnded](self, "handleTouchesEnded", a3, a4);
  if (-[CNComposeHeaderView showsHighlightWhenTouched](self, "showsHighlightWhenTouched"))
    -[CNComposeHeaderView setHighlighted:animated:](self, "setHighlighted:animated:", 0, 1);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNComposeHeaderView;
  -[CNComposeHeaderView touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  if (-[CNComposeHeaderView showsHighlightWhenTouched](self, "showsHighlightWhenTouched"))
    -[CNComposeHeaderView setHighlighted:animated:](self, "setHighlighted:animated:", 0, 1);
}

- (id)_highlightedBackgroundView
{
  UIView *highlightedBackgroundView;
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

  highlightedBackgroundView = self->_highlightedBackgroundView;
  if (!highlightedBackgroundView)
  {
    -[CNComposeHeaderView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10 + -1.0;
    objc_msgSend((id)objc_opt_class(), "separatorHeight");
    v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v11, v7, v9 + v12);
    v14 = self->_highlightedBackgroundView;
    self->_highlightedBackgroundView = v13;

    -[UIView setAutoresizingMask:](self->_highlightedBackgroundView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.85, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_highlightedBackgroundView, "setBackgroundColor:", v15);

    highlightedBackgroundView = self->_highlightedBackgroundView;
  }
  return highlightedBackgroundView;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD, _QWORD);
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;

  v4 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__CNComposeHeaderView_setHighlighted_animated___block_invoke;
  v12[3] = &unk_1E62BFBB8;
  v13 = a3;
  v12[4] = self;
  v8 = (void (**)(_QWORD))MEMORY[0x1B5E16810](v12, a2);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __47__CNComposeHeaderView_setHighlighted_animated___block_invoke_2;
  v10[3] = &unk_1E62BFD10;
  v11 = a3;
  v10[4] = self;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E16810](v10);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v8, v9, 0.3);
  }
  else
  {
    v8[2](v8);
    v9[2](v9, 1);
  }

}

void __47__CNComposeHeaderView_setHighlighted_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  id v6;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "highlightedBackgroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "separator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "insertSubview:aboveSubview:", v3, v4);

    if (*(_BYTE *)(a1 + 40))
      v5 = 1.0;
    else
      v5 = 0.0;
  }
  else
  {
    v5 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "highlightedBackgroundView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

}

void __47__CNComposeHeaderView_setHighlighted_animated___block_invoke_2(uint64_t a1)
{
  id v1;

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "highlightedBackgroundView");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeFromSuperview");

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)refreshPreferredContentSize
{
  void *v3;
  void *v4;
  void *v5;

  +[CNAutocompleteFontMetricCache sharedFontMetricCache](CNAutocompleteFontMetricCache, "sharedFontMetricCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ensureCacheIsValid");

  -[CNComposeHeaderView labelView](self, "labelView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  -[CNComposeHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_baseAttributes
{
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v3, "_bodyLeading");
  objc_msgSend(v4, "setLineSpacing:", v5 * 0.55);
  -[CNComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  objc_msgSend(v4, "setHeadIndent:", v6);
  if (-[CNComposeHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    objc_msgSend(v4, "setBaseWritingDirection:", 1);
  v11[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = *MEMORY[0x1E0DC1178];
  v12[1] = v8;
  v12[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UIEdgeInsets)_recipientViewEdgeInsets
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
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
  CGRect v24;
  UIEdgeInsets result;

  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  objc_msgSend(v3, "ascender");
  -[CNComposeHeaderView labelView](self, "labelView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  CGRectGetMaxY(v24);
  -[CNComposeHeaderView labelView](self, "labelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_baselineOffsetFromBottom");

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (IsAccessibilityCategory)
  {
    objc_msgSend(v3, "capHeight");
    v12 = round(v11 * 0.5);
    objc_msgSend(v3, "capHeight");
    v14 = v13 * 0.5;
  }
  else
  {
    UIFloorToViewScale();
    v12 = v15;
    objc_msgSend((id)objc_opt_class(), "preferredHeight");
    v17 = v16;
    objc_msgSend(v3, "_bodyLeading");
    v14 = v17 - (v12 + v18);
  }
  v19 = round(v14);

  v20 = v12;
  v21 = v4;
  v22 = v19;
  v23 = v5;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
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
  CNComposeHeaderView *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double Width;
  double v25;
  double v26;
  double MaxY;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat rect;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  v6 = a3;
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "superview");
  v15 = (CNComposeHeaderView *)objc_claimAutoreleasedReturnValue();

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
  v21 = *MEMORY[0x1E0C9D648];
  if (a4 == 2)
  {
    v38.origin.x = v8;
    v38.origin.y = v10;
    v38.size.width = v12;
    v38.size.height = v14;
    v22 = CGRectGetMaxX(v38) + 5.0;
  }
  else
  {
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    if (a4 == 8)
    {
      rect = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v35.origin.x = v8;
      v35.origin.y = v10;
      v35.size.width = v12;
      v35.size.height = v14;
      v21 = CGRectGetMinX(v35) + -5.0;
      -[CNComposeHeaderView bounds](self, "bounds");
      Width = CGRectGetWidth(v36);
      v37.origin.x = v21;
      v37.origin.y = v23;
      v37.size.width = v22;
      v37.size.height = rect;
      v22 = Width - CGRectGetMinX(v37);
    }
  }
  -[CNComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  v26 = v25;
  v39.origin.x = v8;
  v39.origin.y = v10;
  v39.size.width = v12;
  v39.size.height = v14;
  MaxY = CGRectGetMaxY(v39);
  -[CNComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  v29 = MaxY - v28;

  v30 = v21;
  v31 = v26;
  v32 = v22;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (NSString)navTitle
{
  return self->_navTitle;
}

- (void)setNavTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (CNComposeHeaderLabelView)labelView
{
  return self->_labelView;
}

- (void)setLabelView:(id)a3
{
  objc_storeStrong((id *)&self->_labelView, a3);
}

- (BOOL)showsHighlightWhenTouched
{
  return self->_showsHighlightWhenTouched;
}

- (void)setShowsHighlightWhenTouched:(BOOL)a3
{
  self->_showsHighlightWhenTouched = a3;
}

- (CNComposeHeaderViewDelegate)delegate
{
  return (CNComposeHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)composeFieldInfoText
{
  return self->_composeFieldInfoText;
}

- (NSDirectionalEdgeInsets)separatorDirectionalEdgeInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_separatorDirectionalEdgeInsets.top;
  leading = self->_separatorDirectionalEdgeInsets.leading;
  bottom = self->_separatorDirectionalEdgeInsets.bottom;
  trailing = self->_separatorDirectionalEdgeInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setSeparatorDirectionalEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  self->_separatorDirectionalEdgeInsets = a3;
}

- (UIEdgeInsets)overrideContentMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_overrideContentMargins.top;
  left = self->_overrideContentMargins.left;
  bottom = self->_overrideContentMargins.bottom;
  right = self->_overrideContentMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setOverrideContentMargins:(UIEdgeInsets)a3
{
  self->_overrideContentMargins = a3;
}

- (CNComposeHeaderViewDelegate)internalDelegate
{
  return (CNComposeHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_internalDelegate);
}

- (void)setInternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_internalDelegate, a3);
}

- (UILabel)composeFieldInfoLabel
{
  return self->_composeFieldInfoLabel;
}

- (void)setComposeFieldInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_composeFieldInfoLabel, a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (UIView)highlightedBackgroundView
{
  return self->_highlightedBackgroundView;
}

- (void)setHighlightedBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_composeFieldInfoLabel, 0);
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_composeFieldInfoText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_navTitle, 0);
}

- (id)_automationID
{
  void *v3;
  void *v4;
  void *v5;

  -[CNComposeHeaderView label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[CNComposeHeaderView label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("BTN "), "stringByAppendingString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(CFSTR("BTN "), "stringByAppendingString:", CFSTR("NoLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
