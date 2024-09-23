@implementation ICAudioPlaybackBarViewController

- (void)registerForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_refreshTime_, *MEMORY[0x1E0C99720], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_refreshTime_, *MEMORY[0x1E0DC4838], 0);

}

- (void)refreshTime:(id)a3
{
  void *v3;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  id v9;

  -[ICAudioPlaybackBarViewController audioAttachment](self, "audioAttachment", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v9, "recordedInNotes");
  if (v6)
  {
    objc_msgSend(v9, "creationDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_shortFormattedDate");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1EA7E9860;
  }
  -[ICAudioPlaybackBarViewController creationDateLabel](self, "creationDateLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  if (v6)
  {

  }
}

- (ICAudioPlaybackBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ICAudioPlaybackBarViewController *v4;
  ICAudioPlaybackBarViewController *v5;
  int v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  ICAudioPlaybackScrubberView *v36;
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
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
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
  id v87;
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
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  double v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  double v135;
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
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  double v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  double v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  double v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
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
  void *v194;
  uint64_t v195;
  objc_super v196;

  v196.receiver = self;
  v196.super_class = (Class)ICAudioPlaybackBarViewController;
  v4 = -[ICAudioBarViewController initWithNibName:bundle:](&v196, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[ICAudioPlaybackBarViewController registerForNotifications](v4, "registerForNotifications");
    -[ICAudioPlaybackBarViewController registerForTraitChanges](v5, "registerForTraitChanges");
    v6 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    v7 = 54.0;
    if (v6)
      v7 = 70.0;
    -[ICAudioBarViewController setHeight:](v5, "setHeight:", v7);
    v8 = objc_alloc(MEMORY[0x1E0D64B18]);
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], v10, v11, v12);
    -[ICAudioPlaybackBarViewController setPlayPauseView:](v5, "setPlayPauseView:", v13);

    -[ICAudioPlaybackBarViewController playPauseView](v5, "playPauseView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController playPauseView](v5, "playPauseView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);

    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    {
      -[ICAudioPlaybackBarViewController playPauseView](v5, "playPauseView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "leadingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAudioPlaybackBarViewController view](v5, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, 12.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setActive:", 1);

    }
    else
    {
      -[ICAudioPlaybackBarViewController view](v5, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3718];
      -[ICAudioPlaybackBarViewController playPauseView](v5, "playPauseView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAudioPlaybackBarViewController view](v5, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 5, 0, v19, 17, 1.0, 0.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addConstraint:", v20);
    }

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController playPauseView](v5, "playPauseView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController view](v5, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 10, 0, v26, 10, 1.0, 0.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addConstraint:", v27);

    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    {
      -[ICAudioPlaybackBarViewController playPauseView](v5, "playPauseView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "widthAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAudioPlaybackBarViewController playPauseView](v5, "playPauseView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "heightAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setActive:", 1);

      -[ICAudioPlaybackBarViewController playPauseView](v5, "playPauseView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "widthAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToConstant:", 44.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setActive:", 1);

    }
    v36 = -[ICAudioPlaybackScrubberView initWithFrame:]([ICAudioPlaybackScrubberView alloc], "initWithFrame:", v9, v10, v11, v12);
    -[ICAudioPlaybackBarViewController setScrubberView:](v5, "setScrubberView:", v36);

    -[ICAudioPlaybackBarViewController scrubberView](v5, "scrubberView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICAudioPlaybackBarViewController scrubberView](v5, "scrubberView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addTarget:action:forControlEvents:", v5, sel_scrubberValueChangedAction_, 4096);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController scrubberView](v5, "scrubberView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSubview:", v40);

    v41 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController scrubberView](v5, "scrubberView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController view](v5, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "safeAreaLayoutGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, 1, 0, v44, 1, 1.0, 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController setScrubberLeftConstraint:](v5, "setScrubberLeftConstraint:", v45);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController scrubberLeftConstraint](v5, "scrubberLeftConstraint");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addConstraint:", v47);

    v48 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController view](v5, "view");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "safeAreaLayoutGuide");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController scrubberView](v5, "scrubberView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 2, 0, v51, 2, 1.0, 0.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController setScrubberRightConstraint:](v5, "setScrubberRightConstraint:", v52);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController scrubberRightConstraint](v5, "scrubberRightConstraint");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addConstraint:", v54);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController scrubberView](v5, "scrubberView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController view](v5, "view");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v57, 10, 0, v58, 10, 1.0, 0.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addConstraint:", v59);

    v60 = objc_alloc_init(MEMORY[0x1E0D64CA8]);
    -[ICAudioPlaybackBarViewController setLeadingTimeLabel:](v5, "setLeadingTimeLabel:", v60);

    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64CA0]), "initWithSeconds:", 0.0);
    -[ICAudioPlaybackBarViewController leadingTimeLabel](v5, "leadingTimeLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setMediaTimeValue:", v61);

    -[ICAudioPlaybackBarViewController leadingTimeLabel](v5, "leadingTimeLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setTextAlignment:", 2);

    objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorSecondaryLabelColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController leadingTimeLabel](v5, "leadingTimeLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setTextColor:", v64);

    v66 = *MEMORY[0x1E0DC4A98];
    v67 = *MEMORY[0x1E0DC4920];
    v195 = *MEMORY[0x1E0DC4A98];
    objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForTextStyle:maxContentSizeCategory:", *MEMORY[0x1E0DC4A98], *MEMORY[0x1E0DC4920]);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController leadingTimeLabel](v5, "leadingTimeLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setFont:", v68);

    -[ICAudioPlaybackBarViewController leadingTimeLabel](v5, "leadingTimeLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController leadingTimeLabel](v5, "leadingTimeLabel");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addSubview:", v72);

    -[ICAudioPlaybackBarViewController leadingTimeLabel](v5, "leadingTimeLabel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController leadingTimeLabel](v5, "leadingTimeLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v75, 7, 0, 0, 0, 1.0, 40.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addConstraint:", v76);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController scrubberView](v5, "scrubberView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController leadingTimeLabel](v5, "leadingTimeLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v79, 1, 0, v80, 2, 1.0, 10.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addConstraint:", v81);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController leadingTimeLabel](v5, "leadingTimeLabel");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController view](v5, "view");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v84, 10, 0, v85, 10, 1.0, 0.0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "addConstraint:", v86);

    v87 = objc_alloc_init(MEMORY[0x1E0D64CA8]);
    -[ICAudioPlaybackBarViewController setTrailingTimeLabel:](v5, "setTrailingTimeLabel:", v87);

    -[ICAudioPlaybackBarViewController trailingTimeLabel](v5, "trailingTimeLabel");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64CA0]), "initWithSeconds:", 0.0);
    -[ICAudioPlaybackBarViewController trailingTimeLabel](v5, "trailingTimeLabel");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setMediaTimeValue:", v89);

    -[ICAudioPlaybackBarViewController trailingTimeLabel](v5, "trailingTimeLabel");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setTextAlignment:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorSecondaryLabelColor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController trailingTimeLabel](v5, "trailingTimeLabel");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setTextColor:", v92);

    objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForTextStyle:maxContentSizeCategory:", v66, v67);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController trailingTimeLabel](v5, "trailingTimeLabel");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setFont:", v94);

    -[ICAudioPlaybackBarViewController trailingTimeLabel](v5, "trailingTimeLabel");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setIc_preferredContentSizeCategory:", v67);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController trailingTimeLabel](v5, "trailingTimeLabel");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "addSubview:", v98);

    v99 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController trailingTimeLabel](v5, "trailingTimeLabel");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v100, 7, 0, 0, 0, 1.0, 40.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController setTrailingTimeWidthConstraint:](v5, "setTrailingTimeWidthConstraint:", v101);

    -[ICAudioPlaybackBarViewController trailingTimeLabel](v5, "trailingTimeLabel");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController trailingTimeWidthConstraint](v5, "trailingTimeWidthConstraint");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addConstraint:", v103);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController trailingTimeLabel](v5, "trailingTimeLabel");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController scrubberView](v5, "scrubberView");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v106, 1, 0, v107, 2, 1.0, 10.0);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "addConstraint:", v108);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController trailingTimeLabel](v5, "trailingTimeLabel");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController view](v5, "view");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v111, 10, 0, v112, 10, 1.0, 0.0);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "addConstraint:", v113);

    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithHandler:", &__block_literal_global);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3520], "ic_plainButtonConfiguration");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_largeSystemImageNamed:", CFSTR("gobackward.15"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setImage:", v115);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "localizedStringForKey:value:table:", CFSTR("Skip forward 15 seconds"), &stru_1EA7E9860, 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setAccessibilityLabel:", v117);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v114, v194);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController setSkipBackwardButton:](v5, "setSkipBackwardButton:", v118);

    -[ICAudioPlaybackBarViewController skipBackwardButton](v5, "skipBackwardButton");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICAudioPlaybackBarViewController skipBackwardButton](v5, "skipBackwardButton");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setIc_preferredContentSizeCategory:", v67);

    -[ICAudioPlaybackBarViewController skipBackwardButton](v5, "skipBackwardButton");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v122) = 1148846080;
    objc_msgSend(v121, "setContentHuggingPriority:forAxis:", 0, v122);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController skipBackwardButton](v5, "skipBackwardButton");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "addSubview:", v124);

    v125 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController leadingTimeLabel](v5, "leadingTimeLabel");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController skipBackwardButton](v5, "skipBackwardButton");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v128) = 1144750080;
    objc_msgSend(v125, "ic_constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v126, 1, 1, v127, 2, 1.0, 10.0, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController setSkipBackwardRightConstraint:](v5, "setSkipBackwardRightConstraint:", v129);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController skipBackwardRightConstraint](v5, "skipBackwardRightConstraint");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "addConstraint:", v131);

    v132 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController skipBackwardButton](v5, "skipBackwardButton");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController view](v5, "view");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v135) = 1140457472;
    objc_msgSend(v132, "ic_constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v133, 1, 0, v134, 13, 1.0, 0.0, v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController setSkipBackwardLeftConstraint:](v5, "setSkipBackwardLeftConstraint:", v136);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController skipBackwardLeftConstraint](v5, "skipBackwardLeftConstraint");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "addConstraint:", v138);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController skipBackwardButton](v5, "skipBackwardButton");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController view](v5, "view");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v141, 10, 0, v142, 10, 1.0, 0.0);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "addConstraint:", v143);

    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithHandler:", &__block_literal_global_30);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3520], "ic_plainButtonConfiguration");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_largeSystemImageNamed:", CFSTR("goforward.15"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setImage:", v146);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "localizedStringForKey:value:table:", CFSTR("Skip forward 15 seconds"), &stru_1EA7E9860, 0);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setAccessibilityLabel:", v148);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v145, v144);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController setSkipForwardButton:](v5, "setSkipForwardButton:", v149);

    -[ICAudioPlaybackBarViewController skipForwardButton](v5, "skipForwardButton");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICAudioPlaybackBarViewController skipForwardButton](v5, "skipForwardButton");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v152) = 1148846080;
    objc_msgSend(v151, "setContentHuggingPriority:forAxis:", 0, v152);

    -[ICAudioPlaybackBarViewController skipForwardButton](v5, "skipForwardButton");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setIc_preferredContentSizeCategory:", v67);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController skipForwardButton](v5, "skipForwardButton");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "addSubview:", v155);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController skipForwardButton](v5, "skipForwardButton");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController trailingTimeLabel](v5, "trailingTimeLabel");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v160) = 1144750080;
    objc_msgSend(v157, "ic_constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v158, 1, 1, v159, 2, 1.0, 10.0, v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "addConstraint:", v161);

    v162 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController view](v5, "view");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController skipForwardButton](v5, "skipForwardButton");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v165) = 1140457472;
    objc_msgSend(v162, "ic_constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v163, 14, 0, v164, 2, 1.0, 0.0, v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController setSkipForwardRightConstraint:](v5, "setSkipForwardRightConstraint:", v166);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController skipForwardRightConstraint](v5, "skipForwardRightConstraint");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "addConstraint:", v168);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController skipForwardButton](v5, "skipForwardButton");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController view](v5, "view");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v171, 10, 0, v172, 10, 1.0, 0.0);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "addConstraint:", v173);

    v174 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[ICAudioPlaybackBarViewController setCreationDateLabel:](v5, "setCreationDateLabel:", v174);

    -[ICAudioPlaybackBarViewController creationDateLabel](v5, "creationDateLabel");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorSecondaryLabelColor");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController creationDateLabel](v5, "creationDateLabel");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "setTextColor:", v176);

    objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForTextStyle:maxContentSizeCategory:", v195, v67);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController creationDateLabel](v5, "creationDateLabel");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "setFont:", v178);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController creationDateLabel](v5, "creationDateLabel");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController scrubberView](v5, "scrubberView");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "insertSubview:belowSubview:", v181, v182);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController creationDateLabel](v5, "creationDateLabel");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController scrubberView](v5, "scrubberView");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v185, 9, 0, v186, 9, 1.0, 0.0);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addConstraint:", v187);

    -[ICAudioPlaybackBarViewController view](v5, "view");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = (void *)MEMORY[0x1E0CB3718];
    -[ICAudioPlaybackBarViewController creationDateLabel](v5, "creationDateLabel");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController scrubberView](v5, "scrubberView");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v190, 3, 0, v191, 4, 1.0, 1.0);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "addConstraint:", v192);

    -[ICAudioPlaybackBarViewController updateLayout](v5, "updateLayout");
  }
  return v5;
}

