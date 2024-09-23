@implementation HUDropInViewController

- (HUDropInViewController)initWithServiceContext:(id)a3 blurEffectStyle:(int64_t)a4
{
  id v7;
  HUDropInViewController *v8;
  uint64_t v9;
  UIBlurEffect *blurEffect;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUDropInViewController;
  v8 = -[HUDropInViewController init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", a4);
    v9 = objc_claimAutoreleasedReturnValue();
    blurEffect = v8->_blurEffect;
    v8->_blurEffect = (UIBlurEffect *)v9;

    objc_storeStrong((id *)&v8->_serviceContext, a3);
  }

  return v8;
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  UIImpactFeedbackGenerator *v7;
  UIImpactFeedbackGenerator *feedbackGenerator;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIVisualEffectView *v16;
  UIVisualEffectView *dismissLabelVisualEffectView;
  void *v18;
  UILabel *v19;
  UILabel *dismissLabel;
  void *v21;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  UIVisualEffectView *v37;
  UIVisualEffectView *closeButtonVisualEffectView;
  void *v39;
  UIButton *v40;
  UIButton *closeButton;
  UIButton *v42;
  void *v43;
  void *v44;
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  UIView *v50;
  UIView *contentView;
  UIView *v52;
  void *v53;
  void *v54;
  UIImageView *v55;
  UIImageView *iconImageView;
  HUIconView *v57;
  HUIconView *iconView;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  HUIconView *v64;
  void *v65;
  UILabel *v66;
  UILabel *titleLabel;
  UITextView *v68;
  UITextView *descriptionTextView;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  UIActivityIndicatorView *v87;
  UIActivityIndicatorView *spinner;
  UILabel *v89;
  UILabel *spinnerLabel;
  void *v91;
  void *v92;
  HUWaveformView *v93;
  void *v94;
  void *v95;
  HUWaveformView *v96;
  HUWaveformView *audioWaveformView;
  void *v98;
  void *v99;
  void *v100;
  UIView *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  UIView *v106;
  void *v107;
  void *v108;
  void *v109;
  UIView *v110;
  UIView *liveCameraView;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  HULegibilityLabel *v120;
  HULegibilityLabel *v121;
  HULegibilityLabel *descriptionLabel;
  double v123;
  double v124;
  void *v125;
  void *v126;
  uint64_t v127;
  UIVisualEffectView *v128;
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
  NSLayoutConstraint *v143;
  NSLayoutConstraint *dismissLabelTopConstraint;
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
  NSLayoutConstraint *v162;
  NSLayoutConstraint *closeButtonTopConstraint;
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
  uint64_t v187;
  unint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  NSLayoutConstraint *v192;
  NSLayoutConstraint *contentViewTopConstraint;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  NSLayoutConstraint *v202;
  NSLayoutConstraint *contentViewWidthConstraint;
  void *v204;
  double v205;
  NSLayoutConstraint *v206;
  NSLayoutConstraint *contentViewHeightConstraint;
  void *v208;
  double v209;
  double v210;
  unint64_t v211;
  uint64_t v212;
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
  void *v237;
  void *v238;
  double v239;
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
  unint64_t v253;
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
  double v269;
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
  void *v285;
  double v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  double v367;
  uint64_t v368;
  void *v369;
  void *v370;
  void *v371;
  _QWORD v373[6];
  _QWORD v374[5];
  objc_super v375;
  _QWORD v376[2];
  uint64_t v377;
  _QWORD v378[3];

  v378[1] = *MEMORY[0x1E0C80C00];
  v375.receiver = self;
  v375.super_class = (Class)HUDropInViewController;
  -[HUDropInViewController viewDidLoad](&v375, sel_viewDidLoad);
  -[HUDropInViewController currentHome](self, "currentHome");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[HUDropInViewController currentAccessory](self, "currentAccessory"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 87);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController _dismissRecordingUIWithError:](self, "_dismissRecordingUIWithError:", v6);

  }
  v7 = (UIImpactFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0CEA660]);
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v7;

  v9 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__didTap_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v9;

  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
  -[HUDropInViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:", self->_tapGestureRecognizer);

  -[HUDropInViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", 0.0);

  v13 = (void *)MEMORY[0x1E0CEABA8];
  -[HUDropInViewController blurEffect](self, "blurEffect");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "effectForBlurEffect:style:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v15);
  dismissLabelVisualEffectView = self->_dismissLabelVisualEffectView;
  self->_dismissLabelVisualEffectView = v16;

  -[HUDropInViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "naui_addAutoLayoutSubview:", self->_dismissLabelVisualEffectView);

  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  dismissLabel = self->_dismissLabel;
  self->_dismissLabel = v19;

  v368 = *MEMORY[0x1E0CEB538];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_dismissLabel, "setFont:", v21);

  -[UILabel setTextAlignment:](self->_dismissLabel, "setTextAlignment:", 1);
  v22 = self->_dismissLabel;
  _HULocalizedStringWithDefaultValue(CFSTR("HUDropInDismissLabel_Title"), CFSTR("HUDropInDismissLabel_Title"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v22, "setText:", v23);

  v24 = self->_dismissLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v24, "setTextColor:", v25);

  -[UILabel setAlpha:](self->_dismissLabel, "setAlpha:", 0.0);
  -[UIVisualEffectView contentView](self->_dismissLabelVisualEffectView, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "naui_addAutoLayoutSubview:", self->_dismissLabel);

  -[UILabel text](self->_dismissLabel, "text");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;
  v377 = *MEMORY[0x1E0CEA098];
  -[UILabel font](self->_dismissLabel, "font");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v378[0] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v378, &v377, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "boundingRectWithSize:options:attributes:context:", 1, v32, 0, v30, 3.40282347e38);
  v367 = v33;

  v34 = (void *)MEMORY[0x1E0CEABA8];
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "effectForBlurEffect:style:", v35, 1);
  v36 = objc_claimAutoreleasedReturnValue();

  v371 = (void *)v36;
  v37 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v36);
  closeButtonVisualEffectView = self->_closeButtonVisualEffectView;
  self->_closeButtonVisualEffectView = v37;

  -[HUDropInViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "naui_addAutoLayoutSubview:", self->_closeButtonVisualEffectView);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v40 = (UIButton *)objc_claimAutoreleasedReturnValue();
  closeButton = self->_closeButton;
  self->_closeButton = v40;

  -[UIButton addTarget:action:forControlEvents:](self->_closeButton, "addTarget:action:forControlEvents:", self, sel__dismissDownRecordingView_, 64);
  v42 = self->_closeButton;
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_closeButtonImage");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](v42, "setImage:forState:", v43, 0);

  -[UIVisualEffectView contentView](self->_closeButtonVisualEffectView, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "naui_addAutoLayoutSubview:", self->_closeButton);

  v45 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v46 = *MEMORY[0x1E0C9D648];
  v47 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v48 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v49 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v50 = (UIView *)objc_msgSend(v45, "initWithFrame:", *MEMORY[0x1E0C9D648], v47, v48, v49);
  contentView = self->_contentView;
  self->_contentView = v50;

  v52 = self->_contentView;
  -[HUDropInViewController _contentViewBackgroundColor](self, "_contentViewBackgroundColor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v52, "setBackgroundColor:", v53);

  -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", 16.0);
  -[UIView setAlpha:](self->_contentView, "setAlpha:", 0.0);
  -[HUDropInViewController view](self, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "naui_addAutoLayoutSubview:", self->_contentView);

  v55 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v46, v47, v48, v49);
  iconImageView = self->_iconImageView;
  self->_iconImageView = v55;

  -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:", 4);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_iconImageView);
  v57 = (HUIconView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D33720]), "initWithFrame:contentMode:", 1, v46, v47, v48, v49);
  iconView = self->_iconView;
  self->_iconView = v57;

  -[HUIconView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v59 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v376[0] = v60;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v376[1] = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v376, 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "configurationWithPaletteColors:", v62);
  v63 = objc_claimAutoreleasedReturnValue();

  v64 = self->_iconView;
  v370 = (void *)v63;
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:configuration:", CFSTR("waveform.badge.magnifyingglass.circle.fill"), v63);
  -[HUIconView updateWithIconDescriptor:displayStyle:animated:](v64, "updateWithIconDescriptor:displayStyle:animated:", v65, 1, 0);

  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_iconView);
  v66 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v46, v47, v48, v49);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v66;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_titleLabel);
  v68 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAB18]), "initWithFrame:", v46, v47, v48, v49);
  descriptionTextView = self->_descriptionTextView;
  self->_descriptionTextView = v68;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](self->_descriptionTextView, "setTextColor:", v70);

  -[UITextView setScrollEnabled:](self->_descriptionTextView, "setScrollEnabled:", 0);
  -[UITextView setEditable:](self->_descriptionTextView, "setEditable:", 0);
  -[UITextView textContainer](self->_descriptionTextView, "textContainer");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setLineFragmentPadding:", 0.0);

  v72 = *MEMORY[0x1E0CEB4B0];
  v73 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v75 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v74 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[UITextView setTextContainerInset:](self->_descriptionTextView, "setTextContainerInset:", *MEMORY[0x1E0CEB4B0], v73, v75, v74);
  -[UITextView setContentInset:](self->_descriptionTextView, "setContentInset:", v72, v73, v75, v74);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_descriptionTextView, "setBackgroundColor:", v76);

  -[UITextView setDataDetectorTypes:](self->_descriptionTextView, "setDataDetectorTypes:", 2);
  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setAdjustsFontForContentSizeCategory:](self->_descriptionTextView, "setAdjustsFontForContentSizeCategory:", 1);
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_descriptionTextView);
  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", v368, 32770);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController titleLabel](self, "titleLabel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setFont:", v77);

  -[HUDropInViewController titleLabel](self, "titleLabel");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setNumberOfLines:", 0);

  -[HUDropInViewController titleLabel](self, "titleLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "sizeToFit");

  v81 = *MEMORY[0x1E0CEB588];
  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB588], 0x8000);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController descriptionTextView](self, "descriptionTextView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setFont:", v82);

  -[HUDropInViewController descriptionTextView](self, "descriptionTextView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "textContainer");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setMaximumNumberOfLines:", 0);

  -[HUDropInViewController descriptionTextView](self, "descriptionTextView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "sizeToFit");

  v369 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__didPan_);
  -[UIView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:");
  v87 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  spinner = self->_spinner;
  self->_spinner = v87;

  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_spinner);
  v89 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  spinnerLabel = self->_spinnerLabel;
  self->_spinnerLabel = v89;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v81);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_spinnerLabel, "setFont:", v91);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_spinnerLabel, "setTextColor:", v92);

  -[UILabel setTextAlignment:](self->_spinnerLabel, "setTextAlignment:", 1);
  -[UILabel setAlpha:](self->_spinnerLabel, "setAlpha:", 0.0);
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_spinnerLabel);
  v93 = [HUWaveformView alloc];
  -[HUDropInViewController _waveformColor](self, "_waveformColor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = -[HUWaveformView initWithFrame:waveformColor:backgroundColor:](v93, "initWithFrame:waveformColor:backgroundColor:", v94, v95, v46, v47, v48, v49);
  audioWaveformView = self->_audioWaveformView;
  self->_audioWaveformView = v96;

  -[HUWaveformView setAlpha:](self->_audioWaveformView, "setAlpha:", 0.0);
  -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_audioWaveformView);
  -[HUDropInViewController talkButton](self, "talkButton");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setAlpha:", 0.0);

  -[HUDropInViewController talkButton](self, "talkButton");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setIsAccessibilityElement:", 1);

  -[HUDropInViewController talkButton](self, "talkButton");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "addTarget:action:forControlEvents:", self, sel__toggleMicrophone_, 64);

  v101 = self->_contentView;
  -[HUDropInViewController talkButton](self, "talkButton");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView naui_addAutoLayoutSubview:](v101, "naui_addAutoLayoutSubview:", v102);

  -[HUDropInViewController doneButton](self, "doneButton");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setAlpha:", 0.0);

  -[HUDropInViewController doneButton](self, "doneButton");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setIsAccessibilityElement:", 1);

  -[HUDropInViewController doneButton](self, "doneButton");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "addTarget:action:forControlEvents:", self, sel__toggleMicrophone_, 64);

  v106 = self->_contentView;
  -[HUDropInViewController doneButton](self, "doneButton");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView naui_addAutoLayoutSubview:](v106, "naui_addAutoLayoutSubview:", v107);

  -[HUDropInViewController nearbyCameraProfile](self, "nearbyCameraProfile");
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
  {
    -[HUDropInViewController liveStreamController](self, "liveStreamController");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "view");
    v110 = (UIView *)objc_claimAutoreleasedReturnValue();
    liveCameraView = self->_liveCameraView;
    self->_liveCameraView = v110;

    -[UIView _setContinuousCornerRadius:](self->_liveCameraView, "_setContinuousCornerRadius:", 14.0);
    -[UIView setClipsToBounds:](self->_liveCameraView, "setClipsToBounds:", 1);
    -[UIView setAlpha:](self->_liveCameraView, "setAlpha:", 0.0);
    -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_liveCameraView);
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController nearbyCameraProfile](self, "nearbyCameraProfile");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "streamControl");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = 0;
    if (objc_msgSend(v114, "streamState") == 2)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraLive"), CFSTR("HUCameraLive"), 1);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v116 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontSize");
    objc_msgSend(v116, "monospacedDigitSystemFontOfSize:weight:");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB590]);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "scaledFontForFont:", v117);
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    v120 = [HULegibilityLabel alloc];
    v121 = -[HULegibilityLabel initWithSettings:strength:text:font:options:](v120, "initWithSettings:strength:text:font:options:", v112, v115, v119, *MEMORY[0x1E0CEC0E0], *MEMORY[0x1E0CEC0C0]);
    descriptionLabel = self->_descriptionLabel;
    self->_descriptionLabel = v121;

    -[HULegibilityLabel setAdjustsFontForContentSizeCategory:](self->_descriptionLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[HULegibilityLabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 4);
    -[HULegibilityLabel setLineBreakMode:](self->_descriptionLabel, "setLineBreakMode:", 4);
    -[HULegibilityLabel setUserInteractionEnabled:](self->_descriptionLabel, "setUserInteractionEnabled:", 0);
    -[HULegibilityLabel setAlpha:](self->_descriptionLabel, "setAlpha:", 0.0);
    -[HULegibilityLabel setMaximumContentSizeCategory:](self->_descriptionLabel, "setMaximumContentSizeCategory:", *MEMORY[0x1E0CEB3F8]);
    LODWORD(v123) = 1144766464;
    -[HULegibilityLabel setContentCompressionResistancePriority:forAxis:](self->_descriptionLabel, "setContentCompressionResistancePriority:forAxis:", 0, v123);
    LODWORD(v124) = 1132134400;
    -[HULegibilityLabel setContentHuggingPriority:forAxis:](self->_descriptionLabel, "setContentHuggingPriority:forAxis:", 0, v124);
    -[UIView naui_addAutoLayoutSubview:](self->_contentView, "naui_addAutoLayoutSubview:", self->_descriptionLabel);

  }
  v125 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = objc_msgSend(v126, "userInterfaceIdiom");

  v128 = self->_dismissLabelVisualEffectView;
  if ((v127 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[UIVisualEffectView centerXAnchor](v128, "centerXAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintEqualToAnchor:", v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v131);
  }
  else
  {
    -[UIVisualEffectView leadingAnchor](v128, "leadingAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController view](self, "view");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "safeAreaLayoutGuide");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "leadingAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintEqualToAnchor:", v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v133);

  }
  -[UIVisualEffectView trailingAnchor](self->_dismissLabelVisualEffectView, "trailingAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController view](self, "view");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "safeAreaLayoutGuide");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "trailingAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "constraintEqualToAnchor:", v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v138);

  -[UIVisualEffectView topAnchor](self->_dismissLabelVisualEffectView, "topAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController view](self, "view");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "safeAreaLayoutGuide");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "topAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "constraintEqualToAnchor:constant:", v142, -25.0);
  v143 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  dismissLabelTopConstraint = self->_dismissLabelTopConstraint;
  self->_dismissLabelTopConstraint = v143;

  objc_msgSend(v125, "addObject:", self->_dismissLabelTopConstraint);
  -[UIVisualEffectView heightAnchor](self->_dismissLabelVisualEffectView, "heightAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "constraintEqualToConstant:", v367);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v146);

  -[UILabel leadingAnchor](self->_dismissLabel, "leadingAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView leadingAnchor](self->_dismissLabelVisualEffectView, "leadingAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "constraintEqualToAnchor:", v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v149);

  -[UILabel trailingAnchor](self->_dismissLabel, "trailingAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView trailingAnchor](self->_dismissLabelVisualEffectView, "trailingAnchor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "constraintEqualToAnchor:", v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v152);

  -[UILabel topAnchor](self->_dismissLabel, "topAnchor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_dismissLabelVisualEffectView, "topAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "constraintEqualToAnchor:", v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v155);

  -[UILabel heightAnchor](self->_dismissLabel, "heightAnchor");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView heightAnchor](self->_dismissLabelVisualEffectView, "heightAnchor");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "constraintEqualToAnchor:", v157);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v158);

  -[UIVisualEffectView topAnchor](self->_closeButtonVisualEffectView, "topAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController view](self, "view");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "topAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "constraintEqualToAnchor:constant:", v161, 30.0);
  v162 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  closeButtonTopConstraint = self->_closeButtonTopConstraint;
  self->_closeButtonTopConstraint = v162;

  objc_msgSend(v125, "addObject:", self->_closeButtonTopConstraint);
  -[UIVisualEffectView trailingAnchor](self->_closeButtonVisualEffectView, "trailingAnchor");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController view](self, "view");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "safeAreaLayoutGuide");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "trailingAnchor");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "constraintEqualToAnchor:constant:", v167, -16.0);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v168);

  -[UIVisualEffectView heightAnchor](self->_closeButtonVisualEffectView, "heightAnchor");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "constraintEqualToConstant:", 30.0);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v170);

  -[UIVisualEffectView widthAnchor](self->_closeButtonVisualEffectView, "widthAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView heightAnchor](self->_closeButtonVisualEffectView, "heightAnchor");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "constraintEqualToAnchor:", v172);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v173);

  -[UIButton topAnchor](self->_closeButton, "topAnchor");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_closeButtonVisualEffectView, "topAnchor");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "constraintEqualToAnchor:", v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v176);

  -[UIButton trailingAnchor](self->_closeButton, "trailingAnchor");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView trailingAnchor](self->_closeButtonVisualEffectView, "trailingAnchor");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "constraintEqualToAnchor:", v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v179);

  -[UIButton heightAnchor](self->_closeButton, "heightAnchor");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView heightAnchor](self->_closeButtonVisualEffectView, "heightAnchor");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "constraintEqualToAnchor:", v181);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v182);

  -[UIButton widthAnchor](self->_closeButton, "widthAnchor");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton heightAnchor](self->_closeButton, "heightAnchor");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "constraintEqualToAnchor:", v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v185);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = objc_msgSend(v186, "userInterfaceIdiom");

  v188 = v187 & 0xFFFFFFFFFFFFFFFBLL;
  -[UIView topAnchor](self->_contentView, "topAnchor");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  if (v188 == 1)
  {
    -[HUDropInViewController view](self, "view");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "topAnchor");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "constraintEqualToAnchor:constant:", v191, 30.0);
    v192 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    contentViewTopConstraint = self->_contentViewTopConstraint;
    self->_contentViewTopConstraint = v192;

    objc_msgSend(v125, "addObject:", self->_contentViewTopConstraint);
    -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](self->_closeButtonVisualEffectView, "leadingAnchor");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "constraintEqualToAnchor:constant:", v195, -8.0);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v196);
  }
  else
  {
    -[UIVisualEffectView bottomAnchor](self->_closeButtonVisualEffectView, "bottomAnchor");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "constraintEqualToAnchor:constant:", v197, 8.0);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v198);

    -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController view](self, "view");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "safeAreaLayoutGuide");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "trailingAnchor");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "constraintEqualToAnchor:constant:", v199, -10.0);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v200);

  }
  -[UIView widthAnchor](self->_contentView, "widthAnchor");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "constraintEqualToConstant:", 100.0);
  v202 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewWidthConstraint = self->_contentViewWidthConstraint;
  self->_contentViewWidthConstraint = v202;

  objc_msgSend(v125, "addObject:", self->_contentViewWidthConstraint);
  -[UIView heightAnchor](self->_contentView, "heightAnchor");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = 0.0;
  objc_msgSend(v204, "constraintEqualToConstant:", 0.0);
  v206 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewHeightConstraint = self->_contentViewHeightConstraint;
  self->_contentViewHeightConstraint = v206;

  objc_msgSend(v125, "addObject:", self->_contentViewHeightConstraint);
  -[HUDropInViewController view](self, "view");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "frame");
  v211 = HUViewSizeSubclassForViewSize(v209, v210);

  if (v211 > 0xA)
    v212 = 1;
  else
    v212 = qword_1B9442C40[v211];
  +[HUGridBannerCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridBannerCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", v212);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController iconView](self, "iconView");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "leadingAnchor");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "leadingInset");
  objc_msgSend(v215, "constraintEqualToAnchor:constant:", v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v217);

  -[HUDropInViewController iconImageView](self, "iconImageView");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "leadingAnchor");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController iconView](self, "iconView");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "leadingAnchor");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "constraintEqualToAnchor:", v221);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v222);

  -[HUDropInViewController iconView](self, "iconView");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "topAnchor");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_contentView, "topAnchor");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "titleTopInset");
  objc_msgSend(v224, "constraintEqualToAnchor:constant:", v225);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v226);

  -[HUDropInViewController iconImageView](self, "iconImageView");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "topAnchor");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController iconView](self, "iconView");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "topAnchor");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "constraintEqualToAnchor:", v230);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v231);

  -[HUDropInViewController iconView](self, "iconView");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "heightAnchor");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "iconHeight");
  objc_msgSend(v233, "constraintEqualToConstant:");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v234);

  -[HUDropInViewController iconImageView](self, "iconImageView");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v235, "heightAnchor");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController iconImageView](self, "iconImageView");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "image");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  if (v238)
  {
    objc_msgSend(v213, "iconHeight");
    v205 = v239;
  }
  objc_msgSend(v236, "constraintEqualToConstant:", v205);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v240);

  -[HUDropInViewController iconView](self, "iconView");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "widthAnchor");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController iconView](self, "iconView");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "heightAnchor");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "constraintEqualToAnchor:", v244);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v245);

  -[HUDropInViewController iconImageView](self, "iconImageView");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "widthAnchor");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController iconImageView](self, "iconImageView");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "heightAnchor");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "constraintEqualToAnchor:", v249);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v250);

  -[HUDropInViewController traitCollection](self, "traitCollection");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "preferredContentSizeCategory");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v253 = *MEMORY[0x1E0CEB3D0];

  -[HUDropInViewController titleLabel](self, "titleLabel");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "topAnchor");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v252 >= v253)
  {
    -[HUDropInViewController iconView](self, "iconView");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v263, "bottomAnchor");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "verticalSpacingForLipElements");
    objc_msgSend(v255, "constraintEqualToAnchor:constant:", v264);
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v265);

    -[HUDropInViewController titleLabel](self, "titleLabel");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v258, "leadingAnchor");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "leadingInset");
    objc_msgSend(v259, "constraintEqualToAnchor:constant:", v260);
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v261);
  }
  else
  {
    -[UIView topAnchor](self->_contentView, "topAnchor");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "titleTopInset");
    objc_msgSend(v255, "constraintEqualToAnchor:constant:", v256);
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v257);

    -[HUDropInViewController titleLabel](self, "titleLabel");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v258, "leadingAnchor");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController iconView](self, "iconView");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v260, "trailingAnchor");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "horizontalItemSpacing");
    objc_msgSend(v259, "constraintEqualToAnchor:constant:", v261);
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v262);

  }
  -[HUDropInViewController titleLabel](self, "titleLabel");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "trailingAnchor");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "trailingInset");
  objc_msgSend(v267, "constraintEqualToAnchor:constant:", v268, -v269);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v270);

  -[HUDropInViewController descriptionTextView](self, "descriptionTextView");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "topAnchor");
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController titleLabel](self, "titleLabel");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "bottomAnchor");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "verticalLabelSpacing");
  objc_msgSend(v272, "constraintEqualToAnchor:constant:", v274);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v275);

  -[HUDropInViewController traitCollection](self, "traitCollection");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v276, "preferredContentSizeCategory");
  v277 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDropInViewController descriptionTextView](self, "descriptionTextView");
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v278, "leadingAnchor");
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v277 >= v253)
  {
    -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "leadingInset");
    objc_msgSend(v279, "constraintEqualToAnchor:constant:", v280);
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v281);
  }
  else
  {
    -[HUDropInViewController iconView](self, "iconView");
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v280, "trailingAnchor");
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "horizontalItemSpacing");
    objc_msgSend(v279, "constraintEqualToAnchor:constant:", v281);
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v282);

  }
  -[HUDropInViewController descriptionTextView](self, "descriptionTextView");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v283, "trailingAnchor");
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "trailingInset");
  objc_msgSend(v284, "constraintEqualToAnchor:constant:", v285, -v286);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v287);

  -[UIActivityIndicatorView centerYAnchor](self->_spinner, "centerYAnchor");
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v288, "constraintEqualToAnchor:", v289);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v290);

  -[UIActivityIndicatorView centerXAnchor](self->_spinner, "centerXAnchor");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v291, "constraintEqualToAnchor:", v292);
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v293);

  -[UILabel leadingAnchor](self->_spinnerLabel, "leadingAnchor");
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v294, "constraintEqualToAnchor:", v295);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v296);

  -[UILabel trailingAnchor](self->_spinnerLabel, "trailingAnchor");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v297, "constraintEqualToAnchor:", v298);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v299);

  -[UILabel topAnchor](self->_spinnerLabel, "topAnchor");
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView bottomAnchor](self->_spinner, "bottomAnchor");
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v300, "constraintEqualToAnchor:constant:", v301, 24.0);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v302);

  -[UILabel centerXAnchor](self->_spinnerLabel, "centerXAnchor");
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v303, "constraintEqualToAnchor:", v304);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v305);

  -[HUDropInViewController nearbyCameraProfile](self, "nearbyCameraProfile");
  v306 = (void *)objc_claimAutoreleasedReturnValue();

  if (v306)
  {
    -[UIView centerXAnchor](self->_liveCameraView, "centerXAnchor");
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
    v308 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v307, "constraintEqualToAnchor:", v308);
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v309);

    -[HUDropInViewController liveCameraView](self, "liveCameraView");
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v310, "topAnchor");
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_spinnerLabel, "bottomAnchor");
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v311, "constraintEqualToAnchor:constant:", v312, 20.0);
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController setCameraLiveStreamViewTopConstraintToSpinnerLabel:](self, "setCameraLiveStreamViewTopConstraintToSpinnerLabel:", v313);

    -[HUDropInViewController liveCameraView](self, "liveCameraView");
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v314, "topAnchor");
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView bottomAnchor](self->_descriptionTextView, "bottomAnchor");
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v315, "constraintEqualToAnchor:constant:", v316, 20.0);
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController setCameraLiveStreamViewTopConstraintToDescriptionTextView:](self, "setCameraLiveStreamViewTopConstraintToDescriptionTextView:", v317);

    -[UIView widthAnchor](self->_liveCameraView, "widthAnchor");
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self->_contentView, "widthAnchor");
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v318, "constraintEqualToAnchor:multiplier:", v319, 0.85);
    v320 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v320);

    -[UIView heightAnchor](self->_liveCameraView, "heightAnchor");
    v321 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self->_liveCameraView, "widthAnchor");
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v321, "constraintEqualToAnchor:multiplier:", v322, 0.5625);
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v323);

    -[HUWaveformView topAnchor](self->_audioWaveformView, "topAnchor");
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_liveCameraView, "bottomAnchor");
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v324, "constraintEqualToAnchor:constant:", v325, 20.0);
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v326);

    -[HULegibilityLabel bottomAnchor](self->_descriptionLabel, "bottomAnchor");
    v327 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_liveCameraView, "bottomAnchor");
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v327, "constraintEqualToAnchor:constant:", v328, -10.0);
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v329);

    -[HULegibilityLabel leadingAnchor](self->_descriptionLabel, "leadingAnchor");
    v330 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_liveCameraView, "leadingAnchor");
    v331 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v330, "constraintEqualToAnchor:constant:", v331, 10.0);
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addObject:", v332);

    -[HULegibilityLabel trailingAnchor](self->_descriptionLabel, "trailingAnchor");
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_liveCameraView, "trailingAnchor");
    v334 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v333, "constraintLessThanOrEqualToAnchor:constant:", v334, -10.0);
  }
  else
  {
    -[HUWaveformView centerYAnchor](self->_audioWaveformView, "centerYAnchor");
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
    v334 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v333, "constraintEqualToAnchor:", v334);
  }
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v335);

  -[HUWaveformView leadingAnchor](self->_audioWaveformView, "leadingAnchor");
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v336, "constraintEqualToAnchor:", v337);
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v338);

  -[HUWaveformView trailingAnchor](self->_audioWaveformView, "trailingAnchor");
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v339, "constraintEqualToAnchor:", v340);
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v341);

  -[HUWaveformView heightAnchor](self->_audioWaveformView, "heightAnchor");
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v342, "constraintEqualToConstant:", 70.0);
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v343);

  -[UIButton heightAnchor](self->_talkButton, "heightAnchor");
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v344, "constraintEqualToConstant:", 44.0);
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v345);

  -[UIButton widthAnchor](self->_talkButton, "widthAnchor");
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v346, "constraintLessThanOrEqualToConstant:", 355.0);
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v347);

  -[UIButton centerXAnchor](self->_talkButton, "centerXAnchor");
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v348, "constraintEqualToAnchor:", v349);
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v350);

  -[UIButton bottomAnchor](self->_talkButton, "bottomAnchor");
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v351, "constraintEqualToAnchor:constant:", v352, -45.0);
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v353);

  -[UIButton heightAnchor](self->_doneButton, "heightAnchor");
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v354, "constraintEqualToConstant:", 44.0);
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v355);

  -[UIButton widthAnchor](self->_doneButton, "widthAnchor");
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v356, "constraintLessThanOrEqualToConstant:", 355.0);
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v357);

  -[UIButton centerXAnchor](self->_doneButton, "centerXAnchor");
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v358, "constraintEqualToAnchor:", v359);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v360);

  -[UIButton bottomAnchor](self->_doneButton, "bottomAnchor");
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v361, "constraintEqualToAnchor:constant:", v362, -45.0);
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "addObject:", v363);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v125);
  -[HUDropInViewController view](self, "view");
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v364, "layoutIfNeeded");

  -[HUDropInViewController titleLabel](self, "titleLabel");
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v365, "becomeFirstResponder");

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v366, "addAccessoryObserver:", self);

  v374[0] = MEMORY[0x1E0C809B0];
  v374[1] = 3221225472;
  v374[2] = __37__HUDropInViewController_viewDidLoad__block_invoke;
  v374[3] = &unk_1E6F4D988;
  v374[4] = self;
  v373[0] = MEMORY[0x1E0C809B0];
  v373[1] = 3221225472;
  v373[2] = __37__HUDropInViewController_viewDidLoad__block_invoke_3;
  v373[3] = &unk_1E6F5BCA8;
  v373[4] = self;
  v373[5] = a2;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v374, v373, 0.5);

}

