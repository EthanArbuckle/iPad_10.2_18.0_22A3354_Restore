@implementation CSMagSafeAccessoryWalletView

- (CSMagSafeAccessoryWalletView)initWithFrame:(CGRect)a3
{
  CSMagSafeAccessoryWalletView *v3;
  void *v4;
  uint64_t v5;
  CABackdropLayer *averageColorBackdropLayer;
  double v7;
  CABackdropLayer *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CABackdropLayer *backgroundBackdropLayer;
  CABackdropLayer *v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  CABackdropLayer *backgroundRadiusBackdropLayer;
  CABackdropLayer *v19;
  void *v20;
  double v21;
  uint64_t v22;
  CABackdropLayer *trackRingBlurBackdropLayer;
  CABackdropLayer *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  CSRingLayer *trackRingBlurLayer;
  CSRingLayer *v35;
  id v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  double v45;
  int v46;
  int v47;
  double v48;
  double v49;
  int v50;
  int v51;
  double v52;
  double v53;
  double v54;
  double v55;
  int v56;
  int v57;
  int v58;
  uint64_t v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  double v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  double v73;
  double v74;
  int v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  uint64_t v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  double v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  double v104;
  double v105;
  int v106;
  int v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  uint64_t v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  double v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  double v136;
  double v137;
  int v138;
  int v139;
  double v140;
  double v141;
  double v142;
  double v143;
  uint64_t v144;
  CSMagSafeSilhouetteConfiguration *v145;
  CSMagSafeSilhouetteConfiguration *silhouette;
  void *v147;
  uint64_t v148;
  CALayer *walletLayer;
  double v150;
  CALayer *v151;
  id v152;
  double v153;
  void *v154;
  void *v155;
  double v156;
  double v157;
  void *v158;
  void *v159;
  double v160;
  uint64_t v161;
  CSRingLayer *trackRing;
  CSRingLayer *v163;
  id v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  CSMagSafeAccessoryWalletView *v171;
  double v173;
  int v174;
  int v175;
  double v176;
  int v177;
  double v178;
  int v179;
  int v180;
  double v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  double v187;
  int v188;
  double v189;
  int v190;
  int v191;
  int v192;
  int v193;
  double v194;
  int v195;
  int v196;
  int v197;
  int v198;
  double v199;
  int v200;
  double v201;
  double v202;
  double v203;
  double v204;
  int v205;
  int v206;
  char *__ptr32 *v207;
  int v208;
  double v209;
  int v210;
  int v211;
  int v212;
  double v213;
  int v214;
  int v215;
  int v216;
  int v217;
  double v218;
  int v219;
  int v220;
  int v221;
  int v222;
  int v223;
  int v224;
  double v225;
  int v226;
  int v227;
  int v228;
  int v229;
  int v230;
  int v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  int v241;
  double v242;
  int v243;
  double v244;
  int v245;
  double v246;
  int v247;
  int v248;
  int v249;
  int v250;
  int v251;
  int v252;
  int v253;
  int v254;
  int v255;
  int v256;
  int v257;
  int v258;
  int v259;
  int v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  int v266;
  double v267;
  int v268;
  double v269;
  int v270;
  double v271;
  int v272;
  int v273;
  int v274;
  int v275;
  double v276;
  int v277;
  int v278;
  double v279;
  int v280;
  int v281;
  int v282;
  int v283;
  double v284;
  int v285;
  int v286;
  int v287;
  int v288;
  double v289;
  int v290;
  double v291;
  double v292;
  double v293;
  double v294;
  int v295;
  int v296;
  int v297;
  double v298;
  int v299;
  int v300;
  int v301;
  int v302;
  int v303;
  double v304;
  int v305;
  int v306;
  int v307;
  int v308;
  int v309;
  double v310;
  int v311;
  int v312;
  int v313;
  int v314;
  int v315;
  int v316;
  int v317;
  double v318;
  int v319;
  int v320;
  int v321;
  int v322;
  int v323;
  int v324;
  int v325;
  int v326;
  double v327;
  double v328;
  double v329;
  double v330;
  double v331;
  double v332;
  double v333;
  double v334;
  double v335;
  int v336;
  double v337;
  int v338;
  double v339;
  int v340;
  double v341;
  int v342;
  int v343;
  int v344;
  int v345;
  int v346;
  int v347;
  int v348;
  int v349;
  int v350;
  int v351;
  double v352;
  double v353;
  double v354;
  double v355;
  double v356;
  double v357;
  double v358;
  double v359;
  int v360;
  int v361;
  int v362;
  int v363;
  int v364;
  int v365;
  int v366;
  int v367;
  int v368;
  int v369;
  int v370;
  int v371;
  int v372;
  int v373;
  int v374;
  int v375;
  int v376;
  double v377;
  int v378;
  double v379;
  uint64_t v380;
  int v381;
  double v382;
  uint64_t v383;
  int v384;
  double v385;
  uint64_t v386;
  double v387;
  double v388;
  double v389;
  double v390;
  double v391;
  double v392;
  double v393;
  double v394;
  int v395;
  int v396;
  int v397;
  int v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  char *__ptr32 *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  void *v475;
  void *v476;
  void *v477;
  void *v478;
  void *v479;
  void *v480;
  void *v481;
  void *v482;
  void *v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  int v502;
  uint64_t v503;
  void *v504;
  void *v505;
  void *v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  void *v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  void *v522;
  void *v523;
  void *v524;
  void *v525;
  void *v526;
  void *v527;
  void *v528;
  void *v529;
  void *v530;
  void *v531;
  void *v532;
  void *v533;
  void *v534;
  void *v535;
  void *v536;
  void *v537;
  void *v538;
  void *v539;
  void *v540;
  void *v541;
  void *v542;
  void *v543;
  void *v544;
  void *v545;
  void *v546;
  void *v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  void *v553;
  int v554;
  int v555;
  int v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  int v569;
  uint64_t v570;
  uint64_t v571;
  int v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t v581;
  int v582;
  uint64_t v583;
  uint64_t v584;
  int v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  _QWORD v598[9];
  unint64_t v599;
  uint64_t v600;
  objc_super v601;
  _QWORD v602[3];

  v602[1] = *MEMORY[0x1E0C80C00];
  v601.receiver = self;
  v601.super_class = (Class)CSMagSafeAccessoryWalletView;
  v3 = -[CSMagSafeAccessoryView initWithFrame:](&v601, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  if (!v3)
    goto LABEL_688;
  -[CSMagSafeAccessoryWalletView layer](v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupBlending:", 0);

  if (-[CSMagSafeAccessoryView isReduceTransparencyEnabled](v3, "isReduceTransparencyEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CD2708], "layer");
    v5 = objc_claimAutoreleasedReturnValue();
    averageColorBackdropLayer = v3->_averageColorBackdropLayer;
    v3->_averageColorBackdropLayer = (CABackdropLayer *)v5;

    LODWORD(v7) = 0;
    -[CABackdropLayer setOpacity:](v3->_averageColorBackdropLayer, "setOpacity:", v7);
    v8 = v3->_averageColorBackdropLayer;
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2B88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v602[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v602, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABackdropLayer setFilters:](v8, "setFilters:", v10);

    -[CABackdropLayer setScale:](v3->_averageColorBackdropLayer, "setScale:", 100.0);
    -[CABackdropLayer setAllowsGroupOpacity:](v3->_averageColorBackdropLayer, "setAllowsGroupOpacity:", 1);
    -[CABackdropLayer setAllowsGroupBlending:](v3->_averageColorBackdropLayer, "setAllowsGroupBlending:", 1);
    -[CABackdropLayer setAllowsEdgeAntialiasing:](v3->_averageColorBackdropLayer, "setAllowsEdgeAntialiasing:", 1);
  }
  objc_msgSend(MEMORY[0x1E0CD2708], "backdropLayerWithGaussianBlurRadius:brightnessAmount:saturationAmount:", 0.0, 0.0, 1.0);
  v11 = objc_claimAutoreleasedReturnValue();
  backgroundBackdropLayer = v3->_backgroundBackdropLayer;
  v3->_backgroundBackdropLayer = (CABackdropLayer *)v11;

  v13 = v3->_backgroundBackdropLayer;
  v14 = *MEMORY[0x1E0CD2E70];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E70]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABackdropLayer setCompositingFilter:](v13, "setCompositingFilter:", v15);

  LODWORD(v16) = 1.0;
  -[CABackdropLayer setOpacity:](v3->_backgroundBackdropLayer, "setOpacity:", v16);
  if (-[CSMagSafeAccessoryView isReduceMotionEnabled](v3, "isReduceMotionEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CD2708], "backdropLayerWithGaussianBlurRadius:brightnessAmount:saturationAmount:", 60.0, 0.0, 1.0);
    v17 = objc_claimAutoreleasedReturnValue();
    backgroundRadiusBackdropLayer = v3->_backgroundRadiusBackdropLayer;
    v3->_backgroundRadiusBackdropLayer = (CABackdropLayer *)v17;

    v19 = v3->_backgroundRadiusBackdropLayer;
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABackdropLayer setCompositingFilter:](v19, "setCompositingFilter:", v20);

    LODWORD(v21) = 0;
    -[CABackdropLayer setOpacity:](v3->_backgroundRadiusBackdropLayer, "setOpacity:", v21);
  }
  objc_msgSend(MEMORY[0x1E0CD2708], "backdropLayerWithGaussianBlurRadius:brightnessAmount:saturationAmount:", 45.0, 0.15, 1.3);
  v22 = objc_claimAutoreleasedReturnValue();
  trackRingBlurBackdropLayer = v3->_trackRingBlurBackdropLayer;
  v3->_trackRingBlurBackdropLayer = (CABackdropLayer *)v22;

  v24 = v3->_trackRingBlurBackdropLayer;
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABackdropLayer setCompositingFilter:](v24, "setCompositingFilter:", v25);

  -[CSMagSafeAccessoryWalletView configuration](v3, "configuration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ring");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "ringDiameter");
  v29 = v28;
  -[CSMagSafeAccessoryWalletView configuration](v3, "configuration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "ring");
  v31 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v31, "lineWidth");
  +[CSRingLayer ringLayerWithBlendMode:diameter:lineWidth:brightnessAmount:saturationAmount:](CSRingLayer, "ringLayerWithBlendMode:diameter:lineWidth:brightnessAmount:saturationAmount:", v14, v29, v32, 0.1, 1.25);
  v33 = objc_claimAutoreleasedReturnValue();
  trackRingBlurLayer = v3->_trackRingBlurLayer;
  v3->_trackRingBlurLayer = (CSRingLayer *)v33;

  v35 = v3->_trackRingBlurLayer;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CSRingLayer setStrokeColor:](v35, "setStrokeColor:", objc_msgSend(v36, "CGColor"));

  -[CABackdropLayer setMask:](v3->_trackRingBlurBackdropLayer, "setMask:", v3->_trackRingBlurLayer);
  v37 = __sb__runningInSpringBoard();
  if (v37)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v599 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v494 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v494, "userInterfaceIdiom") != 1)
    {
      v599 = 0x100000000;
      goto LABEL_15;
    }
  }
  HIDWORD(v599) = v37 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v38 = __sb__runningInSpringBoard();
    if (v38)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v501 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v501, "_referenceBounds");
    }
    BSSizeRoundForScale();
    LODWORD(v599) = v38 ^ 1;
    if (v53 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v52 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      LODWORD(v512) = 0;
      LODWORD(v516) = 0;
      LODWORD(v517) = 0;
      LODWORD(v518) = 0;
      LODWORD(v523) = 0;
      LODWORD(v532) = 0;
      LODWORD(v524) = 0;
      LODWORD(v525) = 0;
      LODWORD(v526) = 0;
      LODWORD(v533) = 0;
      LODWORD(v534) = 0;
      LODWORD(v535) = 0;
      LODWORD(v544) = 0;
      LODWORD(v545) = 0;
      LODWORD(v536) = 0;
      LODWORD(v539) = 0;
      v554 = 0;
      v557 = 0;
      LODWORD(v540) = 0;
      LODWORD(v546) = 0;
      v560 = 0;
      LODWORD(v547) = 0;
      v572 = 0;
      v573 = 0;
      v576 = 0;
      v585 = 0;
      v586 = 0;
      memset((char *)&v598[3] + 4, 0, 44);
      v48 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v599) = 0;
  }
LABEL_15:
  v39 = __sb__runningInSpringBoard();
  if (v39)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v598[8] = 0;
      goto LABEL_24;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v492 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v492, "userInterfaceIdiom") != 1)
    {
      v598[8] = 0x100000000;
      goto LABEL_24;
    }
  }
  HIDWORD(v598[8]) = v39 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v40 = __sb__runningInSpringBoard();
    if (v40)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v475 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v475, "_referenceBounds");
    }
    LODWORD(v598[8]) = v40 ^ 1;
    BSSizeRoundForScale();
    if (v54 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      LODWORD(v512) = 0;
      LODWORD(v516) = 0;
      LODWORD(v517) = 0;
      LODWORD(v518) = 0;
      LODWORD(v523) = 0;
      LODWORD(v532) = 0;
      LODWORD(v524) = 0;
      LODWORD(v525) = 0;
      LODWORD(v526) = 0;
      LODWORD(v533) = 0;
      LODWORD(v534) = 0;
      LODWORD(v535) = 0;
      LODWORD(v544) = 0;
      LODWORD(v545) = 0;
      LODWORD(v536) = 0;
      LODWORD(v539) = 0;
      v554 = 0;
      v557 = 0;
      LODWORD(v540) = 0;
      LODWORD(v546) = 0;
      v560 = 0;
      LODWORD(v547) = 0;
      v572 = 0;
      v573 = 0;
      v576 = 0;
      v585 = 0;
      v586 = 0;
      memset((char *)&v598[3] + 4, 0, 36);
      v48 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v598[8]) = 0;
  }
LABEL_24:
  v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v598[7] = 0;
      goto LABEL_33;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v490 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v490, "userInterfaceIdiom") != 1)
    {
      v598[7] = 0x100000000;
      goto LABEL_33;
    }
  }
  HIDWORD(v598[7]) = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v42 = __sb__runningInSpringBoard();
    if (v42)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v473 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v473, "_referenceBounds");
    }
    LODWORD(v598[7]) = v42 ^ 1;
    BSSizeRoundForScale();
    if (v55 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      LODWORD(v512) = 0;
      LODWORD(v516) = 0;
      LODWORD(v517) = 0;
      LODWORD(v518) = 0;
      LODWORD(v523) = 0;
      LODWORD(v532) = 0;
      LODWORD(v524) = 0;
      LODWORD(v525) = 0;
      LODWORD(v526) = 0;
      LODWORD(v533) = 0;
      LODWORD(v534) = 0;
      LODWORD(v535) = 0;
      LODWORD(v544) = 0;
      LODWORD(v545) = 0;
      LODWORD(v536) = 0;
      LODWORD(v539) = 0;
      v554 = 0;
      v557 = 0;
      LODWORD(v540) = 0;
      LODWORD(v546) = 0;
      v560 = 0;
      LODWORD(v547) = 0;
      v572 = 0;
      v573 = 0;
      v576 = 0;
      v585 = 0;
      v586 = 0;
      memset((char *)&v598[3] + 4, 0, 28);
      v48 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v598[7]) = 0;
  }
LABEL_33:
  v43 = __sb__runningInSpringBoard();
  if (v43)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v598[6] = 0;
      goto LABEL_42;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v488 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v488, "userInterfaceIdiom") != 1)
    {
      v598[6] = 0x100000000;
      goto LABEL_42;
    }
  }
  HIDWORD(v598[6]) = v43 ^ 1;
  v44 = __sb__runningInSpringBoard();
  if (v44)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v482 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v482, "_referenceBounds");
  }
  LODWORD(v598[6]) = v44 ^ 1;
  BSSizeRoundForScale();
  if (v45 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    LODWORD(v512) = 0;
    LODWORD(v516) = 0;
    LODWORD(v517) = 0;
    LODWORD(v518) = 0;
    LODWORD(v523) = 0;
    LODWORD(v532) = 0;
    LODWORD(v524) = 0;
    LODWORD(v525) = 0;
    LODWORD(v526) = 0;
    LODWORD(v533) = 0;
    LODWORD(v534) = 0;
    LODWORD(v535) = 0;
    LODWORD(v544) = 0;
    LODWORD(v545) = 0;
    LODWORD(v536) = 0;
    LODWORD(v539) = 0;
    v554 = 0;
    v557 = 0;
    LODWORD(v540) = 0;
    LODWORD(v546) = 0;
    v560 = 0;
    LODWORD(v547) = 0;
    v572 = 0;
    v573 = 0;
    v576 = 0;
    v585 = 0;
    v586 = 0;
    memset((char *)&v598[3] + 4, 0, 20);
    v48 = 0.0;
    goto LABEL_69;
  }
LABEL_42:
  v46 = __sb__runningInSpringBoard();
  if (v46)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v598[5] = 0;
      goto LABEL_52;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v486 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v486, "userInterfaceIdiom") != 1)
    {
      v598[5] = 0x100000000;
      goto LABEL_52;
    }
  }
  HIDWORD(v598[5]) = v46 ^ 1;
  v47 = __sb__runningInSpringBoard();
  if (v47)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v478 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v478, "_referenceBounds");
  }
  LODWORD(v598[5]) = v47 ^ 1;
  BSSizeRoundForScale();
  if (v49 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    LODWORD(v512) = 0;
    LODWORD(v516) = 0;
    LODWORD(v517) = 0;
    LODWORD(v518) = 0;
    LODWORD(v523) = 0;
    LODWORD(v532) = 0;
    LODWORD(v524) = 0;
    LODWORD(v525) = 0;
    LODWORD(v526) = 0;
    LODWORD(v533) = 0;
    LODWORD(v534) = 0;
    LODWORD(v535) = 0;
    LODWORD(v544) = 0;
    LODWORD(v545) = 0;
    LODWORD(v536) = 0;
    LODWORD(v539) = 0;
    v554 = 0;
    v557 = 0;
    LODWORD(v540) = 0;
    LODWORD(v546) = 0;
    v560 = 0;
    LODWORD(v547) = 0;
    v572 = 0;
    v573 = 0;
    v576 = 0;
    v585 = 0;
    v586 = 0;
    *(_QWORD *)((char *)&v598[3] + 4) = 0;
    HIDWORD(v598[4]) = 0;
    v48 = 0.0;
    goto LABEL_69;
  }
LABEL_52:
  v50 = __sb__runningInSpringBoard();
  if (v50)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v598[4] = 0;
      goto LABEL_692;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v484 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v484, "userInterfaceIdiom") != 1)
    {
      v598[4] = 0x100000000;
      goto LABEL_692;
    }
  }
  HIDWORD(v598[4]) = v50 ^ 1;
  v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v471 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v471, "_referenceBounds");
  }
  LODWORD(v598[4]) = v51 ^ 1;
  BSSizeRoundForScale();
  if (v173 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    LODWORD(v512) = 0;
    LODWORD(v516) = 0;
    LODWORD(v517) = 0;
    LODWORD(v518) = 0;
    LODWORD(v523) = 0;
    LODWORD(v532) = 0;
    LODWORD(v524) = 0;
    LODWORD(v525) = 0;
    LODWORD(v526) = 0;
    LODWORD(v533) = 0;
    LODWORD(v534) = 0;
    LODWORD(v535) = 0;
    LODWORD(v544) = 0;
    LODWORD(v545) = 0;
    LODWORD(v536) = 0;
    LODWORD(v539) = 0;
    v554 = 0;
    v557 = 0;
    LODWORD(v540) = 0;
    LODWORD(v546) = 0;
    v560 = 0;
    LODWORD(v547) = 0;
    v572 = 0;
    v573 = 0;
    v576 = 0;
    v585 = 0;
    v586 = 0;
    HIDWORD(v598[3]) = 0;
    v48 = 0.0;
    goto LABEL_69;
  }
LABEL_692:
  v174 = __sb__runningInSpringBoard();
  if (v174)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_694;
