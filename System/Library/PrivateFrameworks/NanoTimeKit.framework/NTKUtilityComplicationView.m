@implementation NTKUtilityComplicationView

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKUtilityComplicationView;
  -[NTKUtilityComplicationView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[NTKUtilityComplicationView setNeedsLayout](self, "setNeedsLayout");
}

+ (int64_t)layoutOverride
{
  return 1;
}

+ (id)smallComplicationViewForType:(unint64_t)a3
{
  NTKUtilityComplicationView *v4;
  void *v5;
  _BYTE v6[24];
  double v7;

  if (a3)
    return objc_alloc_init(0);
  v4 = objc_alloc_init(NTKUtilityComplicationView);
  -[NTKUtilityComplicationView device](v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v5, v6);
  -[NTKUtilityComplicationView setMinimumWidth:](v4, "setMinimumWidth:", v7);

  -[NTKUtilityComplicationView setHidden:](v4, "setHidden:", 1);
  return v4;
}

+ (id)largeComplicationViewForType:(unint64_t)a3 narrow:(BOOL)a4
{
  NTKUtilityComplicationView *v4;
  void *v6;
  _BYTE v7[32];
  double v8;

  if (a3)
  {
    if (!a4)
      return objc_alloc_init(0);
    v4 = (NTKUtilityComplicationView *)objc_alloc_init(0);
    if (!v4)
      return objc_alloc_init(0);
  }
  else
  {
    v4 = objc_alloc_init(NTKUtilityComplicationView);
    -[NTKUtilityComplicationView device](v4, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v6, v7);
    -[NTKUtilityComplicationView setMinimumWidth:](v4, "setMinimumWidth:", v8);

    -[NTKUtilityComplicationView setHidden:](v4, "setHidden:", 1);
  }
  return v4;
}

- (NTKUtilityComplicationView)initWithFrame:(CGRect)a3
{
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[43];
  _BYTE v22[16];
  uint64_t v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NTKUtilityComplicationView;
  v3 = -[NTKUtilityComplicationView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDevice:", v5);

    objc_msgSend(v3, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v3 + 63) = 0x3FE6666666666666;

    objc_msgSend(v3, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v3 + 69) = 0x3FE6666666666666;

    objc_msgSend(v3, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v8, v22);
    *((_QWORD *)v3 + 74) = v23;

    *(int64x2_t *)(v3 + 632) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    objc_msgSend(v3, "_standardFont");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v3 + 54);
    *((_QWORD *)v3 + 54) = v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, *(double *)off_1E6BC9B88);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v3 + 64);
    *((_QWORD *)v3 + 64) = v11;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v3 + 53);
    *((_QWORD *)v3 + 53) = v13;

    NTKUtilityComplicationPlatterColor();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v3 + 68);
    *((_QWORD *)v3 + 68) = v15;

    *((_QWORD *)v3 + 71) = *MEMORY[0x1E0DC1440];
    objc_msgSend(v3, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v17, v21);
    *((_QWORD *)v3 + 65) = v21[0];

    v18 = objc_msgSend(v3, "_newHighlightView");
    v19 = (void *)*((_QWORD *)v3 + 75);
    *((_QWORD *)v3 + 75) = v18;

    v3[480] = 1;
    objc_msgSend(v3, "_computeForegroundColor");
    objc_msgSend(v3, "_computePlatterColor");
    objc_msgSend(v3, "_computeForegroundAlpha");
    objc_msgSend(v3, "_computeForegroundImageAlpha");
  }
  return (NTKUtilityComplicationView *)v3;
}

- (void)_updateForegroundColor
{
  UIColor *computedForegroundColor;
  void *v4;
  void *v5;
  double v6[43];
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__NTKUtilityComplicationView__updateForegroundColor__block_invoke;
  v7[3] = &unk_1E6BD41E0;
  v7[4] = self;
  -[NTKUtilityComplicationView _enumerateColoringViewsWithBlock:](self, "_enumerateColoringViewsWithBlock:", v7);
  computedForegroundColor = self->_computedForegroundColor;
  -[NTKUtilityComplicationView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v4, v6);
  -[UIColor colorWithAlphaComponent:](computedForegroundColor, "colorWithAlphaComponent:", v6[17]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NTKUtilityComplicationView textLayoutStyle](self, "textLayoutStyle") == 1
    || -[NTKUtilityComplicationView textLayoutStyle](self, "textLayoutStyle") == 2)
  {
    -[UIView setTintColor:](self->_highlightView, "setTintColor:", v5);
  }
  else
  {
    -[UIView setBackgroundColor:](self->_highlightView, "setBackgroundColor:", v5);
  }

}

uint64_t __52__NTKUtilityComplicationView__updateForegroundColor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448));
}

- (void)_computeForegroundColor
{
  objc_storeStrong((id *)&self->_computedForegroundColor, self->_foregroundColor);
}

- (id)_computedForegroundColor
{
  return self->_computedForegroundColor;
}

- (void)_updatePlatterColor
{
  -[UIImageView setTintColor:](self->_backgroundPlatter, "setTintColor:", self->_platterColor);
}

