@implementation AXStyleProviderUIAlert

- (AXStyleProviderUIAlert)initWithType:(unint64_t)a3 text:(id)a4 subtitleText:(id)a5 iconImage:(id)a6 styleProvider:(id)a7 userInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  AXStyleProviderUIAlert *v18;
  AXStyleProviderUIAlert *v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  _BOOL8 v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  uint64_t v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
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
  NSString *v124;
  NSComparisonResult v125;
  void *v126;
  double v127;
  double v128;
  id v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  void *v137;
  double v138;
  double v139;
  void *v140;
  double v141;
  double v142;
  double v143;
  double v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  void *v164;
  NSString *v165;
  NSComparisonResult v166;
  double v167;
  void *v168;
  NSString *v169;
  NSComparisonResult v170;
  void *v171;
  NSString *v172;
  NSComparisonResult v173;
  double v174;
  double v175;
  double v176;
  double v177;
  _BOOL4 v178;
  _BOOL4 v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  _BOOL4 v194;
  id v195;
  void *v196;
  void *v197;
  id v198;
  int v199;
  void *v200;
  id v201;
  id v202;
  void *v203;
  id v204;
  id v205;
  objc_super v206;

  v14 = a4;
  v205 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v206.receiver = self;
  v206.super_class = (Class)AXStyleProviderUIAlert;
  v18 = -[AXStyleProviderUIAlert init](&v206, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_130;
  -[AXUIAlert setUserInfo:](v18, "setUserInfo:", v17);
  v20 = objc_msgSend(v16, "alertBackgroundStyleForType:", a3);
  v203 = v16;
  v195 = v17;
  switch(v20)
  {
    case 0:
      objc_msgSend(v16, "alertBackgroundImageForType:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "alertBackgroundImageCapInsetsForType:", a3);
      if (v25 != *(double *)(MEMORY[0x24BDF7718] + 8)
        || v22 != *MEMORY[0x24BDF7718]
        || v24 != *(double *)(MEMORY[0x24BDF7718] + 24)
        || v23 != *(double *)(MEMORY[0x24BDF7718] + 16))
      {
        objc_msgSend(v21, "resizableImageWithCapInsets:");
        v29 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v29;
      }
      v204 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v21);
      goto LABEL_24;
    case 1:
      v30 = objc_alloc(MEMORY[0x24BDF7018]);
      v31 = 2020;
      goto LABEL_17;
    case 2:
      v30 = objc_alloc(MEMORY[0x24BDF7018]);
      v31 = 2030;
LABEL_17:
      v204 = (id)objc_msgSend(v30, "initWithPrivateStyle:", v31);
      break;
    case 3:
      v32 = objc_alloc_init(MEMORY[0x24BDF6F90]);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithPrivateStyle:", 2010);
      objc_msgSend(v21, "_setContinuousCornerRadius:", 10.0);
      objc_msgSend(v32, "addSubview:", v21);
      objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v33 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("backdropView"), v21, 0);
      v34 = v20;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[backdropView]-|"), 0, 0, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addConstraints:", v36);

      v20 = v34;
      v37 = (void *)MEMORY[0x24BDD1628];
      v16 = v203;
      _NSDictionaryOfVariableBindings(CFSTR("backdropView"), v21, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[backdropView]-|"), 0, 0, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = v32;
      objc_msgSend(v32, "addConstraints:", v39);

      goto LABEL_24;
    case 4:
      v40 = objc_alloc(MEMORY[0x24BDF6FC8]);
      objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 1200);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = (id)objc_msgSend(v40, "initWithEffect:", v41);

      break;
    case 5:
      v204 = objc_alloc_init(MEMORY[0x24BDF6F90]);
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithPrivateStyle:", 2010);
      -[AXStyleProviderUIAlert traitCollection](v19, "traitCollection");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "userInterfaceStyle");

      v199 = v20;
      if (v44 == 2)
      {
        v45 = objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithPrivateStyle:", 2030);

        v42 = (void *)v45;
      }
      objc_msgSend(v42, "_setContinuousCornerRadius:", 30.0);
      objc_msgSend(v42, "layer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setShadowRadius:", 10.0);

      objc_msgSend(v42, "layer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v48) = 1050253722;
      objc_msgSend(v47, "setShadowOpacity:", v48);

      objc_msgSend(v42, "layer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setShadowOffset:", 0.0, 10.0);

      objc_msgSend(v42, "layer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v50, "setShadowColor:", objc_msgSend(v51, "CGColor"));

      objc_msgSend(v204, "addSubview:", v42);
      objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v52 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("backdropView"), v42, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[backdropView]-|"), 0, 0, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "addConstraints:", v54);

      v55 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("backdropView"), v42, 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[backdropView]-|"), 0, 0, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "addConstraints:", v57);

      v20 = v199;
      break;
    case 6:
      v201 = v15;
      v204 = objc_alloc_init(MEMORY[0x24BDF6F90]);
      v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithPrivateStyle:", 2030);
      -[AXStyleProviderUIAlert traitCollection](v19, "traitCollection");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "userInterfaceStyle");

      if (v67 == 2)
      {
        v68 = objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithPrivateStyle:", 2030);

        v65 = (void *)v68;
      }
      objc_msgSend(v65, "_setContinuousCornerRadius:", 20.0);
      objc_msgSend(v65, "layer");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setShadowRadius:", 10.0);

      objc_msgSend(v65, "layer");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v71) = 1050253722;
      objc_msgSend(v70, "setShadowOpacity:", v71);

      objc_msgSend(v65, "layer");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setShadowOffset:", 0.0, 10.0);

      objc_msgSend(v65, "layer");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v74 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v73, "setShadowColor:", objc_msgSend(v74, "CGColor"));

      objc_msgSend(v204, "addSubview:", v65);
      objc_msgSend(v65, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v75 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("backdropView"), v65, 0);
      v76 = v20;
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[backdropView]-|"), 0, 0, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "addConstraints:", v78);

      v20 = v76;
      v79 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("backdropView"), v65, 0);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[backdropView]-|"), 0, 0, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "addConstraints:", v81);

      v15 = v201;
      break;
    case 7:
      v58 = objc_alloc_init(MEMORY[0x24BDF6F90]);
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setBackgroundColor:", v59);

      objc_msgSend(v58, "_setContinuousCornerRadius:", 30.0);
      objc_msgSend(v58, "layer");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setShadowRadius:", 25.0);

      objc_msgSend(v58, "layer");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v62) = 1036831949;
      objc_msgSend(v61, "setShadowOpacity:", v62);

      objc_msgSend(v58, "layer");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setShadowOffset:", 0.0, 15.0);

      v204 = v58;
      objc_msgSend(v58, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "setShadowColor:", objc_msgSend(v64, "CGColor"));

