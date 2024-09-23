@implementation LPCaptionBarView

- (LPCaptionBarView)initWithHost:(id)a3
{

  return 0;
}

- (LPCaptionBarView)initWithHost:(id)a3 style:(id)a4 presentationProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPCaptionBarView *v11;
  LPCaptionBarView *v12;
  id *p_style;
  void *v14;
  void *v15;
  LPCaptionBarView *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)LPCaptionBarView;
  v11 = -[LPComponentView initWithHost:](&v18, sel_initWithHost_, v8);
  v12 = v11;
  if (v11)
  {
    p_style = (id *)&v11->_style;
    objc_storeStrong((id *)&v11->_style, a4);
    objc_storeStrong((id *)&v12->_presentationProperties, a5);
    objc_msgSend(*p_style, "backgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(*p_style, "backgroundColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _lp_setBackgroundColor:](v12, "_lp_setBackgroundColor:", v15);

    }
    v16 = v12;
  }

  return v12;
}

- (void)setUseProgressSpinner:(BOOL)a3
{
  self->_useProgressSpinner = a3;
  if (self->_hasEverBuilt)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Trying to update a caption bar after it has been laid out."));
}

- (void)setPlaybackInformation:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_inlinePlaybackInformation, a3);
  if (self->_hasEverBuilt)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Trying to update a caption bar after it has been laid out."));

}