uint64_t __37__HUDropInViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__HUDropInViewController_viewDidLoad__block_invoke_2;
  v4[3] = &unk_1E6F4D988;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __37__HUDropInViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;

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
  }
  else
  {
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7 + -20.0;
    objc_msgSend(*(id *)(a1 + 32), "contentViewWidthConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "spinnerLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "talkButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "doneButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "audioWaveformView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "liveCameraView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "descriptionLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "_showSpinner");
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUDropInBanner_Title_String"), CFSTR("HUDropInBanner_Title_String"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v19);

  objc_msgSend(*(id *)(a1 + 32), "spinnerLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_Label_Connecting_State"), CFSTR("HUDropIn_Label_Connecting_State"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v21);

  objc_msgSend(*(id *)(a1 + 32), "currentAccessory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hf_serviceNameComponents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "composedString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUDropInBanner_Title_FormatString"), CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v24);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "descriptionTextView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setText:", v31);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layoutIfNeeded");

}

void __37__HUDropInViewController_viewDidLoad__block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dropInCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "devices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ Device list for drop-in: %@", (uint8_t *)&v9, 0x20u);

    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  HUDropInViewController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUDropInViewController;
  -[HUDropInViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  -[HUDropInViewController _endDropInSession](self, "_endDropInSession");
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  HUDropInViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  if (!-[HUDropInViewController hasAttemptedEndingDropInSessionCall](self, "hasAttemptedEndingDropInSessionCall"))
    -[HUDropInViewController _endDropInSession](self, "_endDropInSession");
  v6.receiver = self;
  v6.super_class = (Class)HUDropInViewController;
  -[HUDropInViewController dealloc](&v6, sel_dealloc);
}

