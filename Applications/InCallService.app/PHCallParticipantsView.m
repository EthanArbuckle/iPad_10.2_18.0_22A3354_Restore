@implementation PHCallParticipantsView

- (PHCallParticipantsView)initWithCallDisplayStyleManager:(id)a3
{
  id v5;
  PHCallParticipantsView *v6;
  PHCallParticipantsView *v7;
  CNKCallParticipantLabelDescriptorFactory *v8;
  CNKCallParticipantLabelDescriptorFactory *labelDescriptorFactory;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHCallParticipantsView;
  v6 = -[PHCallParticipantsView init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
    v8 = objc_opt_new(CNKCallParticipantLabelDescriptorFactory);
    labelDescriptorFactory = v7->_labelDescriptorFactory;
    v7->_labelDescriptorFactory = v8;

    v10 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v7, "showSendButtonGestureRecognizer:");
    objc_msgSend(v10, "setNumberOfTapsRequired:", 4);
    -[PHCallParticipantsView addGestureRecognizer:](v7, "addGestureRecognizer:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, "_metadataCacheDidFinishUpdating:", TUMetadataCacheDidFinishUpdatingNotification, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, "_isEmergencyCallChanged:", TUCallCenterIsEmergencyChangedNotification, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, "_lockScreenStatusChanged:", CFSTR("PHLockScreenStatusChangedNotification"), 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHCallParticipantsView;
  -[PHCallParticipantsView dealloc](&v4, "dealloc");
}

- (double)multipleCallLabelBaselineOffset
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle");

  if (v3 == (id)3)
    return 60.0;
  if (qword_1002DC6F8 != -1)
    dispatch_once(&qword_1002DC6F8, &stru_1002852E8);
  return *(double *)&qword_1002DC6F0;
}