LABEL_700:
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    LODWORD(v512) = 0;
    LODWORD(v516) = 0;
    LODWORD(v517) = 0;
    LODWORD(v518) = 0;
    LODWORD(v523) = 0;
    LODWORD(v532) = 0;
    LODWORD(v524) = 0;
    LODWORD(v525) = 0;
    LODWORD(v526) = 0;
    LODWORD(v533) = 0;
    LODWORD(v534) = 0;
    LODWORD(v535) = 0;
    LODWORD(v544) = 0;
    LODWORD(v545) = 0;
    LODWORD(v536) = 0;
    LODWORD(v539) = 0;
    v554 = 0;
    v557 = 0;
    LODWORD(v540) = 0;
    LODWORD(v546) = 0;
    v560 = 0;
    LODWORD(v547) = 0;
    v572 = 0;
    v573 = 0;
    v576 = 0;
    v585 = 0;
    v586 = 0;
    v48 = 0.0;
    HIDWORD(v598[3]) = v174 ^ 1;
    goto LABEL_69;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v480 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v480, "userInterfaceIdiom") == 1)
    goto LABEL_700;
LABEL_694:
  HIDWORD(v598[3]) = v174 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_698:
    v586 = 0;
    goto LABEL_753;
  }
  v175 = __sb__runningInSpringBoard();
  if (v175)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_698;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v467 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v467, "userInterfaceIdiom"))
    {
      v586 = 0x100000000;
      goto LABEL_753;
    }
  }
  HIDWORD(v586) = v175 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v184 = __sb__runningInSpringBoard();
    if (v184)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v453 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v453, "_referenceBounds");
    }
    LODWORD(v586) = v184 ^ 1;
    BSSizeRoundForScale();
    if (v201 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      LODWORD(v512) = 0;
      LODWORD(v516) = 0;
      LODWORD(v517) = 0;
      LODWORD(v518) = 0;
      LODWORD(v523) = 0;
      LODWORD(v532) = 0;
      LODWORD(v524) = 0;
      LODWORD(v525) = 0;
      LODWORD(v526) = 0;
      LODWORD(v533) = 0;
      LODWORD(v534) = 0;
      LODWORD(v535) = 0;
      LODWORD(v544) = 0;
      LODWORD(v545) = 0;
      LODWORD(v536) = 0;
      LODWORD(v539) = 0;
      v554 = 0;
      v557 = 0;
      LODWORD(v540) = 0;
      LODWORD(v546) = 0;
      v560 = 0;
      LODWORD(v547) = 0;
      v572 = 0;
      v573 = 0;
      v576 = 0;
      v585 = 0;
      v48 = 389.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v586) = 0;
  }
LABEL_753:
  v185 = __sb__runningInSpringBoard();
  if (v185)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v576) = 0;
      v585 = 0;
      goto LABEL_763;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v469 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v469, "userInterfaceIdiom"))
    {
      HIDWORD(v576) = 0;
      v585 = 1;
      goto LABEL_763;
    }
  }
  v585 = v185 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v186 = __sb__runningInSpringBoard();
    if (v186)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v460 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v460, "_referenceBounds");
    }
    HIDWORD(v576) = v186 ^ 1;
    BSSizeRoundForScale();
    if (v187 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_767;
  }
  else
  {
    HIDWORD(v576) = 0;
  }
LABEL_763:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    LODWORD(v512) = 0;
    LODWORD(v516) = 0;
    LODWORD(v517) = 0;
    LODWORD(v518) = 0;
    LODWORD(v523) = 0;
    LODWORD(v532) = 0;
    LODWORD(v524) = 0;
    LODWORD(v525) = 0;
    LODWORD(v526) = 0;
    LODWORD(v533) = 0;
    LODWORD(v534) = 0;
    LODWORD(v535) = 0;
    LODWORD(v544) = 0;
    LODWORD(v545) = 0;
    LODWORD(v536) = 0;
    LODWORD(v539) = 0;
    v554 = 0;
    v557 = 0;
    LODWORD(v540) = 0;
    LODWORD(v546) = 0;
    v560 = 0;
    LODWORD(v547) = 0;
    v572 = 0;
    v573 = 0;
    LODWORD(v576) = 0;
    v48 = 340.666666;
    goto LABEL_69;
  }
LABEL_767:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_771:
    HIDWORD(v573) = 0;
    LODWORD(v576) = 0;
    goto LABEL_865;
  }
  v188 = __sb__runningInSpringBoard();
  if (v188)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_771;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "userInterfaceIdiom"))
    {
      v500 = v36;
      HIDWORD(v573) = 0;
      LODWORD(v576) = 1;
      goto LABEL_865;
    }
  }
  LODWORD(v576) = v188 ^ 1;
  v500 = v36;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v205 = __sb__runningInSpringBoard();
    if (v205)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v443 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v443, "_referenceBounds");
    }
    HIDWORD(v573) = v205 ^ 1;
    BSSizeRoundForScale();
    if (v236 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      LODWORD(v512) = 0;
      LODWORD(v516) = 0;
      LODWORD(v517) = 0;
      LODWORD(v518) = 0;
      LODWORD(v523) = 0;
      LODWORD(v532) = 0;
      LODWORD(v524) = 0;
      LODWORD(v525) = 0;
      LODWORD(v526) = 0;
      LODWORD(v533) = 0;
      LODWORD(v534) = 0;
      LODWORD(v535) = 0;
      LODWORD(v544) = 0;
      LODWORD(v545) = 0;
      LODWORD(v536) = 0;
      LODWORD(v539) = 0;
      v554 = 0;
      v557 = 0;
      LODWORD(v540) = 0;
      LODWORD(v546) = 0;
      v560 = 0;
      LODWORD(v547) = 0;
      v572 = 0;
      LODWORD(v573) = 0;
      v48 = 380.0;
      goto LABEL_69;
    }
  }
  else
  {
    HIDWORD(v573) = 0;
  }
LABEL_865:
  v206 = __sb__runningInSpringBoard();
  v207 = &off_1D048E000;
  if (v206)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v572 = 0;
      LODWORD(v573) = 0;
      goto LABEL_875;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v465 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v465, "userInterfaceIdiom"))
    {
      v572 = 0;
      LODWORD(v573) = 1;
      goto LABEL_875;
    }
  }
  LODWORD(v573) = v206 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v208 = __sb__runningInSpringBoard();
    if (v208)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v451 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v451, "_referenceBounds");
    }
    v572 = v208 ^ 1;
    BSSizeRoundForScale();
    if (v209 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_879;
  }
  else
  {
    v572 = 0;
  }
LABEL_875:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    LODWORD(v512) = 0;
    LODWORD(v516) = 0;
    LODWORD(v517) = 0;
    LODWORD(v518) = 0;
    LODWORD(v523) = 0;
    LODWORD(v532) = 0;
    LODWORD(v524) = 0;
    LODWORD(v525) = 0;
    LODWORD(v526) = 0;
    LODWORD(v533) = 0;
    LODWORD(v534) = 0;
    LODWORD(v535) = 0;
    LODWORD(v544) = 0;
    LODWORD(v545) = 0;
    LODWORD(v536) = 0;
    LODWORD(v539) = 0;
    v554 = 0;
    v557 = 0;
    LODWORD(v540) = 0;
    LODWORD(v546) = 0;
    v560 = 0;
    LODWORD(v547) = 0;
    v48 = 332.666666;
    goto LABEL_69;
  }
LABEL_879:
  v210 = __sb__runningInSpringBoard();
  if (v210)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v547) = 0;
      HIDWORD(v560) = 0;
      goto LABEL_889;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v463 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v463, "userInterfaceIdiom"))
    {
      LODWORD(v547) = 0;
      HIDWORD(v560) = 1;
      goto LABEL_889;
    }
  }
  HIDWORD(v560) = v210 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v211 = __sb__runningInSpringBoard();
    if (v211)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v445 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v445, "_referenceBounds");
    }
    LODWORD(v547) = v211 ^ 1;
    BSSizeRoundForScale();
    if (v232 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      LODWORD(v512) = 0;
      LODWORD(v516) = 0;
      LODWORD(v517) = 0;
      LODWORD(v518) = 0;
      LODWORD(v523) = 0;
      LODWORD(v532) = 0;
      LODWORD(v524) = 0;
      LODWORD(v525) = 0;
      LODWORD(v526) = 0;
      LODWORD(v533) = 0;
      LODWORD(v534) = 0;
      LODWORD(v535) = 0;
      LODWORD(v544) = 0;
      LODWORD(v545) = 0;
      LODWORD(v536) = 0;
      LODWORD(v539) = 0;
      v554 = 0;
      v557 = 0;
      LODWORD(v540) = 0;
      LODWORD(v546) = 0;
      LODWORD(v560) = 0;
      v48 = 380.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v547) = 0;
  }
LABEL_889:
  v212 = __sb__runningInSpringBoard();
  if (v212)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v557) = 0;
      LODWORD(v560) = 0;
      goto LABEL_1001;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v458 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v458, "userInterfaceIdiom"))
    {
      HIDWORD(v557) = 0;
      LODWORD(v560) = 1;
      goto LABEL_1001;
    }
  }
  LODWORD(v560) = v212 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v229 = __sb__runningInSpringBoard();
    if (v229)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v442 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v442, "_referenceBounds");
    }
    HIDWORD(v557) = v229 ^ 1;
    BSSizeRoundForScale();
    if (v240 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_1047;
  }
  else
  {
    HIDWORD(v557) = 0;
  }
LABEL_1001:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    LODWORD(v512) = 0;
    LODWORD(v516) = 0;
    LODWORD(v517) = 0;
    LODWORD(v518) = 0;
    LODWORD(v523) = 0;
    LODWORD(v532) = 0;
    LODWORD(v524) = 0;
    LODWORD(v525) = 0;
    LODWORD(v526) = 0;
    LODWORD(v533) = 0;
    LODWORD(v534) = 0;
    LODWORD(v535) = 0;
    LODWORD(v544) = 0;
    LODWORD(v545) = 0;
    LODWORD(v536) = 0;
    LODWORD(v539) = 0;
    v554 = 0;
    LODWORD(v557) = 0;
    LODWORD(v540) = 0;
    LODWORD(v546) = 0;
    v48 = 332.666666;
    goto LABEL_69;
  }
LABEL_1047:
  v241 = __sb__runningInSpringBoard();
  if (v241)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v540) = 0;
      LODWORD(v546) = 0;
      goto LABEL_1081;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v455 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v455, "userInterfaceIdiom"))
    {
      LODWORD(v540) = 0;
      LODWORD(v546) = 1;
      goto LABEL_1081;
    }
  }
  LODWORD(v546) = v241 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v248 = __sb__runningInSpringBoard();
    if (v248)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v435 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v435, "_referenceBounds");
    }
    LODWORD(v540) = v248 ^ 1;
    BSSizeRoundForScale();
    if (v261 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      LODWORD(v512) = 0;
      LODWORD(v516) = 0;
      LODWORD(v517) = 0;
      LODWORD(v518) = 0;
      LODWORD(v523) = 0;
      LODWORD(v532) = 0;
      LODWORD(v524) = 0;
      LODWORD(v525) = 0;
      LODWORD(v526) = 0;
      LODWORD(v533) = 0;
      LODWORD(v534) = 0;
      LODWORD(v535) = 0;
      LODWORD(v544) = 0;
      LODWORD(v545) = 0;
      LODWORD(v536) = 0;
      LODWORD(v539) = 0;
      v554 = 0;
      LODWORD(v557) = 0;
      v48 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v540) = 0;
  }
LABEL_1081:
  v249 = __sb__runningInSpringBoard();
  if (v249)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v554 = 0;
      LODWORD(v557) = 0;
      goto LABEL_1121;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v449 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v449, "userInterfaceIdiom"))
    {
      v554 = 0;
      LODWORD(v557) = 1;
      goto LABEL_1121;
    }
  }
  LODWORD(v557) = v249 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v257 = __sb__runningInSpringBoard();
    if (v257)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v433 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v433, "_referenceBounds");
    }
    v554 = v257 ^ 1;
    BSSizeRoundForScale();
    if (v265 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1163;
  }
  else
  {
    v554 = 0;
  }
LABEL_1121:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    LODWORD(v512) = 0;
    LODWORD(v516) = 0;
    LODWORD(v517) = 0;
    LODWORD(v518) = 0;
    LODWORD(v523) = 0;
    LODWORD(v532) = 0;
    LODWORD(v524) = 0;
    LODWORD(v525) = 0;
    LODWORD(v526) = 0;
    LODWORD(v533) = 0;
    LODWORD(v534) = 0;
    LODWORD(v535) = 0;
    LODWORD(v544) = 0;
    LODWORD(v545) = 0;
    LODWORD(v536) = 0;
    LODWORD(v539) = 0;
    v48 = 0.0;
    goto LABEL_69;
  }
LABEL_1163:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1167:
    LODWORD(v536) = 0;
    LODWORD(v539) = 0;
    goto LABEL_1201;
  }
  v266 = __sb__runningInSpringBoard();
  if (v266)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1167;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v440 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v440, "userInterfaceIdiom"))
    {
      LODWORD(v536) = 0;
      LODWORD(v539) = 1;
      goto LABEL_1201;
    }
  }
  LODWORD(v539) = v266 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v273 = __sb__runningInSpringBoard();
    if (v273)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v421 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v421, "_referenceBounds");
    }
    BSSizeRoundForScale();
    LODWORD(v536) = v273 ^ 1;
    if (v291 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      LODWORD(v512) = 0;
      LODWORD(v516) = 0;
      LODWORD(v517) = 0;
      LODWORD(v518) = 0;
      LODWORD(v523) = 0;
      LODWORD(v532) = 0;
      LODWORD(v524) = 0;
      LODWORD(v525) = 0;
      LODWORD(v526) = 0;
      LODWORD(v533) = 0;
      LODWORD(v534) = 0;
      LODWORD(v535) = 0;
      LODWORD(v544) = 0;
      LODWORD(v545) = 0;
      v48 = 374.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v536) = 0;
  }
LABEL_1201:
  v274 = __sb__runningInSpringBoard();
  if (v274)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v544) = 0;
      LODWORD(v545) = 0;
      goto LABEL_1211;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v447 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v447, "userInterfaceIdiom"))
    {
      LODWORD(v544) = 0;
      LODWORD(v545) = 1;
      goto LABEL_1211;
    }
  }
  LODWORD(v545) = v274 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v275 = __sb__runningInSpringBoard();
    if (v275)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v428 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v428, "_referenceBounds");
    }
    LODWORD(v544) = v275 ^ 1;
    BSSizeRoundForScale();
    if (v276 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_1215;
  }
  else
  {
    LODWORD(v544) = 0;
  }
LABEL_1211:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    LODWORD(v512) = 0;
    LODWORD(v516) = 0;
    LODWORD(v517) = 0;
    LODWORD(v518) = 0;
    LODWORD(v523) = 0;
    LODWORD(v532) = 0;
    LODWORD(v524) = 0;
    LODWORD(v525) = 0;
    LODWORD(v526) = 0;
    LODWORD(v533) = 0;
    LODWORD(v534) = 0;
    LODWORD(v535) = 0;
    v48 = 306.0;
    goto LABEL_69;
  }
LABEL_1215:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1219:
    LODWORD(v534) = 0;
    LODWORD(v535) = 0;
    goto LABEL_1313;
  }
  v277 = __sb__runningInSpringBoard();
  if (v277)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1219;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v207 = (char *__ptr32 *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v207, "userInterfaceIdiom"))
    {
      v436 = v207;
      LODWORD(v534) = 0;
      LODWORD(v535) = 1;
      goto LABEL_1313;
    }
  }
  LODWORD(v535) = v277 ^ 1;
  v436 = v207;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v295 = __sb__runningInSpringBoard();
    if (v295)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v413 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v413, "_referenceBounds");
    }
    BSSizeRoundForScale();
    LODWORD(v534) = v295 ^ 1;
    if (v331 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      LODWORD(v512) = 0;
      LODWORD(v516) = 0;
      LODWORD(v517) = 0;
      LODWORD(v518) = 0;
      LODWORD(v523) = 0;
      LODWORD(v532) = 0;
      LODWORD(v524) = 0;
      LODWORD(v525) = 0;
      LODWORD(v526) = 0;
      LODWORD(v533) = 0;
      v48 = 366.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v534) = 0;
  }
LABEL_1313:
  v296 = __sb__runningInSpringBoard();
  if (v296)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v526) = 0;
      LODWORD(v533) = 0;
      goto LABEL_1323;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v438 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v438, "userInterfaceIdiom"))
    {
      LODWORD(v526) = 0;
      LODWORD(v533) = 1;
      goto LABEL_1323;
    }
  }
  LODWORD(v533) = v296 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v297 = __sb__runningInSpringBoard();
    if (v297)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v419 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v419, "_referenceBounds");
    }
    LODWORD(v526) = v297 ^ 1;
    BSSizeRoundForScale();
    if (v298 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1327;
  }
  else
  {
    LODWORD(v526) = 0;
  }
LABEL_1323:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    LODWORD(v512) = 0;
    LODWORD(v516) = 0;
    LODWORD(v517) = 0;
    LODWORD(v518) = 0;
    LODWORD(v523) = 0;
    LODWORD(v532) = 0;
    LODWORD(v524) = 0;
    LODWORD(v525) = 0;
    v48 = 300.0;
    goto LABEL_69;
  }
LABEL_1327:
  v299 = __sb__runningInSpringBoard();
  if (v299)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v524) = 0;
      LODWORD(v525) = 0;
      goto LABEL_1337;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v431 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v431, "userInterfaceIdiom"))
    {
      LODWORD(v524) = 0;
      LODWORD(v525) = 1;
      goto LABEL_1337;
    }
  }
  LODWORD(v525) = v299 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v300 = __sb__runningInSpringBoard();
    if (v300)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v415 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v415, "_referenceBounds");
    }
    LODWORD(v524) = v300 ^ 1;
    BSSizeRoundForScale();
    if (v327 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      LODWORD(v512) = 0;
      LODWORD(v516) = 0;
      LODWORD(v517) = 0;
      LODWORD(v518) = 0;
      LODWORD(v523) = 0;
      LODWORD(v532) = 0;
      v48 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v524) = 0;
  }
LABEL_1337:
  v301 = __sb__runningInSpringBoard();
  if (v301)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v302 = 0;
      LODWORD(v532) = 0;
      goto LABEL_1449;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v426 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v426, "userInterfaceIdiom"))
    {
      v302 = 0;
      LODWORD(v532) = 1;
      goto LABEL_1449;
    }
  }
  LODWORD(v532) = v301 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v323 = __sb__runningInSpringBoard();
    if (v323)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v412, "_referenceBounds");
    }
    v302 = v323 ^ 1;
    BSSizeRoundForScale();
    if (v335 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1495;
  }
  else
  {
    v302 = 0;
  }
LABEL_1449:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v523) = v302;
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    LODWORD(v512) = 0;
    LODWORD(v516) = 0;
    LODWORD(v517) = 0;
    LODWORD(v518) = 0;
    v48 = 0.0;
    goto LABEL_69;
  }
LABEL_1495:
  LODWORD(v523) = v302;
  v336 = __sb__runningInSpringBoard();
  if (v336)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v517) = 0;
      LODWORD(v518) = 0;
      goto LABEL_1529;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v423 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v423, "userInterfaceIdiom"))
    {
      LODWORD(v517) = 0;
      LODWORD(v518) = 1;
      goto LABEL_1529;
    }
  }
  LODWORD(v518) = v336 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v343 = __sb__runningInSpringBoard();
    if (v343)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v410 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v410, "_referenceBounds");
    }
    LODWORD(v517) = v343 ^ 1;
    BSSizeRoundForScale();
    if (v352 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      LODWORD(v512) = 0;
      LODWORD(v516) = 0;
      v48 = 366.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v517) = 0;
  }
