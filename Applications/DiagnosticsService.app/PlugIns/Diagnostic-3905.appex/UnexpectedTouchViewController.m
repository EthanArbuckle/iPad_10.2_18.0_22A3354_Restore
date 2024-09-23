@implementation UnexpectedTouchViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  MultiTouchHelper *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;

  -[UnexpectedTouchViewController setInputs:](self, "setInputs:", a3, a4);
  v5 = objc_alloc_init((Class)NSMutableArray);
  -[UnexpectedTouchViewController setHitPixels:](self, "setHitPixels:", v5);

  v6 = objc_alloc_init((Class)NSMutableArray);
  -[UnexpectedTouchViewController setHitPixelTimes:](self, "setHitPixelTimes:", v6);

  v7 = objc_alloc_init((Class)NSMutableArray);
  -[UnexpectedTouchViewController setTouchEvents:](self, "setTouchEvents:", v7);

  v8 = objc_alloc_init((Class)NSMutableArray);
  -[UnexpectedTouchViewController setAllResults:](self, "setAllResults:", v8);

  v9 = objc_alloc_init(MultiTouchHelper);
  -[UnexpectedTouchViewController setMultiTouchHelper:](self, "setMultiTouchHelper:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController inputs](self, "inputs"));
  v11 = objc_msgSend(v10, "connectedToPowerRequired");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    -[UnexpectedTouchViewController setDevice:](self, "setDevice:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController device](self, "device"));
    objc_msgSend(v13, "setBatteryMonitoringEnabled:", 1);

  }
  -[UnexpectedTouchViewController setSecondsTicked:](self, "setSecondsTicked:", 0);
}

- (void)start
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  -[UnexpectedTouchViewController setupView](self, "setupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController inputs](self, "inputs"));
  v4 = objc_msgSend(v3, "connectedToPowerRequired");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "batteryStateChanged", UIDeviceBatteryStateDidChangeNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController multiTouchHelper](self, "multiTouchHelper"));
    v7 = objc_msgSend(v6, "isPowerConnected");

    if ((v7 & 1) == 0)
      -[UnexpectedTouchViewController testFailedToExecuteWithStatusCode:](self, "testFailedToExecuteWithStatusCode:", &off_1000087A8);
  }
}

