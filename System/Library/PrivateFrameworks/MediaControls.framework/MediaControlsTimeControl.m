@implementation MediaControlsTimeControl

- (MediaControlsTimeControl)initWithFrame:(CGRect)a3
{
  MediaControlsTimeControl *v3;
  UIView *v4;
  UIView *elapsedTrack;
  UIView *v6;
  UIView *remainingTrack;
  UIView *v8;
  UIView *knobView;
  UILabel *v10;
  UILabel *elapsedTimeLabel;
  UILabel *v12;
  UILabel *remainingTimeLabel;
  UILabel *v14;
  UILabel *liveLabel;
  void *v16;
  void *v17;
  UIView *v18;
  UIView *liveBackground;
  CAGradientLayer *v20;
  CAGradientLayer *liveBackgroundMask;
  UILayoutGuide *v22;
  UILayoutGuide *trackLayoutGuide;
  AVTimeFormatter *v24;
  AVTimeFormatter *elapsedTimeFormatter;
  AVTimeFormatter *v26;
  AVTimeFormatter *remainingTimeFormatter;
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
  double v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSArray *defaultConstraints;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSArray *trackingConstraints;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSLayoutConstraint *knobViewXConstraint;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
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
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
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
  objc_super v176;
  _QWORD v177[6];
  _QWORD v178[24];
  _QWORD v179[2];
  _QWORD v180[4];

  v180[2] = *MEMORY[0x1E0C80C00];
  v176.receiver = self;
  v176.super_class = (Class)MediaControlsTimeControl;
  v3 = -[MediaControlsTimeControl initWithFrame:](&v176, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    elapsedTrack = v3->_elapsedTrack;
    v3->_elapsedTrack = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_elapsedTrack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v3->_elapsedTrack, "setUserInteractionEnabled:", 0);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    remainingTrack = v3->_remainingTrack;
    v3->_remainingTrack = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_remainingTrack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v3->_remainingTrack, "setUserInteractionEnabled:", 0);
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    knobView = v3->_knobView;
    v3->_knobView = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_knobView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v3->_knobView, "setUserInteractionEnabled:", 0);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    elapsedTimeLabel = v3->_elapsedTimeLabel;
    v3->_elapsedTimeLabel = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_elapsedTimeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    remainingTimeLabel = v3->_remainingTimeLabel;
    v3->_remainingTimeLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_remainingTimeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    liveLabel = v3->_liveLabel;
    v3->_liveLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_liveLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SCRUBBER_LIVE"), &stru_1E581FBA8, CFSTR("MediaControls"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_liveLabel, "setText:", v17);

    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    liveBackground = v3->_liveBackground;
    v3->_liveBackground = v18;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_liveBackground, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
    liveBackgroundMask = v3->_liveBackgroundMask;
    v3->_liveBackgroundMask = v20;

    v22 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    trackLayoutGuide = v3->_trackLayoutGuide;
    v3->_trackLayoutGuide = v22;

    v24 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x1E0C8B3A8]);
    elapsedTimeFormatter = v3->_elapsedTimeFormatter;
    v3->_elapsedTimeFormatter = v24;

    v26 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x1E0C8B3A8]);
    remainingTimeFormatter = v3->_remainingTimeFormatter;
    v3->_remainingTimeFormatter = v26;

    -[AVTimeFormatter setStyle:](v3->_elapsedTimeFormatter, "setStyle:", 1);
    -[AVTimeFormatter setStyle:](v3->_remainingTimeFormatter, "setStyle:", 2);
    -[MediaControlsTimeControl setSemanticContentAttribute:](v3, "setSemanticContentAttribute:", 1);
    -[MediaControlsTimeControl elapsedTrack](v3, "elapsedTrack");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl addSubview:](v3, "addSubview:", v28);

    -[MediaControlsTimeControl remainingTrack](v3, "remainingTrack");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl addSubview:](v3, "addSubview:", v29);

    -[MediaControlsTimeControl knobView](v3, "knobView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl addSubview:](v3, "addSubview:", v30);

    -[MediaControlsTimeControl elapsedTimeLabel](v3, "elapsedTimeLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl addSubview:](v3, "addSubview:", v31);

    -[MediaControlsTimeControl remainingTimeLabel](v3, "remainingTimeLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl addSubview:](v3, "addSubview:", v32);

    -[MediaControlsTimeControl liveLabel](v3, "liveLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl addSubview:](v3, "addSubview:", v33);

    -[MediaControlsTimeControl liveBackground](v3, "liveBackground");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl addSubview:](v3, "addSubview:", v34);

    -[MediaControlsTimeControl knobView](v3, "knobView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToConstant:", 7.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v175 = v37;
    LODWORD(v38) = 1148829696;
    objc_msgSend(v37, "setPriority:", v38);
    v180[0] = v37;
    -[MediaControlsTimeControl knobView](v3, "knobView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "heightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToConstant:", 7.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v180[1] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v180, 2);
    v42 = objc_claimAutoreleasedReturnValue();
    defaultConstraints = v3->_defaultConstraints;
    v3->_defaultConstraints = (NSArray *)v42;

    -[MediaControlsTimeControl knobView](v3, "knobView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "widthAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", 28.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v174 = v46;
    LODWORD(v47) = 1148829696;
    objc_msgSend(v46, "setPriority:", v47);
    v179[0] = v46;
    -[MediaControlsTimeControl knobView](v3, "knobView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "heightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToConstant:", 28.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v179[1] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v179, 2);
    v51 = objc_claimAutoreleasedReturnValue();
    trackingConstraints = v3->_trackingConstraints;
    v3->_trackingConstraints = (NSArray *)v51;

    -[MediaControlsTimeControl knobView](v3, "knobView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "centerXAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl leadingAnchor](v3, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v55);
    v56 = objc_claimAutoreleasedReturnValue();
    knobViewXConstraint = v3->_knobViewXConstraint;
    v3->_knobViewXConstraint = (NSLayoutConstraint *)v56;

    LODWORD(v58) = 1144750080;
    -[NSLayoutConstraint setPriority:](v3->_knobViewXConstraint, "setPriority:", v58);
    -[MediaControlsTimeControl liveLabel](v3, "liveLabel");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl leadingAnchor](v3, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintGreaterThanOrEqualToAnchor:constant:", v61, 20.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v173 = v62;
    LODWORD(v63) = 1148829696;
    objc_msgSend(v62, "setPriority:", v63);
    v135 = (void *)MEMORY[0x1E0CB3718];
    -[MediaControlsTimeControl liveLabel](v3, "liveLabel");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "centerYAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl centerYAnchor](v3, "centerYAnchor");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "constraintEqualToAnchor:", v170);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v178[0] = v169;
    -[MediaControlsTimeControl liveLabel](v3, "liveLabel");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "centerXAnchor");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl centerXAnchor](v3, "centerXAnchor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "constraintEqualToAnchor:", v166);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v178[1] = v165;
    v178[2] = v62;
    -[MediaControlsTimeControl liveLabel](v3, "liveLabel");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "trailingAnchor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl trailingAnchor](v3, "trailingAnchor");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "constraintLessThanOrEqualToAnchor:constant:", v162, 20.0);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v178[3] = v161;
    -[MediaControlsTimeControl liveBackground](v3, "liveBackground");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "centerYAnchor");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl centerYAnchor](v3, "centerYAnchor");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "constraintEqualToAnchor:", v158);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v178[4] = v157;
    -[MediaControlsTimeControl liveBackground](v3, "liveBackground");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "leadingAnchor");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl leadingAnchor](v3, "leadingAnchor");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "constraintEqualToAnchor:", v154);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v178[5] = v153;
    -[MediaControlsTimeControl liveBackground](v3, "liveBackground");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "trailingAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl trailingAnchor](v3, "trailingAnchor");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "constraintEqualToAnchor:", v150);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v178[6] = v149;
    -[MediaControlsTimeControl liveBackground](v3, "liveBackground");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "heightAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "constraintEqualToConstant:", 3.0);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v178[7] = v146;
    -[MediaControlsTimeControl elapsedTrack](v3, "elapsedTrack");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "leadingAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl leadingAnchor](v3, "leadingAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "constraintEqualToAnchor:", v143);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v178[8] = v142;
    -[MediaControlsTimeControl elapsedTrack](v3, "elapsedTrack");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "trailingAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl knobView](v3, "knobView");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "centerXAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "constraintEqualToAnchor:", v138);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v178[9] = v137;
    -[MediaControlsTimeControl elapsedTrack](v3, "elapsedTrack");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "centerYAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl centerYAnchor](v3, "centerYAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "constraintEqualToAnchor:", v133);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v178[10] = v132;
    -[MediaControlsTimeControl elapsedTrack](v3, "elapsedTrack");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "heightAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "constraintEqualToConstant:", 3.0);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v178[11] = v129;
    -[MediaControlsTimeControl remainingTrack](v3, "remainingTrack");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "leadingAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl knobView](v3, "knobView");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "centerXAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "constraintEqualToAnchor:", v125);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v178[12] = v124;
    -[MediaControlsTimeControl remainingTrack](v3, "remainingTrack");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "trailingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl trailingAnchor](v3, "trailingAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "constraintEqualToAnchor:", v121);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v178[13] = v120;
    -[MediaControlsTimeControl remainingTrack](v3, "remainingTrack");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "centerYAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl centerYAnchor](v3, "centerYAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:", v117);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v178[14] = v116;
    -[MediaControlsTimeControl remainingTrack](v3, "remainingTrack");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "heightAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToConstant:", 3.0);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v178[15] = v113;
    v178[16] = v3->_knobViewXConstraint;
    -[MediaControlsTimeControl knobView](v3, "knobView");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "centerYAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl centerYAnchor](v3, "centerYAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:", v110);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v178[17] = v109;
    -[MediaControlsTimeControl knobView](v3, "knobView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "leadingAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl elapsedTrack](v3, "elapsedTrack");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "leadingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintGreaterThanOrEqualToAnchor:", v105);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v178[18] = v104;
    -[MediaControlsTimeControl knobView](v3, "knobView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "trailingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl remainingTrack](v3, "remainingTrack");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "trailingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintLessThanOrEqualToAnchor:", v100);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v178[19] = v99;
    -[MediaControlsTimeControl elapsedTimeLabel](v3, "elapsedTimeLabel");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "leadingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl leadingAnchor](v3, "leadingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v96);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v178[20] = v95;
    -[MediaControlsTimeControl elapsedTimeLabel](v3, "elapsedTimeLabel");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "bottomAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl bottomAnchor](v3, "bottomAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:constant:", v92, -3.5);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v178[21] = v91;
    -[MediaControlsTimeControl remainingTimeLabel](v3, "remainingTimeLabel");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl trailingAnchor](v3, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v178[22] = v66;
    -[MediaControlsTimeControl remainingTimeLabel](v3, "remainingTimeLabel");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl bottomAnchor](v3, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, -3.5);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v178[23] = v70;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 24);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "arrayByAddingObjectsFromArray:", v3->_defaultConstraints);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "activateConstraints:", v72);

    objc_msgSend(MEMORY[0x1E0DC1350], "monospacedDigitSystemFontOfSize:weight:", 13.0, *MEMORY[0x1E0DC1438]);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl liveLabel](v3, "liveLabel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setFont:", v73);

    -[MediaControlsTimeControl elapsedTimeLabel](v3, "elapsedTimeLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setFont:", v73);

    -[MediaControlsTimeControl remainingTimeLabel](v3, "remainingTimeLabel");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setFont:", v73);

    -[MediaControlsTimeControl elapsedTrack](v3, "elapsedTrack");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "layer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setMaskedCorners:", 5);

    -[MediaControlsTimeControl remainingTrack](v3, "remainingTrack");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "layer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setMaskedCorners:", 10);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v177[0] = objc_msgSend(v81, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v177[1] = objc_msgSend(v82, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v177[2] = objc_msgSend(v83, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v177[3] = objc_msgSend(v84, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v177[4] = objc_msgSend(v85, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v86 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v177[5] = objc_msgSend(v86, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 6);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl liveBackgroundMask](v3, "liveBackgroundMask");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setColors:", v87);

    v3->_currentlyTracking = 0;
    v3->_currentTimeInTrack = 0.0;
    -[MediaControlsTimeControl setEnabled:](v3, "setEnabled:", 0);
    -[MediaControlsTimeControl setEmpty:](v3, "setEmpty:", 1);
    -[MediaControlsTimeControl _updateStyle](v3, "_updateStyle");

  }
  return v3;
}

- (void)viewDidMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsTimeControl;
  -[MediaControlsTimeControl viewDidMoveToSuperview](&v3, sel_viewDidMoveToSuperview);
  -[MediaControlsTimeControl _updateTimeControl](self, "_updateTimeControl");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  char v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MediaControlsTimeControl;
  -[MediaControlsTimeControl layoutSubviews](&v24, sel_layoutSubviews);
  -[MediaControlsTimeControl knobView](self, "knobView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 * 0.5;
  -[MediaControlsTimeControl knobView](self, "knobView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v5);

  -[MediaControlsTimeControl elapsedTrack](self, "elapsedTrack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9 * 0.5;
  -[MediaControlsTimeControl elapsedTrack](self, "elapsedTrack");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v10);

  -[MediaControlsTimeControl remainingTrack](self, "remainingTrack");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14 * 0.5;
  -[MediaControlsTimeControl remainingTrack](self, "remainingTrack");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", v15);

  -[MediaControlsTimeControl liveBackground](self, "liveBackground");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19 * 0.5;
  -[MediaControlsTimeControl liveBackground](self, "liveBackground");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", v20);

  -[MediaControlsTimeControl updateSliderConstraint](self, "updateSliderConstraint");
  -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
  if (v23)
    -[MediaControlsTimeControl updateBackgroundMask](self, "updateBackgroundMask");
}

- (void)tintColorDidChange
{
  void *v3;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MediaControlsTimeControl;
  -[MediaControlsTimeControl tintColorDidChange](&v19, sel_tintColorDidChange);
  if (!self->_visualStylingProvider)
  {
    -[MediaControlsTimeControl tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl knobView](self, "knobView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v3);

    -[MediaControlsTimeControl tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl elapsedTrack](self, "elapsedTrack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    -[MediaControlsTimeControl tintColor](self, "tintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl liveLabel](self, "liveLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    -[MediaControlsTimeControl tintColor](self, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secondaryColorForInterfaceStyle:", objc_msgSend(v10, "userInterfaceStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[MediaControlsTimeControl elapsedTimeLabel](self, "elapsedTimeLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v11);

    -[MediaControlsTimeControl remainingTimeLabel](self, "remainingTimeLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v11);

    -[MediaControlsTimeControl tintColor](self, "tintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tertiaryColorForInterfaceStyle:", objc_msgSend(v15, "userInterfaceStyle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[MediaControlsTimeControl remainingTrack](self, "remainingTrack");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

    -[MediaControlsTimeControl liveBackground](self, "liveBackground");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v16);

  }
}

- (void)setVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v5;
  id *p_visualStylingProvider;
  MTVisualStylingProvider *visualStylingProvider;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  MTVisualStylingProvider *v32;

  v5 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = (id *)&self->_visualStylingProvider;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v32 = v5;
    -[MTVisualStylingProvider _removeObserver:](visualStylingProvider, "_removeObserver:", self);
    v8 = *p_visualStylingProvider;
    -[MediaControlsTimeControl elapsedTrack](self, "elapsedTrack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopAutomaticallyUpdatingView:", v9);

    v10 = *p_visualStylingProvider;
    -[MediaControlsTimeControl remainingTrack](self, "remainingTrack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopAutomaticallyUpdatingView:", v11);

    v12 = *p_visualStylingProvider;
    -[MediaControlsTimeControl elapsedTimeLabel](self, "elapsedTimeLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopAutomaticallyUpdatingView:", v13);

    v14 = *p_visualStylingProvider;
    -[MediaControlsTimeControl remainingTimeLabel](self, "remainingTimeLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stopAutomaticallyUpdatingView:", v15);

    v16 = *p_visualStylingProvider;
    -[MediaControlsTimeControl liveLabel](self, "liveLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stopAutomaticallyUpdatingView:", v17);

    v18 = *p_visualStylingProvider;
    -[MediaControlsTimeControl liveBackground](self, "liveBackground");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stopAutomaticallyUpdatingView:", v19);

    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    objc_msgSend(*p_visualStylingProvider, "_addObserver:", self);
    v20 = *p_visualStylingProvider;
    -[MediaControlsTimeControl elapsedTrack](self, "elapsedTrack");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "automaticallyUpdateView:withStyle:", v21, 0);

    v22 = *p_visualStylingProvider;
    -[MediaControlsTimeControl remainingTrack](self, "remainingTrack");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "automaticallyUpdateView:withStyle:", v23, 1);

    v24 = *p_visualStylingProvider;
    -[MediaControlsTimeControl elapsedTimeLabel](self, "elapsedTimeLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "automaticallyUpdateView:withStyle:", v25, 1);

    v26 = *p_visualStylingProvider;
    -[MediaControlsTimeControl remainingTimeLabel](self, "remainingTimeLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "automaticallyUpdateView:withStyle:", v27, 1);

    v28 = *p_visualStylingProvider;
    -[MediaControlsTimeControl liveLabel](self, "liveLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "automaticallyUpdateView:withStyle:", v29, 0);

    v30 = *p_visualStylingProvider;
    -[MediaControlsTimeControl liveBackground](self, "liveBackground");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "automaticallyUpdateView:withStyle:", v31, 1);

    -[MediaControlsTimeControl providedStylesDidChangeForProvider:](self, "providedStylesDidChangeForProvider:", *p_visualStylingProvider);
    v5 = v32;
  }

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 54.0;
  result.height = v3;
  return result;
}

- (void)setDurationSnapshot:(id *)a3
{
  $C569515C0D300436D1407EA97F52B47A *p_durationSnapshot;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  double v8;
  double duration;

  p_durationSnapshot = &self->_durationSnapshot;
  v6 = *(_OWORD *)&a3->var2;
  v5 = *(_OWORD *)&a3->var4;
  v7 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_durationSnapshot.isLiveContent = *(_QWORD *)&a3->var7;
  *(_OWORD *)&self->_durationSnapshot.endTime = v6;
  *(_OWORD *)&self->_durationSnapshot.elapsedDuration = v5;
  *(_OWORD *)&self->_durationSnapshot.snapshotTime = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  duration = p_durationSnapshot->elapsedDuration + (v8 - p_durationSnapshot->snapshotTime) * p_durationSnapshot->rate;
  if (duration >= p_durationSnapshot->duration)
    duration = p_durationSnapshot->duration;
  self->_currentTimeInTrack = fmax(duration, 0.0);
  -[MediaControlsTimeControl _updateSliderPosition](self, "_updateSliderPosition");
  -[MediaControlsTimeControl _updateStyle](self, "_updateStyle");
  -[MediaControlsTimeControl _updateLabels:withRemainingDuration:](self, "_updateLabels:withRemainingDuration:", self->_currentTimeInTrack, p_durationSnapshot->duration - self->_currentTimeInTrack);
  -[MediaControlsTimeControl _updateDisplayLinkPause](self, "_updateDisplayLinkPause");
  self->_lastRecordedTime = self->_currentTimeInTrack;
  -[MediaControlsTimeControl setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL4 v14;
  _QWORD v16[5];
  CGPoint v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  objc_msgSend(a3, "locationInView:", self, a4);
  v6 = v5;
  v8 = v7;
  -[MediaControlsTimeControl knobView](self, "knobView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v19 = CGRectInset(v18, -30.0, -30.0);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;

  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v17.x = v6;
  v17.y = v8;
  v14 = CGRectContainsPoint(v20, v17);
  if (v14)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__MediaControlsTimeControl_beginTrackingWithTouch_withEvent___block_invoke;
    v16[3] = &unk_1E5818C88;
    v16[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v16, 0, 1.0, 0.0, 1.0, 300.0, 24.0, 0.0);
    self->_currentlyTracking = 1;
    -[MediaControlsTimeControl _updateDisplayLinkPause](self, "_updateDisplayLinkPause");
  }
  return v14;
}

uint64_t __61__MediaControlsTimeControl_beginTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _OWORD v17[3];
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  double v23;
  double v24;
  _QWORD v25[5];

  self->_currentlyTracking = 0;
  -[MediaControlsTimeControl _updateDisplayLinkPause](self, "_updateDisplayLinkPause", a3, a4);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __59__MediaControlsTimeControl_endTrackingWithTouch_withEvent___block_invoke;
  v25[3] = &unk_1E5818C88;
  v25[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v25, 0, 1.0, 0.0, 1.0, 300.0, 24.0, 0.0);
  -[MediaControlsTimeControl response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tracklist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playingItemIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MediaControlsTimeControl response](self, "response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tracklist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemAtIndexPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
  -[MediaControlsTimeControl sliderValue](self, "sliderValue");
  v13 = fmax(v24 * v12, 0.0);
  -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
  if (v13 >= v23)
    v13 = v23;
  objc_msgSend(v11, "seekCommand");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "changePositionToElapsedInterval:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4B358], "performRequest:completion:", v15, 0);
  v22 = 0;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
  *(double *)&v21 = v13;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)&v19 = v16;
  v18 = v22;
  v17[1] = v20;
  v17[2] = v21;
  v17[0] = v19;
  -[MediaControlsTimeControl setDurationSnapshot:](self, "setDurationSnapshot:", v17);

}

uint64_t __59__MediaControlsTimeControl_endTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472));
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "updateLabelAvoidance");
}

- (void)cancelTrackingWithEvent:(id)a3
{
  _QWORD v4[5];

  self->_currentlyTracking = 0;
  -[MediaControlsTimeControl _updateDisplayLinkPause](self, "_updateDisplayLinkPause", a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__MediaControlsTimeControl_cancelTrackingWithEvent___block_invoke;
  v4[3] = &unk_1E5818C88;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v4, 0, 1.0, 0.0, 1.0, 300.0, 24.0, 0.0);
}

uint64_t __52__MediaControlsTimeControl_cancelTrackingWithEvent___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472));
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "updateLabelAvoidance");
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;

  objc_msgSend(a3, "locationInView:", self, a4);
  v6 = v5;
  -[MediaControlsTimeControl bounds](self, "bounds");
  -[MediaControlsTimeControl setSliderValue:](self, "setSliderValue:", v6 / v7);
  -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
  -[MediaControlsTimeControl sliderValue](self, "sliderValue");
  v9 = v12 * v8;
  self->_currentTimeInTrack = v12 * v8;
  -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
  -[MediaControlsTimeControl _updateLabels:withRemainingDuration:](self, "_updateLabels:withRemainingDuration:", v9, v11 - self->_currentTimeInTrack);
  -[MediaControlsTimeControl updateLabelAvoidance](self, "updateLabelAvoidance");
  return 1;
}

