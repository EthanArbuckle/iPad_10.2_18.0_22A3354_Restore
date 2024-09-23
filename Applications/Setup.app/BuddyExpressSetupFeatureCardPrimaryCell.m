@implementation BuddyExpressSetupFeatureCardPrimaryCell

- (BuddyExpressSetupFeatureCardPrimaryCell)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  UIColor *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  UIColor *v24;
  UIColor *v25;
  double v26;
  id v27;
  void *v28;
  UIColor *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  NSArray *v39;
  BuddyExpressSetupFeatureCardPrimaryCell *v40;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  objc_super v78;
  id v79;
  id v80;
  id location[2];
  id v82;
  _QWORD v83[15];

  v82 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v80 = 0;
  objc_storeStrong(&v80, a4);
  v79 = 0;
  objc_storeStrong(&v79, a5);
  v7 = v82;
  v82 = 0;
  v78.receiver = v7;
  v78.super_class = (Class)BuddyExpressSetupFeatureCardPrimaryCell;
  v82 = -[BuddyExpressSetupFeatureCardPrimaryCell initWithFrame:](&v78, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_storeStrong(&v82, v82);
  if (v82)
  {
    v8 = objc_alloc((Class)UIImageView);
    v9 = objc_msgSend(v8, "initWithImage:", v79);
    v10 = (void *)*((_QWORD *)v82 + 2);
    *((_QWORD *)v82 + 2) = v9;

    objc_msgSend(*((id *)v82 + 2), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v82 + 2), "setContentMode:", 1);
    v11 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v12 = (void *)*((_QWORD *)v82 + 4);
    *((_QWORD *)v82 + 4) = v11;

    objc_msgSend(*((id *)v82 + 4), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = objc_msgSend(v82, "_titleFont");
    objc_msgSend(*((id *)v82 + 4), "setFont:", v13);

    objc_msgSend(*((id *)v82 + 4), "setText:", location[0]);
    objc_msgSend(*((id *)v82 + 4), "setNumberOfLines:", 0);
    v14 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v15 = (void *)*((_QWORD *)v82 + 5);
    *((_QWORD *)v82 + 5) = v14;

    objc_msgSend(*((id *)v82 + 5), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    objc_msgSend(*((id *)v82 + 5), "setTextColor:", v16);

    v17 = objc_msgSend(v82, "_subtitleFont");
    objc_msgSend(*((id *)v82 + 5), "setFont:", v17);

    objc_msgSend(*((id *)v82 + 5), "setText:", v80);
    v18 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v19 = (void *)*((_QWORD *)v82 + 3);
    *((_QWORD *)v82 + 3) = v18;

    objc_msgSend(*((id *)v82 + 3), "setAxis:", 1);
    objc_msgSend(*((id *)v82 + 3), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v82 + 3), "addArrangedSubview:", *((_QWORD *)v82 + 4));
    objc_msgSend(*((id *)v82 + 3), "addArrangedSubview:", *((_QWORD *)v82 + 5));
    v20 = objc_alloc((Class)UIImageView);
    v21 = objc_msgSend(v82, "_chevronImage");
    v22 = objc_msgSend(v20, "initWithImage:", v21);
    v23 = (void *)*((_QWORD *)v82 + 6);
    *((_QWORD *)v82 + 6) = v22;

    v24 = +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v25 = -[UIColor colorWithAlphaComponent:](v24, "colorWithAlphaComponent:", 0.3);
    objc_msgSend(*((id *)v82 + 6), "setTintColor:", v25);

    objc_msgSend(*((id *)v82 + 6), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v82 + 6), "setContentMode:", 1);
    LODWORD(v26) = 1148846080;
    objc_msgSend(*((id *)v82 + 6), "setContentHuggingPriority:forAxis:", 0, v26);
    v27 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v28 = (void *)*((_QWORD *)v82 + 7);
    *((_QWORD *)v82 + 7) = v27;

    objc_msgSend(*((id *)v82 + 7), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v82 + 7), "setHidden:", 1);
    v29 = +[UIColor separatorColor](UIColor, "separatorColor");
    objc_msgSend(*((id *)v82 + 7), "setBackgroundColor:", v29);

    objc_msgSend(v82, "addSubview:", *((_QWORD *)v82 + 2));
    objc_msgSend(v82, "addSubview:", *((_QWORD *)v82 + 3));
    objc_msgSend(v82, "addSubview:", *((_QWORD *)v82 + 6));
    objc_msgSend(v82, "addSubview:", *((_QWORD *)v82 + 7));
    v68 = v82;
    v77 = objc_msgSend(*((id *)v82 + 2), "widthAnchor");
    v76 = objc_msgSend(v77, "constraintEqualToConstant:", 40.0);
    v83[0] = v76;
    v75 = objc_msgSend(*((id *)v82 + 2), "heightAnchor");
    v74 = objc_msgSend(v75, "constraintEqualToConstant:", 40.0);
    v83[1] = v74;
    v72 = objc_msgSend(*((id *)v82 + 2), "leadingAnchor");
    v73 = objc_msgSend(v82, "layoutMarginsGuide");
    v71 = objc_msgSend(v73, "leadingAnchor");
    v70 = objc_msgSend(v72, "constraintEqualToAnchor:");
    v83[2] = v70;
    v69 = objc_msgSend(*((id *)v82 + 2), "centerYAnchor");
    v67 = objc_msgSend(v82, "centerYAnchor");
    v66 = objc_msgSend(v69, "constraintEqualToAnchor:");
    v83[3] = v66;
    v65 = objc_msgSend(*((id *)v82 + 3), "leadingAnchor");
    v64 = objc_msgSend(*((id *)v82 + 2), "trailingAnchor");
    v63 = objc_msgSend(v65, "constraintEqualToAnchor:constant:", 14.0);
    v83[4] = v63;
    v62 = objc_msgSend(*((id *)v82 + 3), "trailingAnchor");
    v61 = objc_msgSend(*((id *)v82 + 6), "leadingAnchor");
    v60 = objc_msgSend(v62, "constraintEqualToAnchor:");
    v83[5] = v60;
    v59 = objc_msgSend(*((id *)v82 + 3), "centerYAnchor");
    v58 = objc_msgSend(v82, "centerYAnchor");
    v57 = objc_msgSend(v59, "constraintEqualToAnchor:");
    v83[6] = v57;
    v56 = objc_msgSend(*((id *)v82 + 3), "topAnchor");
    v55 = objc_msgSend(v82, "topAnchor");
    v54 = objc_msgSend(v56, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", 1.0);
    v83[7] = v54;
    v53 = objc_msgSend(v82, "bottomAnchor");
    v52 = objc_msgSend(*((id *)v82 + 3), "bottomAnchor");
    v51 = objc_msgSend(v53, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", 1.0);
    v83[8] = v51;
    v50 = objc_msgSend(*((id *)v82 + 6), "centerYAnchor");
    v49 = objc_msgSend(v82, "centerYAnchor");
    v48 = objc_msgSend(v50, "constraintEqualToAnchor:");
    v83[9] = v48;
    v46 = objc_msgSend(*((id *)v82 + 6), "trailingAnchor");
    v47 = objc_msgSend(v82, "layoutMarginsGuide");
    v45 = objc_msgSend(v47, "trailingAnchor");
    v44 = objc_msgSend(v46, "constraintEqualToAnchor:");
    v83[10] = v44;
    v43 = objc_msgSend(*((id *)v82 + 7), "heightAnchor");
    v42 = objc_msgSend(v43, "constraintEqualToConstant:", 1.0);
    v83[11] = v42;
    v30 = objc_msgSend(*((id *)v82 + 7), "leadingAnchor");
    v31 = objc_msgSend(*((id *)v82 + 3), "leadingAnchor");
    v32 = objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v83[12] = v32;
    v33 = objc_msgSend(*((id *)v82 + 7), "trailingAnchor");
    v34 = objc_msgSend(v82, "trailingAnchor");
    v35 = objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v83[13] = v35;
    v36 = objc_msgSend(*((id *)v82 + 7), "bottomAnchor");
    v37 = objc_msgSend(v82, "bottomAnchor");
    v38 = objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v83[14] = v38;
    v39 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 15);
    objc_msgSend(v68, "addConstraints:", v39);

  }
  v40 = (BuddyExpressSetupFeatureCardPrimaryCell *)v82;
  objc_storeStrong(&v79, 0);
  objc_storeStrong(&v80, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v82, 0);
  return v40;
}

