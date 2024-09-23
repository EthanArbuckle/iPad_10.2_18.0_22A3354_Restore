@implementation CCUIMenuModuleViewController

uint64_t __60__CCUIMenuModuleViewController__layoutSubtitleLabelForSize___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double MaxY;
  void *v5;
  double v6;
  double v7;
  CGRect v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "frame");
  v3 = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "frame");
  MaxY = CGRectGetMaxY(v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scaledValueForValue:", 5.0);
  v7 = MaxY + v6;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setFrame:", 0.0, v7, *(double *)(a1 + 40), v3);
}

uint64_t __51__CCUIMenuModuleViewController__setupSubtitleLabel__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  double v4;
  double v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[128];
  objc_msgSend(v2, "preferredExpandedContentWidth");
  objc_msgSend(v2, "_titleWidthForContainerWidth:");
  objc_msgSend(v3, "sizeThatFits:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setBounds:", 0.0, 0.0, v4, v5);
}

uint64_t __57__CCUIMenuModuleViewController__layoutTitleLabelForSize___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  int v4;
  id *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "frame");
  v3 = v2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "hasGlyph");
  v5 = *(id **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "buttonView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alpha");
    BSFloatIsZero();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_scaledValueForValue:", 18.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "_firstLineBaselineOffsetFromBoundsTop");
    UIRoundToScale();
    v9 = v8;

  }
  else
  {
    objc_msgSend(v5[127], "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_scaledValueForValue:", 40.0);
    v11 = v10;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "_firstLineBaselineOffsetFromBoundsTop");
    v9 = v11 - v12;
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setFrame:", 0.0, v9, *(double *)(a1 + 40), v3);
}

- (double)headerHeightForWidth:(double)a3
{
  UILabel *titleLabel;
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
  void *v16;
  void *v17;
  double v18;
  double v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  -[UILabel frame](self->_titleLabel, "frame");
  if (CGRectIsEmpty(v21))
    -[CCUIMenuModuleViewController _setupTitleLabel](self, "_setupTitleLabel");
  titleLabel = self->_titleLabel;
  -[CCUIMenuModuleViewController _titleWidthForContainerWidth:](self, "_titleWidthForContainerWidth:", a3);
  -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:");
  v7 = v6;
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_titleLabel, "_firstLineBaselineOffsetFromBoundsTop");
  v9 = v7 - v8;
  -[UILabel _baselineOffsetFromBottom](self->_titleLabel, "_baselineOffsetFromBottom");
  v11 = v9 - v10;
  if (-[CCUIMenuModuleViewController hasGlyph](self, "hasGlyph"))
  {
    -[CCUIMenuModuleViewController _shouldHideGlyphForLimitedContentSizeCategory](self, "_shouldHideGlyphForLimitedContentSizeCategory");
    -[UILabel font](self->_titleLabel, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_scaledValueForValue:", 18.0);
    UIRoundToScale();
    v14 = v13;
  }
  else
  {
    -[UILabel font](self->_titleLabel, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_scaledValueForValue:", 66.0);
    v14 = v11 + v15;
  }

  -[UILabel text](self->_subtitleLabel, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[UILabel frame](self->_subtitleLabel, "frame");
    if (CGRectIsEmpty(v22))
      -[CCUIMenuModuleViewController _setupSubtitleLabel](self, "_setupSubtitleLabel");
    -[UILabel font](self->_subtitleLabel, "font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_scaledValueForValue:", 5.0);
    v19 = v18;
    -[UILabel frame](self->_subtitleLabel, "frame");
    v14 = v14 + v19 + CGRectGetHeight(v23);

  }
  return v14;
}

- (BOOL)hasGlyph
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIMenuModuleViewController;
  v3 = -[CCUIButtonModuleViewController hasGlyph](&v5, sel_hasGlyph);
  if (v3)
    LOBYTE(v3) = !-[CCUIMenuModuleViewController hideGlyphInHeader](self, "hideGlyphInHeader");
  return v3;
}

uint64_t __48__CCUIMenuModuleViewController__setupTitleLabel__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  double v4;
  double v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[127];
  objc_msgSend(v2, "preferredExpandedContentWidth");
  objc_msgSend(v2, "_titleWidthForContainerWidth:");
  objc_msgSend(v3, "sizeThatFits:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setBounds:", 0.0, 0.0, v4, v5);
}

- (double)_titleWidthForContainerWidth:(double)a3
{
  return a3 + -20.0;
}

- (void)_setupTitleLabel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__CCUIMenuModuleViewController__setupTitleLabel__block_invoke;
  v2[3] = &unk_1E8E20590;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

uint64_t __62__CCUIMenuModuleViewController__layoutHeaderSeparatorForSize___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;

  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "headerHeightForWidth:", *(double *)(a1 + 40));
  if (v2 >= v3)
    v2 = v3;
  v4 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_separatorHeight");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setFrame:", 0.0, v2, v4, v5);
}

- (void)_layoutViewSubviews
{
  void *v3;
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
  double v14;
  double v15;

  -[CCUIMenuModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CCUIMenuModuleViewController _layoutGlyphViewForSize:](self, "_layoutGlyphViewForSize:", v9, v11);
  -[MTMaterialView setFrame:](self->_platterMaterialView, "setFrame:", v5, v7, v9, v11);
  -[CCUIMenuModuleViewController preferredExpandedContentWidth](self, "preferredExpandedContentWidth");
  v13 = v12;
  -[CCUIMenuModuleViewController preferredExpandedContentHeight](self, "preferredExpandedContentHeight");
  v15 = v14;
  -[CCUIMenuModuleViewController _forceLimitContentSizeCategoryFromContentHeightIfNecessary:expanded:](self, "_forceLimitContentSizeCategoryFromContentHeightIfNecessary:expanded:", -[CCUIButtonModuleViewController isExpanded](self, "isExpanded"), v14);
  -[CCUIMenuModuleViewController _layoutTransformViewForSize:](self, "_layoutTransformViewForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutTitleLabelForSize:](self, "_layoutTitleLabelForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutSubtitleLabelForSize:](self, "_layoutSubtitleLabelForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutBusyIndicatorForSize:](self, "_layoutBusyIndicatorForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutHeaderSeparatorForSize:](self, "_layoutHeaderSeparatorForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutContentViewForSize:](self, "_layoutContentViewForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutFooterSeparatorForSize:](self, "_layoutFooterSeparatorForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutFooterButtonForSize:](self, "_layoutFooterButtonForSize:", v13, v15);
  -[CCUIMenuModuleViewController _fadeViewsForExpandedState:](self, "_fadeViewsForExpandedState:", -[CCUIButtonModuleViewController isExpanded](self, "isExpanded"));
}

- (void)_layoutTransformViewForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *transformView;
  __int128 v16;
  CGAffineTransform *v17;
  CGFloat v18;
  CGFloat v19;
  UIView *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;

  height = a3.height;
  width = a3.width;
  -[CCUIMenuModuleViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
  {
    transformView = self->_transformView;
    v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v21 = *MEMORY[0x1E0C9BAA8];
    v22 = v16;
    v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v17 = (CGAffineTransform *)&v21;
  }
  else
  {
    v25.origin.x = v8;
    v25.origin.y = v10;
    v25.size.width = v12;
    v25.size.height = v14;
    v18 = CGRectGetWidth(v25) / width;
    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.width = v12;
    v26.size.height = v14;
    v19 = CGRectGetHeight(v26);
    v20 = self->_transformView;
    CGAffineTransformMakeScale(&v24, v18, v19 / height);
    v17 = &v24;
    transformView = v20;
  }
  -[UIView setTransform:](transformView, "setTransform:", v17, v21, v22, v23);
  -[UIView setFrame:](self->_transformView, "setFrame:", v8, v10, v12, v14);
}

- (void)_layoutTitleLabelForSize:(CGSize)a3
{
  _QWORD v3[5];
  CGSize v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__CCUIMenuModuleViewController__layoutTitleLabelForSize___block_invoke;
  v3[3] = &unk_1E8E20898;
  v3[4] = self;
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

- (void)_layoutSubtitleLabelForSize:(CGSize)a3
{
  _QWORD v3[5];
  CGSize v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__CCUIMenuModuleViewController__layoutSubtitleLabelForSize___block_invoke;
  v3[3] = &unk_1E8E20898;
  v3[4] = self;
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

- (void)_layoutHeaderSeparatorForSize:(CGSize)a3
{
  _QWORD v3[5];
  CGSize v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__CCUIMenuModuleViewController__layoutHeaderSeparatorForSize___block_invoke;
  v3[3] = &unk_1E8E20898;
  v4 = a3;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

- (void)_layoutGlyphViewForSize:(CGSize)a3
{
  void *v4;
  _BOOL4 v5;
  double v6;
  BOOL v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  CGRect v19;

  -[CCUIButtonModuleViewController buttonView](self, "buttonView", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CCUIButtonModuleViewController isExpanded](self, "isExpanded");
  v6 = 1.0;
  if (v5)
  {
    v7 = -[CCUIMenuModuleViewController _shouldHideGlyphForLimitedContentSizeCategory](self, "_shouldHideGlyphForLimitedContentSizeCategory", 1.0);
    v6 = 0.0;
    if (!v7)
      v6 = (double)(-[CCUIMenuModuleViewController hideGlyphInHeader](self, "hideGlyphInHeader", 0.0) ^ 1);
  }
  objc_msgSend(v4, "setAlpha:", v6);

  if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
  {
    -[CCUIMenuModuleViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    CGRectGetWidth(v19);

    UIRectIntegralWithScale();
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);
  }
  else
  {
    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[CCUIMenuModuleViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    objc_msgSend(v18, "setFrame:");

  }
}

- (void)_layoutFooterSeparatorForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;

  height = a3.height;
  width = a3.width;
  -[CCUIMenuModuleViewController _footerHeight](self, "_footerHeight");
  v7 = height - v6;
  -[CCUIMenuModuleViewController _separatorHeight](self, "_separatorHeight");
  -[UIView setFrame:](self->_footerSeparatorView, "setFrame:", 0.0, v7, width, v8);
}

- (void)_layoutFooterButtonForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;

  height = a3.height;
  width = a3.width;
  if (self->_shouldShowFooterButton)
  {
    -[CCUIMenuModuleItemView intrinsicContentSize](self->_footerButtonView, "intrinsicContentSize");
    v7 = v6;
  }
  else
  {
    v7 = 0.0;
  }
  -[CCUIMenuModuleItemView setFrame:](self->_footerButtonView, "setFrame:", 0.0, height - v7, width);
}

- (void)_layoutContentViewForSize:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  UIView *customContentView;
  CGRect v17;

  width = a3.width;
  -[CCUIMenuModuleViewController headerHeight](self, "headerHeight");
  -[CCUIMenuModuleViewController _footerHeight](self, "_footerHeight");
  -[CCUIMenuModuleViewController _menuItemsHeightForWidth:](self, "_menuItemsHeightForWidth:", width);
  v6 = v5;
  UIRectIntegralWithScale();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIStackView setFrame:](self->_menuItemsContainer, "setFrame:", 0.0, 0.0, width, v6);
  if (self->_customContentView)
  {
    -[CCUIMenuModuleViewController scrollViewContentHeightForWidth:](self, "scrollViewContentHeightForWidth:", width);
    v6 = v15;
  }
  -[UIScrollView setContentSize:](self->_contentScrollView, "setContentSize:", width, v6);
  v17.origin.x = v8;
  v17.origin.y = v10;
  v17.size.width = v12;
  v17.size.height = v14;
  -[UIScrollView setScrollEnabled:](self->_contentScrollView, "setScrollEnabled:", v6 > CGRectGetHeight(v17));
  customContentView = self->_customContentView;
  if (customContentView)
  {
    -[UIView frame](customContentView, "frame");
    -[UIView setFrame:](self->_customContentView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
}

- (double)preferredExpandedContentHeightWithWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;

  -[CCUIMenuModuleViewController headerHeightForWidth:](self, "headerHeightForWidth:");
  -[CCUIMenuModuleViewController scrollViewContentHeightForWidth:](self, "scrollViewContentHeightForWidth:", a3);
  -[CCUIMenuModuleViewController _footerHeight](self, "_footerHeight");
  -[CCUIMenuModuleViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v7 = v6;

  return v7;
}

- (double)_footerHeight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double Width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  char IsZero;
  double result;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  if (-[CCUIMenuModuleViewController _shouldShowFooterChin](self, "_shouldShowFooterChin"))
  {
    v17.origin.x = CCUIReferenceScreenBounds();
    Width = CGRectGetWidth(v17);
    if (Width >= 1024.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
      {
        v8 = 24.0;
        if (SBFEffectiveHomeButtonType() != 2)
          goto LABEL_37;
      }
    }
    v18.origin.x = CCUIReferenceScreenBounds();
    v9 = CGRectGetWidth(v18);
    if (v9 >= 1024.0
      && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "userInterfaceIdiom") == 1)
      && SBFEffectiveHomeButtonType() == 2)
    {

      v8 = 24.0;
    }
    else
    {
      v19.origin.x = CCUIReferenceScreenBounds();
      v11 = CGRectGetWidth(v19);
      if (v11 >= 834.0)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "userInterfaceIdiom") == 1)
        {
          v8 = 24.0;
          if (SBFEffectiveHomeButtonType() == 2)
            goto LABEL_33;
        }
      }
      v20.origin.x = CCUIReferenceScreenBounds();
      v12 = CGRectGetWidth(v20);
      if (v12 >= 834.0)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "userInterfaceIdiom") == 1)
        {
          v8 = 24.0;
          if (SBFEffectiveHomeButtonType() != 2)
            goto LABEL_31;
        }
      }
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 24.0;
      if (objc_msgSend(v13, "userInterfaceIdiom") != 1)
      {
        v21.origin.x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v21) < 430.0)
        {
          v22.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v22) < 428.0)
          {
            v23.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v23) < 414.0 || SBFEffectiveHomeButtonType() != 2)
            {
              v24.origin.x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v24) < 414.0)
              {
                v25.origin.x = CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v25) < 393.0)
                {
                  v26.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v26) < 390.0)
                  {
                    v27.origin.x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v27) < 375.0 || SBFEffectiveHomeButtonType() != 2)
                    {
                      v28.origin.x = CCUIReferenceScreenBounds();
                      if (CGRectGetWidth(v28) < 375.0)
                        v8 = 20.0;
                      else
                        v8 = 24.0;
                    }
                  }
                }
              }
            }
          }
        }
      }

      if (v12 >= 834.0)
