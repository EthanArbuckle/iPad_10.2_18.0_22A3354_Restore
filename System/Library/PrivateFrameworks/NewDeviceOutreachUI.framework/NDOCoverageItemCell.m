@implementation NDOCoverageItemCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NDOCoverageItemCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v19, sel_refreshCellContentsWithSpecifier_, a3);
  -[NDOCoverageItemCell updateDeviceImage](self, "updateDeviceImage");
  -[PSTableCell specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_itemTitleLabel, "setText:", v5);

  -[PSTableCell specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NDOCoverageItemCellCoverageLabelKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_itemSubtitleLabel, "setText:", v7);

  -[PSTableCell specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NDOCoverageItemCellOfferLabelKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    self->_hasOffer = 1;
    -[PSTableCell specifier](self, "specifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NDOCoverageItemCellOfferLabelKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_itemOfferLabel, "setText:", v11);

    v12 = (void *)MEMORY[0x24BDD17C8];
    -[PSTableCell specifier](self, "specifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel text](self->_itemSubtitleLabel, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel text](self->_itemOfferLabel, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@\n%@\n%@"), v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOCoverageItemCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v17);

  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    -[PSTableCell specifier](self, "specifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel text](self->_itemSubtitleLabel, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@\n%@"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOCoverageItemCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v16);
  }

  -[NDOCoverageItemCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NDOCoverageItemCell;
  -[PSTableCell layoutSubviews](&v3, sel_layoutSubviews);
  -[NDOCoverageItemCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[PSTableCell setCellEnabled:](self, "setCellEnabled:", 1);
}

- (NDOCoverageItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  NDOCoverageItemCell *v5;
  NDOCoverageItemCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NDOCoverageItemCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[NDOCoverageItemCell _setupWarrantyCoverageCell](v5, "_setupWarrantyCoverageCell");
  return v6;
}

- (void)_setupWarrantyCoverageCell
{
  void *v3;
  UIImageView *v4;
  UIImageView *itemImageView;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UILabel *v12;
  UILabel *itemTitleLabel;
  void *v14;
  UILabel *v15;
  UILabel *itemSubtitleLabel;
  uint64_t v17;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *itemOfferLabel;
  void *v22;
  void *v23;
  UIView *v24;
  UIView *itemTitleView;
  void *v26;

  -[PSTableCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", 0);
  itemImageView = self->_itemImageView;
  self->_itemImageView = v4;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_itemImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[NDOCoverageItemCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_itemImageView);

  v7 = objc_alloc(MEMORY[0x24BEBD708]);
  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v12 = (UILabel *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], v9, v10, v11);
  itemTitleLabel = self->_itemTitleLabel;
  self->_itemTitleLabel = v12;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_itemTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setBackgroundColor:](self->_itemTitleLabel, "setBackgroundColor:", 0);
  -[UILabel setOpaque:](self->_itemTitleLabel, "setOpaque:", 0);
  -[UILabel setNumberOfLines:](self->_itemTitleLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_itemTitleLabel, "setFont:", v14);

  v15 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v8, v9, v10, v11);
  itemSubtitleLabel = self->_itemSubtitleLabel;
  self->_itemSubtitleLabel = v15;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_itemSubtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setBackgroundColor:](self->_itemSubtitleLabel, "setBackgroundColor:", 0);
  -[UILabel setOpaque:](self->_itemSubtitleLabel, "setOpaque:", 0);
  -[UILabel setNumberOfLines:](self->_itemSubtitleLabel, "setNumberOfLines:", 2);
  v17 = *MEMORY[0x24BEBE1F0];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_itemSubtitleLabel, "setFont:", v18);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_itemSubtitleLabel, "setTextColor:", v19);

  v20 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v8, v9, v10, v11);
  itemOfferLabel = self->_itemOfferLabel;
  self->_itemOfferLabel = v20;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_itemOfferLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setBackgroundColor:](self->_itemOfferLabel, "setBackgroundColor:", 0);
  -[UILabel setOpaque:](self->_itemOfferLabel, "setOpaque:", 0);
  -[UILabel setNumberOfLines:](self->_itemOfferLabel, "setNumberOfLines:", 2);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_itemOfferLabel, "setFont:", v22);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_itemOfferLabel, "setTextColor:", v23);

  v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v8, v9, v10, v11);
  itemTitleView = self->_itemTitleView;
  self->_itemTitleView = v24;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_itemTitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_itemTitleView, "addSubview:", self->_itemTitleLabel);
  -[UIView addSubview:](self->_itemTitleView, "addSubview:", self->_itemSubtitleLabel);
  -[UIView addSubview:](self->_itemTitleView, "addSubview:", self->_itemOfferLabel);
  -[NDOCoverageItemCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", self->_itemTitleView);

  -[NDOCoverageItemCell layoutSubviews](self, "layoutSubviews");
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
  NSMutableArray *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
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
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  objc_super v105;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  imageConstraints = self->_imageConstraints;
  self->_imageConstraints = v3;

  v5 = self->_imageConstraints;
  v6 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemImageView](self, "itemImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 5, 0, v8, 5, 1.0, 15.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v5, "addObject:", v9);

  v10 = self->_imageConstraints;
  v11 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemImageView](self, "itemImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 3, 1, v13, 3, 1.0, 8.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v10, "addObject:", v14);

  v15 = self->_imageConstraints;
  v16 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemImageView](self, "itemImageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 10, 0, v18, 10, 1.0, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v15, "addObject:", v19);

  v20 = self->_imageConstraints;
  v21 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemImageView](self, "itemImageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 7, 0, 0, 0, 1.0, 40.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v20, "addObject:", v23);

  v24 = self->_imageConstraints;
  v25 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemImageView](self, "itemImageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 8, 0, 0, 0, 1.0, 40.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v24, "addObject:", v27);

  -[NDOCoverageItemCell itemImageView](self, "itemImageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = 1148846080;
  objc_msgSend(v28, "setContentCompressionResistancePriority:forAxis:", 0, v29);

  -[NDOCoverageItemCell itemImageView](self, "itemImageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v31) = 1148846080;
  objc_msgSend(v30, "setContentCompressionResistancePriority:forAxis:", 1, v31);

  v32 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell itemImageView](self, "itemImageView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 8, 1, v34, 8, 1.0, 16.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v36) = 1148829696;
  objc_msgSend(v35, "setPriority:", v36);
  -[NSMutableArray addObject:](self->_imageConstraints, "addObject:", v35);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_imageConstraints);
  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemTitleLabel](self, "itemTitleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 3, 0, v40, 3, 1.0, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addConstraint:", v41);

  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemTitleLabel](self, "itemTitleLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v44, 5, 0, v45, 5, 1.0, 0.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addConstraint:", v46);

  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell itemTitleLabel](self, "itemTitleLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v49, 6, 1, v50, 6, 1.0, 0.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addConstraint:", v51);

  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemSubtitleLabel](self, "itemSubtitleLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell itemTitleLabel](self, "itemTitleLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v54, 3, 0, v55, 4, 1.0, 0.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addConstraint:", v56);

  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemSubtitleLabel](self, "itemSubtitleLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v59, 5, 0, v60, 5, 1.0, 0.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addConstraint:", v61);

  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell itemSubtitleLabel](self, "itemSubtitleLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v64, 6, 1, v65, 6, 1.0, 0.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addConstraint:", v66);

  LODWORD(v66) = self->_hasOffer;
  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)MEMORY[0x24BDD1628];
  if ((_DWORD)v66)
  {
    -[NDOCoverageItemCell itemOfferLabel](self, "itemOfferLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOCoverageItemCell itemSubtitleLabel](self, "itemSubtitleLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v69, 3, 0, v70, 4, 1.0, 0.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addConstraint:", v71);

    -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)MEMORY[0x24BDD1628];
    -[NDOCoverageItemCell itemOfferLabel](self, "itemOfferLabel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v74, 5, 0, v75, 5, 1.0, 0.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addConstraint:", v76);

    -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)MEMORY[0x24BDD1628];
    -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOCoverageItemCell itemOfferLabel](self, "itemOfferLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v79, 6, 1, v80, 6, 1.0, 0.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addConstraint:", v81);

    -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)MEMORY[0x24BDD1628];
    -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOCoverageItemCell itemOfferLabel](self, "itemOfferLabel");
  }
  else
  {
    -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOCoverageItemCell itemSubtitleLabel](self, "itemSubtitleLabel");
  }
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v82, 4, 0, v83, 4, 1.0, 0.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addConstraint:", v84);

  -[NDOCoverageItemCell contentView](self, "contentView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell itemImageView](self, "itemImageView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v87, 10, 0, v88, 10, 1.0, 0.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "addConstraint:", v89);

  -[NDOCoverageItemCell contentView](self, "contentView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell itemImageView](self, "itemImageView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v92, 5, 0, v93, 6, 1.0, 12.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addConstraint:", v94);

  -[NDOCoverageItemCell contentView](self, "contentView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell contentView](self, "contentView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v97, 6, 0, v98, 6, 1.0, -12.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addConstraint:", v99);

  -[NDOCoverageItemCell contentView](self, "contentView");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = (void *)MEMORY[0x24BDD1628];
  -[NDOCoverageItemCell itemTitleView](self, "itemTitleView");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageItemCell contentView](self, "contentView");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v102, 3, 1, v103, 3, 1.0, 8.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "addConstraint:", v104);

  v105.receiver = self;
  v105.super_class = (Class)NDOCoverageItemCell;
  -[NDOCoverageItemCell updateConstraints](&v105, sel_updateConstraints);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)NDOCoverageItemCell;
  -[NDOCoverageItemCell sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 < 60.0)
    v4 = 60.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)updateDeviceImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  -[PSTableCell specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NDOCoverageItemCellImageURLKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_initWeak(&location, self);
    +[NDOImageManager sharedManager](NDOImageManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40__NDOCoverageItemCell_updateDeviceImage__block_invoke;
    v9[3] = &unk_24F3351D8;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    v6 = (id)objc_msgSend(v5, "fetchImageWithURLString:completion:", v10, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PSTableCell specifier](self, "specifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NDOCoverageItemCellFallbackImageKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_itemImageView, "setImage:", v8);

  }
}

void __40__NDOCoverageItemCell_updateDeviceImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (!v5 || v6)
  {
    _NDOLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __40__NDOCoverageItemCell_updateDeviceImage__block_invoke_cold_1((uint64_t)v6, a1, v10);

    objc_msgSend(v8, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NDOCoverageItemCellFallbackImageKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v11);

  }
  else
  {
    objc_msgSend(WeakRetained, "itemImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v5);
  }

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

- (UILabel)itemOfferLabel
{
  return self->_itemOfferLabel;
}

- (void)setItemOfferLabel:(id)a3
{
  objc_storeStrong((id *)&self->_itemOfferLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemOfferLabel, 0);
  objc_storeStrong((id *)&self->_itemSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_itemTitleLabel, 0);
  objc_storeStrong((id *)&self->_itemTitleView, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
  objc_storeStrong((id *)&self->_imageConstraints, 0);
}

void __40__NDOCoverageItemCell_updateDeviceImage__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_229EC7000, log, OS_LOG_TYPE_ERROR, "Image fetch failed with error: %@ for: %@", (uint8_t *)&v4, 0x16u);
}

@end
