@implementation HUInstructionsCell

- (HUInstructionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUInstructionsCell *v4;
  HUInstructionsCell *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)HUInstructionsCell;
  v4 = -[HUInstructionsCell initWithStyle:reuseIdentifier:](&v37, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HUInstructionsCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInstructionsCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = objc_alloc(MEMORY[0x1E0CEA700]);
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v12 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
    -[HUInstructionsCell setTitleLabel:](v5, "setTitleLabel:", v12);

    -[HUInstructionsCell titleLabel](v5, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUInstructionsCell titleLabel](v5, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);

    -[HUInstructionsCell contentView](v5, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInstructionsCell titleLabel](v5, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAB18]), "initWithFrame:", v8, v9, v10, v11);
    -[HUInstructionsCell setDescriptionView:](v5, "setDescriptionView:", v17);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInstructionsCell descriptionView](v5, "descriptionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v18);

    -[HUInstructionsCell descriptionView](v5, "descriptionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", v5);

    -[HUInstructionsCell descriptionView](v5, "descriptionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setEditable:", 0);

    -[HUInstructionsCell descriptionView](v5, "descriptionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "textContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLineFragmentPadding:", 0.0);

    v24 = *MEMORY[0x1E0CEB4B0];
    v25 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v26 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v27 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    -[HUInstructionsCell descriptionView](v5, "descriptionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextContainerInset:", v24, v25, v26, v27);

    -[HUInstructionsCell descriptionView](v5, "descriptionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInstructionsCell descriptionView](v5, "descriptionView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTextColor:", v30);

    -[HUInstructionsCell descriptionView](v5, "descriptionView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setScrollEnabled:", 0);

    -[HUInstructionsCell descriptionView](v5, "descriptionView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_setInteractiveTextSelectionDisabled:", 1);

    -[HUInstructionsCell contentView](v5, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInstructionsCell descriptionView](v5, "descriptionView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", v35);

    -[HUInstructionsCell setHidesTopSpacing:](v5, "setHidesTopSpacing:", 0);
    v5->_contentBottomMargin = 14.0;
    -[HUInstructionsCell setNeedsUpdateConstraints](v5, "setNeedsUpdateConstraints");
  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUInstructionsCell;
  -[HUInstructionsCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUInstructionsCell setContentBottomMargin:](self, "setContentBottomMargin:", 14.0);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUInstructionsCell;
  -[HUInstructionsCell layoutSubviews](&v3, sel_layoutSubviews);
  -[UITableViewCell turnOffRounding](self, "turnOffRounding");
}

- (void)updateUIWithAnimation:(BOOL)a3
{
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
  id v65;

  -[HUInstructionsCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v65 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v65, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInstructionsCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

  -[HUInstructionsCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v5 == 0);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInstructionsCell descriptionView](self, "descriptionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E0CEA098]);

  -[HUInstructionsCell descriptionView](self, "descriptionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeSetObject:forKey:", v13, *MEMORY[0x1E0CEA0A0]);

  objc_msgSend(v6, "stringWithAttributes:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInstructionsCell descriptionView](self, "descriptionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAttributedText:", v14);

  -[HUInstructionsCell descriptionView](self, "descriptionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v6 == 0);

  -[HUInstructionsCell item](self, "item");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "latestResults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("instructionsStyle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    switch(objc_msgSend(v19, "integerValue"))
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5B8]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CEA5E8];
        objc_msgSend(v20, "pointSize");
        objc_msgSend(v22, "systemFontOfSize:weight:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setFont:", v23);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTextAlignment:", 4);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setNumberOfLines:", 0);

        v27 = (void *)MEMORY[0x1E0CEA5E8];
        objc_msgSend(v21, "pointSize");
        objc_msgSend(v27, "systemFontOfSize:weight:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setFont:", v28);

        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setTextAlignment:", 4);

        goto LABEL_11;
      case 1:
        objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB590], 32770);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setFont:", v31);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setTextAlignment:", 4);

        objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setTextColor:", v34);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setNumberOfLines:", 1);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "text");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedUppercaseString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setText:", v39);

        objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setFont:", v41);

        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setTextAlignment:", 4);

        v44 = (void *)MEMORY[0x1E0CEA478];
        goto LABEL_10;
      case 2:
        objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1E0CEA5E8];
        objc_msgSend(v20, "pointSize");
        objc_msgSend(v45, "systemFontOfSize:weight:");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setFont:", v46);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setTextAlignment:", 4);

        objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setTextColor:", v49);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setNumberOfLines:", 1);
        goto LABEL_11;
      case 3:
        objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 22.0, *MEMORY[0x1E0CEB5F8]);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setFont:", v51);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setTextAlignment:", 4);

        objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setTextColor:", v54);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setNumberOfLines:", 1);
        goto LABEL_12;
      case 4:
        objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setFont:", v56);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setTextAlignment:", 4);

        objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setTextColor:", v59);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setNumberOfLines:", 0);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setLineBreakMode:", 0);
        goto LABEL_12;
      case 5:
        objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setFont:", v62);

        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setTextAlignment:", 4);

        v44 = (void *)MEMORY[0x1E0CEA478];