- (void)_updateSliderPosition
{
  double v3;
  double currentTimeInTrack;
  double v5;
  double v6;

  v3 = 0.0;
  if (self->_currentTimeInTrack > 0.0)
  {
    -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
    if (v6 > 0.0)
    {
      currentTimeInTrack = self->_currentTimeInTrack;
      -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot", v6);
      v3 = currentTimeInTrack / v5;
    }
  }
  -[MediaControlsTimeControl setSliderValue:](self, "setSliderValue:", v3);
}

- (void)setSliderValue:(double)a3
{
  if (self->_sliderValue != a3)
  {
    self->_sliderValue = a3;
    -[MediaControlsTimeControl updateSliderConstraint](self, "updateSliderConstraint");
  }
}

- (void)updateSliderConstraint
{
  double v3;
  double v4;

  v3 = fmin(self->_sliderValue, 1.0);
  -[MediaControlsTimeControl bounds](self, "bounds");
  -[NSLayoutConstraint setConstant:](self->_knobViewXConstraint, "setConstant:", fmax(v3 * v4, 0.0));
}

- (void)_updateLabels:(id *)a3 withTargetTimestamp:(double)a4
{
  double var3;
  double v5;
  double v6;

  var3 = a3->var3;
  v5 = a3->var4 + (a4 - a3->var0) * a3->var5;
  if (v5 >= var3)
    v5 = a3->var3;
  v6 = fmax(v5, 0.0);
  -[MediaControlsTimeControl _updateLabels:withRemainingDuration:](self, "_updateLabels:withRemainingDuration:", v6, var3 - v6);
}

