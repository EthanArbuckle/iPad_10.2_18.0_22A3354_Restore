@implementation HUQuickControlRingSliderView

- (NSMutableArray)currentDirectionTapticValues
{
  NSMutableArray *currentDirectionTapticValues;
  NSMutableArray *v4;
  NSMutableArray *v5;

  currentDirectionTapticValues = self->_currentDirectionTapticValues;
  if (!currentDirectionTapticValues)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_currentDirectionTapticValues;
    self->_currentDirectionTapticValues = v4;

    currentDirectionTapticValues = self->_currentDirectionTapticValues;
  }
  return currentDirectionTapticValues;
}

- (NSMutableDictionary)markingValuesAndViewsDictionary
{
  NSMutableDictionary *markingValuesAndViewsDictionary;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  markingValuesAndViewsDictionary = self->_markingValuesAndViewsDictionary;
  if (!markingValuesAndViewsDictionary)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_markingValuesAndViewsDictionary;
    self->_markingValuesAndViewsDictionary = v4;

    markingValuesAndViewsDictionary = self->_markingValuesAndViewsDictionary;
  }
  return markingValuesAndViewsDictionary;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (NSMutableArray)gradationMarkingViews
{
  NSMutableArray *gradationMarkingViews;
  NSMutableArray *v4;
  NSMutableArray *v5;

  gradationMarkingViews = self->_gradationMarkingViews;
  if (!gradationMarkingViews)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_gradationMarkingViews;
    self->_gradationMarkingViews = v4;

    gradationMarkingViews = self->_gradationMarkingViews;
  }
  return gradationMarkingViews;
}

- (HUQuickControlRingSliderView)initWithProfile:(id)a3
{
  id v5;
  HUQuickControlRingSliderView *v6;
  HUQuickControlRingSliderView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  UIImage *gradientRingImage;
  UIView *v14;
  UIView *backgroundRingView;
  void *v16;
  UIView *v17;
  UIView *edgesAndColoredSupplementaryValueLineView;
  void *v19;
  uint64_t v20;
  UIImageView *selectedRangeImageView;
  uint64_t v22;
  UIImageView *selectedRangeImageViewForEdges;
  double v24;
  uint64_t v25;
  UIView *supplementaryValueMarkingView;
  void *v27;
  void *v28;
  void *v29;
  HUQuickControlRingSliderHandleView *v30;
  HUQuickControlRingSliderHandleView *primaryHandleView;
  HUQuickControlRingSliderHandleView *v32;
  HUQuickControlRingSliderHandleView *secondaryHandleView;
  void *v34;
  uint64_t v35;
  UILabel *v36;
  UILabel *supplementaryLabel;
  void *v38;
  void *v39;
  UILabel *v40;
  UILabel *primaryLabel;
  UIView *v42;
  UIView *labelsBackgroundView;
  uint64_t v44;
  UILongPressGestureRecognizer *longPressPanGestureRecognizer;
  objc_super v47;

  v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)HUQuickControlRingSliderView;
  v6 = -[HUQuickControlRingSliderView init](&v47, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_userInteractionActive = 0;
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    v7->_modelRangeValue = ($888842945EE2C7AB0ACD33E179C69952)HUFloatRangeNormal;
    v7->_supplementaryValue = 1.79769313e308;
    -[HUQuickControlRingSliderView frame](v7, "frame");
    v9 = v8;
    -[HUQuickControlRingSliderView frame](v7, "frame");
    if (v9 >= v10)
      v11 = v10;
    else
      v11 = v9;
    v7->_outerRadius = v11 * 0.5;
    HUImageNamed(CFSTR("thermostat_gradient"));
    v12 = objc_claimAutoreleasedReturnValue();
    gradientRingImage = v7->_gradientRingImage;
    v7->_gradientRingImage = (UIImage *)v12;

    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    {
      objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryMaterial");
      v14 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    }
    backgroundRingView = v7->_backgroundRingView;
    v7->_backgroundRingView = v14;

    objc_msgSend(MEMORY[0x1E0CEA478], "quaternarySystemFillColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7->_backgroundRingView, "setBackgroundColor:", v16);

    -[HUQuickControlRingSliderView addSubview:](v7, "addSubview:", v7->_backgroundRingView);
    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    {
      objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryMaterial");
      v17 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    }
    edgesAndColoredSupplementaryValueLineView = v7->_edgesAndColoredSupplementaryValueLineView;
    v7->_edgesAndColoredSupplementaryValueLineView = v17;

    objc_msgSend(MEMORY[0x1E0CEA478], "quaternarySystemFillColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7->_edgesAndColoredSupplementaryValueLineView, "setBackgroundColor:", v19);

    -[HUQuickControlRingSliderView addSubview:](v7, "addSubview:", v7->_edgesAndColoredSupplementaryValueLineView);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v7->_gradientRingImage);
    selectedRangeImageView = v7->_selectedRangeImageView;
    v7->_selectedRangeImageView = (UIImageView *)v20;

    -[UIImageView setContentMode:](v7->_selectedRangeImageView, "setContentMode:", 1);
    -[UIImageView setUserInteractionEnabled:](v7->_selectedRangeImageView, "setUserInteractionEnabled:", 0);
    -[HUQuickControlRingSliderView addSubview:](v7, "addSubview:", v7->_selectedRangeImageView);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v7->_gradientRingImage);
    selectedRangeImageViewForEdges = v7->_selectedRangeImageViewForEdges;
    v7->_selectedRangeImageViewForEdges = (UIImageView *)v22;

    -[UIImageView setContentMode:](v7->_selectedRangeImageViewForEdges, "setContentMode:", 1);
    -[UIImageView setUserInteractionEnabled:](v7->_selectedRangeImageViewForEdges, "setUserInteractionEnabled:", 0);
    -[HUQuickControlRingSliderView addSubview:](v7, "addSubview:", v7->_selectedRangeImageViewForEdges);
    v24 = *(double *)&ringWidthToHanldeViewRatio * 35.0;
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 4.0, 19.0);
    supplementaryValueMarkingView = v7->_supplementaryValueMarkingView;
    v7->_supplementaryValueMarkingView = (UIView *)v25;

    -[UIView layer](v7->_supplementaryValueMarkingView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCornerRadius:", 2.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "colorWithAlphaComponent:", 0.2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7->_supplementaryValueMarkingView, "setBackgroundColor:", v29);

    -[HUQuickControlRingSliderView addSubview:](v7, "addSubview:", v7->_supplementaryValueMarkingView);
    v30 = -[HUQuickControlRingSliderHandleView initWithFrame:style:]([HUQuickControlRingSliderHandleView alloc], "initWithFrame:style:", objc_msgSend(v5, "handleViewStyle"), 0.0, 0.0, v24, v24);
    primaryHandleView = v7->_primaryHandleView;
    v7->_primaryHandleView = v30;

    -[HUQuickControlRingSliderView addSubview:](v7, "addSubview:", v7->_primaryHandleView);
    v32 = -[HUQuickControlRingSliderHandleView initWithFrame:style:]([HUQuickControlRingSliderHandleView alloc], "initWithFrame:style:", objc_msgSend(v5, "handleViewStyle"), 0.0, 0.0, v24, v24);
    secondaryHandleView = v7->_secondaryHandleView;
    v7->_secondaryHandleView = v32;

    -[HUQuickControlRingSliderView addSubview:](v7, "addSubview:", v7->_secondaryHandleView);
    -[HUQuickControlRingSliderHandleView setHidden:](v7->_secondaryHandleView, "setHidden:", objc_msgSend(v5, "hasSecondaryValue") ^ 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isHandleViewVisible") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v35 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v35;
    }
    -[HUQuickControlRingSliderHandleView _setColor:](v7->_primaryHandleView, "_setColor:", v34);
    -[HUQuickControlRingSliderHandleView _setColor:](v7->_secondaryHandleView, "_setColor:", v34);
    v36 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    supplementaryLabel = v7->_supplementaryLabel;
    v7->_supplementaryLabel = v36;

    -[UILabel setTextAlignment:](v7->_supplementaryLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v7->_supplementaryLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v7->_supplementaryLabel, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7->_supplementaryLabel, "setTextColor:", v38);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0CEB538], 1024);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7->_supplementaryLabel, "setFont:", v39);

    v40 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    primaryLabel = v7->_primaryLabel;
    v7->_primaryLabel = v40;

    -[UILabel setTextAlignment:](v7->_primaryLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v7->_primaryLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v7->_primaryLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v42 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    labelsBackgroundView = v7->_labelsBackgroundView;
    v7->_labelsBackgroundView = v42;

    -[UIView addSubview:](v7->_labelsBackgroundView, "addSubview:", v7->_supplementaryLabel);
    -[UIView addSubview:](v7->_labelsBackgroundView, "addSubview:", v7->_primaryLabel);
    -[HUQuickControlRingSliderView addSubview:](v7, "addSubview:", v7->_labelsBackgroundView);
    v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v7, sel_handlePanGestureRecognizer_);
    longPressPanGestureRecognizer = v7->_longPressPanGestureRecognizer;
    v7->_longPressPanGestureRecognizer = (UILongPressGestureRecognizer *)v44;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v7->_longPressPanGestureRecognizer, "setMinimumPressDuration:", 0.0);
    -[UILongPressGestureRecognizer setDelaysTouchesBegan:](v7->_longPressPanGestureRecognizer, "setDelaysTouchesBegan:", 1);
    -[HUQuickControlRingSliderView addGestureRecognizer:](v7, "addGestureRecognizer:", v7->_longPressPanGestureRecognizer);
    -[UILongPressGestureRecognizer setDelegate:](v7->_longPressPanGestureRecognizer, "setDelegate:", v7);
    -[HUQuickControlRingSliderView _prepareForTapticFeedback](v7, "_prepareForTapticFeedback");

  }
  return v7;
}

- (double)_getPrimarySliderValue
{
  double v2;

  -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
  return v2;
}

- (double)_getSecondarySliderValue
{
  void *v3;
  char v4;
  NSObject *v5;
  double result;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlRingSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSecondaryValue");

  if ((v4 & 1) == 0)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315138;
      v8 = "-[HUQuickControlRingSliderView _getSecondarySliderValue]";
      _os_log_debug_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEBUG, "(%s) requesting secondary slider value when hasSecondaryValue is NO", (uint8_t *)&v7, 0xCu);
    }

  }
  -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
  return result;
}

- (id)value
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  double v7;

  -[HUQuickControlRingSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSecondaryValue");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0D315F0];
    -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
    objc_msgSend(v5, "rangeWithFloatRange:");
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
    objc_msgSend(v6, "numberWithDouble:", v7);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;

  v22 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v4 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    if (objc_msgSend(v6, "type") == 1)
    {
      objc_msgSend(v6, "floatRangeValue");
      v8 = v7;
      objc_msgSend(v6, "floatRangeValue");
      if (v8 < v9)
        v8 = v9;
      objc_msgSend(v6, "floatRangeValue");
      v11 = v10;
      objc_msgSend(v6, "floatRangeValue");
      if (v11 >= v12)
        v11 = v12;
      -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:", v8);
      v14 = v13;
      -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:", v11);
      v16 = v15;
    }
    else
    {
      objc_msgSend(v6, "midValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;

      -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:", v20);
      v14 = v21;
      v16 = 0.0;
    }

  }
  else
  {
    objc_msgSend(v22, "doubleValue");
    -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
    v14 = v17;
    v16 = 0.0;
  }
  -[HUQuickControlRingSliderView setModelRangeValue:](self, "setModelRangeValue:", v16, v14);
  -[HUQuickControlRingSliderView _updateRingViewAndHandleViews](self, "_updateRingViewAndHandleViews");

}

- (id)secondaryValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (void)setSecondaryValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  if (v13)
  {
    objc_opt_class();
    v4 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    objc_msgSend(v6, "doubleValue");
    v8 = v7;
    -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
    if (v8 >= v9)
      v8 = v9;
    objc_msgSend(v6, "doubleValue");
    v11 = v10;
    -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
    if (v11 >= v12)
      v12 = v11;
    -[HUQuickControlRingSliderView setModelRangeValue:](self, "setModelRangeValue:", v8, v12);

  }
  else
  {
    -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
    -[HUQuickControlRingSliderView setModelRangeValue:](self, "setModelRangeValue:", 0.0);
  }

}

