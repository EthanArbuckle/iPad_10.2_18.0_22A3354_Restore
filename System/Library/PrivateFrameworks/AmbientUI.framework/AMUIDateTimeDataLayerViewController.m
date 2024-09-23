@implementation AMUIDateTimeDataLayerViewController

- (void)setChromeOrientationPolicy:(int64_t)a3
{
  id v3;

  self->_chromeOrientationPolicy = a3;
  -[AMUIDateTimeDataLayerViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateConstraints");

}

- (void)setDateProvider:(id)a3
{
  AMUIDateProviding **p_dateProvider;
  id v6;

  p_dateProvider = &self->_dateProvider;
  objc_storeStrong((id *)&self->_dateProvider, a3);
  v6 = a3;
  -[AMUIDateTimeViewController setDateProvider:](self->_dateTimeViewController, "setDateProvider:", *p_dateProvider);

}

- (UIView)viewForOpacityAdjustment
{
  return -[AMUIDateTimeViewController viewForOpacityAdjustment](self->_dateTimeViewController, "viewForOpacityAdjustment");
}

- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  _QWORD v30[5];
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 buf;
  void *v38;
  void *v39;
  uint64_t *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v32 = 0;
  objc_msgSend(v6, "pr_loadTitleStyleConfigurationWithError:", &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v32;
  v10 = MEMORY[0x24BDAC760];
  if (!v8)
  {
    AMUILogDataLayer();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_23600A000, v11, OS_LOG_TYPE_INFO, "Failed to load poster title style configuration (will use default style) %@", (uint8_t *)&buf, 0xCu);
    }

    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v12 = (void *)getPRMutablePosterTitleStyleConfigurationClass_softClass;
    v36 = getPRMutablePosterTitleStyleConfigurationClass_softClass;
    if (!getPRMutablePosterTitleStyleConfigurationClass_softClass)
    {
      *(_QWORD *)&buf = v10;
      *((_QWORD *)&buf + 1) = 3221225472;
      v38 = __getPRMutablePosterTitleStyleConfigurationClass_block_invoke;
      v39 = &unk_2507634B8;
      v40 = &v33;
      __getPRMutablePosterTitleStyleConfigurationClass_block_invoke((uint64_t)&buf);
      v12 = (void *)v34[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v33, 8);
    v14 = objc_alloc_init(v13);
    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v15 = (void *)getPRPosterColorClass_softClass;
    v36 = getPRPosterColorClass_softClass;
    if (!getPRPosterColorClass_softClass)
    {
      *(_QWORD *)&buf = v10;
      *((_QWORD *)&buf + 1) = 3221225472;
      v38 = __getPRPosterColorClass_block_invoke;
      v39 = &unk_2507634B8;
      v40 = &v33;
      __getPRPosterColorClass_block_invoke((uint64_t)&buf);
      v15 = (void *)v34[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v33, 8);
    v17 = [v16 alloc];
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "colorWithAlphaComponent:", 0.9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithColor:preferredStyle:", v19, 2);

    objc_msgSend(v14, "setTitleColor:", v20);
    v8 = (void *)objc_msgSend(v14, "copy");

  }
  objc_msgSend(v6, "pr_posterProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v21, 0);
    objc_msgSend(v22, "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v8, "vibrancyConfigurationWithExtensionBundleURL:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
  }
  else
  {
    AMUILogDataLayer();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[AMUIDateTimeDataLayerViewController updatePosterConfiguration:withAnimationSettings:].cold.2((uint64_t)v6, v25);

  }
  AMUILogDataLayer();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    -[AMUIDateTimeDataLayerViewController updatePosterConfiguration:withAnimationSettings:].cold.1((uint64_t)v6, v26);

  objc_msgSend(v8, "vibrancyConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v27 = (void *)MEMORY[0x24BE0BF08];
  v30[0] = v10;
  v30[1] = 3221225472;
  v30[2] = __87__AMUIDateTimeDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke;
  v30[3] = &unk_250763400;
  v30[4] = self;
  v31 = v24;
  v28 = v24;
  objc_msgSend(v27, "animateWithSettings:actions:", v7, v30);

  return 1;
}

uint64_t __87__AMUIDateTimeDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setVibrancyConfiguration:", *(_QWORD *)(a1 + 40));
}

- (NSDictionary)activeConfigurationMetadata
{
  return 0;
}

- (BOOL)handleDismiss
{
  return 0;
}

- (void)loadView
{
  AMUITouchPassthroughView *v3;

  v3 = objc_alloc_init(AMUITouchPassthroughView);
  -[AMUIDateTimeDataLayerViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  AMUIDateTimeViewController *v3;
  void *v4;
  void *v5;
  AMUIDateTimeViewController *dateTimeViewController;
  AMUIDateTimeViewController *v7;
  UILayoutGuide *v8;
  UILayoutGuide *nominalSafeAreaLayoutGuide;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *nominalSafeAreaTopConstraint;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *nominalSafeAreaBottomConstraint;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *nominalSafeAreaLeftConstraint;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *nominalSafeAreaRightConstraint;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *dateTimeLeadingEdgeConstraint;
  void *v30;
  void *v31;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *dateTimeTrailingEdgeConstraint;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *dateTimeLeftEdgeConstraint;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *dateTimeRightEdgeConstraint;
  AMUIDateTimeViewController *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  AMUIDateTimeDataLayerViewController *v48;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)AMUIDateTimeDataLayerViewController;
  -[AMUIDateTimeDataLayerViewController viewDidLoad](&v49, sel_viewDidLoad);
  v3 = objc_alloc_init(AMUIDateTimeViewController);
  -[AMUIDateTimeViewController setDateProvider:](v3, "setDateProvider:", self->_dateProvider);
  -[AMUIDateTimeDataLayerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIDateTimeViewController view](v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  dateTimeViewController = self->_dateTimeViewController;
  self->_dateTimeViewController = v3;
  v7 = v3;

  v8 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
  nominalSafeAreaLayoutGuide = self->_nominalSafeAreaLayoutGuide;
  self->_nominalSafeAreaLayoutGuide = v8;

  objc_msgSend(v4, "addLayoutGuide:", self->_nominalSafeAreaLayoutGuide);
  -[UILayoutGuide topAnchor](self->_nominalSafeAreaLayoutGuide, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 0.0);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  nominalSafeAreaTopConstraint = self->_nominalSafeAreaTopConstraint;
  self->_nominalSafeAreaTopConstraint = v12;

  -[UILayoutGuide bottomAnchor](self->_nominalSafeAreaLayoutGuide, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  nominalSafeAreaBottomConstraint = self->_nominalSafeAreaBottomConstraint;
  self->_nominalSafeAreaBottomConstraint = v16;

  -[UILayoutGuide leftAnchor](self->_nominalSafeAreaLayoutGuide, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 0.0);
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  nominalSafeAreaLeftConstraint = self->_nominalSafeAreaLeftConstraint;
  self->_nominalSafeAreaLeftConstraint = v20;

  -[UILayoutGuide rightAnchor](self->_nominalSafeAreaLayoutGuide, "rightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 0.0);
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  nominalSafeAreaRightConstraint = self->_nominalSafeAreaRightConstraint;
  self->_nominalSafeAreaRightConstraint = v24;

  objc_msgSend(v5, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_nominalSafeAreaLayoutGuide, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  dateTimeLeadingEdgeConstraint = self->_dateTimeLeadingEdgeConstraint;
  self->_dateTimeLeadingEdgeConstraint = v28;

  objc_msgSend(v5, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_nominalSafeAreaLayoutGuide, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  dateTimeTrailingEdgeConstraint = self->_dateTimeTrailingEdgeConstraint;
  self->_dateTimeTrailingEdgeConstraint = v32;

  objc_msgSend(v5, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leftAnchor](self->_nominalSafeAreaLayoutGuide, "leftAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  dateTimeLeftEdgeConstraint = self->_dateTimeLeftEdgeConstraint;
  self->_dateTimeLeftEdgeConstraint = v36;

  objc_msgSend(v5, "rightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide rightAnchor](self->_nominalSafeAreaLayoutGuide, "rightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  dateTimeRightEdgeConstraint = self->_dateTimeRightEdgeConstraint;
  self->_dateTimeRightEdgeConstraint = v40;

  v42 = self->_dateTimeViewController;
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __50__AMUIDateTimeDataLayerViewController_viewDidLoad__block_invoke;
  v45[3] = &unk_250763428;
  v46 = v5;
  v47 = v4;
  v48 = self;
  v43 = v4;
  v44 = v5;
  -[AMUIDateTimeDataLayerViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v42, 0, v45);

}

void __50__AMUIDateTimeDataLayerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1628];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 34.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v9 = *(_QWORD **)(a1 + 48);
  v12[1] = v9[123];
  v12[2] = v9[124];
  v12[3] = v9[125];
  v12[4] = v9[126];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v10);

  objc_msgSend(*(id *)(a1 + 48), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsUpdateConstraints");

  v5[2](v5);
}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUIDateTimeDataLayerViewController;
  -[AMUIDateTimeDataLayerViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  -[AMUIDateTimeDataLayerViewController _updateNominalSafeAreaGuide](self, "_updateNominalSafeAreaGuide");
  -[AMUIDateTimeDataLayerViewController _updateDateTimeConstraintsForChromeOrientation](self, "_updateDateTimeConstraintsForChromeOrientation");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillMoveToWindow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMUIDateTimeDataLayerViewController;
  -[AMUIDateTimeDataLayerViewController viewWillMoveToWindow:](&v5, sel_viewWillMoveToWindow_, a3);
  -[AMUIDateTimeDataLayerViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConstraints");

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMUIDateTimeDataLayerViewController;
  -[AMUIDateTimeDataLayerViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v10, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDF8030];
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BDF8030], 0);
  if (v6)
  {
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__noteWindowWillRotate_, v8, v6);
    -[AMUIDateTimeDataLayerViewController viewIfLoaded](self, "viewIfLoaded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsUpdateConstraints");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __90__AMUIDateTimeDataLayerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_250763450;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, &__block_literal_global_0);
}

uint64_t __90__AMUIDateTimeDataLayerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateNominalSafeAreaGuide");
}

- (void)_updateNominalSafeAreaGuide
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[AMUIDateTimeDataLayerViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "safeAreaInsets");
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v4 = *MEMORY[0x24BDF7718];
    v6 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v8 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v10 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  -[NSLayoutConstraint setConstant:](self->_nominalSafeAreaTopConstraint, "setConstant:", v4);
  -[NSLayoutConstraint setConstant:](self->_nominalSafeAreaBottomConstraint, "setConstant:", -v8);
  -[NSLayoutConstraint setConstant:](self->_nominalSafeAreaLeftConstraint, "setConstant:", v6);
  -[NSLayoutConstraint setConstant:](self->_nominalSafeAreaRightConstraint, "setConstant:", -v10);

}

- (void)_updateDateTimeConstraintsForChromeOrientation
{
  void *v3;
  id v4;

  -[AMUIDateTimeDataLayerViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIDateTimeDataLayerViewController _updateDateTimeConstraintsForChromeOrientationWithInterfaceOrientation:](self, "_updateDateTimeConstraintsForChromeOrientationWithInterfaceOrientation:", objc_msgSend(v3, "_windowInterfaceOrientation"));

}

- (void)_updateDateTimeConstraintsForChromeOrientationWithInterfaceOrientation:(int64_t)a3
{
  int64_t chromeOrientationPolicy;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v10;
  _BOOL8 v11;

  chromeOrientationPolicy = self->_chromeOrientationPolicy;
  v5 = a3 == 4;
  v6 = a3 != 4;
  if (a3 == 3)
    v5 = 0;
  v7 = a3 == 3;
  if (a3 == 3)
    v6 = 0;
  v8 = chromeOrientationPolicy == 2 && v5;
  v9 = chromeOrientationPolicy == 2 && v7;
  if (chromeOrientationPolicy == 2)
    v10 = v6;
  else
    v10 = chromeOrientationPolicy != 1;
  v11 = chromeOrientationPolicy != 2 && chromeOrientationPolicy == 1;
  -[NSLayoutConstraint setActive:](self->_dateTimeLeftEdgeConstraint, "setActive:", v8);
  -[NSLayoutConstraint setActive:](self->_dateTimeRightEdgeConstraint, "setActive:", v9);
  -[NSLayoutConstraint setActive:](self->_dateTimeLeadingEdgeConstraint, "setActive:", v10);
  -[NSLayoutConstraint setActive:](self->_dateTimeTrailingEdgeConstraint, "setActive:", v11);
}

- (void)_noteWindowWillRotate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF8018]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = (void *)MEMORY[0x24BDF6F90];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__AMUIDateTimeDataLayerViewController__noteWindowWillRotate___block_invoke;
  v12[3] = &unk_250763400;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "performWithoutAnimation:", v12);

}

uint64_t __61__AMUIDateTimeDataLayerViewController__noteWindowWillRotate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDateTimeConstraintsForChromeOrientationWithInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
}

- (int64_t)chromeOrientationPolicy
{
  return self->_chromeOrientationPolicy;
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_dateTimeRightEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_dateTimeLeftEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_dateTimeTrailingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_dateTimeLeadingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_nominalSafeAreaRightConstraint, 0);
  objc_storeStrong((id *)&self->_nominalSafeAreaLeftConstraint, 0);
  objc_storeStrong((id *)&self->_nominalSafeAreaBottomConstraint, 0);
  objc_storeStrong((id *)&self->_nominalSafeAreaTopConstraint, 0);
  objc_storeStrong((id *)&self->_nominalSafeAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_dateTimeViewController, 0);
}

- (void)updatePosterConfiguration:(uint64_t)a1 withAnimationSettings:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_23600A000, a2, OS_LOG_TYPE_FAULT, "Unable to find extension bundle URL for config %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)updatePosterConfiguration:(uint64_t)a1 withAnimationSettings:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23600A000, a2, OS_LOG_TYPE_ERROR, "Missing poster provider from the poster configuration %@", (uint8_t *)&v2, 0xCu);
}

@end
