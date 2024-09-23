@implementation MRUMediaControlsModuleNowPlayingView

- (MRUMediaControlsModuleNowPlayingView)initWithFrame:(CGRect)a3
{
  MRUMediaControlsModuleNowPlayingView *v3;
  MRUNowPlayingHeaderView *v4;
  MRUNowPlayingHeaderView *headerView;
  void *v6;
  MRUNowPlayingTimeControlsView *v7;
  MRUNowPlayingTimeControlsView *timeControlsView;
  MRUNowPlayingTransportControlsView *v9;
  MRUNowPlayingTransportControlsView *transportControlsView;
  MRUNowPlayingVolumeControlsView *v11;
  MRUNowPlayingVolumeControlsView *volumeControlsView;
  MRUArtworkView *v13;
  MRUArtworkView *artworkView;
  void *v15;
  MRUMediaControlsModuleRouteButton *v16;
  MRUMediaControlsModuleRouteButton *upperRoutingButton;
  MRUMediaControlsModuleRouteButton *v18;
  MRUMediaControlsModuleRouteButton *lowerRoutingButton;
  uint64_t v20;
  NSArray *routingButtons;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)MRUMediaControlsModuleNowPlayingView;
  v3 = -[MRUMediaControlsModuleNowPlayingView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MRUNowPlayingHeaderView);
    headerView = v3->_headerView;
    v3->_headerView = v4;

    -[MRUNowPlayingHeaderView labelView](v3->_headerView, "labelView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMarqueeFadeEdgeInsets:", 0.0, 3.0, 0.0, -9.0);

    -[MRUMediaControlsModuleNowPlayingView addSubview:](v3, "addSubview:", v3->_headerView);
    v7 = objc_alloc_init(MRUNowPlayingTimeControlsView);
    timeControlsView = v3->_timeControlsView;
    v3->_timeControlsView = v7;

    -[MRUMediaControlsModuleNowPlayingView addSubview:](v3, "addSubview:", v3->_timeControlsView);
    v9 = objc_alloc_init(MRUNowPlayingTransportControlsView);
    transportControlsView = v3->_transportControlsView;
    v3->_transportControlsView = v9;

    -[MRUMediaControlsModuleNowPlayingView addSubview:](v3, "addSubview:", v3->_transportControlsView);
    v11 = objc_alloc_init(MRUNowPlayingVolumeControlsView);
    volumeControlsView = v3->_volumeControlsView;
    v3->_volumeControlsView = v11;

    -[MRUMediaControlsModuleNowPlayingView addSubview:](v3, "addSubview:", v3->_volumeControlsView);
    v13 = objc_alloc_init(MRUArtworkView);
    artworkView = v3->_artworkView;
    v3->_artworkView = v13;

    -[MRUArtworkView pointerInteraction](v3->_artworkView, "pointerInteraction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", 1);

    -[MRUMediaControlsModuleNowPlayingView addSubview:](v3, "addSubview:", v3->_artworkView);
    v16 = objc_alloc_init(MRUMediaControlsModuleRouteButton);
    upperRoutingButton = v3->_upperRoutingButton;
    v3->_upperRoutingButton = v16;

    -[MRUMediaControlsModuleRouteButton setShowRouteLabel:](v3->_upperRoutingButton, "setShowRouteLabel:", 0);
    -[MRUTransportButton setSelected:](v3->_upperRoutingButton, "setSelected:", 1);
    -[MRUMediaControlsModuleRouteButton setAccessibilityIdentifier:](v3->_upperRoutingButton, "setAccessibilityIdentifier:", CFSTR("mru-router-upper"));
    -[MRUMediaControlsModuleNowPlayingView addSubview:](v3, "addSubview:", v3->_upperRoutingButton);
    v18 = objc_alloc_init(MRUMediaControlsModuleRouteButton);
    lowerRoutingButton = v3->_lowerRoutingButton;
    v3->_lowerRoutingButton = v18;

    -[MRUMediaControlsModuleRouteButton setShowRouteLabel:](v3->_lowerRoutingButton, "setShowRouteLabel:", 1);
    -[MRUTransportButton setSelected:](v3->_lowerRoutingButton, "setSelected:", 1);
    -[MRUMediaControlsModuleRouteButton setAccessibilityIdentifier:](v3->_lowerRoutingButton, "setAccessibilityIdentifier:", CFSTR("mru-router-lower"));
    -[MRUMediaControlsModuleNowPlayingView addSubview:](v3, "addSubview:", v3->_lowerRoutingButton);
    v24[0] = v3->_upperRoutingButton;
    v24[1] = v3->_lowerRoutingButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v20 = objc_claimAutoreleasedReturnValue();
    routingButtons = v3->_routingButtons;
    v3->_routingButtons = (NSArray *)v20;

    -[MRUMediaControlsModuleNowPlayingView updateLayout](v3, "updateLayout");
    -[MRUMediaControlsModuleNowPlayingView updateVisibility](v3, "updateVisibility");
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CCUIModuleContentMetrics *contentMetrics;
  double v26;
  CCUIModuleContentMetrics *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  double Width;
  double Height;
  double v84;
  double v85;
  CGFloat MinX;
  CGFloat MinY;
  double v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  double v96;
  CGFloat v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  double v110;
  CGFloat v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  id *p_headerView;
  double v121;
  double v122;
  double v123;
  double v124;
  CGFloat MaxY;
  CGFloat v126;
  CGFloat x;
  CGFloat y;
  CGFloat v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  CGFloat v139;
  double v140;
  CGFloat v141;
  double v142;
  CGFloat v143;
  double v144;
  CGFloat v145;
  double v146;
  CGFloat v147;
  double v148;
  CGFloat v149;
  double v150;
  CGFloat v151;
  double v152;
  CGFloat v153;
  double v154;
  double v155;
  double v156;
  CGFloat v157;
  double v158;
  CGFloat v159;
  unsigned int v160;
  double v161;
  double v162;
  CGFloat v163;
  double v164;
  CGFloat v165;
  CGFloat v166;
  double v167;
  CGFloat v168;
  double v169;
  CGFloat v170;
  double v171;
  CGFloat v172;
  double v173;
  CGFloat v174;
  double v175;
  CGFloat v176;
  double v177;
  double v178;
  CGFloat v179;
  CGFloat v180;
  double v181;
  CGFloat v182;
  double v183;
  CGFloat v184;
  double v185;
  CGFloat v186;
  double v187;
  CGFloat v188;
  CGFloat v189;
  double v190;
  CGFloat v191;
  double v192;
  CGFloat v193;
  double v194;
  CGFloat v195;
  CGFloat v196;
  CGFloat v197;
  CGFloat v198;
  CGFloat v199;
  MRUNowPlayingHeaderView *headerView;
  double v201;
  double v202;
  double v203;
  CGFloat v204;
  double v205;
  CGFloat v206;
  double v207;
  CGFloat v208;
  double v209;
  CGFloat v210;
  double v211;
  CGFloat v212;
  double v213;
  CGFloat v214;
  double v215;
  CGFloat v216;
  double v217;
  CGFloat v218;
  double v219;
  CGFloat v220;
  double v221;
  CGFloat v222;
  double v223;
  CGFloat v224;
  double v225;
  CGFloat v226;
  double v227;
  CGFloat v228;
  double v229;
  CGFloat v230;
  double v231;
  CGFloat v232;
  double v233;
  CGFloat v234;
  double v235;
  CGFloat v236;
  double v237;
  CGFloat v238;
  double v239;
  CGFloat v240;
  double v241;
  CGFloat v242;
  double v243;
  CGFloat v244;
  double v245;
  CGFloat v246;
  double v247;
  CGFloat v248;
  double v249;
  CGFloat v250;
  double v251;
  double v252;
  CGFloat v253;
  CGFloat v254;
  MRUNowPlayingHeaderView *v255;
  double v256;
  double v257;
  double v258;
  CGFloat v259;
  double v260;
  CGFloat v261;
  double v262;
  CGFloat v263;
  double v264;
  CGFloat v265;
  double v266;
  double v267;
  double v268;
  double v269;
  double v270;
  double v271;
  double v272;
  CGFloat v273;
  double v274;
  CGFloat v275;
  double v276;
  CGFloat v277;
  double v278;
  CGFloat v279;
  CGFloat v280;
  CGFloat v281;
  CGFloat v282;
  CGFloat v283;
  double v284;
  double v285;
  double v286;
  double v287;
  double v288;
  CGFloat v289;
  double v290;
  CGFloat v291;
  double v292;
  CGFloat v293;
  double v294;
  CGFloat v295;
  double v296;
  CGFloat v297;
  double v298;
  CGFloat v299;
  double v300;
  CGFloat v301;
  double v302;
  CGFloat v303;
  double v304;
  CGFloat v305;
  double v306;
  CGFloat v307;
  double v308;
  CGFloat v309;
  double v310;
  CGFloat v311;
  double v312;
  double v313;
  double v314;
  double v315;
  double v316;
  double v317;
  double v318;
  double v319;
  double v320;
  double v321;
  double v322;
  double v323;
  double v324;
  double v325;
  double v326;
  double v327;
  double v328;
  double v329;
  double v330;
  double v331;
  double v332;
  CGFloat v333;
  double v334;
  CGFloat v335;
  double v336;
  CGFloat v337;
  double v338;
  CGFloat v339;
  double v340;
  CGFloat v341;
  double v342;
  CGFloat v343;
  double v344;
  CGFloat v345;
  double v346;
  CGFloat v347;
  double v348;
  CGFloat v349;
  double v350;
  CGFloat v351;
  double v352;
  CGFloat v353;
  double v354;
  CGFloat v355;
  double v356;
  CGFloat v357;
  double v358;
  CGFloat v359;
  double v360;
  CGFloat v361;
  double v362;
  CGFloat v363;
  double v364;
  CGFloat v365;
  double v366;
  CGFloat v367;
  double v368;
  CGFloat v369;
  double v370;
  CGFloat v371;
  double v372;
  double v373;
  double v374;
  double v375;
  double v376;
  double v377;
  double v378;
  CGFloat v379;
  double v380;
  CGFloat v381;
  double v382;
  CGFloat v383;
  double v384;
  CGFloat v385;
  double v386;
  CGFloat v387;
  double v388;
  CGFloat v389;
  double v390;
  CGFloat v391;
  double v392;
  CGFloat v393;
  double v394;
  CGFloat v395;
  double v396;
  CGFloat v397;
  double v398;
  CGFloat v399;
  double v400;
  CGFloat v401;
  double v402;
  CGFloat v403;
  double v404;
  CGFloat v405;
  double v406;
  CGFloat v407;
  double v408;
  CGFloat v409;
  double v410;
  CGFloat v411;
  double v412;
  CGFloat v413;
  double v414;
  CGFloat v415;
  double v416;
  CGFloat v417;
  double v418;
  CGFloat v419;
  double v420;
  CGFloat v421;
  double v422;
  CGFloat v423;
  double v424;
  CGFloat v425;
  double v426;
  CGFloat v427;
  double v428;
  CGFloat v429;
  double v430;
  CGFloat v431;
  double v432;
  CGFloat v433;
  double v434;
  double v435;
  double v436;
  double v437;
  double v438;
  CGFloat v439;
  CGFloat v440;
  double v441;
  CGFloat v442;
  double v443;
  CGFloat v444;
  double v445;
  CGFloat v446;
  double v447;
  CGFloat v448;
  double v449;
  CGFloat v450;
  double v451;
  CGFloat v452;
  double v453;
  CGFloat v454;
  double v455;
  CGFloat v456;
  CGFloat v457;
  CGFloat v458;
  CGFloat v459;
  CGFloat v460;
  double v461;
  double v462;
  double v463;
  double v464;
  double v465;
  CGFloat v466;
  double v467;
  CGFloat v468;
  double v469;
  CGFloat v470;
  double v471;
  CGFloat v472;
  double v473;
  CGFloat v474;
  double v475;
  CGFloat v476;
  double v477;
  CGFloat v478;
  double v479;
  CGFloat v480;
  double v481;
  double v482;
  double v483;
  double v484;
  double v485;
  CGFloat v486;
  CGFloat v487;
  double v488;
  CGFloat v489;
  double v490;
  CGFloat v491;
  double v492;
  CGFloat v493;
  double v494;
  CGFloat v495;
  double v496;
  CGFloat v497;
  double v498;
  CGFloat v499;
  double v500;
  CGFloat v501;
  double v502;
  CGFloat v503;
  double v504;
  double v505;
  CGFloat v506;
  CGFloat v507;
  double v508;
  CGFloat v509;
  double v510;
  CGFloat v511;
  double v512;
  CGFloat v513;
  double v514;
  CGFloat v515;
  double v516;
  CGFloat v517;
  CGFloat v518;
  CGFloat v519;
  double v520;
  CGFloat v521;
  double v522;
  double v523;
  double v524;
  CGFloat v525;
  CGFloat v526;
  CGFloat v527;
  double v528;
  CGFloat v529;
  CGFloat v530;
  double v531;
  CGFloat v532;
  double v533;
  CGFloat v534;
  CGRect rect;
  CGRect v536;
  CGRect v537;
  CGRect v538;
  CGRect v539;
  CGRect v540;
  CGRect v541;
  CGRect v542;
  CGRect v543;
  CGRect v544;
  CGRect v545;
  CGRect v546;
  CGRect v547;
  CGRect v548;
  CGRect v549;
  CGRect v550;
  CGRect v551;
  CGRect v552;
  CGRect v553;
  CGRect v554;
  CGRect v555;
  CGRect v556;
  CGRect v557;
  CGRect v558;
  CGRect v559;
  CGRect v560;
  CGRect v561;
  CGRect v562;
  CGRect v563;
  CGRect v564;
  CGRect v565;
  CGRect v566;
  CGRect v567;
  CGRect v568;
  CGRect v569;
  CGRect v570;
  CGRect v571;
  CGRect v572;
  CGRect v573;
  CGRect v574;
  CGRect v575;
  CGRect v576;
  CGRect v577;
  CGRect v578;
  CGRect v579;
  CGRect v580;
  CGRect v581;
  CGRect v582;
  CGRect v583;
  CGRect v584;
  CGRect v585;
  CGRect v586;
  CGRect v587;
  CGRect v588;
  CGRect v589;
  CGRect v590;
  CGRect v591;
  CGRect v592;
  CGRect v593;
  CGRect v594;
  CGRect v595;
  CGRect v596;
  CGRect v597;
  CGRect v598;
  CGRect v599;
  CGRect v600;
  CGRect v601;
  CGRect v602;
  CGRect v603;
  CGRect v604;
  CGRect v605;
  CGRect v606;
  CGRect v607;
  CGRect v608;
  CGRect v609;
  CGRect v610;
  CGRect v611;
  CGRect v612;
  CGRect v613;
  CGRect v614;
  CGRect v615;
  CGRect v616;
  CGRect v617;
  CGRect v618;
  CGRect v619;
  CGRect v620;
  CGRect v621;
  CGRect v622;
  CGRect v623;
  CGRect v624;
  CGRect v625;
  CGRect v626;
  CGRect v627;
  CGRect v628;
  CGRect v629;
  CGRect v630;
  CGRect v631;
  CGRect v632;
  CGRect v633;
  CGRect v634;
  CGRect v635;
  CGRect v636;
  CGRect v637;
  CGRect v638;
  CGRect v639;
  CGRect v640;
  CGRect v641;
  CGRect v642;
  CGRect v643;
  CGRect v644;
  CGRect v645;
  CGRect v646;
  CGRect v647;
  CGRect v648;
  CGRect v649;
  CGRect v650;
  CGRect v651;
  CGRect v652;
  CGRect v653;
  CGRect v654;
  CGRect v655;
  CGRect v656;
  CGRect v657;
  CGRect v658;
  CGRect v659;
  CGRect v660;
  CGRect v661;
  CGRect v662;
  CGRect v663;
  CGRect v664;
  CGRect v665;
  CGRect v666;
  CGRect v667;
  CGRect v668;
  CGRect v669;
  CGRect v670;
  CGRect v671;
  CGRect v672;
  CGRect v673;
  CGRect v674;
  CGRect v675;
  CGRect v676;
  CGRect v677;
  CGRect v678;
  CGRect v679;
  CGRect v680;
  CGRect v681;
  CGRect v682;
  CGRect v683;
  CGRect v684;
  CGRect v685;
  CGRect v686;
  CGRect v687;
  CGRect v688;

  *(_QWORD *)&rect.size.width = self;
  *(_QWORD *)&rect.size.height = MRUMediaControlsModuleNowPlayingView;
  -[CGSize layoutSubviews]((objc_super *)&rect.size, sel_layoutSubviews);
  -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUMediaControlsModuleNowPlayingView contentScaleFactor](self, "contentScaleFactor");
  v12 = v11;
  -[MRUMediaControlsModuleNowPlayingView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");

  rect.origin.x = v12;
  v14 = MRUUIEdgeInsetsMultiply(self->_contentEdgeInsets.top, self->_contentEdgeInsets.left, self->_contentEdgeInsets.bottom, self->_contentEdgeInsets.right, v12);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[MRUMediaControlsModuleNowPlayingView suggestionsFrame](self, "suggestionsFrame");
  v528 = v22;
  v531 = v21;
  v522 = v24;
  v524 = v23;
  -[MRUMediaSuggestionsView setFrame:](self->_suggestionsView, "setFrame:");
  contentMetrics = self->_contentMetrics;
  if (contentMetrics)
    -[CCUIModuleContentMetrics gridGeometryInfo](contentMetrics, "gridGeometryInfo");
  else
    v26 = MEMORY[0x1AF423F90]();
  v520 = v26;
  v27 = self->_contentMetrics;
  if (v27)
  {
    -[CCUIModuleContentMetrics gridGeometryInfo](v27, "gridGeometryInfo");
    v29 = v28;
  }
  else
  {
    CCUILayoutGutter();
    v29 = v30;
  }
  v31 = v16 + v20;
  v32 = v4 + v16;
  v33 = v6 + v14;
  v34 = v8 - v31;
  v35 = v10 - (v14 + v18);
  switch(self->_layout)
  {
    case 0:
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v549.origin.x = v32;
      v549.origin.y = v33;
      v549.size.width = v34;
      v549.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v549);
      UIRectCenteredXInRect();
      v67 = v66;
      v69 = v68;
      v71 = v70;
      v518 = v33;
      v73 = v72;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v34, v35);
      v516 = v32;
      v550.origin.x = v67;
      v550.origin.y = v69;
      v550.size.width = v71;
      v550.size.height = v73;
      CGRectGetMaxY(v550);
      UIRectCenteredXInRect();
      UIRectRoundToScale();
      v75 = v74;
      v77 = v76;
      v79 = v78;
      v81 = v80;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v551.origin.x = v75;
      v551.origin.y = v77;
      v551.size.width = v79;
      v551.size.height = v81;
      CGRectGetMaxY(v551);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v552.origin.x = v32;
      v552.origin.y = v518;
      v552.size.width = v34;
      v552.size.height = v35;
      Width = CGRectGetWidth(v552);
      v553.origin.x = v32;
      v553.origin.y = v518;
      v553.size.width = v34;
      v553.size.height = v35;
      Height = CGRectGetHeight(v553);
      if (Width >= Height)
        Width = Height;
      v554.origin.x = v32;
      v554.origin.y = v518;
      v554.size.width = v34;
      v554.size.height = v35;
      v84 = CGRectGetWidth(v554);
      v555.origin.x = v32;
      v555.origin.y = v518;
      v555.size.width = v34;
      v555.size.height = v35;
      v85 = CGRectGetHeight(v555);
      if (v84 >= v85)
        v84 = v85;
      v556.origin.x = v32;
      v556.origin.y = v518;
      v556.size.width = v34;
      v556.size.height = v35;
      MinX = CGRectGetMinX(v556);
      v557.origin.x = v32;
      v557.origin.y = v518;
      v557.size.width = v34;
      v557.size.height = v35;
      MinY = CGRectGetMinY(v557);
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      v558.origin.x = MinX;
      v558.origin.y = MinY;
      v558.size.width = Width;
      v558.size.height = v84;
      CGRectGetWidth(v558);
      UIRectInset();
      v89 = v88;
      v91 = v90;
      v93 = v92;
      v95 = v94;
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v92, v94);
      v559.origin.x = v89;
      v559.origin.y = v91;
      v559.size.width = v93;
      v559.size.height = v95;
      CGRectGetMaxX(v559);
      UIRectCenteredYInRect();
      UIRectIntegralWithScale();
      v97 = v96;
      v99 = v98;
      v101 = v100;
      v103 = v102;
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      v560.origin.x = v97;
      v560.origin.y = v99;
      v560.size.width = v101;
      v560.size.height = v103;
      CGRectGetWidth(v560);
      UIRectInset();
      v105 = v104;
      v107 = v106;
      v109 = v108;
      v111 = v110;
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v108, v110);
      v561.origin.x = v105;
      v561.origin.y = v107;
      v561.size.width = v109;
      v561.size.height = v111;
      CGRectGetMaxX(v561);
      v562.origin.x = v105;
      v562.origin.y = v107;
      v562.size.width = v109;
      v562.size.height = v111;
      CGRectGetMinY(v562);
      UIRectCenteredYInRect();
      v113 = v112;
      v115 = v114;
      v117 = v116;
      v119 = v118;
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:");
      v563.origin.x = v113;
      v563.origin.y = v115;
      v563.size.width = v117;
      v563.size.height = v119;
      CGRectGetWidth(v563);
      UIRectInset();
      UIRectIntegralWithScale();
      goto LABEL_18;
    case 1:
    case 2:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v536.origin.x = v32;
      v536.origin.y = v33;
      v536.size.width = v34;
      v536.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v536);
      v537.origin.x = v32;
      v537.origin.y = v33;
      v537.size.width = v34;
      v537.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v537);
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v34, v35);
      v538.origin.x = v32;
      v517 = v33;
      v538.origin.y = v33;
      v538.size.width = v34;
      v538.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v538);
      UIRectCenteredXInRect();
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v34, v35);
      v516 = v32;
      v539.origin.x = v37;
      v539.origin.y = v39;
      v539.size.width = v41;
      v539.size.height = v43;
      CGRectGetMaxY(v539);
      UIRectCenteredXInRect();
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:");
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v34, v35);
      v540.origin.x = v45;
      v540.origin.y = v47;
      v540.size.width = v49;
      v540.size.height = v51;
      CGRectGetMaxY(v540);
      UIRectCenteredXInRect();
      UIRectRoundToScale();
      v53 = v52;
      v55 = v54;
      v57 = v56;
      v59 = v58;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v541.origin.x = v53;
      v541.origin.y = v55;
      v541.size.width = v57;
      v541.size.height = v59;
      CGRectGetMaxY(v541);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v542.origin.x = v32;
      v542.origin.y = v517;
      v542.size.width = v34;
      v542.size.height = v35;
      v60 = CGRectGetWidth(v542);
      v543.origin.x = v32;
      v543.origin.y = v517;
      v543.size.width = v34;
      v543.size.height = v35;
      v61 = CGRectGetHeight(v543);
      if (v60 >= v61)
        v60 = v61;
      v544.origin.x = v32;
      v544.origin.y = v517;
      v544.size.width = v34;
      v544.size.height = v35;
      v62 = CGRectGetWidth(v544);
      v545.origin.x = v32;
      v545.origin.y = v517;
      v545.size.width = v34;
      v545.size.height = v35;
      v63 = CGRectGetHeight(v545);
      if (v62 >= v63)
        v62 = v63;
      v546.origin.x = v32;
      v546.origin.y = v517;
      v546.size.width = v34;
      v546.size.height = v35;
      v64 = CGRectGetMinX(v546);
      v547.origin.x = v32;
      v547.origin.y = v517;
      v547.size.width = v34;
      v547.size.height = v35;
      v65 = CGRectGetMinY(v547);
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      v548.origin.x = v64;
      v548.origin.y = v65;
      v548.size.width = v60;
      v548.size.height = v62;
      CGRectGetWidth(v548);
      UIRectInset();
