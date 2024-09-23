@implementation MFComposeMultiView

- (MFComposeMultiView)initWithFrame:(CGRect)a3
{
  MFComposeMultiView *v3;
  MFComposeMultiView *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFComposeMultiView;
  v3 = -[MFComposeMultiView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFComposeMultiView setShowsHighlightWhenTouched:](v3, "setShowsHighlightWhenTouched:", 1);
    v5 = objc_alloc_init(MEMORY[0x1E0CD1210]);
    objc_msgSend(v5, "setDelegate:", v4);
    objc_msgSend(v5, "setElementSource:", v4);
    -[MFComposeMultiView addInteraction:](v4, "addInteraction:", v5);

  }
  return v4;
}

- (id)accountLabel
{
  MFActivityIndicatorLabel *accountLabel;
  MFActivityIndicatorLabel *v4;
  MFActivityIndicatorLabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  accountLabel = self->_accountLabel;
  if (!accountLabel)
  {
    v4 = objc_alloc_init(MFActivityIndicatorLabel);
    v5 = self->_accountLabel;
    self->_accountLabel = v4;

    -[MFComposeMultiView bounds](self, "bounds");
    -[MFActivityIndicatorLabel setFrame:](self->_accountLabel, "setFrame:");
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFActivityIndicatorLabel textLabel](self->_accountLabel, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    -[MFComposeMultiView labelColor](self, "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFActivityIndicatorLabel textLabel](self->_accountLabel, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    -[MFActivityIndicatorLabel sizeToFit](self->_accountLabel, "sizeToFit");
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceLayoutDirection");

    if (v11 == 1)
    {
      -[MFActivityIndicatorLabel textLabel](self->_accountLabel, "textLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextAlignment:", 2);

    }
    -[MFComposeMultiView addSubview:](self, "addSubview:", self->_accountLabel);
    v13 = (void *)MEMORY[0x1E0CB3718];
    -[MFComposeMultiView labelView](self, "labelView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFActivityIndicatorLabel leadingAnchor](self->_accountLabel, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", 6.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    -[MFActivityIndicatorLabel textLabel](self->_accountLabel, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstBaselineAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeMultiView labelView](self, "labelView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstBaselineAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateConstraints:", v20);

    accountLabel = self->_accountLabel;
  }
  return accountLabel;
}

- (id)imageSizeLabel
{
  UILabel *imageSizeLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;

  imageSizeLabel = self->_imageSizeLabel;
  if (!imageSizeLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_imageSizeLabel;
    self->_imageSizeLabel = v5;

    v7 = self->_imageSizeLabel;
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = self->_imageSizeLabel;
    -[MFComposeMultiView labelColor](self, "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[UILabel setAlpha:](self->_imageSizeLabel, "setAlpha:", 0.0);
    -[UILabel sizeToFit](self->_imageSizeLabel, "sizeToFit");
    -[UILabel setAccessibilityIdentifier:](self->_imageSizeLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B30]);
    -[MFComposeMultiView addSubview:](self, "addSubview:", self->_imageSizeLabel);
    imageSizeLabel = self->_imageSizeLabel;
  }
  return imageSizeLabel;
}

- (id)placeholderImageSizeLabel
{
  UILabel *placeholderImageSizeLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;

  placeholderImageSizeLabel = self->_placeholderImageSizeLabel;
  if (!placeholderImageSizeLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_placeholderImageSizeLabel;
    self->_placeholderImageSizeLabel = v5;

    v7 = self->_placeholderImageSizeLabel;
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = self->_placeholderImageSizeLabel;
    -[MFComposeMultiView labelColor](self, "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    v11 = self->_placeholderImageSizeLabel;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("IMAGE_SIZE_PLACEHOLDER_DURING_COMPUTATION"), &stru_1E5A6A588, CFSTR("Main"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v11, "setText:", v13);

    -[UILabel setAlpha:](self->_placeholderImageSizeLabel, "setAlpha:", 0.0);
    -[UILabel sizeToFit](self->_placeholderImageSizeLabel, "sizeToFit");
    -[MFComposeMultiView addSubview:](self, "addSubview:", self->_placeholderImageSizeLabel);
    placeholderImageSizeLabel = self->_placeholderImageSizeLabel;
  }
  return placeholderImageSizeLabel;
}

- (id)imageSizeHeaderLabelView
{
  CNComposeHeaderLabelView *imageSizeHeaderLabelView;
  CNComposeHeaderLabelView *v4;
  CNComposeHeaderLabelView *v5;
  CNComposeHeaderLabelView *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  imageSizeHeaderLabelView = self->_imageSizeHeaderLabelView;
  if (!imageSizeHeaderLabelView)
  {
    v4 = (CNComposeHeaderLabelView *)objc_alloc_init(MEMORY[0x1E0D13678]);
    v5 = self->_imageSizeHeaderLabelView;
    self->_imageSizeHeaderLabelView = v4;

    v6 = self->_imageSizeHeaderLabelView;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("IMAGE_RESIZING_BAR_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeHeaderLabelView setText:](v6, "setText:", v8);

    -[CNComposeHeaderLabelView setAlpha:](self->_imageSizeHeaderLabelView, "setAlpha:", 0.0);
    -[CNComposeHeaderLabelView sizeToFit](self->_imageSizeHeaderLabelView, "sizeToFit");
    -[CNComposeHeaderLabelView frame](self->_imageSizeHeaderLabelView, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[MFComposeMultiView frame](self, "frame");
    -[CNComposeHeaderLabelView setFrame:](self->_imageSizeHeaderLabelView, "setFrame:", v15, v10, v12, v14);
    -[MFComposeMultiView addSubview:](self, "addSubview:", self->_imageSizeHeaderLabelView);
    imageSizeHeaderLabelView = self->_imageSizeHeaderLabelView;
  }
  return imageSizeHeaderLabelView;
}

- (id)_accountDescriptionAttributedString
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!-[NSString length](self->_accountDescription, "length"))
    return 0;
  v7 = *MEMORY[0x1E0DC1140];
  if (self->_accountHasUnsafeDomain)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  else
    -[MFComposeMultiView labelColor](self, "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", self->_accountDescription, v5);
  return v6;
}

- (void)setAccountHasUnsafeDomain:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_accountHasUnsafeDomain != a3)
  {
    self->_accountHasUnsafeDomain = a3;
    -[MFComposeMultiView accountLabel](self, "accountLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeMultiView _accountDescriptionAttributedString](self, "_accountDescriptionAttributedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttributedText:", v5);

  }
}

- (void)setAccountDescription:(id)a3
{
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;

  v5 = (NSString *)a3;
  if (self->_accountDescription != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_accountDescription, a3);
    -[MFComposeMultiView accountLabel](self, "accountLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeMultiView _accountDescriptionAttributedString](self, "_accountDescriptionAttributedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v8);

    v5 = v9;
  }

}

- (void)setImageSizeDescription:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFComposeMultiView imageSizeLabel](self, "imageSizeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

}