- (void)setProfile:(id)a3
{
  HUQuickControlRingSliderViewProfile *v4;
  unint64_t v5;
  uint64_t v6;
  HUQuickControlRingSliderViewProfile *profile;

  v4 = (HUQuickControlRingSliderViewProfile *)a3;
  v5 = -[HUQuickControlViewProfile controlSize](self->_profile, "controlSize");
  v6 = -[HUQuickControlViewProfile controlSize](v4, "controlSize");
  profile = self->_profile;
  self->_profile = v4;

  -[HUQuickControlRingSliderView setNeedsLayout](self, "setNeedsLayout");
  if (v5 != v6)
    -[HUQuickControlRingSliderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlRingSliderView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  id v12;

  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      -[HUQuickControlRingSliderView setAlpha:](self, "setAlpha:", 1.0);
      -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", -[HUQuickControlRingSliderView showOffState](self, "showOffState"));

      -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlRingSliderView profile](self, "profile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "hasSecondaryValue"))
        v10 = -[HUQuickControlRingSliderView showOffState](self, "showOffState");
      else
        v10 = 1;
      objc_msgSend(v8, "setHidden:", v10);

      -[HUQuickControlRingSliderView labelsBackgroundView](self, "labelsBackgroundView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", 0);

      -[HUQuickControlRingSliderView _updateSupplementaryValueMarkingView](self, "_updateSupplementaryValueMarkingView");
    }
  }
  else
  {
    -[HUQuickControlRingSliderView setAlpha:](self, "setAlpha:", 0.5);
    -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[HUQuickControlRingSliderView labelsBackgroundView](self, "labelsBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[HUQuickControlRingSliderView supplementaryValueMarkingView](self, "supplementaryValueMarkingView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

  }
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[HUQuickControlRingSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlRingSliderView intrinsicSizeDescriptorForControlSize:](self, "intrinsicSizeDescriptorForControlSize:", objc_msgSend(v3, "controlSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intrinsicSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  void *v3;
  void *v4;

  HUQuickControlRingSliderMetricsForControlSize(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateModelValueWithNewPrimarySliderValue:(double)a3 roundValue:(BOOL)a4 notifyInteractionDelegate:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;

  v5 = a5;
  v6 = a4;
  -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
  -[HUQuickControlRingSliderView _updateModelValue:roundValue:notifyInteractionDelegate:](self, "_updateModelValue:roundValue:notifyInteractionDelegate:", v6, v5);
}

- (void)_updateModelValueWithNewSecondarySliderValue:(double)a3 roundValue:(BOOL)a4 notifyInteractionDelegate:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  char v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v5 = a5;
  v6 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlRingSliderView profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasSecondaryValue");

  if ((v10 & 1) == 0)
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315138;
      v13 = "-[HUQuickControlRingSliderView _updateModelValueWithNewSecondarySliderValue:roundValue:notifyInteractionDelegate:]";
      _os_log_debug_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEBUG, "(%s) This method is being called when hasSecondaryValue is NO. 0 will be used instead.", (uint8_t *)&v12, 0xCu);
    }

  }
  -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
  -[HUQuickControlRingSliderView _updateModelValue:roundValue:notifyInteractionDelegate:](self, "_updateModelValue:roundValue:notifyInteractionDelegate:", v6, v5, a3);
}

- (void)_updateModelValue:(id)a3 roundValue:(BOOL)a4 notifyInteractionDelegate:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;

  v5 = a5;
  -[HUQuickControlRingSliderView setModelRangeValue:](self, "setModelRangeValue:", a4, a3.var0, a3.var1);
  if (v5)
  {
    if (-[HUQuickControlRingSliderView isUserInteractionActive](self, "isUserInteractionActive"))
    {
      -[HUQuickControlRingSliderView interactionDelegate](self, "interactionDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlRingSliderView value](self, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "controlView:valueDidChange:", self, v7);

    }
  }
}

- (void)setSupplementaryValue:(double)a3
{
  self->_supplementaryValue = a3;
  -[HUQuickControlRingSliderView _updateSupplementaryValueMarkingView](self, "_updateSupplementaryValueMarkingView");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)HUQuickControlRingSliderView;
  -[HUQuickControlRingSliderView layoutSubviews](&v36, sel_layoutSubviews);
  -[HUQuickControlRingSliderView frame](self, "frame");
  v4 = v3;
  -[HUQuickControlRingSliderView frame](self, "frame");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  -[HUQuickControlRingSliderView setOuterRadius:](self, "setOuterRadius:", v6 * 0.5);
  -[HUQuickControlRingSliderView gradationMarkingViews](self, "gradationMarkingViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[HUQuickControlRingSliderView profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "gradationMarkingValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v8 != v11)
    -[HUQuickControlRingSliderView _redrawGradationMarkingViews](self, "_redrawGradationMarkingViews");
  -[HUQuickControlRingSliderView _updateRingViewAndHandleViews](self, "_updateRingViewAndHandleViews");
  -[HUQuickControlRingSliderView _updateSupplementaryValueMarkingView](self, "_updateSupplementaryValueMarkingView");
  -[HUQuickControlRingSliderView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:", -[HUQuickControlRingSliderView reachabilityState](self, "reachabilityState"));
  if (-[HUQuickControlRingSliderView showOffState](self, "showOffState")
    || !-[HUQuickControlRingSliderView reachabilityState](self, "reachabilityState")
    || -[HUQuickControlRingSliderView reachabilityState](self, "reachabilityState") == 1)
  {
    -[HUQuickControlRingSliderView selectedRangeImageView](self, "selectedRangeImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlRingSliderView bringSubviewToFront:](self, "bringSubviewToFront:", v12);

    -[HUQuickControlRingSliderView selectedRangeImageViewForEdges](self, "selectedRangeImageViewForEdges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlRingSliderView bringSubviewToFront:](self, "bringSubviewToFront:", v13);

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[HUQuickControlRingSliderView gradationMarkingViews](self, "gradationMarkingViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          -[HUQuickControlRingSliderView bringSubviewToFront:](self, "bringSubviewToFront:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v16);
    }
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[HUQuickControlRingSliderView gradationMarkingViews](self, "gradationMarkingViews", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          -[HUQuickControlRingSliderView bringSubviewToFront:](self, "bringSubviewToFront:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v21);
    }

    -[HUQuickControlRingSliderView selectedRangeImageView](self, "selectedRangeImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlRingSliderView bringSubviewToFront:](self, "bringSubviewToFront:", v24);

    -[HUQuickControlRingSliderView selectedRangeImageViewForEdges](self, "selectedRangeImageViewForEdges");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlRingSliderView bringSubviewToFront:](self, "bringSubviewToFront:", v14);
  }

  -[HUQuickControlRingSliderView supplementaryValueMarkingView](self, "supplementaryValueMarkingView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlRingSliderView bringSubviewToFront:](self, "bringSubviewToFront:", v25);

  -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlRingSliderView bringSubviewToFront:](self, "bringSubviewToFront:", v26);

  -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlRingSliderView bringSubviewToFront:](self, "bringSubviewToFront:", v27);

}

- (void)_redrawGradationMarkingViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  unint64_t v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  float v33;
  float v34;
  CGFloat v35;
  void *v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[HUQuickControlRingSliderView gradationMarkingViews](self, "gradationMarkingViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v9, "removeFromSuperview");
        -[HUQuickControlRingSliderView gradationMarkingViews](self, "gradationMarkingViews");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v6);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[HUQuickControlRingSliderView profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "gradationMarkingValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v12;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v46;
    v40 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v41 = *MEMORY[0x1E0C9BAA8];
    v39 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        -[HUQuickControlRingSliderView profile](self, "profile");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "gradationMarkingViewStyle");

        if (v20 < 2)
        {
          v22 = 2.0;
          v21 = 19.0;
        }
        else
        {
          if (v20 == 2)
          {
            if (((v15 + (_BYTE)j) & 1) != 0)
              v21 = 6.33333333;
            else
              v21 = 19.0;
          }
          else
          {
            v21 = 0.0;
            v22 = 0.0;
            if (v20 != 3)
              goto LABEL_24;
            if (((v15 + (_BYTE)j) & 1) != 0)
              v21 = 19.0;
            else
              v21 = 6.33333333;
          }
          v22 = 2.0;
        }
LABEL_24:
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
        objc_msgSend(v23, "setFrame:", 0.0, 0.0, v22, v21);
        objc_msgSend(v23, "layer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setCornerRadius:", 1.0);

        objc_msgSend(v23, "setClipsToBounds:", 1);
        if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
        {
          objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterKeyLineOnLightVibrancyEffect");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setEffect:", v25);

        }
        -[HUQuickControlRingSliderView traitCollection](self, "traitCollection");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "userInterfaceStyle") == 1)
        {

LABEL_29:
          objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          v30 = 0.1;
          goto LABEL_34;
        }
        v27 = -[HUQuickControlRingSliderView showOffState](self, "showOffState");

        if (v27)
          goto LABEL_29;
        if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
          v31 = 0.3;
        else
          v31 = 0.1;
        objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        v30 = v31;
LABEL_34:
        objc_msgSend(v28, "colorWithAlphaComponent:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setBackgroundColor:", v32);

        objc_msgSend(v18, "floatValue");
        -[HUQuickControlRingSliderView _getHandleCenterOnRingForValue:](self, "_getHandleCenterOnRingForValue:", v33);
        objc_msgSend(v23, "setCenter:");
        objc_msgSend(v18, "floatValue");
        -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:", v34);
        *(_OWORD *)&v43.a = v41;
        *(_OWORD *)&v43.c = v40;
        *(_OWORD *)&v43.tx = v39;
        CGAffineTransformRotate(&v44, &v43, v35);
        v42 = v44;
        objc_msgSend(v23, "setTransform:", &v42);
        -[HUQuickControlRingSliderView addSubview:](self, "addSubview:", v23);
        -[HUQuickControlRingSliderView gradationMarkingViews](self, "gradationMarkingViews");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v23);

        -[HUQuickControlRingSliderView markingValuesAndViewsDictionary](self, "markingValuesAndViewsDictionary");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setObject:forKey:", v23, v18);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      v15 += j;
    }
    while (v14);
  }

}

- (void)_updateSupplementaryValueMarkingView
{
  void *v3;
  double v4;
  BOOL v5;
  double v6;
  CGFloat v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  __int128 v28;
  void *v29;
  id v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlRingSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "shouldShowSupplementaryValue")
    || (-[HUQuickControlRingSliderView supplementaryValue](self, "supplementaryValue"), v4 > 1.0))
  {

LABEL_4:
    -[HUQuickControlRingSliderView supplementaryValueMarkingView](self, "supplementaryValueMarkingView");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setHidden:", 1);

    return;
  }
  v5 = -[HUQuickControlRingSliderView showOffState](self, "showOffState");

  if (v5)
    goto LABEL_4;
  -[HUQuickControlRingSliderView supplementaryValue](self, "supplementaryValue");
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:");
  v7 = v6;
  -[HUQuickControlRingSliderView _getPointForAngleFrom12OClock:](self, "_getPointForAngleFrom12OClock:");
  -[HUQuickControlRingSliderView gradationMarkingViews](self, "gradationMarkingViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlRingSliderView gradationMarkingViews](self, "gradationMarkingViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "center");
  UIDistanceBetweenPoints();
  v13 = v12;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[HUQuickControlRingSliderView gradationMarkingViews](self, "gradationMarkingViews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v19, "center");
        UIDistanceBetweenPoints();
        if (v13 > v20)
        {
          v21 = v20;
          v22 = v19;

          v13 = v21;
          v9 = v22;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v16);
  }

  if (v9)
  {
    objc_msgSend(v9, "center");
    v24 = v23;
    v26 = v25;
    -[HUQuickControlRingSliderView supplementaryValueMarkingView](self, "supplementaryValueMarkingView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCenter:", v24, v26);

  }
  v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v32.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v32.c = v28;
  *(_OWORD *)&v32.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformRotate(&v33, &v32, v7);
  -[HUQuickControlRingSliderView supplementaryValueMarkingView](self, "supplementaryValueMarkingView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v33;
  objc_msgSend(v29, "setTransform:", &v31);

  -[HUQuickControlRingSliderView _updateSupplementaryValueMarkingViewColor](self, "_updateSupplementaryValueMarkingViewColor");
}

