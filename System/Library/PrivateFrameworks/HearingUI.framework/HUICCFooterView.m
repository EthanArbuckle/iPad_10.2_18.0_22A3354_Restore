@implementation HUICCFooterView

- (HUICCFooterView)initWithModule:(unint64_t)a3
{
  HUICCFooterView *v4;
  HUICCFooterView *v5;
  uint64_t v6;
  UIView *highlightedBackgroundView;
  uint64_t v8;
  UILabel *footerLabel;
  UILabel *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  UISelectionFeedbackGenerator *feedbackGenerator;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  _QWORD v53[12];

  v53[10] = *MEMORY[0x24BDAC8D0];
  v52.receiver = self;
  v52.super_class = (Class)HUICCFooterView;
  v4 = -[HUICCFooterView initWithFrame:](&v52, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v5 = v4;
  if (v4)
  {
    -[HUICCFooterView setModule:](v4, "setModule:", a3);
    objc_msgSend(MEMORY[0x24BE19B38], "_tertiaryView");
    v6 = objc_claimAutoreleasedReturnValue();
    highlightedBackgroundView = v5->_highlightedBackgroundView;
    v5->_highlightedBackgroundView = (UIView *)v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_highlightedBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAlpha:](v5->_highlightedBackgroundView, "setAlpha:", 0.0);
    -[HUICCFooterView addSubview:](v5, "addSubview:", v5->_highlightedBackgroundView);
    HUICCMenuTextLabel();
    v8 = objc_claimAutoreleasedReturnValue();
    footerLabel = v5->_footerLabel;
    v5->_footerLabel = (UILabel *)v8;

    v10 = v5->_footerLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    -[UILabel setNumberOfLines:](v5->_footerLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v5->_footerLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v5->_footerLabel, "setLineBreakMode:", 4);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_footerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUICCFooterView addSubview:](v5, "addSubview:", v5->_footerLabel);
    v41 = (void *)MEMORY[0x24BDD1628];
    -[UILabel leadingAnchor](v5->_footerLabel, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCFooterView leadingAnchor](v5, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    CCUILayoutGutter();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v49;
    -[UILabel trailingAnchor](v5->_footerLabel, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCFooterView trailingAnchor](v5, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    CCUILayoutGutter();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, -v12);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v46;
    -[UILabel topAnchor](v5->_footerLabel, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCFooterView topAnchor](v5, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v43;
    -[UILabel bottomAnchor](v5->_footerLabel, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCFooterView bottomAnchor](v5, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    CCUILayoutGutter();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v40, v13 * -0.25);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v39;
    -[UILabel heightAnchor](v5->_footerLabel, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintGreaterThanOrEqualToConstant:", 52.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v53[4] = v37;
    -[UILabel centerYAnchor](v5->_footerLabel, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCFooterView centerYAnchor](v5, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v53[5] = v34;
    -[UIView leadingAnchor](v5->_highlightedBackgroundView, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCFooterView leadingAnchor](v5, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v53[6] = v31;
    -[UIView trailingAnchor](v5->_highlightedBackgroundView, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCFooterView trailingAnchor](v5, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v53[7] = v15;
    -[UIView topAnchor](v5->_highlightedBackgroundView, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCFooterView topAnchor](v5, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v53[8] = v18;
    -[UIView bottomAnchor](v5->_highlightedBackgroundView, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCFooterView bottomAnchor](v5, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v53[9] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v22);

    -[HUICCFooterView setupFooterActionIfNecessary](v5, "setupFooterActionIfNecessary");
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v5, sel_footerTapped_);
    -[HUICCFooterView addGestureRecognizer:](v5, "addGestureRecognizer:", v23);
    v24 = objc_alloc(MEMORY[0x24BEBD940]);
    objc_msgSend(MEMORY[0x24BEBDD18], "lightConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "initWithConfiguration:view:", v25, v5);
    feedbackGenerator = v5->_feedbackGenerator;
    v5->_feedbackGenerator = (UISelectionFeedbackGenerator *)v26;

    HUICCBackgroundVisualStylingProviderForCategory(1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCFooterView setVisualStylingProvider:forCategory:](v5, "setVisualStylingProvider:forCategory:", v28, 1);

  }
  return v5;
}

- (void)setupFooterActionIfNecessary
{
  unint64_t v3;
  const __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v3 = -[HUICCFooterView module](self, "module");
  if (v3 == 22)
  {
    v4 = CFSTR("prefs:root=ACCESSIBILITY&path=HEARING_AID_TITLE");
  }
  else
  {
    if (v3 != 28)
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_9;
    }
    v4 = CFSTR("prefs:root=ACCESSIBILITY&path=AUDIO_VISUAL_TITLE/AXCSEnableSpecID#CSFeatureToggleSpecID");
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  hearingLocString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v5)
  {
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x24BEBD388];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__HUICCFooterView_setupFooterActionIfNecessary__block_invoke;
    v9[3] = &unk_24DD61440;
    objc_copyWeak(&v11, &location);
    v5 = v5;
    v10 = v5;
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v6, 0, v6, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCFooterView setFooterAction:](self, "setFooterAction:", v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
LABEL_9:

}

void __47__HUICCFooterView_setupFooterActionIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_openSettingsWithURL:", *(_QWORD *)(a1 + 32));

}

- (void)_openSettingsWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HUICCFooterView *v9;

  v4 = a3;
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__HUICCFooterView__openSettingsWithURL___block_invoke;
  v7[3] = &unk_24DD61050;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __40__HUICCFooterView__openSettingsWithURL___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  int v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  id v29;
  _QWORD v30[3];
  __int128 buf;
  uint64_t v32;
  void *v33;
  uint64_t *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x2020000000;
  v2 = (id *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  v33 = (void *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr)
  {
    v3 = (void *)FrontBoardServicesLibrary();
    v2 = (id *)dlsym(v3, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v2;
    getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&buf, 8);
  if (!v2)
    goto LABEL_18;
  v4 = *v2;
  v28[0] = v4;
  v5 = MEMORY[0x24BDBD1C8];
  v30[0] = MEMORY[0x24BDBD1C8];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x2020000000;
  v6 = (id *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  v33 = (void *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr)
  {
    v7 = (void *)FrontBoardServicesLibrary();
    v6 = (id *)dlsym(v7, "FBSOpenApplicationOptionKeyUnlockDevice");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v6;
    getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&buf, 8);
  if (!v6)
    goto LABEL_18;
  v8 = *v6;
  v28[1] = v8;
  v30[1] = v5;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x2020000000;
  v9 = (id *)getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr;
  v33 = (void *)getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr)
  {
    v10 = (void *)FrontBoardServicesLibrary();
    v9 = (id *)dlsym(v10, "FBSOpenApplicationOptionKeyLaunchOrigin");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v9;
    getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&buf, 8);
  if (!v9)
  {
LABEL_18:
    __40__HUICCFooterView__openSettingsWithURL___block_invoke_cold_1();
    __break(1u);
  }
  v29 = *v9;
  v30[2] = CFSTR("HUICCFooterView");
  v11 = (void *)MEMORY[0x24BDBCE70];
  v12 = v29;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v30, v28, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v14 = (void *)getLSApplicationWorkspaceClass_softClass;
  v27 = getLSApplicationWorkspaceClass_softClass;
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v32 = (uint64_t)__getLSApplicationWorkspaceClass_block_invoke;
    v33 = &unk_24DD61468;
    v34 = &v24;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)&buf);
    v14 = (void *)v25[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v15, "defaultWorkspace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(a1 + 32);
  v23 = 0;
  v18 = objc_msgSend(v16, "openSensitiveURL:withOptions:error:", v17, v13, &v23);
  v19 = v23;

  AXLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v18)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "footerLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_21A95E000, v21, OS_LOG_TYPE_DEFAULT, "[HearingCC] Open URL for %@", (uint8_t *)&buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    __40__HUICCFooterView__openSettingsWithURL___block_invoke_cold_4(a1, v21);
  }

}

- (void)setFooterAction:(id)a3
{
  UIAction **p_footerAction;
  id v6;
  void *v7;
  id v8;

  p_footerAction = &self->_footerAction;
  objc_storeStrong((id *)&self->_footerAction, a3);
  v6 = a3;
  -[HUICCFooterView footerLabel](self, "footerLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIAction title](*p_footerAction, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setText:", v7);
}

- (void)footerTapped:(id)a3
{
  void *v4;
  id v5;

  -[HUICCFooterView footerAction](self, "footerAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUICCFooterView footerAction](self, "footerAction");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performWithSender:target:", self, 0);

  }
}

- (id)contentValue
{
  return 0;
}

- (BOOL)enabled
{
  return 1;
}

- (BOOL)isHighlighted
{
  void *v2;
  double v3;
  BOOL v4;

  -[HUICCFooterView highlightedBackgroundView](self, "highlightedBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3 == 1.0;

  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  int v3;
  uint64_t v5;
  void *v6;
  int v7;
  double v8;
  void *v9;
  id v10;

  v3 = a3;
  -[HUICCFooterView footerAction](self, "footerAction");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[HUICCFooterView isHighlighted](self, "isHighlighted");

    if (v7 != v3)
    {
      v8 = 0.0;
      if (v3)
      {
        -[HUICCFooterView feedbackGenerator](self, "feedbackGenerator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "selectionChanged");

        v8 = 1.0;
      }
      -[HUICCFooterView highlightedBackgroundView](self, "highlightedBackgroundView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", v8);

    }
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[HUICCFooterView setHighlighted:](self, "setHighlighted:", 1, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[HUICCFooterView setHighlighted:](self, "setHighlighted:", 0, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[HUICCFooterView setHighlighted:](self, "setHighlighted:", 0, a4);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDF00];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[HUICCFooterView footerLabel](self, "footerLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_24DD6B308;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v10[4];
  id v11;
  HUICCFooterView *v12;

  v6 = a3;
  -[HUICCFooterView requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56__HUICCFooterView_setVisualStylingProvider_forCategory___block_invoke;
    v10[3] = &unk_24DD61050;
    v11 = v6;
    v12 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

  }
}

void __56__HUICCFooterView_setVisualStylingProvider_forCategory___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "footerLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "automaticallyUpdateView:withStyle:", v2, 0);

}

- (HACCContentModuleDelegate)delegate
{
  return (HACCContentModuleDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (unint64_t)module
{
  return self->module;
}

- (void)setModule:(unint64_t)a3
{
  self->module = a3;
}

- (UIAction)footerAction
{
  return self->_footerAction;
}

- (UIView)highlightedBackgroundView
{
  return self->_highlightedBackgroundView;
}

- (void)setHighlightedBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundView, a3);
}

- (UILabel)footerLabel
{
  return self->_footerLabel;
}

- (void)setFooterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footerLabel, a3);
}

- (UISelectionFeedbackGenerator)feedbackGenerator
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
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);
  objc_storeStrong((id *)&self->_footerAction, 0);
  objc_destroyWeak((id *)&self->delegate);
}

uint64_t __40__HUICCFooterView__openSettingsWithURL___block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __40__HUICCFooterView__openSettingsWithURL___block_invoke_cold_4(v0);
}

void __40__HUICCFooterView__openSettingsWithURL___block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "footerLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_21A95E000, a2, OS_LOG_TYPE_ERROR, "[HearingCC] Failed to open URL for %@", (uint8_t *)&v4, 0xCu);

}

@end
