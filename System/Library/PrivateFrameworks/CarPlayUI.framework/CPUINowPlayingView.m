@implementation CPUINowPlayingView

- (CPUINowPlayingView)initWithFrame:(CGRect)a3
{
  CPUINowPlayingView *v3;
  void *v4;
  void *v5;
  void *v6;
  CPUIShadowImageView *v7;
  CPUIShadowImageView *artworkViewBrick;
  CPUISongDetailsView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  CPUISongDetailsView *songDetailsView;
  CPUITransportControlView *v16;
  CPUITransportControlView *transportControlView;
  CPUIProgressView *v18;
  CPUIProgressView *progressView;
  CPUIPlayModeControlView *v20;
  CPUIPlayModeControlView *playModeControlView;
  uint64_t v22;
  UIImageView *progressImageView;
  UIFocusContainerGuide *v24;
  UIFocusContainerGuide *controlsFocusContainerGuide;
  void *v26;
  UIFocusContainerGuide *v27;
  UIFocusContainerGuide *bottomRegionFocusContainerGuide;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CPUINowPlayingView;
  v3 = -[CPUINowPlayingView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUINowPlayingView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CPUINowPlayingView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUINowPlayingView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    -[CPUINowPlayingView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

    v7 = objc_alloc_init(CPUIShadowImageView);
    artworkViewBrick = v3->_artworkViewBrick;
    v3->_artworkViewBrick = v7;

    -[CPUIShadowImageView setContentMode:](v3->_artworkViewBrick, "setContentMode:", 2);
    -[CPUIShadowImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_artworkViewBrick, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUINowPlayingView addSubview:](v3, "addSubview:", v3->_artworkViewBrick);
    v9 = [CPUISongDetailsView alloc];
    v10 = *MEMORY[0x24BDBF090];
    v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v14 = -[CPUISongDetailsView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x24BDBF090], v11, v12, v13);
    songDetailsView = v3->_songDetailsView;
    v3->_songDetailsView = (CPUISongDetailsView *)v14;

    -[CPUISongDetailsView setTranslatesAutoresizingMaskIntoConstraints:](v3->_songDetailsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUINowPlayingView addSubview:](v3, "addSubview:", v3->_songDetailsView);
    v16 = -[CPUITransportControlView initWithFrame:]([CPUITransportControlView alloc], "initWithFrame:", v10, v11, v12, v13);
    transportControlView = v3->_transportControlView;
    v3->_transportControlView = v16;

    -[CPUITransportControlView setTranslatesAutoresizingMaskIntoConstraints:](v3->_transportControlView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUINowPlayingView addSubview:](v3, "addSubview:", v3->_transportControlView);
    v18 = -[CPUIProgressView initWithFrame:]([CPUIProgressView alloc], "initWithFrame:", v10, v11, v12, v13);
    progressView = v3->_progressView;
    v3->_progressView = v18;

    -[CPUIProgressView setTranslatesAutoresizingMaskIntoConstraints:](v3->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUINowPlayingView addSubview:](v3, "addSubview:", v3->_progressView);
    v20 = -[CPUIPlayModeControlView initWithFrame:]([CPUIPlayModeControlView alloc], "initWithFrame:", v10, v11, v12, v13);
    playModeControlView = v3->_playModeControlView;
    v3->_playModeControlView = v20;

    -[CPUIPlayModeControlView setTranslatesAutoresizingMaskIntoConstraints:](v3->_playModeControlView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUINowPlayingView addSubview:](v3, "addSubview:", v3->_playModeControlView);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
    progressImageView = v3->_progressImageView;
    v3->_progressImageView = (UIImageView *)v22;

    -[UIImageView setContentMode:](v3->_progressImageView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_progressImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setHidden:](v3->_progressImageView, "setHidden:", 1);
    -[CPUINowPlayingView addSubview:](v3, "addSubview:", v3->_progressImageView);
    v24 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x24BDF6A50]);
    controlsFocusContainerGuide = v3->_controlsFocusContainerGuide;
    v3->_controlsFocusContainerGuide = v24;

    -[CPUINowPlayingView controlsFocusContainerGuide](v3, "controlsFocusContainerGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUINowPlayingView addLayoutGuide:](v3, "addLayoutGuide:", v26);

    v27 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x24BDF6A50]);
    bottomRegionFocusContainerGuide = v3->_bottomRegionFocusContainerGuide;
    v3->_bottomRegionFocusContainerGuide = v27;

    -[CPUINowPlayingView bottomRegionFocusContainerGuide](v3, "bottomRegionFocusContainerGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUINowPlayingView addLayoutGuide:](v3, "addLayoutGuide:", v29);

  }
  return v3;
}