- (void)_updateSupplementaryValueMarkingViewColor
{
  void *v3;
  double v4;
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
  double v19;
  double v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  id v24;

  if (-[HUQuickControlRingSliderView showOffState](self, "showOffState"))
    goto LABEL_10;
  -[HUQuickControlRingSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "shouldShowSupplementaryValue") & 1) == 0)
  {

    goto LABEL_10;
  }
  -[HUQuickControlRingSliderView supplementaryValue](self, "supplementaryValue");
  v5 = v4;

  if (v5 > 1.0)
  {
LABEL_10:
    -[HUQuickControlRingSliderView supplementaryValueMarkingView](self, "supplementaryValueMarkingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v21;
LABEL_11:
    v23 = 1;
    goto LABEL_12;
  }
  -[HUQuickControlRingSliderView _getEdgeRectSize](self, "_getEdgeRectSize");
  v7 = v6;
  -[HUQuickControlRingSliderView _getMiddleCircleRadius](self, "_getMiddleCircleRadius");
  v9 = v7 / v8;
  -[HUQuickControlRingSliderView _getMaxAngleFrom12OClock](self, "_getMaxAngleFrom12OClock");
  v11 = v10;
  -[HUQuickControlRingSliderView _getMinAngleFrom12OClock](self, "_getMinAngleFrom12OClock");
  v13 = v9 / (v11 - v12);
  -[HUQuickControlRingSliderView _getPrimarySliderValue](self, "_getPrimarySliderValue");
  v15 = v14;
  -[HUQuickControlRingSliderView _getSecondarySliderValue](self, "_getSecondarySliderValue");
  v17 = v16 - v13;
  -[HUQuickControlRingSliderView supplementaryValue](self, "supplementaryValue");
  -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
  v19 = v18;
  v20 = v15 + v13;
  -[HUQuickControlRingSliderView supplementaryValueMarkingView](self, "supplementaryValueMarkingView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v19 < v17 || v19 > v20;
  v24 = v21;
  if (v22)
    goto LABEL_11;
  v23 = 0;
LABEL_12:
  objc_msgSend(v21, "setHidden:", v23);

}

- (void)_updateRingViewAndHandleViews
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  _BOOL4 v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  _BOOL8 v61;
  void *v62;
  int v63;
  CGRect v64;
  CGRect v65;

  -[HUQuickControlRingSliderView backgroundRingView](self, "backgroundRingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[HUQuickControlRingSliderView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[HUQuickControlRingSliderView backgroundRingView](self, "backgroundRingView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[HUQuickControlRingSliderView bounds](self, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[HUQuickControlRingSliderView edgesAndColoredSupplementaryValueLineView](self, "edgesAndColoredSupplementaryValueLineView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  -[HUQuickControlRingSliderView bounds](self, "bounds");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  -[HUQuickControlRingSliderView selectedRangeImageView](self, "selectedRangeImageView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  -[HUQuickControlRingSliderView bounds](self, "bounds");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[HUQuickControlRingSliderView selectedRangeImageViewForEdges](self, "selectedRangeImageViewForEdges");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v40, v42, v44, v46);

  -[HUQuickControlRingSliderView backgroundRingView](self, "backgroundRingView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "frame");
  v65.origin.x = v49;
  v65.origin.y = v50;
  v65.size.width = v51;
  v65.size.height = v52;
  v64.origin.x = v5;
  v64.origin.y = v7;
  v64.size.width = v9;
  v64.size.height = v11;
  v53 = CGRectEqualToRect(v64, v65);

  if (!v53 || !-[HUQuickControlRingSliderView didMaskBackgroundImageView](self, "didMaskBackgroundImageView"))
    -[HUQuickControlRingSliderView _maskBackgroundImageViewToRingShape](self, "_maskBackgroundImageViewToRingShape");
  -[HUQuickControlRingSliderView _getCircleCenterPoint](self, "_getCircleCenterPoint");
  v55 = v54;
  v57 = v56;
  -[HUQuickControlRingSliderView labelsBackgroundView](self, "labelsBackgroundView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setCenter:", v55, v57);

  -[HUQuickControlRingSliderView _updatePrimaryHandleViewPositionToSliderValue](self, "_updatePrimaryHandleViewPositionToSliderValue");
  -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlRingSliderView profile](self, "profile");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v60, "hasSecondaryValue"))
    v61 = -[HUQuickControlRingSliderView showOffState](self, "showOffState");
  else
    v61 = 1;
  objc_msgSend(v59, "setHidden:", v61);

  -[HUQuickControlRingSliderView profile](self, "profile");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "hasSecondaryValue");

  if (v63)
    -[HUQuickControlRingSliderView _updateSecondaryHandleViewPositionToSliderValue](self, "_updateSecondaryHandleViewPositionToSliderValue");
  -[HUQuickControlRingSliderView _updateSelectedRangeImageView](self, "_updateSelectedRangeImageView");
  -[HUQuickControlRingSliderView _updateTransform](self, "_updateTransform");
}

- (void)_updateTransform
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CGAffineTransform *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  _OWORD v12[2];
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  -[HUQuickControlRingSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  if (v4)
  {
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v12[0] = *MEMORY[0x1E0C9BAA8];
    v9 = v12[0];
    v12[1] = v10;
    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v8 = v13;
    -[HUQuickControlRingSliderView setTransform:](self, "setTransform:", v12);
    -[HUQuickControlRingSliderView labelsBackgroundView](self, "labelsBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v11[0] = v9;
    v11[1] = v10;
    v11[2] = v8;
    v7 = (CGAffineTransform *)v11;
  }
  else
  {
    CGAffineTransformMakeScale(&v17, -1.0, -1.0);
    v16 = v17;
    -[HUQuickControlRingSliderView setTransform:](self, "setTransform:", &v16);
    CGAffineTransformMakeScale(&v15, -1.0, -1.0);
    -[HUQuickControlRingSliderView labelsBackgroundView](self, "labelsBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v14 = v15;
    v7 = &v14;
  }
  objc_msgSend(v5, "setTransform:", v7);

}

- (void)_updatePrimaryHandleViewPositionToSliderValue
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  __int128 v10;
  CGFloat v11;
  void *v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  -[HUQuickControlRingSliderView _getPrimarySliderValue](self, "_getPrimarySliderValue");
  v4 = v3;
  -[HUQuickControlRingSliderView _getHandleCenterOnRingForValue:](self, "_getHandleCenterOnRingForValue:");
  v6 = v5;
  v8 = v7;
  -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCenter:", v6, v8);

  -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:", v4);
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v14.c = v10;
  *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformRotate(&v15, &v14, v11);
  -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;
  objc_msgSend(v12, "setTransform:", &v13);

}

- (void)_updateSecondaryHandleViewPositionToSliderValue
{
  void *v3;
  char v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  __int128 v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  -[HUQuickControlRingSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSecondaryValue");

  if ((v4 & 1) == 0)
    NSLog(CFSTR("(%s) profile.hasSecondaryValue is NO and tried to make it move"), "-[HUQuickControlRingSliderView _updateSecondaryHandleViewPositionToSliderValue]");
  -[HUQuickControlRingSliderView _getSecondarySliderValue](self, "_getSecondarySliderValue");
  v6 = v5;
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:");
  v8 = v7;
  -[HUQuickControlRingSliderView _getHandleCenterOnRingForValue:](self, "_getHandleCenterOnRingForValue:", v6);
  v10 = v9;
  v12 = v11;
  -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCenter:", v10, v12);

  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v17.c = v14;
  *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformRotate(&v18, &v17, v8);
  -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v18;
  objc_msgSend(v15, "setTransform:", &v16);

}

- (void)_maskBackgroundImageViewToRingShape
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  float v35;
  float v36;
  float v37;
  float v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  __double2 v49;
  void *v50;
  double v51;
  double v52;
  __double2 v53;
  void *v54;
  __int128 v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGAffineTransform v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  CGAffineTransform v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlRingSliderView setDidMaskBackgroundImageView:](self, "setDidMaskBackgroundImageView:", 1);
  -[HUQuickControlRingSliderView _getMinAngleFrom12OClock](self, "_getMinAngleFrom12OClock");
  *(float *)&v3 = v3 + 4.71238898;
  v4 = fmodf(*(float *)&v3, 6.2832);
  -[HUQuickControlRingSliderView _getMaxAngleFrom12OClock](self, "_getMaxAngleFrom12OClock");
  *(float *)&v5 = v5 + 4.71238898;
  v6 = fmodf(*(float *)&v5, 6.2832);
  v7 = (void *)MEMORY[0x1E0CEA390];
  -[HUQuickControlRingSliderView _getMiddleCircleRadius](self, "_getMiddleCircleRadius");
  objc_msgSend(v7, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v8, v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setFillColor:", objc_msgSend(v12, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  objc_msgSend(v10, "setLineWidth:", 35.0);
  -[HUQuickControlRingSliderView _getCircleCenterPoint](self, "_getCircleCenterPoint");
  objc_msgSend(v10, "setPosition:");
  -[HUQuickControlRingSliderView backgroundRingView](self, "backgroundRingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMask:", v10);

  -[HUQuickControlRingSliderView _getInnerCircleRadius](self, "_getInnerCircleRadius");
  v17 = v16;
  -[HUQuickControlRingSliderView profile](self, "profile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "gradationMarkingValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v22 = v21;

  -[HUQuickControlRingSliderView profile](self, "profile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "gradationMarkingValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v27 = v26;

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[HUQuickControlRingSliderView profile](self, "profile");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "gradationMarkingValues");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v72 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(v34, "floatValue");
        if (v22 > v35)
        {
          objc_msgSend(v34, "floatValue");
          v22 = v36;
        }
        objc_msgSend(v34, "floatValue");
        if (v27 < v37)
        {
          objc_msgSend(v34, "floatValue");
          v27 = v38;
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    }
    while (v31);
  }

  -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:", v22);
  *(float *)&v39 = v39 + 4.71238898;
  v61 = fmodf(*(float *)&v39, 6.2832);
  -[HUQuickControlRingSliderView _getEdgeRectSize](self, "_getEdgeRectSize");
  v41 = v40;
  v62 = v40;
  v43 = v42;
  -[HUQuickControlRingSliderView _getStartAngleEdgeLocationShiftForBackgroundRing:](self, "_getStartAngleEdgeLocationShiftForBackgroundRing:", 1);
  v45 = v44;
  -[HUQuickControlRingSliderView outerRadius](self, "outerRadius");
  v47 = v61 - v43 / v46;
  -[HUQuickControlRingSliderView outerRadius](self, "outerRadius");
  v49 = __sincos_stret(v47 + -2.0 / v48 - v45);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, v17 * v49.__cosval, v17 * v49.__sinval, v41, v43, 8.0, 8.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeTranslation(&v70, -(v17 * v49.__cosval), -(v17 * v49.__sinval));
  objc_msgSend(v50, "applyTransform:", &v70);
  CGAffineTransformMakeScale(&v68, -1.0, -1.0);
  CGAffineTransformRotate(&v69, &v68, v61 + 3.14159265);
  objc_msgSend(v50, "applyTransform:", &v69);
  CGAffineTransformMakeTranslation(&v67, v17 * v49.__cosval, v17 * v49.__sinval);
  objc_msgSend(v50, "applyTransform:", &v67);
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:", v27);
  *(float *)&v51 = v51 + 4.71238898;
  v52 = fmodf(*(float *)&v51, 6.2832);
  v53 = __sincos_stret(v52);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12, v17 * v53.__cosval, v17 * v53.__sinval, v62, v43, 8.0, 8.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeTranslation(&v66, -(v17 * v53.__cosval), -(v17 * v53.__sinval));
  objc_msgSend(v54, "applyTransform:", &v66);
  v55 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v64.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v64.c = v55;
  *(_OWORD *)&v64.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformRotate(&v65, &v64, v52);
  objc_msgSend(v54, "applyTransform:", &v65);
  CGAffineTransformMakeTranslation(&v63, v17 * v53.__cosval, v17 * v53.__sinval);
  objc_msgSend(v54, "applyTransform:", &v63);
  objc_msgSend(v50, "appendPath:", v54);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_retainAutorelease(v50);
  objc_msgSend(v56, "setPath:", objc_msgSend(v57, "CGPath"));
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v56, "setFillColor:", objc_msgSend(v58, "CGColor"));

  -[HUQuickControlRingSliderView _getCircleCenterPoint](self, "_getCircleCenterPoint");
  objc_msgSend(v56, "setPosition:");
  -[HUQuickControlRingSliderView edgesAndColoredSupplementaryValueLineView](self, "edgesAndColoredSupplementaryValueLineView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "layer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setMask:", v56);

}

- (void)_updateUIWithTouchAtPoint:(CGPoint)a3 didTouchBegin:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[HUQuickControlRingSliderView profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasSecondaryValue");

  if ((v9 & 1) != 0)
  {
    if (-[HUQuickControlRingSliderView isDraggingPrimaryHandleView](self, "isDraggingPrimaryHandleView"))
    {
      -[HUQuickControlRingSliderView _updateUIForThresholdModeForPrimaryHandleViewWithTouchPoint:didTouchBegin:](self, "_updateUIForThresholdModeForPrimaryHandleViewWithTouchPoint:didTouchBegin:", v4, x, y);
    }
    else if (-[HUQuickControlRingSliderView isDraggingSecondaryHandleView](self, "isDraggingSecondaryHandleView"))
    {
      -[HUQuickControlRingSliderView _updateUIForThresholdModeForSecondaryHandleViewWithTouchPoint:didTouchBegin:](self, "_updateUIForThresholdModeForSecondaryHandleViewWithTouchPoint:didTouchBegin:", v4, x, y);
    }
  }
  else
  {
    -[HUQuickControlRingSliderView _getMinimumMarkingValue](self, "_getMinimumMarkingValue");
    v11 = v10;
    -[HUQuickControlRingSliderView _getMaximumMarkingValue](self, "_getMaximumMarkingValue");
    v13 = v12;
    -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlRingSliderView _updateUIForTouchPoint:didTouchBegin:forHandleView:minValue:maxValue:](self, "_updateUIForTouchPoint:didTouchBegin:forHandleView:minValue:maxValue:", v4, v14, x, y, v11, v13);

  }
  -[HUQuickControlRingSliderView _updateSelectedRangeImageView](self, "_updateSelectedRangeImageView");
}

