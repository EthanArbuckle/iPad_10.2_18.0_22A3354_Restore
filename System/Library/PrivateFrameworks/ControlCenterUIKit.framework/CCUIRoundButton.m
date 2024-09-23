@implementation CCUIRoundButton

- (id)_initWithHighlightColor:(id)a3 useLightStyle:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CCUIRoundButton *v7;
  CCUIRoundButton *v8;
  uint64_t v9;
  UIColor *highlightColor;
  void *v11;
  UIView *normalStateBackgroundView;
  id v13;
  uint64_t v14;
  UIView *selectedStateBackgroundView;
  uint64_t v16;
  UIView *alternateSelectedStateBackgroundView;
  UIView *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v4 = a4;
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CCUIRoundButton;
  v7 = -[CCUIRoundButton initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_glyphScale = 1.0;
    v9 = objc_msgSend(v6, "copy");
    highlightColor = v8->_highlightColor;
    v8->_highlightColor = (UIColor *)v9;

    if (v4)
      +[CCUIControlCenterMaterialView _tertiaryView](CCUIControlCenterMaterialView, "_tertiaryView");
    else
      +[CCUIControlCenterMaterialView controlCenterDarkMaterial](CCUIControlCenterMaterialView, "controlCenterDarkMaterial");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v8->_normalStateBackgroundView, v11);

    normalStateBackgroundView = v8->_normalStateBackgroundView;
    -[CCUIRoundButton bounds](v8, "bounds");
    -[UIView setFrame:](normalStateBackgroundView, "setFrame:");
    -[UIView setAutoresizingMask:](v8->_normalStateBackgroundView, "setAutoresizingMask:", 18);
    -[UIView setUserInteractionEnabled:](v8->_normalStateBackgroundView, "setUserInteractionEnabled:", 0);
    -[CCUIRoundButton addSubview:](v8, "addSubview:", v8->_normalStateBackgroundView);
    v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[CCUIRoundButton bounds](v8, "bounds");
    v14 = objc_msgSend(v13, "initWithFrame:");
    selectedStateBackgroundView = v8->_selectedStateBackgroundView;
    v8->_selectedStateBackgroundView = (UIView *)v14;

    -[UIView setAutoresizingMask:](v8->_selectedStateBackgroundView, "setAutoresizingMask:", 18);
    -[UIView setBackgroundColor:](v8->_selectedStateBackgroundView, "setBackgroundColor:", v8->_highlightColor);
    -[UIView setUserInteractionEnabled:](v8->_selectedStateBackgroundView, "setUserInteractionEnabled:", 0);
    -[CCUIRoundButton addSubview:](v8, "addSubview:", v8->_selectedStateBackgroundView);
    +[CCUIControlCenterMaterialView _lightFillView](CCUIControlCenterMaterialView, "_lightFillView");
    v16 = objc_claimAutoreleasedReturnValue();
    alternateSelectedStateBackgroundView = v8->_alternateSelectedStateBackgroundView;
    v8->_alternateSelectedStateBackgroundView = (UIView *)v16;

    v18 = v8->_alternateSelectedStateBackgroundView;
    -[CCUIRoundButton bounds](v8, "bounds");
    -[UIView setFrame:](v18, "setFrame:");
    -[UIView setAutoresizingMask:](v8->_alternateSelectedStateBackgroundView, "setAutoresizingMask:", 18);
    -[UIView setUserInteractionEnabled:](v8->_alternateSelectedStateBackgroundView, "setUserInteractionEnabled:", 0);
    -[UIView setAlpha:](v8->_alternateSelectedStateBackgroundView, "setAlpha:", 0.0);
    -[CCUIRoundButton addSubview:](v8, "addSubview:", v8->_alternateSelectedStateBackgroundView);
    -[CCUIRoundButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", v8, sel__primaryActionPerformed_, 0x2000);
    -[CCUIRoundButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", v8, sel__deactivateReachability_, 64);
    -[CCUIRoundButton addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("enabled"), 0, 0);
    -[CCUIRoundButton addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("highlighted"), 0, 0);
    -[CCUIRoundButton addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("selected"), 0, 0);
    -[CCUIRoundButton addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("glyphState"), 0, 0);
    -[CCUIRoundButton addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("useAlternateBackground"), 0, 0);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom");

    if (v20 == 1)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v8);
      -[CCUIRoundButton addInteraction:](v8, "addInteraction:", v21);

    }
  }

  return v8;
}

