@implementation CAMFlipButton

+ (CAMFlipButton)flipButtonWithLayoutStyle:(int64_t)a3
{
  void *v4;

  +[CAMFlipButton buttonWithType:](CAMFlipButton, "buttonWithType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_commonCAMFlipButtonInitializationWithStyle:overContent:", a3, 0);
  return (CAMFlipButton *)v4;
}

- (void)_updateImages
{
  unint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  -[CAMFlipButton _imageView](self, "_imageView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[CAMFlipButton layoutStyle](self, "layoutStyle");
  -[CAMFlipButton mainImageNameForAccessibilityHUD:](self, "mainImageNameForAccessibilityHUD:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMFlipButton _useCTMAppearance](self, "_useCTMAppearance");
  v6 = (void *)MEMORY[0x1E0DC3870];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemImageNamed:withConfiguration:", v4, v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = (void *)v8;

    v7 = v10;
    goto LABEL_7;
  }
  CAMCameraUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:", v4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 <= 4 && v3 != 1)
  {
    objc_msgSend(v7, "imageWithRenderingMode:", 2);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v11, "setImage:", v7);

}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (id)mainImageNameForAccessibilityHUD:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  __CFString *v6;
  int v7;
  __CFString *v8;
  const __CFString *v9;

  v3 = a3;
  v5 = -[CAMFlipButton _useCTMAppearance](self, "_useCTMAppearance");
  switch(-[CAMFlipButton layoutStyle](self, "layoutStyle"))
  {
    case 0:
      v6 = CFSTR("CAMFlipButton");
      if (!v3)
      {
        v7 = dyld_program_sdk_at_least();
        v8 = CFSTR("CAMLegacyFlipButton");
        if (v7)
          v8 = CFSTR("CAMFlipButton");
        v6 = v8;
      }
      if (!v5)
        goto LABEL_18;
      goto LABEL_16;
    case 1:
    case 3:
      v6 = CFSTR("CAMFlipButtonPad");
      if (!v5)
        goto LABEL_18;
      goto LABEL_16;
    case 2:
      v6 = CFSTR("CAMFlipButtonTiny");
      if (!v5)
        goto LABEL_18;
      goto LABEL_16;
    case 4:
      if (v3)
        v6 = CFSTR("CAMFlipButton");
      else
        v6 = CFSTR("CAMFlipButton-d22");
      if (!v5)
        goto LABEL_18;
      goto LABEL_16;
    default:
      v6 = 0;
      if (v5)
      {
LABEL_16:
        v9 = CFSTR("arrow.triangle.2.circlepath");
      }
      else
      {
LABEL_18:
        if (!v3)
          return v6;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-AXHUD"), v6);
        v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }

      v6 = (__CFString *)v9;
      return v6;
  }
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[CAMFlipButton setImageEdgeInsets:](self, "setImageEdgeInsets:");
    -[CAMFlipButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMFlipButton _imageView](self, "_imageView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v6, a3, v4);

  }
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[CAMFlipButton _circleBackgroundView](self, "_circleBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    -[CAMFlipButton _imageView](self, "_imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v7 = v11;
    v9 = v12;

  }
  v13 = v7;
  v14 = v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_tappableEdgeInsets.top;
  left = self->_tappableEdgeInsets.left;
  bottom = self->_tappableEdgeInsets.bottom;
  right = self->_tappableEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
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
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CAMFlipButton;
  -[CAMFlipButton layoutSubviews](&v19, sel_layoutSubviews);
  -[CAMFlipButton _imageView](self, "_imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFlipButton _circleBackgroundView](self, "_circleBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFlipButton bounds](self, "bounds");
  -[CAMFlipButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  UIRectGetCenter();
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v3, "intrinsicContentSize");
  objc_msgSend(v3, "frameForAlignmentRect:", v7, v8, v9, v10);
  v12 = v11;
  v14 = v13;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(v3, "setBounds:", v5, v6, v12, v14);
  if (v4)
  {
    objc_msgSend(v4, "intrinsicContentSize");
    v16 = v15;
    v18 = v17;
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v4, "setCenter:");
    objc_msgSend(v4, "setBounds:", v5, v6, v16, v18);
  }

}

- (void)_commonCAMFlipButtonInitializationWithStyle:(int64_t)a3 overContent:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIImageView *v14;
  UIImageView *circleBackgroundView;
  id obj;

  v4 = a4;
  self->_layoutStyle = a3;
  self->_orientation = 1;
  obj = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(obj, "setContentMode:", 4);
  objc_msgSend(obj, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setTintColor:", v7);

  objc_storeStrong((id *)&self->__imageView, obj);
  -[CAMFlipButton addSubview:](self, "addSubview:", obj);
  self->__useCTMAppearance = v4;
  if (v4)
  {
    if (a3 != 4)
    {
      if (a3 == 1)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("CAMButtonBackgroundPad");
        goto LABEL_7;
      }
      if (a3)
      {
        v9 = 0;
        goto LABEL_9;
      }
    }
    +[CAMFullscreenViewfinder lightControlBackgroundColor](CAMFullscreenViewfinder, "lightControlBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("CAMButtonBackground");
LABEL_7:
    -[CAMFlipButton setTintColor:](self, "setTintColor:", v8);

LABEL_9:
    v10 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithRenderingMode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v13);
    circleBackgroundView = self->__circleBackgroundView;
    self->__circleBackgroundView = v14;

    -[CAMFlipButton insertSubview:atIndex:](self, "insertSubview:atIndex:", self->__circleBackgroundView, 0);
  }
  -[CAMFlipButton _updateImages](self, "_updateImages");

}

+ (id)flipButtonOverContent
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[CAMFlipButton buttonWithType:](CAMFlipButton, "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cam_initialLayoutStyle");

  objc_msgSend(v2, "_commonCAMFlipButtonInitializationWithStyle:overContent:", v4, 1);
  return v2;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  objc_super v13;

  v3 = a3;
  v5 = -[CAMFlipButton isHighlighted](self, "isHighlighted");
  v13.receiver = self;
  v13.super_class = (Class)CAMFlipButton;
  -[CAMFlipButton setHighlighted:](&v13, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[CAMFlipButton _imageView](self, "_imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CAMFlipButton _useCTMAppearance](self, "_useCTMAppearance"))
    {
      objc_msgSend(v6, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v7, v3, -[CAMFlipButton layoutStyle](self, "layoutStyle"));
    }
    else
    {
      if (v3)
        v8 = 0.1;
      else
        v8 = 0.2;
      v9 = (void *)MEMORY[0x1E0DC3F10];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __32__CAMFlipButton_setHighlighted___block_invoke;
      v10[3] = &unk_1EA328908;
      v11 = v6;
      v12 = v3;
      objc_msgSend(v9, "animateWithDuration:animations:", v10, v8);
      v7 = v11;
    }

  }
}

uint64_t __32__CAMFlipButton_setHighlighted___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.5;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMFlipButton setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMFlipButton _updateImages](self, "_updateImages");
  }
}

- (id)imageForAccessibilityHUD
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  -[CAMFlipButton mainImageNameForAccessibilityHUD:](self, "mainImageNameForAccessibilityHUD:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 72.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFlipButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:", v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v3, v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v12, "imageWithRenderingMode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIImageView)_circleBackgroundView
{
  return self->__circleBackgroundView;
}

- (void)set_circleBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->__circleBackgroundView, a3);
}

- (BOOL)_useCTMAppearance
{
  return self->__useCTMAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__circleBackgroundView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
}

@end
