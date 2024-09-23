@implementation ActiveDeviceLinkCell

+ (int64_t)cellStyle
{
  return 0;
}

- (ActiveDeviceLinkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  ActiveDeviceLinkCell *v5;
  ActiveDeviceLinkCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ActiveDeviceLinkCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ActiveDeviceLinkCell setupSubviews](v5, "setupSubviews");
    -[ActiveDeviceLinkCell setupConstraints](v6, "setupConstraints");
  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ActiveDeviceLinkCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v15, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class(), v15.receiver, v15.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FROM_TITLE"), &stru_24C878158, CFSTR("LocalizableUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell fromLabel](self, "fromLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v4, "propertyForKey:", CFSTR("ActiveDeviceLinkNameKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v4, "propertyForKey:", CFSTR("ActiveDeviceLinkDetailsKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell detailsHeightContraint](self, "detailsHeightContraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", v13 == 0);

  -[ActiveDeviceLinkCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setupSubviews
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
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
  id v24;

  v3 = 2 * (objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection") != 1);
  v4 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[ActiveDeviceLinkCell setFromLabel:](self, "setFromLabel:", v4);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell fromLabel](self, "fromLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  v7 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[ActiveDeviceLinkCell setDeviceNameLabel:](self, "setDeviceNameLabel:", v7);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(MEMORY[0x24BDF6950], "tableCellGrayTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextAlignment:", v3);

  v13 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[ActiveDeviceLinkCell setDetailsLabel:](self, "setDetailsLabel:", v13);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  objc_msgSend(MEMORY[0x24BDF6950], "tableCellGrayTextColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v16);

  -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextAlignment:", v3);

  -[ActiveDeviceLinkCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell fromLabel](self, "fromLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  -[ActiveDeviceLinkCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v22);

  -[ActiveDeviceLinkCell contentView](self, "contentView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v23);

}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  NSString *v10;
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
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;

  -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ActiveDeviceLinkCell fromLabel](self, "fromLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ActiveDeviceLinkCell fromLabel](self, "fromLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1148846080;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v7);

  -[ActiveDeviceLinkCell fromLabel](self, "fromLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1148846080;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v9);

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "preferredContentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = UIContentSizeCategoryIsAccessibilityCategory(v10);

  -[ActiveDeviceLinkCell fromLabel](self, "fromLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutMarginsGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[ActiveDeviceLinkCell fromLabel](self, "fromLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, 8.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[ActiveDeviceLinkCell fromLabel](self, "fromLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v8)
  {
    -[ActiveDeviceLinkCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 8.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell fromLabel](self, "fromLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell contentView](self, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layoutMarginsGuide");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setActive:", 1);

    -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell contentView](self, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setActive:", 1);

    -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setTextAlignment:", 0);

    -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setNumberOfLines:", 0);

    -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell contentView](self, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "layoutMarginsGuide");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActive:", 1);

    -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell contentView](self, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setActive:", 1);

    -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell contentView](self, "contentView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v64, -8.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setActive:", 1);

    -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setTextAlignment:", 0);

    -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setNumberOfLines:", 0);
  }
  else
  {
    -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v69, -8.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setActive:", 1);

    -[ActiveDeviceLinkCell fromLabel](self, "fromLabel");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell contentView](self, "contentView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "bottomAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v74, -8.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setActive:", 1);

    -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell contentView](self, "contentView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "topAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v79, 8.0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setActive:", 1);

    -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "trailingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell contentView](self, "contentView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "layoutMarginsGuide");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setActive:", 1);

    -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "bottomAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "topAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setActive:", 1);

    -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "leadingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setActive:", 1);

    -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "trailingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell contentView](self, "contentView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "layoutMarginsGuide");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "trailingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setActive:", 1);

    -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "bottomAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActiveDeviceLinkCell contentView](self, "contentView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "bottomAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:constant:", v105, -8.0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setActive:", 1);

  }
  -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
  v109 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "heightAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "constraintEqualToConstant:", 0.0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActiveDeviceLinkCell setDetailsHeightContraint:](self, "setDetailsHeightContraint:", v108);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ActiveDeviceLinkCell;
  -[PSTableCell layoutSubviews](&v10, sel_layoutSubviews);
  -[PSTableCell specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE75A18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[ActiveDeviceLinkCell deviceNameLabel](self, "deviceNameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5 ^ 1);

  -[ActiveDeviceLinkCell detailsLabel](self, "detailsLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v5 ^ 1);

  if ((_DWORD)v5)
    v8 = 1.0;
  else
    v8 = 0.400000006;
  -[ActiveDeviceLinkCell fromLabel](self, "fromLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v8);

  -[PSTableCell setCellEnabled:](self, "setCellEnabled:", v5);
}

- (UILabel)fromLabel
{
  return self->_fromLabel;
}

- (void)setFromLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fromLabel, a3);
}

- (UILabel)deviceNameLabel
{
  return self->_deviceNameLabel;
}

- (void)setDeviceNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceNameLabel, a3);
}

- (UILabel)detailsLabel
{
  return self->_detailsLabel;
}

- (void)setDetailsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailsLabel, a3);
}

- (NSLayoutConstraint)detailsHeightContraint
{
  return self->_detailsHeightContraint;
}

- (void)setDetailsHeightContraint:(id)a3
{
  objc_storeStrong((id *)&self->_detailsHeightContraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsHeightContraint, 0);
  objc_storeStrong((id *)&self->_detailsLabel, 0);
  objc_storeStrong((id *)&self->_deviceNameLabel, 0);
  objc_storeStrong((id *)&self->_fromLabel, 0);
}

@end