LABEL_24:
      break;
    default:
      v204 = 0;
      break;
  }
  v198 = v14;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v16, "alertBackgroundCornerRadiusForType:", a3);
    v83 = v82;
    if (fabs(v82) >= 2.22044605e-16)
    {
      -[AXStyleProviderUIAlert layer](v19, "layer");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setCornerRadius:", v83);

      -[AXStyleProviderUIAlert setClipsToBounds:](v19, "setClipsToBounds:", 1);
    }
  }
  objc_msgSend(v204, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AXStyleProviderUIAlert addSubview:](v19, "addSubview:", v204);
  -[AXStyleProviderUIAlert layer](v19, "layer");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setAllowsGroupOpacity:", v20 == 0);

  v86 = (void *)objc_opt_new();
  objc_msgSend(v86, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AXStyleProviderUIAlert addSubview:](v19, "addSubview:", v86);
  v87 = v15 == 0;
  v88 = v15;
  v89 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", &stru_24D49D6A8, 0);
  v197 = (void *)v89;
  if (a3 == 7)
  {
    objc_msgSend(v16, "alertTextColorForType:", 7);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alertTextFontForType:", 7);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alertTextLineHeightOffsetForType:", 7);
    -[AXStyleProviderUIAlert _appendParagraphWithText:withImage:withTextColor:font:textAlignment:lineSpacing:paragraphSpacingBefore:toAttributedString:](v19, "_appendParagraphWithText:withImage:withTextColor:font:textAlignment:lineSpacing:paragraphSpacingBefore:toAttributedString:", v198, v15, v90, v91, 1, v89);

    v202 = 0;
  }
  else
  {
    v202 = v15;
    objc_msgSend(v16, "alertTextColorForType:", a3);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alertTextFontForType:", a3);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alertTextLineHeightOffsetForType:", a3);
    -[AXStyleProviderUIAlert _appendParagraphWithText:withTextColor:font:textAlignment:lineSpacing:paragraphSpacingBefore:toAttributedString:](v19, "_appendParagraphWithText:withTextColor:font:textAlignment:lineSpacing:paragraphSpacingBefore:toAttributedString:", v198, v88, v90, v87, v89);
  }

  if (v205)
  {
    if (a3 <= 7 && ((1 << a3) & 0xC8) != 0)
    {
      v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", &stru_24D49D6A8, 0);
      objc_msgSend(v203, "alertSubtitleTextColorForType:", a3);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "alertSubtitleTextFontForType:", a3);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "alertSubtitleTextLineHeightOffsetForType:", a3);
      v96 = v95;
      objc_msgSend(v203, "alertSubtitleTextVerticalSpacingHeightWithTextForType:", a3);
      -[AXStyleProviderUIAlert _appendParagraphWithText:withTextColor:font:textAlignment:lineSpacing:paragraphSpacingBefore:toAttributedString:](v19, "_appendParagraphWithText:withTextColor:font:textAlignment:lineSpacing:paragraphSpacingBefore:toAttributedString:", v205, v93, v94, v87, v92, v96, v97);

      v98 = (void *)objc_opt_new();
      objc_msgSend(v98, "setNumberOfLines:", 2);
      objc_msgSend(v98, "setAttributedText:", v92);
      objc_msgSend(v98, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v98, "setLineBreakMode:", 4);
      v200 = v98;
      objc_msgSend(v86, "addSubview:", v98);
      v99 = v89;
    }
    else
    {
      objc_msgSend(v203, "alertSubtitleTextColorForType:", a3);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "alertSubtitleTextFontForType:", a3);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "alertSubtitleTextLineHeightOffsetForType:", a3);
      v102 = v101;
      objc_msgSend(v203, "alertSubtitleTextVerticalSpacingHeightWithTextForType:", a3);
      v99 = v89;
      -[AXStyleProviderUIAlert _appendParagraphWithText:withTextColor:font:textAlignment:lineSpacing:paragraphSpacingBefore:toAttributedString:](v19, "_appendParagraphWithText:withTextColor:font:textAlignment:lineSpacing:paragraphSpacingBefore:toAttributedString:", v205, v92, v100, v15 == 0, v89, v102, v103);

      v200 = 0;
    }

  }
  else
  {
    v200 = 0;
    v99 = v89;
  }
  v104 = (void *)objc_opt_new();
  objc_msgSend(v104, "setNumberOfLines:", 0);
  objc_msgSend(v104, "setAttributedText:", v99);
  objc_msgSend(v104, "setLineBreakMode:", 0);
  objc_msgSend(v104, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (a3 == 3)
  {
    objc_msgSend(v104, "setNumberOfLines:", 1);
    v105 = objc_alloc(MEMORY[0x24BDF6FC8]);
    v106 = (void *)MEMORY[0x24BDF6F88];
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 5);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "effectForBlurEffect:", v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (id)objc_msgSend(v105, "initWithEffect:", v108);

    v194 = 0;
LABEL_46:
    objc_msgSend(v109, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v86, "addSubview:", v109);
    objc_msgSend(v109, "contentView");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "addSubview:", v104);

    objc_msgSend(v109, "contentView");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("label"), v104, 0);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[label]|"), 0, 0, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "addConstraints:", v114);

    objc_msgSend(v109, "contentView");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("label"), v104, 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[label]|"), 0, 0, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "addConstraints:", v118);

    goto LABEL_48;
  }
  v194 = a3 == 6;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v109 = objc_alloc_init(MEMORY[0x24BDF6FC8]);
    goto LABEL_46;
  }
  objc_msgSend(v86, "addSubview:", v104);
  v109 = 0;
