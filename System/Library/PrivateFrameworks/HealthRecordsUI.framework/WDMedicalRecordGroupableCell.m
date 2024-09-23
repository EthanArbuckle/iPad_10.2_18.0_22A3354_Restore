@implementation WDMedicalRecordGroupableCell

- (WDMedicalRecordGroupableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDMedicalRecordGroupableCell *v4;
  WDMedicalRecordGroupableCell *v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)WDMedicalRecordGroupableCell;
  v4 = -[WDMedicalRecordGroupableCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WDMedicalRecordGroupableCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[WDMedicalRecordGroupableCell setupSubviews](v5, "setupSubviews");
    -[WDMedicalRecordGroupableCell setUpConstraints](v5, "setUpConstraints");
    -[WDMedicalRecordGroupableCell setIntendedPlacement:](v5, "setIntendedPlacement:", 0);
    v10[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)-[WDMedicalRecordGroupableCell registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", v6, sel__traitCollectionDidChange_);

  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDMedicalRecordGroupableCell;
  -[WDMedicalRecordGroupableCell prepareForReuse](&v3, sel_prepareForReuse);
  -[WDMedicalRecordGroupableCell setHighlighted:](self, "setHighlighted:", 0);
}

- (void)setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[WDMedicalRecordGroupableCell setPillBackgroundView:](self, "setPillBackgroundView:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell setPillBackgroundColor:](self, "setPillBackgroundColor:", v4);

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordGroupableCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[WDMedicalRecordGroupableCell setSeparatorInsets:](self, "setSeparatorInsets:", 0.0, 16.0, 0.0, 16.0);
  v8 = objc_alloc(MEMORY[0x1E0D2F848]);
  v9 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[WDMedicalRecordGroupableCell setSeparatorView:](self, "setSeparatorView:", v9);

  -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordGroupableCell traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayPixel");
  v13 = v12;
  -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSeparatorThickness:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_clinicalRecordSeparatorColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setColor:", v15);

  -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDashStyle:", 1);

  -[WDMedicalRecordGroupableCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell setSeparatorDashStyle:hidden:](self, "setSeparatorDashStyle:hidden:", objc_msgSend(v20, "dashStyle"), 1);

}

- (void)setUpConstraints
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
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[9];

  v48[7] = *MEMORY[0x1E0C80C00];
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell setTopConstraint:](self, "setTopConstraint:", v7);

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell setBottomConstraint:](self, "setBottomConstraint:", v12);

  -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell separatorInsets](self, "separatorInsets");
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell setSeparatorLeadingConstant:](self, "setSeparatorLeadingConstant:", v18);

  -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell separatorInsets](self, "separatorInsets");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, -v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell setSeparatorTrailingConstraint:](self, "setSeparatorTrailingConstraint:", v24);

  v38 = (void *)MEMORY[0x1E0CB3718];
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "layoutMarginsGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v42;
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layoutMarginsGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v35;
  -[WDMedicalRecordGroupableCell topConstraint](self, "topConstraint");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v25;
  -[WDMedicalRecordGroupableCell bottomConstraint](self, "bottomConstraint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v26;
  -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v31;
  -[WDMedicalRecordGroupableCell separatorLeadingConstant](self, "separatorLeadingConstant");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v32;
  -[WDMedicalRecordGroupableCell separatorTrailingConstraint](self, "separatorTrailingConstraint");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v34);

}

- (void)setSeparatorDashStyle:(int64_t)a3 hidden:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;

  v4 = a4;
  -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDashStyle:", a3);

  -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v4);

}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  self->_separatorInsets = a3;
  -[WDMedicalRecordGroupableCell separatorInsets](self, "separatorInsets");
  v5 = v4;
  -[WDMedicalRecordGroupableCell separatorLeadingConstant](self, "separatorLeadingConstant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  -[WDMedicalRecordGroupableCell separatorInsets](self, "separatorInsets");
  v8 = -v7;
  -[WDMedicalRecordGroupableCell separatorTrailingConstraint](self, "separatorTrailingConstraint");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConstant:", v8);

}

