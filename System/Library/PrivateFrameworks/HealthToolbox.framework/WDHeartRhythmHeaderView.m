@implementation WDHeartRhythmHeaderView

- (WDHeartRhythmHeaderView)initWithReuseIdentifier:(id)a3
{
  WDHeartRhythmHeaderView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *titleLabel;
  uint64_t v11;
  UITextView *bodyTextView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WDHeartRhythmHeaderView;
  v3 = -[WDHeartRhythmHeaderView initWithReuseIdentifier:](&v14, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6EF8]), "initWithFrame:textContainer:", 0, v5, v6, v7, v8);
    bodyTextView = v3->_bodyTextView;
    v3->_bodyTextView = (UITextView *)v11;

    -[WDHeartRhythmHeaderView setUpUI](v3, "setUpUI");
  }
  return v3;
}

- (void)setUpUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
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
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSLayoutConstraint *v46;
  NSLayoutConstraint *titleFirstBaselineToTopMarginConstraint;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSLayoutConstraint *v53;
  NSLayoutConstraint *bodyFirstBaslineToTitleLastBaslineConstraint;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSLayoutConstraint *v61;
  NSLayoutConstraint *bottomMarginToBodyLastBaselineConstraint;
  double v63;
  NSLayoutConstraint *v64;
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
  _QWORD v92[9];

  v92[7] = *MEMORY[0x24BDAC8D0];
  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", 1);

  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", 4);

  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF7850], 2, 0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v91, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1144766464;
  objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v10);

  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1148829696;
  objc_msgSend(v11, "setContentHuggingPriority:forAxis:", 0, v12);

  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1144766464;
  objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 1, v14);

  -[WDHeartRhythmHeaderView contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v19);

  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextAlignment:", 4);

  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "textContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLineFragmentPadding:", 0.0);

  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setScrollEnabled:", 0);

  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setEditable:", 0);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFont:", v26);

  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDelegate:", self);

  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = 1144750080;
  objc_msgSend(v29, "setContentHuggingPriority:forAxis:", 1, v30);

  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = 1144750080;
  objc_msgSend(v31, "setContentCompressionResistancePriority:forAxis:", 1, v32);

  -[WDHeartRhythmHeaderView contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v34);

  -[WDHeartRhythmHeaderView contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layoutMargins");
  v37 = v36;
  v39 = v38;

  -[WDHeartRhythmHeaderView contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setLayoutMargins:", 0.0, v37, 0.0, v39);

  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "firstBaselineAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "layoutMarginsGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v45);
  v46 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleFirstBaselineToTopMarginConstraint = self->_titleFirstBaselineToTopMarginConstraint;
  self->_titleFirstBaselineToTopMarginConstraint = v46;

  LODWORD(v48) = 1144733696;
  -[NSLayoutConstraint setPriority:](self->_titleFirstBaselineToTopMarginConstraint, "setPriority:", v48);
  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "firstBaselineAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "lastBaselineAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v52);
  v53 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bodyFirstBaslineToTitleLastBaslineConstraint = self->_bodyFirstBaslineToTitleLastBaslineConstraint;
  self->_bodyFirstBaslineToTitleLastBaslineConstraint = v53;

  LODWORD(v55) = 1144717312;
  -[NSLayoutConstraint setPriority:](self->_bodyFirstBaslineToTitleLastBaslineConstraint, "setPriority:", v55);
  -[WDHeartRhythmHeaderView contentView](self, "contentView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "layoutMarginsGuide");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "lastBaselineAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v60);
  v61 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomMarginToBodyLastBaselineConstraint = self->_bottomMarginToBodyLastBaselineConstraint;
  self->_bottomMarginToBodyLastBaselineConstraint = v61;

  LODWORD(v63) = 1132068864;
  -[NSLayoutConstraint setPriority:](self->_bottomMarginToBodyLastBaselineConstraint, "setPriority:", v63);
  -[WDHeartRhythmHeaderView updateConstraintConstants](self, "updateConstraintConstants");
  v64 = self->_bodyFirstBaslineToTitleLastBaslineConstraint;
  v80 = (void *)MEMORY[0x24BDD1628];
  v92[0] = self->_titleFirstBaselineToTopMarginConstraint;
  v92[1] = v64;
  v92[2] = self->_bottomMarginToBodyLastBaselineConstraint;
  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView contentView](self, "contentView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "layoutMarginsGuide");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v86);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v92[3] = v85;
  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "trailingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView contentView](self, "contentView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "layoutMarginsGuide");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "trailingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:", v79);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v92[4] = v78;
  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView contentView](self, "contentView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "layoutMarginsGuide");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v92[5] = v67;
  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView contentView](self, "contentView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "layoutMarginsGuide");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v92[6] = v73;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v92, 7);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "activateConstraints:", v74);

}