LABEL_18:
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds", *(_QWORD *)&v516);
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      p_headerView = (id *)&self->_headerView;
      goto LABEL_54;
    case 3:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v564.origin.x = v32;
      v564.origin.y = v33;
      v564.size.width = v34;
      v564.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v564);
      v565.origin.x = v32;
      v565.origin.y = v33;
      v565.size.width = v34;
      v565.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v565);
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v34, v35);
      v122 = v121;
      v525 = v121;
      v124 = v123;
      v566.origin.x = v32;
      v566.origin.y = v33;
      v566.size.width = v34;
      v566.size.height = v35;
      v523 = CGRectGetMinX(v566);
      v567.origin.x = v32;
      v567.origin.y = v33;
      v567.size.width = v34;
      v567.size.height = v35;
      MaxY = CGRectGetMaxY(v567);
      v126 = MaxY - v124;
      v532 = MaxY - v124;
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v523, MaxY - v124, v122, v124);
      v568.origin.x = v523;
      v568.origin.y = v126;
      v568.size.width = v122;
      v568.size.height = v124;
      CGRectGetHeight(v568);
      UIRectInset();
      x = v569.origin.x;
      y = v569.origin.y;
      v129 = v569.size.width;
      v130 = v569.size.height;
      v131 = CGRectGetMinX(v569);
      v570.origin.x = x;
      v570.origin.y = y;
      v570.size.width = v129;
      v570.size.height = v130;
      v132 = CGRectGetMinY(v570);
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      v571.origin.x = v131;
      v571.origin.y = v132;
      v571.size.width = rect.origin.x * 52.0;
      v571.size.height = rect.origin.x * 52.0;
      CGRectGetHeight(v571);
      UIRectInset();
      v134 = v133;
      v136 = v135;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v135, v133);
      v572.origin.x = v523;
      v572.size.height = v124;
      v572.origin.y = v532;
      v572.size.width = v525;
      CGRectGetMinY(v572);
      UIRectCenteredXInRect();
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v136, v134);
      v573.origin.x = v523;
      v573.size.height = v124;
      v573.origin.y = v532;
      v573.size.width = v525;
      CGRectGetMaxY(v573);
      v137 = v136;
      UIRectCenteredXInRect();
      UIRectRoundToScale();
      v139 = v138;
      v141 = v140;
      v143 = v142;
      v145 = v144;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v137, v134);
      v574.origin.x = v139;
      v574.origin.y = v141;
      v574.size.width = v143;
      v574.size.height = v145;
      CGRectGetMaxY(v574);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      UIRectInset();
      v147 = v146;
      v149 = v148;
      v151 = v150;
      v153 = v152;
      p_headerView = (id *)&self->_headerView;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v150, v152);
      v575.origin.x = v147;
      v575.origin.y = v149;
      v575.size.width = v151;
      v575.size.height = v153;
      CGRectGetMinX(v575);
      v576.origin.x = v147;
      v576.origin.y = v149;
      v576.size.width = v151;
      v576.size.height = v153;
      CGRectGetMinY(v576);
      v577.origin.x = v147;
      v577.origin.y = v149;
      v577.size.width = v151;
      v577.size.height = v153;
      CGRectGetHeight(v577);
      UIRectIntegralWithScale();
      goto LABEL_54;
    case 4:
      v533 = v29;
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v34, v10 - (v14 + v18));
      rect.origin.x = v18;
      v578.origin.x = v32;
      v578.origin.y = v33;
      v578.size.width = v34;
      v578.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v578);
      UIRectCenteredXInRect();
      v526 = v155;
      v529 = v154;
      v157 = v156;
      v519 = v33;
      v159 = v158;
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v579.origin.y = v526;
      v579.origin.x = v529;
      v579.size.width = v157;
      v579.size.height = v159;
      CGRectGetMaxY(v579);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v160 = CCUINumberOfRowsForGridSizeClass();
      v161 = v533 * (double)(v160 - 1) + (double)v160 * v520 - v14 - rect.origin.x;
      v580.origin.x = v32;
      v580.origin.y = v519;
      v580.size.width = v34;
      v580.size.height = v35;
      v162 = CGRectGetHeight(v580);
      if (v161 >= v162)
        v163 = v162;
      else
        v163 = v161;
      v581.origin.x = v32;
      v581.origin.y = v519;
      v581.size.width = v34;
      v581.size.height = v35;
      v164 = CGRectGetHeight(v581);
      if (v161 >= v164)
        v161 = v164;
      v582.origin.x = v32;
      v582.origin.y = v519;
      v582.size.width = v34;
      v582.size.height = v35;
      v165 = CGRectGetMinX(v582);
      v583.origin.x = v32;
      v583.origin.y = v519;
      v583.size.width = v34;
      v583.size.height = v35;
      v166 = CGRectGetMinY(v583);
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      v584.origin.x = v165;
      v584.origin.y = v166;
      v584.size.width = v163;
      v584.size.height = v161;
      CGRectGetHeight(v584);
      UIRectInset();
      v168 = v167;
      v170 = v169;
      v172 = v171;
      v174 = v173;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v171, v173);
      v176 = v175;
      v178 = v177;
      v585.origin.x = v168;
      v585.origin.y = v170;
      v585.size.width = v172;
      v585.size.height = v174;
      v179 = CGRectGetMinX(v585);
      v586.origin.x = v168;
      v586.origin.y = v170;
      v586.size.width = v172;
      v586.size.height = v174;
      v180 = CGRectGetMaxY(v586) - v178;
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      v587.origin.x = v179;
      v587.origin.y = v180;
      v587.size.width = v176;
      v587.size.height = v178;
      CGRectGetHeight(v587);
      UIRectInset();
      v182 = v181;
      v184 = v183;
      v186 = v185;
      v188 = v187;
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v185, v187);
      v588.origin.x = v182;
      v588.origin.y = v184;
      v588.size.width = v186;
      v588.size.height = v188;
      CGRectGetMaxX(v588);
      v589.origin.x = v182;
      v589.origin.y = v184;
      v589.size.width = v186;
      v589.size.height = v188;
      CGRectGetMinY(v589);
      UIRectIntegralWithScale();
      rect.origin.x = v189;
      v191 = v190;
      v193 = v192;
      v195 = v194;
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      v530 = v193;
      v534 = v191;
      v527 = v195;
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      UIRectInset();
      v196 = v590.origin.x;
      v197 = v590.origin.y;
      v198 = v590.size.width;
      v199 = v590.size.height;
      headerView = self->_headerView;
      v201 = CGRectGetWidth(v590);
      v591.origin.x = rect.origin.x;
      v591.origin.y = v191;
      v591.size.width = v193;
      v591.size.height = v195;
      v202 = v201 - (CGRectGetWidth(v591) + 7.0);
      v592.origin.x = v196;
      v592.origin.y = v197;
      v592.size.width = v198;
      v592.size.height = v199;
      -[MRUNowPlayingHeaderView sizeThatFits:](headerView, "sizeThatFits:", v202, CGRectGetHeight(v592));
      v593.origin.x = v196;
      v593.origin.y = v197;
      v593.size.width = v198;
      v593.size.height = v199;
      CGRectGetMinX(v593);
      v594.origin.x = v196;
      v594.origin.y = v197;
      v594.size.width = v198;
      v594.size.height = v199;
      CGRectGetMinY(v594);
      UIRectIntegralWithScale();
      v204 = v203;
      v206 = v205;
      v208 = v207;
      v210 = v209;
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v595.origin.x = v204;
      v595.origin.y = v206;
      v595.size.width = v208;
      v595.size.height = v210;
      CGRectGetHeight(v595);
      v596.origin.y = v534;
      v596.origin.x = rect.origin.x;
      v596.size.height = v527;
      v596.size.width = v530;
      CGRectGetHeight(v596);
      UIRectInset();
      v212 = v211;
      v214 = v213;
      v216 = v215;
      v218 = v217;
      p_headerView = (id *)&self->_transportControlsView;
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v215, v217);
      v597.origin.x = v212;
      v597.origin.y = v214;
      v597.size.width = v216;
      v597.size.height = v218;
      CGRectGetMinX(v597);
      UIRectCenteredYInRect();
      goto LABEL_53;
    case 5:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v598.origin.x = v32;
      v598.origin.y = v33;
      v598.size.width = v34;
      v598.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v598);
      v599.origin.x = v32;
      v599.origin.y = v33;
      v599.size.width = v34;
      v599.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v599);
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v600.origin.x = v32;
      v600.origin.y = v33;
      v600.size.width = v34;
      v600.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v600);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      v220 = v219;
      v222 = v221;
      v224 = v223;
      v226 = v225;
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v601.origin.x = v220;
      v601.origin.y = v222;
      v601.size.width = v224;
      v601.size.height = v226;
      CGRectGetHeight(v601);
      UIRectInset();
      v228 = v227;
      v230 = v229;
      v232 = v231;
      v234 = v233;
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v231, v233);
      v602.origin.x = v228;
      v602.origin.y = v230;
      v602.size.width = v232;
      v602.size.height = v234;
      CGRectGetMinX(v602);
      v603.origin.x = v228;
      v603.origin.y = v230;
      v603.size.width = v232;
      v603.size.height = v234;
      CGRectGetMaxY(v603);
      UIRectRoundToScale();
      v236 = v235;
      v238 = v237;
      v240 = v239;
      v242 = v241;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      v604.origin.x = v236;
      v604.origin.y = v238;
      v604.size.width = v240;
      v604.size.height = v242;
      CGRectGetHeight(v604);
      UIRectInset();
      v244 = v243;
      v246 = v245;
      v248 = v247;
      v250 = v249;
      v251 = MRUCGSizeMultiply(82.0, 82.0, rect.origin.x);
      v253 = v252;
      v605.origin.x = v244;
      v605.origin.y = v246;
      v605.size.width = v248;
      v605.size.height = v250;
      v254 = CGRectGetMinX(v605);
      v606.origin.x = v244;
      v606.origin.y = v246;
      v606.size.width = v248;
      v606.size.height = v250;
      v521 = CGRectGetMinY(v606);
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      v255 = self->_headerView;
      v607.origin.x = v244;
      v607.origin.y = v246;
      v607.size.width = v248;
      v607.size.height = v250;
      v256 = CGRectGetWidth(v607);
      v608.origin.x = v254;
      v608.origin.y = v521;
      v608.size.width = v251;
      v608.size.height = v253;
      v257 = v256 - (rect.origin.x * 12.0 + CGRectGetWidth(v608));
      v609.origin.x = v254;
      v609.origin.y = v521;
      v609.size.width = v251;
      v609.size.height = v253;
      -[MRUNowPlayingHeaderView sizeThatFits:](v255, "sizeThatFits:", v257, CGRectGetHeight(v609));
      v610.origin.x = v254;
      v610.origin.y = v521;
      v610.size.width = v251;
      v610.size.height = v253;
      CGRectGetMaxX(v610);
      UIRectCenteredYInRect();
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v611.origin.x = v254;
      v611.origin.y = v521;
      v611.size.width = v251;
      v611.size.height = v253;
      CGRectGetHeight(v611);
      UIRectInset();
      v259 = v258;
      v261 = v260;
      v263 = v262;
      v265 = v264;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v262, v264);
      v267 = v266;
      v269 = v268;
      v612.origin.x = v259;
      v612.origin.y = v261;
      v612.size.width = v263;
      v612.size.height = v265;
      v270 = CGRectGetMinX(v612);
      v613.origin.x = v259;
      v613.origin.y = v261;
      v613.size.width = v263;
      v613.size.height = v265;
      v271 = CGRectGetMinY(v613);
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v270, v271, v267, v269);
      v614.origin.x = v270;
      v614.origin.y = v271;
      v614.size.width = v267;
      v614.size.height = v269;
      CGRectGetHeight(v614);
      goto LABEL_42;
    case 6:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v615.origin.x = v32;
      v615.origin.y = v33;
      v615.size.width = v34;
      v615.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v615);
      v616.origin.x = v32;
      v616.origin.y = v33;
      v616.size.width = v34;
      v616.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v616);
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v617.origin.x = v32;
      v617.origin.y = v33;
      v617.size.width = v34;
      v617.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v617);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      v273 = v272;
      v275 = v274;
      v277 = v276;
      v279 = v278;
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v618.origin.x = v273;
      v618.origin.y = v275;
      v618.size.width = v277;
      v618.size.height = v279;
      CGRectGetHeight(v618);
      UIRectInset();
      v280 = v619.origin.x;
      v281 = v619.origin.y;
      v282 = v619.size.width;
      v283 = v619.size.height;
      v284 = CGRectGetWidth(v619);
      v620.origin.x = v280;
      v620.origin.y = v281;
      v620.size.width = v282;
      v620.size.height = v283;
      v285 = CGRectGetHeight(v620);
      if (v284 >= v285)
        v284 = v285;
      v621.origin.x = v280;
      v621.origin.y = v281;
      v621.size.width = v282;
      v621.size.height = v283;
      CGRectGetWidth(v621);
      v622.origin.x = v280;
      v622.origin.y = v281;
      v622.size.width = v282;
      v622.size.height = v283;
      CGRectGetHeight(v622);
      v623.origin.x = v280;
      v623.origin.y = v281;
      v623.size.width = v282;
      v623.size.height = v283;
      v286 = CGRectGetMinX(v623);
      v624.origin.x = v280;
      v624.origin.y = v281;
      v624.size.width = v282;
      v624.size.height = v283;
      v287 = CGRectGetMinY(v624);
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:", v286, v287, v284, v284);
      v625.origin.x = v286;
      v625.origin.y = v287;
      v625.size.width = v284;
      v625.size.height = v284;
      CGRectGetHeight(v625);
      UIRectInset();
      v289 = v288;
      v291 = v290;
      v293 = v292;
      v295 = v294;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v292, v294);
      v626.origin.x = v289;
      v626.origin.y = v291;
      v626.size.width = v293;
      v626.size.height = v295;
      CGRectGetMinX(v626);
      v627.origin.x = v289;
      v627.origin.y = v291;
      v627.size.width = v293;
      v627.size.height = v295;
      CGRectGetMinY(v627);
      UIRectIntegralWithScale();
      v297 = v296;
      v299 = v298;
      v301 = v300;
      v303 = v302;
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v628.origin.x = v297;
      v628.origin.y = v299;
      v628.size.width = v301;
      v628.size.height = v303;
      CGRectGetHeight(v628);
      UIRectInset();
      v305 = v304;
      v307 = v306;
      v309 = v308;
      v311 = v310;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v308, v310);
      v629.origin.x = v305;
      v629.origin.y = v307;
      v629.size.width = v309;
      v629.size.height = v311;
      CGRectGetMinX(v629);
      v630.origin.x = v305;
      v630.origin.y = v307;
      v630.size.width = v309;
      v630.size.height = v311;
      CGRectGetMinY(v630);
      UIRectRoundToScale();
      v313 = v312;
      v315 = v314;
      v317 = v316;
      v319 = v318;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      v320 = v313;
      v321 = v315;
      v322 = v317;
      v323 = v319;
      goto LABEL_41;
    case 7:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v631.origin.x = v32;
      v631.origin.y = v33;
      v631.size.width = v34;
      v631.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v631);
      v632.origin.x = v32;
      v632.origin.y = v33;
      v632.size.width = v34;
      v632.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v632);
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      v633.origin.x = v32;
      v633.origin.y = v33;
      v633.size.width = v34;
      v633.size.height = v10 - (v14 + v18);
      v324 = CGRectGetWidth(v633);
      v634.origin.x = v32;
      v634.origin.y = v33;
      v634.size.width = v34;
      v634.size.height = v35;
      v325 = CGRectGetHeight(v634);
      if (v324 >= v325)
        v324 = v325;
      v635.origin.x = v32;
      v635.origin.y = v33;
      v635.size.width = v34;
      v635.size.height = v35;
      CGRectGetWidth(v635);
      v636.origin.x = v32;
      v636.origin.y = v33;
      v636.size.width = v34;
      v636.size.height = v35;
      CGRectGetHeight(v636);
      v637.origin.x = v32;
      v637.origin.y = v33;
      v637.size.width = v34;
      v637.size.height = v35;
      v326 = CGRectGetMinX(v637);
      v638.origin.x = v32;
      v638.origin.y = v33;
      v638.size.width = v34;
      v638.size.height = v35;
      v327 = CGRectGetMinY(v638);
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:", v326, v327, v324, v324);
      v328 = v528;
      if (self->_showSuggestionsView)
        v329 = v524;
      else
        v329 = v324;
      if (self->_showSuggestionsView)
        v330 = v522;
      else
        v330 = v324;
      v331 = v531;
      if (!self->_showSuggestionsView)
      {
        v331 = v326;
        v328 = v327;
      }
      CGRectGetWidth(*(CGRect *)(&v328 - 1));
      UIRectInset();
      v333 = v332;
      v335 = v334;
      v337 = v336;
      v339 = v338;
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v336, v338);
      v639.origin.x = v333;
      v639.origin.y = v335;
      v639.size.width = v337;
      v639.size.height = v339;
      CGRectGetMaxY(v639);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      v341 = v340;
      v343 = v342;
      v345 = v344;
      v347 = v346;
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v640.origin.x = v341;
      v640.origin.y = v343;
      v640.size.width = v345;
      v640.size.height = v347;
      CGRectGetHeight(v640);
      UIRectInset();
      v349 = v348;
      v351 = v350;
      v353 = v352;
      v355 = v354;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v352, v354);
      v641.origin.x = v349;
      v641.origin.y = v351;
      v641.size.width = v353;
      v641.size.height = v355;
      CGRectGetMinX(v641);
      v642.origin.x = v349;
      v642.origin.y = v351;
      v642.size.width = v353;
      v642.size.height = v355;
      CGRectGetMinY(v642);
      v643.origin.x = v349;
      v643.origin.y = v351;
      v643.size.width = v353;
      v643.size.height = v355;
      CGRectGetWidth(v643);
      UIRectIntegralWithScale();
      v357 = v356;
      v359 = v358;
      v361 = v360;
      v363 = v362;
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v644.origin.x = v357;
      v644.origin.y = v359;
      v644.size.width = v361;
      v644.size.height = v363;
      CGRectGetHeight(v644);
      UIRectInset();
      v365 = v364;
      v367 = v366;
      v369 = v368;
      v371 = v370;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v368, v370);
      v373 = v372;
      v375 = v374;
      v645.origin.x = v365;
      v645.origin.y = v367;
      v645.size.width = v369;
      v645.size.height = v371;
      v376 = CGRectGetMinX(v645);
      v646.origin.x = v365;
      v646.origin.y = v367;
      v646.size.width = v369;
      v646.size.height = v371;
      v377 = CGRectGetMinY(v646);
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v376, v377, v373, v375);
      v320 = v376;
      v321 = v377;
      v322 = v373;
      v323 = v375;