LABEL_31:

      if (v11 >= 834.0)
LABEL_33:

      if (v9 >= 1024.0)
    }
    if (Width >= 1024.0)
LABEL_37:

  }
  else if (self->_shouldShowFooterButton)
  {
    -[CCUIMenuModuleItemView intrinsicContentSize](self->_footerButtonView, "intrinsicContentSize");
    v8 = v10;
  }
  else
  {
    v8 = 0.0;
  }
  IsZero = BSFloatIsZero();
  result = 0.0;
  if ((IsZero & 1) == 0)
  {
    -[CCUIMenuModuleViewController _separatorHeight](self, "_separatorHeight", 0.0);
    return v8 + v16;
  }
  return result;
}

- (double)_menuItemsHeightForWidth:(double)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[UIStackView arrangedSubviews](self->_menuItemsContainer, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0.0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[UIStackView arrangedSubviews](self->_menuItemsContainer, "arrangedSubviews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isHidden") & 1) == 0)
        {
          objc_msgSend(v13, "sizeThatFits:", a3, 0.0);
          v11 = v11 + v14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (BOOL)_shouldShowFooterChin
{
  BOOL customContentViewScrolls;
  void *v4;

  if (self->_shouldShowFooterButton)
    return 0;
  -[UIStackView arrangedSubviews](self->_menuItemsContainer, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    customContentViewScrolls = 1;
  else
    customContentViewScrolls = self->_customContentViewScrolls;

  return customContentViewScrolls;
}

- (double)scrollViewContentHeightForWidth:(double)a3
{
  UIView *customContentView;
  double result;
  double v6;
  double v7;
  double v8;
  CGRect v9;

  customContentView = self->_customContentView;
  if (customContentView)
  {
    -[UIView frame](customContentView, "frame", a3);
    return CGRectGetHeight(v9);
  }
  else if (self->_visibleMenuItems <= 0.0)
  {
    -[CCUIMenuModuleViewController _menuItemsHeightForWidth:](self, "_menuItemsHeightForWidth:", a3);
  }
  else
  {
    -[CCUIMenuModuleViewController _defaultMenuItemHeight](self, "_defaultMenuItemHeight", a3);
    v7 = v6;
    -[CCUIMenuModuleViewController visibleMenuItems](self, "visibleMenuItems");
    return v7 * v8;
  }
  return result;
}

- (double)headerHeight
{
  void *v3;
  double Width;
  double v5;
  double result;
  CGRect v7;

  -[CCUIMenuModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v7);

  -[CCUIMenuModuleViewController preferredExpandedContentWidth](self, "preferredExpandedContentWidth");
  if (Width >= v5)
    v5 = Width;
  -[CCUIMenuModuleViewController headerHeightForWidth:](self, "headerHeightForWidth:", v5);
  return result;
}

- (void)_layoutBusyIndicatorForSize:(CGSize)a3
{
  _QWORD v3[5];
  CGSize v4;

  if (self->_busyIndicatorView)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __60__CCUIMenuModuleViewController__layoutBusyIndicatorForSize___block_invoke;
    v3[3] = &unk_1E8E20898;
    v3[4] = self;
    v4 = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
  }
}

- (double)preferredExpandedContentHeight
{
  double v3;
  double v4;
  double result;

  -[CCUIMenuModuleViewController _maximumHeight](self, "_maximumHeight");
  v4 = v3;
  -[CCUIMenuModuleViewController _desiredExpandedHeight](self, "_desiredExpandedHeight");
  if (v4 < result)
    return v4;
  return result;
}

- (double)_maximumHeight
{
  double v2;
  double v3;
  double v4;
  CGRect v6;

  v2 = CCUIExpandedModuleEdgeInsets();
  v4 = v3;
  v6.origin.x = CCUIScreenBounds();
  return CGRectGetHeight(v6) - v2 - v4;
}

- (double)_desiredExpandedHeight
{
  double result;

  -[CCUIMenuModuleViewController preferredExpandedContentWidth](self, "preferredExpandedContentWidth");
  -[CCUIMenuModuleViewController preferredExpandedContentHeightWithWidth:](self, "preferredExpandedContentHeightWithWidth:");
  return result;
}

- (double)visibleMenuItems
{
  return self->_visibleMenuItems;
}

- (double)_defaultMenuItemHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CCUIMenuModuleViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CCUIMenuModuleItemView defaultMenuItemHeightForContentSizeCategory:](CCUIMenuModuleItemView, "defaultMenuItemHeightForContentSizeCategory:", v3);
  v5 = v4;

  return v5;
}

- (void)_contentSizeCategoryDidChange
{
  -[CCUIMenuModuleViewController _setForceLimitContentSizeCategory:](self, "_setForceLimitContentSizeCategory:", 0);
  -[CCUIMenuModuleViewController _updateTitleFont](self, "_updateTitleFont");
  -[CCUIMenuModuleViewController _updateSubtitleFont](self, "_updateSubtitleFont");
  -[CCUIMenuModuleViewController _updateLeadingAndTrailingViews](self, "_updateLeadingAndTrailingViews");
}