+ (double)defaultGap
{
  return 16.0;
}

- (void)setExtraTopPadding:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  id v7;

  self->_extraTopPadding = a3;
  v4 = 0.0;
  if (a3)
    v4 = 10.0;
  -[WDMedicalRecordGroupableCell setSectionTopPadding:](self, "setSectionTopPadding:", v4);
  -[WDMedicalRecordGroupableCell _topPadding](self, "_topPadding");
  v6 = v5;
  -[WDMedicalRecordGroupableCell topConstraint](self, "topConstraint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

}

- (void)setPillBackgroundColorOverride:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_pillBackgroundColorOverride != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pillBackgroundColorOverride, a3);
    -[WDMedicalRecordGroupableCell _updateForIntendedPlacement](self, "_updateForIntendedPlacement");
    v5 = v6;
  }

}

- (double)_cornerRadius
{
  return 10.0;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  objc_super v11;

  v4 = a4;
  v5 = a3;
  if (-[WDMedicalRecordGroupableCell selectionStyle](self, "selectionStyle") == 3)
  {
    v11.receiver = self;
    v11.super_class = (Class)WDMedicalRecordGroupableCell;
    -[WDMedicalRecordGroupableCell setHighlighted:animated:](&v11, sel_setHighlighted_animated_, v5, v4);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__WDMedicalRecordGroupableCell_setHighlighted_animated___block_invoke;
    v9[3] = &unk_1E74D1808;
    v9[4] = self;
    v10 = v5;
    v7 = _Block_copy(v9);
    v8 = v7;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, 0.5);
    else
      (*((void (**)(void *))v7 + 2))(v7);

  }
}

void __56__WDMedicalRecordGroupableCell_setHighlighted_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(MEMORY[0x1E0DC3658], "hrui_tableViewCellHighlightColor");
  else
    objc_msgSend(*(id *)(a1 + 32), "pillBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pillBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

- (void)setIntendedPlacement:(int64_t)a3
{
  if (self->_intendedPlacement != a3)
  {
    self->_intendedPlacement = a3;
    -[WDMedicalRecordGroupableCell _updateForIntendedPlacement](self, "_updateForIntendedPlacement");
  }
}

- (void)_updateForIntendedPlacement
{
  int64_t intendedPlacement;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  intendedPlacement = self->_intendedPlacement;
  if (intendedPlacement == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordGroupableCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordGroupableCell setBackgroundColor:](self, "setBackgroundColor:", v9);

    if (self->_pillBackgroundColorOverride)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!intendedPlacement)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDMedicalRecordGroupableCell contentView](self, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v4);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDMedicalRecordGroupableCell setBackgroundColor:](self, "setBackgroundColor:", v6);

      if (self->_pillBackgroundColorOverride)
      {
        -[WDMedicalRecordGroupableCell setPillBackgroundColor:](self, "setPillBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDMedicalRecordGroupableCell setPillBackgroundColor:](self, "setPillBackgroundColor:", v14);

      }
      -[WDMedicalRecordGroupableCell _topPadding](self, "_topPadding");
      v16 = v15;
      -[WDMedicalRecordGroupableCell topConstraint](self, "topConstraint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setConstant:", v16);

      -[WDMedicalRecordGroupableCell bottomConstraint](self, "bottomConstraint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setConstant:", 0.0);
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordGroupableCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordGroupableCell setBackgroundColor:](self, "setBackgroundColor:", v13);

    if (self->_pillBackgroundColorOverride)
    {
LABEL_8:
      -[WDMedicalRecordGroupableCell setPillBackgroundColor:](self, "setPillBackgroundColor:");
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v10;
  -[WDMedicalRecordGroupableCell setPillBackgroundColor:](self, "setPillBackgroundColor:", v10);
LABEL_13:

LABEL_14:
  switch(self->_intendedPlacement)
  {
    case 2:
      -[WDMedicalRecordGroupableCell _cornerRadius](self, "_cornerRadius");
      v20 = v19;
      -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCornerRadius:", v20);

      -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = 15;
      goto LABEL_19;
    case 3:
      -[WDMedicalRecordGroupableCell _cornerRadius](self, "_cornerRadius");
      v28 = v27;
      -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setCornerRadius:", v28);

      -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = 3;
      goto LABEL_19;
    case 4:
      -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setCornerRadius:", 0.0);
      goto LABEL_20;
    case 5:
      -[WDMedicalRecordGroupableCell _cornerRadius](self, "_cornerRadius");
      v32 = v31;
      -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "layer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setCornerRadius:", v32);

      -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = 12;
LABEL_19:
      objc_msgSend(v24, "setMaskedCorners:", v26);
LABEL_20:

      -[WDMedicalRecordGroupableCell _topPadding](self, "_topPadding");
      v36 = v35;
      -[WDMedicalRecordGroupableCell topConstraint](self, "topConstraint");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setConstant:", v36);

      -[WDMedicalRecordGroupableCell bottomConstraint](self, "bottomConstraint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setConstant:", 0.0);

      break;
    default:
      break;
  }
  -[WDMedicalRecordGroupableCell pillBackgroundColor](self, "pillBackgroundColor");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setBackgroundColor:", v40);

}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  void *v4;
  NSString *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDMedicalRecordGroupableCell;
  -[WDMedicalRecordGroupableCell _updateForCurrentSizeCategory](&v6, sel__updateForCurrentSizeCategory);
  -[WDMedicalRecordGroupableCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIContentSizeCategoryMin();
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  -[WDMedicalRecordGroupableCell _updateForContentSizeCategory:](self, "_updateForContentSizeCategory:", v5);
  -[WDMedicalRecordGroupableCell _updateBasedOnAccessibilityCategory:](self, "_updateBasedOnAccessibilityCategory:", UIContentSizeCategoryIsAccessibilityCategory(v5));

}

