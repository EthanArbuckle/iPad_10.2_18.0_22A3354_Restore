@implementation MRUVolumeView

- (BOOL)showSecondarySlider
{
  return self->_showSecondarySlider;
}

- (BOOL)showStepper
{
  return self->_showStepper;
}

- (BOOL)showSpatialAudioModeButton
{
  return self->_showSpatialAudioModeButton;
}

- (MRUVolumeView)initWithFrame:(CGRect)a3
{
  MRUVolumeView *v3;
  MRUContinuousSliderView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  MRUContinuousSliderView *primarySlider;
  MRUContinuousSliderView *v11;
  MRUContinuousSliderView *secondarySlider;
  MRUVolumeStepperView *v13;
  MRUVolumeStepperView *stepper;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  MRUVisualStylingProvider *v19;
  MRUVisualStylingProvider *stylingProvider;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MRUVolumeView;
  v3 = -[MRUVolumeView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MRUContinuousSliderView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[CCUIContinuousSliderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    primarySlider = v3->_primarySlider;
    v3->_primarySlider = (MRUContinuousSliderView *)v9;

    -[MRUContinuousSliderView setGlyphScale:](v3->_primarySlider, "setGlyphScale:", MRUVolumeSliderGlyphScale());
    -[CCUIBaseSliderView setName:](v3->_primarySlider, "setName:", CFSTR("MRUVolumeIdentifierPrimaryMultiCategoryVolumeSlider"));
    -[CCUIBaseSliderView setShouldIncludeVolumeButtonsInput:](v3->_primarySlider, "setShouldIncludeVolumeButtonsInput:", +[MRUFeatureFlagProvider isVolumeInputControlCenterEnabled](MRUFeatureFlagProvider, "isVolumeInputControlCenterEnabled"));
    -[CCUIBaseSliderView setInteractiveWhenUnexpanded:](v3->_primarySlider, "setInteractiveWhenUnexpanded:", 1);
    -[MRUContinuousSliderView setAccessibilityIdentifier:](v3->_primarySlider, "setAccessibilityIdentifier:", CFSTR("cc-volume-slider"));
    -[MRUVolumeView addSubview:](v3, "addSubview:", v3->_primarySlider);
    v11 = -[CCUIContinuousSliderView initWithFrame:]([MRUContinuousSliderView alloc], "initWithFrame:", v5, v6, v7, v8);
    secondarySlider = v3->_secondarySlider;
    v3->_secondarySlider = v11;

    -[MRUContinuousSliderView setAccessibilityIdentifier:](v3->_secondarySlider, "setAccessibilityIdentifier:", CFSTR("cc-secondary-volume-slider"));
    -[MRUVolumeView addSubview:](v3, "addSubview:", v3->_secondarySlider);
    v13 = -[MRUVolumeStepperView initWithFrame:]([MRUVolumeStepperView alloc], "initWithFrame:", v5, v6, v7, v8);
    stepper = v3->_stepper;
    v3->_stepper = v13;

    -[MRUVolumeStepperView setAccessibilityIdentifier:](v3->_stepper, "setAccessibilityIdentifier:", CFSTR("cc-volume-stepper"));
    -[MRUVolumeView addSubview:](v3, "addSubview:", v3->_stepper);
    -[MRUContinuousSliderView materialView](v3->_primarySlider, "materialView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[MRUContinuousSliderView materialView](v3->_primarySlider, "materialView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "visualStylingProviderForCategory:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[MRUVisualStylingProvider initWithVisualStylingProvider:]([MRUVisualStylingProvider alloc], "initWithVisualStylingProvider:", v18);
      stylingProvider = v3->_stylingProvider;
      v3->_stylingProvider = v19;

    }
    -[MRUVolumeView updateSymbolConfiguration](v3, "updateSymbolConfiguration");
    -[MRUVolumeView updateVisibility](v3, "updateVisibility");
  }
  return v3;
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
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v27.receiver = self;
  v27.super_class = (Class)MRUVolumeView;
  -[MRUVolumeView layoutSubviews](&v27, sel_layoutSubviews);
  -[MRUVolumeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = CCUISliderExpandedContentModuleWidth();
  v13 = v12;
  v14 = MRUDefaultExpandedWidth(v11);
  if (self->_expanded)
  {
    if (!MRULayoutShouldBeVertical() && self->_showSpatialAudioModeButton && self->_showSecondarySlider)
    {
      MRUExpandedContentInsets();
      MRUHortizonalScreenInset(self);
      UIRectInset();
      CGRectGetWidth(v28);
    }
    else
    {
      v29.origin.x = v4;
      v29.origin.y = v6;
      v29.size.width = v8;
      v29.size.height = v10;
      CGRectGetWidth(v29);
    }
    UIRectInset();
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
    CGRectGetHeight(v30);
    v6 = 0.0;
    UIRectCenteredRect();
    -[MRUVolumeStepperView setFrame:](self->_stepper, "setFrame:");
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    MinX = CGRectGetMinX(v31);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v20 = CGRectGetHeight(v32);
    if (self->_showSecondarySlider)
    {
      v21 = v13;
      v22 = 0.0;
    }
    else
    {
      UIRectCenteredRect();
      MinX = v26;
    }
    -[MRUContinuousSliderView setFrame:](self->_primarySlider, "setFrame:", MinX, v22, v21, v20);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v25 = CGRectGetMaxX(v35) - v13;
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v10 = CGRectGetHeight(v36);
  }
  else
  {
    -[MRUVolumeStepperView setFrame:](self->_stepper, "setFrame:", v4, v6, v8, v10);
    -[MRUContinuousSliderView setFrame:](self->_primarySlider, "setFrame:", v4, v6, v8, v10);
    v23 = v14 + v13 * -2.0;
    v33.origin.x = v4;
    v33.origin.y = v6;
    v33.size.width = v8;
    v33.size.height = v10;
    v24 = CGRectGetWidth(v33) / v13;
    v34.origin.x = v4;
    v34.origin.y = v6;
    v34.size.width = v8;
    v34.size.height = v10;
    v25 = CGRectGetWidth(v34) + v23 * v24;
    v13 = v8;
  }
  -[MRUContinuousSliderView setFrame:](self->_secondarySlider, "setFrame:", v25, v6, v13, v10);
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[MRUVolumeView updateSymbolConfiguration](self, "updateSymbolConfiguration");
    -[MRUVolumeView updateVisibility](self, "updateVisibility");
    -[MRUVolumeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowSecondarySlider:(BOOL)a3
{
  if (self->_showSecondarySlider != a3)
  {
    self->_showSecondarySlider = a3;
    -[MRUVolumeView updateVisibility](self, "updateVisibility");
    -[MRUVolumeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowStepper:(BOOL)a3
{
  if (self->_showStepper != a3)
  {
    self->_showStepper = a3;
    -[MRUVolumeView updateVisibility](self, "updateVisibility");
    -[MRUVolumeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowSpatialAudioModeButton:(BOOL)a3
{
  if (self->_showSpatialAudioModeButton != a3)
  {
    self->_showSpatialAudioModeButton = a3;
    -[MRUVolumeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPrimaryInteractionEnabled:(BOOL)a3
{
  if (self->_primaryInteractionEnabled != a3)
  {
    self->_primaryInteractionEnabled = a3;
    -[MRUVolumeView updateVisibility](self, "updateVisibility");
  }
}

- (void)setSecondaryInteractionEnabled:(BOOL)a3
{
  if (self->_secondaryInteractionEnabled != a3)
  {
    self->_secondaryInteractionEnabled = a3;
    -[MRUVolumeView updateVisibility](self, "updateVisibility");
  }
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    -[MRUVolumeView updateVisibility](self, "updateVisibility");
  }
}

- (BOOL)isGroupRenderingRequired
{
  if (self->_showStepper)
    return 0;
  if (-[CCUIBaseSliderView isGroupRenderingRequired](self->_primarySlider, "isGroupRenderingRequired"))
    return 1;
  return -[CCUIBaseSliderView isGroupRenderingRequired](self->_secondarySlider, "isGroupRenderingRequired");
}

- (NSArray)punchOutRenderingViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIBaseSliderView punchOutRenderingViews](self->_primarySlider, "punchOutRenderingViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[CCUIBaseSliderView punchOutRenderingViews](self->_secondarySlider, "punchOutRenderingViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v6;
}

- (void)updateSymbolConfiguration
{
  double v3;
  id v4;

  v3 = 35.0;
  if (!self->_expanded)
    v3 = 25.0;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 6, 2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUContinuousSliderView setImageSymbolConfiguration:](self->_primarySlider, "setImageSymbolConfiguration:", v4);

}

- (void)updateVisibility
{
  _BOOL4 showStepper;
  MRUVolumeStepperView *stepper;
  double v5;
  MRUContinuousSliderView *secondarySlider;
  double v7;
  double v8;
  double compactContinuousCornerRadius;

  showStepper = self->_showStepper;
  stepper = self->_stepper;
  if (showStepper)
  {
    -[MRUVolumeStepperView setAlpha:](stepper, "setAlpha:", 1.0);
    -[MRUContinuousSliderView setAlpha:](self->_primarySlider, "setAlpha:", 0.0);
    -[MRUContinuousSliderView setAlpha:](self->_secondarySlider, "setAlpha:", 0.0);
  }
  else
  {
    -[MRUVolumeStepperView setAlpha:](stepper, "setAlpha:", 0.0);
    -[CCUIBaseSliderView setGlyphVisible:](self->_primarySlider, "setGlyphVisible:", !self->_expanded);
    v5 = 1.0;
    if (!self->_primaryInteractionEnabled)
    {
      v5 = 0.5;
      if (!self->_expanded)
        v5 = 1.0;
    }
    -[MRUContinuousSliderView setAlpha:](self->_primarySlider, "setAlpha:", v5);
    if (self->_expanded && self->_showSecondarySlider)
    {
      if (self->_secondaryInteractionEnabled)
      {
        secondarySlider = self->_secondarySlider;
        v7 = 1.0;
      }
      else
      {
        v7 = 0.5;
        secondarySlider = self->_secondarySlider;
      }
      -[MRUContinuousSliderView setAlpha:](secondarySlider, "setAlpha:", v7);
    }
    else
    {
      -[MRUContinuousSliderView setAlpha:](self->_secondarySlider, "setAlpha:", 0.0);
    }
  }
  if (self->_expanded)
  {
    CCUISliderExpandedModuleContinuousCornerRadius();
    compactContinuousCornerRadius = v8;
  }
  else
  {
    compactContinuousCornerRadius = self->_compactContinuousCornerRadius;
  }
  -[CCUIContinuousSliderView setContinuousSliderCornerRadius:](self->_primarySlider, "setContinuousSliderCornerRadius:", compactContinuousCornerRadius);
  -[CCUIContinuousSliderView setContinuousSliderCornerRadius:](self->_secondarySlider, "setContinuousSliderCornerRadius:", compactContinuousCornerRadius);
  -[MRUVolumeStepperView setContinuousButtonCornerRadius:](self->_stepper, "setContinuousButtonCornerRadius:", compactContinuousCornerRadius);
}

- (MRUContinuousSliderView)primarySlider
{
  return self->_primarySlider;
}

- (MRUContinuousSliderView)secondarySlider
{
  return self->_secondarySlider;
}

- (MRUVolumeStepperView)stepper
{
  return self->_stepper;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)primaryInteractionEnabled
{
  return self->_primaryInteractionEnabled;
}

- (BOOL)secondaryInteractionEnabled
{
  return self->_secondaryInteractionEnabled;
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_stepper, 0);
  objc_storeStrong((id *)&self->_secondarySlider, 0);
  objc_storeStrong((id *)&self->_primarySlider, 0);
}

@end
