@implementation CAMDrawerSmartStyleButton

- (CAMDrawerSmartStyleButton)initWithLayoutStyle:(int64_t)a3
{
  CAMDrawerSmartStyleButton *v4;
  CAMDrawerSmartStyleResetButton *v5;
  CAMDrawerSmartStyleResetButton *resetButton;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  CUShutterButton *shutterButton;
  CAMDrawerSmartStyleButton *v13;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CAMDrawerSmartStyleButton;
  v4 = -[CAMControlDrawerButton initWithLayoutStyle:](&v20, sel_initWithLayoutStyle_);
  if (v4)
  {
    v5 = -[CAMControlDrawerButton initWithLayoutStyle:]([CAMDrawerSmartStyleResetButton alloc], "initWithLayoutStyle:", a3);
    resetButton = v4->_resetButton;
    v4->_resetButton = v5;

    -[CAMControlDrawerButton setOrientation:](v4->_resetButton, "setOrientation:", -[CAMControlDrawerButton orientation](v4, "orientation"));
    -[CAMControlDrawerButton _backgroundView](v4->_resetButton, "_backgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.85);

    -[CAMDrawerSmartStyleButton _updateResetButtonVisibilityAnimated:](v4, "_updateResetButtonVisibilityAnimated:", 0);
    +[CAMControlDrawerButton buttonSize](CAMControlDrawerButton, "buttonSize");
    v9 = v8;
    v19 = 0;
    v17 = 0u;
    v18 = 0u;
    v10 = CAMPixelWidthForView(v4);
    CAMShutterButtonSpecMake((double *)&v17, v9, 3.0 - v10, 0.0, 0.0, 2.0);
    v15[0] = v17;
    v15[1] = v18;
    v16 = v19;
    +[CUShutterButton shutterButtonWithSpec:](CUShutterButton, "shutterButtonWithSpec:", v15);
    v11 = objc_claimAutoreleasedReturnValue();
    shutterButton = v4->_shutterButton;
    v4->_shutterButton = (CUShutterButton *)v11;

    -[CAMDrawerSmartStyleButton _updateShutterButtonVisibilityAnimated:](v4, "_updateShutterButtonVisibilityAnimated:", 0);
    -[CAMDrawerSmartStyleButton insertSubview:atIndex:](v4, "insertSubview:atIndex:", v4->_shutterButton, 0);
    -[CAMDrawerSmartStyleButton insertSubview:atIndex:](v4, "insertSubview:atIndex:", v4->_resetButton, 0);
    v13 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CAMDrawerSmartStyleButton;
  -[CAMControlDrawerCustomButton layoutSubviews](&v31, sel_layoutSubviews);
  -[CAMDrawerSmartStyleButton bounds](self, "bounds");
  UIRectGetCenter();
  v4 = v3;
  v6 = v5;
  -[CAMDrawerSmartStyleButton shutterButton](self, "shutterButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  CEKRectWithSize();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[CAMDrawerSmartStyleButton resetButton](self, "resetButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "intrinsicContentSize");
  CEKRectWithSize();
  v29 = v18;
  v30 = v17;
  v20 = v19;
  v28 = v21;

  v22 = v4;
  if (-[CAMControlDrawerCustomButton isExpanded](self, "isExpanded"))
  {
    -[CAMControlDrawerCustomButton expansionInsets](self, "expansionInsets");
    v22 = v4 + v23;
    v4 = v4 + v20 + 18.0;
  }
  -[CAMDrawerSmartStyleButton shutterButton](self, "shutterButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCenter:", v22, v6);

  -[CAMDrawerSmartStyleButton shutterButton](self, "shutterButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBounds:", v9, v11, v13, v15);

  -[CAMDrawerSmartStyleButton resetButton](self, "resetButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCenter:", v4, v6);

  -[CAMDrawerSmartStyleButton resetButton](self, "resetButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBounds:", v30, v29, v20, v28);

  -[CAMDrawerSmartStyleButton _updateResetButtonVisibilityAnimated:](self, "_updateResetButtonVisibilityAnimated:", 0);
  -[CAMDrawerSmartStyleButton _updateShutterButtonVisibilityAnimated:](self, "_updateShutterButtonVisibilityAnimated:", 0);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  BOOL v7;
  void *v8;
  BOOL v9;
  void *v10;
  objc_super v12;
  CGPoint v13;
  CGPoint v14;
  CGRect v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)CAMDrawerSmartStyleButton;
  if (-[CAMControlDrawerCustomButton pointInside:withEvent:](&v12, sel_pointInside_withEvent_, a4))
    return 1;
  if (-[CAMControlDrawerCustomButton isExpanded](self, "isExpanded"))
  {
    if (-[CAMDrawerSmartStyleButton isResetButtonVisibleWhenExpanded](self, "isResetButtonVisibleWhenExpanded"))
    {
      -[CAMDrawerSmartStyleButton resetButton](self, "resetButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      v13.x = x;
      v13.y = y;
      v9 = CGRectContainsPoint(v15, v13);

      if (v9)
        return 1;
    }
  }
  if (!-[CAMControlDrawerCustomButton isExpanded](self, "isExpanded"))
    return 0;
  -[CAMDrawerSmartStyleButton shutterButton](self, "shutterButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v14.x = x;
  v14.y = y;
  v7 = CGRectContainsPoint(v16, v14);

  return v7;
}

- (int64_t)controlType
{
  return 11;
}

- (id)imageNameForCurrentState
{
  _BOOL4 v2;
  __CFString *v3;

  v2 = -[CAMControlDrawerCustomButton isExpanded](self, "isExpanded");
  v3 = CFSTR("chevron.left");
  if (!v2)
    v3 = 0;
  return v3;
}

- (id)imageForCurrentState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  if (-[CAMControlDrawerCustomButton isExpanded](self, "isExpanded"))
  {
    v10.receiver = self;
    v10.super_class = (Class)CAMDrawerSmartStyleButton;
    -[CAMControlDrawerButton imageForCurrentState](&v10, sel_imageForCurrentState);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CAMDrawerSmartStyleButton _normalizedStyleValue](self, "_normalizedStyleValue");
    v5 = v4;
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMSmartStyleStatusIndicator gridImageWithSize:cornerRadius:strokeWidth:strokeToDotSpacing:gridDotWidth:valueDotWidth:value:color:](CAMSmartStyleStatusIndicator, "gridImageWithSize:cornerRadius:strokeWidth:strokeToDotSpacing:gridDotWidth:valueDotWidth:value:color:", v8, 24.0, 24.0, 5.0, 1.0, 3.0, 1.33333333, 4.33333333, v5, v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)imageForAXHUD
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMSmartStyleStatusIndicator gridImageWithSize:cornerRadius:strokeWidth:strokeToDotSpacing:gridDotWidth:valueDotWidth:value:color:](CAMSmartStyleStatusIndicator, "gridImageWithSize:cornerRadius:strokeWidth:strokeToDotSpacing:gridDotWidth:valueDotWidth:value:color:", v2, 48.0, 48.0, 10.0, 2.0, 6.0, 2.66666667, 8.66666667, 0x3FE0000000000000, 0x3FE0000000000000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    -[CAMControlDrawerButton updateImage](self, "updateImage");
  }
}

