@implementation CSPoseidonViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSPoseidonViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v4, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC610]), "initWithAuthenticationInformationProvider:", self);
  objc_msgSend(v3, "setDelegate:", self);
  -[CSPoseidonViewController bs_addChildViewController:](self, "bs_addChildViewController:", v3);
  -[CSPoseidonViewController setPoseidonContainerViewController:](self, "setPoseidonContainerViewController:", v3);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CSPoseidonViewController;
  -[CSCoverSheetViewControllerBase viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[CSPoseidonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBUIPoseidonContainerViewController view](self->_poseidonContainerViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (UIView)poseidonView
{
  void *v2;
  void *v3;

  -[CSPoseidonViewController poseidonContainerViewController](self, "poseidonContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)isBiometricLockedOut
{
  void *v2;
  BOOL v3;

  -[CSPoseidonViewController biometricResource](self, "biometricResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "biometricLockoutState") != 0;

  return v3;
}

- (BOOL)hasBiometricAuthenticationCapabilityEnabled
{
  void *v2;
  char v3;

  -[CSPoseidonViewController biometricResource](self, "biometricResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasBiometricAuthenticationCapabilityEnabled");

  return v3;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSPoseidonViewController;
  if (!-[CSCoverSheetViewControllerBase handleEvent:](&v19, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "type");
    v5 = 0;
    if (v6 <= 23)
    {
      switch(v6)
      {
        case 10:
          -[CSPoseidonViewController poseidonContainerViewController](self, "poseidonContainerViewController");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          v9 = 1;
          goto LABEL_15;
        case 11:
          -[CSPoseidonViewController poseidonContainerViewController](self, "poseidonContainerViewController");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          v9 = 0;
LABEL_15:
          objc_msgSend(v7, "setResignActive:", v9);
          goto LABEL_20;
        case 12:
          goto LABEL_22;
        case 13:
          objc_msgSend(v4, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "BOOLValue");

          -[CSPoseidonViewController poseidonContainerViewController](self, "poseidonContainerViewController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setAuthenticated:", v16);
          goto LABEL_20;
        case 14:
          -[CSPoseidonViewController poseidonContainerViewController](self, "poseidonContainerViewController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setBioLockout:", 1);
          goto LABEL_20;
        default:
          if (v6 != 1)
            goto LABEL_22;
          -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "legibilitySettings");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[CSPoseidonViewController poseidonContainerViewController](self, "poseidonContainerViewController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setLegibilitySettings:", v13);

          break;
      }
      goto LABEL_21;
    }
    switch(v6)
    {
      case 24:
        -[CSPoseidonViewController poseidonContainerViewController](self, "poseidonContainerViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setScreenOn:", 1);

        -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
        break;
      case 25:
        -[CSPoseidonViewController poseidonContainerViewController](self, "poseidonContainerViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setScreenOn:", 0);
        goto LABEL_20;
      case 36:
        -[CSPoseidonViewController poseidonContainerViewController](self, "poseidonContainerViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isAuthenticated");

        if (v11)
        {
          -[CSPoseidonViewController poseidonContainerViewController](self, "poseidonContainerViewController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "startRestToOpenCoaching:withCompletion:", 0, 0);
LABEL_20:

        }
        break;
      default:
        goto LABEL_22;
    }
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_22:

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSPoseidonViewController;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CSPoseidonViewController;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v29, sel_aggregateAppearance_, v4);
  -[CSPoseidonViewController poseidonContainerViewController](self, "poseidonContainerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "coachingActive");

  if (v6)
  {
    +[CSComponent footerCallToActionLabel](CSComponent, "footerCallToActionLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "priority:", 60);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase coverSheetIdentifier](self, "coverSheetIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hidden:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v11);

    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "priority:", 60);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase coverSheetIdentifier](self, "coverSheetIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "suppressTeachableMomentsAnimation:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v16);

    -[CSPoseidonViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "_toWindowOrientation");

    if (v19 == 1)
    {
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "priority:", 60);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "setHidden:", 1);
      objc_msgSend(v23, "setFakeStatusBar:", 0);
      objc_msgSend(v23, "setPriority:", 60);
      objc_msgSend(v4, "addComponent:", v23);
      +[CSComponent controlCenterGrabber](CSComponent, "controlCenterGrabber");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "priority:", 60);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSCoverSheetViewControllerBase coverSheetIdentifier](self, "coverSheetIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identifier:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "hidden:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addComponent:", v28);

    }
  }

}

- (SBUIPoseidonContainerViewController)poseidonContainerViewController
{
  return self->_poseidonContainerViewController;
}

- (void)setPoseidonContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_poseidonContainerViewController, a3);
}

- (SBUIBiometricResource)biometricResource
{
  return self->_biometricResource;
}

- (void)setBiometricResource:(id)a3
{
  objc_storeStrong((id *)&self->_biometricResource, a3);
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (void)setAuthenticationStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationStatusProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_poseidonContainerViewController, 0);
}

@end