- (void)updateParticipantsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *nameOverrideLabel;
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
  id v32;
  NSObject *v33;
  void *v34;
  PHSingleCallParticipantLabelView *v35;
  void *v36;
  PHSingleCallParticipantLabelView *v37;
  PHSingleCallParticipantLabelView *singleCallLabelView;
  id v39;
  NSObject *v40;
  PHSingleCallParticipantLabelView *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  PHSingleCallParticipantLabelView *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  PHSingleCallParticipantLabelView *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  PHSingleCallParticipantLabelView *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  PHMultipleCallParticipantLabelView *v76;
  void *v77;
  PHMultipleCallParticipantLabelView *v78;
  PHMultipleCallParticipantLabelView *bottomMultipleCallLabelView;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;
  PHSingleCallParticipantLabelView *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  PHMultipleCallParticipantLabelView *v113;
  void *v114;
  PHMultipleCallParticipantLabelView *v115;
  PHMultipleCallParticipantLabelView *topMultipleCallLabelView;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  double v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  id v147;
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
  id v159;
  id v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  _QWORD v166[4];
  id v167;
  id v168;
  _QWORD v169[4];
  id v170;
  id v171;
  PHCallParticipantsView *v172;
  _QWORD v173[4];
  id v174;
  id v175;
  id v176;
  _QWORD v177[4];
  id v178;
  id v179;
  id v180;
  PHCallParticipantsView *v181;
  _QWORD v182[3];
  _QWORD v183[2];
  _QWORD v184[2];
  _QWORD v185[2];
  _QWORD v186[2];
  uint8_t buf[4];
  PHSingleCallParticipantLabelView *v188;
  _QWORD v189[4];

  v3 = a3;
  if (-[PHCallParticipantsView shouldIgnoreUpdates](self, "shouldIgnoreUpdates"))
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring request to update participants because updates to the call participants view are disabled", buf, 2u);
    }

    return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v8 = objc_msgSend(v7, "numberOfParticipantsForParticipantsView:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "overrideStringForParticipantsView:", self));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
    objc_msgSend(v11, "removeFromSuperview");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView topMultipleCallLabelView](self, "topMultipleCallLabelView"));
    objc_msgSend(v12, "removeFromSuperview");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView bottomMultipleCallLabelView](self, "bottomMultipleCallLabelView"));
    objc_msgSend(v13, "removeFromSuperview");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "posterNameViewModel"));
    objc_msgSend(v15, "updateStatus:", &stru_10028DC20);

    -[PHCallParticipantsView setSingleCallLabelView:](self, "setSingleCallLabelView:", 0);
    -[PHCallParticipantsView setTopMultipleCallLabelView:](self, "setTopMultipleCallLabelView:", 0);
    -[PHCallParticipantsView setBottomMultipleCallLabelView:](self, "setBottomMultipleCallLabelView:", 0);
    -[PHCallParticipantsView setShouldShowSingleDurationLabel:](self, "setShouldShowSingleDurationLabel:", 0);
    if (!self->_nameOverrideLabel)
    {
      v16 = (UILabel *)objc_alloc_init((Class)UILabel);
      nameOverrideLabel = self->_nameOverrideLabel;
      self->_nameOverrideLabel = v16;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_nameOverrideLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView callDisplayStyleManager](self, "callDisplayStyleManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallParticipantLabelFontForCallDisplayStyle:", objc_msgSend(v18, "callDisplayStyle")));
      -[UILabel setFont:](self->_nameOverrideLabel, "setFont:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
      -[UILabel setTextColor:](self->_nameOverrideLabel, "setTextColor:", v20);

      -[UILabel setTextAlignment:](self->_nameOverrideLabel, "setTextAlignment:", 1);
      -[UILabel setLineBreakMode:](self->_nameOverrideLabel, "setLineBreakMode:", 3);
      -[UILabel setAdjustsFontSizeToFitWidth:](self->_nameOverrideLabel, "setAdjustsFontSizeToFitWidth:", 1);
      -[UILabel setMinimumScaleFactor:](self->_nameOverrideLabel, "setMinimumScaleFactor:", 0.699999988);
      -[PHCallParticipantsView addSubview:](self, "addSubview:", self->_nameOverrideLabel);
      v163 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_nameOverrideLabel, "leadingAnchor"));
      v161 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView leadingAnchor](self, "leadingAnchor"));
      v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "constraintEqualToAnchor:constant:", v161, 24.0));
      v189[0] = v158;
      v156 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_nameOverrideLabel, "trailingAnchor"));
      v154 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView trailingAnchor](self, "trailingAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "constraintEqualToAnchor:constant:", v154, -24.0));
      v189[1] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_nameOverrideLabel, "centerYAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView centerYAnchor](self, "centerYAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
      v189[2] = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_nameOverrideLabel, "bottomAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView bottomAnchor](self, "bottomAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
      v189[3] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v189, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "overrideStringForParticipantsView:", self));
    -[UILabel setText:](self->_nameOverrideLabel, "setText:", v30);

    goto LABEL_9;
  }
  if (v8 == (id)2)
  {
    v65 = sub_1000C5588();
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Configuring the call participants view for multiple participants", buf, 2u);
    }

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView callDisplayStyleManager](self, "callDisplayStyleManager"));
    v68 = objc_msgSend(v67, "callDisplayStyle");

    if (!v68)
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "delegate"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "currentInCallScene"));
      objc_msgSend(v71, "requestTransitionToPresentationMode:shouldDismissCMASAlerts:", 2, 0);

    }
    v72 = objc_alloc_init((Class)UILayoutGuide);
    -[PHCallParticipantsView addLayoutGuide:](self, "addLayoutGuide:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "centerYAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView centerYAnchor](self, "centerYAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v74));
    objc_msgSend(v75, "setActive:", 1);

    if (!self->_bottomMultipleCallLabelView)
    {
      v164 = v72;
      v76 = [PHMultipleCallParticipantLabelView alloc];
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView callDisplayStyleManager](self, "callDisplayStyleManager"));
      v78 = -[PHMultipleCallParticipantLabelView initWithCallDisplayStyleManager:](v76, "initWithCallDisplayStyleManager:", v77);
      bottomMultipleCallLabelView = self->_bottomMultipleCallLabelView;
      self->_bottomMultipleCallLabelView = v78;

      -[PHMultipleCallParticipantLabelView setAccessibilityIdentifier:](self->_bottomMultipleCallLabelView, "setAccessibilityIdentifier:", CFSTR("PHMultipleCallParticipantLabelView_Bottom"));
      -[PHMultipleCallParticipantLabelView setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomMultipleCallLabelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PHMultipleCallParticipantLabelView setOverrideUserInterfaceStyle:](self->_bottomMultipleCallLabelView, "setOverrideUserInterfaceStyle:", 2);
      -[PHAbstractCallParticipantLabelView setDelegate:](self->_bottomMultipleCallLabelView, "setDelegate:", self);
      -[PHCallParticipantsView addSubview:](self, "addSubview:", self->_bottomMultipleCallLabelView);
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView leadingAnchor](self->_bottomMultipleCallLabelView, "leadingAnchor"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView leadingAnchor](self, "leadingAnchor"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v81));
      v186[0] = v82;
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView trailingAnchor](self->_bottomMultipleCallLabelView, "trailingAnchor"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView trailingAnchor](self, "trailingAnchor"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v84));
      v186[1] = v85;
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v186, 2));
      v159 = objc_msgSend(v86, "mutableCopy");

      v87 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView callDisplayStyleManager](self, "callDisplayStyleManager"));
      v88 = objc_msgSend(v87, "callDisplayStyle");

      if (v88 == (id)1)
      {
        v72 = v164;
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "bottomAnchor"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self->_bottomMultipleCallLabelView, "participantMarqueeLabel"));
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "bottomAnchor"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v91));
        objc_msgSend(v159, "addObject:", v92);
      }
      else
      {
        v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self->_bottomMultipleCallLabelView, "participantMarqueeLabel"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "firstBaselineAnchor"));
        v91 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView bottomAnchor](self, "bottomAnchor"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintLessThanOrEqualToAnchor:", v91));
        v185[0] = v92;
        v108 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView bottomAnchor](self->_bottomMultipleCallLabelView, "bottomAnchor"));
        v109 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView bottomAnchor](self, "bottomAnchor"));
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintLessThanOrEqualToAnchor:", v109));
        v185[1] = v110;
        v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v185, 2));
        objc_msgSend(v159, "addObjectsFromArray:", v111);

        v72 = v164;
      }

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v159);
      v112 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "participantLabelWasTapped:");
      -[PHMultipleCallParticipantLabelView addGestureRecognizer:](self->_bottomMultipleCallLabelView, "addGestureRecognizer:", v112);

    }
    if (!self->_topMultipleCallLabelView)
    {
      v165 = v72;
      v113 = [PHMultipleCallParticipantLabelView alloc];
      v114 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView callDisplayStyleManager](self, "callDisplayStyleManager"));
      v115 = -[PHMultipleCallParticipantLabelView initWithCallDisplayStyleManager:](v113, "initWithCallDisplayStyleManager:", v114);
      topMultipleCallLabelView = self->_topMultipleCallLabelView;
      self->_topMultipleCallLabelView = v115;

      -[PHMultipleCallParticipantLabelView setAccessibilityIdentifier:](self->_topMultipleCallLabelView, "setAccessibilityIdentifier:", CFSTR("PHMultipleCallParticipantLabelView_Top"));
      -[PHMultipleCallParticipantLabelView setTranslatesAutoresizingMaskIntoConstraints:](self->_topMultipleCallLabelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PHMultipleCallParticipantLabelView setOverrideUserInterfaceStyle:](self->_topMultipleCallLabelView, "setOverrideUserInterfaceStyle:", 2);
      -[PHAbstractCallParticipantLabelView setDelegate:](self->_topMultipleCallLabelView, "setDelegate:", self);
      -[PHCallParticipantsView addSubview:](self, "addSubview:", self->_topMultipleCallLabelView);
      v117 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView leadingAnchor](self->_topMultipleCallLabelView, "leadingAnchor"));
      v118 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView leadingAnchor](self, "leadingAnchor"));
      v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:", v118));
      v184[0] = v119;
      v120 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView trailingAnchor](self->_topMultipleCallLabelView, "trailingAnchor"));
      v121 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView trailingAnchor](self, "trailingAnchor"));
      v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:", v121));
      v184[1] = v122;
      v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v184, 2));
      v160 = objc_msgSend(v123, "mutableCopy");

      v124 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView callDisplayStyleManager](self, "callDisplayStyleManager"));
      v125 = objc_msgSend(v124, "callDisplayStyle");

      if (v125 == (id)1)
      {
        v72 = v165;
        v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "topAnchor"));
        v127 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self->_topMultipleCallLabelView, "participantMarqueeLabel"));
        v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "topAnchor"));
        v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:"));
        v183[0] = v155;
        v153 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self->_topMultipleCallLabelView, "participantMarqueeLabel"));
        v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "bottomAnchor"));
        v129 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self->_bottomMultipleCallLabelView, "participantMarqueeLabel"));
        v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "topAnchor"));
        v162 = v128;
        v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "constraintEqualToAnchor:", v130));
        v183[1] = v131;
        v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v183, 2));
        objc_msgSend(v160, "addObjectsFromArray:", v132);
      }
      else
      {
        v152 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self->_topMultipleCallLabelView, "participantMarqueeLabel"));
        v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "firstBaselineAnchor"));
        v157 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self->_bottomMultipleCallLabelView, "participantMarqueeLabel"));
        v133 = objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "firstBaselineAnchor"));
        -[PHCallParticipantsView multipleCallLabelBaselineOffset](self, "multipleCallLabelBaselineOffset");
        v155 = (void *)v133;
        v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "constraintEqualToAnchor:constant:", v133, -v134));
        v182[0] = v153;
        v135 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView topAnchor](self->_topMultipleCallLabelView, "topAnchor"));
        v129 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView topAnchor](self, "topAnchor"));
        v162 = v135;
        v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToAnchor:", v129));
        v182[1] = v130;
        v131 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView bottomAnchor](self->_topMultipleCallLabelView, "bottomAnchor"));
        v132 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self->_topMultipleCallLabelView, "participantMarqueeLabel"));
        v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "lastBaselineAnchor"));
        v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:", v136));
        v182[2] = v137;
        v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v182, 3));
        objc_msgSend(v160, "addObjectsFromArray:", v138);

        v127 = v151;
        v126 = v152;
        v72 = v165;
      }

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v160);
      v139 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "participantLabelWasTapped:");
      -[PHMultipleCallParticipantLabelView addGestureRecognizer:](self->_topMultipleCallLabelView, "addGestureRecognizer:", v139);

    }
    -[PHCallParticipantsView updateParticipantAtIndex:animated:](self, "updateParticipantAtIndex:animated:", 0, v3);
    -[PHCallParticipantsView updateParticipantAtIndex:animated:](self, "updateParticipantAtIndex:animated:", 1, v3);
    v140 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
    if (v140)
    {

    }
    else
    {
      v141 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView nameOverrideLabel](self, "nameOverrideLabel"));

      if (!v141)
      {
LABEL_57:
        v149 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
        -[PHCallParticipantsView setShouldShowSingleDurationLabel:](self, "setShouldShowSingleDurationLabel:", objc_msgSend(v149, "shouldShowSingleDurationLabelInParticipantsView:", self));

        goto LABEL_9;
      }
    }
    if (v3)
    {
      v142 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView topMultipleCallLabelView](self, "topMultipleCallLabelView"));
      objc_msgSend(v142, "setAlpha:", 0.0);

      v143 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView bottomMultipleCallLabelView](self, "bottomMultipleCallLabelView"));
      objc_msgSend(v143, "setAlpha:", 0.0);

      v144 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
      v145 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView nameOverrideLabel](self, "nameOverrideLabel"));
      v169[0] = _NSConcreteStackBlock;
      v169[1] = 3221225472;
      v169[2] = sub_10002EEA0;
      v169[3] = &unk_100285360;
      v170 = v144;
      v171 = v145;
      v172 = self;
      v166[0] = _NSConcreteStackBlock;
      v166[1] = 3221225472;
      v166[2] = sub_10002EF14;
      v166[3] = &unk_100284DF0;
      v167 = v170;
      v168 = v171;
      v146 = v171;
      v147 = v170;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v169, v166, 0.5);

    }
    else
    {
      v148 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
      objc_msgSend(v148, "removeFromSuperview");

      v147 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView nameOverrideLabel](self, "nameOverrideLabel"));
      objc_msgSend(v147, "removeFromSuperview");
    }

    -[PHCallParticipantsView setSingleCallLabelView:](self, "setSingleCallLabelView:", 0);
    -[PHCallParticipantsView setNameOverrideLabel:](self, "setNameOverrideLabel:", 0);
    goto LABEL_57;
  }
  if (v8 != (id)1)
    goto LABEL_9;
  v32 = sub_1000C5588();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Configuring the call participants view for a single participant", buf, 2u);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
  if (!v34)
  {
    v35 = [PHSingleCallParticipantLabelView alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView callDisplayStyleManager](self, "callDisplayStyleManager"));
    v37 = -[PHSingleCallParticipantLabelView initWithCallDisplayStyleManager:delegate:](v35, "initWithCallDisplayStyleManager:delegate:", v36, self);
    singleCallLabelView = self->_singleCallLabelView;
    self->_singleCallLabelView = v37;

    -[PHSingleCallParticipantLabelView setPreservesSuperviewLayoutMargins:](self->_singleCallLabelView, "setPreservesSuperviewLayoutMargins:", 1);
    -[PHSingleCallParticipantLabelView setTranslatesAutoresizingMaskIntoConstraints:](self->_singleCallLabelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHSingleCallParticipantLabelView setOverrideUserInterfaceStyle:](self->_singleCallLabelView, "setOverrideUserInterfaceStyle:", 2);
    v39 = sub_1000C5588();
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = self->_singleCallLabelView;
      *(_DWORD *)buf = 138412290;
      v188 = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Adding a new single-participant view to the view hierarchy: %@", buf, 0xCu);
    }

    -[PHCallParticipantsView addSubview:](self, "addSubview:", self->_singleCallLabelView);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView leadingSideLayoutGuide](self, "leadingSideLayoutGuide"));
    -[PHSingleCallParticipantLabelView setLeadingSideLayoutGuide:](self->_singleCallLabelView, "setLeadingSideLayoutGuide:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
    -[PHSingleCallParticipantLabelView setTrailingSideLayoutGuide:](self->_singleCallLabelView, "setTrailingSideLayoutGuide:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_singleCallLabelView, 5, 0, self, 5, 1.0, 0.0));
    -[PHCallParticipantsView addConstraint:](self, "addConstraint:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_singleCallLabelView, 6, 0, self, 6, 1.0, 0.0));
    -[PHCallParticipantsView addConstraint:](self, "addConstraint:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_singleCallLabelView, 4, -1, self, 4, 1.0, 0.0));
    -[PHCallParticipantsView addConstraint:](self, "addConstraint:", v46);

    LODWORD(v47) = 1132068864;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", self->_singleCallLabelView, 4, 0, self, 4, 1.0, 0.0, v47));
    -[PHCallParticipantsView addConstraint:](self, "addConstraint:", v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_singleCallLabelView, 3, 0, self, 3, 1.0, 0.0));
    -[PHCallParticipantsView addConstraint:](self, "addConstraint:", v49);

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v51 = objc_opt_respondsToSelector(v50, "colorForStatusLabelForParticipantAtIndex:inParticipantsView:");

  if ((v51 & 1) != 0)
  {
    v52 = self->_singleCallLabelView;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "colorForStatusLabelForParticipantAtIndex:inParticipantsView:", 0, self));
    -[PHSingleCallParticipantLabelView setStatusLabelTextColor:](v52, "setStatusLabelTextColor:", v54);

  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v56 = objc_opt_respondsToSelector(v55, "colorForParticipantLabelView:");

  if ((v56 & 1) != 0)
  {
    v57 = self->_singleCallLabelView;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "colorForParticipantLabelView:", self->_singleCallLabelView));
    -[PHSingleCallParticipantLabelView setParticipantMarqueeLabelTextColor:](v57, "setParticipantMarqueeLabelTextColor:", v59);

  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v61 = objc_opt_respondsToSelector(v60, "fontForParticipantLabelView:");

  v62 = self->_singleCallLabelView;
  if ((v61 & 1) != 0)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "fontForParticipantLabelView:", self->_singleCallLabelView));
    -[PHSingleCallParticipantLabelView setParticipantMarqueeLabelFont:](v62, "setParticipantMarqueeLabelFont:", v64);

  }
  else
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView updatedParticipantMarqueeLabelFont](self->_singleCallLabelView, "updatedParticipantMarqueeLabelFont"));
    -[PHSingleCallParticipantLabelView setParticipantMarqueeLabelFont:](v62, "setParticipantMarqueeLabelFont:", v63);
  }

  -[PHCallParticipantsView updateParticipantAtIndex:animated:](self, "updateParticipantAtIndex:animated:", 0, v3);
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v94 = objc_opt_respondsToSelector(v93, "fontForParticipantLabelViewStatusLabel:");

  if ((v94 & 1) != 0)
  {
    v95 = self->_singleCallLabelView;
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "fontForParticipantLabelViewStatusLabel:", self->_singleCallLabelView));
    -[PHSingleCallParticipantLabelView setStatusLabelTextFont:](v95, "setStatusLabelTextFont:", v97);

  }
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView topMultipleCallLabelView](self, "topMultipleCallLabelView"));
  if (v98
    || (v98 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView bottomMultipleCallLabelView](self, "bottomMultipleCallLabelView"))) != 0)
  {

  }
  else
  {
    v150 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView nameOverrideLabel](self, "nameOverrideLabel"));

    if (!v150)
      goto LABEL_9;
  }
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView topMultipleCallLabelView](self, "topMultipleCallLabelView"));
  v100 = v99;
  if (v3)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView bottomMultipleCallLabelView](self, "bottomMultipleCallLabelView"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView nameOverrideLabel](self, "nameOverrideLabel"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
    objc_msgSend(v103, "setAlpha:", 0.0);

    v177[0] = _NSConcreteStackBlock;
    v177[1] = 3221225472;
    v177[2] = sub_10002EE0C;
    v177[3] = &unk_100285310;
    v178 = v100;
    v179 = v101;
    v180 = v102;
    v181 = self;
    v173[0] = _NSConcreteStackBlock;
    v173[1] = 3221225472;
    v173[2] = sub_10002EE70;
    v173[3] = &unk_100285338;
    v174 = v178;
    v175 = v179;
    v176 = v180;
    v104 = v180;
    v105 = v179;
    v106 = v178;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v177, v173, 0.5);

  }
  else
  {
    objc_msgSend(v99, "removeFromSuperview");

    v107 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView bottomMultipleCallLabelView](self, "bottomMultipleCallLabelView"));
    objc_msgSend(v107, "removeFromSuperview");

    v106 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView nameOverrideLabel](self, "nameOverrideLabel"));
    objc_msgSend(v106, "removeFromSuperview");
  }

  -[PHCallParticipantsView setShouldShowSingleDurationLabel:](self, "setShouldShowSingleDurationLabel:", 0);
  -[PHCallParticipantsView setTopMultipleCallLabelView:](self, "setTopMultipleCallLabelView:", 0);
  -[PHCallParticipantsView setBottomMultipleCallLabelView:](self, "setBottomMultipleCallLabelView:", 0);
  -[PHCallParticipantsView setNameOverrideLabel:](self, "setNameOverrideLabel:", 0);