- (void)_endDropInSession
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  HUDropInViewController *v19;
  _QWORD v20[4];
  id v21;
  HUDropInViewController *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  HUDropInViewController *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = self;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "devices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = self;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ Device list for drop-in: %@", buf, 0x20u);

  }
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __43__HUDropInViewController__endDropInSession__block_invoke;
  v23[3] = &unk_1E6F5BCD0;
  v23[4] = self;
  objc_msgSend(v8, "na_firstObjectPassingTest:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", 0);
  if (!v12)
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "No dropin device found in HomeKit", buf, 2u);
    }

  }
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sessionManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activeSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D1D8D8], "stringForDropInSessionState:", objc_msgSend(v16, "state"));
      v19 = (HUDropInViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "Current dropin session state: %@", buf, 0xCu);

    }
    -[HUDropInViewController setHasAttemptedEndingDropInSessionCall:](self, "setHasAttemptedEndingDropInSessionCall:", 1);
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __43__HUDropInViewController__endDropInSession__block_invoke_60;
    v20[3] = &unk_1E6F4D1B0;
    v21 = v16;
    v22 = self;
    objc_msgSend(v21, "endWithCompletionHandler:", v20);

  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_ERROR, "No active dropin session. Cannot end session", buf, 2u);
    }

    -[HUDropInViewController _cleanUp](self, "_cleanUp");
  }

}