- (void)_updateUIForTouchPoint:(CGPoint)a3 didTouchBegin:(BOOL)a4 forHandleView:(id)a5 minValue:(double)a6 maxValue:(double)a7
{
  double y;
  double x;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  double v30;
  uint64_t i;
  void *v32;
  double v33;
  double v34;
  id v35;
  _BOOL4 v36;
  double v37;
  double v38;
  HUQuickControlRingSliderView *v39;
  double v40;
  void *v42;
  uint64_t v43;
  __int128 v44;
  CGFloat v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *j;
  void *v55;
  float v56;
  float v57;
  void *v58;
  id v59;
  char v60;
  void *v61;
  double v62;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  y = a3.y;
  x = a3.x;
  v78 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:", a6);
  v14 = v13;
  v62 = a7;
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:", a7);
  v16 = v15;
  -[HUQuickControlRingSliderView _getClosestPointOnMiddleCircleOfRing:](self, "_getClosestPointOnMiddleCircleOfRing:", x, y);
  v18 = v17;
  v20 = v19;
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForPoint:](self, "_getAngleFrom12OClockForPoint:");
  v22 = v21;
  v23 = -[HUQuickControlRingSliderView _getRingSliderAreaForAngleFrom12Oclock:minAngle:maxAngle:](self, "_getRingSliderAreaForAngleFrom12Oclock:minAngle:maxAngle:");
  objc_msgSend(v12, "center");
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForPoint:](self, "_getAngleFrom12OClockForPoint:");
  v24 = -[HUQuickControlRingSliderView _getRingSliderAreaForAngleFrom12Oclock:minAngle:maxAngle:](self, "_getRingSliderAreaForAngleFrom12Oclock:minAngle:maxAngle:");
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  -[HUQuickControlRingSliderView gradationMarkingViews](self, "gradationMarkingViews");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (v26)
  {
    v27 = v26;
    v28 = 0;
    v29 = *(_QWORD *)v73;
    v30 = 1.79769313e308;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v73 != v29)
          objc_enumerationMutation(v25);
        v32 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v32, "center");
        UIDistanceBetweenPoints();
        if (v30 > v33)
        {
          v34 = v33;
          v35 = v32;

          v30 = v34;
          v28 = v35;
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    }
    while (v27);

    v36 = v23 == 2;
    if (v24 == 3 && v23 == 2)
    {
      if (!v28)
      {
        v37 = v18;
        v38 = v20;
        goto LABEL_36;
      }
      goto LABEL_13;
    }
    if (v24 == 2 && v23 == 2)
    {
      if (v28)
      {
LABEL_13:
        objc_msgSend(v28, "center");
LABEL_36:
        objc_msgSend(v12, "setCenter:", v37, v38);
        goto LABEL_37;
      }
LABEL_34:
      v37 = v18;
      v38 = v20;
      goto LABEL_36;
    }
    if (v24 != 2)
      goto LABEL_29;
LABEL_17:
    if (-[HUQuickControlRingSliderView prevTouchArea](self, "prevTouchArea") == 2 && (v23 == 1 || v22 < v14))
    {
      v39 = self;
      v40 = v14;
    }
    else
    {
      if (-[HUQuickControlRingSliderView prevTouchArea](self, "prevTouchArea") != 2 || v23 != 3 && v22 <= v16)
        goto LABEL_37;
      v39 = self;
      v40 = v16;
    }
    -[HUQuickControlRingSliderView _getPointForAngleFrom12OClock:](v39, "_getPointForAngleFrom12OClock:", v40);
    goto LABEL_36;
  }

  v28 = 0;
  v36 = v23 == 2;
  if ((v24 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v37 = v18;
    v38 = v20;
    if (v23 == 2)
      goto LABEL_36;
  }
  if (v24 == 2)
    goto LABEL_17;
LABEL_29:
  if (v24 == 1 && v36)
  {
    if (v28)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_37:
  -[HUQuickControlRingSliderView profile](self, "profile");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "handleViewStyle");

  if (v43 == 2)
  {
    objc_msgSend(v12, "center");
    -[HUQuickControlRingSliderView _getAngleFrom12OClockForPoint:](self, "_getAngleFrom12OClockForPoint:");
    v44 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v70.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v70.c = v44;
    *(_OWORD *)&v70.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformRotate(&v71, &v70, v45);
    v69 = v71;
    objc_msgSend(v12, "setTransform:", &v69);
  }
  -[HUQuickControlRingSliderView setPrevTouchArea:](self, "setPrevTouchArea:", v23);
  -[HUQuickControlRingSliderView _animateToEnlargeHandleView:](self, "_animateToEnlargeHandleView:", v12);
  -[HUQuickControlRingSliderView _getSliderValueForPoint:](self, "_getSliderValueForPoint:", v18, v20);
  v47 = v46;
  -[HUQuickControlRingSliderView prevSliderValue](self, "prevSliderValue");
  -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
  -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:", v47);
  if ((NACGFloatLessThanFloat() & 1) != 0)
  {
    v48 = 1;
  }
  else if ((NACGFloatEqualToFloat() & 1) != 0)
  {
    v48 = 3;
  }
  else if (NACGFloatLessThanFloat())
  {
    v48 = 2;
  }
  else
  {
    v48 = 0;
  }
  if (-[HUQuickControlRingSliderView _isIncreasingOrDecreasing:](self, "_isIncreasingOrDecreasing:", -[HUQuickControlRingSliderView prevSlidingDirection](self, "prevSlidingDirection"))&& -[HUQuickControlRingSliderView _isIncreasingOrDecreasing:](self, "_isIncreasingOrDecreasing:", v48)&& -[HUQuickControlRingSliderView prevSlidingDirection](self, "prevSlidingDirection") != v48)
  {
    -[HUQuickControlRingSliderView currentDirectionTapticValues](self, "currentDirectionTapticValues");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "removeAllObjects");

  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[HUQuickControlRingSliderView profile](self, "profile");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "gradationMarkingValues");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (id)objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
  if (v52)
  {
    v53 = *(_QWORD *)v66;
    while (2)
    {
      for (j = 0; j != v52; j = (char *)j + 1)
      {
        if (*(_QWORD *)v66 != v53)
          objc_enumerationMutation(v51);
        v55 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v55, "floatValue");
        if (v56 + -0.005 < v47)
        {
          objc_msgSend(v55, "floatValue");
          if (v47 < v57 + 0.005)
          {
            v52 = v55;
            goto LABEL_61;
          }
        }
      }
      v52 = (id)objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
      if (v52)
        continue;
      break;
    }
  }
LABEL_61:

  if (v52 && v47 >= a6 && v47 <= v62)
  {
    -[HUQuickControlRingSliderView currentDirectionTapticValues](self, "currentDirectionTapticValues");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __101__HUQuickControlRingSliderView__updateUIForTouchPoint_didTouchBegin_forHandleView_minValue_maxValue___block_invoke;
    v63[3] = &unk_1E6F56A88;
    v59 = v52;
    v64 = v59;
    v60 = objc_msgSend(v58, "na_any:", v63);

    if ((v60 & 1) == 0)
    {
      -[HUQuickControlRingSliderView _prepareForTapticFeedback](self, "_prepareForTapticFeedback");
      -[HUQuickControlRingSliderView _actuateSelectionTapticFeedback](self, "_actuateSelectionTapticFeedback");
      -[HUQuickControlRingSliderView currentDirectionTapticValues](self, "currentDirectionTapticValues");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v59);

    }
  }
  -[HUQuickControlRingSliderView setPrevSliderValue:](self, "setPrevSliderValue:", v47);
  if (-[HUQuickControlRingSliderView _isIncreasingOrDecreasing:](self, "_isIncreasingOrDecreasing:", v48))
    -[HUQuickControlRingSliderView setPrevSlidingDirection:](self, "setPrevSlidingDirection:", v48);

}

uint64_t __101__HUQuickControlRingSliderView__updateUIForTouchPoint_didTouchBegin_forHandleView_minValue_maxValue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToNumber:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_isIncreasingOrDecreasing:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (void)_updateUIForThresholdModeForPrimaryHandleViewWithTouchPoint:(CGPoint)a3 didTouchBegin:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  char v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  double v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v44 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlRingSliderView profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasSecondaryValue");

  if ((v9 & 1) != 0)
  {
    -[HUQuickControlRingSliderView _getSecondarySliderValue](self, "_getSecondarySliderValue");
    v11 = v10;
    -[HUQuickControlRingSliderView profile](self, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "handleViewStyle");

    if (v13 == 1)
    {
      -[HUQuickControlRingSliderView _getSecondarySliderValue](self, "_getSecondarySliderValue");
      v15 = v14;
      -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "outerRadius");
      v18 = v17 * 3.14159265;
      -[HUQuickControlRingSliderView outerRadius](self, "outerRadius");
      v11 = v15 + v18 / (v19 * 3.14159265 + v19 * 3.14159265);

    }
    else
    {
      -[HUQuickControlRingSliderView profile](self, "profile");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "handleViewStyle");

      if (v22 == 2)
      {
        -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
        -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
        v24 = v23;
        -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
        -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:", v25);
        if (v24 != v26)
        {
          -[HUQuickControlRingSliderView _getSecondarySliderValue](self, "_getSecondarySliderValue");
          v28 = v27;
          -[HUQuickControlRingSliderView _getOneMarkerValueDifference](self, "_getOneMarkerValueDifference");
          v11 = v28 + v29;
        }
      }
    }
    -[HUQuickControlRingSliderView _getMinimumMarkingValue](self, "_getMinimumMarkingValue");
    v31 = v30;
    -[HUQuickControlRingSliderView _getMaximumMarkingValue](self, "_getMaximumMarkingValue");
    v33 = v32;
    -[HUQuickControlRingSliderView profile](self, "profile");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "primaryValueConstraints");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "minValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    v38 = fmax(fmax(v31, v11), v37);

    -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlRingSliderView _updateUIForTouchPoint:didTouchBegin:forHandleView:minValue:maxValue:](self, "_updateUIForTouchPoint:didTouchBegin:forHandleView:minValue:maxValue:", v4, x, y, v38, v33);

  }
  else
  {
    HFLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[HUQuickControlRingSliderView _updateUIForThresholdModeForPrimaryHandleViewWithTouchPoint:didTouchBegin:]";
      v42 = 2048;
      v43 = 959;
      _os_log_fault_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_FAULT, "%s (Line: %ld) This method should only be called for threshold mode.", buf, 0x16u);
    }

  }
}