LABEL_9:
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleDurationTimerLabel](self, "singleDurationTimerLabel"));

  if (v31)
    -[PHCallParticipantsView updateSingleDurationTimerLabelText](self, "updateSingleDurationTimerLabelText");
}

- (void)updateParticipants
{
  -[PHCallParticipantsView updateParticipantsAnimated:](self, "updateParticipantsAnimated:", 0);
}

- (void)updateParticipantAtIndex:(unint64_t)a3
{
  -[PHCallParticipantsView updateParticipantAtIndex:animated:](self, "updateParticipantAtIndex:animated:", a3, 0);
}

- (void)updateParticipantAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  uint64_t v4;
  id v7;
  PHSingleCallParticipantLabelView *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  NSObject *v31;
  int *v32;
  NSURL *previousURL;
  id v34;
  NSObject *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  PHSingleCallParticipantLabelView *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unsigned int v59;
  id v60;
  NSObject *v61;
  _BOOL4 v62;
  id v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  NSURL *v71;
  void *v72;
  NSURL *v73;
  NSURL *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  char v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  CNKCallParticipantLabelDescriptorFactory *labelDescriptorFactory;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  unsigned int v91;
  _BOOL4 v92;
  PHSingleCallParticipantLabelView *v93;
  void *v94;
  uint8_t buf[4];
  unint64_t v96;

  v4 = a4;
  if (!-[PHCallParticipantsView shouldIgnoreUpdates](self, "shouldIgnoreUpdates"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "numberOfParticipantsForParticipantsView:", self);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "callForParticipantAtIndex:inParticipantsView:", a3, self));

    objc_storeStrong((id *)&self->_currentCall, v12);
    if (v10 == (id)2)
    {
      v32 = &OBJC_IVAR___PHCallParticipantsView__bottomMultipleCallLabelView;
      if (!a3)
        v32 = &OBJC_IVAR___PHCallParticipantsView__topMultipleCallLabelView;
      v8 = (PHSingleCallParticipantLabelView *)*(id *)((char *)&self->super.super.super.isa + *v32);
      previousURL = self->_previousURL;
      self->_previousURL = 0;

      if (v8)
      {
LABEL_7:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nameForParticipantAtIndex:inParticipantsView:", a3, self));

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "labelForParticipantAtIndex:inParticipantsView:allowsDuration:", a3, self, 1));

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "supplementalParticipantLabelFormatStringAtIndex:inParticipantsView:", a3, self));

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
        v20 = objc_msgSend(v19, "isHeroImageEnabled");

        v22 = objc_opt_class(PHSingleCallParticipantLabelView, v21);
        v94 = v18;
        if ((objc_opt_isKindOfClass(v8, v22) & 1) == 0)
        {
          if (objc_msgSend(v18, "length"))
          {
            v35 = v14;
            v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v14));
          }
          else
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
            v37 = objc_opt_respondsToSelector(v36, "localizedSenderIdentityForParticipantAtIndex:inParticipantsView:");

            if ((v37 & 1) == 0)
              goto LABEL_72;
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
            v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedSenderIdentityForParticipantAtIndex:inParticipantsView:", a3, self));

            if (-[NSObject length](v35, "length"))
              objc_msgSend(v16, "setLocalizedSenderIdentity:", v35);
          }

