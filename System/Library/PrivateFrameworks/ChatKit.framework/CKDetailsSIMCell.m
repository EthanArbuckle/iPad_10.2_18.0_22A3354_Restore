@implementation CKDetailsSIMCell

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsSIM_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 1;
}

+ (double)preferredHeight
{
  int HasMultipleActiveSubscriptions;
  double result;

  HasMultipleActiveSubscriptions = IMSharedHelperDeviceHasMultipleActiveSubscriptions();
  result = 44.0;
  if (!HasMultipleActiveSubscriptions)
    return 0.0;
  return result;
}

- (CKDetailsSIMCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 simLabelText:(id)a5
{
  id v8;
  CKDetailsSIMCell *v9;
  CKDetailsSIMCell *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CKStandardButton *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UILabel *v28;
  UILabel *simLabel;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
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
  id v123;
  objc_super v124;
  _QWORD v125[12];
  _QWORD v126[14];

  v126[12] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v124.receiver = self;
  v124.super_class = (Class)CKDetailsSIMCell;
  v9 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v124, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v10 = v9;
  if (v9)
  {
    -[CKDetailsSIMCell setSelectionStyle:](v9, "setSelectionStyle:", 0);
    -[CKDetailsSIMCell textLabel](v10, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CEB538];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v13);

    -[CKDetailsSIMCell textLabel](v10, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumberOfLines:", 0);

    -[CKDetailsSIMCell textLabel](v10, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLineBreakMode:", 4);

    -[CKDetailsSIMCell textLabel](v10, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKDetailsSIMCell contentView](v10, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", 0);

    v18 = objc_alloc_init(CKStandardButton);
    -[CKDetailsSIMCell setButton:](v10, "setButton:", v18);

    -[CKDetailsSIMCell button](v10, "button");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setCornerRadius:", 10.0);

    -[CKDetailsSIMCell button](v10, "button");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKDetailsSIMCell button](v10, "button");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", 0);

    -[CKDetailsSIMCell button](v10, "button");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContextMenuIsPrimary:", 1);

    -[CKDetailsSIMCell button](v10, "button");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContextMenuInteractionEnabled:", 1);

    -[CKDetailsSIMCell menu](v10, "menu");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSIMCell button](v10, "button");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMenu:", v24);

    -[CKDetailsSIMCell menu](v10, "menu");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSIMCell button](v10, "button");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHidden:", v26 == 0);

    v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    simLabel = v10->_simLabel;
    v10->_simLabel = v28;

    v123 = v8;
    -[UILabel setText:](v10->_simLabel, "setText:", v8);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_simLabel, "setFont:", v30);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "theme");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "appTintColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10->_simLabel, "setTextColor:", v33);

    -[UILabel setTextAlignment:](v10->_simLabel, "setTextAlignment:", 2);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_simLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CKDetailsSIMCell button](v10, "button");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSIMCell addSubview:](v10, "addSubview:", v34);

    -[CKDetailsSIMCell button](v10, "button");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSIMCell simLabel](v10, "simLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addSubview:", v36);

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "userInterfaceLayoutDirection");

    if (v38 == 1)
    {
      -[UILabel setTextAlignment:](v10->_simLabel, "setTextAlignment:", 0);
      v77 = (void *)MEMORY[0x1E0CB3718];
      -[CKDetailsSIMCell textLabel](v10, "textLabel");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "rightAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell rightAnchor](v10, "rightAnchor");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v39;
      objc_msgSend(v39, "constraintEqualToAnchor:constant:", -18.0);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v125[0] = v119;
      -[CKDetailsSIMCell textLabel](v10, "textLabel");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "topAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell topAnchor](v10, "topAnchor");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v40;
      objc_msgSend(v40, "constraintEqualToAnchor:");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v125[1] = v115;
      -[CKDetailsSIMCell textLabel](v10, "textLabel");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell bottomAnchor](v10, "bottomAnchor");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v41;
      objc_msgSend(v41, "constraintEqualToAnchor:");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v125[2] = v111;
      -[CKDetailsSIMCell button](v10, "button");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "centerXAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell leftAnchor](v10, "leftAnchor");
      v43 = objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell bounds](v10, "bounds");
      v108 = (void *)v43;
      v109 = v42;
      objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, v44 * 0.25);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v125[3] = v107;
      -[CKDetailsSIMCell button](v10, "button");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "leftAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell leftAnchor](v10, "leftAnchor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v45;
      objc_msgSend(v45, "constraintEqualToAnchor:constant:", 18.0);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v125[4] = v103;
      -[CKDetailsSIMCell button](v10, "button");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "topAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell topAnchor](v10, "topAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v46;
      objc_msgSend(v46, "constraintEqualToAnchor:constant:", 5.0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v125[5] = v99;
      -[CKDetailsSIMCell button](v10, "button");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "bottomAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell bottomAnchor](v10, "bottomAnchor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v47;
      objc_msgSend(v47, "constraintEqualToAnchor:constant:", -5.0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v125[6] = v95;
      -[CKDetailsSIMCell simLabel](v10, "simLabel");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "bottomAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell button](v10, "button");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "bottomAnchor");
      v93 = v48;
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v125[7] = v90;
      -[CKDetailsSIMCell simLabel](v10, "simLabel");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "topAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell button](v10, "button");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "topAnchor");
      v88 = v49;
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v125[8] = v85;
      -[CKDetailsSIMCell simLabel](v10, "simLabel");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "centerXAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell button](v10, "button");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "centerXAnchor");
      v83 = v50;
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v125[9] = v80;
      -[CKDetailsSIMCell simLabel](v10, "simLabel");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "rightAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell button](v10, "button");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "rightAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v51;
      objc_msgSend(v51, "constraintEqualToAnchor:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v125[10] = v54;
      -[CKDetailsSIMCell textLabel](v10, "textLabel");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "leftAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell button](v10, "button");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "rightAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, 5.0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v125[11] = v59;
      v60 = (void *)MEMORY[0x1E0C99D20];
      v61 = v125;
    }
    else
    {
      v77 = (void *)MEMORY[0x1E0CB3718];
      -[CKDetailsSIMCell textLabel](v10, "textLabel");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "leftAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell leftAnchor](v10, "leftAnchor");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v62;
      objc_msgSend(v62, "constraintEqualToAnchor:constant:", 18.0);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v126[0] = v119;
      -[CKDetailsSIMCell textLabel](v10, "textLabel");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "topAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell topAnchor](v10, "topAnchor");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v63;
      objc_msgSend(v63, "constraintEqualToAnchor:");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v126[1] = v115;
      -[CKDetailsSIMCell textLabel](v10, "textLabel");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "bottomAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell bottomAnchor](v10, "bottomAnchor");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v64;
      objc_msgSend(v64, "constraintEqualToAnchor:");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v126[2] = v111;
      -[CKDetailsSIMCell button](v10, "button");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "centerXAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell rightAnchor](v10, "rightAnchor");
      v66 = objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell bounds](v10, "bounds");
      v108 = (void *)v66;
      v109 = v65;
      objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66, v67 * -0.25);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v126[3] = v107;
      -[CKDetailsSIMCell button](v10, "button");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "rightAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell rightAnchor](v10, "rightAnchor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v68;
      objc_msgSend(v68, "constraintEqualToAnchor:constant:", -18.0);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v126[4] = v103;
      -[CKDetailsSIMCell button](v10, "button");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "topAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell topAnchor](v10, "topAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v69;
      objc_msgSend(v69, "constraintEqualToAnchor:constant:", 5.0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v126[5] = v99;
      -[CKDetailsSIMCell button](v10, "button");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "bottomAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell bottomAnchor](v10, "bottomAnchor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v70;
      objc_msgSend(v70, "constraintEqualToAnchor:constant:", -5.0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v126[6] = v95;
      -[CKDetailsSIMCell simLabel](v10, "simLabel");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "bottomAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell button](v10, "button");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "bottomAnchor");
      v93 = v71;
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "constraintEqualToAnchor:");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v126[7] = v90;
      -[CKDetailsSIMCell simLabel](v10, "simLabel");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "topAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell button](v10, "button");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "topAnchor");
      v88 = v72;
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "constraintEqualToAnchor:");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v126[8] = v85;
      -[CKDetailsSIMCell simLabel](v10, "simLabel");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "centerXAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell button](v10, "button");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "centerXAnchor");
      v83 = v73;
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintEqualToAnchor:");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v126[9] = v80;
      -[CKDetailsSIMCell simLabel](v10, "simLabel");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "leftAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell button](v10, "button");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "leftAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v74;
      objc_msgSend(v74, "constraintEqualToAnchor:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v126[10] = v54;
      -[CKDetailsSIMCell textLabel](v10, "textLabel");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "rightAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSIMCell button](v10, "button");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "leftAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, -5.0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v126[11] = v59;
      v60 = (void *)MEMORY[0x1E0C99D20];
      v61 = v126;
    }
    objc_msgSend(v60, "arrayWithObjects:count:", v61, 12);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "activateConstraints:", v75);

    v8 = v123;
  }

  return v10;
}

