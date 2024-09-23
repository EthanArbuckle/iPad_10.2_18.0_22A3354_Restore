@implementation HKIDUpdatedAndEditCell

- (HKIDUpdatedAndEditCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKIDUpdatedAndEditCell *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UIButton *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  UIStackView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *editFirstBaseLineAnchorConstraint;
  UIStackView *stackView;
  void *v28;
  void *v29;
  UIButton *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSArray *regularLayoutConstraints;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSArray *largeTextLayoutConstraints;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  UILabel *titleLabel;
  UILabel *v60;
  UILabel *dateLabel;
  UILabel *v62;
  UIButton *editButton;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  UIButton *v80;
  UIStackView *v81;
  UILabel *v82;
  UILabel *v83;
  objc_super v84;
  _QWORD v85[6];
  _QWORD v86[4];
  _QWORD v87[4];

  v87[2] = *MEMORY[0x1E0C80C00];
  v84.receiver = self;
  v84.super_class = (Class)HKIDUpdatedAndEditCell;
  v4 = -[HKIDUpdatedAndEditCell initWithStyle:reuseIdentifier:](&v84, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("updated_title"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedUppercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5, "setText:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v9);

    v82 = v5;
    -[UILabel setNumberOfLines:](v5, "setNumberOfLines:", 0);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    v83 = v10;
    -[UILabel setNumberOfLines:](v10, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v12 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v12, "addTarget:action:forControlEvents:", v4, sel__editButtonTapped_, 64);
    HKHealthKeyColor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v12, "setTitleColor:forState:", v13, 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v12, "setTitleColor:forState:", v14, 2);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("updated_edit_button_title"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v12, "setTitle:forState:", v16, 0);

    -[HKIDUpdatedAndEditCell contentView](v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v12);

    v18 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v87[0] = v5;
    v87[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (UIStackView *)objc_msgSend(v18, "initWithArrangedSubviews:", v19);

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v20, "setAxis:", 1);
    -[UIStackView setAlignment:](v20, "setAlignment:", 1);
    -[UIStackView setDistribution:](v20, "setDistribution:", 0);
    -[HKIDUpdatedAndEditCell contentView](v4, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v20);

    -[UIButton firstBaselineAnchor](v12, "firstBaselineAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKIDUpdatedAndEditCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 0.0);
    v25 = objc_claimAutoreleasedReturnValue();
    editFirstBaseLineAnchorConstraint = v4->_editFirstBaseLineAnchorConstraint;
    v4->_editFirstBaseLineAnchorConstraint = (NSLayoutConstraint *)v25;

    stackView = v4->_stackView;
    v4->_stackView = v20;
    v81 = v20;

    v86[0] = v4->_editFirstBaseLineAnchorConstraint;
    -[UIButton trailingAnchor](v12, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKIDUpdatedAndEditCell contentView](v4, "contentView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:constant:", v28, -16.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v29;
    v30 = v12;
    v80 = v12;
    -[UIButton centerYAnchor](v12, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKIDUpdatedAndEditCell contentView](v4, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v34;
    -[UIStackView centerYAnchor](v81, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerYAnchor](v30, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v86[3] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 4);
    v38 = objc_claimAutoreleasedReturnValue();
    regularLayoutConstraints = v4->_regularLayoutConstraints;
    v4->_regularLayoutConstraints = (NSArray *)v38;

    -[HKIDUpdatedAndEditCell contentView](v4, "contentView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView topAnchor](v81, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v75, -12.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v74;
    -[HKIDUpdatedAndEditCell contentView](v4, "contentView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v81, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, 12.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v85[1] = v70;
    -[UILabel widthAnchor](v82, "widthAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView widthAnchor](v81, "widthAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKIDUpdatedAndEditCell separatorInset](v4, "separatorInset");
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v68, -v40);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v85[2] = v67;
    -[UILabel widthAnchor](v83, "widthAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView widthAnchor](v81, "widthAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKIDUpdatedAndEditCell separatorInset](v4, "separatorInset");
    objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65, -v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v85[3] = v42;
    -[UIStackView centerYAnchor](v81, "centerYAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKIDUpdatedAndEditCell contentView](v4, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "centerYAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v85[4] = v46;
    -[UIStackView trailingAnchor](v81, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKIDUpdatedAndEditCell contentView](v4, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v85[5] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 6);
    v51 = objc_claimAutoreleasedReturnValue();
    largeTextLayoutConstraints = v4->_largeTextLayoutConstraints;
    v4->_largeTextLayoutConstraints = (NSArray *)v51;

    -[UIStackView leadingAnchor](v81, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKIDUpdatedAndEditCell contentView](v4, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKIDUpdatedAndEditCell separatorInset](v4, "separatorInset");
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setActive:", 1);

    LODWORD(v58) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v80, "setContentCompressionResistancePriority:forAxis:", 0, v58);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v82;
    v60 = v82;

    dateLabel = v4->_dateLabel;
    v4->_dateLabel = v83;
    v62 = v83;

    editButton = v4->_editButton;
    v4->_editButton = v80;

    -[HKIDUpdatedAndEditCell _updateForCurrentSizeCategory](v4, "_updateForCurrentSizeCategory");
  }
  return v4;
}

- (void)_updateFont
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B10], 2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DC4A98];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A98], 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);
  -[UILabel setFont:](self->_dateLabel, "setFont:", v5);
  -[UIButton titleLabel](self->_editButton, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(v7, "_scaledValueForValue:", 36.0);
  -[NSLayoutConstraint setConstant:](self->_editFirstBaseLineAnchorConstraint, "setConstant:");

}

