@implementation HUAnnounceRecordingViewController

- (HUAnnounceRecordingViewController)initWithServiceContext:(id)a3 blurEffectStyle:(int64_t)a4
{
  id v7;
  HUAnnounceRecordingViewController *v8;
  uint64_t v9;
  UIBlurEffect *blurEffect;
  UIImpactFeedbackGenerator *v11;
  UIImpactFeedbackGenerator *feedbackGenerator;
  uint64_t v13;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v15;
  ANAnnounce *v16;
  ANAnnounce *announce;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUAnnounceRecordingViewController;
  v8 = -[HUAnnounceRecordingViewController init](&v19, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", a4);
    v9 = objc_claimAutoreleasedReturnValue();
    blurEffect = v8->_blurEffect;
    v8->_blurEffect = (UIBlurEffect *)v9;

    objc_storeStrong((id *)&v8->_serviceContext, a3);
    v11 = (UIImpactFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0CEA660]);
    feedbackGenerator = v8->_feedbackGenerator;
    v8->_feedbackGenerator = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v8, sel__didTap_);
    tapGestureRecognizer = v8->_tapGestureRecognizer;
    v8->_tapGestureRecognizer = (UITapGestureRecognizer *)v13;

    -[UITapGestureRecognizer setDelegate:](v8->_tapGestureRecognizer, "setDelegate:", v8);
    -[HUAnnounceRecordingViewController view](v8, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addGestureRecognizer:", v8->_tapGestureRecognizer);

    v16 = (ANAnnounce *)objc_alloc_init(MEMORY[0x1E0CF7DD8]);
    announce = v8->_announce;
    v8->_announce = v16;

    -[HUAnnounceRecordingViewController _commonInit](v8, "_commonInit");
  }

  return v8;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  HUAnnounceRecordingViewController *v11;

  -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allHomesFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__HUAnnounceRecordingViewController__commonInit__block_invoke;
  v9[3] = &unk_1E6F56510;
  v10 = v4;
  v11 = self;
  v7 = v4;
  v8 = (id)objc_msgSend(v6, "addCompletionBlock:", v9);

}

void __48__HUAnnounceRecordingViewController__commonInit__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "Error fetching HomeKit Homes: %@", buf, 0xCu);
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__HUAnnounceRecordingViewController__commonInit__block_invoke_2;
    v13[3] = &unk_1E6F564E8;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v5, "na_firstObjectPassingTest:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setCurrentHome:", v8);
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "currentHome");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v16 = v5;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Fetched HomeKit Homes: [%@] currentHome ID = [%@] ANHomeID = [%@]", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_updateUIBasedOnReachabilityStatus");

    v7 = v14;
  }

}