LABEL_41:
      CGRectGetHeight(*(CGRect *)&v320);
      UIRectInset();
      v379 = v378;
      v381 = v380;
      v383 = v382;
      v385 = v384;
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v382, v384);
      v647.origin.x = v379;
      v647.origin.y = v381;
      v647.size.width = v383;
      v647.size.height = v385;
      CGRectGetMinX(v647);
      v648.origin.x = v379;
      v648.origin.y = v381;
      v648.size.width = v383;
      v648.size.height = v385;
      CGRectGetMaxY(v648);
      UIRectRoundToScale();
      v387 = v386;
      v389 = v388;
      v391 = v390;
      v393 = v392;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      v649.origin.x = v387;
      v649.origin.y = v389;
      v649.size.width = v391;
      v649.size.height = v393;
      CGRectGetHeight(v649);
LABEL_42:
      UIRectInset();
      v395 = v394;
      v397 = v396;
      v399 = v398;
      v401 = v400;
      p_headerView = (id *)&self->_transportControlsView;
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v398, v400);
      v650.origin.x = v395;
      v650.origin.y = v397;
      v650.size.width = v399;
      v650.size.height = v401;
      CGRectGetMinX(v650);
      UIRectCenteredYInRect();
      goto LABEL_54;
    case 8:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v668.origin.x = v32;
      v668.origin.y = v33;
      v668.size.width = v34;
      v668.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v668);
      v669.origin.x = v32;
      v669.origin.y = v33;
      v669.size.width = v34;
      v669.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v669);
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v670.origin.x = v32;
      v670.origin.y = v33;
      v670.size.width = v34;
      v670.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v670);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v34, v35);
      v671.origin.x = v32;
      v671.origin.y = v33;
      v671.size.width = v34;
      v671.size.height = v10 - (v14 + v18);
      CGRectGetMinX(v671);
      v672.origin.x = v32;
      v672.origin.y = v33;
      v672.size.width = v34;
      v672.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v672);
      UIRectRoundToScale();
      v466 = v465;
      v468 = v467;
      v470 = v469;
      v472 = v471;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      v673.origin.x = v466;
      v673.origin.y = v468;
      v673.size.width = v470;
      v673.size.height = v472;
      CGRectGetHeight(v673);
      UIRectInset();
      v474 = v473;
      v476 = v475;
      v478 = v477;
      v480 = v479;
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v477, v479);
      v482 = v481;
      v484 = v483;
      v674.origin.x = v474;
      v674.origin.y = v476;
      v674.size.width = v478;
      v674.size.height = v480;
      v485 = CGRectGetMinX(v674);
      v675.origin.x = v474;
      v675.origin.y = v476;
      v675.size.width = v478;
      v675.size.height = v480;
      v486 = CGRectGetMaxY(v675);
      v487 = v486 - v484;
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v485, v486 - v484, v482, v484);
      v676.origin.x = v485;
      v676.origin.y = v487;
      v676.size.width = v482;
      v676.size.height = v484;
      CGRectGetHeight(v676);
      UIRectInset();
      v489 = v488;
      v491 = v490;
      v493 = v492;
      v495 = v494;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v492, v494);
      v677.origin.x = v489;
      v677.origin.y = v491;
      v677.size.width = v493;
      v677.size.height = v495;
      CGRectGetMinX(v677);
      v678.origin.x = v489;
      v678.origin.y = v491;
      v678.size.width = v493;
      v678.size.height = v495;
      CGRectGetMaxY(v678);
      UIRectRoundToScale();
      v497 = v496;
      v499 = v498;
      v501 = v500;
      v503 = v502;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      v679.origin.x = v497;
      v679.origin.y = v499;
      v679.size.width = v501;
      v679.size.height = v503;
      CGRectGetHeight(v679);
      UIRectInset();
      v457 = v680.origin.x;
      v458 = v680.origin.y;
      v459 = v680.size.width;
      v460 = v680.size.height;
      v461 = CGRectGetWidth(v680);
      v681.origin.x = v457;
      v681.origin.y = v458;
      v681.size.width = v459;
      v681.size.height = v460;
      v504 = CGRectGetHeight(v681);
      if (v461 >= v504)
        v461 = v504;
      v682.origin.x = v457;
      v682.origin.y = v458;
      v682.size.width = v459;
      v682.size.height = v460;
      v463 = CGRectGetWidth(v682);
      v683.origin.x = v457;
      v683.origin.y = v458;
      v683.size.width = v459;
      v683.size.height = v460;
      v505 = CGRectGetHeight(v683);
      if (v463 >= v505)
        v463 = v505;
      goto LABEL_52;
    case 9:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v651.origin.x = v32;
      v651.origin.y = v33;
      v651.size.width = v34;
      v651.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v651);
      v652.origin.x = v32;
      v652.origin.y = v33;
      v652.size.width = v34;
      v652.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v652);
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v653.origin.x = v32;
      v653.origin.y = v33;
      v653.size.width = v34;
      v653.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v653);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      v403 = v402;
      v405 = v404;
      v407 = v406;
      v409 = v408;
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v654.origin.x = v403;
      v654.origin.y = v405;
      v654.size.width = v407;
      v654.size.height = v409;
      CGRectGetHeight(v654);
      UIRectInset();
      v411 = v410;
      v413 = v412;
      v415 = v414;
      v417 = v416;
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v414, v416);
      v655.origin.x = v411;
      v655.origin.y = v413;
      v655.size.width = v415;
      v655.size.height = v417;
      CGRectGetMinX(v655);
      v656.origin.x = v411;
      v656.origin.y = v413;
      v656.size.width = v415;
      v656.size.height = v417;
      CGRectGetMaxY(v656);
      UIRectRoundToScale();
      v419 = v418;
      v421 = v420;
      v423 = v422;
      v425 = v424;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      v657.origin.x = v419;
      v657.origin.y = v421;
      v657.size.width = v423;
      v657.size.height = v425;
      CGRectGetHeight(v657);
      UIRectInset();
      v427 = v426;
      v429 = v428;
      v431 = v430;
      v433 = v432;
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v430, v432);
      v435 = v434;
      v437 = v436;
      v658.origin.x = v427;
      v658.origin.y = v429;
      v658.size.width = v431;
      v658.size.height = v433;
      v438 = CGRectGetMinX(v658);
      v659.origin.x = v427;
      v659.origin.y = v429;
      v659.size.width = v431;
      v659.size.height = v433;
      v439 = CGRectGetMaxY(v659);
      v440 = v439 - v437;
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v438, v439 - v437, v435, v437);
      v660.origin.x = v438;
      v660.origin.y = v440;
      v660.size.width = v435;
      v660.size.height = v437;
      CGRectGetHeight(v660);
      UIRectInset();
      v442 = v441;
      v444 = v443;
      v446 = v445;
      v448 = v447;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v445, v447);
      v661.origin.x = v442;
      v661.origin.y = v444;
      v661.size.width = v446;
      v661.size.height = v448;
      CGRectGetMinX(v661);
      v662.origin.x = v442;
      v662.origin.y = v444;
      v662.size.width = v446;
      v662.size.height = v448;
      CGRectGetMaxY(v662);
      UIRectRoundToScale();
      v450 = v449;
      v452 = v451;
      v454 = v453;
      v456 = v455;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      v663.origin.x = v450;
      v663.origin.y = v452;
      v663.size.width = v454;
      v663.size.height = v456;
      CGRectGetHeight(v663);
      UIRectInset();
      v457 = v664.origin.x;
      v458 = v664.origin.y;
      v459 = v664.size.width;
      v460 = v664.size.height;
      v461 = CGRectGetWidth(v664);
      v665.origin.x = v457;
      v665.origin.y = v458;
      v665.size.width = v459;
      v665.size.height = v460;
      v462 = CGRectGetHeight(v665);
      if (v461 >= v462)
        v461 = v462;
      v666.origin.x = v457;
      v666.origin.y = v458;
      v666.size.width = v459;
      v666.size.height = v460;
      v463 = CGRectGetWidth(v666);
      v667.origin.x = v457;
      v667.origin.y = v458;
      v667.size.width = v459;
      v667.size.height = v460;
      v464 = CGRectGetHeight(v667);
      if (v463 >= v464)
        v463 = v464;