- (void)setShowsImageSize:(BOOL)a3
{
  self->_imageSizeShown = a3;
}

- (void)showLoadingState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[MFComposeMultiView accountLabel](self, "accountLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "startAnimating");
  else
    objc_msgSend(v4, "stopAnimating");

}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double (**v27)(_QWORD, double, double);
  void *v28;
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
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CNComposeHeaderLabelView *imageSizeHeaderLabelView;
  double v57;
  double v58;
  _QWORD aBlock[5];
  BOOL v60;
  objc_super v61;

  v61.receiver = self;
  v61.super_class = (Class)MFComposeMultiView;
  -[MFComposeMultiView layoutSubviews](&v61, sel_layoutSubviews);
  v3 = -[MFComposeMultiView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[MFActivityIndicatorLabel sizeToFit](self->_accountLabel, "sizeToFit");
  -[MFActivityIndicatorLabel frame](self->_accountLabel, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MFComposeMultiView labelView](self, "labelView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;

  v17 = v16 + v14 + 6.0;
  if (v3 == 1)
  {
    v17 = v5;
    v18 = v14 + -6.0;
  }
  else
  {
    v18 = v9;
  }
  -[MFActivityIndicatorLabel setFrame:](self->_accountLabel, "setFrame:", v17, v7, v18, v11);
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad") & 1) != 0)
  {
    if (self->_imageSizeShown)
    {
      -[UILabel text](self->_imageSizeLabel, "text");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[MFComposeMultiView imageSizeHeaderLabelView](self, "imageSizeHeaderLabelView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAlpha:", 1.0);

      -[MFComposeMultiView imageSizeLabel](self, "imageSizeLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v19)
        v23 = 1.0;
      else
        v23 = 0.0;
      objc_msgSend(v21, "setAlpha:", v23);

      -[MFComposeMultiView placeholderImageSizeLabel](self, "placeholderImageSizeLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = 1.0;
      if (v19)
        v26 = 0.0;
      objc_msgSend(v24, "setAlpha:", v26);

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __36__MFComposeMultiView_layoutSubviews__block_invoke;
      aBlock[3] = &unk_1E5A65DB0;
      v60 = v3 == 1;
      aBlock[4] = self;
      v27 = (double (**)(_QWORD, double, double))_Block_copy(aBlock);
      -[UILabel sizeToFit](self->_imageSizeLabel, "sizeToFit");
      -[MFComposeMultiView labelView](self, "labelView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "frame");
      v30 = v29;
      v32 = v31;

      -[UILabel frame](self->_imageSizeLabel, "frame");
      v34 = v33;
      v36 = v35;
      v37 = v27[2](v27, v30, v32);
      -[UILabel setFrame:](self->_imageSizeLabel, "setFrame:", v37, v32, v34, v36);
      -[UILabel sizeToFit](self->_placeholderImageSizeLabel, "sizeToFit");
      v57 = v36;
      v58 = v34;
      -[UILabel frame](self->_imageSizeLabel, "frame");
      v39 = v38;
      v41 = v40;
      -[UILabel frame](self->_placeholderImageSizeLabel, "frame");
      v43 = v42;
      v45 = v44;
      v46 = v27[2](v27, v39, v41);
      -[UILabel setFrame:](self->_placeholderImageSizeLabel, "setFrame:", v46, v41, v43, v45);
      -[CNComposeHeaderLabelView frame](self->_imageSizeHeaderLabelView, "frame");
      v48 = v47;
      v50 = v49;
      if (v19)
      {
        v51 = v37;
      }
      else
      {
        v32 = v41;
        v51 = v46;
      }
      if (v3 == 1)
      {
        if (v19)
          v52 = v58;
        else
          v52 = v43;
        if (v19)
          v53 = v57;
        else
          v53 = v45;
        v54 = v32;
        v55 = CGRectGetMaxX(*(CGRect *)&v51) + 6.0;
      }
      else
      {
        v55 = v51 + -6.0 - v47;
      }
      -[CNComposeHeaderLabelView setFrame:](self->_imageSizeHeaderLabelView, "setFrame:", v55, v32, v48, v50);

    }
    else
    {
      imageSizeHeaderLabelView = self->_imageSizeHeaderLabelView;
      if (imageSizeHeaderLabelView)
      {
        -[CNComposeHeaderLabelView setAlpha:](imageSizeHeaderLabelView, "setAlpha:", 0.0);
        -[UILabel setAlpha:](self->_imageSizeLabel, "setAlpha:", 0.0);
        -[UILabel setAlpha:](self->_placeholderImageSizeLabel, "setAlpha:", 0.0);
      }
    }
  }
}

double __36__MFComposeMultiView_layoutSubviews__block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  CGRect v6;
  CGRect v7;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_contentRect");
    return CGRectGetMinX(v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_contentRect");
    return CGRectGetMaxX(v7) - a4;
  }
}

- (void)refreshPreferredContentSize
{
  void *v3;
  MFActivityIndicatorLabel *accountLabel;
  void *v5;
  UILabel *imageSizeLabel;
  UILabel *placeholderImageSizeLabel;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFComposeMultiView;
  -[MFComposeMultiView refreshPreferredContentSize](&v8, sel_refreshPreferredContentSize);
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accountLabel = self->_accountLabel;
  if (accountLabel)
  {
    -[MFActivityIndicatorLabel textLabel](accountLabel, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v3);

  }
  imageSizeLabel = self->_imageSizeLabel;
  if (imageSizeLabel)
    -[UILabel setFont:](imageSizeLabel, "setFont:", v3);
  placeholderImageSizeLabel = self->_placeholderImageSizeLabel;
  if (placeholderImageSizeLabel)
    -[UILabel setFont:](placeholderImageSizeLabel, "setFont:", v3);
  -[MFComposeMultiView setNeedsLayout](self, "setNeedsLayout");

}

- (id)labelColor
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  if (self->_accountAutoselected)
  {
    v2 = (void *)labelColor_autoselectedColor;
    if (!labelColor_autoselectedColor)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "mailSenderAddressPickerColorNormalTextColor");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)labelColor_autoselectedColor;
      labelColor_autoselectedColor = v3;

      v2 = (void *)labelColor_autoselectedColor;
    }
    return v2;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MFComposeMultiView;
    -[MFComposeMultiView labelColor](&v6, sel_labelColor);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)setAccountAutoselected:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_accountAutoselected != a3)
  {
    self->_accountAutoselected = a3;
    -[MFActivityIndicatorLabel textLabel](self->_accountLabel, "textLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[MFComposeMultiView labelColor](self, "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

  }
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return 1;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  void (**v6)(id, void *, uint64_t);
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, uint64_t))a5;
  -[MFComposeMultiView label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8, 0x7FFFFFFFFFFFFFFFLL);

}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a6;
  -[MFComposeMultiView scribbleDelegate](self, "scribbleDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipientTextViewForComposeMultiView:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "becomeFirstResponder");
  objc_msgSend(v8, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v9);

}

- (BOOL)accountHasUnsafeDomain
{
  return self->_accountHasUnsafeDomain;
}

- (BOOL)isAccountAutoselected
{
  return self->_accountAutoselected;
}

- (MFComposeMultiViewDelegate)scribbleDelegate
{
  return (MFComposeMultiViewDelegate *)objc_loadWeakRetained((id *)&self->_scribbleDelegate);
}

- (void)setScribbleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scribbleDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scribbleDelegate);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_placeholderImageSizeLabel, 0);
  objc_storeStrong((id *)&self->_imageSizeLabel, 0);
  objc_storeStrong((id *)&self->_imageSizeHeaderLabelView, 0);
  objc_storeStrong((id *)&self->_accountLabel, 0);
}

@end
