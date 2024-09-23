@implementation HUQuickControlStepperView

- (HUQuickControlStepperView)initWithProfile:(id)a3
{
  id v5;
  HUQuickControlStepperView *v6;
  HUQuickControlStepperView *v7;
  id v8;
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
  void *v22;
  objc_super v23;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlStepperView.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[profile isKindOfClass:[HUQuickControlStepperViewProfile class]]"));

  }
  v23.receiver = self;
  v23.super_class = (Class)HUQuickControlStepperView;
  v6 = -[HUQuickControlStepperView init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    -[HUQuickControlStepperView setProfile:](v6, "setProfile:", v5);
    -[HUQuickControlStepperView setReachabilityState:](v7, "setReachabilityState:", 0);
    v8 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[HUQuickControlStepperView setBackgroundView:](v7, "setBackgroundView:", v8);

    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    {
      objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryMaterial");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAutoresizingMask:", 18);
      -[HUQuickControlStepperView backgroundView](v7, "backgroundView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "quaternarySystemFillColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlStepperView backgroundView](v7, "backgroundView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v9);
    }

    -[HUQuickControlStepperView backgroundView](v7, "backgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMasksToBounds:", 1);

    -[HUQuickControlStepperView backgroundView](v7, "backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAutoresizingMask:", 18);

    -[HUQuickControlStepperView backgroundView](v7, "backgroundView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlStepperView addSubview:](v7, "addSubview:", v14);

    -[HUQuickControlStepperView _createSegmentAndSeparatorViews](v7, "_createSegmentAndSeparatorViews");
    -[HUQuickControlStepperView layer](v7, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsGroupOpacity:", 0);

    -[HUQuickControlStepperView layer](v7, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsGroupBlending:", 0);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v7, sel__handleGesture_);
    -[HUQuickControlStepperView setGestureRecognizer:](v7, "setGestureRecognizer:", v17);

    -[HUQuickControlStepperView gestureRecognizer](v7, "gestureRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", v7);

    -[HUQuickControlStepperView gestureRecognizer](v7, "gestureRecognizer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMinimumPressDuration:", 0.0);

    -[HUQuickControlStepperView gestureRecognizer](v7, "gestureRecognizer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlStepperView addGestureRecognizer:](v7, "addGestureRecognizer:", v20);

    -[HUQuickControlStepperView _prepareForTapticFeedback](v7, "_prepareForTapticFeedback");
  }

  return v7;
}

- (void)setProfile:(id)a3
{
  HUQuickControlStepperViewProfile *v4;
  unint64_t v5;
  uint64_t v6;
  HUQuickControlStepperViewProfile *profile;

  v4 = (HUQuickControlStepperViewProfile *)a3;
  v5 = -[HUQuickControlViewProfile controlSize](self->_profile, "controlSize");
  v6 = -[HUQuickControlViewProfile controlSize](v4, "controlSize");
  profile = self->_profile;
  self->_profile = v4;

  -[HUQuickControlStepperView setNeedsLayout](self, "setNeedsLayout");
  if (v5 != v6)
    -[HUQuickControlStepperView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_createSegmentAndSeparatorViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  HUQuickControlStepperSeparatorView *v10;
  void *v11;
  void *v12;
  HUQuickControlStepperSegmentView *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HUQuickControlStepperSegmentView *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[6];

  v30 = (id)objc_opt_new();
  v28 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  -[HUQuickControlStepperView profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSegments");

  if (v5)
  {
    v6 = 0;
    do
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __60__HUQuickControlStepperView__createSegmentAndSeparatorViews__block_invoke;
      v31[3] = &unk_1E6F52488;
      v31[4] = self;
      v31[5] = v6;
      v7 = __60__HUQuickControlStepperView__createSegmentAndSeparatorViews__block_invoke((uint64_t)v31);
      if (v7)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0CEABE8]);
        if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
        {
          objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterKeyLineOnDarkVibrancyEffect");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setEffect:", v9);

        }
        v10 = objc_alloc_init(HUQuickControlStepperSeparatorView);
        objc_msgSend(v8, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", v10);

        -[HUQuickControlStepperView backgroundView](self, "backgroundView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSubview:", v8);

        objc_msgSend(v28, "addObject:", v10);
        objc_msgSend(v3, "addObject:", v8);
        objc_msgSend(v8, "setTag:", v6);

      }
      v13 = [HUQuickControlStepperSegmentView alloc];
      -[HUQuickControlStepperView profile](self, "profile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "stepperStyle");
      -[HUQuickControlStepperView profile](self, "profile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "orientation");
      -[HUQuickControlStepperView profile](self, "profile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HUQuickControlStepperSegmentView initWithStyle:orientation:controlSize:](v13, "initWithStyle:orientation:controlSize:", v15, v17, objc_msgSend(v18, "controlSize"));

      -[HUQuickControlStepperSegmentView setTag:](v19, "setTag:", v6);
      -[HUQuickControlStepperSegmentView setSegmentLocation:](v19, "setSegmentLocation:", v7);
      -[HUQuickControlStepperView profile](self, "profile");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "showSegmentTitles");

      if (v21)
      {
        -[HUQuickControlStepperView profile](self, "profile");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "segmentTitles");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", v6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlStepperSegmentView setTitle:](v19, "setTitle:", v24);

      }
      -[HUQuickControlStepperView backgroundView](self, "backgroundView", v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addSubview:", v19);

      objc_msgSend(v30, "addObject:", v19);
      ++v6;
      -[HUQuickControlStepperView profile](self, "profile");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "numberOfSegments");

    }
    while (v6 < v27);
  }
  -[HUQuickControlStepperView setSegmentViews:](self, "setSegmentViews:", v30, v28);
  -[HUQuickControlStepperView setSeparatorViews:](self, "setSeparatorViews:", v29);
  -[HUQuickControlStepperView setSeparatorEffectViews:](self, "setSeparatorEffectViews:", v3);

}

uint64_t __60__HUQuickControlStepperView__createSegmentAndSeparatorViews__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (!v1)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSegments") - 1;

  if (v1 == v3)
    return 2;
  else
    return 1;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  id v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)HUQuickControlStepperView;
  -[HUQuickControlStepperView layoutSubviews](&v29, sel_layoutSubviews);
  -[HUQuickControlStepperView _layoutSegmentViews](self, "_layoutSegmentViews");
  -[HUQuickControlStepperView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlStepperView _stepperViewMetricsForControlSize:](self, "_stepperViewMetricsForControlSize:", objc_msgSend(v3, "controlSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cornerRadius");
  v6 = v5;

  -[HUQuickControlStepperView backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContinuousCornerRadius:", v6);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HUQuickControlStepperView segmentViews](self, "segmentViews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    v12 = fmax(v6 + -8.0, 0.0);
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "setCornerRadius:", v12);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  -[HUQuickControlStepperView profile](self, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "stepperStyle");

  if (v15 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend(v22, "CGColor");
    -[HUQuickControlStepperView layer](self, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBorderColor:", v23);

    -[HUQuickControlStepperView layer](self, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = 1.0;
    goto LABEL_12;
  }
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "CGColor");
    -[HUQuickControlStepperView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBorderColor:", v17);

    -[HUQuickControlStepperView layer](self, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = 0.0;
LABEL_12:
    objc_msgSend(v19, "setBorderWidth:", v21);

  }
  -[HUQuickControlStepperView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:", -[HUQuickControlStepperView reachabilityState](self, "reachabilityState"));
}

- (void)_layoutSegmentViews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[13];
  _QWORD v19[4];

  -[HUQuickControlStepperView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSegments");

  if (v4)
  {
    -[HUQuickControlStepperView profile](self, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlStepperView intrinsicSizeDescriptorForControlSize:](self, "intrinsicSizeDescriptorForControlSize:", objc_msgSend(v5, "controlSize"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intrinsicSize");
    v8 = v7;
    v10 = v9;

    -[HUQuickControlStepperView profile](self, "profile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "orientation"))
      v12 = v8;
    else
      v12 = v10;

    UIRoundToViewScale();
    v14 = v13;
    UIFloorToViewScale();
    v16 = v15;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    -[HUQuickControlStepperView segmentViews](self, "segmentViews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __48__HUQuickControlStepperView__layoutSegmentViews__block_invoke;
    v18[3] = &unk_1E6F5CB58;
    v18[6] = v14;
    v18[7] = v4;
    v18[8] = v16;
    v18[9] = v4 - 1;
    v18[4] = self;
    v18[5] = v19;
    v18[10] = v8;
    v18[11] = v10;
    v18[12] = v12;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v18);

    _Block_object_dispose(v19, 8);
  }
}

void __48__HUQuickControlStepperView__layoutSegmentViews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double MaxY;
  double v20;
  double *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  id v36;
  CGRect v37;

  v36 = a2;
  v5 = 0.0;
  if (*(_QWORD *)(a1 + 56) - 1 == a3)
    v5 = *(double *)(a1 + 64);
  v6 = *(double *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 72);
  if (v7 <= a3)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "separatorViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1 + 72);
  }
  v10 = (double *)MEMORY[0x1E0C9D648];
  if (v7 <= a3)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "separatorEffectViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = v10[1];
  v14 = v6 + v5;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "orientation");

  if (v16 == 2)
  {
    v28 = *(_QWORD *)(a1 + 40);
    v21 = (double *)(a1 + 40);
    v29 = *(_QWORD *)(v28 + 8);
    v30 = *(double *)(v29 + 24);
    v31 = v21[6];
    v32 = v21[7] - v30 - v14;
    *(double *)(v29 + 24) = v14 + v30;
    objc_msgSend(v36, "setFrame:", v32, v13, v14, v31);
    v20 = v32 + -1.0;
LABEL_15:
    v35 = v21[6];
    v17 = v35 * 0.5;
    MaxY = (v35 - v35 * 0.5) * 0.5;
    v18 = 1.0;
    goto LABEL_16;
  }
  if (v16 == 1)
  {
    v33 = *(_QWORD *)(a1 + 40);
    v21 = (double *)(a1 + 40);
    v34 = *(_QWORD *)(v33 + 8);
    v20 = v14 + *(double *)(v34 + 24);
    *(double *)(v34 + 24) = v20;
    objc_msgSend(v36, "setFrame:");
    goto LABEL_15;
  }
  v17 = 0.0;
  v18 = 0.0;
  MaxY = 0.0;
  v20 = 0.0;
  if (!v16)
  {
    v22 = *(_QWORD *)(a1 + 40);
    v21 = (double *)(a1 + 40);
    v23 = *v10;
    v24 = *(_QWORD *)(v22 + 8);
    v25 = *(double *)(v24 + 24);
    v26 = v21[5];
    *(double *)(v24 + 24) = v14 + v25;
    objc_msgSend(v36, "setFrame:", v23, v25, v26, v14);
    v37.origin.x = v23;
    v37.origin.y = v25;
    v37.size.width = v26;
    v37.size.height = v14;
    MaxY = CGRectGetMaxY(v37);
    v27 = v21[5];
    v18 = v27 * 0.5;
    v20 = (v27 - v27 * 0.5) * 0.5;
    v17 = 1.0;
LABEL_16:
    *(double *)(*(_QWORD *)(*(_QWORD *)v21 + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)v21 + 8) + 24) + 1.0;
  }
  objc_msgSend(v12, "setFrame:", v20, MaxY, v18, v17);
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v18, v17);

}

- (void)_handleGesture:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  HUQuickControlStepperView *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HUQuickControlStepperView conformsToProtocol:](self, "conformsToProtocol:", &unk_1EF285200)
    && (objc_opt_respondsToSelector() & 1) != 0
    && (!-[HUQuickControlStepperView reachabilityState](self, "reachabilityState")
     || -[HUQuickControlStepperView reachabilityState](self, "reachabilityState") == 1))
  {
    HUQuickControlReachabilityString(-[HUQuickControlStepperView reachabilityState](self, "reachabilityState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 138412802;
      v32 = self;
      v33 = 2112;
      v34 = v5;
      v35 = 2080;
      v36 = "-[HUQuickControlStepperView _handleGesture:]";
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Control view %@ is in state %@. Ignoring long press gesture in %s.", (uint8_t *)&v31, 0x20u);
    }

  }
  else
  {
    v7 = objc_msgSend(v4, "state");
    -[HUQuickControlStepperView gestureRecognizer](self, "gestureRecognizer");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(v7 - 1) > 1)
    {
      if (v7 == 3)
      {
        -[HUQuickControlStepperView trackingSegmentIndex](self, "trackingSegmentIndex");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          -[HUQuickControlStepperView selectedSegmentIndex](self, "selectedSegmentIndex");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlStepperView trackingSegmentIndex](self, "trackingSegmentIndex");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "isEqual:", v26);

          -[HUQuickControlStepperView trackingSegmentIndex](self, "trackingSegmentIndex");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlStepperView setSelectedSegmentIndex:](self, "setSelectedSegmentIndex:", v28);

          if ((v27 & 1) == 0)
          {
            -[HUQuickControlStepperView interactionDelegate](self, "interactionDelegate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUQuickControlStepperView value](self, "value");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "controlView:valueDidChange:", self, v30);

          }
        }
      }
      -[HUQuickControlStepperView _updateUserInteractionActive:forFirstTouch:](self, "_updateUserInteractionActive:forFirstTouch:", 0, v8 != v4);
      -[HUQuickControlStepperView setTrackingSegmentIndex:](self, "setTrackingSegmentIndex:", 0);
      -[HUQuickControlStepperView setAccumulatedTouchDistance:](self, "setAccumulatedTouchDistance:", 0.0);
      -[HUQuickControlStepperView setLastTouchLocation:](self, "setLastTouchLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      -[HUQuickControlStepperView _updateSegmentHighlightedState](self, "_updateSegmentHighlightedState");
      -[HUQuickControlStepperView _actuateTapticFeedback](self, "_actuateTapticFeedback");
    }
    else
    {
      -[HUQuickControlStepperView _updateUserInteractionActive:forFirstTouch:](self, "_updateUserInteractionActive:forFirstTouch:", 1, v8 != v4);
      objc_msgSend(v4, "locationInView:", self);
      v10 = v9;
      v12 = v11;
      if (!-[HUQuickControlStepperView _shouldRequireMinimumDragDistanceForGestureRecognizer:](self, "_shouldRequireMinimumDragDistanceForGestureRecognizer:", v4))goto LABEL_16;
      -[HUQuickControlStepperView lastTouchLocation](self, "lastTouchLocation");
      if (v14 != *MEMORY[0x1E0C9D538] || v13 != *(double *)(MEMORY[0x1E0C9D538] + 8))
      {
        -[HUQuickControlStepperView lastTouchLocation](self, "lastTouchLocation");
        UIDistanceBetweenPoints();
        v17 = v16;
        -[HUQuickControlStepperView accumulatedTouchDistance](self, "accumulatedTouchDistance");
        -[HUQuickControlStepperView setAccumulatedTouchDistance:](self, "setAccumulatedTouchDistance:", v17 + v18);
      }
      -[HUQuickControlStepperView setLastTouchLocation:](self, "setLastTouchLocation:", v10, v12);
      -[HUQuickControlStepperView accumulatedTouchDistance](self, "accumulatedTouchDistance");
      if (v19 >= 25.0)
      {
LABEL_16:
        -[HUQuickControlStepperView hitTest:withEvent:](self, "hitTest:withEvent:", 0, v10, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v21 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "tag"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[HUQuickControlStepperView trackingSegmentIndex](self, "trackingSegmentIndex");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqual:", v21);

        if ((v23 & 1) == 0)
        {
          -[HUQuickControlStepperView setTrackingSegmentIndex:](self, "setTrackingSegmentIndex:", v21);
          -[HUQuickControlStepperView _updateSegmentHighlightedState](self, "_updateSegmentHighlightedState");
        }

      }
    }
  }

}