uint64_t __48__HUAnnounceRecordingViewController__commonInit__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
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
  UIVisualEffectView *v11;
  UIVisualEffectView *dismissLabelVisualEffectView;
  void *v13;
  UILabel *v14;
  UILabel *dismissLabel;
  void *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  UIVisualEffectView *v33;
  UIVisualEffectView *closeButtonVisualEffectView;
  void *v35;
  UIButton *v36;
  UIButton *closeButton;
  UIButton *v38;
  void *v39;
  void *v40;
  id v41;
  double v42;
  double v43;
  double v44;
  double v45;
  UIView *v46;
  UIView *contentView;
  UIView *v48;
  void *v49;
  void *v50;
  UILabel *v51;
  UILabel *largeTitleLabel;
  void *v53;
  void *v54;
  void *v55;
  UILabel *v56;
  void *v57;
  UILabel *v58;
  UILabel *subTitleLabel;
  void *v60;
  void *v61;
  HUWaveformView *v62;
  void *v63;
  void *v64;
  HUWaveformView *v65;
  HUWaveformView *audioWaveformView;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  UILabel *v71;
  UILabel *announcementDeliveryFailureLabel;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  HURecordingButton *v82;
  void *v83;
  HURecordingButton *v84;
  HURecordingButton *recordButton;
  void *v86;
  void *v87;
  UILabel *v88;
  UILabel *recordingStateChangeLabel;
  uint64_t v90;
  void *v91;
  void *v92;
  UILabel *v93;
  UILabel *errorStatusLabel;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  UIVisualEffectView *v100;
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
  NSLayoutConstraint *v115;
  NSLayoutConstraint *dismissLabelTopConstraint;
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
  NSLayoutConstraint *v134;
  NSLayoutConstraint *closeButtonTopConstraint;
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
  double v159;
  double v160;
  void *v161;
  uint64_t v162;
  unint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  NSLayoutConstraint *v167;
  NSLayoutConstraint *contentViewTopConstraint;
  void *v169;
  _BOOL4 v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  _BOOL4 v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  double v184;
  double v185;
  void *v186;
  void *v187;
  NSLayoutConstraint *v188;
  NSLayoutConstraint *contentViewTrailingConstraint;
  void *v190;
  double v191;
  double v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  NSLayoutConstraint *v197;
  NSLayoutConstraint *v198;
  void *v199;
  NSLayoutConstraint *v200;
  NSLayoutConstraint *contentViewWidthConstraint;
  void *v202;
  NSLayoutConstraint *v203;
  NSLayoutConstraint *contentViewHeightConstraint;
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
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  double v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  id v285;
  void *v286;
  void *v287;
  id v288;
  void *v289;
  void *v290;
  id v291;
  _QWORD v292[5];
  _QWORD v293[5];
  id v294;
  objc_super v295;
  uint64_t v296;
  _QWORD v297[3];
  CGRect v298;
  CGRect v299;
  CGRect v300;
  CGRect v301;

  v297[1] = *MEMORY[0x1E0C80C00];
  v295.receiver = self;
  v295.super_class = (Class)HUAnnounceRecordingViewController;
  -[HUAnnounceRecordingViewController viewDidLoad](&v295, sel_viewDidLoad);
  -[HUAnnounceRecordingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D311B8]), "initWithAudioRecorderDelegate:", self);
  -[HUAnnounceRecordingViewController setAudioRecorder:](self, "setAudioRecorder:", v4);

  -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareRecording");

  -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playAlertSoundForType:withCompletion:", 0, 0);

  -[HUAnnounceRecordingViewController audioWaveformView](self, "audioWaveformView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearPowerLevels");

  v8 = (void *)MEMORY[0x1E0CEABA8];
  -[HUAnnounceRecordingViewController blurEffect](self, "blurEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectForBlurEffect:style:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v10);
  dismissLabelVisualEffectView = self->_dismissLabelVisualEffectView;
  self->_dismissLabelVisualEffectView = v11;

  -[HUAnnounceRecordingViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "naui_addAutoLayoutSubview:", self->_dismissLabelVisualEffectView);

  v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  dismissLabel = self->_dismissLabel;
  self->_dismissLabel = v14;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_dismissLabel, "setFont:", v16);

  -[UILabel setTextAlignment:](self->_dismissLabel, "setTextAlignment:", 1);
  v17 = self->_dismissLabel;
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceDismissLabel_Title"), CFSTR("HUAnnounceDismissLabel_Title"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v17, "setText:", v18);

  v19 = self->_dismissLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v19, "setTextColor:", v20);

  -[UILabel setAlpha:](self->_dismissLabel, "setAlpha:", 0.0);
  -[UIVisualEffectView contentView](self->_dismissLabelVisualEffectView, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "naui_addAutoLayoutSubview:", self->_dismissLabel);

  -[UILabel text](self->_dismissLabel, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v24;
  v296 = *MEMORY[0x1E0CEA098];
  -[UILabel font](self->_dismissLabel, "font");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v297[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v297, &v296, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "boundingRectWithSize:options:attributes:context:", 1, v27, 0, v25, 3.40282347e38);
  v29 = v28;

  v30 = (void *)MEMORY[0x1E0CEABA8];
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "effectForBlurEffect:style:", v31, 1);
  v32 = objc_claimAutoreleasedReturnValue();

  v290 = (void *)v32;
  v33 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v32);
  closeButtonVisualEffectView = self->_closeButtonVisualEffectView;
  self->_closeButtonVisualEffectView = v33;

  -[HUAnnounceRecordingViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "naui_addAutoLayoutSubview:", self->_closeButtonVisualEffectView);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v36 = (UIButton *)objc_claimAutoreleasedReturnValue();
  closeButton = self->_closeButton;
  self->_closeButton = v36;

  -[UIButton addTarget:action:forControlEvents:](self->_closeButton, "addTarget:action:forControlEvents:", self, sel__dismissDownRecordingView_, 64);
  v38 = self->_closeButton;
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_closeButtonImage");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](v38, "setImage:forState:", v39, 0);

  -[UIVisualEffectView contentView](self->_closeButtonVisualEffectView, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "naui_addAutoLayoutSubview:", self->_closeButton);

  v41 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v43 = *MEMORY[0x1E0C9D648];
  v42 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v45 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v44 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v46 = (UIView *)objc_msgSend(v41, "initWithFrame:", *MEMORY[0x1E0C9D648], v42, v45, v44);
  contentView = self->_contentView;
  self->_contentView = v46;

  v48 = self->_contentView;
  -[HUAnnounceRecordingViewController _contentViewBackgroundColor](self, "_contentViewBackgroundColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v48, "setBackgroundColor:", v49);

  -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", 16.0);
  -[UIView setAlpha:](self->_contentView, "setAlpha:", 0.0);
  -[HUAnnounceRecordingViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "naui_addAutoLayoutSubview:", self->_contentView);

  v289 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__didPan_);
  -[UIView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:");
  v51 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  largeTitleLabel = self->_largeTitleLabel;
  self->_largeTitleLabel = v51;

  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB5B0]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "fontDescriptorWithSymbolicTraits:", 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v54, 0.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_largeTitleLabel, "setFont:", v55);

  -[UILabel setTextAlignment:](self->_largeTitleLabel, "setTextAlignment:", 1);
  v56 = self->_largeTitleLabel;
  -[HUAnnounceRecordingViewController _largeTitleTextColor](self, "_largeTitleTextColor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v56, "setTextColor:", v57);

  -[UILabel setAlpha:](self->_largeTitleLabel, "setAlpha:", 0.0);
  -[UILabel setLineBreakMode:](self->_largeTitleLabel, "setLineBreakMode:", 4);
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_largeTitleLabel);
  v58 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  subTitleLabel = self->_subTitleLabel;
  self->_subTitleLabel = v58;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB588]);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subTitleLabel, "setFont:", v60);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_subTitleLabel, "setTextColor:", v61);

  -[UILabel setTextAlignment:](self->_subTitleLabel, "setTextAlignment:", 1);
  -[UILabel setAlpha:](self->_subTitleLabel, "setAlpha:", 0.0);
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_subTitleLabel);
  v62 = [HUWaveformView alloc];
  -[HUAnnounceRecordingViewController _waveformColor](self, "_waveformColor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = -[HUWaveformView initWithFrame:waveformColor:backgroundColor:](v62, "initWithFrame:waveformColor:backgroundColor:", v63, v64, v43, v42, v45, v44);
  audioWaveformView = self->_audioWaveformView;
  self->_audioWaveformView = v65;

  -[HUWaveformView setAlpha:](self->_audioWaveformView, "setAlpha:", 0.0);
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_audioWaveformView);
  -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "roomName");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68;
  if (v68)
  {
    v291 = v68;
  }
  else
  {
    -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "homeName");
    v291 = (id)objc_claimAutoreleasedReturnValue();

  }
  v71 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v43, v42, v45, v44);
  announcementDeliveryFailureLabel = self->_announcementDeliveryFailureLabel;
  self->_announcementDeliveryFailureLabel = v71;

  -[UILabel setAlpha:](self->_announcementDeliveryFailureLabel, "setAlpha:", 0.0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_announcementDeliveryFailureLabel, "setFont:", v73);

  -[UILabel setTextAlignment:](self->_announcementDeliveryFailureLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_announcementDeliveryFailureLabel, "setTextColor:", v74);

  HULocalizedStringWithFormat(CFSTR("HUAnnounceNotDeliveredLabel_Description"), CFSTR("%@"), v75, v76, v77, v78, v79, v80, (uint64_t)v291);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_announcementDeliveryFailureLabel, "setText:", v81);

  -[UILabel setNumberOfLines:](self->_announcementDeliveryFailureLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_announcementDeliveryFailureLabel, "setLineBreakMode:", 0);
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_announcementDeliveryFailureLabel);
  v82 = [HURecordingButton alloc];
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_recordingButtonWaveformImage");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = -[HURecordingButton initWithSize:state:image:](v82, "initWithSize:state:image:", 0, v83, 72.0, 72.0);
  recordButton = self->_recordButton;
  self->_recordButton = v84;

  -[HURecordingButton setAlpha:](self->_recordButton, "setAlpha:", 0.0);
  -[HURecordingButton setIsAccessibilityElement:](self->_recordButton, "setIsAccessibilityElement:", 1);
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordButton_AX_Label_Title"), CFSTR("HUAnnounceRecordButton_AX_Label_Title"), 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecordingButton setAccessibilityLabel:](self->_recordButton, "setAccessibilityLabel:", v86);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordButton_AX_Label_Hint"), CFSTR("HUAnnounceRecordButton_AX_Label_Hint"), 1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecordingButton setAccessibilityHint:](self->_recordButton, "setAccessibilityHint:", v87);

  -[HURecordingButton addTarget:action:forControlEvents:](self->_recordButton, "addTarget:action:forControlEvents:", self, sel_beginRecording_, 64);
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_recordButton);
  v88 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  recordingStateChangeLabel = self->_recordingStateChangeLabel;
  self->_recordingStateChangeLabel = v88;

  v90 = *MEMORY[0x1E0CEB558];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_recordingStateChangeLabel, "setFont:", v91);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_recordingStateChangeLabel, "setTextColor:", v92);

  -[UILabel setTextAlignment:](self->_recordingStateChangeLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_recordingStateChangeLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setAlpha:](self->_recordingStateChangeLabel, "setAlpha:", 0.0);
  -[UILabel setIsAccessibilityElement:](self->_recordingStateChangeLabel, "setIsAccessibilityElement:", 0);
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_recordingStateChangeLabel);
  v93 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  errorStatusLabel = self->_errorStatusLabel;
  self->_errorStatusLabel = v93;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v90);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_errorStatusLabel, "setFont:", v95);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_errorStatusLabel, "setTextColor:", v96);

  -[UILabel setTextAlignment:](self->_errorStatusLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_errorStatusLabel, "setNumberOfLines:", 0);
  -[UILabel setAlpha:](self->_errorStatusLabel, "setAlpha:", 0.0);
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_errorStatusLabel);
  v97 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v98, "userInterfaceIdiom");

  v100 = self->_dismissLabelVisualEffectView;
  if ((v99 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[UIVisualEffectView centerXAnchor](v100, "centerXAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:", v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "addObject:", v103);
  }
  else
  {
    -[UIVisualEffectView leadingAnchor](v100, "leadingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnounceRecordingViewController view](self, "view");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "safeAreaLayoutGuide");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "leadingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "addObject:", v105);

  }
  -[UIVisualEffectView trailingAnchor](self->_dismissLabelVisualEffectView, "trailingAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController view](self, "view");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "safeAreaLayoutGuide");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "trailingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v110);

  -[UIVisualEffectView topAnchor](self->_dismissLabelVisualEffectView, "topAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController view](self, "view");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "safeAreaLayoutGuide");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "topAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:constant:", v114, -25.0);
  v115 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  dismissLabelTopConstraint = self->_dismissLabelTopConstraint;
  self->_dismissLabelTopConstraint = v115;

  objc_msgSend(v97, "addObject:", self->_dismissLabelTopConstraint);
  -[UIVisualEffectView heightAnchor](self->_dismissLabelVisualEffectView, "heightAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "constraintEqualToConstant:", v29);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v118);

  -[UILabel leadingAnchor](self->_dismissLabel, "leadingAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView leadingAnchor](self->_dismissLabelVisualEffectView, "leadingAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "constraintEqualToAnchor:", v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v121);

  -[UILabel trailingAnchor](self->_dismissLabel, "trailingAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView trailingAnchor](self->_dismissLabelVisualEffectView, "trailingAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "constraintEqualToAnchor:", v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v124);

  -[UILabel topAnchor](self->_dismissLabel, "topAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_dismissLabelVisualEffectView, "topAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:", v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v127);

  -[UILabel heightAnchor](self->_dismissLabel, "heightAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView heightAnchor](self->_dismissLabelVisualEffectView, "heightAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "constraintEqualToAnchor:", v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v130);

  -[UIVisualEffectView topAnchor](self->_closeButtonVisualEffectView, "topAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController view](self, "view");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "topAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:constant:", v133, 30.0);
  v134 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  closeButtonTopConstraint = self->_closeButtonTopConstraint;
  self->_closeButtonTopConstraint = v134;

  objc_msgSend(v97, "addObject:", self->_closeButtonTopConstraint);
  -[UIVisualEffectView trailingAnchor](self->_closeButtonVisualEffectView, "trailingAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController view](self, "view");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "safeAreaLayoutGuide");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "trailingAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:constant:", v139, -16.0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v140);

  -[UIVisualEffectView heightAnchor](self->_closeButtonVisualEffectView, "heightAnchor");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "constraintEqualToConstant:", 30.0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v142);

  -[UIVisualEffectView widthAnchor](self->_closeButtonVisualEffectView, "widthAnchor");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView heightAnchor](self->_closeButtonVisualEffectView, "heightAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "constraintEqualToAnchor:", v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v145);

  -[UIButton topAnchor](self->_closeButton, "topAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_closeButtonVisualEffectView, "topAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "constraintEqualToAnchor:", v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v148);

  -[UIButton trailingAnchor](self->_closeButton, "trailingAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView trailingAnchor](self->_closeButtonVisualEffectView, "trailingAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:", v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v151);

  -[UIButton heightAnchor](self->_closeButton, "heightAnchor");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView heightAnchor](self->_closeButtonVisualEffectView, "heightAnchor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "constraintEqualToAnchor:", v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v154);

  -[UIButton widthAnchor](self->_closeButton, "widthAnchor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton heightAnchor](self->_closeButton, "heightAnchor");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "constraintEqualToAnchor:", v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v157);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "bounds");
  v160 = v159;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = objc_msgSend(v161, "userInterfaceIdiom");

  v163 = v162 & 0xFFFFFFFFFFFFFFFBLL;
  -[UIView topAnchor](self->_contentView, "topAnchor");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  if (v163 == 1)
  {
    -[HUAnnounceRecordingViewController view](self, "view");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "topAnchor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "constraintEqualToAnchor:constant:", v166, 30.0);
    v167 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    contentViewTopConstraint = self->_contentViewTopConstraint;
    self->_contentViewTopConstraint = v167;

    objc_msgSend(v97, "addObject:", self->_contentViewTopConstraint);
    -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "animationOriginRect");
    v300.origin.x = v43;
    v300.origin.y = v42;
    v300.size.width = v45;
    v300.size.height = v44;
    v170 = CGRectEqualToRect(v298, v300);

    if (v170)
    {
      -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView leadingAnchor](self->_closeButtonVisualEffectView, "leadingAnchor");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "constraintEqualToAnchor:constant:", v172, -8.0);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "addObject:", v173);

    }
    else
    {
      -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "animationOriginRect");
      v185 = v160 - v184 + 30.0;

      -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView leadingAnchor](self->_closeButtonVisualEffectView, "leadingAnchor");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "constraintEqualToAnchor:constant:", v187, v185);
      v188 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      contentViewTrailingConstraint = self->_contentViewTrailingConstraint;
      self->_contentViewTrailingConstraint = v188;

      objc_msgSend(v97, "addObject:", self->_contentViewTrailingConstraint);
    }
  }
  else
  {
    -[UIVisualEffectView bottomAnchor](self->_closeButtonVisualEffectView, "bottomAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "constraintEqualToAnchor:constant:", v174, 8.0);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "addObject:", v175);

    -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "animationOriginRect");
    v301.origin.x = v43;
    v301.origin.y = v42;
    v301.size.width = v45;
    v301.size.height = v44;
    v177 = CGRectEqualToRect(v299, v301);

    if (v177)
    {
      -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnounceRecordingViewController view](self, "view");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "safeAreaLayoutGuide");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "trailingAnchor");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "constraintEqualToAnchor:constant:", v181, -10.0);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "addObject:", v182);

    }
    else
    {
      -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "animationOriginRect");
      v192 = v160 - v191;

      -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnounceRecordingViewController view](self, "view");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "safeAreaLayoutGuide");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "trailingAnchor");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "constraintEqualToAnchor:constant:", v196, -v192);
      v197 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v198 = self->_contentViewTrailingConstraint;
      self->_contentViewTrailingConstraint = v197;

      objc_msgSend(v97, "addObject:", self->_contentViewTrailingConstraint);
    }
  }
  -[UIView widthAnchor](self->_contentView, "widthAnchor");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "constraintEqualToConstant:", 100.0);
  v200 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewWidthConstraint = self->_contentViewWidthConstraint;
  self->_contentViewWidthConstraint = v200;

  objc_msgSend(v97, "addObject:", self->_contentViewWidthConstraint);
  -[UIView heightAnchor](self->_contentView, "heightAnchor");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "constraintEqualToConstant:", 0.0);
  v203 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewHeightConstraint = self->_contentViewHeightConstraint;
  self->_contentViewHeightConstraint = v203;

  objc_msgSend(v97, "addObject:", self->_contentViewHeightConstraint);
  -[UILabel topAnchor](self->_largeTitleLabel, "topAnchor");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_contentView, "topAnchor");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "constraintEqualToAnchor:constant:", v206, 48.0);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v207);

  -[UILabel centerXAnchor](self->_largeTitleLabel, "centerXAnchor");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "constraintEqualToAnchor:", v209);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v210);

  -[UILabel leadingAnchor](self->_largeTitleLabel, "leadingAnchor");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "constraintEqualToAnchor:", v212);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v213);

  -[UILabel trailingAnchor](self->_largeTitleLabel, "trailingAnchor");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "constraintEqualToAnchor:", v215);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v216);

  -[UILabel topAnchor](self->_subTitleLabel, "topAnchor");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_largeTitleLabel, "bottomAnchor");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "constraintEqualToAnchor:", v218);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v219);

  -[UILabel centerXAnchor](self->_subTitleLabel, "centerXAnchor");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "constraintEqualToAnchor:", v221);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v222);

  -[HUWaveformView leadingAnchor](self->_audioWaveformView, "leadingAnchor");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "constraintEqualToAnchor:", v224);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v225);

  -[HUWaveformView trailingAnchor](self->_audioWaveformView, "trailingAnchor");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "constraintEqualToAnchor:", v227);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v228);

  -[HUWaveformView centerYAnchor](self->_audioWaveformView, "centerYAnchor");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "constraintEqualToAnchor:", v230);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v231);

  -[HUWaveformView heightAnchor](self->_audioWaveformView, "heightAnchor");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "constraintEqualToConstant:", 100.0);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v233);

  -[HUWaveformView topAnchor](self->_audioWaveformView, "topAnchor");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_subTitleLabel, "bottomAnchor");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "constraintEqualToAnchor:constant:", v235, 20.0);
  v236 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v237) = 1132068864;
  objc_msgSend(v236, "setPriority:", v237);
  objc_msgSend(v97, "addObject:", v236);
  -[UILabel leadingAnchor](self->_announcementDeliveryFailureLabel, "leadingAnchor");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "constraintEqualToAnchor:", v239);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v240);

  -[UILabel trailingAnchor](self->_announcementDeliveryFailureLabel, "trailingAnchor");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "constraintEqualToAnchor:", v242);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v243);

  -[UILabel centerYAnchor](self->_announcementDeliveryFailureLabel, "centerYAnchor");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "constraintEqualToAnchor:", v245);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v246);

  -[HURecordingButton topAnchor](self->_recordButton, "topAnchor");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_announcementDeliveryFailureLabel, "bottomAnchor");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v248, 1.0);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v249);

  -[HURecordingButton heightAnchor](self->_recordButton, "heightAnchor");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "constraintEqualToConstant:", 72.0);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v251);

  -[HURecordingButton widthAnchor](self->_recordButton, "widthAnchor");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecordingButton heightAnchor](self->_recordButton, "heightAnchor");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v252, "constraintEqualToAnchor:", v253);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v254);

  -[HURecordingButton centerXAnchor](self->_recordButton, "centerXAnchor");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "constraintEqualToAnchor:", v256);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v257);

  -[UILabel centerXAnchor](self->_recordingStateChangeLabel, "centerXAnchor");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v258, "constraintEqualToAnchor:", v259);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v260);

  -[UILabel topAnchor](self->_recordingStateChangeLabel, "topAnchor");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecordingButton bottomAnchor](self->_recordButton, "bottomAnchor");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v261, "constraintEqualToAnchor:constant:", v262, 8.0);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v263);

  -[UILabel bottomAnchor](self->_recordingStateChangeLabel, "bottomAnchor");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v264, "constraintEqualToAnchor:constant:", v265, -20.0);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v266);

  -[HURecordingButton topAnchor](self->_recordButton, "topAnchor");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_errorStatusLabel, "bottomAnchor");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v267, "constraintEqualToAnchor:constant:", v268, 20.0);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v269);

  -[UILabel centerXAnchor](self->_errorStatusLabel, "centerXAnchor");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "constraintEqualToAnchor:", v271);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v272);

  -[UILabel leadingAnchor](self->_errorStatusLabel, "leadingAnchor");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "constraintEqualToAnchor:", v274);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v275);

  -[UILabel trailingAnchor](self->_errorStatusLabel, "trailingAnchor");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v276, "constraintEqualToAnchor:", v277);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObject:", v278);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v97);
  -[HUAnnounceRecordingViewController view](self, "view");
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v279, "layoutIfNeeded");

  -[HUAnnounceRecordingViewController largeTitleLabel](self, "largeTitleLabel");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "becomeFirstResponder");

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "addAccessoryObserver:", self);

  -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "roomName");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v284 = v283;
  if (v283)
  {
    v285 = v283;
  }
  else
  {
    -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v286, "homeName");
    v285 = (id)objc_claimAutoreleasedReturnValue();

  }
  v287 = (void *)MEMORY[0x1E0CEABB0];
  v292[4] = self;
  v293[0] = MEMORY[0x1E0C809B0];
  v293[1] = 3221225472;
  v293[2] = __48__HUAnnounceRecordingViewController_viewDidLoad__block_invoke;
  v293[3] = &unk_1E6F4C638;
  v293[4] = self;
  v294 = v285;
  v292[0] = MEMORY[0x1E0C809B0];
  v292[1] = 3221225472;
  v292[2] = __48__HUAnnounceRecordingViewController_viewDidLoad__block_invoke_3;
  v292[3] = &unk_1E6F4E300;
  v288 = v285;
  objc_msgSend(v287, "animateWithDuration:animations:completion:", v293, v292, 0.5);

}

