@implementation CPWindow

- (CPWindow)initWithFrame:(CGRect)a3 templateScene:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CPWindow *v10;
  CPWindow *v11;
  UILayoutGuide *v12;
  UILayoutGuide *mapButtonSafeAreaLayoutGuide;
  UILayoutGuide *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSLayoutConstraint *topConstraint;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *bottomConstraint;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *leftConstraint;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *rightConstraint;
  objc_super v37;
  _QWORD v38[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v38[4] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CPWindow;
  v10 = -[CPWindow initWithFrame:](&v37, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_templateApplicationScene, v9);
    v12 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    -[CPWindow addLayoutGuide:](v11, "addLayoutGuide:", v12);
    mapButtonSafeAreaLayoutGuide = v11->_mapButtonSafeAreaLayoutGuide;
    v11->_mapButtonSafeAreaLayoutGuide = v12;
    v14 = v12;

    -[CPWindow topAnchor](v11, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v14, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 0.0);
    v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

    -[CPWindow bottomAnchor](v11, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v14, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 0.0);
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

    -[CPWindow leftAnchor](v11, "leftAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leftAnchor](v14, "leftAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 0.0);
    v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

    -[CPWindow rightAnchor](v11, "rightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide rightAnchor](v14, "rightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 0.0);
    v26 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x24BDD1628];
    v38[0] = v17;
    v38[1] = v20;
    v38[2] = v23;
    v38[3] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v28);

    topConstraint = v11->_topConstraint;
    v11->_topConstraint = v17;
    v30 = v17;

    bottomConstraint = v11->_bottomConstraint;
    v11->_bottomConstraint = v20;
    v32 = v20;

    leftConstraint = v11->_leftConstraint;
    v11->_leftConstraint = v23;
    v34 = v23;

    rightConstraint = v11->_rightConstraint;
    v11->_rightConstraint = (NSLayoutConstraint *)v26;

  }
  return v11;
}

- (void)updateLayoutGuideWithInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  _QWORD v13[5];

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[CPWindow topConstraint](self, "topConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", -top);

  -[CPWindow bottomConstraint](self, "bottomConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConstant:", bottom);

  -[CPWindow leftConstraint](self, "leftConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", -left);

  -[CPWindow rightConstraint](self, "rightConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", right);

  -[CPWindow setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[CPWindow updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
  v12 = *MEMORY[0x24BDF7BD8];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__CPWindow_updateLayoutGuideWithInsets___block_invoke;
  v13[3] = &unk_24C77C5B0;
  v13[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v13, v12);
}

uint64_t __40__CPWindow_updateLayoutGuideWithInsets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (CPTemplateApplicationScene)templateApplicationScene
{
  return (CPTemplateApplicationScene *)objc_loadWeakRetained((id *)&self->_templateApplicationScene);
}

- (void)setTemplateApplicationScene:(CPTemplateApplicationScene *)templateApplicationScene
{
  objc_storeWeak((id *)&self->_templateApplicationScene, templateApplicationScene);
}

- (UILayoutGuide)mapButtonSafeAreaLayoutGuide
{
  return self->_mapButtonSafeAreaLayoutGuide;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (NSLayoutConstraint)leftConstraint
{
  return self->_leftConstraint;
}

- (void)setLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leftConstraint, a3);
}

- (NSLayoutConstraint)rightConstraint
{
  return self->_rightConstraint;
}

- (void)setRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_rightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_mapButtonSafeAreaLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_templateApplicationScene);
}

@end
