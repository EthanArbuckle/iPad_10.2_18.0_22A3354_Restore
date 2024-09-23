@implementation _MKSelectionAccessoryParentViewController

- (_MKSelectionAccessoryParentViewController)initWithChildViewController:(id)a3
{
  id v5;
  _MKSelectionAccessoryParentViewController *v6;
  _MKSelectionAccessoryParentViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKSelectionAccessoryParentViewController;
  v6 = -[_MKSelectionAccessoryParentViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_childViewController, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)_MKSelectionAccessoryParentViewController;
  -[_MKSelectionAccessoryParentViewController viewDidLoad](&v23, sel_viewDidLoad);
  -[MKPlaceCardRemoteUIHostViewController view](self->_childViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKSelectionAccessoryParentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  v15 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v3, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKSelectionAccessoryParentViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  objc_msgSend(v3, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKSelectionAccessoryParentViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v14;
  objc_msgSend(v3, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKSelectionAccessoryParentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v8;
  objc_msgSend(v3, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKSelectionAccessoryParentViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v13);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_MKSelectionAccessoryParentViewController;
  -[_MKSelectionAccessoryParentViewController viewDidAppear:](&v5, sel_viewDidAppear_);
  -[MKPlaceCardRemoteUIHostViewController beginAppearanceTransition:animated:](self->_childViewController, "beginAppearanceTransition:animated:", 1, v3);
  -[MKPlaceCardRemoteUIHostViewController endAppearanceTransition](self->_childViewController, "endAppearanceTransition");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_MKSelectionAccessoryParentViewController;
  -[_MKSelectionAccessoryParentViewController viewDidDisappear:](&v5, sel_viewDidDisappear_);
  -[MKPlaceCardRemoteUIHostViewController beginAppearanceTransition:animated:](self->_childViewController, "beginAppearanceTransition:animated:", 0, v3);
  -[MKPlaceCardRemoteUIHostViewController endAppearanceTransition](self->_childViewController, "endAppearanceTransition");
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKSelectionAccessoryParentViewController;
  -[_MKSelectionAccessoryParentViewController _setContentOverlayInsets:](&v3, sel__setContentOverlayInsets_, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
}

- (MKPlaceCardRemoteUIHostViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_childViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end