- (void)animateOut
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  -[LPCaptionBarView layer](self, "layer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0CD2848], "_lp_springWithMass:stiffness:damping:", 1.0, 600.0, 400.0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1039918957;
  LODWORD(v6) = 1012202996;
  LODWORD(v7) = 1058256454;
  LODWORD(v8) = 1064682127;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimingFunction:", v9);

  objc_msgSend(v16, "setBeginTime:", v4);
  objc_msgSend(v16, "setFromValue:", &unk_1E44EEC30);
  v10 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v10, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setRemovedOnCompletion:", 0);
  objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v10, "setToValue:", &unk_1E44EEC48);
  -[LPCaptionBarView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:forKey:", v10, CFSTR("captionFadeOutSpring"));

  if (self->_useProgressSpinner)
  {
    v12 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v12, "setKeyPath:", CFSTR("transform.scale.xy"));
    objc_msgSend(v12, "setToValue:", &unk_1E44F0688);
    -[LPComponentView layer](self->_leftIconView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAnimation:forKey:", v12, CFSTR("spinnerShrinkOutSpring"));

    -[LPComponentView layer](self->_rightIconView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAnimation:forKey:", v12, CFSTR("spinnerShrinkOutSpring"));

  }
}

- (void)animateInWithBaseAnimation:(id)a3 currentTime:(double)a4
{
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

  v19 = a3;
  -[LPCaptionBarView _buildViewsForCaptionBarIfNeeded](self, "_buildViewsForCaptionBarIfNeeded");
  objc_msgSend(v19, "_lp_copyWithBeginTime:", a4 + 0.28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_lp_copyWithBeginTime:", a4 + 0.4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPTextStyleable layer](self->_aboveTopCaptionView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAnimation:forKey:", v6, CFSTR("fadeIn"));

  -[LPTextStyleable layer](self->_topCaptionView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v6, CFSTR("fadeIn"));

  -[LPTextStyleable layer](self->_bottomCaptionView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v7, CFSTR("fadeIn"));

  -[LPTextStyleable layer](self->_belowBottomCaptionView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:forKey:", v7, CFSTR("fadeIn"));

  -[LPComponentView layer](self->_leftIconView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAnimation:forKey:", v7, CFSTR("fadeIn"));

  -[LPComponentView layer](self->_rightIconView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAnimation:forKey:", v7, CFSTR("fadeIn"));

  -[LPComponentView layer](self->_leftIconBadgeView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v7, CFSTR("fadeIn"));

  -[LPComponentView layer](self->_rightIconBadgeView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAnimation:forKey:", v7, CFSTR("fadeIn"));

  -[LPPlayButtonView layer](self->_playButton, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v7, CFSTR("fadeIn"));

  -[LPCaptionBarButtonView layer](self->_buttonView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnimation:forKey:", v7, CFSTR("fadeIn"));

  -[LPCollaborationFooterView layer](self->_collaborationFooterView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAnimation:forKey:", v7, CFSTR("fadeIn"));

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[LPCaptionBarView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationForKey:", CFSTR("captionFadeOutSpring"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    -[LPCaptionBarView removeFromSuperview](self, "removeFromSuperview");

}

- (void)layoutComponentView
{
  double v3;
  double v4;

  -[LPCaptionBarView bounds](self, "bounds");
  -[LPCaptionBarView _layoutCaptionBarForSize:applyingLayout:](self, "_layoutCaptionBarForSize:applyingLayout:", 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[LPCaptionBarView _layoutCaptionBarForSize:applyingLayout:](self, "_layoutCaptionBarForSize:applyingLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutCaptionBarForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  double width;
  _BOOL8 v6;
  LPCaptionBarStyle *style;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double left;
  double right;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  _BOOL4 v47;
  LPCaptionBarStyle *v48;
  id v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  uint64_t v76;
  LPCaptionBarAccessoryView *leftAccessoryView;
  double v78;
  double v79;
  LPCaptionBarAccessoryView *rightAccessoryView;
  double v81;
  double v82;
  double v83;
  LPComponentView *leftIconView;
  double v85;
  void *v86;
  double v87;
  double v88;
  uint64_t v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  LPComponentView *v103;
  void *v104;
  double v105;
  double v106;
  int v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double MaxX;
  double v113;
  LPComponentView *rightIconView;
  void *v115;
  double v116;
  double v117;
  double v118;
  uint64_t v119;
  void *v120;
  void *v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  LPComponentView *v133;
  void *v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  void *v143;
  void *v144;
  double v145;
  double v146;
  double v147;
  LPCaptionBarAccessoryView *v148;
  double v149;
  double v150;
  LPCaptionBarAccessoryView *v151;
  double v152;
  double v153;
  LPCaptionBarButtonView *buttonView;
  double *v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  uint64_t v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  void *v193;
  double v194;
  void *v195;
  double v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  LPCollaborationFooterView *collaborationFooterView;
  double v202;
  double v203;
  double v204;
  double v205;
  void *v206;
  double v207;
  double v208;
  double v209;
  uint64_t v210;
  double v211;
  double v212;
  uint64_t v213;
  double v214;
  uint64_t v215;
  double v216;
  double v217;
  CGFloat v218;
  double v219;
  double v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  double MaxY;
  double v225;
  uint64_t v226;
  double v227;
  double v228;
  void *v229;
  char v230;
  double v231;
  double v232;
  double v233;
  double y;
  double v235;
  double v236;
  CGFloat v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  UIVisualEffectView *blurEffectView;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  double v251;
  void *v252;
  int v253;
  char v254;
  _BOOL4 v255;
  double v256;
  double MinY;
  void *v258;
  char v259;
  _BOOL4 v260;
  uint64_t v261;
  unsigned int v262;
  LPCaptionBarStyle *v264;
  void *v265;
  double v266;
  uint64_t v267;
  id v268;
  void *v269;
  id v270;
  void *v271;
  int v272;
  void *v273;
  double (**v274)(_QWORD, _QWORD, _QWORD);
  double v275;
  double v276;
  double v277;
  double v278;
  double v279;
  double v280;
  double v281;
  double v282;
  double v283;
  LPComponentView *v284;
  double v285;
  double v286;
  double v287;
  double v288;
  void *v289;
  void *v290;
  double v291;
  double v292;
  void *v293;
  void *v294;
  double v295;
  double v296;
  double v297;
  double v298;
  double v299;
  LPComponentView *v300;
  double v301;
  double v302;
  double v303;
  double v304;
  double v305;
  double v306;
  double v307;
  void *v308;
  double v309;
  double v310;
  void *v311;
  void *v312;
  double v313;
  double v314;
  double v315;
  double v316;
  double v317;
  void *v318;
  double v319;
  double v320;
  double v321;
  double v322;
  double v323;
  double v324;
  double v325;
  uint64_t v326;
  double v327;
  uint64_t v328;
  double v329;
  uint64_t v330;
  double v331;
  uint64_t v332;
  double v333;
  _BOOL4 v334;
  double v335;
  double v336;
  double v337;
  double v338;
  double v339;
  double v340;
  double v341;
  double v342;
  double v343;
  double v344;
  double v345;
  double v346;
  double v347;
  void *v348;
  double v349;
  double v350;
  double v351;
  double v352;
  void *v353;
  double v354;
  double v355;
  double v356;
  id v357;
  double v358;
  double v359;
  double v360;
  double v361;
  double v362;
  double v363;
  double v364;
  double v365;
  double v366;
  double v367;
  double v368;
  double v369;
  double v370;
  double v371;
  double v372;
  double v373;
  double v374;
  double rect;
  id v376;
  id v377;
  double v378;
  double v379;
  double v380;
  double v381;
  double v382;
  double v383;
  double v384;
  double height;
  CGFloat v386;
  double v387;
  CGFloat v388;
  double rect2;
  double rect2_8;
  double rect2_8a;
  double rect2_16;
  double rect2_24;
  double rect2_24a;
  double v395;
  double v396;
  double v397;
  double v398;
  void *v399;
  int v400;
  void *v401;
  _BOOL4 v402;
  double v403;
  double rect1;
  double rect1a;
  void *rect1b;
  double v407;
  double v408;
  double v409;
  id v410;
  id v411;
  double v412;
  double v413;
  _QWORD aBlock[5];
  _QWORD v415[17];
  BOOL v416;
  _QWORD v417[7];
  char v418;
  _QWORD v419[22];
  BOOL v420;
  _QWORD v421[12];
  BOOL v422;
  CGSize result;
  CGRect v424;
  CGRect v425;
  CGRect v426;
  CGRect v427;
  CGRect v428;
  CGRect v429;
  CGRect v430;
  CGRect v431;
  CGRect v432;
  CGRect v433;
  CGRect v434;
  CGRect v435;
  CGRect v436;
  CGRect v437;
  CGRect v438;
  CGRect v439;
  CGRect v440;
  CGRect v441;
  CGRect v442;
  CGRect v443;
  CGRect v444;
  CGRect v445;

  v402 = a4;
  height = a3.height;
  width = a3.width;
  -[LPCaptionBarView _buildViewsForCaptionBarIfNeeded](self, "_buildViewsForCaptionBarIfNeeded");
  v6 = -[UIView _lp_isLTR](self, "_lp_isLTR");
  style = self->_style;
  if (v6)
  {
    -[LPCaptionBarStyle leadingIcon](style, "leadingIcon");
    v411 = (id)objc_claimAutoreleasedReturnValue();

    -[LPCaptionBarStyle trailingIcon](self->_style, "trailingIcon");
    v410 = (id)objc_claimAutoreleasedReturnValue();

    -[LPCaptionBarPresentationProperties leadingIconProperties](self->_presentationProperties, "leadingIconProperties");
    v377 = (id)objc_claimAutoreleasedReturnValue();

    -[LPCaptionBarPresentationProperties trailingIconProperties](self->_presentationProperties, "trailingIconProperties");
  }
  else
  {
    -[LPCaptionBarStyle trailingIcon](style, "trailingIcon");
    v411 = (id)objc_claimAutoreleasedReturnValue();

    -[LPCaptionBarStyle leadingIcon](self->_style, "leadingIcon");
    v410 = (id)objc_claimAutoreleasedReturnValue();

    -[LPCaptionBarPresentationProperties trailingIconProperties](self->_presentationProperties, "trailingIconProperties");
    v377 = (id)objc_claimAutoreleasedReturnValue();

    -[LPCaptionBarPresentationProperties leadingIconProperties](self->_presentationProperties, "leadingIconProperties");
  }
  v376 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_leftIconView)
  {
    objc_msgSend(v411, "margin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asInsetsForLTR:", v6);
    v360 = v9;
    v412 = v10;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v360 = *MEMORY[0x1E0DC49E8];
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v412 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  if (self->_rightIconView)
  {
    objc_msgSend(v410, "margin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "asInsetsForLTR:", v6);
    v359 = v16;
    v382 = v17;
    v384 = v18;
    rect1 = v19;

  }
  else
  {
    v359 = *MEMORY[0x1E0DC49E8];
    v382 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v384 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    rect1 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  if (self->_playButton)
  {
    -[LPCaptionBarStyle playButtonPadding](self->_style, "playButtonPadding");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "asInsetsForLTR:", v6);
    v396 = v21;
    v23 = v22;
    v25 = v24;
    v27 = v26;

  }
  else
  {
    v23 = *MEMORY[0x1E0DC49E8];
    v396 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v25 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v27 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  if (self->_buttonView)
  {
    -[LPCaptionBarStyle button](self->_style, "button");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "margin");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "asInsetsForLTR:", v6);
    v351 = v30;
    rect2 = v31;
    v358 = v32;
    rect2_16 = v33;

  }
  else
  {
    v351 = *MEMORY[0x1E0DC49E8];
    rect2 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v358 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    rect2_16 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  v365 = v14;
  v346 = v25;
  v347 = v23;
  rect2_24 = v27;
  if (self->_collaborationFooterView)
  {
    -[LPCaptionBarStyle collaborationFooter](self->_style, "collaborationFooter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "margin");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "asInsetsForLTR:", v6);
    v356 = v36;
    v337 = v38;
    v338 = v37;
    v352 = v39;

  }
  else
  {
    v356 = *MEMORY[0x1E0DC49E8];
    v352 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v337 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v338 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  }
  left = self->_textSafeAreaInset.left;
  right = self->_textSafeAreaInset.right;
  -[LPCaptionBarPresentationProperties button](self->_presentationProperties, "button");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "requiresInlineButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    -[LPCaptionBarPresentationProperties button](self->_presentationProperties, "button");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "requiresInlineButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "BOOLValue");

    if ((v46 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
    v47 = -[LPCaptionBarStyle usesOutOfLineButton](self->_style, "usesOutOfLineButton");

    if (!v47)
    {
LABEL_21:
      v400 = 0;
      if (v6)
        rect2_16 = rect2_16 + self->_textSafeAreaInset.right;
      else
        rect2 = rect2 + self->_textSafeAreaInset.left;
      goto LABEL_32;
    }
  }
  if (!-[LPCaptionBarStyle buttonIgnoresTextSafeAreaInsets](self->_style, "buttonIgnoresTextSafeAreaInsets"))
  {
    if (v6)
      rect2_16 = rect2_16 + self->_textSafeAreaInset.right;
    else
      rect2 = rect2 + self->_textSafeAreaInset.left;
  }
  if (-[LPCaptionBarStyle addFullWidthLineForButton](self->_style, "addFullWidthLineForButton"))
  {
    rect2 = rect2 + self->_textSafeAreaInset.left;
    rect2_16 = rect2_16 + self->_textSafeAreaInset.right;
  }
  v400 = 1;
LABEL_32:
  if (self->_collaborationFooterView
    && -[LPCaptionBarStyle positionButtonRelativeToTextStack](self->_style, "positionButtonRelativeToTextStack"))
  {
    v358 = 0.0;
    v384 = 0.0;
    v365 = 0.0;
  }
  v48 = self->_style;
  if (v6)
  {
    -[LPCaptionBarStyle leadingAccessory](v48, "leadingAccessory");
    v49 = (id)objc_claimAutoreleasedReturnValue();

    -[LPCaptionBarStyle trailingAccessory](self->_style, "trailingAccessory");
  }
  else
  {
    -[LPCaptionBarStyle trailingAccessory](v48, "trailingAccessory");
    v49 = (id)objc_claimAutoreleasedReturnValue();

    -[LPCaptionBarStyle leadingAccessory](self->_style, "leadingAccessory");
  }
  v357 = (id)objc_claimAutoreleasedReturnValue();

  v348 = v49;
  if (self->_leftAccessoryView)
  {
    objc_msgSend(v49, "margin");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "asInsetsForLTR:", v6);
    v344 = v52;
    v345 = v51;
    rect2_8 = v53;
    v55 = v54;

  }
  else
  {
    v55 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v344 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v345 = *MEMORY[0x1E0DC49E8];
    rect2_8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  if (self->_rightAccessoryView)
  {
    objc_msgSend(v357, "margin");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "asInsetsForLTR:", v6);
    v342 = v58;
    v343 = v57;
    v387 = v59;
    v61 = v60;

  }
  else
  {
    v387 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v61 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v342 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v343 = *MEMORY[0x1E0DC49E8];
  }
  -[LPCaptionBarStyle textStack](self->_style, "textStack");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "captionTextPadding");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  -[LPCaptionBarPresentationProperties leadingIcon](self->_presentationProperties, "leadingIcon");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    v65 = (void *)objc_msgSend(v63, "copy");

    -[LPCaptionBarStyle trailingPaddingForPresenceOfLeadingIcon](self->_style, "trailingPaddingForPresenceOfLeadingIcon");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setTrailing:", v66);

    v63 = v65;
  }
  if (self->_playButton || (!self->_buttonView ? (v67 = 1) : (v67 = v400), (v67 & 1) == 0))
  {
    v68 = (void *)objc_msgSend(v63, "copy");

    +[LPPointUnit zero](LPPointUnit, "zero");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setTrailing:", v69);

  }
  else
  {
    v68 = v63;
  }
  v353 = v68;
  objc_msgSend(v68, "asInsetsForLTR:", v6);
  v71 = v70;
  v73 = v72;
  v339 = v75 + self->_textSafeAreaInset.bottom;
  v340 = v74 + self->_textSafeAreaInset.top;
  -[LPVerticalTextStackView setContentInset:](self->_textStackView, "setContentInset:");
  v355 = v73;
  v350 = v71;
  v76 = MEMORY[0x1E0C9D648];
  leftAccessoryView = self->_leftAccessoryView;
  v403 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v380 = v403;
  v381 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v374 = v381;
  v408 = *MEMORY[0x1E0C9D648];
  v362 = *MEMORY[0x1E0C9D648];
  if (leftAccessoryView)
  {
    -[LPCaptionBarAccessoryView size](leftAccessoryView, "size");
    v380 = v79;
    v381 = v78;
    v362 = v55;
  }
  rightAccessoryView = self->_rightAccessoryView;
  v370 = v403;
  v371 = v374;
  v367 = v408;
  if (rightAccessoryView)
  {
    -[LPCaptionBarAccessoryView size](rightAccessoryView, "size");
    v370 = v81;
    v371 = v82;
    v367 = width - v82 - v61;
  }
  v407 = *(double *)(v76 + 8);
  v83 = v12 + left;
  leftIconView = self->_leftIconView;
  if (leftIconView)
  {
    objc_msgSend(v411, "fixedSize");
    v85 = v374;
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "asSize");
    -[LPComponentView sizeThatFits:](leftIconView, "sizeThatFits:");
    v395 = v87;
    rect = v88;

    v89 = objc_msgSend(v377, "verticalAlignment");
    if (!v89)
      v89 = objc_msgSend(v411, "verticalAlignment");
    objc_msgSend(v411, "fixedSize");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      if (v89 == 3 && objc_msgSend(v411, "canAdjustVerticalPaddingForFixedSize"))
      {
        objc_msgSend(v411, "fixedSize");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "asSize");
        v93 = v92;
        v424.origin.x = v408;
        v424.origin.y = v407;
        v424.size.width = v395;
        v424.size.height = rect;
        v94 = fmax((v93 - CGRectGetHeight(v424)) * 0.5, 0.0);

        v360 = v360 + v94;
        v365 = v365 + v94;
      }
      if (objc_msgSend(v377, "canAdjustHorizontalPaddingForFixedSize"))
      {
        objc_msgSend(v411, "fixedSize");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "asSize");
        v97 = v96;
        v425.origin.x = v408;
        v425.origin.y = v407;
        v425.size.width = v395;
        v425.size.height = rect;
        v98 = fmax((v97 - CGRectGetWidth(v425)) * 0.5, 0.0);

        v83 = v83 + v98;
        v412 = v412 + v98;
      }
    }
    objc_msgSend(v411, "widthForUsingRegularSize");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (v99)
    {
      objc_msgSend(v411, "widthForUsingRegularSize");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "value");
      v102 = v101;

      if (width < v102)
      {
        v103 = self->_leftIconView;
        objc_msgSend(v411, "minimumSize");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "asSize");
        -[LPComponentView sizeThatFits:](v103, "sizeThatFits:");
        v395 = v105;
        rect = v106;

      }
    }
    if (objc_msgSend(v411, "scalesToFitParent"))
    {
      v107 = objc_msgSend(v411, "preservesEdgeAlignmentWhenScaling");
      v108 = fmin(width - v83 - v412, height - v360 - v365);
      if (v107)
      {
        -[LPComponentView sizeThatFits:](self->_leftIconView, "sizeThatFits:", v108, v108);
        v395 = v109;
        rect = v110;
      }
      else
      {
        rect = v108;
        v395 = v108;
      }
    }
    if (self->_leftAccessoryView)
    {
      v426.origin.x = v362;
      v426.origin.y = v407;
      v426.size.height = v380;
      v426.size.width = v381;
      MaxX = CGRectGetMaxX(v426);
    }
    else
    {
      MaxX = 0.0;
    }
    v368 = v83;
    v111 = v83 + MaxX;
  }
  else
  {
    v368 = v12 + left;
    rect = v403;
    v85 = v374;
    v395 = v374;
    v111 = v408;
  }
  v364 = v111;
  v113 = rect1 + right;
  rightIconView = self->_rightIconView;
  if (rightIconView)
  {
    objc_msgSend(v410, "fixedSize");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "asSize");
    -[LPComponentView sizeThatFits:](rightIconView, "sizeThatFits:");
    v398 = v116;
    v118 = v117;

    v119 = objc_msgSend(v376, "verticalAlignment");
    if (!v119)
      v119 = objc_msgSend(v410, "verticalAlignment");
    objc_msgSend(v410, "fixedSize");
    v120 = (void *)objc_claimAutoreleasedReturnValue();

    if (v120)
    {
      if (v119 == 3 && objc_msgSend(v410, "canAdjustVerticalPaddingForFixedSize"))
      {
        objc_msgSend(v410, "fixedSize");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "asSize");
        v123 = v122;
        v427.origin.x = v408;
        v427.origin.y = v407;
        v427.size.width = v398;
        v427.size.height = v118;
        v124 = fmax((v123 - CGRectGetHeight(v427)) * 0.5, 0.0);

        v359 = v359 + v124;
        v384 = v384 + v124;
      }
      if (objc_msgSend(v376, "canAdjustHorizontalPaddingForFixedSize"))
      {
        objc_msgSend(v410, "fixedSize");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "asSize");
        v127 = v126;
        v428.origin.x = v408;
        v428.origin.y = v407;
        v428.size.width = v398;
        v428.size.height = v118;
        v128 = fmax((v127 - CGRectGetWidth(v428)) * 0.5, 0.0);

        v382 = v382 + v128;
        v113 = v113 + v128;
      }
    }
    objc_msgSend(v410, "widthForUsingRegularSize");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    if (v129)
    {
      objc_msgSend(v410, "widthForUsingRegularSize");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "value");
      v132 = v131;

      if (width < v132)
      {
        v133 = self->_rightIconView;
        objc_msgSend(v410, "minimumSize");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "asSize");
        -[LPComponentView sizeThatFits:](v133, "sizeThatFits:");
        v398 = v135;
        v118 = v136;

      }
    }
    if (objc_msgSend(v410, "scalesToFitParent"))
    {
      v118 = fmin(width - v382 - v113, height - v359 - v384);
      if (objc_msgSend(v410, "preservesEdgeAlignmentWhenScaling"))
      {
        -[LPComponentView sizeThatFits:](self->_rightIconView, "sizeThatFits:", v118, v118);
        v398 = v137;
        v118 = v138;
      }
      else
      {
        v398 = v118;
      }
    }
    v141 = v367;
    if (!self->_rightAccessoryView)
      v141 = width;
    v363 = v141 - v398 - v113;
    v140 = v408;
    v139 = v403;
  }
  else
  {
    v139 = v403;
    v118 = v403;
    v398 = v85;
    v140 = v408;
    v363 = v408;
  }
  v142 = rect2_24 + right;
  v378 = v139;
  v373 = v85;
  v349 = v140;
  if (self->_playButton)
  {
    -[LPCaptionBarStyle playButton](self->_style, "playButton");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "size");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "asSize");
    v373 = v145;
    v378 = v146;

    if (v6)
      v147 = width - v373 - v142;
    else
      v147 = v396;
    v349 = v147;
  }
  v148 = self->_leftAccessoryView;
  if (v148)
  {
    -[LPCaptionBarAccessoryView size](v148, "size");
    v380 = v150;
    v381 = v149;
    v362 = v55;
  }
  v151 = self->_rightAccessoryView;
  if (v151)
  {
    -[LPCaptionBarAccessoryView size](v151, "size");
    v370 = v152;
    v371 = v153;
    v367 = width - v153 - v61;
  }
  buttonView = self->_buttonView;
  v155 = (double *)MEMORY[0x1E0C9D820];
  rect1a = v403;
  v386 = v408;
  if (buttonView)
  {
    -[LPCaptionBarButtonView sizeThatFits:](buttonView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    rect1a = v156;
    v85 = v157;
    v158 = width - v157 - rect2_16;
    if (!v6)
      v158 = rect2;
    v386 = v158;
  }
  rect2_24a = width;
  v159 = 0.0;
  if (self->_leftIconView)
    v160 = v412 + v368 + v395;
  else
    v160 = 0.0;
  v161 = v85;
  if (self->_rightIconView)
    v162 = v113 + v382 + v398;
  else
    v162 = 0.0;
  v163 = v142 + v396 + v373;
  if (!self->_playButton)
    v163 = 0.0;
  v372 = v161;
  if (self->_buttonView)
    v164 = rect2_16 + rect2 + v161;
  else
    v164 = 0.0;
  v165 = rect2_8 + v55 + v381;
  if (!self->_leftAccessoryView)
    v165 = 0.0;
  if (self->_rightAccessoryView)
    v159 = v61 + v387 + v371;
  v166 = v160 + v165;
  v167 = v162 + v159;
  v335 = v164;
  v168 = v163 + v164 + v166;
  v169 = v163 + v164 + v167;
  if (v6)
    v168 = v166;
  else
    v169 = v167;
  v170 = v163 + v166;
  v171 = v163 + v167;
  if (v6)
  {
    v172 = v166;
  }
  else
  {
    v171 = v167;
    v172 = v170;
  }
  if (v400)
    v173 = v171;
  else
    v173 = v169;
  if (v400)
    v174 = v172;
  else
    v174 = v168;
  if (v174 == 0.0)
    v174 = self->_textSafeAreaInset.left;
  if (v173 == 0.0)
    v173 = self->_textSafeAreaInset.right;
  rect2_8a = rect2_24a - (v174 + v173);
  -[LPVerticalTextStackView sizeThatFits:](self->_textStackView, "sizeThatFits:");
  v388 = v175;
  v176 = MEMORY[0x1E0C809B0];
  v421[0] = MEMORY[0x1E0C809B0];
  v421[1] = 3221225472;
  v354 = v173;
  v421[2] = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_2;
  v421[3] = &unk_1E44AA538;
  v421[4] = self;
  v422 = v402;
  *(double *)&v421[5] = rect2_24a;
  *(double *)&v421[6] = height;
  v397 = v173 + v174 + v177;
  *(double *)&v421[7] = v397;
  *(CGFloat *)&v421[8] = v386;
  *(double *)&v421[9] = v407;
  *(double *)&v421[10] = v372;
  *(double *)&v421[11] = rect1a;
  v178 = v355;
  v334 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_2((uint64_t)v421);
  if (v334)
  {
    -[LPCaptionBarButtonView collapsedSizeThatFits:](self->_buttonView, "collapsedSizeThatFits:", *v155, v155[1]);
    v181 = v180;
    v182 = rect2_24a - v180 - rect2_16;
    if (!v6)
      v182 = rect2;
    v386 = v182;
    v183 = v173;
    v372 = v181;
    if ((v400 & 1) == 0)
    {
      v184 = rect2_16 + rect2 + v181 - v335;
      v185 = v174 + v184;
      v186 = v173 + v184;
      if (v6)
        v183 = v186;
      else
        v174 = v185;
    }
    v174 = v174 - v160;
    v187 = v183 - v162;
    if (v174 == 0.0)
      v174 = self->_textSafeAreaInset.left;
    v188 = rect2_24a;
    if (v187 == 0.0)
      v187 = self->_textSafeAreaInset.right;
    rect1a = v179;
    rect2_8a = rect2_24a - (v174 + v187);
    -[LPVerticalTextStackView sizeThatFits:](self->_textStackView, "sizeThatFits:");
    v388 = v189;
    v190 = v187;
    v191 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v113 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v412 = v113;
    v382 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v384 = v191;
    v368 = v382;
    v359 = *MEMORY[0x1E0DC49E8];
    v360 = *MEMORY[0x1E0DC49E8];
    v118 = v403;
    v398 = v374;
    v354 = v190;
    v397 = v190 + v174 + v192;
    v363 = v408;
    v364 = v408;
    rect = v403;
    v395 = v374;
    v178 = v355;
  }
  else
  {
    v188 = rect2_24a;
    v191 = v365;
  }
  -[LPCaptionBarStyle collaborationFooter](self->_style, "collaborationFooter");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = v188;
  if (((objc_msgSend(v193, "useFullWidthDuringSizing") | v402) & 1) == 0)
  {
    -[LPCaptionBarStyle minimumWidth](self->_style, "minimumWidth");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "value");
    v194 = fmax(v196, v397);

  }
  -[LPCollaborationFooterView additionalPadding](self->_collaborationFooterView, "additionalPadding");
  v330 = v198;
  v332 = v197;
  v326 = v200;
  v328 = v199;
  v419[0] = v176;
  v419[1] = 3221225472;
  v419[2] = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_4;
  v419[3] = &unk_1E44AA560;
  v419[4] = self;
  v420 = v6;
  *(double *)&v419[5] = v340;
  *(double *)&v419[6] = v350;
  *(double *)&v419[7] = v339;
  *(double *)&v419[8] = v178;
  *(double *)&v419[9] = v360;
  *(double *)&v419[10] = v368;
  *(double *)&v419[11] = v191;
  *(double *)&v419[12] = v412;
  *(double *)&v419[13] = v359;
  *(double *)&v419[14] = v382;
  *(double *)&v419[15] = v384;
  *(double *)&v419[16] = v113;
  v383 = v174 + 0.0;
  *(double *)&v419[17] = v174 + 0.0;
  v419[18] = 0;
  *(double *)&v419[19] = rect2_8a;
  *(CGFloat *)&v419[20] = v388;
  *(double *)&v419[21] = v194;
  __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_4((uint64_t)v419);
  -[LPCollaborationFooterView setAdditionalPadding:](self->_collaborationFooterView, "setAdditionalPadding:");
  collaborationFooterView = self->_collaborationFooterView;
  v336 = v194;
  if (collaborationFooterView)
  {
    -[LPCollaborationFooterView sizeThatFits:](collaborationFooterView, "sizeThatFits:", v194, 1.79769313e308);
    v379 = v202;
    v204 = v203;
    v205 = v118;
  }
  else
  {
    v205 = v118;
    v204 = v155[1];
    v379 = *v155;
  }
  v206 = v353;
  v207 = v358 + v351 + rect1a;
  v341 = v204;
  v417[0] = MEMORY[0x1E0C809B0];
  v417[1] = 3221225472;
  v417[2] = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_5;
  v417[3] = &unk_1E44AA588;
  v418 = v400;
  v417[4] = self;
  *(double *)&v417[5] = v207;
  *(double *)&v417[6] = v352 + v356 + v204;
  v366 = v191;
  v208 = v191 + v360 + rect;
  v209 = v384 + v359 + v205;
  v415[0] = MEMORY[0x1E0C809B0];
  v415[1] = 3221225472;
  v415[2] = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_6;
  v415[3] = &__block_descriptor_137_e5_d8__0l;
  v416 = v402;
  *(double *)&v415[4] = v188;
  *(double *)&v415[5] = height;
  v369 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_5((uint64_t)v417);
  *(double *)&v415[6] = v369;
  *(double *)&v415[7] = v174 + 0.0;
  v415[8] = 0;
  *(double *)&v415[9] = rect2_8a;
  *(CGFloat *)&v415[10] = v388;
  *(double *)&v415[11] = v208;
  *(double *)&v415[12] = v209;
  *(double *)&v415[13] = v346 + v347 + v378;
  *(double *)&v415[14] = v207;
  *(double *)&v415[15] = v344 + v345 + v380;
  *(double *)&v415[16] = v342 + v343 + v370;
  v413 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_6((uint64_t)v415);
  v211 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(v413, v208, v364, v407, v395, rect, v210, v411, v377);
  v212 = v205;
  v361 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(v413, v209, v363, v407, v398, v205, v213, v410, v376);
  v214 = v413 * 0.5;
  if (v400)
  {
    if (-[LPCaptionBarStyle alignButtonWithCaptionTextLeadingEdge](self->_style, "alignButtonWithCaptionTextLeadingEdge"))
    {
      v215 = 0;
      v216 = v383;
      v217 = rect2_8a;
      v218 = v388;
      if (v6)
        v219 = v350 + CGRectGetMinX(*(CGRect *)&v216);
      else
        v219 = CGRectGetMaxX(*(CGRect *)&v216) - v372 - v355;
      v386 = v219;
    }
    v220 = v413 - rect1a - v358;
    if (-[LPCaptionBarStyle canAddLineForButton](self->_style, "canAddLineForButton", v326, v328, v330, v332)
      && !-[LPCaptionBarStyle addFullWidthLineForButton](self->_style, "addFullWidthLineForButton"))
    {
      if (-[LPCaptionBarStyle positionButtonRelativeToTextStack](self->_style, "positionButtonRelativeToTextStack"))
      {
        v429.origin.y = 0.0;
        v429.origin.x = v383;
        v429.size.width = rect2_8a;
        v429.size.height = v388;
        v220 = v351 + CGRectGetMaxY(v429);
        v430.origin.x = v386;
        v430.origin.y = v220;
        v430.size.width = v372;
        v430.size.height = rect1a;
        v413 = fmax(v413, v358 + CGRectGetMaxY(v430));
        v211 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(v413, v208, v364, v211, v395, rect, v221, v411, v377);
        v361 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(v413, v209, v363, v361, v398, v212, v222, v410, v376);
        v214 = v413 * 0.5;
      }
      else
      {
        v445.origin.y = 0.0;
        v431.origin.x = v386;
        v445.size.height = v388;
        v431.origin.y = v413 - rect1a - v358;
        v431.size.width = v372;
        v431.size.height = rect1a;
        v445.origin.x = v383;
        v445.size.width = rect2_8a;
        if (CGRectIntersectsRect(v431, v445))
        {
          if (-[LPCaptionBarStyle buttonRespectsTextStackPadding](self->_style, "buttonRespectsTextStackPadding"))
          {
            v432.origin.y = 0.0;
            v432.origin.x = v383;
            v432.size.width = rect2_8a;
            v432.size.height = v388;
            v207 = CGRectGetMaxY(v432) - v220;
          }
          else
          {
            v433.origin.y = 0.0;
            v433.origin.x = v383;
            v433.size.width = rect2_8a;
            v433.size.height = v388;
            MaxY = CGRectGetMaxY(v433);
            if (MaxY < fmax(v208, v209))
            {
              v434.origin.x = v364;
              v434.origin.y = v211;
              v434.size.width = v395;
              v434.size.height = rect;
              v225 = CGRectGetMaxY(v434);
              v435.origin.x = v363;
              v435.origin.y = v361;
              v435.size.width = v398;
              v435.size.height = v212;
              v207 = v207 + fmax(MaxY - fmax(v225, CGRectGetMaxY(v435)), 0.0) - fmax(v366, v384);
            }
          }
          v413 = v413 + v207;
          v211 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(v413, v208, v364, v211, v395, rect, v223, v411, v377);
          v361 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(v413, v209, v363, v361, v398, v212, v226, v410, v376);
          v214 = v413 * 0.5;
          v220 = v413 - rect1a - v358;
        }
      }
    }
    if (v6)
    {
      v436.origin.x = v386;
      v436.origin.y = v220;
      v436.size.width = v372;
      v436.size.height = rect1a;
      v227 = CGRectGetMaxX(v436);
      v228 = rect2_16;
    }
    else
    {
      v227 = v354;
      v228 = v335;
    }
    v397 = fmax(v397, v228 + v227);
  }
  else
  {
    v220 = v214 + rect1a * -0.5;
  }
  if (!self->_collaborationFooterView)
  {
    v233 = v220;
    goto LABEL_185;
  }
  -[LPCaptionBarStyle collaborationFooter](self->_style, "collaborationFooter");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v230 = objc_msgSend(v229, "useFullWidth");
  v231 = v337 + v338 + v379;

  v232 = fmax(v397, v231);
  if ((v230 & 1) != 0)
  {
    v233 = v220;
    v397 = v232;
LABEL_185:
    y = v407;
    goto LABEL_192;
  }
  v235 = fmax(v397, v354 + v231);
  if (!v6)
    v232 = v235;
  v397 = v232;
  v236 = v372;
  if (self->_buttonView)
  {
    v237 = v386;
    v238 = v220;
    v239 = rect1a;
    v240 = CGRectGetMaxY(*(CGRect *)(&v236 - 2));
  }
  else
  {
    v437.origin.y = 0.0;
    v437.origin.x = v383;
    v437.size.width = rect2_8a;
    v437.size.height = v388;
    v241 = CGRectGetMaxY(v437);
    v438.origin.x = v364;
    v438.origin.y = v211;
    v438.size.width = v395;
    v438.size.height = rect;
    v242 = CGRectGetMaxY(v438);
    v439.origin.x = v363;
    v439.origin.y = v361;
    v439.size.width = v398;
    v439.size.height = v212;
    v240 = fmax(fmax(v241, v242), CGRectGetMaxY(v439));
  }
  v440.origin.y = v356 + v240;
  v440.origin.x = v408;
  y = v440.origin.y;
  v440.size.width = v379;
  v440.size.height = v341;
  v233 = v220;
  v413 = fmax(v413, v352 + CGRectGetMaxY(v440));