LABEL_1529:
  v344 = __sb__runningInSpringBoard();
  if (v344)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v512) = 0;
      LODWORD(v516) = 0;
      goto LABEL_1569;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v417 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v417, "userInterfaceIdiom"))
    {
      LODWORD(v512) = 0;
      LODWORD(v516) = 1;
      goto LABEL_1569;
    }
  }
  LODWORD(v516) = v344 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    LODWORD(v512) = 0;
    goto LABEL_1569;
  }
  v349 = __sb__runningInSpringBoard();
  if (v349)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v408 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v408, "_referenceBounds");
  }
  LODWORD(v512) = v349 ^ 1;
  BSSizeRoundForScale();
  if (v356 < *(double *)(MEMORY[0x1E0DAB260] + 104))
  {
LABEL_1569:
    if ((_SBF_Private_IsD53() & 1) != 0)
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      v48 = 300.0;
      goto LABEL_69;
    }
  }
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
    goto LABEL_1608;
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
    goto LABEL_1610;
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
LABEL_1608:
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    v48 = 375.0;
    goto LABEL_69;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
LABEL_1610:
    v502 = 0;
    v503 = 0;
    LODWORD(v504) = 0;
    LODWORD(v505) = 0;
    LODWORD(v508) = 0;
    LODWORD(v509) = 0;
    LODWORD(v510) = 0;
    v48 = 320.0;
    goto LABEL_69;
  }
  v360 = __sb__runningInSpringBoard();
  if (v360)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v509) = 0;
      LODWORD(v510) = 0;
      goto LABEL_1669;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v499 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v499, "userInterfaceIdiom"))
    {
      LODWORD(v509) = 0;
      LODWORD(v510) = 1;
      goto LABEL_1669;
    }
  }
  LODWORD(v510) = v360 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v363 = __sb__runningInSpringBoard();
    if (v363)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v496 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v496, "_referenceBounds");
    }
    LODWORD(v509) = v363 ^ 1;
    BSSizeRoundForScale();
    if (v387 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      v48 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v509) = 0;
  }
LABEL_1669:
  v364 = __sb__runningInSpringBoard();
  if (v364)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v505) = 0;
      LODWORD(v508) = 0;
      goto LABEL_1709;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v498 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v498, "userInterfaceIdiom"))
    {
      LODWORD(v505) = 0;
      LODWORD(v508) = 1;
      goto LABEL_1709;
    }
  }
  LODWORD(v508) = v364 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v370 = __sb__runningInSpringBoard();
    if (v370)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v495 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v495, "_referenceBounds");
    }
    LODWORD(v505) = v370 ^ 1;
    BSSizeRoundForScale();
    if (v391 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v502 = 0;
      v503 = 0;
      LODWORD(v504) = 0;
      v48 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v505) = 0;
  }
LABEL_1709:
  v371 = __sb__runningInSpringBoard();
  if (!v371)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v497 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v497, "userInterfaceIdiom"))
    {
      HIDWORD(v503) = 0;
      LODWORD(v504) = 1;
      goto LABEL_1749;
    }
LABEL_1745:
    LODWORD(v504) = v371 ^ 1;
    v376 = __sb__runningInSpringBoard();
    if (v376)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v402 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v402, "_referenceBounds");
    }
    HIDWORD(v503) = v376 ^ 1;
    BSSizeRoundForScale();
    if (v377 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      goto LABEL_1752;
    goto LABEL_1749;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_1745;
  HIDWORD(v503) = 0;
  LODWORD(v504) = 0;
LABEL_1749:
  v378 = __sb__runningInSpringBoard();
  if (v378)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1752:
      v502 = 0;
      LODWORD(v503) = 0;
      v48 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v403 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v403, "userInterfaceIdiom"))
    {
      v502 = 0;
      v48 = 0.0;
      LODWORD(v503) = 1;
      goto LABEL_69;
    }
  }
  LODWORD(v503) = v378 ^ 1;
  v395 = __sb__runningInSpringBoard();
  if (v395)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v401 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v401, "_referenceBounds");
  }
  v502 = v395 ^ 1;
  BSSizeRoundForScale();
  v48 = 0.0;
LABEL_69:
  v56 = __sb__runningInSpringBoard();
  v600 = v14;
  if (v56)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v57 = 0;
      v58 = 0;
      goto LABEL_78;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v493 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v493, "userInterfaceIdiom") != 1)
    {
      v57 = 0;
      v58 = 1;
      goto LABEL_78;
    }
  }
  v58 = v56 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v476 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v476, "_referenceBounds");
    }
    v57 = v59 ^ 1;
    BSSizeRoundForScale();
    if (v77 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v76 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      HIDWORD(v598[2]) = v59 ^ 1;
      LODWORD(v598[3]) = v58;
      v566 = 0;
      v563 = 0;
      v569 = 0;
      LODWORD(v553) = 0;
      LODWORD(v543) = 0;
      v579 = 0;
      LODWORD(v552) = 0;
      LODWORD(v551) = 0;
      LODWORD(v550) = 0;
      LODWORD(v538) = 0;
      v582 = 0;
      LODWORD(v549) = 0;
      v589 = 0;
      LODWORD(v548) = 0;
      LODWORD(v537) = 0;
      LODWORD(v531) = 0;
      LODWORD(v542) = 0;
      v592 = 0;
      LODWORD(v541) = 0;
      LODWORD(v530) = 0;
      LODWORD(v529) = 0;
      LODWORD(v528) = 0;
      v595 = 0;
      LODWORD(v522) = 0;
      LODWORD(v521) = 0;
      LODWORD(v520) = 0;
      LODWORD(v527) = 0;
      memset(v598, 0, 20);
      LODWORD(v519) = 0;
      LODWORD(v515) = 0;
      LODWORD(v514) = 0;
      LODWORD(v513) = 0;
      LODWORD(v511) = 0;
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    v57 = 0;
  }
LABEL_78:
  v60 = __sb__runningInSpringBoard();
  HIDWORD(v598[2]) = v57;
  LODWORD(v598[3]) = v58;
  if (v60)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v61 = 0;
      v62 = 0;
      goto LABEL_87;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v491 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v491, "userInterfaceIdiom") != 1)
    {
      v61 = 0;
      v62 = 1;
      goto LABEL_87;
    }
  }
  v62 = v60 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v474 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v474, "_referenceBounds");
    }
    v61 = v59 ^ 1;
    BSSizeRoundForScale();
    if (v78 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      HIDWORD(v598[1]) = v59 ^ 1;
      LODWORD(v598[2]) = v62;
      v566 = 0;
      v563 = 0;
      v569 = 0;
      LODWORD(v553) = 0;
      LODWORD(v543) = 0;
      v579 = 0;
      LODWORD(v552) = 0;
      LODWORD(v551) = 0;
      LODWORD(v550) = 0;
      LODWORD(v538) = 0;
      v582 = 0;
      LODWORD(v549) = 0;
      v589 = 0;
      LODWORD(v548) = 0;
      LODWORD(v537) = 0;
      LODWORD(v531) = 0;
      LODWORD(v542) = 0;
      v592 = 0;
      LODWORD(v541) = 0;
      LODWORD(v530) = 0;
      LODWORD(v529) = 0;
      LODWORD(v528) = 0;
      v595 = 0;
      LODWORD(v522) = 0;
      LODWORD(v521) = 0;
      LODWORD(v520) = 0;
      LODWORD(v527) = 0;
      v598[0] = 0;
      LODWORD(v519) = 0;
      LODWORD(v515) = 0;
      LODWORD(v514) = 0;
      LODWORD(v513) = 0;
      LODWORD(v598[1]) = 0;
      LODWORD(v511) = 0;
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    v61 = 0;
  }
LABEL_87:
  v63 = __sb__runningInSpringBoard();
  HIDWORD(v598[1]) = v61;
  LODWORD(v598[2]) = v62;
  if (v63)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v31 = 0;
      v64 = 0;
      goto LABEL_96;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v489 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v489, "userInterfaceIdiom") != 1)
    {
      v31 = 0;
      v64 = 1;
      goto LABEL_96;
    }
  }
  v64 = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v472 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v472, "_referenceBounds");
    }
    v31 = v59 ^ 1;
    BSSizeRoundForScale();
    if (v79 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      HIDWORD(v598[0]) = v59 ^ 1;
      LODWORD(v598[1]) = v64;
      v566 = 0;
      v563 = 0;
      v569 = 0;
      LODWORD(v553) = 0;
      LODWORD(v543) = 0;
      v579 = 0;
      LODWORD(v552) = 0;
      LODWORD(v551) = 0;
      LODWORD(v550) = 0;
      LODWORD(v538) = 0;
      v582 = 0;
      LODWORD(v549) = 0;
      v589 = 0;
      LODWORD(v548) = 0;
      LODWORD(v537) = 0;
      LODWORD(v531) = 0;
      LODWORD(v542) = 0;
      v592 = 0;
      LODWORD(v541) = 0;
      LODWORD(v530) = 0;
      LODWORD(v529) = 0;
      LODWORD(v528) = 0;
      v595 = 0;
      LODWORD(v522) = 0;
      LODWORD(v521) = 0;
      LODWORD(v520) = 0;
      LODWORD(v527) = 0;
      LODWORD(v598[0]) = 0;
      LODWORD(v519) = 0;
      LODWORD(v515) = 0;
      LODWORD(v514) = 0;
      LODWORD(v513) = 0;
      LODWORD(v511) = 0;
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    v31 = 0;
  }
LABEL_96:
  v65 = __sb__runningInSpringBoard();
  HIDWORD(v598[0]) = v31;
  LODWORD(v598[1]) = v64;
  if (v65)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v595) = 0;
      LODWORD(v598[0]) = 0;
      goto LABEL_105;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v487 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v487, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v595) = 0;
      LODWORD(v598[0]) = 1;
      goto LABEL_105;
    }
  }
  LODWORD(v598[0]) = v65 ^ 1;
  v59 = __sb__runningInSpringBoard();
  if ((_DWORD)v59)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v481 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v481, "_referenceBounds");
  }
  HIDWORD(v595) = v59 ^ 1;
  BSSizeRoundForScale();
  if (v66 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v566 = 0;
    v563 = 0;
    v569 = 0;
    LODWORD(v553) = 0;
    LODWORD(v543) = 0;
    v579 = 0;
    LODWORD(v552) = 0;
    LODWORD(v551) = 0;
    LODWORD(v550) = 0;
    LODWORD(v538) = 0;
    v582 = 0;
    LODWORD(v549) = 0;
    v589 = 0;
    LODWORD(v548) = 0;
    LODWORD(v537) = 0;
    LODWORD(v531) = 0;
    LODWORD(v542) = 0;
    v592 = 0;
    LODWORD(v541) = 0;
    LODWORD(v530) = 0;
    LODWORD(v529) = 0;
    LODWORD(v528) = 0;
    LODWORD(v595) = 0;
    LODWORD(v522) = 0;
    LODWORD(v521) = 0;
    LODWORD(v520) = 0;
    LODWORD(v527) = 0;
    LODWORD(v519) = 0;
    LODWORD(v515) = 0;
    LODWORD(v514) = 0;
    LODWORD(v513) = 0;
    LODWORD(v511) = 0;
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0.0;
    goto LABEL_132;
  }
LABEL_105:
  v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v592) = 0;
      LODWORD(v595) = 0;
      goto LABEL_115;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v485 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v485, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v592) = 0;
      LODWORD(v595) = 1;
      goto LABEL_115;
    }
  }
  LODWORD(v595) = v67 ^ 1;
  v59 = __sb__runningInSpringBoard();
  if ((_DWORD)v59)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v477 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v477, "_referenceBounds");
  }
  HIDWORD(v592) = v59 ^ 1;
  BSSizeRoundForScale();
  if (v74 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v566 = 0;
    v563 = 0;
    v569 = 0;
    LODWORD(v553) = 0;
    LODWORD(v543) = 0;
    v579 = 0;
    LODWORD(v552) = 0;
    LODWORD(v551) = 0;
    LODWORD(v550) = 0;
    LODWORD(v538) = 0;
    v582 = 0;
    LODWORD(v549) = 0;
    v589 = 0;
    LODWORD(v548) = 0;
    LODWORD(v537) = 0;
    LODWORD(v531) = 0;
    LODWORD(v542) = 0;
    LODWORD(v592) = 0;
    LODWORD(v541) = 0;
    LODWORD(v530) = 0;
    LODWORD(v529) = 0;
    LODWORD(v528) = 0;
    LODWORD(v522) = 0;
    LODWORD(v521) = 0;
    LODWORD(v520) = 0;
    LODWORD(v527) = 0;
    LODWORD(v519) = 0;
    LODWORD(v515) = 0;
    LODWORD(v514) = 0;
    LODWORD(v513) = 0;
    LODWORD(v511) = 0;
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0.0;
    goto LABEL_132;
  }
LABEL_115:
  v75 = __sb__runningInSpringBoard();
  if (v75)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v589) = 0;
      LODWORD(v592) = 0;
      goto LABEL_704;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v483 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v483, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v589) = 0;
      LODWORD(v592) = 1;
      goto LABEL_704;
    }
  }
  LODWORD(v592) = v75 ^ 1;
  v59 = __sb__runningInSpringBoard();
  if ((_DWORD)v59)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v470 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v470, "_referenceBounds");
  }
  HIDWORD(v589) = v59 ^ 1;
  BSSizeRoundForScale();
  if (v176 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v566 = 0;
    v563 = 0;
    v569 = 0;
    LODWORD(v553) = 0;
    LODWORD(v543) = 0;
    v579 = 0;
    LODWORD(v552) = 0;
    LODWORD(v551) = 0;
    LODWORD(v550) = 0;
    LODWORD(v538) = 0;
    v582 = 0;
    LODWORD(v549) = 0;
    LODWORD(v589) = 0;
    LODWORD(v548) = 0;
    LODWORD(v537) = 0;
    LODWORD(v531) = 0;
    LODWORD(v542) = 0;
    LODWORD(v541) = 0;
    LODWORD(v530) = 0;
    LODWORD(v529) = 0;
    LODWORD(v528) = 0;
    LODWORD(v522) = 0;
    LODWORD(v521) = 0;
    LODWORD(v520) = 0;
    LODWORD(v527) = 0;
    LODWORD(v519) = 0;
    LODWORD(v515) = 0;
    LODWORD(v514) = 0;
    LODWORD(v513) = 0;
    LODWORD(v511) = 0;
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0.0;
    goto LABEL_132;
  }
LABEL_704:
  v59 = __sb__runningInSpringBoard();
  if ((_DWORD)v59)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_706;
LABEL_712:
    v566 = 0;
    v563 = 0;
    v569 = 0;
    LODWORD(v553) = 0;
    LODWORD(v543) = 0;
    v579 = 0;
    LODWORD(v552) = 0;
    LODWORD(v551) = 0;
    LODWORD(v550) = 0;
    LODWORD(v538) = 0;
    v582 = 0;
    LODWORD(v549) = 0;
    LODWORD(v548) = 0;
    LODWORD(v537) = 0;
    LODWORD(v531) = 0;
    LODWORD(v542) = 0;
    LODWORD(v541) = 0;
    LODWORD(v530) = 0;
    LODWORD(v529) = 0;
    LODWORD(v528) = 0;
    LODWORD(v522) = 0;
    LODWORD(v521) = 0;
    LODWORD(v520) = 0;
    LODWORD(v527) = 0;
    LODWORD(v519) = 0;
    LODWORD(v515) = 0;
    LODWORD(v514) = 0;
    LODWORD(v513) = 0;
    LODWORD(v511) = 0;
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0.0;
    LODWORD(v589) = v59 ^ 1;
    goto LABEL_132;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v479 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v479, "userInterfaceIdiom") == 1)
    goto LABEL_712;
LABEL_706:
  LODWORD(v589) = v59 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_710:
    HIDWORD(v579) = 0;
    v582 = 0;
    goto LABEL_778;
  }
  v177 = __sb__runningInSpringBoard();
  if (v177)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_710;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v466 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v466, "userInterfaceIdiom"))
    {
      HIDWORD(v579) = 0;
      v582 = 1;
      goto LABEL_778;
    }
  }
  v582 = v177 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v452 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v452, "_referenceBounds");
    }
    HIDWORD(v579) = v59 ^ 1;
    BSSizeRoundForScale();
    if (v202 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v566 = 0;
      v563 = 0;
      v569 = 0;
      LODWORD(v553) = 0;
      LODWORD(v543) = 0;
      LODWORD(v579) = 0;
      LODWORD(v552) = 0;
      LODWORD(v551) = 0;
      LODWORD(v550) = 0;
      LODWORD(v538) = 0;
      LODWORD(v549) = 0;
      LODWORD(v548) = 0;
      LODWORD(v537) = 0;
      LODWORD(v531) = 0;
      LODWORD(v542) = 0;
      LODWORD(v541) = 0;
      LODWORD(v530) = 0;
      LODWORD(v529) = 0;
      LODWORD(v528) = 0;
      LODWORD(v522) = 0;
      LODWORD(v521) = 0;
      LODWORD(v520) = 0;
      LODWORD(v527) = 0;
      LODWORD(v519) = 0;
      LODWORD(v515) = 0;
      LODWORD(v514) = 0;
      LODWORD(v513) = 0;
      LODWORD(v511) = 0;
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 579.66666;
      goto LABEL_132;
    }
  }
  else
  {
    HIDWORD(v579) = 0;
  }
LABEL_778:
  v59 = __sb__runningInSpringBoard();
  if ((_DWORD)v59)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v569 = 0;
      LODWORD(v579) = 0;
      goto LABEL_788;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v468 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v468, "userInterfaceIdiom"))
    {
      v569 = 0;
      LODWORD(v579) = 1;
      goto LABEL_788;
    }
  }
  LODWORD(v579) = v59 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v459 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v459, "_referenceBounds");
    }
    v569 = v59 ^ 1;
    BSSizeRoundForScale();
    if (v189 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_792;
  }
  else
  {
    v569 = 0;
  }
LABEL_788:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    v566 = 0;
    v563 = 0;
    LODWORD(v553) = 0;
    LODWORD(v543) = 0;
    LODWORD(v552) = 0;
    LODWORD(v551) = 0;
    LODWORD(v550) = 0;
    LODWORD(v538) = 0;
    LODWORD(v549) = 0;
    LODWORD(v548) = 0;
    LODWORD(v537) = 0;
    LODWORD(v531) = 0;
    LODWORD(v542) = 0;
    LODWORD(v541) = 0;
    LODWORD(v530) = 0;
    LODWORD(v529) = 0;
    LODWORD(v528) = 0;
    LODWORD(v522) = 0;
    LODWORD(v521) = 0;
    LODWORD(v520) = 0;
    LODWORD(v527) = 0;
    LODWORD(v519) = 0;
    LODWORD(v515) = 0;
    LODWORD(v514) = 0;
    LODWORD(v513) = 0;
    LODWORD(v511) = 0;
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 507.66666;
    goto LABEL_132;
  }
LABEL_792:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_796:
    v566 = 0;
    goto LABEL_899;
  }
  v190 = __sb__runningInSpringBoard();
  if (v190)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_796;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v461 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v461, "userInterfaceIdiom"))
    {
      v566 = 0x100000000;
      goto LABEL_899;
    }
  }
  HIDWORD(v566) = v190 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v31, "_referenceBounds");
    }
    v456 = (void *)v31;
    LODWORD(v566) = v59 ^ 1;
    BSSizeRoundForScale();
    if (v237 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v563 = 0;
      LODWORD(v553) = 0;
      LODWORD(v543) = 0;
      LODWORD(v552) = 0;
      LODWORD(v551) = 0;
      LODWORD(v550) = 0;
      LODWORD(v538) = 0;
      LODWORD(v549) = 0;
      LODWORD(v548) = 0;
      LODWORD(v537) = 0;
      LODWORD(v531) = 0;
      LODWORD(v542) = 0;
      LODWORD(v541) = 0;
      LODWORD(v530) = 0;
      LODWORD(v529) = 0;
      LODWORD(v528) = 0;
      LODWORD(v522) = 0;
      LODWORD(v521) = 0;
      LODWORD(v520) = 0;
      LODWORD(v527) = 0;
      LODWORD(v519) = 0;
      LODWORD(v515) = 0;
      LODWORD(v514) = 0;
      LODWORD(v513) = 0;
      LODWORD(v511) = 0;
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 565.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v566) = 0;
  }