- (CCUIRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4
{
  return -[CCUIRoundButton initWithGlyphImage:highlightColor:useLightStyle:](self, "initWithGlyphImage:highlightColor:useLightStyle:", a3, a4, 0);
}

- (CCUIRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5
{
  return -[CCUIRoundButton initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:](self, "initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:", a3, a4, 0, a5);
}

- (CCUIRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5
{
  return -[CCUIRoundButton initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:](self, "initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:", a3, a4, a5, 0);
}

- (CCUIRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5 useLightStyle:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  CCUIRoundButton *v12;
  uint64_t v13;
  UIColor *highlightTintColor;
  uint64_t v15;
  UIImage *glyphImage;
  uint64_t v17;
  UIImageView *glyphImageView;
  uint64_t v19;
  UIImageView *selectedGlyphView;
  void *v21;
  _QWORD v23[4];
  CCUIRoundButton *v24;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v12 = -[CCUIRoundButton _initWithHighlightColor:useLightStyle:](self, "_initWithHighlightColor:useLightStyle:", a4, v6);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    highlightTintColor = v12->_highlightTintColor;
    v12->_highlightTintColor = (UIColor *)v13;

    objc_msgSend(v10, "imageWithRenderingMode:", 2);
    v15 = objc_claimAutoreleasedReturnValue();
    glyphImage = v12->_glyphImage;
    v12->_glyphImage = (UIImage *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12->_glyphImage);
    glyphImageView = v12->_glyphImageView;
    v12->_glyphImageView = (UIImageView *)v17;

    -[UIImageView setTintAdjustmentMode:](v12->_glyphImageView, "setTintAdjustmentMode:", 1);
    -[CCUIRoundButton addSubview:](v12, "addSubview:", v12->_glyphImageView);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12->_glyphImage);
    selectedGlyphView = v12->_selectedGlyphView;
    v12->_selectedGlyphView = (UIImageView *)v19;

    -[UIImageView setTintAdjustmentMode:](v12->_selectedGlyphView, "setTintAdjustmentMode:", 1);
    -[CCUIRoundButton addSubview:](v12, "addSubview:", v12->_selectedGlyphView);
    v21 = (void *)MEMORY[0x1E0DC3F10];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __86__CCUIRoundButton_initWithGlyphImage_highlightColor_highlightTintColor_useLightStyle___block_invoke;
    v23[3] = &unk_1E8E20590;
    v24 = v12;
    objc_msgSend(v21, "performWithoutAnimation:", v23);

  }
  return v12;
}

uint64_t __86__CCUIRoundButton_initWithGlyphImage_highlightColor_highlightTintColor_useLightStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForStateChange");
}

- (CCUIRoundButton)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4
{
  return -[CCUIRoundButton initWithGlyphPackageDescription:highlightColor:useLightStyle:](self, "initWithGlyphPackageDescription:highlightColor:useLightStyle:", a3, a4, 0);
}

- (CCUIRoundButton)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  CCUIRoundButton *v9;
  CCUIRoundButton *v10;
  void *v11;
  _QWORD v13[4];
  CCUIRoundButton *v14;

  v5 = a5;
  v8 = a3;
  v9 = -[CCUIRoundButton _initWithHighlightColor:useLightStyle:](self, "_initWithHighlightColor:useLightStyle:", a4, v5);
  v10 = v9;
  if (v9)
  {
    -[CCUIRoundButton setGlyphPackageDescription:](v9, "setGlyphPackageDescription:", v8);
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __80__CCUIRoundButton_initWithGlyphPackageDescription_highlightColor_useLightStyle___block_invoke;
    v13[3] = &unk_1E8E20590;
    v14 = v10;
    objc_msgSend(v11, "performWithoutAnimation:", v13);

  }
  return v10;
}