- (void)_updateSubtitleFont
{
  UILabel *subtitleLabel;
  void *v4;
  id v5;

  subtitleLabel = self->_subtitleLabel;
  -[CCUIMenuModuleViewController _subtitleFont](self, "_subtitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](subtitleLabel, "setFont:", v4);

  -[CCUIMenuModuleViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)_updateTitleFont
{
  UILabel *titleLabel;
  void *v4;
  id v5;

  titleLabel = self->_titleLabel;
  -[CCUIMenuModuleViewController _titleFont](self, "_titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v4);

  -[CCUIMenuModuleViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (id)_titleFont
{
  id v3;
  void *v4;
  _BOOL4 v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  if (-[CCUIMenuModuleViewController _shouldLimitContentSizeCategory](self, "_shouldLimitContentSizeCategory"))
  {
    v3 = (id)*MEMORY[0x1E0DC48D0];
  }
  else
  {
    -[CCUIMenuModuleViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v5 = -[CCUIMenuModuleViewController hasGlyph](self, "hasGlyph");
  v6 = (_QWORD *)MEMORY[0x1E0DC4AD0];
  if (v5)
  {
    v7 = 8;
  }
  else
  {
    v6 = (_QWORD *)MEMORY[0x1E0DC4B60];
    v7 = 4;
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *v6, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_subtitleFont
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (-[CCUIMenuModuleViewController _shouldLimitContentSizeCategory](self, "_shouldLimitContentSizeCategory"))
  {
    v3 = (id)*MEMORY[0x1E0DC48D0];
  }
  else
  {
    -[CCUIMenuModuleViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[CCUIMenuModuleViewController hasGlyph](self, "hasGlyph"))
    v5 = 8;
  else
    v5 = 1;
  objc_msgSend(MEMORY[0x1E0DC1350], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *MEMORY[0x1E0DC4B10], v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_shouldLimitContentSizeCategory
{
  void *v3;
  NSString *v4;
  BOOL v5;

  -[CCUIMenuModuleViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = (self->_forceLimitContentSizeCategory
     || (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") - 3) <= 1)
    && UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending;

  return v5;
}

- (double)_separatorHeight
{
  void *v2;
  NSString *v3;
  double v4;
  void *v5;
  double v6;

  -[CCUIMenuModuleViewController traitCollection](self, "traitCollection");
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

- (BOOL)_setForceLimitContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 forceLimitContentSizeCategory;
  UILabel *titleLabel;
  void *v7;
  UILabel *subtitleLabel;
  void *v9;

  v3 = a3;
  forceLimitContentSizeCategory = self->_forceLimitContentSizeCategory;
  if (forceLimitContentSizeCategory != a3)
  {
    self->_forceLimitContentSizeCategory = a3;
    titleLabel = self->_titleLabel;
    -[CCUIMenuModuleViewController _titleFont](self, "_titleFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](titleLabel, "setFont:", v7);

    subtitleLabel = self->_subtitleLabel;
    -[CCUIMenuModuleViewController _subtitleFont](self, "_subtitleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](subtitleLabel, "setFont:", v9);

    -[CCUIMenuModuleItemView setShouldLimitContentSizeCategory:](self->_footerButtonView, "setShouldLimitContentSizeCategory:", v3);
  }
  return forceLimitContentSizeCategory != v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MTMaterialView *v7;
  MTMaterialView *platterMaterialView;
  void (**v9)(void *, uint64_t);
  id v10;
  UIView *v11;
  UIView *transformView;
  UIView *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UILabel *v21;
  UILabel *titleLabel;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  UILabel *subtitleLabel;
  UILabel *v27;
  void *v28;
  UIView *v29;
  UIView *headerSeparatorView;
  UIView *v31;
  UIView *footerSeparatorView;
  UIView *v33;
  UIView *contentView;
  id v35;
  UIView *v36;
  UIView *darkeningBackgroundView;
  void *v38;
  id v39;
  UIScrollView *v40;
  UIScrollView *contentScrollView;
  id v42;
  UIStackView *v43;
  UIStackView *menuItemsContainer;
  UILongPressGestureRecognizer *v45;
  UILongPressGestureRecognizer *pressGestureRecognizer;
  UILongPressGestureRecognizer *v47;
  void *v48;
  id v49;
  void *v50;
  UISelectionFeedbackGenerator *v51;
  UISelectionFeedbackGenerator *feedbackGenerator;
  void *v53;
  void *v54;
  id v55;
  _QWORD aBlock[5];
  objc_super v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)CCUIMenuModuleViewController;
  -[CCUIButtonModuleViewController viewDidLoad](&v57, sel_viewDidLoad);
  -[CCUIMenuModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CCUIMenuModuleViewController prefersContextMenuDisplayStyle](self, "prefersContextMenuDisplayStyle"))
  {
    -[CCUIButtonModuleViewController _templateView](self, "_templateView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "setContextMenuDelegate:", self);
      +[CCUIControlCenterMaterialView controlCenterModuleBackgroundMaterial](CCUIControlCenterMaterialView, "controlCenterModuleBackgroundMaterial");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundView:", v6);

      -[CCUIMenuModuleViewController setShouldProvideOwnPlatter:](self, "setShouldProvideOwnPlatter:", 0);
    }

  }
  if (self->_shouldProvideOwnPlatter)
  {
    +[CCUIControlCenterMaterialView _darkMaterialView](CCUIControlCenterMaterialView, "_darkMaterialView");
    v7 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    platterMaterialView = self->_platterMaterialView;
    self->_platterMaterialView = v7;

    -[MTMaterialView _setContinuousCornerRadius:](self->_platterMaterialView, "_setContinuousCornerRadius:", CCUIExpandedModuleContinuousCornerRadius());
    objc_msgSend(v3, "insertSubview:atIndex:", self->_platterMaterialView, 0);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__CCUIMenuModuleViewController_viewDidLoad__block_invoke;
    aBlock[3] = &unk_1E8E20820;
    aBlock[4] = self;
    v9 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v9[2](v9, 1);
    v9[2](v9, 2);

  }
  v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "bounds");
  v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
  transformView = self->_transformView;
  self->_transformView = v11;

  v13 = self->_transformView;
  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertSubview:belowSubview:", v13, v14);

  -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_1E8E2BBC0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0DC3990]);
  v17 = *MEMORY[0x1E0C9D648];
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v21 = (UILabel *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E0C9D648], v18, v19, v20);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v21;

  -[UIView addSubview:](self->_transformView, "addSubview:", self->_titleLabel);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  v23 = self->_titleLabel;
  -[CCUIMenuModuleViewController title](self, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v23, "setText:", v24);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  objc_msgSend(v15, "automaticallyUpdateView:withStyle:", self->_titleLabel, 0);
  v25 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v17, v18, v19, v20);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v25;

  -[UIView addSubview:](self->_transformView, "addSubview:", self->_subtitleLabel);
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  v27 = self->_subtitleLabel;
  -[CCUIMenuModuleViewController subtitle](self, "subtitle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v27, "setText:", v28);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  objc_msgSend(v15, "automaticallyUpdateView:withStyle:", self->_subtitleLabel, 1);
  v29 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  headerSeparatorView = self->_headerSeparatorView;
  self->_headerSeparatorView = v29;

  -[UIView addSubview:](self->_transformView, "addSubview:", self->_headerSeparatorView);
  objc_msgSend(v15, "automaticallyUpdateView:withStyle:", self->_headerSeparatorView, 5);
  v31 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  footerSeparatorView = self->_footerSeparatorView;
  self->_footerSeparatorView = v31;

  -[UIView addSubview:](self->_transformView, "addSubview:", self->_footerSeparatorView);
  objc_msgSend(v15, "automaticallyUpdateView:withStyle:", self->_footerSeparatorView, 5);
  v33 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v17, v18, v19, v20);
  contentView = self->_contentView;
  self->_contentView = v33;

  -[UIView insertSubview:belowSubview:](self->_transformView, "insertSubview:belowSubview:", self->_contentView, self->_footerSeparatorView);
  v35 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[UIView bounds](self->_contentView, "bounds");
  v36 = (UIView *)objc_msgSend(v35, "initWithFrame:");
  darkeningBackgroundView = self->_darkeningBackgroundView;
  self->_darkeningBackgroundView = v36;

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_darkeningBackgroundView);
  -[UIView setAutoresizingMask:](self->_darkeningBackgroundView, "setAutoresizingMask:", 18);
  -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_1E8E2BBD8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "_automaticallyUpdateView:withStyleNamed:andObserverBlock:", self->_darkeningBackgroundView, CFSTR("moduleListTint"), 0);

  v39 = objc_alloc(MEMORY[0x1E0DC3C28]);
  -[UIView bounds](self->_contentView, "bounds");
  v40 = (UIScrollView *)objc_msgSend(v39, "initWithFrame:");
  contentScrollView = self->_contentScrollView;
  self->_contentScrollView = v40;

  -[UIScrollView setAutoresizingMask:](self->_contentScrollView, "setAutoresizingMask:", 18);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_contentScrollView, "setShowsVerticalScrollIndicator:", 0);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_contentScrollView);
  v42 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  -[UIView bounds](self->_contentView, "bounds");
  v43 = (UIStackView *)objc_msgSend(v42, "initWithFrame:");
  menuItemsContainer = self->_menuItemsContainer;
  self->_menuItemsContainer = v43;

  -[UIStackView setAxis:](self->_menuItemsContainer, "setAxis:", 1);
  -[UIScrollView addSubview:](self->_contentScrollView, "addSubview:", self->_menuItemsContainer);
  v45 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handlePressGesture_);
  pressGestureRecognizer = self->_pressGestureRecognizer;
  self->_pressGestureRecognizer = v45;

  -[UILongPressGestureRecognizer setDelegate:](self->_pressGestureRecognizer, "setDelegate:", self);
  -[UILongPressGestureRecognizer setCancelsTouchesInView:](self->_pressGestureRecognizer, "setCancelsTouchesInView:", 0);
  -[UILongPressGestureRecognizer setDelaysTouchesEnded:](self->_pressGestureRecognizer, "setDelaysTouchesEnded:", 0);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_pressGestureRecognizer, "setMinimumPressDuration:", 0.0);
  -[UILongPressGestureRecognizer _setKeepTouchesOnContinuation:](self->_pressGestureRecognizer, "_setKeepTouchesOnContinuation:", 1);
  v47 = self->_pressGestureRecognizer;
  -[UIScrollView panGestureRecognizer](self->_contentScrollView, "panGestureRecognizer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILongPressGestureRecognizer requireGestureRecognizerToFail:](v47, "requireGestureRecognizerToFail:", v48);

  objc_msgSend(v3, "addGestureRecognizer:", self->_pressGestureRecognizer);
  v49 = objc_alloc(MEMORY[0x1E0DC3C60]);
  objc_msgSend(MEMORY[0x1E0DC4320], "lightConfiguration");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (UISelectionFeedbackGenerator *)objc_msgSend(v49, "initWithConfiguration:view:", v50, v3);
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v51;

  objc_opt_self();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (id)-[CCUIMenuModuleViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v54, sel__contentSizeCategoryDidChange);

  -[CCUIMenuModuleViewController _contentSizeCategoryDidChange](self, "_contentSizeCategoryDidChange");
  -[CCUIMenuModuleViewController _fadeViewsForExpandedState:](self, "_fadeViewsForExpandedState:", -[CCUIButtonModuleViewController isExpanded](self, "isExpanded"));

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIMenuModuleViewController;
  -[CCUIButtonModuleViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[CCUIMenuModuleViewController _setupTitleLabel](self, "_setupTitleLabel");
  -[CCUIMenuModuleViewController _setupSubtitleLabel](self, "_setupSubtitleLabel");
  -[CCUIMenuModuleViewController _layoutViewSubviews](self, "_layoutViewSubviews");
}

- (void)_setupSubtitleLabel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__CCUIMenuModuleViewController__setupSubtitleLabel__block_invoke;
  v2[3] = &unk_1E8E20590;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CCUIMenuModuleViewController;
  -[CCUIMenuModuleViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v15, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3 && !self->_shouldProvideOwnPlatter)
  {
    -[CCUIMenuModuleViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visualStylingProviderForCategory:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_1E8E2BBC0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 != v7)
    {
      objc_msgSend(v8, "stopAutomaticallyUpdatingView:", self->_titleLabel);
      objc_msgSend(v9, "stopAutomaticallyUpdatingView:", self->_subtitleLabel);
      objc_msgSend(v9, "stopAutomaticallyUpdatingView:", self->_headerSeparatorView);
      objc_msgSend(v9, "stopAutomaticallyUpdatingView:", self->_footerSeparatorView);
      if (v7)
      {
        -[NSMutableDictionary setObject:forKey:](self->_categoriesToVisualStylingProviders, "setObject:forKey:", v7, &unk_1E8E2BBC0);
        objc_msgSend(v7, "automaticallyUpdateView:withStyle:", self->_titleLabel, 0);
        objc_msgSend(v7, "automaticallyUpdateView:withStyle:", self->_subtitleLabel, 1);
        objc_msgSend(v7, "automaticallyUpdateView:withStyle:", self->_headerSeparatorView, 5);
        objc_msgSend(v7, "automaticallyUpdateView:withStyle:", self->_footerSeparatorView, 5);
      }
    }
    -[CCUIMenuModuleViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "visualStylingProviderForCategory:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_1E8E2BBD8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 != v11)
    {
      objc_msgSend(v12, "stopAutomaticallyUpdatingView:", self->_darkeningBackgroundView);
      if (v11)
      {
        -[NSMutableDictionary setObject:forKey:](self->_categoriesToVisualStylingProviders, "setObject:forKey:", v11, &unk_1E8E2BBD8);
        objc_msgSend(v11, "_automaticallyUpdateView:withStyleNamed:andObserverBlock:", self->_darkeningBackgroundView, CFSTR("moduleListTint"), 0);
      }
    }
    -[CCUIMenuModuleViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

  }
}

- (void)_fadeViewsForExpandedState:(BOOL)a3
{
  UILabel *titleLabel;
  double v5;
  UIView *headerSeparatorView;
  id *p_contentView;
  unint64_t v8;
  CGRect v9;

  titleLabel = self->_titleLabel;
  if (a3)
  {
    v5 = 1.0;
    -[UILabel setAlpha:](titleLabel, "setAlpha:", 1.0);
    -[UILabel setAlpha:](self->_subtitleLabel, "setAlpha:", 1.0);
    headerSeparatorView = self->_headerSeparatorView;
    p_contentView = (id *)&self->_contentView;
    -[UIView bounds](self->_contentView, "bounds");
    -[UIView setAlpha:](headerSeparatorView, "setAlpha:", (double)!CGRectIsEmpty(v9));
    -[UIView setAlpha:](self->_footerSeparatorView, "setAlpha:", (double)-[CCUIMenuModuleViewController _shouldShowFooterSeparator](self, "_shouldShowFooterSeparator"));
    LOBYTE(v8) = self->_shouldShowFooterButton;
    -[CCUIMenuModuleItemView setAlpha:](self->_footerButtonView, "setAlpha:", (double)v8);
  }
  else
  {
    v5 = 0.0;
    -[UILabel setAlpha:](titleLabel, "setAlpha:", 0.0);
    -[UILabel setAlpha:](self->_subtitleLabel, "setAlpha:", 0.0);
    -[UIView setAlpha:](self->_headerSeparatorView, "setAlpha:", 0.0);
    -[UIView setAlpha:](self->_footerSeparatorView, "setAlpha:", 0.0);
    -[CCUIMenuModuleItemView setAlpha:](self->_footerButtonView, "setAlpha:", 0.0);
    -[UIView setAlpha:](self->_contentView, "setAlpha:", 0.0);
    p_contentView = (id *)&self->_busyIndicatorView;
  }
  objc_msgSend(*p_contentView, "setAlpha:", v5);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)_updateLeadingAndTrailingViews
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[UIStackView arrangedSubviews](self->_menuItemsContainer, "arrangedSubviews");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__CCUIMenuModuleViewController__updateLeadingAndTrailingViews__block_invoke;
  v5[3] = &unk_1E8E208C0;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  -[CCUIMenuModuleViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)setVisibleMenuItems:(double)a3
{
  self->_visibleMenuItems = a3;
}

- (void)setUseTrailingCheckmarkLayout:(BOOL)a3
{
  self->_useTrailingCheckmarkLayout = a3;
}

- (void)setMinimumMenuItems:(unint64_t)a3
{
  self->_minimumMenuItems = a3;
}

- (void)setIndentation:(unint64_t)a3
{
  self->_indentation = a3;
}

- (CCUIMenuModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CCUIMenuModuleViewController *v4;
  NSMutableArray *v5;
  NSMutableArray *menuItems;
  NSMutableDictionary *v7;
  NSMutableDictionary *identiferToActivityIndicatorView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CCUIMenuModuleViewController;
  v4 = -[CCUIButtonModuleViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    menuItems = v4->_menuItems;
    v4->_menuItems = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identiferToActivityIndicatorView = v4->_identiferToActivityIndicatorView;
    v4->_identiferToActivityIndicatorView = v7;

  }
  return v4;
}

+ (id)checkmarkImageForPreferredContentSizeCategory:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = (void *)checkmarkImageForPreferredContentSizeCategory__checkmarkImage;
  if (checkmarkImageForPreferredContentSizeCategory__checkmarkImage)
    v6 = checkmarkImageForPreferredContentSizeCategory__checkmarkImageContentSizeCategory == (_QWORD)v4;
  else
    v6 = 0;
  if (!v6)
  {
    objc_storeStrong((id *)&checkmarkImageForPreferredContentSizeCategory__checkmarkImageContentSizeCategory, a3);
    v7 = (void *)*MEMORY[0x1E0DC48C8];
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x1E0DC48C8]) == NSOrderedDescending)
    {
      v8 = v7;

      v4 = v8;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *MEMORY[0x1E0DC4A88], 4, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(v9, "pointSize");
    objc_msgSend(v10, "configurationWithPointSize:weight:scale:", 6, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)checkmarkImageForPreferredContentSizeCategory__checkmarkImage;
    checkmarkImageForPreferredContentSizeCategory__checkmarkImage = v12;

    v14 = (void *)checkmarkImageForPreferredContentSizeCategory__checkmarkImage;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_flatImageWithColor:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)checkmarkImageForPreferredContentSizeCategory__checkmarkImage;
    checkmarkImageForPreferredContentSizeCategory__checkmarkImage = v16;

    v5 = (void *)checkmarkImageForPreferredContentSizeCategory__checkmarkImage;
  }
  v18 = v5;

  return v18;
}

- (id)_busyIndicatorView
{
  UIActivityIndicatorView *busyIndicatorView;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;

  busyIndicatorView = self->_busyIndicatorView;
  if (!busyIndicatorView)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 1);
    v5 = self->_busyIndicatorView;
    self->_busyIndicatorView = v4;

    -[UIView addSubview:](self->_transformView, "addSubview:", self->_busyIndicatorView);
    -[UIActivityIndicatorView setHidesWhenStopped:](self->_busyIndicatorView, "setHidesWhenStopped:", 0);
    -[UIActivityIndicatorView setAlpha:](self->_busyIndicatorView, "setAlpha:", 0.0);
    busyIndicatorView = self->_busyIndicatorView;
  }
  return busyIndicatorView;
}

