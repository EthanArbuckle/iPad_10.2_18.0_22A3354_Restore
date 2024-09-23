@implementation NTKModuleView

+ (double)_defaultCornerRadiusForDevice:(id)a3
{
  double result;

  CLKValueForDeviceMetrics();
  return result;
}

+ (double)cornerRadiusForComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a4;
  if (a3 == 12 || a3 == 7 || !a3)
    CLKValueForDeviceMetrics();
  else
    objc_msgSend(a1, "_defaultCornerRadiusForDevice:", v6);
  v8 = v7;

  return v8;
}

- (NTKModuleView)initWithFrame:(CGRect)a3
{
  NTKModuleView *v3;
  void *v4;
  void *v5;
  UIView *v6;
  UIView *highlightView;
  void *v8;
  NTKContainerView *v9;
  NTKContainerView *contentView;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKModuleView;
  v3 = -[NTKModuleView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKModuleView setDevice:](v3, "setDevice:", v5);

    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    highlightView = v3->_highlightView;
    v3->_highlightView = v6;

    -[UIView setUserInteractionEnabled:](v3->_highlightView, "setUserInteractionEnabled:", 0);
    -[UIView setHidden:](v3->_highlightView, "setHidden:", 1);
    if (-[CLKDevice deviceCategory](v3->_device, "deviceCategory") != 1)
    {
      -[UIView layer](v3->_highlightView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    }
    -[NTKModuleView addSubview:](v3, "addSubview:", v3->_highlightView);
    v9 = objc_alloc_init(NTKContainerView);
    contentView = v3->_contentView;
    v3->_contentView = v9;

    -[NTKContainerView setUserInteractionEnabled:](v3->_contentView, "setUserInteractionEnabled:", 0);
    -[NTKContainerView setLayoutDelegate:](v3->_contentView, "setLayoutDelegate:", v3);
    -[NTKModuleView addSubview:](v3, "addSubview:", v3->_contentView);
    objc_msgSend((id)objc_opt_class(), "_defaultCornerRadiusForDevice:", v3->_device);
    -[NTKModuleView setHighlightCornerRadius:](v3, "setHighlightCornerRadius:", v11 + 3.0);
  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *highlightView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKModuleView;
  -[NTKModuleView layoutSubviews](&v14, sel_layoutSubviews);
  v3 = -[NTKModuleView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = MEMORY[0x1BCCA72B8](v3);
  v12 = v11 + self->_contentHeightOffset;
  -[NTKContainerView setBounds:](self->_contentView, "setBounds:", v5, v7, v9, self->_contentHeight);
  -[NTKContainerView setCenter:](self->_contentView, "setCenter:", v10, v12);
  highlightView = self->_highlightView;
  -[NTKModuleView bounds](self, "bounds");
  -[UIView setFrame:](highlightView, "setFrame:");
}

- (void)setHighlightAlpha:(double)a3
{
  id v5;

  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_highlightAlpha = a3;
    -[UIView setHidden:](self->_highlightView, "setHidden:", a3 <= 0.0);
    -[UIColor colorWithAlphaComponent:](self->_highlightBackgroundColor, "colorWithAlphaComponent:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_highlightView, "setBackgroundColor:", v5);

  }
}

- (void)setForegroundColor:(id)a3
{
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v5 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v13 = objc_msgSend(v5, "isEqual:", self->_foregroundColor) ^ 1;
  v6 = MEMORY[0x1E0C809B0];
  if (*((_BYTE *)v11 + 24)
    || (v9[0] = MEMORY[0x1E0C809B0],
        v9[1] = 3221225472,
        v9[2] = __36__NTKModuleView_setForegroundColor___block_invoke,
        v9[3] = &unk_1E6BD41B8,
        v9[4] = self,
        v9[5] = &v10,
        -[NTKModuleView _enumerateForegroundColoringViewsWithBlock:](self, "_enumerateForegroundColoringViewsWithBlock:", v9), *((_BYTE *)v11 + 24)))
  {
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __36__NTKModuleView_setForegroundColor___block_invoke_2;
    v7[3] = &unk_1E6BD41E0;
    v8 = v5;
    -[NTKModuleView _enumerateForegroundColoringViewsWithBlock:](self, "_enumerateForegroundColoringViewsWithBlock:", v7);

  }
  _Block_object_dispose(&v10, 8);

}

void __36__NTKModuleView_setForegroundColor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v6, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496));

    if ((v5 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

uint64_t __36__NTKModuleView_setForegroundColor___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setColor:", *(_QWORD *)(a1 + 32));
}

- (void)setSecondaryForegroundColor:(id)a3
{
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_secondaryForegroundColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryForegroundColor, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__NTKModuleView_setSecondaryForegroundColor___block_invoke;
    v6[3] = &unk_1E6BD41E0;
    v7 = v5;
    -[NTKModuleView _enumerateSecondaryForegroundColoringViewsWithBlock:](self, "_enumerateSecondaryForegroundColoringViewsWithBlock:", v6);

  }
}

uint64_t __45__NTKModuleView_setSecondaryForegroundColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setColor:", *(_QWORD *)(a1 + 32));
}

