@implementation MSDViewServiceRootViewController

- (MSDViewServiceRootViewController)initWithContext:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  MSDViewServiceRootViewController *v7;
  void *v8;
  uint64_t v9;
  NSString *displayString;
  id v11;
  NSObject *v12;
  NSString *v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;

  v4 = a3;
  v5 = sub_10000262C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[MSDViewServiceRootViewController initWithContext:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s called", buf, 0xCu);
  }

  v15.receiver = self;
  v15.super_class = (Class)MSDViewServiceRootViewController;
  v7 = -[MSDViewServiceRootViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("IN_PROGRESS"), &stru_10000C610, 0));
    displayString = v7->_displayString;
    v7->_displayString = (NSString *)v9;

    v11 = sub_10000262C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v7->_displayString;
      *(_DWORD *)buf = 138412290;
      v17 = (const char *)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Display string: %@", buf, 0xCu);
    }

    -[MSDViewServiceRootViewController setObserverAdded:](v7, "setObserverAdded:", 0);
    -[MSDViewServiceRootViewController setConfigurationContext:](v7, "setConfigurationContext:", v4);
  }

  return v7;
}

- (void)loadView
{
  id v3;
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  char *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
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
  id v94;
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
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  void *v121;
  void *v122;
  double v123;
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
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  NSAttributedStringKey v225;
  id v226;
  uint8_t buf[4];
  const char *v228;

  v3 = sub_10000262C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v228 = "-[MSDViewServiceRootViewController loadView]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s called", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v7, v9, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v14, "setBackgroundColor:", v15);

  objc_msgSend(v14, "setOpaque:", 0);
  -[MSDViewServiceRootViewController setView:](self, "setView:", v14);
  v16 = objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 2));
  v17 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  objc_msgSend(v18, "bounds");
  objc_msgSend(v17, "setFrame:");

  objc_msgSend(v17, "setAutoresizingMask:", 18);
  v223 = (void *)v16;
  v221 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](UIVibrancyEffect, "effectForBlurEffect:", v16));
  v19 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v221);
  v224 = v14;
  objc_msgSend(v14, "bounds");
  objc_msgSend(v19, "setFrame:");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentView"));
  v220 = v19;
  objc_msgSend(v20, "addSubview:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v222 = v17;
  objc_msgSend(v21, "insertSubview:atIndex:", v17, 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController configurationContext](self, "configurationContext"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "userInfo"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DisplayString")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v25, &stru_10000C610, 0));
  -[MSDViewServiceRootViewController setDisplayString:](self, "setDisplayString:", v26);

  v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("CancelButton")));
  v27 = objc_msgSend(v219, "BOOLValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](MSDViewServiceModel, "sharedInstance"));
  objc_msgSend(v28, "setShowCancelButton:", v27);

  v29 = sub_10000262C();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (char *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController displayString](self, "displayString"));
    *(_DWORD *)buf = 138543362;
    v228 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "StoreDemoViewService DisplayString = %{public}@", buf, 0xCu);

  }
  v32 = objc_alloc_init((Class)UILabel);
  -[MSDViewServiceRootViewController setMainLabel:](self, "setMainLabel:", v32);

  v33 = objc_alloc_init((Class)NSMutableParagraphStyle);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v35 = objc_msgSend(v34, "userInterfaceIdiom");

  if (v35 == (id)1)
  {
    v36 = 40.0;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](UIFont, "fontWithName:size:", CFSTR("HelveticaNeue-Thin"), 40.0));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
    objc_msgSend(v38, "setFont:", v37);
    v39 = 15.0;
    v40 = 50.0;
  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](UIFont, "fontWithName:size:", CFSTR("HelveticaNeue-Thin"), 25.0));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
    objc_msgSend(v38, "setFont:", v37);
    v39 = 5.0;
    v36 = 30.0;
    v40 = 30.0;
  }

  objc_msgSend(v33, "setMinimumLineHeight:", v36);
  objc_msgSend(v33, "setMaximumLineHeight:", v40);
  objc_msgSend(v33, "setLineSpacing:", v39);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  objc_msgSend(v42, "setNumberOfLines:", 0);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  objc_msgSend(v43, "setAdjustsFontSizeToFitWidth:", 1);

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  objc_msgSend(v45, "setBackgroundColor:", v44);

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  objc_msgSend(v47, "setTextColor:", v46);

  objc_msgSend(v33, "setAlignment:", 1);
  v225 = NSParagraphStyleAttributeName;
  v226 = v33;
  v48 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v226, &v225, 1));
  v49 = objc_alloc((Class)NSAttributedString);
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController displayString](self, "displayString"));
  v218 = (void *)v48;
  v51 = objc_msgSend(v49, "initWithString:attributes:", v50, v48);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  objc_msgSend(v52, "setAttributedText:", v51);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  objc_msgSend(v53, "sizeToFit");

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  objc_msgSend(v54, "addSubview:", v55);

  v56 = objc_alloc_init((Class)UIButton);
  -[MSDViewServiceRootViewController setCancelButton:](self, "setCancelButton:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v57, "setHidden:", 1);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v58, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("STOP_INSTALL"), &stru_10000C610, 0));
  objc_msgSend(v59, "setTitle:forState:", v61, 0);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v62, "sizeToFit");

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v63, "addTarget:action:forControlEvents:", self, "presentConfirmationAlert", 64);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v64, "addSubview:", v65);

  v66 = objc_alloc_init((Class)UILabel);
  -[MSDViewServiceRootViewController setStatusLabel:](self, "setStatusLabel:", v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v67, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("ITEM_FAILED"), &stru_10000C610, 0));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v70, "setText:", v69);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v71, "setLineBreakMode:", 0);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v72, "setNumberOfLines:", 0);

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v73, "setTextColor:", v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 14.0));
  objc_msgSend(v75, "setFont:", v76);

  v77 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v77, "setTextAlignment:", 2);

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v78, "sizeToFit");

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v79, "addSubview:", v80);

  v81 = objc_alloc_init((Class)UITextView);
  -[MSDViewServiceRootViewController setErrorView:](self, "setErrorView:", v81);

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  objc_msgSend(v82, "setHidden:", 1);

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  objc_msgSend(v83, "setUserInteractionEnabled:", 0);

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  objc_msgSend(v84, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v85, "setTextColor:", v86);

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 14.0));
  objc_msgSend(v87, "setFont:", v88);

  v89 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  objc_msgSend(v90, "setBackgroundColor:", v89);

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  objc_msgSend(v91, "setTextAlignment:", 0);

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  objc_msgSend(v92, "addSubview:", v93);

  v94 = objc_msgSend(objc_alloc((Class)UIProgressView), "initWithProgressViewStyle:", 0);
  -[MSDViewServiceRootViewController setProgressBar:](self, "setProgressBar:", v94);

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  objc_msgSend(v95, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  objc_msgSend(v96, "setHidden:", 1);

  v97 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 0.5));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  objc_msgSend(v98, "setTrackTintColor:", v97);

  v99 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.5));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  objc_msgSend(v100, "setTintColor:", v99);

  v101 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  objc_msgSend(v101, "addSubview:", v102);

  v103 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v104, 9, 0, v105, 9, 1.0, 0.0));
  objc_msgSend(v103, "addConstraint:", v106);

  v107 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v108, 10, 0, v109, 10, 1.0, 0.0));
  objc_msgSend(v107, "addConstraint:", v110);

  v111 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v112 = objc_msgSend(v111, "userInterfaceIdiom");

  v113 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  if (v112 == (id)1)
  {
    v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v114, 5, 0, v115, 5, 1.0, 50.0));
    objc_msgSend(v113, "addConstraint:", v116);

    v117 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
    v120 = 1.0;
    v121 = v118;
    v122 = v119;
    v123 = 50.0;
  }
  else
  {
    v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v114, 5, 0, v115, 5, 1.0, 10.0));
    objc_msgSend(v113, "addConstraint:", v124);

    v117 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
    v120 = 1.0;
    v123 = 10.0;
    v121 = v118;
    v122 = v119;
  }
  v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v121, 5, 0, v122, 5, v120, v123));
  objc_msgSend(v117, "addConstraint:", v125);

  v126 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v127, 9, 0, v128, 9, 1.0, 0.0));
  objc_msgSend(v126, "addConstraint:", v129);

  v130 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v131, 10, 0, v132, 10, 1.7, 0.0));
  objc_msgSend(v130, "addConstraint:", v133);

  v134 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "centerXAnchor"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "safeAreaLayoutGuide"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "centerXAnchor"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "constraintEqualToAnchor:", v139));
  objc_msgSend(v134, "addConstraint:", v140);

  v141 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "centerYAnchor"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "safeAreaLayoutGuide"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "centerYAnchor"));
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "constraintEqualToAnchor:", v146));
  objc_msgSend(v141, "addConstraint:", v147);

  v148 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "leadingAnchor"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "safeAreaLayoutGuide"));
  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "leadingAnchor"));
  v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintEqualToAnchor:constant:", v153, 20.0));
  objc_msgSend(v148, "addConstraint:", v154);

  v155 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "trailingAnchor"));
  v158 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "safeAreaLayoutGuide"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "trailingAnchor"));
  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "constraintEqualToAnchor:constant:", v160, -20.0));
  objc_msgSend(v155, "addConstraint:", v161);

  v162 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "topAnchor"));
  v165 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "safeAreaLayoutGuide"));
  v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "topAnchor"));
  v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "constraintEqualToAnchor:constant:", v167, 20.0));
  objc_msgSend(v162, "addConstraint:", v168);

  v169 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v170 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "bottomAnchor"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "safeAreaLayoutGuide"));
  v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "bottomAnchor"));
  v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "constraintEqualToAnchor:constant:", v174, -20.0));
  objc_msgSend(v169, "addConstraint:", v175);

  v176 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v177 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "trailingAnchor"));
  v179 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "safeAreaLayoutGuide"));
  v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "trailingAnchor"));
  v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "constraintEqualToAnchor:constant:", v181, -20.0));
  objc_msgSend(v176, "addConstraint:", v182);

  v183 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v184 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "leadingAnchor"));
  v186 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "safeAreaLayoutGuide"));
  v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "leadingAnchor"));
  v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "constraintEqualToAnchor:constant:", v188, 20.0));
  objc_msgSend(v183, "addConstraint:", v189);

  v190 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v191 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "bottomAnchor"));
  v193 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "safeAreaLayoutGuide"));
  v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v194, "bottomAnchor"));
  v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "constraintEqualToAnchor:constant:", v195, -20.0));
  objc_msgSend(v190, "addConstraint:", v196);

  v197 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v198 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "centerXAnchor"));
  v200 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "safeAreaLayoutGuide"));
  v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "centerXAnchor"));
  v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "constraintEqualToAnchor:", v202));
  objc_msgSend(v197, "addConstraint:", v203);

  v204 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v205 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v205, "widthAnchor"));
  v207 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207, "safeAreaLayoutGuide"));
  v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "widthAnchor"));
  v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "constraintEqualToAnchor:", v209));
  objc_msgSend(v204, "addConstraint:", v210);

  v211 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v212 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v212, "bottomAnchor"));
  v214 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v214, "safeAreaLayoutGuide"));
  v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "bottomAnchor"));
  v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v213, "constraintEqualToAnchor:", v216));
  objc_msgSend(v211, "addConstraint:", v217);

  -[MSDViewServiceRootViewController updateErrorState](self, "updateErrorState");
}