LABEL_10:
        objc_msgSend(v44, "systemGrayColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTextColor:", v20);
LABEL_11:

LABEL_12:
        break;
      default:
        break;
    }
  }
  else
  {
    NSLog(CFSTR("No instructions style specified in the results"));
  }
  -[HUInstructionsCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
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
  double v46;
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
  double v64;
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
  double v105;
  double v106;
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
  void *v125;
  void *v126;
  double v127;
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
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  char v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  double v156;
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
  objc_super v168;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInstructionsCell item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("instructionsStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "integerValue");
  }
  else
  {
    NSLog(CFSTR("No instructions style specified in the results"));
    v7 = -1;
  }
  -[HUInstructionsCell item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v10 = objc_claimAutoreleasedReturnValue();

  -[HUInstructionsCell item](self, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v13 = objc_claimAutoreleasedReturnValue();

  -[HUInstructionsCell titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 1144766464;
  objc_msgSend(v14, "setContentCompressionResistancePriority:forAxis:", 1, v15);

  -[HUInstructionsCell titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 1132134400;
  objc_msgSend(v16, "setContentHuggingPriority:forAxis:", 1, v17);

  v18 = -[HUInstructionsCell hidesTopSpacing](self, "hidesTopSpacing");
  if (v18)
    v19 = 12.0;
  else
    v19 = 52.0;
  if (v18)
    v20 = 12.0;
  else
    v20 = 20.0;
  switch(v7)
  {
    case 0:
      if (v10 && v13)
      {
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "firstBaselineAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell contentView](self, "contentView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "topAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, v19);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v30);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "leadingAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell contentView](self, "contentView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "layoutMarginsGuide");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "leadingAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "constraintEqualToAnchor:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v36);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "trailingAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell contentView](self, "contentView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "layoutMarginsGuide");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "trailingAnchor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "constraintEqualToAnchor:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v42);

        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "font");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        v46 = 22.0;
        goto LABEL_22;
      }
      if (v10 | v13)
      {
        if (v10)
          -[HUInstructionsCell titleLabel](self, "titleLabel");
        else
          -[HUInstructionsCell descriptionView](self, "descriptionView");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "firstBaselineAnchor");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell contentView](self, "contentView");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "topAnchor");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = v151;
        v155 = v153;
        v156 = v19;
        goto LABEL_43;
      }
      break;
    case 1:
      if (v10 && v13)
      {
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "topAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell contentView](self, "contentView");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "topAnchor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50, v20);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v51);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "leadingAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell contentView](self, "contentView");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "layoutMarginsGuide");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "leadingAnchor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "constraintEqualToAnchor:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v57);

        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "trailingAnchor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell contentView](self, "contentView");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "layoutMarginsGuide");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "trailingAnchor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "constraintEqualToAnchor:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v63);

        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "font");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        v46 = v20;
LABEL_22:
        objc_msgSend(v44, "_scaledValueForValue:", v46);
        v65 = HURoundToScreenScale(v64);

        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "firstBaselineAnchor");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "lastBaselineAnchor");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "constraintEqualToAnchor:constant:", v69, v65);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v70);

        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "leadingAnchor");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell contentView](self, "contentView");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "layoutMarginsGuide");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "leadingAnchor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "constraintEqualToAnchor:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v76);

        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "trailingAnchor");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell contentView](self, "contentView");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "layoutMarginsGuide");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "trailingAnchor");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "constraintEqualToAnchor:", v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v82);

        -[HUInstructionsCell descriptionView](self, "descriptionView");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      if (v10 | v13)
      {
        if (v10)
          -[HUInstructionsCell titleLabel](self, "titleLabel");
        else
          -[HUInstructionsCell descriptionView](self, "descriptionView");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "topAnchor");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell contentView](self, "contentView");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "topAnchor");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = v151;
        v155 = v153;
        v156 = v20;