LABEL_72:
          -[PHAbstractCallParticipantLabelView setParticipantName:](v8, "setParticipantName:", v14);
          -[PHSingleCallParticipantLabelView setLabelDescriptor:](v8, "setLabelDescriptor:", v16);
          goto LABEL_73;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
        v24 = objc_opt_respondsToSelector(v23, "iconInParticipantsView:");

        if ((v24 & 1) != 0)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "iconInParticipantsView:", self));
          -[PHSingleCallParticipantLabelView setIcon:](v8, "setIcon:", v26);

        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
        v28 = objc_opt_respondsToSelector(v27, "linkNameForCall:");

        if ((v28 & 1) != 0)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "linkNameForCall:", v12));

          if (v30)
          {
            v31 = v30;

            v92 = 1;
            v14 = v31;
          }
          else
          {
            v92 = 0;
          }

        }
        else
        {
          v92 = 0;
        }
        v93 = v8;
        v91 = v4;
        if (!objc_msgSend(v12, "isIncoming"))
          goto LABEL_34;
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView contact](v93, "contact"));
        if (v39)
        {

LABEL_34:
          v42 = v16;
          if ((v20 & 1) != 0
            || (v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView callDisplayStyleManager](self, "callDisplayStyleManager")),
                v48 = objc_msgSend(v47, "callDisplayStyle"),
                v47,
                v48 == (id)3))
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "contactForParticipantAtIndex:inParticipantsView:", 0, self));
            v45 = v93;
            -[PHSingleCallParticipantLabelView setContact:](v93, "setContact:", v50);

            v46 = v94;
          }
          else
          {
            v45 = v93;
            v46 = v94;
          }