- (void)viewDidLoad
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;

  v29.receiver = self;
  v29.super_class = (Class)MSDViewServiceRootViewController;
  -[MSDViewServiceRootViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = sub_10000262C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[MSDViewServiceRootViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s called", buf, 0xCu);
  }

  v5 = objc_alloc_init((Class)UIView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  objc_msgSend(v6, "size");
  v8 = v7 * 0.5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  objc_msgSend(v9, "size");
  v11 = v10 * 0.5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  objc_msgSend(v12, "size");
  v14 = v13 * 0.5;

  objc_msgSend(v5, "setFrame:", v8, 0.0, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  objc_msgSend(v15, "addSubview:", v5);

  v16 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "respondToGesture:");
  objc_msgSend(v16, "setDelegate:", self);
  objc_msgSend(v16, "setMinimumPressDuration:", 5.0);
  objc_msgSend(v16, "setNumberOfTouchesRequired:", 3);
  objc_msgSend(v5, "addGestureRecognizer:", v16);
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v17 = objc_alloc_init((Class)UIView);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
    objc_msgSend(v18, "size");
    v20 = v19 * 0.5;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
    objc_msgSend(v21, "size");
    v23 = v22 * 0.5;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
    objc_msgSend(v24, "size");
    v26 = v25 * 0.5;

    objc_msgSend(v17, "setFrame:", 0.0, v20, v23, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
    objc_msgSend(v27, "addSubview:", v17);

    v28 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "respondToShowErrorGesture:");
    objc_msgSend(v28, "setDelegate:", self);
    objc_msgSend(v28, "setMinimumPressDuration:", 5.0);
    objc_msgSend(v28, "setNumberOfTouchesRequired:", 3);
    objc_msgSend(v17, "addGestureRecognizer:", v28);
    v16 = v28;
    v5 = v17;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;

  if (!-[MSDViewServiceRootViewController observerAdded](self, "observerAdded", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](MSDViewServiceModel, "sharedInstance"));
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("errorMessage"), 3, 0);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("errorToReport"), 3, 0);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("progress"), 3, 0);
    -[MSDViewServiceRootViewController setObserverAdded:](self, "setObserverAdded:", 1);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](MSDKManagedDevice, "sharedInstance", a3));
  objc_msgSend(v3, "checkInBlockingUI");

}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = sub_10000262C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "StoreDemoViewService disappeared.", v9, 2u);
  }

  if (-[MSDViewServiceRootViewController observerAdded](self, "observerAdded"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](MSDViewServiceModel, "sharedInstance"));
    objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("errorMessage"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](MSDViewServiceModel, "sharedInstance"));
    objc_msgSend(v7, "removeObserver:forKeyPath:", self, CFSTR("errorToReport"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](MSDViewServiceModel, "sharedInstance"));
    objc_msgSend(v8, "removeObserver:forKeyPath:", self, CFSTR("progress"));

    -[MSDViewServiceRootViewController setObserverAdded:](self, "setObserverAdded:", 0);
  }
}