- (void)setSmartStyle:(id)a3
{
  -[CAMDrawerSmartStyleButton setSmartStyle:animated:](self, "setSmartStyle:animated:", a3, 0);
}

- (void)setSmartStyle:(id)a3 animated:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  if ((-[CEKSmartStyle isEqualToSmartStyle:](self->_smartStyle, "isEqualToSmartStyle:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_smartStyle, a3);
    objc_msgSend(v9, "colorBias");
    v7 = v6;
    objc_msgSend(v9, "toneBias");
    -[CAMDrawerSmartStyleButton _setNormalizedStyleValue:](self, "_setNormalizedStyleValue:", v7, v8);
  }

}

- (void)setShowDisabled:(BOOL)a3
{
  -[CAMDrawerSmartStyleButton setShowDisabled:animated:](self, "setShowDisabled:animated:", a3, 0);
}

- (void)setShowDisabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showDisabled != a3)
  {
    self->_showDisabled = a3;
    -[CAMControlDrawerButton updateImageAnimated:](self, "updateImageAnimated:", a4);
  }
}

- (void)_setNormalizedStyleValue:(CGPoint)a3
{
  if (self->__normalizedStyleValue.x != a3.x || self->__normalizedStyleValue.y != a3.y)
  {
    self->__normalizedStyleValue = a3;
    -[CAMControlDrawerButton updateImage](self, "updateImage");
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return CFSTR("SmartStyleButton");
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CAMDrawerSmartStyleButton;
  -[CAMControlDrawerButton setOrientation:animated:](&v8, sel_setOrientation_animated_);
  -[CAMDrawerSmartStyleButton resetButton](self, "resetButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOrientation:animated:", a3, v4);

}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  if (-[CAMControlDrawerCustomButton isExpanded](self, "isExpanded") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMDrawerSmartStyleButton;
    -[CAMControlDrawerCustomButton setExpanded:animated:](&v7, sel_setExpanded_animated_, v5, v4);
    -[CAMDrawerSmartStyleButton _updateResetButtonVisibilityAnimated:](self, "_updateResetButtonVisibilityAnimated:", v4);
    -[CAMDrawerSmartStyleButton _updateShutterButtonVisibilityAnimated:](self, "_updateShutterButtonVisibilityAnimated:", v4);
    -[CAMControlDrawerButton updateImageAnimated:](self, "updateImageAnimated:", v4);
  }
}