LABEL_63:
          if (v46)
          {
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "strings"));
            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "firstObject"));
            v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v46, v76));

            v45 = v93;
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[CNKCallParticipantLabelDescriptorFactory makeLabelWithString:](self->_labelDescriptorFactory, "makeLabelWithString:", v77));

          }
          else
          {
            v16 = v42;
          }
          v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
          v79 = objc_opt_respondsToSelector(v78, "localizedSenderIdentityForParticipantAtIndex:inParticipantsView:");

          v4 = v91;
          if ((v79 & 1) != 0)
          {
            v80 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "localizedSenderIdentityForParticipantAtIndex:inParticipantsView:", a3, self));

            if (objc_msgSend(v81, "length"))
              objc_msgSend(v16, "setLocalizedSenderIdentity:", v81);

            v45 = v93;
          }

          if (v92)
          {
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "strings"));
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "firstObject"));
            -[PHAbstractCallParticipantLabelView setParticipantName:](v45, "setParticipantName:", v83);

            labelDescriptorFactory = self->_labelDescriptorFactory;
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "secondaryString"));
            v86 = (void *)objc_claimAutoreleasedReturnValue(-[CNKCallParticipantLabelDescriptorFactory makeLabelWithString:secondaryString:layoutState:](labelDescriptorFactory, "makeLabelWithString:secondaryString:layoutState:", v14, v85, objc_msgSend(v16, "layoutState")));
            -[PHSingleCallParticipantLabelView setLabelDescriptor:](v45, "setLabelDescriptor:", v86);

LABEL_73:
            v87 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
            -[PHSingleCallParticipantLabelView setActivityState:animated:](v8, "setActivityState:animated:", objc_msgSend(v87, "activityStateForParticipantAtIndex:inParticipantsView:", a3, self), v4);

            v88 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
            v89 = objc_msgSend(v88, "shouldShowInfoButtonForParticipantAtIndex:inParticipantsView:", a3, self);

            -[PHSingleCallParticipantLabelView setShowsConferenceParticipantsButton:](v8, "setShowsConferenceParticipantsButton:", v89);
            if ((_DWORD)v89)
            {
              -[PHSingleCallParticipantLabelView setShowsCallDetailsViewButton:](v8, "setShowsCallDetailsViewButton:", 0);
            }
            else
            {
              v90 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
              -[PHSingleCallParticipantLabelView setShowsCallDetailsViewButton:](v8, "setShowsCallDetailsViewButton:", objc_msgSend(v90, "shouldShowCallDetailsViewButton"));

            }