- (void)doCancelInstall
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](MSDKManagedDevice, "sharedInstance"));
  objc_msgSend(v2, "cancelOperation");

}

- (void)timeout:(id)a3
{
  id v4;

  -[MSDViewServiceRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)showErrorTimeout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView", a3));
  objc_msgSend(v4, "setHidden:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  objc_msgSend(v5, "setHidden:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](MSDViewServiceModel, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "errorMessage"));

  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
    objc_msgSend(v8, "setHidden:", 0);

  }
}

- (void)respondToGesture:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "state") == (id)3 || objc_msgSend(v7, "state") == (id)4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](MSDViewServiceModel, "sharedInstance"));
    if (!objc_msgSend(v4, "showCancelButton"))
    {
LABEL_6:

      goto LABEL_7;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
    v6 = objc_msgSend(v5, "isHidden");

    if (v6)
    {
      -[MSDViewServiceRootViewController restartTimerWithTimeInterval:](self, "restartTimerWithTimeInterval:", 10.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
      objc_msgSend(v4, "setHidden:", 0);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)restartTimerWithTimeInterval:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController timer](self, "timer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController timer](self, "timer"));
    objc_msgSend(v6, "invalidate");

    -[MSDViewServiceRootViewController setTimer:](self, "setTimer:", 0);
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timeout:", 0, 0, a3));
  -[MSDViewServiceRootViewController setTimer:](self, "setTimer:", v7);

}

- (void)presentConfirmationAlert
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
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONFIRMATION_ALERT_TITLE"), &stru_10000C610, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CONFIRMATION_ALERT_MESSAGE"), &stru_10000C610, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STOP"), &stru_10000C610, 0));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000051B0;
  v15[3] = &unk_10000C468;
  v15[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 0, v15));
  objc_msgSend(v7, "addAction:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10000C610, 0));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000051B8;
  v14[3] = &unk_10000C468;
  v14[4] = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 1, v14));
  objc_msgSend(v7, "addAction:", v13);

  -[MSDViewServiceRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  -[MSDViewServiceRootViewController restartTimerWithTimeInterval:](self, "restartTimerWithTimeInterval:", 30.0);

}