void __59__ICAudioPlaybackBarViewController_initWithNibName_bundle___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D64B10], "sharedAudioController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "skipBackByInterval:completion:", 0, 15.0);

}

void __59__ICAudioPlaybackBarViewController_initWithNibName_bundle___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D64B10], "sharedAudioController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "skipAheadByInterval:completion:", 0, 15.0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)ICAudioPlaybackBarViewController;
  -[ICAudioPlaybackBarViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    -[ICAudioPlaybackBarViewController playPauseView](self, "playPauseView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackBarViewController playPauseView](self, "playPauseView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "ic_applyRoundedCornersWithRadius:", CGRectGetMidX(v6));

    -[ICAudioPlaybackBarViewController updateLayout](self, "updateLayout");
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICAudioPlaybackBarViewController;
  -[ICAudioBarViewController dealloc](&v4, sel_dealloc);
}

- (void)setAudioAttachment:(id)a3
{
  ICAttachment *v5;
  ICAttachment **p_audioAttachment;
  ICAttachment *audioAttachment;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  ICAttachment *v20;

  v5 = (ICAttachment *)a3;
  p_audioAttachment = &self->_audioAttachment;
  audioAttachment = self->_audioAttachment;
  if (audioAttachment != v5)
  {
    v20 = v5;
    v8 = (_QWORD *)MEMORY[0x1E0D648D0];
    v9 = (_QWORD *)MEMORY[0x1E0D636D8];
    if (audioAttachment)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:name:object:", self, *v8, *p_audioAttachment);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObserver:name:object:", self, *v9, *p_audioAttachment);

    }
    objc_storeStrong((id *)&self->_audioAttachment, a3);
    if (*p_audioAttachment)
    {
      -[ICAttachment attachmentModel](*p_audioAttachment, "attachmentModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_audioPlaybackTimeChangedNotification_, *v8, *p_audioAttachment);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_attachmentWillBeDeletedNotification_, *v9, *p_audioAttachment);

      v15 = objc_msgSend(v12, "recordedInNotes");
      if (v15)
      {
        objc_msgSend(v12, "creationDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ic_shortFormattedDate");
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = &stru_1EA7E9860;
      }
      -[ICAudioPlaybackBarViewController creationDateLabel](self, "creationDateLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v16);

      if (v15)
      {

      }
    }
    -[ICAudioPlaybackBarViewController playPauseView](self, "playPauseView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAudioAttachment:", v20);

    -[ICAudioPlaybackBarViewController scrubberView](self, "scrubberView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAudioAttachment:", v20);

    v5 = v20;
  }

}

