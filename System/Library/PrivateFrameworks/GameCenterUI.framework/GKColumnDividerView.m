@implementation GKColumnDividerView

- (GKColumnDividerView)initWithFrame:(CGRect)a3
{
  GKColumnDividerView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKColumnDividerView;
  v3 = -[GKColumnDividerView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[GKHairlineView hairlineViewForAlignment:](GKHairlineView, "hairlineViewForAlignment:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKColumnDividerView setHairlineView:](v3, "setHairlineView:", v4);

    -[GKHairlineView setTranslatesAutoresizingMaskIntoConstraints:](v3->_hairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKColumnDividerView addSubview:](v3, "addSubview:", v3->_hairlineView);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_hairlineView, 5, 0, v3, 5, 1.0, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKColumnDividerView addConstraint:](v3, "addConstraint:", v5);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_hairlineView, 8, 0, v3, 8, 1.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKColumnDividerView addConstraint:](v3, "addConstraint:", v6);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_hairlineView, 3, 0, v3, 3, 1.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKColumnDividerView addConstraint:](v3, "addConstraint:", v7);

  }
  return v3;
}

- (GKHairlineView)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairlineView, 0);
}

@end
