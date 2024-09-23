@implementation HUQuickControlSliderView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlSliderView)initWithProfile:(id)a3
{
  id v5;
  HUQuickControlSliderView *v6;
  HUQuickControlSliderView *v7;
  double v8;
  void *v9;
  HUQuickControlBackgroundEffectView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HUQuickControlSliderValueOverlayView *v17;
  HUQuickControlSliderValueOverlayView *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HUQuickControlSliderView *v38;
  id v39;
  void (**v40)(void *, void *);
  void *v41;
  void *v42;
  double v43;
  double v44;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, void *);
  void *v49;
  id v50;
  HUQuickControlSliderView *v51;
  objc_super v52;

  v5 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HUQuickControlSliderView;
  v6 = -[HUQuickControlSliderView init](&v52, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    -[HUQuickControlSliderView _permittedValueRange](v7, "_permittedValueRange");
    v7->_sliderValue = v8;
    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    {
      objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryMaterial");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSliderView setBackgroundView:](v7, "setBackgroundView:", v9);
    }
    else
    {
      v10 = -[HUQuickControlBackgroundEffectView initWithEffectType:]([HUQuickControlBackgroundEffectView alloc], "initWithEffectType:", 0);
      -[HUQuickControlSliderView setBackgroundView:](v7, "setBackgroundView:", v10);

      objc_msgSend(MEMORY[0x1E0CEA478], "quaternarySystemFillColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSliderView backgroundView](v7, "backgroundView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTintColor:", v9);

    }
    -[HUQuickControlSliderView backgroundView](v7, "backgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUQuickControlSliderView backgroundView](v7, "backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSliderView addSubview:](v7, "addSubview:", v13);

    -[HUQuickControlSliderView layer](v7, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsGroupOpacity:", 0);

    -[HUQuickControlSliderView layer](v7, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsGroupBlending:", 0);

    -[HUQuickControlSliderView layer](v7, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMasksToBounds:", 1);

    v17 = [HUQuickControlSliderValueOverlayView alloc];
    -[HUQuickControlSliderView bounds](v7, "bounds");
    v18 = -[HUQuickControlSliderValueOverlayView initWithFrame:](v17, "initWithFrame:");
    -[HUQuickControlSliderView setValueOverlayView:](v7, "setValueOverlayView:", v18);

    -[HUQuickControlSliderView profile](v7, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "showGrabbers");
    -[HUQuickControlSliderView valueOverlayView](v7, "valueOverlayView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setShowGrabbers:", v20);

    -[HUQuickControlSliderView valueOverlayView](v7, "valueOverlayView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSliderView addSubview:](v7, "addSubview:", v22);

    v23 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[HUQuickControlSliderView setBorderView:](v7, "setBorderView:", v23);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSliderView borderView](v7, "borderView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", v24);

    -[HUQuickControlSliderView borderView](v7, "borderView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "colorWithAlphaComponent:", 0.0500000007);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = objc_msgSend(v29, "CGColor");
    -[HUQuickControlSliderView borderView](v7, "borderView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBorderColor:", v30);

    -[HUQuickControlSliderView borderView](v7, "borderView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUQuickControlSliderView borderView](v7, "borderView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setMasksToBounds:", 1);

    -[HUQuickControlSliderView borderView](v7, "borderView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSliderView addSubview:](v7, "addSubview:", v36);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = MEMORY[0x1E0C809B0];
    v47 = 3221225472;
    v48 = __44__HUQuickControlSliderView_initWithProfile___block_invoke;
    v49 = &unk_1E6F4EC90;
    v50 = v37;
    v38 = v7;
    v51 = v38;
    v39 = v37;
    v40 = (void (**)(void *, void *))_Block_copy(&v46);
    -[HUQuickControlSliderView backgroundView](v38, "backgroundView", v46, v47, v48, v49);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2](v40, v41);

    -[HUQuickControlSliderView borderView](v38, "borderView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2](v40, v42);

    LODWORD(v43) = 1148846080;
    -[HUQuickControlSliderView setContentHuggingPriority:forAxis:](v38, "setContentHuggingPriority:forAxis:", 0, v43);
    LODWORD(v44) = 1148846080;
    -[HUQuickControlSliderView setContentHuggingPriority:forAxis:](v38, "setContentHuggingPriority:forAxis:", 1, v44);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v39);
    -[HUQuickControlSliderView _updateOffState](v38, "_updateOffState");
    -[HUQuickControlSliderView _updateDecorationIconDescriptorAnimated:](v38, "_updateDecorationIconDescriptorAnimated:", 0);
    -[HUQuickControlSliderView _prepareForTapticFeedback](v38, "_prepareForTapticFeedback");

  }
  return v7;
}

void __44__HUQuickControlSliderView_initWithProfile___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
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
  id v19;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v4, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v11);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(v4, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v15);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(v4, "trailingAnchor");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v18);

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_permittedValueRange
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = 0.0;
  v3 = 1.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setSliderValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double sliderValue;
  double v12;
  _QWORD v13[5];

  -[HUQuickControlSliderView setRawSliderValue:](self, "setRawSliderValue:");
  -[HUQuickControlSliderView _permittedValueRange](self, "_permittedValueRange");
  v7 = fmax(v6, fmin(a3, v5));
  -[HUQuickControlSliderView primaryNormalizedValue](self, "primaryNormalizedValue");
  v9 = v8 >= 1.0 || v7 < 1.0;
  if (!v9
    || (-[HUQuickControlSliderView primaryNormalizedValue](self, "primaryNormalizedValue"), v10 > 0.0) && v7 <= 0.0)
  {
    -[HUQuickControlSliderView _actuateTapticFeedback](self, "_actuateTapticFeedback");
  }
  -[HUQuickControlSliderView setPrimaryNormalizedValue:](self, "setPrimaryNormalizedValue:", v7);
  sliderValue = self->_sliderValue;
  -[HUQuickControlSliderView primaryNormalizedValue](self, "primaryNormalizedValue");
  if (sliderValue != v12)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__HUQuickControlSliderView_setSliderValue___block_invoke;
    v13[3] = &unk_1E6F4D988;
    v13[4] = self;
    -[HUQuickControlSliderView naui_performAnimateableConstraintChanges:](self, "naui_performAnimateableConstraintChanges:", v13);
  }
}

uint64_t __43__HUQuickControlSliderView_setSliderValue___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "primaryNormalizedValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440) = v2;
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)setSecondarySliderValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double secondarySliderValue;
  double v12;
  _QWORD v13[5];

  -[HUQuickControlSliderView _permittedValueRange](self, "_permittedValueRange");
  v7 = fmax(v6, fmin(a3, v5));
  -[HUQuickControlSliderView secondaryNormalizedValue](self, "secondaryNormalizedValue");
  v9 = v8 >= 1.0 || v7 < 1.0;
  if (!v9
    || (-[HUQuickControlSliderView secondaryNormalizedValue](self, "secondaryNormalizedValue"), v10 > 0.0) && v7 <= 0.0)
  {
    -[HUQuickControlSliderView _actuateTapticFeedback](self, "_actuateTapticFeedback");
  }
  -[HUQuickControlSliderView setSecondaryNormalizedValue:](self, "setSecondaryNormalizedValue:", v7);
  secondarySliderValue = self->_secondarySliderValue;
  -[HUQuickControlSliderView secondaryNormalizedValue](self, "secondaryNormalizedValue");
  if (secondarySliderValue != v12)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__HUQuickControlSliderView_setSecondarySliderValue___block_invoke;
    v13[3] = &unk_1E6F4D988;
    v13[4] = self;
    -[HUQuickControlSliderView naui_performAnimateableConstraintChanges:](self, "naui_performAnimateableConstraintChanges:", v13);
  }
}