void __48__HUAnnounceRecordingViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  void *v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[5];
  id v11;
  CAFrameRateRange v12;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v12.minimum;
  maximum = v12.maximum;
  preferred = v12.preferred;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__HUAnnounceRecordingViewController_viewDidLoad__block_invoke_2;
  v10[3] = &unk_1E6F4C638;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  *(float *)&v7 = minimum;
  *(float *)&v8 = maximum;
  *(float *)&v9 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v10, v7, v8, v9);

}

void __48__HUAnnounceRecordingViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  objc_msgSend(*(id *)(a1 + 32), "contentViewHeightConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", 500.0);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = *(void **)(a1 + 32);
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(v5, "contentViewWidthConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", 395.0);

    objc_msgSend(*(id *)(a1 + 32), "contentViewTrailingConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "contentViewTrailingConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = -8.0;
LABEL_6:
      objc_msgSend(v8, "setConstant:", v10);

    }
  }
  else
  {
    objc_msgSend(v5, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12 + -20.0;
    objc_msgSend(*(id *)(a1 + 32), "contentViewWidthConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConstant:", v13);

    objc_msgSend(*(id *)(a1 + 32), "contentViewTrailingConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "contentViewTrailingConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = -10.0;
      goto LABEL_6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "largeTitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "subTitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "recordingStateChangeLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "largeTitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUAnnounceRecipient_Title"), CFSTR("%@"), v23, v24, v25, v26, v27, v28, *(_QWORD *)(a1 + 40));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v29);

  objc_msgSend(*(id *)(a1 + 32), "subTitleLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSubtitle_Title"), CFSTR("HUAnnounceSubtitle_Title"), 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setText:", v31);

  objc_msgSend(*(id *)(a1 + 32), "recordingStateChangeLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceBeginRecordingLabel_Title"), CFSTR("HUAnnounceBeginRecordingLabel_Title"), 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setText:", v33);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "layoutIfNeeded");

}

uint64_t __48__HUAnnounceRecordingViewController_viewDidLoad__block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2;
  int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  _BYTE v21[10];
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v2 = result;
    v3 = objc_msgSend(*(id *)(result + 32), "_areAllHomePodsOffline");
    if (objc_msgSend(*(id *)(v2 + 32), "_isRoomContext"))
    {
      objc_msgSend(*(id *)(v2 + 32), "currentHome");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(*(id *)(v2 + 32), "serviceContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "roomIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v5, "initWithUUIDString:", v7);
      objc_msgSend(v4, "hf_roomWithIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "hf_hasAtleastOneHomePod");
      if (v10)
        v11 = objc_msgSend(v9, "hf_hasAtleastOneReachableHomePod");
      else
        v11 = 0;
      HFLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "uniqueIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412802;
        *(_QWORD *)v21 = v14;
        *(_WORD *)&v21[8] = 1024;
        v22 = v10;
        v23 = 1024;
        v24 = v11;
        _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "Room ID [%@], hasAtleastOneHomePodInThisRoom:%{BOOL}d, isAtleastOneHomePodOnlineInThisRoom:%{BOOL}d", (uint8_t *)&v20, 0x18u);

      }
      v12 = v10 ^ 1;
    }
    else
    {
      v11 = 0;
      v12 = 1;
    }
    if (objc_msgSend(*(id *)(v2 + 32), "_isRoomContext"))
      v15 = v11 | v12;
    else
      v15 = 0;
    v16 = objc_msgSend(*(id *)(v2 + 32), "_isHomeContext") & (v3 ^ 1);
    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 67109376;
      *(_DWORD *)v21 = v15;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = v16;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "shouldBeginRecordingForRoom:%{BOOL}d, shouldBeginRecordingForHome:%{BOOL}d", (uint8_t *)&v20, 0xEu);
    }

    v18 = *(void **)(v2 + 32);
    if ((v15 | v16) == 1)
    {
      objc_msgSend(v18, "feedbackGenerator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "prepare");

      return objc_msgSend(*(id *)(v2 + 32), "beginRecording:", 0);
    }
    else
    {
      return objc_msgSend(v18, "_updateUIBasedOnReachabilityStatus");
    }
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRecording");

  if (v4)
  {
    -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopRecording");

  }
  -[HUAnnounceRecordingViewController _deleteAudioFile](self, "_deleteAudioFile");
  v6.receiver = self;
  v6.super_class = (Class)HUAnnounceRecordingViewController;
  -[HUAnnounceRecordingViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HUAnnounceRecordingViewController contentView](self, "contentView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController _contentViewBackgroundColor](self, "_contentViewBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[HUAnnounceRecordingViewController largeTitleLabel](self, "largeTitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController _largeTitleTextColor](self, "_largeTitleTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

  -[HUAnnounceRecordingViewController audioWaveformView](self, "audioWaveformView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController _waveformColor](self, "_waveformColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWaveformColor:", v8);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUAnnounceRecordingViewController;
  -[HUAnnounceRecordingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[HUAnnounceRecordingViewController contentViewWidthConstraint](self, "contentViewWidthConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", 395.0);

  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)beginRecording:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
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
  _QWORD v27[5];
  uint8_t buf[16];

  -[HUAnnounceRecordingViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D311B8]), "initWithAudioRecorderDelegate:", self);
    -[HUAnnounceRecordingViewController setAudioRecorder:](self, "setAudioRecorder:", v6);

    -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prepareRecording");

    -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playAlertSoundForType:withCompletion:", 0, 0);

    -[HUAnnounceRecordingViewController audioWaveformView](self, "audioWaveformView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearPowerLevels");

  }
  -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isRecording");

  if ((v11 & 1) == 0)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CF7DD8]);
    objc_msgSend(v12, "prewarmWithHandler:", 0);
    -[HUAnnounceRecordingViewController feedbackGenerator](self, "feedbackGenerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "impactOccurredWithIntensity:", 1.0);

    -[HUAnnounceRecordingViewController feedbackGenerator](self, "feedbackGenerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "prepare");

    -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRecordingDurationLimit:", 60.0);

    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "Calling startRecording", buf, 2u);
    }

    -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startRecording");

    -[HUAnnounceRecordingViewController recordingStateChangeLabel](self, "recordingStateChangeLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordingStopLabel_Title"), CFSTR("HUAnnounceRecordingStopLabel_Title"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v19);

    -[HUAnnounceRecordingViewController recordingStateChangeLabel](self, "recordingStateChangeLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setEnabled:", 1);

    -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_recordingButtonStopImage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:forState:animated:", v22, 4, 1);

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __52__HUAnnounceRecordingViewController_beginRecording___block_invoke;
    v27[3] = &unk_1E6F4D988;
    v27[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v27, 0.25);
    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStopRecordButton_AX_Label_Title"), CFSTR("HUAnnounceStopRecordButton_AX_Label_Title"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAccessibilityLabel:", v23);

    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStopRecordButton_AX_Label_Hint"), CFSTR("HUAnnounceStopRecordButton_AX_Label_Hint"), 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAccessibilityHint:", v25);

  }
}

