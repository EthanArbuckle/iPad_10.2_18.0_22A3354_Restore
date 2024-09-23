@implementation CPSPointsOfInterestPickerInfoView

- (void)updateWithModel:(id)a3
{
  CPPointOfInterest *v3;
  UIStackView *v4;
  UIStackView *v5;
  UIStackView *v6;
  UIStackView *v7;
  BOOL v8;
  id location[2];
  CPSPointsOfInterestPickerInfoView *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSPointsOfInterestPickerInfoView model](v10, "model");
  v8 = v3 == location[0];

  if (!v8)
  {
    objc_storeStrong((id *)&v10->_model, location[0]);
    v7 = -[CPSPointsOfInterestPickerInfoView topStackView](v10, "topStackView");

    if (v7)
    {
      v6 = -[CPSPointsOfInterestPickerInfoView topStackView](v10, "topStackView");
      -[UIStackView removeFromSuperview](v6, "removeFromSuperview");

      -[CPSPointsOfInterestPickerInfoView setTopStackView:](v10, "setTopStackView:", 0);
    }
    v5 = -[CPSPointsOfInterestPickerInfoView bottomStackView](v10, "bottomStackView");

    if (v5)
    {
      v4 = -[CPSPointsOfInterestPickerInfoView bottomStackView](v10, "bottomStackView");
      -[UIStackView removeFromSuperview](v4, "removeFromSuperview");

      -[CPSPointsOfInterestPickerInfoView setBottomStackView:](v10, "setBottomStackView:", 0);
    }
    -[CPSPointsOfInterestPickerInfoView setupViews](v10, "setupViews");
  }
  objc_storeStrong(location, 0);
}