- (void)recalculateLayout:(BOOL)a3 allowsAlbumArt:(BOOL)a4 hasDataSource:(BOOL)a5 viewArea:(CGRect)a6 safeArea:(CGRect)a7 rightHandDrive:(BOOL)a8
{
  _BOOL8 v8;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  _BOOL8 v18;
  void *v21;
  uint64_t v22;
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
  void *v34;
  _BOOL8 v35;
  id v36;

  v8 = a8;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v13 = a6.size.height;
  v14 = a6.size.width;
  v15 = a6.origin.y;
  v16 = a6.origin.x;
  v17 = a5;
  v18 = a4;
  -[CPUINowPlayingView nowPlayingLayout](self, "nowPlayingLayout");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingView traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayScale");
  CPUINowPlayingLayoutForSafeAreaFrameScaleArtwork(v18, x, y, width, height, v16, v15, v14, v13, v8, v22, v23, v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 || !objc_msgSend(v36, "isEqual:", v29))
  {
    objc_storeStrong((id *)&self->_nowPlayingLayout, v29);
    -[CPUIPlayModeControlView setShowsArtwork:](self->_playModeControlView, "setShowsArtwork:", objc_msgSend(v29, "showsArtwork"));
    -[CPUISongDetailsView setFontStyle:](self->_songDetailsView, "setFontStyle:", objc_msgSend(v29, "trackInfoFontStyle"));
    objc_msgSend(v29, "maximumTitleViewSize");
    -[CPUISongDetailsView setMaximumTitleViewSize:](self->_songDetailsView, "setMaximumTitleViewSize:");
    objc_msgSend(v29, "transportControlButtonHeight");
    -[CPUITransportControlView setButtonHeight:](self->_transportControlView, "setButtonHeight:");
    objc_msgSend(v29, "transportControlButtonSpacing");
    -[CPUITransportControlView setButtonSpacing:](self->_transportControlView, "setButtonSpacing:");
    -[CPUIShadowImageView setHidden:](self->_artworkViewBrick, "setHidden:", objc_msgSend(v29, "showsArtwork") ^ 1);
    objc_msgSend(v29, "playModeControlButtonWidth");
    -[CPUIPlayModeControlView setButtonWidth:](self->_playModeControlView, "setButtonWidth:");
    objc_msgSend(v29, "playModeControlButtonSpacing");
    -[CPUIPlayModeControlView setButtonSpacing:](self->_playModeControlView, "setButtonSpacing:");
    v30 = (void *)MEMORY[0x24BDD1628];
    -[CPUINowPlayingView activeConstraints](self, "activeConstraints");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "deactivateConstraints:", v31);

    -[CPUINowPlayingView _constraintsForNowPlayingLayout:](self, "_constraintsForNowPlayingLayout:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUINowPlayingView setActiveConstraints:](self, "setActiveConstraints:", v32);

    v33 = (void *)MEMORY[0x24BDD1628];
    -[CPUINowPlayingView activeConstraints](self, "activeConstraints");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v34);

  }
  v35 = !v17;
  -[CPUITransportControlView setHidden:](self->_transportControlView, "setHidden:", v35);
  -[CPUITransportControlView setNeedsUpdateConstraints](self->_transportControlView, "setNeedsUpdateConstraints");
  -[CPUIPlayModeControlView setHidden:](self->_playModeControlView, "setHidden:", v35);
  -[CPUISongDetailsView setHidden:](self->_songDetailsView, "setHidden:", v35);

}

- (id)_equalHeightVerticalSpacers:(unint64_t)a3 minimumPadding:(double)a4 maximumPadding:(double)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v10 = 0;
    do
    {
      v11 = (void *)objc_opt_new();
      -[CPUINowPlayingView addLayoutGuide:](self, "addLayoutGuide:", v11);
      objc_msgSend(v9, "addObject:", v11);
      if (a4 > 0.0)
      {
        objc_msgSend(v11, "heightAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "constraintGreaterThanOrEqualToConstant:", a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setActive:", 1);
      }
      if (a5 > 0.0)
      {
        objc_msgSend(v11, "heightAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "constraintLessThanOrEqualToConstant:", a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "setActive:", 1);
      }
      if (v10)
      {
        objc_msgSend(v11, "heightAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v10 - 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "heightAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "constraintEqualToAnchor:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "setActive:", 1);
      }

      ++v10;
    }
    while (a3 != v10);
  }
  return v9;
}

