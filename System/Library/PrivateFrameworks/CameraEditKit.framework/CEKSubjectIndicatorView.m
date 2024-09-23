@implementation CEKSubjectIndicatorView

- (CEKSubjectIndicatorView)initWithFrame:(CGRect)a3
{
  CEKSubjectIndicatorView *v3;
  UIView *v4;
  UIView *containerView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UIImageView *topLeftCornerView;
  uint64_t v18;
  UIImageView *topRightCornerView;
  uint64_t v20;
  UIImageView *bottomLeftCornerView;
  uint64_t v22;
  UIImageView *bottomRightCornerView;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  UIImageView *fullSizeIndicatorView;
  CEKSubjectIndicatorView *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)CEKSubjectIndicatorView;
  v3 = -[CEKSubjectIndicatorView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    containerView = v3->__containerView;
    v3->__containerView = v4;

    -[CEKSubjectIndicatorView addSubview:](v3, "addSubview:", v3->__containerView);
    v6 = (void *)MEMORY[0x1E0DC3870];
    CEKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:", CFSTR("CEKSubjectIndicatorCornerInactive"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3870];
    CEKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("CEKSubjectIndicatorCornerActiveThick"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "size");
    v13 = v12 + -1.0;
    objc_msgSend(v8, "resizableImageWithCapInsets:resizingMode:", 1, v13, v13, 0.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "resizableImageWithCapInsets:resizingMode:", 1, v13, v13, 0.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:highlightedImage:", v15, v14);
    topLeftCornerView = v3->__topLeftCornerView;
    v3->__topLeftCornerView = (UIImageView *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:highlightedImage:", v15, v14);
    topRightCornerView = v3->__topRightCornerView;
    v3->__topRightCornerView = (UIImageView *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:highlightedImage:", v15, v14);
    bottomLeftCornerView = v3->__bottomLeftCornerView;
    v3->__bottomLeftCornerView = (UIImageView *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:highlightedImage:", v15, v14);
    bottomRightCornerView = v3->__bottomRightCornerView;
    v3->__bottomRightCornerView = (UIImageView *)v22;

    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__topLeftCornerView);
    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__topRightCornerView);
    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__bottomLeftCornerView);
    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__bottomRightCornerView);
    v24 = (void *)MEMORY[0x1E0DC3870];
    CEKFrameworkBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "imageNamed:inBundle:", CFSTR("CEKSubjectIndicatorRect"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageWithRenderingMode:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v27);
    fullSizeIndicatorView = v3->__fullSizeIndicatorView;
    v3->__fullSizeIndicatorView = (UIImageView *)v28;

    -[UIImageView setContentMode:](v3->__fullSizeIndicatorView, "setContentMode:", 0);
    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__fullSizeIndicatorView);
    v3->_shape = 1;
    v30 = v3;

  }
  return v3;
}