- (void)setupViews
{
  id v2;
  uint64_t v3;
  UIStackView *topStackView;
  uint64_t v5;
  UIStackView *bottomStackView;
  NSString *v7;
  NSString *v8;
  UILabel *v9;
  UILabel *detailsTitle;
  NSString *v11;
  UILabel *v12;
  UILabel *detailsSubtitle;
  NSString *v14;
  UILabel *v15;
  UILabel *detailsInformativeText;
  CPSStyledTextButton *v17;
  CPSStyledTextButton *primaryButton;
  CPSStyledTextButton *v19;
  CPSStyledTextButton *secondaryButton;
  double v21;
  id v22;
  id v23;
  UIStackView *v24;
  id v25;
  UIStackView *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  UIStackView *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  UIStackView *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  UIStackView *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  UIStackView *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  UIStackView *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  UIStackView *v56;
  CPTextButton *v57;
  CPPointOfInterest *v58;
  CPSStyledTextButton *v59;
  id v60;
  UIStackView *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  UIStackView *v66;
  id v67;
  id v68;
  id v69;
  UIStackView *v70;
  id v71;
  id v72;
  id v73;
  CPPointOfInterest *v74;
  CPTextButton *v75;
  CPTextButton *v76;
  CPPointOfInterest *v77;
  CPSStyledTextButton *v78;
  id v79;
  UIStackView *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  UIStackView *v85;
  id v86;
  id v87;
  id v88;
  UIStackView *v89;
  id v90;
  id v91;
  id v92;
  CPPointOfInterest *v93;
  CPTextButton *v94;
  id v95;
  UIStackView *v96;
  CPPointOfInterest *v97;
  NSString *v98;
  id v99;
  UIStackView *v100;
  CPPointOfInterest *v101;
  NSString *v102;
  id v103;
  UIStackView *v104;
  double *v105;
  CPPointOfInterest *v106;
  NSString *v107;
  id v108;
  id v109;
  id v110;
  char v111;
  NSString *v112;
  char v113;
  CPPointOfInterest *v114;
  id v115;
  char v116;
  NSString *v117;
  char v118;
  CPPointOfInterest *v119;
  id v120;
  char v121;
  NSString *v122;
  char v123;
  CPPointOfInterest *v124;
  id v125[2];
  CPSPointsOfInterestPickerInfoView *v126;
  _QWORD v127[3];
  _QWORD v128[4];
  _QWORD v129[3];
  _QWORD v130[4];

  v130[3] = *MEMORY[0x24BDAC8D0];
  v126 = self;
  v125[1] = (id)a2;
  v2 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v105 = (double *)MEMORY[0x24BDBF090];
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  topStackView = v126->_topStackView;
  v126->_topStackView = (UIStackView *)v3;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v126->_topStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](v126->_topStackView, "setAxis:");
  -[UIStackView setAlignment:](v126->_topStackView, "setAlignment:", 1);
  -[UIStackView setDistribution:](v126->_topStackView, "setDistribution:", 2);
  -[UIStackView setSpacing:](v126->_topStackView, "setSpacing:");
  -[CPSPointsOfInterestPickerInfoView addSubview:](v126, "addSubview:", v126->_topStackView);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithFrame:", *v105, v105[1], v105[2], v105[3]);
  bottomStackView = v126->_bottomStackView;
  v126->_bottomStackView = (UIStackView *)v5;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v126->_bottomStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](v126->_bottomStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](v126->_bottomStackView, "setAlignment:", 3);
  -[UIStackView setSpacing:](v126->_bottomStackView, "setSpacing:", 2.0);
  -[CPSPointsOfInterestPickerInfoView addSubview:](v126, "addSubview:", v126->_bottomStackView);
  v106 = -[CPSPointsOfInterestPickerInfoView model](v126, "model");
  v7 = -[CPPointOfInterest detailTitle](v106, "detailTitle");
  v107 = v7;
  v123 = 0;
  v121 = 0;
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v124 = -[CPSPointsOfInterestPickerInfoView model](v126, "model");
    v123 = 1;
    v122 = -[CPPointOfInterest title](v124, "title");
    v121 = 1;
    v8 = v122;
  }
  v125[0] = v8;
  if ((v121 & 1) != 0)

  if ((v123 & 1) != 0)
  if (v125[0])
  {
    v9 = (UILabel *)CPSPointsOfInterestMakeLabel(CFSTR("CPSPointsOfInterestDetailsLabel"));
    detailsTitle = v126->_detailsTitle;
    v126->_detailsTitle = v9;

    -[UILabel setNumberOfLines:](v126->_detailsTitle, "setNumberOfLines:", 2);
    -[UILabel setText:](v126->_detailsTitle, "setText:", v125[0]);
    v103 = +[CPSEntityStyles pickerInfoPrimaryFont](CPSEntityStyles, "pickerInfoPrimaryFont");
    -[UILabel setFont:](v126->_detailsTitle, "setFont:");

    v104 = -[CPSPointsOfInterestPickerInfoView topStackView](v126, "topStackView");
    -[UIStackView addArrangedSubview:](v104, "addArrangedSubview:", v126->_detailsTitle);

  }
  v101 = -[CPSPointsOfInterestPickerInfoView model](v126, "model");
  v102 = -[CPPointOfInterest detailSubtitle](v101, "detailSubtitle");
  v118 = 0;
  v116 = 0;
  if (v102)
  {
    v11 = v102;
  }
  else
  {
    v119 = -[CPSPointsOfInterestPickerInfoView model](v126, "model");
    v118 = 1;
    v117 = -[CPPointOfInterest subtitle](v119, "subtitle");
    v116 = 1;
    v11 = v117;
  }
  v120 = v11;
  if ((v116 & 1) != 0)

  if ((v118 & 1) != 0)
  if (v120)
  {
    v12 = (UILabel *)CPSPointsOfInterestMakeLabel(CFSTR("CPSPointsOfInterestDetailsSubtitleLabel"));
    detailsSubtitle = v126->_detailsSubtitle;
    v126->_detailsSubtitle = v12;

    -[UILabel setText:](v126->_detailsSubtitle, "setText:", v120);
    -[UILabel setNumberOfLines:](v126->_detailsSubtitle, "setNumberOfLines:", 0);
    v99 = +[CPSEntityStyles pickerInfoSecondaryFont](CPSEntityStyles, "pickerInfoSecondaryFont");
    -[UILabel setFont:](v126->_detailsSubtitle, "setFont:");

    v100 = -[CPSPointsOfInterestPickerInfoView topStackView](v126, "topStackView");
    -[UIStackView addArrangedSubview:](v100, "addArrangedSubview:", v126->_detailsSubtitle);

  }
  v97 = -[CPSPointsOfInterestPickerInfoView model](v126, "model");
  v98 = -[CPPointOfInterest detailSummary](v97, "detailSummary");
  v113 = 0;
  v111 = 0;
  if (v98)
  {
    v14 = v98;
  }
  else
  {
    v114 = -[CPSPointsOfInterestPickerInfoView model](v126, "model");
    v113 = 1;
    v112 = -[CPPointOfInterest summary](v114, "summary");
    v111 = 1;
    v14 = v112;
  }
  v115 = v14;
  if ((v111 & 1) != 0)

  if ((v113 & 1) != 0)
  if (v115)
  {
    v15 = (UILabel *)CPSPointsOfInterestMakeLabel(CFSTR("CPSPointsOfInterestDetailsInformativeLabel"));
    detailsInformativeText = v126->_detailsInformativeText;
    v126->_detailsInformativeText = v15;

    -[UILabel setText:](v126->_detailsInformativeText, "setText:", v115);
    -[UILabel setNumberOfLines:](v126->_detailsInformativeText, "setNumberOfLines:", 0);
    v95 = +[CPSEntityStyles pickerInfoSecondaryFont](CPSEntityStyles, "pickerInfoSecondaryFont");
    -[UILabel setFont:](v126->_detailsInformativeText, "setFont:");

    v96 = -[CPSPointsOfInterestPickerInfoView topStackView](v126, "topStackView");
    -[UIStackView addArrangedSubview:](v96, "addArrangedSubview:", v126->_detailsInformativeText);

  }
  v93 = -[CPSPointsOfInterestPickerInfoView model](v126, "model");
  v94 = -[CPPointOfInterest primaryButton](v93, "primaryButton");

  if (v94)
  {
    v77 = -[CPSPointsOfInterestPickerInfoView model](v126, "model");
    v76 = -[CPPointOfInterest primaryButton](v77, "primaryButton");
    v17 = +[CPSStyledTextButton buttonWithTextButton:](CPSStyledTextButton, "buttonWithTextButton:");
    primaryButton = v126->_primaryButton;
    v126->_primaryButton = v17;

    -[CPSStyledTextButton setTranslatesAutoresizingMaskIntoConstraints:](v126->_primaryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v78 = v126->_primaryButton;
    v79 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 12.0);
    -[CPSStyledTextButton setFontOverride:](v78, "setFontOverride:");

    -[CPSButton setDelegate:](v126->_primaryButton, "setDelegate:", v126);
    v80 = -[CPSPointsOfInterestPickerInfoView bottomStackView](v126, "bottomStackView");
    -[UIStackView addArrangedSubview:](v80, "addArrangedSubview:", v126->_primaryButton);

    v81 = (void *)MEMORY[0x24BDD1628];
    v92 = (id)-[CPSStyledTextButton heightAnchor](v126->_primaryButton, "heightAnchor");
    v91 = (id)objc_msgSend(v92, "constraintEqualToConstant:", 30.0);
    v130[0] = v91;
    v90 = (id)-[CPSStyledTextButton leftAnchor](v126->_primaryButton, "leftAnchor");
    v89 = -[CPSPointsOfInterestPickerInfoView bottomStackView](v126, "bottomStackView");
    v88 = (id)-[UIStackView leftAnchor](v89, "leftAnchor");
    v87 = (id)objc_msgSend(v90, "constraintEqualToAnchor:");
    v130[1] = v87;
    v86 = (id)-[CPSStyledTextButton rightAnchor](v126->_primaryButton, "rightAnchor");
    v85 = -[CPSPointsOfInterestPickerInfoView bottomStackView](v126, "bottomStackView");
    v84 = (id)-[UIStackView rightAnchor](v85, "rightAnchor");
    v83 = (id)objc_msgSend(v86, "constraintEqualToAnchor:");
    v130[2] = v83;
    v82 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v130, 3);
    objc_msgSend(v81, "activateConstraints:");

  }
  v74 = -[CPSPointsOfInterestPickerInfoView model](v126, "model");
  v75 = -[CPPointOfInterest secondaryButton](v74, "secondaryButton");

  if (v75)
  {
    v58 = -[CPSPointsOfInterestPickerInfoView model](v126, "model");
    v57 = -[CPPointOfInterest secondaryButton](v58, "secondaryButton");
    v19 = +[CPSStyledTextButton buttonWithTextButton:](CPSStyledTextButton, "buttonWithTextButton:");
    secondaryButton = v126->_secondaryButton;
    v126->_secondaryButton = v19;

    -[CPSStyledTextButton setTranslatesAutoresizingMaskIntoConstraints:](v126->_primaryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSButton setDelegate:](v126->_secondaryButton, "setDelegate:", v126);
    v59 = v126->_secondaryButton;
    v60 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 12.0);
    -[CPSStyledTextButton setFontOverride:](v59, "setFontOverride:");

    v61 = -[CPSPointsOfInterestPickerInfoView bottomStackView](v126, "bottomStackView");
    -[UIStackView addArrangedSubview:](v61, "addArrangedSubview:", v126->_secondaryButton);

    v62 = (void *)MEMORY[0x24BDD1628];
    v73 = (id)-[CPSStyledTextButton heightAnchor](v126->_secondaryButton, "heightAnchor");
    v72 = (id)objc_msgSend(v73, "constraintEqualToConstant:", 30.0);
    v129[0] = v72;
    v71 = (id)-[CPSStyledTextButton leftAnchor](v126->_secondaryButton, "leftAnchor");
    v70 = -[CPSPointsOfInterestPickerInfoView bottomStackView](v126, "bottomStackView");
    v69 = (id)-[UIStackView leftAnchor](v70, "leftAnchor");
    v68 = (id)objc_msgSend(v71, "constraintEqualToAnchor:");
    v129[1] = v68;
    v67 = (id)-[CPSStyledTextButton rightAnchor](v126->_secondaryButton, "rightAnchor");
    v66 = -[CPSPointsOfInterestPickerInfoView bottomStackView](v126, "bottomStackView");
    v65 = (id)-[UIStackView rightAnchor](v66, "rightAnchor");
    v64 = (id)objc_msgSend(v67, "constraintEqualToAnchor:");
    v129[2] = v64;
    v63 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v129, 3);
    objc_msgSend(v62, "activateConstraints:");

  }
  v110 = (id)objc_opt_new();
  v41 = -[CPSPointsOfInterestPickerInfoView topStackView](v126, "topStackView");
  v40 = (id)-[UIStackView topAnchor](v41, "topAnchor");
  v39 = (id)-[CPSPointsOfInterestPickerInfoView safeAreaLayoutGuide](v126, "safeAreaLayoutGuide");
  v38 = (id)objc_msgSend(v39, "topAnchor");
  v37 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
  v128[0] = v37;
  v36 = -[CPSPointsOfInterestPickerInfoView topStackView](v126, "topStackView");
  v35 = (id)-[UIStackView leadingAnchor](v36, "leadingAnchor");
  v34 = (id)-[CPSPointsOfInterestPickerInfoView safeAreaLayoutGuide](v126, "safeAreaLayoutGuide");
  v33 = (id)objc_msgSend(v34, "leadingAnchor");
  v32 = (id)objc_msgSend(v35, "constraintEqualToAnchor:");
  v128[1] = v32;
  v31 = -[CPSPointsOfInterestPickerInfoView topStackView](v126, "topStackView");
  v30 = (id)-[UIStackView trailingAnchor](v31, "trailingAnchor");
  v29 = (id)-[CPSPointsOfInterestPickerInfoView safeAreaLayoutGuide](v126, "safeAreaLayoutGuide");
  v28 = (id)objc_msgSend(v29, "trailingAnchor");
  v27 = (id)objc_msgSend(v30, "constraintEqualToAnchor:constant:", -20.0);
  v128[2] = v27;
  v26 = -[CPSPointsOfInterestPickerInfoView topStackView](v126, "topStackView");
  v25 = (id)-[UIStackView bottomAnchor](v26, "bottomAnchor");
  v24 = -[CPSPointsOfInterestPickerInfoView bottomStackView](v126, "bottomStackView");
  v23 = (id)-[UIStackView topAnchor](v24, "topAnchor");
  v22 = (id)objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:");
  v128[3] = v22;
  v109 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v128, 4);

  v56 = -[CPSPointsOfInterestPickerInfoView bottomStackView](v126, "bottomStackView");
  v55 = (id)-[UIStackView leadingAnchor](v56, "leadingAnchor");
  v54 = (id)-[CPSPointsOfInterestPickerInfoView safeAreaLayoutGuide](v126, "safeAreaLayoutGuide");
  v53 = (id)objc_msgSend(v54, "leadingAnchor");
  v52 = (id)objc_msgSend(v55, "constraintEqualToAnchor:");
  v127[0] = v52;
  v51 = -[CPSPointsOfInterestPickerInfoView bottomStackView](v126, "bottomStackView");
  v50 = (id)-[UIStackView trailingAnchor](v51, "trailingAnchor");
  v49 = (id)-[CPSPointsOfInterestPickerInfoView safeAreaLayoutGuide](v126, "safeAreaLayoutGuide");
  v48 = (id)objc_msgSend(v49, "trailingAnchor");
  v47 = (id)objc_msgSend(v50, "constraintEqualToAnchor:");
  v127[1] = v47;
  v46 = -[CPSPointsOfInterestPickerInfoView bottomStackView](v126, "bottomStackView");
  v45 = (id)-[UIStackView bottomAnchor](v46, "bottomAnchor");
  v44 = (id)-[CPSPointsOfInterestPickerInfoView safeAreaLayoutGuide](v126, "safeAreaLayoutGuide");
  v43 = (id)objc_msgSend(v44, "bottomAnchor");
  v42 = (id)objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:");
  v127[2] = v42;
  v108 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v127, 3);

  objc_msgSend(v110, "addObjectsFromArray:", v109);
  objc_msgSend(v110, "addObjectsFromArray:", v108);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v110);
  LODWORD(v21) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v126->_detailsTitle, "setContentCompressionResistancePriority:forAxis:", 1, v21);
  objc_storeStrong(&v108, 0);
  objc_storeStrong(&v109, 0);
  objc_storeStrong(&v110, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v120, 0);
  objc_storeStrong(v125, 0);
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  UIEdgeInsetsMake_4();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)didSelectButton:(id)a3
{
  id v3;
  CPPointOfInterest *v4;
  CPSPointsOfInterestPickerInfoDelegate *v5;
  CPSPointsOfInterestPickerInfoDelegate *v6;
  char v7;
  id location[2];
  CPSPointsOfInterestPickerInfoView *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[CPSPointsOfInterestPickerInfoView delegate](v9, "delegate");
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSPointsOfInterestPickerInfoView delegate](v9, "delegate");
    v3 = location[0];
    v4 = -[CPSPointsOfInterestPickerInfoView model](v9, "model");
    -[CPSPointsOfInterestPickerInfoDelegate actionButtonPressed:forModel:](v5, "actionButtonPressed:forModel:", v3);

  }
  objc_storeStrong(location, 0);
}