uint64_t __43__HUDropInViewController__endDropInSession__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "homeKitIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

void __43__HUDropInViewController__endDropInSession__block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Failed to end dropin session with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Successfully ended dropin session", (uint8_t *)&v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_cleanUp");

}

- (void)_cleanUp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HUDropInViewController _cancelStartSessionRequestTimerIfNeeded](self, "_cancelStartSessionRequestTimerIfNeeded");
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[HUDropInViewController dropInAudioPowerController](self, "dropInAudioPowerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", 0);

  -[HUDropInViewController lastKnownEventSubscriber](self, "lastKnownEventSubscriber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", 0);

  -[HUDropInViewController liveStreamController](self, "liveStreamController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLiveStreamControllerDelegate:", 0);

  -[HUDropInViewController setLiveStreamController:](self, "setLiveStreamController:", 0);
  -[HUDropInViewController setLastKnownEventSubscriber:](self, "setLastKnownEventSubscriber:", 0);
  -[HUDropInViewController setDropInAudioPowerController:](self, "setDropInAudioPowerController:", 0);
  -[HUDropInViewController audioWaveformView](self, "audioWaveformView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearPowerLevels");

  -[HUDropInViewController setAudioWaveformView:](self, "setAudioWaveformView:", 0);
  -[HUDropInViewController setDropInCenter:](self, "setDropInCenter:", 0);
  -[HUDropInViewController setActiveDropInSession:](self, "setActiveDropInSession:", 0);
}

- (void)_cancelStartSessionRequestTimerIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  HUDropInViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HUDropInViewController startSessionRequestTimer](self, "startSessionRequestTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[HUDropInViewController startSessionRequestTimer](self, "startSessionRequestTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = self;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: Cancelling start session request timer %@", (uint8_t *)&v7, 0x16u);

    }
    -[HUDropInViewController startSessionRequestTimer](self, "startSessionRequestTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[HUDropInViewController setStartSessionRequestTimer:](self, "setStartSessionRequestTimer:", 0);
  }
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
  id v7;

  -[HUDropInViewController contentView](self, "contentView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController _contentViewBackgroundColor](self, "_contentViewBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[HUDropInViewController audioWaveformView](self, "audioWaveformView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController _waveformColor](self, "_waveformColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWaveformColor:", v6);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUDropInViewController;
  -[HUDropInViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[HUDropInViewController contentViewWidthConstraint](self, "contentViewWidthConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", 395.0);

  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_showSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HUDropInViewController spinnerLabel](self, "spinnerLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[HUDropInViewController spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[HUDropInViewController spinner](self, "spinner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimating");

  -[HUDropInViewController cameraLiveStreamViewTopConstraintToDescriptionTextView](self, "cameraLiveStreamViewTopConstraintToDescriptionTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 0);

  -[HUDropInViewController cameraLiveStreamViewTopConstraintToSpinnerLabel](self, "cameraLiveStreamViewTopConstraintToSpinnerLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[HUDropInViewController contentView](self, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)_hideSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HUDropInViewController spinnerLabel](self, "spinnerLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[HUDropInViewController spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[HUDropInViewController spinner](self, "spinner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopAnimating");

  -[HUDropInViewController cameraLiveStreamViewTopConstraintToSpinnerLabel](self, "cameraLiveStreamViewTopConstraintToSpinnerLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 0);

  -[HUDropInViewController cameraLiveStreamViewTopConstraintToDescriptionTextView](self, "cameraLiveStreamViewTopConstraintToDescriptionTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[HUDropInViewController contentView](self, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)_toggleMicrophone:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  HUDropInViewController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v14, 0x16u);

  }
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isUplinkMuted") ^ 1;
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activeSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUplinkMuted:", v10);

}

- (void)_updateRecordingUIWithDefaultState
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  HUDropInViewController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v13, 0x16u);

  }
  -[HUDropInViewController _showSpinner](self, "_showSpinner");
  -[HUDropInViewController talkButton](self, "talkButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[HUDropInViewController doneButton](self, "doneButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.0);

  -[HUDropInViewController audioWaveformView](self, "audioWaveformView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearPowerLevels");

  -[HUDropInViewController audioWaveformView](self, "audioWaveformView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 0.0);

  -[HUDropInViewController liveCameraView](self, "liveCameraView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 0.0);

  -[HUDropInViewController descriptionLabel](self, "descriptionLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", 0.0);

  -[HUDropInViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutIfNeeded");

}

- (void)_updateRecordingUIWithConnectedState
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  HUDropInViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  -[HUDropInViewController _hideSpinner](self, "_hideSpinner");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__HUDropInViewController__updateRecordingUIWithConnectedState__block_invoke;
  v6[3] = &unk_1E6F4D988;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v6, 0.25);
}

void __62__HUDropInViewController__updateRecordingUIWithConnectedState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "talkButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "doneButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "audioWaveformView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "liveCameraView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "descriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)_updateRecordingUIWithMicrophoneOn
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  HUDropInViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  -[HUDropInViewController _hideSpinner](self, "_hideSpinner");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__HUDropInViewController__updateRecordingUIWithMicrophoneOn__block_invoke;
  v6[3] = &unk_1E6F4D988;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v6, 0.25);
}

void __60__HUDropInViewController__updateRecordingUIWithMicrophoneOn__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "talkButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "doneButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "audioWaveformView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "liveCameraView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "descriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)_updateRecordingUIWithMicrophoneOff
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  HUDropInViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  -[HUDropInViewController _hideSpinner](self, "_hideSpinner");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HUDropInViewController__updateRecordingUIWithMicrophoneOff__block_invoke;
  v6[3] = &unk_1E6F4D988;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v6, 0.25);
}

void __61__HUDropInViewController__updateRecordingUIWithMicrophoneOff__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "talkButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "doneButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "audioWaveformView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "liveCameraView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "descriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)_dismissRecordingUIWithError:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, int);
  void *v13;
  HUDropInViewController *v14;
  id v15;
  uint8_t buf[4];
  HUDropInViewController *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v17 = self;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Dismissing UI due to error: %@", buf, 0x20u);

  }
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __55__HUDropInViewController__dismissRecordingUIWithError___block_invoke;
  v13 = &unk_1E6F4E048;
  v14 = self;
  v15 = v5;
  v8 = v5;
  v9 = _Block_copy(&v10);
  -[HUDropInViewController _dismissUpRecordingView:](self, "_dismissUpRecordingView:", v9, v10, v11, v12, v13, v14);

}

void __55__HUDropInViewController__dismissRecordingUIWithError___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (a2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "hasAttemptedEndingDropInSessionCall") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "currentAccessory");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "hf_serviceNameComponents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "composedString");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "serviceContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "actions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "anyObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_alloc(MEMORY[0x1E0D22F68]);
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = objc_msgSend(*(id *)(a1 + 40), "code");
      if (v5)
        v12 = v5;
      else
        v12 = &stru_1E6F60E80;
      objc_msgSend(v10, "hf_errorWithCode:description:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v9, "initWithInfo:error:", 0, v13);

      objc_msgSend(v8, "sendResponse:", v14);
    }
    objc_msgSend(*(id *)(a1 + 32), "serviceContext");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "remoteViewControllerProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invalidate");

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController talkButton](self, "talkButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != v10)
  {
    objc_msgSend(v8, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController doneButton](self, "doneButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 != v11)
    {
      v12 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  -[HUDropInViewController tapGestureRecognizer](self, "tapGestureRecognizer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v13 == v7;

  v11 = v4;
  if (v9 != v10)
    goto LABEL_5;
LABEL_6:

  return !v12;
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
  void *v25;
  _QWORD aBlock[5];

  v4 = a3;
  -[HUDropInViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationOfTouch:inView:", 0, v5);
  v7 = v6;
  v9 = v8;

  -[HUDropInViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  -[HUDropInViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  if (v9 > v12 + v14)
  {
    v17 = 1;
  }
  else
  {
    -[HUDropInViewController contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v9 < v16;

  }
  -[HUDropInViewController contentView](self, "contentView");
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
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __34__HUDropInViewController__didTap___block_invoke;
    aBlock[3] = &unk_1E6F4E300;
    aBlock[4] = self;
    v25 = _Block_copy(aBlock);
    -[HUDropInViewController _dismissUpRecordingView:](self, "_dismissUpRecordingView:", v25);

  }
}

void __34__HUDropInViewController__didTap___block_invoke(uint64_t a1, int a2)
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
  -[HUDropInViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;

  v8 = objc_msgSend(v4, "state");
  if (v8 == 3)
  {
    -[HUDropInViewController closeButtonTopConstraint](self, "closeButtonTopConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constant");
    v11 = v10;

    if (v11 > 120.0)
    {
      -[HUDropInViewController _dismissDownRecordingView:](self, "_dismissDownRecordingView:", 0);
      return;
    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "userInterfaceIdiom");

    if ((v23 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[HUDropInViewController contentViewTopConstraint](self, "contentViewTopConstraint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setConstant:", 30.0);

    }
    -[HUDropInViewController closeButtonTopConstraint](self, "closeButtonTopConstraint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setConstant:", 30.0);

    -[NSLayoutConstraint setConstant:](self->_dismissLabelTopConstraint, "setConstant:", -25.0);
    -[UILabel setAlpha:](self->_dismissLabel, "setAlpha:", 0.0);
    -[HUDropInViewController view](self, "view");
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
      -[HUDropInViewController contentViewTopConstraint](self, "contentViewTopConstraint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setConstant:", v7);

    }
    -[HUDropInViewController closeButtonTopConstraint](self, "closeButtonTopConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setConstant:", v7);

    v16 = v7 + -25.0;
    -[NSLayoutConstraint setConstant:](self->_dismissLabelTopConstraint, "setConstant:", v16);
    -[HUDropInViewController dismissLabel](self, "dismissLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlpha:", v16 / 120.0);

    -[HUDropInViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutIfNeeded");

    -[HUDropInViewController closeButtonTopConstraint](self, "closeButtonTopConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constant");
    v21 = v20;

    if (v21 > 120.0)
    {
      -[HUDropInViewController feedbackGenerator](self, "feedbackGenerator");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "impactOccurredWithIntensity:", 1.0);
LABEL_13:

    }
  }
}

- (void)_dismissUpRecordingView:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__HUDropInViewController__dismissUpRecordingView___block_invoke;
  v3[3] = &unk_1E6F4D988;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v3, a3, 0.25, 0.0);
}

uint64_t __50__HUDropInViewController__dismissUpRecordingView___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__HUDropInViewController__dismissUpRecordingView___block_invoke_2;
  v4[3] = &unk_1E6F4D988;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __50__HUDropInViewController__dismissUpRecordingView___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "dismissLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "contentViewHeightConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "contentViewWidthConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", 100.0);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "spinnerLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "talkButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "doneButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutIfNeeded");

}

- (void)_dismissDownRecordingView:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__HUDropInViewController__dismissDownRecordingView___block_invoke;
  v4[3] = &unk_1E6F4D988;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__HUDropInViewController__dismissDownRecordingView___block_invoke_3;
  v3[3] = &unk_1E6F4E300;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v4, v3, 0.5, 0.0);
}