- (void)setBusy:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  CCUIMenuModuleViewController *v12;
  BOOL v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;
  _QWORD v17[5];

  if (self->_busy != a3)
  {
    v3 = a3;
    self->_busy = a3;
    -[CCUIMenuModuleViewController _busyIndicatorView](self, "_busyIndicatorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "startAnimating");
    else
      objc_msgSend(v5, "stopAnimating");
    v7 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__CCUIMenuModuleViewController_setBusy___block_invoke;
    v17[3] = &unk_1E8E20590;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v17);
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __40__CCUIMenuModuleViewController_setBusy___block_invoke_2;
    v14[3] = &unk_1E8E206B8;
    v15 = v6;
    v16 = v3;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __40__CCUIMenuModuleViewController_setBusy___block_invoke_3;
    v10[3] = &unk_1E8E206E0;
    v13 = v3;
    v11 = v15;
    v12 = self;
    v9 = v15;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v14, v10, 0.3);

  }
}

void __40__CCUIMenuModuleViewController_setBusy___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

uint64_t __40__CCUIMenuModuleViewController_setBusy___block_invoke_2(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

void __40__CCUIMenuModuleViewController_setBusy___block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;

  if (a2 && !*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    if (v3 == *(void **)(v4 + 1112))
    {
      *(_QWORD *)(v4 + 1112) = 0;

    }
  }
}

- (void)addActionWithTitle:(id)a3 glyph:(id)a4 handler:(id)a5
{
  -[CCUIMenuModuleViewController addActionWithTitle:subtitle:glyph:handler:](self, "addActionWithTitle:subtitle:glyph:handler:", a3, 0, a4, a5);
}