LABEL_899:
  v59 = __sb__runningInSpringBoard();
  v31 = (uint64_t)&off_1D048E000;
  if ((_DWORD)v59)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v563 = 0;
      goto LABEL_909;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v464 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v464, "userInterfaceIdiom"))
    {
      v563 = 0x100000000;
      goto LABEL_909;
    }
  }
  HIDWORD(v563) = v59 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v450 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v450, "_referenceBounds");
    }
    LODWORD(v563) = v59 ^ 1;
    BSSizeRoundForScale();
    if (v213 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_913;
  }
  else
  {
    LODWORD(v563) = 0;
  }
LABEL_909:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    LODWORD(v553) = 0;
    LODWORD(v543) = 0;
    LODWORD(v552) = 0;
    LODWORD(v551) = 0;
    LODWORD(v550) = 0;
    LODWORD(v538) = 0;
    LODWORD(v549) = 0;
    LODWORD(v548) = 0;
    LODWORD(v537) = 0;
    LODWORD(v531) = 0;
    LODWORD(v542) = 0;
    LODWORD(v541) = 0;
    LODWORD(v530) = 0;
    LODWORD(v529) = 0;
    LODWORD(v528) = 0;
    LODWORD(v522) = 0;
    LODWORD(v521) = 0;
    LODWORD(v520) = 0;
    LODWORD(v527) = 0;
    LODWORD(v519) = 0;
    LODWORD(v515) = 0;
    LODWORD(v514) = 0;
    LODWORD(v513) = 0;
    LODWORD(v511) = 0;
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 495.0;
    goto LABEL_132;
  }
LABEL_913:
  v214 = __sb__runningInSpringBoard();
  if (v214)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v553) = 0;
      LODWORD(v543) = 0;
      goto LABEL_923;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v462 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v462, "userInterfaceIdiom"))
    {
      LODWORD(v543) = 0;
      LODWORD(v553) = 1;
      goto LABEL_923;
    }
  }
  LODWORD(v553) = v214 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v444 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v444, "_referenceBounds");
    }
    LODWORD(v543) = v59 ^ 1;
    BSSizeRoundForScale();
    if (v233 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      LODWORD(v552) = 0;
      LODWORD(v551) = 0;
      LODWORD(v550) = 0;
      LODWORD(v538) = 0;
      LODWORD(v549) = 0;
      LODWORD(v548) = 0;
      LODWORD(v537) = 0;
      LODWORD(v531) = 0;
      LODWORD(v542) = 0;
      LODWORD(v541) = 0;
      LODWORD(v530) = 0;
      LODWORD(v529) = 0;
      LODWORD(v528) = 0;
      LODWORD(v522) = 0;
      LODWORD(v521) = 0;
      LODWORD(v520) = 0;
      LODWORD(v527) = 0;
      LODWORD(v519) = 0;
      LODWORD(v515) = 0;
      LODWORD(v514) = 0;
      LODWORD(v513) = 0;
      LODWORD(v511) = 0;
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 565.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v543) = 0;
  }
LABEL_923:
  v59 = __sb__runningInSpringBoard();
  if ((_DWORD)v59)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v552) = 0;
      LODWORD(v551) = 0;
      goto LABEL_1007;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v457 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v457, "userInterfaceIdiom"))
    {
      LODWORD(v551) = 0;
      LODWORD(v552) = 1;
      goto LABEL_1007;
    }
  }
  LODWORD(v552) = v59 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v441 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v441, "_referenceBounds");
    }
    LODWORD(v551) = v59 ^ 1;
    BSSizeRoundForScale();
    if (v242 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_1055;
  }
  else
  {
    LODWORD(v551) = 0;
  }
LABEL_1007:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    LODWORD(v550) = 0;
    LODWORD(v538) = 0;
    LODWORD(v549) = 0;
    LODWORD(v548) = 0;
    LODWORD(v537) = 0;
    LODWORD(v531) = 0;
    LODWORD(v542) = 0;
    LODWORD(v541) = 0;
    LODWORD(v530) = 0;
    LODWORD(v529) = 0;
    LODWORD(v528) = 0;
    LODWORD(v522) = 0;
    LODWORD(v521) = 0;
    LODWORD(v520) = 0;
    LODWORD(v527) = 0;
    LODWORD(v519) = 0;
    LODWORD(v515) = 0;
    LODWORD(v514) = 0;
    LODWORD(v513) = 0;
    LODWORD(v511) = 0;
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 495.0;
    goto LABEL_132;
  }
LABEL_1055:
  v243 = __sb__runningInSpringBoard();
  if (v243)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v31 = 0;
      LODWORD(v538) = 0;
      goto LABEL_1091;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v454 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v454, "userInterfaceIdiom"))
    {
      LODWORD(v538) = 0;
      v31 = 1;
      goto LABEL_1091;
    }
  }
  v31 = v243 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v434 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v434, "_referenceBounds");
    }
    LODWORD(v538) = v59 ^ 1;
    BSSizeRoundForScale();
    if (v262 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      LODWORD(v550) = v31;
      LODWORD(v549) = 0;
      LODWORD(v548) = 0;
      LODWORD(v537) = 0;
      LODWORD(v531) = 0;
      LODWORD(v542) = 0;
      LODWORD(v541) = 0;
      LODWORD(v530) = 0;
      LODWORD(v529) = 0;
      LODWORD(v528) = 0;
      LODWORD(v522) = 0;
      LODWORD(v521) = 0;
      LODWORD(v520) = 0;
      LODWORD(v527) = 0;
      LODWORD(v519) = 0;
      LODWORD(v515) = 0;
      LODWORD(v514) = 0;
      LODWORD(v513) = 0;
      LODWORD(v511) = 0;
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v538) = 0;
  }
LABEL_1091:
  v250 = __sb__runningInSpringBoard();
  LODWORD(v550) = v31;
  if (v250)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v549) = 0;
      v59 = 0;
      goto LABEL_1128;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v448 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v448, "userInterfaceIdiom"))
    {
      v59 = 0;
      LODWORD(v549) = 1;
      goto LABEL_1128;
    }
  }
  LODWORD(v549) = v250 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v258 = __sb__runningInSpringBoard();
    if (v258)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v432 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v432, "_referenceBounds");
    }
    v59 = v258 ^ 1u;
    BSSizeRoundForScale();
    if (v267 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1172;
  }
  else
  {
    v59 = 0;
  }
LABEL_1128:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    LODWORD(v548) = v59;
    LODWORD(v537) = 0;
    LODWORD(v531) = 0;
    LODWORD(v542) = 0;
    LODWORD(v541) = 0;
    LODWORD(v530) = 0;
    LODWORD(v529) = 0;
    LODWORD(v528) = 0;
    LODWORD(v522) = 0;
    LODWORD(v521) = 0;
    LODWORD(v520) = 0;
    LODWORD(v527) = 0;
    LODWORD(v519) = 0;
    LODWORD(v515) = 0;
    LODWORD(v514) = 0;
    LODWORD(v513) = 0;
    LODWORD(v511) = 0;
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0.0;
    goto LABEL_132;
  }
LABEL_1172:
  LODWORD(v548) = v59;
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1176:
    LODWORD(v537) = 0;
    LODWORD(v531) = 0;
    goto LABEL_1226;
  }
  v268 = __sb__runningInSpringBoard();
  if (v268)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1176;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v439 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v439, "userInterfaceIdiom"))
    {
      LODWORD(v531) = 0;
      LODWORD(v537) = 1;
      goto LABEL_1226;
    }
  }
  LODWORD(v537) = v268 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v278 = __sb__runningInSpringBoard();
    if (v278)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v420 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v420, "_referenceBounds");
    }
    v59 = v278 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v531) = v59;
    if (v292 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      LODWORD(v542) = 0;
      LODWORD(v541) = 0;
      LODWORD(v530) = 0;
      LODWORD(v529) = 0;
      LODWORD(v528) = 0;
      LODWORD(v522) = 0;
      LODWORD(v521) = 0;
      LODWORD(v520) = 0;
      LODWORD(v527) = 0;
      LODWORD(v519) = 0;
      LODWORD(v515) = 0;
      LODWORD(v514) = 0;
      LODWORD(v513) = 0;
      LODWORD(v511) = 0;
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 579.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v531) = 0;
  }
LABEL_1226:
  v59 = __sb__runningInSpringBoard();
  if ((_DWORD)v59)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v542) = 0;
      LODWORD(v541) = 0;
      goto LABEL_1236;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v446 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v446, "userInterfaceIdiom"))
    {
      LODWORD(v541) = 0;
      LODWORD(v542) = 1;
      goto LABEL_1236;
    }
  }
  LODWORD(v542) = v59 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v427 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v427, "_referenceBounds");
    }
    LODWORD(v541) = v59 ^ 1;
    BSSizeRoundForScale();
    if (v279 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_1240;
  }
  else
  {
    LODWORD(v541) = 0;
  }
LABEL_1236:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v530) = 0;
    LODWORD(v529) = 0;
    LODWORD(v528) = 0;
    LODWORD(v522) = 0;
    LODWORD(v521) = 0;
    LODWORD(v520) = 0;
    LODWORD(v527) = 0;
    LODWORD(v519) = 0;
    LODWORD(v515) = 0;
    LODWORD(v514) = 0;
    LODWORD(v513) = 0;
    LODWORD(v511) = 0;
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 475.0;
    goto LABEL_132;
  }
LABEL_1240:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1244:
    LODWORD(v530) = 0;
    LODWORD(v529) = 0;
    goto LABEL_1347;
  }
  v280 = __sb__runningInSpringBoard();
  if (v280)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1244;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v429 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v429, "userInterfaceIdiom"))
    {
      LODWORD(v529) = 0;
      LODWORD(v530) = 1;
      goto LABEL_1347;
    }
  }
  LODWORD(v530) = v280 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v303 = __sb__runningInSpringBoard();
    if (v303)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v31, "_referenceBounds");
    }
    v424 = (void *)v31;
    v59 = v303 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v529) = v59;
    if (v332 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v528) = 0;
      LODWORD(v522) = 0;
      LODWORD(v521) = 0;
      LODWORD(v520) = 0;
      LODWORD(v527) = 0;
      LODWORD(v519) = 0;
      LODWORD(v515) = 0;
      LODWORD(v514) = 0;
      LODWORD(v513) = 0;
      LODWORD(v511) = 0;
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 567.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v529) = 0;
  }
LABEL_1347:
  v59 = __sb__runningInSpringBoard();
  v31 = (uint64_t)&off_1D048E000;
  if ((_DWORD)v59)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v528) = 0;
      LODWORD(v522) = 0;
      goto LABEL_1357;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v437 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v437, "userInterfaceIdiom"))
    {
      LODWORD(v522) = 0;
      LODWORD(v528) = 1;
      goto LABEL_1357;
    }
  }
  LODWORD(v528) = v59 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v418 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v418, "_referenceBounds");
    }
    LODWORD(v522) = v59 ^ 1;
    BSSizeRoundForScale();
    if (v304 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1361;
  }
  else
  {
    LODWORD(v522) = 0;
  }
LABEL_1357:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v521) = 0;
    LODWORD(v520) = 0;
    LODWORD(v527) = 0;
    LODWORD(v519) = 0;
    LODWORD(v515) = 0;
    LODWORD(v514) = 0;
    LODWORD(v513) = 0;
    LODWORD(v511) = 0;
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 465.33333;
    goto LABEL_132;
  }
LABEL_1361:
  v305 = __sb__runningInSpringBoard();
  if (v305)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v521) = 0;
      LODWORD(v520) = 0;
      goto LABEL_1371;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v430 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v430, "userInterfaceIdiom"))
    {
      LODWORD(v520) = 0;
      LODWORD(v521) = 1;
      goto LABEL_1371;
    }
  }
  LODWORD(v521) = v305 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v414 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v414, "_referenceBounds");
    }
    LODWORD(v520) = v59 ^ 1;
    BSSizeRoundForScale();
    if (v328 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      LODWORD(v527) = 0;
      LODWORD(v519) = 0;
      LODWORD(v515) = 0;
      LODWORD(v514) = 0;
      LODWORD(v513) = 0;
      LODWORD(v511) = 0;
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v520) = 0;
  }
LABEL_1371:
  v306 = __sb__runningInSpringBoard();
  if (v306)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v527) = 0;
      v59 = 0;
      goto LABEL_1455;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v425 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v425, "userInterfaceIdiom"))
    {
      v59 = 0;
      LODWORD(v527) = 1;
      goto LABEL_1455;
    }
  }
  LODWORD(v527) = v306 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v324 = __sb__runningInSpringBoard();
    if (v324)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v411 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v411, "_referenceBounds");
    }
    v59 = v324 ^ 1u;
    BSSizeRoundForScale();
    if (v337 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1503;
  }
  else
  {
    v59 = 0;
  }
LABEL_1455:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v519) = v59;
    LODWORD(v515) = 0;
    LODWORD(v514) = 0;
    LODWORD(v513) = 0;
    LODWORD(v511) = 0;
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0.0;
    goto LABEL_132;
  }
LABEL_1503:
  LODWORD(v519) = v59;
  v338 = __sb__runningInSpringBoard();
  if (v338)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v515) = 0;
      LODWORD(v514) = 0;
      goto LABEL_1539;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v422 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v422, "userInterfaceIdiom"))
    {
      LODWORD(v514) = 0;
      LODWORD(v515) = 1;
      goto LABEL_1539;
    }
  }
  LODWORD(v515) = v338 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v409 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v409, "_referenceBounds");
    }
    LODWORD(v514) = v59 ^ 1;
    BSSizeRoundForScale();
    if (v353 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v513) = 0;
      LODWORD(v511) = 0;
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 567.33;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v514) = 0;
  }
LABEL_1539:
  v59 = __sb__runningInSpringBoard();
  if ((_DWORD)v59)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v513) = 0;
      LODWORD(v511) = 0;
      goto LABEL_1575;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v416 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v416, "userInterfaceIdiom"))
    {
      LODWORD(v511) = 0;
      LODWORD(v513) = 1;
      goto LABEL_1575;
    }
  }
  LODWORD(v513) = v59 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    LODWORD(v511) = 0;
    goto LABEL_1575;
  }
  v59 = __sb__runningInSpringBoard();
  if ((_DWORD)v59)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v407 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v407, "_referenceBounds");
  }
  LODWORD(v511) = v59 ^ 1;
  BSSizeRoundForScale();
  if (v357 < *(double *)(MEMORY[0x1E0DAB260] + 104))
  {
LABEL_1575:
    if ((_SBF_Private_IsD53() & 1) != 0)
    {
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 465.33333;
      goto LABEL_132;
    }
  }
  v59 = (uint64_t)&off_1D048E000;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
    goto LABEL_1618;
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
    goto LABEL_1620;
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
LABEL_1618:
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 594.0;
    goto LABEL_132;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
LABEL_1620:
    LODWORD(v507) = 0;
    LODWORD(v506) = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 506.66666;
    goto LABEL_132;
  }
  v59 = __sb__runningInSpringBoard();
  if ((_DWORD)v59)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v507) = 0;
      LODWORD(v506) = 0;
      goto LABEL_1679;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v406, "userInterfaceIdiom"))
    {
      LODWORD(v506) = 0;
      LODWORD(v507) = 1;
      goto LABEL_1679;
    }
  }
  LODWORD(v507) = v59 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v365 = __sb__runningInSpringBoard();
    if (v365)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v400, "_referenceBounds");
    }
    LODWORD(v506) = v365 ^ 1;
    BSSizeRoundForScale();
    if (v388 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v506) = 0;
  }
LABEL_1679:
  v59 = __sb__runningInSpringBoard();
  if ((_DWORD)v59)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v68 = 0;
      v69 = 0;
      goto LABEL_1719;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v405 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v405, "userInterfaceIdiom"))
    {
      v69 = 0;
      v68 = 1;
      goto LABEL_1719;
    }
  }
  v68 = v59 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v59 = __sb__runningInSpringBoard();
    if ((_DWORD)v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v399 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v399, "_referenceBounds");
    }
    v69 = v59 ^ 1;
    BSSizeRoundForScale();
    if (v392 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    v69 = 0;
  }
LABEL_1719:
  v31 = __sb__runningInSpringBoard();
  if (!(_DWORD)v31)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v404 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v404, "userInterfaceIdiom"))
    {
      v71 = 0;
      v70 = 1;
      goto LABEL_1759;
    }
LABEL_1755:
    v70 = v31 ^ 1;
    v31 = __sb__runningInSpringBoard();
    if ((_DWORD)v31)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v59 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v59, "_referenceBounds");
    }
    v71 = v31 ^ 1;
    BSSizeRoundForScale();
    if (v379 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      goto LABEL_1762;
    goto LABEL_1759;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_1755;
  v70 = 0;
  v71 = 0;
LABEL_1759:
  v380 = __sb__runningInSpringBoard();
  if ((_DWORD)v380)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1762:
      v72 = 0;
      v73 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v31 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v31, "userInterfaceIdiom"))
    {
      v73 = 0.0;
      v72 = 1;
      goto LABEL_132;
    }
  }
  v72 = v380 ^ 1;
  v396 = __sb__runningInSpringBoard();
  if (v396)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v380 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v380, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v73 = 0.0;
  if (v396 != 1)

LABEL_132:
  if (v72)

  if (v71)
  v80 = (void *)0x1E0CEA000;
  if (v70)

  v81 = (uint64_t)v500;
  if (v69)

  if (v68)
  if ((_DWORD)v506)

  if ((_DWORD)v507)
  if ((_DWORD)v511)

  if ((_DWORD)v513)
  if ((_DWORD)v514)

  if ((_DWORD)v515)
  if ((_DWORD)v519)

  if ((_DWORD)v527)
  if ((_DWORD)v520)

  if ((_DWORD)v521)
  if ((_DWORD)v522)

  if ((_DWORD)v528)
  if ((_DWORD)v529)

  if ((_DWORD)v530)
  if ((_DWORD)v541)

  if ((_DWORD)v542)
  if ((_DWORD)v531)

  if ((_DWORD)v537)
  if ((_DWORD)v548)

  if ((_DWORD)v549)
  if ((_DWORD)v538)

  if ((_DWORD)v550)
  if ((_DWORD)v551)

  if ((_DWORD)v552)
  if ((_DWORD)v543)

  if ((_DWORD)v553)
  if ((_DWORD)v563)

  if (HIDWORD(v563))
  if ((_DWORD)v566)

  if (HIDWORD(v566))
  if (v569)

  if ((_DWORD)v579)
  if (HIDWORD(v579))

  if (v582)
  if ((_DWORD)v589)

  if (HIDWORD(v589))
  if ((_DWORD)v592)

  if (HIDWORD(v592))
  if ((_DWORD)v595)

  if (HIDWORD(v595))
  if (LODWORD(v598[0]))

  if (HIDWORD(v598[0]))
  if (LODWORD(v598[1]))

  if (HIDWORD(v598[1]))
  if (LODWORD(v598[2]))

  if (HIDWORD(v598[2]))
  if (LODWORD(v598[3]))

  if (v502)
  if ((_DWORD)v503)

  if (HIDWORD(v503))
  if ((_DWORD)v504)

  if ((_DWORD)v505)
  if ((_DWORD)v508)

  if ((_DWORD)v509)
  if ((_DWORD)v510)

  if ((_DWORD)v512)
  if ((_DWORD)v516)

  if ((_DWORD)v517)
  if ((_DWORD)v518)

  if ((_DWORD)v523)
  if ((_DWORD)v532)

  if ((_DWORD)v524)
  if ((_DWORD)v525)

  if ((_DWORD)v526)
  if ((_DWORD)v533)

  if ((_DWORD)v534)
  if ((_DWORD)v535)

  if ((_DWORD)v544)
  if ((_DWORD)v545)

  if ((_DWORD)v536)
  if ((_DWORD)v539)

  if (v554)
  if ((_DWORD)v557)

  if ((_DWORD)v540)
  if ((_DWORD)v546)

  if (HIDWORD(v557))
  if ((_DWORD)v560)

  if ((_DWORD)v547)
  if (HIDWORD(v560))

  if (v572)
  if ((_DWORD)v573)

  if (HIDWORD(v573))
  if ((_DWORD)v576)

  if (HIDWORD(v576))
  if (v585)

  if ((_DWORD)v586)
  if (HIDWORD(v586))

  if (HIDWORD(v598[3]))
  if (LODWORD(v598[4]))

  if (HIDWORD(v598[4]))
  if (LODWORD(v598[5]))

  if (HIDWORD(v598[5]))
  if (LODWORD(v598[6]))

  if (HIDWORD(v598[6]))
  if (LODWORD(v598[7]))

  if (HIDWORD(v598[7]))
  if (LODWORD(v598[8]))

  if (HIDWORD(v598[8]))
  if ((_DWORD)v599)

  if (HIDWORD(v599))
  v82 = __sb__runningInSpringBoard();
  if (v82)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v83 = 0;
      v84 = 0;
      goto LABEL_351;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v553 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v553, "userInterfaceIdiom") != 1)
    {
      v84 = 0;
      v83 = 1;
      goto LABEL_351;
    }
  }
  v83 = v82 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v85 = __sb__runningInSpringBoard();
    if (v85)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v544 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v544, "_referenceBounds");
    }
    v84 = v85 ^ 1;
    BSSizeRoundForScale();
    if (v109 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v108 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      LODWORD(v599) = v85 ^ 1;
      HIDWORD(v599) = v83;
      memset(v598, 0, sizeof(v598));
      v596 = 0;
      v587 = 0;
      v593 = 0;
      v590 = 0;
      v580 = 0;
      v577 = 0;
      v583 = 0;
      v574 = 0;
      v570 = 0;
      v567 = 0;
      v564 = 0;
      v561 = 0;
      v558 = 0;
      v555 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v104 = 0.0;
      goto LABEL_405;
    }
  }
  else
  {
    v84 = 0;
  }
