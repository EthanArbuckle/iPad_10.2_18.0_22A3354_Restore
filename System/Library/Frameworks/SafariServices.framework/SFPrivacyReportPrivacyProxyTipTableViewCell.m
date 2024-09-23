@implementation SFPrivacyReportPrivacyProxyTipTableViewCell

- (SFPrivacyReportPrivacyProxyTipTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFPrivacyReportPrivacyProxyTipTableViewCell *v4;
  SFPrivacyReportPrivacyProxyTipTableViewCell *v5;
  void *v6;
  SFPrivacyReportPrivacyProxyTipTableViewCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFPrivacyReportPrivacyProxyTipTableViewCell;
  v4 = -[SFPrivacyReportPrivacyProxyTipTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SFPrivacyReportPrivacyProxyTipTableViewCell setBackgroundView:](v4, "setBackgroundView:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportPrivacyProxyTipTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[SFPrivacyReportPrivacyProxyTipTableViewCell _createContentViews](v5, "_createContentViews");
    v7 = v5;
  }

  return v5;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)SFPrivacyReportPrivacyProxyTipTableViewCell;
  -[SFPrivacyReportPrivacyProxyTipTableViewCell prepareForReuse](&v13, sel_prepareForReuse);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SFPrivacyReportPrivacyProxyTipTableViewCell contentView](self, "contentView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removeFromSuperview");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

  -[SFPrivacyReportPrivacyProxyTipTableViewCell _createContentViews](self, "_createContentViews");
}

- (void)setUsesInsetStyle:(BOOL)a3
{
  double v4;

  self->_usesInsetStyle = a3;
  if (a3)
    v4 = 0.0;
  else
    v4 = 13.0;
  -[NSLayoutConstraint setConstant:](self->_insetLeading, "setConstant:", v4);
  -[NSLayoutConstraint setConstant:](self->_insetTrailing, "setConstant:", -v4);
}

- (void)_createContentViews
{
  int v2;
  char v3;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
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
  char v39;
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
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  unint64_t v63;
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
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  char **v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSLayoutConstraint *v90;
  NSLayoutConstraint *insetLeading;
  void *v92;
  void *v93;
  void *v94;
  NSLayoutConstraint *v95;
  NSLayoutConstraint *insetTrailing;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;

  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v114 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v114, "isUserAccountInSubscriberTierForPrivacyProxy");
  v106 = objc_msgSend(v114, "state");
  v110 = v2;
  if (v106)
    v3 = 1;
  else
    v3 = v2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0x1E0DC3000uLL;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  objc_msgSend(v7, "setCornerRadius:", 8.0);
  objc_msgSend(v6, "setClipsToBounds:", 1);
  v8 = 0x1E0DC3000uLL;
  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v9);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setSpacing:", 4.0);
  objc_msgSend(v10, "setAxis:", 1);
  objc_msgSend(v10, "setAlignment:", 0);
  objc_msgSend(v10, "setDistribution:", 0);
  objc_msgSend(v6, "addSubview:", v10);
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 11.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v13);

  objc_msgSend(v10, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -11.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

  objc_msgSend(v10, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -13.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v19);

  v107 = v7;
  v109 = v10;
  if ((v3 & 1) != 0)
  {
    v20 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageNamed:inBundle:withConfiguration:", CFSTR("PrivateProxyIcon"), v21, v22);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v112);
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTintColor:", v24);

    objc_msgSend(v6, "addSubview:", v23);
    objc_msgSend(v23, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToConstant:", 35.0);
    v26 = v10;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v27);

    objc_msgSend(v23, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToConstant:", 35.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v29);

    objc_msgSend(v23, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 11.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v32);

    objc_msgSend(v23, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 13.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v35);

    objc_msgSend(v23, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -13.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v38);

    if (v106 == 1)
      v39 = v110;
    else
      v39 = 1;
    if ((v39 & 1) != 0)
    {
      v10 = v109;
      v8 = 0x1E0DC3000;
      v5 = 0x1E0DC3000;
      goto LABEL_13;
    }
    v43 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "systemButtonWithImage:target:action:", v44, self, sel__dismiss_);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = 0x1E0DC3000uLL;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTintColor:", v45);

    objc_msgSend(v6, "addSubview:", v40);
    objc_msgSend(v40, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, 13.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v48);

    objc_msgSend(v40, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, -13.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v51);

    objc_msgSend(v40, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToConstant:", 13.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v53);

    objc_msgSend(v40, "heightAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToConstant:", 13.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v109;
    v5 = 0x1E0DC3000uLL;
  }
  else
  {
    objc_msgSend(v10, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, 13.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "addObject:", v42);

LABEL_13:
  v54 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFont:", v55);

  v111 = v54;
  objc_msgSend(v54, "setNumberOfLines:", 0);
  v56 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v57 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setFont:", v58);

  objc_msgSend(*(id *)(v8 + 1624), "secondaryLabelColor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setTextColor:", v59);

  objc_msgSend(v56, "setNumberOfLines:", 0);
  v60 = objc_alloc_init(*(Class *)(v5 + 3856));
  objc_msgSend(*(id *)(v8 + 1624), "quaternaryLabelColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setBackgroundColor:", v61);

  objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v60, "heightAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToConstant:", 1.0);
  v63 = v8;
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v64);

  objc_msgSend(v60, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v67);

  objc_msgSend(v60, "topAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, 4.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v70);

  v113 = v60;
  objc_msgSend(v60, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v73);

  v74 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v74, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v57);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setFont:", v75);

  objc_msgSend(v74, "setNumberOfLines:", 0);
  objc_msgSend(*(id *)(v63 + 1624), "linkColor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setTextColor:", v76);

  objc_msgSend(v74, "setUserInteractionEnabled:", 1);
  if (v110)
  {
    v77 = v4;
    _WBSLocalizedString();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v111;
    objc_msgSend(v111, "setText:", v78);

    v82 = v56;
    _WBSLocalizedString();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setText:", v83);

    v84 = &selRef__setPrivacyProxyStateToTrackersAndWebsites_;
  }
  else
  {
    v77 = v4;
    _WBSLocalizedString();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v111;
    objc_msgSend(v111, "setText:", v80);

    _WBSLocalizedString();
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v56;
    objc_msgSend(v56, "setText:", v81);

    if (v106)
      v84 = &selRef__openICloudPrivateRelaySettingsToLearnMore_;
    else
      v84 = &selRef__setPrivacyProxyStateToTrackers_;
  }
  _WBSLocalizedString();
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setText:", v85);

  v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, *v84);
  objc_msgSend(v74, "addGestureRecognizer:", v86);

  objc_msgSend(v10, "addArrangedSubview:", v79);
  objc_msgSend(v10, "addArrangedSubview:", v82);
  objc_msgSend(v10, "addArrangedSubview:", v74);
  objc_msgSend(v10, "setCustomSpacing:afterView:", v82, 14.0);
  objc_msgSend(v6, "addSubview:", v113);
  objc_msgSend(v6, "leadingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivacyReportPrivacyProxyTipTableViewCell contentView](self, "contentView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v89);
  v90 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  insetLeading = self->_insetLeading;
  self->_insetLeading = v90;

  objc_msgSend(v6, "trailingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivacyReportPrivacyProxyTipTableViewCell contentView](self, "contentView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "trailingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:", v94);
  v95 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  insetTrailing = self->_insetTrailing;
  self->_insetTrailing = v95;

  objc_msgSend(v6, "topAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivacyReportPrivacyProxyTipTableViewCell contentView](self, "contentView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "topAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "addObject:", v100);

  objc_msgSend(v6, "bottomAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivacyReportPrivacyProxyTipTableViewCell contentView](self, "contentView");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "bottomAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "addObject:", v104);

  objc_msgSend(v77, "addObject:", self->_insetLeading);
  objc_msgSend(v77, "addObject:", self->_insetTrailing);
  -[SFPrivacyReportPrivacyProxyTipTableViewCell contentView](self, "contentView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "addSubview:", v6);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v77);
}

- (void)_notifyDelegateOfStateChange
{
  id v3;

  -[SFPrivacyReportPrivacyProxyTipTableViewCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "cellPrivacyProxyStateChanged:", self);

}

- (void)_turnOnCrossSiteTrackingProtectionIfNeeded
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "webui_trackerProtectionEnabled");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forSetting:", &unk_1E4B27590, *MEMORY[0x1E0D47120]);

    objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "webui_applySafariCookieAcceptPolicy");

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0DD9958], 0, 0, 0);
  }
}