LABEL_48:
  v15 = v202;
  v16 = v203;
  if (v202)
  {
    v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v202);
    objc_msgSend(v119, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (a3 <= 7 && ((1 << a3) & 0xC8) != 0)
    {
      objc_msgSend(v119, "layer");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "setCornerRadius:", 4.0);

      objc_msgSend(v119, "layer");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setMasksToBounds:", 1);

    }
    objc_msgSend(v86, "addSubview:", v119);
  }
  else
  {
    v119 = 0;
  }
  v196 = v109;
  if (a3 <= 7 && ((1 << a3) & 0xC8) != 0)
  {
    if (v119)
    {
      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v109, 5, 0, v119, 6, 1.0, 10.0);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "addConstraint:", v122);

      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "preferredContentSizeCategory");
      v124 = (NSString *)objc_claimAutoreleasedReturnValue();
      v125 = UIContentSizeCategoryCompareToCategory(v124, (UIContentSizeCategory)*MEMORY[0x24BDF7650]);

      if (v125 == NSOrderedDescending)
      {
        objc_msgSend(v104, "setNumberOfLines:", 0);
        v126 = (void *)MEMORY[0x24BDD1628];
        v127 = 1.0;
        v128 = 10.0;
        v129 = v109;
        v130 = 3;
        v131 = v86;
        v132 = 3;
      }
      else
      {
        v126 = (void *)MEMORY[0x24BDD1628];
        v127 = 1.0;
        v128 = 0.0;
        v129 = v109;
        v130 = 10;
        v131 = v119;
        v132 = 10;
      }
      objc_msgSend(v126, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v129, v130, 0, v131, v132, v127, v128);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v202;
      v16 = v203;
    }
    else
    {
      if (v194)
        v133 = 24.0;
      else
        v133 = 5.0;
      if (v194)
        v134 = 8.0;
      else
        v134 = 13.0;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v109, 5, 0, v86, 5, 1.0, v133);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "addConstraint:", v135);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v109, 6, 0, v86, 6, 1.0, -v133);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "addConstraint:", v136);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v109, 3, 0, v86, 3, 1.0, v134);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v86, "addConstraint:", v137);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v109, 6, 0, v86, 6, 1.0, 5.0);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "addConstraint:", v140);

    if (v200)
    {
      if (v194)
        v141 = 0.0;
      else
        v141 = 5.0;
      if (v194)
        v142 = 8.0;
      else
        v142 = 10.0;
      if (v194)
        v143 = 24.0;
      else
        v143 = 15.0;
      if (v194)
        v144 = 24.0;
      else
        v144 = 12.0;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v200, 3, 0, v109, 4, 1.0, v141);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "addConstraint:", v145);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v200, 4, 0, v86, 4, 1.0, -v142);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "addConstraint:", v146);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v200, 5, 0, v86, 5, 1.0, v143);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "addConstraint:", v147);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v200, 6, 0, v86, 6, 1.0, -v144);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "addConstraint:", v148);

    }
  }
  else
  {
    objc_msgSend(v104, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfView:", 3, v86);
    if (!v119)
      objc_msgSend(v104, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 1, v86);
    objc_msgSend(v104, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 2, v86);
    objc_msgSend(v104, "ax_constrainLayoutAttribute:asLessThanOrEqualToValueOfView:", 4, v86);
    LODWORD(v138) = 1144750080;
    objc_msgSend(v104, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 3, v86, v138);
    LODWORD(v139) = 1144750080;
    objc_msgSend(v104, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 4, v86, v139);
  }
  v149 = v204;
  if (v119)
  {
    if (a3 == 6 || a3 == 3)
    {
      objc_msgSend(v119, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 3, v86, 13.0);
      objc_msgSend(v119, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 1, v86, 13.0);
    }
    else if (a3 == 7)
    {
      objc_msgSend(v119, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 3, v86, 13.0);
      objc_msgSend(v119, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 1, v86, 18.0);
      objc_msgSend(v15, "size");
      v160 = v163;
      goto LABEL_94;
    }
    objc_msgSend(v16, "alertIconImageEdgeInsetsForType:", a3);
    v151 = v150;
    v153 = v152;
    v155 = v154;
    objc_msgSend(v119, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 1, v86, v156);
    objc_msgSend(v119, "ax_constrainLayoutAttribute:asEqualToLayoutAttribute:ofView:withOffset:", 2, 1, v104, -v155);
    objc_msgSend(v119, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfView:withOffset:", 3, v86, v151);
    objc_msgSend(v119, "ax_constrainLayoutAttribute:asLessThanOrEqualToValueOfView:withOffset:", 4, v86, -v153);
    objc_msgSend(v119, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 10, v86, (v151 - v153) * 0.5);
    LODWORD(v157) = 1132068864;
    objc_msgSend(v119, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:priority:", 3, v86, v151, v157);
    LODWORD(v158) = 1132068864;
    objc_msgSend(v119, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:priority:", 4, v86, -v153, v158);
    objc_msgSend(v15, "size");
    v160 = v159;
    v162 = v161;
    if (a3 > 7 || ((1 << a3) & 0xC8) == 0)
    {
LABEL_102:
      objc_msgSend(v119, "ax_constrainLayoutAttribute:asEqualToConstant:", 7, v160);
      objc_msgSend(v119, "ax_constrainLayoutAttribute:asEqualToConstant:", 8, v162);
      goto LABEL_103;
    }
LABEL_94:
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "preferredContentSizeCategory");
    v165 = (NSString *)objc_claimAutoreleasedReturnValue();
    v166 = UIContentSizeCategoryCompareToCategory(v165, (UIContentSizeCategory)*MEMORY[0x24BDF7650]);

    if (v166 == NSOrderedDescending)
    {
      v167 = 40.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "preferredContentSizeCategory");
      v169 = (NSString *)objc_claimAutoreleasedReturnValue();
      v170 = UIContentSizeCategoryCompareToCategory(v169, (UIContentSizeCategory)*MEMORY[0x24BDF7678]);

      v167 = 30.0;
      if (v170 != NSOrderedDescending)
      {
        objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", 30.0);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "preferredContentSizeCategory");
        v172 = (NSString *)objc_claimAutoreleasedReturnValue();
        v173 = UIContentSizeCategoryCompareToCategory(v172, (UIContentSizeCategory)*MEMORY[0x24BDF7688]);

        v167 = 20.0;
        if (v173 == NSOrderedDescending)
          v167 = 25.0;
      }
    }
    if (v167 < v160)
      v160 = v167;
    v162 = v160;
    v15 = v202;
    v16 = v203;
    v149 = v204;
    goto LABEL_102;
  }
LABEL_103:
  objc_msgSend(v16, "alertBackgroundSizeForType:", a3);
  v176 = v174;
  v177 = v175;
  v178 = v174 > 0.0
      && vabdd_f64(v174, *(double *)&AXUIAlertSizeMetricFitting) >= 2.22044605e-16
      && vabdd_f64(v174, *(double *)&AXUIAlertSizeMetricFillingContainer) >= 2.22044605e-16;
  if (v175 > 0.0 && vabdd_f64(v175, *(double *)&AXUIAlertSizeMetricFitting) >= 2.22044605e-16)
  {
    v179 = vabdd_f64(v175, *(double *)&AXUIAlertSizeMetricFillingContainer) >= 2.22044605e-16;
    if (!v178)
      goto LABEL_114;
  }
  else
  {
    v179 = 0;
    if (!v178)
      goto LABEL_114;
  }
  if (!objc_msgSend(v16, "alertShouldGrowInAxis:forType:", 0, a3))
  {
    objc_msgSend(v149, "ax_constrainLayoutAttribute:asEqualToConstant:", 7, v176);
    if (!v179)
      goto LABEL_122;
LABEL_117:
    if (objc_msgSend(v16, "alertShouldGrowInAxis:forType:", 1, a3))
    {
      objc_msgSend(v149, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToConstant:", 8, v177);
    }
    else if (a3 > 7 || ((1 << a3) & 0xC8) == 0)
    {
      objc_msgSend(v149, "ax_constrainLayoutAttribute:asEqualToConstant:", 8, v177);
    }
    goto LABEL_122;
  }
  objc_msgSend(v149, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToConstant:", 7, v176);
LABEL_114:
  if (v179)
    goto LABEL_117;
LABEL_122:
  objc_msgSend(v16, "alertContentEdgeInsetsForType:", a3);
  v181 = v180;
  v183 = v182;
  v185 = v184;
  objc_msgSend(v86, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 1, v19, v186);
  objc_msgSend(v86, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 2, v19, -v185);
  if ((AXDeviceHasHomeButton() & 1) != 0 || !AXDeviceIsPhone())
  {
    objc_msgSend(v86, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 3, v19, v181);
  }
  else
  {
    objc_msgSend(v86, "topAnchor");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXStyleProviderUIAlert safeAreaLayoutGuide](v19, "safeAreaLayoutGuide");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "topAnchor");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "constraintEqualToAnchor:", v189);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "setActive:", 1);

    v16 = v203;
    v15 = v202;

    v149 = v204;
  }
  objc_msgSend(v86, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 4, v19, -v183);
  objc_msgSend(v149, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 9, v19);
  objc_msgSend(v149, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 7, v19);
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    objc_msgSend(v149, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 8, v19, 10.0);
    objc_msgSend(v149, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 4, v19, 3.0);
  }
  else
  {
    objc_msgSend(v149, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 8, v19);
    objc_msgSend(v149, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 10, v19);
  }
  -[AXStyleProviderUIAlert setAlertType:](v19, "setAlertType:", a3);
  -[AXStyleProviderUIAlert setStyleProvider:](v19, "setStyleProvider:", v16);
  v191 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v19, sel__handleTapGestureRecognizer_);
  objc_msgSend(v86, "addGestureRecognizer:", v191);
  v192 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", v19, sel__handlePanGestureRecognizer_);
  objc_msgSend(v192, "setMaximumNumberOfTouches:", 1);
  objc_msgSend(v86, "addGestureRecognizer:", v192);

  v14 = v198;
  v17 = v195;
