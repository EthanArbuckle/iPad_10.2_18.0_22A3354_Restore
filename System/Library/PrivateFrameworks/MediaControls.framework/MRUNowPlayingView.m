@implementation MRUNowPlayingView

- (MRUNowPlayingView)initWithFrame:(CGRect)a3
{
  MRUNowPlayingView *v3;
  MRUNowPlayingView *v4;
  void *v5;
  MRUNowPlayingHeaderView *v6;
  MRUNowPlayingHeaderView *headerView;
  MRUNowPlayingTimeControlsView *v8;
  MRUNowPlayingTimeControlsView *timeControlsView;
  MRUNowPlayingTransportControlsView *v10;
  MRUNowPlayingTransportControlsView *transportControlsView;
  MRUNowPlayingVolumeControlsView *v12;
  MRUNowPlayingVolumeControlsView *volumeControlsView;
  MRUNowPlayingContainerView *v14;
  MRUNowPlayingContainerView *containerView;
  MRUArtworkView *v16;
  MRUArtworkView *artworkView;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MRUNowPlayingView;
  v3 = -[MRUNowPlayingView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MRUNowPlayingView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

    v6 = objc_alloc_init(MRUNowPlayingHeaderView);
    headerView = v4->_headerView;
    v4->_headerView = v6;

    -[MRUNowPlayingView addSubview:](v4, "addSubview:", v4->_headerView);
    v8 = objc_alloc_init(MRUNowPlayingTimeControlsView);
    timeControlsView = v4->_timeControlsView;
    v4->_timeControlsView = v8;

    -[MRUNowPlayingView addSubview:](v4, "addSubview:", v4->_timeControlsView);
    v10 = objc_alloc_init(MRUNowPlayingTransportControlsView);
    transportControlsView = v4->_transportControlsView;
    v4->_transportControlsView = v10;

    -[MRUNowPlayingView addSubview:](v4, "addSubview:", v4->_transportControlsView);
    v12 = objc_alloc_init(MRUNowPlayingVolumeControlsView);
    volumeControlsView = v4->_volumeControlsView;
    v4->_volumeControlsView = v12;

    -[MRUNowPlayingView addSubview:](v4, "addSubview:", v4->_volumeControlsView);
    v14 = objc_alloc_init(MRUNowPlayingContainerView);
    containerView = v4->_containerView;
    v4->_containerView = v14;

    -[MRUNowPlayingView addSubview:](v4, "addSubview:", v4->_containerView);
    v16 = objc_alloc_init(MRUArtworkView);
    artworkView = v4->_artworkView;
    v4->_artworkView = v16;

    -[MRUArtworkView pointerInteraction](v4->_artworkView, "pointerInteraction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEnabled:", 1);

    -[MRUNowPlayingView addSubview:](v4, "addSubview:", v4->_artworkView);
    v4->_showArtworkView = 1;
    v4->_showTimeControlsView = 1;
    v4->_showTransportControlsView = 1;
    v4->_showVolumeControlsView = 1;
    -[MRUNowPlayingView updateLayout](v4, "updateLayout");
    -[MRUNowPlayingView updateArtworkStyle](v4, "updateArtworkStyle");
    -[MRUNowPlayingView updateTextAlignment](v4, "updateTextAlignment");
    -[MRUNowPlayingView updateVisibility](v4, "updateVisibility");
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUNowPlayingView;
  -[MRUNowPlayingView layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
    -[MRUNowPlayingView layoutSubviewsHorizontal](self, "layoutSubviewsHorizontal");
  else
    -[MRUNowPlayingView layoutSubviewsVertical](self, "layoutSubviewsVertical");
}

- (void)layoutSubviewsVertical
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat Width;
  double v27;
  CGFloat x;
  CGFloat y;
  CGFloat v30;
  CGFloat height;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  double v72;
  MRUNowPlayingContainerView *containerView;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  CGFloat v108;
  double v109;
  double v110;
  double v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *artworkView;
  BOOL v125;
  double v126;
  CGFloat v127;
  double v128;
  CGFloat v129;
  double v130;
  CGFloat v131;
  double v132;
  CGFloat v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double top;
  double left;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  CGFloat MaxY;
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
  CGFloat v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  CGFloat v179;
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
  CGFloat v190;
  CGFloat v191;
  CGFloat v192;
  double v193;
  double v194;
  double v195;
  CGFloat v196;
  CGFloat v197;
  CGFloat v198;
  CGFloat v199;
  CGFloat v200;
  double v201;
  CGFloat v202;
  CGFloat v203;
  double v204;
  double v205;
  double v206;
  double v207;
  CGFloat v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  CGFloat v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  CGFloat v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  CGFloat v234;
  double v235;
  CGFloat v236;
  double v237;
  CGFloat v238;
  double v239;
  CGFloat v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  uint64_t v253;
  double v254;
  double v255;
  CGFloat v256;
  CGFloat v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  CGFloat v266;
  double v267;
  CGFloat v268;
  double v269;
  double v270;
  double v271;
  double v272;
  double v273;
  double v274;
  double v275;
  double v276;
  double v277;
  double v278;
  double v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  CGFloat v288;
  double v289;
  double v290;
  double v291;
  double v292;
  double v293;
  uint64_t v294;
  uint64_t v295;
  double v296;
  double recta;
  CGFloat rect_8;
  double rect_8a;
  CGFloat rect_16;
  double rect_24;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  CGRect v306;
  CGRect v307;
  CGRect v308;
  CGRect v309;
  CGRect v310;
  CGRect v311;
  CGRect v312;
  CGRect v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;
  CGRect v318;
  CGRect v319;
  CGRect v320;
  CGRect v321;
  CGRect v322;
  CGRect v323;
  CGRect v324;
  CGRect v325;
  CGRect v326;
  CGRect v327;
  CGRect v328;
  CGRect v329;
  CGRect v330;
  CGRect v331;
  CGRect v332;
  CGRect v333;
  CGRect v334;
  CGRect v335;
  CGRect v336;
  CGRect v337;
  CGRect v338;
  CGRect v339;
  CGRect v340;
  CGRect v341;
  CGRect v342;
  CGRect v343;
  CGRect v344;
  CGRect v345;
  CGRect v346;
  CGRect v347;
  CGRect v348;
  CGRect v349;
  CGRect v350;
  CGRect v351;
  CGRect v352;
  CGRect v353;
  CGRect v354;
  CGRect v355;
  CGRect v356;
  CGRect v357;
  CGRect v358;
  CGRect v359;
  CGRect v360;
  CGRect v361;
  CGRect v362;
  CGRect v363;
  CGRect v364;
  CGRect v365;
  CGRect v366;
  CGRect v367;
  CGRect v368;
  CGRect v369;
  CGRect v370;
  CGRect v371;
  CGRect v372;
  CGRect v373;
  CGRect v374;
  CGRect v375;
  CGRect v376;
  CGRect v377;
  CGRect v378;
  CGRect v379;
  CGRect v380;
  CGRect v381;
  CGRect v382;
  CGRect v383;
  CGRect v384;
  CGRect v385;
  CGRect v386;

  -[MRUNowPlayingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUNowPlayingView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  switch(self->_layout)
  {
    case 0:
      -[MRUNowPlayingView layoutSubviewsSmall](self, "layoutSubviewsSmall");
      return;
    case 1:
      -[MRUNowPlayingView suggestionsFrame](self, "suggestionsFrame");
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      UIRectInset();
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v18, v20);
      v302 = v13;
      v23 = v22;
      v306.origin.x = v15;
      v306.origin.y = v17;
      v306.size.width = v19;
      v306.size.height = v21;
      MinX = CGRectGetMinX(v306);
      v307.origin.x = v15;
      v307.origin.y = v17;
      v307.size.width = v19;
      v307.size.height = v21;
      MinY = CGRectGetMinY(v307);
      v308.origin.x = v15;
      v308.origin.y = v17;
      v308.size.width = v19;
      v308.size.height = v21;
      Width = CGRectGetWidth(v308);
      if (v23 <= 60.0)
        v27 = 60.0;
      else
        v27 = v23;
      v309.origin.x = MinX;
      v309.origin.y = MinY;
      v309.size.width = Width;
      v309.size.height = v27;
      CGRectGetMinX(v309);
      v310.origin.x = MinX;
      v310.origin.y = MinY;
      v310.size.width = Width;
      v310.size.height = v27;
      CGRectGetMinY(v310);
      -[MRUNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      UIRectInset();
      x = v311.origin.x;
      y = v311.origin.y;
      v30 = v311.size.width;
      height = v311.size.height;
      CGRectGetMinX(v311);
      v312.origin.x = x;
      v312.origin.y = y;
      v312.size.width = v30;
      v312.size.height = height;
      CGRectGetWidth(v312);
      UIRectCenteredYInRectScale();
      -[MRUNowPlayingView bounds](self, "bounds", v302);
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v313.origin.x = x;
      v313.origin.y = y;
      v313.size.width = v30;
      v313.size.height = height;
      CGRectGetHeight(v313);
      UIRectInset();
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v36, v38);
      v41 = v40;
      v43 = v42;
      v314.origin.x = v33;
      v314.origin.y = v35;
      v314.size.width = v37;
      v314.size.height = v39;
      v44 = CGRectGetMinX(v314);
      v315.origin.x = v33;
      v315.origin.y = v35;
      v315.size.width = v37;
      v315.size.height = v39;
      v45 = CGRectGetMinY(v315) - 7.0;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v44, v45, v41, v43);
      if (self->_showTimeControlsView)
      {
        v316.origin.x = v44;
        v316.origin.y = v45;
        v316.size.width = v41;
        v316.size.height = v43;
        CGRectGetHeight(v316);
        UIRectInset();
        v33 = v46;
        v35 = v47;
        v37 = v48;
        v39 = v49;
      }
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v37, v39);
      v51 = v50;
      v53 = v52;
      v317.origin.x = v33;
      v317.origin.y = v35;
      v317.size.width = v37;
      v317.size.height = v39;
      v54 = CGRectGetMinX(v317);
      v318.origin.x = v33;
      v318.origin.y = v35;
      v318.size.width = v37;
      v318.size.height = v39;
      v55 = CGRectGetMinY(v318);
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v54, v55, v51, v53);
      if (self->_showTransportControlsView)
      {
        v319.origin.x = v54;
        v319.origin.y = v55;
        v319.size.width = v51;
        v319.size.height = v53;
        CGRectGetHeight(v319);
        UIRectInset();
        v33 = v56;
        v35 = v57;
        v37 = v58;
        v39 = v59;
      }
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v37, v39);
      v61 = v60;
      v63 = v62;
      v320.origin.x = v33;
      v320.origin.y = v35;
      v320.size.width = v37;
      v320.size.height = v39;
      v64 = CGRectGetMinX(v320);
      v321.origin.x = v33;
      v321.origin.y = v35;
      v321.size.width = v37;
      v321.size.height = v39;
      v65 = CGRectGetMinY(v321);
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v64, v65, v61, v63);
      if (self->_showVolumeControlsView)
      {
        v322.origin.x = v64;
        v322.origin.y = v65;
        v322.size.width = v61;
        v322.size.height = v63;
        CGRectGetHeight(v322);
        UIRectInset();
        v33 = v66;
        v35 = v67;
        v37 = v68;
        v39 = v69;
      }
      v323.origin.x = v33;
      v323.origin.y = v35;
      v323.size.width = v37;
      v323.size.height = v39;
      v70 = CGRectGetMinY(v323);
      -[MRUNowPlayingView bounds](self, "bounds");
      v71 = CGRectGetWidth(v324);
      v325.origin.x = v33;
      v325.origin.y = v35;
      v325.size.width = v37;
      v325.size.height = v39;
      v72 = CGRectGetHeight(v325);
      containerView = self->_containerView;
      v74 = 0.0;
      v75 = v70;
      v76 = v71;
      goto LABEL_62;
    case 2:
      v303 = v13;
      -[MRUNowPlayingView suggestionsFrame](self, "suggestionsFrame");
      v78 = v77;
      v80 = v79;
      v82 = v81;
      v84 = v83;
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      if (self->_showSuggestionsView)
      {
        v326.origin.x = v78;
        v326.origin.y = v80;
        v326.size.width = v82;
        v326.size.height = v84;
        CGRectGetHeight(v326);
        UIRectInset();
        v86 = v85;
        v88 = v87;
        v90 = v89;
        v92 = v91;
      }
      else
      {
        top = self->_contentEdgeInsets.top;
        left = self->_contentEdgeInsets.left;
        v86 = v4 + left;
        v88 = v6 + top;
        v90 = v8 - (left + self->_contentEdgeInsets.right);
        v92 = v10 - (top + self->_contentEdgeInsets.bottom);
      }
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v90, v92);
      v153 = v152;
      v155 = v154;
      v337.origin.x = v86;
      v337.origin.y = v88;
      v337.size.width = v90;
      v337.size.height = v92;
      v156 = CGRectGetMinX(v337);
      v338.origin.x = v86;
      v338.origin.y = v88;
      v338.size.width = v90;
      v338.size.height = v92;
      MaxY = CGRectGetMaxY(v338);
      v158 = MaxY - v155;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v156, MaxY - v155, v153, v155);
      if (self->_showVolumeControlsView)
      {
        v339.origin.x = v156;
        v339.origin.y = v158;
        v339.size.width = v153;
        v339.size.height = v155;
        CGRectGetHeight(v339);
        UIRectInset();
        v86 = v159;
        v88 = v160;
        v90 = v161;
        v92 = v162;
      }
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v90, v92);
      v164 = v163;
      v166 = v165;
      v340.origin.x = v86;
      v340.origin.y = v88;
      v340.size.width = v90;
      v340.size.height = v92;
      v167 = CGRectGetMinX(v340);
      v341.origin.x = v86;
      v341.origin.y = v88;
      v341.size.width = v90;
      v341.size.height = v92;
      v168 = CGRectGetMaxY(v341);
      v169 = v168 - v166;
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v167, v168 - v166, v164, v166);
      if (self->_showTransportControlsView)
      {
        v342.origin.x = v167;
        v342.origin.y = v169;
        v342.size.width = v164;
        v342.size.height = v166;
        CGRectGetHeight(v342);
        UIRectInset();
        v86 = v170;
        v88 = v171;
        v90 = v172;
        v92 = v173;
      }
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v90, v92);
      v175 = v174;
      v177 = v176;
      v343.origin.x = v86;
      v343.origin.y = v88;
      v343.size.width = v90;
      v343.size.height = v92;
      v178 = CGRectGetMinX(v343);
      v344.origin.x = v86;
      v344.origin.y = v88;
      v344.size.width = v90;
      v344.size.height = v92;
      v179 = CGRectGetMaxY(v344);
      v180 = v179 - v177;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v178, v179 - v177, v175, v177);
      if (self->_showTimeControlsView && !self->_showSuggestionsView)
      {
        v345.origin.x = v178;
        v345.origin.y = v180;
        v345.size.width = v175;
        v345.size.height = v177;
        CGRectGetHeight(v345);
        UIRectInset();
        v86 = v181;
        v88 = v182;
        v90 = v183;
        v92 = v184;
      }
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v90, v92);
      v186 = v185;
      v188 = v187;
      v346.origin.x = v86;
      v346.origin.y = v88;
      v346.size.width = v90;
      v346.size.height = v92;
      v189 = CGRectGetMinX(v346);
      v347.origin.x = v86;
      v347.origin.y = v88;
      v347.size.width = v90;
      v347.size.height = v92;
      v190 = CGRectGetMaxY(v347);
      v191 = v190 - v188;
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:", v189, v190 - v188, v186, v188);
      v348.origin.x = v189;
      v348.origin.y = v191;
      v348.size.width = v186;
      v348.size.height = v188;
      CGRectGetHeight(v348);
      UIRectInset();
      v196 = v192;
      v197 = v193;
      v198 = v194;
      v199 = v195;
      if (self->_showSuggestionsView)
      {
        v200 = CGRectGetMinX(*(CGRect *)&v192);
        v349.origin.x = v196;
        v349.origin.y = v197;
        v349.size.width = v198;
        v349.size.height = v199;
        v201 = CGRectGetMaxY(v349);
        v350.origin.x = v196;
        v350.origin.y = v197;
        v350.size.width = v198;
        v350.size.height = v199;
        v202 = v201 - CGRectGetWidth(v350);
        v351.origin.x = v196;
        v351.origin.y = v197;
        v351.size.width = v198;
        v351.size.height = v199;
        v203 = CGRectGetWidth(v351);
        v352.origin.x = v196;
        v352.origin.y = v197;
        v352.size.width = v198;
        v352.size.height = v199;
        v199 = CGRectGetWidth(v352);
        v198 = v203;
        v197 = v202;
        v196 = v200;
      }
      else if (self->_useArtworkOverrideSize)
      {
        v294 = v303;
        UIRectCenteredIntegralRectScale();
        v196 = v204;
        v197 = v205;
        v198 = v206;
        v199 = v207;
      }
      artworkView = self->_artworkView;
      v120 = v196;
      v121 = v197;
      v122 = v198;
      v123 = v199;
      goto LABEL_34;
    case 3:
      -[MRUNowPlayingView suggestionsFrame](self, "suggestionsFrame");
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      v93 = self->_contentEdgeInsets.top;
      v94 = self->_contentEdgeInsets.left;
      v95 = v4 + v94;
      v96 = v6 + v93;
      v97 = v8 - (v94 + self->_contentEdgeInsets.right);
      v98 = v10 - (v93 + self->_contentEdgeInsets.bottom);
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v97, v98);
      v304 = v13;
      v100 = v99;
      v102 = v101;
      rect_8 = v101;
      v327.origin.x = v95;
      v327.origin.y = v96;
      v327.size.width = v97;
      v327.size.height = v98;
      v103 = CGRectGetMinX(v327);
      v328.origin.x = v95;
      v328.origin.y = v96;
      v328.size.width = v97;
      v328.size.height = v98;
      v104 = CGRectGetMaxY(v328);
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v103, v104, v100, v102);
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v97, v98);
      v106 = v105;
      rect_16 = v105;
      rect_24 = v107;
      v329.origin.x = v95;
      v329.origin.y = v96;
      v329.size.width = v97;
      v329.size.height = v98;
      recta = CGRectGetMinX(v329);
      v330.origin.x = v103;
      v330.origin.y = v104;
      v330.size.width = v100;
      v330.size.height = rect_8;
      v108 = CGRectGetMaxY(v330) + 7.0;
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", recta, v108, v106, rect_24);
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v97, v98);
      rect_8a = v109;
      v296 = v110;
      v331.origin.x = v95;
      v331.origin.y = v96;
      v331.size.width = v97;
      v331.size.height = v98;
      v111 = CGRectGetMinX(v331);
      v332.origin.x = recta;
      v332.origin.y = v108;
      v332.size.width = rect_16;
      v332.size.height = rect_24;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v111, CGRectGetMaxY(v332) + 7.0, rect_8a, v296);
      -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v97, v98);
      v333.origin.x = v95;
      v333.origin.y = v96;
      v333.size.width = v97;
      v333.size.height = v98;
      CGRectGetMinX(v333);
      UIRectCenteredYInRectScale();
      -[MRUNowPlayingView bounds](self, "bounds", v304);
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      UIRectInset();
      v113 = v112;
      v115 = v114;
      v117 = v116;
      v119 = v118;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v116, v118);
      v334.origin.x = v113;
      v334.origin.y = v115;
      v334.size.width = v117;
      v334.size.height = v119;
      CGRectGetMinX(v334);
      UIRectCenteredYInRectScale();
      -[MRUNowPlayingView bounds](self, "bounds", v304);
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      artworkView = self->_headerView;
LABEL_34:
      objc_msgSend(artworkView, "setFrame:", v120, v121, v122, v123, v294);
      -[MRUNowPlayingView bounds](self, "bounds");
      v208 = CGRectGetMaxY(v353);
      -[MRUNowPlayingView bounds](self, "bounds");
      v76 = CGRectGetWidth(v354);
      containerView = self->_containerView;
      v74 = 0.0;
      v72 = 0.0;
      v75 = v208;
      goto LABEL_62;
    case 4:
      v305 = v13;
      v125 = +[MRUFeatureFlagProvider isAutobahnEnabled](MRUFeatureFlagProvider, "isAutobahnEnabled");
      -[MRUNowPlayingView suggestionsFrame](self, "suggestionsFrame");
      v127 = v126;
      v129 = v128;
      v131 = v130;
      v133 = v132;
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      if (v125)
      {
        if (self->_showSuggestionsView)
        {
          v335.origin.x = v127;
          v335.origin.y = v129;
          v335.size.width = v131;
          v335.size.height = v133;
          CGRectGetHeight(v335);
          UIRectInset();
          v135 = v134;
          v137 = v136;
          v139 = v138;
          v141 = v140;
        }
        else
        {
          v209 = self->_contentEdgeInsets.top;
          v210 = self->_contentEdgeInsets.left;
          v135 = v4 + v210;
          v137 = v6 + v209;
          v139 = v8 - (v210 + self->_contentEdgeInsets.right);
          v141 = v10 - (v209 + self->_contentEdgeInsets.bottom);
        }
        -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v139, v141);
        v212 = v211;
        v214 = v213;
        v355.origin.x = v135;
        v355.origin.y = v137;
        v355.size.width = v139;
        v355.size.height = v141;
        v215 = CGRectGetMinX(v355);
        v356.origin.x = v135;
        v356.origin.y = v137;
        v356.size.width = v139;
        v356.size.height = v141;
        v216 = CGRectGetMaxY(v356);
        v217 = v216 - v214;
        -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v215, v216 - v214, v212, v214);
        if (self->_showVolumeControlsView)
        {
          v357.origin.x = v215;
          v357.origin.y = v217;
          v357.size.width = v212;
          v357.size.height = v214;
          CGRectGetHeight(v357);
          UIRectInset();
          v135 = v218;
          v137 = v219;
          v139 = v220;
          v141 = v221;
        }
        -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v139, v141);
        v223 = v222;
        v225 = v224;
        v358.origin.x = v135;
        v358.origin.y = v137;
        v358.size.width = v139;
        v358.size.height = v141;
        v226 = CGRectGetMinX(v358);
        v359.origin.x = v135;
        v359.origin.y = v137;
        v359.size.width = v139;
        v359.size.height = v141;
        v227 = CGRectGetMaxY(v359);
        v228 = v227 - v225;
        -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v226, v227 - v225, v223, v225);
        if (self->_showTransportControlsView)
        {
          v360.origin.x = v226;
          v360.origin.y = v228;
          v360.size.width = v223;
          v360.size.height = v225;
          CGRectGetHeight(v360);
          UIRectInset();
          v135 = v229;
          v137 = v230;
          v139 = v231;
          v141 = v232;
        }
        -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v139, v141);
        v361.origin.x = v135;
        v361.origin.y = v137;
        v361.size.width = v139;
        v361.size.height = v141;
        CGRectGetMinX(v361);
        v362.origin.x = v135;
        v362.origin.y = v137;
        v362.size.width = v139;
        v362.size.height = v141;
        CGRectGetMaxY(v362);
        UIRectInset();
        v234 = v233;
        v236 = v235;
        v238 = v237;
        v240 = v239;
        -[MRUNowPlayingView bounds](self, "bounds");
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
        if (self->_showTimeControlsView)
        {
          v363.origin.x = v234;
          v363.origin.y = v236;
          v363.size.width = v238;
          v363.size.height = v240;
          CGRectGetHeight(v363);
          UIRectInset();
          v135 = v241;
          v137 = v242;
          v139 = v243;
          v141 = v244;
        }
        if (!self->_showSuggestionsView && self->_showArtworkView)
        {
          UIRectInset();
          v135 = v245;
          v137 = v246;
          v139 = v247;
          v141 = v248;
        }
        v364.origin.x = v135;
        v364.origin.y = v137;
        v364.size.width = v139;
        v364.size.height = v141;
        CGRectGetMinX(v364);
        v365.origin.x = v135;
        v365.origin.y = v137;
        v365.size.width = v139;
        v365.size.height = v141;
        CGRectGetMinY(v365);
        -[MRUNowPlayingView bounds](self, "bounds");
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
        if (!self->_showSuggestionsView && self->_showArtworkView)
        {
          UIRectInset();
          v135 = v249;
          v137 = v250;
          v139 = v251;
          v141 = v252;
        }
        v253 = 440;
        -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v139, v141);
        v366.origin.x = v135;
        v366.origin.y = v137;
        v366.size.width = v139;
        v366.size.height = v141;
        CGRectGetMinX(v366);
        v367.origin.x = v135;
        v367.origin.y = v137;
        v367.size.width = v139;
        v367.size.height = v141;
        CGRectGetMinY(v367);
        UIRectCenteredYInRectScale();
        -[MRUNowPlayingView bounds](self, "bounds", v305);
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      }
      else
      {
        if (self->_showSuggestionsView)
        {
          v336.origin.x = v127;
          v336.origin.y = v129;
          v336.size.width = v131;
          v336.size.height = v133;
          CGRectGetHeight(v336);
          UIRectInset();
          v143 = v142;
          v145 = v144;
          v147 = v146;
          v149 = v148;
        }
        else
        {
          v254 = self->_contentEdgeInsets.top;
          v255 = self->_contentEdgeInsets.left;
          v143 = v4 + v255;
          v145 = v6 + v254;
          v147 = v8 - (v255 + self->_contentEdgeInsets.right);
          v149 = v10 - (v254 + self->_contentEdgeInsets.bottom);
        }
        v368.origin.x = v143;
        v368.origin.y = v145;
        v368.size.width = v147;
        v368.size.height = v149;
        v256 = CGRectGetMinX(v368);
        v369.origin.x = v143;
        v369.origin.y = v145;
        v369.size.width = v147;
        v369.size.height = v149;
        v257 = CGRectGetMinY(v369);
        v370.origin.x = v143;
        v370.origin.y = v145;
        v370.size.width = v147;
        v370.size.height = v149;
        v258 = CGRectGetWidth(v370);
        v259 = 100.0;
        -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v258, 100.0);
        if (self->_showSuggestionsView)
          v259 = v260;
        -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v258, v259);
        v371.origin.x = v256;
        v371.origin.y = v257;
        v371.size.width = v258;
        v371.size.height = v259;
        CGRectGetMinX(v371);
        v372.origin.x = v256;
        v372.origin.y = v257;
        v372.size.width = v258;
        v372.size.height = v259;
        CGRectGetMinY(v372);
        -[MRUNowPlayingView bounds](self, "bounds");
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
        if (!self->_showSuggestionsView && self->_showArtworkView)
        {
          UIRectInset();
          v256 = v261;
          v257 = v262;
          v258 = v263;
          v259 = v264;
        }
        v373.origin.x = v256;
        v373.origin.y = v257;
        v373.size.width = v258;
        v373.size.height = v259;
        CGRectGetMinX(v373);
        v374.origin.x = v256;
        v374.origin.y = v257;
        v374.size.width = v258;
        v374.size.height = v259;
        CGRectGetMinY(v374);
        v375.origin.x = v256;
        v375.origin.y = v257;
        v375.size.width = v258;
        v375.size.height = v259;
        CGRectGetWidth(v375);
        UIRectCenteredYInRectScale();
        -[MRUNowPlayingView bounds](self, "bounds", v305);
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
        v376.origin.x = v256;
        v376.origin.y = v257;
        v376.size.width = v258;
        v376.size.height = v259;
        CGRectGetHeight(v376);
        UIRectInset();
        v266 = v265;
        v268 = v267;
        v270 = v269;
        v272 = v271;
        -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v269, v271);
        v274 = v273;
        v276 = v275;
        v377.origin.x = v266;
        v377.origin.y = v268;
        v377.size.width = v270;
        v377.size.height = v272;
        v277 = CGRectGetMinX(v377);
        v378.origin.x = v266;
        v378.origin.y = v268;
        v378.size.width = v270;
        v378.size.height = v272;
        v278 = CGRectGetMinY(v378) - 7.0;
        -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v277, v278, v274, v276);
        if (!self->_showSuggestionsView && self->_showTimeControlsView)
        {
          v379.origin.x = v277;
          v379.origin.y = v278;
          v379.size.width = v274;
          v379.size.height = v276;
          CGRectGetHeight(v379);
          UIRectInset();
          v266 = v279;
          v268 = v280;
          v270 = v281;
          v272 = v282;
        }
        -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v270, v272);
        v284 = v283;
        v286 = v285;
        v380.origin.x = v266;
        v380.origin.y = v268;
        v380.size.width = v270;
        v380.size.height = v272;
        v287 = CGRectGetMinX(v380);
        v381.origin.x = v266;
        v381.origin.y = v268;
        v381.size.width = v270;
        v381.size.height = v272;
        v288 = CGRectGetMaxY(v381);
        v289 = v288 - v286;
        -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v287, v288 - v286, v284, v286);
        if (self->_showVolumeControlsView)
        {
          v382.origin.x = v287;
          v382.origin.y = v289;
          v382.size.width = v284;
          v382.size.height = v286;
          CGRectGetHeight(v382);
          UIRectInset();
          v266 = v290;
          v268 = v291;
          v270 = v292;
          v272 = v293;
        }
        v253 = 456;
        -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v270, v272);
        v383.origin.x = v266;
        v383.origin.y = v268;
        v383.size.width = v270;
        v383.size.height = v272;
        CGRectGetMinX(v383);
        v295 = v305;
        UIRectCenteredYInRectScale();
      }
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v253), "setFrame:", v295);
      -[MRUNowPlayingView bounds](self, "bounds");
      CGRectGetMaxX(v384);
      -[MRUNowPlayingView bounds](self, "bounds");
      CGRectGetMinY(v385);
      -[MRUNowPlayingView bounds](self, "bounds");
      CGRectGetHeight(v386);
      -[MRUNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      containerView = self->_containerView;
LABEL_62:
      -[MRUNowPlayingContainerView setFrame:](containerView, "setFrame:", v74, v75, v76, v72);
      break;
    default:
      return;
  }
}