- (void)_setPrivacyProxyStateToTrackersAndWebsites:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[SFPrivacyReportPrivacyProxyTipTableViewCell _turnOnCrossSiteTrackingProtectionIfNeeded](self, "_turnOnCrossSiteTrackingProtectionIfNeeded", a3);
  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__SFPrivacyReportPrivacyProxyTipTableViewCell__setPrivacyProxyStateToTrackersAndWebsites___block_invoke;
  v5[3] = &unk_1E4AC1820;
  v5[4] = self;
  objc_msgSend(v4, "setPrivacyProxyState:completionHandler:", 2, v5);

}

uint64_t __90__SFPrivacyReportPrivacyProxyTipTableViewCell__setPrivacyProxyStateToTrackersAndWebsites___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "_notifyDelegateOfStateChange");
  return result;
}

- (void)_setPrivacyProxyStateToTrackers:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[SFPrivacyReportPrivacyProxyTipTableViewCell _turnOnCrossSiteTrackingProtectionIfNeeded](self, "_turnOnCrossSiteTrackingProtectionIfNeeded", a3);
  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__SFPrivacyReportPrivacyProxyTipTableViewCell__setPrivacyProxyStateToTrackers___block_invoke;
  v5[3] = &unk_1E4AC1820;
  v5[4] = self;
  objc_msgSend(v4, "setPrivacyProxyState:completionHandler:", 1, v5);

}

uint64_t __79__SFPrivacyReportPrivacyProxyTipTableViewCell__setPrivacyProxyStateToTrackers___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "_notifyDelegateOfStateChange");
  return result;
}

- (void)_openICloudPrivateRelaySettingsToLearnMore:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D8AAF8], "openPrivateRelayICloudSettings", a3);
}

- (void)_dismiss:(id)a3
{
  id v4;

  -[SFPrivacyReportPrivacyProxyTipTableViewCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "cellPrivacyProxyUpsellDismissed:", self);

}

- (BOOL)usesInsetStyle
{
  return self->_usesInsetStyle;
}

- (SFPrivacyReportPrivacyProxyTipTableViewCellDelegate)delegate
{
  return (SFPrivacyReportPrivacyProxyTipTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_insetTrailing, 0);
  objc_storeStrong((id *)&self->_insetLeading, 0);
}

@end
