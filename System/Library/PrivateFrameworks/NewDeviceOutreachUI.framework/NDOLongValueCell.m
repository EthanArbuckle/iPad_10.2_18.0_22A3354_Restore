@implementation NDOLongValueCell

- (NDOLongValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NDOLongValueCell *v4;
  NDOLongValueCell *v5;
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
  void *v22;
  double v23;
  void *v24;
  double v25;
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
  double v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)NDOLongValueCell;
  v4 = -[NDOLongValueCell initWithStyle:reuseIdentifier:](&v44, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[NDOLongValueCell setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSTableCell titleLabel](v5, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[PSTableCell valueLabel](v5, "valueLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    v8 = (void *)objc_opt_new();
    -[NDOLongValueCell setStackView:](v5, "setStackView:", v8);

    -[NDOLongValueCell stackView](v5, "stackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[NDOLongValueCell stackView](v5, "stackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAxis:", 0);

    -[NDOLongValueCell stackView](v5, "stackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSpacing:", 10.0);

    -[NDOLongValueCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOLongValueCell stackView](v5, "stackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    v14 = (void *)objc_opt_new();
    -[NDOLongValueCell setPrimaryLabel:](v5, "setPrimaryLabel:", v14);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOLongValueCell primaryLabel](v5, "primaryLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v15);

    -[NDOLongValueCell primaryLabel](v5, "primaryLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[NDOLongValueCell primaryLabel](v5, "primaryLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNumberOfLines:", 0);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "font");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOLongValueCell primaryLabel](v5, "primaryLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v20);

    -[NDOLongValueCell primaryLabel](v5, "primaryLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 1148846080;
    objc_msgSend(v22, "setContentCompressionResistancePriority:forAxis:", 0, v23);

    -[NDOLongValueCell primaryLabel](v5, "primaryLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 1148846080;
    objc_msgSend(v24, "setContentHuggingPriority:forAxis:", 0, v25);

    -[NDOLongValueCell stackView](v5, "stackView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOLongValueCell primaryLabel](v5, "primaryLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addArrangedSubview:", v27);

    v28 = (void *)objc_opt_new();
    -[NDOLongValueCell setSecondaryLabel:](v5, "setSecondaryLabel:", v28);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOLongValueCell secondaryLabel](v5, "secondaryLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTextColor:", v29);

    -[NDOLongValueCell secondaryLabel](v5, "secondaryLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[NDOLongValueCell secondaryLabel](v5, "secondaryLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setNumberOfLines:", 0);

    -[PSTableCell valueLabel](v5, "valueLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "font");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOLongValueCell secondaryLabel](v5, "secondaryLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFont:", v34);

    -[NDOLongValueCell secondaryLabel](v5, "secondaryLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setTextAlignment:", 2);

    -[NDOLongValueCell secondaryLabel](v5, "secondaryLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = 1148846080;
    objc_msgSend(v37, "setContentCompressionResistancePriority:forAxis:", 0, v38);

    -[NDOLongValueCell secondaryLabel](v5, "secondaryLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = 1148846080;
    objc_msgSend(v39, "setContentHuggingPriority:forAxis:", 0, v40);

    -[NDOLongValueCell stackView](v5, "stackView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOLongValueCell secondaryLabel](v5, "secondaryLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addArrangedSubview:", v42);

  }
  return v5;
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
  int64_t v12;
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
  objc_super v33;

  -[NDOLongValueCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMarginsGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD1628];
  -[NDOLongValueCell constraints](self, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateConstraints:", v6);

  v7 = (void *)objc_opt_new();
  -[NDOLongValueCell stackView](self, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

  v12 = -[PSTableCell type](self, "type");
  -[NDOLongValueCell stackView](self, "stackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == 2)
  {
    -[NDOLongValueCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v17);

  }
  else
  {
    objc_msgSend(v4, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v16);
  }

  -[NDOLongValueCell stackView](self, "stackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v21);

  -[NDOLongValueCell stackView](self, "stackView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v25);

  -[NDOLongValueCell stackView](self, "stackView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v29);

  v30 = (void *)objc_msgSend(v7, "copy");
  -[NDOLongValueCell setConstraints:](self, "setConstraints:", v30);

  v31 = (void *)MEMORY[0x24BDD1628];
  -[NDOLongValueCell constraints](self, "constraints");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v32);

  v33.receiver = self;
  v33.super_class = (Class)NDOLongValueCell;
  -[NDOLongValueCell updateConstraints](&v33, sel_updateConstraints);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NDOLongValueCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v19, sel_refreshCellContentsWithSpecifier_, a3);
  -[PSTableCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOLongValueCell primaryLabel](self, "primaryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[PSTableCell valueLabel](self, "valueLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOLongValueCell secondaryLabel](self, "secondaryLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsView:", v12);

  if (v9)
  {
    if ((v13 & 1) == 0)
    {
      -[NDOLongValueCell stackView](self, "stackView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOLongValueCell secondaryLabel](self, "secondaryLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addArrangedSubview:", v15);

    }
    -[PSTableCell valueLabel](self, "valueLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOLongValueCell secondaryLabel](self, "secondaryLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    goto LABEL_7;
  }
  if (v13)
  {
    -[NDOLongValueCell stackView](self, "stackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOLongValueCell secondaryLabel](self, "secondaryLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeArrangedSubview:", v17);
LABEL_7:

  }
  -[NDOLongValueCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[PSTableCell layoutSubviews](self, "layoutSubviews");
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
