@implementation MFMailComposeNavigationBarTitleView

+ (EFLazyCache)attributedStringsCache
{
  if (attributedStringsCache_onceToken_0 != -1)
    dispatch_once(&attributedStringsCache_onceToken_0, &__block_literal_global_22);
  return (EFLazyCache *)(id)attributedStringsCache_sAttributedStringsCache_0;
}

void __61__MFMailComposeNavigationBarTitleView_attributedStringsCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EED8]), "initWithCountLimit:", 10);
  v1 = (void *)attributedStringsCache_sAttributedStringsCache_0;
  attributedStringsCache_sAttributedStringsCache_0 = v0;

}

- (MFMailComposeNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  MFMailComposeNavigationBarTitleView *v3;
  MFMailComposeNavigationBarTitleView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UILabel *titleLabel;
  void *v12;
  void *v13;
  uint64_t v14;
  UILabel *subtitleLabel;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MFMailComposeNavigationBarTitleView;
  v3 = -[_UINavigationBarTitleView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFMailComposeNavigationBarTitleView setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
    -[MFMailComposeNavigationBarTitleView setInsetsLayoutMarginsFromSafeArea:](v4, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[_UINavigationBarTitleView setPreferredContentAlignment:](v4, "setPreferredContentAlignment:", 2);
    v4->_style = 0;
    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v10;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v4->_titleLabel, "setBackgroundColor:", v12);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v13);

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    -[MFMailComposeNavigationBarTitleView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v14;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v4->_subtitleLabel, "setBackgroundColor:", v16);

    -[MFMailComposeNavigationBarTitleView _subtitleTextColor](v4, "_subtitleTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v17);

    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 1);
    -[MFMailComposeNavigationBarTitleView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
  }
  return v4;
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_titleLabel, "setText:", v6);
    -[MFMailComposeNavigationBarTitleView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  -[MFMailComposeNavigationBarTitleView setSubtitle:withStyle:](self, "setSubtitle:withStyle:", a3, 0);
}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3 withStyle:(unint64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  UILabel *subtitleLabel;
  id v12;
  _QWORD v13[4];
  id v14;
  unint64_t v15;

  v12 = a3;
  -[UILabel text](self->_subtitleLabel, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v12);

  if ((v7 & 1) == 0)
  {
    if (_os_feature_enabled_impl())
    {
      objc_msgSend((id)objc_opt_class(), "attributedStringsCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __61__MFMailComposeNavigationBarTitleView_setSubtitle_withStyle___block_invoke;
      v13[3] = &unk_1E5A68B58;
      v15 = a4;
      v9 = v12;
      v14 = v9;
      objc_msgSend(v8, "objectForKey:generator:", v9, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      subtitleLabel = self->_subtitleLabel;
      if (v10)
      {
        -[UILabel setAttributedText:](subtitleLabel, "setAttributedText:", v10);
      }
      else
      {
        -[UILabel setAttributedText:](subtitleLabel, "setAttributedText:", 0);
        -[UILabel setText:](self->_subtitleLabel, "setText:", v9);
      }

    }
    else
    {
      -[UILabel setText:](self->_subtitleLabel, "setText:", v12);
    }
    -[_UINavigationBarTitleView setHideStandardTitle:](self, "setHideStandardTitle:", -[MFMailComposeNavigationBarTitleView _needsToLayoutTitleLabel](self, "_needsToLayoutTitleLabel"));
    -[MFMailComposeNavigationBarTitleView setNeedsLayout](self, "setNeedsLayout");
  }
  if (self->_style != a4)
  {
    self->_style = a4;
    -[MFMailComposeNavigationBarTitleView setNeedsLayout](self, "setNeedsLayout");
  }

}

id __61__MFMailComposeNavigationBarTitleView_setSubtitle_withStyle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CFString **v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == 1)
  {
    v3 = MFImageGlyphLock;
  }
  else
  {
    if (v2 != 3)
    {
LABEL_7:
      v9 = 0;
      return v9;
    }
    v3 = MFImageGlyphSigned;
  }
  v4 = *v3;
  if (!v4)
    goto LABEL_7;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0DC12B0];
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", v4, 13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textAttachmentWithImage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  objc_msgSend(v9, "insertAttributedString:atIndex:", v10, 0);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertAttributedString:atIndex:", v11, 0);

  return v9;
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeNavigationBarTitleView;
  -[MFMailComposeNavigationBarTitleView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[MFMailComposeNavigationBarTitleView setNeedsLayout](self, "setNeedsLayout");
}

