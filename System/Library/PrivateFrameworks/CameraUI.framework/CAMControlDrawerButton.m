@implementation CAMControlDrawerButton

+ (id)_backgroundImage
{
  if (_backgroundImage_onceToken != -1)
    dispatch_once(&_backgroundImage_onceToken, &__block_literal_global_38);
  return (id)_backgroundImage_backgroundImage;
}

void __42__CAMControlDrawerButton__backgroundImage__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("CAMButtonBackground"), v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithRenderingMode:", 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_backgroundImage_backgroundImage;
  _backgroundImage_backgroundImage = v2;

}

+ (CGSize)buttonSize
{
  double v2;
  double v3;
  _QWORD block[5];
  CGSize result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CAMControlDrawerButton_buttonSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (buttonSize_onceToken != -1)
    dispatch_once(&buttonSize_onceToken, block);
  v2 = *(double *)&buttonSize_size_0;
  v3 = *(double *)&buttonSize_size_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __36__CAMControlDrawerButton_buttonSize__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_backgroundImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  buttonSize_size_0 = v1;
  buttonSize_size_1 = v2;

}

- (CAMControlDrawerButton)initWithLayoutStyle:(int64_t)a3
{
  CAMControlDrawerButton *v4;
  CAMControlDrawerButton *v5;
  UIImageView *v6;
  UIImageView *imageView;
  void *v8;
  uint64_t v9;
  UIImageView *backgroundView;
  CAMSlashView *v11;
  CAMSlashView *slashView;
  void *v13;
  CAMSlashMaskView *v14;
  CAMSlashMaskView *slashMaskView;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CAMControlDrawerButton;
  v4 = -[CAMControlDrawerButton initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_layoutStyle = a3;
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v5->__imageView;
    v5->__imageView = v6;

    objc_msgSend((id)objc_opt_class(), "_backgroundImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
    backgroundView = v5->__backgroundView;
    v5->__backgroundView = (UIImageView *)v9;

    -[CAMControlDrawerButton addSubview:](v5, "addSubview:", v5->__backgroundView);
    -[CAMControlDrawerButton addSubview:](v5, "addSubview:", v5->__imageView);
    if (-[CAMControlDrawerButton shouldUseSlash](v5, "shouldUseSlash"))
    {
      v11 = objc_alloc_init(CAMSlashView);
      slashView = v5->__slashView;
      v5->__slashView = v11;

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSlashView setTintColor:](v5->__slashView, "setTintColor:", v13);

      -[CAMControlDrawerButton addSubview:](v5, "addSubview:", v5->__slashView);
      v14 = objc_alloc_init(CAMSlashMaskView);
      slashMaskView = v5->__slashMaskView;
      v5->__slashMaskView = v14;

      -[UIImageView setMaskView:](v5->__imageView, "setMaskView:", v5->__slashMaskView);
    }
    -[CAMControlDrawerButton addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", v5, sel_handleButtonReleased_, 64);
    -[CAMControlDrawerButton updateImage](v5, "updateImage");
    -[CAMControlDrawerButton setExclusiveTouch:](v5, "setExclusiveTouch:", 1);

  }
  return v5;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "buttonSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
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
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CAMControlDrawerButton;
  -[CAMControlDrawerButton layoutSubviews](&v24, sel_layoutSubviews);
  -[CAMControlDrawerButton bounds](self, "bounds");
  -[CAMControlDrawerButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  UIRectGetCenter();
  -[CAMControlDrawerButton _imageView](self, "_imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  UIRectCenteredAboutPointScale();
  objc_msgSend(v3, "frameForAlignmentRect:");
  CAMViewSetBoundsAndCenterForFrame(v3, v4, v5, v6, v7);
  -[CAMControlDrawerButton _backgroundView](self, "_backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intrinsicContentSize");
  UIRectCenteredAboutPointScale();
  objc_msgSend(v8, "setFrame:");
  if (-[CAMControlDrawerButton shouldUseSlash](self, "shouldUseSlash"))
  {
    -[CAMControlDrawerButton _slashView](self, "_slashView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBounds:", 0.0, 0.0, 20.0, 20.0);

    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    v11 = v10;
    v13 = v12;
    -[CAMControlDrawerButton _slashView](self, "_slashView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCenter:", v11, v13);

    objc_msgSend(v3, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[CAMControlDrawerButton _slashMaskView](self, "_slashMaskView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

    -[CAMControlDrawerButton _updateSlashAnimated:](self, "_updateSlashAnimated:", 0);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawerButton traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
    -[CAMControlDrawerButton didChangeContentSize](self, "didChangeContentSize");

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v5 = -[CAMControlDrawerButton isHighlighted](self, "isHighlighted");
  v10.receiver = self;
  v10.super_class = (Class)CAMControlDrawerButton;
  -[CAMControlDrawerButton setHighlighted:](&v10, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    if (-[CAMControlDrawerButton shouldScaleImageWhileHighlighted](self, "shouldScaleImageWhileHighlighted"))
    {
      -[CAMControlDrawerButton _imageView](self, "_imageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v7, v3, -[CAMControlDrawerButton layoutStyle](self, "layoutStyle"));

      -[CAMControlDrawerButton _slashView](self, "_slashView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v9, v3, -[CAMControlDrawerButton layoutStyle](self, "layoutStyle"));

    }
  }
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  -[CAMControlDrawerButton imageForAXHUD](self, "imageForAXHUD", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3418]);
  v5 = (void *)objc_msgSend(v4, "initWithTitle:image:imageInsets:scaleImage:", 0, v3, 1, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

  return v5;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  -[CAMControlDrawerButton cancelTouchTracking](self, "cancelTouchTracking", a3);
  -[CAMControlDrawerButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (BOOL)isExpandable
{
  return 0;
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMControlDrawerButton setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMControlDrawerButton _imageView](self, "_imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v7, a3, v4);

    -[CAMControlDrawerButton _slashView](self, "_slashView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v8, a3, v4);

  }
}

- (int64_t)controlType
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("%@ must be implemented by subclasses"), v4);

  return 0;
}

- (BOOL)shouldScaleImageWhileHighlighted
{
  return 1;
}

- (void)updateImage
{
  -[CAMControlDrawerButton updateImageAnimated:](self, "updateImageAnimated:", 0);
}

- (void)updateImageAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[CAMControlDrawerButton imageForCurrentState](self, "imageForCurrentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawerButton _imageView](self, "_imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  if (-[CAMControlDrawerButton shouldUseActiveTintForCurrentState](self, "shouldUseActiveTintForCurrentState"))
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawerButton _imageView](self, "_imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

  -[CAMControlDrawerButton setNeedsLayout](self, "setNeedsLayout");
  if (-[CAMControlDrawerButton shouldUseSlash](self, "shouldUseSlash"))
    -[CAMControlDrawerButton _updateSlashAnimated:](self, "_updateSlashAnimated:", v3);

}

- (id)imageForCurrentState
{
  void *v3;
  void *v4;

  -[CAMControlDrawerButton imageNameForCurrentState](self, "imageNameForCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CAMControlDrawerButton _imageForImageName:](self, "_imageForImageName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)imageForAXHUD
{
  void *v3;
  void *v4;

  -[CAMControlDrawerButton imageNameForAXHUD](self, "imageNameForAXHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawerButton _imageForImageName:](self, "_imageForImageName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)imageNameForCurrentState
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("%@ must be implemented by subclasses"), v4);

  return 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return 0;
}

- (id)imageSymbolColorConfiguration
{
  return 0;
}

- (BOOL)shouldUseSlash
{
  return 0;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return 0;
}

- (void)_updateSlashAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;
  id v7;

  v3 = a3;
  -[CAMControlDrawerButton _slashView](self, "_slashView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawerButton _slashMaskView](self, "_slashMaskView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMControlDrawerButton shouldShowSlashForCurrentState](self, "shouldShowSlashForCurrentState");
  objc_msgSend(v7, "bounds");
  objc_msgSend(v5, "convertRect:fromView:", v7);
  objc_msgSend(v5, "setSlashBounds:animated:", v3);
  objc_msgSend(v7, "setVisible:animated:", v6, v3);

}

- (id)_imageForImageName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawerButton traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithTraitCollection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMControlDrawerButton imageSymbolColorConfiguration](self, "imageSymbolColorConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "configurationByApplyingConfiguration:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageNamed:inBundle:", v4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithRenderingMode:", 2);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (UIImageView)_backgroundView
{
  return self->__backgroundView;
}

- (CAMSlashView)_slashView
{
  return self->__slashView;
}

- (CAMSlashMaskView)_slashMaskView
{
  return self->__slashMaskView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__slashMaskView, 0);
  objc_storeStrong((id *)&self->__slashView, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
}

@end