- (void)setInactive:(BOOL)a3
{
  if (self->_inactive != a3)
  {
    self->_inactive = a3;
    -[CEKSubjectIndicatorView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShape:(int64_t)a3
{
  -[CEKSubjectIndicatorView setShape:animated:](self, "setShape:animated:", a3, 0);
}

- (void)setShape:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v6[5];

  if (self->_shape != a3)
  {
    if (a4)
    {
      -[CEKSubjectIndicatorView layoutIfNeeded](self, "layoutIfNeeded");
      self->_shape = a3;
      -[CEKSubjectIndicatorView setNeedsLayout](self, "setNeedsLayout");
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __45__CEKSubjectIndicatorView_setShape_animated___block_invoke;
      v6[3] = &unk_1E70A4B18;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v6, 0, 0.4, 0.0);
    }
    else
    {
      self->_shape = a3;
      -[CEKSubjectIndicatorView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __45__CEKSubjectIndicatorView_setShape_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

+ (CGSize)fixedSizeWithScale:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  v7 = v6;
  v9 = v8;

  objc_msgSend(a1, "_fixedSubjectIndicatorSizeForReferenceBounds:withScale:", v7, v9, a3);
  v11 = v10 + -3.0 + -3.0;
  v13 = v12 + -3.0 + -3.0;
  result.height = v13;
  result.width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[CEKSubjectIndicatorView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  +[CEKSubjectIndicatorView fixedSizeWithScale:](CEKSubjectIndicatorView, "fixedSizeWithScale:", v5);
  result.height = v7;
  result.width = v6;
  return result;
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
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int64_t v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
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
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL8 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  CGAffineTransform v67;
  CGAffineTransform v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  objc_super v73;

  v73.receiver = self;
  v73.super_class = (Class)CEKSubjectIndicatorView;
  -[CEKSubjectIndicatorView layoutSubviews](&v73, sel_layoutSubviews);
  -[CEKSubjectIndicatorView bounds](self, "bounds");
  v4 = v3 + 6.0;
  v6 = v5 + 6.0;
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  UIRectGetCenter();
  v10 = v9;
  v12 = v11;
  -[CEKSubjectIndicatorView _containerView](self, "_containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBounds:", v7, v8, v4, v6);
  objc_msgSend(v13, "setCenter:", v10, v12);
  -[CEKSubjectIndicatorView _topLeftCornerView](self, "_topLeftCornerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v17 = v16;
  v19 = v18;

  v20 = -[CEKSubjectIndicatorView shape](self, "shape");
  if ((unint64_t)(v20 - 1) < 2)
  {
    if (v4 >= v6)
      v29 = v6;
    else
      v29 = v4;
    v30 = v29 * 0.4;
    if (v19 >= v30)
      v19 = v30;
    if (v17 >= v30)
      v17 = v30;
    v31 = -[CEKSubjectIndicatorView shape](self, "shape");
    v32 = 1.0;
    if (v31 == 2)
      v32 = 2.5;
    v23 = v17 * v32;
    UIRoundToViewScale();
    v28 = v33;
    v26 = 0;
    v22 = v4 - v33;
    v21 = v6 - v19;
    v27 = 0.0;
    goto LABEL_15;
  }
  v22 = *MEMORY[0x1E0C9D648];
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (v20 == 3)
  {
    v26 = 1;
  }
  else
  {
    if (!v20)
    {
      UIRoundToViewScale();
      v23 = v24;
      UIRoundToViewScale();
      v21 = v25;
      v26 = 0;
      v27 = 0.0;
      v22 = v23;
      v19 = v25;
      v28 = v23;
LABEL_15:
      v34 = 0.0;
      goto LABEL_19;
    }
    v26 = 0;
  }
  v28 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v27 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v34 = *MEMORY[0x1E0C9D648];
LABEL_19:
  -[CEKSubjectIndicatorView _topLeftCornerView](self, "_topLeftCornerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setHidden:", v26);

  -[CEKSubjectIndicatorView _topRightCornerView](self, "_topRightCornerView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setHidden:", v26);

  -[CEKSubjectIndicatorView _bottomLeftCornerView](self, "_bottomLeftCornerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setHidden:", v26);

  -[CEKSubjectIndicatorView _bottomRightCornerView](self, "_bottomRightCornerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setHidden:", v26);

  -[CEKSubjectIndicatorView _fullSizeIndicatorView](self, "_fullSizeIndicatorView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setHidden:", v26 ^ 1);

  if ((v26 & 1) != 0)
  {
    objc_msgSend(v13, "bounds");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    -[CEKSubjectIndicatorView _fullSizeIndicatorView](self, "_fullSizeIndicatorView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    v50 = v41;
    v51 = v43;
    v52 = v45;
    v53 = v47;
  }
  else
  {
    -[CEKSubjectIndicatorView _topLeftCornerView](self, "_topLeftCornerView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setFrame:", v34, v27, v28, v19);

    -[CEKSubjectIndicatorView _topRightCornerView](self, "_topRightCornerView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFrame:", v22, v27, v23, v19);

    -[CEKSubjectIndicatorView _bottomLeftCornerView](self, "_bottomLeftCornerView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setFrame:", v34, v21, v28, v19);

    -[CEKSubjectIndicatorView _bottomRightCornerView](self, "_bottomRightCornerView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    v50 = v22;
    v51 = v21;
    v52 = v28;
    v53 = v19;
  }
  objc_msgSend(v48, "setFrame:", v50, v51, v52, v53);

  v57 = -[CEKSubjectIndicatorView isInactive](self, "isInactive");
  -[CEKSubjectIndicatorView _topLeftCornerView](self, "_topLeftCornerView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setHighlighted:", v57);

  -[CEKSubjectIndicatorView _topRightCornerView](self, "_topRightCornerView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setHighlighted:", v57);

  -[CEKSubjectIndicatorView _bottomLeftCornerView](self, "_bottomLeftCornerView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setHighlighted:", v57);

  -[CEKSubjectIndicatorView _bottomRightCornerView](self, "_bottomRightCornerView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setHighlighted:", v57);

  if (-[CEKSubjectIndicatorView isInactive](self, "isInactive"))
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSubjectIndicatorView _fullSizeIndicatorView](self, "_fullSizeIndicatorView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setTintColor:", v62);

  CGAffineTransformMakeScale(&v72, -1.0, 1.0);
  -[CEKSubjectIndicatorView _topRightCornerView](self, "_topRightCornerView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v72;
  objc_msgSend(v64, "setTransform:", &v71);

  CGAffineTransformMakeScale(&v70, 1.0, -1.0);
  -[CEKSubjectIndicatorView _bottomLeftCornerView](self, "_bottomLeftCornerView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v70;
  objc_msgSend(v65, "setTransform:", &v69);

  CGAffineTransformMakeScale(&v68, -1.0, -1.0);
  -[CEKSubjectIndicatorView _bottomRightCornerView](self, "_bottomRightCornerView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v68;
  objc_msgSend(v66, "setTransform:", &v67);

}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  BOOL v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[6];

  v5 = a3;
  -[CEKSubjectIndicatorView _containerView](self, "_containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSubjectIndicatorView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationForKey:", CFSTR("opacity"));
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "animationForKey:", CFSTR("transform"));
  v11 = objc_claimAutoreleasedReturnValue();

  -[CEKSubjectIndicatorView alpha](self, "alpha");
  if (v5)
    v13 = 0.0;
  else
    v13 = 1.0;
  if (v5 && !a4)
  {
    objc_msgSend(v8, "removeAnimationForKey:", CFSTR("opacity"));
    objc_msgSend(v9, "removeAnimationForKey:", CFSTR("transform"));
LABEL_7:
    -[CEKSubjectIndicatorView setAlpha:](self, "setAlpha:", v13);
    goto LABEL_16;
  }
  if (v12 == v13)
    goto LABEL_16;
  if (!a4)
    goto LABEL_7;
  if (v5)
  {
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __46__CEKSubjectIndicatorView_setHidden_animated___block_invoke;
    v24[3] = &unk_1E70A4E38;
    v24[4] = self;
    v24[5] = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __46__CEKSubjectIndicatorView_setHidden_animated___block_invoke_2;
    v22[3] = &unk_1E70A4BD0;
    v22[4] = self;
    v23 = v9;
    objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 6, v24, v22, 0.25, 0.0);
    v15 = v23;
  }
  else
  {
    if (!(v11 | v10))
    {
      -[CEKSubjectIndicatorView layoutIfNeeded](self, "layoutIfNeeded");
      memset(&v21, 0, sizeof(v21));
      CGAffineTransformMakeScale(&v21, 1.22279793, 1.22279793);
      v20 = v21;
      objc_msgSend(v7, "setTransform:", &v20);
    }
    v16 = (void *)MEMORY[0x1E0DC3F10];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__CEKSubjectIndicatorView_setHidden_animated___block_invoke_3;
    v17[3] = &unk_1E70A5350;
    v17[4] = self;
    v19 = (v11 | v10) == 0;
    v18 = v7;
    objc_msgSend(v16, "animateWithDuration:delay:options:animations:completion:", 131078, v17, 0, 0.233333333, 0.0);
    v15 = v18;
  }

LABEL_16:
}

uint64_t __46__CEKSubjectIndicatorView_setHidden_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

void __46__CEKSubjectIndicatorView_setHidden_animated___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "alpha");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "animationForKey:", CFSTR("transform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == 0.0 && v4 != 0)
    objc_msgSend(*(id *)(a1 + 40), "removeAnimationForKey:", CFSTR("transform"));
}

uint64_t __46__CEKSubjectIndicatorView_setHidden_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  result = objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v5[0] = *MEMORY[0x1E0C9BAA8];
    v5[1] = v4;
    v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    return objc_msgSend(v3, "setTransform:", v5);
  }
  return result;
}

- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5
{
  -[CEKSubjectIndicatorView startScalingWithExpansionWidth:duration:repeatCount:timingFunction:](self, "startScalingWithExpansionWidth:duration:repeatCount:timingFunction:", a5, 0, a3, a4);
}

- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5 timingFunction:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[8];
  uint8_t buf[8];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  -[CEKSubjectIndicatorView _containerView](self, "_containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "animationForKey:", CFSTR("transform"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = os_log_create("com.apple.camera", "CameraEditKit");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Skipping attempt to scale a CEKSubjectIndicatorView since a transform animation is already in progress";
LABEL_7:
      _os_log_impl(&dword_1B9835000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    }
  }
  else
  {
    -[CEKSubjectIndicatorView bounds](self, "bounds");
    if (v16 == 0.0)
    {
      v14 = os_log_create("com.apple.camera", "CameraEditKit");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v15 = "Attempting to scale a CEKSubjectIndicatorView without having a valid width yet";
        goto LABEL_7;
      }
    }
    else
    {
      v17 = v16;
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale"));
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject setTimingFunction:](v14, "setTimingFunction:", v10);
      -[NSObject setDuration:](v14, "setDuration:", a4);
      v27[0] = &unk_1E70B3ED8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v17 + a3 * 2.0) / v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValues:](v14, "setValues:", v19);

      *(float *)&v20 = (float)a5;
      -[NSObject setRepeatCount:](v14, "setRepeatCount:", v20);
      -[NSObject setAutoreverses:](v14, "setAutoreverses:", 1);
      objc_msgSend(v12, "addAnimation:forKey:", v14, CFSTR("transform"));
      v21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v25[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v25[5] = v21;
      v22 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v25[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v25[7] = v22;
      v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v25[0] = *MEMORY[0x1E0CD2610];
      v25[1] = v23;
      v24 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v25[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v25[3] = v24;
      objc_msgSend(v12, "setTransform:", v25);
    }
  }

}

- (void)stopScalingWithDuration:(double)a3
{
  void *v4;
  void *v5;
  __int128 *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[8];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  -[CEKSubjectIndicatorView _containerView](self, "_containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (__int128 *)MEMORY[0x1E0CD2610];
  if (a3 > 0.0)
  {
    objc_msgSend(v5, "presentationLayer");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = v5;
    v10 = v9;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    if (v10)
      objc_msgSend(v10, "transform");
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDuration:", a3);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimingFunction:", v12);

    v28 = v36;
    v29 = v37;
    v30 = v38;
    v31 = v39;
    v24 = v32;
    v25 = v33;
    v26 = v34;
    v27 = v35;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFromValue:", v13);

    v14 = v6[5];
    v28 = v6[4];
    v29 = v14;
    v15 = v6[7];
    v30 = v6[6];
    v31 = v15;
    v16 = v6[1];
    v24 = *v6;
    v25 = v16;
    v17 = v6[3];
    v26 = v6[2];
    v27 = v17;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setToValue:", v18);

    objc_msgSend(v5, "addAnimation:forKey:", v11, CFSTR("stopScalingAnimation"));
  }
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("transform"));
  v19 = v6[5];
  v23[4] = v6[4];
  v23[5] = v19;
  v20 = v6[7];
  v23[6] = v6[6];
  v23[7] = v20;
  v21 = v6[1];
  v23[0] = *v6;
  v23[1] = v21;
  v22 = v6[3];
  v23[2] = v6[2];
  v23[3] = v22;
  objc_msgSend(v5, "setTransform:", v23);

}

- (BOOL)isPulsing
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[CEKSubjectIndicatorView _containerView](self, "_containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("opacity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)setPulsing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  if (-[CEKSubjectIndicatorView isPulsing](self, "isPulsing") != a3)
  {
    -[CEKSubjectIndicatorView _containerView](self, "_containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      objc_msgSend(v5, "setAlpha:", 1.0);
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __38__CEKSubjectIndicatorView_setPulsing___block_invoke;
      v9[3] = &unk_1E70A4B18;
      v10 = v5;
      objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 30, v9, 0, 0.25, 0.0);

    }
    else
    {
      objc_msgSend(v6, "removeAnimationForKey:", CFSTR("opacity"));
      objc_msgSend(v5, "setAlpha:", 1.0);
    }

  }
}