- (void)_updateForCurrentSizeCategory
{
  _BOOL4 IsUsingAccessibilityContentSizeCategory;
  UIStackView *stackView;
  UIButton *editButton;
  int *v6;
  int *v7;
  void *v8;

  -[HKIDUpdatedAndEditCell _updateFont](self, "_updateFont");
  IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  stackView = self->_stackView;
  editButton = self->_editButton;
  if (IsUsingAccessibilityContentSizeCategory)
  {
    -[UIStackView addArrangedSubview:](stackView, "addArrangedSubview:", editButton);
    v6 = &OBJC_IVAR___HKIDUpdatedAndEditCell__largeTextLayoutConstraints;
    v7 = &OBJC_IVAR___HKIDUpdatedAndEditCell__regularLayoutConstraints;
  }
  else
  {
    -[UIStackView removeArrangedSubview:](stackView, "removeArrangedSubview:", editButton);
    -[HKIDUpdatedAndEditCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_editButton);

    v6 = &OBJC_IVAR___HKIDUpdatedAndEditCell__regularLayoutConstraints;
    v7 = &OBJC_IVAR___HKIDUpdatedAndEditCell__largeTextLayoutConstraints;
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v7));
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v6));
}

- (void)_editButtonTapped:(id)a3
{
  id v4;

  -[HKIDUpdatedAndEditCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedAndEditCellDidTapEditButton:", self);

}

- (void)setTitleText:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)titleText
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setDateSaved:(id)a3
{
  void **p_dateSaved;
  id v6;
  void *v7;
  id v8;

  p_dateSaved = (void **)&self->_dateSaved;
  objc_storeStrong((id *)&self->_dateSaved, a3);
  v6 = a3;
  HKLocalizedStringForDateAndTemplate(*p_dateSaved, 35);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HKIDUpdatedAndEditCell dateLabel](self, "dateLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

}

- (void)setHideEditButton:(BOOL)a3
{
  self->_hideEditButton = a3;
  -[UIButton setHidden:](self->_editButton, "setHidden:");
}

- (void)setDisableEditButton:(BOOL)a3
{
  -[UIButton setEnabled:](self->_editButton, "setEnabled:", !a3);
}

- (BOOL)isEditButtonDisabled
{
  return -[UIButton isEnabled](self->_editButton, "isEnabled") ^ 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKIDUpdatedAndEditCell;
  -[HKIDUpdatedAndEditCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKIDUpdatedAndEditCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKIDUpdatedAndEditCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (HKIDUpdatedAndEditCellDelegate)delegate
{
  return (HKIDUpdatedAndEditCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)dateSaved
{
  return self->_dateSaved;
}

- (BOOL)isEditButtonHidden
{
  return self->_hideEditButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
  objc_storeStrong((id *)&self->_editButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_dateSaved, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editFirstBaseLineAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_largeTextLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_regularLayoutConstraints, 0);
}

@end