- (id)_constraintsForNowPlayingLayout:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
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
  id *p_isa;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  CPUIShadowImageView *artworkViewBrick;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  unint64_t v52;
  void *v53;
  CPUITransportControlView *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id *v61;
  void *v62;
  void *v63;
  int v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  CPUIProgressView *progressView;
  double v73;
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
  int v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void **v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  CPUIProgressView *v112;
  void *v113;
  uint64_t v114;
  id *v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  double v120;
  void *v121;
  void *v122;
  unint64_t v123;
  NSArray *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  void *v136;
  unint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  id *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  NSArray *verticalSpacerLayoutGuides;
  void *v150;
  void *v151;
  id *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
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
  int v203;
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
  void *v285;
  void *v286;
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
  uint64_t v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  uint64_t v303;
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
  CPUITransportControlView **p_transportControlView;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  CPUINowPlayingView *v323;
  void *v324;
  CPUIProgressView *v325;
  _QWORD v326[5];
  _QWORD v327[7];
  _QWORD v328[9];
  _QWORD v329[8];
  _QWORD v330[9];
  _QWORD v331[9];
  void *v332;
  void *v333;
  _QWORD v334[8];
  _QWORD v335[2];
  _QWORD v336[16];

  v336[14] = *MEMORY[0x24BDAC8D0];
  v324 = (void *)objc_opt_new();
  -[CPUINowPlayingView nowPlayingLayout](self, "nowPlayingLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMargins");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CPUINowPlayingView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v325 = (CPUIProgressView *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingView verticalSpacerLayoutGuides](self, "verticalSpacerLayoutGuides");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[CPUINowPlayingView verticalSpacerLayoutGuides](self, "verticalSpacerLayoutGuides");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v326[0] = MEMORY[0x24BDAC760];
    v326[1] = 3221225472;
    v326[2] = __54__CPUINowPlayingView__constraintsForNowPlayingLayout___block_invoke;
    v326[3] = &unk_24DF24688;
    v326[4] = self;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v326);

  }
  +[CPUISongDetailsView maximumHeightForTrackInfoFontStyle:](CPUISongDetailsView, "maximumHeightForTrackInfoFontStyle:", objc_msgSend(v4, "trackInfoFontStyle"));
  v17 = v16;
  objc_msgSend(v4, "maximumTitleViewSize");
  if (v17 >= v18)
    v17 = v18;
  -[UIFocusContainerGuide topAnchor](self->_controlsFocusContainerGuide, "topAnchor");
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIProgressView topAnchor](v325, "topAnchor");
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v308, "constraintEqualToAnchor:", v302);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v336[0] = v296;
  -[UIFocusContainerGuide bottomAnchor](self->_controlsFocusContainerGuide, "bottomAnchor");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIProgressView bottomAnchor](v325, "bottomAnchor");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "constraintEqualToAnchor:", v283);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v336[1] = v276;
  -[UIFocusContainerGuide leadingAnchor](self->_controlsFocusContainerGuide, "leadingAnchor");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIProgressView leadingAnchor](v325, "leadingAnchor");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "constraintEqualToAnchor:", v262);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v336[2] = v255;
  -[UIFocusContainerGuide trailingAnchor](self->_controlsFocusContainerGuide, "trailingAnchor");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIProgressView trailingAnchor](v325, "trailingAnchor");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "constraintEqualToAnchor:", v241);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v336[3] = v234;
  -[CPUISongDetailsView heightAnchor](self->_songDetailsView, "heightAnchor");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "constraintGreaterThanOrEqualToConstant:", v17);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v336[4] = v220;
  -[CPUIProgressView heightAnchor](self->_progressView, "heightAnchor");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "constraintEqualToConstant:", 14.0);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v336[5] = v207;
  -[UIImageView centerXAnchor](self->_progressImageView, "centerXAnchor");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIProgressView centerXAnchor](self->_progressView, "centerXAnchor");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "constraintEqualToAnchor:", v193);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v336[6] = v187;
  -[UIImageView topAnchor](self->_progressImageView, "topAnchor");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  p_transportControlView = &self->_transportControlView;
  -[CPUITransportControlView bottomAnchor](self->_transportControlView, "bottomAnchor");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "constraintEqualToAnchor:", v177);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v336[7] = v174;
  -[UIImageView bottomAnchor](self->_progressImageView, "bottomAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIPlayModeControlView topAnchor](self->_playModeControlView, "topAnchor");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "constraintEqualToAnchor:", v169);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v336[8] = v167;
  -[CPUIPlayModeControlView heightAnchor](self->_playModeControlView, "heightAnchor");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "constraintEqualToConstant:", 26.0);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v336[9] = v164;
  -[UIFocusContainerGuide leadingAnchor](self->_bottomRegionFocusContainerGuide, "leadingAnchor");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIProgressView leadingAnchor](v325, "leadingAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "constraintEqualToAnchor:", v162);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v336[10] = v19;
  -[UIFocusContainerGuide trailingAnchor](self->_bottomRegionFocusContainerGuide, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIProgressView trailingAnchor](v325, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v336[11] = v22;
  -[UIFocusContainerGuide bottomAnchor](self->_bottomRegionFocusContainerGuide, "bottomAnchor");
  v322 = v4;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIProgressView bottomAnchor](v325, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v336[12] = v25;
  v323 = self;
  -[UIFocusContainerGuide heightAnchor](self->_bottomRegionFocusContainerGuide, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 26.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v336[13] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v336, 14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v324, "addObjectsFromArray:", v28);

  v29 = v322;
  if (objc_msgSend(v322, "showsArtwork") && objc_msgSend(v322, "verticalCenteringContent"))
  {
    p_isa = (id *)&v323->super.super.super.isa;
    -[CPUIPlayModeControlView bottomAnchor](v323->_playModeControlView, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIShadowImageView bottomAnchor](v323->_artworkViewBrick, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    p_isa = (id *)&v323->super.super.super.isa;
    -[CPUIPlayModeControlView bottomAnchor](v323->_playModeControlView, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView bottomAnchor](v325, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, -v10);
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v33;
  v35 = v324;
  objc_msgSend(v324, "addObject:", v33);

  if (objc_msgSend(v322, "showsArtwork"))
  {
    objc_msgSend(p_isa[58], "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v322, "albumArtWidthMultiplier");
    objc_msgSend(v36, "constraintEqualToAnchor:multiplier:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v335[0] = v38;
    objc_msgSend(p_isa[58], "heightAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[58], "widthAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v335[1] = v41;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v335, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v324, "addObjectsFromArray:", v42);

    p_isa = (id *)&v323->super.super.super.isa;
    v43 = objc_msgSend(v322, "verticalCenteringContent");
    artworkViewBrick = v323->_artworkViewBrick;
    if (v43)
    {
      -[CPUIShadowImageView centerYAnchor](artworkViewBrick, "centerYAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView centerYAnchor](v325, "centerYAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -8.0;
      v48 = v45;
      v49 = v46;
    }
    else
    {
      -[CPUIShadowImageView topAnchor](artworkViewBrick, "topAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView topAnchor](v325, "topAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v45;
      v49 = v46;
      v47 = v6;
    }
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, v47);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v324, "addObject:", v50);

  }
  v51 = objc_msgSend(v322, "artworkPosition");
  if (v51 < 2)
  {
    -[CPUITransportControlView trailingAnchor](*p_transportControlView, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    progressView = v325;
    -[CPUIProgressView trailingAnchor](v325, "trailingAnchor");
    v73 = -v12;
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    v310 = v71;
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v73);
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    v334[0] = v298;
    -[CPUITransportControlView leadingAnchor](*p_transportControlView, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView leadingAnchor](v325, "leadingAnchor");
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    v292 = v74;
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v8);
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    v334[1] = v278;
    objc_msgSend(p_isa[56], "rightAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITransportControlView fastForwardButton](*p_transportControlView, "fastForwardButton");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v264, "rightAnchor");
    v271 = v75;
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    v334[2] = v250;
    objc_msgSend(p_isa[56], "leftAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITransportControlView leftButton](*p_transportControlView, "leftButton");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v236, "leftAnchor");
    v243 = v76;
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    v334[3] = v222;
    objc_msgSend(p_isa[57], "trailingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITransportControlView trailingAnchor](*p_transportControlView, "trailingAnchor");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    v215 = v77;
    objc_msgSend(v77, "constraintEqualToAnchor:");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v334[4] = v202;
    objc_msgSend(p_isa[57], "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView leadingAnchor](v325, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = v78;
    objc_msgSend(v78, "constraintEqualToAnchor:constant:", v79, v8);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v334[5] = v80;
    objc_msgSend(p_isa[55], "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView leadingAnchor](v325, "leadingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:constant:", v82, v8);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v334[6] = v83;
    objc_msgSend(p_isa[55], "trailingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v322, "playModeControlButtonsFullWidth") & 1) == 0)
      progressView = v323->_progressView;
    -[CPUIProgressView trailingAnchor](progressView, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v322;
    v86 = objc_msgSend(v322, "playModeControlButtonsFullWidth");
    v87 = 0.0;
    if (v86)
      v87 = v73;
    objc_msgSend(v84, "constraintEqualToAnchor:constant:", v85, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v334[7] = v88;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v334, 8);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v324, "addObjectsFromArray:", v89);

    p_isa = (id *)&v323->super.super.super.isa;
    if (objc_msgSend(v322, "showsArtwork"))
    {
      -[CPUIShadowImageView centerXAnchor](v323->_artworkViewBrick, "centerXAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView centerXAnchor](v325, "centerXAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintEqualToAnchor:", v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v333 = v92;
      v52 = 0x24BDBC000uLL;
      v93 = (void *)MEMORY[0x24BDBCE30];
      v94 = &v333;
    }
    else
    {
      -[CPUISongDetailsView topAnchor](v323->_songDetailsView, "topAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView topAnchor](v325, "topAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintEqualToAnchor:constant:", v91, v6);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v332 = v92;
      v52 = 0x24BDBC000uLL;
      v93 = (void *)MEMORY[0x24BDBCE30];
      v94 = &v332;
    }
    objc_msgSend(v93, "arrayWithObjects:count:", v94, 1);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v324;
    objc_msgSend(v324, "addObjectsFromArray:", v106);
  }
  else
  {
    if (v51 == 2)
    {
      objc_msgSend(p_isa[58], "rightAnchor");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView rightAnchor](v325, "rightAnchor");
      v96 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "constraintEqualToAnchor:constant:", v96, -v12);
      v97 = objc_claimAutoreleasedReturnValue();
      v331[0] = v97;
      objc_msgSend(p_isa[57], "rightAnchor");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[58], "leftAnchor");
      v99 = objc_claimAutoreleasedReturnValue();
      v291 = v98;
      objc_msgSend(v98, "constraintEqualToAnchor:constant:", v99, -v12);
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      v331[1] = v279;
      objc_msgSend(p_isa[57], "leftAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView leftAnchor](v325, "leftAnchor");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      v272 = v100;
      objc_msgSend(v100, "constraintEqualToAnchor:constant:", v8);
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      v331[2] = v258;
      -[CPUITransportControlView rightAnchor](*p_transportControlView, "rightAnchor");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[58], "leftAnchor");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      v251 = v101;
      objc_msgSend(v101, "constraintEqualToAnchor:constant:", -v12);
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      v331[3] = v237;
      -[CPUITransportControlView leftAnchor](*p_transportControlView, "leftAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView leftAnchor](v325, "leftAnchor");
      v103 = objc_claimAutoreleasedReturnValue();
      v230 = v102;
      objc_msgSend(v102, "constraintEqualToAnchor:constant:", v103, v8);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v331[4] = v216;
      objc_msgSend(p_isa[56], "rightAnchor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v203 = objc_msgSend(v322, "progressViewFullWidth");
      v303 = v96;
      v309 = v95;
      v297 = v97;
      v286 = (void *)v99;
      v223 = (void *)v103;
      if (v203)
      {
        objc_msgSend(p_isa[58], "rightAnchor");
        v105 = objc_claimAutoreleasedReturnValue();
        v184 = (void *)v105;
      }
      else
      {
        -[CPUITransportControlView fastForwardButton](*p_transportControlView, "fastForwardButton");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "rightAnchor");
        v105 = objc_claimAutoreleasedReturnValue();
      }
      v209 = v104;
      v179 = (void *)v105;
      objc_msgSend(v104, "constraintEqualToAnchor:", v105);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      v331[5] = v196;
      objc_msgSend(p_isa[56], "leftAnchor");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUITransportControlView leftButton](*p_transportControlView, "leftButton");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "leftAnchor");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v189 = v107;
      objc_msgSend(v107, "constraintEqualToAnchor:", v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v331[6] = v110;
      objc_msgSend(p_isa[55], "leadingAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = v325;
      -[CPUIProgressView leadingAnchor](v325, "leadingAnchor");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "constraintEqualToAnchor:constant:", v113, v8);
      v114 = objc_claimAutoreleasedReturnValue();
      v115 = p_isa;
      v116 = (void *)v114;
      v331[7] = v114;
      objc_msgSend(v115[55], "trailingAnchor");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v322, "playModeControlButtonsFullWidth") & 1) == 0)
        v112 = v323->_progressView;
      -[CPUIProgressView trailingAnchor](v112, "trailingAnchor");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v322, "playModeControlButtonsFullWidth");
      v120 = 0.0;
      if (v119)
        v120 = -v12;
      objc_msgSend(v117, "constraintEqualToAnchor:constant:", v118, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v331[8] = v121;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v331, 9);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v324, "addObjectsFromArray:", v122);

      if ((v203 & 1) == 0)
      p_isa = (id *)&v323->super.super.super.isa;
      v35 = v324;
      v29 = v322;
      v52 = 0x24BDBC000uLL;
    }
    else
    {
      v52 = 0x24BDBC000;
      if (v51 != 3)
        goto LABEL_45;
      objc_msgSend(p_isa[58], "leftAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (CPUITransportControlView *)v325;
      -[CPUIProgressView leftAnchor](v325, "leftAnchor");
      v303 = objc_claimAutoreleasedReturnValue();
      v309 = v53;
      objc_msgSend(v53, "constraintEqualToAnchor:constant:", v8);
      v297 = objc_claimAutoreleasedReturnValue();
      v330[0] = v297;
      objc_msgSend(p_isa[57], "leftAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[58], "rightAnchor");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      v291 = v55;
      objc_msgSend(v55, "constraintEqualToAnchor:constant:", v8);
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      v330[1] = v277;
      objc_msgSend(p_isa[57], "rightAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView rightAnchor](v325, "rightAnchor");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      v270 = v56;
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", -v12);
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      v330[2] = v256;
      -[CPUITransportControlView leftAnchor](*p_transportControlView, "leftAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[58], "rightAnchor");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      v249 = v57;
      objc_msgSend(v57, "constraintEqualToAnchor:constant:", v8);
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      v330[3] = v235;
      -[CPUITransportControlView rightAnchor](*p_transportControlView, "rightAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView rightAnchor](v325, "rightAnchor");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      v228 = v58;
      objc_msgSend(v58, "constraintEqualToAnchor:constant:", -v12);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      v330[4] = v214;
      objc_msgSend(p_isa[56], "rightAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUITransportControlView rightAnchor](*p_transportControlView, "rightAnchor");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "constraintEqualToAnchor:");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      v330[5] = v194;
      objc_msgSend(p_isa[56], "leftAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v322, "progressViewFullWidth"))
        v61 = p_isa + 58;
      else
        v61 = (id *)p_transportControlView;
      objc_msgSend(*v61, "leftAnchor");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      v188 = v60;
      objc_msgSend(v60, "constraintEqualToAnchor:");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v330[6] = v178;
      objc_msgSend(p_isa[55], "leadingAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v322, "playModeControlButtonsFullWidth") & 1) == 0)
        v54 = *p_transportControlView;
      -[CPUITransportControlView leadingAnchor](v54, "leadingAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v322, "playModeControlButtonsFullWidth");
      v65 = 0.0;
      if (v64)
        v65 = v8;
      objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v330[7] = v66;
      p_isa = (id *)&v323->super.super.super.isa;
      -[CPUIPlayModeControlView trailingAnchor](v323->_playModeControlView, "trailingAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView trailingAnchor](v325, "trailingAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68, -v12);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v330[8] = v69;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v330, 9);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v324;
      objc_msgSend(v324, "addObjectsFromArray:", v70);

      v29 = v322;
      v52 = 0x24BDBC000uLL;

    }
    v91 = (void *)v303;
    v90 = v309;
    v106 = v291;
    v92 = (void *)v297;
  }

LABEL_45:
  v123 = objc_msgSend(v29, "artworkPosition");
  if (v123 - 2 < 2)
  {
    if (objc_msgSend(v29, "playModeControlButtonsFullWidth"))
    {
      objc_msgSend(p_isa, "_equalHeightVerticalSpacers:minimumPadding:maximumPadding:", 2, 6.0, 12.0);
      v135 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "_equalHeightVerticalSpacers:minimumPadding:maximumPadding:", 2, 6.0, 0.0);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v225 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v135, "objectAtIndexedSubscript:", 0);
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v312, "topAnchor");
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[57], "bottomAnchor");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v306, "constraintEqualToAnchor:", v300);
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      v328[0] = v294;
      objc_msgSend(v135, "objectAtIndexedSubscript:", 0);
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v288, "bottomAnchor");
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUITransportControlView topAnchor](*p_transportControlView, "topAnchor");
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v281, "constraintEqualToAnchor:", v274);
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      v328[1] = v267;
      objc_msgSend(v135, "objectAtIndexedSubscript:", 1);
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v260, "topAnchor");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[56], "bottomAnchor");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v253, "constraintEqualToAnchor:", v246);
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      v328[2] = v239;
      objc_msgSend(v135, "objectAtIndexedSubscript:", 1);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "bottomAnchor");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[55], "topAnchor");
      v321 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v218, "constraintEqualToAnchor:", v321);
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      v328[3] = v211;
      objc_msgSend(v136, "objectAtIndexedSubscript:", 0);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "topAnchor");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView topAnchor](v325, "topAnchor");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "constraintEqualToAnchor:", v186);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      v328[4] = v181;
      objc_msgSend(v136, "objectAtIndexedSubscript:", 0);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "bottomAnchor");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[57], "topAnchor");
      v319 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "constraintEqualToAnchor:", v319);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v328[5] = v170;
      v205 = v136;
      objc_msgSend(v136, "objectAtIndexedSubscript:", 1);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "topAnchor");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUITransportControlView bottomAnchor](*p_transportControlView, "bottomAnchor");
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "constraintEqualToAnchor:", v316);
      v137 = v52;
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v328[6] = v138;
      objc_msgSend(v136, "objectAtIndexedSubscript:", 1);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "bottomAnchor");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[58], "bottomAnchor");
      v141 = p_isa;
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "constraintEqualToAnchor:", v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v328[7] = v143;
      objc_msgSend(v141[56], "topAnchor");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141[58], "bottomAnchor");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "constraintGreaterThanOrEqualToAnchor:constant:", v145, 6.0);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v328[8] = v146;
      objc_msgSend(*(id *)(v137 + 3632), "arrayWithObjects:count:", v328, 9);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v225, "activateConstraints:", v147);

      objc_msgSend(v135, "arrayByAddingObjectsFromArray:", v205);
      v148 = objc_claimAutoreleasedReturnValue();
      verticalSpacerLayoutGuides = v323->_verticalSpacerLayoutGuides;
      v323->_verticalSpacerLayoutGuides = (NSArray *)v148;

    }
    else
    {
      objc_msgSend(p_isa, "_equalHeightVerticalSpacers:minimumPadding:maximumPadding:", 3, 6.0, 0.0);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v247 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(p_isa[57], "topAnchor");
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[58], "topAnchor");
      v307 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v313, "constraintEqualToAnchor:", v307);
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      v327[0] = v301;
      objc_msgSend(v150, "objectAtIndexedSubscript:", 0);
      v295 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v295, "topAnchor");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[57], "bottomAnchor");
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v289, "constraintEqualToAnchor:", v320);
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      v327[1] = v282;
      objc_msgSend(v150, "objectAtIndexedSubscript:", 0);
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v275, "bottomAnchor");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUITransportControlView topAnchor](*p_transportControlView, "topAnchor");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v268, "constraintEqualToAnchor:", v261);
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      v327[2] = v254;
      objc_msgSend(v150, "objectAtIndexedSubscript:", 1);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "topAnchor");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUITransportControlView bottomAnchor](*p_transportControlView, "bottomAnchor");
      v317 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "constraintEqualToAnchor:", v317);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      v327[3] = v219;
      objc_msgSend(v150, "objectAtIndexedSubscript:", 1);
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "bottomAnchor");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[56], "topAnchor");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "constraintEqualToAnchor:", v199);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v327[4] = v192;
      v226 = v150;
      objc_msgSend(v150, "objectAtIndexedSubscript:", 2);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "topAnchor");
      v152 = p_isa;
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152[56], "bottomAnchor");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "constraintEqualToAnchor:", v154);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v327[5] = v155;
      objc_msgSend(v150, "objectAtIndexedSubscript:", 2);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "bottomAnchor");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152[55], "topAnchor");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "constraintEqualToAnchor:", v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v327[6] = v159;
      objc_msgSend(*(id *)(v52 + 3632), "arrayWithObjects:count:", v327, 7);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "activateConstraints:", v160);

      v135 = v152[64];
      v152[64] = v226;
    }
    goto LABEL_51;
  }
  if (v123 <= 1)
  {
    objc_msgSend(p_isa, "_equalHeightVerticalSpacers:minimumPadding:maximumPadding:", 4, 6.0, 0.0);
    v124 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v231 = (void *)MEMORY[0x24BDD1628];
    -[NSArray objectAtIndexedSubscript:](v124, "objectAtIndexedSubscript:", 0);
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v311, "topAnchor");
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[58], "bottomAnchor");
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v305, "constraintEqualToAnchor:", v299);
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    v329[0] = v293;
    -[NSArray objectAtIndexedSubscript:](v124, "objectAtIndexedSubscript:", 0);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v287, "bottomAnchor");
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[57], "topAnchor");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v280, "constraintEqualToAnchor:", v273);
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    v329[1] = v266;
    -[NSArray objectAtIndexedSubscript:](v124, "objectAtIndexedSubscript:", 1);
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v259, "topAnchor");
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[57], "bottomAnchor");
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v252, "constraintEqualToAnchor:", v318);
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    v329[2] = v245;
    -[NSArray objectAtIndexedSubscript:](v124, "objectAtIndexedSubscript:", 1);
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v238, "bottomAnchor");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITransportControlView topAnchor](*p_transportControlView, "topAnchor");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "constraintEqualToAnchor:", v217);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v329[3] = v210;
    -[NSArray objectAtIndexedSubscript:](v124, "objectAtIndexedSubscript:", 2);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "topAnchor");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITransportControlView bottomAnchor](*p_transportControlView, "bottomAnchor");
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "constraintEqualToAnchor:", v315);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v329[4] = v190;
    -[NSArray objectAtIndexedSubscript:](v124, "objectAtIndexedSubscript:", 2);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "bottomAnchor");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[56], "topAnchor");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "constraintEqualToAnchor:", v175);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v329[5] = v172;
    -[NSArray objectAtIndexedSubscript:](v124, "objectAtIndexedSubscript:", 3);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "topAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[56], "bottomAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "constraintEqualToAnchor:", v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v329[6] = v128;
    -[NSArray objectAtIndexedSubscript:](v124, "objectAtIndexedSubscript:", 3);
    v129 = p_isa;
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "bottomAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129[55], "topAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "constraintEqualToAnchor:", v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v329[7] = v133;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v329, 8);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "activateConstraints:", v134);

    v135 = v323->_verticalSpacerLayoutGuides;
    v323->_verticalSpacerLayoutGuides = v124;