- (void)setResetButtonVisibleWhenExpanded:(BOOL)a3
{
  -[CAMDrawerSmartStyleButton setResetButtonVisibleWhenExpanded:animated:](self, "setResetButtonVisibleWhenExpanded:animated:", a3, 0);
}

- (void)setResetButtonVisibleWhenExpanded:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_resetButtonVisibleWhenExpanded != a3)
  {
    self->_resetButtonVisibleWhenExpanded = a3;
    -[CAMDrawerSmartStyleButton _updateResetButtonVisibilityAnimated:](self, "_updateResetButtonVisibilityAnimated:", a4);
  }
}

- (void)_updateResetButtonVisibilityAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.0;
  if (a3)
    v3 = 0.25;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__CAMDrawerSmartStyleButton__updateResetButtonVisibilityAnimated___block_invoke;
  v4[3] = &unk_1EA328868;
  v4[4] = self;
  +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v4, v3);
}

void __66__CAMDrawerSmartStyleButton__updateResetButtonVisibilityAnimated___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  v2 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "isExpanded"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isResetButtonVisibleWhenExpanded"))
      v2 = 1.0;
    else
      v2 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "resetButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (void)_updateShutterButtonVisibilityAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.0;
  if (a3)
    v3 = 0.25;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__CAMDrawerSmartStyleButton__updateShutterButtonVisibilityAnimated___block_invoke;
  v4[3] = &unk_1EA328868;
  v4[4] = self;
  +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v4, v3);
}

void __68__CAMDrawerSmartStyleButton__updateShutterButtonVisibilityAnimated___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isExpanded"))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "shutterButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (BOOL)isOn
{
  return self->_on;
}

- (CEKSmartStyle)smartStyle
{
  return self->_smartStyle;
}

- (BOOL)showDisabled
{
  return self->_showDisabled;
}

- (CUShutterButton)shutterButton
{
  return self->_shutterButton;
}

- (CAMDrawerSmartStyleResetButton)resetButton
{
  return self->_resetButton;
}

- (BOOL)isResetButtonVisibleWhenExpanded
{
  return self->_resetButtonVisibleWhenExpanded;
}

- (CGPoint)_normalizedStyleValue
{
  double x;
  double y;
  CGPoint result;

  x = self->__normalizedStyleValue.x;
  y = self->__normalizedStyleValue.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetButton, 0);
  objc_storeStrong((id *)&self->_shutterButton, 0);
  objc_storeStrong((id *)&self->_smartStyle, 0);
}

@end
