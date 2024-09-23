@implementation CCUIButtonModuleView

- (CCUICAPackageDescription)glyphPackageDescription
{
  return self->_glyphPackageDescription;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  void *v13;
  BOOL v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIImageView *glyphImageView;
  UIImageView *v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v27.receiver = self;
  v27.super_class = (Class)CCUIButtonModuleView;
  -[CCUIButtonModuleView layoutSubviews](&v27, sel_layoutSubviews);
  -[CCUIButtonModuleView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");

  -[CCUIButtonModuleView glyphContentFrame](self, "glyphContentFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CCUIButtonModuleView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIImageView image](self->_glyphImageView, "image");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v15 = self->_contentEdgeInsets.leading == *(double *)(MEMORY[0x1E0DC3298] + 8)
     && self->_contentEdgeInsets.top == *MEMORY[0x1E0DC3298]
     && self->_contentEdgeInsets.trailing == *(double *)(MEMORY[0x1E0DC3298] + 24);
  if (v15
    && (v12 ? (v16 = self->_contentEdgeInsets.bottom == *(double *)(MEMORY[0x1E0DC3298] + 16)) : (v16 = 0), v16))
  {
    -[UIImageView setContentMode:](self->_glyphImageView, "setContentMode:", 9);
    objc_msgSend(v13, "size");
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
  }
  else
  {
    -[UIImageView setContentMode:](self->_glyphImageView, "setContentMode:", 4);
    v28.origin.x = v5;
    v28.origin.y = v7;
    v28.size.width = v9;
    v28.size.height = v11;
    CGRectGetMinX(v28);
    v29.origin.x = v5;
    v29.origin.y = v7;
    v29.size.width = v9;
    v29.size.height = v11;
    CGRectGetMinY(v29);
    v30.origin.x = v5;
    v30.origin.y = v7;
    v30.size.width = v9;
    v30.size.height = v11;
    CGRectGetWidth(v30);
    v31.origin.x = v5;
    v31.origin.y = v7;
    v31.size.width = v9;
    v31.size.height = v11;
    CGRectGetHeight(v31);
    UIRectIntegralWithScale();
  }
  v21 = v17;
  v22 = v18;
  v23 = v19;
  v24 = v20;
  if (!CGRectIsEmpty(*(CGRect *)&v17))
  {
    v32.origin.x = v21;
    v32.origin.y = v22;
    v32.size.width = v23;
    v32.size.height = v24;
    if (!CGRectIsInfinite(v32))
    {
      -[CCUIButtonModuleGlyph setFrame:](self->_glyphView, "setFrame:", v21, v22, v23, v24);
      glyphImageView = self->_glyphImageView;
      BSRectWithSize();
      -[UIImageView setBounds:](glyphImageView, "setBounds:");
      v26 = self->_glyphImageView;
      UIRectGetCenter();
      -[UIImageView setCenter:](v26, "setCenter:");
      -[CCUICAPackageView setFrame:](self->_glyphPackageView, "setFrame:", v21, v22, v23, v24);
    }
  }

}

- (CCUIButtonModuleView)initWithFrame:(CGRect)a3
{
  CCUIButtonModuleView *v3;
  CCUIButtonModuleView *v4;
  uint64_t v5;
  UIView *highlightedBackgroundView;
  UIView *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CCUIButtonModuleView;
  v3 = -[CCUIButtonModuleView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_glyphAlpha = 1.0;
    v3->_glyphScale = 1.0;
    +[CCUIControlCenterMaterialView _lightFillView](CCUIControlCenterMaterialView, "_lightFillView");
    v5 = objc_claimAutoreleasedReturnValue();
    highlightedBackgroundView = v4->_highlightedBackgroundView;
    v4->_highlightedBackgroundView = (UIView *)v5;

    v7 = v4->_highlightedBackgroundView;
    -[CCUIButtonModuleView bounds](v4, "bounds");
    -[UIView setFrame:](v7, "setFrame:");
    -[UIView setAutoresizingMask:](v4->_highlightedBackgroundView, "setAutoresizingMask:", 18);
    -[UIView setAlpha:](v4->_highlightedBackgroundView, "setAlpha:", 0.0);
    -[CCUIButtonModuleView addSubview:](v4, "addSubview:", v4->_highlightedBackgroundView);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v4, sel__handlePressGesture_);
    objc_msgSend(v8, "setDelegate:", v4);
    objc_msgSend(v8, "setMinimumPressDuration:", 0.0);
    objc_msgSend(v8, "setCancelsTouchesInView:", 0);
    objc_msgSend(v8, "setDelaysTouchesBegan:", 0);
    objc_msgSend(v8, "setDelaysTouchesEnded:", 0);
    -[CCUIButtonModuleView addGestureRecognizer:](v4, "addGestureRecognizer:", v8);

  }
  return v4;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->_highlightedBackgroundView, "_setContinuousCornerRadius:", a3);
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIButtonModuleView;
  -[CCUIButtonModuleView setEnabled:](&v4, sel_setEnabled_, a3);
  -[CCUIButtonModuleView _updateForStateChange](self, "_updateForStateChange");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIButtonModuleView;
  -[CCUIButtonModuleView setSelected:](&v4, sel_setSelected_, a3);
  -[CCUIButtonModuleView _updateForStateChangeDueToSelectionChange:](self, "_updateForStateChangeDueToSelectionChange:", 1);
}