- (CKDetailsSIMCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsSIMCell *v4;
  CKDetailsSIMCell *v5;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)CKDetailsSIMCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v31, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKDetailsSIMCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[CKDetailsSIMCell textLabel](v5, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[CKDetailsSIMCell textLabel](v5, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

    -[CKDetailsSIMCell textLabel](v5, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 4);

    -[CKDetailsSIMCell textLabel](v5, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

    -[CKDetailsSIMCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", 0);

    v23 = (void *)MEMORY[0x1E0CB3718];
    -[CKDetailsSIMCell textLabel](v5, "textLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "rightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSIMCell rightAnchor](v5, "rightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v27;
    -[CKDetailsSIMCell textLabel](v5, "textLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leftAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSIMCell leftAnchor](v5, "leftAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v22;
    -[CKDetailsSIMCell textLabel](v5, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSIMCell topAnchor](v5, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v15;
    -[CKDetailsSIMCell textLabel](v5, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSIMCell bottomAnchor](v5, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v20);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDetailsSIMCell;
  -[CKDetailsCell layoutSubviews](&v5, sel_layoutSubviews);
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKDetailsSIMCell;
  -[CKDetailsCell prepareForReuse](&v6, sel_prepareForReuse);
  -[CKDetailsSIMCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_1E276D870);

  -[CKDetailsSIMCell setMenu:](self, "setMenu:", 0);
  -[CKDetailsSIMCell menu](self, "menu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsSIMCell button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4 == 0);

}

- (void)setMenu:(id)a3
{
  void *v5;
  void *v6;
  UIMenu *v7;

  v7 = (UIMenu *)a3;
  if (self->_menu != v7)
  {
    objc_storeStrong((id *)&self->_menu, a3);
    -[CKDetailsSIMCell button](self, "button");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMenu:", v7);

    -[CKDetailsSIMCell button](self, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v7 == 0);

  }
}

- (void)setSIMLabelText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKDetailsSIMCell simLabel](self, "simLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (UIMenu)menu
{
  return self->_menu;
}

- (UILabel)simLabel
{
  return self->_simLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simLabel, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
