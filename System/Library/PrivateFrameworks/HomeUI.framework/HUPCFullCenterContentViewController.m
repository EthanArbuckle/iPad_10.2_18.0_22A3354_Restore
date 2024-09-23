@implementation HUPCFullCenterContentViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUPCFullCenterContentViewController;
  -[HUPCFullCenterContentViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HUPCFullCenterContentViewController insertCenterContentView](self, "insertCenterContentView");
}

- (void)setCenteredContentView:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[HUPCFullCenterContentViewController centerContentView](self, "centerContentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUPCFullCenterContentViewController setCenterContentView:](self, "setCenterContentView:", v5);
  }
  if (-[HUPCFullCenterContentViewController isViewLoaded](self, "isViewLoaded"))
    -[HUPCFullCenterContentViewController insertCenterContentView](self, "insertCenterContentView");

}

- (void)insertCenterContentView
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
  void *v37;
  _QWORD v38[5];

  v38[4] = *MEMORY[0x1E0C80C00];
  -[HUPCFullCenterContentViewController centerContentView](self, "centerContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPCFullCenterContentViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[HUPCFullCenterContentViewController centerContentView](self, "centerContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[HUPCFullCenterContentViewController contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPCFullCenterContentViewController centerContentView](self, "centerContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[HUPCFullCenterContentViewController contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mainContentGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUPCFullCenterContentViewController centerContentView](self, "centerContentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v34;
    -[HUPCFullCenterContentViewController centerContentView](self, "centerContentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v29;
    v33 = v10;
    objc_msgSend(v10, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPCFullCenterContentViewController centerContentView](self, "centerContentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v14;
    objc_msgSend(v10, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPCFullCenterContentViewController centerContentView](self, "centerContentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPCFullCenterContentViewController setFloatingConstraintGroup:](self, "setFloatingConstraintGroup:", v19);

    v20 = (void *)MEMORY[0x1E0CB3718];
    -[HUPCFullCenterContentViewController floatingConstraintGroup](self, "floatingConstraintGroup");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v21);

    -[HUPCFullCenterContentViewController centerContentView](self, "centerContentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "widthAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    -[HUPCFullCenterContentViewController centerContentView](self, "centerContentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPCFullCenterContentViewController contentView](self, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pinToEdgesConstraints:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPCFullCenterContentViewController setPinnedConstraintGroup:](self, "setPinnedConstraintGroup:", v28);

  }
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUPCFullCenterContentViewController;
  -[HUPCFullCenterContentViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HUPCFullCenterContentViewController recalculateLayoutForTraitCollectionChange](self, "recalculateLayoutForTraitCollectionChange");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUPCFullCenterContentViewController;
  -[HUPCFullCenterContentViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[HUPCFullCenterContentViewController recalculateLayoutForTraitCollectionChange](self, "recalculateLayoutForTraitCollectionChange");
}

- (UIView)centerContentView
{
  return self->_centerContentView;
}

- (void)setCenterContentView:(id)a3
{
  objc_storeStrong((id *)&self->_centerContentView, a3);
}

- (NSLayoutConstraint)contentViewOptionalHeightAnchor
{
  return self->_contentViewOptionalHeightAnchor;
}

- (void)setContentViewOptionalHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewOptionalHeightAnchor, a3);
}

- (double)contentViewMaxHeight
{
  return self->_contentViewMaxHeight;
}

- (void)setContentViewMaxHeight:(double)a3
{
  self->_contentViewMaxHeight = a3;
}

- (NSArray)floatingConstraintGroup
{
  return self->_floatingConstraintGroup;
}

- (void)setFloatingConstraintGroup:(id)a3
{
  objc_storeStrong((id *)&self->_floatingConstraintGroup, a3);
}

- (NSArray)pinnedConstraintGroup
{
  return self->_pinnedConstraintGroup;
}

- (void)setPinnedConstraintGroup:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedConstraintGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedConstraintGroup, 0);
  objc_storeStrong((id *)&self->_floatingConstraintGroup, 0);
  objc_storeStrong((id *)&self->_contentViewOptionalHeightAnchor, 0);
  objc_storeStrong((id *)&self->_centerContentView, 0);
}

@end