LABEL_351:
  v86 = __sb__runningInSpringBoard();
  v599 = __PAIR64__(v83, v84);
  if (v86)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v87 = 0;
      v88 = 0;
      goto LABEL_360;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v552 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v552, "userInterfaceIdiom") != 1)
    {
      v88 = 0;
      v87 = 1;
      goto LABEL_360;
    }
  }
  v87 = v86 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v89 = __sb__runningInSpringBoard();
    if (v89)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v543 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v543, "_referenceBounds");
    }
    v88 = v89 ^ 1;
    BSSizeRoundForScale();
    if (v110 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      LODWORD(v598[8]) = v89 ^ 1;
      HIDWORD(v598[8]) = v87;
      memset(v598, 0, 64);
      v596 = 0;
      v587 = 0;
      v593 = 0;
      v590 = 0;
      v580 = 0;
      v577 = 0;
      v583 = 0;
      v574 = 0;
      v570 = 0;
      v567 = 0;
      v564 = 0;
      v561 = 0;
      v558 = 0;
      v555 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v104 = 0.0;
      goto LABEL_405;
    }
  }
  else
  {
    v88 = 0;
  }
LABEL_360:
  v90 = __sb__runningInSpringBoard();
  v598[8] = __PAIR64__(v87, v88);
  if (v90)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v91 = 0;
      v92 = 0;
      goto LABEL_369;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v551 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v551, "userInterfaceIdiom") != 1)
    {
      v92 = 0;
      v91 = 1;
      goto LABEL_369;
    }
  }
  v91 = v90 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v93 = __sb__runningInSpringBoard();
    if (v93)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v542 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v542, "_referenceBounds");
    }
    v92 = v93 ^ 1;
    BSSizeRoundForScale();
    if (v111 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      LODWORD(v598[7]) = v93 ^ 1;
      HIDWORD(v598[7]) = v91;
      memset(v598, 0, 56);
      v596 = 0;
      v587 = 0;
      v593 = 0;
      v590 = 0;
      v580 = 0;
      v577 = 0;
      v583 = 0;
      v574 = 0;
      v570 = 0;
      v567 = 0;
      v564 = 0;
      v561 = 0;
      v558 = 0;
      v555 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v104 = 0.0;
      goto LABEL_405;
    }
  }
  else
  {
    v92 = 0;
  }
LABEL_369:
  v94 = __sb__runningInSpringBoard();
  v598[7] = __PAIR64__(v91, v92);
  if (v94)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v81 = 0;
      LODWORD(v598[6]) = 0;
      goto LABEL_378;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v550 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v550, "userInterfaceIdiom") != 1)
    {
      LODWORD(v598[6]) = 0;
      v81 = 1;
      goto LABEL_378;
    }
  }
  v81 = v94 ^ 1u;
  v95 = __sb__runningInSpringBoard();
  if (v95)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v547 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v547, "_referenceBounds");
  }
  LODWORD(v598[6]) = v95 ^ 1;
  BSSizeRoundForScale();
  if (v96 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    HIDWORD(v598[6]) = v81;
    memset(v598, 0, 48);
    v596 = 0;
    v587 = 0;
    v593 = 0;
    v590 = 0;
    v580 = 0;
    v577 = 0;
    v583 = 0;
    v574 = 0;
    v570 = 0;
    v567 = 0;
    v564 = 0;
    v561 = 0;
    v558 = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 0.0;
    goto LABEL_405;
  }
LABEL_378:
  v97 = __sb__runningInSpringBoard();
  HIDWORD(v598[6]) = v81;
  if (v97)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v598[5] = 0;
      goto LABEL_388;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v549 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v549, "userInterfaceIdiom") != 1)
    {
      v598[5] = 0x100000000;
      goto LABEL_388;
    }
  }
  HIDWORD(v598[5]) = v97 ^ 1;
  v98 = __sb__runningInSpringBoard();
  if (v98)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v545 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v545, "_referenceBounds");
  }
  LODWORD(v598[5]) = v98 ^ 1;
  BSSizeRoundForScale();
  if (v105 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    memset(v598, 0, 40);
    v596 = 0;
    v587 = 0;
    v593 = 0;
    v590 = 0;
    v580 = 0;
    v577 = 0;
    v583 = 0;
    v574 = 0;
    v570 = 0;
    v567 = 0;
    v564 = 0;
    v561 = 0;
    v558 = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 0.0;
    goto LABEL_405;
  }
LABEL_388:
  v106 = __sb__runningInSpringBoard();
  if (v106)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v598[4] = 0;
      goto LABEL_716;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v548 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v548, "userInterfaceIdiom") != 1)
    {
      v598[4] = 0x100000000;
      goto LABEL_716;
    }
  }
  HIDWORD(v598[4]) = v106 ^ 1;
  v107 = __sb__runningInSpringBoard();
  if (v107)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v541 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v541, "_referenceBounds");
  }
  LODWORD(v598[4]) = v107 ^ 1;
  BSSizeRoundForScale();
  if (v178 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v598, 0, 32);
    v596 = 0;
    v587 = 0;
    v593 = 0;
    v590 = 0;
    v580 = 0;
    v577 = 0;
    v583 = 0;
    v574 = 0;
    v570 = 0;
    v567 = 0;
    v564 = 0;
    v561 = 0;
    v558 = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 0.0;
    goto LABEL_405;
  }
LABEL_716:
  v179 = __sb__runningInSpringBoard();
  if (v179)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_718;
LABEL_724:
    memset(v598, 0, 28);
    v596 = 0;
    v587 = 0;
    v593 = 0;
    v590 = 0;
    v580 = 0;
    v577 = 0;
    v583 = 0;
    v574 = 0;
    v570 = 0;
    v567 = 0;
    v564 = 0;
    v561 = 0;
    v558 = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 0.0;
    HIDWORD(v598[3]) = v179 ^ 1;
    goto LABEL_405;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v546 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v546, "userInterfaceIdiom") == 1)
    goto LABEL_724;
LABEL_718:
  HIDWORD(v598[3]) = v179 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_722:
    *(_QWORD *)((char *)&v598[2] + 4) = 0;
    goto LABEL_803;
  }
  v180 = __sb__runningInSpringBoard();
  if (v180)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_722;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v539 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v539, "userInterfaceIdiom"))
    {
      HIDWORD(v598[2]) = 0;
      LODWORD(v598[3]) = 1;
      goto LABEL_803;
    }
  }
  LODWORD(v598[3]) = v180 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v191 = __sb__runningInSpringBoard();
    if (v191)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v531 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v531, "_referenceBounds");
    }
    HIDWORD(v598[2]) = v191 ^ 1;
    BSSizeRoundForScale();
    if (v203 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      memset(v598, 0, 20);
      v596 = 0;
      v587 = 0;
      v593 = 0;
      v590 = 0;
      v580 = 0;
      v577 = 0;
      v583 = 0;
      v574 = 0;
      v570 = 0;
      v567 = 0;
      v564 = 0;
      v561 = 0;
      v558 = 0;
      v555 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v104 = 83.0;
      goto LABEL_405;
    }
  }
  else
  {
    HIDWORD(v598[2]) = 0;
  }
LABEL_803:
  v192 = __sb__runningInSpringBoard();
  if (v192)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)((char *)&v598[1] + 4) = 0;
      goto LABEL_813;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v540 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v540, "userInterfaceIdiom"))
    {
      HIDWORD(v598[1]) = 0;
      LODWORD(v598[2]) = 1;
      goto LABEL_813;
    }
  }
  LODWORD(v598[2]) = v192 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v193 = __sb__runningInSpringBoard();
    if (v193)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v535 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v535, "_referenceBounds");
    }
    HIDWORD(v598[1]) = v193 ^ 1;
    BSSizeRoundForScale();
    if (v194 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_817;
  }
  else
  {
    HIDWORD(v598[1]) = 0;
  }
LABEL_813:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    *(_QWORD *)((char *)v598 + 4) = 0;
    LODWORD(v598[0]) = 0;
    v596 = 0;
    v587 = 0;
    v593 = 0;
    v590 = 0;
    v580 = 0;
    v577 = 0;
    v583 = 0;
    v574 = 0;
    v570 = 0;
    v567 = 0;
    v564 = 0;
    v561 = 0;
    v558 = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 73.0;
    goto LABEL_405;
  }
LABEL_817:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_821:
    *(_QWORD *)((char *)v598 + 4) = 0;
    goto LABEL_933;
  }
  v195 = __sb__runningInSpringBoard();
  if (v195)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_821;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v536 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v536, "userInterfaceIdiom"))
    {
      HIDWORD(v598[0]) = 0;
      LODWORD(v598[1]) = 1;
      goto LABEL_933;
    }
  }
  LODWORD(v598[1]) = v195 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v215 = __sb__runningInSpringBoard();
    if (v215)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v81 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v81, "_referenceBounds");
    }
    v533 = (void *)v81;
    HIDWORD(v598[0]) = v215 ^ 1;
    BSSizeRoundForScale();
    if (v238 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      LODWORD(v598[0]) = 0;
      v596 = 0;
      v587 = 0;
      v593 = 0;
      v590 = 0;
      v580 = 0;
      v577 = 0;
      v583 = 0;
      v574 = 0;
      v570 = 0;
      v567 = 0;
      v564 = 0;
      v561 = 0;
      v558 = 0;
      v555 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v104 = 71.0;
      goto LABEL_405;
    }
  }
  else
  {
    HIDWORD(v598[0]) = 0;
  }
LABEL_933:
  v216 = __sb__runningInSpringBoard();
  v81 = (uint64_t)&off_1D048E000;
  if (v216)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v598[0]) = 0;
      HIDWORD(v596) = 0;
      goto LABEL_943;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v538 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v538, "userInterfaceIdiom"))
    {
      HIDWORD(v596) = 0;
      LODWORD(v598[0]) = 1;
      goto LABEL_943;
    }
  }
  LODWORD(v598[0]) = v216 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v217 = __sb__runningInSpringBoard();
    if (v217)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v530 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v530, "_referenceBounds");
    }
    HIDWORD(v596) = v217 ^ 1;
    BSSizeRoundForScale();
    if (v218 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_947;
  }
  else
  {
    HIDWORD(v596) = 0;
  }
LABEL_943:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    LODWORD(v596) = 0;
    v587 = 0;
    v593 = 0;
    v590 = 0;
    v580 = 0;
    v577 = 0;
    v583 = 0;
    v574 = 0;
    v570 = 0;
    v567 = 0;
    v564 = 0;
    v561 = 0;
    v558 = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 62.33333;
    goto LABEL_405;
  }
LABEL_947:
  v219 = __sb__runningInSpringBoard();
  if (v219)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v596) = 0;
      LODWORD(v587) = 0;
      goto LABEL_957;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v537 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v537, "userInterfaceIdiom"))
    {
      LODWORD(v587) = 0;
      LODWORD(v596) = 1;
      goto LABEL_957;
    }
  }
  LODWORD(v596) = v219 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v220 = __sb__runningInSpringBoard();
    if (v220)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v527 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v527, "_referenceBounds");
    }
    LODWORD(v587) = v220 ^ 1;
    BSSizeRoundForScale();
    if (v234 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v593 = 0;
      v590 = 0;
      v580 = 0;
      HIDWORD(v587) = 0;
      v577 = 0;
      v583 = 0;
      v574 = 0;
      v570 = 0;
      v567 = 0;
      v564 = 0;
      v561 = 0;
      v558 = 0;
      v555 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v104 = 71.0;
      goto LABEL_405;
    }
  }
  else
  {
    LODWORD(v587) = 0;
  }
LABEL_957:
  v221 = __sb__runningInSpringBoard();
  if (v221)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v593 = 0;
      goto LABEL_1013;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v534 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v534, "userInterfaceIdiom"))
    {
      v593 = 0x100000000;
      goto LABEL_1013;
    }
  }
  HIDWORD(v593) = v221 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v230 = __sb__runningInSpringBoard();
    if (v230)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v526 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v526, "_referenceBounds");
    }
    LODWORD(v593) = v230 ^ 1;
    BSSizeRoundForScale();
    if (v244 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_1063;
  }
  else
  {
    LODWORD(v593) = 0;
  }
LABEL_1013:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    v590 = 0;
    v580 = 0;
    HIDWORD(v587) = 0;
    v577 = 0;
    v583 = 0;
    v574 = 0;
    v570 = 0;
    v567 = 0;
    v564 = 0;
    v561 = 0;
    v558 = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 62.33333;
    goto LABEL_405;
  }
LABEL_1063:
  v245 = __sb__runningInSpringBoard();
  if (v245)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v81 = 0;
      HIDWORD(v580) = 0;
      goto LABEL_1101;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v532 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v532, "userInterfaceIdiom"))
    {
      HIDWORD(v580) = 0;
      v81 = 1;
      goto LABEL_1101;
    }
  }
  v81 = v245 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v251 = __sb__runningInSpringBoard();
    if (v251)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v523 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v523, "_referenceBounds");
    }
    HIDWORD(v580) = v251 ^ 1;
    BSSizeRoundForScale();
    if (v263 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      HIDWORD(v590) = v81;
      LODWORD(v590) = 0;
      HIDWORD(v587) = 0;
      LODWORD(v580) = 0;
      v577 = 0;
      v583 = 0;
      v574 = 0;
      v570 = 0;
      v567 = 0;
      v564 = 0;
      v561 = 0;
      v558 = 0;
      v555 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v104 = 0.0;
      goto LABEL_405;
    }
  }
  else
  {
    HIDWORD(v580) = 0;
  }
LABEL_1101:
  v252 = __sb__runningInSpringBoard();
  HIDWORD(v590) = v81;
  if (v252)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v590) = 0;
      v253 = 0;
      goto LABEL_1135;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v529 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v529, "userInterfaceIdiom"))
    {
      v253 = 0;
      LODWORD(v590) = 1;
      goto LABEL_1135;
    }
  }
  LODWORD(v590) = v252 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v259 = __sb__runningInSpringBoard();
    if (v259)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v522 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v522, "_referenceBounds");
    }
    v253 = v259 ^ 1;
    BSSizeRoundForScale();
    if (v269 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1181;
  }
  else
  {
    v253 = 0;
  }
LABEL_1135:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    HIDWORD(v587) = v253;
    LODWORD(v580) = 0;
    v577 = 0;
    v583 = 0;
    v574 = 0;
    v570 = 0;
    v567 = 0;
    v564 = 0;
    v561 = 0;
    v558 = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 0.0;
    goto LABEL_405;
  }
LABEL_1181:
  HIDWORD(v587) = v253;
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1185:
    LODWORD(v580) = 0;
    HIDWORD(v577) = 0;
    goto LABEL_1251;
  }
  v270 = __sb__runningInSpringBoard();
  if (v270)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1185;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v525 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v525, "userInterfaceIdiom"))
    {
      HIDWORD(v577) = 0;
      LODWORD(v580) = 1;
      goto LABEL_1251;
    }
  }
  LODWORD(v580) = v270 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v281 = __sb__runningInSpringBoard();
    if (v281)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v516 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v516, "_referenceBounds");
    }
    BSSizeRoundForScale();
    HIDWORD(v577) = v281 ^ 1;
    if (v293 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v583 = 0;
      LODWORD(v577) = 0;
      v574 = 0;
      v570 = 0;
      v567 = 0;
      v564 = 0;
      v561 = 0;
      v558 = 0;
      v555 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v104 = 37.0;
      goto LABEL_405;
    }
  }
  else
  {
    HIDWORD(v577) = 0;
  }
LABEL_1251:
  v282 = __sb__runningInSpringBoard();
  if (v282)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v583 = 0;
      goto LABEL_1261;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v528 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v528, "userInterfaceIdiom"))
    {
      v583 = 0x100000000;
      goto LABEL_1261;
    }
  }
  HIDWORD(v583) = v282 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v283 = __sb__runningInSpringBoard();
    if (v283)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v519 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v519, "_referenceBounds");
    }
    LODWORD(v583) = v283 ^ 1;
    BSSizeRoundForScale();
    if (v284 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_1265;
  }
  else
  {
    LODWORD(v583) = 0;
  }
LABEL_1261:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v577) = 0;
    v574 = 0;
    v570 = 0;
    v567 = 0;
    v564 = 0;
    v561 = 0;
    v558 = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 30.333333;
    goto LABEL_405;
  }
LABEL_1265:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1269:
    LODWORD(v577) = 0;
    HIDWORD(v574) = 0;
    goto LABEL_1381;
  }
  v285 = __sb__runningInSpringBoard();
  if (v285)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1269;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v520 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v520, "userInterfaceIdiom"))
    {
      HIDWORD(v574) = 0;
      LODWORD(v577) = 1;
      goto LABEL_1381;
    }
  }
  LODWORD(v577) = v285 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v307 = __sb__runningInSpringBoard();
    if (v307)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v512 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v512, "_referenceBounds");
    }
    BSSizeRoundForScale();
    HIDWORD(v574) = v307 ^ 1;
    if (v333 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v574) = 0;
      v570 = 0;
      v567 = 0;
      v564 = 0;
      v561 = 0;
      v558 = 0;
      v555 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v104 = 28.0;
      goto LABEL_405;
    }
  }
  else
  {
    HIDWORD(v574) = 0;
  }
LABEL_1381:
  v308 = __sb__runningInSpringBoard();
  if (v308)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v574) = 0;
      LODWORD(v570) = 0;
      goto LABEL_1391;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v524 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v524, "userInterfaceIdiom"))
    {
      LODWORD(v570) = 0;
      LODWORD(v574) = 1;
      goto LABEL_1391;
    }
  }
  LODWORD(v574) = v308 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v309 = __sb__runningInSpringBoard();
    if (v309)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v515 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v515, "_referenceBounds");
    }
    LODWORD(v570) = v309 ^ 1;
    BSSizeRoundForScale();
    if (v310 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1395;
  }
  else
  {
    LODWORD(v570) = 0;
  }
LABEL_1391:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    v567 = 0;
    HIDWORD(v570) = 0;
    v564 = 0;
    v561 = 0;
    v558 = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 23.0;
    goto LABEL_405;
  }