- (void)setHighlightCornerRadius:(double)a3
{
  id v4;

  if (self->_highlightCornerRadius != a3)
  {
    self->_highlightCornerRadius = a3;
    -[UIView layer](self->_highlightView, "layer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", self->_highlightCornerRadius);

  }
}

- (void)_updateColors
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];

  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__NTKModuleView__updateColors__block_invoke;
  v5[3] = &unk_1E6BD41E0;
  v5[4] = self;
  -[NTKModuleView _enumerateForegroundColoringViewsWithBlock:](self, "_enumerateForegroundColoringViewsWithBlock:", v5);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __30__NTKModuleView__updateColors__block_invoke_2;
  v4[3] = &unk_1E6BD41E0;
  v4[4] = self;
  -[NTKModuleView _enumerateSecondaryForegroundColoringViewsWithBlock:](self, "_enumerateSecondaryForegroundColoringViewsWithBlock:", v4);
}

void __30__NTKModuleView__updateColors__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "foregroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

}

void __30__NTKModuleView__updateColors__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "secondaryForegroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

}

- (void)applyFaceColorPalette:(id)a3 units:(unint64_t)a4
{
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  v7 = objc_msgSend(v6, "isMulticolor");
  -[NTKModuleView device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NTKModuleView overrideColor](self, "overrideColor");
    v9 = objc_claimAutoreleasedReturnValue();
    +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:", v8, v6, v9, a4, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  else
  {
    +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:units:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:units:", v8, v6, a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[NTKModuleView setColorScheme:](self, "setColorScheme:", v10);
}

- (void)applyTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 units:(unint64_t)a6 brightenedUnits:(unint64_t)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v12 = a5;
  v17 = a4;
  -[NTKModuleView device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModuleView overrideColor](self, "overrideColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = 0;
  +[NTKFaceColorScheme interpolationForDevice:fromFaceColorPalette:toFaceColorPalette:fraction:units:brightenUnits:overrideColor:alternateHighlight:](NTKFaceColorScheme, "interpolationForDevice:fromFaceColorPalette:toFaceColorPalette:fraction:units:brightenUnits:overrideColor:alternateHighlight:", v13, v17, v12, a6, a7, v14, a3, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModuleView setColorScheme:](self, "setColorScheme:", v15);

  -[NTKModuleView _applyMonochromeTransitionFraction:fromFaceColorPalette:toFaceColorPalette:](self, "_applyMonochromeTransitionFraction:fromFaceColorPalette:toFaceColorPalette:", v17, v12, a3);
}

- (void)_applyMonochromeTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5
{
  id v8;
  id v9;
  char v10;
  _QWORD v11[5];
  char v12;

  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v8, "isMulticolor") & 1) != 0 || objc_msgSend(v9, "isMulticolor"))
  {
    if (objc_msgSend(v9, "isMulticolor") && !objc_msgSend(v8, "isMulticolor"))
      a3 = 1.0 - a3;
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__NTKModuleView__applyMonochromeTransitionFraction_fromFaceColorPalette_toFaceColorPalette___block_invoke;
  v11[3] = &__block_descriptor_41_e35_v16__0__UIView_CLKUIColoringView__8l;
  v12 = v10;
  *(double *)&v11[4] = a3;
  -[NTKModuleView _enumerateAllForegroundColoringViewsWithBlock:](self, "_enumerateAllForegroundColoringViewsWithBlock:", v11);

}

void __92__NTKModuleView__applyMonochromeTransitionFraction_fromFaceColorPalette_toFaceColorPalette___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(v3, "transitionToMonochromeWithFraction:", *(double *)(a1 + 32));
    else
      objc_msgSend(v3, "updateMonochromeColor");
  }

}

- (void)setColorScheme:(id)a3
{
  NTKFaceColorScheme *v5;
  NTKFaceColorScheme *v6;

  v5 = (NTKFaceColorScheme *)a3;
  if (self->_colorScheme != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    -[NTKModuleView applyColorScheme:](self, "applyColorScheme:", self->_colorScheme);
    v5 = v6;
  }

}

- (void)applyColorScheme:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "foregroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModuleView setForegroundColor:](self, "setForegroundColor:", v5);

  objc_msgSend(v4, "secondaryForegroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModuleView setSecondaryForegroundColor:](self, "setSecondaryForegroundColor:", v6);

  objc_msgSend(v4, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModuleView setHighlightBackgroundColor:](self, "setHighlightBackgroundColor:", v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__NTKModuleView_applyColorScheme___block_invoke;
  v9[3] = &unk_1E6BD41E0;
  v10 = v4;
  v8 = v4;
  -[NTKModuleView _enumerateForegroundColoringViewsWithBlock:](self, "_enumerateForegroundColoringViewsWithBlock:", v9);
  -[NTKModuleView _updateColors](self, "_updateColors");

}

void __34__NTKModuleView_applyColorScheme___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "multicolorAlpha");
    objc_msgSend(v3, "setMulticolorAlpha:");
  }

}