LABEL_192:
  v243 = round((v373 - v413) * 0.5);
  v244 = round((v378 - v413) * 0.5);
  -[LPPlayButtonView setContentInset:](self->_playButton, "setContentInset:", -v243, -v244, -v244, -v243, v326, v328, v330, v332);
  if (v402)
  {
    -[LPComponentView setFrame:](self->_leftIconView, "setFrame:", v364, v211, v395, rect);
    -[LPComponentView setFrame:](self->_rightIconView, "setFrame:", v363, v361, v398, v212);
    -[LPPlayButtonView setFrame:](self->_playButton, "setFrame:", v349 + v243, round(v214 - v378 * 0.5) + v244, v413, v413);
    -[LPCaptionBarAccessoryView setFrame:](self->_leftAccessoryView, "setFrame:", v362, v214 - v380 * 0.5, v381);
    -[LPCaptionBarAccessoryView setFrame:](self->_rightAccessoryView, "setFrame:", v367, v214 - v370 * 0.5, v371);
    blurEffectView = self->_blurEffectView;
    if (blurEffectView)
      -[UIVisualEffectView setFrame:](blurEffectView, "setFrame:", 0.0, 0.0, rect2_24a, height);
    -[LPCaptionBarButtonView setCollapsed:](self->_buttonView, "setCollapsed:", v334);
    if (v400)
    {
      v246 = v374;
      v247 = v388;
      v248 = rect1a;
      v249 = v372;
      if (-[LPCaptionBarStyle addFullWidthLineForButton](self->_style, "addFullWidthLineForButton"))
      {
        v441.origin.x = v386;
        v441.origin.y = v233;
        v441.size.width = v372;
        v441.size.height = rect1a;
        v248 = CGRectGetHeight(v441);
        v442.origin.x = rect2;
        v249 = rect2_24a - (rect2_16 + rect2);
        v233 = v351 + v413;
        v442.origin.y = v351 + v413;
        v442.size.width = v249;
        v442.size.height = v248;
        v250 = v351 + v413 + CGRectGetHeight(v442);
        v251 = rect2;
      }
      else if (-[LPCaptionBarStyle expandButtonToCaptionEdge](self->_style, "expandButtonToCaptionEdge"))
      {
        if (v6)
        {
          v325 = rect2_24a - rect2_16;
          v251 = v386;
        }
        else
        {
          v444.origin.x = v386;
          v444.origin.y = v233;
          v444.size.width = v372;
          v444.size.height = rect1a;
          v325 = CGRectGetMaxX(v444);
          v251 = rect2;
        }
        v249 = v325 - v251;
        v250 = v413;
      }
      else
      {
        v250 = v413;
        v251 = v386;
      }
    }
    else
    {
      v250 = v413;
      v251 = v386;
      v247 = v388;
      v246 = v374;
      v248 = rect1a;
      v249 = v372;
    }
    -[LPCaptionBarButtonView setFrame:](self->_buttonView, "setFrame:", v251, v233, v249, v248);
    if (self->_collaborationFooterView)
    {
      -[LPCaptionBarStyle collaborationFooter](self->_style, "collaborationFooter");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      v253 = objc_msgSend(v252, "useFullWidth");

      if (v253)
        y = v356 + v250;
      -[LPCollaborationFooterView setFrame:](self->_collaborationFooterView, "setFrame:", v408, y, v336, v341);
    }
    else
    {
      v336 = v379;
    }
    v254 = v400 ^ 1;
    if (!self->_buttonView)
      v254 = 1;
    if ((v254 & 1) != 0
      || (v255 = -[LPCaptionBarStyle addFullWidthLineForButton](self->_style, "addFullWidthLineForButton"),
          v256 = 0.0,
          v255))
    {
      MinY = v413;
      if (self->_collaborationFooterView)
      {
        -[LPCaptionBarStyle collaborationFooter](self->_style, "collaborationFooter");
        v258 = (void *)objc_claimAutoreleasedReturnValue();
        v259 = objc_msgSend(v258, "useFullWidth");

        MinY = v413;
        if ((v259 & 1) == 0)
        {
          v443.origin.x = v408;
          v443.origin.y = y;
          v443.size.width = v336;
          v443.size.height = v341;
          MinY = CGRectGetMinY(v443);
        }
      }
      v260 = MinY > v247;
      if (-[LPCaptionBarStyle minimumNumberOfLinesToVerticallyCenter](self->_style, "minimumNumberOfLinesToVerticallyCenter"))
      {
        -[LPVerticalTextStackView setFrame:](self->_textStackView, "setFrame:", v383, 0.0, rect2_8a, v247);
        -[UIView _lp_layoutIfNeeded](self->_textStackView, "_lp_layoutIfNeeded");
        v261 = -[LPVerticalTextStackView computedNumberOfLines](self->_textStackView, "computedNumberOfLines");
        v262 = -[LPCaptionBarStyle minimumNumberOfLinesToVerticallyCenter](self->_style, "minimumNumberOfLinesToVerticallyCenter");
        v260 = MinY > v247 && v261 >= v262;
      }
      v256 = 0.0;
      if (v260)
        v256 = (MinY - v247) * 0.5;
    }
    -[LPVerticalTextStackView setFrame:](self->_textStackView, "setFrame:", v383, v256, rect2_8a, v247);
    v264 = self->_style;
    if (v6)
    {
      -[LPCaptionBarStyle leadingIconBadge](v264, "leadingIconBadge");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      v266 = v403;
      v267 = MEMORY[0x1E0C809B0];
      v268 = v265;

      -[LPCaptionBarStyle trailingIconBadge](self->_style, "trailingIconBadge");
    }
    else
    {
      -[LPCaptionBarStyle trailingIconBadge](v264, "trailingIconBadge");
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      v266 = v403;
      v267 = MEMORY[0x1E0C809B0];
      v268 = v269;

      -[LPCaptionBarStyle leadingIconBadge](self->_style, "leadingIconBadge");
    }
    v270 = (id)objc_claimAutoreleasedReturnValue();

    -[LPComponentView host](self, "host");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    v272 = objc_msgSend(v271, "allowsBadgingIconEdgeForComponentView:", self);

    if (v272)
    {
      aBlock[0] = v267;
      aBlock[1] = 3221225472;
      aBlock[2] = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_8;
      aBlock[3] = &unk_1E44AA5D0;
      aBlock[4] = self;
      v273 = _Block_copy(aBlock);
      v274 = (double (**)(_QWORD, _QWORD, _QWORD))v273;
      v275 = v246;
      v276 = v407;
      v277 = v408;
      if (self->_leftIconBadgeView)
      {
        v277 = (*((double (**)(void *, LPComponentView *, id))v273 + 2))(v273, self->_leftIconView, v268);
        v276 = v278;
        v275 = v279;
        v266 = v280;
      }
      if (self->_rightIconBadgeView)
      {
        v408 = ((double (**)(_QWORD, LPComponentView *, id))v274)[2](v274, self->_rightIconView, v270);
        v407 = v281;
        v403 = v282;
        v246 = v283;
      }

    }
    else
    {
      v275 = v246;
      v276 = v407;
      v277 = v408;
      if (self->_leftIconBadgeView)
      {
        v284 = self->_leftIconView;
        objc_msgSend(v268, "offset");
        v286 = v285;
        objc_msgSend(v268, "offset");
        v288 = v287;
        objc_msgSend(v268, "fixedSize");
        v289 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v289, "width");
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v290, "value");
        v292 = v291;
        objc_msgSend(v268, "fixedSize");
        v293 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v293, "height");
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v294, "value");
        -[LPComponentView convertRect:toView:](v284, "convertRect:toView:", self, v286, v288, v292, v295);
        v277 = v296;
        v276 = v297;
        v275 = v298;
        v266 = v299;

      }
      if (self->_rightIconBadgeView)
      {
        v300 = self->_rightIconView;
        -[LPComponentView bounds](v300, "bounds");
        v302 = v301;
        objc_msgSend(v270, "fixedSize");
        rect1b = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(rect1b, "width");
        v401 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v401, "value");
        v409 = v303;
        objc_msgSend(v270, "offset");
        v305 = v304;
        objc_msgSend(v270, "offset");
        v307 = v306;
        objc_msgSend(v270, "fixedSize");
        v399 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v399, "width");
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v308, "value");
        v310 = v309;
        objc_msgSend(v270, "fixedSize");
        v311 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v311, "height");
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v312, "value");
        -[LPComponentView convertRect:toView:](v300, "convertRect:toView:", self, v302 - v409 - v305, v307, v310, v313);
        v408 = v314;
        v407 = v315;
        v403 = v316;
        v246 = v317;

      }
    }
    -[LPComponentView setFrame:](self->_leftIconBadgeView, "setFrame:", v277, v276, v275, v266);
    -[LPComponentView setFrame:](self->_rightIconBadgeView, "setFrame:", v408, v407, v246, v403);

    v206 = v353;
  }
  else
  {
    -[LPCollaborationFooterView setAdditionalPadding:](self->_collaborationFooterView, "setAdditionalPadding:", v333, v331, v329, v327);
  }
  -[LPCaptionBarStyle minimumWidth](self->_style, "minimumWidth");
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v318, "value");
  v320 = -0.0;
  if (!v402)
    v320 = v369;
  v321 = v320 + v413;
  v322 = fmin(fmax(v319, v397), rect2_24a);

  v323 = v322;
  v324 = v321;
  result.height = v324;
  result.width = v323;
  return result;
}

