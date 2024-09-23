@implementation CKObscurableBalloonView

- (void)prepareForReuse
{
  void *v3;
  UIButton *warningButton;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKObscurableBalloonView;
  -[CKBalloonView prepareForReuse](&v5, sel_prepareForReuse);
  if (-[CKObscurableBalloonView isObscured](self, "isObscured"))
  {
    -[CKObscurableBalloonView obscuringView](self, "obscuringView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    -[CKObscurableBalloonView setObscuringView:](self, "setObscuringView:", 0);
  }
  warningButton = self->_warningButton;
  if (warningButton)
    -[UIButton removeFromSuperview](warningButton, "removeFromSuperview");
}

- (BOOL)isObscured
{
  return self->_obscuringView != 0;
}

- (void)obscureSensitiveContent:(BOOL)a3
{
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
  id v14;

  -[CKObscurableBalloonView _setupObscuringView:](self, "_setupObscuringView:", a3);
  -[CKObscurableBalloonView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKObscurableBalloonView obscuringView](self, "obscuringView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[CKObscurableBalloonView obscuringView](self, "obscuringView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKObscurableBalloonView addSubview:](self, "addSubview:", v13);

  -[CKObscurableBalloonView obscuringView](self, "obscuringView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[CKObscurableBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v14);

}

- (void)revealSensitiveContent:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  if (-[CKObscurableBalloonView isObscured](self, "isObscured"))
  {
    -[CKObscurableBalloonView obscuringView](self, "obscuringView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[CKObscurableBalloonView setObscuringView:](self, "setObscuringView:", 0);
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "enablementGroup");

    if (v7 == 2)
      -[CKObscurableBalloonView _setupForAdultsIn:revealingContent:](self, "_setupForAdultsIn:revealingContent:", self, 1);
  }
}

- (void)tapGestureRecognized:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  objc_msgSend(v5, "hitTest:withEvent:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CKObscurableBalloonView isObscured](self, "isObscured")
    || (objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "enablementGroup"),
        v7,
        v8 != 2)
    || (-[CKObscurableBalloonView showButton](self, "showButton"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v6 == v9))
  {
    v10.receiver = self;
    v10.super_class = (Class)CKObscurableBalloonView;
    -[CKBalloonView tapGestureRecognized:](&v10, sel_tapGestureRecognized_, v4);
  }

}

- (void)_setupObscuringView:(BOOL)a3
{
  _BOOL4 v3;
  UIView *v5;
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
  void *obscuringView;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
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
  uint64_t v36;
  void *v37;
  void *v38;
  UIView *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  UIView *v54;
  CKObscurableBalloonView *v55;
  _QWORD v56[4];
  _QWORD v57[6];

  v3 = a3;
  v57[4] = *MEMORY[0x1E0C80C00];
  if (!-[CKObscurableBalloonView isObscured](self, "isObscured"))
  {
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[UIView _setOverrideUserInterfaceRenderingMode:](v5, "_setOverrideUserInterfaceRenderingMode:", 2);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v53 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _setOverrideUserInterfaceStyle:](v5, "_setOverrideUserInterfaceStyle:", objc_msgSend(v6, "obscurableBalloonBlurMaterialInterfaceStyle"));

    v55 = self;
    -[CKObscurableBalloonView blurEffect](self, "blurEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v5, "addSubview:", v7);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v41 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v5, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v49);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v47;
    objc_msgSend(v7, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v5, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v43);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v8;
    objc_msgSend(v7, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v5, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v11;
    objc_msgSend(v7, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v5, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v57[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v15);

    if (v53)
    {
      obscuringView = v55->_obscuringView;
      v55->_obscuringView = v5;
    }
    else
    {
      v54 = v5;
      -[CKObscurableBalloonView sensitiveContentDescription](v55, "sensitiveContentDescription");
      obscuringView = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", obscuringView);

      objc_msgSend(obscuringView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sensitiveLabelPadding");
      v20 = v19;

      objc_msgSend(obscuringView, "centerYAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "centerYAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v25) = 1143930880;
      objc_msgSend(v24, "setPriority:", v25);
      v40 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(obscuringView, "centerXAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "centerXAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:", v44);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v42;
      v56[1] = v24;
      v50 = v24;
      objc_msgSend(obscuringView, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "leadingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:constant:", v28, v20);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v56[2] = v29;
      objc_msgSend(obscuringView, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v7;
      objc_msgSend(v7, "contentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:constant:", v32, -v20);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v56[3] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "activateConstraints:", v34);

      objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "enablementGroup");

      -[CKObscurableBalloonView _containerView](v55, "_containerView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36 == 2)
      {
        -[CKObscurableBalloonView _setupForAdultsIn:revealingContent:](v55, "_setupForAdultsIn:revealingContent:", v37, 0);
      }
      else
      {
        -[CKObscurableBalloonView obscuredContentBadgeView](v55, "obscuredContentBadgeView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKObscurableBalloonView _setupForChildrenIn:withBadgeView:](v55, "_setupForChildrenIn:withBadgeView:", v37, v38);

      }
      v39 = v55->_obscuringView;
      v55->_obscuringView = v54;

      v7 = v52;
    }

  }
}

- (void)_setupForChildrenIn:(id)a3 withBadgeView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "addSubview:", v5);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "obscurableBalloonVerticalPadding");
  v9 = v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "obscurableBalloonHorizontalPadding");
  v12 = v11;

  v13 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v5, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(v5, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v20);

}

- (void)_setupForAdultsIn:(id)a3 revealingContent:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[6];

  v4 = a4;
  v43[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CKObscurableBalloonView obscurableBalloonDelegate](self, "obscurableBalloonDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRevealingContentEnabled");

  if (v8)
    -[CKObscurableBalloonView _setupWarningButtonIn:forRevealing:](self, "_setupWarningButtonIn:forRevealing:", v6, v4);
  if (!v4)
  {
    -[CKObscurableBalloonView showButton](self, "showButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v9);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "obscurableBalloonVerticalPadding");
    v12 = v11;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "obscurableBalloonHorizontalPadding");
    v15 = v14;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "balloonMaskTailWidth");
    v18 = v17;

    v19 = -[CKBalloonView hasTail](self, "hasTail");
    v20 = -0.0;
    if (v19)
      v20 = v18;
    v21 = v15 + v20;
    objc_msgSend(v9, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKObscurableBalloonView sensitiveContentDescription](self, "sensitiveContentDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:constant:", v24, v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v26) = 1144668160;
    v27 = v25;
    v36 = v25;
    objc_msgSend(v25, "setPriority:", v26);
    v37 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v9, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, -v12);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v40;
    objc_msgSend(v9, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, -v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v28;
    objc_msgSend(v9, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:constant:", v30, v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v31;
    objc_msgSend(v9, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:constant:", v33, v12);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v34;
    v43[4] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v35);

  }
}