- (void)layoutSubviewsHorizontal
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CGFloat v14;
  CGFloat MinY;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v19;
  CGFloat MinX;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *transportControlsView;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  double top;
  double left;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  double v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  CGFloat v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double MaxY;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  BOOL v106;
  double v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  double v111;
  CGFloat v112;
  double v113;
  CGFloat v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  CGFloat v132;
  double v133;
  CGFloat v134;
  double v135;
  CGFloat v136;
  double v137;
  CGFloat v138;
  double v139;
  CGFloat v140;
  double v141;
  CGFloat v142;
  CGFloat v143;
  CGFloat v144;
  double v145;
  CGFloat v146;
  double v147;
  CGFloat v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  CGFloat v154;
  double v155;
  CGFloat v156;
  CGFloat v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  CGFloat v164;
  double v165;
  double v166;
  CGFloat v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  uint64_t v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  CGFloat v181;
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
  CGFloat v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  CGFloat v204;
  CGFloat v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  CGFloat v214;
  double v215;
  CGFloat v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  CGFloat v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  uint64_t v242;
  double v243;
  double rect;
  CGFloat rect_8;
  CGFloat rect_16;
  uint64_t rect_24;
  double rect_24a;
  double rect_24b;
  uint64_t v250;
  CGFloat v251;
  CGFloat v252;
  double v253;
  CGFloat Height;
  double v255;
  CGFloat v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;
  CGRect v272;
  CGRect v273;
  CGRect v274;
  CGRect v275;
  CGRect v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;
  CGRect v280;
  CGRect v281;
  CGRect v282;
  CGRect v283;
  CGRect v284;
  CGRect v285;
  CGRect v286;
  CGRect v287;
  CGRect v288;
  CGRect v289;
  CGRect v290;
  CGRect v291;
  CGRect v292;
  CGRect v293;
  CGRect v294;
  CGRect v295;
  CGRect v296;
  CGRect v297;
  CGRect v298;
  CGRect v299;
  CGRect v300;
  CGRect v301;
  CGRect v302;
  CGRect v303;
  CGRect v304;
  CGRect v305;
  CGRect v306;
  CGRect v307;
  CGRect v308;
  CGRect v309;
  CGRect v310;
  CGRect v311;
  CGRect v312;
  CGRect v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;
  CGRect v318;
  CGRect v319;
  CGRect v320;
  CGRect v321;
  CGRect v322;
  CGRect v323;
  CGRect v324;
  CGRect v325;
  CGRect v326;
  CGRect v327;
  CGRect v328;
  CGRect v329;
  CGRect v330;
  CGRect v331;
  CGRect v332;
  CGRect v333;
  CGRect v334;
  CGRect v335;

  -[MRUNowPlayingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUNowPlayingView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  switch(self->_layout)
  {
    case 0:
      -[MRUNowPlayingView layoutSubviewsSmall](self, "layoutSubviewsSmall");
      return;
    case 1:
      -[MRUNowPlayingView suggestionsFrame](self, "suggestionsFrame");
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      v261.origin.x = v4;
      v261.origin.y = v6;
      v261.size.width = v8;
      v261.size.height = v10;
      v257 = v13;
      v14 = CGRectGetWidth(v261) * 0.5;
      v262.origin.x = v4;
      v262.origin.y = v6;
      v262.size.width = v8;
      v262.size.height = v10;
      Height = CGRectGetHeight(v262);
      v263.origin.x = v4;
      v263.origin.y = v6;
      v263.size.width = v8;
      v263.size.height = v10;
      v252 = CGRectGetMaxX(v263) - v14;
      v264.origin.x = v4;
      v264.origin.y = v6;
      v264.size.width = v8;
      v264.size.height = v10;
      MinY = CGRectGetMinY(v264);
      -[MRUNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingContainerView setFrame:](self->_containerView, "setFrame:");
      v265.origin.x = v252;
      v265.size.height = Height;
      v265.origin.y = MinY;
      v265.size.width = v14;
      CGRectGetWidth(v265);
      UIRectInset();
      x = v266.origin.x;
      y = v266.origin.y;
      width = v266.size.width;
      v19 = v266.size.height;
      MinX = CGRectGetMinX(v266);
      v267.origin.x = x;
      v267.origin.y = y;
      v267.size.width = width;
      v267.size.height = v19;
      v21 = CGRectGetMinY(v267);
      v268.origin.x = x;
      v268.origin.y = y;
      v268.size.width = width;
      v268.size.height = v19;
      v22 = CGRectGetWidth(v268);
      -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v22, 60.0);
      v269.origin.x = MinX;
      v269.origin.y = v21;
      v269.size.width = v22;
      v269.size.height = 60.0;
      CGRectGetMinX(v269);
      v270.origin.x = MinX;
      v270.origin.y = v21;
      v270.size.width = v22;
      v270.size.height = 60.0;
      CGRectGetMinY(v270);
      -[MRUNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      UIRectInset();
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v27, v29);
      v271.origin.x = v24;
      v271.origin.y = v26;
      v271.size.width = v28;
      v271.size.height = v30;
      CGRectGetMinX(v271);
      v272.origin.x = v24;
      v272.origin.y = v26;
      v272.size.width = v28;
      v272.size.height = v30;
      CGRectGetMinY(v272);
      v273.origin.x = v24;
      v273.origin.y = v26;
      v273.size.width = v28;
      v273.size.height = v30;
      CGRectGetWidth(v273);
      UIRectCenteredYInRectScale();
      -[MRUNowPlayingView bounds](self, "bounds", v257);
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v274.origin.x = v24;
      v274.origin.y = v26;
      v274.size.width = v28;
      v274.size.height = v30;
      CGRectGetHeight(v274);
      UIRectInset();
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v35, v37);
      v40 = v39;
      v42 = v41;
      v275.origin.x = v32;
      v275.origin.y = v34;
      v275.size.width = v36;
      v275.size.height = v38;
      v43 = CGRectGetMinX(v275);
      v276.origin.x = v32;
      v276.origin.y = v34;
      v276.size.width = v36;
      v276.size.height = v38;
      v44 = CGRectGetMinY(v276);
      -[MRUNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      if (self->_showTimeControlsView)
      {
        v277.origin.x = v43;
        v277.origin.y = v44;
        v277.size.width = v40;
        v277.size.height = v42;
        CGRectGetHeight(v277);
        UIRectInset();
        v32 = v45;
        v34 = v46;
        v36 = v47;
        v38 = v48;
      }
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v36, v38);
      v50 = v49;
      v52 = v51;
      v278.origin.x = v32;
      v278.origin.y = v34;
      v278.size.width = v36;
      v278.size.height = v38;
      v53 = CGRectGetMinX(v278);
      v279.origin.x = v32;
      v279.origin.y = v34;
      v279.size.width = v36;
      v279.size.height = v38;
      v54 = CGRectGetMaxY(v279) - v52;
      -[MRUNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      if (self->_showVolumeControlsView)
      {
        v280.origin.x = v53;
        v280.origin.y = v54;
        v280.size.width = v50;
        v280.size.height = v52;
        CGRectGetHeight(v280);
        UIRectInset();
        v32 = v55;
        v34 = v56;
        v36 = v57;
        v38 = v58;
      }
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v36, v38);
      v281.origin.x = v32;
      v281.origin.y = v34;
      v281.size.width = v36;
      v281.size.height = v38;
      CGRectGetMinX(v281);
      UIRectCenteredYInRectScale();
      -[MRUNowPlayingView bounds](self, "bounds", v257);
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      transportControlsView = self->_transportControlsView;
      goto LABEL_46;
    case 2:
      v258 = v13;
      -[MRUNowPlayingView suggestionsFrame](self, "suggestionsFrame");
      v253 = v61;
      v255 = v60;
      rect_24 = v63;
      v250 = v62;
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      top = self->_contentEdgeInsets.top;
      left = self->_contentEdgeInsets.left;
      v66 = v4 + left;
      v67 = v6 + top;
      v68 = v8 - (left + self->_contentEdgeInsets.right);
      v69 = v10 - (top + self->_contentEdgeInsets.bottom);
      -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v68, v69);
      v71 = v70;
      v73 = v72;
      v282.origin.x = v66;
      v282.origin.y = v67;
      v282.size.width = v68;
      v282.size.height = v69;
      v74 = CGRectGetMinX(v282);
      v283.origin.x = v66;
      v283.origin.y = v67;
      v283.size.width = v68;
      v283.size.height = v69;
      v75 = CGRectGetMinY(v283);
      -[MRUNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      if (self->_showSuggestionsView)
      {
        v77 = v253;
        v76 = v255;
        v79 = rect_24;
        v78 = v250;
      }
      else
      {
        v76 = v74;
        v77 = v75;
        v78 = v71;
        v79 = v73;
      }
      CGRectGetWidth(*(CGRect *)&v76);
      UIRectInset();
      v132 = v131;
      v134 = v133;
      v136 = v135;
      v138 = v137;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v135, v137);
      v140 = v139;
      v142 = v141;
      v295.origin.x = v132;
      v295.origin.y = v134;
      v295.size.width = v136;
      v295.size.height = v138;
      v143 = CGRectGetMinX(v295);
      v296.origin.x = v132;
      v296.origin.y = v134;
      v296.size.width = v136;
      v296.size.height = v138;
      v144 = CGRectGetMinY(v296);
      -[MRUNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v297.origin.x = v143;
      v297.origin.y = v144;
      v297.size.width = v140;
      v297.size.height = v142;
      CGRectGetHeight(v297);
      UIRectInset();
      v146 = v145;
      v148 = v147;
      v150 = v149;
      v152 = v151;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v149, v151);
      v154 = v153;
      v156 = v155;
      v298.origin.x = v146;
      v298.origin.y = v148;
      v298.size.width = v150;
      v298.size.height = v152;
      v157 = CGRectGetMinX(v298);
      v299.origin.x = v146;
      v299.origin.y = v148;
      v299.size.width = v150;
      v299.size.height = v152;
      v158 = CGRectGetMinY(v299) - 7.0;
      -[MRUNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      if (self->_showTimeControlsView)
      {
        v300.origin.x = v157;
        v300.origin.y = v158;
        v300.size.width = v154;
        v300.size.height = v156;
        CGRectGetHeight(v300);
        UIRectInset();
        v146 = v159;
        v148 = v160;
        v150 = v161;
        v152 = v162;
      }
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v150, v152);
      v164 = v163;
      v166 = v165;
      v301.origin.x = v146;
      v301.origin.y = v148;
      v301.size.width = v150;
      v301.size.height = v152;
      v167 = CGRectGetMinX(v301);
      v302.origin.x = v146;
      v302.origin.y = v148;
      v302.size.width = v150;
      v302.size.height = v152;
      v168 = CGRectGetMaxY(v302) - v166;
      -[MRUNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      if (self->_showVolumeControlsView)
      {
        v303.origin.x = v167;
        v303.origin.y = v168;
        v303.size.width = v164;
        v303.size.height = v166;
        CGRectGetHeight(v303);
        UIRectInset();
        v146 = v169;
        v148 = v170;
        v150 = v171;
        v152 = v172;
      }
      v173 = 456;
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v150, v152);
      v304.origin.x = v146;
      v304.origin.y = v148;
      v304.size.width = v150;
      v304.size.height = v152;
      CGRectGetMinX(v304);
      UIRectCenteredYInRectScale();
      -[MRUNowPlayingView bounds](self, "bounds", v258);
      goto LABEL_31;
    case 3:
      -[MRUNowPlayingView suggestionsFrame](self, "suggestionsFrame");
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      v80 = self->_contentEdgeInsets.top;
      v81 = self->_contentEdgeInsets.left;
      v256 = v4 + v81;
      v82 = v6 + v80;
      v83 = v8 - (v81 + self->_contentEdgeInsets.right);
      v84 = v10 - (v80 + self->_contentEdgeInsets.bottom);
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v83, v84);
      v86 = v85;
      rect_16 = v85;
      rect_24a = v87;
      v284.origin.x = v256;
      v284.origin.y = v82;
      v284.size.width = v83;
      v284.size.height = v84;
      rect = CGRectGetMinX(v284);
      v285.origin.x = v256;
      v285.origin.y = v82;
      v285.size.width = v83;
      v285.size.height = v84;
      v88 = CGRectGetMaxY(v285) + 7.0;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", rect, v88, v86, rect_24a);
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v83, v84);
      v90 = v89;
      rect_8 = v89;
      v243 = v91;
      v286.origin.x = v256;
      v251 = v82;
      v286.origin.y = v82;
      v286.size.width = v83;
      v286.size.height = v84;
      v259 = v13;
      v92 = CGRectGetMinX(v286);
      v287.origin.x = rect;
      v287.origin.y = v88;
      v287.size.width = rect_16;
      v287.size.height = rect_24a;
      MaxY = CGRectGetMaxY(v287);
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v92, MaxY, v90, v243);
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v83, v84);
      rect_24b = v94;
      v96 = v95;
      v288.origin.x = v256;
      v288.origin.y = v82;
      v288.size.width = v83;
      v288.size.height = v84;
      v97 = CGRectGetMinX(v288);
      v289.origin.x = v92;
      v289.origin.y = MaxY;
      v289.size.width = rect_8;
      v289.size.height = v243;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v97, CGRectGetMaxY(v289) + 7.0, rect_24b, v96);
      -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v83, v84);
      v290.origin.x = v256;
      v290.origin.y = v251;
      v290.size.width = v83;
      v290.size.height = v84;
      CGRectGetMinX(v290);
      UIRectCenteredYInRectScale();
      -[MRUNowPlayingView bounds](self, "bounds", v259);
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      UIRectInset();
      v99 = v98;
      v101 = v100;
      v103 = v102;
      v105 = v104;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v102, v104);
      v291.origin.x = v99;
      v291.origin.y = v101;
      v291.size.width = v103;
      v291.size.height = v105;
      CGRectGetMinX(v291);
      UIRectCenteredYInRectScale();
      -[MRUNowPlayingView bounds](self, "bounds", v259);
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      -[MRUNowPlayingView bounds](self, "bounds");
      CGRectGetMinX(v292);
      goto LABEL_45;
    case 4:
      v260 = v13;
      v106 = +[MRUFeatureFlagProvider isAutobahnEnabled](MRUFeatureFlagProvider, "isAutobahnEnabled");
      -[MRUNowPlayingView suggestionsFrame](self, "suggestionsFrame");
      v108 = v107;
      v110 = v109;
      v112 = v111;
      v114 = v113;
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      if (v106)
      {
        if (self->_showSuggestionsView)
        {
          v293.origin.x = v108;
          v293.origin.y = v110;
          v293.size.width = v112;
          v293.size.height = v114;
          CGRectGetHeight(v293);
          UIRectInset();
          v116 = v115;
          v118 = v117;
          v120 = v119;
          v122 = v121;
        }
        else
        {
          v174 = self->_contentEdgeInsets.top;
          v175 = self->_contentEdgeInsets.left;
          v116 = v4 + v175;
          v118 = v6 + v174;
          v120 = v8 - (v175 + self->_contentEdgeInsets.right);
          v122 = v10 - (v174 + self->_contentEdgeInsets.bottom);
        }
        -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v120, v122);
        v177 = v176;
        v179 = v178;
        v305.origin.x = v116;
        v305.origin.y = v118;
        v305.size.width = v120;
        v305.size.height = v122;
        v180 = CGRectGetMinX(v305);
        v306.origin.x = v116;
        v306.origin.y = v118;
        v306.size.width = v120;
        v306.size.height = v122;
        v181 = CGRectGetMaxY(v306);
        v182 = v181 - v179;
        -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v180, v181 - v179, v177, v179);
        if (self->_showVolumeControlsView)
        {
          v307.origin.x = v180;
          v307.origin.y = v182;
          v307.size.width = v177;
          v307.size.height = v179;
          CGRectGetHeight(v307);
          UIRectInset();
          v116 = v183;
          v118 = v184;
          v120 = v185;
          v122 = v186;
        }
        -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v120, v122);
        v188 = v187;
        v190 = v189;
        v308.origin.x = v116;
        v308.origin.y = v118;
        v308.size.width = v120;
        v308.size.height = v122;
        v191 = CGRectGetMinX(v308);
        v309.origin.x = v116;
        v309.origin.y = v118;
        v309.size.width = v120;
        v309.size.height = v122;
        v192 = CGRectGetMaxY(v309);
        v193 = v192 - v190;
        -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v191, v192 - v190, v188, v190);
        if (self->_showTransportControlsView)
        {
          v310.origin.x = v191;
          v310.origin.y = v193;
          v310.size.width = v188;
          v310.size.height = v190;
          CGRectGetHeight(v310);
          UIRectInset();
          v116 = v194;
          v118 = v195;
          v120 = v196;
          v122 = v197;
        }
        v311.origin.x = v116;
        v311.origin.y = v118;
        v311.size.width = v120;
        v311.size.height = v122;
        CGRectGetMinX(v311);
        v312.origin.x = v116;
        v312.origin.y = v118;
        v312.size.width = v120;
        v312.size.height = v122;
        CGRectGetMinY(v312);
        -[MRUNowPlayingView bounds](self, "bounds");
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
        if (!self->_showSuggestionsView && self->_showArtworkView)
        {
          UIRectInset();
          v116 = v198;
          v118 = v199;
          v120 = v200;
          v122 = v201;
        }
        -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v120, v122);
        v313.origin.x = v116;
        v313.origin.y = v118;
        v313.size.width = v120;
        v313.size.height = v122;
        CGRectGetMinX(v313);
        v314.origin.x = v116;
        v314.origin.y = v118;
        v314.size.width = v120;
        v314.size.height = v122;
        CGRectGetMaxY(v314);
        UIRectInset();
        -[MRUNowPlayingView bounds](self, "bounds");
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
        v173 = 440;
        -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v120, v122);
        v315.origin.x = v116;
        v315.origin.y = v118;
        v315.size.width = v120;
        v315.size.height = v122;
        CGRectGetMinX(v315);
        v316.origin.x = v116;
        v316.origin.y = v118;
        v316.size.width = v120;
        v316.size.height = v122;
        CGRectGetMinY(v316);
        -[MRUNowPlayingView bounds](self, "bounds");
