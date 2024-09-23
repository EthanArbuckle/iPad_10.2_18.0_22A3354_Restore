@implementation SFAutomaticPasswordExplanationView

- (SFAutomaticPasswordExplanationView)initWithKeyboardType:(int64_t)a3
{
  SFAutomaticPasswordExplanationView *v4;
  void *v5;
  SFAutomaticPasswordExplanationView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFAutomaticPasswordExplanationView;
  v4 = -[SFAutomaticPasswordExplanationView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
  if (v4)
  {
    v4->_isPad = _SFDeviceIsPad();
    v4->_keyboardType = a3;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAutomaticPasswordExplanationView setTintColor:](v4, "setTintColor:", v5);

    -[SFAutomaticPasswordExplanationView _createSubviews](v4, "_createSubviews");
    -[SFAutomaticPasswordExplanationView _createLayoutConstraints](v4, "_createLayoutConstraints");
    v6 = v4;
  }

  return v4;
}

- (void)_createSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIScrollView *v8;
  UIScrollView *scrollView;
  SFAutomaticPasswordScrollViewContentView *v10;
  SFAutomaticPasswordScrollViewContentView *scrollableContentView;
  double v12;
  void *v13;
  UIImageView *v14;
  UIImageView *shadowImageView;
  UILabel *v16;
  UILabel *explanationLabel;
  void *v18;
  void *v19;
  void *v20;
  UILabel *v21;
  UILabel *passwordRetrievalExpalantionLabel;
  _QWORD *v23;
  void *v24;
  void *v25;
  UIButton *v26;
  UIButton *useStrongPasswordButton;
  void *v28;
  void *v29;
  void *v30;
  UIButton *v31;
  UIButton *useOtherPasswordButton;
  void *v33;
  id v34;

  v3 = objc_alloc(MEMORY[0x1E0DC3C28]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  scrollView = self->_scrollView;
  self->_scrollView = v8;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView _setLayoutObserver:](self->_scrollView, "_setLayoutObserver:", self);
  -[SFAutomaticPasswordExplanationView addSubview:](self, "addSubview:", self->_scrollView);
  v10 = -[SFAutomaticPasswordScrollViewContentView initWithFrame:]([SFAutomaticPasswordScrollViewContentView alloc], "initWithFrame:", v4, v5, v6, v7);
  scrollableContentView = self->_scrollableContentView;
  self->_scrollableContentView = v10;

  -[SFAutomaticPasswordScrollViewContentView setLayoutObserver:](self->_scrollableContentView, "setLayoutObserver:", self);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_scrollableContentView);
  -[SFAutomaticPasswordScrollViewContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollableContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v12) = 1144750080;
  -[SFAutomaticPasswordScrollViewContentView setContentHuggingPriority:forAxis:](self->_scrollableContentView, "setContentHuggingPriority:forAxis:", 1, v12);
  objc_msgSend(MEMORY[0x1E0DC3870], "sf_imageNamed:", CFSTR("ASPContentScrollShadow"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 16.0, 0.0, 16.0);
  v34 = (id)objc_claimAutoreleasedReturnValue();

  v14 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v34);
  shadowImageView = self->_shadowImageView;
  self->_shadowImageView = v14;

  -[UIImageView setContentMode:](self->_shadowImageView, "setContentMode:", 0);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_shadowImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SFAutomaticPasswordExplanationView addSubview:](self, "addSubview:", self->_shadowImageView);
  -[UIImageView setHidden:](self->_shadowImageView, "setHidden:", 1);
  v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  explanationLabel = self->_explanationLabel;
  self->_explanationLabel = v16;

  -[UILabel setTextAlignment:](self->_explanationLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_explanationLabel, "setNumberOfLines:", 0);
  _SFAutoFillInputViewLabelFont();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_explanationLabel, "setFont:", v18);

  -[SFAutomaticPasswordScrollViewContentView addSubview:](self->_scrollableContentView, "addSubview:", self->_explanationLabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_explanationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0D8A8B8], "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deviceClass");

  _WBSLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_explanationLabel, "setText:", v20);

  v21 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  passwordRetrievalExpalantionLabel = self->_passwordRetrievalExpalantionLabel;
  self->_passwordRetrievalExpalantionLabel = v21;

  -[UILabel setTextAlignment:](self->_passwordRetrievalExpalantionLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_passwordRetrievalExpalantionLabel, "setNumberOfLines:", 0);
  if (self->_isPad)
    v23 = (_QWORD *)MEMORY[0x1E0DC4AB8];
  else
    v23 = (_QWORD *)MEMORY[0x1E0DC4AA0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_passwordRetrievalExpalantionLabel, "setFont:", v24);

  _WBSLocalizedString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_passwordRetrievalExpalantionLabel, "setText:", v25);

  -[SFAutomaticPasswordScrollViewContentView addSubview:](self->_scrollableContentView, "addSubview:", self->_passwordRetrievalExpalantionLabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_passwordRetrievalExpalantionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v26 = (UIButton *)objc_claimAutoreleasedReturnValue();
  useStrongPasswordButton = self->_useStrongPasswordButton;
  self->_useStrongPasswordButton = v26;

  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setButtonSize:", 3);
  _WBSLocalizedString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTitle:", v29);

  -[UIButton setConfiguration:](self->_useStrongPasswordButton, "setConfiguration:", v28);
  -[UIButton setAccessibilityIdentifier:](self->_useStrongPasswordButton, "setAccessibilityIdentifier:", CFSTR("UseStrongPasswordButton"));
  -[SFAutomaticPasswordExplanationView addSubview:](self, "addSubview:", self->_useStrongPasswordButton);
  -[UIButton sizeToFit](self->_useStrongPasswordButton, "sizeToFit");
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_useStrongPasswordButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _WBSLocalizedString();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v31 = (UIButton *)objc_claimAutoreleasedReturnValue();
  useOtherPasswordButton = self->_useOtherPasswordButton;
  self->_useOtherPasswordButton = v31;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setButtonSize:", 3);
  objc_msgSend(v33, "setTitle:", v30);
  -[UIButton setConfiguration:](self->_useOtherPasswordButton, "setConfiguration:", v33);
  -[SFAutomaticPasswordExplanationView addSubview:](self, "addSubview:", self->_useOtherPasswordButton);
  -[UIButton sizeToFit](self->_useOtherPasswordButton, "sizeToFit");
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_useOtherPasswordButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)_createLayoutConstraints
{
  UILayoutGuide *v3;
  UILayoutGuide *contentLayoutGuide;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *contentLayoutGuideBottomConstraint;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *wideContentLeadingConstraint;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *wideContentTrailingConstraint;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *narrowContentLeadingConstraint;
  void *v30;
  void *v31;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *narrowContentTrailingConstraint;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *iPadWidthConstraint;
  UILayoutGuide *v37;
  UILayoutGuide *scrollableContentCenterLayoutGuide;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *useCustomPasswordButtonWidthConstraint;
  void *v42;
  void *v43;
  NSLayoutConstraint *v44;
  NSLayoutConstraint *useCustomPasswordBaselineToBottomConstraint;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSLayoutConstraint *v58;
  void *v59;
  void *v60;
  NSLayoutConstraint *v61;
  NSLayoutConstraint *strongPasswordButtonWidthConstraint;
  void *v63;
  NSLayoutConstraint *v64;
  NSLayoutConstraint *strongPasswordButtonHeightConstraint;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSLayoutConstraint *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
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
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  NSArray *v119;
  NSArray *wideShadowImageViewConstraints;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  NSArray *v127;
  NSArray *narrowShadowImageViewConstraints;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  double v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  _QWORD v195[4];
  _QWORD v196[3];
  _QWORD v197[2];
  _QWORD v198[2];
  _QWORD v199[2];
  _QWORD v200[5];
  _QWORD v201[4];
  _QWORD v202[6];
  _QWORD v203[6];
  _QWORD v204[4];
  _QWORD v205[5];

  v205[3] = *MEMORY[0x1E0C80C00];
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  contentLayoutGuide = self->_contentLayoutGuide;
  self->_contentLayoutGuide = v3;

  -[SFAutomaticPasswordExplanationView addLayoutGuide:](self, "addLayoutGuide:", self->_contentLayoutGuide);
  -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordExplanationView bottomAnchor](self, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentLayoutGuideBottomConstraint = self->_contentLayoutGuideBottomConstraint;
  self->_contentLayoutGuideBottomConstraint = v7;

  v9 = (void *)MEMORY[0x1E0CB3718];
  -[UILayoutGuide centerXAnchor](self->_contentLayoutGuide, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordExplanationView centerXAnchor](self, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v205[0] = v12;
  -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordExplanationView topAnchor](self, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_contentLayoutGuideBottomConstraint;
  v205[1] = v15;
  v205[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v205, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateConstraints:", v17);

  -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordExplanationView leadingAnchor](self, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:", v19);
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  wideContentLeadingConstraint = self->_wideContentLeadingConstraint;
  self->_wideContentLeadingConstraint = v20;

  -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordExplanationView trailingAnchor](self, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v23);
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  wideContentTrailingConstraint = self->_wideContentTrailingConstraint;
  self->_wideContentTrailingConstraint = v24;

  -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordExplanationView leadingAnchor](self, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 16.0);
  v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  narrowContentLeadingConstraint = self->_narrowContentLeadingConstraint;
  self->_narrowContentLeadingConstraint = v28;

  -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordExplanationView trailingAnchor](self, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -16.0);
  v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  narrowContentTrailingConstraint = self->_narrowContentTrailingConstraint;
  self->_narrowContentTrailingConstraint = v32;

  -[UILayoutGuide widthAnchor](self->_contentLayoutGuide, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", 420.0);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  iPadWidthConstraint = self->_iPadWidthConstraint;
  self->_iPadWidthConstraint = v35;

  v37 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  scrollableContentCenterLayoutGuide = self->_scrollableContentCenterLayoutGuide;
  self->_scrollableContentCenterLayoutGuide = v37;

  -[SFAutomaticPasswordExplanationView addLayoutGuide:](self, "addLayoutGuide:", self->_scrollableContentCenterLayoutGuide);
  -[UIButton widthAnchor](self->_useOtherPasswordButton, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintLessThanOrEqualToConstant:", 343.0);
  v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  useCustomPasswordButtonWidthConstraint = self->_useCustomPasswordButtonWidthConstraint;
  self->_useCustomPasswordButtonWidthConstraint = v40;

  -[UIButton lastBaselineAnchor](self->_useOtherPasswordButton, "lastBaselineAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  useCustomPasswordBaselineToBottomConstraint = self->_useCustomPasswordBaselineToBottomConstraint;
  self->_useCustomPasswordBaselineToBottomConstraint = v44;

  -[UIButton leadingAnchor](self->_useOtherPasswordButton, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v49) = 1144750080;
  objc_msgSend(v48, "setPriority:", v49);
  -[UIButton trailingAnchor](self->_useOtherPasswordButton, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v53) = 1144750080;
  objc_msgSend(v52, "setPriority:", v53);
  v54 = (void *)MEMORY[0x1E0CB3718];
  v191 = v52;
  v192 = v48;
  v204[0] = v48;
  v204[1] = v52;
  -[UIButton centerXAnchor](self->_useOtherPasswordButton, "centerXAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerXAnchor](self->_contentLayoutGuide, "centerXAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = self->_useCustomPasswordBaselineToBottomConstraint;
  v204[2] = v57;
  v204[3] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v204, 4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "activateConstraints:", v59);

  -[UIButton widthAnchor](self->_useStrongPasswordButton, "widthAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintLessThanOrEqualToConstant:", 343.0);
  v61 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  strongPasswordButtonWidthConstraint = self->_strongPasswordButtonWidthConstraint;
  self->_strongPasswordButtonWidthConstraint = v61;

  -[UIButton heightAnchor](self->_useStrongPasswordButton, "heightAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToConstant:", 0.0);
  v64 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  strongPasswordButtonHeightConstraint = self->_strongPasswordButtonHeightConstraint;
  self->_strongPasswordButtonHeightConstraint = v64;

  -[SFAutomaticPasswordExplanationView _updateStrongPasswordHeightConstraint](self, "_updateStrongPasswordHeightConstraint");
  -[UIButton leadingAnchor](self->_useStrongPasswordButton, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v69) = 1144750080;
  objc_msgSend(v68, "setPriority:", v69);
  -[UIButton trailingAnchor](self->_useStrongPasswordButton, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v73) = 1144750080;
  objc_msgSend(v72, "setPriority:", v73);
  v187 = (void *)MEMORY[0x1E0CB3718];
  v189 = v72;
  v190 = v68;
  v203[0] = v68;
  v203[1] = v72;
  -[UIButton centerXAnchor](self->_useStrongPasswordButton, "centerXAnchor");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerXAnchor](self->_contentLayoutGuide, "centerXAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "constraintEqualToAnchor:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v203[2] = v75;
  -[UIButton bottomAnchor](self->_useStrongPasswordButton, "bottomAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton lastBaselineAnchor](self->_useOtherPasswordButton, "lastBaselineAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77, -36.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = self->_strongPasswordButtonHeightConstraint;
  v203[3] = v78;
  v203[4] = v79;
  -[UIButton topAnchor](self->_useOtherPasswordButton, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton bottomAnchor](self->_useStrongPasswordButton, "bottomAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v81, 1.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v203[5] = v82;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v203, 6);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "activateConstraints:", v83);

  -[UIScrollView heightAnchor](self->_scrollView, "heightAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "heightAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v88) = 1132068864;
  objc_msgSend(v87, "setPriority:", v88);
  v155 = (void *)MEMORY[0x1E0CB3718];
  v188 = v87;
  v202[0] = v87;
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "constraintEqualToAnchor:", v168);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v202[1] = v165;
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "constraintEqualToAnchor:", v159);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v202[2] = v157;
  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "constraintEqualToAnchor:", v173);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v202[3] = v153;
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton topAnchor](self->_useStrongPasswordButton, "topAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:constant:", v90, -9.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v202[4] = v91;
  -[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "widthAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView widthAnchor](self->_scrollView, "widthAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v202[5] = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v202, 6);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "activateConstraints:", v96);

  v163 = (void *)MEMORY[0x1E0CB3718];
  -[SFAutomaticPasswordScrollViewContentView topAnchor](self->_scrollableContentView, "topAnchor");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "constraintEqualToAnchor:", v179);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v201[0] = v174;
  -[SFAutomaticPasswordScrollViewContentView leadingAnchor](self->_scrollableContentView, "leadingAnchor");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "constraintEqualToAnchor:", v166);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v201[1] = v160;
  -[SFAutomaticPasswordScrollViewContentView trailingAnchor](self->_scrollableContentView, "trailingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v201[2] = v99;
  -[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "heightAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordScrollViewContentView heightAnchor](self->_scrollableContentView, "heightAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v201[3] = v103;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v201, 4);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "activateConstraints:", v104);

  v161 = (void *)MEMORY[0x1E0CB3718];
  -[UILayoutGuide topAnchor](self->_scrollableContentCenterLayoutGuide, "topAnchor");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordScrollViewContentView topAnchor](self->_scrollableContentView, "topAnchor");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "constraintGreaterThanOrEqualToAnchor:constant:", v180, 10.0);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v200[0] = v175;
  -[UILayoutGuide centerYAnchor](self->_scrollableContentCenterLayoutGuide, "centerYAnchor");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordScrollViewContentView centerYAnchor](self->_scrollableContentView, "centerYAnchor");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "constraintEqualToAnchor:", v167);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v200[1] = v164;
  -[UILayoutGuide leadingAnchor](self->_scrollableContentCenterLayoutGuide, "leadingAnchor");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordScrollViewContentView leadingAnchor](self->_scrollableContentView, "leadingAnchor");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "constraintEqualToAnchor:", v156);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v200[2] = v105;
  -[UILayoutGuide trailingAnchor](self->_scrollableContentCenterLayoutGuide, "trailingAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordScrollViewContentView trailingAnchor](self->_scrollableContentView, "trailingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v200[3] = v108;
  -[UILayoutGuide bottomAnchor](self->_scrollableContentCenterLayoutGuide, "bottomAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordScrollViewContentView bottomAnchor](self->_scrollableContentView, "bottomAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintLessThanOrEqualToAnchor:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v200[4] = v111;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v200, 5);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "activateConstraints:", v112);

  -[UIImageView leadingAnchor](self->_shadowImageView, "leadingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v199[0] = v115;
  -[UIImageView trailingAnchor](self->_shadowImageView, "trailingAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintEqualToAnchor:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v199[1] = v118;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v199, 2);
  v119 = (NSArray *)objc_claimAutoreleasedReturnValue();
  wideShadowImageViewConstraints = self->_wideShadowImageViewConstraints;
  self->_wideShadowImageViewConstraints = v119;

  -[UIImageView leadingAnchor](self->_shadowImageView, "leadingAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordExplanationView leadingAnchor](self, "leadingAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:", v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v198[0] = v123;
  -[UIImageView trailingAnchor](self->_shadowImageView, "trailingAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutomaticPasswordExplanationView trailingAnchor](self, "trailingAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "constraintEqualToAnchor:", v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v198[1] = v126;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v198, 2);
  v127 = (NSArray *)objc_claimAutoreleasedReturnValue();
  narrowShadowImageViewConstraints = self->_narrowShadowImageViewConstraints;
  self->_narrowShadowImageViewConstraints = v127;

  v129 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView bottomAnchor](self->_shadowImageView, "bottomAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "constraintEqualToAnchor:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v197[0] = v132;
  -[UIImageView heightAnchor](self->_shadowImageView, "heightAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "constraintEqualToConstant:", 1.0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v197[1] = v134;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v197, 2);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "activateConstraints:", v135);

  if (self->_isPad)
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_wideShadowImageViewConstraints);
  v171 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel leadingAnchor](self->_passwordRetrievalExpalantionLabel, "leadingAnchor");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_scrollableContentCenterLayoutGuide, "leadingAnchor");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "constraintEqualToAnchor:", v181);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v196[0] = v176;
  -[UILabel trailingAnchor](self->_passwordRetrievalExpalantionLabel, "trailingAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_scrollableContentCenterLayoutGuide, "trailingAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:", v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v196[1] = v138;
  -[UILabel bottomAnchor](self->_passwordRetrievalExpalantionLabel, "bottomAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_scrollableContentCenterLayoutGuide, "bottomAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "constraintEqualToAnchor:", v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v196[2] = v141;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 3);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "activateConstraints:", v142);

  if (self->_isPad)
    v143 = 12.0;
  else
    v143 = 8.0;
  v172 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel bottomAnchor](self->_explanationLabel, "bottomAnchor");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel topAnchor](self->_passwordRetrievalExpalantionLabel, "topAnchor");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "constraintEqualToAnchor:constant:", v186, -v143);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v195[0] = v182;
  -[UILabel leadingAnchor](self->_explanationLabel, "leadingAnchor");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_scrollableContentCenterLayoutGuide, "leadingAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "constraintEqualToAnchor:", v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v195[1] = v145;
  -[UILabel trailingAnchor](self->_explanationLabel, "trailingAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_scrollableContentCenterLayoutGuide, "trailingAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "constraintEqualToAnchor:", v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v195[2] = v148;
  -[UILabel topAnchor](self->_explanationLabel, "topAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_scrollableContentCenterLayoutGuide, "topAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintGreaterThanOrEqualToAnchor:", v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v195[3] = v151;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v195, 4);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "activateConstraints:", v152);

}

- (void)_updateWideAppearanceRequirement
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  CGFloat v8;
  _BOOL4 v9;
  CGRect v10;
  CGRect v11;

  -[SFAutomaticPasswordExplanationView bounds](self, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v7 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  v8 = CGRectGetHeight(v11);
  v9 = v7 > v8 + v8;
  if (self->_requiresWideAppearance != v9)
  {
    self->_requiresWideAppearance = v9;
    -[SFAutomaticPasswordExplanationView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)_updateStrongPasswordHeightConstraint
{
  uint64_t *v2;

  if (self->_requiresWideAppearance && !self->_isPad)
    v2 = &_SFAutoFillInputViewDefaultButonHeightLandscapePhone;
  else
    v2 = &_SFAutoFillInputViewDefaultButonHeight;
  -[NSLayoutConstraint setConstant:](self->_strongPasswordButtonHeightConstraint, "setConstant:", *(double *)v2);
}

- (void)_updateUseCustomPasswordBaselineToBottomConstraint
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[SFAutomaticPasswordExplanationView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;

  v6 = -14.0;
  if (!self->_requiresWideAppearance)
    v6 = 0.0;
  if (v5 <= 0.0)
    v6 = -4.0;
  -[NSLayoutConstraint setConstant:](self->_useCustomPasswordBaselineToBottomConstraint, "setConstant:", v6);
}

- (void)_updateMaximumPadding
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  -[SFAutomaticPasswordExplanationView window](self, "window");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v22 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[SFAutomaticPasswordExplanationView bounds](self, "bounds");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  v14 = CGRectGetWidth(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v15 = fmax(v14, CGRectGetHeight(v25));
  v26.origin.x = v22;
  v26.origin.y = v5;
  v26.size.width = v7;
  v26.size.height = v9;
  v16 = CGRectGetWidth(v26);
  v27.origin.x = v22;
  v27.origin.y = v5;
  v27.size.width = v7;
  v27.size.height = v9;
  v17 = CGRectGetHeight(v27);
  if (v15 == 568.0)
  {
    v18 = 80.0;
  }
  else if (fmax(v16, v17) <= v15)
  {
    v18 = 140.0;
  }
  else
  {
    _SFRoundFloatToPixels();
    v20 = 140.0 - v19;
    objc_msgSend(v23, "safeAreaInsets");
    v18 = fmax(v20 + v21, 0.0);
  }
  if (self->_wideContentMaximumPadding != v18)
  {
    self->_wideContentMaximumPadding = v18;
    -[SFAutomaticPasswordExplanationView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAutomaticPasswordExplanationView;
  -[SFAutomaticPasswordExplanationView layoutSubviews](&v3, sel_layoutSubviews);
  -[SFAutomaticPasswordExplanationView _updateWideAppearanceRequirement](self, "_updateWideAppearanceRequirement");
  -[SFAutomaticPasswordExplanationView _updateMaximumPadding](self, "_updateMaximumPadding");
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0DC5000];
  v4 = *(double *)(MEMORY[0x1E0DC5000] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAutomaticPasswordExplanationView;
  -[SFAutomaticPasswordExplanationView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[SFAutomaticPasswordExplanationView _updateMaximumPadding](self, "_updateMaximumPadding");
  -[SFAutomaticPasswordExplanationView _updateContentLayoutGuideBottomConstraint](self, "_updateContentLayoutGuideBottomConstraint");
  -[SFAutomaticPasswordExplanationView _updateUseCustomPasswordBaselineToBottomConstraint](self, "_updateUseCustomPasswordBaselineToBottomConstraint");
}

- (void)_updateContentLayoutGuideBottomConstraint
{
  double v3;
  double v4;
  id v5;

  if (self->_isPad)
  {
    -[NSLayoutConstraint setConstant:](self->_contentLayoutGuideBottomConstraint, "setConstant:", -20.0);
  }
  else
  {
    -[SFAutomaticPasswordExplanationView window](self, "window");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeAreaInsets");
    v3 = -20.0;
    if (v4 > 0.0)
      v3 = 0.0;
    -[NSLayoutConstraint setConstant:](self->_contentLayoutGuideBottomConstraint, "setConstant:", v3);

  }
}

- (void)updateConstraints
{
  void *v3;
  NSLayoutConstraint *useCustomPasswordButtonWidthConstraint;
  void *v5;
  void *v6;
  NSLayoutConstraint *narrowContentTrailingConstraint;
  void *v8;
  void *v9;
  NSLayoutConstraint *wideContentTrailingConstraint;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSLayoutConstraint *v21;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  -[SFAutomaticPasswordExplanationView _updateContentLayoutGuideBottomConstraint](self, "_updateContentLayoutGuideBottomConstraint");
  -[SFAutomaticPasswordExplanationView _updateStrongPasswordHeightConstraint](self, "_updateStrongPasswordHeightConstraint");
  -[SFAutomaticPasswordExplanationView _updateUseCustomPasswordBaselineToBottomConstraint](self, "_updateUseCustomPasswordBaselineToBottomConstraint");
  v3 = (void *)MEMORY[0x1E0CB3718];
  useCustomPasswordButtonWidthConstraint = self->_useCustomPasswordButtonWidthConstraint;
  v33[0] = self->_strongPasswordButtonWidthConstraint;
  v33[1] = useCustomPasswordButtonWidthConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sf_setConstraints:active:", v5, self->_requiresWideAppearance);

  if (self->_isPad)
  {
    -[NSLayoutConstraint setActive:](self->_iPadWidthConstraint, "setActive:", self->_requiresWideAppearance);
    v6 = (void *)MEMORY[0x1E0CB3718];
    narrowContentTrailingConstraint = self->_narrowContentTrailingConstraint;
    v28[0] = self->_narrowContentLeadingConstraint;
    v28[1] = narrowContentTrailingConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sf_setConstraints:active:", v8, !self->_requiresWideAppearance);

    v9 = (void *)MEMORY[0x1E0CB3718];
    wideContentTrailingConstraint = self->_wideContentTrailingConstraint;
    v27[0] = self->_wideContentLeadingConstraint;
    v27[1] = wideContentTrailingConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v11);

  }
  else
  {
    if (self->_requiresWideAppearance)
    {
      -[NSLayoutConstraint setConstant:](self->_wideContentLeadingConstraint, "setConstant:", self->_wideContentMaximumPadding);
      -[NSLayoutConstraint setConstant:](self->_wideContentTrailingConstraint, "setConstant:", -self->_wideContentMaximumPadding);
      v12 = (void *)MEMORY[0x1E0CB3718];
      v13 = self->_wideContentTrailingConstraint;
      v32[0] = self->_wideContentLeadingConstraint;
      v32[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activateConstraints:", v14);

      v15 = (void *)MEMORY[0x1E0CB3718];
      v16 = self->_narrowContentTrailingConstraint;
      v31[0] = self->_narrowContentLeadingConstraint;
      v31[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deactivateConstraints:", v17);

      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_narrowShadowImageViewConstraints);
      v18 = (void *)MEMORY[0x1E0CB3718];
      v19 = 488;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB3718];
      v21 = self->_narrowContentTrailingConstraint;
      v30[0] = self->_narrowContentLeadingConstraint;
      v30[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v22);

      v23 = (void *)MEMORY[0x1E0CB3718];
      v24 = self->_wideContentTrailingConstraint;
      v29[0] = self->_wideContentLeadingConstraint;
      v29[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "deactivateConstraints:", v25);

      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_wideShadowImageViewConstraints);
      v18 = (void *)MEMORY[0x1E0CB3718];
      v19 = 496;
    }
    objc_msgSend(v18, "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa + v19));
  }
  v26.receiver = self;
  v26.super_class = (Class)SFAutomaticPasswordExplanationView;
  -[SFAutomaticPasswordExplanationView updateConstraints](&v26, sel_updateConstraints);
}

- (BOOL)_scrollViewNeedsShadow:(BOOL)a3
{
  double MaxY;
  double v5;
  BOOL result;
  CGRect v7;

  if (!a3)
    return self->_scrollViewNeedsShadowCachedValue;
  -[UILabel frame](self->_passwordRetrievalExpalantionLabel, "frame");
  MaxY = CGRectGetMaxY(v7);
  -[UIScrollView frame](self->_scrollView, "frame");
  result = MaxY > v5;
  self->_scrollViewNeedsShadowCachedValue = MaxY > v5;
  return result;
}

- (void)_updateShadowViewAlpha
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = -[SFAutomaticPasswordExplanationView _scrollViewNeedsShadow:](self, "_scrollViewNeedsShadow:", 0);
  v4 = 0.0;
  if (v3)
  {
    -[UIScrollView frame](self->_scrollView, "frame", 0.0);
    v6 = v5;
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    v8 = v7;
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    v4 = fmin(fmax((v8 - (v6 + v9)) / 12.0, 0.0), 1.0);
  }
  -[UIImageView setAlpha:](self->_shadowImageView, "setAlpha:", v4);
}

- (void)_scrollViewDidLayoutSubviews:(id)a3
{
  -[UIImageView setHidden:](self->_shadowImageView, "setHidden:", -[SFAutomaticPasswordExplanationView _scrollViewNeedsShadow:](self, "_scrollViewNeedsShadow:", 1) ^ 1);
  -[SFAutomaticPasswordExplanationView _updateShadowViewAlpha](self, "_updateShadowViewAlpha");
}

- (void)automaticPasswordScrollContentViewDidLayout:(id)a3
{
  -[UIImageView setHidden:](self->_shadowImageView, "setHidden:", -[SFAutomaticPasswordExplanationView _scrollViewNeedsShadow:](self, "_scrollViewNeedsShadow:", 1) ^ 1);
  -[SFAutomaticPasswordExplanationView _updateShadowViewAlpha](self, "_updateShadowViewAlpha");
}

- (UILabel)explanationLabel
{
  return self->_explanationLabel;
}

- (UILabel)passwordRetrievalExpalantionLabel
{
  return self->_passwordRetrievalExpalantionLabel;
}

- (UIButton)useStrongPasswordButton
{
  return self->_useStrongPasswordButton;
}

- (UIButton)useOtherPasswordButton
{
  return self->_useOtherPasswordButton;
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useOtherPasswordButton, 0);
  objc_storeStrong((id *)&self->_useStrongPasswordButton, 0);
  objc_storeStrong((id *)&self->_passwordRetrievalExpalantionLabel, 0);
  objc_storeStrong((id *)&self->_explanationLabel, 0);
  objc_storeStrong((id *)&self->_iPadWidthConstraint, 0);
  objc_storeStrong((id *)&self->_narrowContentTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_narrowContentLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_wideContentTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_wideContentLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_scrollableContentCenterLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuideBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_narrowShadowImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_wideShadowImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_useCustomPasswordBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_useCustomPasswordButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_strongPasswordButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_strongPasswordButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_scrollableContentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
