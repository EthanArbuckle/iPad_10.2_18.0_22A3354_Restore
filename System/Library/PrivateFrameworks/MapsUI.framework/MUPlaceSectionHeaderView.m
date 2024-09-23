@implementation MUPlaceSectionHeaderView

- (MUPlaceSectionHeaderView)initWithViewModel:(id)a3
{
  id v5;
  MUPlaceSectionHeaderView *v6;
  MUPlaceSectionHeaderView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceSectionHeaderView;
  v6 = -[MUPlaceSectionHeaderView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_headerViewModel, a3);
    -[MUPlaceSectionHeaderView _setupHeader](v7, "_setupHeader");
  }

  return v7;
}

- (void)_setupHeader
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UILabel *v9;
  UILabel *subtitleLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIButton *v17;
  UIButton *seeAllButton;
  void *v19;
  void *v20;
  MUPlaceSectionHeaderViewModel *headerViewModel;
  void *v22;
  void *v23;
  char v24;
  UIButton *v25;
  void *v26;
  void *v27;
  char v28;
  UIButton *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UIFocusGuide *v34;
  UIFocusGuide *headerFocusGuide;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  UILabel *v45;
  UILabel *v46;
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
  UIButton *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
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
  id v78;
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
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  UILabel *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  _QWORD v102[9];
  _QWORD v103[3];
  _QWORD v104[2];
  _QWORD v105[3];

  v105[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPlaceSectionHeaderViewModel titleString](self->_headerViewModel, "titleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel set_mapsui_text:](self->_titleLabel, "set_mapsui_text:", v5);

  MUPlaceSectionHeaderFont();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("PlaceSectionHeaderTitle"));
  -[MUPlaceSectionHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
  -[MUPlaceSectionHeaderViewModel subtitleString](self->_headerViewModel, "subtitleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
    v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUPlaceSectionHeaderViewModel subtitleString](self->_headerViewModel, "subtitleString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel set_mapsui_text:](self->_subtitleLabel, "set_mapsui_text:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v12);

    MUPlaceSectionHeaderSubtitleFont();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_subtitleLabel, "setFont:", v13);

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("PlaceSectionHeaderSubtitle"));
    -[MUPlaceSectionHeaderView addSubview:](self, "addSubview:", self->_subtitleLabel);
  }
  -[MUPlaceSectionHeaderViewModel seeMoreButtonText](self->_headerViewModel, "seeMoreButtonText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "length"))
  {

    goto LABEL_15;
  }
  -[MUPlaceSectionHeaderViewModel target](self->_headerViewModel, "target");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionHeaderViewModel selector](self->_headerViewModel, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {

  }
  else
  {
    -[MUPlaceSectionHeaderViewModel seeMoreButtonMenu](self->_headerViewModel, "seeMoreButtonMenu");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0DC3518], "_mapsui_sectionHeaderButton");
  v17 = (UIButton *)objc_claimAutoreleasedReturnValue();
  seeAllButton = self->_seeAllButton;
  self->_seeAllButton = v17;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_seeAllButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPlaceSectionHeaderViewModel seeMoreButtonText](self->_headerViewModel, "seeMoreButtonText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton set_mapsui_title:](self->_seeAllButton, "set_mapsui_title:", v19);

  -[MUPlaceSectionHeaderViewModel seeMoreButtonMenu](self->_headerViewModel, "seeMoreButtonMenu");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  headerViewModel = self->_headerViewModel;
  if (v20)
  {
    -[MUPlaceSectionHeaderViewModel seeMoreButtonMenu](headerViewModel, "seeMoreButtonMenu");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setMenu:](self->_seeAllButton, "setMenu:", v22);

    -[UIButton setShowsMenuAsPrimaryAction:](self->_seeAllButton, "setShowsMenuAsPrimaryAction:", 1);
    -[UIButton setPreferredMenuElementOrder:](self->_seeAllButton, "setPreferredMenuElementOrder:", 2);
    -[MUPlaceSectionHeaderViewModel target](self->_headerViewModel, "target");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderViewModel selector](self->_headerViewModel, "selector");
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      v25 = self->_seeAllButton;
      -[MUPlaceSectionHeaderViewModel target](self->_headerViewModel, "target");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton addTarget:action:forControlEvents:](v25, "addTarget:action:forControlEvents:", v26, -[MUPlaceSectionHeaderViewModel selector](self->_headerViewModel, "selector"), 0x4000);