LABEL_31:
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      }
      else
      {
        if (self->_showSuggestionsView)
        {
          v294.origin.x = v108;
          v294.origin.y = v110;
          v294.size.width = v112;
          v294.size.height = v114;
          CGRectGetHeight(v294);
          UIRectInset();
          v124 = v123;
          v126 = v125;
          v128 = v127;
          v130 = v129;
        }
        else
        {
          v202 = self->_contentEdgeInsets.top;
          v203 = self->_contentEdgeInsets.left;
          v124 = v4 + v203;
          v126 = v6 + v202;
          v128 = v8 - (v203 + self->_contentEdgeInsets.right);
          v130 = v10 - (v202 + self->_contentEdgeInsets.bottom);
        }
        v317.origin.x = v124;
        v317.origin.y = v126;
        v317.size.width = v128;
        v317.size.height = v130;
        v204 = CGRectGetMinX(v317);
        v318.origin.x = v124;
        v318.origin.y = v126;
        v318.size.width = v128;
        v318.size.height = v130;
        v205 = CGRectGetMinY(v318);
        v319.origin.x = v124;
        v319.origin.y = v126;
        v319.size.width = v128;
        v319.size.height = v130;
        v206 = CGRectGetWidth(v319);
        v207 = 100.0;
        -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v206, 100.0);
        if (self->_showSuggestionsView)
          v207 = v208;
        -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v206, v207);
        v320.origin.x = v204;
        v320.origin.y = v205;
        v320.size.width = v206;
        v320.size.height = v207;
        CGRectGetMinX(v320);
        v321.origin.x = v204;
        v321.origin.y = v205;
        v321.size.width = v206;
        v321.size.height = v207;
        CGRectGetMinY(v321);
        -[MRUNowPlayingView bounds](self, "bounds");
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
        if (!self->_showSuggestionsView && self->_showArtworkView)
        {
          UIRectInset();
          v204 = v209;
          v205 = v210;
          v206 = v211;
          v207 = v212;
        }
        v322.origin.x = v204;
        v322.origin.y = v205;
        v322.size.width = v206;
        v322.size.height = v207;
        CGRectGetMinX(v322);
        v323.origin.x = v204;
        v323.origin.y = v205;
        v323.size.width = v206;
        v323.size.height = v207;
        CGRectGetMinY(v323);
        v324.origin.x = v204;
        v324.origin.y = v205;
        v324.size.width = v206;
        v324.size.height = v207;
        CGRectGetWidth(v324);
        UIRectCenteredYInRectScale();
        -[MRUNowPlayingView bounds](self, "bounds", v260);
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
        v325.origin.x = v204;
        v325.origin.y = v205;
        v325.size.width = v206;
        v325.size.height = v207;
        CGRectGetHeight(v325);
        UIRectInset();
        v214 = v213;
        v216 = v215;
        v218 = v217;
        v220 = v219;
        -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v217, v219);
        v222 = v221;
        v224 = v223;
        v326.origin.x = v214;
        v326.origin.y = v216;
        v326.size.width = v218;
        v326.size.height = v220;
        v225 = CGRectGetMinX(v326);
        v327.origin.x = v214;
        v327.origin.y = v216;
        v327.size.width = v218;
        v327.size.height = v220;
        v226 = CGRectGetMinY(v327) - 7.0;
        -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v225, v226, v222, v224);
        if (!self->_showSuggestionsView && self->_showTimeControlsView)
        {
          v328.origin.x = v225;
          v328.origin.y = v226;
          v328.size.width = v222;
          v328.size.height = v224;
          CGRectGetHeight(v328);
          UIRectInset();
          v214 = v227;
          v216 = v228;
          v218 = v229;
          v220 = v230;
        }
        -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v218, v220);
        v232 = v231;
        v234 = v233;
        v329.origin.x = v214;
        v329.origin.y = v216;
        v329.size.width = v218;
        v329.size.height = v220;
        v235 = CGRectGetMinX(v329);
        v330.origin.x = v214;
        v330.origin.y = v216;
        v330.size.width = v218;
        v330.size.height = v220;
        v236 = CGRectGetMaxY(v330);
        v237 = v236 - v234;
        -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v235, v236 - v234, v232, v234);
        if (self->_showVolumeControlsView)
        {
          v331.origin.x = v235;
          v331.origin.y = v237;
          v331.size.width = v232;
          v331.size.height = v234;
          CGRectGetHeight(v331);
          UIRectInset();
          v214 = v238;
          v216 = v239;
          v218 = v240;
          v220 = v241;
        }
        v173 = 456;
        -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v218, v220);
        v332.origin.x = v214;
        v332.origin.y = v216;
        v332.size.width = v218;
        v332.size.height = v220;
        CGRectGetMinX(v332);
        v242 = v260;
        UIRectCenteredYInRectScale();
      }
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v173), "setFrame:", v242);
      -[MRUNowPlayingView bounds](self, "bounds");
      CGRectGetMaxX(v333);
