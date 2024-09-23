@implementation CNMeCardSharedProfileCellContentView

- (CNMeCardSharedProfileCellContentView)init
{
  CNMeCardSharedProfileCellContentView *v2;
  CNMeCardSharedProfileCellContentView *v3;
  CNMeCardSharedProfileCellContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNMeCardSharedProfileCellContentView;
  v2 = -[CNMeCardSharedProfileCellContentView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[CNMeCardSharedProfileCellContentView setupViews](v2, "setupViews");
    -[CNMeCardSharedProfileCellContentView setupConstraints](v3, "setupConstraints");
    v4 = v3;
  }

  return v3;
}

- (void)setupViews
{
  -[CNMeCardSharedProfileCellContentView setUpAvatarView](self, "setUpAvatarView");
  -[CNMeCardSharedProfileCellContentView setUpLabels](self, "setUpLabels");
}

- (void)setUpAvatarView
{
  CNAvatarView *v3;

  v3 = objc_alloc_init(CNAvatarView);
  -[CNAvatarView setShouldFetchSharedMeContactPhoto:](v3, "setShouldFetchSharedMeContactPhoto:", 1);
  -[CNAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNMeCardSharedProfileCellContentView addSubview:](self, "addSubview:", v3);
  -[CNMeCardSharedProfileCellContentView setAvatarView:](self, "setAvatarView:", v3);

}

- (void)setUpLabels
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  objc_msgSend(v3, "setNumberOfLines:", 0);
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SNAP_DISPLAY_PREFERENCE_CONTACT_CARD_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v7);

  -[CNMeCardSharedProfileCellContentView addSubview:](self, "addSubview:", v3);
  -[CNMeCardSharedProfileCellContentView setTitleLabel:](self, "setTitleLabel:", v3);
  v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredFontForTextStyle:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

  objc_msgSend(v8, "setNumberOfLines:", 0);
  -[CNMeCardSharedProfileCellContentView displayStringForSharingAudience](self, "displayStringForSharingAudience");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v11);

  -[CNMeCardSharedProfileCellContentView addSubview:](self, "addSubview:", v8);
  -[CNMeCardSharedProfileCellContentView setValueLabel:](self, "setValueLabel:", v8);
  v12 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  -[CNMeCardSharedProfileCellContentView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  -[CNMeCardSharedProfileCellContentView valueLabel](self, "valueLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithArrangedSubviews:", v15);

  objc_msgSend(v16, "setAxis:", 1);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNMeCardSharedProfileCellContentView addSubview:](self, "addSubview:", v16);
  -[CNMeCardSharedProfileCellContentView setLabelStackView:](self, "setLabelStackView:", v16);

}

- (id)displayStringForSharingAudience
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nicknameProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNicknameSharingEnabled");

  if ((v4 & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nicknameProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "sharingAudienceDisplayString");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CNContactsUIBundle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SNAP_DISPLAY_PREFERENCE_DISABLED"), &stru_1E20507A8, CFSTR("Localized"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (void)updateAvatarViewContact
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location[2];

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nicknameProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNicknameSharingEnabled");

  if ((v5 & 1) != 0)
  {
    objc_initWeak(location, self);
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nicknameProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__CNMeCardSharedProfileCellContentView_updateAvatarViewContact__block_invoke;
    v12[3] = &unk_1E204A938;
    objc_copyWeak(&v13, location);
    objc_msgSend(v7, "fetchPersonalNicknameAsContactWithCompletion:", v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_INFO, "Sharing is disabled, using Me contact for shared profile row", (uint8_t *)location, 2u);
    }

    -[CNMeCardSharedProfileCellContentView meContact](self, "meContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CNMeCardSharedProfileCellContentView avatarView](self, "avatarView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNMeCardSharedProfileCellContentView meContact](self, "meContact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setContact:", v11);

    }
  }
}

- (void)setMeContact:(id)a3
{
  CNContact *v5;
  CNContact *v6;

  v5 = (CNContact *)a3;
  if (self->_meContact != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_meContact, a3);
    -[CNMeCardSharedProfileCellContentView updateView](self, "updateView");
    v5 = v6;
  }

}

