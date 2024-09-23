@implementation CNContactSuggestionsCollectionViewCell

- (CNContactSuggestionsCollectionViewCell)initWithFrame:(CGRect)a3
{
  CNContactSuggestionsCollectionViewCell *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  CNContactSuggestionsCollectionViewCell *v38;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)CNContactSuggestionsCollectionViewCell;
  v3 = -[CNContactSuggestionsCollectionViewCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CNUIColorRepository contactSuggestionsBackgroundColor](CNUIColorRepository, "contactSuggestionsBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(MEMORY[0x1E0DC3890]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactSuggestionsCollectionViewCell contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    -[CNContactSuggestionsCollectionViewCell setAvatarView:](v3, "setAvatarView:", v10);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v6, v7, v8, v9);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[CNUIColorRepository contactSuggestionsCheckmarkBackgroundViewColor](CNUIColorRepository, "contactSuggestionsCheckmarkBackgroundViewColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    -[CNContactSuggestionsCollectionViewCell contentView](v3, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v12);

    -[CNContactSuggestionsCollectionViewCell setCheckImageBackgroundView:](v3, "setCheckImageBackgroundView:", v12);
    -[CNContactSuggestionsCollectionViewCell checkImageBackgroundView](v3, "checkImageBackgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v16 * 0.5;
    -[CNContactSuggestionsCollectionViewCell checkImageBackgroundView](v3, "checkImageBackgroundView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCornerRadius:", v17);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v6, v7, v8, v9);
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[CNUIColorRepository contactSuggestionsCheckmarkBorderColor](CNUIColorRepository, "contactSuggestionsCheckmarkBorderColor");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "CGColor");
    objc_msgSend(v20, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBorderColor:", v22);

    objc_msgSend(v20, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBorderWidth:", 2.0);

    -[CNContactSuggestionsCollectionViewCell contentView](v3, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v20);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:", v26);

    -[CNContactSuggestionsCollectionViewCell setCheckImageView:](v3, "setCheckImageView:", v20);
    -[CNContactSuggestionsCollectionViewCell checkImageView](v3, "checkImageView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v29 = v28 * 0.5;
    -[CNContactSuggestionsCollectionViewCell checkImageView](v3, "checkImageView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCornerRadius:", v29);

    -[CNContactSuggestionsCollectionViewCell setCheckMarkHidden:](v3, "setCheckMarkHidden:", 1);
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v32, "setNumberOfLines:", 2);
    +[CNUIFontRepository contactSuggestionsNameFont](CNUIFontRepository, "contactSuggestionsNameFont");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFont:", v33);

    +[CNUIColorRepository contactSuggestionsTextLabelColor](CNUIColorRepository, "contactSuggestionsTextLabelColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTextColor:", v34);

    objc_msgSend(v32, "setTextAlignment:", -[CNContactSuggestionsCollectionViewCell useAccessibleLayout](v3, "useAccessibleLayout") ^ 1);
    objc_msgSend(v32, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v32, "setMinimumScaleFactor:", 0.95);
    objc_msgSend(v32, "setAllowsDefaultTighteningForTruncation:", 0);
    -[CNContactSuggestionsCollectionViewCell contentView](v3, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addSubview:", v32);

    -[CNContactSuggestionsCollectionViewCell setNameLabel:](v3, "setNameLabel:", v32);
    v36 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
    -[CNContactSuggestionsCollectionViewCell contentView](v3, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addLayoutGuide:", v36);

    -[CNContactSuggestionsCollectionViewCell setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[CNContactSuggestionsCollectionViewCell setupConstraints](v3, "setupConstraints");
    v38 = v3;

  }
  return v3;
}

- (void)setCheckMarkHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CNContactSuggestionsCollectionViewCell checkImageBackgroundView](self, "checkImageBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  -[CNContactSuggestionsCollectionViewCell checkImageView](self, "checkImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNContactSuggestionsCollectionViewCell;
  v4 = a3;
  -[CNContactSuggestionsCollectionViewCell traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  -[CNContactSuggestionsCollectionViewCell traitCollection](self, "traitCollection", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    +[CNUIColorRepository contactSuggestionsCheckmarkBorderColor](CNUIColorRepository, "contactSuggestionsCheckmarkBorderColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    -[CNContactSuggestionsCollectionViewCell checkImageView](self, "checkImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderColor:", v9);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNContactSuggestionsCollectionViewCell;
  -[CNContactSuggestionsCollectionViewCell layoutSubviews](&v13, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[CNContactSuggestionsCollectionViewCell checkImageBackgroundView](self, "checkImageBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4 * 0.5;
  -[CNContactSuggestionsCollectionViewCell checkImageBackgroundView](self, "checkImageBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v5);

  -[CNContactSuggestionsCollectionViewCell checkImageView](self, "checkImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9 * 0.5;
  -[CNContactSuggestionsCollectionViewCell checkImageView](self, "checkImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v10);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (BOOL)useAccessibleLayout
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  -[CNContactSuggestionsCollectionViewCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DC48D0];
  v9[0] = *MEMORY[0x1E0DC48D8];
  v9[1] = v3;
  v4 = *MEMORY[0x1E0DC48C0];
  v9[2] = *MEMORY[0x1E0DC48C8];
  v9[3] = v4;
  v9[4] = *MEMORY[0x1E0DC48B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  return v7;
}

- (void)setupConstraints
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  _QWORD v57[6];
  _QWORD v58[9];

  v58[7] = *MEMORY[0x1E0C80C00];
  v3 = -[CNContactSuggestionsCollectionViewCell useAccessibleLayout](self, "useAccessibleLayout");
  -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v3)
  {
    v58[0] = v8;
    -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsCollectionViewCell contentView](self, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:constant:", 22.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v55;
    -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsCollectionViewCell contentView](self, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "centerYAnchor");
    v53 = v10;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v50;
    -[CNContactSuggestionsCollectionViewCell nameLabel](self, "nameLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsCollectionViewCell contentView](self, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "centerYAnchor");
    v48 = v11;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v45;
    -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsCollectionViewCell contentView](self, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leadingAnchor");
    v43 = v12;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v40;
    -[CNContactSuggestionsCollectionViewCell nameLabel](self, "nameLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v37 = v13;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", 10.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v58[5] = v14;
    -[CNContactSuggestionsCollectionViewCell nameLabel](self, "nameLabel");
    v34 = v4;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v33 = v5;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsCollectionViewCell contentView](self, "contentView");
    v17 = v7;
    v18 = v6;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = v9;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v58[6] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 7);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v31;
    v9 = v20;
    v24 = v30;

    v6 = v18;
    v7 = v17;
    v25 = v32;

    v5 = v33;
    v4 = v34;
  }
  else
  {
    v57[0] = v8;
    -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsCollectionViewCell contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v55;
    -[CNContactSuggestionsCollectionViewCell nameLabel](self, "nameLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "bottomAnchor");
    v53 = v26;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", 10.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v50;
    -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsCollectionViewCell contentView](self, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "centerXAnchor");
    v48 = v27;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v57[3] = v45;
    -[CNContactSuggestionsCollectionViewCell nameLabel](self, "nameLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsCollectionViewCell contentView](self, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leadingAnchor");
    v43 = v28;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", -1.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v57[4] = v40;
    -[CNContactSuggestionsCollectionViewCell nameLabel](self, "nameLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsCollectionViewCell contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v37 = v29;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v57[5] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v39);
  -[CNContactSuggestionsCollectionViewCell setUpCheckMarkConstraints](self, "setUpCheckMarkConstraints");

}

- (void)setUpCheckMarkConstraints
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
  id v13;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[10];

  v46[8] = *MEMORY[0x1E0C80C00];
  -[CNContactSuggestionsCollectionViewCell checkImageView](self, "checkImageView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "widthAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsCollectionViewCell checkImageView](self, "checkImageView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v41;
  -[CNContactSuggestionsCollectionViewCell checkImageView](self, "checkImageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:multiplier:", v37, 0.4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v36;
  -[CNContactSuggestionsCollectionViewCell checkImageView](self, "checkImageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 4.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v31;
  -[CNContactSuggestionsCollectionViewCell checkImageView](self, "checkImageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 4.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v26;
  -[CNContactSuggestionsCollectionViewCell checkImageBackgroundView](self, "checkImageBackgroundView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "widthAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsCollectionViewCell checkImageBackgroundView](self, "checkImageBackgroundView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v20;
  -[CNContactSuggestionsCollectionViewCell checkImageBackgroundView](self, "checkImageBackgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsCollectionViewCell checkImageView](self, "checkImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:multiplier:", v16, 0.75);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v15;
  -[CNContactSuggestionsCollectionViewCell checkImageBackgroundView](self, "checkImageBackgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerXAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsCollectionViewCell checkImageView](self, "checkImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v6;
  -[CNContactSuggestionsCollectionViewCell checkImageBackgroundView](self, "checkImageBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsCollectionViewCell checkImageView](self, "checkImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46[7] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v21);
  -[CNContactSuggestionsCollectionViewCell constraints](self, "constraints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v21);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactSuggestionsCollectionViewCell;
  -[CNContactSuggestionsCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v7, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactSuggestionsCollectionViewCell useAccessibleLayout](self, "useAccessibleLayout"))
  {
    +[CNUIFontRepository contactSuggestionsNameFont](CNUIFontRepository, "contactSuggestionsNameFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lineHeight");

    objc_msgSend(v4, "size");
    objc_msgSend(v4, "setSize:");
  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CNContactSuggestionsCollectionViewCell;
  -[CNContactSuggestionsCollectionViewCell setSelected:](&v5, sel_setSelected_);
  -[CNContactSuggestionsCollectionViewCell setCheckMarkHidden:](self, "setCheckMarkHidden:", !v3);
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (NSString)displayString
{
  return -[UILabel text](self->_nameLabel, "text");
}

- (void)setDisplayString:(id)a3
{
  -[UILabel setText:](self->_nameLabel, "setText:", a3);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactSuggestionsCollectionViewCell;
  -[CNContactSuggestionsCollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[CNContactSuggestionsCollectionViewCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[CNContactSuggestionsCollectionViewCell nameLabel](self, "nameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[CNContactSuggestionsCollectionViewCell setCheckMarkHidden:](self, "setCheckMarkHidden:", 1);
}

- (UIImageView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UIImageView)checkImageView
{
  return self->_checkImageView;
}

- (void)setCheckImageView:(id)a3
{
  objc_storeStrong((id *)&self->_checkImageView, a3);
}

- (UIImageView)checkImageBackgroundView
{
  return self->_checkImageBackgroundView;
}

- (void)setCheckImageBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_checkImageBackgroundView, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_checkImageBackgroundView, 0);
  objc_storeStrong((id *)&self->_checkImageView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

+ (id)cellIdentifier
{
  return CFSTR("CNContactSuggestionsCollectionViewCell");
}

@end