uint64_t __80__CCUIRoundButton_initWithGlyphPackageDescription_highlightColor_useLightStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForStateChange");
}

- (void)dealloc
{
  objc_super v3;

  -[CCUIRoundButton removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("enabled"));
  -[CCUIRoundButton removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("highlighted"));
  -[CCUIRoundButton removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("selected"));
  -[CCUIRoundButton removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("glyphState"));
  -[CCUIRoundButton removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("useAlternateBackground"));
  v3.receiver = self;
  v3.super_class = (Class)CCUIRoundButton;
  -[CCUIRoundButton dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  CGFloat v3;
  __int128 v4;
  UIView *glyphPackageContainerView;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CCUIRoundButton;
  -[CCUIRoundButton layoutSubviews](&v20, sel_layoutSubviews);
  -[CCUIRoundButton glyphScale](self, "glyphScale");
  memset(&v19, 0, sizeof(v19));
  if (fabs(v3 + -1.0) >= 2.22044605e-16)
  {
    CGAffineTransformMakeScale(&v19, v3, v3);
  }
  else
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v19.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v19.c = v4;
    *(_OWORD *)&v19.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  glyphPackageContainerView = self->_glyphPackageContainerView;
  v18 = v19;
  -[UIView setTransform:](glyphPackageContainerView, "setTransform:", &v18);
  -[UIImage size](self->_glyphImage, "size");
  -[CCUIRoundButton traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = v7;

  BSRectWithSize();
  -[CCUIRoundButton bounds](self, "bounds");
  v17 = v8;
  UIRectCenteredIntegralRectScale();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UIImageView setFrame:](self->_glyphImageView, "setFrame:", v17);
  -[UIImageView setFrame:](self->_selectedGlyphView, "setFrame:", v10, v12, v14, v16);
  -[CCUIRoundButton _cornerRadius](self, "_cornerRadius");
  -[CCUIRoundButton _setCornerRadius:](self, "_setCornerRadius:");
  -[CCUIRoundButton _updateForStateChangeIfNecessary](self, "_updateForStateChangeIfNecessary");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  if (_CCUIRoundButtonSize_onceToken[0] != -1)
    dispatch_once(_CCUIRoundButtonSize_onceToken, &__block_literal_global_0);
  if (self->_dynamicLayoutEnabled)
    UIRoundToScale();
  else
    v4 = *(double *)&_CCUIRoundButtonSize_size;
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CCUIRoundButton sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setGlyphImage:(id)a3
{
  UIImage *v4;
  UIImage *glyphImage;

  objc_msgSend(a3, "imageWithRenderingMode:", 2);
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  glyphImage = self->_glyphImage;
  self->_glyphImage = v4;

  -[UIImageView setImage:](self->_glyphImageView, "setImage:", self->_glyphImage);
  -[UIImageView setImage:](self->_selectedGlyphView, "setImage:", self->_glyphImage);
}

- (void)setHighlightColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_highlightColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_highlightColor, a3);
    -[UIView setBackgroundColor:](self->_selectedStateBackgroundView, "setBackgroundColor:", self->_highlightColor);
    v5 = v6;
  }

}

