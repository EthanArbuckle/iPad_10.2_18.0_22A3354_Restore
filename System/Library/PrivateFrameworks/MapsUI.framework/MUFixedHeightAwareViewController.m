@implementation MUFixedHeightAwareViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MUFixedHeightAwareViewController)initWithViewController:(id)a3
{
  id v5;
  MUFixedHeightAwareViewController *v6;
  MUFixedHeightAwareViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUFixedHeightAwareViewController;
  v6 = -[MUFixedHeightAwareViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_childVC, a3);
    -[MUFixedHeightAwareViewController _setupChildVC](v7, "_setupChildVC");
  }

  return v7;
}

- (void)_setupChildVC
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *heightConstraint;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
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
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[7];

  v37[5] = *MEMORY[0x1E0C80C00];
  -[UIViewController view](self->_childVC, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIViewController view](self->_childVC, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIViewController view](self->_childVC, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScrollEnabled:", 0);

  }
  -[MUFixedHeightAwareViewController addChildViewController:](self, "addChildViewController:", self->_childVC);
  -[MUFixedHeightAwareViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_childVC, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[UIViewController didMoveToParentViewController:](self->_childVC, "didMoveToParentViewController:", self);
  -[UIViewController view](self->_childVC, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController preferredContentSize](self->_childVC, "preferredContentSize");
  objc_msgSend(v10, "constraintEqualToConstant:", v11);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v12;

  v27 = (void *)MEMORY[0x1E0CB3718];
  -[UIViewController view](self->_childVC, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUFixedHeightAwareViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v32;
  -[UIViewController view](self->_childVC, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUFixedHeightAwareViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v26;
  -[UIViewController view](self->_childVC, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUFixedHeightAwareViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v16;
  -[UIViewController view](self->_childVC, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUFixedHeightAwareViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self->_heightConstraint;
  v37[3] = v21;
  v37[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v23);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  double v4;

  -[UIViewController preferredContentSize](self->_childVC, "preferredContentSize", a3);
  -[MUFixedHeightAwareViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[UIViewController preferredContentSize](self->_childVC, "preferredContentSize");
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childVC, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end