LABEL_52:
      v684.origin.x = v457;
      v684.origin.y = v458;
      v684.size.width = v459;
      v684.size.height = v460;
      v506 = CGRectGetMinX(v684);
      v685.origin.x = v457;
      v685.origin.y = v458;
      v685.size.width = v459;
      v685.size.height = v460;
      v507 = CGRectGetMinY(v685);
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      v686.origin.x = v506;
      v686.origin.y = v507;
      v686.size.width = v461;
      v686.size.height = v463;
      CGRectGetWidth(v686);
      UIRectInset();
      v509 = v508;
      v511 = v510;
      v513 = v512;
      v515 = v514;
      p_headerView = (id *)&self->_headerView;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v512, v514);
      v687.origin.x = v509;
      v687.origin.y = v511;
      v687.size.width = v513;
      v687.size.height = v515;
      CGRectGetMinX(v687);
      v688.origin.x = v509;
      v688.origin.y = v511;
      v688.size.width = v513;
      v688.size.height = v515;
      CGRectGetWidth(v688);
      UIRectCenteredYInRect();
      UIRectIntegralWithScale();
LABEL_53:
      -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
LABEL_54:
      objc_msgSend(*p_headerView, "setFrame:");
      break;
    default:
      return;
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  CGFloat width;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;

  width = result.width;
  if (self->_layout == 8)
  {
    v5 = self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom;
    v6 = result.width - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right);
    v7 = result.height - v5;
    -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v6, result.height - v5);
    v9 = v7 - (v8 + 7.0);
    v10 = v5 + v8 + 7.0;
    -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v6, v9);
    v12 = v11 + 7.0;
    v13 = v9 - (v11 + 7.0);
    v14 = v10 + v12;
    -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v6, v13);
    v16 = v14 + v15 + 7.0;
    -[MRUMediaControlsModuleNowPlayingView contentScaleFactor](self, "contentScaleFactor");
    MRUCGSizeMultiply(45.0, 45.0, v17);
    result.height = v16 + v18;
  }
  v19 = width;
  result.width = v19;
  return result;
}