uint64_t __38__CEKSubjectIndicatorView_setPulsing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.35);
}

+ (CGSize)_fixedSubjectIndicatorSizeForReferenceBounds:(CGSize)a3 withScale:(double)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  UIRoundToScale();
  v5 = v4;
  UIRoundToScale();
  v7 = v6;
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (BOOL)isInactive
{
  return self->_inactive;
}

- (int64_t)shape
{
  return self->_shape;
}

- (UIImageView)_topLeftCornerView
{
  return self->__topLeftCornerView;
}

- (UIImageView)_topRightCornerView
{
  return self->__topRightCornerView;
}

- (UIImageView)_bottomLeftCornerView
{
  return self->__bottomLeftCornerView;
}

- (UIImageView)_bottomRightCornerView
{
  return self->__bottomRightCornerView;
}

- (UIImageView)_fullSizeIndicatorView
{
  return self->__fullSizeIndicatorView;
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_storeStrong((id *)&self->__fullSizeIndicatorView, 0);
  objc_storeStrong((id *)&self->__bottomRightCornerView, 0);
  objc_storeStrong((id *)&self->__bottomLeftCornerView, 0);
  objc_storeStrong((id *)&self->__topRightCornerView, 0);
  objc_storeStrong((id *)&self->__topLeftCornerView, 0);
}

@end