LABEL_1395:
  v311 = __sb__runningInSpringBoard();
  if (v311)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v567 = 0;
      goto LABEL_1405;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v521 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v521, "userInterfaceIdiom"))
    {
      v567 = 0x100000000;
      goto LABEL_1405;
    }
  }
  HIDWORD(v567) = v311 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v312 = __sb__runningInSpringBoard();
    if (v312)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v513 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v513, "_referenceBounds");
    }
    LODWORD(v567) = v312 ^ 1;
    BSSizeRoundForScale();
    if (v329 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      HIDWORD(v570) = 0;
      v564 = 0;
      v561 = 0;
      v558 = 0;
      v555 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v104 = 0.0;
      goto LABEL_405;
    }
  }
  else
  {
    LODWORD(v567) = 0;
  }
LABEL_1405:
  v313 = __sb__runningInSpringBoard();
  if (v313)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v570) = 0;
      v314 = 0;
      goto LABEL_1461;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v518 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v518, "userInterfaceIdiom"))
    {
      v314 = 0;
      HIDWORD(v570) = 1;
      goto LABEL_1461;
    }
  }
  HIDWORD(v570) = v313 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v325 = __sb__runningInSpringBoard();
    if (v325)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v511 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v511, "_referenceBounds");
    }
    v314 = v325 ^ 1;
    BSSizeRoundForScale();
    if (v339 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1511;
  }
  else
  {
    v314 = 0;
  }
LABEL_1461:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    HIDWORD(v564) = v314;
    LODWORD(v564) = 0;
    v561 = 0;
    v558 = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 0.0;
    goto LABEL_405;
  }
LABEL_1511:
  HIDWORD(v564) = v314;
  v340 = __sb__runningInSpringBoard();
  if (v340)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v564) = 0;
      HIDWORD(v561) = 0;
      goto LABEL_1549;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v517 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v517, "userInterfaceIdiom"))
    {
      HIDWORD(v561) = 0;
      LODWORD(v564) = 1;
      goto LABEL_1549;
    }
  }
  LODWORD(v564) = v340 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v345 = __sb__runningInSpringBoard();
    if (v345)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v510 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v510, "_referenceBounds");
    }
    HIDWORD(v561) = v345 ^ 1;
    BSSizeRoundForScale();
    if (v354 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v561) = 0;
      v558 = 0;
      v555 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v104 = 28.0;
      goto LABEL_405;
    }
  }
  else
  {
    HIDWORD(v561) = 0;
  }
LABEL_1549:
  v346 = __sb__runningInSpringBoard();
  if (v346)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v561) = 0;
      HIDWORD(v558) = 0;
      goto LABEL_1581;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v514 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v514, "userInterfaceIdiom"))
    {
      HIDWORD(v558) = 0;
      LODWORD(v561) = 1;
      goto LABEL_1581;
    }
  }
  LODWORD(v561) = v346 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v350 = __sb__runningInSpringBoard();
    if (v350)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v509 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v509, "_referenceBounds");
    }
    HIDWORD(v558) = v350 ^ 1;
    BSSizeRoundForScale();
    if (v358 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1623;
  }
  else
  {
    HIDWORD(v558) = 0;
  }
LABEL_1581:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    LODWORD(v558) = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 23.0;
    goto LABEL_405;
  }
LABEL_1623:
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
    || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    LODWORD(v558) = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 0.0;
    goto LABEL_405;
  }
  v104 = 0.0;
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    LODWORD(v558) = 0;
    v555 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    goto LABEL_405;
  }
  v361 = __sb__runningInSpringBoard();
  if (v361)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v558) = 0;
      v555 = 0;
      goto LABEL_1689;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v508 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v508, "userInterfaceIdiom"))
    {
      v555 = 0;
      LODWORD(v558) = 1;
      goto LABEL_1689;
    }
  }
  LODWORD(v558) = v361 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v366 = __sb__runningInSpringBoard();
    if (v366)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v505 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v505, "_referenceBounds");
    }
    v555 = v366 ^ 1;
    BSSizeRoundForScale();
    if (v389 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      goto LABEL_405;
    }
  }
  else
  {
    v555 = 0;
  }
LABEL_1689:
  v367 = __sb__runningInSpringBoard();
  if (v367)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v99 = 0;
      v100 = 0;
      goto LABEL_1729;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v507 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v507, "userInterfaceIdiom"))
    {
      v100 = 0;
      v99 = 1;
      goto LABEL_1729;
    }
  }
  v99 = v367 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v372 = __sb__runningInSpringBoard();
    if (v372)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v504 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v504, "_referenceBounds");
    }
    v100 = v372 ^ 1;
    BSSizeRoundForScale();
    if (v393 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v101 = 0;
      v102 = 0;
      v103 = 0;
      goto LABEL_405;
    }
  }
  else
  {
    v100 = 0;
  }
LABEL_1729:
  v373 = __sb__runningInSpringBoard();
  if (!v373)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v506 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v506, "userInterfaceIdiom"))
    {
      v102 = 0;
      v101 = 1;
      goto LABEL_1769;
    }
LABEL_1765:
    v101 = v373 ^ 1;
    v381 = __sb__runningInSpringBoard();
    if (v381)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v81 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v81, "_referenceBounds");
    }
    v102 = v381 ^ 1;
    BSSizeRoundForScale();
    if (v382 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      goto LABEL_1772;
    goto LABEL_1769;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_1765;
  v101 = 0;
  v102 = 0;
LABEL_1769:
  v383 = __sb__runningInSpringBoard();
  if ((_DWORD)v383)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1772:
      v103 = 0;
      goto LABEL_405;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v80, "userInterfaceIdiom"))
    {
      v103 = 1;
      goto LABEL_405;
    }
  }
  v103 = v383 ^ 1;
  v397 = __sb__runningInSpringBoard();
  if (v397)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v383 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v383, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (v397 != 1)

LABEL_405:
  if (v103)

  if (v102)
  v112 = (void *)0x1E0CEA000;
  if (v101)

  v113 = v599;
  if (v100)

  if (v99)
  if (v555)

  if ((_DWORD)v558)
  if (HIDWORD(v558))

  if ((_DWORD)v561)
  if (HIDWORD(v561))

  if ((_DWORD)v564)
  if (HIDWORD(v564))

  if (HIDWORD(v570))
  if ((_DWORD)v567)

  if (HIDWORD(v567))
  if ((_DWORD)v570)

  if ((_DWORD)v574)
  if (HIDWORD(v574))

  if ((_DWORD)v577)
  if ((_DWORD)v583)

  if (HIDWORD(v583))
  if (HIDWORD(v577))

  if ((_DWORD)v580)
  if (HIDWORD(v587))

  if ((_DWORD)v590)
  if (HIDWORD(v580))

  if (HIDWORD(v590))
  if ((_DWORD)v593)

  if (HIDWORD(v593))
  if ((_DWORD)v587)

  if ((_DWORD)v596)
  if (HIDWORD(v596))

  if (LODWORD(v598[0]))
  if (HIDWORD(v598[0]))

  if (LODWORD(v598[1]))
  if (HIDWORD(v598[1]))

  if (LODWORD(v598[2]))
  if (HIDWORD(v598[2]))

  if (LODWORD(v598[3]))
  if (HIDWORD(v598[3]))

  if (LODWORD(v598[4]))
  if (HIDWORD(v598[4]))

  if (LODWORD(v598[5]))
  if (HIDWORD(v598[5]))

  if (LODWORD(v598[6]))
  if (HIDWORD(v598[6]))
  {

    if (!LODWORD(v598[7]))
      goto LABEL_497;
  }
  else if (!LODWORD(v598[7]))
  {
LABEL_497:
    if (HIDWORD(v598[7]))
      goto LABEL_498;
    goto LABEL_508;
  }

  if (HIDWORD(v598[7]))
  {
LABEL_498:

    if (!LODWORD(v598[8]))
      goto LABEL_499;
    goto LABEL_509;
  }
LABEL_508:
  if (!LODWORD(v598[8]))
  {
LABEL_499:
    if (HIDWORD(v598[8]))
      goto LABEL_500;
    goto LABEL_510;
  }
LABEL_509:

  if (HIDWORD(v598[8]))
  {
LABEL_500:

    if (!(_DWORD)v599)
      goto LABEL_501;
    goto LABEL_511;
  }
LABEL_510:
  if (!(_DWORD)v599)
  {
LABEL_501:
    if (!HIDWORD(v599))
      goto LABEL_503;
    goto LABEL_502;
  }
LABEL_511:

  if (HIDWORD(v599))
LABEL_502:

LABEL_503:
  v114 = __sb__runningInSpringBoard();
  if (v114)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v115 = 0;
      v116 = 0;
      goto LABEL_519;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v553 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v553, "userInterfaceIdiom") != 1)
    {
      v116 = 0;
      v115 = 1;
      goto LABEL_519;
    }
  }
  v115 = v114 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v117 = __sb__runningInSpringBoard();
    if (v117)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v544 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v544, "_referenceBounds");
    }
    v116 = v117 ^ 1;
    BSSizeRoundForScale();
    if (v141 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v140 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      LODWORD(v599) = v117 ^ 1;
      HIDWORD(v599) = v115;
      memset(v598, 0, sizeof(v598));
      v597 = 0;
      v588 = 0;
      v594 = 0;
      v591 = 0;
      v581 = 0;
      v578 = 0;
      v584 = 0;
      v575 = 0;
      v571 = 0;
      v568 = 0;
      v565 = 0;
      v562 = 0;
      v559 = 0;
      v556 = 0;
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    v116 = 0;
  }
LABEL_519:
  v118 = __sb__runningInSpringBoard();
  v599 = __PAIR64__(v115, v116);
  if (v118)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v119 = 0;
      v120 = 0;
      goto LABEL_528;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v552 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v552, "userInterfaceIdiom") != 1)
    {
      v120 = 0;
      v119 = 1;
      goto LABEL_528;
    }
  }
  v119 = v118 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v121 = __sb__runningInSpringBoard();
    if (v121)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v543 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v543, "_referenceBounds");
    }
    v120 = v121 ^ 1;
    BSSizeRoundForScale();
    if (v142 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      LODWORD(v598[8]) = v121 ^ 1;
      HIDWORD(v598[8]) = v119;
      memset(v598, 0, 64);
      v597 = 0;
      v588 = 0;
      v594 = 0;
      v591 = 0;
      v581 = 0;
      v578 = 0;
      v584 = 0;
      v575 = 0;
      v571 = 0;
      v568 = 0;
      v565 = 0;
      v562 = 0;
      v559 = 0;
      v556 = 0;
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    v120 = 0;
  }
LABEL_528:
  v122 = __sb__runningInSpringBoard();
  v598[8] = __PAIR64__(v119, v120);
  if (v122)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v123 = 0;
      v124 = 0;
      goto LABEL_537;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v551 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v551, "userInterfaceIdiom") != 1)
    {
      v124 = 0;
      v123 = 1;
      goto LABEL_537;
    }
  }
  v123 = v122 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v125 = __sb__runningInSpringBoard();
    if (v125)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v542 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v542, "_referenceBounds");
    }
    v124 = v125 ^ 1;
    BSSizeRoundForScale();
    if (v143 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      LODWORD(v598[7]) = v125 ^ 1;
      HIDWORD(v598[7]) = v123;
      memset(v598, 0, 56);
      v597 = 0;
      v588 = 0;
      v594 = 0;
      v591 = 0;
      v581 = 0;
      v578 = 0;
      v584 = 0;
      v575 = 0;
      v571 = 0;
      v568 = 0;
      v565 = 0;
      v562 = 0;
      v559 = 0;
      v556 = 0;
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    v124 = 0;
  }
LABEL_537:
  v126 = __sb__runningInSpringBoard();
  v598[7] = __PAIR64__(v123, v124);
  if (v126)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v113 = 0;
      LODWORD(v598[6]) = 0;
      goto LABEL_546;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v550 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v550, "userInterfaceIdiom") != 1)
    {
      LODWORD(v598[6]) = 0;
      v113 = 1;
      goto LABEL_546;
    }
  }
  v113 = v126 ^ 1u;
  v127 = __sb__runningInSpringBoard();
  if (v127)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v547 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v547, "_referenceBounds");
  }
  LODWORD(v598[6]) = v127 ^ 1;
  BSSizeRoundForScale();
  if (v128 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    HIDWORD(v598[6]) = v113;
    memset(v598, 0, 48);
    v597 = 0;
    v588 = 0;
    v594 = 0;
    v591 = 0;
    v581 = 0;
    v578 = 0;
    v584 = 0;
    v575 = 0;
    v571 = 0;
    v568 = 0;
    v565 = 0;
    v562 = 0;
    v559 = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 0.0;
    goto LABEL_573;
  }
LABEL_546:
  v129 = __sb__runningInSpringBoard();
  HIDWORD(v598[6]) = v113;
  if (v129)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v598[5] = 0;
      goto LABEL_556;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v549 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v549, "userInterfaceIdiom") != 1)
    {
      v598[5] = 0x100000000;
      goto LABEL_556;
    }
  }
  HIDWORD(v598[5]) = v129 ^ 1;
  v130 = __sb__runningInSpringBoard();
  if (v130)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v545 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v545, "_referenceBounds");
  }
  LODWORD(v598[5]) = v130 ^ 1;
  BSSizeRoundForScale();
  if (v137 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    memset(v598, 0, 40);
    v597 = 0;
    v588 = 0;
    v594 = 0;
    v591 = 0;
    v581 = 0;
    v578 = 0;
    v584 = 0;
    v575 = 0;
    v571 = 0;
    v568 = 0;
    v565 = 0;
    v562 = 0;
    v559 = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 0.0;
    goto LABEL_573;
  }
LABEL_556:
  v138 = __sb__runningInSpringBoard();
  if (v138)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v598[4] = 0;
      goto LABEL_728;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v548 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v548, "userInterfaceIdiom") != 1)
    {
      v598[4] = 0x100000000;
      goto LABEL_728;
    }
  }
  HIDWORD(v598[4]) = v138 ^ 1;
  v139 = __sb__runningInSpringBoard();
  if (v139)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v541 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v541, "_referenceBounds");
  }
  LODWORD(v598[4]) = v139 ^ 1;
  BSSizeRoundForScale();
  if (v181 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v598, 0, 32);
    v597 = 0;
    v588 = 0;
    v594 = 0;
    v591 = 0;
    v581 = 0;
    v578 = 0;
    v584 = 0;
    v575 = 0;
    v571 = 0;
    v568 = 0;
    v565 = 0;
    v562 = 0;
    v559 = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 0.0;
    goto LABEL_573;
  }
LABEL_728:
  v182 = __sb__runningInSpringBoard();
  if (v182)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_730;
LABEL_736:
    memset(v598, 0, 28);
    v597 = 0;
    v588 = 0;
    v594 = 0;
    v591 = 0;
    v581 = 0;
    v578 = 0;
    v584 = 0;
    v575 = 0;
    v571 = 0;
    v568 = 0;
    v565 = 0;
    v562 = 0;
    v559 = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 0.0;
    HIDWORD(v598[3]) = v182 ^ 1;
    goto LABEL_573;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v546 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v546, "userInterfaceIdiom") == 1)
    goto LABEL_736;
LABEL_730:
  HIDWORD(v598[3]) = v182 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_734:
    *(_QWORD *)((char *)&v598[2] + 4) = 0;
    goto LABEL_828;
  }
  v183 = __sb__runningInSpringBoard();
  if (v183)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_734;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v539 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v539, "userInterfaceIdiom"))
    {
      HIDWORD(v598[2]) = 0;
      LODWORD(v598[3]) = 1;
      goto LABEL_828;
    }
  }
  LODWORD(v598[3]) = v183 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v196 = __sb__runningInSpringBoard();
    if (v196)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v113 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v113, "_referenceBounds");
    }
    v536 = (void *)v113;
    HIDWORD(v598[2]) = v196 ^ 1;
    BSSizeRoundForScale();
    if (v204 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      memset(v598, 0, 20);
      v597 = 0;
      v588 = 0;
      v594 = 0;
      v591 = 0;
      v581 = 0;
      v578 = 0;
      v584 = 0;
      v575 = 0;
      v571 = 0;
      v568 = 0;
      v565 = 0;
      v562 = 0;
      v559 = 0;
      v556 = 0;
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 50.0;
      goto LABEL_573;
    }
  }
  else
  {
    HIDWORD(v598[2]) = 0;
  }
LABEL_828:
  v197 = __sb__runningInSpringBoard();
  v113 = (uint64_t)&off_1D048E000;
  if (v197)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)((char *)&v598[1] + 4) = 0;
      goto LABEL_838;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v540 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v540, "userInterfaceIdiom"))
    {
      HIDWORD(v598[1]) = 0;
      LODWORD(v598[2]) = 1;
      goto LABEL_838;
    }
  }
  LODWORD(v598[2]) = v197 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v198 = __sb__runningInSpringBoard();
    if (v198)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v534 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v534, "_referenceBounds");
    }
    HIDWORD(v598[1]) = v198 ^ 1;
    BSSizeRoundForScale();
    if (v199 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_842;
  }
  else
  {
    HIDWORD(v598[1]) = 0;
  }
LABEL_838:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    *(_QWORD *)((char *)v598 + 4) = 0;
    LODWORD(v598[0]) = 0;
    v597 = 0;
    v588 = 0;
    v594 = 0;
    v591 = 0;
    v581 = 0;
    v578 = 0;
    v584 = 0;
    v575 = 0;
    v571 = 0;
    v568 = 0;
    v565 = 0;
    v562 = 0;
    v559 = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 43.66666;
    goto LABEL_573;
  }
LABEL_842:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_846:
    *(_QWORD *)((char *)v598 + 4) = 0;
    goto LABEL_967;
  }
  v200 = __sb__runningInSpringBoard();
  if (v200)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_846;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v535 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v535, "userInterfaceIdiom"))
    {
      HIDWORD(v598[0]) = 0;
      LODWORD(v598[1]) = 1;
      goto LABEL_967;
    }
  }
  LODWORD(v598[1]) = v200 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v222 = __sb__runningInSpringBoard();
    if (v222)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v527 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v527, "_referenceBounds");
    }
    HIDWORD(v598[0]) = v222 ^ 1;
    BSSizeRoundForScale();
    if (v239 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      LODWORD(v598[0]) = 0;
      v597 = 0;
      v588 = 0;
      v594 = 0;
      v591 = 0;
      v581 = 0;
      v578 = 0;
      v584 = 0;
      v575 = 0;
      v571 = 0;
      v568 = 0;
      v565 = 0;
      v562 = 0;
      v559 = 0;
      v556 = 0;
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 50.0;
      goto LABEL_573;
    }
  }
  else
  {
    HIDWORD(v598[0]) = 0;
  }
LABEL_967:
  v223 = __sb__runningInSpringBoard();
  if (v223)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v598[0]) = 0;
      HIDWORD(v597) = 0;
      goto LABEL_977;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v538 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v538, "userInterfaceIdiom"))
    {
      HIDWORD(v597) = 0;
      LODWORD(v598[0]) = 1;
      goto LABEL_977;
    }
  }
  LODWORD(v598[0]) = v223 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v224 = __sb__runningInSpringBoard();
    if (v224)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v531 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v531, "_referenceBounds");
    }
    HIDWORD(v597) = v224 ^ 1;
    BSSizeRoundForScale();
    if (v225 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_981;
  }
  else
  {
    HIDWORD(v597) = 0;
  }
LABEL_977:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    LODWORD(v597) = 0;
    v588 = 0;
    v594 = 0;
    v591 = 0;
    v581 = 0;
    v578 = 0;
    v584 = 0;
    v575 = 0;
    v571 = 0;
    v568 = 0;
    v565 = 0;
    v562 = 0;
    v559 = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 43.666666;
    goto LABEL_573;
  }