- (void)setLayout:(int64_t)a3
{
  _QWORD v4[5];

  if (self->_layout != a3)
  {
    self->_layout = a3;
    if (self->_resizing)
    {
      -[MRUMediaControlsModuleNowPlayingView setNeedsLayout](self, "setNeedsLayout");
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __50__MRUMediaControlsModuleNowPlayingView_setLayout___block_invoke;
      v4[3] = &unk_1E5818C88;
      v4[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 5, v4, 0, 0.25, 0.0);
    }
    else
    {
      -[MRUMediaControlsModuleNowPlayingView updateOnScreen](self, "updateOnScreen");
      -[MRUMediaControlsModuleNowPlayingView updateLayout](self, "updateLayout");
      -[MRUMediaControlsModuleNowPlayingView updateVisibility](self, "updateVisibility");
      -[MRUMediaControlsModuleNowPlayingView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __50__MRUMediaControlsModuleNowPlayingView_setLayout___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateOnScreen");
  objc_msgSend(*(id *)(a1 + 32), "updateLayout");
  objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;

  v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUArtworkView setStylingProvider:](self->_artworkView, "setStylingProvider:", v5);
    -[MRUNowPlayingHeaderView setStylingProvider:](self->_headerView, "setStylingProvider:", v5);
    -[MRUNowPlayingTimeControlsView setStylingProvider:](self->_timeControlsView, "setStylingProvider:", v5);
    -[MRUNowPlayingTransportControlsView setStylingProvider:](self->_transportControlsView, "setStylingProvider:", v5);
    -[MRUNowPlayingVolumeControlsView setStylingProvider:](self->_volumeControlsView, "setStylingProvider:", v5);
    -[MRUTransportButton setStylingProvider:](self->_upperRoutingButton, "setStylingProvider:", v5);
    -[MRUTransportButton setStylingProvider:](self->_lowerRoutingButton, "setStylingProvider:", v5);
  }

}

- (void)setSuggestionsView:(id)a3
{
  MRUMediaSuggestionsView *v5;
  MRUMediaSuggestionsView *suggestionsView;
  void *v7;
  MRUMediaSuggestionsView *v8;
  _QWORD v9[4];
  MRUMediaSuggestionsView *v10;
  MRUMediaControlsModuleNowPlayingView *v11;

  v5 = (MRUMediaSuggestionsView *)a3;
  suggestionsView = self->_suggestionsView;
  v8 = v5;
  if (suggestionsView != v5)
  {
    -[MRUMediaSuggestionsView removeFromSuperview](suggestionsView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_suggestionsView, a3);
    -[MRUMediaControlsModuleNowPlayingView contentScaleFactor](self, "contentScaleFactor");
    -[MRUMediaSuggestionsView setContentScale:](self->_suggestionsView, "setContentScale:");
    -[MRUMediaControlsModuleNowPlayingView addSubview:](self, "addSubview:", v8);
    v7 = (void *)MEMORY[0x1E0DC3F10];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__MRUMediaControlsModuleNowPlayingView_setSuggestionsView___block_invoke;
    v9[3] = &unk_1E5818CB0;
    v10 = v8;
    v11 = self;
    objc_msgSend(v7, "performWithoutAnimation:", v9);
    -[MRUMediaControlsModuleNowPlayingView updateVisibility](self, "updateVisibility");
    -[MRUMediaControlsModuleNowPlayingView setNeedsLayout](self, "setNeedsLayout");

  }
}

uint64_t __59__MRUMediaControlsModuleNowPlayingView_setSuggestionsView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "suggestionsFrame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    -[MRUMediaControlsModuleNowPlayingView updateOnScreen](self, "updateOnScreen");
  }
}