- (void)_updateUIForThresholdModeForSecondaryHandleViewWithTouchPoint:(CGPoint)a3 didTouchBegin:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  char v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  double v38;
  double v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v45 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlRingSliderView profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasSecondaryValue");

  if ((v9 & 1) != 0)
  {
    -[HUQuickControlRingSliderView _getPrimarySliderValue](self, "_getPrimarySliderValue");
    v11 = v10;
    -[HUQuickControlRingSliderView profile](self, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "handleViewStyle");

    if (v13 == 1)
    {
      -[HUQuickControlRingSliderView _getPrimarySliderValue](self, "_getPrimarySliderValue");
      v15 = v14;
      -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "outerRadius");
      v18 = v17 * 3.14159265;
      -[HUQuickControlRingSliderView outerRadius](self, "outerRadius");
      v11 = v15 - v18 / (v19 * 3.14159265 + v19 * 3.14159265);

    }
    else
    {
      -[HUQuickControlRingSliderView profile](self, "profile");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "handleViewStyle");

      if (v22 == 2)
      {
        -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
        -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
        v24 = v23;
        -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
        -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:", v25);
        if (v24 != v26)
        {
          -[HUQuickControlRingSliderView _getPrimarySliderValue](self, "_getPrimarySliderValue");
          v28 = v27;
          -[HUQuickControlRingSliderView _getOneMarkerValueDifference](self, "_getOneMarkerValueDifference");
          v11 = v28 - v29;
        }
      }
    }
    -[HUQuickControlRingSliderView _getMinimumMarkingValue](self, "_getMinimumMarkingValue");
    v31 = v30;
    -[HUQuickControlRingSliderView _getMaximumMarkingValue](self, "_getMaximumMarkingValue");
    v33 = v32;
    -[HUQuickControlRingSliderView profile](self, "profile");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "secondaryValueConstraints");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "maxValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:", v37);
    v39 = fmin(fmin(v38, v11), v33);

    -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlRingSliderView _updateUIForTouchPoint:didTouchBegin:forHandleView:minValue:maxValue:](self, "_updateUIForTouchPoint:didTouchBegin:forHandleView:minValue:maxValue:", v4, x, y, v31, v39);

  }
  else
  {
    HFLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[HUQuickControlRingSliderView _updateUIForThresholdModeForSecondaryHandleViewWithTouchPoint:didTouchBegin:]";
      v43 = 2048;
      v44 = 992;
      _os_log_fault_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_FAULT, "%s (Line: %ld) This method should only be called for threshold mode.", buf, 0x16u);
    }

  }
}

- (void)_animateToEnlargeHandleView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _QWORD v10[4];
  id v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v3 = a3;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&t2.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&t2.c = v8;
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&t2.tx = v7;
  if (CGAffineTransformEqualToTransform(&t1, &t2) && objc_msgSend(v4, "handleViewStyle") == 1)
  {
    objc_msgSend(v4, "frame");
    *(_OWORD *)&t2.a = v9;
    *(_OWORD *)&t2.c = v8;
    *(_OWORD *)&t2.tx = v7;
    CGAffineTransformTranslate(&v13, &t2, v5 * 0.3 * -0.5, v5 * 0.3 * -0.5);
    v12 = v13;
    objc_msgSend(v4, "setTransform:", &v12);
    v6 = (void *)MEMORY[0x1E0CEABB0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__HUQuickControlRingSliderView__animateToEnlargeHandleView___block_invoke;
    v10[3] = &unk_1E6F4D988;
    v11 = v4;
    objc_msgSend(v6, "animateWithDuration:animations:", v10, 0.15);

  }
}

uint64_t __60__HUQuickControlRingSliderView__animateToEnlargeHandleView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "transform");
    v3 = *(void **)(a1 + 32);
  }
  else
  {
    v3 = 0;
    memset(&v6, 0, sizeof(v6));
  }
  CGAffineTransformScale(&v7, &v6, 1.3, 1.3);
  v5 = v7;
  return objc_msgSend(v3, "setTransform:", &v5);
}

- (CGSize)_getEdgeRectSize
{
  void *v3;
  void *v4;
  unint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  -[HUQuickControlRingSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gradationMarkingValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = 0.0;
  if (v5 >= 2)
  {
    -[HUQuickControlRingSliderView profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gradationMarkingValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;
    -[HUQuickControlRingSliderView profile](self, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "gradationMarkingValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v6 = (float)(v11 - v15);

  }
  -[HUQuickControlRingSliderView _getInnerCircleRadius](self, "_getInnerCircleRadius");
  v17 = v6 * ((v16 + v16) * 3.14159265) * 0.5;
  v18 = 13.0;
  if (v17 <= 13.0)
    v18 = v17;
  v19 = 35.0;
  result.height = v18;
  result.width = v19;
  return result;
}

- (double)_getStartAngleEdgeLocationShiftForBackgroundRing:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  unint64_t v5;
  double result;

  v3 = a3;
  -[HUQuickControlRingSliderView profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "controlSize");

  if (v5 - 2 < 2)
    return -0.004;
  if (v5 > 1)
    return 0.0;
  result = -0.005;
  if (v3)
    return -0.001;
  return result;
}

- (double)_getOneMarkerValueDifference
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlRingSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gradationMarkingValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
  {
    HFLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[HUQuickControlRingSliderView profile](self, "profile");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "gradationMarkingValues");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 136315394;
      v26 = "-[HUQuickControlRingSliderView _getOneMarkerValueDifference]";
      v27 = 2048;
      v28 = objc_msgSend(v23, "count");
      _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "%s. profile gradation marking values count is %lu, not above 2", (uint8_t *)&v25, 0x16u);

    }
    return 0.0;
  }
  else
  {
    -[HUQuickControlRingSliderView profile](self, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gradationMarkingValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUQuickControlRingSliderView profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "gradationMarkingValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "floatValue");
    v13 = v12;
    objc_msgSend(v11, "floatValue");
    if (v13 >= v14)
      v15 = v8;
    else
      v15 = v11;
    if (v13 >= v14)
      v16 = v11;
    else
      v16 = v8;
    objc_msgSend(v15, "floatValue");
    v18 = v17;
    objc_msgSend(v16, "floatValue");
    v20 = (float)(v18 - v19);

  }
  return v20;
}

- (void)_updateSelectedRangeImageView
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  float v17;
  float v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  double v27;
  float v28;
  void *v29;
  double v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  __double2 v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  __double2 v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __double2 v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGAffineTransform v74;
  CGAffineTransform v75;
  CGAffineTransform v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGAffineTransform v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlRingSliderView _getEdgeRectSize](self, "_getEdgeRectSize");
  v68 = v4;
  v69 = v3;
  -[HUQuickControlRingSliderView profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gradationMarkingValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  -[HUQuickControlRingSliderView profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gradationMarkingValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v82 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        objc_msgSend(v16, "floatValue");
        if (v9 > v17)
        {
          objc_msgSend(v16, "floatValue");
          v9 = v18;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    }
    while (v13);
  }

  -[HUQuickControlRingSliderView profile](self, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "hasSecondaryValue"))
  {
    -[HUQuickControlRingSliderView _getSecondarySliderValue](self, "_getSecondarySliderValue");
    v9 = v20;
  }
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:", v9);
  v22 = v21;

  if (-[HUQuickControlRingSliderView showOffState](self, "showOffState")
    || !-[HUQuickControlRingSliderView reachabilityState](self, "reachabilityState")
    || -[HUQuickControlRingSliderView reachabilityState](self, "reachabilityState") == 1)
  {
    -[HUQuickControlRingSliderView _getMaxAngleFrom12OClock](self, "_getMaxAngleFrom12OClock");
    v24 = v23;
    -[HUQuickControlRingSliderView _getMinAngleFrom12OClock](self, "_getMinAngleFrom12OClock");
    v22 = v25;
  }
  else
  {
    -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "center");
    -[HUQuickControlRingSliderView _getAngleFrom12OClockForPoint:](self, "_getAngleFrom12OClockForPoint:");
    v24 = v62;

  }
  v26 = v24 + 4.71238898;
  v27 = fmodf(v26, 6.2832);
  v28 = v22 + 4.71238898;
  v67 = fmodf(v28, 6.2832);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlRingSliderView _getMiddleCircleRadius](self, "_getMiddleCircleRadius");
  v66 = v30;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLineWidth:", 35.0);
  -[HUQuickControlRingSliderView _getCircleCenterPoint](self, "_getCircleCenterPoint");
  objc_msgSend(v29, "setPosition:");
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v29, "setFillColor:", objc_msgSend(v32, "CGColor"));

  v33 = objc_retainAutorelease(v31);
  objc_msgSend(v29, "setPath:", objc_msgSend(v33, "CGPath"));
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v29, "setStrokeColor:", objc_msgSend(v34, "CGColor"));

  -[HUQuickControlRingSliderView selectedRangeImageView](self, "selectedRangeImageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setMask:", v29);

  -[HUQuickControlRingSliderView _updateSupplementaryValueMarkingViewColor](self, "_updateSupplementaryValueMarkingViewColor");
  -[HUQuickControlRingSliderView _getInnerCircleRadius](self, "_getInnerCircleRadius");
  v38 = v37;
  v39 = v27 + -0.001;
  v40 = __sincos_stret(v39);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12, v40.__cosval * v38, v40.__sinval * v38, v69, v68, 8.0, 8.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setUsesEvenOddFillRule:", 1);
  CGAffineTransformMakeTranslation(&v80, -(v40.__cosval * v38), -(v40.__sinval * v38));
  objc_msgSend(v41, "applyTransform:", &v80);
  v64 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v65 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v78.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v78.c = v64;
  v63 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v78.tx = v63;
  CGAffineTransformRotate(&v79, &v78, v39);
  objc_msgSend(v41, "applyTransform:", &v79);
  CGAffineTransformMakeTranslation(&v77, v40.__cosval * v38, v40.__sinval * v38);
  objc_msgSend(v41, "applyTransform:", &v77);
  -[HUQuickControlRingSliderView _getStartAngleEdgeLocationShiftForBackgroundRing:](self, "_getStartAngleEdgeLocationShiftForBackgroundRing:", 0);
  v43 = v42;
  -[HUQuickControlRingSliderView outerRadius](self, "outerRadius");
  v45 = v67 - v68 / v44;
  -[HUQuickControlRingSliderView outerRadius](self, "outerRadius");
  v47 = __sincos_stret(v45 + -2.0 / v46 - v43);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, v38 * v47.__cosval, v38 * v47.__sinval, v69, v68, 8.0, 8.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setUsesEvenOddFillRule:", 1);
  CGAffineTransformMakeTranslation(&v76, -(v38 * v47.__cosval), -(v38 * v47.__sinval));
  objc_msgSend(v48, "applyTransform:", &v76);
  CGAffineTransformMakeScale(&v74, -1.0, -1.0);
  CGAffineTransformRotate(&v75, &v74, v67 + 3.14159265);
  objc_msgSend(v48, "applyTransform:", &v75);
  CGAffineTransformMakeTranslation(&v73, v38 * v47.__cosval, v38 * v47.__sinval);
  objc_msgSend(v48, "applyTransform:", &v73);
  objc_msgSend(v41, "appendPath:", v48);
  if (-[HUQuickControlRingSliderView reachabilityState](self, "reachabilityState") != 1
    && -[HUQuickControlRingSliderView reachabilityState](self, "reachabilityState"))
  {
    -[HUQuickControlRingSliderView supplementaryValue](self, "supplementaryValue");
    -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
    -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:");
    v50 = v49;
    -[HUQuickControlRingSliderView _getMiddleCircleRadius](self, "_getMiddleCircleRadius");
    *(float *)&v51 = v50 - 2.0 / v51 + 4.71238898;
    v52 = fmodf(*(float *)&v51, 6.2832);
    v53 = (v66 + v38) * 0.5;
    v54 = __sincos_stret(v52);
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", v53 * v54.__cosval, v53 * v54.__sinval, 19.0, 4.0, 2.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeTranslation(&v72, -(v53 * v54.__cosval), -(v53 * v54.__sinval));
    objc_msgSend(v55, "applyTransform:", &v72);
    *(_OWORD *)&v78.a = v65;
    *(_OWORD *)&v78.c = v64;
    *(_OWORD *)&v78.tx = v63;
    CGAffineTransformRotate(&v71, &v78, v52);
    objc_msgSend(v55, "applyTransform:", &v71);
    CGAffineTransformMakeTranslation(&v70, v53 * v54.__cosval, v53 * v54.__sinval);
    objc_msgSend(v55, "applyTransform:", &v70);
    objc_msgSend(v41, "appendPath:", v55);

  }
  objc_msgSend(MEMORY[0x1E0CD2840], "layer", v63, v64, v65);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_retainAutorelease(v41);
  objc_msgSend(v56, "setPath:", objc_msgSend(v57, "CGPath"));
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v56, "setFillColor:", objc_msgSend(v58, "CGColor"));

  -[HUQuickControlRingSliderView _getCircleCenterPoint](self, "_getCircleCenterPoint");
  objc_msgSend(v56, "setPosition:");
  -[HUQuickControlRingSliderView selectedRangeImageViewForEdges](self, "selectedRangeImageViewForEdges");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "layer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setMask:", v56);

}

