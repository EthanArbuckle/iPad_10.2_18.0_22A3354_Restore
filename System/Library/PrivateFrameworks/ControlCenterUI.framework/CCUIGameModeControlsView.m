@implementation CCUIGameModeControlsView

- (CCUIGameModeControlsView)initWithProvider:(id)a3 activityData:(id)a4 frame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  CCUIGameModeControlsView *v13;
  CCUIGameModeControlsView *v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  CCUILabeledRoundButtonViewController *buttonViewController;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CCUIControlTemplateView *templateView;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  objc_super v55;
  _QWORD v56[4];
  _QWORD v57[3];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v57[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v55.receiver = self;
  v55.super_class = (Class)CCUIGameModeControlsView;
  v13 = -[CCUIGameModeControlsView initWithFrame:](&v55, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_gameModeActivityDataProvider, v11);
    objc_msgSend(v12, "bundleIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    v53 = v12;
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    v14->_state = objc_msgSend(v11, "stateForBundleIdentifier:", v14->_bundleIdentifier);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIGameModeControlsView layer](v14, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFilters:", v18);

    -[SBFView setAnimatedLayerProperties:](v14, "setAnimatedLayerProperties:", &unk_1E8D188C0);
    -[CCUIGameModeControlsView setClipsToBounds:](v14, "setClipsToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, *MEMORY[0x1E0DC1438]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v51, 3);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("gamecontroller.fill"), v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x1E0D147B0]);
    v54 = v11;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v19, "initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:", v49, v20, v21, 1);

    objc_msgSend(v22, "setEnabled:", 1);
    objc_msgSend(v22, "setInoperative:", 1);
    objc_msgSend(v22, "setLabelsVisible:", 0);
    objc_msgSend(v22, "setToggleStateOnTap:", 0);
    objc_msgSend(v22, "setDynamicLayoutEnabled:", 1);
    objc_msgSend(v22, "setContentSizeCategoryThreshold:", *MEMORY[0x1E0DC4900]);
    buttonViewController = v14->_buttonViewController;
    v14->_buttonViewController = (CCUILabeledRoundButtonViewController *)v22;
    v48 = v22;

    CCUIPortraitMainListGridGeometryInfo();
    v25 = v24;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D147A8]), "initWithFrame:", 0.0, 0.0, width, v24);
    objc_msgSend(MEMORY[0x1E0D14790], "controlCenterDarkMaterial");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBackgroundView:", v27);

    objc_msgSend(v48, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCustomGlyphView:", v28);

    objc_msgSend(v26, "setGridSizeClass:", 3);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_GAME_MODE"), &stru_1E8D00320, CFSTR("ControlCenterUI"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTitle:", v30);

    CCUIPortraitMainListGridGeometryInfo();
    CCUILayoutGutter();
    CCUICompactModuleContinuousCornerRadiusForGridSizeClass();
    objc_msgSend(v26, "setContinuousCornerRadius:");
    objc_msgSend(v26, "setDelegate:", v14);
    templateView = v14->_templateView;
    v14->_templateView = (CCUIControlTemplateView *)v26;
    v32 = v26;

    -[CCUIGameModeControlsView updateState](v14, "updateState");
    -[CCUIGameModeControlsView setFrame:](v14, "setFrame:", x, y, width, v25);
    -[CCUIGameModeControlsView addSubview:](v14, "addSubview:", v32);
    v42 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v32, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIGameModeControlsView topAnchor](v14, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v45;
    objc_msgSend(v32, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIGameModeControlsView bottomAnchor](v14, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v33;
    objc_msgSend(v32, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIGameModeControlsView leadingAnchor](v14, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v36;
    objc_msgSend(v32, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIGameModeControlsView trailingAnchor](v14, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "activateConstraints:", v40);

    v11 = v54;
    v12 = v53;

  }
  return v14;
}

- (void)updateState
{
  id WeakRetained;
  uint64_t v4;
  CCUIControlTemplateView *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  CCUIControlTemplateView *templateView;
  void *v12;
  const __CFString *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_gameModeActivityDataProvider);
  v4 = objc_msgSend(WeakRetained, "gameModeState");

  if (v4 == 4)
  {
    templateView = self->_templateView;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    v13 = CFSTR("CONTROL_CENTER_GAME_MODE_STATE_FORCED_ON");
LABEL_6:
    objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_1E8D00320, CFSTR("ControlCenterUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIControlTemplateView setSubtitle:](templateView, "setSubtitle:", v9);
    v10 = 1;
LABEL_7:

    -[CCUILabeledRoundButtonViewController setUseAlternateBackground:](self->_buttonViewController, "setUseAlternateBackground:", v10);
    return;
  }
  if (!v4)
  {
    v5 = self->_templateView;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("CONTROL_CENTER_GAME_MODE_STATE_FORCED_OFF");
LABEL_4:
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E8D00320, CFSTR("ControlCenterUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIControlTemplateView setSubtitle:](v5, "setSubtitle:", v9);
    v10 = 0;
    goto LABEL_7;
  }
  switch(self->_state)
  {
    case 0:
      v5 = self->_templateView;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("CONTROL_CENTER_GAME_MODE_STATE_UNAVAILABLE");
      goto LABEL_4;
    case 1:
      v5 = self->_templateView;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("CONTROL_CENTER_GAME_MODE_STATE_OFF");
      goto LABEL_4;
    case 2:
      templateView = self->_templateView;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;
      v13 = CFSTR("CONTROL_CENTER_GAME_MODE_STATE_ON");
      goto LABEL_6;
    case 3:
      templateView = self->_templateView;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;
      v13 = CFSTR("CONTROL_CENTER_GAME_MODE_STATE_REQUIRED");
      goto LABEL_6;
    case 4:
      v5 = self->_templateView;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("CONTROL_CENTER_GAME_MODE_STATE_UNKNOWN");
      goto LABEL_4;
    default:
      return;
  }
}

- (void)setGameModeActivityDataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_gameModeActivityDataProvider, a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  CCUIControlTemplateView *templateView;
  void *v9;
  CCUIControlTemplateView *v10;
  CCUIControlTemplateView *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  templateView = self->_templateView;
  -[CCUIGameModeControlsView convertPoint:toView:](self, "convertPoint:toView:", templateView, x, y);
  -[CCUIControlTemplateView hitTest:withEvent:](templateView, "hitTest:withEvent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = self->_templateView;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CCUIGameModeControlsView;
    -[CCUIGameModeControlsView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v10 = (CCUIControlTemplateView *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (BOOL)performPrimaryActionForControlTemplateView:(id)a3
{
  id v4;
  void *state;
  BOOL v6;
  int64_t v7;
  id WeakRetained;
  id v9;
  int64_t v10;
  NSString *bundleIdentifier;
  _QWORD v13[4];
  id v14[2];
  id location;

  v4 = a3;
  state = (void *)self->_state;
  v6 = 0;
  v7 = 2;
  switch((unint64_t)state)
  {
    case 0uLL:
    case 3uLL:
    case 4uLL:
      goto LABEL_7;
    case 1uLL:
      goto LABEL_3;
    case 2uLL:
      v7 = 1;
LABEL_3:
      self->_state = v7;
      goto LABEL_4;
    default:
LABEL_4:
      WeakRetained = objc_loadWeakRetained((id *)&self->_gameModeActivityDataProvider);

      if (WeakRetained)
      {
        objc_initWeak(&location, self);
        v9 = objc_loadWeakRetained((id *)&self->_gameModeActivityDataProvider);
        v10 = self->_state;
        bundleIdentifier = self->_bundleIdentifier;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __71__CCUIGameModeControlsView_performPrimaryActionForControlTemplateView___block_invoke;
        v13[3] = &unk_1E8CFCF18;
        objc_copyWeak(v14, &location);
        v14[1] = state;
        objc_msgSend(v9, "setWithState:forBundleIdentifier:callback:", v10, bundleIdentifier, v13);

        objc_destroyWeak(v14);
        objc_destroyWeak(&location);
      }
      -[CCUIGameModeControlsView updateState](self, "updateState");
      v6 = 1;
LABEL_7:

      return v6;
  }
}

void __71__CCUIGameModeControlsView_performPrimaryActionForControlTemplateView___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD block[4];
  id v6[3];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CCUIGameModeControlsView_performPrimaryActionForControlTemplateView___block_invoke_2;
  block[3] = &unk_1E8CFCEF0;
  objc_copyWeak(v6, (id *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  v6[1] = a2;
  v6[2] = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v6);
}

void __71__CCUIGameModeControlsView_performPrimaryActionForControlTemplateView___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3 == 5)
      v3 = *(_QWORD *)(a1 + 48);
    WeakRetained[56] = v3;
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "updateState");
    WeakRetained = v4;
  }

}

- (void)setBlurRadius:(double)a3
{
  void *v4;
  id v5;

  -[CCUIGameModeControlsView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (CGRect)cachedExpandedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->cachedExpandedRect.origin.x;
  y = self->cachedExpandedRect.origin.y;
  width = self->cachedExpandedRect.size.width;
  height = self->cachedExpandedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->cachedExpandedRect = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider)gameModeActivityDataProvider
{
  return (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *)objc_loadWeakRetained((id *)&self->_gameModeActivityDataProvider);
}

- (CCUIControlTemplateView)templateView
{
  return self->_templateView;
}

- (void)setTemplateView:(id)a3
{
  objc_storeStrong((id *)&self->_templateView, a3);
}

- (CCUILabeledRoundButtonViewController)buttonViewController
{
  return self->_buttonViewController;
}

- (void)setButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_buttonViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonViewController, 0);
  objc_storeStrong((id *)&self->_templateView, 0);
  objc_destroyWeak((id *)&self->_gameModeActivityDataProvider);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