- (void)respondToShowErrorGesture:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (objc_msgSend(v13, "state") == (id)3 || objc_msgSend(v13, "state") == (id)4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
    v5 = objc_msgSend(v4, "isHidden");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController showErrorTimer](self, "showErrorTimer"));

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController showErrorTimer](self, "showErrorTimer"));
        objc_msgSend(v7, "invalidate");

        -[MSDViewServiceRootViewController setShowErrorTimer:](self, "setShowErrorTimer:", 0);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "showErrorTimeout:", 0, 0, 30.0));
      -[MSDViewServiceRootViewController setShowErrorTimer:](self, "setShowErrorTimer:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
      objc_msgSend(v9, "setHidden:", 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
      objc_msgSend(v10, "setHidden:", 1);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
      objc_msgSend(v11, "setHidden:", 1);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
      objc_msgSend(v12, "setHidden:", 1);

    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  id location;
  uint8_t buf[4];
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("errorToReport")))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000055A0;
    block[3] = &unk_10000C490;
    objc_copyWeak(&v21, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v21);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("errorMessage")))
  {
    v12 = sub_10000262C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received an error message change: %{public}@", buf, 0xCu);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100005698;
    v18[3] = &unk_10000C490;
    objc_copyWeak(&v19, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
    objc_destroyWeak(&v19);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("progress")))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000056C4;
    v16[3] = &unk_10000C490;
    objc_copyWeak(&v17, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
    objc_destroyWeak(&v17);
  }
  else
  {
    v14 = sub_10000262C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100006518(v15);

  }
  objc_destroyWeak(&location);

}

