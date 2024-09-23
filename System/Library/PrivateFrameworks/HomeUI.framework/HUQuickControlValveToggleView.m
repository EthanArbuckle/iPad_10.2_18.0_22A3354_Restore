@implementation HUQuickControlValveToggleView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)intrinsicSizeDescriptor
{
  return +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 4, 54.0, 54.0);
}

- (HUQuickControlValveToggleView)initWithProfile:(id)a3
{
  id v5;
  HUQuickControlValveToggleView *v6;
  HUQuickControlValveToggleView *v7;
  HUCircleView *v8;
  HUCircleView *circleView;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlValveToggleView;
  v6 = -[HUQuickControlValveToggleView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    v8 = (HUCircleView *)objc_alloc_init(MEMORY[0x1E0D33710]);
    circleView = v7->_circleView;
    v7->_circleView = v8;

    -[HUQuickControlValveToggleView naui_addAutoLayoutSubview:](v7, "naui_addAutoLayoutSubview:", v7->_circleView);
    -[HUQuickControlValveToggleView _setupIconView](v7, "_setupIconView");
    -[HUQuickControlValveToggleView _updateAppearance](v7, "_updateAppearance");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v7, sel__handleTap_);
    -[HUQuickControlValveToggleView addGestureRecognizer:](v7, "addGestureRecognizer:", v10);

  }
  return v7;
}

- (UIColor)backgroundOnColor
{
  if (_MergedGlobals_3_10 != -1)
    dispatch_once(&_MergedGlobals_3_10, &__block_literal_global_6_3);
  return (UIColor *)(id)qword_1EF226C48;
}

void __50__HUQuickControlValveToggleView_backgroundOnColor__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  HUColorNamed(CFSTR("HUQuickControlValveToggleViewBackgroundColorOn"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EF226C48;
  qword_1EF226C48 = v0;

}

- (UIColor)backgroundOffColor
{
  id v2;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_1EF226C50 != -1)
      dispatch_once(&qword_1EF226C50, &__block_literal_global_11_6);
    v2 = (id)qword_1EF226C58;
  }
  return (UIColor *)v2;
}

void __51__HUQuickControlValveToggleView_backgroundOffColor__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  HUColorNamed(CFSTR("HUQuickControlValveToggleViewBackgroundColorOff"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EF226C58;
  qword_1EF226C58 = v0;

}

- (void)_setupIconView
{
  HUIconView *v3;
  HUIconView *iconView;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (HUIconView *)objc_alloc_init(MEMORY[0x1E0D33720]);
  iconView = self->_iconView;
  self->_iconView = v3;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    v5 = 2;
  else
    v5 = 1;
  v6 = (void *)MEMORY[0x1E0CEABA8];
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectForBlurEffect:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconView setVibrancyEffect:](self->_iconView, "setVibrancyEffect:", v8);

  -[HUQuickControlValveToggleView _updateIconDescriptor](self, "_updateIconDescriptor");
  -[HUQuickControlValveToggleView naui_addAutoLayoutSubview:](self, "naui_addAutoLayoutSubview:", self->_iconView);
  -[HUQuickControlValveToggleView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlValveToggleView;
  -[HUQuickControlValveToggleView updateConstraints](&v12, sel_updateConstraints);
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlValveToggleView iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlValveToggleView layoutMarginsGuide](self, "layoutMarginsGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlValveToggleView circleView](self, "circleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v8, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_arrayByFlattening");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v11);

}

- (void)_handleTap:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  HUQuickControlValveToggleView *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HUQuickControlValveToggleView conformsToProtocol:](self, "conformsToProtocol:", &unk_1EF285200)
    && (objc_opt_respondsToSelector() & 1) != 0
    && (!-[HUQuickControlValveToggleView reachabilityState](self, "reachabilityState")
     || -[HUQuickControlValveToggleView reachabilityState](self, "reachabilityState") == 1))
  {
    HUQuickControlReachabilityString(-[HUQuickControlValveToggleView reachabilityState](self, "reachabilityState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412802;
      v10 = self;
      v11 = 2112;
      v12 = v5;
      v13 = 2080;
      v14 = "-[HUQuickControlValveToggleView _handleTap:]";
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Control view %@ is in state %@. Ignoring tap gesture in %s", (uint8_t *)&v9, 0x20u);
    }

  }
  else if (objc_msgSend(v4, "state") == 3)
  {
    -[HUQuickControlValveToggleView setOpen:](self, "setOpen:", -[HUQuickControlValveToggleView open](self, "open") ^ 1);
    -[HUQuickControlValveToggleView setUserInteractionActive:](self, "setUserInteractionActive:", 1);
    -[HUQuickControlValveToggleView interactionDelegate](self, "interactionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUQuickControlValveToggleView open](self, "open"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "controlView:valueDidChange:", self, v8);

    -[HUQuickControlValveToggleView setUserInteractionActive:](self, "setUserInteractionActive:", 0);
  }

}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
  -[HUQuickControlValveToggleView _updateAppearance](self, "_updateAppearance");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 54.0;
  v3 = 54.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setUserInteractionActive:(BOOL)a3
{
  _BOOL4 userInteractionActive;
  id v5;

  userInteractionActive = self->_userInteractionActive;
  self->_userInteractionActive = a3;
  if (userInteractionActive != a3)
  {
    -[HUQuickControlValveToggleView interactionDelegate](self, "interactionDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controlView:interactionStateDidChange:forFirstTouch:", self, self->_userInteractionActive, 0);

  }
}

- (void)_updateAppearance
{
  void *v3;
  void *v4;

  if (-[HUQuickControlValveToggleView open](self, "open"))
    -[HUQuickControlValveToggleView backgroundOnColor](self, "backgroundOnColor");
  else
    -[HUQuickControlValveToggleView backgroundOffColor](self, "backgroundOffColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlValveToggleView circleView](self, "circleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HUQuickControlValveToggleView _updateIconDescriptor](self, "_updateIconDescriptor");
}

- (void)_updateIconDescriptor
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (-[HUQuickControlValveToggleView open](self, "open"))
    v3 = 1;
  else
    v3 = 2;
  -[HUQuickControlValveToggleView iconView](self, "iconView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlValveToggleView profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decorationIconDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithIconDescriptor:displayStyle:animated:", v5, v3, 0);

}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
  -[HUQuickControlValveToggleView _updateIconDescriptor](self, "_updateIconDescriptor");
}

- (id)value
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUQuickControlValveToggleView open](self, "open"));
}

- (void)setValue:(id)a3
{
  -[HUQuickControlValveToggleView setOpen:](self, "setOpen:", objc_msgSend(a3, "BOOLValue"));
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlValveToggleView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 <= 2)
    -[HUQuickControlValveToggleView setAlpha:](self, "setAlpha:", dbl_1B9443138[a3]);
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "intrinsicSizeDescriptor");
}

- (HUQuickControlViewProfile)profile
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

- (BOOL)open
{
  return self->_open;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (HUCircleView)circleView
{
  return self->_circleView;
}

- (void)setCircleView:(id)a3
{
  objc_storeStrong((id *)&self->_circleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
