@implementation HKNavigationController

- (void)viewDidLoad
{
  void *v3;
  id v4;
  _TtC8HealthUI36InternalSettingsTapGestureRecognizer *v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HKNavigationController;
  -[HKNavigationController viewDidLoad](&v6, sel_viewDidLoad);
  -[HKNavigationController setDelegate:](self, "setDelegate:", self);
  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[HKNavigationController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v3, sel_horizontalSizeClassDidChangeWithTraitEnvironment_previousTraitCollection_);

  v5 = -[InternalSettingsTapGestureRecognizer initWithTarget:action:]([_TtC8HealthUI36InternalSettingsTapGestureRecognizer alloc], "initWithTarget:action:", self, sel_onInternalSettingsGesture);
  -[HKNavigationController setInternalSettingsGestureRecognizer:](self, "setInternalSettingsGestureRecognizer:", v5);

}

- (void)setInternalSettingsGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_internalSettingsGestureRecognizer, a3);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKNavigationController;
  -[HKNavigationController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[HKNavigationController updateTraits](self, "updateTraits");
}

- (void)updateTraits
{
  void *v3;
  double v4;
  double v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[HKNavigationController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = +[HKWidthDesignationProvider widthDesignationFromViewWidth:](HKWidthDesignationProvider, "widthDesignationFromViewWidth:", v5);
  if (v5 < 678.0)
    v7 = 1;
  else
    v7 = 2;
  -[HKNavigationController traitOverrides](self, "traitOverrides");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNSIntegerValue:forTrait:", v6, objc_opt_class());

  -[HKNavigationController traitOverrides](self, "traitOverrides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNSIntegerValue:forTrait:", v7, objc_opt_class());

  -[HKNavigationController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[HKNavigationController updateTraitsIfNeeded](self, "updateTraitsIfNeeded");
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[HKNavigationController topViewController](self, "topViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "supportedInterfaceOrientations");
  else
    v5 = 6;

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKNavigationController;
  -[HKNavigationController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleInternalInstall");

  if (v5)
  {
    -[HKNavigationController navigationBar](self, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKNavigationController internalSettingsGestureRecognizer](self, "internalSettingsGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v7);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKNavigationController;
  -[HKNavigationController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleInternalInstall");

  if (v5)
  {
    -[HKNavigationController navigationBar](self, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKNavigationController internalSettingsGestureRecognizer](self, "internalSettingsGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeGestureRecognizer:", v7);

  }
}

- (void)horizontalSizeClassDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[HKNavigationController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v10, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKNavigationController reparentViewControllerIfNecessaryWithTraitCollection:previousTraitCollection:](self, "reparentViewControllerIfNecessaryWithTraitCollection:previousTraitCollection:", v9, v6);

  }
}

- (void)onInternalSettingsGesture
{
  void *v3;
  int v4;
  id v5;

  -[HKNavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1F01A6550);

  if (v4)
  {
    -[HKNavigationController topViewController](self, "topViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "onInternalSettingsGesture");

  }
}

- (UIGestureRecognizer)internalSettingsGestureRecognizer
{
  return self->_internalSettingsGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSettingsGestureRecognizer, 0);
}

- (void)reparentViewControllerIfNecessaryWithTraitCollection:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  id v7;
  HKNavigationController *v8;
  HKNavigationController *v9;
  UITraitCollection_optional v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v10.is_nil = (char)v8;
  v9 = v8;
  v10.value.super.isa = (Class)a4;
  HKNavigationController.reparentViewControllerIfNecessary(traitCollection:previousTraitCollection:)((UITraitCollection)v6, v10);

}

@end