- (void)_computePlatterColor
{
  objc_storeStrong((id *)&self->_computedPlatterColor, self->_platterColor);
}

- (id)_computedPlatterColor
{
  return self->_computedPlatterColor;
}

- (double)foregroundAlpha
{
  if (!self->_highlighted)
    return self->_foregroundAlpha;
  -[NTKUtilityComplicationView device](self, "device");

  return 1.0;
}

- (void)setForegroundAlpha:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_foregroundAlpha = a3;
    -[NTKUtilityComplicationView _computeForegroundAlpha](self, "_computeForegroundAlpha");
    -[NTKUtilityComplicationView _updateForegroundAlpha](self, "_updateForegroundAlpha");
  }
}

- (void)_updateForegroundAlpha
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__NTKUtilityComplicationView__updateForegroundAlpha__block_invoke;
  v3[3] = &unk_1E6BD41E0;
  v3[4] = self;
  -[NTKUtilityComplicationView _enumerateColoringViewsWithBlock:](self, "_enumerateColoringViewsWithBlock:", v3);
  -[NTKUtilityComplicationView _applyForegroundAlpha](self, "_applyForegroundAlpha");
}

void __52__NTKUtilityComplicationView__updateForegroundAlpha__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1F8E901F0) & 1) == 0)
    objc_msgSend(v3, "setAlpha:", *(double *)(*(_QWORD *)(a1 + 32) + 464));

}

- (void)_computeForegroundAlpha
{
  self->_computedForegroundAlpha = self->_foregroundAlpha;
}

- (void)setPlatterColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((NTKEqualObjects(v5, self->_platterColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_platterColor, a3);
    -[NTKUtilityComplicationView _computePlatterColor](self, "_computePlatterColor");
    -[NTKUtilityComplicationView _updatePlatterColor](self, "_updatePlatterColor");
  }

}

- (void)setForegroundImageAlpha:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_foregroundImageAlpha = a3;
    -[NTKUtilityComplicationView _computeForegroundImageAlpha](self, "_computeForegroundImageAlpha");
  }
}

- (void)_computeForegroundImageAlpha
{
  self->_computedForegroundImageAlpha = self->_foregroundImageAlpha;
}

- (void)_updateForegroundImageAlpha
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__NTKUtilityComplicationView__updateForegroundImageAlpha__block_invoke;
  v2[3] = &unk_1E6BD9C10;
  v2[4] = self;
  -[NTKUtilityComplicationView _enumerateColoringStackedImagesViewsWithBlock:](self, "_enumerateColoringStackedImagesViewsWithBlock:", v2);
}

uint64_t __57__NTKUtilityComplicationView__updateForegroundImageAlpha__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", *(double *)(*(_QWORD *)(a1 + 32) + 472));
}

- (void)setForegroundColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_foregroundColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    -[NTKUtilityComplicationView _computeForegroundColor](self, "_computeForegroundColor");
    -[NTKUtilityComplicationView _updateForegroundColor](self, "_updateForegroundColor");
  }

}

- (void)setShadowColor:(id)a3
{
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_shadowColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shadowColor, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__NTKUtilityComplicationView_setShadowColor___block_invoke;
    v6[3] = &unk_1E6BD41E0;
    v7 = v5;
    -[NTKUtilityComplicationView _enumerateColoringViewsWithBlock:](self, "_enumerateColoringViewsWithBlock:", v6);

  }
}

void __45__NTKUtilityComplicationView_setShadowColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F8EA3970))
    objc_msgSend(v3, "setShadowColor:", *(_QWORD *)(a1 + 32));

}

- (void)applyFaceColorPalette:(id)a3 units:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v10[4];
  char v11;

  v6 = a3;
  -[NTKUtilityComplicationView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:units:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:units:", v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKUtilityComplicationView _applyColorScheme:](self, "_applyColorScheme:", v8);
  v9 = objc_msgSend(v6, "isMulticolor");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__NTKUtilityComplicationView_applyFaceColorPalette_units___block_invoke;
  v10[3] = &__block_descriptor_33_e35_v16__0__UIView_CLKUIColoringView__8l;
  v11 = v9;
  -[NTKUtilityComplicationView _enumerateColoringViewsWithBlock:](self, "_enumerateColoringViewsWithBlock:", v10);

}

void __58__NTKUtilityComplicationView_applyFaceColorPalette_units___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = 0.0;
    if (!*(_BYTE *)(a1 + 32))
      v3 = 1.0;
    objc_msgSend(v4, "transitionToMonochromeWithFraction:", v3);
  }

}