- (void)updateConstraintConstants
{
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v3 = objc_alloc(MEMORY[0x24BDF6A80]);
  v15 = (id)objc_msgSend(v3, "initForTextStyle:", *MEMORY[0x24BDF7850]);
  objc_msgSend(v15, "scaledValueForValue:", 44.0);
  v5 = v4;
  -[WDHeartRhythmHeaderView titleFirstBaselineToTopMarginConstraint](self, "titleFirstBaselineToTopMarginConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  objc_msgSend(v15, "scaledValueForValue:", 28.0);
  v8 = v7;
  -[WDHeartRhythmHeaderView bodyFirstBaslineToTitleLastBaslineConstraint](self, "bodyFirstBaslineToTitleLastBaslineConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConstant:", v8);

  v10 = objc_alloc(MEMORY[0x24BDF6A80]);
  v11 = (void *)objc_msgSend(v10, "initForTextStyle:", *MEMORY[0x24BDF77B0]);
  objc_msgSend(v11, "scaledValueForValue:", 30.0);
  v13 = v12;
  -[WDHeartRhythmHeaderView bottomMarginToBodyLastBaselineConstraint](self, "bottomMarginToBodyLastBaselineConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v13);

}

- (void)updateBodyTextView
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  -[WDHeartRhythmHeaderView bodyTextAttributedString](self, "bodyTextAttributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmHeaderView bodyURLAttributedString](self, "bodyURLAttributedString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    v6 = objc_alloc(MEMORY[0x24BDD1458]);
    v15 = *MEMORY[0x24BDF65F8];
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithString:attributes:", CFSTR(" "), v8);

    v14[0] = v3;
    v14[1] = v9;
    v14[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinAttributedStringsForLocale();
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v3)
      v12 = v3;
    else
      v12 = (void *)v4;
    v11 = v12;
  }
  -[WDHeartRhythmHeaderView bodyTextView](self, "bodyTextView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttributedText:", v11);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  if (!v8)
    goto LABEL_3;
  -[WDHeartRhythmHeaderView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
LABEL_3:
    -[WDHeartRhythmHeaderView updateConstraintConstants](self, "updateConstraintConstants");

}

- (void)setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)titleText
{
  void *v2;
  void *v3;

  -[WDHeartRhythmHeaderView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setBodyText:(id)a3 URLText:(id)a4 URL:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  NSString *bodyText;
  NSString *v12;
  NSString *bodyURLText;
  NSURL *v14;
  NSURL *bodyURL;

  v8 = a5;
  v9 = a4;
  v10 = (NSString *)objc_msgSend(a3, "copy");
  bodyText = self->_bodyText;
  self->_bodyText = v10;

  v12 = (NSString *)objc_msgSend(v9, "copy");
  bodyURLText = self->_bodyURLText;
  self->_bodyURLText = v12;

  v14 = (NSURL *)objc_msgSend(v8, "copy");
  bodyURL = self->_bodyURL;
  self->_bodyURL = v14;

  -[WDHeartRhythmHeaderView updateBodyTextView](self, "updateBodyTextView");
}

- (NSAttributedString)bodyTextAttributedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  -[WDHeartRhythmHeaderView bodyText](self, "bodyText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (NSAttributedString *)0;
  v11[0] = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = *MEMORY[0x24BDF6600];
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BDD1458]);
  -[WDHeartRhythmHeaderView bodyText](self, "bodyText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v6);

  return (NSAttributedString *)v9;
}

- (NSAttributedString)bodyURLAttributedString
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  -[WDHeartRhythmHeaderView bodyURLText](self, "bodyURLText");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return (NSAttributedString *)0;
  v4 = (void *)v3;
  -[WDHeartRhythmHeaderView bodyURL](self, "bodyURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return (NSAttributedString *)0;
  v14[0] = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v14[1] = *MEMORY[0x24BDF6600];
  objc_msgSend(MEMORY[0x24BDF6950], "hk_appKeyColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  v14[2] = *MEMORY[0x24BDF6618];
  -[WDHeartRhythmHeaderView bodyURL](self, "bodyURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BDD1458]);
  -[WDHeartRhythmHeaderView bodyURLText](self, "bodyURLText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v9);

  return (NSAttributedString *)v12;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v6;
  char v7;

  objc_msgSend(a4, "scheme", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("https"));

  return v7;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UITextView)bodyTextView
{
  return self->_bodyTextView;
}

- (void)setBodyTextView:(id)a3
{
  objc_storeStrong((id *)&self->_bodyTextView, a3);
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void)setBodyText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (NSString)bodyURLText
{
  return self->_bodyURLText;
}

- (void)setBodyURLText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (NSURL)bodyURL
{
  return self->_bodyURL;
}

- (void)setBodyURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (NSLayoutConstraint)titleFirstBaselineToTopMarginConstraint
{
  return self->_titleFirstBaselineToTopMarginConstraint;
}

- (void)setTitleFirstBaselineToTopMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleFirstBaselineToTopMarginConstraint, a3);
}

- (NSLayoutConstraint)bodyFirstBaslineToTitleLastBaslineConstraint
{
  return self->_bodyFirstBaslineToTitleLastBaslineConstraint;
}

- (void)setBodyFirstBaslineToTitleLastBaslineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bodyFirstBaslineToTitleLastBaslineConstraint, a3);
}

- (NSLayoutConstraint)bottomMarginToBodyLastBaselineConstraint
{
  return self->_bottomMarginToBodyLastBaselineConstraint;
}

- (void)setBottomMarginToBodyLastBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomMarginToBodyLastBaselineConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomMarginToBodyLastBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_bodyFirstBaslineToTitleLastBaslineConstraint, 0);
  objc_storeStrong((id *)&self->_titleFirstBaselineToTopMarginConstraint, 0);
  objc_storeStrong((id *)&self->_bodyURL, 0);
  objc_storeStrong((id *)&self->_bodyURLText, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_bodyTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