LABEL_51:

    v35 = v324;
    v29 = v322;
  }

  return v35;
}

uint64_t __54__CPUINowPlayingView__constraintsForNowPlayingLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeLayoutGuide:", a2);
}

- (void)setBadgeAnnotationView:(id)a3
{
  id v5;
  UIView *badgeAnnotationView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  badgeAnnotationView = self->_badgeAnnotationView;
  if (badgeAnnotationView)
    -[UIView removeFromSuperview](badgeAnnotationView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_badgeAnnotationView, a3);
  if (v5)
  {
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUINowPlayingView addSubview:](self, "addSubview:", v5);
    v7 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v5, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUISongDetailsView centerXAnchor](self->_songDetailsView, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(v5, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUISongDetailsView albumArtistLabelButton](self->_songDetailsView, "albumArtistLabelButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 3.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateConstraints:", v15);

  }
}

- (CPUINowPlayingLayoutProtocol)nowPlayingLayout
{
  return self->_nowPlayingLayout;
}

- (CPUITransportControlView)transportControlView
{
  return self->_transportControlView;
}

- (CPUIPlayModeControlView)playModeControlView
{
  return self->_playModeControlView;
}

- (CPUIProgressView)progressView
{
  return self->_progressView;
}

- (CPUISongDetailsView)songDetailsView
{
  return self->_songDetailsView;
}