- (void)_updateLabels:(double)a3 withRemainingDuration:(double)a4
{
  void *v6;
  AVTimeFormatter *elapsedTimeFormatter;
  double v8;
  double v9;
  void *v10;
  void *v11;
  AVTimeFormatter *remainingTimeFormatter;
  double v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;

  if (a3 > 0.0 || a4 > 0.0)
  {
    elapsedTimeFormatter = self->_elapsedTimeFormatter;
    if (a3 >= 0.0)
      v8 = a3;
    else
      v8 = 0.0;
    -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
    v9 = v18;
    if (v8 < v18)
      v9 = v8;
    -[AVTimeFormatter stringFromSeconds:](elapsedTimeFormatter, "stringFromSeconds:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl elapsedTimeLabel](self, "elapsedTimeLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    remainingTimeFormatter = self->_remainingTimeFormatter;
    -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
    v13 = v17;
    if (v17 > a4)
      v13 = a4;
    if (v13 < 0.0)
      v13 = 0.0;
    -[AVTimeFormatter stringFromSeconds:](remainingTimeFormatter, "stringFromSeconds:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTimeControl remainingTimeLabel](self, "remainingTimeLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

  }
  else
  {
    -[MediaControlsTimeControl elapsedTimeLabel](self, "elapsedTimeLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", 0);

    -[MediaControlsTimeControl remainingTimeLabel](self, "remainingTimeLabel");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", 0);

  }
}

- (void)updateLabelAvoidance
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[17];

  -[MediaControlsTimeControl knobView](self, "knobView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MediaControlsTimeControl knobView](self, "knobView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTimeControl convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  v55 = v14;
  v56 = v13;
  v53 = v16;
  v54 = v15;

  -[MediaControlsTimeControl elapsedTimeLabel](self, "elapsedTimeLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[MediaControlsTimeControl elapsedTimeLabel](self, "elapsedTimeLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTimeControl convertRect:fromView:](self, "convertRect:fromView:", v26, v19, v21, v23, v25);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  -[MediaControlsTimeControl remainingTimeLabel](self, "remainingTimeLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bounds");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  -[MediaControlsTimeControl remainingTimeLabel](self, "remainingTimeLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTimeControl convertRect:fromView:](self, "convertRect:fromView:", v44, v37, v39, v41, v43);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;

  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __48__MediaControlsTimeControl_updateLabelAvoidance__block_invoke;
  v57[3] = &unk_1E5819900;
  v57[5] = v56;
  v57[6] = v55;
  v57[7] = v54;
  v57[8] = v53;
  v57[9] = v28;
  v57[10] = v30;
  v57[11] = v32;
  v57[12] = v34;
  v57[4] = self;
  v57[13] = v46;
  v57[14] = v48;
  v57[15] = v50;
  v57[16] = v52;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v57, 0, 0.5, 0.0, 1.0, 500.0, 30.0, 0.0);
}

void __48__MediaControlsTimeControl_updateLabelAvoidance__block_invoke(uint64_t a1)
{
  double MinX;
  CGFloat MaxX;
  __int128 *v4;
  void *v5;
  void *v6;
  CGAffineTransform *v7;
  __int128 v8;
  double v9;
  void *v10;
  void *v11;
  CGAffineTransform *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  _OWORD v19[3];
  CGAffineTransform v20;
  CGAffineTransform v21;

  MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
  MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 72));
  v4 = (__int128 *)MEMORY[0x1E0C9BAA8];
  if (MinX <= MaxX && objc_msgSend(*(id *)(a1 + 32), "isCurrentlyTracking"))
  {
    CGAffineTransformMakeTranslation(&v21, 0.0, 10.0);
    objc_msgSend(*(id *)(a1 + 32), "elapsedTimeLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v20 = v21;
    v7 = &v20;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "elapsedTimeLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v8 = v4[1];
    v19[0] = *v4;
    v19[1] = v8;
    v19[2] = v4[2];
    v7 = (CGAffineTransform *)v19;
  }
  objc_msgSend(v5, "setTransform:", v7);

  v9 = CGRectGetMaxX(*(CGRect *)(a1 + 40));
  if (v9 >= CGRectGetMinX(*(CGRect *)(a1 + 104)) && objc_msgSend(*(id *)(a1 + 32), "isCurrentlyTracking"))
  {
    CGAffineTransformMakeTranslation(&v18, 0.0, 10.0);
    objc_msgSend(*(id *)(a1 + 32), "remainingTimeLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v17 = v18;
    v12 = &v17;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "remainingTimeLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v13 = v4[1];
    v14 = *v4;
    v15 = v13;
    v16 = v4[2];
    v12 = (CGAffineTransform *)&v14;
  }
  objc_msgSend(v10, "setTransform:", v12, v14, v15, v16, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);

}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsTimeControl;
  -[MediaControlsTimeControl setEnabled:](&v4, sel_setEnabled_, a3);
  -[MediaControlsTimeControl _updateStyle](self, "_updateStyle");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat width;
  CGFloat height;
  BOOL v13;
  objc_super v15;
  CGPoint v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[MediaControlsTimeControl knobView](self, "knobView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v18 = CGRectInset(v17, -30.0, -30.0);
  v9 = v18.origin.x;
  v10 = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;

  v19.origin.x = v9;
  v19.origin.y = v10;
  v19.size.width = width;
  v19.size.height = height;
  v16.x = x;
  v16.y = y;
  if (CGRectContainsPoint(v19, v16))
  {
    v13 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MediaControlsTimeControl;
    v13 = -[MediaControlsTimeControl pointInside:withEvent:](&v15, sel_pointInside_withEvent_, v7, x, y);
  }

  return v13;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[MediaControlsTimeControl _updateStyle](self, "_updateStyle");
    -[MediaControlsTimeControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateStyle
{
  void *v2;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  char v22;

  -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
  if (v22)
  {
    -[MediaControlsTimeControl updateBackgroundMask](self, "updateBackgroundMask");
    v4 = 1;
  }
  else
  {
    v4 = -[MediaControlsTimeControl isEmpty](self, "isEmpty");
  }
  -[MediaControlsTimeControl responseItem](self, "responseItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedDurationString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SCRUBBER_LIVE"), &stru_1E581FBA8, CFSTR("MediaControls"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MediaControlsTimeControl liveLabel](self, "liveLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  if (!v6)
  {

  }
  v9 = v22 == 0;

  -[MediaControlsTimeControl liveLabel](self, "liveLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

  -[MediaControlsTimeControl liveBackground](self, "liveBackground");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v9);

  -[MediaControlsTimeControl elapsedTimeLabel](self, "elapsedTimeLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v4);

  -[MediaControlsTimeControl remainingTimeLabel](self, "remainingTimeLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", v4);

  -[MediaControlsTimeControl elapsedTrack](self, "elapsedTrack");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", v4);

  -[MediaControlsTimeControl remainingTrack](self, "remainingTrack");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", v22 != 0);

  if (-[MediaControlsTimeControl isEmpty](self, "isEmpty"))
    v16 = 15;
  else
    v16 = 10;
  -[MediaControlsTimeControl remainingTrack](self, "remainingTrack");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMaskedCorners:", v16);

  v19 = 0.0;
  if (!v4)
  {
    if (-[MediaControlsTimeControl isEnabled](self, "isEnabled"))
      v19 = 1.0;
    else
      v19 = 0.0;
  }
  -[MediaControlsTimeControl knobView](self, "knobView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAlpha:", v19);

  -[MediaControlsTimeControl knobView](self, "knobView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", v4);

}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3)
    self->_transitioning = a3;
}

- (void)setResponse:(id)a3
{
  MPCPlayerResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MPCPlayerResponse *v13;

  v5 = (MPCPlayerResponse *)a3;
  if (self->_response != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_response, a3);
    -[MPCPlayerResponse tracklist](v13, "tracklist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playingItemIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MPCPlayerResponse tracklist](v13, "tracklist");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "itemAtIndexPath:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[MediaControlsTimeControl setEmpty:](self, "setEmpty:", 0);
      -[MediaControlsTimeControl setResponseItem:](self, "setResponseItem:", v10);
    }
    else
    {
      -[MediaControlsTimeControl setEmpty:](self, "setEmpty:", 1);
      v10 = 0;
    }
    -[MediaControlsTimeControl _updateDisplayLinkPause](self, "_updateDisplayLinkPause");
    -[MediaControlsTimeControl _updateStyle](self, "_updateStyle");
    objc_msgSend(v10, "seekCommand");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "changePositionToElapsedInterval:", 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[MediaControlsTimeControl setEnabled:](self, "setEnabled:", v12 != 0);
    v5 = v13;
  }

}

- (void)setResponseItem:(id)a3
{
  id v5;
  _OWORD v6[3];
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v5 = a3;
  objc_storeStrong((id *)&self->_responseItem, a3);
  if (v5)
  {
    objc_msgSend(v5, "duration");
  }
  else
  {
    v11 = 0;
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
  }
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  v7 = v11;
  -[MediaControlsTimeControl setDurationSnapshot:](self, "setDurationSnapshot:", v6);

}

- (void)setEmpty:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_empty != a3)
  {
    v3 = a3;
    self->_empty = a3;
    if (a3)
      -[MediaControlsTimeControl setSliderValue:](self, "setSliderValue:", 0.0);
    -[MediaControlsTimeControl setEnabled:](self, "setEnabled:", v3);
    -[MediaControlsTimeControl _updateDisplayLinkPause](self, "_updateDisplayLinkPause");
    -[MediaControlsTimeControl _updateStyle](self, "_updateStyle");
    -[MediaControlsTimeControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTimeControl
{
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  double v8;
  double currentTimeInTrack;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  float v15;

  -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v14 + (v3 - v12) * v15;
  if (v4 >= v13)
    v4 = v13;
  self->_currentTimeInTrack = fmax(v4, 0.0);
  -[MediaControlsTimeControl _updateSliderPosition](self, "_updateSliderPosition");
  v5 = self->_currentTimeInTrack - self->_lastRecordedTime;
  if (v5 >= 0.0)
    v6 = self->_currentTimeInTrack - self->_lastRecordedTime;
  else
    v6 = -v5;
  -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
  v7 = v11;
  if (v11 < 0.0)
    v7 = -v11;
  if (v7 >= 1.0)
    v8 = 1.0 / v7;
  else
    v8 = 1.0;
  if (v6 >= v8)
  {
    currentTimeInTrack = self->_currentTimeInTrack;
    -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
    -[MediaControlsTimeControl _updateLabels:withRemainingDuration:](self, "_updateLabels:withRemainingDuration:", currentTimeInTrack, v10 - self->_currentTimeInTrack);
    self->_lastRecordedTime = self->_currentTimeInTrack;
  }
}

- (void)_updateDisplayLinkPause
{
  double v3;
  _BOOL8 v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  unsigned __int8 v9;
  float v10;
  char v11;
  float v12;
  uint8_t buf[4];
  _BOOL4 v14;
  __int16 v15;
  double v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = -[MediaControlsTimeControl isCurrentlyTracking](self, "isCurrentlyTracking")
    || (-[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot"), *(float *)&v3 = v12, v12 == 0.0)
    || (-[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot", v3), v11)
    || -[MediaControlsTimeControl isEmpty](self, "isEmpty");
  if (-[MediaControlsTimeControl style](self, "style", v3) == 3 && self->_debugPreviousDisplayLinkPaused != v4)
  {
    _MRLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v4;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "MediaControlsCoverSheet _updateDisplayLinkPaused paused: %{BOOL}u", buf, 8u);
    }

    _MRLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[MediaControlsTimeControl isCurrentlyTracking](self, "isCurrentlyTracking");
      -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
      -[MediaControlsTimeControl durationSnapshot](self, "durationSnapshot");
      v8 = -[MediaControlsTimeControl isEmpty](self, "isEmpty");
      *(_DWORD *)buf = 67109888;
      v14 = v7;
      v15 = 2048;
      v16 = v10;
      v17 = 1024;
      v18 = v9;
      v19 = 1024;
      v20 = v8;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "MediaControlsCoverSheet _updateDisplayLinkPaused self.isCurrentlyTracking: %{BOOL}u self.durationSnapshot.rate: %0.2f self.durationSnapshot.isLiveContent: %{BOOL}u self.isEmpty: %{BOOL}u", buf, 0x1Eu);
    }

    self->_debugPreviousDisplayLinkPaused = v4;
  }
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v4);
}

- (void)setTimeControlOnScreen:(BOOL)a3
{
  if (self->_timeControlOnScreen != a3)
  {
    self->_timeControlOnScreen = a3;
    if (a3)
      -[MediaControlsTimeControl createDisplayLinkIfNeeded](self, "createDisplayLinkIfNeeded");
    else
      -[MediaControlsTimeControl invalidateDisplayLinkIfNeeded](self, "invalidateDisplayLinkIfNeeded");
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPoint v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  objc_msgSend(a4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  -[MediaControlsTimeControl knobView](self, "knobView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v17 = CGRectInset(v16, -30.0, -30.0);
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;

  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v15.x = v6;
  v15.y = v8;
  return CGRectContainsPoint(v18, v15);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  MediaControlsTimeControl *v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  v8 = 1;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v4, "minimumNumberOfTouches") <= 1)
  {
    objc_msgSend(v4, "view");
    v5 = (MediaControlsTimeControl *)objc_claimAutoreleasedReturnValue();

    if (v5 != self)
    {
      objc_msgSend(v4, "translationInView:", self);
      if (fabs(v6) > fabs(v7))
        v8 = 0;
    }
  }

  return v8;
}

- (void)createDisplayLinkIfNeeded
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  void *v6;

  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkTick_);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 30);
    -[MediaControlsTimeControl _updateDisplayLinkPause](self, "_updateDisplayLinkPause");
  }
}