- (void)applyTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 units:(unint64_t)a6 brightenedUnits:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];

  v12 = a5;
  v13 = a4;
  -[NTKUtilityComplicationView device](self, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = 0;
  +[NTKFaceColorScheme interpolationForDevice:fromFaceColorPalette:toFaceColorPalette:fraction:units:brightenUnits:overrideColor:alternateHighlight:](NTKFaceColorScheme, "interpolationForDevice:fromFaceColorPalette:toFaceColorPalette:fraction:units:brightenUnits:overrideColor:alternateHighlight:", v14, v13, v12, a6, a7, 0, a3, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilityComplicationView _applyColorScheme:](self, "_applyColorScheme:", v15);

  objc_msgSend(v13, "isMulticolor");
  objc_msgSend(v12, "isMulticolor");

  CLKInterpolateBetweenFloatsClipped();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __116__NTKUtilityComplicationView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke;
  v18[3] = &__block_descriptor_40_e35_v16__0__UIView_CLKUIColoringView__8l;
  v18[4] = v16;
  -[NTKUtilityComplicationView _enumerateColoringViewsWithBlock:](self, "_enumerateColoringViewsWithBlock:", v18);
}

void __116__NTKUtilityComplicationView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transitionToMonochromeWithFraction:", *(double *)(a1 + 32));

}

- (void)_applyColorScheme:(id)a3
{
  id v5;
  void *v6;
  _QWORD v7[5];

  objc_storeStrong((id *)&self->_colorScheme, a3);
  v5 = a3;
  objc_msgSend(v5, "foregroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilityComplicationView setForegroundColor:](self, "setForegroundColor:", v6);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NTKUtilityComplicationView__applyColorScheme___block_invoke;
  v7[3] = &unk_1E6BD9C10;
  v7[4] = self;
  -[NTKUtilityComplicationView _enumerateColoringStackedImagesViewsWithBlock:](self, "_enumerateColoringStackedImagesViewsWithBlock:", v7);

}

uint64_t __48__NTKUtilityComplicationView__applyColorScheme___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateImageViewColor:", a2);
}

- (void)setUsesLegibility:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  if (self->_usesLegibility != a3)
  {
    self->_usesLegibility = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __48__NTKUtilityComplicationView_setUsesLegibility___block_invoke;
    v3[3] = &__block_descriptor_33_e35_v16__0__UIView_CLKUIColoringView__8l;
    v4 = a3;
    -[NTKUtilityComplicationView _enumerateColoringViewsWithBlock:](self, "_enumerateColoringViewsWithBlock:", v3);
  }
}

uint64_t __48__NTKUtilityComplicationView_setUsesLegibility___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUsesLegibility:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setFont:(id)a3
{
  id v5;
  CLKFont **p_font;
  void *v7;
  uint64_t v8;
  CLKFont *v9;
  _QWORD v10[5];

  v5 = a3;
  p_font = &self->_font;
  if ((NTKEqualObjects(v5, self->_font) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    objc_msgSend((id)objc_opt_class(), "_preferredAdditionalFontSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CLKFont CLKFontByApplyingFeatureSettings:](*p_font, "CLKFontByApplyingFeatureSettings:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *p_font;
      *p_font = (CLKFont *)v8;

    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__NTKUtilityComplicationView_setFont___block_invoke;
    v10[3] = &unk_1E6BD41E0;
    v10[4] = self;
    -[NTKUtilityComplicationView _enumerateColoringViewsWithBlock:](self, "_enumerateColoringViewsWithBlock:", v10);

  }
}

void __38__NTKUtilityComplicationView_setFont___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setFont:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));

}