- (void)_updateForStateChange
{
  -[CCUIButtonModuleView _updateForStateChangeDueToSelectionChange:](self, "_updateForStateChangeDueToSelectionChange:", 0);
}

- (void)didMoveToWindow
{
  void *v3;
  MTVisualStylingProvider *v4;
  MTVisualStylingProvider *visualStylingProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIButtonModuleView;
  -[CCUIButtonModuleView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[CCUIButtonModuleView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CCUIButtonModuleView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v4 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    visualStylingProvider = self->_visualStylingProvider;
    if (v4 != visualStylingProvider)
    {
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:", self->_glyphImageView);
      objc_storeStrong((id *)&self->_visualStylingProvider, v4);
      -[CCUIButtonModuleView _updateGlyphImageViewVisualStyling](self, "_updateGlyphImageViewVisualStyling");
    }

  }
}

- (void)_updateGlyphImageViewVisualStyling
{
  uint64_t v3;
  id v4;

  -[UIImageView mt_removeAllVisualStyling](self->_glyphImageView, "mt_removeAllVisualStyling");
  -[CCUIButtonModuleView _tintColorForSelectedState:](self, "_tintColorForSelectedState:", -[CCUIButtonModuleView isSelected](self, "isSelected"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (id)v3;
  if (v3)
    -[UIImageView setTintColor:](self->_glyphImageView, "setTintColor:", v3);
  else
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", self->_glyphImageView, 0);

}

- (id)_tintColorForSelectedState:(BOOL)a3
{
  UIColor *glyphColor;

  if (!a3 || (glyphColor = self->_selectedGlyphColor) == 0)
    glyphColor = self->_glyphColor;
  return glyphColor;
}

- (double)glyphAlpha
{
  return self->_glyphAlpha;
}

- (void)setGlyphView:(id)a3
{
  CCUIButtonModuleGlyph *v5;
  CCUIButtonModuleGlyph **p_glyphView;
  CCUIButtonModuleGlyph *glyphView;
  CCUIButtonModuleGlyph *v8;
  CCUIButtonModuleGlyph *v9;

  v5 = (CCUIButtonModuleGlyph *)a3;
  p_glyphView = &self->_glyphView;
  glyphView = self->_glyphView;
  v9 = v5;
  if (glyphView != v5)
  {
    -[CCUIButtonModuleGlyph removeFromSuperview](glyphView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_glyphView, a3);
    if (*p_glyphView)
    {
      -[CCUIButtonModuleView addSubview:](self, "addSubview:");
      v8 = *p_glyphView;
      -[CCUIButtonModuleView _effectiveGlyphAlpha](self, "_effectiveGlyphAlpha");
      -[CCUIButtonModuleGlyph setAlpha:](v8, "setAlpha:");
      -[CCUIButtonModuleView _updateGlyphViewMetrics](self, "_updateGlyphViewMetrics");
      -[CCUIButtonModuleView _updateGlyphViewTinting](self, "_updateGlyphViewTinting");
      -[CCUIButtonModuleView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setGlyphImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_glyphImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_glyphImage, a3);
    -[CCUIButtonModuleView _updateGlyphImage](self, "_updateGlyphImage");
    v5 = v6;
  }

}

- (void)setSelectedGlyphImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_selectedGlyphImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedGlyphImage, a3);
    -[CCUIButtonModuleView _updateGlyphImage](self, "_updateGlyphImage");
    v5 = v6;
  }

}

- (void)setGlyphPackageDescription:(id)a3
{
  CCUICAPackageDescription *v5;

  v5 = (CCUICAPackageDescription *)a3;
  if (self->_glyphPackageDescription != v5)
  {
    objc_storeStrong((id *)&self->_glyphPackageDescription, a3);
    -[CCUIButtonModuleView _setGlyphPackageDescription:](self, "_setGlyphPackageDescription:", v5);
    -[CCUIButtonModuleView _setGlyphState:](self, "_setGlyphState:", self->_glyphState);
    -[CCUIButtonModuleView _updateGlyphScale](self, "_updateGlyphScale");
  }

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIButtonModuleView;
  -[CCUIButtonModuleView setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[CCUIButtonModuleView _updateForStateChange](self, "_updateForStateChange");
}

- (void)setGlyphState:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_glyphState != v5)
  {
    objc_storeStrong((id *)&self->_glyphState, a3);
    -[CCUIButtonModuleView _setGlyphState:](self, "_setGlyphState:", v5);
  }

}

