@implementation AIAudiogramIndividualFrequencyEarCell

- (AIAudiogramIndividualFrequencyEarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AIAudiogramIndividualFrequencyEarCell *v5;
  AIAudiogramIndividualFrequencyEarCell *v6;
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
  double v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
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
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
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
  double v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
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
  id v104;
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
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
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
  void *v143;
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
  uint64_t v154;
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
  id v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  _QWORD v184[4];
  id v185;
  id location;
  objc_super v187;
  _QWORD v188[6];
  _QWORD v189[2];
  _QWORD v190[5];
  _QWORD v191[2];
  uint64_t v192;
  void *v193;
  _QWORD v194[4];
  _QWORD v195[6];

  v195[4] = *MEMORY[0x24BDAC8D0];
  v187.receiver = self;
  v187.super_class = (Class)AIAudiogramIndividualFrequencyEarCell;
  v175 = a4;
  v5 = -[AIAudiogramIndividualFrequencyEarCell initWithStyle:reuseIdentifier:](&v187, sel_initWithStyle_reuseIdentifier_, a3);
  v6 = v5;
  if (v5)
  {
    v154 = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AIAudiogramIndividualFrequencyEarCell semanticContentAttribute](v5, "semanticContentAttribute"));
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell setSymbolSelectorButton:](v6, "setSymbolSelectorButton:", v7);

    objc_msgSend(MEMORY[0x24BEBD438], "borderedButtonConfiguration");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray6Color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "setBaseBackgroundColor:", v8);

    objc_msgSend(v179, "setCornerStyle:", 4);
    -[AIAudiogramIndividualFrequencyEarCell symbolSelectorButton](v6, "symbolSelectorButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConfiguration:", v179);

    -[AIAudiogramIndividualFrequencyEarCell symbolSelectorButton](v6, "symbolSelectorButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShowsMenuAsPrimaryAction:", 1);

    objc_initWeak(&location, v6);
    -[AIAudiogramIndividualFrequencyEarCell symbolSelectorButton](v6, "symbolSelectorButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v184[0] = MEMORY[0x24BDAC760];
    v184[1] = 3221225472;
    v184[2] = __71__AIAudiogramIndividualFrequencyEarCell_initWithStyle_reuseIdentifier___block_invoke;
    v184[3] = &unk_24FD6D7F8;
    objc_copyWeak(&v185, &location);
    objc_msgSend(v11, "setAccessibilityLabelBlock:", v184);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", 0);
    -[AIAudiogramIndividualFrequencyEarCell setSymbolImageView:](v6, "setSymbolImageView:", v12);

    -[AIAudiogramIndividualFrequencyEarCell symbolImageView](v6, "symbolImageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentMode:", 1);

    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", 9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:", *MEMORY[0x24BEBE1E0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configurationByApplyingConfiguration:", v15);
    v156 = (void *)objc_claimAutoreleasedReturnValue();

    -[AIAudiogramIndividualFrequencyEarCell symbolImageView](v6, "symbolImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPreferredSymbolConfiguration:", v156);

    -[AIAudiogramIndividualFrequencyEarCell symbolImageView](v6, "symbolImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 1144750080;
    objc_msgSend(v17, "setContentHuggingPriority:forAxis:", 0, v18);

    v19 = objc_alloc_init(MEMORY[0x24BEBD708]);
    -[AIAudiogramIndividualFrequencyEarCell setSymbolLabel:](v6, "setSymbolLabel:", v19);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell symbolLabel](v6, "symbolLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextColor:", v20);

    v22 = *MEMORY[0x24BEBE220];
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell symbolLabel](v6, "symbolLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v23);

    -[AIAudiogramIndividualFrequencyEarCell symbolLabel](v6, "symbolLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNumberOfLines:", 0);

    v26 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("chevron.up.chevron.down"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = (void *)objc_msgSend(v26, "initWithImage:", v27);

    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:", v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setPreferredSymbolConfiguration:", v28);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setTintColor:", v29);

    v30 = objc_alloc(MEMORY[0x24BEBD978]);
    -[AIAudiogramIndividualFrequencyEarCell symbolImageView](v6, "symbolImageView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v195[0] = v31;
    -[AIAudiogramIndividualFrequencyEarCell symbolLabel](v6, "symbolLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v195[1] = v32;
    v33 = (void *)objc_opt_new();
    v195[2] = v33;
    v195[3] = v178;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v195, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v30, "initWithArrangedSubviews:", v34);
    -[AIAudiogramIndividualFrequencyEarCell setButtonStackView:](v6, "setButtonStackView:", v35);

    -[AIAudiogramIndividualFrequencyEarCell buttonStackView](v6, "buttonStackView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAxis:", 0);

    -[AIAudiogramIndividualFrequencyEarCell buttonStackView](v6, "buttonStackView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setDistribution:", 0);

    -[AIAudiogramIndividualFrequencyEarCell buttonStackView](v6, "buttonStackView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAlignment:", 3);

    -[AIAudiogramIndividualFrequencyEarCell buttonStackView](v6, "buttonStackView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setSpacing:", 5.0);

    -[AIAudiogramIndividualFrequencyEarCell buttonStackView](v6, "buttonStackView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell symbolLabel](v6, "symbolLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setCustomSpacing:afterView:", v41, 10.0);

    -[AIAudiogramIndividualFrequencyEarCell buttonStackView](v6, "buttonStackView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AIAudiogramIndividualFrequencyEarCell symbolSelectorButton](v6, "symbolSelectorButton");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell buttonStackView](v6, "buttonStackView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSubview:", v44);

    v152 = (void *)MEMORY[0x24BDD1628];
    -[AIAudiogramIndividualFrequencyEarCell buttonStackView](v6, "buttonStackView");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "leadingAnchor");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell symbolSelectorButton](v6, "symbolSelectorButton");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "leadingAnchor");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "constraintEqualToAnchor:constant:", v173, 12.0);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v194[0] = v171;
    -[AIAudiogramIndividualFrequencyEarCell buttonStackView](v6, "buttonStackView");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "trailingAnchor");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell symbolSelectorButton](v6, "symbolSelectorButton");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "trailingAnchor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "constraintEqualToAnchor:constant:", v163, -12.0);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v194[1] = v161;
    -[AIAudiogramIndividualFrequencyEarCell buttonStackView](v6, "buttonStackView");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "topAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell symbolSelectorButton](v6, "symbolSelectorButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "constraintEqualToAnchor:constant:", v46, 8.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v194[2] = v47;
    -[AIAudiogramIndividualFrequencyEarCell buttonStackView](v6, "buttonStackView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell symbolSelectorButton](v6, "symbolSelectorButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v51, -8.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v194[3] = v52;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v194, 4);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "activateConstraints:", v53);

    v54 = (void *)objc_opt_new();
    -[AIAudiogramIndividualFrequencyEarCell setValueUnitLabel:](v6, "setValueUnitLabel:", v54);

    if (v154 == 1)
      v55 = 0;
    else
      v55 = 2;
    -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](v6, "valueUnitLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setTextAlignment:", v55);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](v6, "valueUnitLabel");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setTextColor:", v57);

    aiLocString(CFSTR("AudiogramIngestionDecibelAbbreviation"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](v6, "valueUnitLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setText:", v59);

    v61 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](v6, "valueUnitLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setFont:", v62);

    -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](v6, "valueUnitLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v65) = 1144750080;
    objc_msgSend(v64, "setContentHuggingPriority:forAxis:", 0, v65);

    -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](v6, "valueUnitLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v6, sel_didTapUnitLabel);
    objc_msgSend(v66, "addGestureRecognizer:", v67);

    -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](v6, "valueUnitLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setUserInteractionEnabled:", 1);

    -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](v6, "valueUnitLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setIsAccessibilityElement:", 0);

    v70 = (void *)objc_opt_new();
    -[AIAudiogramIndividualFrequencyEarCell setValueTextField:](v6, "setValueTextField:", v70);

    -[AIAudiogramIndividualFrequencyEarCell valueTextField](v6, "valueTextField");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setTextAlignment:", v55);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell valueTextField](v6, "valueTextField");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setTextColor:", v72);

    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v61);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell valueTextField](v6, "valueTextField");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setFont:", v74);

    -[AIAudiogramIndividualFrequencyEarCell valueTextField](v6, "valueTextField");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setKeyboardType:", 4);

    -[AIAudiogramIndividualFrequencyEarCell valueTextField](v6, "valueTextField");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setReturnKeyType:", 9);

    v78 = objc_alloc(MEMORY[0x24BDD1458]);
    aiLocString(CFSTR("AudiogramIngestionResultsNoData"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = *MEMORY[0x24BEBD278];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray3Color");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = v80;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v193, &v192, 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = (void *)objc_msgSend(v78, "initWithString:attributes:", v79, v81);
    -[AIAudiogramIndividualFrequencyEarCell valueTextField](v6, "valueTextField");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setAttributedPlaceholder:", v82);

    -[AIAudiogramIndividualFrequencyEarCell valueTextField](v6, "valueTextField");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v85) = 1144750080;
    objc_msgSend(v84, "setContentCompressionResistancePriority:forAxis:", 0, v85);

    -[AIAudiogramIndividualFrequencyEarCell valueTextField](v6, "valueTextField");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "addTarget:action:forControlEvents:", v6, sel__textFieldEditingChanged_, 0x20000);

    -[AIAudiogramIndividualFrequencyEarCell valueTextField](v6, "valueTextField");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setDelegate:", v6);

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v88) = 1144750080;
    objc_msgSend(v181, "setContentHuggingPriority:forAxis:", 0, v88);
    LODWORD(v89) = 1144750080;
    objc_msgSend(v181, "setContentHuggingPriority:forAxis:", 1, v89);
    objc_msgSend(v181, "addTarget:action:forControlEvents:", v6, sel__plusButtonTapped_, 64);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("plus.circle.fill"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "setImage:forState:", v90, 0);

    aiLocString(CFSTR("AudiogramIngestionButtonPlus"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "setAccessibilityLabel:", v91);

    -[AIAudiogramIndividualFrequencyEarCell setPlusButton:](v6, "setPlusButton:", v181);
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v92) = 1144750080;
    objc_msgSend(v183, "setContentHuggingPriority:forAxis:", 0, v92);
    LODWORD(v93) = 1144750080;
    objc_msgSend(v183, "setContentHuggingPriority:forAxis:", 1, v93);
    objc_msgSend(v183, "addTarget:action:forControlEvents:", v6, sel__minusButtonTapped_, 64);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("minus.circle.fill"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "setImage:forState:", v94, 0);

    aiLocString(CFSTR("AudiogramIngestionButtonMinus"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "setAccessibilityLabel:", v95);

    -[AIAudiogramIndividualFrequencyEarCell setMinusButton:](v6, "setMinusButton:", v183);
    objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = (void *)MEMORY[0x24BEBD660];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v191[0] = v97;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray6Color");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v191[1] = v98;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v191, 2);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "configurationWithPaletteColors:", v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE240], 3);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "configurationByApplyingConfiguration:", v101);
    v174 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v177, "setPreferredSymbolConfigurationForImage:", v174);
    -[AIAudiogramIndividualFrequencyEarCell plusButton](v6, "plusButton");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setConfiguration:", v177);

    -[AIAudiogramIndividualFrequencyEarCell minusButton](v6, "minusButton");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setConfiguration:", v177);

    v104 = objc_alloc(MEMORY[0x24BEBD978]);
    v105 = (void *)objc_opt_new();
    v190[0] = v105;
    -[AIAudiogramIndividualFrequencyEarCell valueTextField](v6, "valueTextField");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v190[1] = v106;
    -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](v6, "valueUnitLabel");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v190[2] = v107;
    v190[3] = v183;
    v190[4] = v181;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v190, 5);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (void *)objc_msgSend(v104, "initWithArrangedSubviews:", v108);
    -[AIAudiogramIndividualFrequencyEarCell setLabelStepperStackView:](v6, "setLabelStepperStackView:", v109);

    -[AIAudiogramIndividualFrequencyEarCell labelStepperStackView](v6, "labelStepperStackView");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setAxis:", 0);

    -[AIAudiogramIndividualFrequencyEarCell labelStepperStackView](v6, "labelStepperStackView");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setSpacing:", 0.0);

    -[AIAudiogramIndividualFrequencyEarCell labelStepperStackView](v6, "labelStepperStackView");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell valueTextField](v6, "valueTextField");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setCustomSpacing:afterView:", v113, 4.0);

    -[AIAudiogramIndividualFrequencyEarCell labelStepperStackView](v6, "labelStepperStackView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](v6, "valueUnitLabel");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setCustomSpacing:afterView:", v115, 12.0);

    -[AIAudiogramIndividualFrequencyEarCell labelStepperStackView](v6, "labelStepperStackView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setCustomSpacing:afterView:", v183, -2.0);

    v117 = objc_alloc(MEMORY[0x24BEBD978]);
    -[AIAudiogramIndividualFrequencyEarCell symbolSelectorButton](v6, "symbolSelectorButton");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v189[0] = v118;
    -[AIAudiogramIndividualFrequencyEarCell labelStepperStackView](v6, "labelStepperStackView");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v189[1] = v119;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v189, 2);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = (void *)objc_msgSend(v117, "initWithArrangedSubviews:", v120);
    -[AIAudiogramIndividualFrequencyEarCell setContainerStackView:](v6, "setContainerStackView:", v121);

    -[AIAudiogramIndividualFrequencyEarCell containerStackView](v6, "containerStackView");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "setSpacing:", 16.0);

    -[AIAudiogramIndividualFrequencyEarCell containerStackView](v6, "containerStackView");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setAxis:", 0);

    -[AIAudiogramIndividualFrequencyEarCell containerStackView](v6, "containerStackView");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setAlignment:", 3);

    -[AIAudiogramIndividualFrequencyEarCell containerStackView](v6, "containerStackView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AIAudiogramIndividualFrequencyEarCell contentView](v6, "contentView");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell containerStackView](v6, "containerStackView");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "addSubview:", v127);

    -[AIAudiogramIndividualFrequencyEarCell containerStackView](v6, "containerStackView");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "topAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell contentView](v6, "contentView");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "topAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintEqualToAnchor:constant:", v131, 4.0);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell setTopConstraint:](v6, "setTopConstraint:", v132);

    v143 = (void *)MEMORY[0x24BDD1628];
    -[AIAudiogramIndividualFrequencyEarCell containerStackView](v6, "containerStackView");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "leadingAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell contentView](v6, "contentView");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "leadingAnchor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "constraintEqualToAnchor:constant:", v166, 12.0);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v188[0] = v164;
    -[AIAudiogramIndividualFrequencyEarCell containerStackView](v6, "containerStackView");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "trailingAnchor");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell contentView](v6, "contentView");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "trailingAnchor");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "constraintEqualToAnchor:constant:", v155, -10.0);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v188[1] = v153;
    -[AIAudiogramIndividualFrequencyEarCell topConstraint](v6, "topConstraint");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v188[2] = v151;
    -[AIAudiogramIndividualFrequencyEarCell containerStackView](v6, "containerStackView");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "bottomAnchor");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell contentView](v6, "contentView");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "bottomAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "constraintEqualToAnchor:constant:", v147, -4.0);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v188[3] = v146;
    -[AIAudiogramIndividualFrequencyEarCell plusButton](v6, "plusButton");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "widthAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell plusButton](v6, "plusButton");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "heightAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "constraintEqualToAnchor:", v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v188[4] = v135;
    -[AIAudiogramIndividualFrequencyEarCell minusButton](v6, "minusButton");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "widthAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell minusButton](v6, "minusButton");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "heightAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "constraintEqualToAnchor:", v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v188[5] = v140;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v188, 6);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "activateConstraints:", v141);

    -[AIAudiogramIndividualFrequencyEarCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
    objc_destroyWeak(&v185);
    objc_destroyWeak(&location);

  }
  return v6;
}