- (void)addActionWithTitle:(id)a3 subtitle:(id)a4 glyph:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  CCUIMenuModuleItem *v14;
  void *v15;
  void *v16;
  CCUIMenuModuleItem *v17;
  CCUIMenuModuleItemView *v18;
  void *v19;
  CCUIMenuModuleItemView *v20;
  id v21;
  _QWORD v22[5];
  CCUIMenuModuleItemView *v23;

  v21 = a3;
  v10 = a4;
  v11 = a6;
  if (a5)
  {
    v12 = (objc_class *)MEMORY[0x1E0DC3890];
    v13 = a5;
    a5 = (id)objc_msgSend([v12 alloc], "initWithImage:", v13);

  }
  objc_msgSend(a5, "setContentMode:", 4);
  v14 = [CCUIMenuModuleItem alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CCUIMenuModuleItem initWithTitle:identifier:handler:](v14, "initWithTitle:identifier:handler:", v21, v16, v11);

  -[CCUIMenuModuleItem setSubtitle:](v17, "setSubtitle:", v10);
  -[NSMutableArray addObject:](self->_menuItems, "addObject:", v17);
  v18 = -[CCUIMenuModuleItemView initWithMenuItem:]([CCUIMenuModuleItemView alloc], "initWithMenuItem:", v17);
  -[CCUIMenuModuleItemView setLeadingView:](v18, "setLeadingView:", a5);
  -[CCUIMenuModuleViewController preferredExpandedContentWidth](self, "preferredExpandedContentWidth");
  -[CCUIMenuModuleItemView setPreferredMaxLayoutWidth:](v18, "setPreferredMaxLayoutWidth:");
  -[CCUIMenuModuleItemView setIndentation:](v18, "setIndentation:", self->_indentation);
  -[CCUIMenuModuleItemView setUseTrailingCheckmarkLayout:](v18, "setUseTrailingCheckmarkLayout:", self->_useTrailingCheckmarkLayout);
  -[CCUIMenuModuleItemView setUseTrailingInset:](v18, "setUseTrailingInset:", self->_useTrailingInset);
  v19 = (void *)MEMORY[0x1E0DC3F10];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74__CCUIMenuModuleViewController_addActionWithTitle_subtitle_glyph_handler___block_invoke;
  v22[3] = &unk_1E8E20708;
  v22[4] = self;
  v23 = v18;
  v20 = v18;
  objc_msgSend(v19, "performWithoutAnimation:", v22);

}

void __74__CCUIMenuModuleViewController_addActionWithTitle_subtitle_glyph_handler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "addArrangedSubview:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateMenuItemsSeparatorVisiblity");
  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)setMenuItems:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (objc_msgSend(v4, "count") >= self->_minimumMenuItems)
  {
    v7 = v4;
  }
  else
  {
    v8 = (id)objc_msgSend(v4, "mutableCopy");
    if (objc_msgSend(v8, "count") < self->_minimumMenuItems)
    {
      v5 = 0;
      do
      {
        -[CCUIMenuModuleViewController _menuItemFromPlaceholderIndex:](self, "_menuItemFromPlaceholderIndex:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v6);

        ++v5;
      }
      while (objc_msgSend(v8, "count") < self->_minimumMenuItems);
    }

    v7 = v8;
  }
  v9 = v7;
  -[CCUIMenuModuleViewController _setMenuItems:](self, "_setMenuItems:", v7);

}

- (id)mostRecentMenuItems
{
  return self->_menuItems;
}

- (id)_menuItemFromPlaceholderIndex:(unint64_t)a3
{
  CCUIMenuModuleItem *v4;
  void *v5;
  CCUIMenuModuleItem *v6;

  v4 = [CCUIMenuModuleItem alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLACEHOLDER #%ld"), a3 + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CCUIMenuModuleItem initWithTitle:identifier:handler:](v4, "initWithTitle:identifier:handler:", CFSTR(" "), v5, 0);

  -[CCUIMenuModuleItem setPlaceholder:](v6, "setPlaceholder:", 1);
  return v6;
}

- (void)_setMenuItems:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  NSMutableArray *v10;
  NSMutableArray *menuItems;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  CCUIMenuModuleViewController *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  CCUIMenuModuleViewController *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)CCUILogUserInterface;
  if (os_log_type_enabled((os_log_t)CCUILogUserInterface, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 134218498;
    v55 = objc_msgSend(v4, "count");
    v56 = 2114;
    v57 = (id)objc_opt_class();
    v58 = 2112;
    v59 = v4;
    v7 = v57;
    _os_log_impl(&dword_1D02ED000, v6, OS_LOG_TYPE_DEFAULT, "Setting %ld menu items for %{public}@: %@", buf, 0x20u);

  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = (NSMutableArray *)objc_msgSend(v4, "mutableCopy");
  menuItems = self->_menuItems;
  self->_menuItems = v10;

  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v50 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v18, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v15);
  }

  v20 = MEMORY[0x1E0C809B0];
  v21 = (void *)MEMORY[0x1E0DC3F10];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __46__CCUIMenuModuleViewController__setMenuItems___block_invoke;
  v43[3] = &unk_1E8E20730;
  v43[4] = self;
  v22 = v12;
  v44 = v22;
  v23 = v8;
  v45 = v23;
  v24 = v13;
  v46 = v24;
  v25 = v9;
  v47 = v25;
  v26 = v30;
  v48 = v26;
  objc_msgSend(v21, "performWithoutAnimation:", v43);
  if (objc_msgSend(v26, "count") || objc_msgSend(v25, "count") || objc_msgSend(v23, "count"))
  {
    if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
    {
      v42[0] = v20;
      v42[1] = 3221225472;
      v42[2] = __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_19;
      v42[3] = &unk_1E8E20590;
      v42[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v42);
    }
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = (void *)MEMORY[0x1E0DC3F10];
    v35[0] = v20;
    v35[1] = 3221225472;
    v35[2] = __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_2;
    v35[3] = &unk_1E8E20730;
    v36 = v25;
    v37 = v22;
    v38 = self;
    v39 = v27;
    v40 = v26;
    v41 = v23;
    v31[0] = v20;
    v31[1] = 3221225472;
    v31[2] = __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_4;
    v31[3] = &unk_1E8E20780;
    v32 = v39;
    v33 = v41;
    v34 = self;
    v29 = v39;
    objc_msgSend(v28, "animateWithDuration:animations:completion:", v35, v31, 0.3);
    -[CCUIMenuModuleViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");

  }
}

void __46__CCUIMenuModuleViewController__setMenuItems___block_invoke(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  CCUIMenuModuleItemView *v19;
  CCUIMenuModuleItemView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  unint64_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  unint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  unint64_t v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "loadViewIfNeeded");
  objc_msgSend(*((id *)a1[4] + 134), "arrangedSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v45 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v8, "menuItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          objc_msgSend(a1[6], "addObject:", v8);
        objc_msgSend(v3, "setObject:forKey:", v8, v10);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v5);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v38 = a1[7];
  v13 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v38);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v18);
        v19 = (CCUIMenuModuleItemView *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = v19;
          -[CCUIMenuModuleItemView menuItem](v19, "menuItem");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isEqual:", v17) & 1) == 0)
            objc_msgSend(a1[8], "addObject:", v20);

        }
        else
        {
          v20 = -[CCUIMenuModuleItemView initWithMenuItem:]([CCUIMenuModuleItemView alloc], "initWithMenuItem:", v17);
          -[CCUIMenuModuleItemView setIndentation:](v20, "setIndentation:", *((_QWORD *)a1[4] + 153));
          -[CCUIMenuModuleItemView setUseTrailingCheckmarkLayout:](v20, "setUseTrailingCheckmarkLayout:", *((unsigned __int8 *)a1[4] + 1188));
          -[CCUIMenuModuleItemView setUseTrailingInset:](v20, "setUseTrailingInset:", *((unsigned __int8 *)a1[4] + 1189));
          objc_msgSend(a1[4], "_leadingViewForMenuItem:", v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[CCUIMenuModuleItemView setLeadingView:](v20, "setLeadingView:", v22);

          objc_msgSend(a1[4], "_trailingViewForMenuItem:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[CCUIMenuModuleItemView setTrailingView:](v20, "setTrailingView:", v23);

          objc_msgSend(a1[4], "preferredExpandedContentWidth");
          -[CCUIMenuModuleItemView setPreferredMaxLayoutWidth:](v20, "setPreferredMaxLayoutWidth:");
          -[CCUIMenuModuleItemView setHidden:](v20, "setHidden:", 1);
          objc_msgSend(a1[9], "addObject:", v20);
          -[CCUIMenuModuleItemView updateSubviewsAlpha:](v20, "updateSubviewsAlpha:", 0.0);
        }
        objc_msgSend(v12, "addObject:", v20);

      }
      v14 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v14);
  }

  v24 = v12;
  if (objc_msgSend(v12, "count"))
  {
    v25 = 0;
    v26 = 0;
    while (1)
    {
      objc_msgSend(v24, "objectAtIndex:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)a1[4] + 134), "arrangedSubviews");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 >= objc_msgSend(v28, "count"))
        break;
      objc_msgSend(*((id *)a1[4] + 134), "arrangedSubviews");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndex:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        goto LABEL_31;
      objc_msgSend(v30, "menuItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "isPlaceholder") & 1) != 0)
        goto LABEL_30;
      v31 = objc_msgSend(a1[6], "containsObject:", v30);

      if ((v31 & 1) == 0)
        goto LABEL_31;
LABEL_37:
      ++v26;

      if (v25 >= objc_msgSend(v24, "count"))
        goto LABEL_38;
    }
    v30 = 0;
LABEL_30:

LABEL_31:
    if (v30 != v27)
    {
      objc_msgSend(*((id *)a1[4] + 134), "arrangedSubviews");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      if (v26 > v33)
      {
        objc_msgSend(*((id *)a1[4] + 134), "arrangedSubviews");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v34, "count");

        v35 = CCUILogUserInterface;
        if (os_log_type_enabled((os_log_t)CCUILogUserInterface, OS_LOG_TYPE_FAULT))
        {
          v36 = *((_QWORD *)a1[4] + 134);
          *(_DWORD *)buf = 134218498;
          v49 = v26;
          v50 = 2112;
          v51 = v36;
          v52 = 2048;
          v53 = v33;
          _os_log_fault_impl(&dword_1D02ED000, v35, OS_LOG_TYPE_FAULT, "Incoming menu item view is inserted at index %lul which is out of bounds for container: %@, count: %lul.", buf, 0x20u);
        }
      }
      objc_msgSend(*((id *)a1[4] + 134), "insertArrangedSubview:atIndex:", v27, v26);
    }
    ++v25;
    goto LABEL_37;
  }
LABEL_38:
  objc_msgSend(a1[4], "viewIfLoaded");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "layoutIfNeeded");

}

uint64_t __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreferredContentSize");
}