void __52__HUAnnounceRecordingViewController_beginRecording___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "audioWaveformView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "announcementDeliveryFailureLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "errorStatusLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Waveform is now shown", v7, 2u);
  }

}

- (void)stopRecordAndSend:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HUAnnounceRecordingViewController feedbackGenerator](self, "feedbackGenerator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

  -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopRecording");

}

- (void)sendAnnouncement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "roomIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnounceRecordingViewController announce](self, "announce");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController recordedAnnouncementURL](self, "recordedAnnouncementURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    objc_msgSend(v9, "roomIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithUUIDString:", v11);
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "homeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithUUIDString:", v16);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke;
    v19[3] = &unk_1E6F56538;
    v19[4] = self;
    objc_msgSend(v6, "sendAnnouncement:toRoomsWithIDs:andZonesWithIDs:inHomeWithID:completion:", v7, v13, MEMORY[0x1E0C9AA60], v17, v19);

  }
  else
  {
    objc_msgSend(v9, "homeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithUUIDString:", v11);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke_2;
    v18[3] = &unk_1E6F56538;
    v18[4] = self;
    objc_msgSend(v6, "sendAnnouncement:toHomeWithID:completion:", v7, v12, v18);
  }

}

void __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "serviceContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "roomIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Error sending announcement to Room with ID [%@] - [%@]", buf, 0x16u);

    }
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke_62;
  v9[3] = &unk_1E6F4C638;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke_62(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissViewOrDisplayError:", *(_QWORD *)(a1 + 40));
}