- (void)_updateSegmentHighlightedState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__HUQuickControlStepperView__updateSegmentHighlightedState__block_invoke;
  v2[3] = &unk_1E6F4D988;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v2, 0.15);
}

void __59__HUQuickControlStepperView__updateSegmentHighlightedState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "trackingSegmentIndex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedSegmentIndex");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  if (objc_msgSend(*(id *)(a1 + 32), "reachabilityState") == 1 || !objc_msgSend(*(id *)(a1 + 32), "reachabilityState"))
  {
    v8 = 1;
    v6 = v5;
    v5 = 0;
    goto LABEL_9;
  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "segmentViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "integerValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsSegmentViewHighlighted:", 1);

    v8 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v8 = 1;
LABEL_10:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "segmentViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if ((v8 & 1) == 0)
        {
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "tag");
          if (v15 == objc_msgSend(v5, "integerValue"))
            continue;
        }
        objc_msgSend(v14, "setIsSegmentViewHighlighted:", 0);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "separatorEffectViews", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        if ((v8 & 1) != 0)
        {
          v22 = 0;
        }
        else
        {
          v23 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "tag");
          if (v23 == objc_msgSend(v5, "integerValue"))
          {
            v22 = 1;
          }
          else
          {
            v24 = objc_msgSend(v21, "tag");
            v22 = v24 == objc_msgSend(v5, "integerValue") + 1;
          }
        }
        objc_msgSend(v21, "setHidden:", v22);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

}

