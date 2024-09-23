@implementation NTKGradientComposedView

- (NTKGradientComposedView)initWithDevice:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NTKGradientComposedView *v13;
  NTKGradientView *v14;
  NTKGradientView *backgroundGradientView;
  NTKGradientView *v16;
  NTKGradientView *backgroundGradientTransitionView;
  NTKGradientView *v18;
  NTKGradientView *filterGradientView;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  UIView *composedView;
  uint64_t v29;
  UIView *cornerMaskView;
  NTKRoundedCornerOverlayView *v31;
  NTKRoundedCornerOverlayView *cornerOverlayView;
  uint64_t v33;
  UIImageView *backgroundImageView;
  uint64_t v35;
  UIView *backgroundDimmingView;
  UIView *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _QWORD v45[3];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "screenBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v44.receiver = self;
  v44.super_class = (Class)NTKGradientComposedView;
  v13 = -[NTKGradientComposedView initWithFrame:](&v44, sel_initWithFrame_);
  if (v13)
  {
    v14 = -[NTKGradientView initWithFrame:]([NTKGradientView alloc], "initWithFrame:", v6, v8, v10, v12);
    backgroundGradientView = v13->_backgroundGradientView;
    v13->_backgroundGradientView = v14;

    v16 = -[NTKGradientView initWithFrame:]([NTKGradientView alloc], "initWithFrame:", v6, v8, v10, v12);
    backgroundGradientTransitionView = v13->_backgroundGradientTransitionView;
    v13->_backgroundGradientTransitionView = v16;

    v18 = -[NTKGradientView initWithFrame:]([NTKGradientView alloc], "initWithFrame:", v6, v8, v10, v12);
    filterGradientView = v13->_filterGradientView;
    v13->_filterGradientView = v18;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v45[0] = v13->_backgroundGradientView;
    v45[1] = v13->_backgroundGradientTransitionView;
    v45[2] = v13->_filterGradientView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v41;
      v24 = *MEMORY[0x1E0CD2F48];
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "gradientLayer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setType:", v24);
          objc_msgSend(v26, "setStartPoint:", 0.0, 0.0);
          objc_msgSend(v26, "setEndPoint:", 0.0, 1.0);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v22);
    }

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v8, v10, v12);
    composedView = v13->_composedView;
    v13->_composedView = (UIView *)v27;

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v8, v10, v12);
    cornerMaskView = v13->_cornerMaskView;
    v13->_cornerMaskView = (UIView *)v29;

    v31 = -[NTKRoundedCornerOverlayView initWithFrame:forDeviceCornerRadius:]([NTKRoundedCornerOverlayView alloc], "initWithFrame:forDeviceCornerRadius:", v4, v6, v8, v10, v12);
    cornerOverlayView = v13->_cornerOverlayView;
    v13->_cornerOverlayView = v31;

    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v6, v8, v10, v12);
    backgroundImageView = v13->_backgroundImageView;
    v13->_backgroundImageView = (UIImageView *)v33;

    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v8, v10, v12);
    backgroundDimmingView = v13->_backgroundDimmingView;
    v13->_backgroundDimmingView = (UIView *)v35;

    v37 = v13->_backgroundDimmingView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v37, "setBackgroundColor:", v38);

    -[UIView setAlpha:](v13->_backgroundDimmingView, "setAlpha:", 0.0);
    -[UIView addSubview:](v13->_cornerMaskView, "addSubview:", v13->_backgroundGradientView);
    -[UIView addSubview:](v13->_cornerMaskView, "addSubview:", v13->_backgroundGradientTransitionView);
    -[UIView addSubview:](v13->_cornerMaskView, "addSubview:", v13->_backgroundImageView);
    -[UIView addSubview:](v13->_cornerMaskView, "addSubview:", v13->_backgroundDimmingView);
    -[UIView addSubview:](v13->_cornerMaskView, "addSubview:", v13->_composedView);
    -[UIView addSubview:](v13->_cornerMaskView, "addSubview:", v13->_cornerOverlayView);
    -[UIView addSubview:](v13->_composedView, "addSubview:", v13->_filterGradientView);
    -[NTKGradientComposedView addSubview:](v13, "addSubview:", v13->_cornerMaskView);
    -[NTKGradientComposedView setFilterOn:](v13, "setFilterOn:", 1);
  }

  return v13;
}

- (UIView)rootContainerView
{
  return self->_rootContainerView;
}

- (void)setRootContainerView:(id)a3
{
  UIView *v4;
  UIView *rootContainerView;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIView *v10;

  v4 = (UIView *)a3;
  rootContainerView = self->_rootContainerView;
  v10 = v4;
  if (rootContainerView)
  {
    -[UIView removeFromSuperview](rootContainerView, "removeFromSuperview");
    -[UIView layer](self->_rootContainerView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompositingFilter:", 0);

    v4 = v10;
  }
  self->_rootContainerView = v4;
  if (v4)
  {
    -[UIView addSubview:](self->_composedView, "addSubview:", v10);
    -[UIView layer](self->_rootContainerView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_filterOn)
      v9 = *MEMORY[0x1E0CD2E50];
    else
      v9 = 0;
    objc_msgSend(v7, "setCompositingFilter:", v9);

    v4 = v10;
  }

}

- (void)setFilterOn:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (self->_filterOn != a3)
  {
    self->_filterOn = a3;
    -[UIView layer](self->_rootContainerView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_filterOn)
      v6 = *MEMORY[0x1E0CD2E50];
    else
      v6 = 0;
    objc_msgSend(v4, "setCompositingFilter:", v6);

    -[NTKGradientView setHidden:](self->_filterGradientView, "setHidden:", !self->_filterOn);
  }
}