LABEL_77:

            goto LABEL_78;
          }
          goto LABEL_72;
        }
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
        v41 = objc_msgSend(v40, "shouldShowParticipantImageAtIndex:inParticipantsView:", 0, self);

        if (!v41)
          goto LABEL_34;
        v42 = v16;
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "contactForParticipantAtIndex:inParticipantsView:", 0, self));
        v45 = v93;
        -[PHSingleCallParticipantLabelView setContact:](v93, "setContact:", v44);

        if (+[PHInCallUIUtilities isSpringBoardPasscodeLocked](PHInCallUIUtilities, "isSpringBoardPasscodeLocked"))
        {
          v46 = v94;
LABEL_62:
          -[PHSingleCallParticipantLabelView updateLabelsOrderAndText](v45, "updateLabelsOrderAndText");
          goto LABEL_63;
        }
        v51 = objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView contact](v93, "contact"));
        v46 = v94;
        if (v51)
        {
          v52 = (void *)v51;
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView contact](v93, "contact"));
          if (objc_msgSend(v53, "imageDataAvailable"))
          {

            v45 = v93;
            goto LABEL_62;
          }

          v45 = v93;
        }
        if (v12)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "callDirectoryName"));
          if (v54)
          {
            v92 = 1;
          }
          else
          {
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageURL"));
            v92 = v55 != 0;

          }
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageURL"));

          if (v56)
          {
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageURL"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "relativePath"));
            v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("/stock"));

            v60 = sub_1000C5588();
            v61 = objc_claimAutoreleasedReturnValue(v60);
            v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
            if (v59)
            {
              if (v62)
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Attempting to display generic business logo", buf, 2u);
              }

              v63 = (id)objc_claimAutoreleasedReturnValue(+[UIImage genericBusinessLogo](UIImage, "genericBusinessLogo"));
            }
            else
            {
              if (v62)
              {
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageURL"));
                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "relativePath"));
                *(_DWORD *)buf = 138412290;
                v96 = (unint64_t)v67;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Attempting to display call imageURL: %@", buf, 0xCu);

              }
              v68 = objc_alloc((Class)UIImage);
              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageURL"));
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "relativePath"));
              v63 = objc_msgSend(v68, "initWithContentsOfFile:", v70);

            }
            if (v63)
            {
              v71 = self->_previousURL;
              v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageURL"));
              LOBYTE(v71) = -[NSURL isEqual:](v71, "isEqual:", v72);

              if ((v71 & 1) == 0)
                -[PHSingleCallParticipantLabelView setBusinessLogo:isPerson:](v93, "setBusinessLogo:isPerson:", v63, objc_msgSend(v12, "callDirectoryIdentityType") == (id)1);
            }

            v45 = v93;
            v46 = v94;
          }
          else
          {
            v64 = sub_1000C5588();
            v65 = objc_claimAutoreleasedReturnValue(v64);
            v46 = v94;
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              sub_1001A84B4(v65);

            v45 = v93;
            -[PHSingleCallParticipantLabelView setBusinessLogo:isPerson:](v93, "setBusinessLogo:isPerson:", 0, 0);
          }
          v73 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageURL"));
          v74 = self->_previousURL;
          self->_previousURL = v73;

        }
        goto LABEL_62;
      }
    }
    else if (v10 == (id)1)
    {
      v8 = self->_singleCallLabelView;
      if (v8)
        goto LABEL_7;
    }
    v34 = sub_1000C5588();
    v14 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Ignoring request to update participants because there's no participantLabelView", buf, 2u);
    }
    v8 = 0;
    goto LABEL_77;
  }
  v7 = sub_1000C5588();
  v8 = (PHSingleCallParticipantLabelView *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(&v8->super.super.super.super, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v96 = a3;
    _os_log_impl((void *)&_mh_execute_header, &v8->super.super.super.super, OS_LOG_TYPE_DEFAULT, "Ignoring request to update participant at index %lu because updates to the call participants view are disabled", buf, 0xCu);
  }
LABEL_78:

}

- (BOOL)_statusLabelStringWillFit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
    v7 = objc_msgSend(v6, "_statusLabelStringWillFit:", v4);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)setLeadingSideLayoutGuide:(id)a3
{
  PHSingleCallParticipantLabelView *singleCallLabelView;
  void *v5;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_leadingSideLayoutGuide, v6);
  singleCallLabelView = self->_singleCallLabelView;
  if (singleCallLabelView)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView superview](singleCallLabelView, "superview"));

    if (v5)
      -[PHSingleCallParticipantLabelView setLeadingSideLayoutGuide:](self->_singleCallLabelView, "setLeadingSideLayoutGuide:", v6);
  }

}

- (void)setTrailingSideLayoutGuide:(id)a3
{
  PHSingleCallParticipantLabelView *singleCallLabelView;
  void *v5;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_trailingSideLayoutGuide, v6);
  singleCallLabelView = self->_singleCallLabelView;
  if (singleCallLabelView)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView superview](singleCallLabelView, "superview"));

    if (v5)
      -[PHSingleCallParticipantLabelView setTrailingSideLayoutGuide:](self->_singleCallLabelView, "setTrailingSideLayoutGuide:", v6);
  }

}

- (void)setTextColor:(id)a3
{
  PHSingleCallParticipantLabelView *singleCallLabelView;
  id v5;

  singleCallLabelView = self->_singleCallLabelView;
  v5 = a3;
  -[PHSingleCallParticipantLabelView setTextColor:](singleCallLabelView, "setTextColor:", v5);
  -[PHMultipleCallParticipantLabelView setTextColor:](self->_topMultipleCallLabelView, "setTextColor:", v5);
  -[PHMultipleCallParticipantLabelView setTextColor:](self->_bottomMultipleCallLabelView, "setTextColor:", v5);

}

- (void)participantLabelWasTapped:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "participantTappedAtIndex:inParticipantsView:");

  v6 = v11;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    v8 = -[PHCallParticipantsView indexForParticipantLabel:](self, "indexForParticipantLabel:", v7);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
      objc_msgSend(v10, "participantTappedAtIndex:inParticipantsView:", v9, self);

    }
    v6 = v11;
  }

}

