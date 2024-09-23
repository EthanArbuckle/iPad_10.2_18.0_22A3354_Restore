@implementation HUCCControlCenterCompactModule

- (HUCCControlCenterCompactModule)init
{
  HUCCControlCenterCompactModule *v2;
  void *v3;
  HUCCLockStateHandler *v4;
  HUCCLockStateHandler *lockStateHandler;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCCControlCenterCompactModule;
  v2 = -[HUCCControlCenterCompactModule init](&v7, sel_init);
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x24BE4F448], "sharedManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bootstrap");

    }
    else
    {
      HUCCPerformCommonInitialization();
    }
    v4 = -[HUCCLockStateHandler initWithDelegate:]([HUCCLockStateHandler alloc], "initWithDelegate:", v2);
    lockStateHandler = v2->_lockStateHandler;
    v2->_lockStateHandler = v4;

    if (qword_255EB09E8 != -1)
      dispatch_once(&qword_255EB09E8, &unk_24FFD57A0);
  }
  return v2;
}

- (id)contentViewControllerForContext:(id)a3
{
  return -[HUCCCompactModuleContentViewController initWithDelegate:]([HUCCCompactModuleContentViewController alloc], "initWithDelegate:", self);
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (void)lockStateWasUpdated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  -[HUCCControlCenterCompactModule contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "setAccessAllowedForCurrentLockState:", v3);
}

- (void)moduleContentViewController:(id)a3 viewWillAppear:(BOOL)a4
{
  id v4;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE4F448], "sharedManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enterModuleViewWillAppear");

  }
  else
  {
    HUCCUpdateRunningState(1);
  }
}

- (void)moduleContentViewController:(id)a3 viewDidDisappear:(BOOL)a4
{
  id v4;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE4F448], "sharedManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exitModuleViewDidDisappear");

  }
  else
  {
    HUCCUpdateRunningState(0);
  }
}

- (void)launchHomeAppForModuleContentViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUCCControlCenterCompactModule contentModuleContext](self, "contentModuleContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  launchHomeAppForModuleViewController(v4, v5);

}

- (BOOL)isDeviceUnlockedForModuleContentViewController:(id)a3
{
  void *v3;
  char v4;

  -[HUCCControlCenterCompactModule lockStateHandler](self, "lockStateHandler", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeviceUnlocked");

  return v4;
}

- (CCUIContentModuleContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (HUCCLockStateHandler)lockStateHandler
{
  return self->_lockStateHandler;
}

- (void)setLockStateHandler:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStateHandler, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
