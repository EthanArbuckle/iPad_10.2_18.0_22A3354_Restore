@implementation AMUIDataLayerViewController

- (void)setChromeVisibility:(BOOL)a3 withAnimationSettings:(id)a4 animationFence:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  BOOL v14;

  v12 = a4;
  if (a5)
  {
    v8 = a5;
    -[AMUIDataLayerViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "_synchronizeDrawingWithFence:", v8);
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__AMUIDataLayerViewController_setChromeVisibility_withAnimationSettings_animationFence___block_invoke;
  v13[3] = &unk_250763960;
  v13[4] = self;
  v14 = a3;
  objc_msgSend(MEMORY[0x24BE0BF08], "animateWithSettings:actions:", v12, v13);

}

void __88__AMUIDataLayerViewController_setChromeVisibility_withAnimationSettings_animationFence___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewForOpacityAdjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v3 = 0.0;
  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);

}

- (void)setChromeOrientationPolicy:(int64_t)a3
{
  AMUIAmbientViewControlling *concreteDataLayerViewController;
  uint64_t v5;
  AMUIAmbientViewControlling *v6;
  AMUIAmbientViewControlling *v7;
  AMUIAmbientViewControlling *v8;

  self->_chromeOrientationPolicy = a3;
  concreteDataLayerViewController = self->_concreteDataLayerViewController;
  v5 = objc_opt_class();
  v6 = concreteDataLayerViewController;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  -[AMUIAmbientViewControlling setChromeOrientationPolicy:](v8, "setChromeOrientationPolicy:", self->_chromeOrientationPolicy);
}

- (void)setDateProvider:(id)a3
{
  AMUIDateProviding **p_dateProvider;
  AMUIAmbientViewControlling *concreteDataLayerViewController;
  uint64_t v7;
  AMUIAmbientViewControlling *v8;
  AMUIAmbientViewControlling *v9;
  AMUIAmbientViewControlling *v10;
  id v11;

  v11 = a3;
  p_dateProvider = &self->_dateProvider;
  objc_storeStrong((id *)&self->_dateProvider, a3);
  concreteDataLayerViewController = self->_concreteDataLayerViewController;
  v7 = objc_opt_class();
  v8 = concreteDataLayerViewController;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  -[AMUIAmbientViewControlling setDateProvider:](v10, "setDateProvider:", *p_dateProvider);
}

- (int64_t)currentDataLayout
{
  void *v2;

  v2 = (void *)objc_opt_class();
  return objc_msgSend(v2, "_dataLayoutForDataLayerClass:", objc_opt_class());
}

+ (int64_t)dataLayoutForConfiguration:(id)a3
{
  return objc_msgSend(a1, "_dataLayoutForDataLayerClass:", objc_msgSend(a1, "_dataLayerClassForConfiguration:", a3));
}

- (void)setDateTimeLayerHidden:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  if (-[AMUIAmbientViewControlling isMemberOfClass:](self->_concreteDataLayerViewController, "isMemberOfClass:", objc_opt_class()))
  {
    -[AMUIAmbientViewControlling view](self->_concreteDataLayerViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDF6F90];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__AMUIDataLayerViewController_setDateTimeLayerHidden___block_invoke;
    v8[3] = &unk_250763960;
    v9 = v5;
    v10 = a3;
    v7 = v5;
    objc_msgSend(v6, "animateWithDuration:animations:", v8, 0.2);

  }
}

uint64_t __54__AMUIDataLayerViewController_setDateTimeLayerHidden___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