- (double)_getClosestMarkingValueToValue:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  float v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlRingSliderView profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gradationMarkingValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HUQuickControlRingSliderView profile](self, "profile", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gradationMarkingValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = v12;
    if (v9 >= a3)
      v14 = v9 - a3;
    else
      v14 = a3 - v9;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v17, "floatValue");
        v19 = v18;
        objc_msgSend(v17, "floatValue");
        v21 = v20;
        v22 = a3 - v21;
        v23 = v21 - a3;
        if (v19 >= a3)
          v24 = v23;
        else
          v24 = v22;
        if (v24 < v14)
        {
          objc_msgSend(v17, "floatValue");
          v9 = v25;
          v14 = v24;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v13);
  }

  return v9;
}

- (BOOL)_areHandleViewsAnimating
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;

  -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9 != 0;

  }
  return v6;
}

- (void)_updateModelValueWithSlidersPositions
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  int v7;
  double v8;
  void *v9;
  double v10;

  -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "center");
  -[HUQuickControlRingSliderView _getSliderValueForPoint:](self, "_getSliderValueForPoint:");
  v5 = v4;

  -[HUQuickControlRingSliderView profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasSecondaryValue");

  v8 = 0.0;
  if (v7)
  {
    -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");
    -[HUQuickControlRingSliderView _getSliderValueForPoint:](self, "_getSliderValueForPoint:");
    v8 = v10;

  }
  -[HUQuickControlRingSliderView _updateModelValue:roundValue:notifyInteractionDelegate:](self, "_updateModelValue:roundValue:notifyInteractionDelegate:", 1, 1, v8, v5);
}

- (void)_touchEnded
{
  void *v3;
  void *v4;
  __int128 v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  __int16 *v10;
  __int128 v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  double v15;
  CGFloat v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform t2;
  CGAffineTransform t1;

  if ((_MergedGlobals_1_2 & 1) != 0 || (_MergedGlobals_1_2 & 0x100) != 0)
    return;
  if (-[HUQuickControlRingSliderView isDraggingPrimaryHandleView](self, "isDraggingPrimaryHandleView"))
  {
    -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "transform");
    else
      memset(&t1, 0, sizeof(t1));
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&t2.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&t2.c = v5;
    *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v6 = CGAffineTransformEqualToTransform(&t1, &t2);

    if (!v6)
    {
      -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = &_MergedGlobals_1_2;
LABEL_16:
      *(_BYTE *)v10 = 1;
      goto LABEL_17;
    }
  }
  if (-[HUQuickControlRingSliderView isDraggingSecondaryHandleView](self, "isDraggingSecondaryHandleView"))
  {
    -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "transform");
    else
      memset(&v27, 0, sizeof(v27));
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&t2.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&t2.c = v11;
    *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v12 = CGAffineTransformEqualToTransform(&v27, &t2);

    if (!v12)
    {
      -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (__int16 *)((char *)&_MergedGlobals_1_2 + 1);
      goto LABEL_16;
    }
  }
  v9 = 0;
LABEL_17:
  -[HUQuickControlRingSliderView _actuateImpactTapticFeedback](self, "_actuateImpactTapticFeedback");
  -[HUQuickControlRingSliderView profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "handleViewStyle");

  if (v14 == 1)
  {
    if (v9)
    {
      objc_msgSend(v9, "frame");
      v16 = v15 * 0.3 * 0.5;
      objc_msgSend(v9, "transform");
      CGAffineTransformTranslate(&v26, &v25, v16, v16);
      v24 = v26;
      objc_msgSend(v9, "setTransform:", &v24);
      v17 = (void *)MEMORY[0x1E0CEABB0];
      v18 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __43__HUQuickControlRingSliderView__touchEnded__block_invoke;
      v22[3] = &unk_1E6F4D988;
      v23 = v9;
      v21[0] = v18;
      v21[1] = 3221225472;
      v21[2] = __43__HUQuickControlRingSliderView__touchEnded__block_invoke_2;
      v21[3] = &unk_1E6F4E300;
      v21[4] = self;
      objc_msgSend(v17, "animateWithDuration:animations:completion:", v22, v21, 0.15);

    }
  }
  else
  {
    -[HUQuickControlRingSliderView setIsDraggingPrimaryHandleView:](self, "setIsDraggingPrimaryHandleView:", 0);
    -[HUQuickControlRingSliderView setIsDraggingSecondaryHandleView:](self, "setIsDraggingSecondaryHandleView:", 0);
    _MergedGlobals_1_2 = 0;
  }
  -[HUQuickControlRingSliderView setPrevTouchArea:](self, "setPrevTouchArea:", 0);
  -[HUQuickControlRingSliderView interactionDelegate](self, "interactionDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "controlView:interactionStateDidChange:forFirstTouch:", self, 0, 0);

  -[HUQuickControlRingSliderView setUserInteractionActive:](self, "setUserInteractionActive:", 0);
  -[HUQuickControlRingSliderView currentDirectionTapticValues](self, "currentDirectionTapticValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeAllObjects");

}

uint64_t __43__HUQuickControlRingSliderView__touchEnded__block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __43__HUQuickControlRingSliderView__touchEnded__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsDraggingPrimaryHandleView:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "setIsDraggingSecondaryHandleView:", 0);
  _MergedGlobals_1_2 = 0;
  return result;
}

- (void)updateSupplementaryLabelWithString:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    -[HUQuickControlRingSliderView supplementaryLabel](self, "supplementaryLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v5);

    -[HUQuickControlRingSliderView _updateLabelsSize](self, "_updateLabelsSize");
  }

}

- (void)updatePrimaryLabelWithString:(id)a3 fontSize:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "length"))
  {
    -[HUQuickControlRingSliderView primaryLabel](self, "primaryLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v9);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "monospacedDigitSystemFontOfSize:weight:", a4, *MEMORY[0x1E0CEB5D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlRingSliderView primaryLabel](self, "primaryLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    -[HUQuickControlRingSliderView _updateLabelsSize](self, "_updateLabelsSize");
  }

}

