@implementation EKUIDividedGridViewTableViewCell

- (EKUIDividedGridViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 gridViewType:(int64_t)a5 buttonTitles:(id)a6 cellBackgroundColor:(id)a7
{
  id v12;
  id v13;
  EKUIDividedGridViewTableViewCell *v14;
  EKUIDividedGridViewController *v15;
  EKUIDividedGridViewController *gridViewController;
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
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  v48.receiver = self;
  v48.super_class = (Class)EKUIDividedGridViewTableViewCell;
  v14 = -[EKUIDividedGridViewTableViewCell initWithStyle:reuseIdentifier:](&v48, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v14)
  {
    v15 = -[EKUIDividedGridViewController initWithType:buttonTitles:cellBackgroundColor:]([EKUIDividedGridViewController alloc], "initWithType:buttonTitles:cellBackgroundColor:", a5, v12, v13);
    gridViewController = v14->_gridViewController;
    v14->_gridViewController = v15;

    -[EKUIDividedGridViewController view](v14->_gridViewController, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIDividedGridViewTableViewCell contentView](v14, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v17);

    -[EKUIDividedGridViewTableViewCell contentView](v14, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIDividedGridViewTableViewCell contentView](v14, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 9, 0, v17, 9, 1.0, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addConstraint:", v22);

    -[EKUIDividedGridViewTableViewCell contentView](v14, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPreservesSuperviewLayoutMargins:", 1);

    -[EKUIDividedGridViewTableViewCell setPreservesSuperviewLayoutMargins:](v14, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(v17, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIDividedGridViewTableViewCell contentView](v14, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "safeAreaLayoutGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIDividedGridViewTableViewCell contentView](v14, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "safeAreaLayoutGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)MEMORY[0x1E0CB3718];
    v50[0] = v28;
    v50[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v35);

    -[EKUIDividedGridViewTableViewCell contentView](v14, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 7, -1, 0, 0, 1.0, 100000.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addConstraint:", v37);

    v38 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIDividedGridViewTableViewCell contentView](v14, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 8, 1, v17, 8, 1.0, 0.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v41) = 1148829696;
    objc_msgSend(v40, "setPriority:", v41);
    v42 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIDividedGridViewTableViewCell contentView](v14, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, 3, 0, v17, 3, 1.0, 0.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUIDividedGridViewTableViewCell contentView](v14, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v40;
    v49[1] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addConstraints:", v46);

  }
  return v14;
}

- (void)layoutSubviews
{
  void *v3;
  double Width;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)EKUIDividedGridViewTableViewCell;
  -[EKUIDividedGridViewTableViewCell layoutSubviews](&v10, sel_layoutSubviews);
  if (-[EKUIDividedGridViewTableViewCell _isWiderThanMaximum](self, "_isWiderThanMaximum"))
  {
    -[EKUIDividedGridViewTableViewCell gridViewController](self, "gridViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPreferredWidth:", 100000.0);
  }
  else
  {
    -[EKUIDividedGridViewTableViewCell bounds](self, "bounds");
    Width = CGRectGetWidth(v11);
    -[EKUIDividedGridViewTableViewCell safeAreaInsets](self, "safeAreaInsets");
    v6 = v5;
    -[EKUIDividedGridViewTableViewCell safeAreaInsets](self, "safeAreaInsets");
    v8 = v6 + v7;
    -[EKUIDividedGridViewTableViewCell gridViewController](self, "gridViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreferredWidth:", Width);

    -[EKUIDividedGridViewTableViewCell gridViewController](self, "gridViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPreferredInset:", v8);
  }

}

- (BOOL)_isWiderThanMaximum
{
  CGRect v3;

  -[EKUIDividedGridViewTableViewCell bounds](self, "bounds");
  return CGRectGetWidth(v3) > 100000.0;
}

- (CGRect)_separatorFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)wantsDrawBackground
{
  return 1;
}

- (EKUIDividedGridViewController)gridViewController
{
  return (EKUIDividedGridViewController *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setGridViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (BOOL)drawsTopDivider
{
  return self->_drawsTopDivider;
}

- (void)setDrawsTopDivider:(BOOL)a3
{
  self->_drawsTopDivider = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridViewController, 0);
}

@end