LABEL_45:
      -[MRUNowPlayingView bounds](self, "bounds");
      CGRectGetMinY(v334);
      -[MRUNowPlayingView bounds](self, "bounds");
      CGRectGetHeight(v335);
      -[MRUNowPlayingView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      transportControlsView = self->_containerView;
LABEL_46:
      objc_msgSend(transportControlsView, "setFrame:");
      return;
    default:
      return;
  }
}

- (void)layoutSubviewsSmall
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MinX;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MaxY;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  -[MRUNowPlayingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUNowPlayingView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  CGRectGetHeight(v33);
  UIRoundToScale();
  v15 = v14 * -0.5;
  -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v8, v10);
  UIRectCenteredIntegralRectScale();
  -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:", v13);
  -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v8, v10);
  v17 = v16;
  v19 = v18;
  v34.origin.x = v4;
  v34.origin.y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  v20 = CGRectGetMaxY(v34) - v19 + v15 - 6.0;
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", CGRectGetMinX(v35), v20, v17, v19);
  -[MRUNowPlayingView suggestionsFrame](self, "suggestionsFrame");
  -[UIView setFrame:](self->_suggestionsView, "setFrame:");
  -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:", v4 + self->_contentEdgeInsets.left, v6 + self->_contentEdgeInsets.top, v8 - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right), v10 - (self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom));
  -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v8, v10);
  v22 = v21;
  v24 = v23;
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  MinX = CGRectGetMinX(v36);
  -[MRUNowPlayingHeaderView frame](self->_headerView, "frame");
  -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", MinX, CGRectGetMaxY(v37), v22, v24);
  -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v8, v10);
  v27 = v26;
  v29 = v28;
  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  v30 = CGRectGetMinX(v38);
  -[MRUNowPlayingTransportControlsView frame](self->_transportControlsView, "frame");
  MaxY = CGRectGetMaxY(v39);
  -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v30, MaxY, v27, v29);
  v40.origin.x = v30;
  v40.origin.y = MaxY;
  v40.size.width = v27;
  v40.size.height = v29;
  v32 = CGRectGetMaxY(v40);
  -[MRUNowPlayingView bounds](self, "bounds");
  -[MRUNowPlayingContainerView setFrame:](self->_containerView, "setFrame:", 0.0, v32, CGRectGetWidth(v41), 0.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double top;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double bottom;
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
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  MRUNowPlayingHeaderView *headerView;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *artworkView;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGSize result;

  height = a3.height;
  width = a3.width;
  switch(self->_layout)
  {
    case 1:
      if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
        goto LABEL_20;
      top = self->_contentEdgeInsets.top;
      v7 = self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
      v8 = width - v7;
      v9 = height - top;
      if (self->_showVolumeControlsView)
      {
        -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", width - v7, v9);
        v9 = v9 - (v10 + 7.0);
        top = top + v10 + 7.0;
      }
      if (self->_showTransportControlsView)
      {
        -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v8, v9);
        v9 = v9 - (v11 + 7.0);
        top = top + v11 + 7.0;
      }
      if (self->_showTimeControlsView)
      {
        -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v8, v9);
        v9 = v9 - (v12 + 7.0);
        top = top + v12 + 7.0;
      }
      -[MRUNowPlayingContainerView sizeThatFits:](self->_containerView, "sizeThatFits:", v8, v9 - 60.0);
      height = top + 60.0 + v13;
      goto LABEL_62;
    case 2:
      if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
      {
LABEL_20:
        v25 = (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right) * 1.5;
        v26 = height - (self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom);
        if (width - v25 < v26)
          v26 = width - v25;
        v27 = v25 + v26 * 2.0;
        if (v27 < width)
          width = v27;
      }
      else
      {
        bottom = self->_contentEdgeInsets.bottom;
        v15 = self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
        if (self->_showSuggestionsView)
        {
          -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", width, height);
          v17 = height - bottom - v16;
          v18 = bottom + v16;
        }
        else
        {
          v18 = bottom + self->_contentEdgeInsets.top;
          v17 = height - v18;
        }
        v41 = width - v15;
        if (self->_showVolumeControlsView)
        {
          -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v41, v17);
          v17 = v17 - (v42 + 7.0);
          v18 = v18 + v42 + 7.0;
        }
        if (self->_showTransportControlsView)
        {
          -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v41, v17);
          v17 = v17 - (v43 + 7.0);
          v18 = v18 + v43 + 7.0;
        }
        if (self->_showTimeControlsView && !self->_showSuggestionsView)
        {
          -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v41, v17);
          v17 = v17 - (v44 + 7.0);
          v18 = v18 + v44 + 7.0;
        }
        -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v41, v17);
        height = v18 + v45;
        if (!self->_showSuggestionsView)
        {
          v38 = v17 - v45;
          artworkView = self->_artworkView;
          v37 = v41;
          goto LABEL_51;
        }
      }
      goto LABEL_62;
    case 3:
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", a3.width, a3.height);
      if (v19 <= 60.0)
        height = 60.0;
      else
        height = v19;
      goto LABEL_62;
    case 4:
      v20 = self->_contentEdgeInsets.bottom;
      v21 = self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
      if (self->_showSuggestionsView)
      {
        -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", a3.width, a3.height);
        v23 = height - v20 - v22;
        v24 = v20 + v22;
      }
      else
      {
        v24 = v20 + self->_contentEdgeInsets.top;
        v23 = a3.height - v24;
      }
      v28 = width - v21;
      v29 = +[MRUFeatureFlagProvider isAutobahnEnabled](MRUFeatureFlagProvider, "isAutobahnEnabled");
      headerView = self->_headerView;
      if (v29)
      {
        -[MRUNowPlayingHeaderView sizeThatFits:](headerView, "sizeThatFits:", v28, v23);
        if (self->_showArtworkView && !self->_showSuggestionsView)
        {
          v32 = 57.0;
          if (v31 > 57.0)
            v32 = v31;
          v31 = v32 + 7.0;
        }
        v33 = v23 - v31;
        height = v24 + v31;
        if (self->_showTimeControlsView)
        {
          -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v28, v33);
          v33 = v33 - v34;
          height = height + v34;
        }
        if (self->_showTransportControlsView)
        {
          -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v28, v33);
          v33 = v33 - (v35 + 7.0);
          height = height + v35 + 7.0;
        }
        if (self->_showVolumeControlsView)
        {
          artworkView = self->_volumeControlsView;
          v37 = v28;
          v38 = v33;
LABEL_51:
          objc_msgSend(artworkView, "sizeThatFits:", v37, v38);
          goto LABEL_61;
        }
      }
      else
      {
        -[MRUNowPlayingHeaderView sizeThatFits:](headerView, "sizeThatFits:", v28, v23);
        if (self->_showArtworkView && !self->_showSuggestionsView)
        {
          v40 = 100.0;
          if (v39 > 100.0)
            v40 = v39;
        }
        else
        {
          v40 = v39 + 7.0 * 2.0;
        }
        v47 = v23 - v40;
        height = v24 + v40;
        if (self->_showTimeControlsView && !self->_showSuggestionsView)
        {
          -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v28, v47);
          v47 = v47 - (v48 + 7.0);
          height = height + v48 + 7.0;
        }
        if (self->_showTransportControlsView)
        {
          -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v28, v47);
          v47 = v47 - (v49 + 7.0);
          height = height + v49 + 7.0;
        }
        if (self->_showVolumeControlsView)
        {
          -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v28, v47);