- (void)contentDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeNavigationBarTitleView;
  -[_UINavigationBarTitleView contentDidChange](&v3, sel_contentDidChange);
  -[_UINavigationBarTitleView setHideStandardTitle:](self, "setHideStandardTitle:", -[MFMailComposeNavigationBarTitleView _needsToLayoutTitleLabel](self, "_needsToLayoutTitleLabel"));
  -[MFMailComposeNavigationBarTitleView _updateTrailingBarButtonItemsAlpha](self, "_updateTrailingBarButtonItemsAlpha");
  -[MFMailComposeNavigationBarTitleView setNeedsLayout](self, "setNeedsLayout");
}

- (UIEdgeInsets)_contentInsetsWithExclusionRects:(id)a3 wantsUniformHorizontalInsets:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CGFloat MaxX;
  id v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  uint64_t i;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double MinX;
  double *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double MidX;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  UIEdgeInsets result;
  CGRect v55;
  CGRect v56;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MFMailComposeNavigationBarTitleView bounds](self, "bounds");
  MaxX = CGRectGetMaxX(v44);
  -[MFMailComposeNavigationBarTitleView bounds](self, "bounds");
  MidX = CGRectGetMidX(v45);
  v37 = MaxX;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (v9)
  {
    v14 = *(_QWORD *)v39;
    v35 = 0.0;
    v36 = 0.0;
    v34 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "CGRectValue");
        x = v46.origin.x;
        y = v46.origin.y;
        width = v46.size.width;
        height = v46.size.height;
        if (CGRectGetMaxX(v46) >= MidX)
        {
          v49.origin.y = v36;
          v49.origin.x = v37;
          v49.size.height = v34;
          v49.size.width = v35;
          v56.origin.x = x;
          v56.origin.y = y;
          v56.size.width = width;
          v56.size.height = height;
          v50 = CGRectUnion(v49, v56);
          v36 = v50.origin.y;
          v37 = v50.origin.x;
          v34 = v50.size.height;
          v35 = v50.size.width;
        }
        else
        {
          v47.origin.x = v10;
          v47.origin.y = v11;
          v47.size.width = v13;
          v47.size.height = v12;
          v55.origin.x = x;
          v55.origin.y = y;
          v55.size.width = width;
          v55.size.height = height;
          v48 = CGRectUnion(v47, v55);
          v10 = v48.origin.x;
          v11 = v48.origin.y;
          v13 = v48.size.width;
          v12 = v48.size.height;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v9);
  }
  else
  {
    v35 = 0.0;
    v36 = 0.0;
    v34 = 0.0;
  }

  v51.origin.x = v10;
  v51.origin.y = v11;
  v51.size.width = v13;
  v51.size.height = v12;
  v20 = CGRectGetMaxX(v51);
  -[MFMailComposeNavigationBarTitleView bounds](self, "bounds");
  v21 = CGRectGetWidth(v52);
  v53.origin.y = v36;
  v53.origin.x = v37;
  v53.size.height = v34;
  v53.size.width = v35;
  MinX = CGRectGetMinX(v53);
  v23 = (double *)MEMORY[0x1E0DC49E8];
  v24 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  if (v24 < v20)
    v24 = v20;
  v25 = v21 - MinX;
  if (*(double *)(MEMORY[0x1E0DC49E8] + 24) >= v25)
    v25 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (v24 >= v25)
    v26 = v24;
  else
    v26 = v25;
  if (v4)
    v27 = v26;
  else
    v27 = v24;
  if (v4)
    v28 = v26;
  else
    v28 = v25;

  v29 = *v23;
  v30 = v23[2];
  v31 = v27;
  v32 = v28;
  result.right = v32;
  result.bottom = v30;
  result.left = v31;
  result.top = v29;
  return result;
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  void *v4;
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
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  float v42;
  double v43;
  double v44;
  _BOOL8 v45;
  float v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double MaxY;
  double v52;
  float v53;
  objc_super v54;
  CGRect v55;

  v54.receiver = self;
  v54.super_class = (Class)MFMailComposeNavigationBarTitleView;
  -[MFMailComposeNavigationBarTitleView layoutSubviews](&v54, sel_layoutSubviews);
  v3 = -[MFMailComposeNavigationBarTitleView _needsToLayoutTitleLabel](self, "_needsToLayoutTitleLabel");
  -[_UINavigationBarTitleView contentOverlayRects](self, "contentOverlayRects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeNavigationBarTitleView _contentInsetsWithExclusionRects:wantsUniformHorizontalInsets:](self, "_contentInsetsWithExclusionRects:wantsUniformHorizontalInsets:", v4, 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[UILabel setLayoutMargins:](self->_titleLabel, "setLayoutMargins:", v6, v8, v10, v12);
  -[UILabel setLayoutMargins:](self->_subtitleLabel, "setLayoutMargins:", v6, v8, v10, v12);
  -[MFMailComposeNavigationBarTitleView bounds](self, "bounds");
  v15 = v14;
  v16 = v13;
  if (v3)
  {
    v17 = (void *)MEMORY[0x1E0DC1350];
    -[MFMailComposeNavigationBarTitleView _titleFontSizeWhenMini:](self, "_titleFontSizeWhenMini:", v13 <= 32.0);
    objc_msgSend(v17, "boldSystemFontOfSize:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v18);

    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98], 32.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeNavigationBarTitleView _subtitleFontSizeWhenMini:](self, "_subtitleFontSizeWhenMini:", v16 <= 32.0);
  objc_msgSend(v19, "fontWithSize:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v20);

  -[MFMailComposeNavigationBarTitleView _subtitleTextColor](self, "_subtitleTextColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v21);

  -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
  -[UILabel layoutMargins](self->_titleLabel, "layoutMargins");
  v23 = v22;
  -[UILabel layoutMargins](self->_titleLabel, "layoutMargins");
  if (v3)
  {
    v25 = v15 - (v23 + v24 + 5.0 + 6.0);
    -[UILabel frame](self->_titleLabel, "frame", 32.0);
    v27 = v26;
    -[MFMailComposeNavigationBarTitleView _verticalOffsetForSubtitleWhenMini:](self, "_verticalOffsetForSubtitleWhenMini:", v16 <= 32.0);
    v29 = v28 + v27;
    -[UILabel frame](self->_subtitleLabel, "frame");
    v31 = v29 + v30;
    -[UILabel frame](self->_titleLabel, "frame");
    v34 = v33;
    if (v32 >= v25)
    {
      -[UILabel layoutMargins](self->_titleLabel, "layoutMargins");
      v36 = v44 + 5.0;
    }
    else
    {
      v35 = (v15 - v32) * 0.5;
      v36 = floorf(v35);
      v25 = v32;
    }
    v45 = v16 <= 32.0;
    v46 = (v16 - v31) * 0.5;
    v47 = floorf(v46);
    -[MFMailComposeNavigationBarTitleView _topPaddingForTitleWhenMini:](self, "_topPaddingForTitleWhenMini:", v45);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v36, v48 + v47, v25, v34);
    -[UILabel frame](self->_subtitleLabel, "frame");
    v38 = v49;
    v40 = v50;
    -[UILabel frame](self->_titleLabel, "frame");
    MaxY = CGRectGetMaxY(v55);
    -[MFMailComposeNavigationBarTitleView _verticalOffsetForSubtitleWhenMini:](self, "_verticalOffsetForSubtitleWhenMini:", v45);
    v43 = MaxY + v52;
  }
  else
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UILabel frame](self->_subtitleLabel, "frame");
    v38 = v37;
    v40 = v39;
    -[UILabel frame](self->_subtitleLabel, "frame");
    v42 = (v16 - v41) * 0.5;
    v43 = floorf(v42);
  }
  v53 = (v15 - v38) * 0.5;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", floorf(v53), v43, v38, v40);
}

