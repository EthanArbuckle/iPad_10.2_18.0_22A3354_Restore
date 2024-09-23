@implementation HUICCCapsuleButton

- (HUICCCapsuleButton)initWithFrame:(CGRect)a3
{
  HUICCCapsuleButton *v3;
  HUICCCapsuleButton *v4;
  uint64_t v5;
  MTMaterialView *backgroundView;
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
  UIStackView *v19;
  UIStackView *mainStack;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UIStackView *v30;
  UIStackView *horizontalPillStack;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  UIView *v37;
  UIView *iconViewContainer;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  UIStackView *v45;
  UIStackView *verticalTitleStack;
  UIView *v47;
  UIView *accessoryViewContainer;
  UILabel *v49;
  UILabel *titleLabel;
  void *v51;
  UILabel *v52;
  void *v53;
  void *v54;
  UILabel *v55;
  void *v56;
  double v57;
  double v58;
  UILabel *v59;
  UILabel *subtitleLabel;
  void *v61;
  UILabel *v62;
  void *v63;
  void *v64;
  UILabel *v65;
  void *v66;
  double v67;
  double v68;
  HACCStackView *v69;
  HACCStackView *expandedStack;
  void *v71;
  void *v72;
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
  objc_super v85;
  _QWORD v86[2];
  void *v87;
  _QWORD v88[4];
  void *v89;
  _QWORD v90[6];

  v90[4] = *MEMORY[0x24BDAC8D0];
  v85.receiver = self;
  v85.super_class = (Class)HUICCCapsuleButton;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v85, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUICCCapsuleButton setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[HUICCCapsuleButton _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 37.0);
    HUICCBackgroundMaterialView();
    v5 = objc_claimAutoreleasedReturnValue();
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (MTMaterialView *)v5;

    -[MTMaterialView setTranslatesAutoresizingMaskIntoConstraints:](v4->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MTMaterialView setUserInteractionEnabled:](v4->_backgroundView, "setUserInteractionEnabled:", 1);
    -[HUICCCapsuleButton insertSubview:atIndex:](v4, "insertSubview:atIndex:", v4->_backgroundView, 0);
    v74 = (void *)MEMORY[0x24BDD1628];
    -[MTMaterialView leadingAnchor](v4->_backgroundView, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton leadingAnchor](v4, "leadingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v82);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v80;
    -[MTMaterialView trailingAnchor](v4->_backgroundView, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton trailingAnchor](v4, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v76);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v7;
    -[MTMaterialView topAnchor](v4->_backgroundView, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton topAnchor](v4, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v90[2] = v10;
    -[MTMaterialView bottomAnchor](v4->_backgroundView, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton bottomAnchor](v4, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v90[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v90, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "activateConstraints:", v14);

    v15 = (void *)MEMORY[0x24BDD1628];
    -[HUICCCapsuleButton heightAnchor](v4, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintGreaterThanOrEqualToConstant:", 74.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v18);

    v19 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    mainStack = v4->_mainStack;
    v4->_mainStack = v19;

    -[UIStackView setDistribution:](v4->_mainStack, "setDistribution:", 0);
    -[UIStackView setAxis:](v4->_mainStack, "setAxis:", 1);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_mainStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MTMaterialView addSubview:](v4->_backgroundView, "addSubview:", v4->_mainStack);
    v75 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView leadingAnchor](v4->_mainStack, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton leadingAnchor](v4, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v81);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v79;
    -[UIStackView trailingAnchor](v4->_mainStack, "trailingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton trailingAnchor](v4, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v22;
    -[UIStackView topAnchor](v4->_mainStack, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton topAnchor](v4, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v88[2] = v25;
    -[UIStackView bottomAnchor](v4->_mainStack, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton bottomAnchor](v4, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v88[3] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "activateConstraints:", v29);

    v30 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    horizontalPillStack = v4->_horizontalPillStack;
    v4->_horizontalPillStack = v30;

    -[UIStackView setAxis:](v4->_horizontalPillStack, "setAxis:", 0);
    -[UIStackView setAlignment:](v4->_horizontalPillStack, "setAlignment:", 3);
    -[UIStackView setSpacing:](v4->_horizontalPillStack, "setSpacing:", 20.0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v4->_horizontalPillStack, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIStackView setLayoutMargins:](v4->_horizontalPillStack, "setLayoutMargins:", 10.0, 10.0, 10.0, 10.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_horizontalPillStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v4->_mainStack, "addArrangedSubview:", v4->_horizontalPillStack);
    v32 = (void *)MEMORY[0x24BDD1628];
    -[HUICCCapsuleButton horizontalPillStack](v4, "horizontalPillStack");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintGreaterThanOrEqualToConstant:", 74.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v87, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v36);

    v37 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    iconViewContainer = v4->_iconViewContainer;
    v4->_iconViewContainer = v37;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v4->_horizontalPillStack, "addArrangedSubview:", v4->_iconViewContainer);
    v39 = (void *)MEMORY[0x24BDD1628];
    -[UIView heightAnchor](v4->_iconViewContainer, "heightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToConstant:", 54.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v41;
    -[UIView widthAnchor](v4->_iconViewContainer, "widthAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", 54.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v43;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v44);

    v45 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    verticalTitleStack = v4->_verticalTitleStack;
    v4->_verticalTitleStack = v45;

    -[UIStackView setAxis:](v4->_verticalTitleStack, "setAxis:", 1);
    -[UIStackView setAlignment:](v4->_verticalTitleStack, "setAlignment:", 3);
    -[UIStackView addArrangedSubview:](v4->_horizontalPillStack, "addArrangedSubview:", v4->_verticalTitleStack);
    v47 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    accessoryViewContainer = v4->_accessoryViewContainer;
    v4->_accessoryViewContainer = v47;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_accessoryViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v4->_horizontalPillStack, "addArrangedSubview:", v4->_accessoryViewContainer);
    v49 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v49;

    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE200], 32770, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v4->_titleLabel;
    v53 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v51, "pointSize");
    objc_msgSend(v53, "fontWithDescriptor:size:", v51);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v52, "setFont:", v54);

    v55 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v55, "setTextColor:", v56);

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setClipsToBounds:](v4->_titleLabel, "setClipsToBounds:", 0);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 0);
    LODWORD(v57) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v57);
    LODWORD(v58) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v58);
    -[UILabel setAutoresizingMask:](v4->_titleLabel, "setAutoresizingMask:", 18);
    -[UIStackView addArrangedSubview:](v4->_verticalTitleStack, "addArrangedSubview:", v4->_titleLabel);
    v59 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v59;

    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE218], 0x8000, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = v4->_subtitleLabel;
    v63 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v61, "pointSize");
    objc_msgSend(v63, "fontWithDescriptor:size:", v61);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v62, "setFont:", v64);

    v65 = v4->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v65, "setTextColor:", v66);

    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 1);
    -[UILabel setClipsToBounds:](v4->_subtitleLabel, "setClipsToBounds:", 0);
    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0);
    LODWORD(v67) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v67);
    LODWORD(v68) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v68);
    -[UILabel setAutoresizingMask:](v4->_subtitleLabel, "setAutoresizingMask:", 18);
    -[UIStackView addArrangedSubview:](v4->_verticalTitleStack, "addArrangedSubview:", v4->_subtitleLabel);
    v69 = objc_alloc_init(HACCStackView);
    expandedStack = v4->_expandedStack;
    v4->_expandedStack = v69;

    -[HACCStackView setAxis:](v4->_expandedStack, "setAxis:", 1);
    -[HACCStackView setAlignment:](v4->_expandedStack, "setAlignment:", 0);
    -[UIStackView addArrangedSubview:](v4->_mainStack, "addArrangedSubview:", v4->_expandedStack);
    v4->_isExpanded = 0;
    -[HACCStackView setAlpha:](v4->_expandedStack, "setAlpha:", 0.0);
    -[HACCStackView setHidden:](v4->_expandedStack, "setHidden:", 1);
    HUICCBackgroundVisualStylingProviderForCategory(1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton setVisualStylingProvider:forCategory:](v4, "setVisualStylingProvider:forCategory:", v71, 1);

    HUICCBackgroundVisualStylingProviderForCategory(2);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton setVisualStylingProvider:forCategory:](v4, "setVisualStylingProvider:forCategory:", v72, 2);

  }
  return v4;
}