- (void)scrubberValueChangedAction:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  float v7;
  void *v8;
  void *v9;
  id v10;
  float v11;
  float v12;
  void *v13;
  id v14;

  v4 = (objc_class *)MEMORY[0x1E0D64CA0];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "value");
  v8 = (void *)objc_msgSend(v6, "initWithSeconds:", v7);
  -[ICAudioPlaybackBarViewController leadingTimeLabel](self, "leadingTimeLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMediaTimeValue:", v8);

  v10 = objc_alloc(MEMORY[0x1E0D64CA0]);
  objc_msgSend(v5, "value");
  v12 = v11;

  v14 = (id)objc_msgSend(v10, "initWithSeconds:", v12);
  -[ICAudioPlaybackBarViewController trailingTimeLabel](self, "trailingTimeLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMediaTimeValue:", v14);

}

- (void)done:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = (void *)MEMORY[0x1E0D64B10];
  v5 = a3;
  objc_msgSend(v4, "sharedAudioController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stop");

  v7.receiver = self;
  v7.super_class = (Class)ICAudioPlaybackBarViewController;
  -[ICAudioBarViewController done:](&v7, sel_done_, v5);

}

- (void)audioPlaybackTimeChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CMTime time;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlaybackBarViewController audioAttachment](self, "audioAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D648B0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAudioPlaybackBarViewController traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "horizontalSizeClass");

    v11 = objc_alloc(MEMORY[0x1E0D64CA0]);
    objc_msgSend(v8, "doubleValue");
    v12 = (void *)objc_msgSend(v11, "initWithSeconds:");
    if (v10 == 2)
    {
      -[ICAudioPlaybackBarViewController leadingTimeLabel](self, "leadingTimeLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setMediaTimeValue:", v12);

      v14 = objc_alloc(MEMORY[0x1E0D64CA0]);
      objc_msgSend(v8, "doubleValue");
      v16 = v15;
      objc_msgSend(MEMORY[0x1E0D64B10], "sharedAudioController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentPlayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
        objc_msgSend(v18, "duration");
      else
        memset(&time, 0, sizeof(time));
      v21 = (void *)objc_msgSend(v14, "initWithSeconds:", v16 - CMTimeGetSeconds(&time));
      -[ICAudioPlaybackBarViewController trailingTimeLabel](self, "trailingTimeLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setMediaTimeValue:", v21);

    }
    else
    {
      -[ICAudioPlaybackBarViewController trailingTimeLabel](self, "trailingTimeLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setMediaTimeValue:", v12);

    }
  }

}

