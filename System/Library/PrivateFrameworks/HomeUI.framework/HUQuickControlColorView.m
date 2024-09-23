@implementation HUQuickControlColorView

- (unint64_t)mode
{
  void *v2;
  unint64_t v3;

  -[HUQuickControlColorView profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mode");

  return v3;
}

- (NSIndexPath)linearPaletteViewSelectedColorIndexPath
{
  void *v2;
  void *v3;

  -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedColorIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexPath *)v3;
}

- (HUQuickControlColorView)initWithProfile:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithProfile_colorPalette_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlColorView.m"), 68, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUQuickControlColorView initWithProfile:]",
    v6);

  return 0;
}

- (HUQuickControlColorView)initWithProfile:(id)a3 colorPalette:(id)a4
{
  id v6;
  id v7;
  HUQuickControlColorView *v8;
  HUQuickControlColorView *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UISegmentedControl *colorPickerModeSegmentedControl;
  void *v15;
  HUColorLinearPaletteView *v16;
  HUColorLinearPaletteView *colorLinearPaletteView;
  HUColorPickerView *v18;
  HUColorPickerView *colorPickerView;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUQuickControlColorView;
  v8 = -[HUQuickControlColorView init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HUQuickControlColorView setProfile:](v8, "setProfile:", v6);
    -[HUQuickControlColorView setReachabilityState:](v9, "setReachabilityState:", 0);
    -[HUQuickControlColorView setColorPalette:](v9, "setColorPalette:", v7);
    -[HUQuickControlColorView setOriginalPalette:](v9, "setOriginalPalette:", v7);
    v10 = (void *)objc_opt_new();
    _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlColorModeRGB"), CFSTR("HUQuickControlColorModeRGB"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertObject:atIndex:", v11, 0);

    _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlColorModeTemperature"), CFSTR("HUQuickControlColorModeTemperature"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertObject:atIndex:", v12, 1);

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA990]), "initWithItems:", v10);
    colorPickerModeSegmentedControl = v9->_colorPickerModeSegmentedControl;
    v9->_colorPickerModeSegmentedControl = (UISegmentedControl *)v13;

    -[HUQuickControlColorView profile](v9, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl setSelectedSegmentIndex:](v9->_colorPickerModeSegmentedControl, "setSelectedSegmentIndex:", objc_msgSend(v15, "supportsRGBColor") ^ 1);

    -[UISegmentedControl addTarget:action:forControlEvents:](v9->_colorPickerModeSegmentedControl, "addTarget:action:forControlEvents:", v9, sel__updateColorPicker, 4096);
    -[HUQuickControlColorView addSubview:](v9, "addSubview:", v9->_colorPickerModeSegmentedControl);
    v16 = -[HUColorLinearPaletteView initWithProfile:colorPalette:]([HUColorLinearPaletteView alloc], "initWithProfile:colorPalette:", v6, v7);
    colorLinearPaletteView = v9->_colorLinearPaletteView;
    v9->_colorLinearPaletteView = v16;

    -[HUColorLinearPaletteView setInteractionDelegate:](v9->_colorLinearPaletteView, "setInteractionDelegate:", v9);
    -[HUQuickControlColorView addSubview:](v9, "addSubview:", v9->_colorLinearPaletteView);
    v18 = -[HUColorPickerView initWithProfile:]([HUColorPickerView alloc], "initWithProfile:", v6);
    colorPickerView = v9->_colorPickerView;
    v9->_colorPickerView = v18;

    -[HUColorPickerView setTranslatesAutoresizingMaskIntoConstraints:](v9->_colorPickerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUColorPickerView setInteractionDelegate:](v9->_colorPickerView, "setInteractionDelegate:", v9);
    -[HUQuickControlColorView addSubview:](v9, "addSubview:", v9->_colorPickerView);

  }
  return v9;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlColorView;
  -[HUQuickControlColorView layoutSubviews](&v3, sel_layoutSubviews);
  -[HUQuickControlColorView _updateVisibleViews](self, "_updateVisibleViews");
  -[HUQuickControlColorView _updateLayout](self, "_updateLayout");
  -[HUQuickControlColorView _updateColorPicker](self, "_updateColorPicker");
  -[HUQuickControlColorView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:", -[HUQuickControlColorView reachabilityState](self, "reachabilityState"));
}

