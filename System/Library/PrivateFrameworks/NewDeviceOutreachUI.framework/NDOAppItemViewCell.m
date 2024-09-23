@implementation NDOAppItemViewCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NDOAppItemViewCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v13, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("COVERAGE_ITEM"));

  if (v6)
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("NDOWarranty"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:withConfiguration:", CFSTR("applecare-badge"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self->_itemImageView, "setImage:", v10);
    objc_msgSend(v7, "coverageLocalizedDesc");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_itemTitleLabel, "setText:", v11);

    objc_msgSend(v4, "propertyForKey:", CFSTR("NDOCoverageItemSubtitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_itemSubtitleLabel, "setText:", v12);

  }
  -[NDOAppItemViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NDOAppItemViewCell;
  -[PSTableCell layoutSubviews](&v3, sel_layoutSubviews);
  -[NDOAppItemViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[PSTableCell setCellEnabled:](self, "setCellEnabled:", 1);
}

- (NDOAppItemViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  NDOAppItemViewCell *v9;
  void *v10;
  int v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NDOAppItemViewCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v13, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  if (v9)
  {
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75AC0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("COVERAGE_ITEM"));

    if (v11)
      -[NDOAppItemViewCell _setupWarrantyCoverageCell](v9, "_setupWarrantyCoverageCell");
  }

  return v9;
}

- (void)_setupWarrantyCoverageCell
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

  v3 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", 0);
  itemImageView = self->_itemImageView;
  self->_itemImageView = v3;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_itemImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[NDOAppItemViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_itemImageView);

  v6 = objc_alloc(MEMORY[0x24BEBD708]);
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
  -[UILabel setNumberOfLines:](self->_itemTitleLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_itemTitleLabel, "setFont:", v13);

  v14 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v7, v8, v9, v10);
  itemSubtitleLabel = self->_itemSubtitleLabel;
  self->_itemSubtitleLabel = v14;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_itemSubtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setBackgroundColor:](self->_itemSubtitleLabel, "setBackgroundColor:", 0);
  -[UILabel setOpaque:](self->_itemSubtitleLabel, "setOpaque:", 0);
  -[UILabel setNumberOfLines:](self->_itemSubtitleLabel, "setNumberOfLines:", 2);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_itemSubtitleLabel, "setFont:", v16);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_itemSubtitleLabel, "setTextColor:", v17);

  v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v7, v8, v9, v10);
  itemTitleView = self->_itemTitleView;
  self->_itemTitleView = v18;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_itemTitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_itemTitleView, "addSubview:", self->_itemTitleLabel);
  -[UIView addSubview:](self->_itemTitleView, "addSubview:", self->_itemSubtitleLabel);
  -[NDOAppItemViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", self->_itemTitleView);

  -[NDOAppItemViewCell layoutSubviews](self, "layoutSubviews");
}

- (void)updateConstraints
{
  NSMutableArray *v3;
  NSMutableArray *imageConstraints;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
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
  objc_super v79;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  imageConstraints = self->_imageConstraints;
  self->_imageConstraints = v3;

  v5 = self->_imageConstraints;
  v6 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell itemImageView](self, "itemImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 5, 0, v8, 5, 1.0, 15.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v5, "addObject:", v9);

  v10 = self->_imageConstraints;
  v11 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell itemImageView](self, "itemImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 10, 0, v13, 10, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v10, "addObject:", v14);

  -[NDOAppItemViewCell itemImageView](self, "itemImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1148846080;
  objc_msgSend(v15, "setContentCompressionResistancePriority:forAxis:", 0, v16);

  -[NDOAppItemViewCell itemImageView](self, "itemImageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 1148846080;
  objc_msgSend(v17, "setContentCompressionResistancePriority:forAxis:", 1, v18);

  v19 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell itemImageView](self, "itemImageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 8, 1, v21, 8, 1.0, 16.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v23) = 1148829696;
  objc_msgSend(v22, "setPriority:", v23);
  -[NSMutableArray addObject:](self->_imageConstraints, "addObject:", v22);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_imageConstraints);
  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell itemTitleLabel](self, "itemTitleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 3, 0, v27, 3, 1.0, 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addConstraint:", v28);

  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell itemTitleLabel](self, "itemTitleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 5, 0, v32, 5, 1.0, 0.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addConstraint:", v33);

  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell itemTitleLabel](self, "itemTitleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v36, 6, 1, v37, 6, 1.0, 0.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addConstraint:", v38);

  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell itemSubtitleLabel](self, "itemSubtitleLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell itemTitleLabel](self, "itemTitleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v41, 3, 0, v42, 4, 1.0, 0.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addConstraint:", v43);

  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell itemSubtitleLabel](self, "itemSubtitleLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v46, 5, 0, v47, 5, 1.0, 0.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addConstraint:", v48);

  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell itemSubtitleLabel](self, "itemSubtitleLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v51, 6, 1, v52, 6, 1.0, 0.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addConstraint:", v53);

  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell itemSubtitleLabel](self, "itemSubtitleLabel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v56, 4, 0, v57, 4, 1.0, 0.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addConstraint:", v58);

  -[NDOAppItemViewCell contentView](self, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell itemImageView](self, "itemImageView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v61, 10, 0, v62, 10, 1.0, 0.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addConstraint:", v63);

  -[NDOAppItemViewCell contentView](self, "contentView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell itemImageView](self, "itemImageView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v66, 5, 0, v67, 6, 1.0, 12.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addConstraint:", v68);

  -[NDOAppItemViewCell contentView](self, "contentView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell contentView](self, "contentView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v71, 6, 0, v72, 6, 1.0, -12.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addConstraint:", v73);

  -[NDOAppItemViewCell contentView](self, "contentView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppItemViewCell contentView](self, "contentView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppItemViewCell itemTitleView](self, "itemTitleView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v76, 8, 1, v77, 8, 1.0, 0.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "addConstraint:", v78);

  v79.receiver = self;
  v79.super_class = (Class)NDOAppItemViewCell;
  -[NDOAppItemViewCell updateConstraints](&v79, sel_updateConstraints);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)NDOAppItemViewCell;
  -[NDOAppItemViewCell sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 < 81.0)
    v4 = 81.0;
  result.height = v4;
  result.width = v3;
  return result;
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
  objc_storeStrong((id *)&self->_imageConstraints, 0);
}

@end