LABEL_13:

    }
  }
  else
  {
    -[MUPlaceSectionHeaderViewModel target](headerViewModel, "target");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderViewModel selector](self->_headerViewModel, "selector");
    v28 = objc_opt_respondsToSelector();

    if ((v28 & 1) != 0)
    {
      v29 = self->_seeAllButton;
      -[MUPlaceSectionHeaderViewModel target](self->_headerViewModel, "target");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton _mapsui_setTarget:action:](v29, "_mapsui_setTarget:action:", v26, -[MUPlaceSectionHeaderViewModel selector](self->_headerViewModel, "selector"));
      goto LABEL_13;
    }
  }
  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self->_seeAllButton, "setTintColor:", v30);

  -[UIButton titleLabel](self->_seeAllButton, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_seeAllButton, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFont:", v32);

  -[UIButton setAccessibilityIdentifier:](self->_seeAllButton, "setAccessibilityIdentifier:", CFSTR("PlaceSectionHeaderButton"));
  -[MUPlaceSectionHeaderView addSubview:](self, "addSubview:", self->_seeAllButton);
  v34 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x1E0DC37D0]);
  headerFocusGuide = self->_headerFocusGuide;
  self->_headerFocusGuide = v34;

  v105[0] = self->_seeAllButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFocusGuide setPreferredFocusEnvironments:](self->_headerFocusGuide, "setPreferredFocusEnvironments:", v36);

  -[MUPlaceSectionHeaderView addLayoutGuide:](self, "addLayoutGuide:", self->_headerFocusGuide);
LABEL_15:
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionHeaderView leadingAnchor](self, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v40;
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionHeaderView topAnchor](self, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, 3.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v37;
  objc_msgSend(v37, "addObjectsFromArray:", v44);

  v45 = self->_titleLabel;
  v46 = self->_subtitleLabel;
  if (v46)
  {
    -[UILabel leadingAnchor](v46, "leadingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderView leadingAnchor](self, "leadingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v95);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v47;
    -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, 4.0);
    v93 = v45;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v50;
    -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderView bottomAnchor](self, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v103[2] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 3);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "addObjectsFromArray:", v54);

    v45 = self->_subtitleLabel;
  }
  -[UILabel bottomAnchor](v45, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionHeaderView bottomAnchor](self, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v100;
  objc_msgSend(v100, "addObject:", v57);

  v59 = self->_seeAllButton;
  if (v59)
  {
    -[UIButton bottomAnchor](v59, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderView bottomAnchor](self, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v63) = 1132068864;
    objc_msgSend(v62, "setPriority:", v63);
    -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](self->_seeAllButton, "leadingAnchor");
    v89 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintLessThanOrEqualToAnchor:constant:", v89, -8.0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v98;
    -[UIButton trailingAnchor](self->_seeAllButton, "trailingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderView trailingAnchor](self, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:", v94);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v92;
    -[UIButton firstBaselineAnchor](self->_seeAllButton, "firstBaselineAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v99);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v102[2] = v90;
    -[UIButton topAnchor](self->_seeAllButton, "topAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderView topAnchor](self, "topAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintGreaterThanOrEqualToAnchor:", v86);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v102[3] = v85;
    v102[4] = v62;
    -[UIFocusGuide leadingAnchor](self->_headerFocusGuide, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderView leadingAnchor](self, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v102[5] = v82;
    -[UIFocusGuide trailingAnchor](self->_headerFocusGuide, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderView trailingAnchor](self, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v102[6] = v79;
    -[UIFocusGuide topAnchor](self->_headerFocusGuide, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderView topAnchor](self, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v102[7] = v66;
    -[UIFocusGuide bottomAnchor](self->_headerFocusGuide, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderView bottomAnchor](self, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v102[8] = v69;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 9);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "addObjectsFromArray:", v70);

    v71 = v62;
    v72 = v88;

    v73 = (void *)v89;
    v58 = v100;

  }
  else
  {
    -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderView trailingAnchor](self, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "addObject:", v73);
  }

  v74 = (void *)MEMORY[0x1E0CB3718];
  v75 = (void *)objc_msgSend(v58, "copy");
  objc_msgSend(v74, "activateConstraints:", v75);

  objc_opt_self();
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v76;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (id)-[MUPlaceSectionHeaderView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v77, sel__contentSizeDidChange);

}

- (void)_contentSizeDidChange
{
  void *v3;
  id v4;

  MUPlaceSectionHeaderFont();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  MUPlaceSectionHeaderSubtitleFont();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v4);

}

- (void)beginAnimatingActivityIndicator
{
  -[UIButton setAlpha:](self->_seeAllButton, "setAlpha:", 0.3);
  -[UIButton setUserInteractionEnabled:](self->_seeAllButton, "setUserInteractionEnabled:", 0);
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  -[UIButton setAlpha:](self->_seeAllButton, "setAlpha:", a3, 1.0);
  -[UIButton setUserInteractionEnabled:](self->_seeAllButton, "setUserInteractionEnabled:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerViewModel, 0);
  objc_storeStrong((id *)&self->_headerFocusGuide, 0);
  objc_storeStrong((id *)&self->_seeAllButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