LABEL_43:
        objc_msgSend(v154, "constraintEqualToAnchor:constant:", v155, v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v157);

        objc_msgSend(v101, "leadingAnchor");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell contentView](self, "contentView");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "layoutMarginsGuide");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "leadingAnchor");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "constraintEqualToAnchor:", v161);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v162);

        objc_msgSend(v101, "trailingAnchor");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInstructionsCell contentView](self, "contentView");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "layoutMarginsGuide");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "trailingAnchor");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "constraintEqualToAnchor:", v166);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v167);

        v83 = v101;
        goto LABEL_25;
      }
      break;
    case 2:
    case 3:
      v21 = 44.0;
      if (v18)
        v21 = 12.0;
      if (v7 == 2)
      {
        v19 = v21;
        -[HUInstructionsCell titleLabel](self, "titleLabel");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "font");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "_scaledValueForValue:", 10.0);
        v25 = HURoundToScreenScale(v24);

      }
      else
      {
        -[HUInstructionsCell contentBottomMargin](self, "contentBottomMargin");
        v25 = v127;
      }
      -[HUInstructionsCell titleLabel](self, "titleLabel");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "firstBaselineAnchor");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentView](self, "contentView");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "topAnchor");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "constraintEqualToAnchor:constant:", v131, v19);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v132);

      -[HUInstructionsCell titleLabel](self, "titleLabel");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "leadingAnchor");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentView](self, "contentView");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "layoutMarginsGuide");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "leadingAnchor");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "constraintEqualToAnchor:", v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v138);

      -[HUInstructionsCell titleLabel](self, "titleLabel");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "trailingAnchor");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentView](self, "contentView");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "layoutMarginsGuide");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "trailingAnchor");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "constraintEqualToAnchor:", v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v144);

      -[HUInstructionsCell titleLabel](self, "titleLabel");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "bottomAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentView](self, "contentView");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "bottomAnchor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = -v25;
      goto LABEL_28;
    case 4:
      -[HUInstructionsCell titleLabel](self, "titleLabel");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "firstBaselineAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentView](self, "contentView");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "topAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "constraintEqualToAnchor:constant:", v87, v19);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v88);

      -[HUInstructionsCell titleLabel](self, "titleLabel");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "leadingAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentView](self, "contentView");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "layoutMarginsGuide");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "leadingAnchor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintEqualToAnchor:", v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v94);

      -[HUInstructionsCell titleLabel](self, "titleLabel");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "trailingAnchor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentView](self, "contentView");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "layoutMarginsGuide");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "trailingAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "constraintEqualToAnchor:", v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v100);

      -[HUInstructionsCell titleLabel](self, "titleLabel");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      v101 = v83;
LABEL_25:
      objc_msgSend(v83, "bottomAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentView](self, "contentView");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "bottomAnchor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentBottomMargin](self, "contentBottomMargin");
      v106 = -v105;
LABEL_28:
      objc_msgSend(v102, "constraintEqualToAnchor:constant:", v104, v106);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v125);
      goto LABEL_29;
    case 5:
      -[HUInstructionsCell descriptionView](self, "descriptionView");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "topAnchor");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentView](self, "contentView");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "layoutMarginsGuide");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "topAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "constraintEqualToAnchor:", v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v112);

      -[HUInstructionsCell descriptionView](self, "descriptionView");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "bottomAnchor");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentView](self, "contentView");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "layoutMarginsGuide");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "bottomAnchor");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "constraintEqualToAnchor:", v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v118);

      -[HUInstructionsCell descriptionView](self, "descriptionView");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "leadingAnchor");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentView](self, "contentView");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "layoutMarginsGuide");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "leadingAnchor");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "constraintEqualToAnchor:", v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v124);

      -[HUInstructionsCell descriptionView](self, "descriptionView");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "trailingAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInstructionsCell contentView](self, "contentView");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "layoutMarginsGuide");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "trailingAnchor");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "constraintEqualToAnchor:", v125);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v126);

LABEL_29:
      break;
    default:
      break;
  }
  -[HUInstructionsCell constraints](self, "constraints");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = objc_msgSend(v3, "isEqualToArray:", v145);

  if ((v146 & 1) == 0)
  {
    v147 = (void *)MEMORY[0x1E0CB3718];
    -[HUInstructionsCell constraints](self, "constraints");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "deactivateConstraints:", v148);

    -[HUInstructionsCell setConstraints:](self, "setConstraints:", v3);
    v149 = (void *)MEMORY[0x1E0CB3718];
    -[HUInstructionsCell constraints](self, "constraints");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "activateConstraints:", v150);

  }
  v168.receiver = self;
  v168.super_class = (Class)HUInstructionsCell;
  -[HUInstructionsCell updateConstraints](&v168, sel_updateConstraints);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8;
  NSObject *v9;
  int v11;
  HUInstructionsCell *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v11, 0x16u);
  }

  return (unint64_t)(a6 - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (BOOL)hidesTopSpacing
{
  return self->_hidesTopSpacing;
}

- (void)setHidesTopSpacing:(BOOL)a3
{
  self->_hidesTopSpacing = a3;
}

- (double)contentBottomMargin
{
  return self->_contentBottomMargin;
}

- (void)setContentBottomMargin:(double)a3
{
  self->_contentBottomMargin = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UITextView)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionView, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
