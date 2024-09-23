@implementation SFPrivacyReportGridTableViewCell

- (SFPrivacyReportGridTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFPrivacyReportGridTableViewCell *v4;
  SFPrivacyReportGridTableViewCell *v5;
  void *v6;
  SFPrivacyReportGridTableViewCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFPrivacyReportGridTableViewCell;
  v4 = -[SFPrivacyReportGridTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SFPrivacyReportGridTableViewCell setBackgroundView:](v4, "setBackgroundView:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportGridTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = v5;
  }

  return v5;
}

- (void)setGridView:(id)a3
{
  SFPrivacyReportGridView *v5;
  SFPrivacyReportGridView **p_gridView;
  SFPrivacyReportGridView *gridView;
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
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v5 = (SFPrivacyReportGridView *)a3;
  p_gridView = &self->_gridView;
  gridView = self->_gridView;
  if (gridView != v5)
  {
    if (-[SFPrivacyReportGridView isDescendantOfView:](gridView, "isDescendantOfView:", self))
      -[SFPrivacyReportGridView removeFromSuperview](*p_gridView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_gridView, a3);
    if (*p_gridView)
    {
      -[SFPrivacyReportGridView setPreservesSuperviewLayoutMargins:](*p_gridView, "setPreservesSuperviewLayoutMargins:", 1);
      -[SFPrivacyReportGridView setTranslatesAutoresizingMaskIntoConstraints:](*p_gridView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SFPrivacyReportGridTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_gridView);
      v17 = (void *)MEMORY[0x1E0CB3718];
      -[SFPrivacyReportGridView leadingAnchor](*p_gridView, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v20;
      -[SFPrivacyReportGridView trailingAnchor](*p_gridView, "trailingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v9;
      -[SFPrivacyReportGridView topAnchor](*p_gridView, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v12;
      -[SFPrivacyReportGridView bottomAnchor](*p_gridView, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[3] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activateConstraints:", v16);

    }
  }

}

- (SFPrivacyReportGridView)gridView
{
  return self->_gridView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridView, 0);
}

@end