- (void)_updateVisibleViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlColorView profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", objc_msgSend(v4, "mode") == 1);

  -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        -[HUQuickControlColorView profile](self, "profile", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setHidden:", objc_msgSend(v14, "mode") == 0);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)_updateLayout
{
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double Height;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  id v46;
  CGRect v47;
  CGRect v48;

  v3 = *(double *)&HUQuickControlPushButtonSmallDiameter;
  -[HUQuickControlColorView profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mode");

  if (v5 == 1)
  {
    -[HUQuickControlColorView frame](self, "frame");
    v16 = v15 + -32.0;
    -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18;
    -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", 16.0, 65.0, v16, v19);

    -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlColorView profile](self, "profile");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", objc_msgSend(v22, "supportsRGBColor") ^ 1);

    -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMagnifierLength:", v3);

    -[HUQuickControlColorView frame](self, "frame");
    v25 = v24 + -64.0;
    -[HUQuickControlColorView frame](self, "frame");
    Height = CGRectGetHeight(v47);
    -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v28 = Height - CGRectGetMaxY(v48) + -64.0;

    if (v25 < v28)
      v28 = v25;
    if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
      v28 = v28 * 0.600000024;
    -[HUQuickControlColorView frame](self, "frame");
    v30 = v29 * 0.5 - v28 * 0.5;
    -[HUQuickControlColorView frame](self, "frame");
    v32 = v31;
    -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v35 = v32 - v34;
    -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frame");
    v38 = v35 - v37;

    v39 = (v38 - v28) / 3.0;
    -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "frame");
    v42 = v41;
    -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");
    v45 = v39 + v42 + v44;

    -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setFrame:", v30, v45, v28, v28);
  }
  else
  {
    if (v5)
      return;
    -[HUQuickControlColorView profile](self, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "orientation");

    v8 = 2;
    if (v7)
      v9 = 3;
    else
      v9 = 2;
    if (!v7)
      v8 = 3;
    v10 = (float)((float)v9 * 4.5) + (float)((float)v9 * 4.5) + v3 * (double)v9;
    v11 = (float)((float)v8 * 4.5) + (float)((float)v8 * 4.5) + v3 * (double)v8;
    -[HUQuickControlColorView frame](self, "frame");
    v13 = v12 * 0.5 - v10 * 0.5;
    -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v13, 0.0, v10, v11);

    -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setTag:", 0);
  }

}

- (HUQuickControlInteractiveView)activeView
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[HUQuickControlColorView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mode");

  if (v4 == 1)
  {
    -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v4)
  {
    v5 = 0;
  }
  else
  {
    -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HUQuickControlInteractiveView *)v5;
}

- (void)setProfile:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_profile, a3);
  v5 = a3;
  -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProfile:", v5);

  -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProfile:", v5);

}

- (BOOL)isSelectedColorInPalette
{
  HUQuickControlColorView *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = self;
  -[HUQuickControlColorView colorPalette](self, "colorPalette");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HUQuickControlColorView_isSelectedColorInPalette__block_invoke;
  v6[3] = &unk_1E6F58BB8;
  v6[4] = v2;
  LOBYTE(v2) = objc_msgSend(v4, "na_any:", v6);

  return (char)v2;
}

uint64_t __51__HUQuickControlColorView_isSelectedColorInPalette__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isSimilarToColor:", v4);

  return v5;
}

- (void)_updateColorPicker
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  id v18;

  -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedSegmentIndex");
  -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColorPickerMode:", v4);

  -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectedSegmentIndex");

  v8 = 0.0;
  if (v7 == 1)
  {
    -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;

    -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;

    if (v11 >= v14)
      v15 = v14;
    else
      v15 = v11;
    v8 = (v15 + *(double *)&HUQuickControlPushButtonSmallDiameter * -2.0) * 0.5;
  }
  -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWheelHoleRadius:", v8);

  v17 = *(double *)&HUQuickControlPushButtonSmallDiameter;
  -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMagnifierLength:", v17);

}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReachabilityState:", a3);

  -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReachabilityState:", a3);

  if (a3 >= 2)
  {
    if (a3 != 2)
      return;
    -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", 1.0);

    -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 1.0);

    -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    objc_msgSend(v9, "setUserInteractionEnabled:", 1);
  }
  else
  {
    -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.5);

    -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.5);

    -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserInteractionEnabled:", 0);
    v10 = 0;
  }

  -[HUQuickControlColorView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v10);
}