- (void)_updateTrailingBarButtonItemsAlpha
{
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[5];
  _QWORD v8[5];

  -[_UINavigationBarTitleView largeTitleHeight](self, "largeTitleHeight");
  if (v3 <= 16.0 && (-[_UINavigationBarTitleView trailingBarAlpha](self, "trailingBarAlpha"), v4 == 0.0))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__MFMailComposeNavigationBarTitleView__updateTrailingBarButtonItemsAlpha__block_invoke;
    v8[3] = &unk_1E5A65480;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v8, 0, 0.2, 0.0);
  }
  else
  {
    -[_UINavigationBarTitleView largeTitleHeight](self, "largeTitleHeight");
    if (v5 > 16.0)
    {
      -[_UINavigationBarTitleView trailingBarAlpha](self, "trailingBarAlpha");
      if (v6 == 1.0)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __73__MFMailComposeNavigationBarTitleView__updateTrailingBarButtonItemsAlpha__block_invoke_2;
        v7[3] = &unk_1E5A65480;
        v7[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v7, 0, 0.2, 0.0);
      }
    }
  }
}

uint64_t __73__MFMailComposeNavigationBarTitleView__updateTrailingBarButtonItemsAlpha__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTrailingBarAlpha:", 1.0);
}

uint64_t __73__MFMailComposeNavigationBarTitleView__updateTrailingBarButtonItemsAlpha__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTrailingBarAlpha:", 0.0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFMailComposeNavigationBarTitleView;
  -[MFMailComposeNavigationBarTitleView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, v4);
  -[MFMailComposeNavigationBarTitleView _updateHeightForCurrentTraits](self, "_updateHeightForCurrentTraits");

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeNavigationBarTitleView;
  -[MFMailComposeNavigationBarTitleView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[MFMailComposeNavigationBarTitleView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[MFMailComposeNavigationBarTitleView _updateHeightForCurrentTraits](self, "_updateHeightForCurrentTraits");
}

- (void)_updateHeightForCurrentTraits
{
  uint64_t v3;
  double v4;
  id v5;

  -[MFMailComposeNavigationBarTitleView traitCollection](self, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "verticalSizeClass") == 1)
  {
    v3 = objc_msgSend(v5, "horizontalSizeClass");
    v4 = 56.0;
    if (v3 == 1)
      v4 = 32.0;
  }
  else
  {
    v4 = 56.0;
  }
  -[_UINavigationBarTitleView setHeight:](self, "setHeight:", v4);

}