- (void)attachmentWillBeDeletedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlaybackBarViewController audioAttachment](self, "audioAttachment");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6 == v4)
  {
    -[ICAudioPlaybackBarViewController done:](self, "done:", 0);
    v5 = v6;
  }

}

- (void)noteWillBeDeletedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioBarViewController note](self, "note");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6 == v4)
  {
    -[ICAudioBarViewController setNote:](self, "setNote:", 0);
    -[ICAudioPlaybackBarViewController setAudioAttachment:](self, "setAudioAttachment:", 0);
    -[ICAudioPlaybackBarViewController done:](self, "done:", 0);
    v5 = v6;
  }

}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[ICAudioPlaybackBarViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v3, sel_updateLayout);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  height = a3.height;
  width = a3.width;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__ICAudioPlaybackBarViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1EA7DD1E8;
  v9[4] = self;
  v7 = a4;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);
  v8.receiver = self;
  v8.super_class = (Class)ICAudioPlaybackBarViewController;
  -[ICAudioPlaybackBarViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __87__ICAudioPlaybackBarViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLayout");
}

- (void)updateLayout
{
  _BOOL8 v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v3 = -[ICAudioPlaybackBarViewController isRegularHorizontalLayout](self, "isRegularHorizontalLayout");
  v4 = objc_msgSend(MEMORY[0x1E0DC1290], "ic_isRTL");
  -[ICAudioPlaybackBarViewController leadingTimeLabel](self, "leadingTimeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3 ^ 1);

  -[ICAudioPlaybackBarViewController skipForwardButton](self, "skipForwardButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v3 ^ 1);

  -[ICAudioPlaybackBarViewController skipBackwardRightConstraint](self, "skipBackwardRightConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", v3);

  -[ICAudioPlaybackBarViewController scrubberLeftConstraint](self, "scrubberLeftConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 114.0;
  if (v3)
  {
    v10 = 160.0;
    v11 = 160.0;
  }
  else
  {
    v11 = 102.0;
  }
  objc_msgSend(v8, "setConstant:", v10);

  -[ICAudioPlaybackBarViewController scrubberRightConstraint](self, "scrubberRightConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v11);

  -[ICAudioPlaybackBarViewController skipBackwardLeftConstraint](self, "skipBackwardLeftConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v4)
  {
    v15 = 40.0;
    if (v3)
      v15 = 110.0;
    v16 = 84.0;
  }
  else
  {
    v15 = 32.0;
    v16 = 88.0;
    if (v3)
      v15 = 88.0;
  }
  if (v3)
    v17 = v16;
  else
    v17 = 0.0;
  objc_msgSend(v13, "setConstant:", v15);

  -[ICAudioPlaybackBarViewController skipForwardRightConstraint](self, "skipForwardRightConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", v17);

  -[ICAudioPlaybackBarViewController updateMediaTimeAccessibilityLabels](self, "updateMediaTimeAccessibilityLabels");
}

- (void)updateMediaTimeAccessibilityLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("elapsed"), &stru_1EA7E9860, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("remaining"), &stru_1EA7E9860, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAudioPlaybackBarViewController leadingTimeLabel](self, "leadingTimeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v9);

  if (-[ICAudioPlaybackBarViewController isRegularHorizontalLayout](self, "isRegularHorizontalLayout"))
    v7 = v5;
  else
    v7 = v9;
  -[ICAudioPlaybackBarViewController trailingTimeLabel](self, "trailingTimeLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v7);

}

- (BOOL)isRegularHorizontalLayout
{
  void *v3;
  char v4;
  CGRect v6;

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    -[ICAudioPlaybackBarViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v4 = CGRectGetWidth(v6) >= 416.0;
  }
  else
  {
    -[ICAudioPlaybackBarViewController traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "horizontalSizeClass") == 2)
      v4 = 1;
    else
      v4 = objc_msgSend(MEMORY[0x1E0D641E0], "isLargerCompactHorizontalWidthDevice");
  }

  return v4;
}

- (ICAttachment)audioAttachment
{
  return self->_audioAttachment;
}

- (ICAudioPlayPauseView)playPauseView
{
  return self->_playPauseView;
}

- (void)setPlayPauseView:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseView, a3);
}

- (UIButton)skipBackwardButton
{
  return self->_skipBackwardButton;
}

- (void)setSkipBackwardButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipBackwardButton, a3);
}