- (void)setupView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  double y;
  double width;
  double height;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
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
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
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
  double v80;
  void *v81;
  double v82;
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
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "nativeScale");
  v7 = v6;

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController inputs](self, "inputs", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "touchMap"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v96 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i);
        v15 = objc_alloc((Class)UIView);
        objc_msgSend(v14, "x");
        v17 = v16 / v7;
        objc_msgSend(v14, "y");
        v19 = v18 / v7;
        objc_msgSend(v14, "width");
        v21 = v20 / v7;
        objc_msgSend(v14, "height");
        v23 = objc_msgSend(v15, "initWithFrame:", v17, v19, v21, v22 / v7);
        objc_msgSend(v23, "setMultipleTouchEnabled:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
        objc_msgSend(v24, "addSubview:", v23);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
    }
    while (v11);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
  objc_msgSend(v25, "setMultipleTouchEnabled:", 1);

  v26 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v30 = objc_msgSend(v26, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UnexpectedTouchViewController setProgressView:](self, "setProgressView:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", CFSTR("EEEEEE"), 0));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
  objc_msgSend(v32, "setBackgroundColor:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
  objc_msgSend(v33, "setAlpha:", 0.75);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "layer"));
  objc_msgSend(v35, "setCornerRadius:", 8.0);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
  objc_msgSend(v36, "setUserInteractionEnabled:", 0);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
  objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v38 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UnexpectedTouchViewController setProgressLabel:](self, "setProgressLabel:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkTextColor](UIColor, "darkTextColor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  objc_msgSend(v40, "setTextColor:", v39);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  objc_msgSend(v41, "setContentMode:", 7);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  LODWORD(v43) = 1132134400;
  objc_msgSend(v42, "setContentHuggingPriority:forAxis:", 0, v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  LODWORD(v45) = 1132134400;
  objc_msgSend(v44, "setContentHuggingPriority:forAxis:", 1, v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  objc_msgSend(v46, "setTextAlignment:", 1);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  objc_msgSend(v47, "setLineBreakMode:", 0);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  objc_msgSend(v48, "setBaselineAdjustment:", 2);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  objc_msgSend(v49, "setNumberOfLines:", 2);

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  objc_msgSend(v51, "setFont:", v50);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  objc_msgSend(v52, "setPreferredMaxLayoutWidth:", 240.0);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController inputs](self, "inputs"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController localizedTimeRemaining:](self, "localizedTimeRemaining:", objc_msgSend(v53, "minutesToRun")));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  objc_msgSend(v55, "setText:", v54);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  objc_msgSend(v56, "setUserInteractionEnabled:", 0);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  objc_msgSend(v57, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v58 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UnexpectedTouchViewController setDoNotDisturbLabel:](self, "setDoNotDisturbLabel:", v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkTextColor](UIColor, "darkTextColor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  objc_msgSend(v60, "setTextColor:", v59);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  objc_msgSend(v61, "setContentMode:", 7);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  LODWORD(v63) = 1132134400;
  objc_msgSend(v62, "setContentHuggingPriority:forAxis:", 0, v63);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  LODWORD(v65) = 1132134400;
  objc_msgSend(v64, "setContentHuggingPriority:forAxis:", 1, v65);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  objc_msgSend(v66, "setTextAlignment:", 1);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  objc_msgSend(v67, "setLineBreakMode:", 4);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  objc_msgSend(v68, "setBaselineAdjustment:", 2);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  objc_msgSend(v69, "setNumberOfLines:", 3);

  v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 27.0));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  objc_msgSend(v71, "setFont:", v70);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  objc_msgSend(v72, "setPreferredMaxLayoutWidth:", 240.0);

  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("DO_NOT_DISTURB_THE_DEVICE"), &stru_1000086A8, 0));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  objc_msgSend(v75, "setText:", v74);

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  objc_msgSend(v76, "setUserInteractionEnabled:", 0);

  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  objc_msgSend(v77, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v78 = objc_msgSend(objc_alloc((Class)UIProgressView), "initWithProgressViewStyle:", 0);
  -[UnexpectedTouchViewController setProgressBar:](self, "setProgressBar:", v78);

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
  LODWORD(v80) = 0;
  objc_msgSend(v79, "setProgress:", v80);

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
  LODWORD(v82) = 1144750080;
  objc_msgSend(v81, "setContentHuggingPriority:forAxis:", 1, v82);

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
  objc_msgSend(v83, "setUserInteractionEnabled:", 0);

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
  objc_msgSend(v84, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
  objc_msgSend(v85, "setNeedsUpdateConstraints");

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
  objc_msgSend(v86, "addSubview:", v87);

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
  objc_msgSend(v88, "addSubview:", v89);

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
  objc_msgSend(v90, "addSubview:", v91);

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
  objc_msgSend(v92, "addSubview:", v93);

  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "updateTimer:", 0, 1, 1.0));
  -[UnexpectedTouchViewController setProgressTimer:](self, "setProgressTimer:", v94);

}