id __71__AIAudiogramIndividualFrequencyEarCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "symbolLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_plusButtonTapped:(id)a3
{
  id v4;

  -[AIAudiogramIndividualFrequencyEarCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plusButtonTapped:", -[AIAudiogramIndividualFrequencyEarCell ear](self, "ear"));

}

- (void)_minusButtonTapped:(id)a3
{
  id v4;

  -[AIAudiogramIndividualFrequencyEarCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusButtonTapped:", -[AIAudiogramIndividualFrequencyEarCell ear](self, "ear"));

}

- (void)setHearingLevel:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL8 v6;
  NSNumber *v7;
  NSNumber *hearingLevel;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (!v4 || (v5 = -[AIAudiogramIndividualFrequencyEarCell noneSelected](self, "noneSelected"), v4 = v11, v5))
  {
    v6 = v4 == 0;
    -[AIAudiogramIndividualFrequencyEarCell setNoneSelected:](self, "setNoneSelected:", v6);
    -[AIAudiogramIndividualFrequencyEarCell _configureForNoneSelected:](self, "_configureForNoneSelected:", v6);
    v4 = v11;
  }
  validateHearingLevel(v4);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hearingLevel = self->_hearingLevel;
  self->_hearingLevel = v7;

  -[NSNumber stringValue](self->_hearingLevel, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyEarCell valueTextField](self, "valueTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

}

- (void)updateLeftEarSymbol
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  filledImageForSymbolType(11);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  labelForSymbolType(11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:", *MEMORY[0x24BEBE1E0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationByApplyingConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AIAudiogramIndividualFrequencyEarCell symbolImageView](self, "symbolImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredSymbolConfiguration:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyEarCell symbolImageView](self, "symbolImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v8);

  -[AIAudiogramIndividualFrequencyEarCell buttonStackView](self, "buttonStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AIAudiogramIndividualFrequencyEarCell noneSelected](self, "noneSelected"))
    v11 = 0.0;
  else
    v11 = 5.0;
  -[AIAudiogramIndividualFrequencyEarCell symbolImageView](self, "symbolImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCustomSpacing:afterView:", v12, v11);

  if (!-[AIAudiogramIndividualFrequencyEarCell noneSelected](self, "noneSelected"))
  {
    -[AIAudiogramIndividualFrequencyEarCell symbolImageView](self, "symbolImageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:", v16);

    -[AIAudiogramIndividualFrequencyEarCell symbolLabel](self, "symbolLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    aiLocString(v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v15);

    -[AIAudiogramIndividualFrequencyEarCell setCurrentlySelectedSymbolForLeftEar:](self, "setCurrentlySelectedSymbolForLeftEar:", 11);
  }

}

- (void)updateRightEarSymbol
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  filledImageForSymbolType(4);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  labelForSymbolType(4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:", *MEMORY[0x24BEBE1E0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationByApplyingConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AIAudiogramIndividualFrequencyEarCell symbolImageView](self, "symbolImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredSymbolConfiguration:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyEarCell symbolImageView](self, "symbolImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v8);

  -[AIAudiogramIndividualFrequencyEarCell buttonStackView](self, "buttonStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AIAudiogramIndividualFrequencyEarCell noneSelected](self, "noneSelected"))
    v11 = 0.0;
  else
    v11 = 5.0;
  -[AIAudiogramIndividualFrequencyEarCell symbolImageView](self, "symbolImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCustomSpacing:afterView:", v12, v11);

  if (!-[AIAudiogramIndividualFrequencyEarCell noneSelected](self, "noneSelected"))
  {
    -[AIAudiogramIndividualFrequencyEarCell symbolImageView](self, "symbolImageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:", v16);

    -[AIAudiogramIndividualFrequencyEarCell symbolLabel](self, "symbolLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    aiLocString(v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v15);

    -[AIAudiogramIndividualFrequencyEarCell setCurrentlySelectedSymbolForRightEar:](self, "setCurrentlySelectedSymbolForRightEar:", 4);
  }

}

- (void)updateSymbols:(id)a3 ear:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  AIAudiogramIndividualFrequencyEarCell *v21;
  uint64_t *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    if (objc_msgSend(v6, "containsObject:", &unk_24FD77560))
    {
      labelForSymbolType(11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

      objc_msgSend(v8, "addObject:", &unk_24FD77560);
      -[AIAudiogramIndividualFrequencyEarCell updateLeftEarSymbol](self, "updateLeftEarSymbol");
    }
  }
  else if (objc_msgSend(v6, "containsObject:", &unk_24FD77578))
  {
    labelForSymbolType(4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

    objc_msgSend(v8, "addObject:", &unk_24FD77578);
    -[AIAudiogramIndividualFrequencyEarCell updateRightEarSymbol](self, "updateRightEarSymbol");
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __59__AIAudiogramIndividualFrequencyEarCell_updateSymbols_ear___block_invoke;
  v19[3] = &unk_24FD6D848;
  v12 = v8;
  v20 = v12;
  v21 = self;
  v22 = &v24;
  v23 = a4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v19);
  v13 = (void *)MEMORY[0x24BEBD388];
  aiLocString(CFSTR("AudiogramIngestionSymbolNone"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __59__AIAudiogramIndividualFrequencyEarCell_updateSymbols_ear___block_invoke_3;
  v18[3] = &unk_24FD6D870;
  v18[4] = self;
  objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v14, 0, 0, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v25[5], "addObject:", v15);
  objc_msgSend(v15, "setState:", -[AIAudiogramIndividualFrequencyEarCell noneSelected](self, "noneSelected"));
  objc_msgSend(MEMORY[0x24BEBD748], "menuWithChildren:", v25[5]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyEarCell symbolSelectorButton](self, "symbolSelectorButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMenu:", v16);

  _Block_object_dispose(&v24, 8);
}

void __59__AIAudiogramIndividualFrequencyEarCell_updateSymbols_ear___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  _BOOL8 v16;
  void *v17;
  uint64_t v18;
  int8x16_t v19;
  _QWORD v20[4];
  int8x16_t v21;
  uint64_t v22;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  unfilledImageForSymbolType(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithTintColor:renderingMode:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD388];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __59__AIAudiogramIndividualFrequencyEarCell_updateSymbols_ear___block_invoke_2;
  v20[3] = &unk_24FD6D820;
  v19 = *(int8x16_t *)(a1 + 32);
  v13 = (id)v19.i64[0];
  v21 = vextq_s8(v19, v19, 8uLL);
  v22 = a3;
  objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v6, v11, 0, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(*(id *)(a1 + 40), "noneSelected");
  v16 = 0;
  if ((v15 & 1) == 0)
  {
    v17 = *(void **)(a1 + 40);
    if (*(_QWORD *)(a1 + 56) == 1)
      v18 = objc_msgSend(v17, "currentlySelectedSymbolForLeftEar", 0);
    else
      v18 = objc_msgSend(v17, "currentlySelectedSymbolForRightEar", 0);
    v16 = v18 == v8;
  }
  objc_msgSend(v14, "setState:", v16, *(_OWORD *)&v19);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v14);

}

void __59__AIAudiogramIndividualFrequencyEarCell_updateSymbols_ear___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_didSelectSymbol:", v2);

}

uint64_t __59__AIAudiogramIndividualFrequencyEarCell_updateSymbols_ear___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didSelectNoSymbol");
}

- (void)_didSelectSymbol:(id)a3
{
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[AIAudiogramIndividualFrequencyEarCell noneSelected](self, "noneSelected");
  -[AIAudiogramIndividualFrequencyEarCell setNoneSelected:](self, "setNoneSelected:", 0);
  if (-[AIAudiogramIndividualFrequencyEarCell ear](self, "ear") != 1)
  {
    if (-[AIAudiogramIndividualFrequencyEarCell ear](self, "ear") == 2
      && objc_msgSend(v9, "isEqualToNumber:", &unk_24FD77578))
    {
      -[AIAudiogramIndividualFrequencyEarCell updateRightEarSymbol](self, "updateRightEarSymbol");
      if (!v4)
        goto LABEL_14;
      goto LABEL_8;
    }
LABEL_9:
    if (!v4)
      goto LABEL_14;
    goto LABEL_10;
  }
  if (!objc_msgSend(v9, "isEqualToNumber:", &unk_24FD77560))
    goto LABEL_9;
  -[AIAudiogramIndividualFrequencyEarCell updateLeftEarSymbol](self, "updateLeftEarSymbol");
  if (!v4)
    goto LABEL_14;
LABEL_8:
  -[AIAudiogramIndividualFrequencyEarCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "symbolSelectionForFrequencyHasChanged:noneSelected:", -[AIAudiogramIndividualFrequencyEarCell ear](self, "ear"), 0);

LABEL_10:
  -[AIAudiogramIndividualFrequencyEarCell _configureForNoneSelected:](self, "_configureForNoneSelected:", 0);
  -[AIAudiogramIndividualFrequencyEarCell hearingLevel](self, "hearingLevel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = &unk_24FD77590;
  -[AIAudiogramIndividualFrequencyEarCell setHearingLevel:](self, "setHearingLevel:", v8);

LABEL_14:
}

- (void)_didSelectNoSymbol
{
  id v3;

  -[AIAudiogramIndividualFrequencyEarCell setNoneSelected:](self, "setNoneSelected:", 1);
  -[AIAudiogramIndividualFrequencyEarCell _configureForNoneSelected:](self, "_configureForNoneSelected:", 1);
  -[AIAudiogramIndividualFrequencyEarCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolSelectionForFrequencyHasChanged:noneSelected:", -[AIAudiogramIndividualFrequencyEarCell ear](self, "ear"), 1);

}

- (void)_configureForNoneSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray3Color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyEarCell valueTextField](self, "valueTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = !v3;
  objc_msgSend(v6, "setEnabled:", !v3);

  -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](self, "valueUnitLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInteractionEnabled:", !v3);

  -[AIAudiogramIndividualFrequencyEarCell plusButton](self, "plusButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", !v3);

  -[AIAudiogramIndividualFrequencyEarCell minusButton](self, "minusButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", !v3);

  if (v3)
    v11 = v5;
  else
    v11 = v18;
  -[AIAudiogramIndividualFrequencyEarCell valueTextField](self, "valueTextField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v11);

  -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](self, "valueUnitLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v11);

  if (!v7)
  {
    -[AIAudiogramIndividualFrequencyEarCell symbolImageView](self, "symbolImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", 0);

    -[AIAudiogramIndividualFrequencyEarCell symbolLabel](self, "symbolLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    aiLocString(CFSTR("AudiogramIngestionSymbolNone"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v16);

    -[AIAudiogramIndividualFrequencyEarCell valueTextField](self, "valueTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", 0);

  }
}

- (void)didTapUnitLabel
{
  -[AIAudiogramIndividualFrequencyEarCell showActive:](self, "showActive:", 1);
}

- (void)showActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint8_t buf[4];
  _BOOL4 v7;
  __int16 v8;
  AIAudiogramIndividualFrequencyEarCell *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  AXLogAudiogram();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v7 = v3;
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_22FB4F000, v5, OS_LOG_TYPE_INFO, "Ear cell will activate? %d %@", buf, 0x12u);
  }

  AXPerformBlockOnMainThread();
}

void __52__AIAudiogramIndividualFrequencyEarCell_showActive___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  _DWORD v16[2];
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  AXLogAudiogram();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "valueTextField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFirstResponder");
    v5 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "valueTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canBecomeFirstResponder");
    objc_msgSend(*(id *)(a1 + 32), "valueTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canResignFirstResponder");
    v10 = *(_QWORD *)(a1 + 32);
    v16[0] = 67110146;
    v16[1] = v4;
    v17 = 1024;
    v18 = v5;
    v19 = 1024;
    v20 = v7;
    v21 = 1024;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_22FB4F000, v2, OS_LOG_TYPE_INFO, "Ear cell is activating %d->%d %d? %d? %@", (uint8_t *)v16, 0x24u);

  }
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "valueTextField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isFirstResponder");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "valueTextField");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "becomeFirstResponder");
      goto LABEL_9;
    }
    if (*(_BYTE *)(a1 + 40))
      return;
  }
  objc_msgSend(*(id *)(a1 + 32), "valueTextField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isFirstResponder");

  if (!v14)
    return;
  objc_msgSend(*(id *)(a1 + 32), "valueTextField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resignFirstResponder");
