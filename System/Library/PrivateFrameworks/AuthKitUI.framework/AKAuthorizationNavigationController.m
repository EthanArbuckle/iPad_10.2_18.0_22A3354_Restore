@implementation AKAuthorizationNavigationController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AKAuthorizationNavigationController;
  -[AKAuthorizationNavigationController viewDidLoad](&v15, sel_viewDidLoad);
  -[AKAuthorizationNavigationController _setBuiltinTransitionStyle:](self, "_setBuiltinTransitionStyle:", 1);
  v3 = objc_alloc_init(MEMORY[0x1E0CEA638]);
  -[AKAuthorizationNavigationController navigationBar](self, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundImage:forBarMetrics:", v3, 0);

  -[AKAuthorizationNavigationController navigationBar](self, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslucent:", 1);

  -[AKAuthorizationNavigationController _updateStyleIfNeeded](self, "_updateStyleIfNeeded");
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationNavigationController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "isLisbonAvailable");

  if ((_DWORD)v7)
  {
    +[AKAuthorizationPaneMetrics paneCornerRadius](AKAuthorizationPaneMetrics, "paneCornerRadius");
    v10 = v9;
    -[AKAuthorizationNavigationController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v10);

    -[AKAuthorizationNavigationController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMaskedCorners:", 3);

    +[AKAuthorizationPaneMetrics paneAdditionSafeAreaInsets](AKAuthorizationPaneMetrics, "paneAdditionSafeAreaInsets");
    -[AKAuthorizationNavigationController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationNavigationController;
  -[AKAuthorizationNavigationController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[AKAuthorizationNavigationController _updateStyleIfNeeded](self, "_updateStyleIfNeeded");
}

- (void)_updateStyleIfNeeded
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _UIBackdropView *v10;
  _UIBackdropView *backdropView;
  _UIBackdropView *v12;
  void *v13;
  void *v14;
  id v15;

  -[AKAuthorizationNavigationController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 != self->_currentStyle)
  {
    self->_currentStyle = v4;
    -[_UIBackdropView removeFromSuperview](self->_backdropView, "removeFromSuperview");
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isLisbonAvailable"))
      v6 = 2020;
    else
      v6 = 2010;

    if (v4 == 2)
      v7 = 2030;
    else
      v7 = v6;
    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    +[AKAuthorizationAppearance paneBackgroundColor](AKAuthorizationAppearance, "paneBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setColorTint:", v8);

    v9 = objc_alloc(MEMORY[0x1E0CEAC68]);
    v10 = (_UIBackdropView *)objc_msgSend(v9, "initWithFrame:settings:", v15, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    backdropView = self->_backdropView;
    self->_backdropView = v10;

    v12 = self->_backdropView;
    -[AKAuthorizationNavigationController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    -[_UIBackdropView setFrame:](v12, "setFrame:");

    -[AKAuthorizationNavigationController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertSubview:atIndex:", self->_backdropView, 0);

  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 != 1)
  {
    -[AKAuthorizationNavigationController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v7.receiver = self;
    v7.super_class = (Class)AKAuthorizationNavigationController;
    -[AKAuthorizationNavigationController preferredContentSizeDidChangeForChildContentContainer:](&v7, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
