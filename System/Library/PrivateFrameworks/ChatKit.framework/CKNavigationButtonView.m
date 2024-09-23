@implementation CKNavigationButtonView

- (CKNavigationButtonView)initWithImage:(id)a3 text:(id)a4 wantsLongPress:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CKNavigationButtonView *v14;
  CKNavigationButtonView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  objc_super v37;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CKNavigationButtonView;
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = -[CKNavigationButtonView initWithFrame:](&v37, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v11, v12, v13);
  v15 = v14;
  if (v14)
  {
    -[CKNavigationButtonView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 1);
    -[CKNavigationButtonView setClipsToBounds:](v15, "setClipsToBounds:", 0);
    -[CKNavigationButtonView setWantsLongPress:](v15, "setWantsLongPress:", v5);
    -[CKNavigationButtonView setEnabled:](v15, "setEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1100);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEABA8], "_effectForBlurEffect:vibrancyStyle:", v16, 110);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavigationButtonView setVibrancyEffect:](v15, "setVibrancyEffect:", v17);
    v15->_wantsVibrancy = 1;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v17);
    objc_msgSend(v18, "setUserInteractionEnabled:", 0);
    -[CKNavigationButtonView setVibrancyView:](v15, "setVibrancyView:", v18);
    -[CKNavigationButtonView addSubview:](v15, "addSubview:", v18);
    if (v9)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v10, v11, v12, v13);
      -[CKNavigationButtonView setTextLabel:](v15, "setTextLabel:", v19);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "theme");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "navBarGrayColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKNavigationButtonView textLabel](v15, "textLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTextColor:", v22);

      +[CKUIBehavior fontWithStyle:adjustedForMaxSizeCategory:](CKUIBehavior, "fontWithStyle:adjustedForMaxSizeCategory:", *MEMORY[0x1E0CEB550], *MEMORY[0x1E0CEB400]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKNavigationButtonView textLabel](v15, "textLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setFont:", v24);

      -[CKNavigationButtonView setText:](v15, "setText:", v9);
      -[CKNavigationButtonView textLabel](v15, "textLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v9);

      -[CKNavigationButtonView textLabel](v15, "textLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTextAlignment:", 1);

      objc_msgSend(v18, "contentView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKNavigationButtonView textLabel](v15, "textLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addSubview:", v29);

    }
    if (v8)
    {
      v30 = (void *)MEMORY[0x1E0CEA650];
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "navbarButtonImagePointSize");
      objc_msgSend(v30, "configurationWithPointSize:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "imageWithSymbolConfiguration:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "imageWithRenderingMode:", 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKNavigationButtonView setImage:](v15, "setImage:", v34);

      -[CKNavigationButtonView image](v15, "image");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKNavigationButtonView setDefaultImage:](v15, "setDefaultImage:", v35);

      -[CKNavigationButtonView _setupIconImageView](v15, "_setupIconImageView");
    }

  }
  return v15;
}

- (CKNavigationButtonView)initWithImage:(id)a3 disabledImage:(id)a4 text:(id)a5 wantsLongPress:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  UIImage *v12;
  UIImage *disabledImage;
  CKNavigationButtonView *v14;

  v6 = a6;
  v10 = a5;
  v11 = a3;
  objc_msgSend(a4, "imageWithRenderingMode:", 2);
  v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  disabledImage = self->_disabledImage;
  self->_disabledImage = v12;

  v14 = -[CKNavigationButtonView initWithImage:text:wantsLongPress:](self, "initWithImage:text:wantsLongPress:", v11, v10, v6);
  return v14;
}

- (void)_setupIconImageView
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];

  -[CKNavigationButtonView iconImageView](self, "iconImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navbarButtonImagePointSize");
    v7 = v6;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navbarButtonImagePointSize");
    v10 = (void *)objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, v7, v9);
    -[CKNavigationButtonView setIconImageView:](self, "setIconImageView:", v10);

    -[CKNavigationButtonView iconImageView](self, "iconImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentMode:", 1);

    -[CKNavigationButtonView iconImageView](self, "iconImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "theme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "navBarGrayColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", v15);

    -[CKNavigationButtonView vibrancyView](self, "vibrancyView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavigationButtonView iconImageView](self, "iconImageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

  }
  -[CKNavigationButtonView _imageForCurrentState](self, "_imageForCurrentState");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[CKNavigationButtonView iconImageView](self, "iconImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setImage:", v20);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __45__CKNavigationButtonView__setupIconImageView__block_invoke;
  v21[3] = &unk_1E274A208;
  v21[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v21);

}

uint64_t __45__CKNavigationButtonView__setupIconImageView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (id)_imageForCurrentState
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[CKNavigationButtonView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKNavigationButtonView state](self, "state") == 2)
  {
    -[CKNavigationButtonView disabledImage](self, "disabledImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CKNavigationButtonView disabledImage](self, "disabledImage");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
  }
  return v3;
}