LABEL_61:
          height = height + v46 + 7.0;
        }
      }
LABEL_62:
      v50 = width;
      v51 = height;
      result.height = v51;
      result.width = v50;
      return result;
    default:
      goto LABEL_62;
  }
}

- (UIView)contentView
{
  return -[MRUNowPlayingContainerView contentView](self->_containerView, "contentView");
}

- (void)setContentView:(id)a3
{
  -[MRUNowPlayingContainerView setContentView:](self->_containerView, "setContentView:", a3);
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUNowPlayingView updateLayout](self, "updateLayout");
    -[MRUNowPlayingView updateArtworkStyle](self, "updateArtworkStyle");
    -[MRUNowPlayingView updateTextAlignment](self, "updateTextAlignment");
    -[MRUNowPlayingView updateOnScreen](self, "updateOnScreen");
    -[MRUNowPlayingView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContext:(int64_t)a3
{
  if (self->_context != a3)
  {
    self->_context = a3;
    -[MRUNowPlayingView updateArtworkStyle](self, "updateArtworkStyle");
    -[MRUNowPlayingView setNeedsLayout](self, "setNeedsLayout");
  }
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
    -[MRUNowPlayingContainerView setStylingProvider:](self->_containerView, "setStylingProvider:", v5);
  }

}