- (void)storeCurrentColorInformationAsOriginalValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HUQuickControlColorView selectedColor](self, "selectedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlColorView setOriginalValue:](self, "setOriginalValue:", v3);

  -[HUQuickControlColorView colorPalette](self, "colorPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlColorView setOriginalPalette:](self, "setOriginalPalette:", v4);

  -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedColorIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlColorView setOriginalSelectedColorIndexPath:](self, "setOriginalSelectedColorIndexPath:", v5);

}

- (BOOL)isUserInteractionActive
{
  void *v2;
  char v3;

  -[HUQuickControlColorView activeView](self, "activeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInteractionActive");

  return v3;
}

- (void)setValue:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  v32 = v6;
  if (!v6)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v32;
  else
    v7 = 0;
  v8 = v7;
  v6 = v32;
  v9 = v32;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

    v6 = v32;
LABEL_7:
    v9 = 0;
  }

  objc_opt_class();
  objc_msgSend(v9, "colorValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v9)
  {
    objc_msgSend(v14, "temperatureColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      -[HUQuickControlColorView colorPalette](self, "colorPalette");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "colors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __36__HUQuickControlColorView_setValue___block_invoke;
      v33[3] = &unk_1E6F58BB8;
      v9 = v9;
      v34 = v9;
      objc_msgSend(v17, "na_firstObjectPassingTest:", v33);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = v18;

        v9 = v19;
      }

    }
  }
  -[HUQuickControlColorView setSelectedColor:](self, "setSelectedColor:", v9);
  -[HUQuickControlColorView profile](self, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "mode");

  -[HUQuickControlColorView profile](self, "profile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21)
  {
    v24 = objc_msgSend(v22, "mode");

    if (v24 == 1)
    {
      -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setValue:", v32);

      -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setValue:", v32);

      -[HUQuickControlColorView originalValue](self, "originalValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        -[HUQuickControlColorView setOriginalValue:](self, "setOriginalValue:", v32);
      -[HUQuickControlColorView _updateColorPicker](self, "_updateColorPicker");
    }
  }
  else
  {
    v28 = objc_msgSend(v22, "naturalLightingEnabled");

    if (v28)
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31300]), "initWithNaturalLightColor");
      -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setValue:", v29);

    }
    else
    {
      -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setValue:", v32);

    }
  }

}

uint64_t __36__HUQuickControlColorView_setValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "colorValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_msgSend(v3, "isSimilarToColor:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)v7)
  {
    objc_msgSend(v6, "temperatureColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  return v7;
}

- (void)setColorPalette:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_colorPalette, a3);
  v5 = a3;
  -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColorPalette:", v5);

}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlColorView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUQuickControlColorView activeView](self, "activeView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginUserInteractionWithFirstTouchGestureRecognizer:", v4);

}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[HUQuickControlColorView profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mode");
  -[HUQuickControlColorView profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HUQuickControlColorViewMetricsForControlSizeModeAndOrientation(a3, v6, objc_msgSend(v7, "orientation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updateSelectedColorIndexPathToIndexPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSelectedColorIndexPathToIndexPath:", v4);

}

- (void)controlView:(id)a3 valueDidChange:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v8 = v6;
  if (!v8)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v8;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class());

LABEL_7:
    v10 = 0;
  }

  -[HUQuickControlColorView setSelectedColor:](self, "setSelectedColor:", v10);
  -[HUQuickControlColorView interactionDelegate](self, "interactionDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlColorView value](self, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "controlView:valueDidChange:", self, v14);

  -[HUQuickControlColorView profile](self, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "mode");

  if (v16 == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUQuickControlColorView selectedColor](self, "selectedColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v19 = v18;
      objc_msgSend(v18, "setValue:", v17);

      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUQuickControlColorView selectedColor](self, "selectedColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
LABEL_14:

}

- (void)controlView:(id)a3 interactionStateDidChange:(BOOL)a4 forFirstTouch:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;

  v5 = a5;
  v6 = a4;
  -[HUQuickControlColorView interactionDelegate](self, "interactionDelegate", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controlView:interactionStateDidChange:forFirstTouch:", self, v6, v5);

}

- (void)controlView:(id)a3 colorPickerModeDidChange:(unint64_t)a4
{
  id v5;

  -[HUQuickControlColorView colorPickerModeSegmentedControl](self, "colorPickerModeSegmentedControl", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedSegmentIndex:", a4);

}

- (void)controlView:(id)a3 colorPaletteDidChange:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUQuickControlColorView setColorPalette:](self, "setColorPalette:", v5);
  -[HUQuickControlColorView interactionDelegate](self, "interactionDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "controlView:colorPaletteDidChange:", self, v5);

}

- (void)presentFullColorViewForControlView:(id)a3 selectedColorIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUQuickControlColorView interactionDelegate](self, "interactionDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentFullColorViewForControlView:selectedColorIndexPath:", self, v5);

}