- (void)setShowSuggestionsView:(BOOL)a3
{
  if (self->_showSuggestionsView != a3)
  {
    self->_showSuggestionsView = a3;
    -[MRUMediaControlsModuleNowPlayingView updateVisibility](self, "updateVisibility");
    -[MRUMediaControlsModuleNowPlayingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentMetrics:(id)a3
{
  id v5;
  double v6;
  double v7;

  objc_storeStrong((id *)&self->_contentMetrics, a3);
  v5 = a3;
  -[MRUMediaControlsModuleNowPlayingView contentScaleFactor](self, "contentScaleFactor");
  v7 = v6;
  -[MRUNowPlayingTransportControlsView setContentScale:](self->_transportControlsView, "setContentScale:");
  -[MRUNowPlayingHeaderView setContentScale:](self->_headerView, "setContentScale:", v7);
  -[MRUMediaControlsModuleRouteButton setContentScale:](self->_upperRoutingButton, "setContentScale:", v7);
  -[MRUMediaControlsModuleRouteButton setContentScale:](self->_lowerRoutingButton, "setContentScale:", v7);
  -[MRUNowPlayingTimeControlsView setContentScale:](self->_timeControlsView, "setContentScale:", v7);
  -[MRUMediaControlsModuleRouteButton setContentScale:](self->_lowerRoutingButton, "setContentScale:", v7);
  -[MRUNowPlayingVolumeControlsView setContentScale:](self->_volumeControlsView, "setContentScale:", v7);
  -[MRUArtworkView setContentScale:](self->_artworkView, "setContentScale:", v7);
  -[MRUMediaSuggestionsView setContentScale:](self->_suggestionsView, "setContentScale:", v7);

  -[MRUMediaControlsModuleNowPlayingView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setResizing:(BOOL)a3
{
  _QWORD v3[5];

  self->_resizing = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__MRUMediaControlsModuleNowPlayingView_setResizing___block_invoke;
  v3[3] = &unk_1E5818C88;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 5, v3, 0, 0.25, 0.0);
}

uint64_t __52__MRUMediaControlsModuleNowPlayingView_setResizing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
}

- (double)contentScaleFactor
{
  CCUIModuleContentMetrics *contentMetrics;
  double result;

  contentMetrics = self->_contentMetrics;
  if (!contentMetrics)
    return 1.0;
  -[CCUIModuleContentMetrics symbolScaleFactor](contentMetrics, "symbolScaleFactor");
  return result;
}

- (void)updateLayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  switch(self->_layout)
  {
    case 0:
      -[MRUArtworkView setStyle:](self->_artworkView, "setStyle:", 11);
      v4 = 4;
      -[MRUNowPlayingHeaderView setLayout:](self->_headerView, "setLayout:", 4);
      -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setLayout:", 5);
      goto LABEL_8;
    case 1:
    case 2:
      -[MRUArtworkView setStyle:](self->_artworkView, "setStyle:", 11);
      v5 = 3;
      -[MRUNowPlayingHeaderView setLayout:](self->_headerView, "setLayout:", 3);
      -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setLayout:", 5);
      v4 = 7;
      goto LABEL_9;
    case 3:
      -[MRUArtworkView setStyle:](self->_artworkView, "setStyle:", 12);
      -[MRUNowPlayingHeaderView setLayout:](self->_headerView, "setLayout:", 4);
      -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setLayout:", 4);
      v4 = 5;
      goto LABEL_8;
    case 4:
      -[MRUArtworkView setStyle:](self->_artworkView, "setStyle:", 13);
      v5 = 4;
      -[MRUNowPlayingHeaderView setLayout:](self->_headerView, "setLayout:", 4);
      -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setLayout:", 5);
      v4 = 6;
      goto LABEL_9;
    case 5:
    case 6:
    case 8:
    case 9:
      -[MRUArtworkView setStyle:](self->_artworkView, "setStyle:", 2);
      -[MRUNowPlayingHeaderView setLayout:](self->_headerView, "setLayout:", 4);
      -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setLayout:", 5);
      v4 = 7;
      goto LABEL_8;
    case 7:
      -[MRUArtworkView setStyle:](self->_artworkView, "setStyle:", 2);
      -[MRUNowPlayingHeaderView setLayout:](self->_headerView, "setLayout:", 4);
      -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setLayout:", 5);
      v4 = 8;
LABEL_8:
      v5 = 3;
LABEL_9:

      -[MRUNowPlayingTimeControlsView setLayout:](self->_timeControlsView, "setLayout:", v5);
      -[MRUNowPlayingTransportControlsView setLayout:](self->_transportControlsView, "setLayout:", v4);
      -[MRUNowPlayingVolumeControlsView setLayout:](self->_volumeControlsView, "setLayout:", 0);
      break;
    default:
      return;
  }
}

- (void)updateOnScreen
{
  unint64_t layout;
  _BOOL8 onScreen;
  void *v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 v8;
  void *v9;

  layout = self->_layout;
  if (layout <= 9)
  {
    if (((1 << layout) & 0x3F0) != 0)
    {
      onScreen = self->_onScreen;
      -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMarqueeEnabled:", onScreen);

      v6 = self->_onScreen;
    }
    else
    {
      if (((1 << layout) & 6) != 0)
      {
        -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setMarqueeEnabled:", 0);

        -[MRUNowPlayingTimeControlsView setOnScreen:](self->_timeControlsView, "setOnScreen:", 0);
      }
      v8 = self->_onScreen;
      -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setMarqueeEnabled:", v8);

      v6 = 0;
    }
    -[MRUNowPlayingTimeControlsView setOnScreen:](self->_timeControlsView, "setOnScreen:", v6);
  }
}

- (void)updateVisibility
{
  double v3;
  double v4;
  MRUNowPlayingVolumeControlsView *volumeControlsView;
  double v6;
  double v7;
  double v8;
  double v9;
  MRUNowPlayingTimeControlsView *timeControlsView;
  double v11;

  switch(self->_layout)
  {
    case 0:
    case 3:
      v3 = 1.0;
      -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", 1.0);
      -[MRUNowPlayingHeaderView setAlpha:](self->_headerView, "setAlpha:", 1.0);
      v4 = 0.0;
      -[MRUNowPlayingTimeControlsView setAlpha:](self->_timeControlsView, "setAlpha:", 0.0);
      -[MRUNowPlayingTransportControlsView setAlpha:](self->_transportControlsView, "setAlpha:", 1.0);
      volumeControlsView = self->_volumeControlsView;
      goto LABEL_6;
    case 1:
    case 2:
      -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", 1.0);
      -[MRUNowPlayingHeaderView setAlpha:](self->_headerView, "setAlpha:", 1.0);
      v4 = 0.0;
      -[MRUNowPlayingTimeControlsView setAlpha:](self->_timeControlsView, "setAlpha:", 0.0);
      -[MRUNowPlayingTransportControlsView setAlpha:](self->_transportControlsView, "setAlpha:", 0.0);
      -[MRUNowPlayingVolumeControlsView setAlpha:](self->_volumeControlsView, "setAlpha:", 0.0);
      goto LABEL_25;
    case 4:
      v3 = 1.0;
      -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", 1.0);
      -[MRUNowPlayingHeaderView setAlpha:](self->_headerView, "setAlpha:", 1.0);
      -[MRUNowPlayingTimeControlsView setAlpha:](self->_timeControlsView, "setAlpha:", 1.0);
      -[MRUNowPlayingTransportControlsView setAlpha:](self->_transportControlsView, "setAlpha:", 1.0);
      volumeControlsView = self->_volumeControlsView;
      v4 = 0.0;
LABEL_6:
      -[MRUNowPlayingVolumeControlsView setAlpha:](volumeControlsView, "setAlpha:", 0.0);
      goto LABEL_26;
    case 5:
    case 9:
      v6 = 1.0;
      -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", 1.0);
      -[MRUNowPlayingHeaderView setAlpha:](self->_headerView, "setAlpha:", 1.0);
      -[MRUNowPlayingTimeControlsView setAlpha:](self->_timeControlsView, "setAlpha:", 1.0);
      -[MRUNowPlayingTransportControlsView setAlpha:](self->_transportControlsView, "setAlpha:", 1.0);
      -[MRUNowPlayingVolumeControlsView setAlpha:](self->_volumeControlsView, "setAlpha:", 1.0);
      v4 = 0.0;
      v3 = 0.0;
      goto LABEL_27;
    case 6:
      v3 = 0.0;
      v6 = 1.0;
      if (self->_showSuggestionsView)
        v7 = 0.0;
      else
        v7 = 1.0;
      -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", v7);
      if (self->_showSuggestionsView)
        v8 = 0.0;
      else
        v8 = 1.0;
      -[MRUNowPlayingHeaderView setAlpha:](self->_headerView, "setAlpha:", v8);
      if (self->_showSuggestionsView)
        v9 = 0.0;
      else
        v9 = 1.0;
      timeControlsView = self->_timeControlsView;
      goto LABEL_21;
    case 7:
      v3 = 0.0;
      v6 = 1.0;
      if (self->_showSuggestionsView)
        v11 = 0.0;
      else
        v11 = 1.0;
      -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", v11);
      -[MRUNowPlayingHeaderView setAlpha:](self->_headerView, "setAlpha:", 1.0);
      timeControlsView = self->_timeControlsView;
      v9 = 1.0;
LABEL_21:
      -[MRUNowPlayingTimeControlsView setAlpha:](timeControlsView, "setAlpha:", v9);
      -[MRUNowPlayingTransportControlsView setAlpha:](self->_transportControlsView, "setAlpha:", 1.0);
      -[MRUNowPlayingVolumeControlsView setAlpha:](self->_volumeControlsView, "setAlpha:", 1.0);
      if (self->_showSuggestionsView)
        v4 = v6;
      else
        v4 = 0.0;
      goto LABEL_27;
    case 8:
      -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", 1.0);
      -[MRUNowPlayingHeaderView setAlpha:](self->_headerView, "setAlpha:", 1.0);
      -[MRUNowPlayingTimeControlsView setAlpha:](self->_timeControlsView, "setAlpha:", 1.0);
      -[MRUNowPlayingTransportControlsView setAlpha:](self->_transportControlsView, "setAlpha:", 1.0);
      -[MRUNowPlayingVolumeControlsView setAlpha:](self->_volumeControlsView, "setAlpha:", 1.0);
      v4 = 0.0;
LABEL_25:
      v3 = 0.0;
LABEL_26:
      v6 = 0.0;
LABEL_27:
      -[MRUMediaSuggestionsView setAlpha:](self->_suggestionsView, "setAlpha:", v4);
      -[MRUMediaControlsModuleRouteButton setAlpha:](self->_upperRoutingButton, "setAlpha:", v3);
      -[MRUMediaControlsModuleRouteButton setAlpha:](self->_lowerRoutingButton, "setAlpha:", v6);
      break;
    default:
      return;
  }
}

- (CGRect)suggestionsFrame
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double MinY;
  double v12;
  CGFloat MinX;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (self->_layout == 7)
  {
    CGRectGetMinX(*(CGRect *)&v3);
    v23.origin.x = v7;
    v23.origin.y = v8;
    v23.size.width = v9;
    v23.size.height = v10;
    CGRectGetMinY(v23);
    v24.origin.x = v7;
    v24.origin.y = v8;
    v24.size.width = v9;
    v24.size.height = v10;
    CGRectGetWidth(v24);
    v25.origin.x = v7;
    v25.origin.y = v8;
    v25.size.width = v9;
    v25.size.height = v10;
    CGRectGetHeight(v25);
    -[MRUMediaControlsModuleNowPlayingView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    MinX = v12;
    v15 = v14;
    v17 = v16;
  }
  else
  {
    -[MRUMediaSuggestionsView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", v5, v6);
    v15 = v18;
    v17 = v19;
    v26.origin.x = v7;
    v26.origin.y = v8;
    v26.size.width = v9;
    v26.size.height = v10;
    MinX = CGRectGetMinX(v26);
    v27.origin.x = v7;
    v27.origin.y = v8;
    v27.size.width = v9;
    v27.size.height = v10;
    MinY = CGRectGetMinY(v27);
  }
  v20 = MinX;
  v21 = v15;
  v22 = v17;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = MinY;
  result.origin.x = v20;
  return result;
}

- (MRUArtworkView)artworkView
{
  return self->_artworkView;
}

- (MRUNowPlayingHeaderView)headerView
{
  return self->_headerView;
}

- (MRUNowPlayingTimeControlsView)timeControlsView
{
  return self->_timeControlsView;
}

- (MRUNowPlayingTransportControlsView)transportControlsView
{
  return self->_transportControlsView;
}

- (MRUNowPlayingVolumeControlsView)volumeControlsView
{
  return self->_volumeControlsView;
}

- (NSArray)routingButtons
{
  return self->_routingButtons;
}

- (MRUMediaSuggestionsView)suggestionsView
{
  return self->_suggestionsView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)showSuggestionsView
{
  return self->_showSuggestionsView;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (BOOL)resizing
{
  return self->_resizing;
}

- (MRUMediaControlsModuleRouteButton)upperRoutingButton
{
  return self->_upperRoutingButton;
}

- (MRUMediaControlsModuleRouteButton)lowerRoutingButton
{
  return self->_lowerRoutingButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerRoutingButton, 0);
  objc_storeStrong((id *)&self->_upperRoutingButton, 0);
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->_routingButtons, 0);
  objc_storeStrong((id *)&self->_volumeControlsView, 0);
  objc_storeStrong((id *)&self->_transportControlsView, 0);
  objc_storeStrong((id *)&self->_timeControlsView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end