- (void)setExpanded:(BOOL)a3
{
  id v3;
  UIImageView *v4;
  UIView *v5;

  self->_expanded = a3;
  v3 = -[BuddyExpressSetupFeatureCardPrimaryCell _chevronImage](self, "_chevronImage");
  v4 = -[BuddyExpressSetupFeatureCardPrimaryCell chevronImageView](self, "chevronImageView");
  -[UIImageView setImage:](v4, "setImage:", v3);

  v5 = -[BuddyExpressSetupFeatureCardPrimaryCell separatorView](self, "separatorView");
  -[UIView setHidden:](v5, "setHidden:", !a3);

}

- (void)setChevronHidden:(BOOL)a3
{
  UIImageView *v4;

  self->_chevronHidden = a3;
  v4 = -[BuddyExpressSetupFeatureCardPrimaryCell chevronImageView](self, "chevronImageView");
  -[UIImageView setHidden:](v4, "setHidden:", a3);

}

- (void)setNumberOfLinesForSubtitle:(int64_t)a3
{
  UILabel *v4;

  v4 = -[BuddyExpressSetupFeatureCardPrimaryCell subtitleLabel](self, "subtitleLabel");
  -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v3;
  UILabel *v4;
  id v5;
  UILabel *v6;
  objc_super v7;
  id location[2];
  BuddyExpressSetupFeatureCardPrimaryCell *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)BuddyExpressSetupFeatureCardPrimaryCell;
  -[BuddyExpressSetupFeatureCardPrimaryCell traitCollectionDidChange:](&v7, "traitCollectionDidChange:", location[0]);
  v3 = -[BuddyExpressSetupFeatureCardPrimaryCell _titleFont](v9, "_titleFont");
  v4 = -[BuddyExpressSetupFeatureCardPrimaryCell titleLabel](v9, "titleLabel");
  -[UILabel setFont:](v4, "setFont:", v3);

  v5 = -[BuddyExpressSetupFeatureCardPrimaryCell _subtitleFont](v9, "_subtitleFont");
  v6 = -[BuddyExpressSetupFeatureCardPrimaryCell subtitleLabel](v9, "subtitleLabel");
  -[UILabel setFont:](v6, "setFont:", v5);

  objc_storeStrong(location, 0);
}

- (id)_chevronImage
{
  if (-[BuddyExpressSetupFeatureCardPrimaryCell isExpanded](self, "isExpanded"))
    return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.down"));
  else
    return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward"));
}

- (id)_titleFont
{
  UIFontDescriptor *v2;
  UIFont *v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline);
  location[0] = -[UIFontDescriptor fontDescriptorWithSymbolicTraits:](v2, "fontDescriptorWithSymbolicTraits:", 2);

  v3 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", location[0], 0.0);
  objc_storeStrong(location, 0);
  return v3;
}

- (id)_subtitleFont
{
  UIFontDescriptor *v2;
  UIFont *v3;

  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline, a2, self);
  v3 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v2, 0.0);

  return v3;
}

- (BOOL)isChevronHidden
{
  return self->_chevronHidden;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (UIView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UIStackView)labelContainer
{
  return self->_labelContainer;
}

- (void)setLabelContainer:(id)a3
{
  objc_storeStrong((id *)&self->_labelContainer, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