- (void)setPlacement:(unint64_t)a3
{
  char v3;
  UIEdgeInsets *p_touchEdgeInsets;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  v3 = a3;
  self->_placement = a3;
  p_touchEdgeInsets = &self->_touchEdgeInsets;
  -[NTKUtilityComplicationView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_touchEdgeInsets->top = NTKUtilityTouchEdgeInsetsForPlacementAndDevice(v3, v6);
  p_touchEdgeInsets->left = v7;
  p_touchEdgeInsets->bottom = v8;
  p_touchEdgeInsets->right = v9;

  -[NTKUtilityComplicationView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isPlacementForTopBezelComplication
{
  return self->_placement < 2;
}

- (void)setShouldUseBackgroundPlatter:(BOOL)a3
{
  void *v4;
  _BOOL4 shouldUseBackgroundPlatter;
  void *v6;
  void *v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[192];
  uint64_t v12;

  if (self->_shouldUseBackgroundPlatter != a3)
  {
    self->_shouldUseBackgroundPlatter = a3;
    -[UIView layer](self->_highlightView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    shouldUseBackgroundPlatter = self->_shouldUseBackgroundPlatter;
    -[NTKUtilityComplicationView device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (shouldUseBackgroundPlatter)
    {
      _LayoutConstants_49(v6, v11);
      v8 = (double *)&v12;
    }
    else
    {
      _LayoutConstants_49(v6, &v9);
      v8 = (double *)&v10;
    }
    objc_msgSend(v4, "setCornerRadius:", *v8);

    -[NTKUtilityComplicationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAlwaysEnforcePlatterInset:(BOOL)a3
{
  if (self->_alwaysEnforcePlatterInset != a3)
  {
    self->_alwaysEnforcePlatterInset = a3;
    -[NTKUtilityComplicationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)shouldUsePlatterInset
{
  return -[NTKUtilityComplicationView shouldUseBackgroundPlatter](self, "shouldUseBackgroundPlatter")
      || -[NTKUtilityComplicationView alwaysEnforcePlatterInset](self, "alwaysEnforcePlatterInset");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double minimumWidth;
  double v10;
  double v11[43];
  char v12[8];
  double v13;
  CGSize result;

  -[NTKUtilityComplicationView _widthThatFits](self, "_widthThatFits", a3.width, a3.height);
  v5 = v4;
  -[NTKUtilityComplicationView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v6, v12);
  v7 = v13;

  if (-[NTKUtilityComplicationView shouldUsePlatterInset](self, "shouldUsePlatterInset"))
  {
    -[NTKUtilityComplicationView device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v8, v11);
    v5 = v5 + v11[22] * 2.0;

  }
  minimumWidth = self->_minimumWidth;
  if (v5 >= minimumWidth)
    minimumWidth = v5;
  v10 = v7;
  result.height = v10;
  result.width = minimumWidth;
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
  UIImageView *backgroundPlatter;
  void *v12;
  UIImageView *v13;
  UIImageView *v14;
  UIImageView *v15;
  void *v16;
  void *v17;
  void *v18;
  double x;
  double y;
  double width;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  CGFloat v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double height;
  _BYTE v33[128];
  double v34;
  _BYTE v35[120];
  double v36;
  _BYTE v37[184];
  double v38;
  _BYTE v39[184];
  double v40;
  objc_super v41;
  _BYTE v42[8];
  double v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v41.receiver = self;
  v41.super_class = (Class)NTKUtilityComplicationView;
  -[NTKUtilityComplicationView layoutSubviews](&v41, sel_layoutSubviews);
  -[NTKUtilityComplicationView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  backgroundPlatter = self->_backgroundPlatter;
  if (self->_shouldUseBackgroundPlatter)
  {
    if (!backgroundPlatter)
    {
      -[NTKUtilityComplicationView _backgroundPlatterImage](self, "_backgroundPlatterImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
      v14 = self->_backgroundPlatter;
      self->_backgroundPlatter = v13;

      v15 = self->_backgroundPlatter;
      -[NTKUtilityComplicationView _computedPlatterColor](self, "_computedPlatterColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v15, "setTintColor:", v16);

      backgroundPlatter = self->_backgroundPlatter;
    }
    -[UIImageView superview](backgroundPlatter, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      -[NTKUtilityComplicationView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundPlatter, 0);
    -[NTKUtilityComplicationView device](self, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v18, v39);
    v44.origin.x = v4;
    v44.origin.y = v6;
    v44.size.width = v8;
    v44.size.height = v10;
    v45 = CGRectInset(v44, 0.0, -v40);
    x = v45.origin.x;
    y = v45.origin.y;
    width = v45.size.width;

    -[NTKUtilityComplicationView device](self, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v22, v42);
    v23 = v43;
    -[NTKUtilityComplicationView device](self, "device");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v24, v37);
    v25 = v23 + v38 * 2.0;

    -[UIImageView setFrame:](self->_backgroundPlatter, "setFrame:", x, y, width, v25);
  }
  else
  {
    -[UIImageView removeFromSuperview](backgroundPlatter, "removeFromSuperview");
  }
  -[NTKUtilityComplicationView device](self, "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v26, v35);
  v27 = -v36;
  -[NTKUtilityComplicationView device](self, "device");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v28, v33);
  v46.origin.x = v4;
  v46.origin.y = v6;
  v46.size.width = v8;
  v46.size.height = v10;
  v47 = CGRectInset(v46, v27, -v34);
  v29 = v47.origin.x;
  v30 = v47.origin.y;
  v31 = v47.size.width;
  height = v47.size.height;

  -[UIView setFrame:](self->_highlightView, "setFrame:", v29, v30, v31, height);
}

- (id)_backgroundPlatterImage
{
  void *v2;
  void *v3;

  -[NTKUtilityComplicationView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UtilityPlatterBackgroundTemplateImage(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)layoutLabelVertically:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double Height;
  id v21;
  CGRect v22;
  CGRect v23;

  v21 = a3;
  -[NTKUtilityComplicationView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v21, "sizeToFit");
  objc_msgSend(v21, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  Height = CGRectGetHeight(v22);
  v23.origin.x = v13;
  v23.origin.y = v15;
  v23.size.width = v17;
  v23.size.height = v19;
  objc_msgSend(v21, "setFrame:", v13, v7 + (Height - CGRectGetHeight(v23)) * 0.5, v17, v19);

}

- (double)_imageViewOriginYWithBaseImageSize:(CGSize)a3 labelFrame:(CGRect)a4
{
  return CGRectGetMidY(a4) + a3.height * -0.5;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[NTKUtilityComplicationView bounds](self, "bounds", a4);
  top = self->_touchEdgeInsets.top;
  left = self->_touchEdgeInsets.left;
  v15.origin.x = v9 + left;
  v15.origin.y = v10 + top;
  v15.size.width = v11 - (left + self->_touchEdgeInsets.right);
  v15.size.height = v12 - (top + self->_touchEdgeInsets.bottom);
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
}

- (void)_updateImageViewAlpha:(id)a3
{
  _BOOL8 usesLegibility;
  id v5;

  usesLegibility = self->_usesLegibility;
  v5 = a3;
  objc_msgSend(v5, "setUsesLegibility:", usesLegibility);
  objc_msgSend(v5, "setAlpha:", self->_foregroundImageAlpha);

}

- (void)_updateImageViewColor:(id)a3
{
  _BOOL4 v4;
  UIColor *v5;
  UIColor *overrideColor;
  UIColor *v7;
  _BOOL4 v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKFaceColorScheme multicolorAlpha](self->_colorScheme, "multicolorAlpha");
    objc_msgSend(v10, "setMulticolorAlpha:");
  }
  v4 = -[NTKFaceColorScheme containsOverrideFaceColor](self->_colorScheme, "containsOverrideFaceColor");
  objc_msgSend(v10, "overrideColor");
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  overrideColor = v5;
  if (!v5)
    overrideColor = self->_overrideColor;
  v7 = overrideColor;

  if (v7)
    v8 = v4;
  else
    v8 = 0;
  if (v8)
  {
    objc_msgSend(v10, "setColor:", v7);
  }
  else
  {
    -[NTKUtilityComplicationView _computedForegroundColor](self, "_computedForegroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v9);

  }
}

- (void)setUseRoundedFontDesign:(BOOL)a3
{
  if (self->_useRoundedFontDesign != a3)
  {
    self->_useRoundedFontDesign = a3;
    -[NTKUtilityComplicationView _updateLabelsForFontChange](self, "_updateLabelsForFontChange");
  }
}

- (void)setFontWeight:(double)a3
{
  if (self->_fontWeight != a3)
  {
    self->_fontWeight = a3;
    -[NTKUtilityComplicationView _updateLabelsForFontChange](self, "_updateLabelsForFontChange");
  }
}

- (void)setFontSize:(double)a3
{
  if (self->_fontSize != a3)
  {
    self->_fontSize = a3;
    -[NTKUtilityComplicationView _updateLabelsForFontChange](self, "_updateLabelsForFontChange");
  }
}

- (void)_updateLabelsForFontChange
{
  id v3;

  -[NTKUtilityComplicationView _standardFont](self, "_standardFont");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKUtilityComplicationView setFont:](self, "setFont:", v3);

}

- (void)setMaxSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGSize *p_maxSize;

  height = a3.height;
  width = a3.width;
  p_maxSize = &self->_maxSize;
  if ((CLKSizeEqualsSize() & 1) == 0)
  {
    p_maxSize->width = width;
    p_maxSize->height = height;
    -[NTKUtilityComplicationView _updateContentForMaxSizeChange](self, "_updateContentForMaxSizeChange");
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[NTKUtilityComplicationView _updateContentForEditingChange](self, "_updateContentForEditingChange");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  _QWORD *v8;
  double v9;
  void *v10;
  _QWORD aBlock[6];
  _QWORD v12[7];

  if (self->_highlighted != a3)
  {
    v3 = a3;
    self->_highlighted = a3;
    if (-[NTKUtilityComplicationView shouldScaleAndFadeWhenHighlighting](self, "shouldScaleAndFadeWhenHighlighting"))
    {
      v5 = 0.95;
      v6 = 1.0;
      if (v3)
        v6 = 0.6;
      else
        v5 = 1.0;
      if (v3)
        v7 = 0.1;
      else
        v7 = 0.2;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __45__NTKUtilityComplicationView_setHighlighted___block_invoke;
      v12[3] = &unk_1E6BD9CA0;
      v12[4] = self;
      *(double *)&v12[5] = v5;
      *(double *)&v12[6] = v6;
      v8 = v12;
    }
    else
    {
      v9 = 1.0;
      if (!v3)
        v9 = 0.0;
      aBlock[1] = 3221225472;
      aBlock[0] = MEMORY[0x1E0C809B0];
      if (v3)
        v7 = 0.0;
      else
        v7 = 0.2;
      aBlock[2] = __45__NTKUtilityComplicationView_setHighlighted___block_invoke_2;
      aBlock[3] = &unk_1E6BD09B0;
      aBlock[4] = self;
      *(double *)&aBlock[5] = v9;
      v8 = aBlock;
    }
    v10 = _Block_copy(v8);
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v10, v7);

  }
}

uint64_t __45__NTKUtilityComplicationView_setHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
}

uint64_t __45__NTKUtilityComplicationView_setHighlighted___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_applyForegroundAlpha");
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  return 0;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  CLKComplicationTemplate *v6;
  CLKComplicationTemplate *v7;

  v6 = (CLKComplicationTemplate *)a3;
  if (self->_complicationTemplate != v6)
  {
    v7 = v6;
    objc_storeStrong((id *)&self->_complicationTemplate, a3);
    -[NTKUtilityComplicationView _updateForTemplateChange](self, "_updateForTemplateChange");
    v6 = v7;
  }

}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  NSDate **p_timeTravelDate;
  NSDate *timeTravelDate;
  NSDate *v10;
  _BOOL4 v12;
  _QWORD v13[5];

  v6 = a3;
  v7 = v6;
  p_timeTravelDate = &self->_timeTravelDate;
  timeTravelDate = self->_timeTravelDate;
  if (v6)
  {
    if ((objc_msgSend(v6, "isEqual:", timeTravelDate) & 1) != 0)
      goto LABEL_17;
    v10 = *p_timeTravelDate;
    v12 = -[CLKComplicationTemplate timeTravelUpdateFrequency](self->_complicationTemplate, "timeTravelUpdateFrequency") == 2
       || v10 == 0;
  }
  else
  {
    if (!timeTravelDate || (objc_msgSend(0, "isEqual:") & 1) != 0)
      goto LABEL_17;
    v12 = 1;
  }
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  if (*p_timeTravelDate
    && -[CLKComplicationTemplate timeTravelUpdateFrequency](self->_complicationTemplate, "timeTravelUpdateFrequency") == 2)
  {
    v12 = 1;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__NTKUtilityComplicationView_setTimeTravelDate_animated___block_invoke;
  v13[3] = &unk_1E6BD41E0;
  v13[4] = self;
  -[NTKUtilityComplicationView _enumerateColoringViewsWithBlock:](self, "_enumerateColoringViewsWithBlock:", v13);
  if (v12)
    -[NTKUtilityComplicationView _updateForTemplateChange](self, "_updateForTemplateChange");
LABEL_17:

}

void __57__NTKUtilityComplicationView_setTimeTravelDate_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setInTimeTravel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440) != 0);

}

- (id)_newDigitalTimeLabelSubviewWithOptions:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  +[CLKUITimeLabel labelWithOptions:forDevice:](NTKDigitalTimeLabel, "labelWithOptions:forDevice:", a3, self->_device);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuppressesDesignatorWhitespace:", 1);

  -[NTKUtilityComplicationView _computedForegroundColor](self, "_computedForegroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  -[NTKUtilityComplicationView foregroundAlpha](self, "foregroundAlpha");
  objc_msgSend(v4, "setAlpha:");
  -[NTKUtilityComplicationView _standardFont](self, "_standardFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilityComplicationView _smallCapsFont](self, "_smallCapsFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeFont:designatorFont:", v7, v8);

  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __69__NTKUtilityComplicationView__newDigitalTimeLabelSubviewWithOptions___block_invoke;
  v13 = &unk_1E6BCD7F0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "setDidResizeHandler:", &v10);
  -[NTKUtilityComplicationView addSubview:](self, "addSubview:", v4, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v4;
}

void __69__NTKUtilityComplicationView__newDigitalTimeLabelSubviewWithOptions___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");
  objc_msgSend(WeakRetained, "displayObserver");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "complicationDisplayNeedsResize:", WeakRetained);

}

- (id)_newLabelSubviewWithFont:(id)a3 variant:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v6 = a3;
  if (a4 <= 2)
    objc_opt_class();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setFont:", v6);
  objc_msgSend(v7, "setUsesLegibility:", self->_usesLegibility);
  -[NTKUtilityComplicationView _computedForegroundColor](self, "_computedForegroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v8);

  objc_msgSend(v7, "setShadowColor:", self->_shadowColor);
  -[NTKUtilityComplicationView foregroundAlpha](self, "foregroundAlpha");
  objc_msgSend(v7, "setAlpha:");
  objc_msgSend(v7, "setUppercase:", 1);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__NTKUtilityComplicationView__newLabelSubviewWithFont_variant___block_invoke;
  v13[3] = &unk_1E6BCD7C8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v7, "setNowProvider:", v13);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __63__NTKUtilityComplicationView__newLabelSubviewWithFont_variant___block_invoke_2;
  v11[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v7, "setNeedsResizeHandler:", v11);
  -[NTKUtilityComplicationView addSubview:](self, "addSubview:", v7);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v7;
}

id __63__NTKUtilityComplicationView__newLabelSubviewWithFont_variant___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timeTravelDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

void __63__NTKUtilityComplicationView__newLabelSubviewWithFont_variant___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");
  objc_msgSend(WeakRetained, "displayObserver");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "complicationDisplayNeedsResize:", WeakRetained);

}

- (id)_newStandardLabelSubviewVariant:(unint64_t)a3
{
  void *v5;
  id v6;

  -[NTKUtilityComplicationView _standardFont](self, "_standardFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NTKUtilityComplicationView _newLabelSubviewWithFont:variant:](self, "_newLabelSubviewWithFont:variant:", v5, a3);

  objc_msgSend(v6, "setInTimeTravel:", self->_timeTravelDate != 0);
  return v6;
}

- (id)_newStandardLabelSubview
{
  return -[NTKUtilityComplicationView _newStandardLabelSubviewVariant:](self, "_newStandardLabelSubviewVariant:", 0);
}

- (id)_newHighlightViewVariant:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v13[43];
  _BYTE v14[136];
  double v15;

  v5 = (void *)MEMORY[0x1E0DC3658];
  -[NTKUtilityComplicationView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v6, v14);
  objc_msgSend(v5, "colorWithWhite:alpha:", 1.0, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setTintColor:", v7);
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v8 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v8, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUtilityComplicationView device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v11, v13);
    objc_msgSend(v10, "setCornerRadius:", v13[19]);

    objc_msgSend(v8, "setBackgroundColor:", v7);
  }
  objc_msgSend(v8, "setAlpha:", 0.0);
  -[NTKUtilityComplicationView addSubview:](self, "addSubview:", v8);

  return v8;
}

- (id)_newHighlightView
{
  return -[NTKUtilityComplicationView _newHighlightViewVariant:](self, "_newHighlightViewVariant:", 0);
}

- (id)_newStandardCurvedLabelSubview
{
  return -[NTKUtilityComplicationView _newStandardLabelSubviewVariant:](self, "_newStandardLabelSubviewVariant:", 2);
}

- (id)_newCurvedCircularHighlightView
{
  return -[NTKUtilityComplicationView _newHighlightViewVariant:](self, "_newHighlightViewVariant:", 1);
}

- (id)_newCurvedPathHighlightView
{
  return -[NTKUtilityComplicationView _newHighlightViewVariant:](self, "_newHighlightViewVariant:", 2);
}

- (id)_newImageViewSubviewWithAlpha:(double)a3
{
  id v5;
  void *v6;

  v5 = objc_alloc_init((Class)off_1E6BCA6D8);
  -[NTKUtilityComplicationView _computedForegroundColor](self, "_computedForegroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v6);

  objc_msgSend(v5, "setAlpha:", a3);
  -[NTKUtilityComplicationView addSubview:](self, "addSubview:", v5);
  return v5;
}

- (id)_newImageViewSubview
{
  -[NTKUtilityComplicationView foregroundAlpha](self, "foregroundAlpha");
  return -[NTKUtilityComplicationView _newImageViewSubviewWithAlpha:](self, "_newImageViewSubviewWithAlpha:");
}

- (id)_standardFont
{
  double fontSize;
  double fontWeight;
  void *v5;
  void *v6;
  uint64_t v7;

  fontSize = self->_fontSize;
  fontWeight = self->_fontWeight;
  if (self->_useRoundedFontDesign)
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], fontSize, fontWeight);
  else
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", fontSize, fontWeight);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_useAlternativePunctuation)
  {
    objc_msgSend(v5, "CLKFontWithAlternativePunctuation");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (id)_smallCapsFont
{
  void *v2;
  void *v3;

  -[NTKUtilityComplicationView _standardFont](self, "_standardFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CLKFontWithLocalizedSmallCaps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)_widthThatFits
{
  return 0.0;
}

- (void)_updateForTemplateChange
{
  void *v3;
  id v4;

  -[NTKUtilityComplicationView complicationTemplate](self, "complicationTemplate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilityComplicationView setOverrideColor:](self, "setOverrideColor:", v3);

}

+ (id)_preferredAdditionalFontSettings
{
  return 0;
}

+ (id)_timerImageProvider
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_timerImageProvider___lock);
  WeakRetained = objc_loadWeakRetained(&_timerImageProvider___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_timerImageProvider___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_timerImageProvider___cachedDevice, v12);

    v13 = objc_loadWeakRetained(&_timerImageProvider___cachedDevice);
    _timerImageProvider___previousCLKDeviceVersion = objc_msgSend(v13, "version");

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __49__NTKUtilityComplicationView__timerImageProvider__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "version");
  v10 = _timerImageProvider___previousCLKDeviceVersion;

  if (v9 != v10)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_timerImageProvider___lock);
  return (id)_timerImageProvider_imageProvider;
}

void __49__NTKUtilityComplicationView__timerImageProvider__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  NTKImageNamed(CFSTR("analogTimerForeground"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NTKImageNamed(CFSTR("analogTimerBackground"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  NTKImageNamed(CFSTR("analogTimer"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:", v1, v0, v6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_timerImageProvider_imageProvider;
  _timerImageProvider_imageProvider = v2;

  v4 = (void *)_timerImageProvider_imageProvider;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

}

+ (id)_alarmImageProviderActive:(BOOL)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  os_unfair_lock_lock((os_unfair_lock_t)&_alarmImageProviderActive____lock);
  WeakRetained = objc_loadWeakRetained(&_alarmImageProviderActive____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(&_alarmImageProviderActive____cachedDevice);
  if (v6 != v7)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_alarmImageProviderActive____cachedDevice, v13);

    v14 = objc_loadWeakRetained(&_alarmImageProviderActive____cachedDevice);
    _alarmImageProviderActive____previousCLKDeviceVersion = objc_msgSend(v14, "version");

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __56__NTKUtilityComplicationView__alarmImageProviderActive___block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "version");
  v11 = _alarmImageProviderActive____previousCLKDeviceVersion;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_alarmImageProviderActive____lock);
  return (id)_alarmImageProviderActive___imageProvider;
}

void __56__NTKUtilityComplicationView__alarmImageProviderActive___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_alarmImageProviderActive___imageProvider;
  _alarmImageProviderActive___imageProvider = v0;

  v2 = (void *)_alarmImageProviderActive___imageProvider;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

}

+ (id)_stopwatchImageProvider
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_stopwatchImageProvider___lock);
  WeakRetained = objc_loadWeakRetained(&_stopwatchImageProvider___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_stopwatchImageProvider___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_stopwatchImageProvider___cachedDevice, v12);

    v13 = objc_loadWeakRetained(&_stopwatchImageProvider___cachedDevice);
    _stopwatchImageProvider___previousCLKDeviceVersion = objc_msgSend(v13, "version");

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __53__NTKUtilityComplicationView__stopwatchImageProvider__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "version");
  v10 = _stopwatchImageProvider___previousCLKDeviceVersion;

  if (v9 != v10)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_stopwatchImageProvider___lock);
  return (id)_stopwatchImageProvider_imageProvider;
}

