@implementation AVTSplashScreenViewController

- (AVTSplashScreenViewController)initWithDefaultConfiguration
{
  AVTSplashScreenConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AVTSplashScreenViewController *v13;

  v3 = objc_alloc_init(AVTSplashScreenConfiguration);
  AVTAvatarUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MEMOJI_SPLASH_TITLE"), &stru_1EA5207B8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenConfiguration setTitleString:](v3, "setTitleString:", v5);

  LODWORD(v4) = AVTUIIsFacetrackingSupported();
  AVTAvatarUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v4)
    v8 = CFSTR("MEMOJI_SPLASH_SUBTITLE");
  else
    v8 = CFSTR("MEMOJI_SPLASH_SUBTITLE_NO_FACE_TRACKING");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1EA5207B8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenConfiguration setSubTitleString:](v3, "setSubTitleString:", v9);

  AVTAvatarUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MEMOJI_SPLASH_CREATE_YOURS"), &stru_1EA5207B8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenConfiguration setButtonString:](v3, "setButtonString:", v11);

  AVTAvatarEditorSplashVideo();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenConfiguration setPrimaryPlayerItem:](v3, "setPrimaryPlayerItem:", v12);

  v13 = -[AVTSplashScreenViewController initWithConfiguration:](self, "initWithConfiguration:", v3);
  return v13;
}

- (AVTSplashScreenViewController)initWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  AVTSplashScreenViewController *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(v5, "titleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subTitleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)AVTSplashScreenViewController;
  v8 = -[AVTSplashScreenViewController initWithTitle:detailText:symbolName:](&v10, sel_initWithTitle_detailText_symbolName_, v6, v7, 0);

  if (v8)
    objc_storeStrong((id *)&v8->_configuration, a3);

  return v8;
}

