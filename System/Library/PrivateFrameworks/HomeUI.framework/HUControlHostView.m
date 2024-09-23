@implementation HUControlHostView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUControlHostView)initWithControlView:(id)a3
{
  id v4;
  HUControlHostView *v5;
  HUControlHostView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUControlHostView;
  v5 = -[HUControlHostView init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HUControlHostView setControlView:](v5, "setControlView:", v4);

  return v6;
}

- (void)setControlView:(id)a3
{
  UIView *v5;
  UIView **p_controlView;
  UIView *controlView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_controlView = &self->_controlView;
  controlView = self->_controlView;
  if (controlView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](controlView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_controlView, a3);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_controlView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setPreservesSuperviewLayoutMargins:](*p_controlView, "setPreservesSuperviewLayoutMargins:", 1);
    -[HUControlHostView addSubview:](self, "addSubview:", *p_controlView);
    -[HUControlHostView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v8;
  }

}

- (void)setRequiresWellDefinedSize:(BOOL)a3
{
  if (self->_requiresWellDefinedSize != a3)
  {
    self->_requiresWellDefinedSize = a3;
    -[HUControlHostView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateConstraints
{
  NSObject *v3;
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
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  NSObject *v27;
  objc_super v28;
  uint8_t buf[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Inside HUControlHostView::updateConstraints", buf, 2u);
  }

  -[HUControlHostView controlConstraints](self, "controlConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[HUControlHostView controlConstraints](self, "controlConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

    -[HUControlHostView setControlConstraints:](self, "setControlConstraints:", 0);
  }
  -[HUControlHostView controlView](self, "controlView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    -[HUControlHostView controlView](self, "controlView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUControlHostView centerXAnchor](self, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

    -[HUControlHostView controlView](self, "controlView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUControlHostView centerYAnchor](self, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v16);

    -[HUControlHostView controlView](self, "controlView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUControlHostView widthAnchor](self, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[HUControlHostView requiresWellDefinedSize](self, "requiresWellDefinedSize"))
      *(float *)&v21 = 1000.0;
    else
      *(float *)&v21 = 251.0;
    objc_msgSend(v20, "setPriority:", v21);
    objc_msgSend(v8, "addObject:", v20);
    -[HUControlHostView controlView](self, "controlView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUControlHostView heightAnchor](self, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[HUControlHostView requiresWellDefinedSize](self, "requiresWellDefinedSize"))
      *(float *)&v26 = 1000.0;
    else
      *(float *)&v26 = 251.0;
    objc_msgSend(v25, "setPriority:", v26);
    objc_msgSend(v8, "addObject:", v25);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v8);
    -[HUControlHostView setControlConstraints:](self, "setControlConstraints:", v8);

  }
  HFLogForCategory();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "super.updateConstraints in HUControlHostView::updateConstraints", buf, 2u);
  }

  v28.receiver = self;
  v28.super_class = (Class)HUControlHostView;
  -[HUControlHostView updateConstraints](&v28, sel_updateConstraints);
}

- (BOOL)requiresWellDefinedSize
{
  return self->_requiresWellDefinedSize;
}

- (UIView)controlView
{
  return self->_controlView;
}

- (NSArray)controlConstraints
{
  return self->_controlConstraints;
}

- (void)setControlConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_controlConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlConstraints, 0);
  objc_storeStrong((id *)&self->_controlView, 0);
}

@end
