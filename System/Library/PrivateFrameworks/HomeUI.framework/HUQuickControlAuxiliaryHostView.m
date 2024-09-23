@implementation HUQuickControlAuxiliaryHostView

- (void)setAuxiliaryView:(id)a3
{
  HUQuickControlAuxiliaryView *v5;
  HUQuickControlAuxiliaryView **p_auxiliaryView;
  HUQuickControlAuxiliaryView *auxiliaryView;
  HUQuickControlAuxiliaryView *v8;

  v5 = (HUQuickControlAuxiliaryView *)a3;
  p_auxiliaryView = &self->_auxiliaryView;
  auxiliaryView = self->_auxiliaryView;
  if (auxiliaryView != v5)
  {
    v8 = v5;
    -[HUQuickControlAuxiliaryView removeFromSuperview](auxiliaryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_auxiliaryView, a3);
    -[HUQuickControlAuxiliaryView setTranslatesAutoresizingMaskIntoConstraints:](*p_auxiliaryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUQuickControlAuxiliaryHostView addSubview:](self, "addSubview:", *p_auxiliaryView);
    -[HUQuickControlAuxiliaryHostView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v8;
  }

}

- (void)updateConstraints
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
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  objc_super v23;

  -[HUQuickControlAuxiliaryHostView auxiliaryView](self, "auxiliaryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[HUQuickControlAuxiliaryHostView auxiliaryView](self, "auxiliaryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlAuxiliaryHostView centerXAnchor](self, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    -[HUQuickControlAuxiliaryHostView auxiliaryView](self, "auxiliaryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlAuxiliaryHostView centerYAnchor](self, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    -[HUQuickControlAuxiliaryHostView auxiliaryView](self, "auxiliaryView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlAuxiliaryHostView widthAnchor](self, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 1132134400;
    objc_msgSend(v14, "hu_constraintsLessThanOrEqualToAnchor:equalityPriority:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v17);

    -[HUQuickControlAuxiliaryHostView auxiliaryView](self, "auxiliaryView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlAuxiliaryHostView heightAnchor](self, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 1132134400;
    objc_msgSend(v19, "hu_constraintsLessThanOrEqualToAnchor:equalityPriority:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v22);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);
  }
  v23.receiver = self;
  v23.super_class = (Class)HUQuickControlAuxiliaryHostView;
  -[HUQuickControlAuxiliaryHostView updateConstraints](&v23, sel_updateConstraints);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[HUQuickControlAuxiliaryHostView auxiliaryView](self, "auxiliaryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlAuxiliaryHostView auxiliaryView](self, "auxiliaryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlAuxiliaryHostView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
  LOBYTE(self) = objc_msgSend(v8, "pointInside:withEvent:", v7);

  return (char)self;
}

- (HUQuickControlAuxiliaryView)auxiliaryView
{
  return self->_auxiliaryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryView, 0);
}

@end