- (id)_linearFocusItems
{
  id v3;
  CPSStyledTextButton *v4;
  CPSStyledTextButton *v5;
  CPSStyledTextButton *v6;
  CPSStyledTextButton *v7;
  id v8[2];
  CPSPointsOfInterestPickerInfoView *v9;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = -[CPSPointsOfInterestPickerInfoView primaryButton](v9, "primaryButton");

  if (v7)
  {
    v6 = -[CPSPointsOfInterestPickerInfoView primaryButton](v9, "primaryButton");
    objc_msgSend(v8[0], "addObject:");

  }
  v5 = -[CPSPointsOfInterestPickerInfoView secondaryButton](v9, "secondaryButton");

  if (v5)
  {
    v4 = -[CPSPointsOfInterestPickerInfoView secondaryButton](v9, "secondaryButton");
    objc_msgSend(v8[0], "addObject:");

  }
  v3 = v8[0];
  objc_storeStrong(v8, 0);
  return v3;
}

- (CPPointOfInterest)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (CPSPointsOfInterestPickerInfoDelegate)delegate
{
  return (CPSPointsOfInterestPickerInfoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIStackView)topStackView
{
  return self->_topStackView;
}

- (void)setTopStackView:(id)a3
{
  objc_storeStrong((id *)&self->_topStackView, a3);
}

- (UIStackView)bottomStackView
{
  return self->_bottomStackView;
}

- (void)setBottomStackView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomStackView, a3);
}

- (UILabel)detailsTitle
{
  return self->_detailsTitle;
}

- (void)setDetailsTitle:(id)a3
{
  objc_storeStrong((id *)&self->_detailsTitle, a3);
}

- (UILabel)detailsSubtitle
{
  return self->_detailsSubtitle;
}

- (void)setDetailsSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_detailsSubtitle, a3);
}

- (UILabel)detailsInformativeText
{
  return self->_detailsInformativeText;
}

- (void)setDetailsInformativeText:(id)a3
{
  objc_storeStrong((id *)&self->_detailsInformativeText, a3);
}

- (CPSStyledTextButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButton, a3);
}

- (CPSStyledTextButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailsInformativeText, 0);
  objc_storeStrong((id *)&self->_detailsSubtitle, 0);
  objc_storeStrong((id *)&self->_detailsTitle, 0);
  objc_storeStrong((id *)&self->_bottomStackView, 0);
  objc_storeStrong((id *)&self->_topStackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