- (void)_updateLabelsSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  id v67;

  -[HUQuickControlRingSliderView supplementaryLabel](self, "supplementaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[HUQuickControlRingSliderView primaryLabel](self, "primaryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeToFit");

  -[HUQuickControlRingSliderView frame](self, "frame");
  v6 = v5 + -70.0;
  -[HUQuickControlRingSliderView frame](self, "frame");
  v8 = v6 + v7 * -0.1 * 2.0;
  -[HUQuickControlRingSliderView supplementaryLabel](self, "supplementaryLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  if (v10 > v8)
  {
    -[HUQuickControlRingSliderView frame](self, "frame");
    v12 = v11;

    if (v12 <= 0.0)
      goto LABEL_5;
    -[HUQuickControlRingSliderView supplementaryLabel](self, "supplementaryLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;

    -[HUQuickControlRingSliderView supplementaryLabel](self, "supplementaryLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFrame:", v15, v17, v8, v19);
  }

LABEL_5:
  -[HUQuickControlRingSliderView primaryLabel](self, "primaryLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  if (v21 > v8)
  {
    -[HUQuickControlRingSliderView frame](self, "frame");
    v23 = v22;

    if (v23 <= 0.0)
      goto LABEL_9;
    -[HUQuickControlRingSliderView primaryLabel](self, "primaryLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v26 = v25;
    v28 = v27;
    v30 = v29;

    -[HUQuickControlRingSliderView primaryLabel](self, "primaryLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v26, v28, v8, v30);
  }

LABEL_9:
  -[HUQuickControlRingSliderView supplementaryLabel](self, "supplementaryLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v32;

  -[HUQuickControlRingSliderView primaryLabel](self, "primaryLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "frame");
  v36 = v35 + 3.0;

  if (v33 < v36)
    v33 = v36;
  -[HUQuickControlRingSliderView supplementaryLabel](self, "supplementaryLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "frame");
  v39 = v38;
  -[HUQuickControlRingSliderView primaryLabel](self, "primaryLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "frame");
  v42 = v39 + v41;

  -[HUQuickControlRingSliderView _getCircleCenterPoint](self, "_getCircleCenterPoint");
  v43 = v33 * 0.5;
  v45 = v44 - v33 * 0.5;
  -[HUQuickControlRingSliderView _getCircleCenterPoint](self, "_getCircleCenterPoint");
  v47 = v46 - v42 * 0.5;
  -[HUQuickControlRingSliderView labelsBackgroundView](self, "labelsBackgroundView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFrame:", v45, v47, v33, v42);

  -[HUQuickControlRingSliderView supplementaryLabel](self, "supplementaryLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "frame");
  v51 = v33 * 0.5 - v50 * 0.5;

  -[HUQuickControlRingSliderView supplementaryLabel](self, "supplementaryLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "frame");
  v54 = v53;
  v56 = v55;

  -[HUQuickControlRingSliderView supplementaryLabel](self, "supplementaryLabel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setFrame:", v51, 0.0, v54, v56);

  -[HUQuickControlRingSliderView primaryLabel](self, "primaryLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "frame");
  v60 = v43 - v59 * 0.5 + 3.0;

  -[HUQuickControlRingSliderView primaryLabel](self, "primaryLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "frame");
  v63 = v62;

  -[HUQuickControlRingSliderView primaryLabel](self, "primaryLabel");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "frame");
  v66 = v65;

  -[HUQuickControlRingSliderView primaryLabel](self, "primaryLabel");
  v67 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setFrame:", v60, v56, v63, v66);

}

- (void)_prepareForTapticFeedback
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA998]);
  -[HUQuickControlRingSliderView setSelectionFeedbackGenerator:](self, "setSelectionFeedbackGenerator:", v3);

  -[HUQuickControlRingSliderView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 1);
  -[HUQuickControlRingSliderView setImpactFeedbackGenerator:](self, "setImpactFeedbackGenerator:", v5);

  -[HUQuickControlRingSliderView impactFeedbackGenerator](self, "impactFeedbackGenerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepare");

}

- (void)_actuateSelectionTapticFeedback
{
  void *v3;
  id v4;

  -[HUQuickControlRingSliderView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionChanged");

  -[HUQuickControlRingSliderView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (void)_actuateImpactTapticFeedback
{
  void *v3;
  id v4;

  -[HUQuickControlRingSliderView impactFeedbackGenerator](self, "impactFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "impactOccurred");

  -[HUQuickControlRingSliderView impactFeedbackGenerator](self, "impactFeedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (double)_getSliderValueForAngleFrom12OClock:(double)a3
{
  double result;

  -[HUQuickControlRingSliderView _getPointForAngleFrom12OClock:](self, "_getPointForAngleFrom12OClock:", a3);
  -[HUQuickControlRingSliderView _getSliderValueForPoint:](self, "_getSliderValueForPoint:");
  return result;
}

- (double)_getSliderValueForPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  -[HUQuickControlRingSliderView _getAngleFrom12OClockForPoint:](self, "_getAngleFrom12OClockForPoint:", a3.x, a3.y);
  v5 = v4;
  -[HUQuickControlRingSliderView _getPossibleAngleRange12OClock](self, "_getPossibleAngleRange12OClock");
  return (v5 - v6) / (v7 - v6);
}

- (double)_getAngleFrom12OClockForValue:(double)a3
{
  double v3;
  NSObject *v5;
  double v6;
  const char *v7;
  double v8;
  double v9;
  _BYTE v11[24];
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = 0.0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v11 = 136315394;
      *(_QWORD *)&v11[4] = "-[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:]";
      *(_WORD *)&v11[12] = 2048;
      *(double *)&v11[14] = v3;
      v7 = "(%s) value = %f when expected to be between 0.0 and 1.0. Adjusting it to 0.0";
LABEL_9:
      _os_log_debug_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEBUG, v7, v11, 0x16u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  v6 = 1.0;
  if (a3 > 1.0)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v11 = 136315394;
      *(_QWORD *)&v11[4] = "-[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:]";
      *(_WORD *)&v11[12] = 2048;
      *(double *)&v11[14] = v3;
      v7 = "(%s) value = %f when expected to be between 0.0 and 1.0. Adjusting it to 1.0";
      goto LABEL_9;
    }
LABEL_6:

    v3 = v6;
  }
  -[HUQuickControlRingSliderView _getPossibleAngleRange12OClock](self, "_getPossibleAngleRange12OClock", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12);
  return v9 + (v8 - v9) * v3;
}

- (CGPoint)_getHandleCenterOnRingForValue:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __double2 v12;
  double v13;
  double v14;
  CGPoint result;

  -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:", a3);
  v5 = v4;
  -[HUQuickControlRingSliderView _getMiddleCircleRadius](self, "_getMiddleCircleRadius");
  v7 = v6;
  -[HUQuickControlRingSliderView _getCircleCenterPoint](self, "_getCircleCenterPoint");
  v9 = v8;
  v11 = v10;
  v12 = __sincos_stret(v5);
  v13 = v9 + v7 * v12.__sinval;
  v14 = v11 - v7 * v12.__cosval;
  result.y = v14;
  result.x = v13;
  return result;
}

- (double)_getAngleFrom12OClockForPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double result;
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
  double v19;
  double v20;
  double v21;
  double v22;

  y = a3.y;
  x = a3.x;
  -[HUQuickControlRingSliderView bounds](self, "bounds");
  if (v6 != 0.0 || (-[HUQuickControlRingSliderView bounds](self, "bounds"), result = 0.0, v8 != 0.0))
  {
    -[HUQuickControlRingSliderView _getMiddleCircleRadius](self, "_getMiddleCircleRadius");
    v10 = v9;
    -[HUQuickControlRingSliderView _getCircleCenterPoint](self, "_getCircleCenterPoint");
    v12 = v11;
    v14 = v13;
    -[HUQuickControlRingSliderView _getClosestPointOnMiddleCircleOfRing:](self, "_getClosestPointOnMiddleCircleOfRing:", x, y);
    v16 = v15;
    v18 = v17;
    UIDistanceBetweenPoints();
    if (v10 > 0.0 && vabdd_f64(v19, v10) >= 0.05)
      NSLog(CFSTR("The distance between closestPtOnMiddleCircle and circle's center has to be the radius %f. Please check math again"), *(_QWORD *)&v10);
    if (v16 < v12 || v18 >= v14)
    {
      if (v16 <= v12 || v18 < v14)
      {
        v22 = (v12 - v16) / v10;
        if (v16 > v12 || v18 <= v14)
        {
          v20 = acos(v22);
          v21 = 4.71238898;
        }
        else
        {
          v20 = asin(v22);
          v21 = 3.14159265;
        }
      }
      else
      {
        v20 = acos((v16 - v12) / v10);
        v21 = 1.57079633;
      }
      return v20 + v21;
    }
    else
    {
      return asin((v16 - v12) / v10);
    }
  }
  return result;
}

- (CGPoint)_getPointForAngleFrom12OClock:(double)a3
{
  float v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __double2 v14;
  double v15;
  double v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  __double2 v21;
  double v22;
  __double2 v23;
  __double2 v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;
  CGPoint result;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = fmodf(v5, 6.2832);
  -[HUQuickControlRingSliderView _getMiddleCircleRadius](self, "_getMiddleCircleRadius");
  if (v7 <= 0.0)
  {
    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v19;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "(%@/%@) middleCircleRadius should be > 0", (uint8_t *)&v25, 0x16u);

    }
    v15 = *MEMORY[0x1E0C9D538];
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    v8 = v7;
    v9 = v6;
    -[HUQuickControlRingSliderView frame](self, "frame");
    v11 = v10 * 0.5;
    -[HUQuickControlRingSliderView frame](self, "frame");
    v13 = v12 * 0.5;
    if (v6 < 0.0 || v9 >= 1.57079633)
    {
      if (v9 < 1.57079633 || v9 >= 3.14159265)
      {
        v22 = -v8;
        if (v9 < 3.14159265 || v9 >= 4.71238898)
        {
          v24 = __sincos_stret(v9 + -4.71238898);
          v15 = v11 + v22 * v24.__cosval;
          v16 = v13 + v22 * v24.__sinval;
        }
        else
        {
          v23 = __sincos_stret(v9 + -3.14159265);
          v15 = v11 + v22 * v23.__sinval;
          v16 = v13 + v8 * v23.__cosval;
        }
      }
      else
      {
        v21 = __sincos_stret(v9 + -1.57079633);
        v15 = v11 + v8 * v21.__cosval;
        v16 = v13 + v8 * v21.__sinval;
      }
    }
    else
    {
      v14 = __sincos_stret(v6);
      v15 = v11 + v8 * v14.__sinval;
      v16 = v13 - v8 * v14.__cosval;
    }
  }
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)_getClosestPointOnMiddleCircleOfRing:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[HUQuickControlRingSliderView outerRadius](self, "outerRadius");
  v7 = v6 + -17.5;
  -[HUQuickControlRingSliderView frame](self, "frame");
  v9 = v8 * 0.5;
  -[HUQuickControlRingSliderView frame](self, "frame");
  v11 = v10 * 0.5;
  UIDistanceBetweenPoints();
  v13 = v11 + v7 * (y - v11) / v12;
  v14 = v9 + v7 * (x - v9) / v12;
  result.y = v13;
  result.x = v14;
  return result;
}

- (BOOL)_primaryHandleViewContainsPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
  v8 = v7;
  v10 = v9;

  -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13.x = v8;
  v13.y = v10;
  LOBYTE(v6) = CGRectContainsPoint(v14, v13);

  return (char)v6;
}

- (BOOL)_secondaryHandleViewContainsPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  -[HUQuickControlRingSliderView profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasSecondaryValue");

  if (!v7)
    return 0;
  -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  v10 = v9;
  v12 = v11;

  -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15.x = v10;
  v15.y = v12;
  LOBYTE(v8) = CGRectContainsPoint(v16, v15);

  return (char)v8;
}

- (BOOL)_isPoint:(CGPoint)a3 withInMarginOfRing:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v10;

  -[HUQuickControlRingSliderView _getCircleCenterPoint](self, "_getCircleCenterPoint");
  UIDistanceBetweenPoints();
  v7 = v6;
  -[HUQuickControlRingSliderView outerRadius](self, "outerRadius");
  if (v7 > v8 + a4)
    return 0;
  -[HUQuickControlRingSliderView outerRadius](self, "outerRadius");
  return v7 >= v10 + -35.0 - a4;
}

- (double)_getMiddleCircleRadius
{
  double v2;

  -[HUQuickControlRingSliderView outerRadius](self, "outerRadius");
  return v2 + -17.5;
}

- (double)_getInnerCircleRadius
{
  double v2;

  -[HUQuickControlRingSliderView outerRadius](self, "outerRadius");
  return v2 + -35.0;
}

- (CGPoint)_getCircleCenterPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[HUQuickControlRingSliderView frame](self, "frame");
  v4 = v3 * 0.5;
  -[HUQuickControlRingSliderView frame](self, "frame");
  v6 = v5 * 0.5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_getPossibleAngleRange12OClock
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[HUQuickControlRingSliderView _getMinAngleFrom12OClock](self, "_getMinAngleFrom12OClock");
  v4 = v3;
  -[HUQuickControlRingSliderView _getMaxAngleFrom12OClock](self, "_getMaxAngleFrom12OClock");
  v6 = v5;
  v7 = v4;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

- (double)_getMinAngleFrom12OClock
{
  void *v2;
  unint64_t v3;
  double result;

  -[HUQuickControlRingSliderView profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style");

  result = 0.0;
  if (v3 <= 2)
    return dbl_1B9442828[v3];
  return result;
}

- (double)_getMaxAngleFrom12OClock
{
  void *v3;
  unint64_t v4;
  double v5;

  -[HUQuickControlRingSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  if (v4 > 2)
    return 6.28318531;
  -[HUQuickControlRingSliderView _getMinAngleFrom12OClock](self, "_getMinAngleFrom12OClock");
  return 6.28318531 - v5;
}

- (unint64_t)_getRingSliderAreaForAngleFrom12Oclock:(double)a3 minAngle:(double)a4 maxAngle:(double)a5
{
  double v5;
  BOOL v6;
  BOOL v7;
  double v8;
  BOOL v9;
  BOOL v10;
  double v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;

  v5 = a4 + -0.05;
  if (a3 >= 0.0)
  {
    v6 = v5 == a3;
    v7 = v5 < a3;
  }
  else
  {
    v6 = 1;
    v7 = 0;
  }
  if (!v7 && !v6)
    return 4;
  v8 = a4 + 0.05;
  if (v5 <= a3)
  {
    v9 = v8 == a3;
    v10 = v8 < a3;
  }
  else
  {
    v9 = 1;
    v10 = 0;
  }
  if (!v10 && !v9)
    return 1;
  v11 = a5 + -0.05;
  if (v8 <= a3)
  {
    v12 = v11 == a3;
    v13 = v11 < a3;
  }
  else
  {
    v12 = 1;
    v13 = 0;
  }
  if (!v13 && !v12)
    return 2;
  if (a5 + 0.05 >= a3)
  {
    v15 = v11 == a3;
    v14 = v11 >= a3;
  }
  else
  {
    v14 = 1;
    v15 = 0;
  }
  if (!v15 && v14)
    return 4;
  else
    return 3;
}

- (unint64_t)_getRingSliderAreaForPoint:(CGPoint)a3
{
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForPoint:](self, "_getAngleFrom12OClockForPoint:", a3.x, a3.y);
  return -[HUQuickControlRingSliderView _getRingSliderAreaForAngleFrom12Oclock:](self, "_getRingSliderAreaForAngleFrom12Oclock:");
}

- (unint64_t)_getRingSliderAreaForAngleFrom12Oclock:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[HUQuickControlRingSliderView _getMinAngleFrom12OClock](self, "_getMinAngleFrom12OClock");
  v6 = v5;
  -[HUQuickControlRingSliderView _getMaxAngleFrom12OClock](self, "_getMaxAngleFrom12OClock");
  return -[HUQuickControlRingSliderView _getRingSliderAreaForAngleFrom12Oclock:minAngle:maxAngle:](self, "_getRingSliderAreaForAngleFrom12Oclock:minAngle:maxAngle:", a3, v6, v7);
}

- (void)handlePanGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  int v23;
  double v24;
  double v25;
  double v26;
  HUQuickControlRingSliderView *v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  int v32;
  HUQuickControlRingSliderView *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HUQuickControlRingSliderView conformsToProtocol:](self, "conformsToProtocol:", &unk_1EF285200)
    && (objc_opt_respondsToSelector() & 1) != 0
    && (!-[HUQuickControlRingSliderView reachabilityState](self, "reachabilityState")
     || -[HUQuickControlRingSliderView reachabilityState](self, "reachabilityState") == 1))
  {
    HUQuickControlReachabilityString(-[HUQuickControlRingSliderView reachabilityState](self, "reachabilityState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 138412802;
      v33 = self;
      v34 = 2112;
      v35 = v5;
      v36 = 2080;
      v37 = "-[HUQuickControlRingSliderView handlePanGestureRecognizer:]";
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Control view %@ is in state %@. Ignoring tap gesture in %s", (uint8_t *)&v32, 0x20u);
    }

  }
  else if (!-[HUQuickControlRingSliderView showOffState](self, "showOffState"))
  {
    objc_msgSend(v4, "locationInView:", self);
    v8 = v7;
    v10 = v9;
    v11 = objc_msgSend(v4, "state");
    if ((unint64_t)(v11 - 3) >= 3)
    {
      if (v11 == 2)
      {
        if (!-[HUQuickControlRingSliderView isUserInteractionActive](self, "isUserInteractionActive"))
          goto LABEL_31;
        -[HUQuickControlRingSliderView setUserInteractionActive:](self, "setUserInteractionActive:", 1);
        v27 = self;
        v28 = v8;
        v29 = v10;
        v30 = 0;
      }
      else
      {
        if (v11 != 1)
          goto LABEL_31;
        -[HUQuickControlRingSliderView setIsDraggingPrimaryHandleView:](self, "setIsDraggingPrimaryHandleView:", -[HUQuickControlRingSliderView _primaryHandleViewContainsPoint:](self, "_primaryHandleViewContainsPoint:", v8, v10));
        -[HUQuickControlRingSliderView setIsDraggingSecondaryHandleView:](self, "setIsDraggingSecondaryHandleView:", -[HUQuickControlRingSliderView _secondaryHandleViewContainsPoint:](self, "_secondaryHandleViewContainsPoint:", v8, v10));
        if (-[HUQuickControlRingSliderView isDraggingPrimaryHandleView](self, "isDraggingPrimaryHandleView")
          || -[HUQuickControlRingSliderView isDraggingSecondaryHandleView](self, "isDraggingSecondaryHandleView"))
        {
          -[HUQuickControlRingSliderView _prepareForTapticFeedback](self, "_prepareForTapticFeedback");
          -[HUQuickControlRingSliderView _actuateImpactTapticFeedback](self, "_actuateImpactTapticFeedback");
        }
        if (-[HUQuickControlRingSliderView isDraggingPrimaryHandleView](self, "isDraggingPrimaryHandleView")
          && -[HUQuickControlRingSliderView isDraggingSecondaryHandleView](self, "isDraggingSecondaryHandleView"))
        {
          -[HUQuickControlRingSliderView primaryHandleView](self, "primaryHandleView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "center");
          UIDistanceBetweenPoints();
          v14 = v13;

          -[HUQuickControlRingSliderView secondaryHandleView](self, "secondaryHandleView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "center");
          UIDistanceBetweenPoints();
          v17 = v16;

          -[HUQuickControlRingSliderView setIsDraggingPrimaryHandleView:](self, "setIsDraggingPrimaryHandleView:", v14 <= v17);
          -[HUQuickControlRingSliderView setIsDraggingSecondaryHandleView:](self, "setIsDraggingSecondaryHandleView:", -[HUQuickControlRingSliderView isDraggingPrimaryHandleView](self, "isDraggingPrimaryHandleView") ^ 1);
        }
        -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
        -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
        v19 = v18;
        -[HUQuickControlRingSliderView modelRangeValue](self, "modelRangeValue");
        -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:", v20);
        if (v19 == v21)
        {
          -[HUQuickControlRingSliderView profile](self, "profile");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "hasSecondaryValue");

          if (v23)
          {
            -[HUQuickControlRingSliderView _getMinimumMarkingValue](self, "_getMinimumMarkingValue");
            v25 = v24;
            if (v19 == v24
              || (-[HUQuickControlRingSliderView _getMaximumMarkingValue](self, "_getMaximumMarkingValue"), v19 == v26))
            {
              -[HUQuickControlRingSliderView setIsDraggingPrimaryHandleView:](self, "setIsDraggingPrimaryHandleView:", v19 == v25);
              -[HUQuickControlRingSliderView setIsDraggingSecondaryHandleView:](self, "setIsDraggingSecondaryHandleView:", v19 != v25);
            }
          }
        }
        if (!-[HUQuickControlRingSliderView isDraggingPrimaryHandleView](self, "isDraggingPrimaryHandleView")
          && !-[HUQuickControlRingSliderView isDraggingSecondaryHandleView](self, "isDraggingSecondaryHandleView"))
        {
          -[HUQuickControlRingSliderView interactionDelegate](self, "interactionDelegate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "controlView:interactionStateDidChange:forFirstTouch:", self, 0, 1);

          -[HUQuickControlRingSliderView setUserInteractionActive:](self, "setUserInteractionActive:", 0);
          goto LABEL_31;
        }
        -[HUQuickControlRingSliderView setUserInteractionActive:](self, "setUserInteractionActive:", 1);
        v27 = self;
        v28 = v8;
        v29 = v10;
        v30 = 1;
      }
      -[HUQuickControlRingSliderView _updateUIWithTouchAtPoint:didTouchBegin:](v27, "_updateUIWithTouchAtPoint:didTouchBegin:", v30, v28, v29);
      -[HUQuickControlRingSliderView _updateModelValueWithSlidersPositions](self, "_updateModelValueWithSlidersPositions");
      goto LABEL_31;
    }
    if (-[HUQuickControlRingSliderView isUserInteractionActive](self, "isUserInteractionActive"))
    {
      -[HUQuickControlRingSliderView _updateUIWithTouchAtPoint:didTouchBegin:](self, "_updateUIWithTouchAtPoint:didTouchBegin:", 0, v8, v10);
      -[HUQuickControlRingSliderView _updateModelValueWithSlidersPositions](self, "_updateModelValueWithSlidersPositions");
      -[HUQuickControlRingSliderView _touchEnded](self, "_touchEnded");
    }
  }
LABEL_31:

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v13;

  v5 = a3;
  -[HUQuickControlRingSliderView longPressPanGestureRecognizer](self, "longPressPanGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7)
    return 1;
  -[HUQuickControlRingSliderView longPressPanGestureRecognizer](self, "longPressPanGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInView:", self);

  -[HUQuickControlRingSliderView _getCircleCenterPoint](self, "_getCircleCenterPoint");
  UIDistanceBetweenPoints();
  v10 = v9;
  -[HUQuickControlRingSliderView _getMiddleCircleRadius](self, "_getMiddleCircleRadius");
  if (v10 < v11 + -35.0)
    return 1;
  -[HUQuickControlRingSliderView _getMiddleCircleRadius](self, "_getMiddleCircleRadius");
  return v10 > v13 + 35.0;
}

- (double)_getMinimumMarkingValue
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  float v15;
  float v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlRingSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gradationMarkingValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HUQuickControlRingSliderView profile](self, "profile", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gradationMarkingValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "floatValue");
        if (v7 > v15)
        {
          objc_msgSend(v14, "floatValue");
          v7 = v16;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v7;
}

- (double)_getMaximumMarkingValue
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  float v15;
  float v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlRingSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gradationMarkingValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HUQuickControlRingSliderView profile](self, "profile", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gradationMarkingValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "floatValue");
        if (v7 < v15)
        {
          objc_msgSend(v14, "floatValue");
          v7 = v16;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v7;
}

- (HUQuickControlRingSliderViewProfile)profile
{
  return self->_profile;
}

- (HUQuickControlViewInteractionDelegate)interactionDelegate
{
  return (HUQuickControlViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (double)supplementaryValue
{
  return self->_supplementaryValue;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)modelRangeValue
{
  double minimum;
  double maximum;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  minimum = self->_modelRangeValue.minimum;
  maximum = self->_modelRangeValue.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

- (void)setModelRangeValue:(id)a3
{
  self->_modelRangeValue = ($888842945EE2C7AB0ACD33E179C69952)a3;
}

- (BOOL)isDraggingPrimaryHandleView
{
  return self->_isDraggingPrimaryHandleView;
}

- (void)setIsDraggingPrimaryHandleView:(BOOL)a3
{
  self->_isDraggingPrimaryHandleView = a3;
}

- (BOOL)isDraggingSecondaryHandleView
{
  return self->_isDraggingSecondaryHandleView;
}

- (void)setIsDraggingSecondaryHandleView:(BOOL)a3
{
  self->_isDraggingSecondaryHandleView = a3;
}

- (HUQuickControlRingSliderHandleView)primaryHandleView
{
  return self->_primaryHandleView;
}

- (void)setPrimaryHandleView:(id)a3
{
  objc_storeStrong((id *)&self->_primaryHandleView, a3);
}

- (HUQuickControlRingSliderHandleView)secondaryHandleView
{
  return self->_secondaryHandleView;
}

- (void)setSecondaryHandleView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryHandleView, a3);
}

- (UIView)backgroundRingView
{
  return self->_backgroundRingView;
}

- (void)setBackgroundRingView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundRingView, a3);
}

- (UIView)edgesAndColoredSupplementaryValueLineView
{
  return self->_edgesAndColoredSupplementaryValueLineView;
}

- (void)setEdgesAndColoredSupplementaryValueLineView:(id)a3
{
  objc_storeStrong((id *)&self->_edgesAndColoredSupplementaryValueLineView, a3);
}

- (UIImage)gradientRingImage
{
  return self->_gradientRingImage;
}

- (void)setGradientRingImage:(id)a3
{
  objc_storeStrong((id *)&self->_gradientRingImage, a3);
}

- (UIImageView)selectedRangeImageView
{
  return self->_selectedRangeImageView;
}

- (void)setSelectedRangeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRangeImageView, a3);
}

- (UIImageView)selectedRangeImageViewForEdges
{
  return self->_selectedRangeImageViewForEdges;
}

- (void)setSelectedRangeImageViewForEdges:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRangeImageViewForEdges, a3);
}