- (NSLayoutConstraint)skipBackwardLeftConstraint
{
  return self->_skipBackwardLeftConstraint;
}

- (void)setSkipBackwardLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_skipBackwardLeftConstraint, a3);
}

- (NSLayoutConstraint)skipBackwardRightConstraint
{
  return self->_skipBackwardRightConstraint;
}

- (void)setSkipBackwardRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_skipBackwardRightConstraint, a3);
}

- (UIButton)skipForwardButton
{
  return self->_skipForwardButton;
}

- (void)setSkipForwardButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipForwardButton, a3);
}

- (NSLayoutConstraint)skipForwardRightConstraint
{
  return self->_skipForwardRightConstraint;
}

- (void)setSkipForwardRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_skipForwardRightConstraint, a3);
}

- (ICAudioPlaybackScrubberView)scrubberView
{
  return self->_scrubberView;
}

- (void)setScrubberView:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberView, a3);
}

- (NSLayoutConstraint)scrubberLeftConstraint
{
  return self->_scrubberLeftConstraint;
}

- (void)setScrubberLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberLeftConstraint, a3);
}

- (NSLayoutConstraint)scrubberRightConstraint
{
  return self->_scrubberRightConstraint;
}

- (void)setScrubberRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberRightConstraint, a3);
}