- (UIView)viewForOpacityAdjustment
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AMUIAmbientViewControlling viewForOpacityAdjustment](self->_concreteDataLayerViewController, "viewForOpacityAdjustment");
  else
    -[AMUIDataLayerViewController view](self, "view");
  return (UIView *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  id v6;
  id v7;
  AMUIAmbientViewControlling **p_concreteDataLayerViewController;
  AMUIAmbientViewControlling *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  AMUIAmbientViewControlling *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  AMUIAmbientViewControlling *v39;

  v6 = a3;
  v7 = a4;
  p_concreteDataLayerViewController = &self->_concreteDataLayerViewController;
  if (!-[AMUIAmbientViewControlling isMemberOfClass:](self->_concreteDataLayerViewController, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "_dataLayerClassForConfiguration:", v6))|| (-[AMUIAmbientViewControlling updatePosterConfiguration:withAnimationSettings:](*p_concreteDataLayerViewController, "updatePosterConfiguration:withAnimationSettings:", v6, v7) & 1) == 0)
  {
    v9 = *p_concreteDataLayerViewController;
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __79__AMUIDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke;
    v38[3] = &unk_250763400;
    v38[4] = self;
    v32 = v9;
    v39 = v32;
    v10 = (void *)MEMORY[0x23B7EA970](v38);
    v11 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "_dataLayerClassForConfiguration:", v6));
    v12 = objc_opt_class();
    v13 = v11;
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

    objc_msgSend(v15, "setDelegate:", self);
    v16 = objc_opt_class();
    v17 = v13;
    if (v16)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v19 = v18;

    objc_msgSend(v19, "setChromeOrientationPolicy:", self->_chromeOrientationPolicy);
    v20 = objc_opt_class();
    v21 = v17;
    if (v20)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
    }
    else
    {
      v22 = 0;
    }
    v23 = v22;

    objc_msgSend(v23, "setDateProvider:", self->_dateProvider);
    -[AMUIDataLayerViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    objc_msgSend(v25, "setFrame:");
    objc_msgSend(v25, "setAutoresizingMask:", 18);
    objc_msgSend(v25, "setAlpha:", 0.0);
    if (v7)
    {
      objc_msgSend(v25, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAllowsGroupOpacity:", 1);

    }
    -[AMUIDataLayerViewController bs_addChildViewController:](self, "bs_addChildViewController:", v21);
    objc_storeStrong((id *)&self->_concreteDataLayerViewController, v11);
    -[AMUIAmbientViewControlling updatePosterConfiguration:withAnimationSettings:](*p_concreteDataLayerViewController, "updatePosterConfiguration:withAnimationSettings:", v6, 0);
    v27 = (void *)MEMORY[0x24BE0BF08];
    v28 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __79__AMUIDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_2;
    v36[3] = &unk_250763388;
    v37 = v21;
    v33[0] = v28;
    v33[1] = 3221225472;
    v33[2] = __79__AMUIDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_3;
    v33[3] = &unk_250763988;
    v33[4] = self;
    v34 = v37;
    v35 = v10;
    v29 = v10;
    v30 = v37;
    objc_msgSend(v27, "animateWithSettings:actions:completion:", v7, v36, v33);

  }
  return 1;
}

uint64_t __79__AMUIDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bs_removeChildViewController:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void __79__AMUIDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __79__AMUIDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)invalidate
{
  AMUIAmbientViewControlling *concreteDataLayerViewController;

  -[AMUIDataLayerViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_concreteDataLayerViewController);
  -[AMUIAmbientViewControlling invalidate](self->_concreteDataLayerViewController, "invalidate");
  concreteDataLayerViewController = self->_concreteDataLayerViewController;
  self->_concreteDataLayerViewController = 0;

}

- (NSDictionary)activeConfigurationMetadata
{
  return (NSDictionary *)-[AMUIAmbientViewControlling activeConfigurationMetadata](self->_concreteDataLayerViewController, "activeConfigurationMetadata");
}

- (void)noteAmbientViewControllingDelegateDidUpdate
{
  -[AMUIAmbientViewControlling noteAmbientViewControllingDelegateDidUpdate](self->_concreteDataLayerViewController, "noteAmbientViewControllingDelegateDidUpdate");
}