uint64_t __52__HUQuickControlSliderView_setSecondarySliderValue___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "secondaryNormalizedValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448) = v2;
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)setRawSliderValue:(double)a3
{
  if ((NACGFloatEqualToFloat() & 1) == 0)
  {
    self->_rawSliderValue = a3;
    -[HUQuickControlSliderView _updateOffState](self, "_updateOffState");
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

  -[HUQuickControlSliderView profile](self, "profile");
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
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _BOOL8 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  _QWORD v67[5];
  objc_super v68;

  v68.receiver = self;
  v68.super_class = (Class)HUQuickControlSliderView;
  -[HUQuickControlSliderView layoutSubviews](&v68, sel_layoutSubviews);
  -[HUQuickControlSliderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HUQuickControlSliderView profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HUQuickControlSliderMetricsForControlSize(objc_msgSend(v11, "controlSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widthToCornerRadiusRatio");
  v14 = v13;
  -[HUQuickControlSliderView bounds](self, "bounds");
  -[HUQuickControlSliderView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v14 * v15);

  -[HUQuickControlSliderView _continuousCornerRadius](self, "_continuousCornerRadius");
  v17 = v16;
  -[HUQuickControlSliderView borderView](self, "borderView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setContinuousCornerRadius:", v17);

  -[HUQuickControlSliderView profile](self, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "controlSize");
  -[HUQuickControlSliderView valueOverlayView](self, "valueOverlayView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setControlSize:", v20);

  -[HUQuickControlSliderView profile](self, "profile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = objc_msgSend(v22, "hasSecondaryValue");

  if (!(_DWORD)v20)
  {
    -[HUQuickControlSliderView profile](self, "profile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "preferredFillSection");

    -[HUQuickControlSliderView sliderValue](self, "sliderValue");
    v26 = v25;
    if (v24)
    {
      -[HUQuickControlSliderView bounds](self, "bounds");
      v10 = (1.0 - v26) * v27;
      goto LABEL_6;
    }
    -[HUQuickControlSliderView bounds](self, "bounds");
    v10 = v26 * v28;
  }
  -[HUQuickControlSliderView sliderValue](self, "sliderValue");
  v30 = 1.0 - v29;
  -[HUQuickControlSliderView bounds](self, "bounds");
  v6 = v30 * v31;
LABEL_6:
  -[HUQuickControlSliderView profile](self, "profile");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "hasSecondaryValue");

  if (v33)
  {
    -[HUQuickControlSliderView bounds](self, "bounds");
    v35 = v34 - v6;
    -[HUQuickControlSliderView secondarySliderValue](self, "secondarySliderValue");
    v37 = v36;
    -[HUQuickControlSliderView bounds](self, "bounds");
    v10 = v35 - v37 * v38;
    -[HUQuickControlSliderView valueOverlayView](self, "valueOverlayView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    v41 = 1;
  }
  else
  {
    -[HUQuickControlSliderView valueOverlayView](self, "valueOverlayView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    v41 = 0;
  }
  objc_msgSend(v39, "setHasSecondGrabber:", v41);

  -[HUQuickControlSliderView valueOverlayView](self, "valueOverlayView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFrame:", v4, v6, v8, v10);

  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __42__HUQuickControlSliderView_layoutSubviews__block_invoke;
  v67[3] = &unk_1E6F5C578;
  v67[4] = self;
  v43 = __42__HUQuickControlSliderView_layoutSubviews__block_invoke((uint64_t)v67);
  -[HUQuickControlSliderView valueOverlayView](self, "valueOverlayView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setPrimaryGrabberLocation:", v43);

  -[HUQuickControlSliderView profile](self, "profile");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "tintColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSliderView valueOverlayView](self, "valueOverlayView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setLayerColor:", v46);

  -[HUQuickControlSliderView profile](self, "profile");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "tintColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSliderView traitCollection](self, "traitCollection");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "userInterfaceStyle");
  v51 = -[HUQuickControlSliderView showOffState](self, "showOffState");
  borderColorSurroundingColor(v49, v52, v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = objc_retainAutorelease(v53);
  v55 = objc_msgSend(v54, "CGColor");
  -[HUQuickControlSliderView borderView](self, "borderView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "layer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setBorderColor:", v55);

  HUDefaultSizeForIconSize();
  v59 = v58;
  v61 = v60;
  -[HUQuickControlSliderView bounds](self, "bounds");
  v63 = v62 * 0.5 - v59 * 0.5;
  -[HUQuickControlSliderView bounds](self, "bounds");
  v65 = v64 - v61 - v63 + 4.0;
  -[HUQuickControlSliderView decorationIconView](self, "decorationIconView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setFrame:", v63, v65, v59, v61);

  -[HUQuickControlSliderView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:", -[HUQuickControlSliderView reachabilityState](self, "reachabilityState"));
}

BOOL __42__HUQuickControlSliderView_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSecondaryValue");

  if ((v3 & 1) != 0)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "preferredFillSection");

  return v6 != 0;
}

- (void)_updateOffState
{
  void *v3;
  int v4;
  double v5;
  int v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  _QWORD v10[6];

  -[HUQuickControlSliderView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasOffState");

  if (v4)
  {
    -[HUQuickControlSliderView rawSliderValue](self, "rawSliderValue");
    v10[1] = 3221225472;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[2] = __43__HUQuickControlSliderView__updateOffState__block_invoke;
    v10[3] = &unk_1E6F5C5A0;
    v10[4] = self;
    *(double *)&v10[5] = round(v5 * 100.0) / 100.0;
    __43__HUQuickControlSliderView__updateOffState__block_invoke((uint64_t)v10);
    v7 = v6 != 0;
  }
  else
  {
    v7 = 0;
  }
  -[HUQuickControlSliderView setShowOffState:](self, "setShowOffState:", v7);
  v8 = -[HUQuickControlSliderView showOffState](self, "showOffState");
  -[HUQuickControlSliderView valueOverlayView](self, "valueOverlayView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOff:", v8);

  -[HUQuickControlSliderView _updateDecorationIconDescriptorAnimated:](self, "_updateDecorationIconDescriptorAnimated:", 0);
}

void __43__HUQuickControlSliderView__updateOffState__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredFillSection");

}

- (void)_prepareForTapticFeedback
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 3);
  -[HUQuickControlSliderView setFeedbackGenerator:](self, "setFeedbackGenerator:", v3);

  -[HUQuickControlSliderView feedbackGenerator](self, "feedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (void)_actuateTapticFeedback
{
  void *v3;
  id v4;

  -[HUQuickControlSliderView feedbackGenerator](self, "feedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "impactOccurred");

  -[HUQuickControlSliderView feedbackGenerator](self, "feedbackGenerator");
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
  -[HUQuickControlSliderView sliderValue](self, "sliderValue");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (void)setValue:(id)a3
{
  id v4;

  if (a3)
    v4 = a3;
  else
    v4 = &unk_1E7041788;
  objc_msgSend(v4, "doubleValue");
  -[HUQuickControlSliderView setSliderValue:](self, "setSliderValue:");
}

- (id)secondaryValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[HUQuickControlSliderView secondarySliderValue](self, "secondarySliderValue");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (void)setSecondaryValue:(id)a3
{
  id v4;

  if (a3)
    v4 = a3;
  else
    v4 = &unk_1E7041788;
  objc_msgSend(v4, "doubleValue");
  -[HUQuickControlSliderView setSecondarySliderValue:](self, "setSecondarySliderValue:");
}

- (void)setProfile:(id)a3
{
  HUQuickControlSliderViewProfile *v4;
  unint64_t v5;
  uint64_t v6;
  HUQuickControlSliderViewProfile *profile;

  v4 = (HUQuickControlSliderViewProfile *)a3;
  v5 = -[HUQuickControlViewProfile controlSize](self->_profile, "controlSize");
  v6 = -[HUQuickControlViewProfile controlSize](v4, "controlSize");
  profile = self->_profile;
  self->_profile = v4;

  -[HUQuickControlSliderView _updateOffState](self, "_updateOffState");
  -[HUQuickControlSliderView setNeedsLayout](self, "setNeedsLayout");
  if (v5 != v6)
    -[HUQuickControlSliderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlSliderView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 <= 2)
    -[HUQuickControlSliderView setAlpha:](self, "setAlpha:", dbl_1B9442CC8[a3]);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  -[HUQuickControlSliderView profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decorationIconDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v3 & ~-[HUQuickControlSliderView _createDecorationIconViewIfNecessary](self, "_createDecorationIconViewIfNecessary");
    -[HUQuickControlSliderView decorationIconView](self, "decorationIconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSliderView profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "decorationIconDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateWithIconDescriptor:displayStyle:animated:", v10, 3, v7);

    -[HUQuickControlSliderView profile](self, "profile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = HUIsLightColor(v12);

    if ((_DWORD)v9)
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayTintColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSliderView decorationIconView](self, "decorationIconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v15);

  }
  else
  {
    -[HUQuickControlSliderView decorationIconView](self, "decorationIconView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");

    -[HUQuickControlSliderView setDecorationIconView:](self, "setDecorationIconView:", 0);
  }
}

- (BOOL)_createDecorationIconViewIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HUQuickControlSliderView decorationIconView](self, "decorationIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D33720]);
    -[HUQuickControlSliderView setDecorationIconView:](self, "setDecorationIconView:", v4);

    -[HUQuickControlSliderView decorationIconView](self, "decorationIconView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayContext:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSliderView decorationIconView](self, "decorationIconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);

    -[HUQuickControlSliderView decorationIconView](self, "decorationIconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSliderView addSubview:](self, "addSubview:", v8);

    -[HUQuickControlSliderView setNeedsLayout](self, "setNeedsLayout");
  }
  return v3 == 0;
}

- (HUQuickControlSliderViewProfile)profile
{
  return self->_profile;
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (double)sliderValue
{
  return self->_sliderValue;
}

- (double)secondarySliderValue
{
  return self->_secondarySliderValue;
}

- (BOOL)showOffState
{
  return self->_showOffState;
}

- (void)setShowOffState:(BOOL)a3
{
  self->_showOffState = a3;
}

- (double)rawSliderValue
{
  return self->_rawSliderValue;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_borderView, a3);
}

- (HUQuickControlSliderValueOverlayView)valueOverlayView
{
  return self->_valueOverlayView;
}

- (void)setValueOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_valueOverlayView, a3);
}

- (NSLayoutConstraint)overlayTopConstraint
{
  return self->_overlayTopConstraint;
}

- (void)setOverlayTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_overlayTopConstraint, a3);
}

- (HUIconView)decorationIconView
{
  return self->_decorationIconView;
}

- (void)setDecorationIconView:(id)a3
{
  objc_storeStrong((id *)&self->_decorationIconView, a3);
}

- (double)primaryNormalizedValue
{
  return self->_primaryNormalizedValue;
}

- (void)setPrimaryNormalizedValue:(double)a3
{
  self->_primaryNormalizedValue = a3;
}

- (double)secondaryNormalizedValue
{
  return self->_secondaryNormalizedValue;
}

- (void)setSecondaryNormalizedValue:(double)a3
{
  self->_secondaryNormalizedValue = a3;
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_decorationIconView, 0);
  objc_storeStrong((id *)&self->_overlayTopConstraint, 0);
  objc_storeStrong((id *)&self->_valueOverlayView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
