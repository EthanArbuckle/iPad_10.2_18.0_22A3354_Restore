@implementation EKEventDetailTextCellHeader

- (EKEventDetailTextCellHeader)initWithTitle:(id)a3
{
  id v4;
  EKEventDetailTextCellHeader *v5;
  uint64_t v6;
  NSMutableArray *constraints;
  UILabel *v8;
  UILabel *titleLabel;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  UILabel *v14;
  UILabel *showMoreLabel;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  UIImageView *showMoreChevron;
  double v25;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)EKEventDetailTextCellHeader;
  v5 = -[EKEventDetailTextCellHeader init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    constraints = v5->_constraints;
    v5->_constraints = (NSMutableArray *)v6;

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_titleLabel, "setTextColor:", v12);

    -[UILabel setText:](v5->_titleLabel, "setText:", v4);
    LODWORD(v13) = 1144766464;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v13);
    -[EKEventDetailTextCellHeader addSubview:](v5, "addSubview:", v5->_titleLabel);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    showMoreLabel = v5->_showMoreLabel;
    v5->_showMoreLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_showMoreLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_showMoreLabel, "setFont:", v16);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_showMoreLabel, "setTextColor:", v17);

    EventKitUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Show more"), &stru_1E601DFA8, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5->_showMoreLabel, "setText:", v19);

    v20 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[EKEventDetailTextCellHeader traitCollection](v5, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    TableViewDisclosureIndicatorImage(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "initWithImage:", v22);
    showMoreChevron = v5->_showMoreChevron;
    v5->_showMoreChevron = (UIImageView *)v23;

    LODWORD(v25) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_showMoreChevron, "setContentCompressionResistancePriority:forAxis:", 0, v25);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_showMoreChevron, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v5, sel__tapped);
    -[EKEventDetailTextCellHeader addGestureRecognizer:](v5, "addGestureRecognizer:", v26);
    -[EKEventDetailTextCellHeader _updateConstraints](v5, "_updateConstraints");

  }
  return v5;
}

- (void)_tapped
{
  id v2;

  if (self->_showsShowMoreLabel)
  {
    -[EKEventDetailTextCellHeader delegate](self, "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cellHeaderTapped");

  }
}

- (void)setShowsShowMoreLabel:(BOOL)a3
{
  if (self->_showsShowMoreLabel != a3)
  {
    self->_showsShowMoreLabel = a3;
    -[EKEventDetailTextCellHeader _updateConstraints](self, "_updateConstraints");
  }
}

- (void)_updateConstraints
{
  unint64_t v3;
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
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSMutableArray *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableArray *constraints;
  uint64_t v37;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  _QWORD v47[10];

  v47[8] = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  if (self->_showsShowMoreLabel)
  {
    -[EKEventDetailTextCellHeader addSubview:](self, "addSubview:", self->_showMoreLabel);
    -[EKEventDetailTextCellHeader addSubview:](self, "addSubview:", self->_showMoreChevron);
    constraints = self->_constraints;
    -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailTextCellHeader leadingAnchor](self, "leadingAnchor");
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v34 = objc_claimAutoreleasedReturnValue();
    v47[0] = v34;
    -[UILabel topAnchor](self->_titleLabel, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailTextCellHeader topAnchor](self, "topAnchor");
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v45;
    -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailTextCellHeader bottomAnchor](self, "bottomAnchor");
    v32 = objc_claimAutoreleasedReturnValue();
    v44 = v4;
    objc_msgSend(v4, "constraintEqualToAnchor:", v32);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v43;
    -[UILabel leadingAnchor](self->_showMoreLabel, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:constant:", 6.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v41;
    -[UIImageView leadingAnchor](self->_showMoreChevron, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](self->_showMoreLabel, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_showMoreLabel, "font");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_scaledValueForValue:", 8.0);
    v39 = v5;
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v28;
    -[UIImageView trailingAnchor](self->_showMoreChevron, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailTextCellHeader trailingAnchor](self, "trailingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v47[5] = v7;
    -[UILabel firstBaselineAnchor](self->_showMoreLabel, "firstBaselineAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v47[6] = v10;
    -[UIImageView firstBaselineAnchor](self->_showMoreChevron, "firstBaselineAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v47[7] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](constraints, "addObjectsFromArray:", v14);

    v15 = v33;
    v16 = (void *)v34;

    v3 = 0x1E0CB3000;
    v17 = (void *)v37;

    v18 = (void *)v32;
    v19 = v38;

    v20 = v31;
    v21 = (void *)v35;

  }
  else
  {
    -[UILabel removeFromSuperview](self->_showMoreLabel, "removeFromSuperview");
    -[UIImageView removeFromSuperview](self->_showMoreChevron, "removeFromSuperview");
    v40 = self->_constraints;
    -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailTextCellHeader leadingAnchor](self, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v16;
    -[UILabel topAnchor](self->_titleLabel, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailTextCellHeader topAnchor](self, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v21);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v45;
    -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
    v22 = objc_claimAutoreleasedReturnValue();
    -[EKEventDetailTextCellHeader bottomAnchor](self, "bottomAnchor");
    v23 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)v22;
    v24 = (void *)v22;
    v18 = (void *)v23;
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v43;
    -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailTextCellHeader trailingAnchor](self, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v40;
    v39 = (void *)v25;
    -[NSMutableArray addObjectsFromArray:](v26, "addObjectsFromArray:");
  }

  objc_msgSend(*(id *)(v3 + 1816), "activateConstraints:", self->_constraints);
}

- (BOOL)showsShowMoreLabel
{
  return self->_showsShowMoreLabel;
}

- (EKEventDetailTextCellHeaderDelegate)delegate
{
  return (EKEventDetailTextCellHeaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_showMoreChevron, 0);
  objc_storeStrong((id *)&self->_showMoreLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