- (void)setShouldShowSingleDurationLabel:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  UILabel *v7;
  UILabel *singleDurationTimerLabel;
  void *v9;
  void *v10;
  void *v11;
  PHMultipleCallParticipantLabelView *topMultipleCallLabelView;
  void *v13;
  void *v14;

  if (self->_shouldShowSingleDurationLabel != a3)
  {
    v3 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView topMultipleCallLabelView](self, "topMultipleCallLabelView"));
    objc_msgSend(v5, "setHidesLabel:", v3);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView bottomMultipleCallLabelView](self, "bottomMultipleCallLabelView"));
    objc_msgSend(v6, "setHidesLabel:", v3);

    if (v3)
    {
      v7 = (UILabel *)objc_alloc_init((Class)UILabel);
      singleDurationTimerLabel = self->_singleDurationTimerLabel;
      self->_singleDurationTimerLabel = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration multipleCallStatusLabelFont](PHUIConfiguration, "multipleCallStatusLabelFont"));
      -[UILabel setFont:](self->_singleDurationTimerLabel, "setFont:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
      -[UILabel setTextColor:](self->_singleDurationTimerLabel, "setTextColor:", v10);

      -[UILabel setTextAlignment:](self->_singleDurationTimerLabel, "setTextAlignment:", 2);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_singleDurationTimerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PHCallParticipantsView updateSingleDurationTimerLabelText](self, "updateSingleDurationTimerLabelText");
      -[PHCallParticipantsView addSubview:](self, "addSubview:", self->_singleDurationTimerLabel);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_singleDurationTimerLabel, 6, 0, self, 6, 1.0, -24.0));
      -[PHCallParticipantsView addConstraint:](self, "addConstraint:", v11);

      topMultipleCallLabelView = self->_topMultipleCallLabelView;
      if (topMultipleCallLabelView)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_singleDurationTimerLabel, 10, 0, topMultipleCallLabelView, 4, 1.0, 3.0));
        -[PHCallParticipantsView addConstraint:](self, "addConstraint:", v13);

      }
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleDurationTimerLabel](self, "singleDurationTimerLabel"));
      objc_msgSend(v14, "removeFromSuperview");

      -[PHCallParticipantsView setSingleDurationTimerLabel:](self, "setSingleDurationTimerLabel:", 0);
    }
    self->_shouldShowSingleDurationLabel = v3;
    -[PHCallParticipantsView updateParticipants](self, "updateParticipants");
  }
}

- (id)identificationCategoryDisplayString:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_BUSINESS");
      break;
    case 4:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_COLLECTION");
      break;
    case 5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_EMERGENCY");
      break;
    case 6:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_FRAUD");
      break;
    case 7:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_GOVERNMENT");
      break;
    case 8:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_HEALTH");
      break;
    case 9:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_INFORMATIONAL");
      break;
    case 10:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_NONPROFIT");
      break;
    case 11:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_PERSONAL");
      break;
    case 12:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_POLITICAL");
      break;
    case 13:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_PUBLICSERVICE");
      break;
    case 14:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_PRISON");
      break;
    case 16:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_SPOOFED");
      break;
    case 17:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_SURVEY");
      break;
    case 18:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_TELEMARKETING");
      break;
    case 19:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_TRUSTED");
      break;
    default:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MAYBE_JUNK");
      break;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10028DC20, CFSTR("InCallService")));

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHCallParticipantsView;
  v4 = a3;
  -[PHCallParticipantsView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "_backlightLuminance", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "_backlightLuminance");

  if (v5 != v7)
    -[PHCallParticipantsView updateParticipants](self, "updateParticipants");
}

- (void)updateSingleDurationTimerLabelText
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "_backlightLuminance") != (id)1;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labelForParticipantAtIndex:inParticipantsView:allowsDuration:", 0, self, v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleDurationTimerLabel](self, "singleDurationTimerLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "strings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  objc_msgSend(v6, "setAttributedOrPlainText:", v8);

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PHCallParticipantsView;
  -[PHCallParticipantsView setUserInteractionEnabled:](&v5, "setUserInteractionEnabled:");
  -[PHAbstractCallParticipantLabelView setUserInteractionEnabled:](self->_singleCallLabelView, "setUserInteractionEnabled:", v3);
  -[PHAbstractCallParticipantLabelView setUserInteractionEnabled:](self->_topMultipleCallLabelView, "setUserInteractionEnabled:", v3);
  -[PHAbstractCallParticipantLabelView setUserInteractionEnabled:](self->_bottomMultipleCallLabelView, "setUserInteractionEnabled:", v3);
}

- (void)setBannerButtonsState:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
  objc_msgSend(v4, "setBannerButtonsState:", a3);

}

- (void)setBannerAudioRouteButtonSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
  objc_msgSend(v4, "setBannerAudioRouteButtonSelected:", v3);

}

- (unint64_t)indexForParticipantLabel:(id)a3
{
  PHMultipleCallParticipantLabelView *v4;
  unint64_t v5;

  v4 = (PHMultipleCallParticipantLabelView *)a3;
  if ((PHMultipleCallParticipantLabelView *)self->_singleCallLabelView == v4 || self->_topMultipleCallLabelView == v4)
  {
    v5 = 0;
  }
  else if (self->_bottomMultipleCallLabelView == v4)
  {
    v5 = 1;
  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)callLabelInfoLabelWasTappedForLabel:(id)a3
{
  void *v4;
  char v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "participantViewInfoButtonTappedAtIndex:inParticipantsView:");

  if ((v5 & 1) != 0)
  {
    v6 = -[PHCallParticipantsView indexForParticipantLabel:](self, "indexForParticipantLabel:", v9);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
      objc_msgSend(v8, "participantViewInfoButtonTappedAtIndex:inParticipantsView:", v7, self);

    }
  }

}

- (void)callLabelDetailsGestureRecognizerTappedForLabel:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "participantViewCallDetailsGestureRecognizerTapped");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
    objc_msgSend(v6, "participantViewCallDetailsGestureRecognizerTapped");

  }
}

- (id)compactLabelTextForParticipantLabel:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "compactLabelTextForParticipantAtIndex:inParticipantsView:");

  if ((v6 & 1) != 0
    && (v7 = -[PHCallParticipantsView indexForParticipantLabel:](self, "indexForParticipantLabel:", v4),
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "compactLabelTextForParticipantAtIndex:inParticipantsView:", v9, self));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)participantLabelView:(id)a3 didPerformActionType:(int64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate", a3));
  objc_msgSend(v6, "participantsView:didPerformActionType:", self, a4);

}