- (void)setJoinButtonStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (setJoinButtonStyle__onceToken != -1)
    dispatch_once(&setJoinButtonStyle__onceToken, &__block_literal_global_251);
  if (self->_joinButtonStyle != a3)
  {
    self->_joinButtonStyle = a3;
    -[CKNavigationButtonView iconImageView](self, "iconImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[CKNavigationButtonView setIconImageView:](self, "setIconImageView:", 0);
    switch(self->_joinButtonStyle)
    {
      case 1:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "enabledFacetimeVideoImagePill");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0CEA478];
        v12 = CFSTR("CKSystemGreenColor");
        goto LABEL_11;
      case 2:
      case 3:
        v6 = (void *)setJoinButtonStyle__videoImage;
        goto LABEL_8;
      case 4:
      case 5:
        v6 = (void *)setJoinButtonStyle__audioImage;
LABEL_8:
        v7 = (void *)MEMORY[0x1E0CEA478];
        v8 = CFSTR("CKSystemGreenColor");
        goto LABEL_13;
      case 6:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "enabledExpanseImagePill");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0CEA478];
        v12 = CFSTR("CKSystemBlueColor");
LABEL_11:
        objc_msgSend(v11, "ckColorNamed:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _joinPillImage(v10, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNavigationButtonView setImage:](self, "setImage:", v14);

        break;
      case 7:
        v6 = (void *)setJoinButtonStyle__expanseImage;
        v7 = (void *)MEMORY[0x1E0CEA478];
        v8 = CFSTR("CKSystemBlueColor");
LABEL_13:
        objc_msgSend(v7, "ckColorNamed:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        _circularGlyphImage(v6, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNavigationButtonView setImage:](self, "setImage:", v16);

        break;
      default:
        -[CKNavigationButtonView setImage:](self, "setImage:", self->_defaultImage);
        break;
    }
    -[CKNavigationButtonView _setupIconImageView](self, "_setupIconImageView");
    -[CKNavigationButtonView setNeedsLayout](self, "setNeedsLayout");
  }
}

void __45__CKNavigationButtonView_setJoinButtonStyle___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "enabledFacetimeVideoImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemGreenColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_flatImageWithColor:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)setJoinButtonStyle__videoImage;
  setJoinButtonStyle__videoImage = v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enabledFacetimeAudioImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemGreenColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_flatImageWithColor:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)setJoinButtonStyle__audioImage;
  setJoinButtonStyle__audioImage = v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "enabledExpanseImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_flatImageWithColor:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)setJoinButtonStyle__expanseImage;
  setJoinButtonStyle__expanseImage = v12;

}

- (void)setWantsVibrancy:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_wantsVibrancy != a3)
  {
    self->_wantsVibrancy = a3;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__CKNavigationButtonView_setWantsVibrancy___block_invoke;
    v6[3] = &unk_1E275A218;
    v7 = a3;
    v6[4] = self;
    __43__CKNavigationButtonView_setWantsVibrancy___block_invoke((uint64_t)v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavigationButtonView vibrancyView](self, "vibrancyView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEffect:", v4);

  }
}