- (void)setSuggestionsView:(id)a3
{
  UIView *v5;
  UIView *suggestionsView;
  void *v7;
  UIView *v8;
  _QWORD v9[4];
  UIView *v10;
  MRUNowPlayingView *v11;

  v5 = (UIView *)a3;
  suggestionsView = self->_suggestionsView;
  v8 = v5;
  if (suggestionsView != v5)
  {
    -[UIView removeFromSuperview](suggestionsView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_suggestionsView, a3);
    -[MRUNowPlayingView addSubview:](self, "addSubview:", v8);
    v7 = (void *)MEMORY[0x1E0DC3F10];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__MRUNowPlayingView_setSuggestionsView___block_invoke;
    v9[3] = &unk_1E5818CB0;
    v10 = v8;
    v11 = self;
    objc_msgSend(v7, "performWithoutAnimation:", v9);
    -[MRUNowPlayingView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingView setNeedsLayout](self, "setNeedsLayout");

  }
}

uint64_t __40__MRUNowPlayingView_setSuggestionsView___block_invoke(uint64_t a1)
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
    -[MRUNowPlayingView updateOnScreen](self, "updateOnScreen");
  }
}

- (void)setDimmed:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_dimmed != a3)
  {
    v3 = a3;
    self->_dimmed = a3;
    -[MRUNowPlayingTimeControlsView setDimmed:](self->_timeControlsView, "setDimmed:");
    -[MRUNowPlayingTransportControlsView setDimmed:](self->_transportControlsView, "setDimmed:", v3);
    -[MRUNowPlayingVolumeControlsView setDimmed:](self->_volumeControlsView, "setDimmed:", v3);
    -[MRUNowPlayingView updateOnScreen](self, "updateOnScreen");
  }
}