- (BOOL)participantLabelShouldShowLargeAvatar
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "shouldShowLargeAvatar");

  return v3;
}

- (BOOL)isCallRinging
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "isCallRinging");

  return v3;
}

- (BOOL)shouldShowParticipantLabel
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "shouldShowParticipantLabel");

  return v3;
}

- (id)customFontForParticipantLabel
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "customFontForParticipantLabel");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "customFontForParticipantLabel"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setAllowsFieldModeSendButton:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  UIButton *v9;
  UIButton *fieldModeSendButton;
  UIButton *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v16 = 138412290;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCallParticipantsView: setAllowsFieldModeSendButton:%@", (uint8_t *)&v16, 0xCu);
  }

  if (self->_allowsFieldModeSendButton != v3)
  {
    if (v3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView fieldModeSendButton](self, "fieldModeSendButton"));

      if (!v8)
      {
        v9 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
        fieldModeSendButton = self->_fieldModeSendButton;
        self->_fieldModeSendButton = v9;

        -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_fieldModeSendButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v11 = self->_fieldModeSendButton;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FIELD_MODE_SEND"), &stru_10028DC20, CFSTR("CallStatus")));
        -[UIButton setTitle:forState:](v11, "setTitle:forState:", v13, 0);

        -[UIButton sizeToFit](self->_fieldModeSendButton, "sizeToFit");
        -[UIButton addTarget:action:forControlEvents:](self->_fieldModeSendButton, "addTarget:action:forControlEvents:", self, "fieldModeButtonTapped:", 64);
        -[PHCallParticipantsView addSubview:](self, "addSubview:", self->_fieldModeSendButton);
        -[UIButton setHidden:](self->_fieldModeSendButton, "setHidden:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_fieldModeSendButton, 6, 0, self, 6, 1.0, -24.0));
        -[PHCallParticipantsView addConstraint:](self, "addConstraint:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_fieldModeSendButton, 4, 0, self, 4, 1.0, 3.0));
        -[PHCallParticipantsView addConstraint:](self, "addConstraint:", v15);

      }
    }
    else
    {
      -[UIButton removeFromSuperview](self->_fieldModeSendButton, "removeFromSuperview");
      -[PHCallParticipantsView setFieldModeSendButton:](self, "setFieldModeSendButton:", 0);
    }
    self->_allowsFieldModeSendButton = v3;
  }
}

- (void)fieldModeButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  uint8_t v9[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Field mode button tapped", v9, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "fieldModeSendButtonTappedInParticipantsView:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
    objc_msgSend(v8, "fieldModeSendButtonTappedInParticipantsView:", self);

  }
}

- (void)showSendButtonGestureRecognizer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing send button", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView fieldModeSendButton](self, "fieldModeSendButton"));
  objc_msgSend(v6, "setHidden:", 0);

}

- (BOOL)shouldIgnoreUpdates
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "shouldIgnoreUpdatesInParticipantsView:");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "shouldIgnoreUpdatesInParticipantsView:", self);

  return v6;
}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  -[PHCallParticipantsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  v7 = objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
    v10 = objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___ICSCallDisplayStyleHandler);

    if (v10)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsView singleCallLabelView](self, "singleCallLabelView"));
      objc_msgSend(v11, "callDisplayStyleDidChangeFromStyle:toStyle:", a3, a4);

    }
  }
}

- (PHCallParticipantsViewDelegate)delegate
{
  return (PHCallParticipantsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldShowSingleDurationLabel
{
  return self->_shouldShowSingleDurationLabel;
}

- (BOOL)allowsFieldModeSendButton
{
  return self->_allowsFieldModeSendButton;
}

- (unint64_t)bannerButtonsState
{
  return self->_bannerButtonsState;
}

- (BOOL)isShowingInfoButton
{
  return self->_isShowingInfoButton;
}

- (PHSingleCallParticipantLabelView)singleCallLabelView
{
  return (PHSingleCallParticipantLabelView *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSingleCallLabelView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (UILayoutGuide)leadingSideLayoutGuide
{
  return (UILayoutGuide *)objc_loadWeakRetained((id *)&self->_leadingSideLayoutGuide);
}

- (UILayoutGuide)trailingSideLayoutGuide
{
  return (UILayoutGuide *)objc_loadWeakRetained((id *)&self->_trailingSideLayoutGuide);
}

- (TUCall)currentCall
{
  return self->_currentCall;
}

- (PHMultipleCallParticipantLabelView)topMultipleCallLabelView
{
  return (PHMultipleCallParticipantLabelView *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTopMultipleCallLabelView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PHMultipleCallParticipantLabelView)bottomMultipleCallLabelView
{
  return (PHMultipleCallParticipantLabelView *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBottomMultipleCallLabelView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (UILabel)nameOverrideLabel
{
  return (UILabel *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNameOverrideLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (UILabel)singleDurationTimerLabel
{
  return (UILabel *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSingleDurationTimerLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (UIButton)fieldModeSendButton
{
  return (UIButton *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFieldModeSendButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return (ICSCallDisplayStyleManager *)objc_getProperty(self, a2, 104, 1);
}

- (CNKCallParticipantLabelDescriptorFactory)labelDescriptorFactory
{
  return self->_labelDescriptorFactory;
}

- (NSURL)previousURL
{
  return (NSURL *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPreviousURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousURL, 0);
  objc_storeStrong((id *)&self->_labelDescriptorFactory, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong((id *)&self->_fieldModeSendButton, 0);
  objc_storeStrong((id *)&self->_singleDurationTimerLabel, 0);
  objc_storeStrong((id *)&self->_nameOverrideLabel, 0);
  objc_storeStrong((id *)&self->_bottomMultipleCallLabelView, 0);
  objc_storeStrong((id *)&self->_topMultipleCallLabelView, 0);
  objc_storeStrong((id *)&self->_currentCall, 0);
  objc_destroyWeak((id *)&self->_trailingSideLayoutGuide);
  objc_destroyWeak((id *)&self->_leadingSideLayoutGuide);
  objc_storeStrong((id *)&self->_singleCallLabelView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