LABEL_130:

  return v19;
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "locationInView:", self);
  v4 = -[AXStyleProviderUIAlert pointInside:withEvent:](self, "pointInside:withEvent:", 0);
  v5 = v14;
  if (v4)
  {
    if (!v14 || (v6 = objc_msgSend(v14, "state"), v5 = v14, v6 == 3))
    {
      -[AXUIAlert context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "service");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "conformsToProtocol:", &unk_254E249B0))
      {
        -[AXUIAlert context](self, "context");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "service");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[AXUIAlert context](self, "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXUIAlert userInfo](self, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "alertWithIdentifierWasActivated:userInfo:", v12, v13);

      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_12:

          v5 = v14;
          goto LABEL_13;
        }
        -[AXUIAlert context](self, "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "alertWithIdentifierWasActivated:", v12);
      }

      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void)_handlePanGestureRecognizer:(id)a3
{
  double v4;
  CGFloat v5;
  CGFloat v6;
  AXStyleProviderUIAlert *v7;
  id v8;
  id v9;

  v9 = a3;
  switch(objc_msgSend(v9, "state"))
  {
    case 1:
      objc_msgSend(v9, "locationInView:", self);
      self->_dismissalGestureYOffset = v4;
      -[AXStyleProviderUIAlert frame](self, "frame");
      self->_backgroundViewDismissalOrigin.x = v5;
      self->_backgroundViewDismissalOrigin.y = v6;
      v7 = self;
      v8 = v9;
      goto LABEL_4;
    case 2:
      v7 = self;
      v8 = v9;
LABEL_4:
      -[AXStyleProviderUIAlert _updateDismissalWithPanGesture:](v7, "_updateDismissalWithPanGesture:", v8);
      break;
    case 3:
      -[AXStyleProviderUIAlert _endDismissalWithPanGesture:](self, "_endDismissalWithPanGesture:", v9);
      break;
    case 4:
      -[AXStyleProviderUIAlert _cancelDismissalWithPanGesture:](self, "_cancelDismissalWithPanGesture:", v9);
      break;
    default:
      break;
  }

}