- (void)_setupWarningButtonIn:(id)a3 forRevealing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[3];

  v4 = a4;
  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CKObscurableBalloonView warningButton](self, "warningButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4)
    objc_msgSend(v9, "obscurableBalloonWarningButtonBackgroundConfigurationRevealed");
  else
    objc_msgSend(v9, "obscurableBalloonWarningButtonBackgroundConfigurationObscured");
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBackground:", v11);
  objc_msgSend(v7, "setConfiguration:", v8);
  objc_msgSend(v6, "addSubview:", v7);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "obscurableBalloonVerticalPadding");
  v14 = v13;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "obscurableBalloonHorizontalPadding");
  v17 = v16;

  v26 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v7, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v20;
  objc_msgSend(v7, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v24 = (void *)v11;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v25);

}

- (UIVisualEffectView)blurEffect
{
  UIVisualEffectView *blurEffect;
  void *v4;
  void *v5;
  void *v6;
  UIVisualEffectView *v7;
  UIVisualEffectView *v8;

  blurEffect = self->_blurEffect;
  if (!blurEffect)
  {
    v4 = (void *)MEMORY[0x1E0CEA398];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectWithStyle:", objc_msgSend(v5, "obscurableBalloonBlurMaterial"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v6);
    v8 = self->_blurEffect;
    self->_blurEffect = v7;

    blurEffect = self->_blurEffect;
  }
  return blurEffect;
}

- (id)blurVisualEffect
{
  void *v2;
  void *v3;
  id v4;

  -[CKObscurableBalloonView blurEffect](self, "blurEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_containerView
{
  void *v2;
  void *v3;

  -[CKObscurableBalloonView blurEffect](self, "blurEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UILabel)sensitiveContentDescription
{
  UILabel *sensitiveContentDescription;
  UILabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;

  sensitiveContentDescription = self->_sensitiveContentDescription;
  if (!sensitiveContentDescription)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1);
    IMSharedUtilitiesFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MAY_BE_SENSITIVE"), &stru_1E276D870, CFSTR("CommSafetyLocalizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v4, "setText:", v6);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sensitiveLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v8);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sensitiveLabelFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v10);

    v11 = self->_sensitiveContentDescription;
    self->_sensitiveContentDescription = v4;

    sensitiveContentDescription = self->_sensitiveContentDescription;
  }
  return sensitiveContentDescription;
}

