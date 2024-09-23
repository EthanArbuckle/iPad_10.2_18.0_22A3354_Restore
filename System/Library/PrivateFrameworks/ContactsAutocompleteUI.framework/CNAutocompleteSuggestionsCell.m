@implementation CNAutocompleteSuggestionsCell

+ (id)cellIdentifier
{
  return CFSTR("CNAutocompleteSuggestionsCell");
}

- (CNAutocompleteSuggestionsCell)initWithFrame:(CGRect)a3
{
  CNAutocompleteSuggestionsCell *v3;
  void *v4;
  CNAutocompleteSuggestionsImageView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CNAutocompleteSuggestionsImageView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  CNAutocompleteSuggestionsCell *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CNAutocompleteSuggestionsCell;
  v3 = -[CNAutocompleteSuggestionsCell initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = [CNAutocompleteSuggestionsImageView alloc];
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[CNAutocompleteSuggestionsImageView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    -[CNAutocompleteSuggestionsImageView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNAutocompleteSuggestionsCell contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    -[CNAutocompleteSuggestionsCell setAvatarView:](v3, "setAvatarView:", v10);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v7, v8, v9);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v13);

    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v14);

    -[CNAutocompleteSuggestionsCell traitCollection](v3, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "layoutDirection") == 1;

    if (-[CNAutocompleteSuggestionsCell useAccessibleLayout](v3, "useAccessibleLayout"))
      v17 = 2 * v16;
    else
      v17 = 1;
    objc_msgSend(v12, "setTextAlignment:", v17);
    objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v12, "setMinimumScaleFactor:", 0.949999988);
    objc_msgSend(v12, "setAllowsDefaultTighteningForTruncation:", 0);
    -[CNAutocompleteSuggestionsCell contentView](v3, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v12);

    -[CNAutocompleteSuggestionsCell setNameLabel:](v3, "setNameLabel:", v12);
    v19 = objc_alloc_init(MEMORY[0x1E0CEA710]);
    -[CNAutocompleteSuggestionsCell contentView](v3, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addLayoutGuide:", v19);

    -[CNAutocompleteSuggestionsCell setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[CNAutocompleteSuggestionsCell setupConstraints](v3, "setupConstraints");
    v21 = v3;

  }
  return v3;
}

- (BOOL)useAccessibleLayout
{
  void *v2;
  char v3;

  -[CNAutocompleteSuggestionsCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = isTraitCollectionAccessible(v2);

  return v3;
}

- (void)setupConstraints
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[8];
  _QWORD v63[9];

  v63[7] = *MEMORY[0x1E0C80C00];
  v3 = -[CNAutocompleteSuggestionsCell useAccessibleLayout](self, "useAccessibleLayout");
  -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v3)
  {
    v63[0] = v7;
    -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell contentView](self, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "topAnchor");
    v60 = v10;
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", 22.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v57;
    -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell contentView](self, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bottomAnchor");
    v55 = v11;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", -22.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2] = v52;
    -[CNAutocompleteSuggestionsCell nameLabel](self, "nameLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "centerYAnchor");
    v50 = v12;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v63[3] = v47;
    -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell contentView](self, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingAnchor");
    v45 = v13;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v63[4] = v42;
    -[CNAutocompleteSuggestionsCell nameLabel](self, "nameLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v40 = v14;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", 10.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v63[5] = v15;
    -[CNAutocompleteSuggestionsCell nameLabel](self, "nameLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell contentView](self, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v63[6] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v62[0] = v7;
    -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell contentView](self, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "topAnchor");
    v60 = v20;
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", 0.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v57;
    -[CNAutocompleteSuggestionsCell nameLabel](self, "nameLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bottomAnchor");
    v55 = v21;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", 10.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v52;
    -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell contentView](self, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "centerXAnchor");
    v50 = v22;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v47;
    -[CNAutocompleteSuggestionsCell nameLabel](self, "nameLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell contentView](self, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingAnchor");
    v45 = v23;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", 1.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v62[4] = v42;
    -[CNAutocompleteSuggestionsCell nameLabel](self, "nameLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell contentView](self, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v40 = v24;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", -1.0);
    v31 = objc_claimAutoreleasedReturnValue();
    v62[5] = v31;
    -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell contentView](self, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v62[6] = v18;
    -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
    v34 = v4;
    v35 = v5;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v33 = v6;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsCell contentView](self, "contentView");
    v27 = v8;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:constant:", v29, -0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v62[7] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v32;
    v15 = (void *)v31;

    v8 = v27;
    v6 = v33;

    v4 = v34;
    v5 = v35;
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v19);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNAutocompleteSuggestionsCell;
  -[CNAutocompleteSuggestionsCell setSelected:](&v8, sel_setSelected_);
  if (v3)
    v5 = 0.5;
  else
    v5 = 1.0;
  -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  -[CNAutocompleteSuggestionsCell nameLabel](self, "nameLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v5);

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
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
  -[CNAutocompleteSuggestionsCell avatarView](self, "avatarView");
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

- (UIImageView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
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
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