- (void)setAvatarHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  -[CNMeCardSharedProfileCellContentView avatarView](self, "avatarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (v6 != v3)
  {
    -[CNMeCardSharedProfileCellContentView avatarView](self, "avatarView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v3);

    -[CNMeCardSharedProfileCellContentView setupConstraints](self, "setupConstraints");
  }
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNMeCardSharedProfileCellContentView;
  -[CNMeCardSharedProfileCellContentView updateConstraints](&v3, sel_updateConstraints);
  -[CNMeCardSharedProfileCellContentView setAvatarHidden:](self, "setAvatarHidden:", objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"));
}

- (void)setupConstraints
{
  NSArray *v3;
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
  NSArray *constraints;
  NSArray *v42;

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  v3 = (NSArray *)objc_opt_new();
  -[CNMeCardSharedProfileCellContentView labelStackView](self, "labelStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharedProfileCellContentView centerYAnchor](self, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v3, "addObject:", v7);

  -[CNMeCardSharedProfileCellContentView labelStackView](self, "labelStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharedProfileCellContentView topAnchor](self, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v3, "addObject:", v11);

  -[CNMeCardSharedProfileCellContentView labelStackView](self, "labelStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharedProfileCellContentView bottomAnchor](self, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v3, "addObject:", v15);

  -[CNMeCardSharedProfileCellContentView labelStackView](self, "labelStackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharedProfileCellContentView trailingAnchor](self, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v3, "addObject:", v19);

  if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    -[CNMeCardSharedProfileCellContentView labelStackView](self, "labelStackView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharedProfileCellContentView leadingAnchor](self, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v23);
  }
  else
  {
    -[CNMeCardSharedProfileCellContentView avatarView](self, "avatarView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharedProfileCellContentView centerYAnchor](self, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v27);

    -[CNMeCardSharedProfileCellContentView avatarView](self, "avatarView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharedProfileCellContentView leadingAnchor](self, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v31);

    -[CNMeCardSharedProfileCellContentView avatarView](self, "avatarView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "heightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharedProfileCellContentView avatarView](self, "avatarView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v36);

    -[CNMeCardSharedProfileCellContentView avatarView](self, "avatarView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToConstant:", 40.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v39);

    -[CNMeCardSharedProfileCellContentView labelStackView](self, "labelStackView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharedProfileCellContentView avatarView](self, "avatarView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v23, 1.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v40);

  }
  constraints = self->_constraints;
  self->_constraints = v3;
  v42 = v3;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v42);
}

- (void)updateView
{
  void *v3;
  void *v4;

  -[CNMeCardSharedProfileCellContentView displayStringForSharingAudience](self, "displayStringForSharingAudience");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharedProfileCellContentView valueLabel](self, "valueLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[CNMeCardSharedProfileCellContentView updateAvatarViewContact](self, "updateAvatarViewContact");
}

- (void)setLabelTextAttributes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[CNMeCardSharedProfileCellContentView titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "font");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 != v10)
    {
      -[CNMeCardSharedProfileCellContentView titleLabel](self, "titleLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFont:", v10);

    }
    -[CNMeCardSharedProfileCellContentView valueLabel](self, "valueLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "font");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v10)
    {
      -[CNMeCardSharedProfileCellContentView valueLabel](self, "valueLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFont:", v10);

    }
  }

}

- (CNContact)meContact
{
  return self->_meContact;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
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
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
}

void __63__CNMeCardSharedProfileCellContentView_updateAvatarViewContact__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    v5 = v3;
LABEL_7:
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__CNMeCardSharedProfileCellContentView_updateAvatarViewContact__block_invoke_17;
    v9[3] = &unk_1E2050400;
    v9[4] = WeakRetained;
    v10 = v5;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

    goto LABEL_8;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_INFO, "No personal nickname contact found, using Me contact for shared profile row", buf, 2u);
  }

  objc_msgSend(WeakRetained, "meContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(WeakRetained, "meContact");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:

}

void __63__CNMeCardSharedProfileCellContentView_updateAvatarViewContact__block_invoke_17(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "avatarView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContact:", *(_QWORD *)(a1 + 40));

}

+ (id)log
{
  if (log_cn_once_token_1_24530 != -1)
    dispatch_once(&log_cn_once_token_1_24530, &__block_literal_global_24531);
  return (id)log_cn_once_object_1_24532;
}

void __43__CNMeCardSharedProfileCellContentView_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNMeCardSharedProfileCellContentView");
  v1 = (void *)log_cn_once_object_1_24532;
  log_cn_once_object_1_24532 = (uint64_t)v0;

}

@end