- (ICMediaTimeLabel)leadingTimeLabel
{
  return self->_leadingTimeLabel;
}

- (void)setLeadingTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_leadingTimeLabel, a3);
}

- (ICMediaTimeLabel)trailingTimeLabel
{
  return self->_trailingTimeLabel;
}

- (void)setTrailingTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTimeLabel, a3);
}

- (NSLayoutConstraint)trailingTimeWidthConstraint
{
  return self->_trailingTimeWidthConstraint;
}

- (void)setTrailingTimeWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTimeWidthConstraint, a3);
}

- (UILabel)creationDateLabel
{
  return self->_creationDateLabel;
}

- (void)setCreationDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_creationDateLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDateLabel, 0);
  objc_storeStrong((id *)&self->_trailingTimeWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingTimeLabel, 0);
  objc_storeStrong((id *)&self->_leadingTimeLabel, 0);
  objc_storeStrong((id *)&self->_scrubberRightConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberLeftConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberView, 0);
  objc_storeStrong((id *)&self->_skipForwardRightConstraint, 0);
  objc_storeStrong((id *)&self->_skipForwardButton, 0);
  objc_storeStrong((id *)&self->_skipBackwardRightConstraint, 0);
  objc_storeStrong((id *)&self->_skipBackwardLeftConstraint, 0);
  objc_storeStrong((id *)&self->_skipBackwardButton, 0);
  objc_storeStrong((id *)&self->_playPauseView, 0);
  objc_storeStrong((id *)&self->_audioAttachment, 0);
}

@end