- (void)setShowArtworkView:(BOOL)a3
{
  if (self->_showArtworkView != a3)
  {
    self->_showArtworkView = a3;
    -[MRUNowPlayingView updateTextAlignment](self, "updateTextAlignment");
    -[MRUNowPlayingView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowTimeControlsView:(BOOL)a3
{
  if (self->_showTimeControlsView != a3)
  {
    self->_showTimeControlsView = a3;
    -[MRUNowPlayingView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowTransportControlsView:(BOOL)a3
{
  if (self->_showTransportControlsView != a3)
  {
    self->_showTransportControlsView = a3;
    -[MRUNowPlayingView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowVolumeControlsView:(BOOL)a3
{
  if (self->_showVolumeControlsView != a3)
  {
    self->_showVolumeControlsView = a3;
    -[MRUNowPlayingView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowSuggestionsView:(BOOL)a3
{
  if (self->_showSuggestionsView != a3)
  {
    self->_showSuggestionsView = a3;
    -[MRUNowPlayingView updateTextAlignment](self, "updateTextAlignment");
    -[MRUNowPlayingView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSupportsHorizontalLayout:(BOOL)a3
{
  if (self->_supportsHorizontalLayout != a3)
  {
    self->_supportsHorizontalLayout = a3;
    -[MRUNowPlayingContainerView setSupportsHorizontalLayout:](self->_containerView, "setSupportsHorizontalLayout:");
    -[MRUNowPlayingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    -[MRUNowPlayingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setUseArtworkOverrideSize:(BOOL)a3
{
  self->_useArtworkOverrideSize = a3;
  -[MRUNowPlayingView setNeedsLayout](self, "setNeedsLayout");
  -[MRUNowPlayingView updateVisibility](self, "updateVisibility");
}

- (void)updateArtworkStyle
{
  uint64_t v3;

  -[MRUArtworkView setShowPlaceholder:](self->_artworkView, "setShowPlaceholder:", self->_context != 3);
  v3 = 0;
  switch(self->_layout)
  {
    case 0:
    case 1:
      goto LABEL_7;
    case 2:
      v3 = 2;
      goto LABEL_7;
    case 3:
      if (self->_context == 3)
        v3 = 6;
      else
        v3 = 0;
      goto LABEL_7;
    case 4:
      v3 = 1;
LABEL_7:
      -[MRUArtworkView setStyle:](self->_artworkView, "setStyle:", v3);
      break;
    default:
      return;
  }
}

- (void)updateLayout
{
  uint64_t v3;
  void *v4;

  -[MRUNowPlayingHeaderView setLayout:](self->_headerView, "setLayout:", MRUNowPlayingHeaderLayoutFromNowPlayingLayout(self->_layout));
  v3 = MRUNowPlayingLabelViewLayoutFromNowPlayingLayout(self->_layout);
  -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayout:", v3);

  -[MRUNowPlayingTimeControlsView setLayout:](self->_timeControlsView, "setLayout:", MRUNowPlayingTimeControlsLayoutFromNowPlayingLayout(self->_layout));
  -[MRUNowPlayingTransportControlsView setLayout:](self->_transportControlsView, "setLayout:", MRUNowPlayingTransportControlsLayoutFromNowPlayingLayout(self->_layout));
  -[MRUNowPlayingVolumeControlsView setLayout:](self->_volumeControlsView, "setLayout:", MRUNowPlayingTimeControlsLayoutFromNowPlayingLayout(self->_layout));
}

- (void)updateTextAlignment
{
  int64_t layout;
  uint64_t v4;

  layout = self->_layout;
  if (!layout)
    goto LABEL_5;
  if (layout != 4
    || !+[MRUFeatureFlagProvider isAutobahnEnabled](MRUFeatureFlagProvider, "isAutobahnEnabled"))
  {
    v4 = 4;
    goto LABEL_7;
  }
  if (!self->_showSuggestionsView)
  {
    if (self->_showArtworkView)
      v4 = 4;
    else
      v4 = 1;
  }
  else
  {
LABEL_5:
    v4 = 1;
  }
LABEL_7:
  -[MRUNowPlayingHeaderView setTextAlignment:](self->_headerView, "setTextAlignment:", v4);
}

- (void)updateOnScreen
{
  unint64_t layout;
  _BOOL8 v4;
  void *v5;
  _BOOL8 onScreen;
  void *v7;

  layout = self->_layout;
  if (layout <= 4)
  {
    if (((1 << layout) & 0x16) != 0)
    {
      v4 = self->_onScreen && !self->_dimmed;
      -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMarqueeEnabled:", v4);

      onScreen = self->_onScreen;
    }
    else
    {
      -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMarqueeEnabled:", 0);

      onScreen = 0;
    }
    -[MRUNowPlayingTimeControlsView setOnScreen:](self->_timeControlsView, "setOnScreen:", onScreen);
  }
}

- (void)updateVisibility
{
  double v3;
  MRUNowPlayingTransportControlsView *transportControlsView;
  double v5;
  double v6;
  double v7;
  MRUNowPlayingVolumeControlsView *volumeControlsView;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  MRUNowPlayingVolumeControlsView *v14;
  double v15;
  double v16;
  double v17;
  double v18;

  switch(self->_layout)
  {
    case 0:
      v3 = 0.0;
      -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", 0.0);
      -[MRUNowPlayingHeaderView setAlpha:](self->_headerView, "setAlpha:", 1.0);
      -[MRUNowPlayingTimeControlsView setAlpha:](self->_timeControlsView, "setAlpha:", 0.0);
      transportControlsView = self->_transportControlsView;
      v5 = 1.0;
      goto LABEL_23;
    case 1:
      -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", 1.0);
      -[MRUNowPlayingHeaderView setAlpha:](self->_headerView, "setAlpha:", 1.0);
      v3 = 0.0;
      if (self->_showTimeControlsView)
        v6 = 1.0;
      else
        v6 = 0.0;
      -[MRUNowPlayingTimeControlsView setAlpha:](self->_timeControlsView, "setAlpha:", v6);
      if (self->_showTransportControlsView)
        v7 = 1.0;
      else
        v7 = 0.0;
      -[MRUNowPlayingTransportControlsView setAlpha:](self->_transportControlsView, "setAlpha:", v7);
      volumeControlsView = self->_volumeControlsView;
      v9 = 1.0;
      goto LABEL_24;
    case 2:
      v10 = 0.0;
      v11 = 0.0;
      if (!self->_showSuggestionsView)
      {
        v11 = 1.0;
        if (!self->_showArtworkView)
          v11 = 0.0;
      }
      -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", v11);
      v12 = 1.0;
      -[MRUNowPlayingHeaderView setAlpha:](self->_headerView, "setAlpha:", 1.0);
      if (self->_showTimeControlsView)
      {
        v10 = 1.0;
        if (self->_showSuggestionsView)
        {
          if (MRULayoutShouldBeVertical())
            v10 = 0.0;
          else
            v10 = 1.0;
        }
      }
      -[MRUNowPlayingTimeControlsView setAlpha:](self->_timeControlsView, "setAlpha:", v10);
      v3 = 0.0;
      if (self->_showTransportControlsView)
        v13 = 1.0;
      else
        v13 = 0.0;
      -[MRUNowPlayingTransportControlsView setAlpha:](self->_transportControlsView, "setAlpha:", v13);
      v14 = self->_volumeControlsView;
      v15 = 1.0;
      goto LABEL_40;
    case 3:
      -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", 1.0);
      -[MRUNowPlayingHeaderView setAlpha:](self->_headerView, "setAlpha:", 1.0);
      v3 = 0.0;
      -[MRUNowPlayingTimeControlsView setAlpha:](self->_timeControlsView, "setAlpha:", 0.0);
      transportControlsView = self->_transportControlsView;
      v5 = 0.0;
LABEL_23:
      -[MRUNowPlayingTransportControlsView setAlpha:](transportControlsView, "setAlpha:", v5);
      volumeControlsView = self->_volumeControlsView;
      v9 = 0.0;
LABEL_24:
      -[MRUNowPlayingVolumeControlsView setAlpha:](volumeControlsView, "setAlpha:", v9);
      goto LABEL_42;
    case 4:
      v16 = 0.0;
      v17 = 0.0;
      if (!self->_showSuggestionsView)
      {
        v17 = 1.0;
        if (!self->_showArtworkView)
          v17 = 0.0;
      }
      -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", v17);
      v12 = 1.0;
      -[MRUNowPlayingHeaderView setAlpha:](self->_headerView, "setAlpha:", 1.0);
      if (self->_showTimeControlsView)
      {
        v16 = 1.0;
        if (self->_showSuggestionsView)
        {
          if (+[MRUFeatureFlagProvider isAutobahnEnabled](MRUFeatureFlagProvider, "isAutobahnEnabled"))
            v16 = 1.0;
          else
            v16 = 0.0;
        }
      }
      -[MRUNowPlayingTimeControlsView setAlpha:](self->_timeControlsView, "setAlpha:", v16);
      v3 = 0.0;
      if (self->_showTransportControlsView)
        v18 = 1.0;
      else
        v18 = 0.0;
      -[MRUNowPlayingTransportControlsView setAlpha:](self->_transportControlsView, "setAlpha:", v18);
      if (self->_showVolumeControlsView)
        v15 = 1.0;
      else
        v15 = 0.0;
      v14 = self->_volumeControlsView;
LABEL_40:
      -[MRUNowPlayingVolumeControlsView setAlpha:](v14, "setAlpha:", v15);
      if (self->_showSuggestionsView)
        v3 = v12;
LABEL_42:
      -[UIView setAlpha:](self->_suggestionsView, "setAlpha:", v3);
      break;
    default:
      return;
  }
}

- (CGRect)suggestionsFrame
{
  double v2;
  double v3;
  CGFloat MinX;
  double MinY;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t layout;
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
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  -[MRUNowPlayingView bounds](self, "bounds");
  v8 = v7;
  v9 = MinY;
  v11 = v10;
  v13 = v12;
  if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
  {
    switch(self->_layout)
    {
      case 0:
        -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", v11, v13);
        v33.origin.x = v8;
        v33.origin.y = v9;
        v33.size.width = v11;
        v33.size.height = v13;
        CGRectGetMinX(v33);
        v34.origin.x = v8;
        v34.origin.y = v9;
        v34.size.width = v11;
        v34.size.height = v13;
        CGRectGetMinY(v34);
        -[MRUNowPlayingView bounds](self, "bounds");
        goto LABEL_13;
      case 1:
      case 3:
        v27.origin.x = v8;
        v27.origin.y = v9;
        v27.size.width = v11;
        v27.size.height = v13;
        CGRectGetMinX(v27);
        v28.origin.x = v8;
        v28.origin.y = v9;
        v28.size.width = v11;
        v28.size.height = v13;
        CGRectGetWidth(v28);
        v29.origin.x = v8;
        v29.origin.y = v9;
        v29.size.width = v11;
        v29.size.height = v13;
        CGRectGetMinY(v29);
        v30.origin.x = v8;
        v30.origin.y = v9;
        v30.size.width = v11;
        v30.size.height = v13;
        CGRectGetWidth(v30);
        goto LABEL_12;
      case 2:
        v35.origin.x = v8;
        v35.origin.y = v9;
        v35.size.width = v11;
        v35.size.height = v13;
        CGRectGetMinX(v35);
        v36.origin.x = v8;
        v36.origin.y = v9;
        v36.size.width = v11;
        v36.size.height = v13;
        CGRectGetMinY(v36);
        v37.origin.x = v8;
        v37.origin.y = v9;
        v37.size.width = v11;
        v37.size.height = v13;
        CGRectGetWidth(v37);
LABEL_12:
        v38.origin.x = v8;
        v38.origin.y = v9;
        v38.size.width = v11;
        v38.size.height = v13;
        CGRectGetHeight(v38);
        -[MRUNowPlayingView bounds](self, "bounds");
LABEL_13:
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        MinX = v19;
        v2 = v20;
        v3 = v21;
        break;
      case 4:
        goto LABEL_8;
      default:
        break;
    }
  }
  else
  {
    layout = self->_layout;
    if (layout <= 4)
    {
      if (((1 << layout) & 0xB) != 0)
      {
        -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", v11, v13);
        v2 = v15;
        v3 = v16;
        v25.origin.x = v8;
        v25.origin.y = v9;
        v25.size.width = v11;
        v25.size.height = v13;
        MinX = CGRectGetMinX(v25);
        v26.origin.x = v8;
        v26.origin.y = v9;
        v26.size.width = v11;
        v26.size.height = v13;
        MinY = CGRectGetMinY(v26) - v3;
      }
      else
      {
LABEL_8:
        -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", v11, v13);
        v2 = v17;
        v3 = v18;
        v31.origin.x = v8;
        v31.origin.y = v9;
        v31.size.width = v11;
        v31.size.height = v13;
        MinX = CGRectGetMinX(v31);
        v32.origin.x = v8;
        v32.origin.y = v9;
        v32.size.width = v11;
        v32.size.height = v13;
        MinY = CGRectGetMinY(v32);
      }
    }
  }
  v22 = MinX;
  v23 = v2;
  v24 = v3;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = MinY;
  result.origin.x = v22;
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

- (UIView)suggestionsView
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

- (int64_t)context
{
  return self->_context;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (BOOL)showArtworkView
{
  return self->_showArtworkView;
}

- (BOOL)showTimeControlsView
{
  return self->_showTimeControlsView;
}

- (BOOL)showTransportControlsView
{
  return self->_showTransportControlsView;
}

- (BOOL)showVolumeControlsView
{
  return self->_showVolumeControlsView;
}

- (BOOL)showSuggestionsView
{
  return self->_showSuggestionsView;
}

- (BOOL)supportsHorizontalLayout
{
  return self->_supportsHorizontalLayout;
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

- (BOOL)useArtworkOverrideSize
{
  return self->_useArtworkOverrideSize;
}

- (CGSize)artworkOverrideSize
{
  double width;
  double height;
  CGSize result;

  width = self->_artworkOverrideSize.width;
  height = self->_artworkOverrideSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setArtworkOverrideSize:(CGSize)a3
{
  self->_artworkOverrideSize = a3;
}

- (MRUNowPlayingContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->_volumeControlsView, 0);
  objc_storeStrong((id *)&self->_transportControlsView, 0);
  objc_storeStrong((id *)&self->_timeControlsView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end