id __43__CKNavigationButtonView_setWantsVibrancy___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_BYTE *)(a1 + 40))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isEnabled") & 1) != 0)
    {
      v2 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "disabledVibrancyEffect");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "isEnabled") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "vibrancyEffect");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = v2;
    }
    v3 = v4;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int64_t joinButtonStyle;
  double v31;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
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
  void *v54;
  objc_super v55;

  v55.receiver = self;
  v55.super_class = (Class)CKNavigationButtonView;
  -[CKNavigationButtonView layoutSubviews](&v55, sel_layoutSubviews);
  -[CKNavigationButtonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7 + 40.0;
  v10 = v9 + -20.0;
  -[CKNavigationButtonView vibrancyView](self, "vibrancyView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v10, v4, v8, v6);

  -[CKNavigationButtonView vibrancyView](self, "vibrancyView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;

  -[CKNavigationButtonView iconImageView](self, "iconImageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CKNavigationButtonView image](self, "image");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "size");
    v20 = v19;
    v22 = v21;

    if (CKMainScreenScale_once_99 != -1)
      dispatch_once(&CKMainScreenScale_once_99, &__block_literal_global_132);
    v23 = *(double *)&CKMainScreenScale_sMainScreenScale_99;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_99 == 0.0)
      v23 = 1.0;
    v24 = v20 * v23;
    v25 = v22 * v23;
    v26 = v14 * v23 + floor((v16 * v23 - v20 * v23) * 0.5);
    v27 = 1.0 / v23;
    v28 = v27 * v26;
    v29 = v24 * v27;
    joinButtonStyle = self->_joinButtonStyle;
    v31 = v25 * v27;
    if (joinButtonStyle == 6 || joinButtonStyle == 1)
      v33 = 1.5;
    else
      v33 = 0.0;
    -[CKNavigationButtonView iconImageView](self, "iconImageView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFrame:", v28, v33, v29, v31);

  }
  -[CKNavigationButtonView textLabel](self, "textLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isAccessibilityPreferredContentSizeCategory");

    -[CKNavigationButtonView textLabel](self, "textLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sizeToFit");

    -[CKNavigationButtonView textLabel](self, "textLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "frame");
    v41 = v40;
    v43 = v42;

    -[CKNavigationButtonView bounds](self, "bounds");
    if (v44 < v41)
      v41 = v44;
    if (CKMainScreenScale_once_99 != -1)
      dispatch_once(&CKMainScreenScale_once_99, &__block_literal_global_132);
    v45 = *(double *)&CKMainScreenScale_sMainScreenScale_99;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_99 == 0.0)
      v45 = 1.0;
    v46 = v41 * v45;
    v47 = v43 * v45;
    v48 = v14 * v45 + floor((v16 * v45 - v41 * v45) * 0.5);
    v49 = 1.0 / v45;
    v50 = v49 * v48;
    v51 = v46 * v49;
    v52 = v47 * v49;
    if (v37)
      v53 = 30.0;
    else
      v53 = 26.0;
    -[CKNavigationButtonView textLabel](self, "textLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setFrame:", v50, v53, v51, v52);

  }
}

- (void)setEnabled:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKNavigationButtonView;
  -[CKNavigationButtonView setEnabled:](&v17, sel_setEnabled_);
  -[CKNavigationButtonView _imageForCurrentState](self, "_imageForCurrentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavigationButtonView iconImageView](self, "iconImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "theme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navBarGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKNavigationButtonView disabledVibrancyEffect](self, "disabledVibrancyEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1100);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEABA8], "_effectForBlurEffect:vibrancyStyle:", v8, 111);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKNavigationButtonView setDisabledVibrancyEffect:](self, "setDisabledVibrancyEffect:", v3);

    }
    objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CKNavigationButtonView textLabel](self, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  if (v4)
  {

    -[CKNavigationButtonView vibrancyEffect](self, "vibrancyEffect");
  }
  else
  {
    -[CKNavigationButtonView disabledVibrancyEffect](self, "disabledVibrancyEffect");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavigationButtonView vibrancyView](self, "vibrancyView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEffect:", v11);

  if (v4)
  {

    if (-[CKNavigationButtonView wantsVibrancy](self, "wantsVibrancy"))
    {
      -[CKNavigationButtonView vibrancyEffect](self, "vibrancyEffect");
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v14 = (void *)v13;
      v15 = !v4;
      goto LABEL_16;
    }
  }
  else
  {

    if (-[CKNavigationButtonView wantsVibrancy](self, "wantsVibrancy"))
    {
      -[CKNavigationButtonView disabledVibrancyEffect](self, "disabledVibrancyEffect");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  v4 = 0;
  v15 = 0;
  v14 = 0;
LABEL_16:
  -[CKNavigationButtonView vibrancyView](self, "vibrancyView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEffect:", v14);

  if (v15)
  if (v4)

}

- (int64_t)joinButtonStyle
{
  return self->_joinButtonStyle;
}

- (BOOL)wantsVibrancy
{
  return self->_wantsVibrancy;
}

- (UIButton)imageButton
{
  return self->_imageButton;
}

- (BOOL)wantsLongPress
{
  return self->_wantsLongPress;
}

- (void)setWantsLongPress:(BOOL)a3
{
  self->_wantsLongPress = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIImage)defaultImage
{
  return self->_defaultImage;
}

- (void)setDefaultImage:(id)a3
{
  objc_storeStrong((id *)&self->_defaultImage, a3);
}

- (UIImage)disabledImage
{
  return self->_disabledImage;
}

- (void)setDisabledImage:(id)a3
{
  objc_storeStrong((id *)&self->_disabledImage, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyView, a3);
}

- (UIVisualEffect)vibrancyEffect
{
  return self->_vibrancyEffect;
}

- (void)setVibrancyEffect:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyEffect, a3);
}

- (UIVisualEffect)disabledVibrancyEffect
{
  return self->_disabledVibrancyEffect;
}

- (void)setDisabledVibrancyEffect:(id)a3
{
  objc_storeStrong((id *)&self->_disabledVibrancyEffect, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 840);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_disabledVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_disabledImage, 0);
  objc_storeStrong((id *)&self->_defaultImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageButton, 0);
}

@end
