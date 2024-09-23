@implementation CKCanvasBackButtonView

- (CKCanvasBackButtonView)initWithFrame:(CGRect)a3 showPaddingTitleView:(BOOL)a4
{
  _BOOL8 v4;
  CKCanvasBackButtonView *v5;
  CKCanvasBackButtonView *v6;
  void *v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CKCanvasBackButtonView;
  v5 = -[CKCanvasBackButtonView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[CKCanvasBackButtonView setShouldShowTitlePaddingView:](v5, "setShouldShowTitlePaddingView:", v4);
    -[CKCanvasBackButtonView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("backButton"));
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v6);
    -[CKCanvasBackButtonView addInteraction:](v6, "addInteraction:", v7);

  }
  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CKCanvasBackButtonView;
  -[CKCanvasBackButtonView setHighlighted:](&v5, sel_setHighlighted_);
  -[CKCanvasBackButtonView _setVisuallyHighlighted:](self, "_setVisuallyHighlighted:", v3);
}

- (void)setBackButtonTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    -[CKCanvasBackButtonView titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 0);

    -[CKCanvasBackButtonView titlePaddingView](self, "titlePaddingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    -[CKCanvasBackButtonView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v10);

    -[CKCanvasBackButtonView titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeToFit");

    -[CKCanvasBackButtonView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[CKCanvasBackButtonView titlePaddingView](self, "titlePaddingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

    -[CKCanvasBackButtonView titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

  }
}

- (void)setShouldShowTitlePaddingView:(BOOL)a3
{
  if (self->_shouldShowTitlePaddingView != a3)
  {
    self->_shouldShowTitlePaddingView = a3;
    if (!a3)
      -[CKCanvasBackButtonView setTitlePaddingView:](self, "setTitlePaddingView:", 0);
  }
}

- (UIImageView)backButtonView
{
  UIImageView *backButtonView;
  UIImageView *v4;
  UIImageView *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  backButtonView = self->_backButtonView;
  if (!backButtonView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    v5 = self->_backButtonView;
    self->_backButtonView = v4;

    objc_msgSend(MEMORY[0x1E0CEA638], "kitImageNamed:", CFSTR("UINavigationBarBackIndicatorDefault.png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithRenderingMode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      objc_msgSend(v7, "imageFlippedForRightToLeftLayoutDirection");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    -[UIImageView setImage:](self->_backButtonView, "setImage:", v7);
    -[UIImageView setUserInteractionEnabled:](self->_backButtonView, "setUserInteractionEnabled:", 0);
    -[UIImageView sizeToFit](self->_backButtonView, "sizeToFit");
    -[CKCanvasBackButtonView addSubview:](self, "addSubview:", self->_backButtonView);

    backButtonView = self->_backButtonView;
  }
  return backButtonView;
}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_titleLabel;
    self->_titleLabel = v5;

    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0CEB548]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v7);

    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setUserInteractionEnabled:](self->_titleLabel, "setUserInteractionEnabled:", 0);
    -[CKCanvasBackButtonView titleLabelColor](self, "titleLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[CKCanvasBackButtonView titleLabelColor](self, "titleLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v9);

    -[CKCanvasBackButtonView addSubview:](self, "addSubview:", self->_titleLabel);
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (UIView)titlePaddingView
{
  UIView *titlePaddingView;
  UIView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  UIView *v9;
  void *v10;
  UIView *v11;

  if (-[CKCanvasBackButtonView shouldShowTitlePaddingView](self, "shouldShowTitlePaddingView"))
  {
    titlePaddingView = self->_titlePaddingView;
    if (!titlePaddingView)
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      v5 = self->_titlePaddingView;
      self->_titlePaddingView = v4;

      -[CKCanvasBackButtonView tintColor](self, "tintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_titlePaddingView, "setBackgroundColor:", v6);

      -[UIView setUserInteractionEnabled:](self->_titlePaddingView, "setUserInteractionEnabled:", 0);
      -[UIView layer](self->_titlePaddingView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMasksToBounds:", 0);

      -[UIView layer](self->_titlePaddingView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAllowsEdgeAntialiasing:", 1);

      v9 = self->_titlePaddingView;
      -[CKCanvasBackButtonView titleLabel](self, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKCanvasBackButtonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v9, v10);

      titlePaddingView = self->_titlePaddingView;
    }
    v11 = titlePaddingView;
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKCanvasBackButtonView;
  -[CKCanvasBackButtonView tintColorDidChange](&v11, sel_tintColorDidChange);
  -[CKCanvasBackButtonView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_titlePaddingView, "setBackgroundColor:", v3);

  -[CKCanvasBackButtonView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryFieldDarkEffectButtonColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8)
  {
    -[CKCanvasBackButtonView tintColor](self, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v9);
  }
  else
  {
    -[CKCanvasBackButtonView titleLabelColor](self, "titleLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[CKCanvasBackButtonView titleLabelColor](self, "titleLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v10);

  }
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[CKCanvasBackButtonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[CKCanvasBackButtonView sizeThatFits:](self, "sizeThatFits:", v7, v8);
  -[CKCanvasBackButtonView setBounds:](self, "setBounds:", v4, v6, v9, v10);
  -[CKCanvasBackButtonView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
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

  -[CKCanvasBackButtonView _titlePaddingViewSizeForTitle](self, "_titlePaddingViewSizeForTitle", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  if (-[CKCanvasBackButtonView wantsChromelessAppearance](self, "wantsChromelessAppearance"))
  {
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBarBackButtonMargin");
    v11 = v5 + v10;
  }
  else
  {
    -[CKCanvasBackButtonView backButtonView](self, "backButtonView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v8 = v15;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBarBackButtonMargin");
    v11 = v5 + v14 + v16 + 7.0;
  }

  if (v8 >= v7)
    v17 = v8;
  else
    v17 = v7;
  v18 = v11;
  result.height = v17;
  result.width = v18;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  _BOOL4 v20;
  uint64_t v21;
  double v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double Width;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MinX;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double Height;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  CGFloat rect;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  _QWORD v58[9];
  _QWORD v59[9];
  objc_super v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v60.receiver = self;
  v60.super_class = (Class)CKCanvasBackButtonView;
  -[CKCanvasBackButtonView layoutSubviews](&v60, sel_layoutSubviews);
  -[CKCanvasBackButtonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKCanvasBackButtonView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = -[CKCanvasBackButtonView wantsChromelessAppearance](self, "wantsChromelessAppearance");
  v21 = MEMORY[0x1E0C809B0];
  if (v20)
  {
    v22 = 7.0;
  }
  else
  {
    v51 = v19;
    v55 = v15;
    v56 = v10;
    v57 = v8;
    -[CKCanvasBackButtonView backButtonView](self, "backButtonView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    v52 = v17;
    v53 = v6;
    rect = v27;
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection"))
    {
      v61.origin.x = v4;
      v61.origin.y = v6;
      v61.size.height = v56;
      v61.size.width = v57;
      Width = CGRectGetWidth(v61);
      v62.origin.x = v25;
      v62.origin.y = v27;
      v62.size.width = v29;
      v62.size.height = v31;
      v33 = Width - CGRectGetWidth(v62);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "navigationBarBackButtonMargin");
      v36 = v33 - v35;
      if (CKMainScreenScale_once_109 != -1)
        dispatch_once(&CKMainScreenScale_once_109, &__block_literal_global_282);
      v19 = v51;
      v37 = *(double *)&CKMainScreenScale_sMainScreenScale_109;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_109 == 0.0)
        v37 = 1.0;
      v38 = round(v36 * v37) / v37;

      v63.origin.x = v38;
      v63.origin.y = rect;
      v63.size.width = v29;
      v63.size.height = v31;
      MinX = CGRectGetMinX(v63);
      v64.origin.x = v13;
      v64.origin.y = v55;
      v64.size.width = v17;
      v64.size.height = v51;
      v40 = MinX - (CGRectGetWidth(v64) + 7.0);
      if (CKMainScreenScale_once_109 != -1)
        dispatch_once(&CKMainScreenScale_once_109, &__block_literal_global_282);
      v6 = v53;
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "navigationBarBackButtonMargin");
      v38 = v42;

      v65.origin.x = v38;
      v65.origin.y = v27;
      v65.size.width = v29;
      v65.size.height = v31;
      v40 = CGRectGetMaxX(v65) + 7.0;
      if (CKMainScreenScale_once_109 != -1)
        dispatch_once(&CKMainScreenScale_once_109, &__block_literal_global_282);
      v19 = v51;
    }
    v43 = *(double *)&CKMainScreenScale_sMainScreenScale_109;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_109 == 0.0)
      v43 = 1.0;
    v22 = round(v40 * v43) / v43;
    v44 = v4;
    v66.origin.x = v4;
    v66.origin.y = v6;
    v66.size.height = v56;
    v66.size.width = v57;
    v45 = CGRectGetHeight(v66) * 0.5;
    v67.origin.x = v38;
    v67.origin.y = rect;
    v67.size.width = v29;
    v67.size.height = v31;
    v46 = v45 - CGRectGetHeight(v67) * 0.5;
    if (CKMainScreenScale_once_109 != -1)
      dispatch_once(&CKMainScreenScale_once_109, &__block_literal_global_282);
    v47 = *(double *)&CKMainScreenScale_sMainScreenScale_109;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_109 == 0.0)
      v47 = 1.0;
    v59[0] = v21;
    v59[1] = 3221225472;
    v59[2] = __40__CKCanvasBackButtonView_layoutSubviews__block_invoke;
    v59[3] = &unk_1E274B8B8;
    v59[4] = self;
    *(double *)&v59[5] = v38;
    *(double *)&v59[6] = round(v46 * v47) / v47;
    *(CGFloat *)&v59[7] = v29;
    *(CGFloat *)&v59[8] = v31;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v59);
    v4 = v44;
    v17 = v52;
    v6 = v53;
    v10 = v56;
    v8 = v57;
    v15 = v55;
  }
  v68.origin.x = v4;
  v68.origin.y = v6;
  v68.size.width = v8;
  v68.size.height = v10;
  Height = CGRectGetHeight(v68);
  v69.origin.x = v22;
  v69.origin.y = v15;
  v69.size.width = v17;
  v69.size.height = v19;
  v49 = CGRectGetHeight(v69);
  if (CKMainScreenScale_once_109 != -1)
    dispatch_once(&CKMainScreenScale_once_109, &__block_literal_global_282);
  v50 = *(double *)&CKMainScreenScale_sMainScreenScale_109;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_109 == 0.0)
    v50 = 1.0;
  v58[0] = v21;
  v58[1] = 3221225472;
  v58[2] = __40__CKCanvasBackButtonView_layoutSubviews__block_invoke_2;
  v58[3] = &unk_1E274B8B8;
  v58[4] = self;
  *(double *)&v58[5] = v22;
  *(double *)&v58[6] = round((Height * 0.5 - v49 * 0.5) * v50) / v50;
  *(CGFloat *)&v58[7] = v17;
  *(CGFloat *)&v58[8] = v19;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v58);
}

void __40__CKCanvasBackButtonView_layoutSubviews__block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "backButtonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

void __40__CKCanvasBackButtonView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double Width;
  double Height;
  void *v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  id v27;
  CGRect v28;
  CGRect v29;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  if (objc_msgSend(*(id *)(a1 + 32), "shouldShowTitlePaddingView"))
  {
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    objc_msgSend(*(id *)(a1 + 32), "_titlePaddingViewSizeForTitle");
    v10 = v9;
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "titlePaddingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v7, v8, v10, v12);

    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "center");
    v16 = v15;
    v18 = v17;
    objc_msgSend(*(id *)(a1 + 32), "titlePaddingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCenter:", v16, v18);

    v28.origin.x = v7;
    v28.origin.y = v8;
    v28.size.width = v10;
    v28.size.height = v12;
    Width = CGRectGetWidth(v28);
    v29.origin.x = v7;
    v29.origin.y = v8;
    v29.size.width = v10;
    v29.size.height = v12;
    Height = CGRectGetHeight(v29);
    objc_msgSend(*(id *)(a1 + 32), "titlePaddingView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCornerRadius:", Height * 0.5);

    v24 = (uint64_t *)MEMORY[0x1E0CD2A60];
    if (Width != Height)
      v24 = (uint64_t *)MEMORY[0x1E0CD2A68];
    v25 = *v24;
    objc_msgSend(*(id *)(a1 + 32), "titlePaddingView");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCornerCurve:", v25);

  }
}