- (UIButton)showButton
{
  UIButton *showButton;
  UIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;

  showButton = self->_showButton;
  if (!showButton)
  {
    v4 = (UIButton *)objc_alloc_init(MEMORY[0x1E0CEA3A0]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "obscurableBalloonShowButtonConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setConfiguration:](v4, "setConfiguration:", v6);

    -[UIButton titleLabel](v4, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setOverrideUserInterfaceStyle:", 2);

    -[UIButton imageView](v4, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setOverrideUserInterfaceStyle:", 2);

    v9 = self->_showButton;
    self->_showButton = v4;

    showButton = self->_showButton;
  }
  return showButton;
}

- (UIImageView)obscuredContentBadgeView
{
  UIImageView *obscuredContentBadgeView;
  id v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  void *v8;
  void *v9;
  UIImageView *v10;

  obscuredContentBadgeView = self->_obscuredContentBadgeView;
  if (!obscuredContentBadgeView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "obscurableBalloonObscuredContentBadgeImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v6);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "obscurableBalloonBadgeTintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v7, "setTintColor:", v9);

    -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](v7, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    v10 = self->_obscuredContentBadgeView;
    self->_obscuredContentBadgeView = v7;

    obscuredContentBadgeView = self->_obscuredContentBadgeView;
  }
  return obscuredContentBadgeView;
}

- (UIButton)warningButton
{
  UIButton *warningButton;
  UIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIButton **p_warningButton;
  UIButton *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  warningButton = self->_warningButton;
  if (!warningButton)
  {
    v4 = (UIButton *)objc_alloc_init(MEMORY[0x1E0CEA3A0]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "obscurableBalloonWarningButtonConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setConfiguration:](v4, "setConfiguration:", v6);

    -[UIButton imageView](v4, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setOverrideUserInterfaceStyle:", 2);

    -[UIButton setShowsMenuAsPrimaryAction:](v4, "setShowsMenuAsPrimaryAction:", 1);
    location = 0;
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0CEA2A8];
    IMSharedUtilitiesFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MORE_HELP"), &stru_1E276D870, CFSTR("CommSafetyLocalizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __40__CKObscurableBalloonView_warningButton__block_invoke;
    v25[3] = &unk_1E274A4C0;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CEA2A8];
    IMSharedUtilitiesFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("BLOCK_CONTACT_BUTTON_TITLE"), &stru_1E276D870, CFSTR("CommSafetyLocalizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __40__CKObscurableBalloonView_warningButton__block_invoke_2;
    v23[3] = &unk_1E274A4C0;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v15, 0, 0, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setAttributes:", 2);
    v17 = (void *)MEMORY[0x1E0CEA740];
    v28[0] = v12;
    v28[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "menuWithTitle:children:", &stru_1E276D870, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setMenu:](v4, "setMenu:", v19);

    p_warningButton = &self->_warningButton;
    v21 = *p_warningButton;
    *p_warningButton = v4;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    warningButton = *p_warningButton;
  }
  return warningButton;
}

void __40__CKObscurableBalloonView_warningButton__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "obscurableBalloonDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didTapWaysToGetHelp");

}

void __40__CKObscurableBalloonView_warningButton__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "obscurableBalloonDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didTapBlockContact");

}

- (void)_presentGetHelpAlert:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKObscurableBalloonView obscurableBalloonDelegate](self, "obscurableBalloonDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKObscurableBalloonView obscurableBalloonDelegate](self, "obscurableBalloonDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentGetHelpAlert");

  }
}

- (CKObscurableBalloonViewDelegate)obscurableBalloonDelegate
{
  return (CKObscurableBalloonViewDelegate *)objc_loadWeakRetained((id *)&self->_obscurableBalloonDelegate);
}

- (void)setObscurableBalloonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_obscurableBalloonDelegate, a3);
}

- (void)setWarningButton:(id)a3
{
  objc_storeStrong((id *)&self->_warningButton, a3);
}

- (void)setShowButton:(id)a3
{
  objc_storeStrong((id *)&self->_showButton, a3);
}

- (UIView)obscuringView
{
  return self->_obscuringView;
}

- (void)setObscuringView:(id)a3
{
  objc_storeStrong((id *)&self->_obscuringView, a3);
}

- (void)setBlurEffect:(id)a3
{
  objc_storeStrong((id *)&self->_blurEffect, a3);
}

- (void)setSensitiveContentDescription:(id)a3
{
  objc_storeStrong((id *)&self->_sensitiveContentDescription, a3);
}

- (void)setObscuredContentBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_obscuredContentBadgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obscuredContentBadgeView, 0);
  objc_storeStrong((id *)&self->_sensitiveContentDescription, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_obscuringView, 0);
  objc_storeStrong((id *)&self->_showButton, 0);
  objc_storeStrong((id *)&self->_warningButton, 0);
  objc_destroyWeak((id *)&self->_obscurableBalloonDelegate);
}

@end