- (void)viewDidLoad
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
  id v19;
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
  id v41;
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
  double v79;
  double v80;
  void *v81;
  void *v82;
  double Width;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
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
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  objc_super v135;
  _QWORD v136[2];
  _QWORD v137[4];
  _QWORD v138[6];
  CGRect v139;

  v138[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 200.0, 200.0);
  -[AVTSplashScreenViewController setVideoContentView:](self, "setVideoContentView:", v3);

  -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeFullCenterContentController setCenteredContentView:](self, "setCenteredContentView:", v5);

  v135.receiver = self;
  v135.super_class = (Class)AVTSplashScreenViewController;
  -[OBWelcomeFullCenterContentController viewDidLoad](&v135, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D65138], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController setContinueButton:](self, "setContinueButton:", v6);

  -[AVTSplashScreenViewController continueButton](self, "continueButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "buttonString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v9, 0);

  -[AVTSplashScreenViewController continueButton](self, "continueButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_didTapContinueButton_, 64);

  -[AVTSplashScreenViewController buttonTray](self, "buttonTray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController continueButton](self, "continueButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addButton:", v12);

  v13 = (void *)MEMORY[0x1E0C8B350];
  -[AVTSplashScreenViewController configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "primaryPlayerItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "playerWithPlayerItem:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController setQueuePlayer:](self, "setQueuePlayer:", v16);

  -[AVTSplashScreenViewController queuePlayer](self, "queuePlayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPreventsDisplaySleepDuringVideoPlayback:", 0);

  -[AVTSplashScreenViewController queuePlayer](self, "queuePlayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAllowsExternalPlayback:", 0);

  v19 = objc_alloc_init(MEMORY[0x1E0C8B448]);
  -[AVTSplashScreenViewController setPlayerViewController:](self, "setPlayerViewController:", v19);

  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v22);

  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setShowsPlaybackControls:", 0);

  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setUpdatesNowPlayingInfoCenter:", 0);

  -[AVTSplashScreenViewController queuePlayer](self, "queuePlayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPlayer:", v27);

  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController addChildViewController:](self, "addChildViewController:", v29);

  -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v32);

  -[AVTSplashScreenViewController configuration](self, "configuration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "secondaryPlayerItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v35 = (void *)MEMORY[0x1E0C8B350];
    -[AVTSplashScreenViewController configuration](self, "configuration");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "secondaryPlayerItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "playerWithPlayerItem:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSplashScreenViewController setSecondaryQueuePlayer:](self, "setSecondaryQueuePlayer:", v38);

    -[AVTSplashScreenViewController secondaryQueuePlayer](self, "secondaryQueuePlayer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setPreventsDisplaySleepDuringVideoPlayback:", 0);

    -[AVTSplashScreenViewController secondaryQueuePlayer](self, "secondaryQueuePlayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAllowsExternalPlayback:", 0);

    v41 = objc_alloc_init(MEMORY[0x1E0C8B448]);
    -[AVTSplashScreenViewController setSecondaryPlayerViewController:](self, "setSecondaryPlayerViewController:", v41);

    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setBackgroundColor:", v44);

    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setShowsPlaybackControls:", 0);

    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setUpdatesNowPlayingInfoCenter:", 0);

    -[AVTSplashScreenViewController secondaryQueuePlayer](self, "secondaryQueuePlayer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setPlayer:", v49);

    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSplashScreenViewController addChildViewController:](self, "addChildViewController:", v51);

    -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addSubview:", v54);

  }
  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "view");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "leadingAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "leadingAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "constraintEqualToAnchor:constant:", v124, 40.0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v122;
  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "view");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "trailingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "trailingAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:constant:", v112, -40.0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v138[1] = v110;
  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "view");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "topAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v138[2] = v57;
  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "view");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "heightAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "widthAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:multiplier:", v62, 0.7);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v138[3] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 4);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "bottomAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "view");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "topAnchor");
    v117 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v117);
    v127 = objc_claimAutoreleasedReturnValue();
    v137[0] = v127;
    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "view");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "leadingAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "leadingAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "constraintEqualToAnchor:", v115);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v137[1] = v111;
    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "view");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "trailingAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "trailingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:", v101);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v137[2] = v100;
    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "view");
    v129 = v67;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "heightAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
    v131 = v65;
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "widthAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:multiplier:", v72, 0.265);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v137[3] = v73;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 4);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "arrayByAddingObjectsFromArray:", v74);
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = v107;
    v76 = v113;

    v65 = v131;
    v67 = v129;

    v77 = (void *)v117;
    v78 = (void *)v127;
  }
  else
  {
    -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v75);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v134;
    objc_msgSend(v134, "arrayByAddingObject:", v77);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[AVTSplashScreenViewController desiredHeightForVideoContent](self, "desiredHeightForVideoContent");
  v80 = v79;
  -[AVTSplashScreenViewController viewIfLoaded](self, "viewIfLoaded");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    -[AVTSplashScreenViewController view](self, "view");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "bounds");
    Width = CGRectGetWidth(v139);
    -[AVTSplashScreenViewController view](self, "view");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "layoutMargins");
    v86 = v85;
    -[AVTSplashScreenViewController view](self, "view");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "layoutMargins");
    v89 = Width - (v86 + v88);

  }
  else
  {
    v89 = 300.0;
  }

  -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "widthAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToConstant:", v89);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController setVideoContentWidthConstraint:](self, "setVideoContentWidthConstraint:", v92);

  -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "heightAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToConstant:", v80);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController setVideoContentHeightConstraint:](self, "setVideoContentHeightConstraint:", v95);

  -[AVTSplashScreenViewController videoContentWidthConstraint](self, "videoContentWidthConstraint");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = v96;
  -[AVTSplashScreenViewController videoContentHeightConstraint](self, "videoContentHeightConstraint");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v136[1] = v97;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 2);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "arrayByAddingObjectsFromArray:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v99);
}

