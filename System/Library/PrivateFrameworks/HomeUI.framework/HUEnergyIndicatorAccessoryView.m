@implementation HUEnergyIndicatorAccessoryView

- (HUEnergyIndicatorAccessoryView)initWithEnergyIndicator:(id)a3
{
  id v5;
  HUEnergyIndicatorAccessoryView *v6;
  HUEnergyIndicatorAccessoryView *v7;
  id *p_energyIndicatorView;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUEnergyIndicatorAccessoryView;
  v6 = -[HUEnergyIndicatorAccessoryView init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    p_energyIndicatorView = (id *)&v6->_energyIndicatorView;
    objc_storeStrong((id *)&v6->_energyIndicatorView, a3);
    objc_msgSend(*p_energyIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_energyIndicatorView, "setBackgroundColor:", v9);

    objc_msgSend(*p_energyIndicatorView, "setContentMode:", 1);
    objc_msgSend(*p_energyIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUEnergyIndicatorAccessoryView energyIndicatorView](v7, "energyIndicatorView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEnergyIndicatorAccessoryView addSubview:](v7, "addSubview:", v10);

    -[HUEnergyIndicatorAccessoryView setNeedsUpdateConstraints](v7, "setNeedsUpdateConstraints");
  }

  return v7;
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
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  -[HUEnergyIndicatorAccessoryView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[HUEnergyIndicatorAccessoryView energyIndicatorView](self, "energyIndicatorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 5, 0, self, 5, 1.0, 16.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    v8 = (void *)MEMORY[0x1E0CB3718];
    -[HUEnergyIndicatorAccessoryView energyIndicatorView](self, "energyIndicatorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 3, 0, self, 3, 1.0, 16.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    v11 = (void *)MEMORY[0x1E0CB3718];
    -[HUEnergyIndicatorAccessoryView energyIndicatorView](self, "energyIndicatorView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 4, 0, self, 4, 1.0, -16.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    v14 = (void *)MEMORY[0x1E0CB3718];
    -[HUEnergyIndicatorAccessoryView energyIndicatorView](self, "energyIndicatorView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 6, 0, self, 6, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    -[HUEnergyIndicatorAccessoryView setConstraints:](self, "setConstraints:", v4);
    v17 = (void *)MEMORY[0x1E0CB3718];
    -[HUEnergyIndicatorAccessoryView constraints](self, "constraints");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v18);

  }
  v19.receiver = self;
  v19.super_class = (Class)HUEnergyIndicatorAccessoryView;
  -[HUEnergyIndicatorAccessoryView updateConstraints](&v19, sel_updateConstraints);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[HUEnergyIndicatorAccessoryView energyIndicatorView](self, "energyIndicatorView", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
  v5 = v4;
  v7 = v6;

  v8 = v5 + 16.0;
  v9 = v7 + 32.0;
  result.height = v9;
  result.width = v8;
  return result;
}

- (UIView)energyIndicatorView
{
  return self->_energyIndicatorView;
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void)setEnergyIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_energyIndicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_energyIndicatorView, 0);
}

@end