LABEL_981:
  v226 = __sb__runningInSpringBoard();
  if (v226)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v597) = 0;
      LODWORD(v588) = 0;
      goto LABEL_991;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v537 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v537, "userInterfaceIdiom"))
    {
      LODWORD(v588) = 0;
      LODWORD(v597) = 1;
      goto LABEL_991;
    }
  }
  LODWORD(v597) = v226 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v227 = __sb__runningInSpringBoard();
    if (v227)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v528 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v528, "_referenceBounds");
    }
    LODWORD(v588) = v227 ^ 1;
    BSSizeRoundForScale();
    if (v235 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v594 = 0;
      v591 = 0;
      v581 = 0;
      HIDWORD(v588) = 0;
      v578 = 0;
      v584 = 0;
      v575 = 0;
      v571 = 0;
      v568 = 0;
      v565 = 0;
      v562 = 0;
      v559 = 0;
      v556 = 0;
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 50.0;
      goto LABEL_573;
    }
  }
  else
  {
    LODWORD(v588) = 0;
  }
LABEL_991:
  v228 = __sb__runningInSpringBoard();
  if (v228)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v594 = 0;
      goto LABEL_1019;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v533 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v533, "userInterfaceIdiom"))
    {
      v594 = 0x100000000;
      goto LABEL_1019;
    }
  }
  HIDWORD(v594) = v228 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v231 = __sb__runningInSpringBoard();
    if (v231)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v526 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v526, "_referenceBounds");
    }
    LODWORD(v594) = v231 ^ 1;
    BSSizeRoundForScale();
    if (v246 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_1071;
  }
  else
  {
    LODWORD(v594) = 0;
  }
LABEL_1019:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    v591 = 0;
    v581 = 0;
    HIDWORD(v588) = 0;
    v578 = 0;
    v584 = 0;
    v575 = 0;
    v571 = 0;
    v568 = 0;
    v565 = 0;
    v562 = 0;
    v559 = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 43.66666;
    goto LABEL_573;
  }
LABEL_1071:
  v247 = __sb__runningInSpringBoard();
  if (v247)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v113 = 0;
      HIDWORD(v581) = 0;
      goto LABEL_1111;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v532 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v532, "userInterfaceIdiom"))
    {
      HIDWORD(v581) = 0;
      v113 = 1;
      goto LABEL_1111;
    }
  }
  v113 = v247 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v254 = __sb__runningInSpringBoard();
    if (v254)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v523 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v523, "_referenceBounds");
    }
    HIDWORD(v581) = v254 ^ 1;
    BSSizeRoundForScale();
    if (v264 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      HIDWORD(v591) = v113;
      LODWORD(v591) = 0;
      HIDWORD(v588) = 0;
      LODWORD(v581) = 0;
      v578 = 0;
      v584 = 0;
      v575 = 0;
      v571 = 0;
      v568 = 0;
      v565 = 0;
      v562 = 0;
      v559 = 0;
      v556 = 0;
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    HIDWORD(v581) = 0;
  }
LABEL_1111:
  v255 = __sb__runningInSpringBoard();
  HIDWORD(v591) = v113;
  if (v255)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v591) = 0;
      v256 = 0;
      goto LABEL_1142;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v530 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v530, "userInterfaceIdiom"))
    {
      v256 = 0;
      LODWORD(v591) = 1;
      goto LABEL_1142;
    }
  }
  LODWORD(v591) = v255 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v260 = __sb__runningInSpringBoard();
    if (v260)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v522 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v522, "_referenceBounds");
    }
    v256 = v260 ^ 1;
    BSSizeRoundForScale();
    if (v271 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1190;
  }
  else
  {
    v256 = 0;
  }
LABEL_1142:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    HIDWORD(v588) = v256;
    LODWORD(v581) = 0;
    v578 = 0;
    v584 = 0;
    v575 = 0;
    v571 = 0;
    v568 = 0;
    v565 = 0;
    v562 = 0;
    v559 = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 0.0;
    goto LABEL_573;
  }
LABEL_1190:
  HIDWORD(v588) = v256;
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1194:
    LODWORD(v581) = 0;
    HIDWORD(v578) = 0;
    goto LABEL_1276;
  }
  v272 = __sb__runningInSpringBoard();
  if (v272)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1194;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v525 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v525, "userInterfaceIdiom"))
    {
      HIDWORD(v578) = 0;
      LODWORD(v581) = 1;
      goto LABEL_1276;
    }
  }
  LODWORD(v581) = v272 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v286 = __sb__runningInSpringBoard();
    if (v286)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v113 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v113, "_referenceBounds");
    }
    v520 = (void *)v113;
    BSSizeRoundForScale();
    HIDWORD(v578) = v286 ^ 1;
    if (v294 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v584 = 0;
      LODWORD(v578) = 0;
      v575 = 0;
      v571 = 0;
      v568 = 0;
      v565 = 0;
      v562 = 0;
      v559 = 0;
      v556 = 0;
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 43.0;
      goto LABEL_573;
    }
  }
  else
  {
    HIDWORD(v578) = 0;
  }
LABEL_1276:
  v287 = __sb__runningInSpringBoard();
  v113 = (uint64_t)&off_1D048E000;
  if (v287)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v584 = 0;
      goto LABEL_1286;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v529 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v529, "userInterfaceIdiom"))
    {
      v584 = 0x100000000;
      goto LABEL_1286;
    }
  }
  HIDWORD(v584) = v287 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v288 = __sb__runningInSpringBoard();
    if (v288)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v518 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v518, "_referenceBounds");
    }
    LODWORD(v584) = v288 ^ 1;
    BSSizeRoundForScale();
    if (v289 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_1290;
  }
  else
  {
    LODWORD(v584) = 0;
  }
LABEL_1286:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v578) = 0;
    v575 = 0;
    v571 = 0;
    v568 = 0;
    v565 = 0;
    v562 = 0;
    v559 = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 35.33333;
    goto LABEL_573;
  }
LABEL_1290:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1294:
    LODWORD(v578) = 0;
    HIDWORD(v575) = 0;
    goto LABEL_1415;
  }
  v290 = __sb__runningInSpringBoard();
  if (v290)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1294;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v519 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v519, "userInterfaceIdiom"))
    {
      HIDWORD(v575) = 0;
      LODWORD(v578) = 1;
      goto LABEL_1415;
    }
  }
  LODWORD(v578) = v290 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v315 = __sb__runningInSpringBoard();
    if (v315)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v512 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v512, "_referenceBounds");
    }
    BSSizeRoundForScale();
    HIDWORD(v575) = v315 ^ 1;
    if (v334 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v575) = 0;
      v571 = 0;
      v568 = 0;
      v565 = 0;
      v562 = 0;
      v559 = 0;
      v556 = 0;
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 43.0;
      goto LABEL_573;
    }
  }
  else
  {
    HIDWORD(v575) = 0;
  }
LABEL_1415:
  v316 = __sb__runningInSpringBoard();
  if (v316)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v575) = 0;
      LODWORD(v571) = 0;
      goto LABEL_1425;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v524 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v524, "userInterfaceIdiom"))
    {
      LODWORD(v571) = 0;
      LODWORD(v575) = 1;
      goto LABEL_1425;
    }
  }
  LODWORD(v575) = v316 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v317 = __sb__runningInSpringBoard();
    if (v317)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v515 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v515, "_referenceBounds");
    }
    LODWORD(v571) = v317 ^ 1;
    BSSizeRoundForScale();
    if (v318 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1429;
  }
  else
  {
    LODWORD(v571) = 0;
  }
LABEL_1425:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    v568 = 0;
    HIDWORD(v571) = 0;
    v565 = 0;
    v562 = 0;
    v559 = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 35.33333;
    goto LABEL_573;
  }
LABEL_1429:
  v319 = __sb__runningInSpringBoard();
  if (v319)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v568 = 0;
      goto LABEL_1439;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v521 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v521, "userInterfaceIdiom"))
    {
      v568 = 0x100000000;
      goto LABEL_1439;
    }
  }
  HIDWORD(v568) = v319 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v320 = __sb__runningInSpringBoard();
    if (v320)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v513 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v513, "_referenceBounds");
    }
    LODWORD(v568) = v320 ^ 1;
    BSSizeRoundForScale();
    if (v330 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      HIDWORD(v571) = 0;
      v565 = 0;
      v562 = 0;
      v559 = 0;
      v556 = 0;
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    LODWORD(v568) = 0;
  }
LABEL_1439:
  v321 = __sb__runningInSpringBoard();
  if (v321)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v571) = 0;
      v322 = 0;
      goto LABEL_1467;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v517 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v517, "userInterfaceIdiom"))
    {
      v322 = 0;
      HIDWORD(v571) = 1;
      goto LABEL_1467;
    }
  }
  HIDWORD(v571) = v321 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v326 = __sb__runningInSpringBoard();
    if (v326)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v511 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v511, "_referenceBounds");
    }
    v322 = v326 ^ 1;
    BSSizeRoundForScale();
    if (v341 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1519;
  }
  else
  {
    v322 = 0;
  }
LABEL_1467:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    HIDWORD(v565) = v322;
    LODWORD(v565) = 0;
    v562 = 0;
    v559 = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 0.0;
    goto LABEL_573;
  }
LABEL_1519:
  HIDWORD(v565) = v322;
  v342 = __sb__runningInSpringBoard();
  if (v342)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v565) = 0;
      HIDWORD(v562) = 0;
      goto LABEL_1559;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v516 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v516, "userInterfaceIdiom"))
    {
      HIDWORD(v562) = 0;
      LODWORD(v565) = 1;
      goto LABEL_1559;
    }
  }
  LODWORD(v565) = v342 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v347 = __sb__runningInSpringBoard();
    if (v347)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v510 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v510, "_referenceBounds");
    }
    HIDWORD(v562) = v347 ^ 1;
    BSSizeRoundForScale();
    if (v355 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v562) = 0;
      v559 = 0;
      v556 = 0;
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 43.0;
      goto LABEL_573;
    }
  }
  else
  {
    HIDWORD(v562) = 0;
  }
LABEL_1559:
  v348 = __sb__runningInSpringBoard();
  if (v348)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v562) = 0;
      HIDWORD(v559) = 0;
      goto LABEL_1587;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v514 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v514, "userInterfaceIdiom"))
    {
      HIDWORD(v559) = 0;
      LODWORD(v562) = 1;
      goto LABEL_1587;
    }
  }
  LODWORD(v562) = v348 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    HIDWORD(v559) = 0;
    goto LABEL_1587;
  }
  v351 = __sb__runningInSpringBoard();
  if (v351)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v509 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v509, "_referenceBounds");
  }
  HIDWORD(v559) = v351 ^ 1;
  BSSizeRoundForScale();
  if (v359 < *(double *)(MEMORY[0x1E0DAB260] + 104))
  {
LABEL_1587:
    if ((_SBF_Private_IsD53() & 1) != 0)
    {
      LODWORD(v559) = 0;
      v556 = 0;
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 35.33333;
      goto LABEL_573;
    }
  }
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
    goto LABEL_1638;
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
    goto LABEL_1640;
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
LABEL_1638:
    LODWORD(v559) = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 44.0;
    goto LABEL_573;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
LABEL_1640:
    LODWORD(v559) = 0;
    v556 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 37.66666;
    goto LABEL_573;
  }
  v362 = __sb__runningInSpringBoard();
  if (v362)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v559) = 0;
      v556 = 0;
      goto LABEL_1699;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v508 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v508, "userInterfaceIdiom"))
    {
      v556 = 0;
      LODWORD(v559) = 1;
      goto LABEL_1699;
    }
  }
  LODWORD(v559) = v362 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v368 = __sb__runningInSpringBoard();
    if (v368)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v505 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v505, "_referenceBounds");
    }
    v556 = v368 ^ 1;
    BSSizeRoundForScale();
    if (v390 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v131 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    v556 = 0;
  }
LABEL_1699:
  v369 = __sb__runningInSpringBoard();
  if (v369)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v131 = 0;
      v132 = 0;
      goto LABEL_1739;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v507 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v507, "userInterfaceIdiom"))
    {
      v132 = 0;
      v131 = 1;
      goto LABEL_1739;
    }
  }
  v131 = v369 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v374 = __sb__runningInSpringBoard();
    if (v374)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v504 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v504, "_referenceBounds");
    }
    v132 = v374 ^ 1;
    BSSizeRoundForScale();
    if (v394 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    v132 = 0;
  }
LABEL_1739:
  v375 = __sb__runningInSpringBoard();
  if (!v375)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v506 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v506, "userInterfaceIdiom"))
    {
      v134 = 0;
      v133 = 1;
      goto LABEL_1779;
    }
LABEL_1775:
    v133 = v375 ^ 1;
    v384 = __sb__runningInSpringBoard();
    if (v384)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v113 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v113, "_referenceBounds");
    }
    v134 = v384 ^ 1;
    BSSizeRoundForScale();
    if (v385 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      goto LABEL_1782;
    goto LABEL_1779;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_1775;
  v133 = 0;
  v134 = 0;
LABEL_1779:
  v386 = __sb__runningInSpringBoard();
  if ((_DWORD)v386)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1782:
      v135 = 0;
      v136 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v112, "userInterfaceIdiom"))
    {
      v136 = 0.0;
      v135 = 1;
      goto LABEL_573;
    }
  }
  v135 = v386 ^ 1;
  v398 = __sb__runningInSpringBoard();
  if (v398)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v386 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v386, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v136 = 0.0;
  if (v398 != 1)

LABEL_573:
  if (v135)

  if (v134)
  if (v133)

  if (v132)
  if (v131)

  if (v556)
  if ((_DWORD)v559)

  if (HIDWORD(v559))
  if ((_DWORD)v562)

  if (HIDWORD(v562))
  if ((_DWORD)v565)

  if (HIDWORD(v565))
  if (HIDWORD(v571))

  if ((_DWORD)v568)
  if (HIDWORD(v568))

  if ((_DWORD)v571)
  if ((_DWORD)v575)

  if (HIDWORD(v575))
  if ((_DWORD)v578)

  if ((_DWORD)v584)
  if (HIDWORD(v584))

  if (HIDWORD(v578))
  if ((_DWORD)v581)

  if (HIDWORD(v588))
  if ((_DWORD)v591)

  if (HIDWORD(v581))
  if (HIDWORD(v591))

  if ((_DWORD)v594)
  if (HIDWORD(v594))

  if ((_DWORD)v588)
  if ((_DWORD)v597)

  if (HIDWORD(v597))
  if (LODWORD(v598[0]))

  if (HIDWORD(v598[0]))
  if (LODWORD(v598[1]))

  if (HIDWORD(v598[1]))
  if (LODWORD(v598[2]))

  if (HIDWORD(v598[2]))
  if (LODWORD(v598[3]))

  if (HIDWORD(v598[3]))
  if (LODWORD(v598[4]))

  if (HIDWORD(v598[4]))
  if (LODWORD(v598[5]))

  if (HIDWORD(v598[5]))
  if (LODWORD(v598[6]))

  if (HIDWORD(v598[6]))
  if (LODWORD(v598[7]))

  if (HIDWORD(v598[7]))
  if (LODWORD(v598[8]))
  {

    if (!HIDWORD(v598[8]))
      goto LABEL_671;
  }
  else if (!HIDWORD(v598[8]))
  {
LABEL_671:
    if ((_DWORD)v599)
      goto LABEL_672;
    goto LABEL_676;
  }

  if ((_DWORD)v599)
  {
LABEL_672:

    if (!HIDWORD(v599))
      goto LABEL_678;
    goto LABEL_677;
  }
LABEL_676:
  if (HIDWORD(v599))
LABEL_677:

LABEL_678:
  if (v104 == 0.0)
    v144 = 3;
  else
    v144 = -1;
  v145 = -[CSMagSafeSilhouetteConfiguration initWithSize:bottomOffset:cornerRadius:roundedCorners:]([CSMagSafeSilhouetteConfiguration alloc], "initWithSize:bottomOffset:cornerRadius:roundedCorners:", v144, v48, v73, v104, v136);
  silhouette = v3->_silhouette;
  v3->_silhouette = v145;

  v147 = (void *)MEMORY[0x1E0CD27A8];
  -[CSMagSafeSilhouetteConfiguration cornerRadius](v3->_silhouette, "cornerRadius");
  objc_msgSend(v147, "ringLayerWithBlendMode:cornerRadius:borderWidth:", v600);
  v148 = objc_claimAutoreleasedReturnValue();
  walletLayer = v3->_walletLayer;
  v3->_walletLayer = (CALayer *)v148;

  -[CALayer setCornerCurve:](v3->_walletLayer, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  LODWORD(v150) = 0;
  -[CALayer setOpacity:](v3->_walletLayer, "setOpacity:", v150);
  v151 = v3->_walletLayer;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v152 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v151, "setBackgroundColor:", objc_msgSend(v152, "CGColor"));

  -[CSMagSafeSilhouetteConfiguration bottomOffset](v3->_silhouette, "bottomOffset");
  if (v153 == 0.0)
    -[CALayer setMaskedCorners:](v3->_walletLayer, "setMaskedCorners:", -[CSMagSafeSilhouetteConfiguration roundedCornersMaskForOrientation:](v3->_silhouette, "roundedCornersMaskForOrientation:", objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation")));
  -[CSMagSafeAccessoryWalletView configuration](v3, "configuration");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "ring");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "ringDiameter");
  v157 = v156;
  -[CSMagSafeAccessoryWalletView configuration](v3, "configuration");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "ring");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "lineWidth");
  +[CSRingLayer ringLayerWithBlendMode:diameter:lineWidth:brightnessAmount:saturationAmount:](CSRingLayer, "ringLayerWithBlendMode:diameter:lineWidth:brightnessAmount:saturationAmount:", v600, v157, v160, 0.2, 1.25);
  v161 = objc_claimAutoreleasedReturnValue();
  trackRing = v3->_trackRing;
  v3->_trackRing = (CSRingLayer *)v161;

  v163 = v3->_trackRing;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v164 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CSRingLayer setStrokeColor:](v163, "setStrokeColor:", objc_msgSend(v164, "CGColor"));

  if (-[CSMagSafeAccessoryView isReduceTransparencyEnabled](v3, "isReduceTransparencyEnabled"))
  {
    -[CSMagSafeAccessoryWalletView layer](v3, "layer");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "addSublayer:", v3->_averageColorBackdropLayer);

  }
  if (-[CSMagSafeAccessoryView isReduceMotionEnabled](v3, "isReduceMotionEnabled"))
  {
    -[CSMagSafeAccessoryWalletView layer](v3, "layer");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "addSublayer:", v3->_backgroundRadiusBackdropLayer);

  }
  -[CSMagSafeAccessoryWalletView layer](v3, "layer");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "addSublayer:", v3->_backgroundBackdropLayer);

  -[CSMagSafeAccessoryWalletView layer](v3, "layer");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "insertSublayer:above:", v3->_trackRingBlurBackdropLayer, v3->_backgroundBackdropLayer);

  -[CSMagSafeAccessoryWalletView layer](v3, "layer");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "insertSublayer:above:", v3->_walletLayer, v3->_trackRingBlurBackdropLayer);

  -[CSMagSafeAccessoryWalletView layer](v3, "layer");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "insertSublayer:above:", v3->_trackRing, v3->_walletLayer);

LABEL_688:
  v171 = v3;

  return v171;
}