- (void)updateViewConstraints
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
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
  double v30;
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
  double v78;
  double v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
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
  double v102;
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
  objc_super v152;

  v152.receiver = self;
  v152.super_class = (Class)UnexpectedTouchViewController;
  -[UnexpectedTouchViewController updateViewConstraints](&v152, "updateViewConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = (unint64_t)objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 7, 0, 0, 0, 1.0, 280.0));
    objc_msgSend(v5, "addConstraint:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 8, 1, 0, 0, 1.0, 150.0));

    LODWORD(v10) = 1144750080;
    objc_msgSend(v9, "setPriority:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    objc_msgSend(v11, "addConstraint:", v9);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 9, 0, v14, 9, 1.0, 0.0));
    objc_msgSend(v12, "addConstraint:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 10, 0, v18, 10, 1.0, 0.0));
    objc_msgSend(v16, "addConstraint:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 5, 0, v22, 5, 1.0, 26.0));
    objc_msgSend(v20, "addConstraint:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 6, 0, v26, 6, 1.0, 26.0));
    objc_msgSend(v24, "addConstraint:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 8, 1, 0, 0, 1.0, 65.0));

    LODWORD(v30) = 1144750080;
    objc_msgSend(v29, "setPriority:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    objc_msgSend(v31, "addConstraint:", v29);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 9, 0, v34, 9, 1.0, 0.0));
    objc_msgSend(v32, "addConstraint:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v37, 11, 0, v38, 10, 1.0, -13.0));
    objc_msgSend(v36, "addConstraint:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v41, 3, 0, v42, 3, 1.0, 26.0));
    objc_msgSend(v40, "addConstraint:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 7, 0, 0, 0, 1.0, 240.0));
    objc_msgSend(v44, "addConstraint:", v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v48, 9, 0, v49, 9, 1.0, 0.0));
    objc_msgSend(v47, "addConstraint:", v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v52, 3, 0, v53, 10, 1.0, 13.0));
    objc_msgSend(v51, "addConstraint:", v54);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v56, 5, 0, v57, 5, 1.0, 26.0));
    objc_msgSend(v55, "addConstraint:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v60, 6, 0, v61, 6, 1.0, 26.0));
    objc_msgSend(v59, "addConstraint:", v62);

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v63, 8, 1, 0, 0, 1.0, 21.0));

    LODWORD(v65) = 1144750080;
    objc_msgSend(v64, "setPriority:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    objc_msgSend(v66, "addConstraint:", v64);

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v68, 9, 0, v69, 9, 1.0, 0.0));
    objc_msgSend(v67, "addConstraint:", v70);

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v72, 3, 0, v73, 4, 1.0, 16.0));
    objc_msgSend(v71, "addConstraint:", v74);

    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    v78 = 1.0;
    v79 = 26.0;
    v80 = v76;
    v81 = 4;
    v82 = v77;
    v83 = 11;
  }
  else
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v84, 8, 1, 0, 0, 1.0, 65.0));

    LODWORD(v85) = 1144750080;
    objc_msgSend(v9, "setPriority:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    objc_msgSend(v86, "addConstraint:", v9);

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v88, 7, 0, 0, 0, 1.0, 240.0));
    objc_msgSend(v87, "addConstraint:", v89);

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v90, 8, 1, 0, 0, 1.0, 21.0));

    LODWORD(v91) = 1144750080;
    objc_msgSend(v29, "setPriority:", v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    objc_msgSend(v92, "addConstraint:", v29);

    v93 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v94, 9, 0, v95, 9, 1.0, 0.0));
    objc_msgSend(v93, "addConstraint:", v96);

    v97 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v98, 5, 0, v99, 5, 1.0, 20.0));
    objc_msgSend(v97, "addConstraint:", v100);

    v101 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v101, 8, 1, 0, 0, 1.0, 150.0));

    LODWORD(v102) = 1144750080;
    objc_msgSend(v64, "setPriority:", v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    objc_msgSend(v103, "addConstraint:", v64);

    v104 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v105, 9, 0, v106, 9, 1.0, 0.0));
    objc_msgSend(v104, "addConstraint:", v107);

    v108 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v109, 7, 0, 0, 0, 1.0, 280.0));
    objc_msgSend(v108, "addConstraint:", v110);

    v111 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v112, 3, 0, v113, 4, 1.0, 15.0));
    objc_msgSend(v111, "addConstraint:", v114);

    v115 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v116, 9, 0, v117, 9, 1.0, 0.0));
    objc_msgSend(v115, "addConstraint:", v118);

    v119 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v120, 5, 0, v121, 5, 1.0, 20.0));
    objc_msgSend(v119, "addConstraint:", v122);

    v123 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v124, 6, 0, v125, 6, 1.0, 20.0));
    objc_msgSend(v123, "addConstraint:", v126);

    v127 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v128, 6, 0, v129, 6, 1.0, 20.0));
    objc_msgSend(v127, "addConstraint:", v130);

    v131 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v132, 3, 0, v133, 4, 1.0, 16.0));
    objc_msgSend(v131, "addConstraint:", v134);

    v135 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController doNotDisturbLabel](self, "doNotDisturbLabel"));
    v137 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v136, 3, 0, v137, 3, 1.0, 15.0));
    objc_msgSend(v135, "addConstraint:", v138);

    v139 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v140 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v141 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressBar](self, "progressBar"));
    v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v140, 10, 0, v141, 10, 1.0, -21.0));
    objc_msgSend(v139, "addConstraint:", v142);

    v143 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v144 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressLabel](self, "progressLabel"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v144, 4, 0, v145, 4, 1.0, 16.0));
    objc_msgSend(v143, "addConstraint:", v146);

    v147 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
    v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v148, 9, 0, v149, 9, 1.0, 0.0));
    objc_msgSend(v147, "addConstraint:", v150);

    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressView](self, "progressView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
    v78 = 1.0;
    v79 = 0.0;
    v80 = v76;
    v81 = 10;
    v82 = v77;
    v83 = 10;
  }
  v151 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v80, v81, 0, v82, v83, v78, v79));
  objc_msgSend(v75, "addConstraint:", v151);

}

- (void)updateTimer:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004264;
  v4[3] = &unk_100008298;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000042FC;
  v3[3] = &unk_1000082C0;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, v3, 1.0);
}