- (BOOL)_shouldRequireMinimumDragDistanceForGestureRecognizer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUQuickControlStepperView gestureRecognizer](self, "gestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 != v4;
}

- (void)_updateUserInteractionActive:(BOOL)a3 forFirstTouch:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  if (-[HUQuickControlStepperView isUserInteractionActive](self, "isUserInteractionActive") != a3)
  {
    -[HUQuickControlStepperView setUserInteractionActive:](self, "setUserInteractionActive:", v5);
    -[HUQuickControlStepperView interactionDelegate](self, "interactionDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "controlView:interactionStateDidChange:forFirstTouch:", self, v5, v4);

  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD aBlock[4];
  id v21;
  HUQuickControlStepperView *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HUQuickControlStepperView;
  -[HUQuickControlStepperView updateConstraints](&v23, sel_updateConstraints);
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlStepperView constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HUQuickControlStepperView_updateConstraints__block_invoke;
  aBlock[3] = &unk_1E6F4EC90;
  v21 = v5;
  v22 = self;
  v6 = v5;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[HUQuickControlStepperView backgroundView](self, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);

  -[HUQuickControlStepperView profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlStepperView intrinsicSizeDescriptorForControlSize:](self, "intrinsicSizeDescriptorForControlSize:", objc_msgSend(v9, "controlSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intrinsicSize");
  v12 = v11;
  v14 = v13;

  -[HUQuickControlStepperView widthAnchor](self, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HUQuickControlStepperView heightAnchor](self, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v6);
  -[HUQuickControlStepperView setConstraints:](self, "setConstraints:", v6);
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlStepperView;
  -[HUQuickControlStepperView updateConstraints](&v19, sel_updateConstraints);

}

void __46__HUQuickControlStepperView_updateConstraints__block_invoke(uint64_t a1, void *a2)
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

- (id)_stepperViewMetricsForControlSize:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[HUQuickControlStepperView profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "orientation");
  -[HUQuickControlStepperView profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HUQuickControlStepperViewMetricsForOrientation(a3, v6, objc_msgSend(v7, "numberOfSegments"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[HUQuickControlStepperView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "controlSize");
  -[HUQuickControlStepperView profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "orientation");
  -[HUQuickControlStepperView profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HUQuickControlStepperViewMetricsForOrientation(v4, v6, objc_msgSend(v7, "numberOfSegments"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intrinsicSize");
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)_prepareForTapticFeedback
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 3);
  -[HUQuickControlStepperView setFeedbackGenerator:](self, "setFeedbackGenerator:", v3);

  -[HUQuickControlStepperView feedbackGenerator](self, "feedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (void)_actuateTapticFeedback
{
  void *v3;
  id v4;

  -[HUQuickControlStepperView feedbackGenerator](self, "feedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "impactOccurred");

  -[HUQuickControlStepperView feedbackGenerator](self, "feedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[HUQuickControlStepperView _stepperViewMetricsForControlSize:](self, "_stepperViewMetricsForControlSize:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_opt_class();
  v10 = v4;
  if (!v10)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v10;
  else
    v6 = 0;
  v7 = v10;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

LABEL_7:
    v7 = 0;
  }

  -[HUQuickControlStepperView setSelectedSegmentIndex:](self, "setSelectedSegmentIndex:", v7);
  -[HUQuickControlStepperView _updateSegmentHighlightedState](self, "_updateSegmentHighlightedState");

}

- (void)setReachabilityState:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_reachabilityState = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HUQuickControlStepperView segmentViews](self, "segmentViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setReachabilityState:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[HUQuickControlStepperView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:", a3);
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  objc_msgSend(a3, "addTarget:action:", self, sel__handleGesture_);
}

- (void)tintColorDidChange
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlStepperView;
  -[HUQuickControlStepperView tintColorDidChange](&v5, sel_tintColorDidChange);
  -[HUQuickControlStepperView segmentViews](self, "segmentViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__HUQuickControlStepperView_tintColorDidChange__block_invoke;
  v4[3] = &unk_1E6F5CB80;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __47__HUQuickControlStepperView_tintColorDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "profile");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  uint64_t v4;
  double v5;

  if (a3 < 2)
  {
    v4 = 0;
    v5 = 0.5;
LABEL_5:
    -[HUQuickControlStepperView setAlpha:](self, "setAlpha:", v5);
    -[HUQuickControlStepperView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v4);
    goto LABEL_6;
  }
  if (a3 == 2)
  {
    v4 = 1;
    v5 = 1.0;
    goto LABEL_5;
  }
LABEL_6:
  -[HUQuickControlStepperView _updateSegmentHighlightedState](self, "_updateSegmentHighlightedState");
}

- (HUQuickControlViewInteractionDelegate)interactionDelegate
{
  return (HUQuickControlViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (HUQuickControlStepperViewProfile)profile
{
  return self->_profile;
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (NSArray)segmentViews
{
  return self->_segmentViews;
}

- (void)setSegmentViews:(id)a3
{
  objc_storeStrong((id *)&self->_segmentViews, a3);
}

- (NSArray)separatorViews
{
  return self->_separatorViews;
}

- (void)setSeparatorViews:(id)a3
{
  objc_storeStrong((id *)&self->_separatorViews, a3);
}

- (NSArray)separatorEffectViews
{
  return self->_separatorEffectViews;
}

- (void)setSeparatorEffectViews:(id)a3
{
  objc_storeStrong((id *)&self->_separatorEffectViews, a3);
}

- (NSNumber)selectedSegmentIndex
{
  return self->_selectedSegmentIndex;
}

- (void)setSelectedSegmentIndex:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSegmentIndex, a3);
}

- (UILongPressGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (CGPoint)lastTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastTouchLocation.x;
  y = self->_lastTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastTouchLocation:(CGPoint)a3
{
  self->_lastTouchLocation = a3;
}

- (double)accumulatedTouchDistance
{
  return self->_accumulatedTouchDistance;
}

- (void)setAccumulatedTouchDistance:(double)a3
{
  self->_accumulatedTouchDistance = a3;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (NSNumber)trackingSegmentIndex
{
  return self->_trackingSegmentIndex;
}

- (void)setTrackingSegmentIndex:(id)a3
{
  objc_storeStrong((id *)&self->_trackingSegmentIndex, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
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
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_trackingSegmentIndex, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectedSegmentIndex, 0);
  objc_storeStrong((id *)&self->_separatorEffectViews, 0);
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_segmentViews, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
}

@end