- (void)invalidateDisplayLinkIfNeeded
{
  CADisplayLink *displayLink;
  void *v4;
  CADisplayLink *v5;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink removeFromRunLoop:forMode:](displayLink, "removeFromRunLoop:forMode:", v4, *MEMORY[0x1E0C99860]);

    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    v5 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (void)updateBackgroundMask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double MinX;
  void *v20;
  double v21;
  void *v22;
  double MaxX;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[6];
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v34[5] = *MEMORY[0x1E0C80C00];
  -[MediaControlsTimeControl liveBackgroundMask](self, "liveBackgroundMask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTimeControl liveBackground](self, "liveBackground");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMask:", v3);

  -[MediaControlsTimeControl liveBackground](self, "liveBackground");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[MediaControlsTimeControl liveBackgroundMask](self, "liveBackgroundMask");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  -[MediaControlsTimeControl liveBackground](self, "liveBackground");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v17 = 20.0 / CGRectGetWidth(v35);

  -[MediaControlsTimeControl liveLabel](self, "liveLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  MinX = CGRectGetMinX(v36);
  -[MediaControlsTimeControl liveBackground](self, "liveBackground");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v21 = MinX / CGRectGetWidth(v37);

  -[MediaControlsTimeControl liveLabel](self, "liveLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  MaxX = CGRectGetMaxX(v38);
  -[MediaControlsTimeControl liveBackground](self, "liveBackground");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v25 = MaxX / CGRectGetWidth(v39);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21 - v17, &unk_1E5878208);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v28;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17 + v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTimeControl liveBackgroundMask](self, "liveBackgroundMask");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setLocations:", v30);

  -[MediaControlsTimeControl liveBackgroundMask](self, "liveBackgroundMask");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setStartPoint:", 0.0, 0.0);

  -[MediaControlsTimeControl liveBackgroundMask](self, "liveBackgroundMask");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setEndPoint:", 1.0, 0.0);

}

