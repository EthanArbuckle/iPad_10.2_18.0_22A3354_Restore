@implementation HUQuickControlContainerViewController

- (HUQuickControlContainerViewController)initWithPresentationContext:(id)a3
{
  id v5;
  HUQuickControlContainerViewController *v6;
  HUQuickControlContainerViewController *v7;
  uint64_t v8;
  NSCopying *item;
  uint64_t v10;
  HMHome *home;
  HUQuickControlViewControllerCoordinator *v12;
  NSCopying *v13;
  void *v14;
  uint64_t v15;
  HUQuickControlViewControllerCoordinator *viewControllerCoordinator;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUQuickControlContainerViewController;
  v6 = -[HUQuickControlContainerViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentationContext, a3);
    objc_msgSend(v5, "item");
    v8 = objc_claimAutoreleasedReturnValue();
    item = v7->_item;
    v7->_item = (NSCopying *)v8;

    objc_msgSend(v5, "home");
    v10 = objc_claimAutoreleasedReturnValue();
    home = v7->_home;
    v7->_home = (HMHome *)v10;

    v12 = [HUQuickControlViewControllerCoordinator alloc];
    v13 = v7->_item;
    objc_msgSend(v5, "controlItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HUQuickControlViewControllerCoordinator initWithItem:controlItems:home:delegate:](v12, "initWithItem:controlItems:home:delegate:", v13, v14, v7->_home, v7);
    viewControllerCoordinator = v7->_viewControllerCoordinator;
    v7->_viewControllerCoordinator = (HUQuickControlViewControllerCoordinator *)v15;

    -[HUQuickControlViewControllerCoordinator setControlHost:](v7->_viewControllerCoordinator, "setControlHost:", v7);
    -[HUQuickControlViewControllerCoordinator setShouldIncludeRoomNameInHeaderTitle:](v7->_viewControllerCoordinator, "setShouldIncludeRoomNameInHeaderTitle:", objc_msgSend(v5, "shouldIncludeRoomNameInHeaderTitle"));
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("item"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isControlPresentedOrPresenting
{
  return -[HUQuickControlContainerViewController presentationState](self, "presentationState") == 2
      || -[HUQuickControlContainerViewController presentationState](self, "presentationState") == 3;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlContainerViewController;
  -[HUQuickControlContainerViewController viewDidLoad](&v7, sel_viewDidLoad);
  if (objc_msgSend(MEMORY[0x1E0CEA950], "instancesRespondToSelector:", sel__peripheryInsets)
    && (objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "_peripheryInsets"),
        v5 = v4,
        v3,
        v5 > 0.0))
  {
    v6 = 14;
  }
  else
  {
    v6 = 0;
  }
  -[HUQuickControlContainerViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", v6);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPresentedDetailView:(BOOL)a3
{
  if (self->_presentedDetailView != a3)
    self->_presentedDetailView = a3;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlContainerViewController;
  -[HUQuickControlContainerViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    -[HUQuickControlContainerViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  HUQuickControlContainerViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlContainerViewController;
  -[HUQuickControlContainerViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: viewWillAppear", buf, 0xCu);
  }

  -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setControlsVisible:", 1);

}

- (BOOL)canBecomeFirstResponder
{
  objc_super v4;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlContainerViewController;
  return -[HUQuickControlContainerViewController canBecomeFirstResponder](&v4, sel_canBecomeFirstResponder);
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  HUQuickControlContainerViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlContainerViewController;
  -[HUQuickControlContainerViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: viewWillDisappear", buf, 0xCu);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlContainerViewController;
  -[HUQuickControlContainerViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setControlsVisible:", 0);

}

- (id)presentDetailViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  -[HUQuickControlContainerViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "hasDetailsActionForQuickControlViewController:item:", self, v7);

  if ((v8 & 1) != 0)
  {
    if (-[HUQuickControlContainerViewController presentedDetailView](self, "presentedDetailView"))
      NSLog(CFSTR("Inconsistant state: gesture fired while presentedSecondaryView is nil"));
    -[HUQuickControlContainerViewController setPresentedDetailView:](self, "setPresentedDetailView:", 1);
    -[HUQuickControlContainerViewController _prepareDetailViewController](self, "_prepareDetailViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[HUApplicationManager sharedInstance](HUApplicationManager, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStatusBarHidden:forRequester:", 0, self);

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v9);
      objc_msgSend(v11, "setModalPresentationStyle:", 2);
      -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v11, v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      NSLog(CFSTR("Failed to create detail controller"));
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Attempting to present a details view controller for unsupported item %@!"), v14);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (void)setAvailableContentLayoutGuide:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_availableContentLayoutGuide, a3);
  v5 = a3;
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStandardViewportFromParentGuide:", v5);

}

- (void)_updateControlStatusText
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summaryView");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
  {
    -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryStatusText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPrimaryText:", v11);

    -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "secondaryStatusText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSecondaryText:", v9);
    goto LABEL_5;
  }
  -[HUQuickControlContainerViewController presentationContext](self, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isConfiguredForNonHomeUser");

  if (v5)
  {
    -[HUQuickControlContainerViewController presentationContext](self, "presentationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controlItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_29_3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "deviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPrimaryText:", v9);
LABEL_5:

  }
}

uint64_t __65__HUQuickControlContainerViewController__updateControlStatusText__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_updateIconDescriptorAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconDescriptor");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showIconOffState");

  if (v7)
    v8 = 2;
  else
    v8 = 1;
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "summaryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "updateWithIconDescriptor:displayStyle:animated:", v12, v8, v3);
}

- (void)_updateUserInteractionEnabledForActiveControl
{
  _BOOL8 v3;
  void *v4;
  id v5;

  -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isReachable"))
    v3 = -[HUQuickControlContainerViewController isControlPresentedOrPresenting](self, "isControlPresentedOrPresenting");
  else
    v3 = 0;
  -[HUQuickControlContainerViewController activeControlViewController](self, "activeControlViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (void)_backButtonPressed:(id)a3
{
  id v3;

  v3 = -[HUQuickControlContainerViewController dismissControlAnimated:](self, "dismissControlAnimated:", 1);
}

- (void)_settingsButtonPressed:(id)a3
{
  id v3;

  v3 = -[HUQuickControlContainerViewController presentDetailViewControllerAnimated:](self, "presentDetailViewControllerAnimated:", 1);
}

+ (id)_easeOutTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v3) = 1036831949;
  LODWORD(v2) = 0.25;
  LODWORD(v4) = 0.25;
  LODWORD(v5) = 1.0;
  return (id)objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

+ (id)_controlScaleAnimationSettingsForPresenting:(BOOL)a3
{
  _BOOL4 v3;
  HUSpringAnimationSettings *v4;
  double v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(HUSpringAnimationSettings);
  -[HUSpringAnimationSettings setDelay:](v4, "setDelay:", 0.04);
  -[HUSpringAnimationSettings setMass:](v4, "setMass:", 2.0);
  -[HUSpringAnimationSettings setStiffness:](v4, "setStiffness:", 450.0);
  v5 = 50.0;
  if (v3)
    v5 = 44.0;
  -[HUSpringAnimationSettings setDamping:](v4, "setDamping:", v5);
  -[HUSpringAnimationSettings setSpeed:](v4, "setSpeed:", 1.3);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSpringAnimationSettings setTimingFunction:](v4, "setTimingFunction:", v6);

  return v4;
}

+ (id)_controlAlphaAnimationSettingsForPresenting:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;

  if (a3)
  {
    +[HUAnimationSettings settingsWithDuration:](HUAnimationSettings, "settingsWithDuration:", 0.165);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_easeOutTimingFunction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v5);

  }
  else
  {
    objc_msgSend(a1, "_blurAnimationSettingsForPresenting:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speed");
    objc_msgSend(v4, "setSpeed:", v6 * 0.8);
  }
  return v4;
}

+ (id)_blurAnimationSettingsForPresenting:(BOOL)a3
{
  HUSpringAnimationSettings *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  if (a3)
  {
    +[HUAnimationSettings settingsWithDuration:](HUAnimationSettings, "settingsWithDuration:", 0.45);
    v4 = (HUSpringAnimationSettings *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_easeOutTimingFunction");
  }
  else
  {
    v4 = objc_alloc_init(HUSpringAnimationSettings);
    -[HUSpringAnimationSettings setMass:](v4, "setMass:", 2.0);
    -[HUSpringAnimationSettings setStiffness:](v4, "setStiffness:", 300.0);
    -[HUSpringAnimationSettings setDamping:](v4, "setDamping:", 400.0);
    -[HUSpringAnimationSettings setSpeed:](v4, "setSpeed:", 1.5);
    LODWORD(v5) = 1041865114;
    LODWORD(v6) = 1058642330;
    LODWORD(v7) = 1064346583;
    LODWORD(v8) = 0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v5, v8, v6, v7);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSpringAnimationSettings setTimingFunction:](v4, "setTimingFunction:", v9);

  return v4;
}

+ (id)_sourceViewTransitionAnimationSettingsForPresenting:(BOOL)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[HUAnimationSettings settingsWithDuration:](HUAnimationSettings, "settingsWithDuration:", 0.25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelay:", 0.02);
    objc_msgSend(a1, "_easeOutTimingFunction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v5);

  }
  else
  {
    objc_msgSend(a1, "_controlScaleAnimationSettingsForPresenting:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)_detailChromeAnimationSettings
{
  void *v3;
  void *v4;

  +[HUAnimationSettings settingsWithDuration:](HUAnimationSettings, "settingsWithDuration:", 0.6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_easeOutTimingFunction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunction:", v4);

  return v3;
}

- (CGAffineTransform)sourceViewTransformForPresentationProgress:(SEL)a3
{
  void *v7;
  void *v8;
  CGAffineTransform *result;
  void *v10;

  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    NSLog(CFSTR("cannot compute the source view transform before beginning presentation!"));
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v8, "sourceViewTransformForPresentationProgress:", a4);
    v8 = v10;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)presentControlForMacAnimated:(BOOL)a3
{
  -[HUQuickControlContainerViewController setPresentationState:](self, "setPresentationState:", 3);
  -[HUQuickControlContainerViewController _createControlContainerViewForMac](self, "_createControlContainerViewForMac");
}

- (void)presentControlFromSourceRect:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  _QWORD v10[5];

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[HUQuickControlContainerViewController isControlPresentedOrPresenting](self, "isControlPresentedOrPresenting"))
    NSLog(CFSTR("Presentation already in progress!"));
  -[HUQuickControlContainerViewController setPresentationState:](self, "setPresentationState:", 2);
  -[HUQuickControlContainerViewController setSourceRect:](self, "setSourceRect:", x, y, width, height);
  -[HUQuickControlContainerViewController _createControlContainerViewWithSourceRect:](self, "_createControlContainerViewWithSourceRect:", x, y, width, height);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__HUQuickControlContainerViewController_presentControlFromSourceRect_animated___block_invoke;
  v10[3] = &unk_1E6F4E300;
  v10[4] = self;
  -[HUQuickControlContainerViewController _performTransitionToPresentationState:animated:initialProgress:completion:](self, "_performTransitionToPresentationState:animated:initialProgress:completion:", 2, v4, v10, 0.0);
}

uint64_t __79__HUQuickControlContainerViewController_presentControlFromSourceRect_animated___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setPresentationState:", 3);
  return result;
}

- (BOOL)isControlDismissedOrDismissing
{
  return !-[HUQuickControlContainerViewController isControlPresentedOrPresenting](self, "isControlPresentedOrPresenting");
}

- (id)dismissControlAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = a3;
  if (-[HUQuickControlContainerViewController isControlPresentedOrPresenting](self, "isControlPresentedOrPresenting"))
  {
    -[HUQuickControlContainerViewController presentationApplier](self, "presentationApplier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HUQuickControlContainerViewController presentationApplier](self, "presentationApplier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "effectiveProgress");
      v8 = v7;

      -[HUQuickControlContainerViewController presentationApplier](self, "presentationApplier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cancel");

      -[HUQuickControlContainerViewController setPresentationApplier:](self, "setPresentationApplier:", 0);
    }
    else
    {
      v8 = 1.0;
    }
    v11 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    if (-[HUQuickControlContainerViewController presentedDetailView](self, "presentedDetailView"))
    {
      -[HUQuickControlContainerViewController _dismissDetailsViewControllerAnimated:dismissControl:](self, "_dismissDetailsViewControllerAnimated:dismissControl:", v3, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __64__HUQuickControlContainerViewController_dismissControlAnimated___block_invoke;
      v18[3] = &unk_1E6F4C610;
      v10 = v11;
      v19 = v10;
      v13 = (id)objc_msgSend(v12, "addCompletionBlock:", v18);

      v14 = v19;
    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __64__HUQuickControlContainerViewController_dismissControlAnimated___block_invoke_2;
      v16[3] = &unk_1E6F4E048;
      v16[4] = self;
      v10 = v11;
      v17 = v10;
      -[HUQuickControlContainerViewController _performTransitionToPresentationState:animated:initialProgress:completion:](self, "_performTransitionToPresentationState:animated:initialProgress:completion:", 1, v3, v16, 1.0 - v8);
      v14 = v17;
    }

  }
  else
  {
    NSLog(CFSTR("Control is already dismissed or dismissing!"));
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

uint64_t __64__HUQuickControlContainerViewController_dismissControlAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

uint64_t __64__HUQuickControlContainerViewController_dismissControlAnimated___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_controlDidDismiss");
  else
    return objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
}

- (void)_performTransitionToPresentationState:(unint64_t)a3 animated:(BOOL)a4 initialProgress:(double)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v11;
  char v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  void (**v20)(void *, void *);
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void (**v40)(_QWORD);
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  BOOL v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  BOOL v51;
  _QWORD v52[5];
  BOOL v53;
  _QWORD aBlock[4];
  char v55;

  v7 = a4;
  v11 = a6;
  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlContainerViewController.m"), 399, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state == HUQuickControlPresentationStatePresenting || state == HUQuickControlPresentationStateDismissing"));

  }
  v12 = objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled");
  objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", v7);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke;
  aBlock[3] = &__block_descriptor_33_e5_v8__0l;
  v55 = v12;
  v40 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[HUQuickControlContainerViewController setPresentationState:](self, "setPresentationState:", a3);
  -[HUQuickControlContainerViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "quickControlViewController:sourceViewInitialScaleForPresentation:", self, a3 == 2);
  v15 = v14;
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInitialSourceViewScale:", v15);
  v17 = fmin(fmax(a5, 0.0), 1.0);

  v18 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_2;
  v52[3] = &__block_descriptor_41_e8_d16__0d8l;
  *(double *)&v52[4] = v17;
  v53 = a3 == 2;
  v19 = _Block_copy(v52);
  v50[0] = v18;
  v50[1] = 3221225472;
  v50[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_3;
  v50[3] = &__block_descriptor_41_e50___HUAnimationSettings_16__0__HUAnimationSettings_8l;
  v51 = v7;
  *(double *)&v50[4] = v17;
  v20 = (void (**)(void *, void *))_Block_copy(v50);
  objc_msgSend((id)objc_opt_class(), "_controlScaleAnimationSettingsForPresenting:", a3 == 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();

  v39 = (void *)v22;
  +[HUAnimationApplier staticApplierWithAnimationSettings:](HUAnimationApplier, "staticApplierWithAnimationSettings:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_4;
  v48[3] = &unk_1E6F5D748;
  v48[4] = self;
  v24 = v19;
  v49 = v24;
  objc_msgSend(v23, "addApplierBlock:", v48);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_6;
  v45[3] = &unk_1E6F5D770;
  v47 = a3 == 2;
  v45[4] = self;
  v38 = v11;
  v46 = v38;
  objc_msgSend(v23, "addCompletionBlock:", v45);
  objc_msgSend(v23, "start");
  objc_msgSend((id)objc_opt_class(), "_controlAlphaAnimationSettingsForPresenting:", a3 == 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_7;
  v43[3] = &unk_1E6F5D748;
  v43[4] = self;
  v27 = v24;
  v44 = v27;
  v28 = +[HUAnimationApplier applyAnimationSettings:withStaticApplier:completion:](HUAnimationApplier, "applyAnimationSettings:withStaticApplier:completion:", v26, v43, 0);
  objc_msgSend((id)objc_opt_class(), "_detailChromeAnimationSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_8;
  v41[3] = &unk_1E6F5D748;
  v41[4] = self;
  v31 = v27;
  v42 = v31;
  v32 = +[HUAnimationApplier applyAnimationSettings:withStaticApplier:completion:](HUAnimationApplier, "applyAnimationSettings:withStaticApplier:completion:", v30, v41, 0);
  objc_msgSend((id)objc_opt_class(), "_sourceViewTransitionAnimationSettingsForPresenting:", a3 == 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlContainerViewController delegate](self, "delegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "quickControlViewController:applierForSourceViewTransitionWithAnimationSettings:presenting:", self, v34, a3 == 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "start");
  if (a3 == 2)
    -[HUQuickControlContainerViewController setPresentationApplier:](self, "setPresentationApplier:", v23);

  if (v40)
    v40[2](v40);

}

uint64_t __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", *(unsigned __int8 *)(a1 + 32));
}

double __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_2(uint64_t a1, double a2)
{
  double result;

  result = *(double *)(a1 + 32) + a2 * (1.0 - *(double *)(a1 + 32));
  if (!*(_BYTE *)(a1 + 40))
    return 1.0 - result;
  return result;
}

id __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;

  v3 = (void *)objc_msgSend(a2, "copy");
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = pow(1.5, -*(double *)(a1 + 32));
    objc_msgSend(v3, "speed");
    objc_msgSend(v3, "setSpeed:", v5 / v4);
    objc_msgSend(v3, "speed");
  }
  else
  {
    v6 = 1.79769313e308;
  }
  objc_msgSend(v3, "setSpeed:", v6);
  return v3;
}

void __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_4(uint64_t a1, double a2)
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  double v8;

  objc_msgSend(*(id *)(a1 + 32), "controlContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_5;
  v6[3] = &unk_1E6F5D720;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  v8 = a2;
  objc_msgSend(v4, "naui_performAnimateableConstraintChanges:", v6);

}

void __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_5(uint64_t a1)
{
  double v2;
  id v3;

  v2 = (*(double (**)(double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "controlContainerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setControlTransitionProgress:", v2);

}

uint64_t __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((_DWORD)a2 && *(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "setPresentationApplier:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_7(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;

  v2 = (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "controlContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeControlView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

void __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_8(uint64_t a1)
{
  double v2;
  id v3;

  v2 = (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "controlContainerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setChromeTransitionProgress:", v2);

}

- (void)_createControlContainerViewWithSourceRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  HUQuickControlContainerView *v9;
  HUQuickControlContainerView *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  v9 = [HUQuickControlContainerView alloc];
  v10 = -[HUQuickControlContainerView initWithFrame:delegate:sourceRect:](v9, "initWithFrame:delegate:sourceRect:", self, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), x, y, width, height);
  -[HUQuickControlContainerViewController setControlContainerView:](self, "setControlContainerView:", v10);

  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEdgesForExtendedLayout:", 1);

  -[HUQuickControlContainerViewController availableContentLayoutGuide](self, "availableContentLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStandardViewportFromParentGuide:", v13);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  -[HUQuickControlContainerViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  v34 = (id)objc_opt_new();
  -[HUQuickControlContainerViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObject:", v23);

  -[HUQuickControlContainerViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "widthAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObject:", v28);

  -[HUQuickControlContainerViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObject:", v33);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v34);
  -[HUQuickControlContainerViewController _updateActiveControlViewController](self, "_updateActiveControlViewController");
  -[HUQuickControlContainerViewController _updateIconDescriptorAnimated:](self, "_updateIconDescriptorAnimated:", 0);
  -[HUQuickControlContainerViewController _updateControlStatusText](self, "_updateControlStatusText");
  -[HUQuickControlContainerViewController _updateReachabilityStateForActiveControl](self, "_updateReachabilityStateForActiveControl");

}

- (void)_createControlContainerViewForMac
{
  void *v3;
  HUQuickControlContainerView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  HUQuickControlContainerView *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4 = [HUQuickControlContainerView alloc];
  -[HUQuickControlContainerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v10 = -[HUQuickControlContainerView initWithFrame:delegate:sourceRect:](v4, "initWithFrame:delegate:sourceRect:", self, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v6, v7, v8, v9);
  -[HUQuickControlContainerViewController setControlContainerView:](self, "setControlContainerView:", v10);

  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUQuickControlContainerViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  v29 = (id)objc_opt_new();
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v18);

  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v23);

  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v28);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v29);
  -[HUQuickControlContainerViewController _updateActiveControlViewController](self, "_updateActiveControlViewController");
  -[HUQuickControlContainerViewController _updateIconDescriptorAnimated:](self, "_updateIconDescriptorAnimated:", 0);
  -[HUQuickControlContainerViewController _updateControlStatusText](self, "_updateControlStatusText");
  -[HUQuickControlContainerViewController _updateReachabilityStateForActiveControl](self, "_updateReachabilityStateForActiveControl");

}

- (void)_updateActiveControlViewController
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  -[HUQuickControlContainerViewController activeControlViewController](self, "activeControlViewController");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "preferredPresentationStyle"))
    NSLog(CFSTR("A non-inline quick control view controller %@ is being made the active view controller. This is not supported!"), v4);
  if (v20 != v4)
    objc_msgSend(v20, "willMoveToParentViewController:", 0);
  if (v4)
  {
    -[HUQuickControlContainerViewController addChildViewController:](self, "addChildViewController:", v4);
    -[HUQuickControlContainerViewController setActiveControlViewController:](self, "setActiveControlViewController:", v4);
    -[HUQuickControlContainerViewController activeControlViewController](self, "activeControlViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "hu_preloadContent");

    -[HUQuickControlContainerViewController activeControlViewController](self, "activeControlViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActiveControlView:", v8);

    -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "controlViewPreferredFrameLayoutGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerViewController activeControlViewController](self, "activeControlViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPreferredFrameLayoutGuide:", v11);

    -[HUQuickControlContainerViewController activeControlViewController](self, "activeControlViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasSingleControlView");
    -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setControlViewSupportsTransformTransition:", v14);

    -[HUQuickControlContainerViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerViewController item](self, "item");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "hasDetailsActionForQuickControlViewController:item:", self, v17);

    -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShouldShowDetailsButton:", v18);

    if (v20 != v4)
    {
      objc_msgSend(v20, "removeFromParentViewController");
      objc_msgSend(v4, "didMoveToParentViewController:", self);
    }
  }
  -[HUQuickControlContainerViewController _updateReachabilityStateForActiveControl](self, "_updateReachabilityStateForActiveControl");

}

- (void)_controlDidDismiss
{
  void *v3;

  -[HUQuickControlContainerViewController setPresentationState:](self, "setPresentationState:", 0);
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[HUQuickControlContainerViewController setControlContainerView:](self, "setControlContainerView:", 0);
  -[HUQuickControlContainerViewController setSourceRect:](self, "setSourceRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)_dismissQuickControls
{
  id v3;
  void *v4;
  HUQuickControlContainerViewController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[HUQuickControlContainerViewController isControlPresentedOrPresenting](self, "isControlPresentedOrPresenting"))
  {
    v3 = -[HUQuickControlContainerViewController dismissControlAnimated:](self, "dismissControlAnimated:", 1);
    -[HUQuickControlContainerViewController presentationDelegate](self, "presentationDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    v5 = self;
    v6 = 1;
    goto LABEL_3;
  }
  if (!-[HUQuickControlContainerViewController presentationState](self, "presentationState"))
  {
    -[HUQuickControlContainerViewController presentationDelegate](self, "presentationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerViewController presentingViewController](self, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Quick controls are dismissed, but the view controller (%@) is still receiving touches. Something likely failed during a previous dismissal - perhaps the presenting view controller has been deallocated prematurely. Attempting to force dismissal. Presentation delegate: %@, presenting view controller: %@"), self, v8, v9);

    -[HUQuickControlContainerViewController presentationDelegate](self, "presentationDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[HUQuickControlContainerViewController presentingViewController](self, "presentingViewController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 0, 0);
      goto LABEL_4;
    }
    -[HUQuickControlContainerViewController presentationDelegate](self, "presentationDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    v5 = self;
    v6 = 0;
LABEL_3:
    v7 = (id)objc_msgSend(v4, "finishPresentation:animated:", v5, v6);
LABEL_4:

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlContainerViewController;
  -[HUQuickControlContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (id)_prepareDetailViewController
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HUQuickControlContainerViewController *v16;
  void *v17;
  void *v18;
  void *v19;

  -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    -[HUQuickControlContainerViewController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    v16 = self;
    v17 = v14;
LABEL_9:
    objc_msgSend(v15, "detailsViewControllerForQuickControlViewController:item:", v16, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_opt_class();
  -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hf_isMultiServiceAccessory");

  if (!v11)
  {
    objc_msgSend(v9, "accessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_primaryService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceItemForService:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUQuickControlContainerViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v16 = self;
    v17 = v12;
    goto LABEL_9;
  }
  -[HUQuickControlContainerViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "detailsViewControllerForQuickControlViewController:item:", self, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  objc_msgSend(v13, "setPresentationDelegate:", self);
  return v13;
}

- (id)_dismissDetailsViewControllerAnimated:(BOOL)a3 dismissControl:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  -[HUQuickControlContainerViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "quickControlViewControllerWillDismissDetailsViewController:shouldDismissQuickControl:", self, v4);

  if (v4)
  {
    -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[HUQuickControlContainerViewController presentationDelegate](self, "presentationDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishPresentation:animated:", self, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HUQuickControlContainerViewController setPresentedDetailView:](self, "setPresentedDetailView:", 0);
    -[UIViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (void)externalAnimationsBegan
{
  NSObject *v3;
  void *v4;
  int v5;
  HUQuickControlContainerViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@: externalAnimationsBegan", (uint8_t *)&v5, 0xCu);
  }

  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalAnimationsBegan");

}

- (void)externalAnimationsEnded
{
  NSObject *v3;
  void *v4;
  int v5;
  HUQuickControlContainerViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@: externalAnimationsEnded", (uint8_t *)&v5, 0xCu);
  }

  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalAnimationsEnded");

}

- (void)beginReceivingTouchesWithGestureRecognizer:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isReachable");

  if (v5)
  {
    -[HUQuickControlContainerViewController activeControlViewController](self, "activeControlViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginUserInteractionWithFirstTouchGestureRecognizer:", v7);

  }
}

- (id)hu_prepareForDismissalAnimated:(BOOL)a3
{
  void *v3;
  void *v4;

  -[HUQuickControlContainerViewController dismissControlAnimated:](self, "dismissControlAnimated:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flatMap:", &__block_literal_global_69_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __72__HUQuickControlContainerViewController_hu_prepareForDismissalAnimated___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", &unk_1E7041AD0);
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v4 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HUQuickControlContainerViewController item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D30910];
  v14[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "updateWithOptions:", v8);

  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2578B8))
    v10 = objc_msgSend(v6, "requiresPresentingViewControllerDismissal");
  else
    v10 = 0;
  -[HUQuickControlContainerViewController _dismissDetailsViewControllerAnimated:dismissControl:](self, "_dismissDetailsViewControllerAnimated:dismissControl:", v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)detailsButtonPressedInContainerView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  -[HUQuickControlContainerViewController viewControllerCoordinator](self, "viewControllerCoordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B90]);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlContainerViewController detailViewURLHandler](self, "detailViewURLHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v14)
  {
    -[HUQuickControlContainerViewController detailViewURLHandler](self, "detailViewURLHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "openURL:", v14);
LABEL_7:

    goto LABEL_8;
  }
  -[HUQuickControlContainerViewController delegate](self, "delegate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[HUQuickControlContainerViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[HUQuickControlContainerViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "quickControlViewControllerDidTapDetailsButton:", self);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)contentDidUpdateInContainerView:(id)a3
{
  void *v3;
  id v4;

  -[HUQuickControlContainerViewController parentViewController](self, "parentViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)controllerCoordinator:(id)a3 didUpdateIconDescriptor:(id)a4 showOffState:(BOOL)a5
{
  -[HUQuickControlContainerViewController _updateIconDescriptorAnimated:](self, "_updateIconDescriptorAnimated:", 1, a4, a5);
}

- (BOOL)isConfiguredForNonHomeUser:(id)a3
{
  void *v3;
  char v4;

  -[HUQuickControlContainerViewController presentationContext](self, "presentationContext", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isConfiguredForNonHomeUser");

  return v4;
}

- (void)quickControlContent:(id)a3 requestDismissalOfType:(unint64_t)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v6 = a3;
  if (!a4)
  {
    v13 = v6;
    -[HUQuickControlContainerViewController presentedViewController](self, "presentedViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v13)
    {
      v12 = -[UIViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", 0);
    }
    else
    {
      -[HUQuickControlContainerViewController presentedViewController](self, "presentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Quick control content %@ is requesting modal content dismissal even though it is not presented modally! Presented VC: %@"), v13, v11);

    }
    goto LABEL_8;
  }
  if (a4 == 1)
  {
    v13 = v6;
    v7 = -[HUQuickControlContainerViewController isControlPresentedOrPresenting](self, "isControlPresentedOrPresenting");
    v6 = v13;
    if (v7)
    {
      -[HUQuickControlContainerViewController setRequiresPresentingViewControllerDismissal:](self, "setRequiresPresentingViewControllerDismissal:", 1);
      -[HUQuickControlContainerViewController presentationDelegate](self, "presentationDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v8, "finishPresentation:animated:", self, 1);

LABEL_8:
      v6 = v13;
    }
  }

}

- (void)quickControlContent:(id)a3 showAuxiliaryView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showAuxiliaryView:", v5);

}

- (void)hideAuxiliaryViewForQuickControlContent:(id)a3
{
  id v3;

  -[HUQuickControlContainerViewController controlContainerView](self, "controlContainerView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hideAuxiliaryView");

}

- (id)viewForTouchContinuation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  objc_opt_class();
  -[HUQuickControlContainerViewController item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5
    && (objc_msgSend(v5, "accessory"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hf_isMultiServiceAccessory"),
        v6,
        (v7 & 1) != 0))
  {
    v8 = 0;
  }
  else
  {
    -[HUQuickControlContainerViewController activeControlViewController](self, "activeControlViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllerForTouchContinuation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewForTouchContinuation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presentationDelegate, a3);
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (NSCopying)item
{
  return self->_item;
}

- (HMHome)home
{
  return self->_home;
}

- (HUQuickControlContainerView)controlContainerView
{
  return self->_controlContainerView;
}

- (void)setControlContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_controlContainerView, a3);
}

- (HUQuickControlContainerViewControllerDelegate)delegate
{
  return (HUQuickControlContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUOpenURLHandling)detailViewURLHandler
{
  return self->_detailViewURLHandler;
}

- (void)setDetailViewURLHandler:(id)a3
{
  objc_storeStrong((id *)&self->_detailViewURLHandler, a3);
}

- (UILayoutGuide)availableContentLayoutGuide
{
  return self->_availableContentLayoutGuide;
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UITapGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (HUAnimationApplier)presentationApplier
{
  return self->_presentationApplier;
}

- (void)setPresentationApplier:(id)a3
{
  objc_storeStrong((id *)&self->_presentationApplier, a3);
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(unint64_t)a3
{
  self->_presentationState = a3;
}

- (HUQuickControlViewControllerCoordinator)viewControllerCoordinator
{
  return self->_viewControllerCoordinator;
}

- (void)setViewControllerCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerCoordinator, a3);
}

- (HUQuickControlViewController)activeControlViewController
{
  return self->_activeControlViewController;
}

- (void)setActiveControlViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activeControlViewController, a3);
}

- (HUQuickControlPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContext, a3);
}

- (BOOL)presentedDetailView
{
  return self->_presentedDetailView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_activeControlViewController, 0);
  objc_storeStrong((id *)&self->_viewControllerCoordinator, 0);
  objc_storeStrong((id *)&self->_presentationApplier, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_availableContentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_detailViewURLHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controlContainerView, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end