BOOL __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  _BOOL8 v5;
  double v6;
  void *v7;
  double v8;
  double Width;
  double v10;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 480))
  {
    objc_msgSend(*(id *)(v1 + 432), "button");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collapsedButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (+[LPTestingOverrides forceCollapseButtons](LPTestingOverrides, "forceCollapseButtons"))
      {
        v5 = 1;
LABEL_12:

        return v5;
      }
      if (*(_BYTE *)(a1 + 96))
      {
        v6 = *(double *)(a1 + 40);
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "minimumWidth");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "value");
        v6 = fmin(fmax(v8, *(double *)(a1 + 56)), *(double *)(a1 + 40));

      }
      if (v6 != 0.0)
      {
        Width = CGRectGetWidth(*(CGRect *)(a1 + 64));
        objc_msgSend(v4, "layoutRatioThreshold");
        v5 = Width / v6 >= v10;
        goto LABEL_12;
      }
    }
    v5 = 0;
    goto LABEL_12;
  }
  return 0;
}

void __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_4(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "collaborationFooter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useFullWidth");

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "collaborationFooter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ignoreSafeAreaInset");

    if (!v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "collaborationFooter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "useSafeAreaInsetWithPadding");

    }
  }
  else if (*(_BYTE *)(a1 + 176))
  {
    CGRectGetMinX(*(CGRect *)(a1 + 136));
  }
  else
  {
    CGRectGetMaxX(*(CGRect *)(a1 + 136));
  }
}