uint64_t __52__HUDropInViewController__dismissDownRecordingView___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__HUDropInViewController__dismissDownRecordingView___block_invoke_2;
  v4[3] = &unk_1E6F4D988;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __52__HUDropInViewController__dismissDownRecordingView___block_invoke_2(uint64_t a1)
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

uint64_t __52__HUDropInViewController__dismissDownRecordingView___block_invoke_3(uint64_t result, int a2)
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
    v6[2] = __52__HUDropInViewController__dismissDownRecordingView___block_invoke_4;
    v6[3] = &unk_1E6F4D988;
    v7 = *(_QWORD *)(v2 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__HUDropInViewController__dismissDownRecordingView___block_invoke_6;
    v5[3] = &unk_1E6F4E300;
    v5[4] = v7;
    return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v6, v5, 0.25);
  }
  return result;
}

uint64_t __52__HUDropInViewController__dismissDownRecordingView___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__HUDropInViewController__dismissDownRecordingView___block_invoke_5;
  v4[3] = &unk_1E6F4D988;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __52__HUDropInViewController__dismissDownRecordingView___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __52__HUDropInViewController__dismissDownRecordingView___block_invoke_6(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "serviceContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewControllerProxy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

- (id)_recordButtonMicOnColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
}

- (id)_recordButtonMicOffColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
}

- (id)_waveformColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController traitCollection](self, "traitCollection");
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
  -[HUDropInViewController traitCollection](self, "traitCollection");
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

- (void)_launchDropInSessionIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  uint8_t buf[4];
  HUDropInViewController *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v37 = self;
    v38 = 2112;
    v39 = v8;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Device list for drop-in: %@", buf, 0x20u);

  }
  v9 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke;
  v35[3] = &unk_1E6F5BCD0;
  v35[4] = self;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v37 = self;
    v38 = 2112;
    v39 = v12;
    v40 = 2112;
    v41 = v10;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ DIDevice = %@", buf, 0x20u);

  }
  if (-[HUDropInViewController hasAttemptedDropInSessionCall](self, "hasAttemptedDropInSessionCall"))
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = self;
      v38 = 2112;
      v39 = v14;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ A dropin session has already been attempted before. No more attempts will occur.", buf, 0x16u);

    }
  }
  else
  {
    if (!v10)
      goto LABEL_10;
    -[HUDropInViewController dropInCenter](self, "dropInCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sessionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activeSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (v18)
    {
      if (objc_msgSend(v10, "state") != 2 && objc_msgSend(v10, "state") != 3)
      {
        HFLogForCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v37 = self;
          v38 = 2112;
          v39 = v21;
          _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@: %@ This device is supposedly not available for DropIn at this time. Will attempt session start anyway.", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        HFLogForCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stateExpiration");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v37 = self;
          v38 = 2112;
          v39 = v24;
          v40 = 2112;
          v41 = v22;
          v42 = 2112;
          v43 = v25;
          _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@: %@ Current date (%@) vs DropIn expiration date (%@)", buf, 0x2Au);

        }
      }
      HFLogForCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = self;
        v38 = 2112;
        v39 = v27;
        v40 = 2112;
        v41 = v10;
        _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "%@: %@ No active dropin session. Will launch new session for device %@.", buf, 0x20u);

      }
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D8D0]), "initWithDevice:", v10);
      -[HUDropInViewController dropInCenter](self, "dropInCenter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sessionManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setDelegate:", self);

      -[HUDropInViewController setHasAttemptedDropInSessionCall:](self, "setHasAttemptedDropInSessionCall:", 1);
      -[HUDropInViewController _updateRecordingUIWithDefaultState](self, "_updateRecordingUIWithDefaultState");
      -[HUDropInViewController spinnerLabel](self, "spinnerLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_Label_Connecting_State"), CFSTR("HUDropIn_Label_Connecting_State"), 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setText:", v31);

      objc_initWeak((id *)buf, self);
      -[HUDropInViewController dropInCenter](self, "dropInCenter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v9;
      v33[1] = 3221225472;
      v33[2] = __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke_69;
      v33[3] = &unk_1E6F5BCF8;
      objc_copyWeak(&v34, (id *)buf);
      objc_msgSend(v32, "startSessionWithRequest:completionHandler:", v13, v33);

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);
    }
    else
    {
LABEL_10:
      HFLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = self;
        v38 = 2112;
        v39 = v19;
        v40 = 2112;
        v41 = v10;
        _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ A dropin session is already active or device is not found: %@.", buf, 0x20u);

      }
    }
  }

}

uint64_t __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "homeKitIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

void __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_ERROR, "Failed to start dropin session with error: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke_70;
    block[3] = &unk_1E6F4C638;
    v16 = v6;
    v17 = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "state"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v5;
      v20 = 2112;
      v21 = v10;
      v22 = 2048;
      v23 = 0x4010000000000000;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Successfully started dropin session: %@ with state %@. We will update the session state in UI in about %lf seconds.", buf, 0x20u);

    }
    objc_initWeak((id *)buf, WeakRetained);
    v11 = dispatch_time(0, 4000000000);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke_72;
    v12[3] = &unk_1E6F50A68;
    objc_copyWeak(&v14, (id *)buf);
    v13 = v5;
    dispatch_after(v11, MEMORY[0x1E0C80D38], v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

}

void __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke_70(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "code") == 4)
  {
    v2 = *(void **)(a1 + 40);
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = 91;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "code") == 5)
  {
    v2 = *(void **)(a1 + 40);
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = 92;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "code") == 8)
  {
    v2 = *(void **)(a1 + 40);
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = 93;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "code") == 6)
  {
    v2 = *(void **)(a1 + 40);
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = 94;
  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "code");
    v2 = *(void **)(a1 + 40);
    v3 = (void *)MEMORY[0x1E0CB35C8];
    if (v5 == 7)
      v4 = 95;
    else
      v4 = 86;
  }
  objc_msgSend(v3, "hf_errorWithCode:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dismissRecordingUIWithError:");

}

void __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke_72(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setActiveDropInSession:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    objc_msgSend(WeakRetained, "spinnerLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_Label_Announcing_State"), CFSTR("HUDropIn_Label_Announcing_State"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", v4);

  }
  objc_msgSend(WeakRetained, "_updateRecordingUIWithDefaultState");
  objc_msgSend(WeakRetained, "dropInCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createAudioPowerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setDropInAudioPowerController:", v6);

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Created audio power controller", v9, 2u);
  }

  objc_msgSend(WeakRetained, "dropInAudioPowerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", WeakRetained);

}