void __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "serviceContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "homeIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Error sending announcement to Home with ID [%@] - [%@]", buf, 0x16u);

    }
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke_64;
  v9[3] = &unk_1E6F4C638;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke_64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissViewOrDisplayError:", *(_QWORD *)(a1 + 40));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;

  v6 = a3;
  objc_msgSend(a4, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {
    -[HUAnnounceRecordingViewController tapGestureRecognizer](self, "tapGestureRecognizer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v10 != v6;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_didTap:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  _BOOL4 v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  char v23;
  char v24;

  v4 = a3;
  -[HUAnnounceRecordingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationOfTouch:inView:", 0, v5);
  v7 = v6;
  v9 = v8;

  -[HUAnnounceRecordingViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  -[HUAnnounceRecordingViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  if (v9 > v12 + v14)
  {
    v17 = 1;
  }
  else
  {
    -[HUAnnounceRecordingViewController contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v9 < v16;

  }
  -[HUAnnounceRecordingViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  v23 = v7 < v20 || v17;
  if ((v22 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v24 = v23;
  else
    v24 = 0;
  if ((v24 & 1) != 0 || v17)
  {
    -[HUAnnounceRecordingViewController _submitAnalyticsForAnnounceRecordingCompletdSuccessfully:interruptedByUser:](self, "_submitAnalyticsForAnnounceRecordingCompletdSuccessfully:interruptedByUser:", 1, 1);
    -[HUAnnounceRecordingViewController _dismissUpRecordingView:](self, "_dismissUpRecordingView:", 0);
  }
}

- (void)_didPan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v4 = a3;
  -[HUAnnounceRecordingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;

  v8 = objc_msgSend(v4, "state");
  if (v8 == 3)
  {
    -[HUAnnounceRecordingViewController closeButtonTopConstraint](self, "closeButtonTopConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constant");
    v11 = v10;

    if (v11 > 120.0)
    {
      -[HUAnnounceRecordingViewController _dismissDownRecordingView:](self, "_dismissDownRecordingView:", 0);
      return;
    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "userInterfaceIdiom");

    if ((v23 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[HUAnnounceRecordingViewController contentViewTopConstraint](self, "contentViewTopConstraint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setConstant:", 30.0);

    }
    -[HUAnnounceRecordingViewController closeButtonTopConstraint](self, "closeButtonTopConstraint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setConstant:", 30.0);

    -[NSLayoutConstraint setConstant:](self->_dismissLabelTopConstraint, "setConstant:", -25.0);
    -[UILabel setAlpha:](self->_dismissLabel, "setAlpha:", 0.0);
    -[HUAnnounceRecordingViewController view](self, "view");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNeedsLayout");
    goto LABEL_13;
  }
  if (v7 > 49.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[HUAnnounceRecordingViewController contentViewTopConstraint](self, "contentViewTopConstraint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setConstant:", v7);

    }
    -[HUAnnounceRecordingViewController closeButtonTopConstraint](self, "closeButtonTopConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setConstant:", v7);

    v16 = v7 + -25.0;
    -[NSLayoutConstraint setConstant:](self->_dismissLabelTopConstraint, "setConstant:", v16);
    -[HUAnnounceRecordingViewController dismissLabel](self, "dismissLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlpha:", v16 / 120.0);

    -[HUAnnounceRecordingViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutIfNeeded");

    -[HUAnnounceRecordingViewController closeButtonTopConstraint](self, "closeButtonTopConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constant");
    v21 = v20;

    if (v21 > 120.0)
    {
      -[HUAnnounceRecordingViewController feedbackGenerator](self, "feedbackGenerator");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "impactOccurredWithIntensity:", 1.0);
LABEL_13:

    }
  }
}

- (void)_dismissUpRecordingView:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HUAnnounceRecordingViewController__dismissUpRecordingView___block_invoke;
  v4[3] = &unk_1E6F4D988;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__HUAnnounceRecordingViewController__dismissUpRecordingView___block_invoke_3;
  v3[3] = &unk_1E6F4E300;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v4, v3, 0.25, 0.0);
}

uint64_t __61__HUAnnounceRecordingViewController__dismissUpRecordingView___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HUAnnounceRecordingViewController__dismissUpRecordingView___block_invoke_2;
  v4[3] = &unk_1E6F4D988;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __61__HUAnnounceRecordingViewController__dismissUpRecordingView___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
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
  id v24;

  objc_msgSend(*(id *)(a1 + 32), "dismissLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "contentViewTrailingConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    objc_msgSend(*(id *)(a1 + 32), "serviceContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animationOriginRect");
    v11 = v10;

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v12 = v5 - (v11 + 8.0);
    else
      v12 = -(v5 - v11);
    objc_msgSend(*(id *)(a1 + 32), "contentViewTrailingConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstant:", v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "contentViewHeightConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "contentViewWidthConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", 100.0);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "largeTitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "subTitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "recordingStateChangeLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layoutIfNeeded");

}

void __61__HUAnnounceRecordingViewController__dismissUpRecordingView___block_invoke_3(uint64_t a1, int a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceContext");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteViewControllerProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidate");

  }
}

- (void)_dismissDownRecordingView:(id)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  -[HUAnnounceRecordingViewController _submitAnalyticsForAnnounceRecordingCompletdSuccessfully:interruptedByUser:](self, "_submitAnalyticsForAnnounceRecordingCompletdSuccessfully:interruptedByUser:", 1, 1);
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke;
  v5[3] = &unk_1E6F4D988;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_3;
  v4[3] = &unk_1E6F4E300;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v5, v4, 0.5, 0.0);
}

uint64_t __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_2;
  v4[3] = &unk_1E6F4D988;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "contentViewTopConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "closeButtonTopConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v10);

  objc_msgSend(*(id *)(a1 + 32), "dismissLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

}

uint64_t __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  uint64_t v7;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(v2 + 32), "closeButtonVisualEffectView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_4;
    v6[3] = &unk_1E6F4D988;
    v7 = *(_QWORD *)(v2 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_6;
    v5[3] = &unk_1E6F4E300;
    v5[4] = v7;
    return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v6, v5, 0.25);
  }
  return result;
}

uint64_t __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_5;
  v4[3] = &unk_1E6F4D988;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_6(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "serviceContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewControllerProxy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

- (id)_fontForTimeCodeLabel
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB548], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CEB518];
  v12[0] = *MEMORY[0x1E0CEB520];
  v12[1] = v3;
  v13[0] = &unk_1E7041170;
  v13[1] = &unk_1E7041188;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0CEB4D0];
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_stringForDuration:(double)a3
{
  if (qword_1EF226AB0 != -1)
    dispatch_once(&qword_1EF226AB0, &__block_literal_global_132);
  return (id)objc_msgSend((id)_MergedGlobals_3_5, "stringFromTimeInterval:", a3);
}