- (void)providedStylesDidChangeForProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "_visualStylingForStyle:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTimeControl knobView](self, "knobView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (int64_t)style
{
  return self->_style;
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (MPCPlayerResponseItem)responseItem
{
  return self->_responseItem;
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot
{
  __int128 v3;

  v3 = *(_OWORD *)&self[12].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[12].var0;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[12].var4;
  *(_QWORD *)&retstr->var7 = *(_QWORD *)&self[12].var7;
  return self;
}

- (BOOL)isTimeControlOnScreen
{
  return self->_timeControlOnScreen;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (UIView)elapsedTrack
{
  return self->_elapsedTrack;
}

- (void)setElapsedTrack:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTrack, a3);
}

- (UIView)remainingTrack
{
  return self->_remainingTrack;
}

- (void)setRemainingTrack:(id)a3
{
  objc_storeStrong((id *)&self->_remainingTrack, a3);
}

- (UIView)knobView
{
  return self->_knobView;
}

- (void)setKnobView:(id)a3
{
  objc_storeStrong((id *)&self->_knobView, a3);
}

- (UILabel)elapsedTimeLabel
{
  return self->_elapsedTimeLabel;
}

- (void)setElapsedTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimeLabel, a3);
}

- (UILabel)remainingTimeLabel
{
  return self->_remainingTimeLabel;
}