- (void)cleanUp
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressTimer](self, "progressTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController progressTimer](self, "progressTimer"));
    objc_msgSend(v4, "invalidate");

    -[UnexpectedTouchViewController setProgressTimer:](self, "setProgressTimer:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController inputs](self, "inputs"));
  v6 = objc_msgSend(v5, "connectedToPowerRequired");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController device](self, "device"));
    objc_msgSend(v7, "setBatteryMonitoringEnabled:", 0);

    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "removeObserver:", self);

  }
}

- (void)endTest
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _UNKNOWN **v7;
  int v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  UnexpectedTouchViewController *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[6];
  _QWORD v52[6];
  _QWORD v53[6];
  _QWORD v54[6];
  _BYTE v55[128];

  -[UnexpectedTouchViewController cleanUp](self, "cleanUp");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController hitPixels](self, "hitPixels"));
  v4 = objc_msgSend(v3, "count");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController result](self, "result"));
  v6 = v5;
  if (v4)
    v7 = &off_1000087C0;
  else
    v7 = &off_1000087D8;
  objc_msgSend(v5, "setStatusCode:", v7);

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v38 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController hitPixels](self, "hitPixels"));
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v39)
  {
    v8 = 0;
    v37 = *(_QWORD *)v48;
    do
    {
      v9 = 0;
      v41 = v8;
      do
      {
        if (*(_QWORD *)v48 != v37)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v9);
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController allResults](v38, "allResults"));
        v53[0] = CFSTR("xPos");
        objc_msgSend(v10, "frame");
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v54[0] = v45;
        v53[1] = CFSTR("yPos");
        objc_msgSend(v10, "frame");
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
        v54[1] = v12;
        v53[2] = CFSTR("width");
        objc_msgSend(v10, "bounds");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
        v54[2] = v14;
        v53[3] = CFSTR("height");
        objc_msgSend(v10, "bounds");
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
        v54[3] = v16;
        v53[4] = CFSTR("timestamp");
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController hitPixelTimes](v38, "hitPixelTimes"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", (char *)v9 + v41));
        v54[4] = v18;
        v53[5] = CFSTR("touchEvent");
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController touchEvents](v38, "touchEvents"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", (char *)v9 + v41));
        v54[5] = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 6));
        objc_msgSend(v43, "addObject:", v21);

        v9 = (char *)v9 + 1;
      }
      while (v39 != v9);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      v8 = v41 + (_DWORD)v9;
      v39 = v22;
    }
    while (v22);
  }

  v51[0] = CFSTR("displayResX");
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v46, "bounds");
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23));
  v52[0] = v44;
  v51[1] = CFSTR("displayResY");
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v42, "bounds");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24));
  v52[1] = v40;
  v51[2] = CFSTR("touchesFound");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController allResults](v38, "allResults"));
  v52[2] = v25;
  v51[3] = CFSTR("isCharging");
  v26 = objc_alloc((Class)NSNumber);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController multiTouchHelper](v38, "multiTouchHelper"));
  v28 = objc_msgSend(v26, "initWithBool:", objc_msgSend(v27, "isBatteryCharging"));
  v52[3] = v28;
  v51[4] = CFSTR("isPluggedIntoPower");
  v29 = objc_alloc((Class)NSNumber);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController multiTouchHelper](v38, "multiTouchHelper"));
  v31 = objc_msgSend(v29, "initWithBool:", objc_msgSend(v30, "isPowerConnected"));
  v52[4] = v31;
  v51[5] = CFSTR("temperatureData");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController multiTouchHelper](v38, "multiTouchHelper"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "temperatureData"));
  v52[5] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 6));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController result](v38, "result"));
  objc_msgSend(v35, "setData:", v34);

  -[UnexpectedTouchViewController setFinished:](v38, "setFinished:", 1);
}

- (void)testFailedToExecuteWithStatusCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UnexpectedTouchViewController cleanUp](self, "cleanUp");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController result](self, "result"));
  objc_msgSend(v5, "setStatusCode:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController result](self, "result"));
  objc_msgSend(v6, "setData:", &__NSDictionary0__struct);

  -[UnexpectedTouchViewController setFinished:](self, "setFinished:", 1);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
  objc_msgSend(v7, "locationInView:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hitTest:withEvent:", 0));

  v9 = v10;
  if (v10)
  {
    -[UnexpectedTouchViewController highlightView:touchEvent:](self, "highlightView:touchEvent:", v10, CFSTR("touchesBegan"));
    v9 = v10;
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
  objc_msgSend(v7, "locationInView:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hitTest:withEvent:", 0));

  v9 = v10;
  if (v10)
  {
    -[UnexpectedTouchViewController highlightView:touchEvent:](self, "highlightView:touchEvent:", v10, CFSTR("touchesMoved"));
    v9 = v10;
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController view](self, "view"));
  objc_msgSend(v7, "locationInView:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hitTest:withEvent:", 0));

  v9 = v10;
  if (v10)
  {
    -[UnexpectedTouchViewController highlightView:touchEvent:](self, "highlightView:touchEvent:", v10, CFSTR("touchesEnded"));
    v9 = v10;
  }

}

