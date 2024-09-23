@implementation HUQuickControlSwitchView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlSwitchView)initWithProfile:(id)a3
{
  id v5;
  HUQuickControlSwitchView *v6;
  HUQuickControlSwitchView *v7;
  void *v8;
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
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HUQuickControlSwitchView;
  v6 = -[HUQuickControlSwitchView init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    {
      objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryMaterial");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSwitchView setWellView:](v7, "setWellView:", v8);
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
      -[HUQuickControlSwitchView setWellView:](v7, "setWellView:", v9);

      objc_msgSend(MEMORY[0x1E0CEA478], "quaternarySystemFillColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSwitchView wellView](v7, "wellView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v8);

    }
    -[HUQuickControlSwitchView wellView](v7, "wellView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutoresizingMask:", 18);

    -[HUQuickControlSwitchView wellView](v7, "wellView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClipsToBounds:", 1);

    -[HUQuickControlSwitchView wellView](v7, "wellView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSwitchView addSubview:](v7, "addSubview:", v13);

    v14 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[HUQuickControlSwitchView setKnobView:](v7, "setKnobView:", v14);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSwitchView knobView](v7, "knobView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v15);

    -[HUQuickControlSwitchView knobView](v7, "knobView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClipsToBounds:", 1);

    -[HUQuickControlSwitchView knobView](v7, "knobView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMasksToBounds:", 0);

    -[HUQuickControlSwitchView knobView](v7, "knobView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSwitchView addSubview:](v7, "addSubview:", v20);

    -[HUQuickControlSwitchView layer](v7, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAllowsGroupOpacity:", 0);

    LODWORD(v22) = 1148846080;
    -[HUQuickControlSwitchView setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 0, v22);
    LODWORD(v23) = 1148846080;
    -[HUQuickControlSwitchView setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 1, v23);
    -[HUQuickControlSwitchView _updateDecorationIconDescriptorAnimated:](v7, "_updateDecorationIconDescriptorAnimated:", 0);
    -[HUQuickControlSwitchView _updateSupplementaryValueLabelAnimated:](v7, "_updateSupplementaryValueLabelAnimated:", 0);
    -[HUQuickControlSwitchView _updateKnobViewTintColorAnimated:](v7, "_updateKnobViewTintColorAnimated:", 0);
    -[HUQuickControlSwitchView _prepareForTapticFeedback](v7, "_prepareForTapticFeedback");
  }

  return v7;
}

- (void)setSwitchValue:(double)a3
{
  double v4;
  double v5;
  BOOL v6;
  double v7;
  BOOL v8;
  double switchValue;
  double v10;
  double v11;

  v4 = fmin(fmax(a3, 0.0), 1.0);
  -[HUQuickControlSwitchView clippedValue](self, "clippedValue");
  v6 = v4 > 0.5 && v5 < 0.5;
  if (v6
    || ((-[HUQuickControlSwitchView clippedValue](self, "clippedValue"), v4 < 0.5) ? (v8 = v7 <= 0.5) : (v8 = 1), !v8))
  {
    -[HUQuickControlSwitchView _actuateTapticFeedback](self, "_actuateTapticFeedback");
  }
  -[HUQuickControlSwitchView setClippedValue:](self, "setClippedValue:", v4);
  switchValue = self->_switchValue;
  -[HUQuickControlSwitchView clippedValue](self, "clippedValue");
  if (switchValue != v10)
  {
    -[HUQuickControlSwitchView clippedValue](self, "clippedValue");
    self->_switchValue = v11;
    -[HUQuickControlSwitchView setNeedsLayout](self, "setNeedsLayout");
    if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock"))
      -[HUQuickControlSwitchView layoutIfNeeded](self, "layoutIfNeeded");
    -[HUQuickControlSwitchView _updateKnobViewTintColorAnimated:](self, "_updateKnobViewTintColorAnimated:", 1);
  }
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[HUQuickControlSwitchView profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HUQuickControlSliderMetricsForControlSize(objc_msgSend(v2, "controlSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeDescriptor");
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

- (void)layoutSubviews
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
  void *v14;
  void *v15;
  double v16;
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
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double x;
  double y;
  double width;
  double height;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  CGRect v42;
  CGRect v43;

  v41.receiver = self;
  v41.super_class = (Class)HUQuickControlSwitchView;
  -[HUQuickControlSwitchView layoutSubviews](&v41, sel_layoutSubviews);
  -[HUQuickControlSwitchView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = HUDefaultSwitchMetrics[objc_msgSend(v3, "controlSize")];

  -[HUQuickControlSwitchView switchValue](self, "switchValue");
  -[HUQuickControlSwitchView _knobFrameForMetrics:switchValue:](self, "_knobFrameForMetrics:switchValue:", v4, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[HUQuickControlSwitchView knobView](self, "knobView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[HUQuickControlSwitchView knobView](self, "knobView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[HUQuickControlSwitchView decorationIconView](self, "decorationIconView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  -[HUQuickControlSwitchView profile](self, "profile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  HUQuickControlSliderMetricsForControlSize(objc_msgSend(v25, "controlSize"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "widthToCornerRadiusRatio");
  v28 = v27;
  -[HUQuickControlSwitchView bounds](self, "bounds");
  v30 = v28 * v29;

  -[HUQuickControlSwitchView wellView](self, "wellView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_setContinuousCornerRadius:", v30);

  -[HUQuickControlSwitchView knobView](self, "knobView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_setContinuousCornerRadius:", fmax(v30 + -8.0, 0.0));

  -[HUQuickControlSwitchView _knobFrameForMetrics:switchValue:](self, "_knobFrameForMetrics:switchValue:", v4, 0.0);
  v43 = CGRectInset(v42, 4.0, 0.0);
  x = v43.origin.x;
  y = v43.origin.y;
  width = v43.size.width;
  height = v43.size.height;
  -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", x, y, width, height);

  -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSwitchView bringSubviewToFront:](self, "bringSubviewToFront:", v38);

  -[HUQuickControlSwitchView knobView](self, "knobView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSwitchView bringSubviewToFront:](self, "bringSubviewToFront:", v39);

  -[HUQuickControlSwitchView decorationIconView](self, "decorationIconView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSwitchView bringSubviewToFront:](self, "bringSubviewToFront:", v40);

  -[HUQuickControlSwitchView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:", -[HUQuickControlSwitchView reachabilityState](self, "reachabilityState"));
}

- (CGRect)_knobFrameForMetrics:(id)a3 switchValue:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[HUQuickControlSwitchView _knobSizeForMetrics:](self, "_knobSizeForMetrics:");
  -[HUQuickControlSwitchView _knobCenterForMetrics:switchValue:](self, "_knobCenterForMetrics:switchValue:", a3.var0, a4);
  UIRectCenteredAboutPoint();
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGSize)_knobSizeForMetrics:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[HUQuickControlSwitchView bounds](self, "bounds");
  v6 = v5 + -16.0;
  -[HUQuickControlSwitchView bounds](self, "bounds");
  v8 = a3.var0 * v7;
  v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGPoint)_knobCenterForMetrics:(id)a3 switchValue:(double)a4
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double height;
  double v11;
  double v12;
  double MidX;
  double v14;
  CGPoint result;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[HUQuickControlSwitchView _knobSizeForMetrics:](self, "_knobSizeForMetrics:", a3.var0);
  v16.size.width = v8;
  v16.size.height = v9;
  v16.origin.x = v6;
  v16.origin.y = v7;
  v17 = CGRectInset(v16, -8.0, -8.0);
  height = v17.size.height;
  -[HUQuickControlSwitchView bounds](self, "bounds", v17.origin.x, v17.origin.y, v17.size.width);
  v12 = height * 0.5 + (height * 0.5 + v11 - height - height * 0.5) * (1.0 - a4);
  -[HUQuickControlSwitchView bounds](self, "bounds");
  MidX = CGRectGetMidX(v18);
  v14 = v12;
  result.y = v14;
  result.x = MidX;
  return result;
}

- (void)_updateKnobViewTintColorAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD aBlock[5];

  v3 = a3;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HUQuickControlSwitchView__updateKnobViewTintColorAnimated___block_invoke;
  aBlock[3] = &unk_1E6F4D988;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v6 = v5;
  if (v3)
  {
    +[HUAnimationSettings settingsWithDuration:curve:](HUAnimationSettings, "settingsWithDuration:curve:", 3, 0.15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __61__HUQuickControlSwitchView__updateKnobViewTintColorAnimated___block_invoke_2;
    v9[3] = &unk_1E6F59280;
    v10 = v6;
    v8 = +[HUAnimationApplier applyAnimationSettings:withStaticApplier:completion:](HUAnimationApplier, "applyAnimationSettings:withStaticApplier:completion:", v7, v9, 0);

  }
  else
  {
    (*((void (**)(void *))v5 + 2))(v5);
  }

}

void __61__HUQuickControlSwitchView__updateKnobViewTintColorAnimated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "switchValue");
  if (v2 > 0.5 && objc_msgSend(*(id *)(a1 + 32), "reachabilityState") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "knobView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v3);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "knobView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v5);
  }

}

uint64_t __61__HUQuickControlSwitchView__updateKnobViewTintColorAnimated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_prepareForTapticFeedback
{
  id v3;
  id v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA660]);
  -[HUQuickControlSwitchView setFeedbackGenerator:](self, "setFeedbackGenerator:", v3);

  -[HUQuickControlSwitchView feedbackGenerator](self, "feedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (void)_actuateTapticFeedback
{
  void *v3;
  id v4;

  -[HUQuickControlSwitchView feedbackGenerator](self, "feedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "impactOccurred");

  -[HUQuickControlSwitchView feedbackGenerator](self, "feedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  void *v3;
  void *v4;

  HUQuickControlSliderMetricsForControlSize(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)value
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[HUQuickControlSwitchView switchValue](self, "switchValue");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (void)setValue:(id)a3
{
  objc_msgSend(a3, "doubleValue");
  -[HUQuickControlSwitchView setSwitchValue:](self, "setSwitchValue:");
}

- (void)setProfile:(id)a3
{
  HUQuickControlSwitchViewProfile *v4;
  unint64_t v5;
  uint64_t v6;
  HUQuickControlSwitchViewProfile *profile;

  v4 = (HUQuickControlSwitchViewProfile *)a3;
  v5 = -[HUQuickControlViewProfile controlSize](self->_profile, "controlSize");
  v6 = -[HUQuickControlViewProfile controlSize](v4, "controlSize");
  profile = self->_profile;
  self->_profile = v4;

  if (v5 != v6)
  {
    -[HUQuickControlSwitchView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[HUQuickControlSwitchView setNeedsLayout](self, "setNeedsLayout");
  }
  -[HUQuickControlSwitchView _updateDecorationIconDescriptorAnimated:](self, "_updateDecorationIconDescriptorAnimated:", 1);
  -[HUQuickControlSwitchView _updateSupplementaryValueLabelAnimated:](self, "_updateSupplementaryValueLabelAnimated:", 1);
  -[HUQuickControlSwitchView _updateKnobViewTintColorAnimated:](self, "_updateKnobViewTintColorAnimated:", 1);
}

- (void)_updateDecorationIconDescriptorAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[HUQuickControlSwitchView profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decorationIconDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v3 & ~-[HUQuickControlSwitchView _createDecorationIconViewIfNecessary](self, "_createDecorationIconViewIfNecessary");
    -[HUQuickControlSwitchView decorationIconView](self, "decorationIconView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSwitchView profile](self, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "decorationIconDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateWithIconDescriptor:displayStyle:animated:", v9, 3, v7);

  }
  else
  {
    -[HUQuickControlSwitchView decorationIconView](self, "decorationIconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[HUQuickControlSwitchView setDecorationIconView:](self, "setDecorationIconView:", 0);
  }
}

- (void)_updateSupplementaryValueLabelAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD aBlock[5];

  v3 = a3;
  -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dynamicFormattingValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSwitchView profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "supplementaryFormattedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9 = v7;
  if (v8 == v9)
  {

    return;
  }
  v10 = v9;
  if (v8)
  {
    v11 = objc_msgSend(v8, "isEqual:", v9);

    if ((v11 & 1) != 0)
      return;
  }
  else
  {

  }
  -[HUQuickControlSwitchView _createSupplementaryValueLabelIfNecessary](self, "_createSupplementaryValueLabelIfNecessary");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__HUQuickControlSwitchView__updateSupplementaryValueLabelAnimated___block_invoke;
  aBlock[3] = &unk_1E6F4D988;
  aBlock[4] = self;
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if (v3)
  {
    v14 = (void *)MEMORY[0x1E0CEABB0];
    -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transitionWithView:duration:options:animations:completion:", v15, 5242880, v13, 0, 0.15);

  }
  else
  {
    (*((void (**)(void *))v12 + 2))(v12);
  }

}

void __67__HUQuickControlSwitchView__updateSupplementaryValueLabelAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supplementaryFormattedValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "supplementaryValueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDynamicFormattingValue:", v2);

}

- (BOOL)_createDecorationIconViewIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HUQuickControlSwitchView decorationIconView](self, "decorationIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D33720]);
    -[HUQuickControlSwitchView setDecorationIconView:](self, "setDecorationIconView:", v4);

    -[HUQuickControlSwitchView decorationIconView](self, "decorationIconView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayContext:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSwitchView decorationIconView](self, "decorationIconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);

    -[HUQuickControlSwitchView decorationIconView](self, "decorationIconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSwitchView addSubview:](self, "addSubview:", v8);

    -[HUQuickControlSwitchView setNeedsLayout](self, "setNeedsLayout");
  }
  return v3 == 0;
}

- (void)_createSupplementaryValueLabelIfNecessary
{
  void *v3;
  HUDynamicFormattingLabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(HUDynamicFormattingLabel);
    -[HUQuickControlSwitchView setSupplementaryValueLabel:](self, "setSupplementaryValueLabel:", v4);

    v22 = *MEMORY[0x1E0CEA0A0];
    -[HUQuickControlSwitchView profile](self, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDefaultAttributes:", v7);

    __69__HUQuickControlSwitchView__createSupplementaryValueLabelIfNecessary__block_invoke(*MEMORY[0x1E0CEB538]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    __69__HUQuickControlSwitchView__createSupplementaryValueLabelIfNecessary__block_invoke(*MEMORY[0x1E0CEB558]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v10;
    __69__HUQuickControlSwitchView__createSupplementaryValueLabelIfNecessary__block_invoke(*MEMORY[0x1E0CEB548]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v11;
    __69__HUQuickControlSwitchView__createSupplementaryValueLabelIfNecessary__block_invoke(*MEMORY[0x1E0CEB550]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPreferredFonts:", v13);

    -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextAlignment:", 1);

    -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBaselineAdjustment:", 1);

    -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsDefaultTighteningForTruncation:", 1);

    -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAdjustsFontSizeToFitWidth:", 1);

    -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMinimumScaleFactor:", 0.75);

    -[HUQuickControlSwitchView supplementaryValueLabel](self, "supplementaryValueLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSwitchView insertSubview:atIndex:](self, "insertSubview:atIndex:", v20, 0);

  }
}

id __69__HUQuickControlSwitchView__createSupplementaryValueLabelIfNecessary__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0D33718];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "defaultFontDescriptorWithTextStyle:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithMonospacedDigitsForFontDescriptor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setReachabilityState:(unint64_t)a3
{
  if (self->_reachabilityState != a3)
  {
    self->_reachabilityState = a3;
    -[HUQuickControlSwitchView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
  }
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 <= 2)
    -[HUQuickControlSwitchView setAlpha:](self, "setAlpha:", dbl_1B9442A88[a3]);
  -[HUQuickControlSwitchView _updateKnobViewTintColorAnimated:](self, "_updateKnobViewTintColorAnimated:", 1);
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (HUQuickControlSwitchViewProfile)profile
{
  return self->_profile;
}

- (UIView)wellView
{
  return self->_wellView;
}

- (void)setWellView:(id)a3
{
  objc_storeStrong((id *)&self->_wellView, a3);
}

- (UIView)knobView
{
  return self->_knobView;
}

- (void)setKnobView:(id)a3
{
  objc_storeStrong((id *)&self->_knobView, a3);
}

- (HUDynamicFormattingLabel)supplementaryValueLabel
{
  return self->_supplementaryValueLabel;
}

- (void)setSupplementaryValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryValueLabel, a3);
}

- (HUIconView)decorationIconView
{
  return self->_decorationIconView;
}

- (void)setDecorationIconView:(id)a3
{
  objc_storeStrong((id *)&self->_decorationIconView, a3);
}

- (double)clippedValue
{
  return self->_clippedValue;
}

- (void)setClippedValue:(double)a3
{
  self->_clippedValue = a3;
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (double)switchValue
{
  return self->_switchValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_decorationIconView, 0);
  objc_storeStrong((id *)&self->_supplementaryValueLabel, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
  objc_storeStrong((id *)&self->_wellView, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