- (id)viewsAndSpacingArrayForSpace:(double)a3 view:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  objc_msgSend(v5, "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)viewsAndSpacingArrayForSpace:(double)a3 view:(id)a4 space:(double)a5 view:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a4;
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend(v9, "isHidden") & 1) == 0)
  {
    objc_msgSend(v13, "addObject:", v9);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
  objc_msgSend(v13, "addObject:", v10);

  return v13;
}

- (void)naturalHorizontalLayoutForViewsAndSpacing:(id)a3 columnAlignmentSpacing:(BOOL)a4
{
  id v6;
  CGFloat Width;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  float v15;
  double v16;
  int IsRTL;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;
  CGRect v31;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  Width = 0.0;
  if (CLKLayoutIsRTL())
  {
    -[NTKModuleView bounds](self, "bounds");
    Width = CGRectGetWidth(v30);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    v12 = Width;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "floatValue");
          v16 = v15;
          IsRTL = CLKLayoutIsRTL();
          v18 = -v16;
          if (!IsRTL)
            v18 = v16;
          v12 = v12 + v18;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "frame", (_QWORD)v24);
            v19 = CGRectGetWidth(v31);
            v20 = CLKLayoutIsRTL() ? v19 : 0.0;
            v21 = v12 - v20;
            objc_msgSend(v14, "frame");
            objc_msgSend(v14, "setFrame:", v21);
            v12 = Width;
            if (!a4)
            {
              v22 = CLKLayoutIsRTL();
              v23 = -0.0;
              if (!v22)
                v23 = v19;
              v12 = v21 + v23;
            }
          }
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

}

- (void)_enumerateAllForegroundColoringViewsWithBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[NTKModuleView _enumerateForegroundColoringViewsWithBlock:](self, "_enumerateForegroundColoringViewsWithBlock:", v4);
  -[NTKModuleView _enumerateSecondaryForegroundColoringViewsWithBlock:](self, "_enumerateSecondaryForegroundColoringViewsWithBlock:", v4);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  double v6;
  double v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD v10[6];
  objc_super v11;

  v3 = a3;
  v5 = -[NTKModuleView isHighlighted](self, "isHighlighted");
  v11.receiver = self;
  v11.super_class = (Class)NTKModuleView;
  -[NTKModuleView setHighlighted:](&v11, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    if (v3)
      v6 = 0.0;
    else
      v6 = 0.2;
    if (v3)
      v7 = 1.0;
    else
      v7 = 0.0;
    if (v3)
      -[UIView setHidden:](self->_highlightView, "setHidden:", 0);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __32__NTKModuleView_setHighlighted___block_invoke;
    v10[3] = &unk_1E6BD09B0;
    v10[4] = self;
    *(double *)&v10[5] = v7;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__NTKModuleView_setHighlighted___block_invoke_2;
    v8[3] = &unk_1E6BD4228;
    v9 = v3;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v10, v8, v6);
  }
}

void __32__NTKModuleView_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 472);
  objc_msgSend(*(id *)(v1 + 512), "colorWithAlphaComponent:", *(double *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

uint64_t __32__NTKModuleView_setHighlighted___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    if (!*(_BYTE *)(result + 40))
      return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 472), "setHidden:", 1);
  }
  return result;
}

- (BOOL)shouldCancelTouchesInScrollview
{
  return 1;
}

- (void)layoutContainerView:(id)a3
{
  kdebug_trace();
  -[NTKModuleView _layoutContentView](self, "_layoutContentView");
  kdebug_trace();
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__NTKModuleView_transitionToMonochromeWithFraction___block_invoke;
  v3[3] = &__block_descriptor_40_e35_v16__0__UIView_CLKUIColoringView__8l;
  *(double *)&v3[4] = a3;
  -[NTKModuleView _enumerateAllForegroundColoringViewsWithBlock:](self, "_enumerateAllForegroundColoringViewsWithBlock:", v3);
}

void __52__NTKModuleView_transitionToMonochromeWithFraction___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transitionToMonochromeWithFraction:", *(double *)(a1 + 32));

}

- (void)updateMonochromeColor
{
  -[NTKModuleView _enumerateAllForegroundColoringViewsWithBlock:](self, "_enumerateAllForegroundColoringViewsWithBlock:", &__block_literal_global_92);
}

void __38__NTKModuleView_updateMonochromeColor__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "updateMonochromeColor");

}

- (UIView)contentView
{
  return &self->_contentView->super;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->filterProvider, a3);
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)secondaryForegroundColor
{
  return self->_secondaryForegroundColor;
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (void)setHighlightBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightBackgroundColor, a3);
}

- (double)contentHeight
{
  return self->_contentHeight;
}

- (void)setContentHeight:(double)a3
{
  self->_contentHeight = a3;
}

- (double)contentHeightOffset
{
  return self->_contentHeightOffset;
}

- (void)setContentHeightOffset:(double)a3
{
  self->_contentHeightOffset = a3;
}

- (double)highlightAlpha
{
  return self->_highlightAlpha;
}

- (NTKFaceColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (double)highlightCornerRadius
{
  return self->_highlightCornerRadius;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setOverrideColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_secondaryForegroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->filterProvider);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
