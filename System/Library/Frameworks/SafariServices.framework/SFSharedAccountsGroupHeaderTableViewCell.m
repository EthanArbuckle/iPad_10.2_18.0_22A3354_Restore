@implementation SFSharedAccountsGroupHeaderTableViewCell

- (SFSharedAccountsGroupHeaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFSharedAccountsGroupHeaderTableViewCell *v4;
  SFSharedAccountsGroupHeaderTableViewCell *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  void *v9;
  UILabel *titleLabel;
  UILabel *v11;
  UILabel *v12;
  void *v13;
  UILabel *subtitleLabel;
  UILabel *v15;
  SFSharedAccountsGroupAvatarStackView *v16;
  SFSharedAccountsGroupAvatarStackView *avatarStackView;
  SFSharedAccountsGroupAvatarStackView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SFSharedAccountsGroupHeaderTableViewCell *v28;
  void *v30;
  void *v31;
  UILabel *v32;
  void *v33;
  void *v34;
  void *v35;
  UILabel *v36;
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
  objc_super v61;
  _QWORD v62[13];

  v62[11] = *MEMORY[0x1E0C80C00];
  v61.receiver = self;
  v61.super_class = (Class)SFSharedAccountsGroupHeaderTableViewCell;
  v4 = -[SFSharedAccountsGroupHeaderTableViewCell initWithStyle:reuseIdentifier:](&v61, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SFSharedAccountsGroupHeaderTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC37E8], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC4B98]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v9);

    objc_msgSend(v6, "addSubview:", v7);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v7;
    v11 = v7;

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[UILabel setNumberOfLines:](v12, "setNumberOfLines:", 2);
    objc_msgSend(v6, "addSubview:", v12);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v12;
    v15 = v12;

    v16 = -[SFSharedAccountsGroupAvatarStackView initWithAvatarDiameter:avatarSpacing:maximumNumberOfAvatarsToDisplay:]([SFSharedAccountsGroupAvatarStackView alloc], "initWithAvatarDiameter:avatarSpacing:maximumNumberOfAvatarsToDisplay:", 5, 32.0, 21.0);
    -[SFSharedAccountsGroupAvatarStackView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", v16);
    avatarStackView = v5->_avatarStackView;
    v5->_avatarStackView = v16;
    v18 = v16;

    objc_msgSend(v6, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v11, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v58;
    -[UILabel topAnchor](v11, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v55;
    -[UILabel topAnchor](v15, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v11, "lastBaselineAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 6.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v52;
    -[UILabel leadingAnchor](v15, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v11;
    -[UILabel leadingAnchor](v11, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v49;
    v32 = v15;
    -[UILabel trailingAnchor](v15, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v11, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v62[4] = v45;
    v40 = v19;
    objc_msgSend(v19, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v15, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v62[5] = v41;
    -[SFSharedAccountsGroupAvatarStackView centerYAnchor](v18, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v62[6] = v37;
    -[SFSharedAccountsGroupAvatarStackView topAnchor](v18, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v6;
    objc_msgSend(v6, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v34, 1.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v62[7] = v33;
    objc_msgSend(v6, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharedAccountsGroupAvatarStackView bottomAnchor](v18, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v30, 1.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v62[8] = v20;
    -[SFSharedAccountsGroupAvatarStackView leadingAnchor](v18, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v22, 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v62[9] = v23;
    -[SFSharedAccountsGroupAvatarStackView trailingAnchor](v18, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v62[10] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activateConstraints:", v27);

    v28 = v5;
  }

  return v5;
}

- (void)configureWithGroup:(id)a3
{
  SFSharedAccountsGroupAvatarStackView *avatarStackView;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  avatarStackView = self->_avatarStackView;
  v5 = a3;
  -[SFSharedAccountsGroupAvatarStackView configureWithGroup:](avatarStackView, "configureWithGroup:", v5);
  v6 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v7, objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v9);

  objc_msgSend(v5, "as_groupMemberTableViewCellDescription");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_subtitleLabel, "setText:", v11);
  +[_SFAccountManagerAppearanceValues subtitleFontForNarrowCellWithText:](_SFAccountManagerAppearanceValues, "subtitleFontForNarrowCellWithText:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_avatarStackView, 0);
}

@end