- (UIButton)talkButton
{
  UIButton *talkButton;
  UIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
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
  UIButton *v35;

  talkButton = self->_talkButton;
  if (!talkButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUDropInButton_AX_Label_Title"), CFSTR("HUDropInButton_AX_Label_Title"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](v4, "setAccessibilityLabel:", v5);

    _HULocalizedStringWithDefaultValue(CFSTR("HUDropInButton_AX_Label_Hint_Enable_Mic"), CFSTR("HUDropInButton_AX_Label_Hint_Enable_Mic"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityHint:](v4, "setAccessibilityHint:", v6);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v4, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4, "setTintColor:", v8);

    -[UIButton _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 16.0);
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_microphoneGlyphForTalkingState:usingStandardSymbolConfiguration:", 0, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0CEA658]);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setImage:", v9);
    -[UIButton addSubview:](v4, "addSubview:", v10);
    v11 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v12);

    -[UIButton addSubview:](v4, "addSubview:", v11);
    objc_msgSend(v10, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](v4, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 13.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    objc_msgSend(v10, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](v4, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 25.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    objc_msgSend(v10, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 18.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    objc_msgSend(v10, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToConstant:", 18.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

    objc_msgSend(v11, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](v4, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 13.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    objc_msgSend(v11, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 10.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActive:", 1);

    objc_msgSend(v11, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](v4, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -25.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    objc_msgSend(v11, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToConstant:", 18.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    _HULocalizedStringWithDefaultValue(CFSTR("HUDropInButton_Label_Talk_State"), CFSTR("HUDropInButton_Label_Talk_State"), 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v34);

    -[UIButton sizeToFit](v4, "sizeToFit");
    v35 = self->_talkButton;
    self->_talkButton = v4;

    talkButton = self->_talkButton;
  }
  return talkButton;
}

- (UIButton)doneButton
{
  UIButton *doneButton;
  UIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
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
  UIButton *v23;

  doneButton = self->_doneButton;
  if (!doneButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUDropInDoneButton_AX_Label_Title"), CFSTR("HUDropInDoneButton_AX_Label_Title"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](v4, "setAccessibilityLabel:", v5);

    _HULocalizedStringWithDefaultValue(CFSTR("HUDropInButton_AX_Label_Hint_Disable_Mic"), CFSTR("HUDropInButton_AX_Label_Hint_Disable_Mic"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityHint:](v4, "setAccessibilityHint:", v6);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v4, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4, "setTintColor:", v8);

    -[UIButton _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 16.0);
    v9 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v10);

    -[UIButton addSubview:](v4, "addSubview:", v9);
    objc_msgSend(v9, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](v4, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 13.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    objc_msgSend(v9, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](v4, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 25.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    objc_msgSend(v9, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](v4, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -25.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    objc_msgSend(v9, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToConstant:", 18.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[UIButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 0.0, 18.0, 0.0, 18.0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    _HULocalizedStringWithDefaultValue(CFSTR("HUDropInButton_Label_Done_State"), CFSTR("HUDropInButton_Label_Done_State"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v22);

    v23 = self->_doneButton;
    self->_doneButton = v4;

    doneButton = self->_doneButton;
  }
  return doneButton;
}

- (void)managerDidUpdateDevices:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  _BOOL4 v18;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  SEL v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  uint8_t buf[4];
  HUDropInViewController *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v37 = self;
    v38 = 2112;
    v39 = (uint64_t)v7;
    v40 = 2112;
    v41 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Device manager: %@", buf, 0x20u);

  }
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "devices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __50__HUDropInViewController_managerDidUpdateDevices___block_invoke;
  v35[3] = &unk_1E6F5BCD0;
  v35[4] = self;
  objc_msgSend(v10, "na_firstObjectPassingTest:", v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    v15 = v14;
    objc_msgSend(v12, "stateExpiration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSince1970");
    v18 = v15 > v17;

    if (objc_msgSend(v12, "state"))
      v19 = v18;
    else
      v19 = 1;
    if (v19 == 1)
    {
      HFLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = self;
        v38 = 2112;
        v39 = (uint64_t)v21;
        v40 = 2112;
        v41 = v12;
        _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@: %@ Requesting device state refresh for device: %@", buf, 0x20u);

      }
      v30[0] = v11;
      v30[1] = 3221225472;
      v30[2] = __50__HUDropInViewController_managerDidUpdateDevices___block_invoke_91;
      v30[3] = &unk_1E6F570B8;
      v30[4] = self;
      v32 = a2;
      v31 = v12;
      objc_msgSend(v31, "refreshStateWithCompletionHandler:", v30);

    }
    -[HUDropInViewController _launchDropInSessionIfNeeded](self, "_launchDropInSessionIfNeeded");
  }
  else
  {
    HFLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDropInViewController currentAccessory](self, "currentAccessory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = self;
      v38 = 2112;
      v39 = (uint64_t)v23;
      v40 = 2112;
      v41 = v24;
      _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "%@: %@ Unable to find dropin device for accessory %@", buf, 0x20u);

    }
    -[HUDropInViewController startSessionRequestTimer](self, "startSessionRequestTimer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 == 0;

    if (v26)
    {
      HFLogForCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v37 = self;
        v38 = 2048;
        v39 = 30;
        _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "%@: Starting start session request timer (%lus)", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      v28 = (void *)MEMORY[0x1E0C99E88];
      v33[0] = v11;
      v33[1] = 3221225472;
      v33[2] = __50__HUDropInViewController_managerDidUpdateDevices___block_invoke_89;
      v33[3] = &unk_1E6F53298;
      objc_copyWeak(&v34, (id *)buf);
      objc_msgSend(v28, "scheduledTimerWithTimeInterval:repeats:block:", 0, v33, 30.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDropInViewController setStartSessionRequestTimer:](self, "setStartSessionRequestTimer:", v29);

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);
    }
  }

}

uint64_t __50__HUDropInViewController_managerDidUpdateDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "homeKitIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

void __50__HUDropInViewController_managerDidUpdateDevices___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Start session request timer fired %@. No DIDevice was found after waiting. Will dismiss UI.", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 87);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_dismissRecordingUIWithError:", v6);

}

void __50__HUDropInViewController_managerDidUpdateDevices___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v11 = 138413058;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "%@: %@ Failed to request refresh of device state for device: %@ with error %@", (uint8_t *)&v11, 0x2Au);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138412802;
    v12 = v9;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ Succeeded to request refresh of device state for device: %@", (uint8_t *)&v11, 0x20u);
    goto LABEL_6;
  }

}

- (void)manager:(id)a3 didAddDevice:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  HUDropInViewController *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v17 = self;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Added Device: %@", buf, 0x20u);

  }
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "devices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__HUDropInViewController_manager_didAddDevice___block_invoke;
  v15[3] = &unk_1E6F5BCD0;
  v15[4] = self;
  objc_msgSend(v11, "na_firstObjectPassingTest:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ Found DIDevice in device manager list: %@", buf, 0x20u);

    }
    -[HUDropInViewController _cancelStartSessionRequestTimerIfNeeded](self, "_cancelStartSessionRequestTimerIfNeeded");
    -[HUDropInViewController _launchDropInSessionIfNeeded](self, "_launchDropInSessionIfNeeded");
  }

}

uint64_t __47__HUDropInViewController_manager_didAddDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "homeKitIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (void)device:(id)a3 didUpdateState:(int64_t)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  HUDropInViewController *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1D8C0], "stringForDeviceState:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = self;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ Updated Device state to %@ for device: %@", (uint8_t *)&v15, 0x2Au);

  }
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activeSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "state");

  if (a4 == 2 && v14 == 2)
    -[HUDropInViewController _launchDropInSessionIfNeeded](self, "_launchDropInSessionIfNeeded");

}

- (id)hu_preloadContent
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  HUDropInViewController *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = self;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@ Preload content", buf, 0x16u);

  }
  -[HUDropInViewController serviceContext](self, "serviceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDropInViewController serviceContext](self, "serviceContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allHomesFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __43__HUDropInViewController_hu_preloadContent__block_invoke;
  v19[3] = &unk_1E6F54858;
  objc_copyWeak(&v22, (id *)buf);
  v13 = v7;
  v20 = v13;
  v14 = v9;
  v21 = v14;
  objc_msgSend(v11, "flatMap:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __43__HUDropInViewController_hu_preloadContent__block_invoke_97;
  v18[3] = &unk_1E6F4CD58;
  v18[4] = self;
  objc_msgSend(v15, "flatMap:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

  return v16;
}

id __43__HUDropInViewController_hu_preloadContent__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __43__HUDropInViewController_hu_preloadContent__block_invoke_2;
  v19[3] = &unk_1E6F564E8;
  v20 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_firstObjectPassingTest:", v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setCurrentHome:", v6);
  objc_msgSend(WeakRetained, "currentHome");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "hf_accessoryWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setCurrentAccessory:", v9);

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "currentAccessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "currentHome");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Found current accessory? %@ | Found current home? %@", buf, 0x16u);

  }
  v13 = (void *)MEMORY[0x1E0D519C0];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "currentAccessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInt:", v15 == 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "futureWithResult:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __43__HUDropInViewController_hu_preloadContent__block_invoke_2(uint64_t a1, void *a2)
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

id __43__HUDropInViewController_hu_preloadContent__block_invoke_97(uint64_t a1, void *a2)
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[16];

  v3 = objc_msgSend(a2, "BOOLValue");
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Will attempt to refresh home graph to find accessory", buf, 2u);
    }

    v6 = (void *)MEMORY[0x1E0D519C0];
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __43__HUDropInViewController_hu_preloadContent__block_invoke_98;
    v17 = &unk_1E6F4C660;
    v18 = *(_QWORD *)(a1 + 32);
    v7 = &v14;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "No need to refresh home graph. Accessory was found.", buf, 2u);
    }

    v6 = (void *)MEMORY[0x1E0D519C0];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __43__HUDropInViewController_hu_preloadContent__block_invoke_100;
    v12 = &unk_1E6F4C660;
    v13 = *(_QWORD *)(a1 + 32);
    v7 = &v9;
  }
  objc_msgSend(v6, "futureWithBlock:", v7, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __43__HUDropInViewController_hu_preloadContent__block_invoke_98(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshHomeGraph:", a2);
}

uint64_t __43__HUDropInViewController_hu_preloadContent__block_invoke_100(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preloadContent:", a2);
}

- (void)_preloadContent:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
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
  HUCameraLiveStreamViewController *v29;
  void *v30;
  HUCameraLiveStreamViewController *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  _QWORD v35[6];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDropInViewController.m"), 1125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("promise"));

  }
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HUDropInViewController currentAccessory](self, "currentAccessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController currentHome](self, "currentHome");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v7;
    v38 = 2112;
    v39 = v8;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Current accessory = %@ | Current home = %@", buf, 0x16u);

  }
  -[HUDropInViewController currentHome](self, "currentHome");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        -[HUDropInViewController currentAccessory](self, "currentAccessory"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    -[HUDropInViewController currentHome](self, "currentHome");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createHomeAudioAnalysisEventSubscriber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController setLastKnownEventSubscriber:](self, "setLastKnownEventSubscriber:", v13);

    -[HUDropInViewController lastKnownEventSubscriber](self, "lastKnownEventSubscriber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", self);

    -[HUDropInViewController lastKnownEventSubscriber](self, "lastKnownEventSubscriber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController currentAccessory](self, "currentAccessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subscribeLastKnownEventsForAccessory:completion:", v17, &__block_literal_global_223);

    v18 = objc_alloc(MEMORY[0x1E0D1D8C8]);
    -[HUDropInViewController currentHome](self, "currentHome");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithHomeIdentifier:queue:", v20, MEMORY[0x1E0C80D38]);
    -[HUDropInViewController setDropInCenter:](self, "setDropInCenter:", v21);

    -[HUDropInViewController dropInCenter](self, "dropInCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:", self);

    -[HUDropInViewController dropInCenter](self, "dropInCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "deviceManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDelegate:", self);

    -[HUDropInViewController currentHome](self, "currentHome");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hf_allCameraProfiles");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __42__HUDropInViewController__preloadContent___block_invoke_110;
    v35[3] = &unk_1E6F5BD40;
    v35[4] = self;
    v35[5] = a2;
    objc_msgSend(v26, "na_firstObjectPassingTest:", v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController setNearbyCameraProfile:](self, "setNearbyCameraProfile:", v27);

    -[HUDropInViewController nearbyCameraProfile](self, "nearbyCameraProfile");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [HUCameraLiveStreamViewController alloc];
      -[HUDropInViewController nearbyCameraProfile](self, "nearbyCameraProfile");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[HUCameraLiveStreamViewController initWithCameraProfile:](v29, "initWithCameraProfile:", v30);
      -[HUDropInViewController setLiveStreamController:](self, "setLiveStreamController:", v31);

      -[HUDropInViewController liveStreamController](self, "liveStreamController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setLiveStreamControllerDelegate:", self);

    }
  }
  else
  {
    HFLogForCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v33, OS_LOG_TYPE_DEFAULT, "No home and/or accessory found!", buf, 2u);
    }

  }
  objc_msgSend(v5, "finishWithNoResult");

}

void __42__HUDropInViewController__preloadContent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Failed to subscribe for last known events: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Successfully subscribed for last known events", (uint8_t *)&v5, 2u);
  }

}