- (void)highlightView:(id)a3 touchEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  UnexpectedTouchViewController *v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController inputs](self, "inputs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "touchColor"));
  objc_msgSend(v6, "setBackgroundColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController hitPixels](self, "hitPixels"));
  objc_msgSend(v10, "addObject:", v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(v12 * 1000.0)));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController hitPixelTimes](self, "hitPixelTimes"));
  objc_msgSend(v14, "addObject:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController touchEvents](self, "touchEvents"));
  objc_msgSend(v15, "addObject:", v7);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004E98;
  v17[3] = &unk_1000082E8;
  v18 = v6;
  v19 = self;
  v16 = v6;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 131074, v17, 0, 2.0, 0.5);

}

- (void)batteryStateChanged
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController device](self, "device"));
  if (objc_msgSend(v3, "batteryState") == (id)1)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchViewController device](self, "device"));
    v5 = objc_msgSend(v4, "batteryState");

    if (v5)
      return;
  }
  -[UnexpectedTouchViewController testFailedToExecuteWithStatusCode:](self, "testFailedToExecuteWithStatusCode:", &off_1000087A8);
}

- (id)localizedTimeRemaining:(int)a3
{
  NSDateComponentsFormatter *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!qword_10000D158)
  {
    v4 = objc_opt_new(NSDateComponentsFormatter);
    v5 = (void *)qword_10000D158;
    qword_10000D158 = (uint64_t)v4;

    objc_msgSend((id)qword_10000D158, "setUnitsStyle:", 3);
    objc_msgSend((id)qword_10000D158, "setAllowedUnits:", 64);
    objc_msgSend((id)qword_10000D158, "setFormattingContext:", 5);
    objc_msgSend((id)qword_10000D158, "setMaximumUnitCount:", 1);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ABOUT_REMAINING"), &stru_1000086A8, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000D158, "stringFromTimeInterval:", (float)((float)a3 * 60.0)));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8));

  return v9;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (UIView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (UIProgressView)progressBar
{
  return self->_progressBar;
}

- (void)setProgressBar:(id)a3
{
  objc_storeStrong((id *)&self->_progressBar, a3);
}

- (UILabel)progressLabel
{
  return self->_progressLabel;
}

- (void)setProgressLabel:(id)a3
{
  objc_storeStrong((id *)&self->_progressLabel, a3);
}

- (UILabel)doNotDisturbLabel
{
  return self->_doNotDisturbLabel;
}

- (void)setDoNotDisturbLabel:(id)a3
{
  objc_storeStrong((id *)&self->_doNotDisturbLabel, a3);
}

- (NSTimer)progressTimer
{
  return self->_progressTimer;
}

- (void)setProgressTimer:(id)a3
{
  objc_storeStrong((id *)&self->_progressTimer, a3);
}

- (NSMutableArray)hitPixels
{
  return self->_hitPixels;
}

- (void)setHitPixels:(id)a3
{
  objc_storeStrong((id *)&self->_hitPixels, a3);
}

- (NSMutableArray)hitPixelTimes
{
  return self->_hitPixelTimes;
}

- (void)setHitPixelTimes:(id)a3
{
  objc_storeStrong((id *)&self->_hitPixelTimes, a3);
}

- (NSMutableArray)touchEvents
{
  return self->_touchEvents;
}

- (void)setTouchEvents:(id)a3
{
  objc_storeStrong((id *)&self->_touchEvents, a3);
}

- (int)secondsTicked
{
  return self->_secondsTicked;
}

- (void)setSecondsTicked:(int)a3
{
  self->_secondsTicked = a3;
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
  objc_storeStrong((id *)&self->_allResults, a3);
}

- (UIDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (MultiTouchHelper)multiTouchHelper
{
  return self->_multiTouchHelper;
}

- (void)setMultiTouchHelper:(id)a3
{
  objc_storeStrong((id *)&self->_multiTouchHelper, a3);
}

- (UnexpectedTouchInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_multiTouchHelper, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_touchEvents, 0);
  objc_storeStrong((id *)&self->_hitPixelTimes, 0);
  objc_storeStrong((id *)&self->_hitPixels, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_doNotDisturbLabel, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