void __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_2(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  BOOL v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = *(id *)(a1 + 32);
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v57 != v40)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v3, "menuItem");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = *(void **)(a1 + 40);
        objc_msgSend(v4, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "setMenuItem:", v7);
        objc_msgSend(v3, "leadingView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "_leadingViewForMenuItem:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "trailingView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "_trailingViewForMenuItem:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0DC3F10];
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_3;
        v50[3] = &unk_1E8E20730;
        v50[4] = v3;
        v13 = v9;
        v51 = v13;
        v52 = v8;
        v53 = *(id *)(a1 + 56);
        v14 = v11;
        v54 = v14;
        v15 = v10;
        v55 = v15;
        v16 = v8;
        objc_msgSend(v12, "performWithoutAnimation:", v50);
        if (v13)
          v17 = v16 == 0;
        else
          v17 = 0;
        if (v17)
        {
          v19 = 1.0;
          v20 = v13;
          goto LABEL_16;
        }
        if (v13)
          v18 = 1;
        else
          v18 = v16 == 0;
        if (!v18)
        {
          v19 = 0.0;
          v20 = v15;
LABEL_16:
          objc_msgSend(v20, "setAlpha:", v19);
        }
        if (v14 && !v15)
        {
          v21 = 1.0;
          v22 = v14;
LABEL_23:
          objc_msgSend(v22, "setAlpha:", v21);
          goto LABEL_24;
        }
        if (!v14 && v15)
        {
          v21 = 0.0;
          v22 = v15;
          goto LABEL_23;
        }
LABEL_24:
        objc_msgSend(*(id *)(a1 + 48), "viewIfLoaded");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setNeedsLayout");

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v41);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v24 = *(id *)(a1 + 64);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v47 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
        objc_msgSend(v29, "updateSubviewsAlpha:", 1.0);
        objc_msgSend(v29, "setHidden:", 0);
        objc_msgSend(*(id *)(a1 + 48), "viewIfLoaded");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setNeedsLayout");

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
    }
    while (v26);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v31 = *(id *)(a1 + 72);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
        objc_msgSend(v36, "updateSubviewsAlpha:", 0.0);
        objc_msgSend(v36, "setHidden:", 1);
        objc_msgSend(*(id *)(a1 + 48), "viewIfLoaded");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setNeedsLayout");

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
    }
    while (v33);
  }

  objc_msgSend(*(id *)(a1 + 48), "_updateMenuItemsSeparatorVisiblity");
  objc_msgSend(*(id *)(a1 + 48), "viewIfLoaded");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layoutIfNeeded");

}

void *__46__CCUIMenuModuleViewController__setMenuItems___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *result;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "setLeadingView:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    if (!v3)
      objc_msgSend(v2, "setAlpha:", 0.0);
  }
  else if (v3)
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:");
  }
  objc_msgSend(*(id *)(a1 + 32), "setTrailingView:", *(_QWORD *)(a1 + 64));
  result = *(void **)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  if (result)
  {
    if (!v5)
      return (void *)objc_msgSend(result, "setAlpha:", 0.0);
  }
  else if (v5)
  {
    return (void *)objc_msgSend(*(id *)(a1 + 56), "addObject:");
  }
  return result;
}

void __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_4(uint64_t a1, int a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0DC3F10];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_5;
    v6[3] = &unk_1E8E20758;
    v7 = *(id *)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v8 = v4;
    v9 = v5;
    objc_msgSend(v3, "performWithoutAnimation:", v6);

  }
}

void __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_5(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "removeFromSuperview");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v4);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = a1[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
        objc_msgSend(*((id *)a1[6] + 134), "removeArrangedSubview:", v12, (_QWORD)v17);
        objc_msgSend(v12, "removeFromSuperview");
        v13 = (void *)*((_QWORD *)a1[6] + 136);
        objc_msgSend(v12, "menuItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectForKey:", v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v9);
  }

  objc_msgSend(a1[6], "_updateMenuItemsSeparatorVisiblity");
  objc_msgSend(a1[6], "viewIfLoaded");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutIfNeeded");

}

- (id)menuItemForIdentifier:(id)a3
{
  id v4;
  NSMutableArray *menuItems;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  menuItems = self->_menuItems;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__CCUIMenuModuleViewController_menuItemForIdentifier___block_invoke;
  v9[3] = &unk_1E8E207A8;
  v10 = v4;
  v6 = v4;
  -[NSMutableArray bs_firstObjectPassingTest:](menuItems, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __54__CCUIMenuModuleViewController_menuItemForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (void)setUseIndentedLayout:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  -[CCUIMenuModuleViewController setIndentation:](self, "setIndentation:", v3);
}

- (id)leadingImageForMenuItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[CCUIMenuModuleViewController useTrailingCheckmarkLayout](self, "useTrailingCheckmarkLayout")
    || !objc_msgSend(v4, "isSelected"))
  {
    v8 = 0;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    -[CCUIMenuModuleViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "checkmarkImageForPreferredContentSizeCategory:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)leadingViewForMenuItem:(id)a3
{
  void *v3;
  void *v4;

  -[CCUIMenuModuleViewController leadingImageForMenuItem:](self, "leadingImageForMenuItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v3);
    objc_msgSend(v4, "setContentMode:", 4);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_leadingViewForMenuItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  if ((objc_msgSend(v4, "isPlaceholder") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__CCUIMenuModuleViewController__leadingViewForMenuItem___block_invoke;
    v8[3] = &unk_1E8E207D0;
    v10 = &v11;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v5, "performWithoutAnimation:", v8);

  }
  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __56__CCUIMenuModuleViewController__leadingViewForMenuItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "leadingViewForMenuItem:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)trailingImageForMenuItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[CCUIMenuModuleViewController useTrailingCheckmarkLayout](self, "useTrailingCheckmarkLayout")
    && objc_msgSend(v4, "isSelected"))
  {
    v5 = (void *)objc_opt_class();
    -[CCUIMenuModuleViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "checkmarkImageForPreferredContentSizeCategory:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)trailingViewForMenuItem:(id)a3
{
  id v4;
  NSMutableDictionary *identiferToActivityIndicatorView;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "isBusy"))
  {
    identiferToActivityIndicatorView = self->_identiferToActivityIndicatorView;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](identiferToActivityIndicatorView, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 1);
      objc_msgSend(v7, "startAnimating");
      v8 = self->_identiferToActivityIndicatorView;
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, v9);

    }
    v10 = self->_identiferToActivityIndicatorView;
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CCUIMenuModuleViewController trailingImageForMenuItem:](self, "trailingImageForMenuItem:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
      objc_msgSend(v12, "setContentMode:", 4);
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)_trailingViewForMenuItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  if ((objc_msgSend(v4, "isPlaceholder") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__CCUIMenuModuleViewController__trailingViewForMenuItem___block_invoke;
    v8[3] = &unk_1E8E207D0;
    v10 = &v11;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v5, "performWithoutAnimation:", v8);

  }
  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __57__CCUIMenuModuleViewController__trailingViewForMenuItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "trailingViewForMenuItem:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)menuItemCount
{
  return -[NSMutableArray count](self->_menuItems, "count");
}

- (unint64_t)actionsCount
{
  return -[NSMutableArray count](self->_menuItems, "count");
}

- (void)removeAllActions
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__CCUIMenuModuleViewController_removeAllActions__block_invoke;
  v2[3] = &unk_1E8E20590;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

uint64_t __48__CCUIMenuModuleViewController_removeAllActions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "arrangedSubviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "removeFromSuperview");
        objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setNeedsLayout");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "removeAllObjects");
}

- (void)_updatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
  {
    -[CCUIMenuModuleViewController preferredExpandedContentWidth](self, "preferredExpandedContentWidth");
    v4 = v3;
    -[CCUIMenuModuleViewController preferredExpandedContentHeightWithWidth:](self, "preferredExpandedContentHeightWithWidth:");
    v6 = v5;
    -[CCUIMenuModuleViewController viewIfLoaded](self, "viewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    -[CCUIMenuModuleViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
  }
}

- (void)setFooterButtonTitle:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  CCUIMenuModuleItem *v8;
  void *v9;
  void *v10;
  CCUIMenuModuleItem *v11;
  CCUIMenuModuleItemView *footerButtonView;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  CCUIMenuModuleItem *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  CCUIMenuModuleItem *v21;
  _QWORD v22[5];
  CCUIMenuModuleItem *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  CCUIMenuModuleItem *v26;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v8 = [CCUIMenuModuleItem alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CCUIMenuModuleItem initWithTitle:identifier:handler:](v8, "initWithTitle:identifier:handler:", v6, v10, v7);

  footerButtonView = self->_footerButtonView;
  if (footerButtonView)
  {
    -[CCUIMenuModuleItemView menuItem](footerButtonView, "menuItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = BSEqualStrings();

    v16 = (void *)MEMORY[0x1E0DC3F10];
    if (v15)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke_3;
      v22[3] = &unk_1E8E20708;
      v22[4] = self;
      v23 = v11;
      objc_msgSend(v16, "performWithoutAnimation:", v22);
      v17 = v23;
    }
    else
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke_4;
      v20[3] = &unk_1E8E20708;
      v20[4] = self;
      v21 = v11;
      objc_msgSend(v16, "animateWithDuration:animations:", v20, 0.3);
      v17 = v21;
    }
  }
  else
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = (void *)MEMORY[0x1E0DC3F10];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke;
    v25[3] = &unk_1E8E20708;
    v25[4] = self;
    v26 = v11;
    objc_msgSend(v19, "performWithoutAnimation:", v25);
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke_2;
    v24[3] = &unk_1E8E20590;
    v24[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v24, 0.3);
    v17 = v26;
  }

  -[CCUIMenuModuleViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

void __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke(uint64_t a1)
{
  CCUIMenuModuleItemView *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = -[CCUIMenuModuleItemView initWithMenuItem:]([CCUIMenuModuleItemView alloc], "initWithMenuItem:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1160);
  *(_QWORD *)(v3 + 1160) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "setSeparatorVisible:", 0);
  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[145];
  objc_msgSend(v5, "preferredExpandedContentWidth");
  objc_msgSend(v6, "setPreferredMaxLayoutWidth:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160));
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v7 + 1176))
  {
    objc_msgSend(*(id *)(v7 + 1104), "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1192);

    v7 = *(_QWORD *)(a1 + 32);
    if (v8 != v9)
    {
      objc_msgSend(*(id *)(v7 + 1192), "insertSubview:belowSubview:", *(_QWORD *)(v7 + 1104), *(_QWORD *)(v7 + 1096));
      v7 = *(_QWORD *)(a1 + 32);
    }
  }
  objc_msgSend((id)v7, "viewIfLoaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

}

void __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1168) = 1;
  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

uint64_t __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "setMenuItem:", *(_QWORD *)(a1 + 40));
}

