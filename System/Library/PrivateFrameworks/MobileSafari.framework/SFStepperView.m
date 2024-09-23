@implementation SFStepperView

- (SFStepperView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFStepperView;
  return -[SFStepperView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (SFStepperView)initWithFrame:(CGRect)a3
{
  return -[SFStepperView initWithFrame:includingResetButton:](self, "initWithFrame:includingResetButton:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SFStepperView)initWithFrame:(CGRect)a3 includingResetButton:(BOOL)a4
{
  _BOOL4 v4;
  SFStepperView *v5;
  UIView *v6;
  UIView *controlsContainer;
  void *v8;
  uint64_t v9;
  _SFDimmingButton **p_decrementButton;
  _SFDimmingButton *decrementButton;
  uint64_t v12;
  _SFDimmingButton *resetButton;
  double v14;
  uint64_t v15;
  _SFDimmingButton *incrementButton;
  uint64_t v17;
  _SFDimmingButton *doneButton;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  id *p_resetButton;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  SFStepperView *v54;
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
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  _BOOL4 v130;
  void *v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  objc_super v136;
  _QWORD v137[4];
  _QWORD v138[23];
  _BYTE v139[128];
  _QWORD v140[2];
  _QWORD v141[5];

  v4 = a4;
  v141[3] = *MEMORY[0x1E0C80C00];
  v136.receiver = self;
  v136.super_class = (Class)SFStepperView;
  v5 = -[SFStepperView initWithFrame:](&v136, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    controlsContainer = v5->_controlsContainer;
    v5->_controlsContainer = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_controlsContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_controlsContainer, "setBackgroundColor:", v8);

    -[UIView setLayoutMargins:](v5->_controlsContainer, "setLayoutMargins:", 12.0, 20.0, 12.0, 20.0);
    -[SFStepperView addSubview:](v5, "addSubview:", v5->_controlsContainer);
    +[_SFDimmingButton buttonWithType:](_SFDimmingButton, "buttonWithType:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    p_decrementButton = &v5->_decrementButton;
    decrementButton = v5->_decrementButton;
    v5->_decrementButton = (_SFDimmingButton *)v9;

    -[UIView addSubview:](v5->_controlsContainer, "addSubview:", v5->_decrementButton);
    if (v4)
    {
      +[_SFDimmingButton buttonWithType:](_SFDimmingButton, "buttonWithType:", 1);
      v12 = objc_claimAutoreleasedReturnValue();
      resetButton = v5->_resetButton;
      v5->_resetButton = (_SFDimmingButton *)v12;

      LODWORD(v14) = 1131413504;
      -[_SFDimmingButton setContentHuggingPriority:forAxis:](v5->_resetButton, "setContentHuggingPriority:forAxis:", 0, v14);
      -[UIView addSubview:](v5->_controlsContainer, "addSubview:", v5->_resetButton);
    }
    +[_SFDimmingButton buttonWithType:](_SFDimmingButton, "buttonWithType:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
    incrementButton = v5->_incrementButton;
    v5->_incrementButton = (_SFDimmingButton *)v15;

    -[UIView addSubview:](v5->_controlsContainer, "addSubview:", v5->_incrementButton);
    +[_SFDimmingButton buttonWithType:](_SFDimmingButton, "buttonWithType:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    doneButton = v5->_doneButton;
    v5->_doneButton = (_SFDimmingButton *)v17;

    -[_SFDimmingButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_doneButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SFDimmingButton setTapTargetSideMargin:](v5->_doneButton, "setTapTargetSideMargin:", &unk_1E22458D8);
    LODWORD(v19) = 1132593152;
    -[_SFDimmingButton setContentHuggingPriority:forAxis:](v5->_doneButton, "setContentHuggingPriority:forAxis:", 0, v19);
    -[UIView addSubview:](v5->_controlsContainer, "addSubview:", v5->_doneButton);
    v20 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v21);

    v129 = v20;
    -[UIView addSubview:](v5->_controlsContainer, "addSubview:", v20);
    objc_msgSend((id)objc_opt_class(), "_buttonsFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = v4;
    v125 = (id *)&v5->_decrementButton;
    if (v4)
    {
      v141[0] = v5->_incrementButton;
      v141[1] = v5->_resetButton;
      v141[2] = *p_decrementButton;
      v23 = (void *)MEMORY[0x1E0C99D20];
      v24 = v141;
      v25 = 3;
    }
    else
    {
      v140[0] = v5->_incrementButton;
      v140[1] = *p_decrementButton;
      v23 = (void *)MEMORY[0x1E0C99D20];
      v24 = v140;
      v25 = 2;
    }
    objc_msgSend(v23, "arrayWithObjects:count:", v24, v25);
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v132, v139, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v133;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v133 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
          objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(v31, "setTapTargetSideMargin:", &unk_1E22458D8);
          objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setTintColor:", v32);

          objc_msgSend(v31, "titleLabel");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setFont:", v22);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v132, v139, 16);
      }
      while (v28);
    }

    -[UIView layoutMarginsGuide](v5->_controlsContainer, "layoutMarginsGuide");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStepperView safeAreaLayoutGuide](v5, "safeAreaLayoutGuide");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(*v125, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leadingAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = v35;
    objc_msgSend(v35, "constraintEqualToAnchor:");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v138[0] = v118;
    -[_SFDimmingButton leadingAnchor](v5->_incrementButton, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 4.0;
    p_resetButton = (id *)&v5->_decrementButton;
    if (v130)
    {
      p_resetButton = (id *)&v5->_resetButton;
      v37 = 2.0;
    }
    objc_msgSend(*p_resetButton, "trailingAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v116, v37);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v36;
    v138[1] = v114;
    objc_msgSend(v129, "leadingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton trailingAnchor](v5->_incrementButton, "trailingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v112, 2.0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v138[2] = v111;
    -[_SFDimmingButton leadingAnchor](v5->_doneButton, "leadingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "trailingAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v109, 2.0);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v138[3] = v108;
    -[_SFDimmingButton trailingAnchor](v5->_doneButton, "trailingAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToAnchor:", v106);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v138[4] = v105;
    objc_msgSend(*v125, "topAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "topAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintGreaterThanOrEqualToAnchor:", v103);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v138[5] = v102;
    objc_msgSend(*v125, "centerYAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton centerYAnchor](v5->_doneButton, "centerYAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:", v100);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v138[6] = v99;
    objc_msgSend(*v125, "bottomAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintLessThanOrEqualToAnchor:", v97);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v138[7] = v96;
    -[_SFDimmingButton topAnchor](v5->_incrementButton, "topAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "topAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintGreaterThanOrEqualToAnchor:", v93);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v138[8] = v92;
    -[_SFDimmingButton centerYAnchor](v5->_incrementButton, "centerYAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton centerYAnchor](v5->_doneButton, "centerYAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v90);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v138[9] = v89;
    -[_SFDimmingButton bottomAnchor](v5->_incrementButton, "bottomAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintLessThanOrEqualToAnchor:", v87);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v138[10] = v86;
    objc_msgSend(v129, "topAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v5->_controlsContainer, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v84);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v138[11] = v83;
    objc_msgSend(v129, "bottomAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v5->_controlsContainer, "bottomAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v81);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v138[12] = v80;
    objc_msgSend(v129, "widthAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToConstant:", _SFOnePixel());
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v138[13] = v78;
    -[_SFDimmingButton topAnchor](v5->_doneButton, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "topAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintGreaterThanOrEqualToAnchor:", v76);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v138[14] = v75;
    -[_SFDimmingButton centerYAnchor](v5->_doneButton, "centerYAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "centerYAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v138[15] = v72;
    -[_SFDimmingButton bottomAnchor](v5->_doneButton, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintLessThanOrEqualToAnchor:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v138[16] = v69;
    -[UIView centerXAnchor](v5->_controlsContainer, "centerXAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStepperView centerXAnchor](v5, "centerXAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v138[17] = v66;
    -[UIView leadingAnchor](v5->_controlsContainer, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintGreaterThanOrEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v138[18] = v63;
    -[UIView trailingAnchor](v5->_controlsContainer, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintLessThanOrEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v138[19] = v60;
    -[UIView bottomAnchor](v5->_controlsContainer, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v138[20] = v57;
    -[SFStepperView bottomAnchor](v5, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v5->_controlsContainer, "bottomAnchor");
    v127 = v34;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v39, 1.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v138[21] = v40;
    -[UIView bottomAnchor](v5->_controlsContainer, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStepperView bottomAnchor](v5, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v44) = 1112014848;
    objc_msgSend(v43, "sf_withPriority:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v138[22] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 23);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "activateConstraints:", v46);

    if (v130)
    {
      v119 = (void *)MEMORY[0x1E0CB3718];
      -[_SFDimmingButton leadingAnchor](v5->_resetButton, "leadingAnchor");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v125, "trailingAnchor");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v126, 2.0);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v137[0] = v124;
      -[_SFDimmingButton topAnchor](v5->_resetButton, "topAnchor");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "topAnchor");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "constraintGreaterThanOrEqualToAnchor:", v121);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v137[1] = v117;
      -[_SFDimmingButton centerYAnchor](v5->_resetButton, "centerYAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFDimmingButton centerYAnchor](v5->_doneButton, "centerYAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v137[2] = v49;
      -[_SFDimmingButton bottomAnchor](v5->_resetButton, "bottomAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "bottomAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintLessThanOrEqualToAnchor:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v137[3] = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 4);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "activateConstraints:", v53);

    }
    v54 = v5;

  }
  return v5;
}

+ (id)_buttonsFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v3, "monospacedDigitSystemFontOfSize:weight:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  double v5;
  MTShadowView *shadowView;
  MTShadowView *v7;
  id v8;
  MTShadowView *v9;
  MTShadowView *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  CGRect v14;

  -[UIView bounds](self->_controlsContainer, "bounds");
  v3 = CGRectGetHeight(v14) * 0.5;
  -[UIView layer](self->_controlsContainer, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

  -[MTShadowView maskCornerRadius](self->_shadowView, "maskCornerRadius");
  if (v5 != v3)
  {
    -[MTShadowView removeFromSuperview](self->_shadowView, "removeFromSuperview");
    shadowView = self->_shadowView;
    self->_shadowView = 0;

  }
  v7 = self->_shadowView;
  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D474A0]);
    v11 = 1065353216;
    v12 = *MEMORY[0x1E0C9D820];
    v13 = 0x4034000000000000;
    v9 = (MTShadowView *)objc_msgSend(v8, "initWithShadowAttributes:maskCornerRadius:continuousCorners:", &v11, 0, v3);
    v10 = self->_shadowView;
    self->_shadowView = v9;

    -[SFStepperView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_shadowView, 0);
    v7 = self->_shadowView;
  }
  -[UIView frame](self->_controlsContainer, "frame");
  -[MTShadowView frameWithContentWithFrame:](v7, "frameWithContentWithFrame:");
  -[MTShadowView setFrame:](self->_shadowView, "setFrame:");
}

- (void)setLongestTitle:(id)a3 forButton:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMapTable *v9;
  NSMapTable *buttonToLongestStringMap;
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
  id v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_buttonToLongestStringMap, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length") && !v8)
  {
    v27 = v6;
    if (!self->_buttonToLongestStringMap)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
      v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      buttonToLongestStringMap = self->_buttonToLongestStringMap;
      self->_buttonToLongestStringMap = v9;

    }
    v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v12);

    objc_msgSend(v8, "setHidden:", 1);
    -[UIView addSubview:](self->_controlsContainer, "addSubview:", v8);
    v21 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v8, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v24;
    objc_msgSend(v8, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v20;
    objc_msgSend(v8, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v15;
    objc_msgSend(v8, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v19);

    -[NSMapTable setObject:forKey:](self->_buttonToLongestStringMap, "setObject:forKey:", v8, v7);
    v6 = v27;
  }
  objc_msgSend(v8, "setText:", v6);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  SFStepperView *v6;
  UIView *controlsContainer;
  id v8;

  y = a3.y;
  x = a3.x;
  v6 = self;
  controlsContainer = self->_controlsContainer;
  v8 = a4;
  -[SFStepperView convertPoint:toView:](v6, "convertPoint:toView:", controlsContainer, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](controlsContainer, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (_SFDimmingButton)incrementButton
{
  return self->_incrementButton;
}

- (_SFDimmingButton)decrementButton
{
  return self->_decrementButton;
}

- (_SFDimmingButton)resetButton
{
  return self->_resetButton;
}

- (_SFDimmingButton)doneButton
{
  return self->_doneButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_resetButton, 0);
  objc_storeStrong((id *)&self->_decrementButton, 0);
  objc_storeStrong((id *)&self->_incrementButton, 0);
  objc_storeStrong((id *)&self->_buttonToLongestStringMap, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_controlsContainer, 0);
}

@end