LABEL_9:

}

- (void)setKeyboardToolbar:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AIAudiogramIndividualFrequencyEarCell valueTextField](self, "valueTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputAccessoryView:", v4);

}

- (void)_textFieldEditingChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *hearingLevel;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "numberFromString:", v6);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hearingLevel = self->_hearingLevel;
  self->_hearingLevel = v7;

  -[AIAudiogramIndividualFrequencyEarCell delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyEarCell hearingLevel](self, "hearingLevel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "earCellDidUpdateHearingLevel:forEar:", v9, -[AIAudiogramIndividualFrequencyEarCell ear](self, "ear"));

}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = v6;
  AXPerformBlockOnMainThreadAfterDelay();
  -[AIAudiogramIndividualFrequencyEarCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earCellDidBeginEditingForEar:", -[AIAudiogramIndividualFrequencyEarCell ear](self, "ear"));

}

void __66__AIAudiogramIndividualFrequencyEarCell_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "endOfDocument");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textRangeFromPosition:toPosition:", v3, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSelectedTextRange:", v2);

}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;

  -[AIAudiogramIndividualFrequencyEarCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earCellDidEndEditingForEar:", -[AIAudiogramIndividualFrequencyEarCell ear](self, "ear"));

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("-"));
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invertedSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", &stru_24FD6E4F8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(CFSTR("-"), "stringByAppendingString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "numberFromString:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  validateHearingLevel(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v11, "isEqualToString:", v21);
  if ((v22 & 1) == 0)
  {
    if (v20)
      -[AIAudiogramIndividualFrequencyEarCell setHearingLevel:](self, "setHearingLevel:", v20);
    -[AIAudiogramIndividualFrequencyEarCell delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "earCellDidUpdateHearingLevel:forEar:", v20, -[AIAudiogramIndividualFrequencyEarCell ear](self, "ear"));

  }
  return v22;
}

