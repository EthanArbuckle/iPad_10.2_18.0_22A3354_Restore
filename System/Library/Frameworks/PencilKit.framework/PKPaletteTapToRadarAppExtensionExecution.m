@implementation PKPaletteTapToRadarAppExtensionExecution

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIViewController *v8;
  UIViewController *contentViewController;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *contentViewWidthConstraint;
  void *v17;
  void *v18;
  double v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *contentViewHeightConstraint;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  PKTextInputDebugRadarViewController *v37;
  void *v38;
  objc_super v39;
  _QWORD v40[5];

  v40[4] = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)PKPaletteTapToRadarAppExtensionExecution;
  -[PKPaletteTapToRadarCommandExecution run](&v39, "run");
  -[PKPaletteTapToRadarCommandExecution configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugSharpenerLog");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = -[PKTextInputDebugRadarViewController initWithSharpenerLog:]([PKTextInputDebugRadarViewController alloc], "initWithSharpenerLog:", v38);
  -[PKTextInputDebugRadarViewController setDelegate:](v37, "setDelegate:", self);
  -[PKPaletteTapToRadarCommandExecution configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (UIViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v37);
  contentViewController = self->_contentViewController;
  self->_contentViewController = v8;

  objc_msgSend(v5, "addChildViewController:", self->_contentViewController);
  objc_msgSend(v5, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_contentViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  -[UIViewController view](self->_contentViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIViewController view](self->_contentViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v7;
  objc_msgSend(v7, "hostedViewSize");
  objc_msgSend(v14, "constraintEqualToConstant:");
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewWidthConstraint = self->_contentViewWidthConstraint;
  self->_contentViewWidthConstraint = v15;

  -[UIViewController view](self->_contentViewController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostedViewSize");
  objc_msgSend(v18, "constraintEqualToConstant:", v19);
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewHeightConstraint = self->_contentViewHeightConstraint;
  self->_contentViewHeightConstraint = v20;

  v30 = (void *)MEMORY[0x1E0CB3718];
  -[UIViewController view](self->_contentViewController, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  objc_msgSend(v5, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v22;
  -[UIViewController view](self->_contentViewController, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leftAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leftAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = self->_contentViewWidthConstraint;
  v40[1] = v27;
  v40[2] = v28;
  v40[3] = self->_contentViewHeightConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v29);

  -[UIViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", v31);
}

- (void)_dismiss
{
  void *v3;

  -[UIViewController willMoveToParentViewController:](self->_contentViewController, "willMoveToParentViewController:", 0);
  -[UIViewController view](self->_contentViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[UIViewController removeFromParentViewController](self->_contentViewController, "removeFromParentViewController");
}

- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteTapToRadarAppExtensionExecution;
  -[PKPaletteTapToRadarCommandExecution editingOverlayContainerDidChangeToSceneBounds:](&v4, sel_editingOverlayContainerDidChangeToSceneBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PKPaletteTapToRadarAppExtensionExecution _updateUI](self, "_updateUI");
}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  -[PKPaletteTapToRadarCommandExecution configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hostedViewSize");
  -[NSLayoutConstraint setConstant:](self->_contentViewWidthConstraint, "setConstant:");
  objc_msgSend(v7, "hostedViewSize");
  -[NSLayoutConstraint setConstant:](self->_contentViewHeightConstraint, "setConstant:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