- (void)_updateDismissalWithPanGesture:(id)a3
{
  double v4;
  double v5;
  CGRect v6;

  objc_msgSend(a3, "translationInView:", self);
  v5 = v4;
  -[AXStyleProviderUIAlert frame](self, "frame");
  -[AXStyleProviderUIAlert setFrame:](self, "setFrame:");
  -[AXStyleProviderUIAlert frame](self, "frame");
  -[AXStyleProviderUIAlert _updateViewForDismissalPercentage:](self, "_updateViewForDismissalPercentage:", -v5 / CGRectGetHeight(v6));
}

- (void)_updateViewForDismissalPercentage:(double)a3
{
  if (a3 <= 0.0)
  {
    -[AXStyleProviderUIAlert frame](self, "frame");
    -[AXStyleProviderUIAlert setFrame:](self, "setFrame:", self->_backgroundViewDismissalOrigin.x, self->_backgroundViewDismissalOrigin.y);
  }
  else if (a3 > 0.3)
  {
    -[AXStyleProviderUIAlert _endDismissalWithPanGesture:](self, "_endDismissalWithPanGesture:", 0);
  }
}

- (void)_endDismissalWithPanGesture:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double Height;
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
  id v20;
  id v21;
  _QWORD v22[5];
  CGRect v23;

  v4 = a3;
  objc_msgSend(v4, "translationInView:", self);
  v6 = v5;
  objc_msgSend(v4, "velocityInView:", self);
  v8 = v7;

  -[AXStyleProviderUIAlert frame](self, "frame");
  Height = CGRectGetHeight(v23);
  if (v8 > 800.0 || (Height = -v6 / Height, Height > 0.3))
  {
    -[AXUIAlert context](self, "context", Height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "conformsToProtocol:", &unk_254E249B0))
    {
      -[AXUIAlert context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "service");
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AXUIAlert context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "alertWithIdentifierDidDisappear:", v14);

    }
    +[AXUIDisplayManager sharedDisplayManager](AXUIDisplayManager, "sharedDisplayManager", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIAlert context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIAlert context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "service");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hideAlertWithIdentifier:forService:", v17, v19);

  }
  else
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __54__AXStyleProviderUIAlert__endDismissalWithPanGesture___block_invoke;
    v22[3] = &unk_24D49C910;
    v22[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v22, 0.2);
  }
}