- (void)setGlyphPackageDescription:(id)a3
{
  CCUICAPackageDescription *v5;
  CCUICAPackageView *glyphPackageView;
  UIView *v7;
  UIView *glyphPackageContainerView;
  CCUICAPackageView *v9;
  CCUICAPackageView *v10;
  UIView *v11;
  CCUICAPackageView *v12;
  CCUICAPackageView *v13;
  UIView *v14;
  CGAffineTransform v15;

  v5 = (CCUICAPackageDescription *)a3;
  if (self->_glyphPackageDescription != v5)
  {
    objc_storeStrong((id *)&self->_glyphPackageDescription, a3);
    glyphPackageView = self->_glyphPackageView;
    if (self->_glyphPackageDescription)
    {
      if (!glyphPackageView)
      {
        if (!self->_glyphPackageContainerView)
        {
          v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
          glyphPackageContainerView = self->_glyphPackageContainerView;
          self->_glyphPackageContainerView = v7;

          -[UIView setClipsToBounds:](self->_glyphPackageContainerView, "setClipsToBounds:", 1);
          -[UIView setUserInteractionEnabled:](self->_glyphPackageContainerView, "setUserInteractionEnabled:", 0);
          -[UIView setAutoresizingMask:](self->_glyphPackageContainerView, "setAutoresizingMask:", 18);
          -[CCUIRoundButton addSubview:](self, "addSubview:", self->_glyphPackageContainerView);
        }
        v9 = objc_alloc_init(CCUICAPackageView);
        v10 = self->_glyphPackageView;
        self->_glyphPackageView = v9;

        -[CCUICAPackageView setAutoresizingMask:](self->_glyphPackageView, "setAutoresizingMask:", 18);
        -[UIView addSubview:](self->_glyphPackageContainerView, "addSubview:", self->_glyphPackageView);
        v11 = self->_glyphPackageContainerView;
        -[UIView frame](v11, "frame");
        -[UIView setBounds:](v11, "setBounds:");
        glyphPackageView = self->_glyphPackageView;
      }
      -[CCUICAPackageView setPackageDescription:](glyphPackageView, "setPackageDescription:", v5);
      if (-[CCUIRoundButton _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection")
        && -[CCUICAPackageDescription flipsForRightToLeftLayoutDirection](v5, "flipsForRightToLeftLayoutDirection"))
      {
        v12 = self->_glyphPackageView;
        CGAffineTransformMakeScale(&v15, -1.0, 1.0);
        -[CCUICAPackageView setTransform:](v12, "setTransform:", &v15);
      }
    }
    else if (glyphPackageView)
    {
      -[CCUICAPackageView removeFromSuperview](glyphPackageView, "removeFromSuperview");
      v13 = self->_glyphPackageView;
      self->_glyphPackageView = 0;

      -[UIView removeFromSuperview](self->_glyphPackageContainerView, "removeFromSuperview");
      v14 = self->_glyphPackageContainerView;
      self->_glyphPackageContainerView = 0;

    }
  }

}

- (void)setGlyphScale:(double)a3
{
  if (self->_glyphScale != a3)
  {
    self->_glyphScale = a3;
    -[CCUIRoundButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIRoundButton;
  -[CCUIRoundButton didMoveToWindow](&v6, sel_didMoveToWindow);
  -[CCUIRoundButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CCUIRoundButton;
    -[CCUIRoundButton visualStylingProviderForCategory:](&v5, sel_visualStylingProviderForCategory_, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIRoundButton setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", v4, 1);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  CCUIRoundButton *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (CCUIRoundButton *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1
    || objc_msgSend(v4, "numberOfTapsRequired") != 1;

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  CCUIRoundButton *v8;
  id v9;

  v9 = a3;
  v8 = (CCUIRoundButton *)a4;
  if (v8 == self
    && ((objc_msgSend(v9, "isEqualToString:", CFSTR("selected")) & 1) != 0
     || (objc_msgSend(v9, "isEqualToString:", CFSTR("enabled")) & 1) != 0
     || (objc_msgSend(v9, "isEqualToString:", CFSTR("highlighted")) & 1) != 0
     || (objc_msgSend(v9, "isEqualToString:", CFSTR("glyphState")) & 1) != 0
     || objc_msgSend(v9, "isEqualToString:", CFSTR("useAlternateBackground"))))
  {
    -[CCUIRoundButton _setNeedsStateChangeUpdate](v8, "_setNeedsStateChangeUpdate");
  }

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  MTVisualStylingProvider *visualStylingProvider;
  objc_super v5;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
    return visualStylingProvider;
  v5.receiver = self;
  v5.super_class = (Class)CCUIRoundButton;
  -[CCUIRoundButton visualStylingProviderForCategory:](&v5, sel_visualStylingProviderForCategory_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E8E2BC28;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  MTVisualStylingProvider *v9;
  MTVisualStylingProvider *visualStylingProvider;
  MTVisualStylingProvider *v11;
  MTVisualStylingProvider *v12;
  MTVisualStylingProvider *v13;
  MTVisualStylingProvider *v14;

  v14 = (MTVisualStylingProvider *)a3;
  -[CCUIRoundButton requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  v9 = v14;
  if (v8)
  {
    visualStylingProvider = self->_visualStylingProvider;
    if (visualStylingProvider != v14)
    {
      v11 = v14;
      v12 = self->_visualStylingProvider;
      self->_visualStylingProvider = v11;
      v13 = visualStylingProvider;

      -[CCUIRoundButton _visualStylingProvider:didChangeWithOutgoingVisualStylingProvider:](self, "_visualStylingProvider:didChangeWithOutgoingVisualStylingProvider:", v11, v13);
      v9 = v14;
    }
  }

}

- (double)_cornerRadius
{
  double Width;
  double Height;
  CGRect v6;
  CGRect v7;

  -[CCUIRoundButton bounds](self, "bounds");
  Width = CGRectGetWidth(v6);
  -[CCUIRoundButton bounds](self, "bounds");
  Height = CGRectGetHeight(v7);
  if (Width < Height)
    Height = Width;
  return Height * 0.5;
}

- (void)_setCornerRadius:(double)a3
{
  -[UIView _setCornerRadius:](self->_normalStateBackgroundView, "_setCornerRadius:");
  -[UIView _setCornerRadius:](self->_selectedStateBackgroundView, "_setCornerRadius:", a3);
  -[UIView _setCornerRadius:](self->_alternateSelectedStateBackgroundView, "_setCornerRadius:", a3);
}

- (void)_primaryActionPerformed:(id)a3
{
  -[CCUIRoundButton setHighlighted:](self, "setHighlighted:", 0);
}

- (void)_deactivateReachability:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_deactivateReachability");

}

- (void)_setNeedsStateChangeUpdate
{
  self->_isStateValid = 0;
  -[CCUIRoundButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateForStateChange
{
  void *v3;
  _QWORD v4[5];

  self->_isStateValid = 1;
  -[CCUIRoundButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__CCUIRoundButton__updateForStateChange__block_invoke;
  v4[3] = &unk_1E8E20590;
  v4[4] = self;
  +[CCUIContentModuleContext performWithoutAnimationWhileHiddenInWindow:actions:](CCUIContentModuleContext, "performWithoutAnimationWhileHiddenInWindow:actions:", v3, v4);

}

uint64_t __40__CCUIRoundButton__updateForStateChange__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__CCUIRoundButton__updateForStateChange__block_invoke_2;
  v2[3] = &unk_1E8E20590;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.25);
}

void __40__CCUIRoundButton__updateForStateChange__block_invoke_2(uint64_t a1)
{
  double v2;
  int v3;
  int v4;
  id *v5;
  void *v6;
  double v7;
  int v8;
  void *v9;
  uint64_t v10;
  double v11;
  _QWORD *v12;
  void *v13;
  id v14;

  if (objc_msgSend(*(id *)(a1 + 32), "isEnabled"))
    v2 = 1.0;
  else
    v2 = 0.2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "isHighlighted");
  v4 = objc_msgSend(*(id *)(a1 + 32), "isSelected");
  v5 = *(id **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5[66], "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setAlpha:", 1.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setAlpha:", v2);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 552);
    v7 = 0.0;
  }
  else
  {
    v8 = objc_msgSend(v5, "useAlternateBackground");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setAlpha:", 1.0);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 544);
    if (!v8)
    {
      objc_msgSend(v9, "setAlpha:", 0.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setAlpha:", 0.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setAlpha:", 0.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setAlpha:", v2);
      goto LABEL_13;
    }
    objc_msgSend(v9, "setAlpha:", 1.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setAlpha:", v2);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 552);
    v7 = v2;
  }
  objc_msgSend(v6, "setAlpha:", v7);
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v10 + 520))
  {
    if (objc_msgSend(*(id *)(v10 + 464), "isAutomaticallyUpdatingView:", *(_QWORD *)(v10 + 560)))
      objc_msgSend(*(id *)(a1 + 32), "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560), 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setTintColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520));
  }
LABEL_13:
  v11 = 1.0;
  if (v3)
    v11 = 0.75;
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setAlpha:", v2);
  v12 = *(_QWORD **)(a1 + 32);
  v13 = (void *)v12[72];
  objc_msgSend(v12, "glyphState");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStateName:", v14);

}

- (void)_updateForStateChangeIfNecessary
{
  if (!self->_isStateValid)
    -[CCUIRoundButton _updateForStateChange](self, "_updateForStateChange");
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  id v9;
  id v10;

  if (a3)
  {
    v9 = a5;
    v10 = a3;
    objc_msgSend(a6, "stopAutomaticallyUpdatingView:", v10);
    objc_msgSend(v9, "automaticallyUpdateView:withStyle:andObserverBlock:", v10, a4, &__block_literal_global_36);

  }
}

void *__91__CCUIRoundButton__updateVisualStylingOfView_style_visualStylingProvider_outgoingProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD aBlock[5];

  objc_msgSend(a3, "alpha");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__CCUIRoundButton__updateVisualStylingOfView_style_visualStylingProvider_outgoingProvider___block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  aBlock[4] = v3;
  return _Block_copy(aBlock);
}

uint64_t __91__CCUIRoundButton__updateVisualStylingOfView_style_visualStylingProvider_outgoingProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setAlpha:", *(double *)(a1 + 32));
}

- (void)_visualStylingProvider:(id)a3 didChangeWithOutgoingVisualStylingProvider:(id)a4
{
  UIImageView *glyphImageView;
  id v7;
  id v8;

  glyphImageView = self->_glyphImageView;
  v7 = a4;
  v8 = a3;
  -[CCUIRoundButton _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", glyphImageView, 0, v8, v7);
  -[CCUIRoundButton _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_selectedGlyphView, 0, v8, v7);

}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return self->_glyphPackageDescription;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (double)glyphScale
{
  return self->_glyphScale;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (void)setGlyphState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (BOOL)useAlternateBackground
{
  return self->_useAlternateBackground;
}

- (void)setUseAlternateBackground:(BOOL)a3
{
  self->_useAlternateBackground = a3;
}

- (BOOL)isDynamicLayoutEnabled
{
  return self->_dynamicLayoutEnabled;
}

- (void)setDynamicLayoutEnabled:(BOOL)a3
{
  self->_dynamicLayoutEnabled = a3;
}

- (UIColor)highlightTintColor
{
  return self->_highlightTintColor;
}

- (void)setHighlightTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (UIView)normalStateBackgroundView
{
  return self->_normalStateBackgroundView;
}

- (void)setNormalStateBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_normalStateBackgroundView, a3);
}

- (UIView)selectedStateBackgroundView
{
  return self->_selectedStateBackgroundView;
}

- (void)setSelectedStateBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedStateBackgroundView, a3);
}

- (UIView)alternateSelectedStateBackgroundView
{
  return self->_alternateSelectedStateBackgroundView;
}

- (void)setAlternateSelectedStateBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_alternateSelectedStateBackgroundView, a3);
}

- (UIImageView)glyphImageView
{
  return self->_glyphImageView;
}

- (void)setGlyphImageView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphImageView, a3);
}

- (UIImageView)selectedGlyphView
{
  return self->_selectedGlyphView;
}

- (void)setSelectedGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedGlyphView, a3);
}

- (UIView)glyphPackageContainerView
{
  return self->_glyphPackageContainerView;
}

- (void)setGlyphPackageContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphPackageContainerView, a3);
}

- (CCUICAPackageView)glyphPackageView
{
  return self->_glyphPackageView;
}

- (void)setGlyphPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphPackageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphPackageView, 0);
  objc_storeStrong((id *)&self->_glyphPackageContainerView, 0);
  objc_storeStrong((id *)&self->_selectedGlyphView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_alternateSelectedStateBackgroundView, 0);
  objc_storeStrong((id *)&self->_selectedStateBackgroundView, 0);
  objc_storeStrong((id *)&self->_normalStateBackgroundView, 0);
  objc_storeStrong((id *)&self->_highlightTintColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphPackageDescription, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

@end
