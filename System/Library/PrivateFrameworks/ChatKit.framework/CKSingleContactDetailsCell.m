@implementation CKSingleContactDetailsCell

- (CKSingleContactDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKSingleContactDetailsCell *v4;
  CKSingleContactDetailsCell *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)CKSingleContactDetailsCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v53, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKSingleContactDetailsCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = objc_alloc(MEMORY[0x1E0CEA700]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    -[CKSingleContactDetailsCell setTitleLabel:](v5, "setTitleLabel:", v11);

    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB568], 0x8000, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSingleContactDetailsCell titleLabel](v5, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v12, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v14);

    -[CKSingleContactDetailsCell titleLabel](v5, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKSingleContactDetailsCell titleLabel](v5, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CONTACT_DETAILS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v18);

    -[CKSingleContactDetailsCell titleLabel](v5, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContentMode:", 4);

    -[CKSingleContactDetailsCell titleLabel](v5, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNumberOfLines:", 0);

    -[CKSingleContactDetailsCell titleLabel](v5, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLineBreakMode:", 0);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v7, v8, v9, v10);
    -[CKSingleContactDetailsCell setSubTitleLabel:](v5, "setSubTitleLabel:", v22);

    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB590], 0x8000, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSingleContactDetailsCell subTitleLabel](v5, "subTitleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v23, 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v25);

    -[CKSingleContactDetailsCell subTitleLabel](v5, "subTitleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v27);

    -[CKSingleContactDetailsCell subTitleLabel](v5, "subTitleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKSingleContactDetailsCell subTitleLabel](v5, "subTitleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("CONTACT_DETAILS_SUBTITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v31);

    -[CKSingleContactDetailsCell subTitleLabel](v5, "subTitleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setContentMode:", 4);

    -[CKSingleContactDetailsCell subTitleLabel](v5, "subTitleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setNumberOfLines:", 0);

    -[CKSingleContactDetailsCell subTitleLabel](v5, "subTitleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setLineBreakMode:", 0);

    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v7, v8, v9, v10);
    -[CKSingleContactDetailsCell setChervonImageView:](v5, "setChervonImageView:", v35);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "fontDescriptor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v37, 0.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward.circle"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSingleContactDetailsCell chervonImageView](v5, "chervonImageView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setImage:", v40);

    -[CKSingleContactDetailsCell chervonImageView](v5, "chervonImageView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKSingleContactDetailsCell chervonImageView](v5, "chervonImageView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setTintColor:", v44);

    -[CKSingleContactDetailsCell contentView](v5, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSingleContactDetailsCell titleLabel](v5, "titleLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addSubview:", v46);

    -[CKSingleContactDetailsCell contentView](v5, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSingleContactDetailsCell subTitleLabel](v5, "subTitleLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addSubview:", v48);

    -[CKSingleContactDetailsCell contentView](v5, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSingleContactDetailsCell chervonImageView](v5, "chervonImageView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addSubview:", v50);

    -[CKSingleContactDetailsCell contentView](v5, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setBackgroundColor:", 0);

    -[CKSingleContactDetailsCell initConstraints](v5, "initConstraints");
  }
  return v5;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailSingleContactsCell");
}

+ (BOOL)shouldHighlight
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKSingleContactDetailsCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7 + 10.0 + 2.0;
  -[CKSingleContactDetailsCell subTitleLabel](self, "subTitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", width, height);
  v11 = v8 + v10 + 10.0;

  v12 = width;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)initConstraints
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
  _QWORD v37[8];

  v37[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSingleContactDetailsCell titleLabel](self, "titleLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSingleContactDetailsCell contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "layoutMarginsGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v30;
  -[CKSingleContactDetailsCell titleLabel](self, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSingleContactDetailsCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 10.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v25;
  -[CKSingleContactDetailsCell subTitleLabel](self, "subTitleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSingleContactDetailsCell titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v20;
  -[CKSingleContactDetailsCell subTitleLabel](self, "subTitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSingleContactDetailsCell titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, 2.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v15;
  -[CKSingleContactDetailsCell chervonImageView](self, "chervonImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSingleContactDetailsCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v5;
  -[CKSingleContactDetailsCell chervonImageView](self, "chervonImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSingleContactDetailsCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMarginsGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObjectsFromArray:", v12);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v36);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSingleContactDetailsCell;
  -[CKDetailsCell layoutSubviews](&v5, sel_layoutSubviews);
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subTitleLabel, a3);
}

- (UIImageView)chervonImageView
{
  return self->_chervonImageView;
}

- (void)setChervonImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chervonImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chervonImageView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