- (void)_traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (v4)
  {
    -[WDMedicalRecordGroupableCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    v4 = v16;
    if ((v8 & 1) == 0)
    {
      -[WDMedicalRecordGroupableCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
      v4 = v16;
    }
  }
  objc_msgSend(v4, "displayPixel");
  -[WDMedicalRecordGroupableCell traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayPixel");
  v10 = HKUIEqualCGFloats();

  if ((v10 & 1) == 0)
  {
    -[WDMedicalRecordGroupableCell traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayPixel");
    v13 = v12;
    -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSeparatorThickness:", v13);

    -[WDMedicalRecordGroupableCell separatorView](self, "separatorView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsDisplay");

  }
}

- (BOOL)extraTopPadding
{
  return self->_extraTopPadding;
}

- (int64_t)intendedPlacement
{
  return self->_intendedPlacement;
}

- (UIView)pillBackgroundView
{
  return self->_pillBackgroundView;
}

- (void)setPillBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_pillBackgroundView, a3);
}

- (UIColor)pillBackgroundColorOverride
{
  return self->_pillBackgroundColorOverride;
}

- (UIEdgeInsets)separatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorInsets.top;
  left = self->_separatorInsets.left;
  bottom = self->_separatorInsets.bottom;
  right = self->_separatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIColor)pillBackgroundColor
{
  return self->_pillBackgroundColor;
}

- (void)setPillBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_pillBackgroundColor, a3);
}

- (double)sectionTopPadding
{
  return self->_sectionTopPadding;
}

- (void)setSectionTopPadding:(double)a3
{
  self->_sectionTopPadding = a3;
}

- (HKSeparatorLineView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (NSLayoutConstraint)separatorLeadingConstant
{
  return self->_separatorLeadingConstant;
}

- (void)setSeparatorLeadingConstant:(id)a3
{
  objc_storeStrong((id *)&self->_separatorLeadingConstant, a3);
}

- (NSLayoutConstraint)separatorTrailingConstraint
{
  return self->_separatorTrailingConstraint;
}

- (void)setSeparatorTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_separatorTrailingConstraint, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_separatorTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_separatorLeadingConstant, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_pillBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pillBackgroundColorOverride, 0);
  objc_storeStrong((id *)&self->_pillBackgroundView, 0);
}

@end
