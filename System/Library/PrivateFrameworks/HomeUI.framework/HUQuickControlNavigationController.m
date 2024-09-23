@implementation HUQuickControlNavigationController

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlNavigationController;
  -[HUQuickControlNavigationController viewDidLoad](&v5, sel_viewDidLoad);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials"))
    v3 = 4;
  else
    v3 = 16;
  -[HUQuickControlNavigationController setModalPresentationStyle:](self, "setModalPresentationStyle:", v3);
  -[HUQuickControlNavigationController presentationController](self, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setForcePresentationInPresenterScene:", 1);

}

- (CGSize)preferredContentSize
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
  {
    v5 = 768.0;
    v6 = 375.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUQuickControlNavigationController;
    -[HUQuickControlNavigationController preferredContentSize](&v7, sel_preferredContentSize);
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)hu_prepareForDismissalAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  -[HUQuickControlNavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF2EAC88))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    objc_msgSend(v6, "hu_prepareForDismissalAnimated:", v3);
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", &unk_1E7041650);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