double __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_5(uint64_t a1)
{
  double v2;
  uint64_t v3;
  void *v4;
  int v5;

  v2 = 0.0;
  if (*(_BYTE *)(a1 + 56)
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "addFullWidthLineForButton"))
  {
    v2 = *(double *)(a1 + 40) + 0.0;
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 568))
  {
    objc_msgSend(*(id *)(v3 + 424), "collaborationFooter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "useFullWidth");

    if (v5)
      return v2 + *(double *)(a1 + 48);
  }
  return v2;
}

double __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_6(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 136))
    return *(double *)(a1 + 40) - *(double *)(a1 + 48);
  else
    return fmax(fmax(fmax(fmax(fmax(fmax(CGRectGetMaxY(*(CGRect *)(a1 + 56)), *(double *)(a1 + 88)), *(double *)(a1 + 96)), *(double *)(a1 + 104)), *(double *)(a1 + 112)), *(double *)(a1 + 120)), *(double *)(a1 + 128));
}

double __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(double a1, double a2, double a3, double a4, double a5, double a6, uint64_t a7, void *a8, void *a9)
{
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;

  v13 = a8;
  v14 = a9;
  v15 = objc_msgSend(v14, "verticalAlignment");
  if (!v15)
    v15 = objc_msgSend(v13, "verticalAlignment");
  switch(v15)
  {
    case 0:
    case 3:
      a1 = a1 * 0.5 + a6 * -0.5;
      break;
    case 1:
      objc_msgSend(v13, "margin");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "top");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "value");
      a1 = v18;
      goto LABEL_7;
    case 2:
      objc_msgSend(v13, "margin");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bottom");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "value");
      a1 = a1 - a2 - v19;