- (double)_verticalOffsetForSubtitleWhenMini:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  double result;

  v3 = a3;
  -[MFMailComposeNavigationBarTitleView subtitle](self, "subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  result = 2.0;
  if (v3)
    result = 1.0;
  if (!v5)
    return 0.0;
  return result;
}

- (double)_topPaddingForTitleWhenMini:(BOOL)a3
{
  double v3;
  void *v4;

  v3 = 1.0;
  if (a3)
  {
    -[MFMailComposeNavigationBarTitleView subtitle](self, "subtitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v3 = -1.0;
    else
      v3 = 0.0;

  }
  return v3;
}

- (double)_titleFontSizeWhenMini:(BOOL)a3
{
  double v3;
  void *v4;

  v3 = 17.0;
  if (a3)
  {
    -[MFMailComposeNavigationBarTitleView subtitle](self, "subtitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v3 = 14.0;
    else
      v3 = 17.0;

  }
  return v3;
}

- (double)_subtitleFontSizeWhenMini:(BOOL)a3
{
  double result;

  result = 12.0;
  if (a3)
    return 9.0;
  return result;
}

- (id)_subtitleTextColor
{
  unint64_t style;
  void *v3;

  style = self->_style;
  if (style > 4)
  {
    v3 = 0;
  }
  else
  {
    if (((1 << style) & 0xB) != 0)
      -[MFMailComposeNavigationBarTitleView tintColor](self, "tintColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.81, 0.0, 0.06, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_needsToLayoutTitleLabel
{
  double v3;
  BOOL v4;
  void *v5;

  -[_UINavigationBarTitleView largeTitleHeight](self, "largeTitleHeight");
  if (v3 > 16.0)
    return 0;
  -[MFMailComposeNavigationBarTitleView subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "length") != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