- (void)setRemainingTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_remainingTimeLabel, a3);
}

- (UILabel)liveLabel
{
  return self->_liveLabel;
}

- (void)setLiveLabel:(id)a3
{
  objc_storeStrong((id *)&self->_liveLabel, a3);
}

- (UIView)liveBackground
{
  return self->_liveBackground;
}

- (void)setLiveBackground:(id)a3
{
  objc_storeStrong((id *)&self->_liveBackground, a3);
}

- (CAGradientLayer)liveBackgroundMask
{
  return self->_liveBackgroundMask;
}

- (void)setLiveBackgroundMask:(id)a3
{
  objc_storeStrong((id *)&self->_liveBackgroundMask, a3);
}

- (UILayoutGuide)trackLayoutGuide
{
  return self->_trackLayoutGuide;
}

- (void)setTrackLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_trackLayoutGuide, a3);
}

- (double)sliderValue
{
  return self->_sliderValue;
}

- (BOOL)isCurrentlyTracking
{
  return self->_currentlyTracking;
}

- (void)setCurrentlyTracking:(BOOL)a3
{
  self->_currentlyTracking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackLayoutGuide, 0);
  objc_storeStrong((id *)&self->_liveBackgroundMask, 0);
  objc_storeStrong((id *)&self->_liveBackground, 0);
  objc_storeStrong((id *)&self->_liveLabel, 0);
  objc_storeStrong((id *)&self->_remainingTimeLabel, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabel, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
  objc_storeStrong((id *)&self->_remainingTrack, 0);
  objc_storeStrong((id *)&self->_elapsedTrack, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_responseItem, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_remainingTime, 0);
  objc_storeStrong((id *)&self->_elapsedTime, 0);
  objc_storeStrong((id *)&self->_remainingTimeFormatter, 0);
  objc_storeStrong((id *)&self->_elapsedTimeFormatter, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_knobViewXConstraint, 0);
  objc_storeStrong((id *)&self->_initialConstraints, 0);
  objc_storeStrong((id *)&self->_trackingConstraints, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
}

@end