LABEL_7:

      break;
    default:
      break;
  }

  return a1;
}

double __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  CGRect v22;
  CGRect v23;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "convertRect:toView:", *(_QWORD *)(a1 + 32));
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  MaxX = CGRectGetMaxX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  CGRectGetMaxY(v23);
  objc_msgSend(v6, "offset");
  v13 = v12;
  objc_msgSend(v6, "fixedSize");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "width");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "value");
  v17 = v16;

  objc_msgSend(v6, "offset");
  objc_msgSend(v6, "fixedSize");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "height");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "value");

  objc_msgSend(v6, "fixedSize");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "asSize");

  return MaxX - (v13 + v17 * 0.5);
}

- (void)setPresentationProperties:(id)a3
{
  objc_storeStrong((id *)&self->_presentationProperties, a3);
}

- (void)addSubview:(id)a3
{
  UIVisualEffectView *v4;
  UIVisualEffectView *blurEffectView;
  BOOL v6;
  void *v7;
  objc_super v8;

  v4 = (UIVisualEffectView *)a3;
  blurEffectView = self->_blurEffectView;
  if (blurEffectView)
    v6 = blurEffectView == v4;
  else
    v6 = 1;
  if (v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)LPCaptionBarView;
    -[LPCaptionBarView addSubview:](&v8, sel_addSubview_, v4);
  }
  else
  {
    -[UIVisualEffectView contentView](blurEffectView, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4);

  }
}