- (void)controlView:(id)a3 didSelectColorAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HUQuickControlColorView interactionDelegate](self, "interactionDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controlView:didSelectColorAtIndexPath:", v7, v6);

}

- (void)cancelColorPicking
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlColorView originalSelectedColorIndexPath](self, "originalSelectedColorIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateSelectedColorIndexPathToIndexPath:", v4);

  -[HUQuickControlColorView originalPalette](self, "originalPalette");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[HUQuickControlColorView originalPalette](self, "originalPalette");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlColorView colorPalette](self, "colorPalette");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setUserInteractionActive:", 1);

      -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setUserInteractionActive:", 1);

      -[HUQuickControlColorView interactionDelegate](self, "interactionDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlColorView originalPalette](self, "originalPalette");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "controlView:colorPaletteDidChange:", self, v13);

      -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setUserInteractionActive:", 0);

      -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUserInteractionActive:", 0);

    }
  }
  -[HUQuickControlColorView originalValue](self, "originalValue");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[HUQuickControlColorView originalValue](self, "originalValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlColorView selectedColor](self, "selectedColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if ((v20 & 1) == 0)
    {
      -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setUserInteractionActive:", 1);

      -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setUserInteractionActive:", 1);

      -[HUQuickControlColorView originalValue](self, "originalValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlColorView controlView:valueDidChange:](self, "controlView:valueDidChange:", self, v23);

      -[HUQuickControlColorView colorLinearPaletteView](self, "colorLinearPaletteView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setUserInteractionActive:", 0);

      -[HUQuickControlColorView colorPickerView](self, "colorPickerView");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setUserInteractionActive:", 0);

    }
  }
}

- (HUQuickControlColorViewProfile)profile
{
  return self->_profile;
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (HUQuickControlColorViewInteractionDelegate)interactionDelegate
{
  return (HUQuickControlColorViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (HFColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (HFColorPaletteColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedColor, a3);
}

- (id)originalValue
{
  return self->_originalValue;
}

- (void)setOriginalValue:(id)a3
{
  objc_storeStrong(&self->_originalValue, a3);
}

- (HFColorPalette)originalPalette
{
  return self->_originalPalette;
}

- (void)setOriginalPalette:(id)a3
{
  objc_storeStrong((id *)&self->_originalPalette, a3);
}

- (NSIndexPath)originalSelectedColorIndexPath
{
  return self->_originalSelectedColorIndexPath;
}

- (void)setOriginalSelectedColorIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_originalSelectedColorIndexPath, a3);
}

- (BOOL)showPickerModeControl
{
  return self->_showPickerModeControl;
}

- (void)setShowPickerModeControl:(BOOL)a3
{
  self->_showPickerModeControl = a3;
}

- (HUColorLinearPaletteView)colorLinearPaletteView
{
  return self->_colorLinearPaletteView;
}

- (void)setColorLinearPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_colorLinearPaletteView, a3);
}

- (HUColorPickerView)colorPickerView
{
  return self->_colorPickerView;
}

- (void)setColorPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerView, a3);
}

- (UISegmentedControl)colorPickerModeSegmentedControl
{
  return self->_colorPickerModeSegmentedControl;
}

- (void)setColorPickerModeSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerModeSegmentedControl, a3);
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPickerModeSegmentedControl, 0);
  objc_storeStrong((id *)&self->_colorPickerView, 0);
  objc_storeStrong((id *)&self->_colorLinearPaletteView, 0);
  objc_storeStrong((id *)&self->_originalSelectedColorIndexPath, 0);
  objc_storeStrong((id *)&self->_originalPalette, 0);
  objc_storeStrong(&self->_originalValue, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