- (void)configureLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  float Width;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  CGFloat v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[2];
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v50[1] = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramIndividualFrequencyEarCell symbolLabel](self, "symbolLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyEarCell frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v49 = *MEMORY[0x24BEBD270];
  v9 = v49;
  -[AIAudiogramIndividualFrequencyEarCell symbolLabel](self, "symbolLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 32, v12, 0, v6, v8);
  Width = CGRectGetWidth(v51);

  -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](self, "valueUnitLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyEarCell frame](self, "frame");
  v16 = v15;
  v18 = v17;
  v47 = v9;
  -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](self, "valueUnitLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "font");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", 32, v21, 0, v16, v18);
  v22 = CGRectGetWidth(v52);
  -[AIAudiogramIndividualFrequencyEarCell valueTextField](self, "valueTextField");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "text");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyEarCell frame](self, "frame");
  v26 = v25;
  v28 = v27;
  v45 = v9;
  -[AIAudiogramIndividualFrequencyEarCell valueTextField](self, "valueTextField");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "font");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "boundingRectWithSize:options:attributes:context:", 32, v31, 0, v26, v28);
  *(float *)&v22 = v22 + CGRectGetWidth(v53);

  -[AIAudiogramIndividualFrequencyEarCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  v34 = v33 * 0.4;

  -[AIAudiogramIndividualFrequencyEarCell containerStackView](self, "containerStackView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v34 >= (float)(Width + *(float *)&v22))
  {
    objc_msgSend(v35, "setAxis:", 0);

    -[AIAudiogramIndividualFrequencyEarCell containerStackView](self, "containerStackView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAlignment:", 3);

    -[AIAudiogramIndividualFrequencyEarCell containerStackView](self, "containerStackView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setSpacing:", 16.0);

    -[AIAudiogramIndividualFrequencyEarCell topConstraint](self, "topConstraint");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    v41 = 4.0;
  }
  else
  {
    objc_msgSend(v35, "setAxis:", 1);

    -[AIAudiogramIndividualFrequencyEarCell containerStackView](self, "containerStackView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAlignment:", 0);

    -[AIAudiogramIndividualFrequencyEarCell containerStackView](self, "containerStackView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setSpacing:", 8.0);

    -[AIAudiogramIndividualFrequencyEarCell topConstraint](self, "topConstraint");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    v41 = 8.0;
  }
  objc_msgSend(v39, "setConstant:", v41);

}

- (BOOL)isAccessibilityElement
{
  return AXRequestingClient() == 3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  objc_super v6;

  if (AXRequestingClient() == 3)
  {
    -[AIAudiogramIndividualFrequencyEarCell symbolLabel](self, "symbolLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AIAudiogramIndividualFrequencyEarCell;
    -[AIAudiogramIndividualFrequencyEarCell accessibilityLabel](&v6, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityValue
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  if (-[AIAudiogramIndividualFrequencyEarCell noneSelected](self, "noneSelected"))
  {
    v10.receiver = self;
    v10.super_class = (Class)AIAudiogramIndividualFrequencyEarCell;
    -[AIAudiogramIndividualFrequencyEarCell accessibilityValue](&v10, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[AIAudiogramIndividualFrequencyEarCell valueTextField](self, "valueTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyEarCell valueUnitLabel](self, "valueUnitLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", CFSTR("%@ %@"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
}

- (id)accessibilityHint
{
  __CFString *v3;
  void *v4;
  objc_super v6;

  if (-[AIAudiogramIndividualFrequencyEarCell ear](self, "ear") == 1)
  {
    v3 = CFSTR("AudiogramIngestionSymbolChangeHintLeft");
  }
  else
  {
    if (-[AIAudiogramIndividualFrequencyEarCell ear](self, "ear") != 2)
    {
      v6.receiver = self;
      v6.super_class = (Class)AIAudiogramIndividualFrequencyEarCell;
      -[AIAudiogramIndividualFrequencyEarCell accessibilityHint](&v6, sel_accessibilityHint);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    v3 = CFSTR("AudiogramIngestionSymbolChangeHintRight");
  }
  aiLocString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  _BOOL4 v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BEBDF00];
  v3 = -[AIAudiogramIndividualFrequencyEarCell noneSelected](self, "noneSelected");
  v4 = *MEMORY[0x24BEBDEF0];
  if (v3)
    v4 = 0;
  return v4 | v2;
}

- (void)accessibilityIncrement
{
  -[AIAudiogramIndividualFrequencyEarCell _plusButtonTapped:](self, "_plusButtonTapped:", 0);
}

- (void)accessibilityDecrement
{
  -[AIAudiogramIndividualFrequencyEarCell _minusButtonTapped:](self, "_minusButtonTapped:", 0);
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[AIAudiogramIndividualFrequencyEarCell symbolSelectorButton](self, "symbolSelectorButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (AIAudiogramIndividualFrequencyEarCellDelegate)delegate
{
  return (AIAudiogramIndividualFrequencyEarCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)ear
{
  return self->_ear;
}

- (void)setEar:(int64_t)a3
{
  self->_ear = a3;
}

- (NSNumber)hearingLevel
{
  return self->_hearingLevel;
}

- (BOOL)noneSelected
{
  return self->_noneSelected;
}

- (void)setNoneSelected:(BOOL)a3
{
  self->_noneSelected = a3;
}

- (NSArray)symbols
{
  return self->_symbols;
}

- (void)setSymbols:(id)a3
{
  objc_storeStrong((id *)&self->_symbols, a3);
}

- (UILabel)valueUnitLabel
{
  return self->_valueUnitLabel;
}

- (void)setValueUnitLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueUnitLabel, a3);
}

- (UITextField)valueTextField
{
  return self->_valueTextField;
}

- (void)setValueTextField:(id)a3
{
  objc_storeStrong((id *)&self->_valueTextField, a3);
}

- (UIStackView)labelStepperStackView
{
  return self->_labelStepperStackView;
}

- (void)setLabelStepperStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStepperStackView, a3);
}

- (UIStackView)containerStackView
{
  return self->_containerStackView;
}

- (void)setContainerStackView:(id)a3
{
  objc_storeStrong((id *)&self->_containerStackView, a3);
}

- (UIButton)symbolSelectorButton
{
  return self->_symbolSelectorButton;
}

- (void)setSymbolSelectorButton:(id)a3
{
  objc_storeStrong((id *)&self->_symbolSelectorButton, a3);
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackView, a3);
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (void)setSymbolImageView:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImageView, a3);
}

- (UILabel)symbolLabel
{
  return self->_symbolLabel;
}

- (void)setSymbolLabel:(id)a3
{
  objc_storeStrong((id *)&self->_symbolLabel, a3);
}

- (UIButton)plusButton
{
  return self->_plusButton;
}

- (void)setPlusButton:(id)a3
{
  objc_storeStrong((id *)&self->_plusButton, a3);
}

- (UIButton)minusButton
{
  return self->_minusButton;
}

- (void)setMinusButton:(id)a3
{
  objc_storeStrong((id *)&self->_minusButton, a3);
}

- (int64_t)currentlySelectedSymbolForLeftEar
{
  return self->_currentlySelectedSymbolForLeftEar;
}

- (void)setCurrentlySelectedSymbolForLeftEar:(int64_t)a3
{
  self->_currentlySelectedSymbolForLeftEar = a3;
}

- (int64_t)currentlySelectedSymbolForRightEar
{
  return self->_currentlySelectedSymbolForRightEar;
}

- (void)setCurrentlySelectedSymbolForRightEar:(int64_t)a3
{
  self->_currentlySelectedSymbolForRightEar = a3;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_minusButton, 0);
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_storeStrong((id *)&self->_symbolLabel, 0);
  objc_storeStrong((id *)&self->_symbolImageView, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_symbolSelectorButton, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_storeStrong((id *)&self->_labelStepperStackView, 0);
  objc_storeStrong((id *)&self->_valueTextField, 0);
  objc_storeStrong((id *)&self->_valueUnitLabel, 0);
  objc_storeStrong((id *)&self->_symbols, 0);
  objc_storeStrong((id *)&self->_hearingLevel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