- (void)_buildViewsForCaptionBarIfNeeded
{
  _BOOL4 v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *blurEffectView;
  LPIndeterminateProgressSpinnerView *v7;
  void *v8;
  LPIndeterminateProgressSpinnerStyle *v9;
  void *v10;
  LPIndeterminateProgressSpinnerView *v11;
  void *v12;
  LPIndeterminateProgressSpinnerView *v13;
  LPIndeterminateProgressSpinnerView *v14;
  LPIndeterminateProgressSpinnerView *v15;
  LPIndeterminateProgressSpinnerView *v16;
  LPComponentView *v17;
  LPComponentView *leftIconView;
  LPIndeterminateProgressSpinnerView *v19;
  LPCaptionBarPresentationProperties *presentationProperties;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  LPSize *v37;
  LPCaptionBarPresentationProperties *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  LPSize *v43;
  LPImageStackView *v44;
  void *v45;
  void *v46;
  void *v47;
  LPComponentView *v48;
  LPComponentView *v49;
  LPImageView *v50;
  void *v51;
  LPComponentView *v52;
  LPComponentView *v53;
  LPImageStackView *v54;
  void *v55;
  void *v56;
  void *v57;
  LPComponentView *v58;
  LPComponentView *rightIconView;
  LPImageView *v60;
  LPComponentView *v61;
  LPImageView *v62;
  void *v63;
  LPComponentView *v64;
  LPComponentView *leftIconBadgeView;
  LPImageView *v66;
  void *v67;
  LPComponentView *v68;
  LPComponentView *rightIconBadgeView;
  LPPlayButtonView *v70;
  void *v71;
  LPInlineMediaPlaybackInformation *inlinePlaybackInformation;
  void *v73;
  void *v74;
  LPPlayButtonView *v75;
  LPPlayButtonView *playButton;
  LPCaptionBarPresentationProperties *v77;
  uint64_t v78;
  int64_t v79;
  int64_t v80;
  LPCaptionBarAccessoryView *v81;
  void *v82;
  LPCaptionBarAccessoryView *v83;
  LPCaptionBarAccessoryView *leftAccessoryView;
  LPCaptionBarAccessoryView *v85;
  void *v86;
  LPCaptionBarAccessoryView *v87;
  LPCaptionBarAccessoryView *rightAccessoryView;
  void *v89;
  LPCaptionBarButtonView *v90;
  void *v91;
  void *v92;
  void *v93;
  LPCaptionBarButtonView *v94;
  LPCaptionBarButtonView *buttonView;
  void *v96;
  LPCollaborationFooterView *v97;
  void *v98;
  void *v99;
  void *v100;
  LPCollaborationFooterView *v101;
  LPCollaborationFooterView *collaborationFooterView;
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
  _QWORD v116[3];

  v116[1] = *MEMORY[0x1E0C80C00];
  if (!self->_hasEverBuilt)
  {
    v3 = -[UIView _lp_isLTR](self, "_lp_isLTR");
    if (!self->_blurEffectView
      && -[LPCaptionBarPresentationProperties usesBlurredBackground](self->_presentationProperties, "usesBlurredBackground"))
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v4);
      blurEffectView = self->_blurEffectView;
      self->_blurEffectView = v5;

      -[LPCaptionBarView addSubview:](self, "addSubview:", self->_blurEffectView);
    }
    if (self->_useProgressSpinner)
    {
      v7 = [LPIndeterminateProgressSpinnerView alloc];
      -[LPComponentView host](self, "host");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(LPIndeterminateProgressSpinnerStyle);
      -[LPCaptionBarPresentationProperties spinner](self->_presentationProperties, "spinner");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[LPIndeterminateProgressSpinnerView initWithHost:style:properties:](v7, "initWithHost:style:properties:", v8, v9, v10);

      -[LPCaptionBarView addSubview:](self, "addSubview:", v11);
      -[LPCaptionBarPresentationProperties leadingIcon](self->_presentationProperties, "leadingIcon");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        v13 = 0;
      else
        v13 = v11;
      if (v12)
        v14 = v11;
      else
        v14 = 0;
      if (v3)
        v15 = v14;
      else
        v15 = v13;
      if (v3)
        v16 = v13;
      else
        v16 = v14;
      v17 = v15;
      leftIconView = self->_leftIconView;
      self->_leftIconView = v17;
      v19 = v11;

      objc_storeStrong((id *)&self->_rightIconView, v16);
    }
    else
    {
      presentationProperties = self->_presentationProperties;
      if (v3)
      {
        -[LPCaptionBarPresentationProperties leadingIcon](presentationProperties, "leadingIcon");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties trailingIcon](self->_presentationProperties, "trailingIcon");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties leadingIconBadge](self->_presentationProperties, "leadingIconBadge");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties trailingIconBadge](self->_presentationProperties, "trailingIconBadge");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties additionalLeadingIcons](self->_presentationProperties, "additionalLeadingIcons");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties additionalTrailingIcons](self->_presentationProperties, "additionalTrailingIcons");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_style, "leadingIcon");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = (void *)objc_msgSend(v21, "copy");

        -[LPCaptionBarStyle trailingIcon](self->_style, "trailingIcon");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = (void *)objc_msgSend(v22, "copy");

        -[LPCaptionBarPresentationProperties leadingIconProperties](self->_presentationProperties, "leadingIconProperties");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties trailingIconProperties](self->_presentationProperties, "trailingIconProperties");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties leadingIconBadgeProperties](self->_presentationProperties, "leadingIconBadgeProperties");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties trailingIconBadgeProperties](self->_presentationProperties, "trailingIconBadgeProperties");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIconBadge](self->_style, "leadingIconBadge");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v23, "copy");

        -[LPCaptionBarStyle trailingIconBadge](self->_style, "trailingIconBadge");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v25, "copy");

        -[LPCaptionBarPresentationProperties leadingIconSize](self->_presentationProperties, "leadingIconSize");
      }
      else
      {
        -[LPCaptionBarPresentationProperties trailingIcon](presentationProperties, "trailingIcon");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties leadingIcon](self->_presentationProperties, "leadingIcon");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties trailingIconBadge](self->_presentationProperties, "trailingIconBadge");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties leadingIconBadge](self->_presentationProperties, "leadingIconBadge");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties additionalTrailingIcons](self->_presentationProperties, "additionalTrailingIcons");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties additionalLeadingIcons](self->_presentationProperties, "additionalLeadingIcons");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle trailingIcon](self->_style, "trailingIcon");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = (void *)objc_msgSend(v29, "copy");

        -[LPCaptionBarStyle leadingIcon](self->_style, "leadingIcon");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = (void *)objc_msgSend(v30, "copy");

        -[LPCaptionBarPresentationProperties trailingIconProperties](self->_presentationProperties, "trailingIconProperties");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties leadingIconProperties](self->_presentationProperties, "leadingIconProperties");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties trailingIconBadgeProperties](self->_presentationProperties, "trailingIconBadgeProperties");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties leadingIconBadgeProperties](self->_presentationProperties, "leadingIconBadgeProperties");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle trailingIconBadge](self->_style, "trailingIconBadge");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v31, "copy");

        -[LPCaptionBarStyle leadingIconBadge](self->_style, "leadingIconBadge");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v32, "copy");

        -[LPCaptionBarPresentationProperties trailingIconSize](self->_presentationProperties, "trailingIconSize");
      }
      v33 = v27;
      v34 = v28;
      v36 = *MEMORY[0x1E0C9D820];
      v35 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      if (v27 != *MEMORY[0x1E0C9D820] || v28 != v35)
      {
        v37 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", v27, v28);
        objc_msgSend(v110, "setFixedSize:", v37);

        if (objc_msgSend(v110, "filter") == 3 && v33 != v34)
          objc_msgSend(v110, "setFilter:", 1);
      }
      v38 = self->_presentationProperties;
      if (v3)
        -[LPCaptionBarPresentationProperties trailingIconSize](v38, "trailingIconSize");
      else
        -[LPCaptionBarPresentationProperties leadingIconSize](v38, "leadingIconSize");
      v41 = v39;
      v42 = v40;
      if (v39 != v36 || v40 != v35)
      {
        v43 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", v39, v40);
        objc_msgSend(v109, "setFixedSize:", v43);

        if (objc_msgSend(v109, "filter") == 3 && v41 != v42)
          objc_msgSend(v109, "setFilter:", 1);
      }
      if (v114)
      {
        if (v108)
        {
          v44 = [LPImageStackView alloc];
          -[LPComponentView host](self, "host");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v116[0] = v114;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "arrayByAddingObjectsFromArray:", v108);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[LPImageStackView initWithHost:images:style:](v44, "initWithHost:images:style:", v45, v47, v110);
          v49 = self->_leftIconView;
          self->_leftIconView = v48;

        }
        else
        {
          v50 = [LPImageView alloc];
          -[LPComponentView host](self, "host");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = -[LPImageView initWithHost:image:properties:style:](v50, "initWithHost:image:properties:style:", v51, v114, v104, v110);
          v53 = self->_leftIconView;
          self->_leftIconView = v52;

        }
        -[LPCaptionBarView addSubview:](self, "addSubview:", self->_leftIconView);
      }
      if (v113)
      {
        if (v107)
        {
          v54 = [LPImageStackView alloc];
          -[LPComponentView host](self, "host");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = v113;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "arrayByAddingObjectsFromArray:", v107);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = -[LPImageStackView initWithHost:images:style:](v54, "initWithHost:images:style:", v55, v57, v109);
          rightIconView = self->_rightIconView;
          self->_rightIconView = v58;

        }
        else
        {
          v60 = [LPImageView alloc];
          -[LPComponentView host](self, "host");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = -[LPImageView initWithHost:image:properties:style:](v60, "initWithHost:image:properties:style:", v55, v113, v103, v109);
          v56 = self->_rightIconView;
          self->_rightIconView = v61;
        }

        -[LPCaptionBarView addSubview:](self, "addSubview:", self->_rightIconView);
      }
      if (v112)
      {
        v62 = [LPImageView alloc];
        -[LPComponentView host](self, "host");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = -[LPImageView initWithHost:image:properties:style:](v62, "initWithHost:image:properties:style:", v63, v112, v105, v24);
        leftIconBadgeView = self->_leftIconBadgeView;
        self->_leftIconBadgeView = v64;

        -[LPCaptionBarView addSubview:](self, "addSubview:", self->_leftIconBadgeView);
      }
      if (v111)
      {
        v66 = [LPImageView alloc];
        -[LPComponentView host](self, "host");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = -[LPImageView initWithHost:image:properties:style:](v66, "initWithHost:image:properties:style:", v67, v111, v106, v26);
        rightIconBadgeView = self->_rightIconBadgeView;
        self->_rightIconBadgeView = v68;

        -[LPCaptionBarView addSubview:](self, "addSubview:", self->_rightIconBadgeView);
      }

    }
    -[LPCaptionBarView updateTextStack](self, "updateTextStack");
    if (self->_inlinePlaybackInformation)
    {
      v70 = [LPPlayButtonView alloc];
      -[LPComponentView host](self, "host");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      inlinePlaybackInformation = self->_inlinePlaybackInformation;
      -[LPCaptionBarStyle playButton](self->_style, "playButton");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarPresentationProperties playButton](self->_presentationProperties, "playButton");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = -[LPPlayButtonView initWithHost:playbackInformation:style:properties:](v70, "initWithHost:playbackInformation:style:properties:", v71, inlinePlaybackInformation, v73, v74);
      playButton = self->_playButton;
      self->_playButton = v75;

      -[LPCaptionBarView addSubview:](self, "addSubview:", self->_playButton);
    }
    v77 = self->_presentationProperties;
    if (v3)
    {
      v78 = -[LPCaptionBarPresentationProperties leadingAccessoryType](v77, "leadingAccessoryType");
      v79 = -[LPCaptionBarPresentationProperties trailingAccessoryType](self->_presentationProperties, "trailingAccessoryType");
    }
    else
    {
      v78 = -[LPCaptionBarPresentationProperties trailingAccessoryType](v77, "trailingAccessoryType");
      v79 = -[LPCaptionBarPresentationProperties leadingAccessoryType](self->_presentationProperties, "leadingAccessoryType");
    }
    v80 = v79;
    if (v78)
    {
      v81 = [LPCaptionBarAccessoryView alloc];
      -[LPComponentView host](self, "host");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = -[LPCaptionBarAccessoryView initWithHost:type:side:](v81, "initWithHost:type:side:", v82, v78, 0);
      leftAccessoryView = self->_leftAccessoryView;
      self->_leftAccessoryView = v83;

      -[LPCaptionBarView addSubview:](self, "addSubview:", self->_leftAccessoryView);
    }
    if (v80)
    {
      v85 = [LPCaptionBarAccessoryView alloc];
      -[LPComponentView host](self, "host");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = -[LPCaptionBarAccessoryView initWithHost:type:side:](v85, "initWithHost:type:side:", v86, v80, 1);
      rightAccessoryView = self->_rightAccessoryView;
      self->_rightAccessoryView = v87;

      -[LPCaptionBarView addSubview:](self, "addSubview:", self->_rightAccessoryView);
    }
    -[LPCaptionBarPresentationProperties button](self->_presentationProperties, "button");
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (v89)
    {
      v90 = [LPCaptionBarButtonView alloc];
      -[LPComponentView host](self, "host");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarPresentationProperties button](self->_presentationProperties, "button");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle button](self->_style, "button");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = -[LPCaptionBarButtonView initWithHost:properties:style:](v90, "initWithHost:properties:style:", v91, v92, v93);
      buttonView = self->_buttonView;
      self->_buttonView = v94;

      -[LPCaptionBarView addSubview:](self, "addSubview:", self->_buttonView);
    }
    -[LPCaptionBarPresentationProperties collaborationFooter](self->_presentationProperties, "collaborationFooter");
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (v96)
    {
      v97 = [LPCollaborationFooterView alloc];
      -[LPComponentView host](self, "host");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarPresentationProperties collaborationFooter](self->_presentationProperties, "collaborationFooter");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle collaborationFooter](self->_style, "collaborationFooter");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = -[LPCollaborationFooterView initWithHost:properties:style:](v97, "initWithHost:properties:style:", v98, v99, v100);
      collaborationFooterView = self->_collaborationFooterView;
      self->_collaborationFooterView = v101;

    }
    if (self->_collaborationFooterView)
      -[LPCaptionBarView addSubview:](self, "addSubview:");
    self->_hasEverBuilt = 1;
  }
}