- (void)setGlyphAlpha:(double)a3
{
  if (self->_glyphAlpha != a3)
  {
    self->_glyphAlpha = a3;
    -[CCUIButtonModuleView _updateForStateChange](self, "_updateForStateChange");
  }
}

- (void)setGlyphScale:(double)a3
{
  if (self->_glyphScale != a3)
  {
    self->_glyphScale = a3;
    -[CCUIButtonModuleView _updateGlyphScale](self, "_updateGlyphScale");
  }
}

- (void)setContentEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_contentEdgeInsets.leading != a3.leading
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.trailing != a3.trailing
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    -[CCUIButtonModuleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIImageView)glyphImageView
{
  return self->_glyphImageView;
}

- (void)setContentMetrics:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentMetrics, a3);
    -[CCUIButtonModuleView _updateGlyphViewMetrics](self, "_updateGlyphViewMetrics");
    -[CCUIButtonModuleView _updateGlyphImage](self, "_updateGlyphImage");
  }

}

- (double)_continuousCornerRadius
{
  double result;

  -[UIView _continuousCornerRadius](self->_highlightedBackgroundView, "_continuousCornerRadius");
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_handlePressGesture:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "state");
  if (v4 == 1 || objc_msgSend(v5, "state") == 3 || objc_msgSend(v5, "state") == 4)
    -[CCUIButtonModuleView setHighlighted:](self, "setHighlighted:", v4 == 1);

}

- (void)_updateForStateChangeDueToSelectionChange:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[CCUIButtonModuleView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__CCUIButtonModuleView__updateForStateChangeDueToSelectionChange___block_invoke;
  v6[3] = &unk_1E8E206B8;
  v6[4] = self;
  v7 = a3;
  +[CCUIContentModuleContext performWithoutAnimationWhileHiddenInWindow:actions:](CCUIContentModuleContext, "performWithoutAnimationWhileHiddenInWindow:actions:", v5, v6);

}

uint64_t __66__CCUIButtonModuleView__updateForStateChangeDueToSelectionChange___block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__CCUIButtonModuleView__updateForStateChangeDueToSelectionChange___block_invoke_2;
  v2[3] = &unk_1E8E206B8;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v2, 0, 0.25, 0.0);
}

uint64_t __66__CCUIButtonModuleView__updateForStateChangeDueToSelectionChange___block_invoke_2(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  void *v4;
  double v5;
  int v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_updateGlyphImage");
  v2 = objc_msgSend(*(id *)(a1 + 32), "isSelected");
  v3 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v4 = (void *)v3[58];
    v5 = 1.0;
  }
  else
  {
    v6 = objc_msgSend(v3, "isHighlighted");
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
    if (v6)
      v5 = 0.25;
    else
      v5 = 0.0;
  }
  objc_msgSend(v4, "setAlpha:", v5);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "selectionDidChange");
  objc_msgSend(*(id *)(a1 + 32), "_updateGlyphImageViewVisualStyling");
  objc_msgSend(*(id *)(a1 + 32), "_updateGlyphViewTinting");
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "_effectiveGlyphAlpha");
  return objc_msgSend(v7, "_setGlyphAlpha:");
}