- (void)updateErrorState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](MSDViewServiceModel, "sharedInstance"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "errorMessage"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  if (v8)
  {
    objc_msgSend(v4, "setHidden:", 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
    v6 = v5;
    v7 = v8;
  }
  else
  {
    objc_msgSend(v4, "setHidden:", 1);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
    v6 = v5;
    v7 = CFSTR("<no error>");
  }
  objc_msgSend(v5, "setText:", v7);

}

- (void)operationFailed:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](MSDKManagedDevice, "sharedInstance"));
  v6 = objc_msgSend(v5, "typeOfDemoDevice");

  if (v6 == (id)5)
  {
    -[MSDViewServiceRootViewController quit](self, "quit");
  }
  else
  {
    if (objc_msgSend(v4, "code") == (id)3727741088)
      v7 = CFSTR("CONNECTION_FAILED");
    else
      v7 = CFSTR("GENERIC_FAILUARE");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Demo Setup"), &stru_10000C610, 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v7, &stru_10000C610, 0));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10000C610, 0));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100005A20;
    v16[3] = &unk_10000C468;
    v16[4] = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, v16));
    objc_msgSend(v12, "addAction:", v15);

    -[MSDViewServiceRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  }

}

- (void)quit
{
  -[MSDViewServiceRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (NSString)displayString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (void)setMainLabel:(id)a3
{
  objc_storeStrong((id *)&self->_mainLabel, a3);
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabel, a3);
}

- (UITextView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
  objc_storeStrong((id *)&self->_errorView, a3);
}

- (UIProgressView)progressBar
{
  return self->_progressBar;
}

- (void)setProgressBar:(id)a3
{
  objc_storeStrong((id *)&self->_progressBar, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSTimer)showErrorTimer
{
  return self->_showErrorTimer;
}

- (void)setShowErrorTimer:(id)a3
{
  objc_storeStrong((id *)&self->_showErrorTimer, a3);
}

- (SBSRemoteAlertConfigurationContext)configurationContext
{
  return self->_configurationContext;
}

- (void)setConfigurationContext:(id)a3
{
  objc_storeStrong((id *)&self->_configurationContext, a3);
}

- (BOOL)observerAdded
{
  return self->_observerAdded;
}

- (void)setObserverAdded:(BOOL)a3
{
  self->_observerAdded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationContext, 0);
  objc_storeStrong((id *)&self->_showErrorTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

@end