- (CPUIShadowImageView)artworkViewBrick
{
  return self->_artworkViewBrick;
}

- (UIImageView)progressImageView
{
  return self->_progressImageView;
}

- (UIView)badgeAnnotationView
{
  return self->_badgeAnnotationView;
}

- (UIFocusContainerGuide)controlsFocusContainerGuide
{
  return self->_controlsFocusContainerGuide;
}

- (void)setControlsFocusContainerGuide:(id)a3
{
  objc_storeStrong((id *)&self->_controlsFocusContainerGuide, a3);
}

- (UIFocusContainerGuide)bottomRegionFocusContainerGuide
{
  return self->_bottomRegionFocusContainerGuide;
}

- (void)setBottomRegionFocusContainerGuide:(id)a3
{
  objc_storeStrong((id *)&self->_bottomRegionFocusContainerGuide, a3);
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (NSArray)verticalSpacerLayoutGuides
{
  return self->_verticalSpacerLayoutGuides;
}

- (void)setVerticalSpacerLayoutGuides:(id)a3
{
  objc_storeStrong((id *)&self->_verticalSpacerLayoutGuides, a3);
}

- (NSLayoutConstraint)songDetailsViewHeightConstraint
{
  return self->_songDetailsViewHeightConstraint;
}

- (void)setSongDetailsViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_songDetailsViewHeightConstraint, a3);
}

- (BOOL)buttonShapesVisible
{
  return self->_buttonShapesVisible;
}

- (void)setButtonShapesVisible:(BOOL)a3
{
  self->_buttonShapesVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songDetailsViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_verticalSpacerLayoutGuides, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_bottomRegionFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_controlsFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_badgeAnnotationView, 0);
  objc_storeStrong((id *)&self->_progressImageView, 0);
  objc_storeStrong((id *)&self->_artworkViewBrick, 0);
  objc_storeStrong((id *)&self->_songDetailsView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_playModeControlView, 0);
  objc_storeStrong((id *)&self->_transportControlView, 0);
  objc_storeStrong((id *)&self->_nowPlayingLayout, 0);
}

@end