uint64_t __54__AXStyleProviderUIAlert__endDismissalWithPanGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateViewForDismissalPercentage:", 0.0);
}

- (void)_cancelDismissalWithPanGesture:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__AXStyleProviderUIAlert__cancelDismissalWithPanGesture___block_invoke;
  v3[3] = &unk_24D49C910;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v3, 0.2);
}

uint64_t __57__AXStyleProviderUIAlert__cancelDismissalWithPanGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateViewForDismissalPercentage:", 0.0);
}

- (void)addToContainerView:(id)a3
{
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  BOOL v29;
  id v30;

  v30 = a3;
  -[AXStyleProviderUIAlert setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v30, "addSubview:", self);
  -[AXStyleProviderUIAlert styleProvider](self, "styleProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXStyleProviderUIAlert alertType](self, "alertType");
  objc_msgSend(v4, "alertEdgeInsetsForType:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = objc_msgSend(v4, "alertPositionForType:", v5);
  objc_msgSend(v4, "alertBackgroundSizeForType:", v5);
  v16 = vabdd_f64(v15, *(double *)&AXUIAlertSizeMetricFillingContainer);
  v18 = vabdd_f64(v17, *(double *)&AXUIAlertSizeMetricFillingContainer);
  v19 = v14 - 1;
  if ((v14 - 1) > 7)
  {
    v21 = -1;
    v20 = 1;
    v22 = 1;
    v23 = -1;
  }
  else
  {
    v20 = qword_215E412B0[v19];
    v21 = qword_215E412F0[v19];
    v22 = qword_215E41330[v19];
    v23 = qword_215E41370[v19];
  }
  if (v16 >= 2.22044605e-16)
    v24 = v22;
  else
    v24 = 0;
  if (v16 >= 2.22044605e-16)
    v25 = v23;
  else
    v25 = 0;
  if (v18 >= 2.22044605e-16)
    v26 = v20;
  else
    v26 = 0;
  if (v18 >= 2.22044605e-16)
    v27 = v21;
  else
    v27 = 0;
  -[AXStyleProviderUIAlert ax_constrainLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:](self, "ax_constrainLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", 3, v26, v30, 3, 1.0, v7);
  -[AXStyleProviderUIAlert ax_constrainLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:](self, "ax_constrainLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", 4, v27, v30, 4, 1.0, -v11);
  -[AXStyleProviderUIAlert ax_constrainLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:](self, "ax_constrainLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", 1, v24, v30, 1, 1.0, v9);
  -[AXStyleProviderUIAlert ax_constrainLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:](self, "ax_constrainLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", 2, v25, v30, 2, 1.0, -v13);
  if (v24)
    v28 = v25 == 0;
  else
    v28 = 1;
  if (!v28)
    -[AXStyleProviderUIAlert ax_constrainLayoutAttribute:asEqualToValueOfView:](self, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 9, v30);
  if (v26)
    v29 = v27 == 0;
  else
    v29 = 1;
  if (!v29)
    -[AXStyleProviderUIAlert ax_constrainLayoutAttribute:asEqualToValueOfView:](self, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 10, v30);
  if (v16 < 2.22044605e-16)
    -[AXStyleProviderUIAlert ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:](self, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 7, v30, -(v9 + v13));
  if (v18 < 2.22044605e-16)
    -[AXStyleProviderUIAlert ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:](self, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 8, v30, -(v7 + v11));

}

- (void)_appendParagraphWithText:(id)a3 withTextColor:(id)a4 font:(id)a5 textAlignment:(int64_t)a6 lineSpacing:(double)a7 paragraphSpacingBefore:(double)a8 toAttributedString:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v15 = a4;
  v16 = a9;
  v17 = a5;
  v18 = a3;
  v19 = objc_msgSend(v16, "length");
  v20 = (_QWORD *)MEMORY[0x24BDF6628];
  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    v23 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF6A70], "labelFontSize");
    objc_msgSend(v23, "systemFontOfSize:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lineHeight");
    objc_msgSend(v22, "setParagraphSpacingBefore:", a8 - v25);

    v39 = *v20;
    v40[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("\n\n"), v26);
    objc_msgSend(v16, "appendAttributedString:", v27);

  }
  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "mutableCopy");

  objc_msgSend(v29, "setAlignment:", a6);
  if (fabs(a7) >= 2.22044605e-16)
    objc_msgSend(v29, "setLineSpacing:", a7);
  v30 = v15;
  v31 = v30;
  if (!v30)
  {
    v32 = v20;
    -[AXStyleProviderUIAlert traitCollection](self, "traitCollection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "userInterfaceStyle");

    if (v34 == 2)
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v32;
  }
  v35 = objc_alloc(MEMORY[0x24BDBCE70]);
  v36 = (void *)objc_msgSend(v35, "initWithObjectsAndKeys:", v29, *v20, v17, *MEMORY[0x24BDF65F8], v31, *MEMORY[0x24BDF6600], 0);

  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v18, v36);
  objc_msgSend(v16, "appendAttributedString:", v37);

}