void __53__NTKUtilityComplicationView__stopwatchImageProvider__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("stopwatch"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_stopwatchImageProvider_imageProvider;
  _stopwatchImageProvider_imageProvider = v0;

  v2 = (void *)_stopwatchImageProvider_imageProvider;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

}

- (CDComplicationDisplayObserver)displayObserver
{
  return (CDComplicationDisplayObserver *)objc_loadWeakRetained((id *)&self->displayObserver);
}

- (void)setDisplayObserver:(id)a3
{
  objc_storeWeak((id *)&self->displayObserver, a3);
}

- (unint64_t)textLayoutStyle
{
  return self->_textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->_textLayoutStyle = a3;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (BOOL)useAlternativePunctuation
{
  return self->_useAlternativePunctuation;
}

- (void)setUseAlternativePunctuation:(BOOL)a3
{
  self->_useAlternativePunctuation = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (UIColor)accentColor
{
  return self->_accentColor;
}

- (void)setAccentColor:(id)a3
{
  objc_storeStrong((id *)&self->_accentColor, a3);
}

- (UIColor)platterColor
{
  return self->_platterColor;
}

- (double)foregroundImageAlpha
{
  return self->_foregroundImageAlpha;
}

- (unint64_t)placement
{
  return self->_placement;
}

- (BOOL)shouldUseBackgroundPlatter
{
  return self->_shouldUseBackgroundPlatter;
}

- (BOOL)alwaysEnforcePlatterInset
{
  return self->_alwaysEnforcePlatterInset;
}

- (NSDate)timeTravelDate
{
  return (NSDate *)objc_getProperty(self, a2, 440, 1);
}

- (BOOL)useRoundedFontDesign
{
  return self->_useRoundedFontDesign;
}

- (double)fontWeight
{
  return self->_fontWeight;
}

- (BOOL)useBlockyHighlightCorners
{
  return self->_useBlockyHighlightCorners;
}

- (void)setUseBlockyHighlightCorners:(BOOL)a3
{
  self->_useBlockyHighlightCorners = a3;
}

- (BOOL)shouldScaleAndFadeWhenHighlighting
{
  return self->_shouldScaleAndFadeWhenHighlighting;
}

- (void)setShouldScaleAndFadeWhenHighlighting:(BOOL)a3
{
  self->_shouldScaleAndFadeWhenHighlighting = a3;
}

- (double)editingRotationAngle
{
  return self->_editingRotationAngle;
}

- (void)setEditingRotationAngle:(double)a3
{
  self->_editingRotationAngle = a3;
}

- (BOOL)suppressesInternalColorOverrides
{
  return self->_suppressesInternalColorOverrides;
}

- (void)setSuppressesInternalColorOverrides:(BOOL)a3
{
  self->_suppressesInternalColorOverrides = a3;
}

- (UIImageView)backgroundPlatter
{
  return self->_backgroundPlatter;
}

- (void)setBackgroundPlatter:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundPlatter, a3);
}

- (double)minimumWidth
{
  return self->_minimumWidth;
}

- (void)setMinimumWidth:(double)a3
{
  self->_minimumWidth = a3;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (UIEdgeInsets)touchEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchEdgeInsets.top;
  left = self->_touchEdgeInsets.left;
  bottom = self->_touchEdgeInsets.bottom;
  right = self->_touchEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchEdgeInsets = a3;
}

- (NTKFaceColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setOverrideColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideColor, a3);
}

- (CLKFont)font
{
  return self->_font;
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSize.width;
  height = self->_maxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)editing
{
  return self->_editing;
}

- (CLKComplicationTemplate)complicationTemplate
{
  return self->_complicationTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationTemplate, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundPlatter, 0);
  objc_storeStrong((id *)&self->_platterColor, 0);
  objc_storeStrong((id *)&self->_accentColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_destroyWeak((id *)&self->displayObserver);
  objc_storeStrong((id *)&self->_computedPlatterColor, 0);
  objc_storeStrong((id *)&self->_computedForegroundColor, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
}

@end
