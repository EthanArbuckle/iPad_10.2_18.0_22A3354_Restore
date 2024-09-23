@implementation HUContactDetailsTableViewCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUContactDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUContactDetailsTableViewCell *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  CNAvatarView *avatarView;
  uint64_t v12;
  UIImageView *photoView;
  uint64_t v14;
  UIView *containerView;
  uint64_t v16;
  UILabel *titleLabel;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  UILabel *descriptionLabel;
  void *v22;
  void *v23;
  UIView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)HUContactDetailsTableViewCell;
  v4 = -[HUContactDetailsTableViewCell initWithStyle:reuseIdentifier:](&v30, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C97468]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    avatarView = v4->_avatarView;
    v4->_avatarView = (CNAvatarView *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v6, v7, v8, v9);
    photoView = v4->_photoView;
    v4->_photoView = (UIImageView *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v6, v7, v8, v9);
    containerView = v4->_containerView;
    v4->_containerView = (UIView *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v7, v8, v9);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v16;

    v18 = *MEMORY[0x1E0CEB590];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v19);

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v7, v8, v9);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = (UILabel *)v20;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_descriptionLabel, "setFont:", v22);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_descriptionLabel, "setTextColor:", v23);

    v24 = v4->_containerView;
    v32[0] = v4->_titleLabel;
    v32[1] = v4->_descriptionLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView naui_addAutoLayoutSubviews:](v24, "naui_addAutoLayoutSubviews:", v25);

    -[HUContactDetailsTableViewCell contentView](v4, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v4->_avatarView;
    v31[1] = v4->_containerView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "naui_addAutoLayoutSubviews:", v27);

    -[HUContactDetailsTableViewCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v4->_photoView);

  }
  return v4;
}

- (HUContactDetailsTableViewCell)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithStyle_reuseIdentifier_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUContactDetailsTableViewCell.m"), 64, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUContactDetailsTableViewCell initWithCoder:]",
    v6);

  return 0;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUContactDetailsTableViewCell;
  -[HUContactDetailsTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HUContactDetailsTableViewCell setTitleText:](self, "setTitleText:", 0);
  -[HUContactDetailsTableViewCell setDescriptionText:](self, "setDescriptionText:", 0);
  -[HUContactDetailsTableViewCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContacts:", MEMORY[0x1E0C9AA60]);

  -[HUContactDetailsTableViewCell setPhoto:](self, "setPhoto:", 0);
}

- (NSString)titleText
{
  void *v2;
  void *v3;

  -[HUContactDetailsTableViewCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUContactDetailsTableViewCell titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)descriptionText
{
  void *v2;
  void *v3;

  -[HUContactDetailsTableViewCell descriptionLabel](self, "descriptionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDescriptionText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUContactDetailsTableViewCell descriptionLabel](self, "descriptionLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (CNContact)contact
{
  void *v2;
  void *v3;
  void *v4;

  -[HUContactDetailsTableViewCell avatarView](self, "avatarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v4;
}

- (void)setContact:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUContactDetailsTableViewCell avatarView](self, "avatarView", v8, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContacts:", v6);

}

- (UIImage)photo
{
  void *v2;
  void *v3;

  -[HUContactDetailsTableViewCell photoView](self, "photoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setPhoto:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUContactDetailsTableViewCell photoView](self, "photoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  -[HUContactDetailsTableViewCell photoView](self, "photoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v4 == 0);

  -[HUContactDetailsTableViewCell avatarView](self, "avatarView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v4 != 0);

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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
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
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  objc_super v101;

  -[HUContactDetailsTableViewCell constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell avatarView](self, "avatarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutMarginsGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    -[HUContactDetailsTableViewCell avatarView](self, "avatarView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 42.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    -[HUContactDetailsTableViewCell containerView](self, "containerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell avatarView](self, "avatarView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 15.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v18);

    -[HUContactDetailsTableViewCell containerView](self, "containerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutMarginsGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

    -[HUContactDetailsTableViewCell titleLabel](self, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell containerView](self, "containerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v29);

    -[HUContactDetailsTableViewCell titleLabel](self, "titleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell containerView](self, "containerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v34);

    -[HUContactDetailsTableViewCell descriptionLabel](self, "descriptionLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell containerView](self, "containerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v39);

    -[HUContactDetailsTableViewCell descriptionLabel](self, "descriptionLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell containerView](self, "containerView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v44);

    -[HUContactDetailsTableViewCell avatarView](self, "avatarView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell contentView](self, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layoutMarginsGuide");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintGreaterThanOrEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v50);

    -[HUContactDetailsTableViewCell avatarView](self, "avatarView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell contentView](self, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "layoutMarginsGuide");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintLessThanOrEqualToAnchor:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v56);

    -[HUContactDetailsTableViewCell avatarView](self, "avatarView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "centerYAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell contentView](self, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "layoutMarginsGuide");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "centerYAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v62);

    -[HUContactDetailsTableViewCell avatarView](self, "avatarView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "heightAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToConstant:", 42.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v65);

    -[HUContactDetailsTableViewCell containerView](self, "containerView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell contentView](self, "contentView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "layoutMarginsGuide");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintGreaterThanOrEqualToAnchor:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v71);

    -[HUContactDetailsTableViewCell containerView](self, "containerView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell contentView](self, "contentView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "layoutMarginsGuide");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintLessThanOrEqualToAnchor:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v77);

    -[HUContactDetailsTableViewCell containerView](self, "containerView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "centerYAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell contentView](self, "contentView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "layoutMarginsGuide");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "centerYAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v83);

    -[HUContactDetailsTableViewCell titleLabel](self, "titleLabel");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "topAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell containerView](self, "containerView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "topAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v88);

    -[HUContactDetailsTableViewCell titleLabel](self, "titleLabel");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "bottomAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell descriptionLabel](self, "descriptionLabel");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "topAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v93);

    -[HUContactDetailsTableViewCell descriptionLabel](self, "descriptionLabel");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "bottomAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactDetailsTableViewCell containerView](self, "containerView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "bottomAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:", v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v98);

    -[HUContactDetailsTableViewCell setConstraints:](self, "setConstraints:", v4);
    v99 = (void *)MEMORY[0x1E0CB3718];
    -[HUContactDetailsTableViewCell constraints](self, "constraints");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "activateConstraints:", v100);

  }
  v101.receiver = self;
  v101.super_class = (Class)HUContactDetailsTableViewCell;
  -[HUContactDetailsTableViewCell updateConstraints](&v101, sel_updateConstraints);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HUContactDetailsTableViewCell;
  -[HUContactDetailsTableViewCell layoutSubviews](&v18, sel_layoutSubviews);
  -[HUContactDetailsTableViewCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HUContactDetailsTableViewCell photoView](self, "photoView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[HUContactDetailsTableViewCell photoView](self, "photoView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14 * 0.5;
  -[HUContactDetailsTableViewCell photoView](self, "photoView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", v15);

}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (UIImageView)photoView
{
  return self->_photoView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
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
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