- (BOOL)didMaskBackgroundImageView
{
  return self->_didMaskBackgroundImageView;
}

- (void)setDidMaskBackgroundImageView:(BOOL)a3
{
  self->_didMaskBackgroundImageView = a3;
}

- (double)outerRadius
{
  return self->_outerRadius;
}

- (void)setOuterRadius:(double)a3
{
  self->_outerRadius = a3;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (unint64_t)prevTouchArea
{
  return self->_prevTouchArea;
}

- (void)setPrevTouchArea:(unint64_t)a3
{
  self->_prevTouchArea = a3;
}

- (UILabel)supplementaryLabel
{
  return self->_supplementaryLabel;
}

- (void)setSupplementaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryLabel, a3);
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UIView)labelsBackgroundView
{
  return self->_labelsBackgroundView;
}

- (void)setLabelsBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_labelsBackgroundView, a3);
}

- (UILongPressGestureRecognizer)longPressPanGestureRecognizer
{
  return self->_longPressPanGestureRecognizer;
}

- (void)setLongPressPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressPanGestureRecognizer, a3);
}

- (UIView)supplementaryValueMarkingView
{
  return self->_supplementaryValueMarkingView;
}

- (void)setSupplementaryValueMarkingView:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryValueMarkingView, a3);
}

- (void)setGradationMarkingViews:(id)a3
{
  objc_storeStrong((id *)&self->_gradationMarkingViews, a3);
}

- (void)setMarkingValuesAndViewsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_markingValuesAndViewsDictionary, a3);
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, a3);
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (void)setImpactFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, a3);
}

- (double)prevSliderValue
{
  return self->_prevSliderValue;
}

- (void)setPrevSliderValue:(double)a3
{
  self->_prevSliderValue = a3;
}

- (unint64_t)prevSlidingDirection
{
  return self->_prevSlidingDirection;
}

- (void)setPrevSlidingDirection:(unint64_t)a3
{
  self->_prevSlidingDirection = a3;
}

- (void)setCurrentDirectionTapticValues:(id)a3
{
  objc_storeStrong((id *)&self->_currentDirectionTapticValues, a3);
}

- (BOOL)showOffState
{
  return self->_showOffState;
}

- (void)setShowOffState:(BOOL)a3
{
  self->_showOffState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDirectionTapticValues, 0);
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_markingValuesAndViewsDictionary, 0);
  objc_storeStrong((id *)&self->_gradationMarkingViews, 0);
  objc_storeStrong((id *)&self->_supplementaryValueMarkingView, 0);
  objc_storeStrong((id *)&self->_longPressPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_labelsBackgroundView, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_supplementaryLabel, 0);
  objc_storeStrong((id *)&self->_selectedRangeImageViewForEdges, 0);
  objc_storeStrong((id *)&self->_selectedRangeImageView, 0);
  objc_storeStrong((id *)&self->_gradientRingImage, 0);
  objc_storeStrong((id *)&self->_edgesAndColoredSupplementaryValueLineView, 0);
  objc_storeStrong((id *)&self->_backgroundRingView, 0);
  objc_storeStrong((id *)&self->_secondaryHandleView, 0);
  objc_storeStrong((id *)&self->_primaryHandleView, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
