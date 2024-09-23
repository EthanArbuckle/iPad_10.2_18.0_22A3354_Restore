@implementation CKMultipleIDSSubscriptionsTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (CKMultipleIDSSubscriptionsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKMultipleIDSSubscriptionsTableCell *v4;
  UILabel *v5;
  UILabel *nameLabel;
  uint64_t v7;
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
  void *v23;
  UILabel *v24;
  UILabel *numberLabel;
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
  UILabel *v44;
  UILabel *centeredNameLabel;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_super v65;

  v65.receiver = self;
  v65.super_class = (Class)CKMultipleIDSSubscriptionsTableCell;
  v4 = -[CKMultipleIDSSubscriptionsTableCell initWithStyle:reuseIdentifier:](&v65, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v5;

    v7 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_nameLabel, "setFont:", v8);

    -[UILabel setNumberOfLines:](v4->_nameLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CKMultipleIDSSubscriptionsTableCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_nameLabel);

    -[UILabel firstBaselineAnchor](v4->_nameLabel, "firstBaselineAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMultipleIDSSubscriptionsTableCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v12, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[UILabel leadingAnchor](v4->_nameLabel, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMultipleIDSSubscriptionsTableCell contentView](v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutMarginsGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    -[UILabel trailingAnchor](v4->_nameLabel, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMultipleIDSSubscriptionsTableCell contentView](v4, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutMarginsGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    v24 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    numberLabel = v4->_numberLabel;
    v4->_numberLabel = v24;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_numberLabel, "setFont:", v26);

    -[UILabel setNumberOfLines:](v4->_numberLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_numberLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_numberLabel, "setTextColor:", v27);

    -[CKMultipleIDSSubscriptionsTableCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v4->_numberLabel);

    -[UILabel firstBaselineAnchor](v4->_numberLabel, "firstBaselineAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v4->_nameLabel, "lastBaselineAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v30, 1.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[UILabel leadingAnchor](v4->_numberLabel, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v4->_nameLabel, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    -[UILabel trailingAnchor](v4->_numberLabel, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMultipleIDSSubscriptionsTableCell contentView](v4, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutMarginsGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

    -[CKMultipleIDSSubscriptionsTableCell contentView](v4, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v4->_numberLabel, "lastBaselineAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v42, 1.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setActive:", 1);

    v44 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    centeredNameLabel = v4->_centeredNameLabel;
    v4->_centeredNameLabel = v44;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v7);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_centeredNameLabel, "setFont:", v46);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_centeredNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CKMultipleIDSSubscriptionsTableCell contentView](v4, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addSubview:", v4->_centeredNameLabel);

    -[UILabel leadingAnchor](v4->_centeredNameLabel, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMultipleIDSSubscriptionsTableCell contentView](v4, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "layoutMarginsGuide");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setActive:", 1);

    -[UILabel trailingAnchor](v4->_centeredNameLabel, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMultipleIDSSubscriptionsTableCell contentView](v4, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "layoutMarginsGuide");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setActive:", 1);

    -[UILabel centerYAnchor](v4->_centeredNameLabel, "centerYAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMultipleIDSSubscriptionsTableCell contentView](v4, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setActive:", 1);

    -[CKMultipleIDSSubscriptionsTableCell textLabel](v4, "textLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setHidden:", 1);

    -[CKMultipleIDSSubscriptionsTableCell detailTextLabel](v4, "detailTextLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setHidden:", 1);

  }
  return v4;
}

- (BOOL)canReload
{
  return 1;
}

- (BOOL)canBeChecked
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKMultipleIDSSubscriptionsTableCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v8, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75CE8], v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_nameLabel, "setText:", v6);

  objc_msgSend(v5, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_numberLabel, "setText:", v7);

  -[CKMultipleIDSSubscriptionsTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)numberLabel
{
  return self->_numberLabel;
}

- (void)setNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_numberLabel, a3);
}

- (UILabel)centeredNameLabel
{
  return self->_centeredNameLabel;
}

- (void)setCenteredNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_centeredNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredNameLabel, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