void __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "setMenuItem:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)removeFooterButton
{
  _QWORD v3[5];
  _QWORD v4[5];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_footerButtonView)
  {
    v3[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __50__CCUIMenuModuleViewController_removeFooterButton__block_invoke;
    v4[3] = &unk_1E8E20590;
    v4[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __50__CCUIMenuModuleViewController_removeFooterButton__block_invoke_2;
    v3[3] = &unk_1E8E207F8;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v4, v3, 0.3);
  }
  if (self->_customContentView)
  {
    if (!self->_customContentViewScrolls)
      -[UIView removeFromSuperview](self->_darkeningBackgroundView, "removeFromSuperview");
  }
}

void __50__CCUIMenuModuleViewController_removeFooterButton__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1168) = 0;
  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

uint64_t __50__CCUIMenuModuleViewController_removeFooterButton__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1160);
  *(_QWORD *)(v2 + 1160) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_updatePreferredContentSize");
}

- (UIView)contentView
{
  -[CCUIMenuModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_contentView;
}

- (BOOL)hasFooterButton
{
  return self->_footerButtonView != 0;
}

- (void)setCustomContentView:(id)a3
{
  UIView *v5;
  UIView **p_customContentView;
  UIView *customContentView;
  UIView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *v15;
  UIView *contentView;
  UIView *v17;

  v5 = (UIView *)a3;
  p_customContentView = &self->_customContentView;
  customContentView = self->_customContentView;
  if (customContentView == v5)
    goto LABEL_12;
  v17 = v5;
  if (customContentView)
  {
    -[UIView removeFromSuperview](customContentView, "removeFromSuperview");
    v8 = *p_customContentView;
    *p_customContentView = 0;

    v5 = v17;
    self->_customContentViewScrolls = 0;
  }
  if (!v5)
  {
    -[UIScrollView addSubview:](self->_contentScrollView, "addSubview:", self->_menuItemsContainer);
    -[UIView insertSubview:belowSubview:](self->_contentView, "insertSubview:belowSubview:", self->_darkeningBackgroundView, self->_contentScrollView);
    self->_customContentViewScrolls = 0;

    return;
  }
  -[UIStackView removeFromSuperview](self->_menuItemsContainer, "removeFromSuperview");
  -[UIScrollView addSubview:](self->_contentScrollView, "addSubview:", v17);
  objc_storeStrong((id *)&self->_customContentView, a3);
  -[CCUIMenuModuleViewController preferredExpandedContentWidth](self, "preferredExpandedContentWidth");
  -[CCUIMenuModuleViewController scrollViewContentHeightForWidth:](self, "scrollViewContentHeightForWidth:");
  v10 = v9;
  -[CCUIMenuModuleViewController preferredExpandedContentHeight](self, "preferredExpandedContentHeight");
  v12 = v11;
  -[CCUIMenuModuleViewController headerHeight](self, "headerHeight");
  v14 = v12 - v13;
  self->_customContentViewScrolls = v10 > v14;
  if (v10 <= v14 && !self->_shouldShowFooterButton)
  {
    -[UIView removeFromSuperview](self->_darkeningBackgroundView, "removeFromSuperview");
    goto LABEL_11;
  }
  -[UIView superview](self->_darkeningBackgroundView, "superview");
  v15 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;

  v5 = v17;
  if (v15 != contentView)
  {
    -[UIView insertSubview:belowSubview:](self->_contentView, "insertSubview:belowSubview:", self->_darkeningBackgroundView, self->_contentScrollView);
LABEL_11:
    v5 = v17;
  }
LABEL_12:

}

- (BOOL)prefersContextMenuDisplayStyle
{
  return 0;
}

void __43__CCUIMenuModuleViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "visualStylingProviderForCategory:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = v4;
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 1064);
      *(_QWORD *)(v7 + 1064) = v6;

      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, v9);

    v4 = v10;
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CCUIMenuModuleViewController;
  v7 = a4;
  -[CCUIMenuModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__CCUIMenuModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E8E20848;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __83__CCUIMenuModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutViewSubviews");
}

- (BOOL)_canShowWhileLocked
{
  uint64_t v2;

  v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIMenuModuleViewController;
  v4 = a3;
  -[CCUIButtonModuleViewController setTitle:](&v5, sel_setTitle_, v4);
  -[UILabel setText:](self->_titleLabel, "setText:", v4, v5.receiver, v5.super_class);

}

- (void)setSubtitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_subtitle, a3);
  v5 = a3;
  -[UILabel setText:](self->_subtitleLabel, "setText:", v5);

}

- (void)scrollToTop:(BOOL)a3
{
  -[UIScrollView setContentOffset:animated:](self->_contentScrollView, "setContentOffset:animated:", a3, 0.0, 0.0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)contentModuleWillTransitionToExpandedContentMode:(BOOL)a3
{
  UISelectionFeedbackGenerator *feedbackGenerator;

  feedbackGenerator = self->_feedbackGenerator;
  if (a3)
    -[UISelectionFeedbackGenerator userInteractionStarted](feedbackGenerator, "userInteractionStarted");
  else
    -[UISelectionFeedbackGenerator userInteractionEnded](feedbackGenerator, "userInteractionEnded");
}

- (BOOL)shouldPerformClickInteraction
{
  return !-[CCUIMenuModuleViewController prefersContextMenuDisplayStyle](self, "prefersContextMenuDisplayStyle");
}

- (BOOL)_forceLimitContentSizeCategoryFromContentHeightIfNecessary:(double)a3 expanded:(BOOL)a4
{
  double v7;

  if (self->_forceLimitContentSizeCategory || !a4)
    return 0;
  -[CCUIMenuModuleViewController _aggregateModuleHeight](self, "_aggregateModuleHeight", a4);
  return v7 > a3
      && -[CCUIMenuModuleViewController _setForceLimitContentSizeCategory:](self, "_setForceLimitContentSizeCategory:", 1);
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CCUIMenuModuleViewController;
  -[CCUIButtonModuleViewController willTransitionToExpandedContentMode:](&v7, sel_willTransitionToExpandedContentMode_);
  if (!v3)
    self->_allowsMenuInteraction = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__CCUIMenuModuleViewController_willTransitionToExpandedContentMode___block_invoke;
  v5[3] = &unk_1E8E206B8;
  v5[4] = self;
  v6 = v3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
  -[CCUIMenuModuleViewController preferredExpandedContentHeight](self, "preferredExpandedContentHeight");
  if (-[CCUIMenuModuleViewController _forceLimitContentSizeCategoryFromContentHeightIfNecessary:expanded:](self, "_forceLimitContentSizeCategoryFromContentHeightIfNecessary:expanded:", v3))
  {
    -[CCUIMenuModuleItemView layoutIfNeeded](self->_footerButtonView, "layoutIfNeeded");
  }
  -[CCUIMenuModuleViewController _setRootViewClipsToBounds:](self, "_setRootViewClipsToBounds:", v3);
  -[CCUIMenuModuleViewController _setTransformViewClipsToBounds:](self, "_setTransformViewClipsToBounds:", 0);
}

uint64_t __68__CCUIMenuModuleViewController_willTransitionToExpandedContentMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "buttonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighlighted:", 0);

  objc_msgSend(*(id *)(a1 + 32), "buttonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", *(_BYTE *)(a1 + 40) == 0);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CCUIMenuModuleViewController;
  -[CCUIButtonModuleViewController didTransitionToExpandedContentMode:](&v6, sel_didTransitionToExpandedContentMode_);
  if (v3)
  {
    self->_allowsMenuInteraction = 1;
    -[CCUIMenuModuleViewController _setRootViewClipsToBounds:](self, "_setRootViewClipsToBounds:", 0);
    -[CCUIMenuModuleViewController _setTransformViewClipsToBounds:](self, "_setTransformViewClipsToBounds:", 1);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__CCUIMenuModuleViewController_didTransitionToExpandedContentMode___block_invoke;
    v5[3] = &unk_1E8E20590;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
  }
}

uint64_t __67__CCUIMenuModuleViewController_didTransitionToExpandedContentMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMenuItems:", MEMORY[0x1E0C9AA60]);
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return -[CCUIMenuModuleViewController menuItemCount](self, "menuItemCount") || self->_customContentView != 0;
}

- (void)setGlyphImage:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleViewController;
  -[CCUIButtonModuleViewController setGlyphImage:](&v4, sel_setGlyphImage_, a3);
  -[CCUIMenuModuleViewController _updateTitleFont](self, "_updateTitleFont");
  -[CCUIMenuModuleViewController _updateSubtitleFont](self, "_updateSubtitleFont");
}

- (void)setGlyphPackageDescription:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleViewController;
  -[CCUIButtonModuleViewController setGlyphPackageDescription:](&v4, sel_setGlyphPackageDescription_, a3);
  -[CCUIMenuModuleViewController _updateTitleFont](self, "_updateTitleFont");
  -[CCUIMenuModuleViewController _updateSubtitleFont](self, "_updateSubtitleFont");
}

- (BOOL)showsMenuAsPrimaryAction
{
  return 0;
}

- (NSString)menuDisplayName
{
  return (NSString *)&stru_1E8E21150;
}

- (id)contextMenuItems
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CCUIContextMenuItem *v16;
  id obj;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[CCUIMenuModuleViewController mostRecentMenuItems](self, "mostRecentMenuItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "isSelected");
        v10 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(v8, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "image");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __48__CCUIMenuModuleViewController_contextMenuItems__block_invoke;
        v19[3] = &unk_1E8E20870;
        v19[4] = v8;
        objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setState:", v9);
        objc_msgSend(v8, "subtitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v8, "subtitle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setSubtitle:", v15);

        }
        v16 = -[CCUIContextMenuItem initWithMenuElement:]([CCUIContextMenuItem alloc], "initWithMenuElement:", v13);
        objc_msgSend(v3, "addObject:", v16);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

  return v3;
}

uint64_t __48__CCUIMenuModuleViewController_contextMenuItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAction");
}