- (void)_updateGlyphImage
{
  UIImage *glyphImage;
  UIImage *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  UIImageView *glyphImageView;
  BOOL v9;
  UIImageView *v10;
  UIImageView *v11;
  UIImageView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  UIImageView *v19;
  uint64_t v20;
  void *v21;
  CCUIModuleContentMetrics *v22;

  v22 = self->_contentMetrics;
  if (!-[CCUIButtonModuleView isSelected](self, "isSelected")
    || (glyphImage = self->_selectedGlyphImage) == 0)
  {
    glyphImage = self->_glyphImage;
  }
  v4 = glyphImage;
  if (v22)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5 && -[UIImage isSymbolImage](v4, "isSymbolImage"))
  {
    -[CCUIModuleContentMetrics symbolConfiguration](v22, "symbolConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage imageByApplyingSymbolConfiguration:](v4, "imageByApplyingSymbolConfiguration:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (UIImage *)v7;
  }
  glyphImageView = self->_glyphImageView;
  if (glyphImageView)
    v9 = 1;
  else
    v9 = v4 == 0;
  if (!v9)
  {
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v11 = self->_glyphImageView;
    self->_glyphImageView = v10;

    -[CCUIButtonModuleView addSubview:](self, "addSubview:", self->_glyphImageView);
    v12 = self->_glyphImageView;
    -[CCUIButtonModuleView _effectiveGlyphAlpha](self, "_effectiveGlyphAlpha");
    -[UIImageView setAlpha:](v12, "setAlpha:");
    -[CCUIButtonModuleView _updateGlyphImageViewVisualStyling](self, "_updateGlyphImageViewVisualStyling");
    -[UIImageView setAutoresizingMask:](self->_glyphImageView, "setAutoresizingMask:", 18);
    -[UIImageView setTintAdjustmentMode:](self->_glyphImageView, "setTintAdjustmentMode:", 1);
    -[CCUIButtonModuleView setNeedsLayout](self, "setNeedsLayout");
    glyphImageView = self->_glyphImageView;
  }
  -[UIImageView image](glyphImageView, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage symbolConfiguration](v4, "symbolConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationPreferringMulticolor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configurationByApplyingConfiguration:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "isEqualToConfiguration:", v16);

  if (v17)
    v18 = 1;
  else
    v18 = 2;
  v19 = self->_glyphImageView;
  -[UIImage imageWithRenderingMode:](v4, "imageWithRenderingMode:", v18);
  v20 = objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](v19, "setImage:", v20);

  -[UIImageView image](self->_glyphImageView, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = BSEqualObjects();

  if ((v20 & 1) == 0)
    -[CCUIButtonModuleView setNeedsLayout](self, "setNeedsLayout");
  -[CCUIButtonModuleView _updateGlyphScale](self, "_updateGlyphScale");

}

- (void)_setGlyphPackageDescription:(id)a3
{
  id v4;
  CCUICAPackageView *glyphPackageView;
  CCUICAPackageView *v6;
  CCUICAPackageView *v7;
  CCUICAPackageView *v8;
  CCUICAPackageView *v9;
  void *v10;
  CCUICAPackageView *v11;
  CGAffineTransform v12;

  v4 = a3;
  glyphPackageView = self->_glyphPackageView;
  if (!glyphPackageView)
  {
    v6 = objc_alloc_init(CCUICAPackageView);
    v7 = self->_glyphPackageView;
    self->_glyphPackageView = v6;

    v8 = self->_glyphPackageView;
    -[CCUIButtonModuleView _effectiveGlyphAlpha](self, "_effectiveGlyphAlpha");
    -[CCUICAPackageView setAlpha:](v8, "setAlpha:");
    v9 = self->_glyphPackageView;
    -[CCUIButtonModuleView glyphState](self, "glyphState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUICAPackageView setStateName:](v9, "setStateName:", v10);

    -[CCUICAPackageView setAutoresizingMask:](self->_glyphPackageView, "setAutoresizingMask:", 18);
    if (-[CCUIButtonModuleView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection")
      && objc_msgSend(v4, "flipsForRightToLeftLayoutDirection"))
    {
      v11 = self->_glyphPackageView;
      CGAffineTransformMakeScale(&v12, -1.0, 1.0);
      -[CCUICAPackageView setTransform:](v11, "setTransform:", &v12);
    }
    -[CCUIButtonModuleView addSubview:](self, "addSubview:", self->_glyphPackageView);
    glyphPackageView = self->_glyphPackageView;
  }
  -[CCUICAPackageView setPackageDescription:](glyphPackageView, "setPackageDescription:", self->_glyphPackageDescription);

}

- (void)_setGlyphState:(id)a3
{
  -[CCUICAPackageView setStateName:](self->_glyphPackageView, "setStateName:", a3);
}

- (double)_effectiveGlyphAlpha
{
  double result;

  if (!-[CCUIButtonModuleView isEnabled](self, "isEnabled"))
    return 0.2;
  -[CCUIButtonModuleView glyphAlpha](self, "glyphAlpha");
  return result;
}

- (void)_setGlyphAlpha:(double)a3
{
  -[CCUICAPackageView setAlpha:](self->_glyphPackageView, "setAlpha:");
  -[UIImageView setAlpha:](self->_glyphImageView, "setAlpha:", a3);
  -[CCUIButtonModuleGlyph setAlpha:](self->_glyphView, "setAlpha:", a3);
}

- (void)_updateGlyphScale
{
  double glyphScale;
  CCUIModuleContentMetrics *v4;
  CCUIModuleContentMetrics *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  UIImageView *glyphImageView;
  __int128 v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  glyphScale = self->_glyphScale;
  v4 = self->_contentMetrics;
  v5 = v4;
  if (v4
    && (-[CCUIModuleContentMetrics symbolScaleFactor](v4, "symbolScaleFactor"), v7 = v6, (BSFloatIsOne() & 1) == 0))
  {
    v8 = glyphScale * v7;
    -[UIImageView image](self->_glyphImageView, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSymbolImage");

    if (!v10)
      glyphScale = v8;
  }
  else
  {
    v8 = glyphScale;
  }
  -[CCUICAPackageView setScale:](self->_glyphPackageView, "setScale:", v8);
  glyphImageView = self->_glyphImageView;
  if (glyphImageView)
  {
    memset(&v14, 0, sizeof(v14));
    if (fabs(glyphScale + -1.0) >= 2.22044605e-16)
    {
      CGAffineTransformMakeScale(&v14, glyphScale, glyphScale);
    }
    else
    {
      v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v14.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v14.c = v12;
      *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    v13 = v14;
    -[UIImageView setTransform:](glyphImageView, "setTransform:", &v13);
  }

}

- (void)_updateGlyphViewTinting
{
  id v3;

  -[CCUIButtonModuleView _tintColorForSelectedState:](self, "_tintColorForSelectedState:", -[CCUIButtonModuleView isSelected](self, "isSelected"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleGlyph applyGlyphTintColor:](self->_glyphView, "applyGlyphTintColor:", v3);

}

- (void)_updateGlyphViewMetrics
{
  -[CCUIButtonModuleGlyph applyGlyphContentMetrics:](self->_glyphView, "applyGlyphContentMetrics:", self->_contentMetrics);
}

- (CCUIButtonModuleGlyph)glyphView
{
  return self->_glyphView;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (void)setGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_glyphColor, a3);
}

- (UIImage)selectedGlyphImage
{
  return self->_selectedGlyphImage;
}

- (UIColor)selectedGlyphColor
{
  return self->_selectedGlyphColor;
}

- (void)setSelectedGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedGlyphColor, a3);
}

- (double)glyphScale
{
  return self->_glyphScale;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (NSDirectionalEdgeInsets)contentEdgeInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  leading = self->_contentEdgeInsets.leading;
  bottom = self->_contentEdgeInsets.bottom;
  trailing = self->_contentEdgeInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_glyphPackageDescription, 0);
  objc_storeStrong((id *)&self->_selectedGlyphColor, 0);
  objc_storeStrong((id *)&self->_selectedGlyphImage, 0);
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphPackageView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);
}

@end