- (void)layoutSubviews
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
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  CABackdropLayer *averageColorBackdropLayer;
  CABackdropLayer *backgroundRadiusBackdropLayer;
  CABackdropLayer *backgroundBackdropLayer;
  CABackdropLayer *trackRingBlurBackdropLayer;
  CSRingLayer *trackRingBlurLayer;
  double v24;
  double v25;
  double v26;
  double v27;
  id *v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CSRingLayer *trackRing;
  double v45;
  double v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)CSMagSafeAccessoryWalletView;
  -[CSMagSafeAccessoryView layoutSubviews](&v47, sel_layoutSubviews);
  -[CSMagSafeAccessoryWalletView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CSMagSafeAccessoryWalletView setFrame:](self, "setFrame:", v5, v7, v9, v11);
  -[CSMagSafeAccessoryWalletView configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ring");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ringDiameter");
  v46 = v14;
  -[CSMagSafeAccessoryWalletView configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ring");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ringDiameter");
  v18 = v17;

  if (-[CSMagSafeAccessoryView isReduceTransparencyEnabled](self, "isReduceTransparencyEnabled"))
  {
    -[CABackdropLayer setBounds:](self->_averageColorBackdropLayer, "setBounds:", v5, v7, v9, v11);
    averageColorBackdropLayer = self->_averageColorBackdropLayer;
    -[CABackdropLayer bounds](averageColorBackdropLayer, "bounds");
    -[CSMagSafeAccessoryWalletView bounds](self, "bounds");
    UIRectCenteredIntegralRect();
    UIRectGetCenter();
    -[CABackdropLayer setPosition:](averageColorBackdropLayer, "setPosition:");
  }
  if (-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled", *(_QWORD *)&v11))
  {
    -[CABackdropLayer setBounds:](self->_backgroundRadiusBackdropLayer, "setBounds:", v5, v7, v9, v11);
    backgroundRadiusBackdropLayer = self->_backgroundRadiusBackdropLayer;
    -[CABackdropLayer bounds](backgroundRadiusBackdropLayer, "bounds");
    -[CSMagSafeAccessoryWalletView bounds](self, "bounds");
    v11 = v45;
    UIRectCenteredIntegralRect();
    UIRectGetCenter();
    -[CABackdropLayer setPosition:](backgroundRadiusBackdropLayer, "setPosition:");
  }
  -[CABackdropLayer setBounds:](self->_backgroundBackdropLayer, "setBounds:", v5, v7, v9, v11);
  backgroundBackdropLayer = self->_backgroundBackdropLayer;
  -[CABackdropLayer bounds](backgroundBackdropLayer, "bounds");
  -[CSMagSafeAccessoryWalletView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CABackdropLayer setPosition:](backgroundBackdropLayer, "setPosition:");
  -[CABackdropLayer setBounds:](self->_trackRingBlurBackdropLayer, "setBounds:", 0.0, 0.0, v46, v18);
  trackRingBlurBackdropLayer = self->_trackRingBlurBackdropLayer;
  -[CABackdropLayer bounds](trackRingBlurBackdropLayer, "bounds");
  -[CSMagSafeAccessoryWalletView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CABackdropLayer setPosition:](trackRingBlurBackdropLayer, "setPosition:");
  -[CSRingLayer setBounds:](self->_trackRingBlurLayer, "setBounds:", 0.0, 0.0, v46, v18);
  trackRingBlurLayer = self->_trackRingBlurLayer;
  -[CSRingLayer bounds](trackRingBlurLayer, "bounds");
  -[CABackdropLayer bounds](self->_trackRingBlurBackdropLayer, "bounds");
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CSRingLayer setPosition:](trackRingBlurLayer, "setPosition:");
  -[CSMagSafeSilhouetteConfiguration size](self->_silhouette, "size");
  v25 = v24;
  -[CSMagSafeSilhouetteConfiguration size](self->_silhouette, "size");
  v27 = v26;
  v28 = (id *)MEMORY[0x1E0CEB258];
  v29 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
  if ((unint64_t)(v29 - 1) >= 2)
    v30 = v25;
  else
    v30 = v27;
  if ((unint64_t)(v29 - 1) >= 2)
    v31 = v27;
  else
    v31 = v25;
  v32 = objc_msgSend(*v28, "activeInterfaceOrientation");
  if ((unint64_t)(v32 - 1) > 1)
  {
    if (v32 == 3)
    {
      -[CSMagSafeAccessoryWalletView bounds](self, "bounds");
      v40 = v39;
      -[CSMagSafeSilhouetteConfiguration bottomOffset](self->_silhouette, "bottomOffset");
      v34 = v40 - (v31 + v41);
    }
    else
    {
      -[CSMagSafeSilhouetteConfiguration bottomOffset](self->_silhouette, "bottomOffset");
      v34 = v42;
    }
    -[CSMagSafeAccessoryWalletView bounds](self, "bounds");
    v38 = (v43 - v30) * 0.5;
  }
  else
  {
    -[CSMagSafeAccessoryWalletView bounds](self, "bounds");
    v34 = (v33 - v31) * 0.5;
    -[CSMagSafeAccessoryWalletView bounds](self, "bounds");
    v36 = v35;
    -[CSMagSafeSilhouetteConfiguration bottomOffset](self->_silhouette, "bottomOffset");
    v38 = v36 - (v30 + v37);
  }
  -[CALayer setFrame:](self->_walletLayer, "setFrame:", v34, v38, v31, v30);
  -[CSRingLayer setBounds:](self->_trackRing, "setBounds:", 0.0, 0.0, v46, v18);
  trackRing = self->_trackRing;
  -[CSRingLayer bounds](trackRing, "bounds");
  -[CSMagSafeAccessoryWalletView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CSRingLayer setPosition:](trackRing, "setPosition:");
}

- (void)_presentAnimation
{
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CABackdropLayer *backgroundRadiusBackdropLayer;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
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
  uint64_t v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v3 = CACurrentMediaTime();
  if (-[CSMagSafeAccessoryView isReduceTransparencyEnabled](self, "isReduceTransparencyEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeyTimes:", &unk_1E8E88F50);
    objc_msgSend(v4, "setValues:", &unk_1E8E88F68);
    objc_msgSend(v4, "setDuration:", 0.42);
    objc_msgSend(v4, "setRemovedOnCompletion:", 0);
    v5 = *MEMORY[0x1E0CD2B60];
    objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    v6 = *MEMORY[0x1E0CD3058];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v7);

    -[CABackdropLayer addAnimation:forKey:](self->_averageColorBackdropLayer, "addAnimation:forKey:", v4, CFSTR("opacity"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.colorBrightness.inputAmount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeyTimes:", &unk_1E8E88F80);
    objc_msgSend(v4, "setValues:", &unk_1E8E88F98);
    objc_msgSend(v4, "setDuration:", 0.42);
    objc_msgSend(v4, "setRemovedOnCompletion:", 0);
    v5 = *MEMORY[0x1E0CD2B60];
    objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    v6 = *MEMORY[0x1E0CD3058];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v8);

    -[CABackdropLayer addAnimation:forKey:](self->_backgroundBackdropLayer, "addAnimation:forKey:", v4, CFSTR("filters.colorBrightness.inputAmount"));
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.colorSaturate.inputAmount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setKeyTimes:", &unk_1E8E88FB0);
    objc_msgSend(v9, "setValues:", &unk_1E8E88FC8);
    objc_msgSend(v9, "setDuration:", 0.42);
    objc_msgSend(v9, "setRemovedOnCompletion:", 0);
    objc_msgSend(v9, "setFillMode:", v5);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimingFunction:", v10);

    -[CABackdropLayer addAnimation:forKey:](self->_backgroundBackdropLayer, "addAnimation:forKey:", v9, CFSTR("filters.colorSaturate.inputAmount"));
    if (-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setKeyTimes:", &unk_1E8E89010);
      objc_msgSend(v11, "setValues:", &unk_1E8E89028);
      objc_msgSend(v11, "setDuration:", 0.42);
      objc_msgSend(v11, "setRemovedOnCompletion:", 0);
      objc_msgSend(v11, "setFillMode:", v5);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTimingFunction:", v12);

      backgroundRadiusBackdropLayer = self->_backgroundRadiusBackdropLayer;
      v14 = v11;
      v15 = CFSTR("opacity");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setKeyTimes:", &unk_1E8E88FE0);
      objc_msgSend(v11, "setValues:", &unk_1E8E88FF8);
      objc_msgSend(v11, "setDuration:", 0.42);
      objc_msgSend(v11, "setRemovedOnCompletion:", 0);
      objc_msgSend(v11, "setFillMode:", v5);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTimingFunction:", v16);

      backgroundRadiusBackdropLayer = self->_backgroundBackdropLayer;
      v14 = v11;
      v15 = CFSTR("filters.gaussianBlur.inputRadius");
    }
    -[CABackdropLayer addAnimation:forKey:](backgroundRadiusBackdropLayer, "addAnimation:forKey:", v14, v15);

  }
  if (-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled"))
  {
    v17 = *MEMORY[0x1E0CD3048];
    v18 = v3 + 0.25;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[CSMagSafeAccessoryWalletView configuration](self, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ring");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lineWidth");
    *(float *)&v22 = v22;
    objc_msgSend(v19, "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("lineWidth"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v3 + 0.25;
    objc_msgSend(v24, "setBeginTime:", v18);
    objc_msgSend(v24, "setKeyTimes:", &unk_1E8E89040);
    v36[0] = &unk_1E8E87940;
    v36[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setValues:", v25);

    objc_msgSend(v24, "setDuration:", 0.3);
    objc_msgSend(v24, "setRemovedOnCompletion:", 0);
    objc_msgSend(v24, "setFillMode:", v5);
    v17 = *MEMORY[0x1E0CD3048];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTimingFunction:", v26);

    -[CSRingLayer addAnimation:forKey:](self->_trackRingBlurLayer, "addAnimation:forKey:", v24, CFSTR("lineWidth"));
    -[CSRingLayer addAnimation:forKey:](self->_trackRing, "addAnimation:forKey:", v24, CFSTR("lineWidth"));

  }
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"), v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBeginTime:", v18);
  objc_msgSend(v27, "setKeyTimes:", &unk_1E8E89058);
  objc_msgSend(v27, "setValues:", &unk_1E8E89070);
  objc_msgSend(v27, "setDuration:", 0.3);
  objc_msgSend(v27, "setRemovedOnCompletion:", 0);
  objc_msgSend(v27, "setFillMode:", v5);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTimingFunction:", v28);

  -[CSRingLayer addAnimation:forKey:](self->_trackRing, "addAnimation:forKey:", v27, CFSTR("opacity"));
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBeginTime:", v18);
  objc_msgSend(v29, "setKeyTimes:", &unk_1E8E89088);
  objc_msgSend(v29, "setValues:", &unk_1E8E890A0);
  objc_msgSend(v29, "setDuration:", 0.3);
  objc_msgSend(v29, "setRemovedOnCompletion:", 0);
  objc_msgSend(v29, "setFillMode:", v5);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v17);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTimingFunction:", v30);

  -[CABackdropLayer addAnimation:forKey:](self->_trackRingBlurBackdropLayer, "addAnimation:forKey:", v29, CFSTR("opacity"));
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBeginTime:", v18);
  objc_msgSend(v31, "setKeyTimes:", &unk_1E8E890B8);
  objc_msgSend(v31, "setValues:", &unk_1E8E890D0);
  objc_msgSend(v31, "setDuration:", 0.3);
  objc_msgSend(v31, "setRemovedOnCompletion:", 0);
  objc_msgSend(v31, "setFillMode:", v5);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v17);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTimingFunction:", v32);

  -[CSRingLayer addAnimation:forKey:](self->_trackRingBlurLayer, "addAnimation:forKey:", v31, CFSTR("opacity"));
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBeginTime:", v18);
  objc_msgSend(v33, "setKeyTimes:", &unk_1E8E890E8);
  objc_msgSend(v33, "setValues:", &unk_1E8E89100);
  objc_msgSend(v33, "setDuration:", 0.3);
  objc_msgSend(v33, "setRemovedOnCompletion:", 0);
  objc_msgSend(v33, "setFillMode:", v5);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTimingFunction:", v34);

  -[CALayer addAnimation:forKey:](self->_walletLayer, "addAnimation:forKey:", v33, CFSTR("opacity"));
}

- (void)_dismissAnimation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CABackdropLayer *backgroundRadiusBackdropLayer;
  void *v29;
  const __CFString *v30;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyTimes:", &unk_1E8E89118);
  objc_msgSend(v3, "setValues:", &unk_1E8E89130);
  objc_msgSend(v3, "setDuration:", 0.3);
  objc_msgSend(v3, "setRemovedOnCompletion:", 0);
  v4 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  v5 = *MEMORY[0x1E0CD3048];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunction:", v6);

  -[CSRingLayer addAnimation:forKey:](self->_trackRing, "addAnimation:forKey:", v3, CFSTR("fadeOut"));
  if (!-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled"))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[CSMagSafeAccessoryWalletView configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ring");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lineWidth");
    *(float *)&v10 = v10;
    objc_msgSend(v7, "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("lineWidth"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setKeyTimes:", &unk_1E8E89148);
    v32[0] = v11;
    v32[1] = &unk_1E8E87940;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValues:", v13);

    objc_msgSend(v12, "setDuration:", 0.3);
    objc_msgSend(v12, "setRemovedOnCompletion:", 0);
    objc_msgSend(v12, "setFillMode:", v4);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTimingFunction:", v14);

    -[CSRingLayer addAnimation:forKey:](self->_trackRing, "addAnimation:forKey:", v12, CFSTR("lineWidthDismiss"));
    -[CSRingLayer addAnimation:forKey:](self->_trackRingBlurLayer, "addAnimation:forKey:", v12, CFSTR("lineWidthDismiss"));

  }
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setKeyTimes:", &unk_1E8E89160);
  objc_msgSend(v15, "setValues:", &unk_1E8E89178);
  objc_msgSend(v15, "setDuration:", 0.3);
  objc_msgSend(v15, "setRemovedOnCompletion:", 0);
  objc_msgSend(v15, "setFillMode:", v4);
  v16 = *MEMORY[0x1E0CD3058];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v17);

  -[CALayer addAnimation:forKey:](self->_walletLayer, "addAnimation:forKey:", v15, CFSTR("fadeOut"));
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setKeyTimes:", &unk_1E8E89190);
  objc_msgSend(v18, "setValues:", &unk_1E8E891A8);
  objc_msgSend(v18, "setDuration:", 0.3);
  objc_msgSend(v18, "setRemovedOnCompletion:", 0);
  objc_msgSend(v18, "setFillMode:", v4);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTimingFunction:", v19);

  -[CABackdropLayer addAnimation:forKey:](self->_trackRingBlurBackdropLayer, "addAnimation:forKey:", v18, CFSTR("fadeOut"));
  v20 = CACurrentMediaTime();
  if (-[CSMagSafeAccessoryView isReduceTransparencyEnabled](self, "isReduceTransparencyEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setKeyTimes:", &unk_1E8E891C0);
    objc_msgSend(v21, "setValues:", &unk_1E8E891D8);
    objc_msgSend(v21, "setBeginTime:", v20 + 0.07);
    objc_msgSend(v21, "setDuration:", 0.26);
    objc_msgSend(v21, "setRemovedOnCompletion:", 0);
    objc_msgSend(v21, "setFillMode:", v4);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTimingFunction:", v22);

    -[CABackdropLayer addAnimation:forKey:](self->_averageColorBackdropLayer, "addAnimation:forKey:", v21, CFSTR("opacity"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.colorBrightness.inputAmount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBeginTime:", v20 + 0.07);
    objc_msgSend(v21, "setKeyTimes:", &unk_1E8E891F0);
    objc_msgSend(v21, "setValues:", &unk_1E8E89208);
    objc_msgSend(v21, "setDuration:", 0.26);
    objc_msgSend(v21, "setRemovedOnCompletion:", 0);
    objc_msgSend(v21, "setFillMode:", v4);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTimingFunction:", v23);

    -[CABackdropLayer addAnimation:forKey:](self->_backgroundBackdropLayer, "addAnimation:forKey:", v21, CFSTR("brightnessDismiss"));
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.colorSaturate.inputAmount"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBeginTime:", v20 + 0.07);
    objc_msgSend(v24, "setKeyTimes:", &unk_1E8E89220);
    objc_msgSend(v24, "setValues:", &unk_1E8E89238);
    objc_msgSend(v24, "setDuration:", 0.26);
    objc_msgSend(v24, "setRemovedOnCompletion:", 0);
    objc_msgSend(v24, "setFillMode:", v4);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTimingFunction:", v25);

    -[CABackdropLayer addAnimation:forKey:](self->_backgroundBackdropLayer, "addAnimation:forKey:", v24, CFSTR("dismissSaturation"));
    if (-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setKeyTimes:", &unk_1E8E89280);
      objc_msgSend(v26, "setValues:", &unk_1E8E89298);
      objc_msgSend(v26, "setDuration:", 0.26);
      objc_msgSend(v26, "setRemovedOnCompletion:", 0);
      objc_msgSend(v26, "setFillMode:", v4);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTimingFunction:", v27);

      backgroundRadiusBackdropLayer = self->_backgroundRadiusBackdropLayer;
      v29 = v26;
      v30 = CFSTR("opacity");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBeginTime:", v20 + 0.07);
      objc_msgSend(v26, "setKeyTimes:", &unk_1E8E89250);
      objc_msgSend(v26, "setValues:", &unk_1E8E89268);
      objc_msgSend(v26, "setDuration:", 0.26);
      objc_msgSend(v26, "setRemovedOnCompletion:", 0);
      objc_msgSend(v26, "setFillMode:", v4);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTimingFunction:", v31);

      backgroundRadiusBackdropLayer = self->_backgroundBackdropLayer;
      v30 = CFSTR("dismissGaussianBlur");
      v29 = v26;
    }
    -[CABackdropLayer addAnimation:forKey:](backgroundRadiusBackdropLayer, "addAnimation:forKey:", v29, v30);

  }
}

- (void)_runAnimationWithType:(unint64_t)a3
{
  if (a3 == 1)
  {
    -[CSMagSafeAccessoryWalletView _dismissAnimation](self, "_dismissAnimation");
  }
  else if (!a3)
  {
    -[CSMagSafeAccessoryWalletView _presentAnimation](self, "_presentAnimation");
  }
}

- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;

  v6 = (void *)MEMORY[0x1E0CD28B0];
  v7 = a4;
  objc_msgSend(v6, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v7);

  -[CSMagSafeAccessoryWalletView _runAnimationWithType:](self, "_runAnimationWithType:", a3);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (double)animationDurationBeforeDismissal
{
  return 1.9;
}

- (CSMagSafeAccessoryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (CABackdropLayer)averageColorBackdropLayer
{
  return self->_averageColorBackdropLayer;
}

- (void)setAverageColorBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_averageColorBackdropLayer, a3);
}

- (CABackdropLayer)backgroundRadiusBackdropLayer
{
  return self->_backgroundRadiusBackdropLayer;
}

- (void)setBackgroundRadiusBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundRadiusBackdropLayer, a3);
}

- (CABackdropLayer)backgroundBackdropLayer
{
  return self->_backgroundBackdropLayer;
}

- (void)setBackgroundBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBackdropLayer, a3);
}

- (CABackdropLayer)trackRingBlurBackdropLayer
{
  return self->_trackRingBlurBackdropLayer;
}

- (void)setTrackRingBlurBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_trackRingBlurBackdropLayer, a3);
}

- (CSRingLayer)trackRingBlurLayer
{
  return self->_trackRingBlurLayer;
}

- (void)setTrackRingBlurLayer:(id)a3
{
  objc_storeStrong((id *)&self->_trackRingBlurLayer, a3);
}

- (CALayer)walletLayer
{
  return self->_walletLayer;
}

- (void)setWalletLayer:(id)a3
{
  objc_storeStrong((id *)&self->_walletLayer, a3);
}

- (CSRingLayer)trackRing
{
  return self->_trackRing;
}

- (void)setTrackRing:(id)a3
{
  objc_storeStrong((id *)&self->_trackRing, a3);
}

- (CSMagSafeSilhouetteConfiguration)silhouette
{
  return self->_silhouette;
}

- (void)setSilhouette:(id)a3
{
  objc_storeStrong((id *)&self->_silhouette, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_silhouette, 0);
  objc_storeStrong((id *)&self->_trackRing, 0);
  objc_storeStrong((id *)&self->_walletLayer, 0);
  objc_storeStrong((id *)&self->_trackRingBlurLayer, 0);
  objc_storeStrong((id *)&self->_trackRingBlurBackdropLayer, 0);
  objc_storeStrong((id *)&self->_backgroundBackdropLayer, 0);
  objc_storeStrong((id *)&self->_backgroundRadiusBackdropLayer, 0);
  objc_storeStrong((id *)&self->_averageColorBackdropLayer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