uint64_t __56__HUAnnounceRecordingViewController__stringForDuration___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)_MergedGlobals_3_5;
  _MergedGlobals_3_5 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_3_5, "setUnitsStyle:", 0);
  objc_msgSend((id)_MergedGlobals_3_5, "setZeroFormattingBehavior:", 0x10000);
  return objc_msgSend((id)_MergedGlobals_3_5, "setAllowedUnits:", 192);
}

- (void)_restoreRecordingUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[5];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    -[HUAnnounceRecordingViewController recordingStateChangeLabel](self, "recordingStateChangeLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceBeginRecordingLabel_Title"), CFSTR("HUAnnounceBeginRecordingLabel_Title"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", v4);

    -[HUAnnounceRecordingViewController recordingStateChangeLabel](self, "recordingStateChangeLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_recordingButtonWaveformImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:forState:animated:", v7, 0, 1);

    -[HUAnnounceRecordingViewController audioWaveformView](self, "audioWaveformView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.0);

    -[HUAnnounceRecordingViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutIfNeeded");

    -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 1);

    -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentMode:", 2);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__HUAnnounceRecordingViewController__restoreRecordingUI__block_invoke;
    block[3] = &unk_1E6F4D988;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __56__HUAnnounceRecordingViewController__restoreRecordingUI__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restoreRecordingUI");
}

- (BOOL)_areAllHomePodsOffline
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  const __CFString *v15;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[HUAnnounceRecordingViewController _isRoomContext](self, "_isRoomContext"))
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Checking reachability for context Room", (uint8_t *)&v17, 2u);
    }

    -[HUAnnounceRecordingViewController currentHome](self, "currentHome");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "roomIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithUUIDString:", v7);
    objc_msgSend(v4, "hf_roomWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "hf_hasAtleastOneReachableHomePod") ^ 1;
  }
  else if (-[HUAnnounceRecordingViewController _isHomeContext](self, "_isHomeContext"))
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "Checking reachability for context Home", (uint8_t *)&v17, 2u);
    }

    -[HUAnnounceRecordingViewController currentHome](self, "currentHome");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hf_hasAtleastOneReachableHomePod");

    v10 = v13 ^ 1;
  }
  else
  {
    v10 = 0;
  }
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("NO");
    if (v10)
      v15 = CFSTR("YES");
    v17 = 138412290;
    v18 = v15;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "allHomePodsAreOffline = [%@]", (uint8_t *)&v17, 0xCu);
  }

  return v10;
}