- (void)applyGossamerColorPalette:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "imageViewFraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[NTKGradientComposedView applyImageViewTransitionFraction:](self, "applyImageViewTransitionFraction:");

  -[NTKGradientComposedView applyBackgroundGradientColorsFromPalette:](self, "applyBackgroundGradientColorsFromPalette:", v13);
  if (self->_showForegroundGradient)
  {
    objc_msgSend(v13, "foregroundGradientFraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    v8 = v6 > 0.0;

    -[NTKGradientComposedView setFilterOn:](self, "setFilterOn:", v8);
    if (v7 > 0.0)
    {
      objc_msgSend(v13, "topAccentColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "centerAccentColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bottomAccentColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKGradientComposedView applyForegroundGradientWithTopColor:centerColor:bottomColor:](self, "applyForegroundGradientWithTopColor:centerColor:bottomColor:", v9, v10, v11);

    }
  }
  else
  {
    -[NTKGradientComposedView setFilterOn:](self, "setFilterOn:", 0);
  }
  objc_msgSend(v13, "editingComplicationsFraction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  -[NTKGradientComposedView applyEditingComplicationsFraction:](self, "applyEditingComplicationsFraction:");

}

- (void)applyEditingComplicationsFraction:(double)a3
{
  CLKInterpolateBetweenFloatsClipped();
  -[UIView setAlpha:](self->_backgroundDimmingView, "setAlpha:");
}

- (void)applyImageViewTransitionFraction:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:");
  if (a3 > 0.0)
  {
    -[UIImageView image](self->_backgroundImageView, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", CFSTR("multicolorBackground"), v7, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_backgroundImageView, "setImage:", v6);

    }
  }
}

- (void)applyBackgroundGradientColorsFromPalette:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NTKGradientView *backgroundGradientTransitionView;
  double v8;
  double v9;
  NTKGradientView *v10;
  double v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v12;
    objc_msgSend(v4, "fromPalette");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGradientComposedView applyGradientColorsFromColorPalette:toView:](self, "applyGradientColorsFromColorPalette:toView:", v5, self->_backgroundGradientView);

    objc_msgSend(v4, "toPalette");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGradientComposedView applyGradientColorsFromColorPalette:toView:](self, "applyGradientColorsFromColorPalette:toView:", v6, self->_backgroundGradientTransitionView);

    backgroundGradientTransitionView = self->_backgroundGradientTransitionView;
    objc_msgSend(v4, "transitionFraction");
    v9 = v8;

    v10 = backgroundGradientTransitionView;
    v11 = v9;
  }
  else
  {
    -[NTKGradientComposedView applyGradientColorsFromColorPalette:toView:](self, "applyGradientColorsFromColorPalette:toView:", v12, self->_backgroundGradientView);
    v10 = self->_backgroundGradientTransitionView;
    v11 = 0.0;
  }
  -[NTKGradientView setAlpha:](v10, "setAlpha:", v11);

}

- (void)applyGradientColorsFromColorPalette:(id)a3 toView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "backgroundGradientColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") <= 1)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    v26[0] = v10;
    v26[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  v12 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i));
        objc_msgSend(v18, "CGColor", (_QWORD)v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  objc_msgSend(v5, "gradientLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setColors:", v12);

}

- (void)applyForegroundGradientWithTopColor:(id)a3 centerColor:(id)a4 bottomColor:(id)a5
{
  NTKGradientView *filterGradientView;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  filterGradientView = self->_filterGradientView;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NTKGradientView gradientLayer](filterGradientView, "gradientLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "CGColor");

  v14 = objc_retainAutorelease(v9);
  v15 = objc_msgSend(v14, "CGColor", v13);

  v19[1] = v15;
  v16 = objc_retainAutorelease(v8);
  v17 = objc_msgSend(v16, "CGColor");

  v19[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColors:", v18);

}

- (BOOL)filterOn
{
  return self->_filterOn;
}

- (BOOL)showForegroundGradient
{
  return self->_showForegroundGradient;
}

- (void)setShowForegroundGradient:(BOOL)a3
{
  self->_showForegroundGradient = a3;
}

- (NTKGradientView)backgroundGradientView
{
  return self->_backgroundGradientView;
}

- (NTKGradientView)backgroundGradientTransitionView
{
  return self->_backgroundGradientTransitionView;
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (UIView)backgroundDimmingView
{
  return self->_backgroundDimmingView;
}

- (UIView)cornerMaskView
{
  return self->_cornerMaskView;
}

- (NTKRoundedCornerOverlayView)cornerOverlayView
{
  return self->_cornerOverlayView;
}

- (UIView)composedView
{
  return self->_composedView;
}

- (NTKGradientView)filterGradientView
{
  return self->_filterGradientView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterGradientView, 0);
  objc_storeStrong((id *)&self->_composedView, 0);
  objc_storeStrong((id *)&self->_cornerOverlayView, 0);
  objc_storeStrong((id *)&self->_cornerMaskView, 0);
  objc_storeStrong((id *)&self->_backgroundDimmingView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_backgroundGradientTransitionView, 0);
  objc_storeStrong((id *)&self->_backgroundGradientView, 0);
}

@end