- (void)_appendParagraphWithText:(id)a3 withImage:(id)a4 withTextColor:(id)a5 font:(id)a6 textAlignment:(int64_t)a7 lineSpacing:(double)a8 paragraphSpacingBefore:(double)a9 toAttributedString:(id)a10
{
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;

  v17 = a5;
  v18 = (void *)MEMORY[0x24BDF6750];
  v19 = a10;
  v20 = a6;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v18, "defaultParagraphStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  objc_msgSend(v24, "setAlignment:", a7);
  if (fabs(a8) >= 2.22044605e-16)
    objc_msgSend(v24, "setLineSpacing:", a8);
  v25 = v17;
  v34 = v25;
  if (!v25)
  {
    -[AXStyleProviderUIAlert traitCollection](self, "traitCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceStyle");

    if (v27 == 2)
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = objc_alloc(MEMORY[0x24BDBCE70]);
  v29 = (void *)objc_msgSend(v28, "initWithObjectsAndKeys:", v24, *MEMORY[0x24BDF6628], v20, *MEMORY[0x24BDF65F8], v25, *MEMORY[0x24BDF6600], 0);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v22, v29);
  v31 = objc_alloc_init(MEMORY[0x24BDF6768]);
  objc_msgSend(v31, "setImage:", v21);

  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:attributes:", v31, v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendAttributedString:", v32);

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("  "));
  objc_msgSend(v19, "appendAttributedString:", v33);

  objc_msgSend(v19, "appendAttributedString:", v30);
}

- (unint64_t)alertType
{
  return self->_alertType;
}

- (void)setAlertType:(unint64_t)a3
{
  self->_alertType = a3;
}

- (AXUIAlertStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end