- (void)_updateUIBasedOnReachabilityStatus
{
  _BOOL4 v3;
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
  double v15;
  void *v16;
  id v17;

  v3 = -[HUAnnounceRecordingViewController _areAllHomePodsOffline](self, "_areAllHomePodsOffline");
  -[HUAnnounceRecordingViewController recordedAnnouncementURL](self, "recordedAnnouncementURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v4)
    {
      -[HUAnnounceRecordingViewController recordingStateChangeLabel](self, "recordingStateChangeLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceButton_Title"), CFSTR("HUAnnounceButton_Title"), 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setText:", v6);

      -[HUAnnounceRecordingViewController recordingStateChangeLabel](self, "recordingStateChangeLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 1.0);

      -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "hu_recordingButtonWaveformImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:forState:animated:", v9, 0, 1);

      -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEnabled:", 0);

      -[HUAnnounceRecordingViewController errorStatusLabel](self, "errorStatusLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceHomePodsUnavailable_Error_Message"), CFSTR("HUAnnounceHomePodsUnavailable_Error_Message"), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v12);

      -[HUAnnounceRecordingViewController errorStatusLabel](self, "errorStatusLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 1.0;
LABEL_6:
      objc_msgSend(v13, "setAlpha:", v15);

    }
  }
  else if (!v4)
  {
    -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEnabled:", 1);

    -[HUAnnounceRecordingViewController errorStatusLabel](self, "errorStatusLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 0.0;
    goto LABEL_6;
  }
  -[HUAnnounceRecordingViewController view](self, "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutIfNeeded");

}

- (BOOL)_isRoomContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roomIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_isHomeContext
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roomIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    -[HUAnnounceRecordingViewController serviceContext](self, "serviceContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

- (void)_deleteRecording:(id)a3
{
  void *v4;

  -[HUAnnounceRecordingViewController _deleteAudioFile](self, "_deleteAudioFile", a3);
  -[HUAnnounceRecordingViewController audioWaveformView](self, "audioWaveformView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearPowerLevels");

  -[HUAnnounceRecordingViewController _hideRecordingUI](self, "_hideRecordingUI");
}

- (void)_deleteAudioFile
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HUAnnounceRecordingViewController recordedAnnouncementURL](self, "recordedAnnouncementURL");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnounceRecordingViewController recordedAnnouncementURL](self, "recordedAnnouncementURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "fileExistsAtPath:", v7);

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnounceRecordingViewController recordedAnnouncementURL](self, "recordedAnnouncementURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(v9, "removeItemAtURL:error:", v10, &v13);
      v11 = v13;

      if (v11)
      {
        HFLogForCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v11;
          _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "Error deleting audio file [%@]", buf, 0xCu);
        }

      }
    }
  }
  -[HUAnnounceRecordingViewController setRecordedAnnouncementURL:](self, "setRecordedAnnouncementURL:", 0);
}

- (void)_hideRecordingUI
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_recordingButtonWaveformImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forState:animated:", v4, 0, 1);

  v5[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HUAnnounceRecordingViewController__hideRecordingUI__block_invoke;
  v6[3] = &unk_1E6F4D988;
  v6[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__HUAnnounceRecordingViewController__hideRecordingUI__block_invoke_2;
  v5[3] = &unk_1E6F4E300;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v6, v5, 0.25);
}

void __53__HUAnnounceRecordingViewController__hideRecordingUI__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "recordingStateChangeLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceBeginRecordingLabel_Title"), CFSTR("HUAnnounceBeginRecordingLabel_Title"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v3);

  objc_msgSend(*(id *)(a1 + 32), "recordingStateChangeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "audioWaveformView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

void __53__HUAnnounceRecordingViewController__hideRecordingUI__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setAudioRecorder:", 0);
  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_stopRecordAndSend_, 64);

  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_beginRecording_, 64);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordButton_AX_Label_Title"), CFSTR("HUAnnounceRecordButton_AX_Label_Title"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v6);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordButton_AX_Label_Hint"), CFSTR("HUAnnounceRecordButton_AX_Label_Hint"), 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityHint:", v9);

}

- (id)_largeTitleTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
}

- (id)_waveformColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (id)_contentViewBackgroundColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (void)_dismissViewOrDisplayError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    -[HUAnnounceRecordingViewController audioWaveformView](self, "audioWaveformView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    -[HUAnnounceRecordingViewController announcementDeliveryFailureLabel](self, "announcementDeliveryFailureLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    -[HUAnnounceRecordingViewController errorStatusLabel](self, "errorStatusLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 1);

  }
  else
  {
    -[HUAnnounceRecordingViewController _dismissUpRecordingView:](self, "_dismissUpRecordingView:");
  }
}

- (void)didUpdateAveragePower:(float)a3
{
  void *v6;
  id v7;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAnnounceRecordingViewController.m"), 844, CFSTR("didUpdateAveragePower called from secondary thread"));

  }
  -[HUAnnounceRecordingViewController audioWaveformView](self, "audioWaveformView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPowerLevel:", a3);

}

- (void)audioRecorderDidStartRecording:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HUAnnounceRecordingViewController feedbackGenerator](self, "feedbackGenerator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "impactOccurredWithIntensity:", 1.0);

  -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  -[HUAnnounceRecordingViewController recordingStateChangeLabel](self, "recordingStateChangeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, sel_beginRecording_, 64);

  -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_stopRecordAndSend_, 64);

}

- (void)audioRecorderFailedToFinishRecording:(id)a3
{
  -[HUAnnounceRecordingViewController _submitAnalyticsForAnnounceRecordingCompletdSuccessfully:interruptedByUser:](self, "_submitAnalyticsForAnnounceRecordingCompletdSuccessfully:interruptedByUser:", 0, 0);
  -[HUAnnounceRecordingViewController _restoreRecordingUI](self, "_restoreRecordingUI");
}

- (void)audioRecorderFinishedRecording:(id)a3 audioFile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  dispatch_time_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  -[HUAnnounceRecordingViewController _submitAnalyticsForAnnounceRecordingCompletdSuccessfully:interruptedByUser:](self, "_submitAnalyticsForAnnounceRecordingCompletdSuccessfully:interruptedByUser:", 1, 0);
  -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentRecordedDuration");
  if (v9 <= 0.5)
  {

    goto LABEL_7;
  }
  v10 = objc_msgSend(v6, "recordingStopSource");

  if (v10)
  {
LABEL_7:
    -[HUAnnounceRecordingViewController _deleteRecording:](self, "_deleteRecording:", 0);
    goto LABEL_8;
  }
  -[HUAnnounceRecordingViewController feedbackGenerator](self, "feedbackGenerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "impactOccurredWithIntensity:", 1.0);

  -[HUAnnounceRecordingViewController setRecordedAnnouncementURL:](self, "setRecordedAnnouncementURL:", v7);
  -[HUAnnounceRecordingViewController recordingStateChangeLabel](self, "recordingStateChangeLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceBeginRecordingLabel_Title"), CFSTR("HUAnnounceBeginRecordingLabel_Title"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v13);

  -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_recordingButtonWaveformImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:forState:animated:", v15, 0, 1);

  -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeTarget:action:forControlEvents:", self, sel_stopRecordAndSend_, 64);

  -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel_beginRecording_, 64);

  -[HUAnnounceRecordingViewController sendAnnouncement:](self, "sendAnnouncement:", 0);
  -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentRecordedDuration");
  v20 = v19;

  if (v20 >= 60.0)
  {
    v21 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__HUAnnounceRecordingViewController_audioRecorderFinishedRecording_audioFile___block_invoke;
    block[3] = &unk_1E6F4D988;
    block[4] = self;
    dispatch_after(v21, MEMORY[0x1E0C80D38], block);
  }
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordButton_AX_Label_Title"), CFSTR("HUAnnounceRecordButton_AX_Label_Title"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAccessibilityLabel:", v22);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordButton_AX_Label_Hint"), CFSTR("HUAnnounceRecordButton_AX_Label_Hint"), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceRecordingViewController recordButton](self, "recordButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAccessibilityHint:", v24);