- (void)updateTextStack
{
  LPVerticalTextStackView *textStackView;
  LPVerticalTextStackView *v4;
  void *v5;
  void *v6;
  void *v7;
  NSRegularExpression *emphasizedTextExpression;
  void *v9;
  LPTextStyleable *v10;
  LPTextStyleable *aboveTopCaptionView;
  void *v12;
  void *v13;
  void *v14;
  NSRegularExpression *v15;
  void *v16;
  LPTextStyleable *v17;
  LPTextStyleable *topCaptionView;
  void *v19;
  void *v20;
  void *v21;
  NSRegularExpression *v22;
  void *v23;
  LPTextStyleable *v24;
  LPTextStyleable *bottomCaptionView;
  void *v26;
  void *v27;
  void *v28;
  NSRegularExpression *v29;
  void *v30;
  LPTextStyleable *v31;
  LPTextStyleable *belowBottomCaptionView;
  LPVerticalTextStackView *v33;
  void *v34;
  void *v35;
  LPVerticalTextStackView *v36;
  LPVerticalTextStackView *v37;

  -[UIView _lp_isLTR](self, "_lp_isLTR");
  textStackView = self->_textStackView;
  if (textStackView)
  {
    -[LPVerticalTextStackView removeFromSuperview](textStackView, "removeFromSuperview");
    v4 = self->_textStackView;
    self->_textStackView = 0;

  }
  -[LPCaptionBarPresentationProperties aboveTop](self->_presentationProperties, "aboveTop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle textStack](self->_style, "textStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aboveTopCaption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  emphasizedTextExpression = self->_emphasizedTextExpression;
  -[LPComponentView host](self, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  createViewForRow(v5, v7, emphasizedTextExpression, v9);
  v10 = (LPTextStyleable *)objc_claimAutoreleasedReturnValue();
  aboveTopCaptionView = self->_aboveTopCaptionView;
  self->_aboveTopCaptionView = v10;

  -[LPCaptionBarPresentationProperties top](self->_presentationProperties, "top");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle textStack](self->_style, "textStack");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topCaption");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self->_emphasizedTextExpression;
  -[LPComponentView host](self, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  createViewForRow(v12, v14, v15, v16);
  v17 = (LPTextStyleable *)objc_claimAutoreleasedReturnValue();
  topCaptionView = self->_topCaptionView;
  self->_topCaptionView = v17;

  -[LPCaptionBarPresentationProperties bottom](self->_presentationProperties, "bottom");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle textStack](self->_style, "textStack");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomCaption");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self->_emphasizedTextExpression;
  -[LPComponentView host](self, "host");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  createViewForRow(v19, v21, v22, v23);
  v24 = (LPTextStyleable *)objc_claimAutoreleasedReturnValue();
  bottomCaptionView = self->_bottomCaptionView;
  self->_bottomCaptionView = v24;

  -[LPCaptionBarPresentationProperties belowBottom](self->_presentationProperties, "belowBottom");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle textStack](self->_style, "textStack");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "belowBottomCaption");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self->_emphasizedTextExpression;
  -[LPComponentView host](self, "host");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  createViewForRow(v26, v28, v29, v30);
  v31 = (LPTextStyleable *)objc_claimAutoreleasedReturnValue();
  belowBottomCaptionView = self->_belowBottomCaptionView;
  self->_belowBottomCaptionView = v31;

  if (self->_aboveTopCaptionView || self->_topCaptionView || self->_bottomCaptionView || self->_belowBottomCaptionView)
  {
    v33 = [LPVerticalTextStackView alloc];
    -[LPComponentView host](self, "host");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPCaptionBarStyle textStack](self->_style, "textStack");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[LPVerticalTextStackView initWithHost:style:](v33, "initWithHost:style:", v34, v35);
    v37 = self->_textStackView;
    self->_textStackView = v36;

    if (self->_aboveTopCaptionView)
      -[LPVerticalTextStackView addArrangedSubview:](self->_textStackView, "addArrangedSubview:");
    if (self->_topCaptionView)
      -[LPVerticalTextStackView addArrangedSubview:](self->_textStackView, "addArrangedSubview:");
    if (self->_bottomCaptionView)
      -[LPVerticalTextStackView addArrangedSubview:](self->_textStackView, "addArrangedSubview:");
    if (self->_belowBottomCaptionView)
      -[LPVerticalTextStackView addArrangedSubview:](self->_textStackView, "addArrangedSubview:");
    -[LPCaptionBarView addSubview:](self, "addSubview:", self->_textStackView);
  }
}

- (id)button
{
  void *v3;
  LPCaptionBarButtonView *v4;

  -[LPCaptionBarPresentationProperties button](self->_presentationProperties, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPCaptionBarView _buildViewsForCaptionBarIfNeeded](self, "_buildViewsForCaptionBarIfNeeded");
    v4 = self->_buttonView;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)subtitleButton
{
  return (id)-[LPTextStyleable subtitleButton](self->_bottomCaptionView, "subtitleButton");
}

- (void)setEmphasizedTextExpression:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_emphasizedTextExpression, a3);
  -[LPTextStyleable setEmphasizedTextExpression:](self->_aboveTopCaptionView, "setEmphasizedTextExpression:", v5);
  -[LPTextStyleable setEmphasizedTextExpression:](self->_topCaptionView, "setEmphasizedTextExpression:", v5);
  -[LPTextStyleable setEmphasizedTextExpression:](self->_bottomCaptionView, "setEmphasizedTextExpression:", v5);
  -[LPTextStyleable setEmphasizedTextExpression:](self->_belowBottomCaptionView, "setEmphasizedTextExpression:", v5);

}

- (id)playable
{
  return -[LPPlayButtonView playable](self->_playButton, "playable");
}

- (id)primaryIconView
{
  LPComponentView *leftIconView;

  leftIconView = self->_leftIconView;
  if (!leftIconView)
    leftIconView = self->_rightIconView;
  return leftIconView;
}

- (BOOL)hasIconViewEqualToComponentView:(id)a3
{
  return self->_leftIconView == a3 || self->_rightIconView == a3;
}

- (id)layoutExclusionsForView:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  LPComponentView *leftIconView;
  void *v10;
  void *v11;
  LPComponentView *rightIconView;
  void *v13;
  void *v14;
  id v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v4 = a3;
  if (*(_OWORD *)&self->_leftIconView == 0)
  {
    v15 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[LPCaptionBarView frame](self, "frame");
    v6 = v5;
    v8 = v7;
    leftIconView = self->_leftIconView;
    if (leftIconView)
    {
      -[LPComponentView frame](leftIconView, "frame");
      v21.origin.x = 0.0;
      v21.origin.y = 0.0;
      v21.size.width = 0.0;
      v21.size.height = v8;
      v18 = CGRectUnion(v17, v21);
      v10 = (void *)MEMORY[0x1E0DC3508];
      -[LPCaptionBarView convertRect:toView:](self, "convertRect:toView:", v4, v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
      objc_msgSend(v10, "bezierPathWithRect:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v11);

    }
    rightIconView = self->_rightIconView;
    if (rightIconView)
    {
      -[LPComponentView frame](rightIconView, "frame");
      v22.origin.y = 0.0;
      v22.size.width = 0.0;
      v22.origin.x = v6;
      v22.size.height = v8;
      v20 = CGRectUnion(v19, v22);
      v13 = (void *)MEMORY[0x1E0DC3508];
      -[LPCaptionBarView convertRect:toView:](self, "convertRect:toView:", v4, v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
      objc_msgSend(v13, "bezierPathWithRect:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v14);

    }
  }

  return v15;
}

- (BOOL)useProgressSpinner
{
  return self->_useProgressSpinner;
}

- (UIEdgeInsets)textSafeAreaInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textSafeAreaInset.top;
  left = self->_textSafeAreaInset.left;
  bottom = self->_textSafeAreaInset.bottom;
  right = self->_textSafeAreaInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextSafeAreaInset:(UIEdgeInsets)a3
{
  self->_textSafeAreaInset = a3;
}

- (LPCollaborationFooterView)collaborationFooterView
{
  return self->_collaborationFooterView;
}

- (void)setCollaborationFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationFooterView, a3);
}

- (NSRegularExpression)emphasizedTextExpression
{
  return self->_emphasizedTextExpression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasizedTextExpression, 0);
  objc_storeStrong((id *)&self->_collaborationFooterView, 0);
  objc_storeStrong((id *)&self->_inlinePlaybackInformation, 0);
  objc_storeStrong((id *)&self->_textStackView, 0);
  objc_storeStrong((id *)&self->_belowBottomCaptionView, 0);
  objc_storeStrong((id *)&self->_bottomCaptionView, 0);
  objc_storeStrong((id *)&self->_topCaptionView, 0);
  objc_storeStrong((id *)&self->_aboveTopCaptionView, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_rightIconBadgeView, 0);
  objc_storeStrong((id *)&self->_leftIconBadgeView, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_rightAccessoryView, 0);
  objc_storeStrong((id *)&self->_leftAccessoryView, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_rightIconView, 0);
  objc_storeStrong((id *)&self->_leftIconView, 0);
  objc_storeStrong((id *)&self->_presentationProperties, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