- (UIMenu)contextMenu
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[CCUIMenuModuleViewController mostRecentMenuItems](self, "mostRecentMenuItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "isSelected");
        v10 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(v8, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "image");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __43__CCUIMenuModuleViewController_contextMenu__block_invoke;
        v19[3] = &unk_1E8E20870;
        v19[4] = v8;
        objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setState:", v9);
        objc_msgSend(v8, "subtitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v8, "subtitle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setSubtitle:", v15);

        }
        objc_msgSend(v3, "addObject:", v13);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return (UIMenu *)v16;
}

uint64_t __43__CCUIMenuModuleViewController_contextMenu__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAction");
}

- (void)_handleActionTapped:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id WeakRetained;
  id v8;
  id v9;

  v4 = a3;
  if (self->_allowsMenuInteraction)
  {
    v9 = v4;
    objc_msgSend(v4, "menuItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "performAction");

    v4 = v9;
    if (v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_contentModuleContext);

      if (WeakRetained)
      {
        v8 = objc_loadWeakRetained((id *)&self->_contentModuleContext);
        objc_msgSend(v8, "dismissModule");

      }
      else
      {
        -[CCUIMenuModuleViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      }
      v4 = v9;
    }
  }

}

uint64_t __60__CCUIMenuModuleViewController__layoutBusyIndicatorForSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "buttonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceLayoutDirection");

  UIRectIntegralWithScale();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setFrame:");
}

- (double)_contentScaleForSize:(CGSize)a3
{
  double width;
  double v5;
  void *v6;
  CGRect v8;
  CGRect v9;

  width = a3.width;
  v5 = 1.0;
  if (!-[CCUIButtonModuleViewController isExpanded](self, "isExpanded", a3.width, a3.height))
  {
    -[UIView bounds](self->_contentView, "bounds");
    if (!CGRectIsEmpty(v8))
    {
      -[CCUIMenuModuleViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v5 = width / CGRectGetWidth(v9);

    }
  }
  return v5;
}

- (void)_setView:(id)a3 clipsToBounds:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__CCUIMenuModuleViewController__setView_clipsToBounds___block_invoke;
  v8[3] = &unk_1E8E206B8;
  v9 = v5;
  v10 = a4;
  v7 = v5;
  objc_msgSend(v6, "performWithoutAnimation:", v8);

}

void __55__CCUIMenuModuleViewController__setView_clipsToBounds___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setClipsToBounds:", *(unsigned __int8 *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    v3 = CCUIExpandedModuleContinuousCornerRadius();
  else
    v3 = 0.0;
  objc_msgSend(v2, "_setContinuousCornerRadius:", v3);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (*(_BYTE *)(a1 + 40))
    v5 = 12;
  else
    v5 = 0;
  objc_msgSend(v4, "setMaskedCorners:", v5);

}

- (void)_setRootViewClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CCUIMenuModuleViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController _setView:clipsToBounds:](self, "_setView:clipsToBounds:", v5, v3);

}

- (void)_setTransformViewClipsToBounds:(BOOL)a3
{
  -[CCUIMenuModuleViewController _setView:clipsToBounds:](self, "_setView:clipsToBounds:", self->_transformView, a3);
}

- (void)_updateMenuItemsSeparatorVisiblity
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIStackView arrangedSubviews](self->_menuItemsContainer, "arrangedSubviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[UIStackView arrangedSubviews](self->_menuItemsContainer, "arrangedSubviews");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSeparatorVisible:", v8 != v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (BOOL)_toggleSelectionForMenuItem:(id)a3
{
  CCUIMenuModuleItemView *v4;
  CCUIMenuModuleItemView *footerButtonView;
  _BOOL8 v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  CCUIMenuModuleItemView *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (CCUIMenuModuleItemView *)a3;
  footerButtonView = self->_footerButtonView;
  if (v4)
  {
    v6 = footerButtonView == v4;
    if (v6 == -[CCUIMenuModuleItemView isHighlighted](footerButtonView, "isHighlighted"))
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 0;
    v7 = 0;
    if ((-[CCUIMenuModuleItemView isHighlighted](footerButtonView, "isHighlighted") & 1) == 0)
      goto LABEL_6;
  }
  -[CCUIMenuModuleItemView setHighlighted:](self->_footerButtonView, "setHighlighted:", v6);
  v7 = 1;
LABEL_6:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIStackView arrangedSubviews](self->_menuItemsContainer, "arrangedSubviews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(CCUIMenuModuleItemView **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[CCUIMenuModuleItemView isHighlighted](v13, "isHighlighted") != (v13 == v4))
        {
          -[CCUIMenuModuleItemView setHighlighted:](v13, "setHighlighted:", v13 == v4);
          v7 = 1;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7 & 1;
}

- (void)_handlePressGesture:(id)a3
{
  BOOL v4;
  UILongPressGestureRecognizer *pressGestureRecognizer;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  id v30;

  v30 = a3;
  if (objc_msgSend(v30, "state") == 1)
  {
    v4 = -[CCUIButtonModuleViewController isExpanded](self, "isExpanded");
    self->_ignoreMenuItemAtTouchLocationAfterExpanded = !v4;
    if (!v4)
    {
      pressGestureRecognizer = self->_pressGestureRecognizer;
      -[CCUIMenuModuleViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILongPressGestureRecognizer locationInView:](pressGestureRecognizer, "locationInView:", v7);
      self->_touchLocationToIgnore.x = v8;
      self->_touchLocationToIgnore.y = v9;

    }
  }
  -[CCUIMenuModuleViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "locationInView:", v10);
  v12 = v11;
  v14 = v13;

  -[CCUIMenuModuleViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hitTest:withEvent:", 0, v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  if (v17)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  if (self->_allowsMenuInteraction)
  {
    if (self->_ignoreMenuItemAtTouchLocationAfterExpanded)
    {
      -[CCUIMenuModuleViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIMenuModuleViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "convertPoint:fromView:", v23, self->_touchLocationToIgnore.x, self->_touchLocationToIgnore.y);
      v25 = v24;
      v27 = v26;

      -[CCUIMenuModuleViewController view](self, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hitTest:withEvent:", 0, v25, v27);
      v29 = (id)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_15;
    }
    else
    {
      v29 = 0;
      if (!v20)
        goto LABEL_15;
    }
    if (v20 == v29)
    {
LABEL_20:

      goto LABEL_21;
    }
LABEL_15:
    self->_ignoreMenuItemAtTouchLocationAfterExpanded = 0;
    if (-[CCUIMenuModuleViewController _toggleSelectionForMenuItem:](self, "_toggleSelectionForMenuItem:", v20))
      -[UISelectionFeedbackGenerator selectionChanged](self->_feedbackGenerator, "selectionChanged");
    if (v20 && objc_msgSend(v30, "state") == 3)
      -[CCUIMenuModuleViewController _handleActionTapped:](self, "_handleActionTapped:", v20);
    goto LABEL_20;
  }
LABEL_21:

}

- (BOOL)_shouldHideGlyphForLimitedContentSizeCategory
{
  _BOOL4 v2;

  v2 = -[CCUIMenuModuleViewController _shouldLimitContentSizeCategory](self, "_shouldLimitContentSizeCategory");
  if (v2)
    LOBYTE(v2) = (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") - 3) < 2;
  return v2;
}

- (id)_preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  -[CCUIMenuModuleViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CCUIMenuModuleViewController _shouldLimitContentSizeCategory](self, "_shouldLimitContentSizeCategory"))
  {
    v9 = (id)*MEMORY[0x1E0DC48D0];

    v8 = v9;
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v6, a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __62__CCUIMenuModuleViewController__updateLeadingAndTrailingViews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "menuItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSelected"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_leadingViewForMenuItem:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeadingView:", v4);

    objc_msgSend(*(id *)(a1 + 32), "_trailingViewForMenuItem:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTrailingView:", v5);

  }
}

- (double)_aggregateModuleHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v8;

  -[CCUIMenuModuleViewController headerHeight](self, "headerHeight");
  v4 = v3;
  -[UIView frame](self->_contentView, "frame");
  v5 = v4 + CGRectGetHeight(v8);
  -[CCUIMenuModuleViewController _footerHeight](self, "_footerHeight");
  return v5 + v6;
}

- (BOOL)_shouldShowFooterSeparator
{
  return -[CCUIMenuModuleViewController _shouldShowFooterChin](self, "_shouldShowFooterChin")
      || self->_shouldShowFooterButton;
}

- (unint64_t)minimumMenuItems
{
  return self->_minimumMenuItems;
}

- (unint64_t)indentation
{
  return self->_indentation;
}

- (BOOL)isBusy
{
  return self->_busy;
}

- (BOOL)shouldProvideOwnPlatter
{
  return self->_shouldProvideOwnPlatter;
}

- (void)setShouldProvideOwnPlatter:(BOOL)a3
{
  self->_shouldProvideOwnPlatter = a3;
}

- (BOOL)useTrailingCheckmarkLayout
{
  return self->_useTrailingCheckmarkLayout;
}

- (BOOL)useTrailingInset
{
  return self->_useTrailingInset;
}

- (void)setUseTrailingInset:(BOOL)a3
{
  self->_useTrailingInset = a3;
}

- (BOOL)useTallLayout
{
  return self->_useTallLayout;
}

- (void)setUseTallLayout:(BOOL)a3
{
  self->_useTallLayout = a3;
}

- (CCUIContentModuleContext)contentModuleContext
{
  return (CCUIContentModuleContext *)objc_loadWeakRetained((id *)&self->_contentModuleContext);
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeWeak((id *)&self->_contentModuleContext, a3);
}

- (BOOL)hideGlyphInHeader
{
  return self->_hideGlyphInHeader;
}

- (void)setHideGlyphInHeader:(BOOL)a3
{
  self->_hideGlyphInHeader = a3;
}

- (CCUIMenuItemsUpdating)menuUpdatingDelegate
{
  return (CCUIMenuItemsUpdating *)objc_loadWeakRetained((id *)&self->_menuUpdatingDelegate);
}

- (void)setMenuUpdatingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_menuUpdatingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuUpdatingDelegate);
  objc_destroyWeak((id *)&self->_contentModuleContext);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_storeStrong((id *)&self->_footerButtonView, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_busyIndicatorView, 0);
  objc_storeStrong((id *)&self->_darkeningBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_identiferToActivityIndicatorView, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_menuItemsContainer, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_platterMaterialView, 0);
  objc_storeStrong((id *)&self->_footerSeparatorView, 0);
  objc_storeStrong((id *)&self->_headerSeparatorView, 0);
  objc_storeStrong((id *)&self->_transformView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
