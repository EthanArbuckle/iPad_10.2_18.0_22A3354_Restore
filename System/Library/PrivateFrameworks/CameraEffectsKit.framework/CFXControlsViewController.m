@implementation CFXControlsViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CFXControlsViewController;
  -[CFXControlsViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[CFXControlsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    -[CFXControlsViewController effectBrowserContentPresenterViewController](self, "effectBrowserContentPresenterViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CFXControlsViewController effectBrowserContentPresenterViewController](self, "effectBrowserContentPresenterViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController jfxAddChildViewController:](self, "jfxAddChildViewController:", v7);

    }
  }
}

- (void)setEffectsPickerDrawer:(id)a3
{
  id v3;
  UIView *v5;
  UIView **p_effectsPickerDrawer;
  UIView *effectsPickerDrawer;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
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
  _QWORD v28[5];

  v3 = a3;
  v28[4] = *MEMORY[0x24BDAC8D0];
  v5 = (UIView *)a3;
  p_effectsPickerDrawer = &self->_effectsPickerDrawer;
  effectsPickerDrawer = self->_effectsPickerDrawer;
  if (effectsPickerDrawer != v5)
  {
    if (effectsPickerDrawer)
      -[UIView removeFromSuperview](effectsPickerDrawer, "removeFromSuperview");
    if (v5)
    {
      -[CFXControlsViewController loadViewIfNeeded](self, "loadViewIfNeeded");
      -[CFXControlsViewController controlsContainerView](self, "controlsContainerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v5);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v20 = (void *)MEMORY[0x24BDD1628];
      -[UIView leadingAnchor](v5, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXControlsViewController controlsContainerView](self, "controlsContainerView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v24;
      -[UIView trailingAnchor](v5, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXControlsViewController controlsContainerView](self, "controlsContainerView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v19;
      -[UIView topAnchor](v5, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXControlsViewController controlsContainerView](self, "controlsContainerView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "topAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v10;
      -[UIView bottomAnchor](v5, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXControlsViewController controlsContainerView](self, "controlsContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28[3] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
      v15 = v3;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v16);

      v3 = v15;
    }
    objc_storeStrong((id *)p_effectsPickerDrawer, v3);
  }

}

- (id)effectsPickerSnapshot
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
  void *v13;

  -[CFXControlsViewController effectsBrowser](self, "effectsBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CFXControlsViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v5, v7, v9, v11, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CGPoint)effectsPickerCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CFXControlsViewController effectsBrowser](self, "effectsBrowser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "center");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CFXEffectBrowserContentPresenterViewController)effectBrowserContentPresenterViewController
{
  void *v3;
  uint64_t v4;
  CFXEffectBrowserContentPresenterViewController *v5;
  CFXEffectBrowserContentPresenterViewController *effectBrowserContentPresenterViewController;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (!v4 && !self->_effectBrowserContentPresenterViewController)
  {
    v5 = (CFXEffectBrowserContentPresenterViewController *)objc_opt_new();
    effectBrowserContentPresenterViewController = self->_effectBrowserContentPresenterViewController;
    self->_effectBrowserContentPresenterViewController = v5;

  }
  return self->_effectBrowserContentPresenterViewController;
}

- (UIView)controlsContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_controlsContainerView);
}

- (void)setControlsContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_controlsContainerView, a3);
}

- (UIView)effectsPickerDrawer
{
  return self->_effectsPickerDrawer;
}

- (UIView)effectsBrowser
{
  return self->_effectsBrowser;
}

- (void)setEffectsBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_effectsBrowser, a3);
}

- (BOOL)usesInternalCaptureSession
{
  return self->_usesInternalCaptureSession;
}

- (void)setUsesInternalCaptureSession:(BOOL)a3
{
  self->_usesInternalCaptureSession = a3;
}

- (NSLayoutConstraint)controlsContainerViewHeightConstraint
{
  return self->_controlsContainerViewHeightConstraint;
}

- (void)setControlsContainerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_controlsContainerViewHeightConstraint, a3);
}

- (NSLayoutConstraint)controlsContainerViewWidthConstraint
{
  return self->_controlsContainerViewWidthConstraint;
}

- (void)setControlsContainerViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_controlsContainerViewWidthConstraint, a3);
}

- (NSLayoutConstraint)controlsContainerViewTrailingConstraint
{
  return self->_controlsContainerViewTrailingConstraint;
}

- (void)setControlsContainerViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_controlsContainerViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)controlsContainerViewLeadingConstraint
{
  return self->_controlsContainerViewLeadingConstraint;
}

- (void)setControlsContainerViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_controlsContainerViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)controlsContainerViewTopConstraint
{
  return self->_controlsContainerViewTopConstraint;
}

- (void)setControlsContainerViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_controlsContainerViewTopConstraint, a3);
}

- (void)setEffectBrowserContentPresenterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_effectBrowserContentPresenterViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectBrowserContentPresenterViewController, 0);
  objc_storeStrong((id *)&self->_controlsContainerViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_controlsContainerViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_controlsContainerViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_controlsContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_controlsContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_effectsBrowser, 0);
  objc_storeStrong((id *)&self->_effectsPickerDrawer, 0);
  objc_destroyWeak((id *)&self->_controlsContainerView);
}

@end
