@implementation ICCollapsibleBaseView

- (BOOL)wantsLayer
{
  return 1;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICCollapsibleBaseView;
  -[ICCollapsibleBaseView awakeFromNib](&v3, sel_awakeFromNib);
  -[ICCollapsibleBaseView setCollapsed:](self, "setCollapsed:", 1);
}

- (void)setUpIfNeeded
{
  if (!-[ICCollapsibleBaseView setupComplete](self, "setupComplete"))
  {
    -[ICCollapsibleBaseView setSetupComplete:](self, "setSetupComplete:", 1);
    -[ICCollapsibleBaseView performSetup](self, "performSetup");
  }
}

- (NSLayoutConstraint)zeroWidthConstraint
{
  NSLayoutConstraint *zeroWidthConstraint;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *v5;
  double v6;

  zeroWidthConstraint = self->_zeroWidthConstraint;
  if (!zeroWidthConstraint)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 7, 0, 0, 0, 1.0, 0.0);
    v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v5 = self->_zeroWidthConstraint;
    self->_zeroWidthConstraint = v4;

    LODWORD(v6) = 1148813312;
    -[NSLayoutConstraint setPriority:](self->_zeroWidthConstraint, "setPriority:", v6);
    -[NSLayoutConstraint setActive:](self->_zeroWidthConstraint, "setActive:", 1);
    zeroWidthConstraint = self->_zeroWidthConstraint;
  }
  return zeroWidthConstraint;
}

- (void)performSetUpWithContentView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setIc_backgroundColor:](self, "setIc_backgroundColor:", v6);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1148813312;
  -[ICCollapsibleBaseView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  LODWORD(v8) = 1148813312;
  -[ICCollapsibleBaseView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  LODWORD(v9) = 1148813312;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  LODWORD(v10) = 1148813312;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 1, v10);
  LODWORD(v11) = 1148813312;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 0, v11);
  LODWORD(v12) = 1148813312;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 1, v12);
  -[ICCollapsibleBaseView addSubview:](self, "addSubview:", v5);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 5, 0, self, 5, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 6, 0, self, 6, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 3, 0, self, 3, 1.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 4, 0, self, 4, 1.0, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 1148813312;
  objc_msgSend(v13, "setPriority:", v17);
  LODWORD(v18) = 1148813312;
  objc_msgSend(v14, "setPriority:", v18);
  LODWORD(v19) = 1148813312;
  objc_msgSend(v15, "setPriority:", v19);
  LODWORD(v20) = 1148813312;
  objc_msgSend(v16, "setPriority:", v20);
  v21 = (void *)MEMORY[0x1E0CB3718];
  v23[0] = v13;
  v23[1] = v14;
  v23[2] = v15;
  v23[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v22);

  -[ICCollapsibleBaseView setContentView:](self, "setContentView:", v5);
  -[ICCollapsibleBaseView setLeadingConstraint:](self, "setLeadingConstraint:", v13);
  -[ICCollapsibleBaseView setTrailingConstraint:](self, "setTrailingConstraint:", v14);
  -[ICCollapsibleBaseView leadingSpace](self, "leadingSpace");
  -[ICCollapsibleBaseView setLeadingSpace:](self, "setLeadingSpace:");
  -[ICCollapsibleBaseView trailingSpace](self, "trailingSpace");
  -[ICCollapsibleBaseView setTrailingSpace:](self, "setTrailingSpace:");

}

- (void)setCollapsed:(BOOL)a3
{
  _BOOL8 v3;
  float v5;
  void *v6;
  double v7;
  void *v8;

  if (self->_collapsed != a3)
  {
    v3 = a3;
    if (a3)
    {
      v5 = 999.0;
    }
    else
    {
      -[ICCollapsibleBaseView setUpIfNeeded](self, "setUpIfNeeded");
      v5 = 1.0;
    }
    self->_collapsed = v3;
    -[ICCollapsibleBaseView zeroWidthConstraint](self, "zeroWidthConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v7 = v5;
    objc_msgSend(v6, "setPriority:", v7);

    -[ICCollapsibleBaseView setHidden:](self, "setHidden:", v3);
    -[ICCollapsibleBaseView contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v3);

    -[ICCollapsibleBaseView ic_setNeedsUpdateConstraints](self, "ic_setNeedsUpdateConstraints");
  }
}

- (void)setLeadingSpace:(double)a3
{
  void *v5;

  self->_leadingSpace = a3;
  -[ICCollapsibleBaseView leadingConstraint](self, "leadingConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", a3);

  -[ICCollapsibleBaseView ic_setNeedsUpdateConstraints](self, "ic_setNeedsUpdateConstraints");
}

- (void)setTrailingSpace:(double)a3
{
  double v4;
  void *v5;

  self->_trailingSpace = a3;
  v4 = -a3;
  -[ICCollapsibleBaseView trailingConstraint](self, "trailingConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  -[ICCollapsibleBaseView ic_setNeedsUpdateConstraints](self, "ic_setNeedsUpdateConstraints");
}

- (double)leadingSpace
{
  return self->_leadingSpace;
}

- (double)trailingSpace
{
  return self->_trailingSpace;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void)setZeroWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_zeroWidthConstraint, a3);
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraint, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingConstraint, a3);
}

- (BOOL)setupComplete
{
  return self->_setupComplete;
}

- (void)setSetupComplete:(BOOL)a3
{
  self->_setupComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_zeroWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