- (void)_setVisuallyHighlighted:(BOOL)a3
{
  double v3;
  double v4;
  _QWORD v5[6];

  v3 = 1.0;
  if (a3)
    v3 = 0.2;
  v4 = 0.3;
  if (a3)
    v4 = 0.17;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__CKCanvasBackButtonView__setVisuallyHighlighted___block_invoke;
  v5[3] = &unk_1E274C9C0;
  v5[4] = self;
  *(double *)&v5[5] = v3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v5, v4);
}

void __50__CKCanvasBackButtonView__setVisuallyHighlighted___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  if ((objc_msgSend(*(id *)(a1 + 32), "wantsChromelessAppearance") & 1) == 0)
  {
    v4 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "backButtonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", v4);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldShowTitlePaddingView"))
  {
    v6 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "titlePaddingView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", v6);

  }
}

- (CGSize)_titlePaddingViewSizeForTitle
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[CKCanvasBackButtonView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v5 = v4;
  v7 = v6;

  if (v5 < v7)
    v5 = v7;
  -[CKCanvasBackButtonView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "length") <= 1)
    v10 = 2.0;
  else
    v10 = 5.0;

  v11 = v5 + v10 * 2.0;
  v12 = v7 + 4.0;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)pointerInteraction:(id)a3 regionForLocation:(CGPoint)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4 modifiers:(int64_t)a5
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0CEA850], "effectWithPreview:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCanvasBackButtonView frame](self, "frame");
  -[CKCanvasBackButtonView sizeThatFits:](self, "sizeThatFits:", v8, v9);
  v11 = v10;
  -[CKCanvasBackButtonView titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isHidden"))
  {

  }
  else
  {
    -[CKCanvasBackButtonView titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
      goto LABEL_5;
  }
  v11 = v11 + -7.0;
LABEL_5:
  -[CKCanvasBackButtonView frame](self, "frame");
  v17 = v16;
  if (CKMainScreenScale_once_109 != -1)
    dispatch_once(&CKMainScreenScale_once_109, &__block_literal_global_282);
  v18 = *(double *)&CKMainScreenScale_sMainScreenScale_109;
  -[CKCanvasBackButtonView frame](self, "frame");
  v20 = v19;
  -[CKCanvasBackButtonView frame](self, "frame");
  v22 = v21;
  if (CKMainScreenScale_once_109 != -1)
    dispatch_once(&CKMainScreenScale_once_109, &__block_literal_global_282);
  v23 = 1.0;
  if (v18 == 0.0)
    v24 = 1.0;
  else
    v24 = v18;
  v25 = round((v11 * 0.5 + v17 - (v11 + 16.0) * 0.5) * v24) / v24;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_109 != 0.0)
    v23 = *(double *)&CKMainScreenScale_sMainScreenScale_109;
  objc_msgSend(MEMORY[0x1E0CEA878], "shapeWithRoundedRect:", v25, round((v20 + v22 * 0.5 + -18.5) * v23) / v23, v11 + 16.0, 37.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v7, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)setBackButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_backButtonView, a3);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setTitlePaddingView:(id)a3
{
  objc_storeStrong((id *)&self->_titlePaddingView, a3);
}

- (BOOL)shouldShowTitlePaddingView
{
  return self->_shouldShowTitlePaddingView;
}

- (UIColor)titleLabelColor
{
  return self->_titleLabelColor;
}

- (void)setTitleLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelColor, 0);
  objc_storeStrong((id *)&self->_titlePaddingView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backButtonView, 0);
}

@end