LABEL_8:
}

void __78__HUAnnounceRecordingViewController_audioRecorderFinishedRecording_audioFile___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEnabled:", 1);

}

- (void)accessoryDidUpdateReachability:(id)a3
{
  if (objc_msgSend(a3, "hf_isHomePod"))
    -[HUAnnounceRecordingViewController _updateUIBasedOnReachabilityStatus](self, "_updateUIBasedOnReachabilityStatus");
}

- (void)accessoryDidUpdateReachableTransports:(id)a3
{
  if (objc_msgSend(a3, "hf_isHomePod"))
    -[HUAnnounceRecordingViewController _updateUIBasedOnReachabilityStatus](self, "_updateUIBasedOnReachabilityStatus");
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  if (objc_msgSend(a3, "hf_isHomePod"))
    -[HUAnnounceRecordingViewController _updateUIBasedOnReachabilityStatus](self, "_updateUIBasedOnReachabilityStatus");
}

- (void)_submitAnalyticsForAnnounceRecordingCompletdSuccessfully:(BOOL)a3 interruptedByUser:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void *v9;
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
  void *v24;
  id v25;

  v4 = a4;
  v5 = a3;
  -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "recordingStopSource");

  -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentRecordedDuration");
  v11 = v10;

  v25 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v12, *MEMORY[0x1E0D30230]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v13, *MEMORY[0x1E0D30238]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUAnnounceRecordingViewController _isHomeContext](self, "_isHomeContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v14, *MEMORY[0x1E0D30240]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUAnnounceRecordingViewController _isRoomContext](self, "_isRoomContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v15, *MEMORY[0x1E0D30248]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v16, *MEMORY[0x1E0D30260]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (unint64_t)(v8 - 1) < 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v17, *MEMORY[0x1E0D30258]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 == 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v18, *MEMORY[0x1E0D30250]);

  -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "routeChangeReason");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HUAnnounceRecordingViewController audioRecorder](self, "audioRecorder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "routeChangeReason");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v22, *MEMORY[0x1E0D30438]);

  }
  v23 = (void *)MEMORY[0x1E0D31170];
  v24 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v23, "sendEvent:withData:", 18, v24);

}

- (HUHomeControlServiceContext)serviceContext
{
  return self->_serviceContext;
}

- (void)setServiceContext:(id)a3
{
  objc_storeStrong((id *)&self->_serviceContext, a3);
}

- (HFAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void)setAudioRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_audioRecorder, a3);
}

- (UILabel)dismissLabel
{
  return self->_dismissLabel;
}

- (void)setDismissLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dismissLabel, a3);
}

- (UIVisualEffectView)dismissLabelVisualEffectView
{
  return self->_dismissLabelVisualEffectView;
}

- (void)setDismissLabelVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_dismissLabelVisualEffectView, a3);
}

- (UILabel)largeTitleLabel
{
  return self->_largeTitleLabel;
}

- (void)setLargeTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_largeTitleLabel, a3);
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subTitleLabel, a3);
}

- (UIVisualEffectView)closeButtonVisualEffectView
{
  return self->_closeButtonVisualEffectView;
}

- (void)setCloseButtonVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_closeButtonVisualEffectView, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (HUWaveformView)audioWaveformView
{
  return self->_audioWaveformView;
}

- (void)setAudioWaveformView:(id)a3
{
  objc_storeStrong((id *)&self->_audioWaveformView, a3);
}

- (UILabel)announcementDeliveryFailureLabel
{
  return self->_announcementDeliveryFailureLabel;
}

- (void)setAnnouncementDeliveryFailureLabel:(id)a3
{
  objc_storeStrong((id *)&self->_announcementDeliveryFailureLabel, a3);
}

- (HURecordingButton)recordButton
{
  return self->_recordButton;
}

- (void)setRecordButton:(id)a3
{
  objc_storeStrong((id *)&self->_recordButton, a3);
}

- (UILabel)recordingStateChangeLabel
{
  return self->_recordingStateChangeLabel;
}

- (void)setRecordingStateChangeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_recordingStateChangeLabel, a3);
}

- (UILabel)errorStatusLabel
{
  return self->_errorStatusLabel;
}

- (void)setErrorStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorStatusLabel, a3);
}

- (double)recordedDuration
{
  return self->_recordedDuration;
}

- (void)setRecordedDuration:(double)a3
{
  self->_recordedDuration = a3;
}

- (NSURL)recordedAnnouncementURL
{
  return self->_recordedAnnouncementURL;
}

- (void)setRecordedAnnouncementURL:(id)a3
{
  objc_storeStrong((id *)&self->_recordedAnnouncementURL, a3);
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (void)setBlurEffect:(id)a3
{
  objc_storeStrong((id *)&self->_blurEffect, a3);
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (NSLayoutConstraint)contentViewHeightConstraint
{
  return self->_contentViewHeightConstraint;
}

- (void)setContentViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, a3);
}

- (NSLayoutConstraint)contentViewWidthConstraint
{
  return self->_contentViewWidthConstraint;
}

- (void)setContentViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewWidthConstraint, a3);
}

- (NSLayoutConstraint)closeButtonTopConstraint
{
  return self->_closeButtonTopConstraint;
}

- (void)setCloseButtonTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_closeButtonTopConstraint, a3);
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewTopConstraint, a3);
}

- (NSLayoutConstraint)contentViewTrailingConstraint
{
  return self->_contentViewTrailingConstraint;
}

- (void)setContentViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)dismissLabelTopConstraint
{
  return self->_dismissLabelTopConstraint;
}

- (void)setDismissLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_dismissLabelTopConstraint, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (BOOL)recordingDismissedByUser
{
  return self->_recordingDismissedByUser;
}

- (void)setRecordingDismissedByUser:(BOOL)a3
{
  self->_recordingDismissedByUser = a3;
}

- (ANAnnounce)announce
{
  return self->_announce;
}

- (void)setAnnounce:(id)a3
{
  objc_storeStrong((id *)&self->_announce, a3);
}

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (void)setCurrentHome:(id)a3
{
  objc_storeStrong((id *)&self->_currentHome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_announce, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_closeButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_recordedAnnouncementURL, 0);
  objc_storeStrong((id *)&self->_errorStatusLabel, 0);
  objc_storeStrong((id *)&self->_recordingStateChangeLabel, 0);
  objc_storeStrong((id *)&self->_recordButton, 0);
  objc_storeStrong((id *)&self->_announcementDeliveryFailureLabel, 0);
  objc_storeStrong((id *)&self->_audioWaveformView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_closeButtonVisualEffectView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_largeTitleLabel, 0);
  objc_storeStrong((id *)&self->_dismissLabelVisualEffectView, 0);
  objc_storeStrong((id *)&self->_dismissLabel, 0);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong((id *)&self->_serviceContext, 0);
}

@end