- (void)setIconView:(id)a3
{
  id v5;
  UIView **p_iconView;
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
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_iconView = &self->_iconView;
  objc_storeStrong((id *)&self->_iconView, a3);
  if (self->_iconView)
  {
    -[HUICCCapsuleButton iconViewContainer](self, "iconViewContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", *p_iconView);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)MEMORY[0x24BDD1628];
    -[UIView centerYAnchor](*p_iconView, "centerYAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton iconViewContainer](self, "iconViewContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    -[UIView centerXAnchor](*p_iconView, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton iconViewContainer](self, "iconViewContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v16);

  }
}

- (void)setAccessoryView:(id)a3
{
  id v5;
  UIView **p_accessoryView;
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
  id v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_accessoryView = &self->_accessoryView;
  objc_storeStrong((id *)&self->_accessoryView, a3);
  if (self->_accessoryView)
  {
    -[HUICCCapsuleButton accessoryViewContainer](self, "accessoryViewContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", *p_accessoryView);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (void *)MEMORY[0x24BDD1628];
    -[UIView leadingAnchor](*p_accessoryView, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton accessoryViewContainer](self, "accessoryViewContainer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v22;
    -[UIView trailingAnchor](*p_accessoryView, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton accessoryViewContainer](self, "accessoryViewContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v8;
    -[UIView topAnchor](*p_accessoryView, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton accessoryViewContainer](self, "accessoryViewContainer");
    v26 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v12;
    -[UIView bottomAnchor](*p_accessoryView, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton accessoryViewContainer](self, "accessoryViewContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v17);

    v5 = v26;
  }

}

- (void)_updateStackConstraints
{
  int v3;
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
  uint64_t v18;
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
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v3 = HUICCLargeTextEnabled();
  -[HUICCCapsuleButton horizontalPillStack](self, "horizontalPillStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setAxis:", 1);

    -[HUICCCapsuleButton defaultLayouts](self, "defaultLayouts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD1628];
      -[HUICCCapsuleButton defaultLayouts](self, "defaultLayouts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deactivateConstraints:", v8);

    }
    -[HUICCCapsuleButton largeTextLayouts](self, "largeTextLayouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[HUICCCapsuleButton accessoryViewContainer](self, "accessoryViewContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "widthAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintLessThanOrEqualToConstant:", 54.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v12;
      -[HUICCCapsuleButton accessoryViewContainer](self, "accessoryViewContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "heightAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintLessThanOrEqualToConstant:", 54.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCCapsuleButton setLargeTextLayouts:](self, "setLargeTextLayouts:", v16);

    }
    v17 = (void *)MEMORY[0x24BDD1628];
    -[HUICCCapsuleButton largeTextLayouts](self, "largeTextLayouts");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "setAxis:", 0);

    -[HUICCCapsuleButton largeTextLayouts](self, "largeTextLayouts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)MEMORY[0x24BDD1628];
      -[HUICCCapsuleButton largeTextLayouts](self, "largeTextLayouts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "deactivateConstraints:", v21);

    }
    -[HUICCCapsuleButton defaultLayouts](self, "defaultLayouts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      -[HUICCCapsuleButton accessoryViewContainer](self, "accessoryViewContainer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "widthAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToConstant:", 54.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v25;
      -[HUICCCapsuleButton accessoryViewContainer](self, "accessoryViewContainer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "heightAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToConstant:", 54.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v28;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUICCCapsuleButton setDefaultLayouts:](self, "setDefaultLayouts:", v29);

    }
    v17 = (void *)MEMORY[0x24BDD1628];
    -[HUICCCapsuleButton defaultLayouts](self, "defaultLayouts");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v18;
  objc_msgSend(v17, "activateConstraints:", v18);

}

- (void)setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUICCCapsuleButton titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setSubtitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUICCCapsuleButton subtitleLabel](self, "subtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setDimmingState:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;

  v3 = a3;
  if (a3)
    v5 = 0.3;
  else
    v5 = 1.0;
  -[HUICCCapsuleButton mainStack](self, "mainStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  -[HUICCCapsuleButton setEnabled:](self, "setEnabled:", !v3);
}

- (void)setIsExpanded:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[HUICCCapsuleButton supportsExpanding](self, "supportsExpanding"))
  {
    if (self->_isExpanded != v3)
      -[HUICCCapsuleButton _setIsExpanded:](self, "_setIsExpanded:", v3);
  }
}

- (void)_setIsExpanded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v3 = a3;
  self->_isExpanded = a3;
  -[HUICCCapsuleButton expandedStack](self, "expandedStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0.0;
  if (v3)
    v7 = 1.0;
  objc_msgSend(v5, "setAlpha:", v7);

  -[HUICCCapsuleButton expandedStack](self, "expandedStack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", !v3);

  -[HUICCCapsuleButton delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateHeight");

}

- (BOOL)supportsExpanding
{
  unint64_t v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = -[HUICCCapsuleButton module](self, "module");
  if (v3)
  {
    if (v3 == 24)
    {
      return 1;
    }
    else
    {
      if (v3 == 31)
      {
        -[HUICCCapsuleButton delegate](self, "delegate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "showPMEExpandedOptions");

        return v5;
      }
      return 0;
    }
  }
  else
  {
    -[HUICCCapsuleButton delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentHearingDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hearingAidReachable");

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (void)addExpandedView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[HUICCCapsuleButton expandedStack](self, "expandedStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertArrangedSubview:atIndex:withSeparator:", v4, -[HUICCCapsuleButton _indexToInsertFor:](self, "_indexToInsertFor:", v4), -[HUICCCapsuleButton shouldAddSeparatorForView:](self, "shouldAddSeparatorForView:", v4));

  LODWORD(v5) = -[HUICCCapsuleButton shouldAutoExpandForView:](self, "shouldAutoExpandForView:", v4);
  if ((_DWORD)v5)
  {
    -[HUICCCapsuleButton expandedStack](self, "expandedStack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrangedSubviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
      -[HUICCCapsuleButton _setIsExpanded:](self, "_setIsExpanded:", 1);
  }
}

- (int64_t)_indexToInsertFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HUICCCapsuleButton expandedStack](self, "expandedStack", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      v12 = v9 + v8;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v14 = objc_msgSend(v4, "tag");
        if (v14 < objc_msgSend(v13, "tag"))
        {
          v12 = v9 + v11;
          goto LABEL_12;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_12:

  return v12;
}

- (void)removeExpandedView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[HUICCCapsuleButton expandedStack](self, "expandedStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeArrangedSubview:", v4);

  -[HUICCCapsuleButton expandedStack](self, "expandedStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrangedSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    -[HUICCCapsuleButton setIsExpanded:](self, "setIsExpanded:", 0);
}

- (void)buttonTapped
{
  void *v3;

  -[HUICCCapsuleButton delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlDidActivate:", self);

  AXPerformBlockOnMainThreadAfterDelay();
}

void __34__HUICCCapsuleButton_buttonTapped__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateHeight");

}

- (BOOL)shouldAutoExpandForView:(id)a3
{
  return 0;
}

- (BOOL)shouldAddSeparatorForView:(id)a3
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[HUICCCapsuleButton titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[HUICCCapsuleButton subtitleLabel](self, "subtitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDF00];
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[HUICCCapsuleButton supportsExpanding](self, "supportsExpanding"))
  {
    -[HUICCCapsuleButton isExpanded](self, "isExpanded");
    hearingLocString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v5 = objc_alloc(MEMORY[0x24BEBD378]);
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __48__HUICCCapsuleButton_accessibilityCustomActions__block_invoke;
    v11 = &unk_24DD61078;
    objc_copyWeak(&v12, &location);
    v6 = (void *)objc_msgSend(v5, "initWithName:actionHandler:", v4, &v8);
    objc_msgSend(v3, "addObject:", v6, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
  return v3;
}

uint64_t __48__HUICCCapsuleButton_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  id v4;
  UIAccessibilityNotifications v5;
  id v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "isExpanded") ^ 1;
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setIsExpanded:", v3);

  v5 = *MEMORY[0x24BEBDE88];
  v6 = objc_loadWeakRetained(v1);
  if ((objc_msgSend(v6, "isExpanded") & 1) != 0)
  {
    v7 = objc_loadWeakRetained(v1);
    UIAccessibilityPostNotification(v5, v7);

  }
  else
  {
    UIAccessibilityPostNotification(v5, 0);
  }

  return 1;
}

- (BOOL)accessibilityActivate
{
  BOOL v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUICCCapsuleButton;
  v2 = -[HUICCCapsuleButton accessibilityActivate](&v4, sel_accessibilityActivate);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBDE88], 0);
  return v2;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  -[HUICCCapsuleButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUICCCapsuleButton titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityActivationPoint");
    v6 = v5;
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HUICCCapsuleButton;
    -[HUICCCapsuleButton accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)shouldIncludeIconViewInFooterViews
{
  return 0;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[HUICCCapsuleButton isExpanded](self, "isExpanded"))
  {
    -[HUICCCapsuleButton expandedStack](self, "expandedStack");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrangedSubviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[HUICCCapsuleButton shouldIncludeIconViewInFooterViews](self, "shouldIncludeIconViewInFooterViews"))
  {
    -[HUICCCapsuleButton iconView](self, "iconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[HUICCCapsuleButton iconView](self, "iconView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertObject:atIndex:", v7, 0);

    }
  }
  return v5;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_24DD6B2F0;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v10[4];
  id v11;
  HUICCCapsuleButton *v12;

  v6 = a3;
  -[HUICCCapsuleButton requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __59__HUICCCapsuleButton_setVisualStylingProvider_forCategory___block_invoke;
    v10[3] = &unk_24DD61050;
    v11 = v6;
    v12 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

  }
}

void __59__HUICCCapsuleButton_setVisualStylingProvider_forCategory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "automaticallyUpdateView:withStyle:", v3, 0);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "automaticallyUpdateView:withStyle:", v5, 1);

}

- (HACCContentModuleDelegate)delegate
{
  return (HACCContentModuleDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (unint64_t)module
{
  return self->module;
}

- (void)setModule:(unint64_t)a3
{
  self->module = a3;
}

- (UIView)iconView
{
  return self->_iconView;
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

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIStackView)mainStack
{
  return self->_mainStack;
}

- (void)setMainStack:(id)a3
{
  objc_storeStrong((id *)&self->_mainStack, a3);
}

- (HACCStackView)expandedStack
{
  return self->_expandedStack;
}

- (void)setExpandedStack:(id)a3
{
  objc_storeStrong((id *)&self->_expandedStack, a3);
}

- (UIStackView)horizontalPillStack
{
  return self->_horizontalPillStack;
}

- (void)setHorizontalPillStack:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalPillStack, a3);
}

- (UIView)iconViewContainer
{
  return self->_iconViewContainer;
}

- (void)setIconViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_iconViewContainer, a3);
}

- (UIStackView)verticalTitleStack
{
  return self->_verticalTitleStack;
}

- (void)setVerticalTitleStack:(id)a3
{
  objc_storeStrong((id *)&self->_verticalTitleStack, a3);
}

- (UIView)accessoryViewContainer
{
  return self->_accessoryViewContainer;
}

- (void)setAccessoryViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewContainer, a3);
}

- (NSArray)defaultLayouts
{
  return self->_defaultLayouts;
}

- (void)setDefaultLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLayouts, a3);
}

- (NSArray)largeTextLayouts
{
  return self->_largeTextLayouts;
}

- (void)setLargeTextLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextLayouts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextLayouts, 0);
  objc_storeStrong((id *)&self->_defaultLayouts, 0);
  objc_storeStrong((id *)&self->_accessoryViewContainer, 0);
  objc_storeStrong((id *)&self->_verticalTitleStack, 0);
  objc_storeStrong((id *)&self->_iconViewContainer, 0);
  objc_storeStrong((id *)&self->_horizontalPillStack, 0);
  objc_storeStrong((id *)&self->_expandedStack, 0);
  objc_storeStrong((id *)&self->_mainStack, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (BOOL)enabled
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 1;
}

- (id)contentValue
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return (id)MEMORY[0x24BDBD1C8];
}

@end