uint64_t __42__HUDropInViewController__preloadContent___block_invoke_110(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  unsigned int v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v7) && (objc_msgSend(v3, "hf_shouldDisableLiveStream") & 1) == 0)
  {
    objc_msgSend(v3, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isReachable");

  }
  else
  {
    v8 = 0;
  }

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v8;
    v11 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v20, "isReachable");
    v14 = objc_msgSend(v3, "hf_shouldDisableLiveStream");
    objc_msgSend(v3, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "room");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentAccessory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "room");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v23 = v11;
    v8 = v21;
    v24 = 2112;
    v25 = v12;
    v26 = 1024;
    v27 = v21;
    v28 = 1024;
    v29 = v13;
    v30 = 1024;
    v31 = v14;
    v32 = 2112;
    v33 = v16;
    v34 = 2112;
    v35 = v18;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@ : %@ Should show camera in DropIn UI? %{BOOL}d Is reachable? %{BOOL}d Is live stream disabled? %{BOOL}d Camera room: %@ Accessory Room: %@", buf, 0x3Cu);

  }
  return v8;
}

- (void)_refreshHomeGraph:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  HUDropInViewController *v23;
  id v24;
  id v25;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDropInViewController.m"), 1160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("promise"));

  }
  -[HUDropInViewController serviceContext](self, "serviceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDropInViewController serviceContext](self, "serviceContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __44__HUDropInViewController__refreshHomeGraph___block_invoke;
  v20[3] = &unk_1E6F529D8;
  v21 = v10;
  v22 = v5;
  v23 = self;
  v24 = v7;
  v25 = v9;
  v14 = v9;
  v15 = v7;
  v16 = v5;
  v17 = v10;
  v18 = (id)objc_msgSend(v12, "_refreshBeforeDate:completionHandler:", v13, v20);

}

void __44__HUDropInViewController__refreshHomeGraph___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD block[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v6 = v5;

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[HUDropInViewController _refreshHomeGraph:]_block_invoke";
    v27 = 2048;
    v28 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%s Home graph refresh took %f", buf, 0x16u);
  }

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__HUDropInViewController__refreshHomeGraph___block_invoke_113;
  aBlock[3] = &unk_1E6F5BD68;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(void **)(a1 + 56);
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v24 = *(id *)(a1 + 64);
  v12 = _Block_copy(aBlock);
  if (a2)
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[HUDropInViewController _refreshHomeGraph:]_block_invoke";
      _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "%s Unable to refresh home graph, force a retry after 1s", buf, 0xCu);
    }

    v14 = dispatch_time(0, 1000000000);
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __44__HUDropInViewController__refreshHomeGraph___block_invoke_116;
    block[3] = &unk_1E6F4D9B0;
    v19 = v12;
    dispatch_after(v14, MEMORY[0x1E0C80D38], block);
    v15 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allHomesFuture");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "addCompletionBlock:", v12);

  }
}

void __44__HUDropInViewController__refreshHomeGraph___block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__HUDropInViewController__refreshHomeGraph___block_invoke_114;
    v13[3] = &unk_1E6F564E8;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v5, "na_firstObjectPassingTest:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setCurrentHome:", v7);

    objc_msgSend(*(id *)(a1 + 40), "currentHome");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v8, "hf_accessoryWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setCurrentAccessory:", v10);

    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[HUDropInViewController _refreshHomeGraph:]_block_invoke_2";
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%s : Fetched all homes after home graph refresh. Homes: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_preloadContent:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[HUDropInViewController _refreshHomeGraph:]_block_invoke";
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "%s : Unable to fetch homes. Homes = %@ | Error: %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

uint64_t __44__HUDropInViewController__refreshHomeGraph___block_invoke_114(uint64_t a1, void *a2)
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

void __44__HUDropInViewController__refreshHomeGraph___block_invoke_116(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allHomesFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "addCompletionBlock:", *(_QWORD *)(a1 + 32));

}

- (void)streamControllerStateDidUpdate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  -[HUDropInViewController nearbyCameraProfile](self, "nearbyCameraProfile", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "streamControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "streamState");
  if (v8 == 2)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraLive"), CFSTR("HUCameraLive"), 1);
  }
  else
  {
    -[HUDropInViewController nearbyCameraProfile](self, "nearbyCameraProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "snapshotControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mostRecentSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_localizedAge");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController descriptionLabel](self, "descriptionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  if (v8 != 2)
  {

    v9 = v3;
  }

}

- (void)serverDisconnectedForDropInCenter:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  HUDropInViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v11;
    _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "%@: %@ Disconnected from DropIn process", (uint8_t *)&v12, 0x16u);

  }
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = 88;
  else
    v9 = 86;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController _dismissRecordingUIWithError:](self, "_dismissRecordingUIWithError:", v10);

}

- (void)session:(id)a3 didUpdateState:(unint64_t)a4 reason:(unint64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  int v33;
  HUDropInViewController *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[HUDropInViewController activeDropInSession](self, "activeDropInSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 && v10)
  {
    -[HUDropInViewController activeDropInSession](self, "activeDropInSession");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 != v9)
    {
      HFLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUDropInViewController activeDropInSession](self, "activeDropInSession");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138413058;
        v34 = self;
        v35 = 2112;
        v36 = v14;
        v37 = 2112;
        v38 = v9;
        v39 = 2112;
        v40 = v15;
        _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ Received callback for session %@ which is different from current Session %@. Not Handling...", (uint8_t *)&v33, 0x2Au);

      }
LABEL_24:

      goto LABEL_25;
    }
  }
  else
  {

  }
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1D8D8], "stringForDropInSessionState:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1D8D8], "stringForDropInSessionStateReason:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138413058;
    v34 = self;
    v35 = 2112;
    v36 = v17;
    v37 = 2112;
    v38 = v18;
    v39 = 2112;
    v40 = v19;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@: %@ Dropin Session state: %@ with reason: %@", (uint8_t *)&v33, 0x2Au);

  }
  if (objc_msgSend(v9, "state") == 1)
  {
    -[HUDropInViewController spinnerLabel](self, "spinnerLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_Label_Connecting_State"), CFSTR("HUDropIn_Label_Connecting_State"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v21);

  }
  else if (objc_msgSend(v9, "state") == 4 && !-[HUDropInViewController hasSessionStarted](self, "hasSessionStarted"))
  {
    -[HUDropInViewController setHasSessionStarted:](self, "setHasSessionStarted:", 1);
    HFLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDropInViewController dropInCenter](self, "dropInCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sessionManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "activeSession");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isUplinkMuted");
      v33 = 138412802;
      v34 = self;
      v35 = 2112;
      v36 = v23;
      v37 = 1024;
      LODWORD(v38) = v27;
      _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "%@: %@ Is uplink audio muted?: %{BOOL}d", (uint8_t *)&v33, 0x1Cu);

    }
    -[HUDropInViewController _updateRecordingUIWithConnectedState](self, "_updateRecordingUIWithConnectedState");
    -[HUDropInViewController dropInCenter](self, "dropInCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sessionManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activeSession");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isUplinkMuted");

    if (v31)
      -[HUDropInViewController _updateRecordingUIWithMicrophoneOff](self, "_updateRecordingUIWithMicrophoneOff");
    else
      -[HUDropInViewController _updateRecordingUIWithMicrophoneOn](self, "_updateRecordingUIWithMicrophoneOn");
  }
  if (objc_msgSend(v9, "state") == 6 || objc_msgSend(v9, "state") == 7)
  {
    if (a5 == 6)
      v32 = 91;
    else
      v32 = 90;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", v32);
    v13 = objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController _dismissRecordingUIWithError:](self, "_dismissRecordingUIWithError:", v13);
    goto LABEL_24;
  }
LABEL_25:

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  uint8_t buf[4];
  HUDropInViewController *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = self;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ Dropin session failed with error: %@", buf, 0x20u);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HUDropInViewController_session_didFailWithError___block_invoke;
  block[3] = &unk_1E6F54070;
  block[4] = self;
  v13 = v7;
  v14 = a2;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __51__HUDropInViewController_session_didFailWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activeDropInSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || (v4 = *(void **)(a1 + 40)) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "activeDropInSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "dropInCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "devices");
    v6 = objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__HUDropInViewController_session_didFailWithError___block_invoke_117;
    v19[3] = &unk_1E6F5BCD0;
    v19[4] = *(_QWORD *)(a1 + 32);
    -[NSObject na_firstObjectPassingTest:](v6, "na_firstObjectPassingTest:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ Session failed for DIDevice : %@", buf, 0x20u);

    }
    if (objc_msgSend(v8, "state") == 2 || objc_msgSend(v8, "state") == 3)
    {
      v16 = *(void **)(a1 + 32);
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = 89;
    }
    else
    {
      v16 = *(void **)(a1 + 32);
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = 88;
    }
    objc_msgSend(v17, "hf_errorWithCode:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_dismissRecordingUIWithError:", v10);
    goto LABEL_14;
  }
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "activeDropInSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Received callback for session %@ which is different from current Session %@. Not Handling...", buf, 0x2Au);
LABEL_14:

  }
}

