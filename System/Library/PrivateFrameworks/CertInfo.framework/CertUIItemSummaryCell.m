@implementation CertUIItemSummaryCell

- (CertUIItemSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CertUIItemSummaryCell *v4;
  CertUIItemSummaryCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CertUIItemSummaryCell;
  v4 = -[CertUIItemSummaryCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CertUIItemSummaryCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[CertUIItemSummaryCell _setupCell](v5, "_setupCell");
  }
  return v5;
}

- (void)_setupCell
{
  UIImageView *v3;
  UIImageView *itemImageView;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UILabel *v11;
  UILabel *itemTitleLabel;
  void *v13;
  UILabel *v14;
  UILabel *itemSubtitleLabel;
  void *v16;
  void *v17;
  UIView *v18;
  UIView *itemTitleView;
  void *v20;
  id v21;

  -[CertUIItemSummaryCell _profileImageAppropriateForDevice](self, "_profileImageAppropriateForDevice");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v21);
  itemImageView = self->_itemImageView;
  self->_itemImageView = v3;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_itemImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CertUIItemSummaryCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_itemImageView);

  v6 = objc_alloc(MEMORY[0x24BDF6B68]);
  v7 = *MEMORY[0x24BDBF090];
  v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v11 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], v8, v9, v10);
  itemTitleLabel = self->_itemTitleLabel;
  self->_itemTitleLabel = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_itemTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setBackgroundColor:](self->_itemTitleLabel, "setBackgroundColor:", 0);
  -[UILabel setOpaque:](self->_itemTitleLabel, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_itemTitleLabel, "setFont:", v13);

  v14 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v7, v8, v9, v10);
  itemSubtitleLabel = self->_itemSubtitleLabel;
  self->_itemSubtitleLabel = v14;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_itemSubtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setBackgroundColor:](self->_itemSubtitleLabel, "setBackgroundColor:", 0);
  -[UILabel setOpaque:](self->_itemSubtitleLabel, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_itemSubtitleLabel, "setFont:", v16);

  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_itemSubtitleLabel, "setTextColor:", v17);

  v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v7, v8, v9, v10);
  itemTitleView = self->_itemTitleView;
  self->_itemTitleView = v18;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_itemTitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_itemTitleView, "addSubview:", self->_itemTitleLabel);
  -[UIView addSubview:](self->_itemTitleView, "addSubview:", self->_itemSubtitleLabel);
  -[CertUIItemSummaryCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", self->_itemTitleView);

  -[CertUIItemSummaryCell _setupConstraints](self, "_setupConstraints");
}

- (id)_profileImageAppropriateForDevice
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  v5 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("profile-icon"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_applicationIconImageForFormat:precomposed:scale:", 2, 1, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
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
  double v31;
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
  id v88;

  -[CertUIItemSummaryCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemImageView](self, "itemImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemImageView](self, "itemImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemImageView](self, "itemImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 7, 0, v6, 7, 0.0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v10);

  -[CertUIItemSummaryCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemImageView](self, "itemImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemImageView](self, "itemImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemImageView](self, "itemImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "size");
  objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 8, 0, v14, 8, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConstraint:", v17);

  -[CertUIItemSummaryCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemImageView](self, "itemImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 1, 0, v21, 1, 1.0, 15.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addConstraint:", v22);

  -[CertUIItemSummaryCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemImageView](self, "itemImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 10, 0, v26, 10, 1.0, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addConstraint:", v27);

  v28 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemImageView](self, "itemImageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 8, 1, v30, 8, 1.0, 16.0);
  v88 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v31) = 1148829696;
  objc_msgSend(v88, "setPriority:", v31);
  -[CertUIItemSummaryCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addConstraint:", v88);

  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemTitleLabel](self, "itemTitleLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 3, 0, v36, 3, 1.0, 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addConstraint:", v37);

  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemTitleLabel](self, "itemTitleLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, 1, 0, v41, 1, 1.0, 0.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addConstraint:", v42);

  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemTitleLabel](self, "itemTitleLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 2, 1, v46, 2, 1.0, 0.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addConstraint:", v47);

  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemSubtitleLabel](self, "itemSubtitleLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemTitleLabel](self, "itemTitleLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 3, 0, v51, 4, 1.0, 0.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addConstraint:", v52);

  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemSubtitleLabel](self, "itemSubtitleLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v55, 1, 0, v56, 1, 1.0, 0.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addConstraint:", v57);

  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemSubtitleLabel](self, "itemSubtitleLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v60, 2, 1, v61, 2, 1.0, 0.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addConstraint:", v62);

  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemSubtitleLabel](self, "itemSubtitleLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v65, 4, 0, v66, 4, 1.0, 0.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addConstraint:", v67);

  -[CertUIItemSummaryCell contentView](self, "contentView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemImageView](self, "itemImageView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v70, 10, 0, v71, 10, 1.0, 0.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addConstraint:", v72);

  -[CertUIItemSummaryCell contentView](self, "contentView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemImageView](self, "itemImageView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v75, 1, 0, v76, 2, 1.0, 12.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addConstraint:", v77);

  -[CertUIItemSummaryCell contentView](self, "contentView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell contentView](self, "contentView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v80, 2, 0, v81, 2, 1.0, -12.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addConstraint:", v82);

  -[CertUIItemSummaryCell contentView](self, "contentView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)MEMORY[0x24BDD1628];
  -[CertUIItemSummaryCell contentView](self, "contentView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemSummaryCell itemTitleView](self, "itemTitleView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v85, 8, 1, v86, 8, 1.0, 0.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "addConstraint:", v87);

}

- (double)cellHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;

  -[CertUIItemSummaryCell itemImageView](self, "itemImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;

  if (v5 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == 1)
      v5 = 72.0;
    else
      v5 = 58.0;
  }
  return v5 + 16.0;
}

+ (double)titleOriginX
{
  void *v2;
  _BOOL4 v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return dbl_20DB03F20[v3];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CertUIItemSummaryCell;
  -[CertUIItemSummaryCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (UIImageView)itemImageView
{
  return self->_itemImageView;
}

- (void)setItemImageView:(id)a3
{
  objc_storeStrong((id *)&self->_itemImageView, a3);
}

- (UIView)itemTitleView
{
  return self->_itemTitleView;
}

- (void)setItemTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_itemTitleView, a3);
}

- (UILabel)itemTitleLabel
{
  return self->_itemTitleLabel;
}

- (void)setItemTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_itemTitleLabel, a3);
}

- (UILabel)itemSubtitleLabel
{
  return self->_itemSubtitleLabel;
}

- (void)setItemSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_itemSubtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_itemTitleLabel, 0);
  objc_storeStrong((id *)&self->_itemTitleView, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
}

@end
