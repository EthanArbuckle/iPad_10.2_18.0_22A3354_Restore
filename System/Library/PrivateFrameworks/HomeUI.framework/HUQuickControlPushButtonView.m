@implementation HUQuickControlPushButtonView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlPushButtonView)initWithProfile:(id)a3
{
  id v5;
  HUQuickControlPushButtonView *v6;
  HUQuickControlPushButtonView *v7;
  HUQuickControlRoundButton *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HUQuickControlPushButtonView;
  v6 = -[HUQuickControlPushButtonView init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_userInteractionActive = 0;
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    v8 = objc_alloc_init(HUQuickControlRoundButton);
    -[HUQuickControlPushButtonView setRoundButton:](v7, "setRoundButton:", v8);

    -[HUQuickControlPushButtonView roundButton](v7, "roundButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPushButtonView addSubview:](v7, "addSubview:", v9);

    v10 = objc_alloc_init(MEMORY[0x1E0D33720]);
    -[HUQuickControlPushButtonView setDecorationIconView:](v7, "setDecorationIconView:", v10);

    -[HUQuickControlPushButtonView decorationIconView](v7, "decorationIconView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentMode:", 1);

    -[HUQuickControlPushButtonView decorationIconView](v7, "decorationIconView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPushButtonView addSubview:](v7, "addSubview:", v12);

    -[HUQuickControlPushButtonView descriptionText](v7, "descriptionText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CEA700]);
      -[HUQuickControlPushButtonView setButtonLabel:](v7, "setButtonLabel:", v14);

      -[HUQuickControlPushButtonView buttonLabel](v7, "buttonLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPushButtonView addSubview:](v7, "addSubview:", v15);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v7, sel_handleTap_);
    -[HUQuickControlPushButtonView setLongPressGestureRecognizer:](v7, "setLongPressGestureRecognizer:", v17);

    -[HUQuickControlPushButtonView longPressGestureRecognizer](v7, "longPressGestureRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMinimumPressDuration:", 0.0);

    -[HUQuickControlPushButtonView longPressGestureRecognizer](v7, "longPressGestureRecognizer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPushButtonView addGestureRecognizer:](v7, "addGestureRecognizer:", v19);

    -[HUQuickControlPushButtonView _prepareForTapticFeedback](v7, "_prepareForTapticFeedback");
    LODWORD(v20) = 1148846080;
    -[HUQuickControlPushButtonView setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 0, v20);
    LODWORD(v21) = 1148846080;
    -[HUQuickControlPushButtonView setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 1, v21);
  }

  return v7;
}

- (void)handleTap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  HUQuickControlPushButtonView *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HUQuickControlPushButtonView reachabilityState](self, "reachabilityState") == 2
    || (v5 = (void *)MEMORY[0x1E0CBA1A8],
        -[HUQuickControlPushButtonView profile](self, "profile"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v5) = objc_msgSend(v5, "hf_isSuspendedStateSupported:", objc_msgSend(v6, "suspendedState")),
        v6,
        (v5 & 1) != 0))
  {
    v7 = objc_msgSend(v4, "state");
    if ((unint64_t)(v7 - 4) >= 2)
    {
      if (v7 != 3)
      {
        if (v7 != 1)
        {
LABEL_13:
          -[HUQuickControlPushButtonView setNeedsLayout](self, "setNeedsLayout");
          goto LABEL_14;
        }
        -[HUQuickControlPushButtonView setUserInteractionActive:](self, "setUserInteractionActive:", 1);
        -[HUQuickControlPushButtonView interactionDelegate](self, "interactionDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "controlView:interactionStateDidChange:forFirstTouch:", self, 1, 0);

        -[HUQuickControlPushButtonView _animateToEnlargeView](self, "_animateToEnlargeView");
        v9 = 0.5;
LABEL_12:
        -[HUQuickControlPushButtonView _actuateTapticFeedbackWithIntensity:](self, "_actuateTapticFeedbackWithIntensity:", v9);
        goto LABEL_13;
      }
      -[HUQuickControlPushButtonView setControlState:](self, "setControlState:", -[HUQuickControlPushButtonView controlState](self, "controlState") != 1);
      -[HUQuickControlPushButtonView interactionDelegate](self, "interactionDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUQuickControlPushButtonView controlState](self, "controlState"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "controlView:valueDidChange:", self, v14);

    }
    -[HUQuickControlPushButtonView interactionDelegate](self, "interactionDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "controlView:interactionStateDidChange:forFirstTouch:", self, 1, 0);

    -[HUQuickControlPushButtonView setUserInteractionActive:](self, "setUserInteractionActive:", 0);
    -[HUQuickControlPushButtonView _animateToShrinkView](self, "_animateToShrinkView");
    v9 = 1.0;
    goto LABEL_12;
  }
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[HUQuickControlPushButtonView reachabilityState](self, "reachabilityState");
    -[HUQuickControlPushButtonView profile](self, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = self;
    v18 = 2048;
    v19 = v11;
    v20 = 2048;
    v21 = objc_msgSend(v12, "suspendedState");
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@: Ignoring tap gesture for reachabilityState %lu and suspendedState %lu", (uint8_t *)&v16, 0x20u);

  }
LABEL_14:

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)HUQuickControlPushButtonView;
  -[HUQuickControlPushButtonView layoutSubviews](&v50, sel_layoutSubviews);
  -[HUQuickControlPushButtonView bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[HUQuickControlPushButtonView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  -[HUQuickControlPushButtonView intrinsicContentSize](self, "intrinsicContentSize");
  v7 = v6;
  v9 = v8;
  -[HUQuickControlPushButtonView roundButton](self, "roundButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0.0;
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v7, v9);

  -[HUQuickControlPushButtonView roundButton](self, "roundButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;

  -[HUQuickControlPushButtonView profile](self, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "controlSize");

  if (v16 <= 3)
    v11 = dbl_1B9442960[v16];
  -[HUQuickControlPushButtonView decorationIconView](self, "decorationIconView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", 0.0, 0.0, v14 * v11, v14 * v11);

  -[HUQuickControlPushButtonView profile](self, "profile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[HUQuickControlUtilities iconSizeForQuickControlSize:](HUQuickControlUtilities, "iconSizeForQuickControlSize:", objc_msgSend(v18, "controlSize"));
  -[HUQuickControlPushButtonView decorationIconView](self, "decorationIconView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIconSize:", v19);

  -[HUQuickControlPushButtonView roundButton](self, "roundButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "center");
  v23 = v22;
  v25 = v24;
  -[HUQuickControlPushButtonView decorationIconView](self, "decorationIconView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCenter:", v23, v25);

  -[HUQuickControlPushButtonView buttonLabel](self, "buttonLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPushButtonView buttonLabel](self, "buttonLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFont:", v28);

    -[HUQuickControlPushButtonView descriptionText](self, "descriptionText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPushButtonView buttonLabel](self, "buttonLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setText:", v30);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPushButtonView buttonLabel](self, "buttonLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTextColor:", v32);

    -[HUQuickControlPushButtonView buttonLabel](self, "buttonLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTextAlignment:", 1);

    -[HUQuickControlPushButtonView buttonLabel](self, "buttonLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "sizeToFit");

    -[HUQuickControlPushButtonView buttonLabel](self, "buttonLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setNumberOfLines:", 3);

    -[HUQuickControlPushButtonView roundButton](self, "roundButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "center");
    v39 = v38;
    -[HUQuickControlPushButtonView roundButton](self, "roundButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "center");
    v42 = v41;
    -[HUQuickControlPushButtonView roundButton](self, "roundButton");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");
    v45 = v42 + v44 * 0.5 + 14.0;

    -[HUQuickControlPushButtonView buttonLabel](self, "buttonLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "frame");
    v48 = v47;
    -[HUQuickControlPushButtonView buttonLabel](self, "buttonLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setFrame:", v39 - v14 * 0.5, v45, v14, v48);

  }
  -[HUQuickControlPushButtonView _updateUI](self, "_updateUI");
  -[HUQuickControlPushButtonView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:", -[HUQuickControlPushButtonView reachabilityState](self, "reachabilityState"));
}

- (void)_updateUI
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (-[HUQuickControlPushButtonView controlState](self, "controlState") == 1
    || (-[HUQuickControlPushButtonView profile](self, "profile"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "toggleColorScheme"),
        v3,
        (v4 & 1) == 0))
  {
    -[HUQuickControlPushButtonView profile](self, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPushButtonView roundButton](self, "roundButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[HUQuickControlPushButtonView roundButton](self, "roundButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "controlCenterMaterialView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "quaternarySystemFillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPushButtonView roundButton](self, "roundButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    -[HUQuickControlPushButtonView roundButton](self, "roundButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "controlCenterMaterialView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v10;
  -[HUQuickControlPushButtonView decorationIconView](self, "decorationIconView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTintColor:", v15);

  -[HUQuickControlPushButtonView _updateDecorationIconDescriptorAnimated:](self, "_updateDecorationIconDescriptorAnimated:", 0);
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

  -[HUQuickControlPushButtonView profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HUQuickControlPushButtonMetricsForControlSize(objc_msgSend(v2, "controlSize"));
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

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPushButtonView buttonLabel](self, "buttonLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  -[HUQuickControlPushButtonView setNeedsLayout](self, "setNeedsLayout");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlPushButtonView;
  -[HUQuickControlPushButtonView dealloc](&v4, sel_dealloc);
}

- (void)_updateDecorationIconDescriptorAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[HUQuickControlPushButtonView decorationIconView](self, "decorationIconView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPushButtonView profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decorationIconDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWithIconDescriptor:displayStyle:animated:", v6, 3, v3);

}

- (void)_animateToEnlargeView
{
  __int128 v3;
  _QWORD v4[5];
  CGAffineTransform t2;
  CGAffineTransform t1;

  -[HUQuickControlPushButtonView transform](self, "transform");
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&t2.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&t2.c = v3;
  *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (CGAffineTransformEqualToTransform(&t1, &t2)
    && -[HUQuickControlPushButtonView reachabilityState](self, "reachabilityState") == 2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__HUQuickControlPushButtonView__animateToEnlargeView__block_invoke;
    v4[3] = &unk_1E6F4D988;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0x10000, v4, 0, 0.2, 0.0);
  }
}

uint64_t __53__HUQuickControlPushButtonView__animateToEnlargeView__block_invoke(uint64_t a1)
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
  CGAffineTransformScale(&v7, &v6, 1.1, 1.1);
  v5 = v7;
  return objc_msgSend(v3, "setTransform:", &v5);
}

- (void)_animateToShrinkView
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__HUQuickControlPushButtonView__animateToShrinkView__block_invoke;
  v2[3] = &unk_1E6F4D988;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0x10000, v2, 0, 0.2, 0.0);
}

uint64_t __52__HUQuickControlPushButtonView__animateToShrinkView__block_invoke(uint64_t a1)
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

- (void)_prepareForTapticFeedback
{
  id v3;
  id v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA660]);
  -[HUQuickControlPushButtonView setFeedbackGenerator:](self, "setFeedbackGenerator:", v3);

  -[HUQuickControlPushButtonView feedbackGenerator](self, "feedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (void)_actuateTapticFeedbackWithIntensity:(double)a3
{
  void *v5;
  id v6;

  -[HUQuickControlPushButtonView feedbackGenerator](self, "feedbackGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "impactOccurredWithIntensity:", a3);

  -[HUQuickControlPushButtonView feedbackGenerator](self, "feedbackGenerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepare");

}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  void *v3;
  void *v4;

  HUQuickControlPushButtonMetricsForControlSize(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setProfile:(id)a3
{
  HUQuickControlPushButtonViewProfile *v4;
  unint64_t v5;
  uint64_t v6;
  HUQuickControlPushButtonViewProfile *profile;

  v4 = (HUQuickControlPushButtonViewProfile *)a3;
  v5 = -[HUQuickControlViewProfile controlSize](self->_profile, "controlSize");
  v6 = -[HUQuickControlViewProfile controlSize](v4, "controlSize");
  profile = self->_profile;
  self->_profile = v4;

  if (v5 != v6)
  {
    -[HUQuickControlPushButtonView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[HUQuickControlPushButtonView setNeedsLayout](self, "setNeedsLayout");
  }
  -[HUQuickControlPushButtonView _updateUI](self, "_updateUI");
}

- (id)value
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUQuickControlPushButtonView controlState](self, "controlState"));
}

- (void)setValue:(id)a3
{
  -[HUQuickControlPushButtonView setControlState:](self, "setControlState:", (int)objc_msgSend(a3, "intValue"));
  -[HUQuickControlPushButtonView _updateUI](self, "_updateUI");
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlPushButtonView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;

  if (a3 >= 2)
  {
    if (a3 != 2)
      return;
    goto LABEL_5;
  }
  v4 = (void *)MEMORY[0x1E0CBA1A8];
  -[HUQuickControlPushButtonView profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hf_isSuspendedStateSupported:", objc_msgSend(v5, "suspendedState"));

  if ((_DWORD)v6)
  {
LABEL_5:
    v6 = 1;
    v7 = 1.0;
    goto LABEL_6;
  }
  v7 = 0.5;
LABEL_6:
  -[HUQuickControlPushButtonView setAlpha:](self, "setAlpha:", v7);
  -[HUQuickControlPushButtonView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v6);
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

- (HUQuickControlPushButtonViewProfile)profile
{
  return self->_profile;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (HUQuickControlRoundButton)roundButton
{
  return self->_roundButton;
}

- (void)setRoundButton:(id)a3
{
  objc_storeStrong((id *)&self->_roundButton, a3);
}

- (HUIconView)decorationIconView
{
  return self->_decorationIconView;
}

- (void)setDecorationIconView:(id)a3
{
  objc_storeStrong((id *)&self->_decorationIconView, a3);
}

- (UILabel)buttonLabel
{
  return self->_buttonLabel;
}

- (void)setButtonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_buttonLabel, a3);
}

- (unint64_t)controlState
{
  return self->_controlState;
}

- (void)setControlState:(unint64_t)a3
{
  self->_controlState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonLabel, 0);
  objc_storeStrong((id *)&self->_decorationIconView, 0);
  objc_storeStrong((id *)&self->_roundButton, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
}

@end