uint64_t __51__HUDropInViewController_session_didFailWithError___block_invoke_117(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "homeKitIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (void)session:(id)a3 didUpdateUplinkMuteStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
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
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _BOOL4 v34;
  uint8_t buf[4];
  HUDropInViewController *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[HUDropInViewController activeDropInSession](self, "activeDropInSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 && v8)
  {
    -[HUDropInViewController activeDropInSession](self, "activeDropInSession");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 != v7)
    {
      HFLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUDropInViewController activeDropInSession](self, "activeDropInSession");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v36 = self;
        v37 = 2112;
        v38 = v12;
        v39 = 2112;
        v40 = v7;
        v41 = 2112;
        v42 = v13;
        _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ Received callback for session %@ which is different from current Session %@. Not Handling...", buf, 0x2Au);

LABEL_16:
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {

  }
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v36 = self;
    v37 = 2112;
    v38 = v15;
    v39 = 1024;
    LODWORD(v40) = v4;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@: %@ Uplink dropin audio muted? %{BOOL}d", buf, 0x1Cu);

  }
  v34 = v4;

  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D1D8D8];
    -[HUDropInViewController dropInCenter](self, "dropInCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sessionManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activeSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringForDropInSessionState:", objc_msgSend(v21, "state"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v36 = self;
    v37 = 2112;
    v38 = v17;
    v39 = 2112;
    v40 = v22;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@: %@ Dropin Session state: %@", buf, 0x20u);

  }
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sessionManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activeSession");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "state") == 6)
  {

    goto LABEL_14;
  }
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sessionManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activeSession");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "state");

  if (v29 == 7)
  {
LABEL_14:
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = self;
      v37 = 2112;
      v38 = v12;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ Active session is already ended or removed. Ignoring mute status change.", buf, 0x16u);
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sessionManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activeSession");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "state");

  if (v33 == 4)
  {
    if (!-[HUDropInViewController hasSessionStarted](self, "hasSessionStarted"))
    {
      -[HUDropInViewController setHasSessionStarted:](self, "setHasSessionStarted:", 1);
      -[HUDropInViewController _updateRecordingUIWithConnectedState](self, "_updateRecordingUIWithConnectedState");
    }
    if (v34)
      -[HUDropInViewController _updateRecordingUIWithMicrophoneOff](self, "_updateRecordingUIWithMicrophoneOff");
    else
      -[HUDropInViewController _updateRecordingUIWithMicrophoneOn](self, "_updateRecordingUIWithMicrophoneOn");
  }
LABEL_18:

}

- (void)subscriber:(id)a3 didUpdateBulletins:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  uint8_t buf[4];
  HUDropInViewController *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v43 = self;
    v44 = 2112;
    v45 = v8;
    v46 = 2112;
    v47 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Last Known Event Bulletins: %@", buf, 0x20u);

  }
  -[HUDropInViewController setEventBulletins:](self, "setEventBulletins:", v6);
  -[HUDropInViewController eventBulletins](self, "eventBulletins");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __56__HUDropInViewController_subscriber_didUpdateBulletins___block_invoke;
  v41[3] = &unk_1E6F5BD90;
  v41[4] = self;
  objc_msgSend(v9, "na_firstObjectPassingTest:", v41);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v43 = self;
    v44 = 2112;
    v45 = v12;
    v46 = 2112;
    v47 = v10;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ Found last known event for accessory: %@", buf, 0x20u);

  }
  objc_msgSend(v10, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateOfOccurrence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInViewController currentAccessory](self, "currentAccessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_serviceNameComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "composedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v13, 0, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "state"))
  {
    if (objc_msgSend(v13, "hf_isSingularHour"))
      v37 = CFSTR("HUDropIn_Description_Alarm_Started_SingularHour_FormatString");
    else
      v37 = CFSTR("HUDropIn_Description_Alarm_Started_PluralHour_FormatString");
    HULocalizedStringWithFormat(v37, CFSTR("%@%@"), v31, v32, v33, v34, v35, v36, (uint64_t)v17);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController descriptionTextView](self, "descriptionTextView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);
LABEL_21:

    goto LABEL_22;
  }
  if (objc_msgSend(v10, "state") == 1)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0CB3570]);
    objc_msgSend(v19, "setUnitsStyle:", 3);
    objc_msgSend(v19, "setAllowedUnits:", 64);
    objc_msgSend(v19, "stringFromDate:toDate:", v13, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v13);
    v22 = v21;
    v23 = objc_msgSend(v13, "hf_isSingularHour");
    if (v22 >= 60.0)
    {
      if (v23)
        v38 = CFSTR("HUDropIn_Description_Alarm_Ended_SingularHour_FormatString");
      else
        v38 = CFSTR("HUDropIn_Description_Alarm_Ended_PluralHour_FormatString");
      HULocalizedStringWithFormat(v38, CFSTR("%@%@%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v17);
    }
    else
    {
      if (v23)
        v30 = CFSTR("HUDropIn_Description_Alarm_Ended_SingularHour_LessThanOneMin_FormatString");
      else
        v30 = CFSTR("HUDropIn_Description_Alarm_Ended_PluralHour_LessThanOneMin_FormatString");
      HULocalizedStringWithFormat(v30, CFSTR("%@%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v17);
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInViewController descriptionTextView](self, "descriptionTextView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setText:", v39);

    goto LABEL_21;
  }
LABEL_22:

}

uint64_t __56__HUDropInViewController_subscriber_didUpdateBulletins___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "accessoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (void)controller:(id)a3 didUpdateAudioPowerForDropInDevice:(float)a4
{
  NSObject *v7;
  void *v8;
  long double v9;
  void *v10;
  void *v11;
  int v12;
  HUDropInViewController *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  long double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDropInViewController.m"), 1371, CFSTR("didUpdateAudioPowerForDropInDevice called from secondary thread"));

  }
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a4;
    v12 = 138412802;
    v13 = self;
    v14 = 2112;
    v15 = v8;
    v16 = 2048;
    v17 = v9;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Updated audio power: %f", (uint8_t *)&v12, 0x20u);

  }
  else
  {
    v9 = a4;
  }

  -[HUDropInViewController audioWaveformView](self, "audioWaveformView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendPowerLevel:", (double)(log10(v9) * 20.0));

}

- (void)manager:(id)a3 didUpdateActiveSession:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HUDropInViewController *v22;
  int v23;
  HUDropInViewController *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HUDropInViewController activeDropInSession](self, "activeDropInSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && v7)
  {
    -[HUDropInViewController activeDropInSession](self, "activeDropInSession");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v6)
    {
      HFLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        goto LABEL_15;
      }
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDropInViewController activeDropInSession](self, "activeDropInSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138413058;
      v24 = self;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v12;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@: %@ Received callback for session %@ which is different from current Session %@. Not Handling...", (uint8_t *)&v23, 0x2Au);
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {

  }
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    v24 = self;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ Updated active session: %@", (uint8_t *)&v23, 0x20u);

  }
  -[HUDropInViewController dropInCenter](self, "dropInCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sessionManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activeSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[HUDropInViewController dropInCenter](self, "dropInCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sessionManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activeSession");
      v22 = (HUDropInViewController *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v22;
      _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "Active dropin session == %@", (uint8_t *)&v23, 0xCu);

    }
    -[HUDropInViewController dropInCenter](self, "dropInCenter");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject sessionManager](v10, "sessionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activeSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);
    goto LABEL_13;
  }
LABEL_15:

}

- (HUHomeControlServiceContext)serviceContext
{
  return self->_serviceContext;
}

- (void)setServiceContext:(id)a3
{
  objc_storeStrong((id *)&self->_serviceContext, a3);
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

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (UILabel)spinnerLabel
{
  return self->_spinnerLabel;
}

- (void)setSpinnerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerLabel, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UITextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionTextView, a3);
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

- (void)setTalkButton:(id)a3
{
  objc_storeStrong((id *)&self->_talkButton, a3);
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (double)recordedDuration
{
  return self->_recordedDuration;
}

- (void)setRecordedDuration:(double)a3
{
  self->_recordedDuration = a3;
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

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (void)setCurrentHome:(id)a3
{
  objc_storeStrong((id *)&self->_currentHome, a3);
}

- (HMAccessory)currentAccessory
{
  return self->_currentAccessory;
}

- (void)setCurrentAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_currentAccessory, a3);
}

- (NSArray)eventBulletins
{
  return self->_eventBulletins;
}

- (void)setEventBulletins:(id)a3
{
  objc_storeStrong((id *)&self->_eventBulletins, a3);
}

- (DIDropInCenter)dropInCenter
{
  return self->_dropInCenter;
}

- (void)setDropInCenter:(id)a3
{
  objc_storeStrong((id *)&self->_dropInCenter, a3);
}

- (DIAudioPowerController)dropInAudioPowerController
{
  return self->_dropInAudioPowerController;
}

- (void)setDropInAudioPowerController:(id)a3
{
  objc_storeStrong((id *)&self->_dropInAudioPowerController, a3);
}

- (HMAudioAnalysisLastKnownEventSubscriber)lastKnownEventSubscriber
{
  return self->_lastKnownEventSubscriber;
}

- (void)setLastKnownEventSubscriber:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownEventSubscriber, a3);
}

- (BOOL)hasAttemptedDropInSessionCall
{
  return self->_hasAttemptedDropInSessionCall;
}

- (void)setHasAttemptedDropInSessionCall:(BOOL)a3
{
  self->_hasAttemptedDropInSessionCall = a3;
}

- (BOOL)hasAttemptedEndingDropInSessionCall
{
  return self->_hasAttemptedEndingDropInSessionCall;
}

- (void)setHasAttemptedEndingDropInSessionCall:(BOOL)a3
{
  self->_hasAttemptedEndingDropInSessionCall = a3;
}

- (BOOL)hasSessionStarted
{
  return self->_hasSessionStarted;
}

- (void)setHasSessionStarted:(BOOL)a3
{
  self->_hasSessionStarted = a3;
}

- (DIDropInSession)activeDropInSession
{
  return self->_activeDropInSession;
}

- (void)setActiveDropInSession:(id)a3
{
  objc_storeStrong((id *)&self->_activeDropInSession, a3);
}

- (NSTimer)startSessionRequestTimer
{
  return self->_startSessionRequestTimer;
}

- (void)setStartSessionRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_startSessionRequestTimer, a3);
}

- (HMCameraProfile)nearbyCameraProfile
{
  return self->_nearbyCameraProfile;
}

- (void)setNearbyCameraProfile:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyCameraProfile, a3);
}

- (UIView)liveCameraView
{
  return self->_liveCameraView;
}

- (void)setLiveCameraView:(id)a3
{
  objc_storeStrong((id *)&self->_liveCameraView, a3);
}

- (HUCameraLiveStreamViewController)liveStreamController
{
  return self->_liveStreamController;
}

- (void)setLiveStreamController:(id)a3
{
  objc_storeStrong((id *)&self->_liveStreamController, a3);
}

- (HULegibilityLabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (NSLayoutConstraint)cameraLiveStreamViewTopConstraintToSpinnerLabel
{
  return self->_cameraLiveStreamViewTopConstraintToSpinnerLabel;
}

- (void)setCameraLiveStreamViewTopConstraintToSpinnerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_cameraLiveStreamViewTopConstraintToSpinnerLabel, a3);
}

- (NSLayoutConstraint)cameraLiveStreamViewTopConstraintToDescriptionTextView
{
  return self->_cameraLiveStreamViewTopConstraintToDescriptionTextView;
}

- (void)setCameraLiveStreamViewTopConstraintToDescriptionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraLiveStreamViewTopConstraintToDescriptionTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraLiveStreamViewTopConstraintToDescriptionTextView, 0);
  objc_storeStrong((id *)&self->_cameraLiveStreamViewTopConstraintToSpinnerLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_liveStreamController, 0);
  objc_storeStrong((id *)&self->_liveCameraView, 0);
  objc_storeStrong((id *)&self->_nearbyCameraProfile, 0);
  objc_storeStrong((id *)&self->_startSessionRequestTimer, 0);
  objc_storeStrong((id *)&self->_activeDropInSession, 0);
  objc_storeStrong((id *)&self->_lastKnownEventSubscriber, 0);
  objc_storeStrong((id *)&self->_dropInAudioPowerController, 0);
  objc_storeStrong((id *)&self->_dropInCenter, 0);
  objc_storeStrong((id *)&self->_eventBulletins, 0);
  objc_storeStrong((id *)&self->_currentAccessory, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_closeButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_talkButton, 0);
  objc_storeStrong((id *)&self->_audioWaveformView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_closeButtonVisualEffectView, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_spinnerLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_dismissLabelVisualEffectView, 0);
  objc_storeStrong((id *)&self->_dismissLabel, 0);
  objc_storeStrong((id *)&self->_serviceContext, 0);
}

@end