- (double)desiredHeightForVideoContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  CGRect v11;
  CGRect v12;

  -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 200.0;
  -[AVTSplashScreenViewController videoContentView](self, "videoContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bounds");
  v8 = CGRectGetWidth(v11) * 0.7 + 0.0;
  -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "bounds");
    v8 = v8 + CGRectGetWidth(v12) * 0.265;
  }

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTSplashScreenViewController;
  -[AVTSplashScreenViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AVTSplashScreenViewController startPlayingVideos](self, "startPlayingVideos");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[AVTSplashScreenViewController stopPlayingVideos](self, "stopPlayingVideos");
  v5.receiver = self;
  v5.super_class = (Class)AVTSplashScreenViewController;
  -[AVTSplashScreenViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double Width;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v16;
  CGRect v17;

  v16.receiver = self;
  v16.super_class = (Class)AVTSplashScreenViewController;
  -[AVTSplashScreenViewController viewWillLayoutSubviews](&v16, sel_viewWillLayoutSubviews);
  -[AVTSplashScreenViewController desiredHeightForVideoContent](self, "desiredHeightForVideoContent");
  v4 = v3;
  -[AVTSplashScreenViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AVTSplashScreenViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    Width = CGRectGetWidth(v17);
    -[AVTSplashScreenViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMargins");
    v10 = v9;
    -[AVTSplashScreenViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutMargins");
    v13 = Width - (v10 + v12);

  }
  else
  {
    v13 = 300.0;
  }

  -[AVTSplashScreenViewController videoContentWidthConstraint](self, "videoContentWidthConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v13);

  -[AVTSplashScreenViewController videoContentHeightConstraint](self, "videoContentHeightConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", v4);

}

- (void)didTapContinueButton:(id)a3
{
  id v4;

  -[AVTSplashScreenViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "splashScreenViewControllerDidConfirm:", self);

}

- (void)detachVideoController
{
  void *v3;
  void *v4;

  -[AVTSplashScreenViewController primaryVideoController](self, "primaryVideoController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("status"));

  -[AVTSplashScreenViewController setPlayerViewController:](self, "setPlayerViewController:", 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;

  v8 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("status")) && objc_msgSend(v8, "status") == 2)
  {
    -[AVTSplashScreenViewController stopPlayingVideos](self, "stopPlayingVideos");
    -[AVTSplashScreenViewController startPlayingVideos](self, "startPlayingVideos");
  }

}

- (void)startPlayingVideos
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

  if (!-[AVTSplashScreenViewController isPlayingVideos](self, "isPlayingVideos"))
  {
    -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, 0);

    -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "play");

    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "player");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, 0);

      -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "play");

    }
    -[AVTSplashScreenViewController setIsPlayingVideos:](self, "setIsPlayingVideos:", 1);
  }
}

- (void)stopPlayingVideos
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[AVTSplashScreenViewController isPlayingVideos](self, "isPlayingVideos"))
  {
    -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("status"));

    -[AVTSplashScreenViewController playerViewController](self, "playerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pause");

    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:forKeyPath:", self, CFSTR("status"));

    -[AVTSplashScreenViewController secondaryPlayerViewController](self, "secondaryPlayerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pause");

    -[AVTSplashScreenViewController setIsPlayingVideos:](self, "setIsPlayingVideos:", 0);
  }
}

- (AVTSplashScreenViewControllerDelegate)delegate
{
  return (AVTSplashScreenViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (UIView)videoContentView
{
  return self->_videoContentView;
}

- (void)setVideoContentView:(id)a3
{
  objc_storeStrong((id *)&self->_videoContentView, a3);
}

- (AVTSplashScreenConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (BOOL)isPlayingVideos
{
  return self->_isPlayingVideos;
}

- (void)setIsPlayingVideos:(BOOL)a3
{
  self->_isPlayingVideos = a3;
}

- (AVQueuePlayer)queuePlayer
{
  return self->_queuePlayer;
}

- (void)setQueuePlayer:(id)a3
{
  objc_storeStrong((id *)&self->_queuePlayer, a3);
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewController, a3);
}

- (AVQueuePlayer)secondaryQueuePlayer
{
  return self->_secondaryQueuePlayer;
}

- (void)setSecondaryQueuePlayer:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryQueuePlayer, a3);
}

- (AVPlayerViewController)secondaryPlayerViewController
{
  return self->_secondaryPlayerViewController;
}

- (void)setSecondaryPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryPlayerViewController, a3);
}

- (NSLayoutConstraint)videoContentWidthConstraint
{
  return self->_videoContentWidthConstraint;
}

- (void)setVideoContentWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_videoContentWidthConstraint, a3);
}

- (NSLayoutConstraint)videoContentHeightConstraint
{
  return self->_videoContentHeightConstraint;
}

- (void)setVideoContentHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_videoContentHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoContentHeightConstraint, 0);
  objc_storeStrong((id *)&self->_videoContentWidthConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryPlayerViewController, 0);
  objc_storeStrong((id *)&self->_secondaryQueuePlayer, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_queuePlayer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_videoContentView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
