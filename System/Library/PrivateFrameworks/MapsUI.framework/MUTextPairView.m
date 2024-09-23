@implementation MUTextPairView

- (MUTextPairView)initWithFrame:(CGRect)a3
{
  MUTextPairView *v3;
  MUTextPairView *v4;
  objc_class *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MUTextPairView;
  v3 = -[MUTextPairView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUTextPairView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("TextPair"));
    -[MUTextPairView _setupSubviews](v4, "_setupSubviews");
    -[MUTextPairView _updateConstraints](v4, "_updateConstraints");
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v6);

  }
  return v4;
}

- (void)_setupSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *v8;
  UILabel *leftLabel;
  UILabel *v10;
  UILabel *rightLabel;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  leftLabel = self->_leftLabel;
  self->_leftLabel = v8;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_leftLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_leftLabel, "setNumberOfLines:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_leftLabel, "setAccessibilityIdentifier:", CFSTR("TextPairLeftLabel"));
  -[MUTextPairView addSubview:](self, "addSubview:", self->_leftLabel);
  v10 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  rightLabel = self->_rightLabel;
  self->_rightLabel = v10;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_rightLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_rightLabel, "setNumberOfLines:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_rightLabel, "setAccessibilityIdentifier:", CFSTR("TextPairRightLabel"));
  -[MUTextPairView addSubview:](self, "addSubview:", self->_rightLabel);
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)-[MUTextPairView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v13, sel__contentSizeDidChange);

}

- (BOOL)shouldStackForProposedWidth:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[UILabel idealWidth](self->_leftLabel, "idealWidth");
  v6 = v5 + 8.0;
  -[UILabel idealWidth](self->_rightLabel, "idealWidth");
  return v6 + v7 > a3;
}

- (void)setStacked:(BOOL)a3
{
  if (self->_stacked != a3)
  {
    self->_stacked = a3;
    -[MUTextPairView _updateConstraints](self, "_updateConstraints");
  }
}

- (void)_updateConstraints
{
  UILabel *leftLabel;
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
  NSArray *v15;
  void *constraints;
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
  NSArray *v27;
  NSArray *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
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
  _QWORD v51[10];
  _QWORD v52[9];

  v52[7] = *MEMORY[0x1E0C80C00];
  if (self->_constraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  leftLabel = self->_leftLabel;
  if (self->_stacked)
  {
    -[UILabel topAnchor](leftLabel, "topAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView topAnchor](self, "topAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v6;
    -[UILabel bottomAnchor](self->_leftLabel, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](self->_rightLabel, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v7;
    objc_msgSend(v7, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v48;
    -[UILabel leadingAnchor](self->_leftLabel, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView leadingAnchor](self, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v8;
    objc_msgSend(v8, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v45;
    -[UILabel trailingAnchor](self->_leftLabel, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView trailingAnchor](self, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v43;
    -[UILabel leadingAnchor](self->_rightLabel, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView leadingAnchor](self, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v10;
    objc_msgSend(v10, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52[4] = v40;
    -[UILabel trailingAnchor](self->_rightLabel, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView trailingAnchor](self, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v11;
    objc_msgSend(v11, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v52[5] = v37;
    -[UILabel bottomAnchor](self->_rightLabel, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView bottomAnchor](self, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v12;
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v52[6] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 7);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    constraints = self->_constraints;
    self->_constraints = v15;
  }
  else
  {
    -[UILabel leadingAnchor](leftLabel, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView leadingAnchor](self, "leadingAnchor");
    v34 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = objc_claimAutoreleasedReturnValue();
    v51[0] = v33;
    -[UILabel topAnchor](self->_leftLabel, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView topAnchor](self, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v17;
    objc_msgSend(v17, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v48;
    -[UILabel bottomAnchor](self->_leftLabel, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView bottomAnchor](self, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v18;
    objc_msgSend(v18, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v45;
    -[UILabel trailingAnchor](self->_leftLabel, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](self->_rightLabel, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", -8.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v43;
    -[UILabel centerYAnchor](self->_leftLabel, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView centerYAnchor](self, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v19;
    objc_msgSend(v19, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v40;
    -[UILabel firstBaselineAnchor](self->_leftLabel, "firstBaselineAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](self->_rightLabel, "firstBaselineAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v20;
    objc_msgSend(v20, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v51[5] = v37;
    -[UILabel leadingAnchor](self->_rightLabel, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView centerXAnchor](self, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v21;
    objc_msgSend(v21, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v51[6] = v14;
    -[UILabel topAnchor](self->_rightLabel, "topAnchor");
    constraints = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView topAnchor](self, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(constraints, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[7] = v30;
    -[UILabel bottomAnchor](self->_rightLabel, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView bottomAnchor](self, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v51[8] = v23;
    -[UILabel trailingAnchor](self->_rightLabel, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUTextPairView trailingAnchor](self, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51[9] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 10);
    v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v28 = self->_constraints;
    self->_constraints = v27;

    v9 = v32;
    v6 = (void *)v33;

    v5 = (void *)v34;
    v4 = v35;

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
}

- (void)setViewModel:(id)a3
{
  MUTextPairViewModel *v5;
  MUTextPairViewModel *v6;

  v5 = (MUTextPairViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUTextPairView _updateAppearance](self, "_updateAppearance");
    v5 = v6;
  }

}

- (void)_updateAppearance
{
  void *v3;
  id v4;

  -[MUTextPairViewModel leftText](self->_viewModel, "leftText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_leftLabel, "setText:", v3);

  -[MUTextPairViewModel rightText](self->_viewModel, "rightText");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_rightLabel, "setText:", v4);

}

- (void)_contentSizeDidChange
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_leftLabel, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_rightLabel, "setFont:", v5);

}

- (BOOL)isStacked
{
  return self->_stacked;
}

- (MUTextPairViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_leftLabel, 0);
}

@end