- (BOOL)handleDismiss
{
  return -[AMUIAmbientViewControlling handleDismiss](self->_concreteDataLayerViewController, "handleDismiss");
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMUIAmbientViewControlling cancelTouchesForCurrentEventInHostedContent](self->_concreteDataLayerViewController, "cancelTouchesForCurrentEventInHostedContent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)loadView
{
  AMUITouchPassthroughView *v3;

  v3 = objc_alloc_init(AMUITouchPassthroughView);
  -[AMUIDataLayerViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUIDataLayerViewController;
  -[AMUIDataLayerViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[AMUIDataLayerViewController _registerForAmbientPresentationTraitChanges](self, "_registerForAmbientPresentationTraitChanges");
  -[AMUIDataLayerViewController _updateRedModeFiltersForTraitEnvironment:previousTraitCollection:animated:](self, "_updateRedModeFiltersForTraitEnvironment:previousTraitCollection:animated:", self, 0, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)createUnlockRequestForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIDataLayerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createUnlockRequestForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)requestUnlockForViewController:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[AMUIDataLayerViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestUnlockForViewController:withRequest:completion:", self, v8, v7);

}

- (void)viewControllerWillBeginConfiguration:(id)a3
{
  id v4;

  -[AMUIDataLayerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerWillBeginConfiguration:", self);

}

- (void)viewControllerWillEndConfiguration:(id)a3
{
  id v4;

  -[AMUIDataLayerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerWillEndConfiguration:", self);

}

- (void)viewController:(id)a3 didUpdateActiveConfigurationMetadata:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AMUIDataLayerViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didUpdateActiveConfigurationMetadata:", self, v5);

}

- (id)widgetHostManagerForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIDataLayerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetHostManagerForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ambientDefaultsForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIDataLayerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientDefaultsForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultWidgetDescriptorStacksForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIDataLayerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultWidgetDescriptorStacksForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewControllerWillBeginShowingTemporaryOverlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMUIDataLayerViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerWillBeginShowingTemporaryOverlay:", v4);

}

- (void)viewControllerWillEndShowingTemporaryOverlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMUIDataLayerViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerWillEndShowingTemporaryOverlay:", v4);

}

- (BOOL)viewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[AMUIDataLayerViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "viewController:isApplicationVisibleWithBundleIdentifier:", v7, v6);

  return v9;
}

+ (Class)_dataLayerClassForConfiguration:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v13;
  id v14;

  v3 = a3;
  v14 = 0;
  objc_msgSend(v3, "pr_loadAmbientConfigurationWithError:", &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (v4)
  {
    v6 = objc_msgSend(v4, "supportedDataLayout");
    if (v6 == 1 || v6 == 2)
      v10 = (void *)objc_opt_class();
    else
      v10 = 0;
    v9 = v10;
    goto LABEL_10;
  }
  objc_msgSend(v3, "providerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ambient.AmbientUI.InfographPoster"));

  if (v8)
  {
    objc_opt_class();
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = v9;
    goto LABEL_11;
  }
  AMUILogDataLayer();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    +[AMUIDataLayerViewController _dataLayerClassForConfiguration:].cold.1((uint64_t)v3, (uint64_t)v5, v13);

  v11 = 0;
LABEL_11:

  return (Class)v11;
}

+ (int64_t)_dataLayoutForDataLayerClass:(Class)a3
{
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return 2;
  if (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()))
    return 1;
  return 3;
}

- (void)_registerForAmbientPresentationTraitChanges
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[AMUIDataLayerViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v4, &__block_literal_global_6);

}

uint64_t __74__AMUIDataLayerViewController__registerForAmbientPresentationTraitChanges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "_updateRedModeFiltersForTraitEnvironment:previousTraitCollection:animated:", a2, a3, 1);
}

- (void)_updateRedModeFiltersForTraitEnvironment:(id)a3 previousTraitCollection:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int IsRedMode;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  NSObject *v21;
  int v22;
  AMUIDataLayerViewController *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  -[AMUIDataLayerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForNSIntegerTrait:", v11);
  IsRedMode = AMUIAmbientDisplayStyleIsRedMode();

  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForNSIntegerTrait:", v13);

  v14 = AMUIAmbientDisplayStyleIsRedMode();
  if (v7 && IsRedMode == v14)
  {
    AMUILogDataLayer();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218240;
      v23 = self;
      v24 = 1024;
      LODWORD(v25) = IsRedMode;
      _os_log_impl(&dword_23600A000, v21, OS_LOG_TYPE_DEFAULT, "0x%p: Not changing red mode filters because red mode trait did not change(isRedModeEnabled=%{BOOL}u)", (uint8_t *)&v22, 0x12u);
    }

  }
  else
  {
    AMUILogDataLayer();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (IsRedMode)
    {
      if (v16)
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 134218242;
        v23 = self;
        v24 = 2112;
        v25 = v18;
        _os_log_impl(&dword_23600A000, v15, OS_LOG_TYPE_DEFAULT, "0x%p: Applying red mode filter on the concreteDataLayerViewController of type:%@", (uint8_t *)&v22, 0x16u);

      }
      objc_msgSend(v9, "amui_applyRedModeFilterAnimated:withCompletion:", 1, 0);
    }
    else
    {
      if (v16)
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 134218242;
        v23 = self;
        v24 = 2112;
        v25 = v20;
        _os_log_impl(&dword_23600A000, v15, OS_LOG_TYPE_DEFAULT, "0x%p: Clearing red mode filter on the concreteDataLayerViewController of type:%@", (uint8_t *)&v22, 0x16u);

      }
      objc_msgSend(v9, "amui_clearRedModeFilterAnimated:withCompletion:", 1, 0);
    }
  }

}

- (int64_t)chromeOrientationPolicy
{
  return self->_chromeOrientationPolicy;
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (AMUIDataLayerViewControllerDelegate)delegate
{
  return (AMUIDataLayerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_concreteDataLayerViewController, 0);
}

+ (void)_dataLayerClassForConfiguration:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_23600A000, log, OS_LOG_TYPE_ERROR, "Failed to load ambient configuration from configuration %@ with error %@", (uint8_t *)&v3, 0x16u);
}

@end
