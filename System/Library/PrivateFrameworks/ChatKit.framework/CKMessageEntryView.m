@implementation CKMessageEntryView

+ (UIEdgeInsets)contentViewInsetsForMarginInsets:(UIEdgeInsets)a3 shouldShowPluginButtons:(BOOL)a4 shouldShowCharacterCount:(BOOL)a5 shouldCoverSendButton:(BOOL)a6 isStewieMode:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  _BOOL8 v10;
  double right;
  double bottom;
  double left;
  double top;
  double v16;
  void *v17;
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
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  UIEdgeInsets result;

  v7 = a7;
  v9 = a5;
  v10 = a4;
  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v16 = 0.0;
  if (!CKIsRunningInMacCatalyst() && !a6)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "entryViewSendButtonCoverSpace");
    v19 = v18;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendButtonSize");
    v16 = v19 + v21;

  }
  objc_msgSend(a1, "coverViewInsetsForMarginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCenterCharacterCount:isStewieMode:", v10, v9, 0, v7, top, left, bottom, right);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "entryFieldCoverLineWidth");
  v32 = v29 + v16 + v31 * 2.0;

  v33 = v23 + 0.0;
  v34 = v25 + 8.0;
  v35 = v27 + 0.0;
  v36 = v32;
  result.right = v36;
  result.bottom = v35;
  result.left = v34;
  result.top = v33;
  return result;
}

+ (UIEdgeInsets)coverViewInsetsForMarginInsets:(UIEdgeInsets)a3 shouldShowPluginButtons:(BOOL)a4 shouldShowCharacterCount:(BOOL)a5 shouldCenterCharacterCount:(BOOL *)a6 isStewieMode:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v9;
  _BOOL4 v10;
  double right;
  double left;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  int v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[2];
  UIEdgeInsets result;

  v7 = a7;
  v9 = a5;
  v10 = a4;
  right = a3.right;
  left = a3.left;
  v51[1] = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3.top, a3.left, a3.bottom);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entryViewVerticalCoverInsets");
  v15 = v14;
  v17 = v16;

  v18 = 0.0;
  if (v9)
  {
    if (v7)
    {
      sMaximumCharacterCountString(1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = *MEMORY[0x1E0DC1138];
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "characterCountSatelliteFont");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v21;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = (void **)v51;
      v24 = &v50;
    }
    else
    {
      sMaximumCharacterCountString(0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = *MEMORY[0x1E0DC1138];
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "characterCountFont");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v21;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = &v49;
      v24 = &v48;
    }
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sizeWithAttributes:", v25);
    v27 = ceil(v26);

    v18 = v27 + 7.0;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "entryViewHorizontalCoverInsets");
  v30 = v29;

  if (v30 >= right)
    right = v30;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEntryViewCollapsable");

  if (v10)
  {
    if (v32)
    {
      +[CKEntryViewButton entryViewButtonImageForType:](CKEntryViewButton, "entryViewButtonImageForType:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "size");
      v35 = v34;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "arrowButtonRightPadding");
      v38 = v35 + v37;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "entryViewHorizontalCoverInsets");
      v41 = v38 + v40 * 2.0;

    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "entryViewNonCollapsableLeftPadding");
      v41 = v43;
    }
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "entryViewHorizontalCoverInsets");
    v41 = v42;
  }

  if (a6)
    *a6 = right >= v18;
  if (v41 >= left)
    v44 = v41;
  else
    v44 = left;
  v45 = v15;
  v46 = v17;
  v47 = right;
  result.right = v47;
  result.bottom = v46;
  result.left = v44;
  result.top = v45;
  return result;
}

+ (void)setCurrentEntryView:(id)a3
{
  objc_storeWeak(__currentEntryView, a3);
}

+ (CKMessageEntryView)currentEntryView
{
  return (CKMessageEntryView *)objc_loadWeakRetained(__currentEntryView);
}

- (void)dealloc
{
  void *v3;
  CKMessageEntryView *v4;
  CKBrowserSwitcherFooterView *appStrip;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  if (-[UIActivityIndicatorView isAnimating](self->_sendButtonSpinner, "isAnimating"))
    -[UIActivityIndicatorView stopAnimating](self->_sendButtonSpinner, "stopAnimating");
  -[CKAudioMessageRecordingView setDelegate:](self->_audioRecordingView, "setDelegate:", 0);
  -[CKAudioMessageRecordingView invalidateDisplayLink](self->_audioRecordingView, "invalidateDisplayLink");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CKBrowserSwitcherFooterView delegate](self->_appStrip, "delegate");
  v4 = (CKMessageEntryView *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    -[CKBrowserSwitcherFooterView setDelegate:](self->_appStrip, "setDelegate:", 0);
  if (-[CKBrowserSwitcherFooterView isMagnified](self->_appStrip, "isMagnified"))
  {
    appStrip = self->_appStrip;
    self->_appStrip = 0;

  }
  -[CKScheduledUpdater invalidate](self->_entryFieldCollapsedUpdater, "invalidate");
  -[CKMessageEntryRecordedAudioView setDelegate:](self->_recordedAudioView, "setDelegate:", 0);
  -[CKMessageEntryContentView setDelegate:](self->_contentView, "setDelegate:", 0);
  -[CKAudioRecorder setDelegate:](self->_recorder, "setDelegate:", 0);
  -[CKAudioRecorder resetState](self->_recorder, "resetState");
  -[CKMessageEntryView sendButtonClickInteraction](self, "sendButtonClickInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKMessageEntryView sendButton](self, "sendButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView sendButtonClickInteraction](self, "sendButtonClickInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeInteraction:", v8);

    -[CKMessageEntryView setSendButtonClickInteraction:](self, "setSendButtonClickInteraction:", 0);
  }
  v9.receiver = self;
  v9.super_class = (Class)CKMessageEntryView;
  -[CKMessageEntryView dealloc](&v9, sel_dealloc);
}

- (UIView)sendMenuSourceView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CKMessageEntryView plusButton](self, "plusButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CKMessageEntryView browserButton](self, "browserButton");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIView *)v6;
}

- (UIEdgeInsets)safeAreaInsets
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  UIEdgeInsets result;

  v22.receiver = self;
  v22.super_class = (Class)CKMessageEntryView;
  -[CKMessageEntryView safeAreaInsets](&v22, sel_safeAreaInsets);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v3;
  if (v6 > 0.0 || v3 > 0.0)
  {
    -[CKMessageEntryView window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (unint64_t)(objc_msgSend(v12, "interfaceOrientation") - 3) <= 1)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "landscapeKeyboardInsets");
      v15 = v14;
      v17 = v16;

      if (v7 > 0.0)
        v7 = v15;
      if (v10 > 0.0)
        v10 = v17;
    }

  }
  v18 = v5;
  v19 = v7;
  v20 = v9;
  v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  double v3;
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryView;
  -[CKMessageEntryView safeAreaInsetsDidChange](&v5, sel_safeAreaInsetsDidChange);
  -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
  if (vabdd_f64(v3, self->_previousBottomSafeAreaInset) > 0.001)
  {
    self->_previousBottomSafeAreaInset = v3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "messageEntryViewSafeAreaInsetsDidChange:", self);

  }
}

- (void)didMoveToWindow
{
  void *v3;
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryView;
  -[CKMessageEntryView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[CKMessageEntryView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "messageEntryView:didMoveToWindow:", self, v3);

}

- (double)_coverFrameWidthForMaxCoverFrameWidth:(double)a3 popoverLayoutMetrics:(id)a4
{
  void *v5;
  double v6;

  if (!a4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendMenuEntryViewContentWidthMultiplier");
    a3 = v6 * a3;

  }
  return a3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
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
  void *v25;
  int v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  double Width;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  BOOL v43;
  double v44;
  char v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  _BOOL4 v56;
  _BOOL4 v57;
  double v58;
  double v59;
  _BOOL4 v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  double MidX;
  void *v86;
  double v87;
  double v88;
  _BOOL4 v89;
  _BOOL4 v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  double MaxX;
  void *v104;
  double v105;
  double v106;
  void *v107;
  int v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  int v114;
  void *v115;
  double v116;
  double v117;
  void *v118;
  double v119;
  double v120;
  void *v121;
  double v122;
  double v123;
  void *v124;
  double v125;
  double v126;
  void *v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  void *v133;
  double v134;
  double v135;
  void *v136;
  double v137;
  _BOOL4 v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  void *v151;
  id v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  double v159;
  double v160;
  void *v161;
  BOOL v162;
  double v163;
  void *v164;
  char v165;
  void *v166;
  double v167;
  double v168;
  double v169;
  void *v170;
  double v171;
  void *v172;
  void *v173;
  uint64_t v174;
  void *v175;
  void *v176;
  double v177;
  double v178;
  double v179;
  void *v180;
  void *v181;
  _BOOL4 v182;
  double v183;
  double v184;
  void *v185;
  int v186;
  double v187;
  void *v188;
  void *v189;
  void *v190;
  double MinY;
  double Height;
  void *v193;
  double v194;
  double v195;
  _BOOL8 v196;
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
  __CFString *v208;
  void *v209;
  id v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  int v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  int v220;
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
  __CFString *v231;
  void *v232;
  id v233;
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
  __CFString *v247;
  void *v248;
  id v249;
  void *v250;
  void *v251;
  int v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  __CFString *v261;
  void *v262;
  id v263;
  void *v264;
  void *v265;
  void *v266;
  double v267;
  void *v268;
  double v269;
  double v270;
  double MidY;
  void *v272;
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
  void *v283;
  void *v284;
  double v285;
  void *v286;
  double v287;
  double v288;
  void *v289;
  void *v290;
  double v291;
  double v292;
  double v293;
  double v294;
  double v295;
  void *v296;
  int v297;
  double v298;
  void *v299;
  double v300;
  double v301;
  void *v302;
  double v303;
  double v304;
  void *v305;
  double v306;
  double v307;
  void *v308;
  double v309;
  void *v310;
  double v311;
  double v312;
  void *v313;
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
  void *v324;
  double v325;
  double v326;
  double v327;
  double v328;
  void *v329;
  void *v330;
  double v331;
  double v332;
  double v333;
  double v334;
  double v335;
  void *v336;
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
  void *v349;
  double v350;
  double v351;
  double v352;
  double v353;
  double v354;
  double v355;
  double v356;
  double v357;
  void *v358;
  double v359;
  double v360;
  double v361;
  double v362;
  void *v363;
  double v364;
  double v365;
  double v366;
  void *v367;
  _BOOL4 v368;
  double v369;
  void *v370;
  double v371;
  double v372;
  void *v373;
  void *v374;
  void *v375;
  double v376;
  double v377;
  void *v378;
  double v379;
  double v380;
  double v381;
  double v382;
  void *v383;
  double v384;
  double v385;
  double v386;
  double v387;
  double v388;
  double v389;
  void *v390;
  double v391;
  double v392;
  double v393;
  double v394;
  double v395;
  double v396;
  double v397;
  double v398;
  double v399;
  double v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  double v405;
  void *v406;
  void *v407;
  void *v408;
  double v409;
  double v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  uint64_t v416;
  void *v417;
  unsigned int v418;
  uint64_t v419;
  uint64_t v420;
  void *v421;
  int v422;
  uint64_t v423;
  CGFloat x;
  CGFloat y;
  CGFloat v426;
  CGFloat v427;
  double v428;
  double v429;
  void *v430;
  int v431;
  void *v432;
  BOOL v433;
  void *v434;
  double v435;
  double v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  double v441;
  CGFloat v442;
  double v443;
  CGFloat v444;
  double v445;
  CGFloat v446;
  double v447;
  CGFloat v448;
  void *v449;
  double v450;
  CGFloat v451;
  void *v452;
  double v453;
  CGFloat v454;
  double v455;
  double v456;
  double v457;
  double v458;
  void *v459;
  void *v460;
  double v461;
  id v462;
  uint64_t v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  NSObject *v469;
  void *v470;
  void *v471;
  double v472;
  double v473;
  double v474;
  double v475;
  double v476;
  double v477;
  double v478;
  double v479;
  double v480;
  double v481;
  double v482;
  double v483;
  double v484;
  double v485;
  double v486;
  double v487;
  double v488;
  double v489;
  double v490;
  void *v491;
  CGFloat v492;
  double v493;
  double v494;
  double v495;
  void *v496;
  double v497;
  double v498;
  double v499;
  double v500;
  double v501;
  void *v502;
  void *v503;
  double v504;
  void *v505;
  void *v506;
  void *v507;
  void *v508;
  double v509;
  double v510;
  void *v511;
  double v512;
  void *v513;
  double v514;
  double v515;
  void *v516;
  double v517;
  double v518;
  double v519;
  void *v520;
  void *v521;
  double v522;
  void *v523;
  double v524;
  id v525;
  void *v526;
  double rect;
  double v528;
  double v529;
  CGFloat v530;
  double v531;
  double v532;
  void *v533;
  double v534;
  uint64_t v535;
  uint64_t v536;
  _QWORD v537[4];
  id v538;
  objc_super v539;
  uint8_t buf[4];
  void *v541;
  __int16 v542;
  void *v543;
  __int16 v544;
  void *v545;
  uint64_t v546;
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

  v546 = *MEMORY[0x1E0C80C00];
  +[CKPPTSubTest start:](CKPPTSubTest, "start:", CFSTR("CKMessageEntryView Layoutsubviews"));
  v539.receiver = self;
  v539.super_class = (Class)CKMessageEntryView;
  -[CKMessageEntryView layoutSubviews](&v539, sel_layoutSubviews);
  -[CKMessageEntryView bounds](self, "bounds");
  v522 = v4;
  v524 = v3;
  v6 = v5;
  v8 = v7;
  -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", v524, v522, v6, v8);

  -[CKMessageEntryView messageEditingBlurOverlayView](self, "messageEditingBlurOverlayView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v524, v522, v6, v8);

  if (-[CKMessageEntryView shouldEntryViewBeExpandedLayout](self, "shouldEntryViewBeExpandedLayout"))
    v11 = 1;
  else
    v11 = !-[CKMessageEntryView shouldShowPluginButtons](self, "shouldShowPluginButtons");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entryViewHorizontalCoverInsets");
  v14 = v13;
  -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
  v16 = v15;

  -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
  -[CKMessageEntryView coverFrameThatFitsInSize:](self, "coverFrameThatFitsInSize:", v6, v8 - v17);
  v519 = v18;
  rect = v19;
  v21 = v20;
  v23 = v22;
  -[CKMessageEntryView adjustedCoverInsets](self, "adjustedCoverInsets");
  v481 = v24;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "entryViewSupportsPlusButton");

  v498 = 0.0;
  if (v26)
  {
    -[CKMessageEntryView inputButtonSize](self, "inputButtonSize");
    v498 = v27;
  }
  v501 = v14 + v16;
  if (self->_shouldCoverViewBeShrunkenForSendMenu)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "messageEntryViewActiveSendMenuPresentation:", self);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29 && objc_msgSend(v29, "presentationStyle") == 1)
      v30 = (void *)objc_msgSend(v29, "newPopoverLayoutMetrics");
    else
      v30 = 0;
    v547.origin.x = v21;
    v547.origin.y = v519;
    v547.size.width = v23;
    v547.size.height = rect;
    -[CKMessageEntryView _coverFrameWidthForMaxCoverFrameWidth:popoverLayoutMetrics:](self, "_coverFrameWidthForMaxCoverFrameWidth:popoverLayoutMetrics:", v30, CGRectGetWidth(v547));
    v534 = v31;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sendMenuEntryViewHorizontalPositionAdjustment");
    v497 = v33;

  }
  else
  {
    v497 = 0.0;
    v534 = v23;
    if ((v11 & 1) != 0)
      goto LABEL_15;
    v548.origin.y = v522;
    v548.origin.x = v524;
    v548.size.width = v6;
    v548.size.height = v8;
    Width = CGRectGetWidth(v548);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "browserButtonSize");
    v534 = Width - v501 - v498 + -16.5 - v35 + -14.5 - v481;
    v497 = 0.0;
  }

LABEL_15:
  -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
  v508 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
  v37 = v36;
  -[CKMessageEntryView hintView](self, "hintView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v512 = v8 - v37;
  objc_msgSend(v38, "setFrame:", v524, v522, v6);

  objc_msgSend(v508, "setFrame:", v524, v522, v6, v8 - v37);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "entryViewlayoutMetrics");
  v491 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEntryView calculateOneLinePlaceHolderCenterY:](self, "calculateOneLinePlaceHolderCenterY:", v8 - v37);
  v510 = v40;
  -[CKMessageEntryView plusButton](self, "plusButton");
  v521 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v521, "superview");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = -[CKMessageEntryView shouldShowPluginButtons](self, "shouldShowPluginButtons");
  v482 = *MEMORY[0x1E0C9D538];
  v44 = *MEMORY[0x1E0C9D820];
  v479 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v480 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v45 = !v43;
  if (!v521)
    v45 = 1;
  if ((v45 & 1) == 0 && v41 == v42)
  {
    -[CKMessageEntryView inputButtonSize](self, "inputButtonSize");
    v480 = v46;
    v44 = v47;
    -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
    v49 = v48;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "entryViewHorizontalCoverInsets");
    v52 = v51;

    -[CKMessageEntryView traitCollection](self, "traitCollection");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "displayScale");
    v55 = v54;

    v482 = round((v44 * 0.5 + v49 + v52) * v55) / v55;
    v479 = v510;
  }
  v472 = v44;
  -[CKMessageEntryView photoButton](self, "photoButton");
  v526 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[CKMessageEntryView shouldShowPluginButtons](self, "shouldShowPluginButtons");
  if (v526)
    v57 = v56;
  else
    v57 = 0;
  v531 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v532 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v490 = v531;
  v486 = v532;
  v529 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v530 = *MEMORY[0x1E0C9D648];
  v499 = v529;
  v488 = *MEMORY[0x1E0C9D648];
  if (v57)
  {
    -[CKMessageEntryView inputButtonSize](self, "inputButtonSize");
    v486 = v58;
    v490 = v59;
    v499 = v510 + v498 * -0.5;
    v488 = v501;
  }
  -[CKMessageEntryView browserButton](self, "browserButton");
  v520 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView cancelButton](self, "cancelButton");
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = -[CKMessageEntryView shouldShowPluginButtons](self, "shouldShowPluginButtons");
  v61 = v531;
  v62 = v532;
  v63 = v529;
  v64 = v530;
  v65 = v529;
  v487 = v530;
  v517 = v21 + v23 - v534;
  v495 = v531;
  v489 = v532;
  if (v60)
  {
    if (v521)
      goto LABEL_29;
    if (v520)
      goto LABEL_29;
    v61 = v531;
    v62 = v532;
    v65 = v529;
    v487 = v530;
    v495 = v531;
    v489 = v532;
    v63 = v529;
    v64 = v530;
    if (v503)
    {
LABEL_29:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "browserButtonSize");
      v489 = v67;
      v495 = v68;

      if (v526)
      {
        if ((v11 & 1) != 0)
        {
          v69 = (v490 - v495) * 0.5;
          if (CKMainScreenScale_once_62 != -1)
            dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1470_0);
          v70 = v488;
        }
        else
        {
          v549.origin.x = v488;
          v549.origin.y = v499;
          v549.size.width = v486;
          v549.size.height = v490;
          v78 = CGRectGetMaxX(v549) + 16.5;
          if (CKMainScreenScale_once_62 != -1)
            dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1470_0);
          v79 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
          if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0)
            v79 = 1.0;
          v70 = floor(v78 * v79) / v79;
          v69 = (v490 - v495) * 0.5;
        }
        v80 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0)
          v80 = 1.0;
        v71 = v499 + floor(v69 * v80) / v80;
      }
      else
      {
        v71 = v510 + v495 * -0.5;
        if (CKIsRunningInMacCatalyst())
        {
          -[CKMessageEntryView traitCollection](self, "traitCollection");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "displayScale");
          v74 = v73;
          if (v73 == 0.0)
          {
            if (CKMainScreenScale_once_62 != -1)
              dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1470_0);
            if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0)
              v74 = 1.0;
            else
              v74 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
          }

          -[CKMessageEntryView traitCollection](self, "traitCollection");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "displayScale");
          v77 = v76;
          if (v76 == 0.0)
          {
            if (CKMainScreenScale_once_62 != -1)
              dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1470_0);
            if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0)
              v77 = 1.0;
            else
              v77 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
          }

          v70 = floor((v501 + -2.5) * v74) / v74;
          v71 = floor((v71 + -1.0) * v77) / v77;
        }
        else
        {
          v70 = v501;
        }
      }
      if (CKIsRunningInMacCatalyst())
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "cancelButtonSize");
        v62 = v82;
        v61 = v83;

        -[CKMessageEntryView plusButton](self, "plusButton");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        MidX = v482;
        if (!v84)
        {
          v550.origin.x = v70;
          v550.origin.y = v71;
          v550.size.width = v489;
          v550.size.height = v495;
          MidX = CGRectGetMidX(v550);
        }

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "cancelButtonSize");
        v88 = v87;

        v487 = MidX + v62 * -0.5;
        v65 = v510 + v88 * -0.5;
      }
      else
      {
        v61 = rect;
        v62 = v534;
        v65 = v519;
        v487 = v517;
      }
      v63 = v71;
      v64 = v70;
    }
  }
  v474 = v65;
  v475 = v62;
  v476 = v61;
  v477 = v64;
  v478 = v63;
  -[CKMessageEntryView arrowButton](self, "arrowButton");
  v516 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = -[CKMessageEntryView shouldShowPluginButtons](self, "shouldShowPluginButtons");
  if (v516)
    v90 = v89;
  else
    v90 = 0;
  v484 = v532;
  v485 = v531;
  v483 = v529;
  v493 = v530;
  if (v90)
  {
    v493 = v501;
    if ((v11 & 1) == 0)
    {
      v551.origin.x = v517;
      v551.origin.y = v519;
      v551.size.width = v534;
      v551.size.height = rect;
      v493 = CGRectGetMinX(v551) + 14.5;
    }
    -[CKMessageEntryView inputButtonSize](self, "inputButtonSize");
    v484 = v91;
    v485 = v92;
    v483 = v499;
  }
  -[CKMessageEntryView sendButton](self, "sendButton");
  v496 = (void *)objc_claimAutoreleasedReturnValue();
  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "entryViewSendButtonCoverSpace");
    v95 = v94;
    -[CKMessageEntryView contentView](self, "contentView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setSendButtonTextInsetWidth:", v95);

    v494 = v531;
    v514 = v532;
    v97 = v530;
LABEL_76:
    v515 = v97;

    goto LABEL_77;
  }
  v494 = v531;
  v514 = v532;
  v515 = v530;
  if (-[CKMessageEntryView shouldShowSendButton](self, "shouldShowSendButton"))
  {
    -[CKMessageEntryView sendButtonSize](self, "sendButtonSize");
    v514 = v98;
    v494 = v99;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "entryViewSendButtonCoverSpace");
    v102 = v101;

    v552.origin.x = v517;
    v552.origin.y = v519;
    v552.size.width = v534;
    v552.size.height = rect;
    MaxX = CGRectGetMaxX(v552);
    -[CKMessageEntryView traitCollection](self, "traitCollection");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "displayScale");
    v106 = v105;

    -[CKMessageEntryView conversation](self, "conversation");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v107, "isStewieConversation");

    if (v108)
      v109 = 10.0;
    else
      v109 = 0.0;
    -[CKMessageEntryView contentView](self, "contentView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setSendButtonTextInsetWidth:", v514 + v102 + v109);
    v97 = round((MaxX - (v514 + v102)) * v106) / v106;
    goto LABEL_76;
  }
LABEL_77:
  v110 = v530;
  v500 = v531;
  v504 = v532;
  v492 = v529;
  if (-[CKMessageEntryView shouldShowCharacterCount](self, "shouldShowCharacterCount"))
  {
    v110 = v530;
    v500 = v531;
    v504 = v532;
    v492 = v529;
    if (-[CKMessageEntryView shouldShowSendButton](self, "shouldShowSendButton"))
    {
      -[CKMessageEntryView characterCountSize](self, "characterCountSize");
      v504 = v111;
      v500 = v112;
      if (-[CKMessageEntryView shouldCenterCharacterCount](self, "shouldCenterCharacterCount"))
      {
        v553.origin.x = v517;
        v553.origin.y = v519;
        v553.size.width = v534;
        v553.size.height = rect;
        v110 = CGRectGetMaxX(v553) + 3.5;
      }
      else
      {
        v554.size.width = v514;
        v554.origin.x = v515;
        v554.origin.y = v529;
        v554.size.height = v494;
        v110 = CGRectGetMaxX(v554) - v504;
      }
      v492 = v519;
    }
  }
  -[CKMessageEntryView contentClipView](self, "contentClipView");
  v533 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "isAudioMessagesEntryViewRecordingEnabled");

  v518 = v519;
  v528 = rect;
  if (v114)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "audioHintViewPadding");
    v117 = v116;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "audioButtonSize");
    v120 = v119;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "bubbleLeftInsetForQuicktationInEntryView");
    v123 = v122;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "entryViewAudioButtonCoverSpace");
    v126 = v125;

    -[CKMessageEntryView audioHintLabel](self, "audioHintLabel");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v23 - v120 - v123 - v126 + v117 * -2.0;
    objc_msgSend(v127, "sizeThatFits:", v128, 1.79769313e308);
    v130 = v129;
    v132 = v131;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "bubbleLeftInsetForQuicktationInEntryView");
    v135 = v134;

    -[CKMessageEntryView audioHintLabel](self, "audioHintLabel");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v132 + v117 * 2.0;
    objc_msgSend(v136, "setFrame:", (v128 - v130) * 0.5 + v117 + v135, 0.0, v130, v137);

    v138 = -[CKMessageEntryView shouldShowAudioMessageHint](self, "shouldShowAudioMessageHint");
    v139 = v137 - rect;
    if (!v138)
      v139 = 0.0;
    v518 = v519 - v139;
    if (v138)
      v140 = v137;
    else
      v140 = rect;
    v528 = v140;
  }
  objc_msgSend(v533, "anchorPoint");
  v142 = v141;
  v144 = v143;
  objc_msgSend(v533, "setBounds:", 0.0, 0.0, v534, v528);
  v509 = v517 - v497;
  objc_msgSend(v533, "setCenter:", v517 - v497 + v534 * v142, v518 + v528 * v144);
  -[CKMessageEntryView knockoutView](self, "knockoutView");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "setFrame:", 0.0, 0.0, v534, v528);

  objc_msgSend(v533, "layer");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "theme");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "entryFieldBorderColor");
  v149 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v146, "setBorderColor:", objc_msgSend(v149, "CGColor"));

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "theme");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "dashedEntryFieldBorderColor");
  v152 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v153 = objc_msgSend(v152, "CGColor");
  -[CKMessageEntryView dashedContentClipViewLayer](self, "dashedContentClipViewLayer");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "setStrokeColor:", v153);

  -[CKMessageEntryView contentView](self, "contentView");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView collpasedPlaceholderLabel](self, "collpasedPlaceholderLabel");
  v511 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView contentView](self, "contentView");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "textView");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "textContainer");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "lineFragmentPadding");
  v473 = v159;

  objc_msgSend(v155, "frame");
  if (v160 == 0.0)
    goto LABEL_95;
  -[CKMessageEntryView composition](self, "composition");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v161, "hasContent") & 1) == 0)
  {

    goto LABEL_95;
  }
  v162 = -[CKMessageEntryView entryFieldCollapsed](self, "entryFieldCollapsed");

  if (!v162)
LABEL_95:
    objc_msgSend(v155, "setFrame:", 0.0, 0.0, v23, rect);
  v163 = v534;
  if (!self->_shouldCoverViewBeShrunkenForSendMenu)
    v163 = v23;
  objc_msgSend(v155, "setMaxPluginShelfViewWidth:", v163);
  objc_msgSend(v155, "setMaxPreviewContentWidthWhenExpanded:", v23);
  if ((v11 & 1) != 0)
  {
    if (CKIsRunningInMacCatalyst())
    {
      if (-[CKMessageEntryView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        -[CKMessageEntryView composition](self, "composition");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = objc_msgSend(v164, "hasContent");

        if ((v165 & 1) == 0)
        {
          -[CKMessageEntryView audioButton](self, "audioButton");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v166, "frame");
          v168 = v167;

          v23 = v23 - v168;
        }
      }
    }
    objc_msgSend(v155, "setMaxContentWidthWhenExpanded:", v23);
  }
  else
  {
    v555.origin.y = v522;
    v555.origin.x = v524;
    v555.size.width = v6;
    v555.size.height = v512;
    v169 = CGRectGetWidth(v555);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "browserButtonSize");
    objc_msgSend(v155, "setMaxContentWidthWhenExpanded:", v169 - v501 - v498 + -16.5 - v171 + -14.5 - v481);

  }
  objc_msgSend(v155, "textView");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "setNeedsLayout");

  -[CKMessageEntryView inputDelegate](self, "inputDelegate");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = objc_msgSend(v173, "messageEntryShouldHideCaret:", self);

  -[CKMessageEntryView updateTextViewsForShouldHideCaret:](self, "updateTextViewsForShouldHideCaret:", v174);
  v175 = (void *)MEMORY[0x1E0CEABB0];
  v537[0] = MEMORY[0x1E0C809B0];
  v537[1] = 3221225472;
  v537[2] = __36__CKMessageEntryView_layoutSubviews__block_invoke;
  v537[3] = &unk_1E274A208;
  v525 = v155;
  v538 = v525;
  objc_msgSend(v175, "performWithoutAnimation:", v537);
  if (-[CKMessageEntryView shouldShowSendButton](self, "shouldShowSendButton"))
  {
    -[CKMessageEntryView traitCollection](self, "traitCollection");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "displayScale");
    v178 = v177;

    v179 = round((v510 + v494 * -0.5) * v178) / v178;
    v515 = v515 - v497;
    -[CKMessageEntryView convertRect:toView:](self, "convertRect:toView:", v533);
    objc_msgSend(v496, "setFrame:");
  }
  else
  {
    v179 = v529;
  }
  if (-[CKMessageEntryView shouldShowPluginButtons](self, "shouldShowPluginButtons"))
  {
    objc_msgSend(v521, "superview");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = v180 == v181;

    if (v182)
    {
      objc_msgSend(v521, "setCenter:", v482, v479);
      objc_msgSend(v521, "setBounds:", 0.0, 0.0, v472, v480);
    }
    objc_msgSend(v526, "setFrame:", v488, v499, v486, v490);
    objc_msgSend(v520, "setFrame:", v477, v478, v489, v495);
    objc_msgSend(v516, "setFrame:", v493, v483, v484, v485);
    objc_msgSend(v503, "setFrame:", v487, v474, v475, v476);
    v183 = 0.0;
    if (v11)
      v184 = 1.0;
    else
      v184 = 0.0;
    objc_msgSend(v516, "setAlpha:", v184);
    if (!v11)
      v183 = 1.0;
    objc_msgSend(v526, "setAlpha:", v183);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = objc_msgSend(v185, "isEntryViewCollapsable");

    v187 = 1.0;
    if (v186)
      v187 = v183;
    objc_msgSend(v520, "setAlpha:", v187);
    objc_msgSend(v520, "button");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "setDisabledDimsImage:", 1);

    objc_msgSend(v526, "button");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "setDisabledDimsImage:", 1);

  }
  if (-[CKMessageEntryView shouldShowCharacterCount](self, "shouldShowCharacterCount"))
  {
    -[CKMessageEntryView characterCountLabel](self, "characterCountLabel");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v556.size.width = v514;
    v556.origin.x = v515;
    v556.origin.y = v179;
    v556.size.height = v494;
    MinY = CGRectGetMinY(v556);
    v557.origin.x = v110;
    v557.origin.y = v492;
    v557.size.width = v504;
    v557.size.height = v500;
    Height = CGRectGetHeight(v557);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "entryViewSendButtonCoverSpace");
    v195 = v194;

    objc_msgSend(v190, "setFrame:", v110, MinY - Height - v195, v504, v500);
    if (-[CKMessageEntryView isCharacterCountHidden](self, "isCharacterCountHidden")
      || (objc_msgSend(v525, "isSingleLine") & 1) != 0)
    {
      v196 = 1;
LABEL_156:
      objc_msgSend(v190, "setHidden:", v196);

      goto LABEL_157;
    }
    v536 = 0;
    -[CKMessageEntryView composition](self, "composition");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "text");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "string");
    v523 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMessageEntryView conversation](self, "conversation");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v198) = objc_msgSend(v199, "isStewieConversation");

    if ((_DWORD)v198)
    {
      v536 = objc_msgSend(v523, "lengthOfBytesUsingEncoding:", 4);
      v200 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "localizedStringForKey:value:table:", CFSTR("CHARACTER_COUNT_FMT"), &stru_1E276D870, CFSTR("ChatKit"));
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v536);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      CKLocalizedStringForNumber(v203);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      CKLocalizedStringForNumber(&unk_1E2870960);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "stringWithFormat:", v202, v204, v205);
      v206 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v202) = objc_msgSend(v207, "userInterfaceLayoutDirection") == 1;

      if ((_DWORD)v202)
        v208 = CFSTR("\u200F");
      else
        v208 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v208, "stringByAppendingString:", v206);
      v209 = (void *)objc_claimAutoreleasedReturnValue();

      v210 = v209;
      v196 = v536 < 80;
      if (v536 >= 80)
      {
        if ((unint64_t)v536 > 0x9F)
          objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
        else
          objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
        v265 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "setTextColor:", v265);

      }
      -[CKMessageEntryView characterCountLabel](self, "characterCountLabel");
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v266, "setText:", v210);

      goto LABEL_155;
    }
    v535 = 0;
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "ctSubscriptionInfo");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "preferredOrDefaultSubscriptionContext");
    v513 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMessageEntryView conversation](self, "conversation");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "sendingService");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v214, "__ck_isiMessageLite") & 1) != 0)
    {
      v215 = 1;
    }
    else
    {
      -[CKMessageEntryView conversation](self, "conversation");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "chat");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      v215 = objc_msgSend(v217, "shouldDisplayOffGridModeStatus");

    }
    -[CKMessageEntryView conversation](self, "conversation");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v218, "sendingService");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = objc_msgSend(v219, "__ck_isSatelliteSMS");

    if (v215)
    {
      objc_msgSend(MEMORY[0x1E0D35910], "iMessageLiteService");
      v505 = (void *)objc_claimAutoreleasedReturnValue();
      v536 = objc_msgSend(v523, "lengthOfBytesUsingEncoding:", 4);
      objc_msgSend(v505, "serviceProperties");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "valueForKey:", *MEMORY[0x1E0D38FB8]);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      v535 = (int)objc_msgSend(v222, "intValue");

      v223 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v502 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v502, "localizedStringForKey:value:table:", CFSTR("CHARACTER_COUNT_FMT"), &stru_1E276D870, CFSTR("ChatKit"));
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v536);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      CKLocalizedStringForNumber(v225);
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v535);
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      CKLocalizedStringForNumber(v227);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v223, "stringWithFormat:", v224, v226, v228);
      v229 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v224) = objc_msgSend(v230, "userInterfaceLayoutDirection") == 1;

      if ((_DWORD)v224)
        v231 = CFSTR("\u200F");
      else
        v231 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v231, "stringByAppendingString:", v229);
      v232 = (void *)objc_claimAutoreleasedReturnValue();

      v233 = v232;
      -[CKMessageEntryView characterCountLabel](self, "characterCountLabel");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v234, "setText:", v233);

    }
    else if (v220)
    {
      v536 = objc_msgSend(v523, "lengthOfBytesUsingEncoding:", 4);
      -[CKMessageEntryView conversation](self, "conversation");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "sendingService");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "serviceProperties");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "valueForKey:", *MEMORY[0x1E0D38FB8]);
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      v535 = (int)objc_msgSend(v238, "intValue");

      v239 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v506 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v506, "localizedStringForKey:value:table:", CFSTR("CHARACTER_COUNT_FMT"), &stru_1E276D870, CFSTR("ChatKit"));
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v536);
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      CKLocalizedStringForNumber(v241);
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v535);
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      CKLocalizedStringForNumber(v243);
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "stringWithFormat:", v240, v242, v244);
      v245 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v240) = objc_msgSend(v246, "userInterfaceLayoutDirection") == 1;

      if ((_DWORD)v240)
        v247 = CFSTR("\u200F");
      else
        v247 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v247, "stringByAppendingString:", v245);
      v248 = (void *)objc_claimAutoreleasedReturnValue();

      v249 = v248;
      -[CKMessageEntryView characterCountLabel](self, "characterCountLabel");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v250, "setText:", v249);

    }
    else
    {
      if (!v513
        || (objc_msgSend(CTMessageCenterClass(), "sharedMessageCenter"),
            v251 = (void *)objc_claimAutoreleasedReturnValue(),
            v252 = objc_msgSend(v251, "getCharacterCountForSub:count:andMessageSplitThreshold:forSmsText:", v513, &v536, &v535, v523), v251, !v252))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v469 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v469, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v535);
            v470 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v536);
            v471 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v541 = v470;
            v542 = 2112;
            v543 = v471;
            v544 = 2112;
            v545 = v513;
            _os_log_impl(&dword_18DFCD000, v469, OS_LOG_TYPE_INFO, "Not showing character count: %@/%@ - subscription: %@", buf, 0x20u);

          }
        }
        v196 = 1;
        goto LABEL_151;
      }
      v253 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v507 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v507, "localizedStringForKey:value:table:", CFSTR("CHARACTER_COUNT_FMT"), &stru_1E276D870, CFSTR("ChatKit"));
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v536);
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      CKLocalizedStringForNumber(v255);
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v535);
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      CKLocalizedStringForNumber(v257);
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v253, "stringWithFormat:", v254, v256, v258);
      v259 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v254) = objc_msgSend(v260, "userInterfaceLayoutDirection") == 1;

      if ((_DWORD)v254)
        v261 = CFSTR("\u200F");
      else
        v261 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v261, "stringByAppendingString:", v259);
      v262 = (void *)objc_claimAutoreleasedReturnValue();

      v263 = v262;
      -[CKMessageEntryView characterCountLabel](self, "characterCountLabel");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v264, "setText:", v263);

    }
    v196 = 0;
LABEL_151:

LABEL_155:
    goto LABEL_156;
  }
LABEL_157:
  if (-[CKMessageEntryView shouldShowSendButton](self, "shouldShowSendButton")
    && !CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    v297 = objc_msgSend(v296, "isAudioMessagesEntryViewRecordingEnabled");

    if (v297)
    {
      v562.origin.x = v517 - v497;
      v562.origin.y = v518;
      v562.size.width = v534;
      v562.size.height = v528;
      v298 = CGRectGetMaxX(v562);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v299, "audioButtonSize");
      v301 = v300;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v302, "entryViewAudioButtonCoverSpace");
      v304 = v303;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v305, "audioButtonSize");
      v307 = v306;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v308, "audioButtonSize");
      v514 = v309;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v310, "audioButtonSize");
      v531 = v311;

      v515 = v298 - v301 - v304;
      v312 = v510 + v307 * -0.5;
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v313, "audioButtonSize");
      v531 = v314;

      -[CKMessageEntryView traitCollection](self, "traitCollection");
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v299, "displayScale");
      v312 = 1.0 / v315 * (v179 * v315 + floor((v494 * v315 - v531 * v315) * 0.5));
    }
    v529 = v312;

    -[CKMessageEntryView convertRect:toView:](self, "convertRect:toView:", v533, v515, v529, v514, v531);
    v317 = v316;
    v319 = v318;
    v321 = v320;
    v323 = v322;
    -[CKMessageEntryView audioButton](self, "audioButton");
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v324, "setFrame:", v317, v319, v321, v323);

    -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView convertRect:toView:](self, "convertRect:toView:", v284, v515, v529, v514, v531);
    v292 = v325;
    v293 = v326;
    v295 = v327;
    v294 = v328;
  }
  else
  {
    if (!CKIsRunningInMacCatalyst())
      goto LABEL_166;
    v558.origin.x = v517;
    v558.origin.y = v519;
    v558.size.width = v534;
    v558.size.height = rect;
    v267 = CGRectGetMaxX(v558);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v268, "entryViewAudioButtonCoverSpace");
    v270 = v269;
    v559.origin.x = v517;
    v559.origin.y = v519;
    v559.size.width = v534;
    v559.size.height = rect;
    MidY = CGRectGetMidY(v559);

    -[CKMessageEntryView traitCollection](self, "traitCollection");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v272, "displayScale");
    v274 = v273;

    v514 = round(v274 * 29.0) / v274;
    v515 = round((v267 + -29.0 - v270) * v274) / v274;
    v529 = round((MidY + -10.0) * v274) / v274;
    v531 = round(v274 * 20.0) / v274;
    -[CKMessageEntryView convertRect:toView:](self, "convertRect:toView:", v533);
    v276 = v275;
    v278 = v277;
    v280 = v279;
    v282 = v281;
    -[CKMessageEntryView audioButton](self, "audioButton");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v283, "setFrame:", v276, v278, v280, v282);

    -[CKMessageEntryView contentView](self, "contentView");
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v284, "frame");
    v285 = CGRectGetMaxX(v560);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v286, "entryViewSendButtonCoverSpace");
    v288 = v287;
    -[CKMessageEntryView contentView](self, "contentView");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v289, "textView");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v290, "frame");
    v291 = CGRectGetMidY(v561);

    v292 = v285 + -29.0 - v288;
    v293 = v291 + -10.0;
    v294 = 20.0;
    v295 = 29.0;
  }

  -[CKMessageEntryView sendButtonSpinner](self, "sendButtonSpinner");
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v329, "setFrame:", v292, v293, v295, v294);

  v530 = v515;
  v532 = v514;
LABEL_166:
  if (-[CKMessageEntryView shouldShowDictationButton](self, "shouldShowDictationButton"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v330 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v330, "dictationButtonSize");
    v332 = v331;
    v334 = v333;

    v563.origin.x = v517 - v497;
    v563.origin.y = v518;
    v563.size.width = v534;
    v563.size.height = v528;
    v335 = CGRectGetMaxX(v563);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v336, "entryViewDictationButtonCoverSpace");
    v338 = v337;

    v339 = v335 - v332 - v338;
    -[CKMessageEntryView convertRect:toView:](self, "convertRect:toView:", v533, v339, v510 + v334 * -0.5, v332, v334);
    v341 = v340;
    v343 = v342;
    v345 = v344;
    v347 = v346;
    -[CKMessageEntryView dictationButton](self, "dictationButton");
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v348, "setFrame:", v341, v343, v345, v347);

    -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
    v349 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView convertRect:toView:](self, "convertRect:toView:", v349, v339, v510 + v334 * -0.5, v332, v334);
    v351 = v350;
    v353 = v352;
    v355 = v354;
    v357 = v356;

    -[CKMessageEntryView sendButtonSpinner](self, "sendButtonSpinner");
    v358 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v358, "setFrame:", v351, v353, v355, v357);

  }
  objc_msgSend(v533, "frame");
  v359 = CGRectGetMaxX(v564);
  v565.origin.y = v529;
  v565.origin.x = v530;
  v565.size.height = v531;
  v565.size.width = v532;
  v360 = CGRectGetMaxX(v565);
  objc_msgSend(v533, "frame");
  v362 = v361;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v363, "bubbleLeftInsetForQuicktationInEntryView");
  v365 = v364;

  v366 = v362 + -8.0 - v365 - v532 + (v359 - v360) * -2.0 + -3.0;
  objc_msgSend(v525, "setPlaceHolderWidth:", v366);
  -[CKMessageEntryView composition](self, "composition");
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v367, "hasContent"))
  {
    v368 = -[CKMessageEntryView entryFieldCollapsed](self, "entryFieldCollapsed");

    if (!v368)
    {
      v372 = 1.0;
      v371 = 0.0;
      goto LABEL_174;
    }
    objc_msgSend(v491, "defaultEntryContentViewHeight");
    objc_msgSend(v511, "setFrame:", v473 + 8.0, 0.0, v366, v369);
    -[CKMessageEntryView composition](self, "composition");
    v367 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v367, "previewText");
    v370 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v511, "setText:", v370);

    v371 = 1.0;
    v372 = 0.00999999978;
  }
  else
  {
    v372 = 1.0;
    v371 = 0.0;
  }

LABEL_174:
  objc_msgSend(v511, "setAlpha:", v371);
  objc_msgSend(v525, "setAlpha:", v372);
  if (-[CKMessageEntryView shouldShowSendButton](self, "shouldShowSendButton")
    || CKIsRunningInMacCatalyst())
  {
    CKIsRunningInMacCatalyst();
    -[CKMessageEntryView waveformViewSize](self, "waveformViewSize");
    if (CKMainScreenScale_once_62 != -1)
      dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1470_0);
    if (!CKIsRunningInMacCatalyst())
    {
      -[CKMessageEntryView audioButton](self, "audioButton");
      v373 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v373, "frame");
      CGRectGetMinX(v566);

    }
    -[CKMessageEntryView waveformView](self, "waveformView");
    v374 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v374, "setFrame:", v509, v518, v534, v528);

    -[CKMessageEntryView waveformViewSize](self, "waveformViewSize");
    if (CKMainScreenScale_once_62 != -1)
      dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1470_0);
    -[CKMessageEntryView recordedAudioView](self, "recordedAudioView");
    v375 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v375, "setFrame:", v509, v518, v534, v528);

  }
  -[CKMessageEntryView bounds](self, "bounds");
  v377 = v376;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v378, "audioRecordingViewButtonSpacing");
  v380 = v379;
  -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
  v382 = v381;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v383, "audioRecordingViewButtonSpacing");
  v385 = v384;
  -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
  v387 = v386;
  -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
  v389 = v388;

  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v390, "sizeThatFits:", v377 + v385 * -2.0 - v387 - v389, 1.79769313e308);
  v392 = v391;
  v394 = v393;

  if (-[CKMessageEntryView shouldUseLinearResizeForAudioMessage](self, "shouldUseLinearResizeForAudioMessage"))
    v394 = rect + (v394 - rect) * 0.3;
  -[CKMessageEntryView bounds](self, "bounds");
  v396 = v395;
  -[CKMessageEntryView bottomInsetForAppStrip](self, "bottomInsetForAppStrip");
  v398 = v397;
  -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
  v400 = (v396 - v398 - v399 - v394) * 0.5;
  if (-[CKMessageEntryView shouldUseLinearResizeForAudioMessage](self, "shouldUseLinearResizeForAudioMessage"))
  {
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v401 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v401, "setFrame:", v517, v400, v534, v394);

    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v402 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v402, "setFrame:", v517, v400, v534, v394);

    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v403 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v404 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v404, "frame");
    objc_msgSend(v403, "_setContinuousCornerRadius:", v405 * 0.5);

    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v406, "setAlpha:", 0.0);

  }
  else
  {
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v407 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v407, "setFrame:", v380 + v382, v400, v392, v394);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v408 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v408, "entryViewCoverMinHeight");
    v410 = v409;

    objc_msgSend(v533, "_setContinuousCornerRadius:", v410 * 0.5);
  }
  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v411, "setCornerRadius:", v394 * 0.5);

  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  v412 = (void *)objc_claimAutoreleasedReturnValue();

  if (v412)
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  else
    -[CKMessageEntryView contentClipView](self, "contentClipView");
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v413, "setAlpha:", 1.0);

  -[CKMessageEntryView inputDelegate](self, "inputDelegate");
  v414 = (void *)objc_claimAutoreleasedReturnValue();

  if (v414)
  {
    -[CKMessageEntryView inputDelegate](self, "inputDelegate");
    v415 = (void *)objc_claimAutoreleasedReturnValue();
    v416 = objc_msgSend(v415, "messageEntryViewHighLightInputButton:", self);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v417 = (void *)objc_claimAutoreleasedReturnValue();
    v418 = objc_msgSend(v417, "entryViewButtonDefaultColor");

    v419 = v416 == 1 ? 1 : v418;
    objc_msgSend(v526, "setCkTintColor:", v419);
    objc_msgSend(v526, "setWantsVibrancy:", v416 != 1);
    v420 = v416 == 2 ? 1 : v418;
    objc_msgSend(v520, "setCkTintColor:", v420);
    objc_msgSend(v520, "setWantsVibrancy:", v416 != 2);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v421 = (void *)objc_claimAutoreleasedReturnValue();
    v422 = objc_msgSend(v421, "isAccessibilityPreferredContentSizeCategory");

    if (v422)
    {
      switch(v416)
      {
        case 1:
          v423 = 0;
          goto LABEL_204;
        case 2:
          objc_msgSend(v516, "setTintedImageForButtonType:tintColor:", 2, 1);
          objc_msgSend(v516, "frame");
          x = v567.origin.x;
          y = v567.origin.y;
          v426 = v567.size.width;
          v427 = v567.size.height;
          v428 = CGRectGetMidX(v567);
          v568.origin.x = x;
          v568.origin.y = y;
          v568.size.width = v426;
          v568.size.height = v427;
          v429 = CGRectGetMidY(v568);
          objc_msgSend(v516, "sizeToFit");
          objc_msgSend(v516, "setCenter:", v428, v429);
          break;
        case 3:
          v423 = 3;
LABEL_204:
          objc_msgSend(v516, "setTintedImageForButtonType:tintColor:", v423, 1);
          break;
        default:
          objc_msgSend(v516, "setDefaultImage");
          break;
      }
    }
  }
  -[CKMessageEntryView configureAppStripOrMentionSuggestionsIfNeeded](self, "configureAppStripOrMentionSuggestionsIfNeeded");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  v431 = objc_msgSend(v430, "isDashedBalloonsEnabled");

  if (v431)
  {
    -[CKMessageEntryView sendLaterPluginInfo](self, "sendLaterPluginInfo");
    v432 = (void *)objc_claimAutoreleasedReturnValue();

    v433 = v432 == 0;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v434 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v434, "entryFieldCoverLineWidth");
    v436 = v435;
    if (v433)
    {
      -[CKMessageEntryView contentClipView](self, "contentClipView");
      v467 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v467, "layer");
      v468 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v468, "setBorderWidth:", v436);

      -[CKMessageEntryView dashedContentClipViewLayer](self, "dashedContentClipViewLayer");
      v465 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v465, "setLineWidth:", 0.0);
    }
    else
    {
      -[CKMessageEntryView dashedContentClipViewLayer](self, "dashedContentClipViewLayer");
      v437 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v437, "setLineWidth:", v436);

      v438 = (void *)MEMORY[0x1E0CEA390];
      -[CKMessageEntryView contentClipView](self, "contentClipView");
      v439 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v439, "layer");
      v440 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v440, "bounds");
      v442 = v441;
      v444 = v443;
      v446 = v445;
      v448 = v447;
      -[CKMessageEntryView dashedContentClipViewLayer](self, "dashedContentClipViewLayer");
      v449 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v449, "lineWidth");
      v451 = v450;
      -[CKMessageEntryView dashedContentClipViewLayer](self, "dashedContentClipViewLayer");
      v452 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v452, "lineWidth");
      v454 = v453;
      v569.origin.x = v442;
      v569.origin.y = v444;
      v569.size.width = v446;
      v569.size.height = v448;
      v570 = CGRectInset(v569, v451, v454);
      v455 = v570.origin.x;
      v456 = v570.origin.y;
      v457 = v570.size.width;
      v458 = v570.size.height;
      -[CKMessageEntryView contentClipView](self, "contentClipView");
      v459 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v459, "layer");
      v460 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v460, "cornerRadius");
      objc_msgSend(v438, "bezierPathWithRoundedRect:cornerRadius:", v455, v456, v457, v458, v461);
      v462 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v463 = objc_msgSend(v462, "CGPath");
      -[CKMessageEntryView dashedContentClipViewLayer](self, "dashedContentClipViewLayer");
      v464 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v464, "setPath:", v463);

      -[CKMessageEntryView contentClipView](self, "contentClipView");
      v465 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v465, "layer");
      v466 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v466, "setBorderWidth:", 0.0);

    }
  }
  +[CKPPTSubTest stop:](CKPPTSubTest, "stop:", CFSTR("CKMessageEntryView Layoutsubviews"));

}

uint64_t __36__CKMessageEntryView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (double)calculateOneLinePlaceHolderCenterY:(double)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  -[CKMessageEntryView bottomInsetForAppStrip](self, "bottomInsetForAppStrip");
  v6 = v5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entryViewVerticalCoverInsets");
  v9 = v8;

  -[CKMessageEntryView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textContainerInset");
  v13 = v12;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "entryViewTextOneLineHeight");
  v16 = v15 * -0.5;

  v17 = a3 - v6 - v9 - v13 + v16;
  if (CKIsRunningInMacCatalyst())
  {
    if (CKMainScreenScale_once_62 != -1)
      dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1470_0);
    v18 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0)
      v18 = 1.0;
    v19 = floor(v17 * v18);
  }
  else
  {
    if (CKMainScreenScale_once_62 != -1)
      dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1470_0);
    v18 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0)
      v18 = 1.0;
    v19 = round(v17 * v18);
  }
  return v19 / v18;
}

- (BOOL)_isPresentingInPopover
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CKMessageEntryView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageEntryViewActiveSendMenuPresentation:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "presentationStyle") == 1;
  else
    v5 = 0;

  return v5;
}

- (void)_updateSendMenuPresentationState:(int64_t)a3
{
  int64_t sendMenuPresentationState;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[5];
  char v56;
  _QWORD v57[4];
  id v58;
  double v59;
  double v60;
  _QWORD v61[4];
  id v62;
  double v63;
  _QWORD v64[4];
  id v65;
  double v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  double v72;
  double v73;
  double v74;

  sendMenuPresentationState = self->_sendMenuPresentationState;
  if (sendMenuPresentationState != a3)
  {
    self->_sendMenuPresentationState = a3;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CKMessageEntryView _isPresentingInPopover](self, "_isPresentingInPopover");
    objc_msgSend(v6, "entryViewSendMenuPresentationStateAnimator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryViewSendMenuPresentationStateAnimator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryViewSendMenuPresentationStateAnimator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryViewSendMenuContentViewWidthAnimator");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryViewSendMenuContentViewWidthAnimator");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0.0;
    v15 = 1.0;
    v49 = v6;
    switch(a3)
    {
      case 0:
        v51 = v8;
        objc_msgSend(v6, "entryViewPlusButtonDefaultBackgroundColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (sendMenuPresentationState == 3)
        {
          objc_msgSend(v6, "entryViewSendMenuPlusButtonDismissBlurAnimator");
          v17 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "entryViewSendMenuPlusButtonDismissBlurAnimator");
          v18 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "entryViewSendMenuPlusButtonDismissScaleAnimator");
          v19 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "entryViewSendMenuContentViewWidthDismissAnimator");
          v20 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "entryViewSendMenuContentViewWidthDismissAnimator");
          v21 = objc_claimAutoreleasedReturnValue();

          v22 = 0;
          v48 = 0;
          v23 = 1.0;
          v24 = 1.0;
          v51 = (void *)v17;
          v52 = (void *)v18;
          v50 = (void *)v19;
          v53 = (void *)v21;
          v54 = (void *)v20;
          goto LABEL_30;
        }
        v52 = v9;
        v50 = v10;
        v22 = 0;
        v48 = 0;
        goto LABEL_29;
      case 1:
        v51 = v8;
        v52 = v9;
        v50 = v10;
        objc_msgSend(v6, "entryViewPlusButtonDefaultBackgroundColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        v48 = 0;
        v26 = 0.8;
        v24 = 0.94;
        v23 = 1.02;
        goto LABEL_31;
      case 2:
        v51 = v8;
        v52 = v9;
        v50 = v10;
        objc_msgSend(v6, "entryViewPlusButtonDefaultBackgroundColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        v11 = 0.8;
        v12 = 1.02;
        v13 = 0.96;
        v48 = v7;
        v25 = 1.0;
        if (v7)
          v15 = 0.0;
        else
          v15 = 1.0;
        if (v7)
          v26 = 1.0;
        else
          v26 = 0.8;
        if (v7)
          v23 = 1.0;
        else
          v23 = 1.02;
        if (v7)
          v24 = 1.0;
        else
          v24 = 0.96;
        goto LABEL_32;
      case 3:
        v15 = 0.0;
        if (v7)
          v14 = 0.0;
        else
          v14 = 6.0;
        v23 = 1.0;
        if (v7)
          v25 = 1.0;
        else
          v25 = 0.25;
        objc_msgSend(v6, "entryViewPlusButtonSendMenuOpenBackgroundColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "entryViewSendMenuPlusButtonSymbolDisappearanceOpacityAnimator");
        v27 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "entryViewSendMenuPlusButtonAppearanceAnimator");
        v28 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "entryViewSendMenuPlusButtonAppearanceAnimator");
        v29 = objc_claimAutoreleasedReturnValue();

        v26 = 1.0;
        if (!v7)
        {
          -[CKMessageEntryView bounds](self, "bounds");
          v31 = v30 * 1.1;
          -[CKMessageEntryView plusButton](self, "plusButton");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "bounds");
          v26 = v31 / v33;

        }
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 1;
        v24 = 1.0;
        v51 = (void *)v28;
        v52 = (void *)v27;
        v50 = (void *)v29;
        goto LABEL_32;
      default:
        v51 = v8;
        v52 = v9;
        v50 = v10;
        v22 = 0;
        v48 = 0;
        v16 = 0;
LABEL_29:
        v23 = 1.0;
        v24 = 1.0;
LABEL_30:
        v26 = 1.0;
LABEL_31:
        v25 = 1.0;
LABEL_32:
        -[CKMessageEntryView plusButton](self, "plusButton", v11, v12, v13);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMessageEntryView contentClipView](self, "contentClipView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = MEMORY[0x1E0C809B0];
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke;
        v67[3] = &unk_1E2756C78;
        v37 = v34;
        v68 = v37;
        v72 = v14;
        v73 = v14;
        v74 = v25;
        v38 = v16;
        v69 = v38;
        v70 = 0;
        v39 = v22;
        v71 = v39;
        v40 = v51;
        objc_msgSend(v51, "addAnimations:", v67);
        objc_msgSend(v51, "startAnimation");
        v64[0] = v36;
        v64[1] = 3221225472;
        v64[2] = __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_2;
        v64[3] = &unk_1E274C9C0;
        v41 = v37;
        v65 = v41;
        v66 = v15;
        v42 = v52;
        objc_msgSend(v52, "addAnimations:", v64);
        objc_msgSend(v52, "startAnimation");
        v61[0] = v36;
        v61[1] = 3221225472;
        v61[2] = __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_3;
        v61[3] = &unk_1E274C9C0;
        v43 = v41;
        v62 = v43;
        v63 = v26;
        v44 = v50;
        objc_msgSend(v50, "addAnimations:", v61);
        objc_msgSend(v50, "startAnimation");
        v57[0] = v36;
        v57[1] = 3221225472;
        v57[2] = __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_4;
        v57[3] = &unk_1E27506B0;
        v45 = v35;
        v58 = v45;
        v59 = v23;
        v60 = v24;
        objc_msgSend(v54, "addAnimations:", v57);
        objc_msgSend(v54, "startAnimation");
        if (self->_shouldCoverViewBeShrunkenForSendMenu != v48)
        {
          if (v48)
          {
            -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "bringSubviewToFront:", v47);

            v40 = v51;
            v44 = v50;
          }
          -[CKMessageEntryView layoutIfNeeded](self, "layoutIfNeeded");
          v55[0] = v36;
          v55[1] = 3221225472;
          v55[2] = __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_5;
          v55[3] = &unk_1E274CA88;
          v55[4] = self;
          v56 = v48;
          objc_msgSend(v53, "addAnimations:", v55);
          objc_msgSend(v53, "startAnimation");
          v42 = v52;
        }

        break;
    }
  }
}

uint64_t __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundBlurRadiusLightMode:", *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundBlurRadiusDarkMode:", *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundBlurRasterizationPercentage:", *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setPlusButtonBackgroundColor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundCompositingFilterForLightMode:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundCompositingFilterForDarkMode:", *(_QWORD *)(a1 + 56));
}

uint64_t __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlusSymbolOpacity:", *(double *)(a1 + 40));
}

void __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_3(uint64_t a1)
{
  void *v2;
  CATransform3D v3;
  CATransform3D v4;

  CATransform3DMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40), 1.0);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

void __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_4(uint64_t a1)
{
  void *v2;
  CATransform3D v3;
  CATransform3D v4;

  CATransform3DMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), 1.0);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

uint64_t __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_5(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 441) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)configureAppStripOrMentionSuggestionsIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CKBrowserSwitcherFooterView *appStrip;
  void *v19;
  void *v20;
  id v21;

  -[CKMessageEntryView bounds](self, "bounds");
  v4 = v3;
  -[CKMessageEntryView bounds](self, "bounds");
  v6 = v5;
  if (-[CKMessageEntryView shouldShowAppStrip](self, "shouldShowAppStrip"))
  {
    -[CKMessageEntryView appStripBackgroundBlurContainerView](self, "appStripBackgroundBlurContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[CKMessageEntryView appStripBackgroundBlurContainerView](self, "appStripBackgroundBlurContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView addSubview:](self, "addSubview:", v9);

      -[CKMessageEntryView appStripBackgroundBlurContainerView](self, "appStripBackgroundBlurContainerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView _inheritedRenderConfig](self, "_inheritedRenderConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setRenderConfig:", v11);

    }
    -[CKMessageEntryView appStrip](self, "appStrip");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      -[CKMessageEntryView addSubview:](self, "addSubview:", v12);
    -[CKMessageEntryView bottomInsetForAppStrip](self, "bottomInsetForAppStrip");
    v15 = v14;
    -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
    v6 = v6 - (v15 + v16);
    -[CKMessageEntryView updateAppStripFrame](self, "updateAppStripFrame");
  }
  else
  {
    -[CKMessageEntryView appStrip](self, "appStrip");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    if (v17)
    {
      if (objc_msgSend(v17, "isMagnified"))
      {
        appStrip = self->_appStrip;
        self->_appStrip = 0;

      }
      objc_msgSend(v12, "removeFromSuperview");
    }
    -[CKMessageEntryView appStripBackgroundBlurContainerView](self, "appStripBackgroundBlurContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[CKMessageEntryView appStripBackgroundBlurContainerView](self, "appStripBackgroundBlurContainerView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeFromSuperview");

    }
  }

  -[CKMessageEntryView backgroundView](self, "backgroundView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", 0.0, 0.0, v4, v6);

}

- (id)inputAccessoryViewBackdropColor
{
  return (id)-[CKMessageEntryBackgroundViewProtocol inputAccessoryViewBackdropColor](self->_backgroundView, "inputAccessoryViewBackdropColor");
}

- (id)inputAccessoryViewBackdropEffects
{
  return (id)-[CKMessageEntryBackgroundViewProtocol inputAccessoryViewBackdropEffects](self->_backgroundView, "inputAccessoryViewBackdropEffects");
}

- (CKBrowserSwitcherFooterView)appStrip
{
  void *v3;
  int v4;
  CKBrowserSwitcherFooterView *appStrip;
  _BOOL4 v6;
  CKBrowserSwitcherFooterView *v7;
  CKBrowserSwitcherFooterView *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppStripInKeyboard");

  if (v4)
    -[CKMessageEntryView configureAppStripBackgroundViewsIfNecessary](self, "configureAppStripBackgroundViewsIfNecessary");
  appStrip = self->_appStrip;
  if (!appStrip)
  {
    v6 = -[CKMessageEntryView shouldShowAppStrip](self, "shouldShowAppStrip");
    appStrip = self->_appStrip;
    if (v6)
    {
      if (!appStrip)
      {
        v7 = objc_alloc_init(CKBrowserSwitcherFooterView);
        v8 = self->_appStrip;
        self->_appStrip = v7;

        -[CKBrowserSwitcherFooterView setScrollsLastUsedAppIconIntoView:](self->_appStrip, "setScrollsLastUsedAppIconIntoView:", 0);
        -[CKBrowserSwitcherFooterView setAutoresizingMask:](self->_appStrip, "setAutoresizingMask:", 2);
        -[CKBrowserSwitcherFooterView setClipsToBounds:](self->_appStrip, "setClipsToBounds:", 1);
        +[CKMessageEntryView sharedAppStripDatasource](CKMessageEntryView, "sharedAppStripDatasource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKBrowserSwitcherFooterView setDataSource:](self->_appStrip, "setDataSource:", v9);

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isAppStripInKeyboard");

        appStrip = self->_appStrip;
        if ((v11 & 1) == 0)
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "theme");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "entryFieldCoverFillColor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKBrowserSwitcherFooterView setBackgroundColor:](appStrip, "setBackgroundColor:", v14);

          appStrip = self->_appStrip;
        }
      }
      -[CKBrowserSwitcherFooterView setDelegate:](appStrip, "setDelegate:", self);
      -[CKMessageEntryView addSubview:](self, "addSubview:", self->_appStrip);
      -[CKBrowserSwitcherFooterView resetScrollPosition](self->_appStrip, "resetScrollPosition");
      -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
      appStrip = self->_appStrip;
    }
  }
  return appStrip;
}

- (void)configureAppStripBackgroundViewsIfNecessary
{
  id v3;
  id v4;
  void *v5;
  id v6;

  if (!self->_appStripBackgroundBlurContainerView)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v6 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v4 = objc_alloc(MEMORY[0x1E0CEA6B0]);
    objc_msgSend(v6, "bounds");
    v5 = (void *)objc_msgSend(v4, "initWithFrame:style:", 2);
    objc_msgSend(v5, "setAutoresizingMask:", 18);
    objc_msgSend(v6, "addSubview:", v5);
    -[CKMessageEntryView addSubview:](self, "addSubview:", v6);
    -[CKMessageEntryView setAppStripBackgroundBlurContainerView:](self, "setAppStripBackgroundBlurContainerView:", v6);
    -[CKMessageEntryView setAppStripBackgroundBlurView:](self, "setAppStripBackgroundBlurView:", v5);
    -[CKMessageEntryView _overrideUserInterfaceStyleForEntryViewStyleIfNeeded:](self, "_overrideUserInterfaceStyleForEntryViewStyleIfNeeded:", -[CKMessageEntryView style](self, "style"));

  }
}

+ (id)sharedAppStripDatasource
{
  if (sharedAppStripDatasource_onceToken != -1)
    dispatch_once(&sharedAppStripDatasource_onceToken, &__block_literal_global_158);
  return (id)sharedAppStripDatasource_sDatasource;
}

void __46__CKMessageEntryView_sharedAppStripDatasource__block_invoke()
{
  CKBrowserSwitcherFooterViewDataSource *v0;
  void *v1;

  v0 = objc_alloc_init(CKBrowserSwitcherFooterViewDataSource);
  v1 = (void *)sharedAppStripDatasource_sDatasource;
  sharedAppStripDatasource_sDatasource = (uint64_t)v0;

}

- (void)updateAppStripFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double Height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CKBrowserSwitcherFooterView *v28;
  CGRect v29;
  CGRect v30;

  v28 = self->_appStrip;
  -[CKBrowserSwitcherFooterView contentHeight](v28, "contentHeight");
  v4 = v3;
  -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
  v6 = v4 + v5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "entryViewFollowsKeyboardLayoutGuide"))
  {
    -[CKMessageEntryView bounds](self, "bounds");
    Height = CGRectGetHeight(v29);
  }
  else
  {
    -[CKMessageEntryView frame](self, "frame");
    Height = CGRectGetMaxY(v30);
  }
  v9 = Height;

  v10 = v9 - v6;
  -[CKMessageEntryView bounds](self, "bounds");
  v12 = v11;
  -[CKMessageEntryView bottomInsetForAppStrip](self, "bottomInsetForAppStrip");
  v14 = v13;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isAppStripInKeyboard");

  if (v16)
  {
    -[CKMessageEntryView appStripBackgroundBlurContainerView](self, "appStripBackgroundBlurContainerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", 0.0, v10, v12, v6);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "chatChromeBottomInset");
    v20 = v19;

    v21 = v10 + (v14 - v20) * 0.5;
    LODWORD(v18) = -[CKMessageEntryView isKeyboardVisible](self, "isKeyboardVisible");
    v22 = objc_msgSend(MEMORY[0x1E0CEA6C8], "__ck_isUsingCompactHeightPredictionBar");
    if ((_DWORD)v18)
    {
      v23 = v10;
      if ((v22 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CEA6C8], "keyplanePadding");
        v23 = v21 + v24 * 0.5;
      }
    }
    else if (v22)
    {
      -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
      if (v25 > 0.0)
        v23 = v21 + 3.0;
      else
        v23 = v21;
    }
    else
    {
      v23 = v21;
    }
    if (CKMainScreenScale_once_62 != -1)
      dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1470_0);
    v26 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0)
      v26 = 1.0;
    v27 = floor(v23 * v26) / v26;
    -[CKBrowserSwitcherFooterView setSnapshotVerticalOffset:](v28, "setSnapshotVerticalOffset:", v10 - v27);
    v10 = v27;
  }
  -[CKBrowserSwitcherFooterView setFrame:](v28, "setFrame:", 0.0, v10, v12, v6);

}

- (BOOL)_shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  BOOL v7;
  _QWORD block[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExpressiveTextEnabled");

  if (!v4)
    return 0;
  -[CKMessageEntryView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "allowsTextAnimations")
    || -[UITraitCollection userInterfaceIdiom](self->_entryViewTraitCollection, "userInterfaceIdiom")
    || (IMIsRunningInMessagesExtension() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__CKMessageEntryView__shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker__block_invoke;
    block[3] = &unk_1E274A208;
    v6 = v6;
    v10 = v6;
    if (_shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker_onceToken != -1)
      dispatch_once(&_shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker_onceToken, block);
    if (_shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker_respondsToIsTextFormattingInProgress)
      v7 = objc_msgSend(v6, "performSelector:", sel__isTextFormattingInProgress) != 0;
    else
      v7 = 0;

  }
  return v7;
}

uint64_t __79__CKMessageEntryView__shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker__block_invoke()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  _shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker_respondsToIsTextFormattingInProgress = result & 1;
  return result;
}

- (double)bottomInsetForAppStrip
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  _BOOL4 v9;
  double result;
  void *v11;
  int v12;
  double v13;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "entryViewSupportsPlusButton");

  if (v4)
  {
    -[CKMessageEntryView inputDelegate](self, "inputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "messageEntryViewShouldVerticallyInsetForPresentedAppCard:", self);

    if (self->_keyboardVisible
      || (v6 & 1) != 0
      || -[CKMessageEntryView _shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker](self, "_shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "entryViewWithSendMenuBottomContentInsetWithKeyboardVisible");
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "entryViewWithSendMenuBottomContentInsetWithoutKeyboardVisible");
    }
    goto LABEL_12;
  }
  v9 = -[CKMessageEntryView shouldShowAppStrip](self, "shouldShowAppStrip");
  result = 0.0;
  if (!v9)
    return result;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isAppStripInKeyboard");

  if (!v12)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chatChromeBottomInset");
LABEL_12:
    v13 = v8;

    return v13;
  }
  objc_msgSend(MEMORY[0x1E0CEA6C8], "predictionViewHeightForCurrentInputMode");
  if (result == 38.0)
    return 37.0;
  return result;
}

- (void)setKeyboardVisible:(BOOL)a3
{
  id v4;

  if (self->_keyboardVisible != a3)
  {
    self->_keyboardVisible = a3;
    -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
    -[CKMessageEntryView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageEntryViewDidChange:isTextChange:isShelfChange:", self, 0, 0);

  }
}

- (BOOL)isRunningInNotificationExtension
{
  return CKIsRunningInMessagesNotificationExtension() != 0;
}

- (BOOL)_shouldUseDarkAppearanceFromTraitCollection:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;

  v4 = objc_msgSend(a3, "userInterfaceStyle");
  v5 = v4 == 2;
  objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_enhancedWindowingEnabled");

  if ((v8 & 1) == 0)
  {
    v9 = -[CKMessageEntryView isRunningInNotificationExtension](self, "isRunningInNotificationExtension");
    return v4 == 2 || v9;
  }
  return v5;
}

- (void)setEntryViewTraitCollection:(id)a3
{
  -[CKMessageEntryView setEntryViewTraitCollection:resetStyle:](self, "setEntryViewTraitCollection:resetStyle:", a3, 0);
}

- (void)setEntryViewTraitCollection:(id)a3 resetStyle:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int64_t style;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UITraitCollection **p_entryViewTraitCollection;
  UITraitCollection *entryViewTraitCollection;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString *v25;
  NSString *v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  int64_t v31;
  int64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  const __CFString *v38;
  NSObject *v39;
  int v40;
  _BYTE v41[10];
  __int16 v42;
  _BOOL4 v43;
  _QWORD v44[3];

  v4 = a4;
  v44[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[CKMessageEntryView _shouldUseDarkAppearanceFromTraitCollection:](self, "_shouldUseDarkAppearanceFromTraitCollection:", v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CEAB40];
    v44[0] = v6;
    v44[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traitCollectionWithTraitsFromCollections:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v11;
  }
  if (v4
    || (style = self->_style) == 0
    || v7 != CKMessageEntryViewStyleIsForDarkAppearance(-[CKMessageEntryView style](self, "style"))
    && (style = CKMessageEntryViewStyleInvert(-[CKMessageEntryView style](self, "style"))) == 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "theme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v7 & 1) != 0)
      v16 = objc_msgSend(v14, "entryViewDarkStyle");
    else
      v16 = objc_msgSend(v14, "entryViewStyle");
    style = v16;

  }
  p_entryViewTraitCollection = &self->_entryViewTraitCollection;
  entryViewTraitCollection = self->_entryViewTraitCollection;
  if (!entryViewTraitCollection)
    goto LABEL_19;
  -[UITraitCollection displayScale](entryViewTraitCollection, "displayScale");
  v20 = v19;
  objc_msgSend(v6, "displayScale");
  if (v20 != v21)
    goto LABEL_19;
  v22 = -[UITraitCollection horizontalSizeClass](*p_entryViewTraitCollection, "horizontalSizeClass");
  if (v22 != objc_msgSend(v6, "horizontalSizeClass"))
    goto LABEL_19;
  v23 = -[UITraitCollection verticalSizeClass](*p_entryViewTraitCollection, "verticalSizeClass");
  if (v23 != objc_msgSend(v6, "verticalSizeClass"))
    goto LABEL_19;
  v24 = -[UITraitCollection userInterfaceStyle](*p_entryViewTraitCollection, "userInterfaceStyle");
  if (v24 != objc_msgSend(v6, "userInterfaceStyle"))
    goto LABEL_19;
  -[UITraitCollection preferredContentSizeCategory](*p_entryViewTraitCollection, "preferredContentSizeCategory");
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  v27 = UIContentSizeCategoryCompareToCategory(v25, v26) == NSOrderedSame;

  if (!v27)
    goto LABEL_19;
  v28 = -[UITraitCollection activeAppearance](*p_entryViewTraitCollection, "activeAppearance");
  if (v28 == objc_msgSend(v6, "activeAppearance"))
  {
    v29 = -[UITraitCollection userInterfaceLevel](*p_entryViewTraitCollection, "userInterfaceLevel");
    v30 = v29 != objc_msgSend(v6, "userInterfaceLevel");
  }
  else
  {
LABEL_19:
    v30 = 1;
  }
  v31 = -[CKMessageEntryView style](self, "style");
  v32 = v31;
  if (v4 || v30 || v31 != style)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v40 = 67109632;
        *(_DWORD *)v41 = v4;
        *(_WORD *)&v41[4] = 1024;
        *(_DWORD *)&v41[6] = v30;
        v42 = 1024;
        v43 = v32 != style;
        _os_log_impl(&dword_18DFCD000, v33, OS_LOG_TYPE_INFO, "resetStyle: %{BOOL}d traitCollectionChanged: %{BOOL}d styleChange: %{BOOL}d", (uint8_t *)&v40, 0x14u);
      }

    }
    objc_storeStrong((id *)&self->_entryViewTraitCollection, v6);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        -[UITraitCollection description](*p_entryViewTraitCollection, "description");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138412290;
        *(_QWORD *)v41 = v35;
        _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Updated _entryViewTraitCollection property. Description: {%@}", (uint8_t *)&v40, 0xCu);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = -[CKMessageEntryView isRunningInNotificationExtension](self, "isRunningInNotificationExtension");
        v38 = CFSTR("NO");
        if (v37)
          v38 = CFSTR("YES");
        v40 = 138412290;
        *(_QWORD *)v41 = v38;
        _os_log_impl(&dword_18DFCD000, v36, OS_LOG_TYPE_INFO, "Update style. isRunningInNotificationExtension: {%@}", (uint8_t *)&v40, 0xCu);
      }

    }
    -[CKMessageEntryView setStyle:](self, "setStyle:", style);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        LOWORD(v40) = 0;
        _os_log_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_INFO, "Returned from -[CKMessageEntryView setStyle:]", (uint8_t *)&v40, 2u);
      }

    }
    -[CKMessageEntryView updateEntryView](self, "updateEntryView");
    -[CKMessageEntryView updateAppsMenu](self, "updateAppsMenu");
    -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
    -[CKMessageEntryView layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  -[CKMessageEntryView setStyle:](self, "setStyle:", -[CKMessageEntryView style](self, "style"));
  -[CKMessageEntryView updateEntryView](self, "updateEntryView");
}

- (void)switcherView:(id)a3 didSelectPluginAtIndex:(id)a4
{
  id v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = dispatch_time(0, 10000000);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__CKMessageEntryView_switcherView_didSelectPluginAtIndex___block_invoke;
  v8[3] = &unk_1E274A108;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], v8);

}

void __58__CKMessageEntryView_switcherView_didSelectPluginAtIndex___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 512));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 512));
    objc_msgSend(v4, "messageEntryView:didSelectPluginAtIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)switcherView:(id)a3 didMagnify:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v4 = a4;
  -[CKMessageEntryView updateAppStripFrame](self, "updateAppStripFrame", a3);
  -[CKMessageEntryView sendButton](self, "sendButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = !v4;
  objc_msgSend(v6, "setEnabled:", v7);

  -[CKMessageEntryView audioButton](self, "audioButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

  -[CKMessageEntryView dictationButton](self, "dictationButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

}

- (void)updateTextViewsForShouldHideCaret:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[CKMessageEntryView contentView](self, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHideCaret:", v3);

  objc_msgSend(v6, "subjectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHideCaret:", v3);

}

- (void)prepareForResizeAnimationIfNeeded
{
  void *v2;
  double width;
  double MinX;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MidX;
  double v15;
  double MidY;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[CKMessageEntryView contentView](self, "contentView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pluginView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && objc_msgSend(v24, "shouldShowPlugin"))
  {
    objc_msgSend(v24, "computedPluginViewFrame");
    width = v25.size.width;
    v25.size.height = 0.0;
    MinX = CGRectGetMinX(v25);
    objc_msgSend(v24, "pluginView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFrame:", MinX, 0.0, width, 0.0);

    objc_msgSend(v24, "computedClearPluginButtonFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v26.origin.y = 0.0;
    v26.size.height = 0.0;
    v26.origin.x = MinX;
    v26.size.width = width;
    MidX = CGRectGetMidX(v26);
    v27.origin.x = v7;
    v27.origin.y = v9;
    v27.size.width = v11;
    v27.size.height = v13;
    v15 = MidX - CGRectGetWidth(v27) * 0.5;
    v28.origin.y = 0.0;
    v28.size.height = 0.0;
    v28.origin.x = MinX;
    v28.size.width = width;
    MidY = CGRectGetMidY(v28);
    v29.origin.x = v7;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v13;
    v17 = MidY - CGRectGetHeight(v29) * 0.5;
    objc_msgSend(v24, "clearPluginButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlpha:", 0.0);

    objc_msgSend(v24, "clearPluginButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v15, v17, v11, v13);

    objc_msgSend(v24, "bounds");
    v21 = v20;
    if (CKPixelWidth_once_12 != -1)
      dispatch_once(&CKPixelWidth_once_12, &__block_literal_global_1476);
    v22 = *(double *)&CKPixelWidth_sPixel_12;
    objc_msgSend(v24, "pluginDividerLine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", 0.0, 0.0, v21, v22);

  }
}

- (void)_configureForDisplayModeSending
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
  id v18;

  -[CKMessageEntryView sendButton](self, "sendButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKMessageEntryView dictationButton](self, "dictationButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[CKMessageEntryView sendButtonSpinner](self, "sendButtonSpinner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  -[CKMessageEntryView sendButtonSpinner](self, "sendButtonSpinner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startAnimating");

  -[CKMessageEntryView setPowerLevels:](self, "setPowerLevels:", 0);
  -[CKMessageEntryView setDuration:](self, "setDuration:", 0.0);
  -[CKMessageEntryView audioButton](self, "audioButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 1.0);

  -[CKMessageEntryView contentClipView](self, "contentClipView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 1.0);

  if (CKIsRunningInMacCatalyst())
  {
    -[CKMessageEntryView cancelButton](self, "cancelButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    -[CKMessageEntryView stopButton](self, "stopButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    -[CKMessageEntryView sendAudioButton](self, "sendAudioButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

    -[CKMessageEntryView browserButton](self, "browserButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

    -[CKMessageEntryView plusButton](self, "plusButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 0);

    -[CKMessageEntryView emojiButton](self, "emojiButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 0);

  }
  -[CKMessageEntryView recordedAudioView](self, "recordedAudioView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeFromSuperview");

  -[CKMessageEntryView waveformView](self, "waveformView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeFromSuperview");

  -[CKMessageEntryView recordedAudioView](self, "recordedAudioView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAudioMediaObject:", 0);

}

- (void)_configureForDisplayModeText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  int v31;
  int v32;
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
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[CKMessageEntryView sendButtonSpinner](self, "sendButtonSpinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[CKMessageEntryView sendButtonSpinner](self, "sendButtonSpinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

  -[CKMessageEntryView contentClipView](self, "contentClipView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[CKMessageEntryView contentClipView](self, "contentClipView", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v45;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v11++), "setHidden:", 0);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v9);
  }

  -[CKMessageEntryView setPowerLevels:](self, "setPowerLevels:", 0);
  -[CKMessageEntryView setDuration:](self, "setDuration:", 0.0);
  -[CKMessageEntryView sendButton](self, "sendButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", 1);

  -[CKMessageEntryView audioButton](self, "audioButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 1);

  -[CKMessageEntryView dictationButton](self, "dictationButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 0);

  -[CKMessageEntryView dictationButton](self, "dictationButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", objc_msgSend(MEMORY[0x1E0CEA6F8], "dictationInputModeIsFunctional"));

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isAudioMessagesEntryViewRecordingEnabled");

  if (v17)
  {
    -[CKMessageEntryView conversation](self, "conversation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "chat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "shouldShowAudioButtonInEntryView");

    -[CKMessageEntryView dictationButton](self, "dictationButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", v20);

    -[CKMessageEntryView audioButton](self, "audioButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", v20 ^ 1);

    -[CKMessageEntryView audioHintLabel](self, "audioHintLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 1);

    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 0);

    -[CKMessageEntryView plusButton](self, "plusButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHidden:", objc_msgSend(v26, "isSendMenuEnabled") ^ 1);

    -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHidden:", 0);

  }
  -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAlpha:", 1.0);

  -[CKMessageEntryView contentClipView](self, "contentClipView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAlpha:", 1.0);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isAudioMessagesEntryViewRecordingEnabled");

  v32 = CKIsRunningInMacCatalyst();
  if (v31)
  {
    if (!v32)
      return;
    -[CKMessageEntryView browserButton](self, "browserButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setHidden:", 0);

    -[CKMessageEntryView plusButton](self, "plusButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setHidden:", 0);

    -[CKMessageEntryView emojiButton](self, "emojiButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setHidden:", 0);
  }
  else
  {
    if (v32)
    {
      -[CKMessageEntryView cancelButton](self, "cancelButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setHidden:", 1);

      -[CKMessageEntryView stopButton](self, "stopButton");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setHidden:", 1);

      -[CKMessageEntryView sendAudioButton](self, "sendAudioButton");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setHidden:", 1);

      -[CKMessageEntryView browserButton](self, "browserButton");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setHidden:", 0);

      -[CKMessageEntryView plusButton](self, "plusButton");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setHidden:", 0);

      -[CKMessageEntryView emojiButton](self, "emojiButton");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setHidden:", 0);

    }
    -[CKMessageEntryView recordedAudioView](self, "recordedAudioView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "removeFromSuperview");

    -[CKMessageEntryView waveformView](self, "waveformView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "removeFromSuperview");

    -[CKMessageEntryView recordedAudioView](self, "recordedAudioView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAudioMediaObject:", 0);
  }

}

- (void)_configureForDisplayModeRecording
{
  void *v3;
  int v4;
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
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAudioMessagesEntryViewRecordingEnabled");

  if (v4)
  {
    -[CKMessageEntryView _setupAudioMessageRecordingView](self, "_setupAudioMessageRecordingView");
    -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.0);

    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAlpha:", 0.0);

  }
  else
  {
    if (CKIsRunningInMacCatalyst())
    {
      -[CKMessageEntryView stopButton](self, "stopButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHidden:", 0);

      -[CKMessageEntryView sendAudioButton](self, "sendAudioButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 1);

    }
    -[CKMessageEntryView _setupWaveformView](self, "_setupWaveformView");
    -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView waveformView](self, "waveformView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[CKMessageEntryView recordedAudioView](self, "recordedAudioView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[CKMessageEntryView recordedAudioView](self, "recordedAudioView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAudioMediaObject:", 0);

    -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 1.0);

    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 1.0);

    -[CKMessageEntryView audioButton](self, "audioButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 1);

    -[CKMessageEntryView emojiButton](self, "emojiButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 1);

    -[CKMessageEntryView cancelButton](self, "cancelButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 1);

    -[CKMessageEntryView dictationButton](self, "dictationButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", 1);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subviews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v23++), "setHidden:", 1);
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v21);
    }

    -[CKMessageEntryView browserButton](self, "browserButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 0);

    -[CKMessageEntryView plusButton](self, "plusButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHidden:", 0);

    -[CKMessageEntryView photoButton](self, "photoButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHidden:", 0);

  }
}

- (void)_configureForDisplayModeRecorded
{
  void *v3;
  int v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAudioMessagesEntryViewRecordingEnabled");

  if (v4)
  {
    -[CKMessageEntryView plusButton](self, "plusButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[CKMessageEntryView _setupAudioMessageRecordingView](self, "_setupAudioMessageRecordingView");
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setState:", 2);

  }
  else
  {
    -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 1.0);

    -[CKMessageEntryView audioButton](self, "audioButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    -[CKMessageEntryView emojiButton](self, "emojiButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    -[CKMessageEntryView cancelButton](self, "cancelButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    -[CKMessageEntryView dictationButton](self, "dictationButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subviews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "setHidden:", 1);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v16);
    }

    -[CKMessageEntryView browserButton](self, "browserButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 0);

    -[CKMessageEntryView plusButton](self, "plusButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", 0);

    -[CKMessageEntryView photoButton](self, "photoButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 0);

    -[CKMessageEntryView sendButton](self, "sendButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 0);

  }
}

- (void)configureForDisplayMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  if (-[CKMessageEntryView displayMode](self, "displayMode") != a3)
  {
    -[CKMessageEntryView setDisplayMode:](self, "setDisplayMode:", a3);
    if (a3 == 1)
    {
      -[CKMessageEntryView _configureForDisplayModeText](self, "_configureForDisplayModeText");
      -[CKMessageEntryView clearAudioRecordingUI](self, "clearAudioRecordingUI");
      goto LABEL_26;
    }
    if (a3 == 4)
    {
      -[CKMessageEntryView _configureForDisplayModeSending](self, "_configureForDisplayModeSending");
      goto LABEL_26;
    }
    -[CKMessageEntryView audioButton](self, "audioButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isAudioMessagesEntryViewRecordingEnabled");

    if ((v7 & 1) == 0)
    {
      -[CKMessageEntryView contentClipView](self, "contentClipView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", 0.0);

    }
    v9 = CKIsRunningInMacCatalyst();
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAudioMessagesEntryViewRecordingEnabled");

    if (v9)
    {
      if ((v11 & 1) == 0)
      {
        -[CKMessageEntryView cancelButton](self, "cancelButton");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setHidden:", 0);

      }
      -[CKMessageEntryView browserButton](self, "browserButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

      -[CKMessageEntryView plusButton](self, "plusButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHidden:", 1);

      -[CKMessageEntryView emojiButton](self, "emojiButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 1);

      -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView cancelButton](self, "cancelButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", v17);

    }
    else
    {
      if (v11)
      {
        if (a3 == 2)
        {
LABEL_17:
          -[CKMessageEntryView _configureForDisplayModeRecording](self, "_configureForDisplayModeRecording");
LABEL_26:
          -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
          if (CKIsRunningInMacCatalyst())
            -[CKMessageEntryView layoutIfNeeded](self, "layoutIfNeeded");
          return;
        }
        -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAlpha:", 0.0);

LABEL_18:
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isAudioMessagesEntryViewRecordingEnabled");

        if (v20)
        {
          -[CKMessageEntryView contentClipView](self, "contentClipView");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setAlpha:", 0.0);
        }
        else
        {
          if (CKIsRunningInMacCatalyst())
          {
            -[CKMessageEntryView stopButton](self, "stopButton");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setHidden:", 1);

            -[CKMessageEntryView sendAudioButton](self, "sendAudioButton");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setHidden:", 0);

          }
          -[CKMessageEntryView loadRecordedAudioViewsIfNeeded](self, "loadRecordedAudioViewsIfNeeded");
          -[CKMessageEntryView waveformView](self, "waveformView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeFromSuperview");

          -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKMessageEntryView recordedAudioView](self, "recordedAudioView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addSubview:", v26);

          -[CKMessageEntryView audioComposition](self, "audioComposition");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "mediaObjects");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "firstObject");
          v21 = (id)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = v21;
            -[CKMessageEntryView recordedAudioView](self, "recordedAudioView");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setAudioMediaObject:", v21);

          }
        }

        if (a3 == 3)
          -[CKMessageEntryView _configureForDisplayModeRecorded](self, "_configureForDisplayModeRecorded");
        goto LABEL_26;
      }
      -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAlpha:", 0.0);
    }

    if (a3 == 2)
      goto LABEL_17;
    goto LABEL_18;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  _BOOL4 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGSize result;

  width = a3.width;
  -[CKMessageEntryView adjustedCoverInsets](self, "adjustedCoverInsets", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  v11 = width - (v9 + v10);
  -[CKMessageEntryView contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", v11, 1.79769313e308);
  v14 = v13;
  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView bounds](self, "bounds");
    v18 = v17;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "audioRecordingViewButtonSpacing");
    objc_msgSend(v16, "sizeThatFits:", v18 + v20 * -2.0, 1.79769313e308);
    v22 = v21;

    if (-[CKMessageEntryView shouldUseLinearResizeForAudioMessage](self, "shouldUseLinearResizeForAudioMessage"))
      v22 = v14 + (v22 - v14) * 0.3;
  }
  else
  {
    v22 = v14;
    if (-[CKMessageEntryView shouldShowAudioMessageHint](self, "shouldShowAudioMessageHint"))
    {
      -[CKMessageEntryView audioHintLabel](self, "audioHintLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "frame");
      v22 = v24;

    }
  }
  if (-[CKMessageEntryView entryFieldCollapsed](self, "entryFieldCollapsed"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "entryViewlayoutMetrics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "defaultEntryViewHeight");
    v28 = v27;
    -[CKMessageEntryView composition](self, "composition");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "hasContent") & 1) != 0)
    {

    }
    else
    {
      v31 = -[CKMessageEntryView shouldShowSubject](self, "shouldShowSubject");

      if (v31)
      {
        objc_msgSend(v26, "defaultSubjectEntryViewHeight");
        v28 = v32;
      }
    }
    -[CKMessageEntryView bottomInsetForAppStrip](self, "bottomInsetForAppStrip");
    v30 = v28 + v33;

  }
  else
  {
    v30 = v8 + v6 + v22;
  }
  -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
  v35 = ceil(v30 + v34);

  v36 = ceil(width);
  v37 = v35;
  result.height = v37;
  result.width = v36;
  return result;
}

- (CGRect)coverFrameThatFitsInSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  _BOOL4 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[CKMessageEntryView adjustedCoverInsets](self, "adjustedCoverInsets");
  v8 = width - (v6 + v7);
  v11 = height - (v9 + v10);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entryViewCoverMinHeight");
  v14 = v13;

  if (v14 >= v11)
    v11 = v14;
  -[CKMessageEntryView contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeThatFits:", v8, v11);
  v17 = v16;
  v19 = v18;
  if (-[CKMessageEntryView entryFieldCollapsed](self, "entryFieldCollapsed"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "entryViewlayoutMetrics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "defaultEntryContentViewHeight");
    v23 = v22;
    -[CKMessageEntryView composition](self, "composition");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "hasContent") & 1) != 0)
    {

    }
    else
    {
      v25 = -[CKMessageEntryView shouldShowSubject](self, "shouldShowSubject");

      if (v25)
      {
        objc_msgSend(v21, "defaultSubjectEntryContentViewHeight");
        v23 = v26;
      }
    }

  }
  else
  {
    v23 = fmin(v19, v11);
  }
  -[CKMessageEntryView _computedFinalCoverFrameRectForContentSize:](self, "_computedFinalCoverFrameRectForContentSize:", v17, v23);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v35 = v28;
  v36 = v30;
  v37 = v32;
  v38 = v34;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (CGRect)_computedFinalCoverFrameRectForContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double MinX;
  double v38;
  double MaxX;
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
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
  v7 = v6;
  -[CKMessageEntryView adjustedCoverInsets](self, "adjustedCoverInsets");
  v9 = v8;
  v11 = v10;
  -[CKMessageEntryView bounds](self, "bounds");
  v13 = v12 - width - v11;
  -[CKMessageEntryView bounds](self, "bounds");
  v15 = v14;
  if (self->_shouldCoverViewBeShrunkenForSendMenu)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "messageEntryViewActiveSendMenuPresentation:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)objc_msgSend(v17, "newPopoverLayoutMetrics");
      if (v18)
      {
        -[CKMessageEntryView window](self, "window");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "coordinateSpace");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "frame");
        objc_msgSend(v20, "convertRect:toCoordinateSpace:", v19);
        v22 = v21;
        v24 = v23;
        v48 = v9;
        v49 = v7;
        v26 = v25;
        v28 = v27;

        -[CKMessageEntryView convertRect:fromView:](self, "convertRect:fromView:", 0, v22, v24, v26, v28);
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;
        -[CKMessageEntryView bounds](self, "bounds");
        v47 = v15;
        MinX = CGRectGetMinX(v50);
        v51.origin.x = v30;
        v51.origin.y = v32;
        v51.size.width = v34;
        v51.size.height = v36;
        v38 = CGRectGetMinX(v51);
        if (MinX >= v38)
          v38 = MinX;
        -[CKMessageEntryView bounds](self, "bounds", *(_QWORD *)&v38);
        MaxX = CGRectGetMaxX(v52);
        v53.origin.x = v30;
        v53.origin.y = v32;
        v9 = v48;
        v53.size.width = v34;
        v53.size.height = v36;
        v40 = CGRectGetMaxX(v53);
        if (MaxX < v40)
          v40 = MaxX;
        v15 = v47;
        v41 = v40 - v46 + 24.0;
        width = width - vabdd_f64(v13, v41);

        v13 = v41;
        v7 = v49;
      }

    }
  }
  v42 = v15 - height - (v7 + v9);
  v43 = v13;
  v44 = width;
  v45 = height;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v42;
  result.origin.x = v43;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CKEntryViewButton *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  CKEntryViewButton *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  void *v29;
  CKEntryViewButton *sendButton;
  CKEntryViewButton *v31;
  void *WeakRetained;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double MaxX;
  CKEntryViewButton *v52;
  objc_super v54;
  CGPoint v55;
  CGPoint v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  y = a3.y;
  x = a3.x;
  v54.receiver = self;
  v54.super_class = (Class)CKMessageEntryView;
  -[CKMessageEntryView hitTest:withEvent:](&v54, sel_hitTest_withEvent_, a4);
  v7 = (CKEntryViewButton *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        -[CKMessageEntryView audioRecordingView](self, "audioRecordingView"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[CKEntryViewButton isDescendantOfView:](v7, "isDescendantOfView:", v10),
        v10,
        v9,
        !v11))
  {
    -[CKEntryViewButton frame](self->_sendButton, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[CKEntryViewButton superview](self->_sendButton, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView convertRect:fromView:](self, "convertRect:fromView:", v21, v14, v16, v18, v20);
    v23 = v22;
    v25 = v24;
    v27 = v26;

    -[CKMessageEntryView frame](self, "frame");
    if (v7 == self->_sendButton)
      goto LABEL_16;
    if (v7 == self->_audioButton)
      goto LABEL_16;
    v57.size.width = v28 - v23;
    v57.origin.x = v23;
    v57.origin.y = v25;
    v57.size.height = v27;
    v55.x = x;
    v55.y = y;
    if (!CGRectContainsPoint(v57, v55))
      goto LABEL_16;
    if (-[CKEntryViewButton isEnabled](self->_sendButton, "isEnabled")
      && (-[CKEntryViewButton isHidden](self->_sendButton, "isHidden") & 1) == 0)
    {
      sendButton = self->_sendButton;
    }
    else
    {
      if (!-[CKEntryViewButton isEnabled](self->_audioButton, "isEnabled")
        || (-[CKEntryViewButton isHidden](self->_audioButton, "isHidden") & 1) != 0)
      {
        -[CKMessageEntryView delegate](self, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "messageEntryViewSendButtonHitWhileDisabled:", self);
LABEL_15:

LABEL_16:
        -[CKEntryViewPlusButton button](self->_plusButton, "button");
        v31 = (CKEntryViewButton *)objc_claimAutoreleasedReturnValue();
        if (-[CKMessageEntryView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
        {
          -[CKEntryViewButton window](v31, "window");
          WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
          if (!WeakRetained
            || !-[CKEntryViewButton isEnabled](v31, "isEnabled")
            || (-[CKEntryViewButton isHidden](v31, "isHidden") & 1) != 0)
          {
            goto LABEL_25;
          }
          -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v33)
          {
            -[CKEntryViewButton frame](v31, "frame");
            v35 = v34;
            v37 = v36;
            v39 = v38;
            v41 = v40;
            -[CKEntryViewButton superview](v31, "superview");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKMessageEntryView convertRect:fromView:](self, "convertRect:fromView:", v42, v35, v37, v39, v41);
            v44 = v43;
            v46 = v45;
            v48 = v47;
            v50 = v49;

            v58.origin.x = v44;
            v58.origin.y = v46;
            v58.size.width = v48;
            v58.size.height = v50;
            MaxX = CGRectGetMaxX(v58);
            if (v7 == v31)
            {
LABEL_24:
              WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
              objc_msgSend(WeakRetained, "messageEntryViewPlusButtonHit:", self);
LABEL_25:

              goto LABEL_26;
            }
            v59.size.width = MaxX;
            v59.origin.x = 0.0;
            v59.origin.y = v46;
            v59.size.height = v50;
            v56.x = x;
            v56.y = y;
            if (CGRectContainsPoint(v59, v56))
            {
              v52 = v31;

              v7 = v52;
              goto LABEL_24;
            }
          }
        }
LABEL_26:
        v12 = v7;

        goto LABEL_27;
      }
      sendButton = self->_audioButton;
    }
    -[CKEntryViewButton button](sendButton, "button");
    v29 = v7;
    v7 = (CKEntryViewButton *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v12 = v7;
LABEL_27:

  return v12;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  char v9;
  void *v10;
  char v11;
  id WeakRetained;
  id v13;
  int v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  objc_super v19;
  double v20;
  double v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "entryViewFollowsKeyboardLayoutGuide");

  if ((v9 & 1) == 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEntryViewInputAccessory");

    if ((v11 & 1) != 0)
    {
      v20 = 0.0;
      v21 = 0.0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = objc_loadWeakRetained((id *)&self->_delegate);
        v14 = objc_msgSend(v13, "messageEntryViewWidth:andOffset:", &v21, &v20);

        if (v14)
        {
          x = v20;
          width = v21;
        }
      }
      else
      {

      }
    }
    else
    {
      -[CKMessageEntryView superview](self, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[CKMessageEntryView superview](self, "superview");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bounds");
        v18 = v17;

        y = v18 - height;
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)CKMessageEntryView;
  -[CKMessageEntryView setFrame:](&v19, sel_setFrame_, x, y, width, height);
}

- (void)prepareForBrowserSwitcherCompactTransitionIsSnapshotting:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v3 = a3;
  -[CKMessageEntryView setIsTransitioningForBrowserSwitcher:](self, "setIsTransitioningForBrowserSwitcher:", 1);
  if (v3)
  {
    -[CKMessageEntryView appStripBackgroundBlurView](self, "appStripBackgroundBlurView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[CKMessageEntryView appStrip](self, "appStrip");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 1);

    -[CKMessageEntryView appStripBackgroundBlurView](self, "appStripBackgroundBlurView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v7, v9, v11, v13 + 20.0);

  }
}

- (void)finishBrowserSwitcherCompactTransition
{
  id v3;

  -[CKMessageEntryView setIsTransitioningForBrowserSwitcher:](self, "setIsTransitioningForBrowserSwitcher:", 0);
  -[CKMessageEntryView appStrip](self, "appStrip");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  int v39;
  int v40;
  unsigned __int8 v41;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[CKMessageEntryView marginInsets](self, "marginInsets");
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    self->_marginInsets.top = top;
    self->_marginInsets.left = left;
    self->_marginInsets.bottom = bottom;
    self->_marginInsets.right = right;
    v41 = 0;
    -[CKMessageEntryView plusButton](self, "plusButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = 1;
    }
    else
    {
      -[CKMessageEntryView photoButton](self, "photoButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v16 = 1;
      }
      else
      {
        -[CKMessageEntryView browserButton](self, "browserButton");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v18 != 0;

      }
    }

    v19 = -[CKMessageEntryView shouldShowPluginButtons](self, "shouldShowPluginButtons") & v16;
    v20 = -[CKConversation isStewieConversation](self->_conversation, "isStewieConversation");
    -[CKConversation sendingService](self->_conversation, "sendingService");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "__ck_isiMessageLite") & 1) != 0)
    {
      v22 = 1;
    }
    else
    {
      -[CKMessageEntryView conversation](self, "conversation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sendingService");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "__ck_isSatelliteSMS") & 1) != 0)
      {
        v22 = 1;
      }
      else
      {
        -[CKMessageEntryView conversation](self, "conversation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "chat");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v20 | objc_msgSend(v26, "shouldDisplayOffGridModeStatus");

      }
    }

    +[CKMessageEntryView coverViewInsetsForMarginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCenterCharacterCount:isStewieMode:](CKMessageEntryView, "coverViewInsetsForMarginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCenterCharacterCount:isStewieMode:", v19, -[CKMessageEntryView shouldShowCharacterCount](self, "shouldShowCharacterCount"), &v41, v22, top, left, bottom, right);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    -[CKMessageEntryView coverInsets](self, "coverInsets");
    if (v38 == v30 && v35 == v28 && v37 == v34 && v36 == v32)
    {
      v39 = -[CKMessageEntryView shouldCenterCharacterCount](self, "shouldCenterCharacterCount");
      v40 = v41;
      if (v41 == v39)
        return;
    }
    else
    {
      v40 = v41;
    }
    -[CKMessageEntryView setShouldCenterCharacterCount:](self, "setShouldCenterCharacterCount:", v40 != 0);
    -[CKMessageEntryView setCoverInsets:](self, "setCoverInsets:", v28, v30, v32, v34);
    -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackdropGroupName:(id)a3
{
  id v4;
  NSString *v5;
  NSString *backdropGroupName;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString isEqualToString:](self->_backdropGroupName, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    backdropGroupName = self->_backdropGroupName;
    self->_backdropGroupName = v5;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Setting backdrop group name %@", (uint8_t *)&v8, 0xCu);
      }

    }
    -[CKMessageEntryBackgroundViewProtocol setBackdropGroupName:](self->_backgroundView, "setBackdropGroupName:", self->_backdropGroupName);
  }

}

- (double)placeholderHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
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

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entryViewlayoutMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKMessageEntryView shouldShowSubject](self, "shouldShowSubject"))
    objc_msgSend(v4, "defaultSubjectEntryViewHeight");
  else
    objc_msgSend(v4, "defaultEntryViewHeight");
  v6 = v5;
  -[CKMessageEntryView sendLaterPluginInfo](self, "sendLaterPluginInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageEntryContentViewSendLaterInsets");
    v10 = v9;
    v12 = v11;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "entryViewMaxSendLaterHeight");
    v6 = v6 + v10 + v12 + v14;

  }
  -[CKMessageEntryView adjustedCoverInsets](self, "adjustedCoverInsets");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v3, "entryViewVerticalCoverInsets");
  v20 = v18 - v19;
  v22 = v16 - v21;
  -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
  v24 = ceil(v23 + v20 + v6 + v22);

  return v24;
}

- (double)coverViewWidth
{
  void *v2;
  double Width;
  CGRect v5;

  -[CKMessageEntryView contentClipView](self, "contentClipView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  Width = CGRectGetWidth(v5);

  return Width;
}

- (CGRect)sendButtonFrameInScreenCoordinates
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[CKMessageEntryView sendButton](self, "sendButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CKMessageEntryView audioButton](self, "audioButton");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(v7, "convertRect:toView:", 0);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)activeKeyboardHeight
{
  void *v2;
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
  double v13;
  double v14;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CKMessageEntryView)initWithFrame:(CGRect)a3 marginInsets:(UIEdgeInsets)a4 shouldShowSendButton:(BOOL)a5 shouldShowSubject:(BOOL)a6 shouldShowPluginButtons:(BOOL)a7 shouldShowCharacterCount:(BOOL)a8 traitCollection:(id)a9 shouldDisableAttachments:(BOOL)a10 shouldDisableKeyboardStickers:(BOOL)a11
{
  uint64_t v12;

  BYTE3(v12) = a11;
  *(_WORD *)((char *)&v12 + 1) = 0;
  LOBYTE(v12) = a10;
  return -[CKMessageEntryView initWithFrame:marginInsets:shouldAllowImpact:shouldShowSendButton:shouldShowSubject:shouldShowPluginButtons:shouldShowCharacterCount:traitCollection:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:](self, "initWithFrame:marginInsets:shouldAllowImpact:shouldShowSendButton:shouldShowSubject:shouldShowPluginButtons:shouldShowCharacterCount:traitCollection:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:", 1, a5, a6, a7, a8, a9, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom, a4.right, v12);
}

- (CKMessageEntryView)initWithFrame:(CGRect)a3 marginInsets:(UIEdgeInsets)a4 shouldAllowImpact:(BOOL)a5 shouldShowSendButton:(BOOL)a6 shouldShowSubject:(BOOL)a7 shouldShowPluginButtons:(BOOL)a8 shouldShowCharacterCount:(BOOL)a9 traitCollection:(id)a10 shouldDisableAttachments:(BOOL)a11 shouldUseNonEmojiKeyboard:(BOOL)a12 shouldUseNonHandwritingKeyboard:(BOOL)a13 shouldDisableKeyboardStickers:(BOOL)a14
{
  _BOOL4 v14;
  uint64_t v15;
  _BOOL8 v16;
  _BOOL4 v17;
  _BOOL8 v18;
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  double y;
  double x;
  id v28;
  CKMessageEntryView *v29;
  CKScheduledUpdater *v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL8 v37;
  _BOOL8 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  double v62;
  void *v63;
  uint64_t v64;
  int v65;
  void *v66;
  CKMessageEntryViewButtonContainerView *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  int v76;
  __objc2_class **v77;
  double *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  CKEntryViewPlusButton *v86;
  void *v87;
  int v88;
  void *v89;
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
  int v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  uint64_t v108;
  UISelectionFeedbackGenerator *plusButtonFeedbackGenerator;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  void *v130;
  int v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  double v137;
  double v138;
  double v139;
  double v140;
  void *v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  void *v147;
  void *v148;
  int v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  CKMessageEntryContentView *v162;
  void *v163;
  double v164;
  double v165;
  void *v166;
  double v167;
  double v168;
  void *v169;
  double v170;
  double v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  CKAudioRecorder *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  int v181;
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
  int v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  double v202;
  double v203;
  void *v204;
  double v205;
  double v206;
  void *v207;
  int v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  uint64_t v218;
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
  id v237;
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
  int v253;
  void *v254;
  int v256;
  void *v257;
  double v258;
  void *v259;
  _BOOL4 v260;
  void *v261;
  double v262;
  void *v263;
  unsigned int v264;
  double v265;
  void *v266;
  double v267;
  void *v268;
  _BOOL4 v269;
  CKMessageEntryViewButtonContainerView *v270;
  CKMessageEntryContentView *v271;
  id v272;
  unsigned __int8 v273;
  objc_super v274;
  _QWORD v275[7];

  v14 = a9;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v275[5] = *MEMORY[0x1E0C80C00];
  v28 = a10;
  v274.receiver = self;
  v274.super_class = (Class)CKMessageEntryView;
  v267 = height;
  v29 = -[CKMessageEntryView initWithFrame:](&v274, sel_initWithFrame_, x, y, width, height);
  if (!v29)
    goto LABEL_69;
  v260 = v14;
  v269 = v17;
  v272 = v28;
  +[CKMessageEntryView setCurrentEntryView:](CKMessageEntryView, "setCurrentEntryView:", v29);
  v30 = -[CKScheduledUpdater initWithTarget:action:]([CKScheduledUpdater alloc], "initWithTarget:action:", v29, sel__updateUIForEntryFieldCollapsedStateChange);
  -[CKMessageEntryView setEntryFieldCollapsedUpdater:](v29, "setEntryFieldCollapsedUpdater:", v30);

  -[CKMessageEntryView entryFieldCollapsedUpdater](v29, "entryFieldCollapsedUpdater");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 1;
  objc_msgSend(v31, "setUpdateSynchronouslyIfPossible:", 1);

  v33 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[CKMessageEntryView setButtonAndTextAreaContainerView:](v29, "setButtonAndTextAreaContainerView:", v33);

  -[CKMessageEntryView buttonAndTextAreaContainerView](v29, "buttonAndTextAreaContainerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView addSubview:](v29, "addSubview:", v34);

  -[CKMessageEntryView setLastFoundMentionRange:](v29, "setLastFoundMentionRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[CKMessageEntryView conversation](v29, "conversation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sendingService");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v36, "__ck_isiMessageLite") & 1) == 0)
  {
    v264 = v15;
    v37 = v18;
    v38 = v16;
    -[CKMessageEntryView conversation](v29, "conversation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "sendingService");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v40, "__ck_isSatelliteSMS") & 1) == 0)
    {
      -[CKMessageEntryView conversation](v29, "conversation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "chat");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v42, "shouldDisplayOffGridModeStatus");

    }
    v16 = v38;
    v18 = v37;
    v15 = v264;
  }
  v258 = x;
  v262 = y;
  v265 = width;

  -[CKMessageEntryView conversation](v29, "conversation");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isStewieConversation") | v32;

  v273 = 0;
  v256 = v44;
  +[CKMessageEntryView coverViewInsetsForMarginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCenterCharacterCount:isStewieMode:](CKMessageEntryView, "coverViewInsetsForMarginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCenterCharacterCount:isStewieMode:", v15, v44 | v260, &v273, v44, top, left, bottom, right);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;
  -[CKMessageEntryView setMarginInsets:](v29, "setMarginInsets:", top, left, bottom, right);
  -[CKMessageEntryView setCoverInsets:](v29, "setCoverInsets:", v46, v48, v50, v52);
  -[CKMessageEntryView setShouldShowSendButton:](v29, "setShouldShowSendButton:", v269);
  -[CKMessageEntryView setShouldShowSubject:](v29, "setShouldShowSubject:", v16);
  -[CKMessageEntryView setShouldShowPluginButtons:](v29, "setShouldShowPluginButtons:", v15);
  -[CKMessageEntryView setShouldShowCharacterCount:](v29, "setShouldShowCharacterCount:", v44 | v260);
  -[CKMessageEntryView setShouldCenterCharacterCount:](v29, "setShouldCenterCharacterCount:", v273);
  -[CKMessageEntryView setShouldDisableAttachments:](v29, "setShouldDisableAttachments:", a11);
  -[CKMessageEntryView setShouldAllowImpactSend:](v29, "setShouldAllowImpactSend:", v18);
  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "enabledDictationLanguages");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView setDictationEnabledForLanguage:](v29, "setDictationEnabledForLanguage:", objc_msgSend(v54, "count") != 0);

  -[CKMessageEntryView setShouldShowDictationButton:](v29, "setShouldShowDictationButton:", 1);
  -[CKMessageEntryView setAccessibilityIdentifier:](v29, "setAccessibilityIdentifier:", CFSTR("entryView"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObserver:selector:name:object:", v29, sel_textEffectsWindowOffsetDidChange_, *MEMORY[0x1E0CEBD18], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addObserver:selector:name:object:", v29, sel__keyboardsSettingsChanged_, CFSTR("AppleKeyboardsSettingsChangedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObserver:selector:name:object:", v29, sel__dictationAvailabilityDidChange, *MEMORY[0x1E0CEB808], 0);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v54) = objc_msgSend(v58, "isAudioMessagesEntryViewRecordingEnabled");

  if ((_DWORD)v54)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObserver:selector:name:object:", v29, sel_applicationWillResignActive, *MEMORY[0x1E0CEB358], 0);

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "entryViewFollowsKeyboardLayoutGuide");

  v62 = v265;
  if (v61)
  {
    -[CKMessageEntryView setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  else
  {
    -[CKMessageEntryView layer](v29, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setAnchorPoint:", 1.0, 1.0);

  }
  -[CKMessageEntryView setOpaque:](v29, "setOpaque:", 0);
  -[CKMessageEntryView updateBackgroundView](v29, "updateBackgroundView");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v64 = objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend((id)v64, "isSendMenuEnabled");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v64) = objc_msgSend(v66, "entryViewSupportsPlusButton");

  v67 = -[CKMessageEntryViewButtonContainerView initWithFrame:]([CKMessageEntryViewButtonContainerView alloc], "initWithFrame:", v258, v262, v265, v267);
  -[CKMessageEntryViewButtonContainerView setClipsToBounds:](v67, "setClipsToBounds:", v65 ^ 1u);
  -[CKMessageEntryViewButtonContainerView layer](v67, "layer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setAnchorPoint:", 0.0, 0.0);

  -[CKMessageEntryView buttonAndTextAreaContainerView](v29, "buttonAndTextAreaContainerView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addSubview:", v67);

  v270 = v67;
  -[CKMessageEntryView setInputButtonContainerView:](v29, "setInputButtonContainerView:", v67);
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithFrame:", v258, v262, v265, v267);
  -[CKMessageEntryView setMessageEditingBlurOverlayView:](v29, "setMessageEditingBlurOverlayView:", v70);
  -[CKMessageEntryView addSubview:](v29, "addSubview:", v70);
  v263 = v70;
  objc_msgSend(v70, "setHidden:", 1);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v71;
  if ((v64 & 1) != 0)
    objc_msgSend(v71, "entryViewPlusButtonSize");
  else
    objc_msgSend(v71, "browserButtonSize");
  v74 = v73;

  -[CKMessageEntryView setInputButtonSize:](v29, "setInputButtonSize:", v74, v74);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "entryViewSupportsPhotoButton");

  v77 = off_1E2733000;
  v78 = (double *)MEMORY[0x1E0C9D538];
  if (v76)
  {
    +[CKEntryViewButton entryViewButtonOfType:](CKEntryViewButton, "entryViewButtonOfType:", 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setOpaque:", 0);
    objc_msgSend(v79, "button");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "addTarget:action:forEvents:", v29, sel_photoButtonTouchDown_, 1);

    objc_msgSend(v79, "button");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addTarget:action:forEvents:", v29, sel_photoButtonTouchUpOutside_, 128);

    objc_msgSend(v79, "button");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "addTarget:action:forEvents:", v29, sel_photoButtonTouchCancel_, 256);

    objc_msgSend(v79, "button");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "addTarget:action:forEvents:", v29, sel_photoButtonTapped_, 64);

    objc_msgSend(v79, "accessibilitySetIdentification:", CFSTR("photoButton"));
    objc_msgSend(v79, "setExclusiveTouch:", 0);
    objc_msgSend(v79, "setBounds:", *v78, v78[1], v74, v74);
    if (-[CKMessageEntryView shouldShowPluginButtons](v29, "shouldShowPluginButtons"))
    {
      -[CKMessageEntryView setPhotoButton:](v29, "setPhotoButton:", v79);
      -[CKMessageEntryViewButtonContainerView addSubview:](v67, "addSubview:", v79);
    }

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "entryViewSupportsPlusButton");

  if (v85)
  {
    v86 = objc_alloc_init(CKEntryViewPlusButton);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "browserButtonShouldUseMenu");

    -[CKEntryViewPlusButton button](v86, "button");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v89;
    if (v88)
    {
      -[CKMessageEntryView entryViewTraitCollection](v29, "entryViewTraitCollection");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView conversation](v29, "conversation");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAppMenuDataSource appMenuWithTarget:traitCollection:conversation:](CKAppMenuDataSource, "appMenuWithTarget:traitCollection:conversation:", v29, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setMenu:", v93);

      v77 = off_1E2733000;
      -[CKEntryViewPlusButton button](v86, "button");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setContextMenuIsPrimary:", 1);

      -[CKEntryViewPlusButton button](v86, "button");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setContextMenuEnabled:", 1);
    }
    else
    {
      objc_msgSend(v89, "addTarget:action:forEvents:", v29, sel_plusButtonTouchDown_, 1);

      -[CKEntryViewPlusButton button](v86, "button");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addTarget:action:forEvents:", v29, sel_plusButtonTouchUpOutside_, 128);

      -[CKEntryViewPlusButton button](v86, "button");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "addTarget:action:forEvents:", v29, sel_plusButtonTouchCancel_, 256);

      -[CKEntryViewPlusButton button](v86, "button");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "addTarget:action:forEvents:", v29, sel_plusButtonTouchDragExit_, 32);

      -[CKEntryViewPlusButton button](v86, "button");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "addTarget:action:forEvents:", v29, sel_plusButtonTouchDragEnter_, 16);

      -[CKEntryViewPlusButton button](v86, "button");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "addTarget:action:forEvents:", v29, sel_didSelectPlusButton_, 64);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v101, "supportsEntryViewPlusButtonLongPress");

      if (!v102)
      {
LABEL_24:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "entryViewPlusButtonDefaultBackgroundColor");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKEntryViewPlusButton setPlusButtonBackgroundColor:](v86, "setPlusButtonBackgroundColor:", v111);

        -[CKEntryViewPlusButton accessibilitySetIdentification:](v86, "accessibilitySetIdentification:", CFSTR("Apps Button"));
        -[CKEntryViewPlusButton setExclusiveTouch:](v86, "setExclusiveTouch:", 0);
        -[CKEntryViewPlusButton setBounds:](v86, "setBounds:", *v78, v78[1], v74, v74);
        if (-[CKMessageEntryView shouldShowPluginButtons](v29, "shouldShowPluginButtons"))
        {
          -[CKMessageEntryView setPlusButton:](v29, "setPlusButton:", v86);
          -[CKMessageEntryViewButtonContainerView addSubview:](v270, "addSubview:", v86);
        }

        goto LABEL_27;
      }
      v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v29, sel_plusButtonLongPressed_);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "entryViewPlusButtonLongPressDuration");
      v105 = v104;

      objc_msgSend(v95, "setMinimumPressDuration:", v105);
      -[CKEntryViewPlusButton button](v86, "button");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "addGestureRecognizer:", v95);

      objc_msgSend(MEMORY[0x1E0CEAEA0], "defaultConfiguration");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA998]), "initWithConfiguration:view:", v107, v86);
      plusButtonFeedbackGenerator = v29->_plusButtonFeedbackGenerator;
      v29->_plusButtonFeedbackGenerator = (UISelectionFeedbackGenerator *)v108;

    }
    goto LABEL_24;
  }
LABEL_27:
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v112, "entryViewSupportsBrowserButton");

  if (v113)
  {
    -[__objc2_class entryViewButtonOfType:](v77[47], "entryViewButtonOfType:", 2);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v115, "browserButtonShouldUseMenu");

    objc_msgSend(v114, "button");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v117;
    if (v116)
    {
      -[CKMessageEntryView entryViewTraitCollection](v29, "entryViewTraitCollection");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView conversation](v29, "conversation");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAppMenuDataSource appMenuWithTarget:traitCollection:conversation:](CKAppMenuDataSource, "appMenuWithTarget:traitCollection:conversation:", v29, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "setMenu:", v121);

      v77 = off_1E2733000;
      objc_msgSend(v114, "button");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "setContextMenuIsPrimary:", 1);

      objc_msgSend(v114, "button");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "setContextMenuEnabled:", 1);
    }
    else
    {
      objc_msgSend(v117, "addTarget:action:forEvents:", v29, sel_browserButtonTapped_, 64);
    }

    objc_msgSend(v114, "setOpaque:", 0);
    objc_msgSend(v114, "setAccessibilityIdentifier:", CFSTR("browserButton"));
    objc_msgSend(v114, "setExclusiveTouch:", 0);
    v123 = *v78;
    v124 = v78[1];
    objc_msgSend(v114, "button");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "image");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "size");
    objc_msgSend(v114, "setBounds:", v123, v124, v127, v128);

    if (-[CKMessageEntryView shouldShowPluginButtons](v29, "shouldShowPluginButtons"))
      -[CKMessageEntryViewButtonContainerView addSubview:](v270, "addSubview:", v114);
    -[CKMessageEntryView setBrowserButton:](v29, "setBrowserButton:", v114);

    v62 = v265;
  }
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "addObserver:selector:name:object:", v29, sel_visiblePluginsChanged_, CFSTR("CKBrowserSelectionControllerVisibleSwitcherPluginsChangedNotification"), 0);

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v130, "isEntryViewCollapsable");

  if (v131)
  {
    -[__objc2_class entryViewButtonOfType:](v77[47], "entryViewButtonOfType:", 1);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "button");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "addTarget:action:forEvents:", v29, sel_arrowButtonTapped_, 64);

    objc_msgSend(v132, "setOpaque:", 0);
    objc_msgSend(v132, "setAccessibilityIdentifier:", CFSTR("arrowExpandButton"));
    objc_msgSend(v132, "setExclusiveTouch:", 0);
    objc_msgSend(v132, "setBounds:", *v78, v78[1], 24.0, 24.0);
    objc_msgSend(v132, "setCkTintColor:", 0xFFFFFFFFLL);
    if (-[CKMessageEntryView shouldShowPluginButtons](v29, "shouldShowPluginButtons"))
    {
      -[CKMessageEntryView buttonAndTextAreaContainerView](v29, "buttonAndTextAreaContainerView");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "addSubview:", v132);

    }
    -[CKMessageEntryView setArrowButton:](v29, "setArrowButton:", v132);
    v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA30]), "initWithTarget:action:", v29, sel_collapseGestureRecognized);
    objc_msgSend(v135, "setDirection:", 1);
    objc_msgSend(v135, "setDelegate:", v29);
    objc_msgSend(v132, "addGestureRecognizer:", v135);

  }
  v136 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v137 = *MEMORY[0x1E0C9D648];
  v138 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v139 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v140 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v141 = (void *)objc_msgSend(v136, "initWithFrame:", *MEMORY[0x1E0C9D648], v138, v139, v140);
  objc_msgSend(v141, "setOpaque:", 0);
  objc_msgSend(v141, "setClipsToBounds:", 1);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "entryViewCoverMinHeight");
  v144 = v143 * 0.5;
  objc_msgSend(v141, "_setContinuousCornerRadius:", v143 * 0.5);
  v266 = v142;
  objc_msgSend(v142, "entryFieldCoverLineWidth");
  v146 = v145;
  objc_msgSend(v141, "layer");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setBorderWidth:", v146);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = objc_msgSend(v148, "isDashedBalloonsEnabled");

  if (v149)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "theme");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "entryFieldBorderColor");
    v153 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v150, "setStrokeColor:", objc_msgSend(v153, "CGColor"));

    objc_msgSend(v150, "setFillColor:", 0);
    objc_msgSend(v150, "setLineJoin:", *MEMORY[0x1E0CD3030]);
    objc_msgSend(v150, "setLineCap:", *MEMORY[0x1E0CD3010]);
    objc_msgSend(v266, "entryViewDashedLinePattern");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setLineDashPattern:", v154);

    objc_msgSend(v150, "setLineWidth:", 0.0);
    objc_msgSend(v150, "setCornerRadius:", v144);
    objc_msgSend(v150, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(v150, "setAllowsEdgeAntialiasing:", 1);
    objc_msgSend(v141, "layer");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "addSublayer:", v150);

    -[CKMessageEntryView setDashedContentClipViewLayer:](v29, "setDashedContentClipViewLayer:", v150);
  }
  objc_msgSend(v141, "layer");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setAnchorPoint:", 1.0, 0.5);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "theme");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "entryViewContentBackgroundColor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "setBackgroundColor:", v159);

  -[CKMessageEntryView setContentClipView:](v29, "setContentClipView:", v141);
  -[CKMessageEntryView buttonAndTextAreaContainerView](v29, "buttonAndTextAreaContainerView");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "addSubview:", v141);

  -[CKMessageEntryView updateKnockoutView](v29, "updateKnockoutView");
  v161 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA30]), "initWithTarget:action:", v29, sel_expandGestureRecongnized);
  objc_msgSend(v161, "setDirection:", 2);
  v259 = v161;
  objc_msgSend(v141, "addGestureRecognizer:", v161);
  v162 = -[CKMessageEntryContentView initWithFrame:shouldShowSubject:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:]([CKMessageEntryContentView alloc], "initWithFrame:shouldShowSubject:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:", v16, a11, a12, a13, a14, v137, v138, v139, v140);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "entryFieldCoverLineWidth");
  v165 = v164;

  -[CKMessageEntryContentView setContainerViewLineWidth:](v162, "setContainerViewLineWidth:", v165);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "sendButtonSize");
  v168 = v167;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "entryViewSendButtonCoverSpace");
  -[CKMessageEntryContentView setSendButtonTextInsetWidth:](v162, "setSendButtonTextInsetWidth:", v168 + v170);

  -[CKMessageEntryContentView setOpaque:](v162, "setOpaque:", 0);
  -[CKMessageEntryContentView setDelegate:](v162, "setDelegate:", v29);
  -[CKMessageEntryView setContentView:](v29, "setContentView:", v162);
  objc_msgSend(v141, "addSubview:", v162);
  -[CKMessageEntryView coverFrameThatFitsInSize:](v29, "coverFrameThatFitsInSize:", v62, v267);
  v271 = v162;
  -[CKMessageEntryContentView setMaxContentWidthWhenExpanded:](v162, "setMaxContentWidthWhenExpanded:", v171);
  v172 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v137, v138, v139, v140);
  objc_msgSend(v172, "setAlpha:", 0.5);
  objc_msgSend(v172, "setUserInteractionEnabled:", 1);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "balloonTextFont");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "setFont:", v174);

  -[CKMessageEntryView setCollpasedPlaceholderLabel:](v29, "setCollpasedPlaceholderLabel:", v172);
  objc_msgSend(v141, "addSubview:", v172);
  v268 = v172;
  v261 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v29, sel_collapsedPlaceholderLabelTapped_);
  objc_msgSend(v172, "addGestureRecognizer:");
  -[CKMessageEntryView recorder](v29, "recorder");
  v175 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v175)
  {
    v176 = objc_alloc_init(CKAudioRecorder);
    -[CKAudioRecorder setDelegate:](v176, "setDelegate:", v29);
    -[CKMessageEntryView setRecorder:](v29, "setRecorder:", v176);

  }
  -[CKMessageEntryView configureForDisplayMode:](v29, "configureForDisplayMode:", 1);
  if (-[CKMessageEntryView shouldShowCharacterCount](v29, "shouldShowCharacterCount"))
  {
    v177 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v137, v138, v139, v140);
    v178 = v177;
    if (v273)
      v179 = 1;
    else
      v179 = 2;
    objc_msgSend(v177, "setTextAlignment:", v179);
    -[CKMessageEntryView conversation](v29, "conversation");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = objc_msgSend(v180, "isStewieConversation");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = v182;
    if (v181)
      objc_msgSend(v182, "characterCountSatelliteFont");
    else
      objc_msgSend(v182, "characterCountFont");
    v184 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v178, "setFont:", v184);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "theme");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "entryFieldPlaceholderColor");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setTextColor:", v187);

    objc_msgSend(v178, "setBackgroundColor:", 0);
    objc_msgSend(v178, "setOpaque:", 0);
    objc_msgSend(v178, "setHidden:", 1);
    -[CKMessageEntryView setCharacterCountLabel:](v29, "setCharacterCountLabel:", v178);
    -[CKMessageEntryView buttonAndTextAreaContainerView](v29, "buttonAndTextAreaContainerView");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "addSubview:", v178);

    sMaximumCharacterCountString(v256);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setText:", v189);

    objc_msgSend(v178, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[CKMessageEntryView setCharacterCountSize:](v29, "setCharacterCountSize:");
    objc_msgSend(v178, "setText:", 0);
    -[CKMessageEntryView setCharacterCountHidden:](v29, "setCharacterCountHidden:", 1);

  }
  if (-[CKMessageEntryView shouldShowSendButton](v29, "shouldShowSendButton")
    && !CKIsRunningInMacCatalyst())
  {
    +[CKEntryViewButton entryViewButtonOfType:wantsVibrancy:](CKEntryViewButton, "entryViewButtonOfType:wantsVibrancy:", 4, 0);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "setOpaque:", 0);
    objc_msgSend(v190, "setEnabled:", 0);
    objc_msgSend(v190, "button");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "addTarget:action:forControlEvents:", v29, sel_touchUpInsideSendButton_, 64);

    objc_msgSend(v190, "button");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "setDisabledDimsImage:", 1);

    objc_msgSend(v190, "accessibilitySetIdentification:", CFSTR("sendButton"));
    objc_msgSend(v190, "setExclusiveTouch:", 1);
    objc_msgSend(v190, "layer");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "setAnchorPoint:", 1.0, 1.0);

    -[CKMessageEntryView setSendButton:](v29, "setSendButton:", v190);
    -[CKMessageEntryView contentClipView](v29, "contentClipView");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "addSubview:", v190);

    +[CKEntryViewButton entryViewButtonOfType:wantsVibrancy:](CKEntryViewButton, "entryViewButtonOfType:wantsVibrancy:", 5, 0);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "setOpaque:", 0);
    objc_msgSend(v195, "accessibilitySetIdentification:", CFSTR("audioButton"));
    objc_msgSend(v195, "setExclusiveTouch:", 1);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = objc_msgSend(v196, "isAudioMessagesEntryViewRecordingEnabled");

    if (v197)
    {
      v198 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v29, sel_audioButtonLongPressed_);
      objc_msgSend(v198, "setMinimumPressDuration:", 0.0);
      objc_msgSend(v195, "button");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "addGestureRecognizer:", v198);

    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "setCkTintColor:", objc_msgSend(v198, "entryViewButtonDefaultColor"));
    }

    -[CKMessageEntryView setAudioButton:](v29, "setAudioButton:", v195);
    -[CKMessageEntryView contentClipView](v29, "contentClipView");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "addSubview:", v195);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "sendButtonSize");
    v203 = v202;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "sendButtonSize");
    v206 = v205;

    -[CKMessageEntryView setSendButtonSize:](v29, "setSendButtonSize:", v203, v206);
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v208 = objc_msgSend(v207, "isAudioMessagesEntryViewRecordingEnabled");

  if (v208)
  {
    v209 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v137, v138, v139, v140);
    objc_msgSend(v209, "setNumberOfLines:", 0);
    CKFrameworkBundle();
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v210, "localizedStringForKey:value:table:", CFSTR("AUDIO_HINT_TAP"), &stru_1E276D870, CFSTR("ChatKit"));
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "setText:", v211);

    objc_msgSend(v209, "setHidden:", 1);
    objc_msgSend(v209, "setTextAlignment:", 1);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "audioHintFont");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "setFont:", v213);

    objc_msgSend(v209, "setAdjustsFontSizeToFitWidth:", 1);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "theme");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v215, "transcriptTextColor");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "setTextColor:", v216);

    objc_msgSend(v209, "setOpaque:", 0);
    -[CKMessageEntryView setAudioHintLabel:](v29, "setAudioHintLabel:", v209);
    -[CKMessageEntryView contentClipView](v29, "contentClipView");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v217, "addSubview:", v209);

  }
  -[CKMessageEntryView createDictationButton](v29, "createDictationButton");
  v218 = objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView setDictationButton:](v29, "setDictationButton:", v218);
  -[CKMessageEntryView contentClipView](v29, "contentClipView");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v257 = (void *)v218;
  objc_msgSend(v219, "addSubview:", v218);

  v220 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  -[CKMessageEntryView setSendButtonSpinner:](v29, "setSendButtonSpinner:", v220);

  -[CKMessageEntryView sendButtonSpinner](v29, "sendButtonSpinner");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "setUserInteractionEnabled:", 1);

  -[CKMessageEntryView sendButtonSpinner](v29, "sendButtonSpinner");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "setOpaque:", 0);

  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "entryViewMacEmojiButtonImage");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "setImage:forState:", v225, 0);

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 3, 3, 16.0);
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "setPreferredSymbolConfiguration:forImageInState:", v226, 0);

    objc_msgSend(v223, "addTarget:action:forControlEvents:", v29, sel_showEmojiPicker, 64);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v227, "theme");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "entryFieldButtonColor");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "setTintColor:", v229);

    objc_msgSend(v223, "setAdjustsImageWhenHighlighted:", 1);
    -[CKMessageEntryView setEmojiButton:](v29, "setEmojiButton:", v223);
    -[CKMessageEntryView buttonAndTextAreaContainerView](v29, "buttonAndTextAreaContainerView");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView emojiButton](v29, "emojiButton");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v230, "addSubview:", v231);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v231) = objc_msgSend(v232, "isAudioMessagesEntryViewRecordingEnabled");

    +[CKEntryViewButton entryViewButtonOfType:wantsVibrancy:](CKEntryViewButton, "entryViewButtonOfType:wantsVibrancy:", 5, v231 ^ 1);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v233, "setOpaque:", 0);
    objc_msgSend(v233, "accessibilitySetIdentification:", CFSTR("audioButton"));
    objc_msgSend(v233, "setExclusiveTouch:", 1);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v229) = objc_msgSend(v234, "isAudioMessagesEntryViewRecordingEnabled");

    objc_msgSend(v233, "button");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    v236 = v235;
    v237 = v272;
    if ((_DWORD)v229)
    {
      objc_msgSend(v235, "addTarget:action:forControlEvents:", v29, sel_audioButtonTappedInEntryView_, 64);

      objc_msgSend(v233, "setCkTintColor:", 0xFFFFFFFFLL);
    }
    else
    {
      objc_msgSend(v235, "addTarget:action:forControlEvents:", v29, sel_audioButtonTapped_, 64);

      objc_msgSend(v233, "setCkTintColor:", 0xFFFFFFFFLL);
      +[CKEntryViewButton entryViewButtonOfType:wantsVibrancy:](CKEntryViewButton, "entryViewButtonOfType:wantsVibrancy:", 7, 0);
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "button");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "setImageEdgeInsets:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));

      objc_msgSend(v238, "button");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "addTarget:action:forControlEvents:", v29, sel_stopButtonTapped_, 64);

      objc_msgSend(v238, "setCkTintColor:", 3);
      -[CKMessageEntryView setStopButton:](v29, "setStopButton:", v238);

    }
    -[CKMessageEntryView setAudioButton:](v29, "setAudioButton:", v233);
    -[CKMessageEntryView contentClipView](v29, "contentClipView");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v241, "addSubview:", v233);

    -[CKMessageEntryView contentView](v29, "contentView");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView sendButtonSpinner](v29, "sendButtonSpinner");
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v242, "addSubview:", v243);

  }
  else
  {
    -[CKMessageEntryView buttonAndTextAreaContainerView](v29, "buttonAndTextAreaContainerView");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView sendButtonSpinner](v29, "sendButtonSpinner");
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "addSubview:", v233);
    v237 = v272;
  }

  v244 = (void *)MEMORY[0x1E0CEA6B8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), 3);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "keyCommandWithInput:modifierFlags:action:", v245, 0, sel_keyCommandSend_);
  v246 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v246, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_keyCommandSend_);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x10000, sel_keyCommandSend_);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB7D0], 0x80000, sel_optionUpArrowClicked_);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v249, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB728], 0x80000, sel_optionDownArrowClicked_);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "setWantsPriorityOverSystemBehavior:", 1);
  v275[0] = v246;
  v275[1] = v247;
  v275[2] = v248;
  v275[3] = v249;
  v275[4] = v250;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v275, 5);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView setKeyCommands:](v29, "setKeyCommands:", v251);
  -[CKMessageEntryView setEntryViewTraitCollection:](v29, "setEntryViewTraitCollection:", v237);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v253 = objc_msgSend(v252, "isAccessibilityPreferredContentSizeCategory");

  if (v253)
    -[CKMessageEntryView setEntryFieldCollapsed:animated:](v29, "setEntryFieldCollapsed:animated:", 0, 0);
  v254 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA30]), "initWithTarget:action:", v29, sel__swipeDownGestureRecognized_);
  objc_msgSend(v254, "setDelegate:", v29);
  objc_msgSend(v254, "setDirection:", 8);
  -[CKMessageEntryView addGestureRecognizer:](v29, "addGestureRecognizer:", v254);
  -[CKMessageEntryView setSwipeGestureRecognizer:](v29, "setSwipeGestureRecognizer:", v254);

  v28 = v272;
LABEL_69:

  return v29;
}

- (id)createDictationButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  +[CKEntryViewButton entryViewButtonOfType:wantsVibrancy:](CKEntryViewButton, "entryViewButtonOfType:wantsVibrancy:", 8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCkTintColor:", 0xFFFFFFFFLL);
  objc_msgSend(v3, "setEnabled:", 1);
  objc_msgSend(v3, "setOpaque:", 0);
  objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("dictationButton"));
  objc_msgSend(v3, "button");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "addTarget:action:forControlEvents:", self, sel_dictationButtonTapped_, 64);

  objc_msgSend(v3, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisabledDimsImage:", 1);

  objc_msgSend(v3, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v3, "button");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setIsMicButton:", 1);

  }
  return v3;
}

- (void)optionUpArrowClicked:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageEntryViewPopulatePreviousSentMessage:", self);

  }
}

- (void)optionDownArrowClicked:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageEntryViewPopulateNextSentMessage:", self);

  }
}

- (void)showEffectPicker
{
  void *v3;
  char v4;
  id v5;

  -[CKMessageEntryView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageEntryViewWantsEffectPicker:", self);

  }
}

- (void)handleLongPress:(id)a3
{
  if (objc_msgSend(a3, "state") == 1 && !-[CKMessageEntryView hasRecording](self, "hasRecording"))
    -[CKMessageEntryView showEffectPicker](self, "showEffectPicker");
}

- (void)deferredSetup
{
  objc_msgSend(MEMORY[0x1E0CEA6C8], "setPredictionViewPrewarmsPredictiveCandidates:", CKShowAppStripInEntryView());
}

- (void)updateKnockoutView
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  UIVisualEffectView *v14;
  UIVisualEffectView *knockoutVisualEffectView;
  UIVisualEffectView *v16;
  UIVisualEffectView *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "entryViewBackgroundShouldUseVariableBlur");

  -[CKMessageEntryView knockoutView](self, "knockoutView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
LABEL_3:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "theme");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageEntryViewTextFieldBackgroundColor");
      v25 = (id)objc_claimAutoreleasedReturnValue();

      -[CKMessageEntryView entryViewTraitCollection](self, "entryViewTraitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "resolvedColorForTraitCollection:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIVisualEffectView setBackgroundColor:](self->_knockoutVisualEffectView, "setBackgroundColor:", v9);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "theme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageEntryViewTextFieldBackgroundEffects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setBackgroundEffects:](self->_knockoutVisualEffectView, "setBackgroundEffects:", v12);

      goto LABEL_15;
    }
  }
  else
  {
    if (v4)
    {
      v13 = objc_alloc(MEMORY[0x1E0CEABE8]);
      -[CKMessageEntryView bounds](self, "bounds");
      v14 = (UIVisualEffectView *)objc_msgSend(v13, "initWithFrame:");
      knockoutVisualEffectView = self->_knockoutVisualEffectView;
      self->_knockoutVisualEffectView = v14;

      v16 = self->_knockoutVisualEffectView;
    }
    else
    {
      v16 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    }
    v17 = v16;
    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertSubview:atIndex:", v17, 0);

    -[CKMessageEntryView setKnockoutView:](self, "setKnockoutView:", v17);
    if (v4)
      goto LABEL_3;
  }
  if (UIAccessibilityIsReduceTransparencyEnabled()
    || (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "knockoutViewShouldUseBackgroundColor"),
        v19,
        (v20 & 1) == 0))
  {
    -[CKMessageEntryView knockoutView](self, "knockoutView");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", 0);
  }
  else
  {
    if (CKMessageEntryViewStyleIsForDarkFullscreenMoment(-[CKMessageEntryView style](self, "style")))
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView entryViewTraitCollection](self, "entryViewTraitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "resolvedColorForTraitCollection:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "colorWithAlphaComponent:", 0.300000012);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    -[CKMessageEntryView knockoutView](self, "knockoutView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBackgroundColor:", v25);

  }
LABEL_15:

}

- (void)updateBackgroundView
{
  void *v3;
  int v4;
  void *v5;
  objc_class *v6;
  CKMessageEntryBackgroundViewProtocol *v7;
  CKMessageEntryBackgroundViewProtocol *backgroundView;
  void *v9;
  void *v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "entryFieldShouldUseBackdropView");

  if (v4)
  {
    if (!self->_backgroundView)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_msgSend(v5, "entryViewBackgroundClass");

      v7 = (CKMessageEntryBackgroundViewProtocol *)objc_alloc_init(v6);
      backgroundView = self->_backgroundView;
      self->_backgroundView = v7;

      -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", self->_backgroundView);

    }
    -[CKMessageEntryView entryViewTraitCollection](self, "entryViewTraitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryBackgroundViewProtocol setEntryViewTraitCollection:](self->_backgroundView, "setEntryViewTraitCollection:", v10);

    -[CKMessageEntryBackgroundViewProtocol setStyle:](self->_backgroundView, "setStyle:", -[CKMessageEntryView style](self, "style"));
  }
}

- (BOOL)shouldReloadBackgroundView
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[CKMessageEntryView backgroundView](self, "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "entryViewBackgroundClass");

  return v3 != v5;
}

- (void)setShouldHideBackgroundView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKMessageEntryView backgroundView](self, "backgroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)shouldHideBackgroundView
{
  void *v2;
  char v3;

  -[CKMessageEntryView backgroundView](self, "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setStyle:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (self->_style == 6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Message entry view doesn't support transitioning from CKMessageEntryViewStyleNotificationDarkTransparent", buf, 2u);
    }

  }
  self->_style = a3;
  -[CKMessageEntryView _overrideUserInterfaceStyleForEntryViewStyleIfNeeded:](self, "_overrideUserInterfaceStyleForEntryViewStyleIfNeeded:", a3);
  -[CKMessageEntryView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStyle:", self->_style);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v51 = a3;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Returned from -[CKMessageEntryContentView setStyle:]. style={%d}", buf, 8u);
    }

  }
  v8 = CKMessageEntryViewStyleIsForDarkFullscreenMoment(-[CKMessageEntryView style](self, "style"));
  -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "theme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    objc_msgSend(v11, "entryFieldDarkEffectButtonColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v13);

    -[CKMessageEntryView appStrip](self, "appStrip");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appStripLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShouldDimPluginCells:", 1);

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[CKMessageEntryView appStrip](self, "appStrip");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appStripCollectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "visibleCells");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v45 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "browserImage");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "layer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "theme");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "browserAppStripDimmedPluginCellOpacity");
          *(float *)&v26 = v26;
          objc_msgSend(v23, "setOpacity:", v26);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v19);
    }
  }
  else
  {
    objc_msgSend(v11, "entryFieldButtonColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v27);

    -[CKMessageEntryView appStrip](self, "appStrip");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "appStripLayout");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setShouldDimPluginCells:", 0);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[CKMessageEntryView appStrip](self, "appStrip", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "appStripCollectionView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "visibleCells");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v41 != v33)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "browserImage");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "layer");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "theme");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "browserAppStripLightPluginCellOpacity");
          *(float *)&v39 = v39;
          objc_msgSend(v36, "setOpacity:", v39);

        }
        v32 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v32);
    }
  }

  -[CKMessageEntryView updateEntryView](self, "updateEntryView");
}

- (void)_overrideUserInterfaceStyleForEntryViewStyleIfNeeded:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[CKMessageEntryView entryViewTraitCollection](self, "entryViewTraitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Call to _overrideUserInterfaceStyleForEntryViewStyleIfNeeded. entryViewTraitCollection: {%@}", (uint8_t *)&v15, 0xCu);

    }
  }
  -[CKMessageEntryView entryViewTraitCollection](self, "entryViewTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceStyle");

  v10 = 2;
  if (((0x27u >> (a3 - 1)) & 1) == 0)
    v10 = v9;
  if ((unint64_t)(a3 - 1) >= 6)
    v11 = v9;
  else
    v11 = v10;
  -[CKMessageEntryView _setOverrideUserInterfaceStyle:](self, "_setOverrideUserInterfaceStyle:", v11);
  -[CKMessageEntryView appStripBackgroundBlurView](self, "appStripBackgroundBlurView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v11 == 1)
      v13 = 3901;
    else
      v13 = 2030;
    -[CKMessageEntryView appStripBackgroundBlurView](self, "appStripBackgroundBlurView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transitionToStyle:", v13);

  }
  -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setConversation:(id)a3
{
  CKConversation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  CKConversation *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (CKConversation *)a3;
  if (self->_conversation != v5)
  {
    objc_storeStrong((id *)&self->_conversation, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("CKConversationPreferredServiceChangedNotification"), 0);
    v7 = *MEMORY[0x1E0D353F8];
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0D353F8], 0);
    v8 = *MEMORY[0x1E0D352D8];
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0D352D8], 0);
    v9 = *MEMORY[0x1E0D35500];
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0D35500], 0);
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBD58], 0);
    if (v5)
    {
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_conversationPreferredServiceChanged_, CFSTR("CKConversationPreferredServiceChangedNotification"), v5);
      -[CKConversation chat](v5, "chat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_messageReceived_, v7, v10);

      -[CKConversation chat](v5, "chat");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__contactLimitsChanged_, v8, v11);

      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_updateEntryView, v9, 0);
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_updateEntryView, *MEMORY[0x1E0D39288], 0);
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_interruptAudioRecorder_, *MEMORY[0x1E0C896F0], 0);
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v12, "isCarrierPigeonEnabled");

      if ((_DWORD)v11)
        objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_updateEntryView, *MEMORY[0x1E0D354D0], 0);
      if (!IMOSLoggingEnabled())
        goto LABEL_13;
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v5;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Conversation was provided: %@. Added core observers.", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_13:
        -[CKMessageEntryView updateEntryView](self, "updateEntryView");
        -[CKMessageEntryView updateAppsMenu](self, "updateAppsMenu");
        -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sendButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setEnabled:", -[CKMessageEntryView sendButtonEnabled](self, "sendButtonEnabled"));

        -[CKMessageEntryView configureTextViewWithInputContextHistoryFromTranscript](self, "configureTextViewWithInputContextHistoryFromTranscript");
        goto LABEL_14;
      }
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Conversation was nil. Did not add core observers.", (uint8_t *)&v16, 2u);
      }
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (void)invalidateCompositionForReason:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  CKComposition *v7;
  void *v8;
  void *v9;
  CKComposition *v10;
  void *v11;
  void *v12;
  CKComposition *v13;
  void *v14;
  void *v15;
  int v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v16 = 134217984;
      v17 = a3;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "invalidating composition for reason: %ld", (uint8_t *)&v16, 0xCu);
    }

  }
  switch(a3)
  {
    case 2:
      -[CKMessageEntryView composition](self, "composition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = [CKComposition alloc];
      objc_msgSend(v6, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CKComposition initWithText:subject:shelfPluginPayload:](v7, "initWithText:subject:shelfPluginPayload:", v8, v9, 0);

      objc_msgSend(v6, "sendLaterPluginInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposition setSendLaterPluginInfo:](v10, "setSendLaterPluginInfo:", v11);

      -[CKMessageEntryView setComposition:](self, "setComposition:", v10);
      break;
    case 1:
      -[CKMessageEntryView composition](self, "composition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", 0, 0);
      objc_msgSend(v12, "sendLaterPluginInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposition setSendLaterPluginInfo:](v13, "setSendLaterPluginInfo:", v14);

      -[CKMessageEntryView setComposition:](self, "setComposition:", v13);
      -[CKMessageEntryView contentView](self, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hideTextEffectsPickerIfNeededAndResetTypingAttributes");

      break;
    case 0:
      -[CKMessageEntryView setComposition:](self, "setComposition:", 0);
      break;
  }
}

- (void)setComposition:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isAudioComposition") & 1) != 0)
  {
    -[CKMessageEntryView setAudioComposition:](self, "setAudioComposition:", v5);
  }
  else
  {
    -[CKMessageEntryView setAudioComposition:](self, "setAudioComposition:", 0);
    -[CKMessageEntryView contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setComposition:", v5);

  }
}

- (CKComposition)composition
{
  void *v3;
  void *v4;

  -[CKMessageEntryView audioComposition](self, "audioComposition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CKMessageEntryView contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (CKComposition *)v3;
}

- (void)compositionWithAcceptedAutocorrection:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  void (**v12)(id, void *);

  v4 = (void (**)(id, void *))a3;
  -[CKMessageEntryView composition](self, "composition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAudioComposition");

  if (v6)
  {
    if (v4)
    {
      -[CKMessageEntryView composition](self, "composition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7);

    }
  }
  else
  {
    -[CKMessageEntryView contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView conversation](self, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__CKMessageEntryView_compositionWithAcceptedAutocorrection___block_invoke;
    v11[3] = &unk_1E274C780;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v8, "acceptAutocorrectionForChat:completionHandler:", v10, v11);

  }
}

void __60__CKMessageEntryView_compositionWithAcceptedAutocorrection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acceptAutomaticMentionConfirmation");

  objc_msgSend(*(id *)(a1 + 32), "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v6 = v4;
    (*(void (**)(void))(v5 + 16))();
    v4 = v6;
  }

}

- (CKSendLaterPluginInfo)sendLaterPluginInfo
{
  void *v2;
  void *v3;

  -[CKMessageEntryView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendLaterPluginInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKSendLaterPluginInfo *)v3;
}

- (void)setSendLaterPluginInfo:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[5];

  v4 = a4;
  v6 = a3;
  -[CKMessageEntryView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CKMessageEntryView_setSendLaterPluginInfo_animated___block_invoke;
  v8[3] = &unk_1E274A208;
  v8[4] = self;
  objc_msgSend(v7, "setSendLaterPluginInfo:animated:completionHandler:", v6, v4, v8);

}

uint64_t __54__CKMessageEntryView_setSendLaterPluginInfo_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateEntryView");
}

- (void)setCharacterCountHidden:(BOOL)a3
{
  if (self->_characterCountHidden != a3)
  {
    self->_characterCountHidden = a3;
    if (-[CKMessageEntryView shouldShowCharacterCount](self, "shouldShowCharacterCount"))
      -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isInPencilMode
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  -[CKMessageEntryView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isInPencilMode") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "subjectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isInPencilMode");

  }
  return v4;
}

- (BOOL)isRecording
{
  void *v2;
  char v3;

  -[CKMessageEntryView recorder](self, "recorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRecording");

  return v3;
}

- (BOOL)hasRecording
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAudioMessagesEntryViewRecordingEnabled");

  if (!v4)
    return -[CKMessageEntryView displayMode](self, "displayMode") == 3;
  -[CKMessageEntryView audioComposition](self, "audioComposition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (BOOL)layoutIsCurrentlyCompact
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  BOOL v8;

  -[CKMessageEntryView contentClipView](self, "contentClipView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[CKMessageEntryView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v5 < v7;

  return v8;
}

- (BOOL)shouldEntryViewBeExpandedLayout
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  double Width;
  char v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEntryViewCollapsable");

  if (!v4)
    return 1;
  if (-[CKMessageEntryView entryFieldCollapsed](self, "entryFieldCollapsed"))
    return 0;
  -[CKMessageEntryView composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shelfPluginPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return 1;
  -[CKMessageEntryView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "frame");
  Width = CGRectGetWidth(v30);
  v12 = objc_msgSend(v10, "isInPencilMode");
  v13 = objc_msgSend(v10, "isPencilWriting");
  objc_msgSend(v10, "attributedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v12 ^ 1 | v13;
  if ((v16 & 1) == 0)
  {
    __53__CKMessageEntryView_shouldEntryViewBeExpandedLayout__block_invoke((uint64_t)v14, v14, v10);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }
  objc_msgSend(v15, "size");
  v19 = v18;
  if (-[CKMessageEntryView layoutIsCurrentlyCompact](self, "layoutIsCurrentlyCompact"))
    v20 = 0.8;
  else
    v20 = 0.45;
  if (v19 <= Width * v20)
  {
    if (-[CKMessageEntryView shouldShowSubject](self, "shouldShowSubject"))
    {
      -[CKMessageEntryView contentView](self, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "subjectView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "frame");
      v23 = CGRectGetWidth(v31);
      objc_msgSend(v22, "attributedText");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if ((v16 & 1) == 0)
      {
        __53__CKMessageEntryView_shouldEntryViewBeExpandedLayout__block_invoke((uint64_t)v24, v24, v22);
        v26 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v26;
      }
      objc_msgSend(v25, "size");
      v28 = v27;
      if (-[CKMessageEntryView layoutIsCurrentlyCompact](self, "layoutIsCurrentlyCompact"))
        v29 = 0.8;
      else
        v29 = 0.45;
      v5 = v28 > v23 * v29;

    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

id __53__CKMessageEntryView_shouldEntryViewBeExpandedLayout__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a2;
  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__49;
  v21 = __Block_byref_object_dispose__49;
  v22 = 0;
  v6 = objc_msgSend(v4, "length");
  v7 = *MEMORY[0x1E0DC10F8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__CKMessageEntryView_shouldEntryViewBeExpandedLayout__block_invoke_276;
  v13[3] = &unk_1E2756CA0;
  v8 = v5;
  v14 = v8;
  v16 = &v17;
  v9 = v4;
  v15 = v9;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0, v13);
  v10 = (void *)v18[5];
  if (!v10)
    v10 = v9;
  v11 = v10;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __53__CKMessageEntryView_shouldEntryViewBeExpandedLayout__block_invoke_276(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  if ((objc_msgSend(*(id *)(a1 + 32), "_isSystemAttachment:", a2) & 1) == 0)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v11);

  }
}

- (void)setEntryFieldCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];

  v4 = a4;
  v5 = a3;
  if (a3
    && (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEntryViewCollapsable"),
        v7,
        (v8 & 1) == 0))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Entry view was asked to collapse when it isn't allowed by UIBehavior.", v14, 2u);
      }

    }
  }
  else
  {
    -[CKMessageEntryView entryFieldCollapsedUpdater](self, "entryFieldCollapsedUpdater");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isHoldingUpdates");

    if ((v10 & 1) == 0)
    {
      -[CKMessageEntryView setEntryFieldUpdaterCollapsedValue:](self, "setEntryFieldUpdaterCollapsedValue:", v5);
      -[CKMessageEntryView setEntryFieldUpdaterAnimatedValue:](self, "setEntryFieldUpdaterAnimatedValue:", v4);
      -[CKMessageEntryView entryFieldCollapsedUpdater](self, "entryFieldCollapsedUpdater");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNeedsUpdate");

      -[CKMessageEntryView audioComposition](self, "audioComposition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

      }
      else if (!-[CKMessageEntryView isRecording](self, "isRecording"))
      {
        -[CKMessageEntryView configureForDisplayMode:](self, "configureForDisplayMode:", 1);
      }
    }
  }
}

- (id)_currentInputDelegate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKMessageEntryView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEntryView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "textViewOnscreenWithEntryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isFirstResponder"))
    {
      v7 = v6;

      v4 = v7;
    }

  }
  return v4;
}

- (BOOL)shouldShowAppStrip
{
  return self->_showAppStrip;
}

- (void)setShouldBlurForMessageEditing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_shouldBlurForMessageEditing != a3)
  {
    self->_shouldBlurForMessageEditing = a3;
    if (a3)
    {
      -[CKMessageEntryView _animateMessageEditingBlurOverlayViewIn](self, "_animateMessageEditingBlurOverlayViewIn");
      -[CKMessageEntryView setShowAppStrip:animated:completion:](self, "setShowAppStrip:animated:completion:", 0, 0, 0);
      -[CKMessageEntryView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
      -[CKMessageEntryView audioButton](self, "audioButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "button");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setUserInteractionEnabled:", 0);

      -[CKMessageEntryView sendButton](self, "sendButton");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "button");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 0;
    }
    else
    {
      -[CKMessageEntryView _animateMessageEditingBlurOverlayViewOut](self, "_animateMessageEditingBlurOverlayViewOut");
      -[CKMessageEntryView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
      -[CKMessageEntryView audioButton](self, "audioButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "button");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setUserInteractionEnabled:", 1);

      -[CKMessageEntryView sendButton](self, "sendButton");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "button");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 1;
    }
    objc_msgSend(v6, "setUserInteractionEnabled:", v8);

  }
}

- (void)_animateMessageEditingBlurOverlayViewIn
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _QWORD aBlock[5];

  -[CKMessageEntryView messageEditingBlurOverlayView](self, "messageEditingBlurOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEditingAnimateInDuration");
  v6 = v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageEditingAnimateInDamping");
  v9 = v8;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CKMessageEntryView__animateMessageEditingBlurOverlayViewIn__block_invoke;
  aBlock[3] = &unk_1E274A208;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v10, &__block_literal_global_281_1, v6, 0.0, v9, 0.0);

}

void __61__CKMessageEntryView__animateMessageEditingBlurOverlayViewIn__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageEditingTranscriptOverlayBackgroundEffects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "messageEditingBlurOverlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundEffects:", v4);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEditingTranscriptOverlayBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "messageEditingBlurOverlayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

}

- (void)_animateMessageEditingBlurOverlayViewOut
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD aBlock[5];

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageEditingAnimateOutDuration");
  v5 = v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEditingAnimateOutDamping");
  v8 = v7;

  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__CKMessageEntryView__animateMessageEditingBlurOverlayViewOut__block_invoke;
  aBlock[3] = &unk_1E274A208;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __62__CKMessageEntryView__animateMessageEditingBlurOverlayViewOut__block_invoke_2;
  v12[3] = &unk_1E274A1B8;
  v12[4] = self;
  v11 = _Block_copy(v12);
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v10, v11, v5, 0.0, v8, 0.0);

}

void __62__CKMessageEntryView__animateMessageEditingBlurOverlayViewOut__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "messageEditingBlurOverlayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);

  objc_msgSend(*(id *)(a1 + 32), "messageEditingBlurOverlayView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

}

void __62__CKMessageEntryView__animateMessageEditingBlurOverlayViewOut__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "messageEditingBlurOverlayView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (void)setShowAppStrip:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void (**v8)(id, _QWORD);
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _BOOL8 v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  CKMessageEntryView *v33;
  void (**v34)(id, _QWORD);
  uint8_t buf[16];

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  if (-[CKMessageEntryView _isRunningInMVS](self, "_isRunningInMVS"))
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSendMenuEnabled");

  if (v10)
    goto LABEL_3;
  if (v6 && !CKShowAppStripInEntryView())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Asked to show the app strip but the user preference is to hide it", buf, 2u);
      }

    }
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "stewieEnabled");

  if (v12)
  {
    -[CKMessageEntryView conversation](self, "conversation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isStewieConversation");

    if (v14)
    {
LABEL_3:
      if (v8)
        v8[2](v8, 0);
      goto LABEL_29;
    }
  }
  -[CKMessageEntryView _currentInputDelegate](self, "_currentInputDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_showAppStrip != v6
    || (-[CKMessageEntryView lastConfiguredInputDelegate](self, "lastConfiguredInputDelegate"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v16 != v15))
  {
    self->_showAppStrip = v6;
    -[CKMessageEntryView setLastConfiguredInputDelegate:](self, "setLastConfiguredInputDelegate:", v15);
    if (v6 && !self->_appStrip)
    {
      -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
      -[CKMessageEntryView layoutIfNeeded](self, "layoutIfNeeded");
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isAppStripInKeyboard");

    if ((v18 & 1) != 0)
    {
      if (v6)
      {
        objc_msgSend(v15, "setHidePrediction:", 1);
      }
      else
      {
        objc_msgSend(v15, "setHidePrediction:", 0);
        objc_msgSend(MEMORY[0x1E0CEA6C8], "snapshotViewForPredictionViewTransition");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMessageEntryView appStrip](self, "appStrip");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "updatePredictiveTypeSnapshot:", v20);

      }
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __58__CKMessageEntryView_setShowAppStrip_animated_completion___block_invoke;
      v32 = &unk_1E2756CC8;
      v33 = self;
      v34 = v8;
      v22 = _Block_copy(&v29);
      v23 = v22;
      if (v6)
      {
        (*((void (**)(void *, uint64_t))v22 + 2))(v22, 1);
        -[CKMessageEntryView appStrip](self, "appStrip", v29, v30, v31, v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        v26 = 1;
        v27 = v5;
        v28 = 0;
      }
      else
      {
        -[CKMessageEntryView appStrip](self, "appStrip", v29, v30, v31, v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        v26 = 0;
        v27 = v5;
        v28 = v23;
      }
      objc_msgSend(v24, "animateAppStripVisible:animated:completion:", v26, v27, v28);

    }
    else if (v8)
    {
      v8[2](v8, 1);
    }
  }

LABEL_29:
}

void __58__CKMessageEntryView_setShowAppStrip_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputTraitsDidChange");

}

- (CGRect)anchorRect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _QWORD v51[9];
  _QWORD v52[5];
  uint64_t v53;
  double *v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  CGRect result;

  -[CKMessageEntryView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "textContainerInset");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "textContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isTextKit2Enabled");

  if (v11)
  {
    -[CKMessageEntryView rangeOfTappedMention](self, "rangeOfTappedMention");
    if (!v12)
    {
      v22 = *MEMORY[0x1E0C9D648];
      v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      goto LABEL_6;
    }
    objc_msgSend(v4, "textLayoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "documentRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "locationFromLocation:withOffset:", v15, -[CKMessageEntryView rangeOfTappedMention](self, "rangeOfTappedMention"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMessageEntryView rangeOfTappedMention](self, "rangeOfTappedMention");
    objc_msgSend(v13, "locationFromLocation:withOffset:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1318]), "initWithLocation:endLocation:", v16, v18);
    objc_msgSend(v13, "documentRange");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ensureLayoutForRange:", v20);

    v53 = 0;
    v54 = (double *)&v53;
    v55 = 0x4010000000;
    v56 = &unk_18E8EEE6F;
    v57 = 0u;
    v58 = 0u;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __32__CKMessageEntryView_anchorRect__block_invoke;
    v52[3] = &unk_1E2750AC8;
    v52[4] = &v53;
    objc_msgSend(v13, "enumerateTextSegmentsInRange:type:options:usingBlock:", v19, 0, 0, v52);
    objc_msgSend(v4, "convertRect:toView:", self, v8 + v54[4], v6 + v54[5], v54[6], v54[7]);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    _Block_object_dispose(&v53, 8);

  }
  else
  {
    objc_msgSend(v4, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[CKMessageEntryView rangeOfTappedMention](self, "rangeOfTappedMention");
    objc_msgSend(v13, "boundingRectForGlyphRange:inTextContainer:", v29, v30, v9);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v53 = 0;
    v54 = (double *)&v53;
    v55 = 0x4010000000;
    v56 = &unk_18E8EEE6F;
    *(_QWORD *)&v57 = v31;
    *((_QWORD *)&v57 + 1) = v33;
    *(_QWORD *)&v58 = v35;
    *((_QWORD *)&v58 + 1) = v37;
    v39 = -[CKMessageEntryView rangeOfTappedMention](self, "rangeOfTappedMention");
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __32__CKMessageEntryView_anchorRect__block_invoke_2;
    v51[3] = &unk_1E2750AF0;
    v51[5] = v32;
    v51[6] = v34;
    v51[7] = v36;
    v51[8] = v38;
    v51[4] = &v53;
    objc_msgSend(v13, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v39, v40, 0x7FFFFFFFFFFFFFFFLL, 0, v9, v51);
    v41 = v54;
    v42 = v6 + v54[5];
    v54[4] = v8 + v54[4];
    v41[5] = v42;
    objc_msgSend(v4, "convertRect:toView:", self);
    v22 = v43;
    v24 = v44;
    v26 = v45;
    v28 = v46;
    _Block_object_dispose(&v53, 8);
  }

LABEL_6:
  v47 = v22;
  v48 = v24;
  v49 = v26;
  v50 = v28;
  result.size.height = v50;
  result.size.width = v49;
  result.origin.y = v48;
  result.origin.x = v47;
  return result;
}

uint64_t __32__CKMessageEntryView_anchorRect__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double *v5;

  v5 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return 0;
}

BOOL __32__CKMessageEntryView_anchorRect__block_invoke_2(uint64_t a1, _BYTE *a2, double a3, double a4, double a5, double a6)
{
  _BOOL8 result;
  double *v13;

  result = CGRectIntersectsRect(*(CGRect *)&a3, *(CGRect *)(a1 + 40));
  if (result)
  {
    v13 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
    v13[4] = a3;
    v13[5] = a4;
    v13[6] = a5;
    v13[7] = a6;
    *a2 = 1;
  }
  return result;
}

- (void)expandAppStrip
{
  void *v3;
  id v4;

  if (!-[CKMessageEntryView showAppStrip](self, "showAppStrip"))
  {
    -[CKMessageEntryView browserButton](self, "browserButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "button");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView browserButtonTapped:](self, "browserButtonTapped:", v3);

  }
}

- (void)minifyAppStrip
{
  id v2;

  -[CKMessageEntryView appStrip](self, "appStrip");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minifyImmediately:", 1);

}

- (void)selectPluginAtIndexPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMessageEntryView appStrip](self, "appStrip");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectPluginAtIndexPath:", v4);

}

- (void)clearAppStripSelection
{
  id v2;

  -[CKMessageEntryView appStrip](self, "appStrip");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSelection");

}

- (id)pasteBoardTextFromComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CKMessageEntryView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "attributedTextForCompositionText:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)snapshotForCompactBrowserAnimation
{
  char isKindOfClass;
  CKMessageEntryBackgroundViewProtocol *backgroundView;
  CKMessageEntryBackgroundViewProtocol *v5;
  CKMessageEntryBackgroundViewProtocol *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  backgroundView = self->_backgroundView;
  if ((isKindOfClass & 1) != 0)
  {
    -[CKMessageEntryBackgroundViewProtocol contentView](backgroundView, "contentView");
    v5 = (CKMessageEntryBackgroundViewProtocol *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = backgroundView;
  }
  v6 = v5;
  -[CKMessageEntryBackgroundViewProtocol alpha](v5, "alpha");
  v8 = v7;
  -[CKMessageEntryBackgroundViewProtocol setAlpha:](v6, "setAlpha:", 1.0);
  -[CKMessageEntryView browserButton](self, "browserButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

  -[CKMessageEntryView snapshotViewAfterScreenUpdates:](self, "snapshotViewAfterScreenUpdates:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView browserButton](self, "browserButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 0);

  -[CKMessageEntryBackgroundViewProtocol setAlpha:](v6, "setAlpha:", v8);
  return v10;
}

- (CGRect)browserButtonFrame
{
  void *v2;
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
  double v13;
  double v14;
  CGRect result;

  -[CKMessageEntryView browserButton](self, "browserButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)beginDeferringEntryFieldCollapsedStateChanges
{
  id v2;

  -[CKMessageEntryView entryFieldCollapsedUpdater](self, "entryFieldCollapsedUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginHoldingUpdatesForKey:", CFSTR("com.apple.ChatKit.CKMessageEntryView.entryFieldCollapsedStateChanges"));

}

- (void)endDeferringEntryFieldCollapsedStateChanges
{
  id v2;

  -[CKMessageEntryView entryFieldCollapsedUpdater](self, "entryFieldCollapsedUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endHoldingUpdatesForKey:", CFSTR("com.apple.ChatKit.CKMessageEntryView.entryFieldCollapsedStateChanges"));

}

- (void)_updateUIForEntryFieldCollapsedStateChange
{
  void *v3;
  id v4;

  if (-[CKMessageEntryView entryFieldUpdaterCollapsedValue](self, "entryFieldUpdaterCollapsedValue")
    && !-[CKMessageEntryView entryFieldCollapsed](self, "entryFieldCollapsed"))
  {
    -[CKMessageEntryView compositionWithAcceptedAutocorrection:](self, "compositionWithAcceptedAutocorrection:", 0);
    if (-[CKMessageEntryView entryFieldUpdaterAnimatedValue](self, "entryFieldUpdaterAnimatedValue"))
    {
      -[CKMessageEntryView _animateToCompactLayoutCollapsing:completion:](self, "_animateToCompactLayoutCollapsing:completion:", 1, 0);
    }
    else
    {
      -[CKMessageEntryView setEntryFieldCollapsed:](self, "setEntryFieldCollapsed:", 1);
      -[CKMessageEntryView updateEntryView](self, "updateEntryView");
      -[CKMessageEntryView delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "messageEntryViewDidChange:isTextChange:isShelfChange:", self, 0, 0);

    }
LABEL_12:
    -[CKMessageEntryView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageEntryViewDidChange:isTextChange:isShelfChange:", self, 0, 0);

    return;
  }
  if (!-[CKMessageEntryView entryFieldUpdaterCollapsedValue](self, "entryFieldUpdaterCollapsedValue")
    && -[CKMessageEntryView entryFieldCollapsed](self, "entryFieldCollapsed"))
  {
    if (-[CKMessageEntryView entryFieldUpdaterAnimatedValue](self, "entryFieldUpdaterAnimatedValue"))
    {
      -[CKMessageEntryView _animateExpandForManualToggle:completion:](self, "_animateExpandForManualToggle:completion:", 1, 0);
      return;
    }
    -[CKMessageEntryView setEntryFieldCollapsed:](self, "setEntryFieldCollapsed:", 0);
    -[CKMessageEntryView updateEntryView](self, "updateEntryView");
    goto LABEL_12;
  }
}

- (UIEdgeInsets)adjustedCoverInsets
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
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  UIEdgeInsets result;

  -[CKMessageEntryView coverInsets](self, "coverInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (CKIsRunningInMacCatalyst())
  {
    -[CKMessageEntryView emojiButton](self, "emojiButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;

    -[CKMessageEntryView browserButton](self, "browserButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0.0;
    v16 = 0.0;
    if (v14)
    {
      -[CKMessageEntryView browserButton](self, "browserButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "frame");
      v16 = v18 + -5.0;

    }
    v19 = v13 + -3.0;

    -[CKMessageEntryView plusButton](self, "plusButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[CKMessageEntryView plusButton](self, "plusButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frame");
      v15 = v22;

    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "minTranscriptMarginInsets");
    v25 = v19 + v24;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "entryViewCoverHorizontalMargin");
    v28 = v25 + v27;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "minTranscriptMarginInsets");
    v31 = v15 + v16 + v30;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "entryViewCoverHorizontalMargin");
    v34 = v31 + v33;

  }
  else
  {
    -[CKMessageEntryView bottomInsetForAppStrip](self, "bottomInsetForAppStrip");
    v8 = v8 + v35;
    -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
    v34 = v6 + v36;
    -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
    v28 = v10 + v37;
  }
  v38 = v4;
  v39 = v34;
  v40 = v8;
  v41 = v28;
  result.right = v41;
  result.bottom = v40;
  result.left = v39;
  result.top = v38;
  return result;
}

- (void)_animateExpandForManualToggle:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  _BOOL4 v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  dispatch_time_t v38;
  uint64_t v39;
  NSObject *v40;
  dispatch_time_t v41;
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
  double v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
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
  double v85;
  void *v86;
  void *v87;
  void *v88;
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
  double v108;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  double v126;
  double v127;
  _QWORD v128[4];
  id v129;
  _QWORD block[6];
  CGRect v131;
  CGRect v132;

  v4 = a3;
  v6 = a4;
  if (!-[CKMessageEntryView animatingLayoutChange](self, "animatingLayoutChange"))
  {
    -[CKMessageEntryView contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    if (v8 == 0.0)
    {

    }
    else
    {
      v9 = -[CKMessageEntryView layoutIsCurrentlyCompact](self, "layoutIsCurrentlyCompact");

      if (v9)
      {
        -[CKMessageEntryView setAnimatingLayoutChange:](self, "setAnimatingLayoutChange:", 1);
        -[CKMessageEntryView bounds](self, "bounds");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        -[CKMessageEntryView setEntryFieldCollapsed:](self, "setEntryFieldCollapsed:", 0);
        -[CKMessageEntryView delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "messageEntryViewMaxHeight:", self);
        v20 = v19;

        -[NSObject ck_constrainedSizeThatFits:](self, "ck_constrainedSizeThatFits:", v15, v20);
        v127 = v21;
        v23 = v22;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "entryViewHorizontalCoverInsets");
        v26 = v25;
        -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
        v28 = v27;

        -[CKMessageEntryView coverFrameThatFitsInSize:](self, "coverFrameThatFitsInSize:", v15, v20);
        v30 = v29;
        v126 = v31;
        -[CKMessageEntryView adjustedCoverInsets](self, "adjustedCoverInsets");
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "browserButtonSize");

        v131.origin.x = v11;
        v131.origin.y = v13;
        v131.size.width = v15;
        v131.size.height = v17;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", CGRectGetWidth(v131));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "browserButtonSize");

        -[CKMessageEntryView arrowButton](self, "arrowButton");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "frame");
        v35 = v26 + v28 + CGRectGetWidth(v132) * 0.5;

        v36 = v17 - v23;
        -[CKMessageEntryView contentView](self, "contentView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "willAnimateBoundsChange");

        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        v38 = dispatch_time(0, 130000000);
        v39 = MEMORY[0x1E0C809B0];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __63__CKMessageEntryView__animateExpandForManualToggle_completion___block_invoke;
        block[3] = &unk_1E274A208;
        block[4] = self;
        v40 = MEMORY[0x1E0C80D38];
        dispatch_after(v38, MEMORY[0x1E0C80D38], block);
        v41 = dispatch_time(0, 480000000);
        v128[0] = v39;
        v128[1] = 3221225472;
        v128[2] = __63__CKMessageEntryView__animateExpandForManualToggle_completion___block_invoke_2;
        v128[3] = &unk_1E274AED0;
        v129 = v6;
        dispatch_after(v41, v40, v128);

        objc_msgSend(MEMORY[0x1E0CD2848], "animation");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setMass:", 1.0);
        objc_msgSend(v42, "setStiffness:", 359.0);
        objc_msgSend(v42, "setDamping:", 29.0);
        objc_msgSend(v42, "setInitialVelocity:", 0.0);
        objc_msgSend(v42, "setDuration:", 0.48);
        objc_msgSend(v42, "setFillMode:", *MEMORY[0x1E0CD2B58]);
        objc_msgSend(v42, "setKeyPath:", CFSTR("position.x"));
        v43 = (void *)MEMORY[0x1E0CB37E8];
        -[CKMessageEntryView photoButton](self, "photoButton");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "origin");
        objc_msgSend(v43, "numberWithDouble:");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setFromValue:", v45);

        objc_msgSend(v42, "setToValue:", &unk_1E2870978);
        -[CKMessageEntryView photoButton](self, "photoButton");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "layer");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addAnimation:forKey:", v42, CFSTR("PhotoButtonPositionX"));

        v48 = (void *)MEMORY[0x1E0CB37E8];
        -[CKMessageEntryView browserButton](self, "browserButton");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "origin");
        objc_msgSend(v48, "numberWithDouble:");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setFromValue:", v50);

        objc_msgSend(v42, "setToValue:", &unk_1E2870990);
        -[CKMessageEntryView browserButton](self, "browserButton");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "layer");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "addAnimation:forKey:", v42, CFSTR("BrowserButtonPositionX"));

        objc_msgSend(v42, "setKeyPath:", CFSTR("position.y"));
        v53 = (void *)MEMORY[0x1E0CB37E8];
        -[CKMessageEntryView photoButton](self, "photoButton");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "center");
        objc_msgSend(v53, "numberWithDouble:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setFromValue:", v56);

        v57 = (void *)MEMORY[0x1E0CB37E8];
        -[CKMessageEntryView photoButton](self, "photoButton");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "center");
        objc_msgSend(v57, "numberWithDouble:", v59 - (v17 - v23));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setToValue:", v60);

        -[CKMessageEntryView photoButton](self, "photoButton");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "layer");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "addAnimation:forKey:", v42, CFSTR("PhotoButtonPositionY"));

        -[CKMessageEntryView browserButton](self, "browserButton");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "layer");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addAnimation:forKey:", v42, CFSTR("BrowserButtonPositionY"));

        v65 = (void *)MEMORY[0x1E0CB37E8];
        -[CKMessageEntryView sendButton](self, "sendButton");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "center");
        objc_msgSend(v65, "numberWithDouble:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setFromValue:", v68);

        v69 = (void *)MEMORY[0x1E0CB37E8];
        -[CKMessageEntryView sendButton](self, "sendButton");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "center");
        objc_msgSend(v69, "numberWithDouble:", v71 - (v17 - v23));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setToValue:", v72);

        -[CKMessageEntryView sendButton](self, "sendButton");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "layer");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "addAnimation:forKey:", v42, CFSTR("sendButtonPosition"));

        objc_msgSend(v42, "setKeyPath:", CFSTR("opacity"));
        objc_msgSend(v42, "setFromValue:", &unk_1E28709A8);
        objc_msgSend(v42, "setToValue:", &unk_1E28709C0);
        -[CKMessageEntryView photoButton](self, "photoButton");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "layer");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "addAnimation:forKey:", v42, CFSTR("myAnimation5o"));

        -[CKMessageEntryView browserButton](self, "browserButton");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "layer");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "addAnimation:forKey:", v42, CFSTR("myAnimation5o"));

        objc_msgSend(v42, "setKeyPath:", CFSTR("position.x"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setFromValue:", v79);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setToValue:", v80);

        -[CKMessageEntryView arrowButton](self, "arrowButton");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "layer");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "addAnimation:forKey:", v42, CFSTR("ArrowPositionx"));

        objc_msgSend(v42, "setKeyPath:", CFSTR("position.y"));
        v83 = (void *)MEMORY[0x1E0CB37E8];
        -[CKMessageEntryView arrowButton](self, "arrowButton");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "center");
        objc_msgSend(v83, "numberWithDouble:", v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setFromValue:", v86);

        v87 = (void *)MEMORY[0x1E0CB37E8];
        -[CKMessageEntryView arrowButton](self, "arrowButton");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "center");
        objc_msgSend(v87, "numberWithDouble:", v89 - (v17 - v23));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setToValue:", v90);

        -[CKMessageEntryView arrowButton](self, "arrowButton");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "layer");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "addAnimation:forKey:", v42, CFSTR("ArrowPositiony"));

        objc_msgSend(v42, "setKeyPath:", CFSTR("transform.scale.xy"));
        objc_msgSend(v42, "setFromValue:", &unk_1E2871440);
        objc_msgSend(v42, "setToValue:", &unk_1E2871450);
        -[CKMessageEntryView arrowButton](self, "arrowButton");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "layer");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "addAnimation:forKey:", v42, CFSTR("ArrowScale"));

        objc_msgSend(v42, "setKeyPath:", CFSTR("opacity"));
        objc_msgSend(v42, "setFromValue:", &unk_1E28709C0);
        objc_msgSend(v42, "setToValue:", &unk_1E28709A8);
        -[CKMessageEntryView arrowButton](self, "arrowButton");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "layer");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "addAnimation:forKey:", v42, CFSTR("ArrowOpacity"));

        objc_msgSend(v42, "setKeyPath:", CFSTR("bounds"));
        v97 = (void *)MEMORY[0x1E0CB3B18];
        -[CKMessageEntryView contentClipView](self, "contentClipView");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "bounds");
        objc_msgSend(v97, "valueWithRect:");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setFromValue:", v99);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", 0.0, 0.0, v30, v126);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setToValue:", v100);

        -[CKMessageEntryView contentClipView](self, "contentClipView");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "layer");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "addAnimation:forKey:", v42, CFSTR("PillBounds"));

        if (v4)
        {
          objc_msgSend(v42, "setKeyPath:", CFSTR("opacity"));
          objc_msgSend(v42, "setFromValue:", &unk_1E28709A8);
          objc_msgSend(v42, "setToValue:", &unk_1E28709C0);
          -[CKMessageEntryView collpasedPlaceholderLabel](self, "collpasedPlaceholderLabel");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "layer");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "addAnimation:forKey:", v42, CFSTR("placeholderOpacity"));

          objc_msgSend(v42, "setFromValue:", &unk_1E28709C0);
          objc_msgSend(v42, "setToValue:", &unk_1E28709A8);
          -[CKMessageEntryView contentView](self, "contentView");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "layer");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "addAnimation:forKey:", v42, CFSTR("contentOpacity"));

        }
        if (-[CKMessageEntryView shouldShowAppStrip](self, "shouldShowAppStrip"))
        {
          objc_msgSend(v42, "setKeyPath:", CFSTR("position.y"));
          -[CKMessageEntryView appStrip](self, "appStrip");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "center");
          v109 = v108;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setFromValue:", v110);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v109 - v36);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setToValue:", v111);

          -[CKMessageEntryView appStrip](self, "appStrip");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "layer");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "addAnimation:forKey:", v42, CFSTR("appStripFrame"));

          -[CKMessageEntryView appStripBackgroundBlurContainerView](self, "appStripBackgroundBlurContainerView");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "center");
          v116 = v115;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v116);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setFromValue:", v117);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v116 - v36);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setToValue:", v118);

          -[CKMessageEntryView appStripBackgroundBlurContainerView](self, "appStripBackgroundBlurContainerView");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "layer");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "addAnimation:forKey:", v42, CFSTR("appStripBlurContainerViewFrame"));

        }
        objc_msgSend(v42, "setKeyPath:", CFSTR("bounds"));
        v121 = (void *)MEMORY[0x1E0CB3B18];
        -[CKMessageEntryView bounds](self, "bounds");
        objc_msgSend(v121, "valueWithRect:");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setFromValue:", v122);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", 0.0, 0.0, v127, v23);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setToValue:", v123);

        -[CKMessageEntryView backgroundView](self, "backgroundView");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "setBounds:", 0.0, 0.0, v127, v23);

        -[CKMessageEntryView layer](self, "layer");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "addAnimation:forKey:", v42, CFSTR("selfBounds"));

        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      }
    }
  }

}

void __63__CKMessageEntryView__animateExpandForManualToggle_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageEntryViewDidExpand:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "setAnimatingLayoutChange:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageEntryViewDidChange:isTextChange:isShelfChange:", *(_QWORD *)(a1 + 32), 0, 0);

}

uint64_t __63__CKMessageEntryView__animateExpandForManualToggle_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)expandGestureRecongnized
{
  if (-[CKMessageEntryView entryFieldCollapsed](self, "entryFieldCollapsed"))
    -[CKMessageEntryView _animateExpandForManualToggle:completion:](self, "_animateExpandForManualToggle:completion:", 1, 0);
}

- (void)collapseGestureRecognized
{
  -[CKMessageEntryView _animateToCompactLayoutCollapsing:completion:](self, "_animateToCompactLayoutCollapsing:completion:", 1, 0);
}

- (BOOL)_shouldNotAnimateCollapseInteractive
{
  return !-[CKMessageEntryView shouldShowPluginButtons](self, "shouldShowPluginButtons");
}

- (void)_animateToCompactLayoutCollapsing:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
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
  void *v27;
  double v28;
  double v29;
  CGFloat v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  dispatch_time_t v49;
  uint64_t v50;
  NSObject *v51;
  dispatch_time_t v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
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
  void *v94;
  void *v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
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
  double v136;
  double v137;
  double v138;
  double v139;
  CGFloat rect;
  _QWORD v141[5];
  id v142;
  _QWORD block[6];
  CGRect v144;
  CGRect v145;

  v4 = a3;
  v6 = a4;
  if (!-[CKMessageEntryView _shouldNotAnimateCollapseInteractive](self, "_shouldNotAnimateCollapseInteractive")
    && !-[CKMessageEntryView animatingLayoutChange](self, "animatingLayoutChange")
    && !-[CKMessageEntryView layoutIsCurrentlyCompact](self, "layoutIsCurrentlyCompact"))
  {
    -[CKMessageEntryView setAnimatingLayoutChange:](self, "setAnimatingLayoutChange:", 1);
    if (v4)
      -[CKMessageEntryView setEntryFieldCollapsed:](self, "setEntryFieldCollapsed:", 1);
    -[CKMessageEntryView bounds](self, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "entryViewHorizontalCoverInsets");
    v17 = v16;
    -[CKMessageEntryView safeAreaInsets](self, "safeAreaInsets");
    v19 = v17 + v18;

    -[CKMessageEntryView coverFrameThatFitsInSize:](self, "coverFrameThatFitsInSize:", v12, v14);
    v139 = v20;
    rect = v21;
    v138 = v22;
    v24 = v23;
    -[CKMessageEntryView adjustedCoverInsets](self, "adjustedCoverInsets");
    v26 = v25;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "browserButtonSize");
    v29 = v28;

    v144.origin.x = v8;
    v144.origin.y = v10;
    v144.size.width = v12;
    v144.size.height = v14;
    v30 = CGRectGetWidth(v144) - v19 - v29 + -16.5;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "browserButtonSize");
    v33 = v30 - v32 + -14.5 - v26;

    -[CKMessageEntryView sizeThatFits:](self, "sizeThatFits:", v12, 1.79769313e308);
    v35 = v34;
    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    v38 = v37;
    v40 = v39;

    if (v38 != v33 || v40 != v24)
    {
      v145.size.height = v24;
      v145.origin.x = v139 + v138 - v33;
      v42 = v14 - v35;
      v145.origin.y = rect;
      v145.size.width = v33;
      v136 = v24;
      v43 = CGRectGetMinX(v145) + 14.5;
      v44 = v29 * 0.5;
      v45 = v19 + v44;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "browserButtonSize");
      v48 = v19 + v44 + v44 + v47 * 0.5 + 16.5;

      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.73);
      v49 = dispatch_time(0, 380000000);
      v50 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__CKMessageEntryView__animateToCompactLayoutCollapsing_completion___block_invoke;
      block[3] = &unk_1E274A208;
      block[4] = self;
      v51 = MEMORY[0x1E0C80D38];
      dispatch_after(v49, MEMORY[0x1E0C80D38], block);
      v52 = dispatch_time(0, 730000000);
      v141[0] = v50;
      v141[1] = 3221225472;
      v141[2] = __67__CKMessageEntryView__animateToCompactLayoutCollapsing_completion___block_invoke_2;
      v141[3] = &unk_1E274C2E0;
      v141[4] = self;
      v142 = v6;
      dispatch_after(v52, v51, v141);

      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setKeyPath:", CFSTR("position.x"));
      objc_msgSend(v53, "setDuration:", 0.65);
      objc_msgSend(v53, "setMass:", 1.0);
      objc_msgSend(v53, "setStiffness:", 226.0);
      v54 = 24.0;
      if (v42 <= 100.0)
      {
        v55 = 23.0;
      }
      else
      {
        v54 = 26.0;
        v55 = 26.0;
      }
      objc_msgSend(v53, "setDamping:", v54, *(_QWORD *)&v136);
      objc_msgSend(v53, "setInitialVelocity:", 0.0);
      objc_msgSend(v53, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      objc_msgSend(v53, "setKeyPath:", CFSTR("position.x"));
      objc_msgSend(v53, "setFromValue:", &unk_1E2870978);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setToValue:", v56);

      -[CKMessageEntryView photoButton](self, "photoButton");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "layer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addAnimation:forKey:", v53, CFSTR("PhotoButtonPositionX"));

      objc_msgSend(v53, "setFromValue:", &unk_1E2870990);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setToValue:", v59);

      -[CKMessageEntryView browserButton](self, "browserButton");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "layer");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addAnimation:forKey:", v53, CFSTR("BrowserButtonPositionX"));

      objc_msgSend(v53, "setKeyPath:", CFSTR("position.y"));
      v62 = (void *)MEMORY[0x1E0CB37E8];
      -[CKMessageEntryView photoButton](self, "photoButton");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "center");
      objc_msgSend(v62, "numberWithDouble:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setFromValue:", v65);

      v66 = (void *)MEMORY[0x1E0CB37E8];
      -[CKMessageEntryView photoButton](self, "photoButton");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "center");
      objc_msgSend(v66, "numberWithDouble:", v68 - v42);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setToValue:", v69);

      -[CKMessageEntryView photoButton](self, "photoButton");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "layer");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "addAnimation:forKey:", v53, CFSTR("PhotoButtonPositionY"));

      -[CKMessageEntryView browserButton](self, "browserButton");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "layer");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "addAnimation:forKey:", v53, CFSTR("BrowserButtonPositionY"));

      v74 = (void *)MEMORY[0x1E0CB37E8];
      -[CKMessageEntryView sendButton](self, "sendButton");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "center");
      objc_msgSend(v74, "numberWithDouble:", v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setFromValue:", v77);

      v78 = (void *)MEMORY[0x1E0CB37E8];
      -[CKMessageEntryView sendButton](self, "sendButton");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "center");
      objc_msgSend(v78, "numberWithDouble:", v80 - v42);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setToValue:", v81);

      -[CKMessageEntryView sendButton](self, "sendButton");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "layer");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "addAnimation:forKey:", v53, CFSTR("sendButtonPosition"));

      objc_msgSend(v53, "setKeyPath:", CFSTR("opacity"));
      objc_msgSend(v53, "setFromValue:", &unk_1E28709C0);
      objc_msgSend(v53, "setToValue:", &unk_1E28709A8);
      -[CKMessageEntryView photoButton](self, "photoButton");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "layer");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "addAnimation:forKey:", v53, CFSTR("PhotoButtonOpacity"));

      -[CKMessageEntryView browserButton](self, "browserButton");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "layer");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "addAnimation:forKey:", v53, CFSTR("BrowserButtonOpacity"));

      objc_msgSend(v53, "setKeyPath:", CFSTR("position.x"));
      v88 = (void *)MEMORY[0x1E0CB37E8];
      -[CKMessageEntryView arrowButton](self, "arrowButton");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "center");
      objc_msgSend(v88, "numberWithDouble:");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setFromValue:", v90);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setToValue:", v91);

      -[CKMessageEntryView arrowButton](self, "arrowButton");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "layer");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "addAnimation:forKey:", v53, CFSTR("myAnimation4"));

      objc_msgSend(v53, "setKeyPath:", CFSTR("position.y"));
      v94 = (void *)MEMORY[0x1E0CB37E8];
      -[CKMessageEntryView arrowButton](self, "arrowButton");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "center");
      objc_msgSend(v94, "numberWithDouble:", v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setFromValue:", v97);

      v98 = (void *)MEMORY[0x1E0CB37E8];
      -[CKMessageEntryView arrowButton](self, "arrowButton");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "center");
      objc_msgSend(v98, "numberWithDouble:", v100 - v42);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setToValue:", v101);

      -[CKMessageEntryView arrowButton](self, "arrowButton");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "layer");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "addAnimation:forKey:", v53, CFSTR("ArrowPositiony"));

      objc_msgSend(v53, "setKeyPath:", CFSTR("opacity"));
      objc_msgSend(v53, "setFromValue:", &unk_1E28709A8);
      objc_msgSend(v53, "setToValue:", &unk_1E28709C0);
      -[CKMessageEntryView arrowButton](self, "arrowButton");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "layer");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "addAnimation:forKey:", v53, CFSTR("myAnimation5"));

      objc_msgSend(v53, "setKeyPath:", CFSTR("transform.scale.xy"));
      objc_msgSend(v53, "setFromValue:", &unk_1E2871450);
      objc_msgSend(v53, "setToValue:", &unk_1E2871440);
      -[CKMessageEntryView arrowButton](self, "arrowButton");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "layer");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "addAnimation:forKey:", v53, CFSTR("myAnimation6"));

      -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "frame");
      v110 = v109;
      v112 = v111;
      v114 = v113;
      v116 = v115;

      -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setFrame:", v110, v112 - v42, v114, v42 + v116);

      objc_msgSend(v53, "setKeyPath:", CFSTR("bounds.size.height"));
      v118 = (void *)MEMORY[0x1E0CB37E8];
      -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "bounds");
      objc_msgSend(v118, "numberWithDouble:", v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setFromValue:", v121);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setToValue:", v122);

      -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "layer");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "addAnimation:forKey:", v53, CFSTR("buttonTextContainerHeight"));

      objc_msgSend(v53, "setKeyPath:", CFSTR("bounds"));
      v125 = (void *)MEMORY[0x1E0CB3B18];
      -[CKMessageEntryView contentClipView](self, "contentClipView");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "bounds");
      objc_msgSend(v125, "valueWithRect:");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setFromValue:", v127);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", 0.0, 0.0, v33, v137);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setToValue:", v128);

      objc_msgSend(v53, "setDamping:", v55);
      -[CKMessageEntryView contentClipView](self, "contentClipView");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "layer");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "addAnimation:forKey:", v53, CFSTR("PillBounds"));

      -[CKMessageEntryView composition](self, "composition");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v130) = objc_msgSend(v131, "hasContent");

      if ((_DWORD)v130 && v4)
      {
        objc_msgSend(v53, "setKeyPath:", CFSTR("opacity"));
        objc_msgSend(v53, "setFromValue:", &unk_1E28709C0);
        objc_msgSend(v53, "setToValue:", &unk_1E28709A8);
        -[CKMessageEntryView collpasedPlaceholderLabel](self, "collpasedPlaceholderLabel");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "layer");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "addAnimation:forKey:", v53, CFSTR("myANimation5o"));

        objc_msgSend(v53, "setFromValue:", &unk_1E28709A8);
        objc_msgSend(v53, "setToValue:", &unk_1E28709C0);
        -[CKMessageEntryView contentView](self, "contentView");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "layer");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "addAnimation:forKey:", v53, CFSTR("myANimation5o"));

      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

    }
  }

}

void __67__CKMessageEntryView__animateToCompactLayoutCollapsing_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageEntryViewDidCollapse:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageEntryViewDidChange:isTextChange:isShelfChange:", *(_QWORD *)(a1 + 32), 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageEntryViewDidCollapse:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __67__CKMessageEntryView__animateToCompactLayoutCollapsing_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAnimatingLayoutChange:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setDisablePluginButtons:(BOOL)a3
{
  if (self->_disablePluginButtons != a3)
  {
    self->_disablePluginButtons = a3;
    -[CKMessageEntryView updateEntryView](self, "updateEntryView");
  }
}

- (void)setComposingRecipient:(BOOL)a3
{
  if (self->_composingRecipient != a3)
  {
    self->_composingRecipient = a3;
    -[CKMessageEntryView updateEntryView](self, "updateEntryView");
  }
}

- (void)setFailedRecipients:(BOOL)a3
{
  if (self->_failedRecipients != a3)
  {
    self->_failedRecipients = a3;
    -[CKMessageEntryView updateEntryView](self, "updateEntryView");
  }
}

- (void)setUnreachableEmergencyRecipient:(BOOL)a3
{
  if (self->_unreachableEmergencyRecipient != a3)
  {
    self->_unreachableEmergencyRecipient = a3;
    -[CKMessageEntryView updateEntryView](self, "updateEntryView");
  }
}

- (void)setSendingMessage:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_sendingMessage != a3)
  {
    v3 = a3;
    self->_sendingMessage = a3;
    -[CKMessageEntryView updateEntryView](self, "updateEntryView");
    if (v3)
      -[CKMessageEntryView minifyAppStrip](self, "minifyAppStrip");
  }
}

- (void)setAudioComposition:(id)a3
{
  CKComposition *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  CKAudioController *v12;
  void *v13;
  CKAudioController *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint8_t v30[16];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = (CKComposition *)a3;
  -[CKMessageEntryView audioController](self, "audioController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPlaying");

  if ((v7 & 1) == 0)
  {
    if (self->_audioComposition != v5)
      objc_storeStrong((id *)&self->_audioComposition, a3);
    if (-[CKComposition isAudioComposition](v5, "isAudioComposition"))
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isAudioMessagesEntryViewRecordingEnabled");

      if (v9)
      {
        -[CKComposition mediaObjects](v5, "mediaObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[CKMessageEntryView setAudioController:](self, "setAudioController:", 0);
          v12 = [CKAudioController alloc];
          v31[0] = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[CKAudioController initWithMediaObjects:](v12, "initWithMediaObjects:", v13);

          -[CKAudioController setDelegate:](v14, "setDelegate:", self);
          -[CKMessageEntryView setAudioController:](self, "setAudioController:", v14);
          -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v13) = v15 == 0;

          if ((_DWORD)v13)
          {
            -[CKMessageEntryView configureForDisplayMode:](self, "configureForDisplayMode:", 3);
            -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setState:", 2);

            -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setPlaybackCurrentTime:", NAN);

            objc_msgSend(v11, "duration");
            v19 = v18;
            -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setPlaybackDuration:", v19);

            -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "powerLevels");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setWithIntensities:", v22);

            -[CKMessageEntryView recorder](self, "recorder");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "resetState");

            -[CKMessageEntryView recorder](self, "recorder");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setPaused:", 1);

            -[CKMessageEntryView recorder](self, "recorder");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setTotalPacketsCount:", objc_msgSend(v11, "totalPacketsCount"));

            -[CKMessageEntryView recorder](self, "recorder");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "temporaryFileURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setFileURL:", v27);

          }
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v30 = 0;
          _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "[Event] Audio Composition loaded into entry view. Calling updateEntryView.", v30, 2u);
        }

      }
      -[CKMessageEntryView updateEntryView](self, "updateEntryView");
      -[CKMessageEntryView delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "messageEntryViewDidChange:isTextChange:isShelfChange:", self, 0, 0);

    }
  }

}

- (BOOL)messageEntryContentView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return !-[CKMessageEntryView audioRecordingIsInEntryView](self, "audioRecordingIsInEntryView", a3, a4.location, a4.length, a5);
}

- (BOOL)messageEntryContentViewShouldResignFirstResponder:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[CKMessageEntryView inputDelegate](self, "inputDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 1;
  -[CKMessageEntryView inputDelegate](self, "inputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "messageEntryViewShouldResignFirstResponder:", self);

  return v7;
}

- (BOOL)messageEntryContentView:(id)a3 canPerformDictationAction:(id)a4
{
  int v5;

  v5 = objc_msgSend(a4, "isEqualToString:", CFSTR("UITextInputDictationActionTypeSend"));
  if (v5)
    LOBYTE(v5) = -[CKMessageEntryView _canSend](self, "_canSend");
  return v5;
}

- (unint64_t)numberOfSuggestionsInSuggestionView:(id)a3 forSection:(unint64_t)a4
{
  id v5;
  id v6;
  void *v8;
  unint64_t v9;

  v5 = a3;
  -[CKMessageEntryView mentionSuggestionView](self, "mentionSuggestionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
    return 0;
  -[CKMessageEntryView currentMentionSuggestions](self, "currentMentionSuggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (id)suggestionView:(id)a3 entityAtIndex:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v6 = a3;
  -[CKMessageEntryView mentionSuggestionView](self, "mentionSuggestionView");
  v7 = objc_claimAutoreleasedReturnValue();
  if ((id)v7 == v6)
  {
    -[CKMessageEntryView currentMentionSuggestions](self, "currentMentionSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 <= a4)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[CKMessageEntryView currentMentionSuggestions](self, "currentMentionSuggestions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)v7;
    v9 = 0;
  }

LABEL_7:
  return v9;
}

- (id)suggestionView:(id)a3 indexPathOfEntityWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__49;
  v19 = __Block_byref_object_dispose__49;
  v20 = 0;
  -[CKMessageEntryView mentionSuggestionView](self, "mentionSuggestionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[CKMessageEntryView currentMentionSuggestions](self, "currentMentionSuggestions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__CKMessageEntryView_suggestionView_indexPathOfEntityWithIdentifier___block_invoke;
    v12[3] = &unk_1E2750AA0;
    v13 = v7;
    v14 = &v15;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __69__CKMessageEntryView_suggestionView_indexPathOfEntityWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(a2, "defaultIMHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (void)messageEntryContentView:(id)a3 willAddPluginEntryViewControllerToViewHierarchy:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CKMessageEntryView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentViewControllerForPluginViewControllerInMessageEntryView:", self);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addChildViewController:", v5);
}

- (void)messageEntryContentView:(id)a3 didAddPluginEntryViewControllerToViewHierarchy:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CKMessageEntryView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentViewControllerForPluginViewControllerInMessageEntryView:", self);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "didMoveToParentViewController:", v7);
}

- (double)balloonMaxWidthForMessageEntryRichTextView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  double v7;
  double v8;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0.0;
  -[CKMessageEntryView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "balloonMaxWidthForMessageEntryView:", self);
  v8 = v7;

  return v8;
}

- (BOOL)messageEntryContentViewShouldAllowLinkCustomization:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[CKMessageEntryView conversation](self, "conversation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsCapability:", *MEMORY[0x1E0D38E68]);

  return v5;
}

- (void)messageEntryContentViewWillPresentCustomizationPicker:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageEntryViewWillPresentCustomizationPicker:", self);

  }
}

- (void)messageEntryContentViewDidPresentCustomizationPicker:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageEntryViewDidPresentCustomizationPicker:", self);

  }
}

- (void)messageEntryContentViewWillDismissCustomizationPicker:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageEntryViewWillDismissCustomizationPicker:", self);

  }
}

- (void)messageEntryContentViewDidDismissCustomizationPicker:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageEntryViewDidDismissCustomizationPicker:", self);

  }
}

- (void)messageEntryContentViewCancelWasTapped:(id)a3 shelfPluginPayload:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
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

  v19 = a4;
  objc_msgSend(v19, "pluginBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
LABEL_10:

    v8 = v19;
    goto LABEL_11;
  }
  objc_msgSend(v19, "pluginBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeOfString:", *MEMORY[0x1E0D375D0]);

  v8 = v19;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pluginBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllerForPluginIdentifier:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CKMessageEntryView conversation](self, "conversation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "senderIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSender:", v12);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CKMessageEntryView conversation](self, "conversation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recipientStrings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setRecipients:", v14);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "didCancelSendingPluginPayload:", v19);
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "associatedMessageGUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pluginBundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "existingDataSourceForMessageGUID:bundleID:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "endShowingLastConsumedBreadcrumb");
    goto LABEL_10;
  }
LABEL_11:

}

- (void)messageEntryContentView:(id)a3 didRequestGenerativeContentForImageURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  if (v7)
  {
    IMBalloonExtensionIDWithSuffix();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllerForPluginIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __85__CKMessageEntryView_messageEntryContentView_didRequestGenerativeContentForImageURL___block_invoke;
      v11[3] = &unk_1E274B240;
      v12 = v10;
      v13 = v7;
      objc_copyWeak(&v14, &location);
      dispatch_async(MEMORY[0x1E0C80D38], v11);
      objc_destroyWeak(&v14);

    }
  }
  objc_destroyWeak(&location);

}

void __85__CKMessageEntryView_messageEntryContentView_didRequestGenerativeContentForImageURL___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__CKMessageEntryView_messageEntryContentView_didRequestGenerativeContentForImageURL___block_invoke_2;
  v3[3] = &unk_1E2756CF0;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  objc_msgSend(v1, "didSelectGPAsset:recipeData:completion:", v2, 0, v3);
  objc_destroyWeak(&v4);
}

void __85__CKMessageEntryView_messageEntryContentView_didRequestGenerativeContentForImageURL___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__CKMessageEntryView_messageEntryContentView_didRequestGenerativeContentForImageURL___block_invoke_3;
  v3[3] = &unk_1E2750A18;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __85__CKMessageEntryView_messageEntryContentView_didRequestGenerativeContentForImageURL___block_invoke_3(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "messageEntryViewWantsGenerativePlaygroundPluginPresented:presentationStyle:", v4, *(_QWORD *)(a1 + 40));

}

- (void)messageEntryContentView:(id)a3 didStagePluginPayload:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKMessageEntryView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEntryView:didInsertPluginPayload:", self, v5);

}

- (void)messageEntryContentViewDidChange:(id)a3 isTextChange:(BOOL)a4 isShelfChange:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__CKMessageEntryView_messageEntryContentViewDidChange_isTextChange_isShelfChange___block_invoke;
  v15[3] = &unk_1E274DD80;
  v15[4] = self;
  v16 = v8;
  v17 = v11;
  v12 = v8;
  -[CKMessageEntryView handleContentViewChangeWithCompletion:](self, "handleContentViewChangeWithCompletion:", v15);
  -[CKMessageEntryView appStrip](self, "appStrip");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v13, "isMagnified");

  if ((_DWORD)v10)
    -[CKMessageEntryView minifyAppStrip](self, "minifyAppStrip");
  -[CKMessageEntryView delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageEntryViewDidChange:isTextChange:isShelfChange:", self, v6, v5);

}

void __82__CKMessageEntryView_messageEntryContentViewDidChange_isTextChange_isShelfChange___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isAppStripInKeyboard")
    || !objc_msgSend(*(id *)(a1 + 32), "showsKeyboardPredictionBar")
    || !CKShowAppStripInEntryView())
  {
    goto LABEL_17;
  }
  v4 = objc_msgSend(*(id *)(a1 + 40), "isActive");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_17;
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v5 != v8)
      goto LABEL_17;
    if (objc_msgSend(*(id *)(a1 + 32), "shouldShowAppStrip"))
    {
      objc_msgSend(*(id *)(a1 + 40), "activeView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CEA6E8], "activeInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isMinimized");

        if (!v12)
        {
          v13 = 0;
          goto LABEL_16;
        }
      }
      else
      {

      }
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowAppStrip") & 1) != 0)
      goto LABEL_17;
    objc_msgSend(*(id *)(a1 + 40), "activeView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (v16)
      goto LABEL_17;
    v13 = 1;
LABEL_16:
    objc_msgSend(v17, "messageEntryView:shouldShowAppStrip:animated:", *(_QWORD *)(a1 + 32), v13, a2);
LABEL_17:

  }
}

- (void)messageEntryContentViewShelfDidChange:(id)a3
{
  id v4;

  -[CKMessageEntryView handleContentViewChangeWithCompletion:](self, "handleContentViewChangeWithCompletion:", 0);
  if (!-[CKMessageEntryView isSendingMessage](self, "isSendingMessage"))
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageEntryViewDidChange:isTextChange:isShelfChange:", self, 0, 1);

  }
}

- (void)messageEntryContentViewWantsSendLaterPickerPresented:(id)a3
{
  id v4;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryViewWantsSendLaterPickerPresented:", self);

}

- (void)messageEntryContentViewSendLaterPluginInfoUpdated:(id)a3
{
  void *v4;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryViewSendLaterPluginInfoUpdated:", self);

  -[CKMessageEntryView updateEntryView](self, "updateEntryView");
}

- (void)handleContentViewChangeWithCompletion:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  -[CKMessageEntryView setEntryFieldCollapsed:](self, "setEntryFieldCollapsed:", 0);
  v5 = -[CKMessageEntryView layoutIsCurrentlyCompact](self, "layoutIsCurrentlyCompact");
  v6 = -[CKMessageEntryView shouldEntryViewBeExpandedLayout](self, "shouldEntryViewBeExpandedLayout");
  if (v5 && v6)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __60__CKMessageEntryView_handleContentViewChangeWithCompletion___block_invoke;
    v19[3] = &unk_1E274AED0;
    v20 = v4;
    -[CKMessageEntryView _animateExpandForManualToggle:completion:](self, "_animateExpandForManualToggle:completion:", 0, v19);
    v7 = v20;
LABEL_9:

    goto LABEL_10;
  }
  if (!-[CKMessageEntryView entryFieldCollapsed](self, "entryFieldCollapsed") && !v5 && !v6)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __60__CKMessageEntryView_handleContentViewChangeWithCompletion___block_invoke_2;
    v17 = &unk_1E274AED0;
    v18 = v4;
    -[CKMessageEntryView _animateToCompactLayoutCollapsing:completion:](self, "_animateToCompactLayoutCollapsing:completion:", 0, &v14);
    v7 = v18;
    goto LABEL_9;
  }
  if (v4 && !-[CKMessageEntryView animatingLayoutChange](self, "animatingLayoutChange"))
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_10:
  -[CKMessageEntryView setAudioComposition:](self, "setAudioComposition:", 0, v14, v15, v16, v17);
  -[CKMessageEntryView configureForDisplayMode:](self, "configureForDisplayMode:", 1);
  -[CKMessageEntryView conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView composition](self, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKMessageEntryView shouldShowCharacterCount](self, "shouldShowCharacterCount"))
  {
    if (objc_msgSend(v8, "shouldShowCharacterCount")
      && objc_msgSend(v9, "isTextOnly")
      && (objc_msgSend(v9, "subject"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "length"),
          v10,
          !v11))
    {
      v12 = objc_msgSend(v9, "hasContent");
      v13 = v12;
      -[CKMessageEntryView setCharacterCountHidden:](self, "setCharacterCountHidden:", v12 ^ 1u);
      if ((v13 & 1) != 0)
        goto LABEL_16;
    }
    else
    {
      -[CKMessageEntryView setCharacterCountHidden:](self, "setCharacterCountHidden:", 1);
    }
    -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_16:
  -[CKMessageEntryView updateEntryView](self, "updateEntryView");

}

uint64_t __60__CKMessageEntryView_handleContentViewChangeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __60__CKMessageEntryView_handleContentViewChangeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (BOOL)showsKeyboardPredictionBar
{
  _BOOL4 v3;

  v3 = -[CKMessageEntryView isPredictionBarEnabled](self, "isPredictionBarEnabled");
  if (v3)
  {
    if (-[CKMessageEntryView is3rdPartyKeyboardVisible](self, "is3rdPartyKeyboardVisible"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[CKMessageEntryView isSendingMessage](self, "isSendingMessage");
  }
  return v3;
}

- (BOOL)isPredictionBarEnabled
{
  return objc_msgSend(MEMORY[0x1E0CEA6C8], "__ck_isPredictionBarEnabled");
}

- (BOOL)is3rdPartyKeyboardVisible
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExtensionInputMode");

  return v4;
}

- (BOOL)audioRecordingIsInEntryView
{
  BOOL v3;
  void *v4;

  if (-[CKMessageEntryView isRecording](self, "isRecording"))
    return 1;
  -[CKMessageEntryView audioComposition](self, "audioComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (BOOL)messageEntryContentViewShouldBeginEditing:(id)a3
{
  void *v5;
  char v6;

  if (-[CKMessageEntryView isTransitioningForBrowserSwitcher](self, "isTransitioningForBrowserSwitcher", a3)
    || -[CKMessageEntryView audioRecordingIsInEntryView](self, "audioRecordingIsInEntryView"))
  {
    return 0;
  }
  -[CKMessageEntryView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "messageEntryViewShouldBeginEditing:", self);

  return v6;
}

- (CGSize)messageEntryContentViewMaxShelfPluginViewSize:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryViewMaxShelfPluginViewSize:", self);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)messageEntryContentViewDidBeginEditing:(id)a3 wasAlreadyActive:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v4 = a4;
  -[CKMessageEntryView delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageEntryViewDidBeginEditing:", self);

  }
  if (v4)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[CKMessageEntryView delegate](self, "delegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "messageEntryView:shouldShowAppStrip:animated:", self, -[CKMessageEntryView shouldShowAppStrip](self, "shouldShowAppStrip"), 0);

    }
  }
  else
  {
    -[CKMessageEntryView setEntryFieldCollapsed:](self, "setEntryFieldCollapsed:", 0);
    -[CKMessageEntryView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageEntryViewDidBeginEditingNotAlreadyActive:", self);

    -[CKMessageEntryView updateEntryView](self, "updateEntryView");
  }
}

- (void)messageEntryContentViewDidEndEditing:(id)a3
{
  void *v4;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryViewDidEndEditing:", self);

  if (-[CKMessageEntryView entryFieldCollapsed](self, "entryFieldCollapsed"))
  {
    -[CKMessageEntryView updateEntryView](self, "updateEntryView");
  }
  else if (!-[CKMessageEntryView shouldEntryViewBeExpandedLayout](self, "shouldEntryViewBeExpandedLayout"))
  {
    -[CKMessageEntryView setEntryFieldCollapsed:animated:](self, "setEntryFieldCollapsed:animated:", 1, 1);
  }
}

- (void)messageEntryContentViewDidChangePencilMode:(id)a3
{
  id v4;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryViewDidChangePencilMode:", self);

}

- (BOOL)messageEntryContentView:(id)a3 shouldInsertMediaObjects:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[CKMessageEntryView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "messageEntryView:shouldInsertMediaObjects:", self, v5);

  return (char)self;
}

- (void)messageEntryContentView:(id)a3 didTapMediaObject:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKMessageEntryView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEntryView:didTapMediaObject:", self, v5);

}

- (void)messageEntryContentViewWasTapped:(id)a3 isLongPress:(BOOL)a4
{
  id v5;

  -[CKMessageEntryView setEntryFieldCollapsed:](self, "setEntryFieldCollapsed:", 0, a4);
  -[CKMessageEntryView setEntryFieldCollapsed:animated:](self, "setEntryFieldCollapsed:animated:", -[CKMessageEntryView layoutIsCurrentlyCompact](self, "layoutIsCurrentlyCompact") & -[CKMessageEntryView shouldEntryViewBeExpandedLayout](self, "shouldEntryViewBeExpandedLayout"), 1);
  -[CKMessageEntryView inputDelegate](self, "inputDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageEntryViewInputDidTakeFocus:", self);

}

- (void)messageEntryContentViewDidTapHandwritingKey:(id)a3
{
  id v4;

  -[CKMessageEntryView inputDelegate](self, "inputDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryViewHandwritingButtonHit:", self);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  objc_class *v10;
  void *v11;
  char v12;

  v6 = a4;
  v7 = a3;
  -[CKMessageEntryView swipeGestureRecognizer](self, "swipeGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("UIVariableDelayLoupeGesture"));

    v9 = v12 ^ 1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)photoButtonTouchDown:(id)a3
{
  CKMessageEntryViewInputDelegate **p_inputDelegate;
  id WeakRetained;
  char v6;
  id v7;

  p_inputDelegate = &self->_inputDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_inputDelegate);
    objc_msgSend(v7, "messageEntryViewPhotoButtonTouchDown:", self);

  }
}

- (void)photoButtonTouchUpOutside:(id)a3
{
  CKMessageEntryViewInputDelegate **p_inputDelegate;
  id WeakRetained;
  char v6;
  id v7;

  p_inputDelegate = &self->_inputDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_inputDelegate);
    objc_msgSend(v7, "messageEntryViewPhotoButtonTouchUpOutside:", self);

  }
}

- (void)photoButtonTouchCancel:(id)a3
{
  CKMessageEntryViewInputDelegate **p_inputDelegate;
  id WeakRetained;
  char v6;
  id v7;

  p_inputDelegate = &self->_inputDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_inputDelegate);
    objc_msgSend(v7, "messageEntryViewPhotoButtonTouchCancel:", self);

  }
}

- (void)photoButtonTapped:(id)a3
{
  CKMessageEntryViewInputDelegate **p_inputDelegate;
  id WeakRetained;
  char v6;
  void *v7;
  int v8;
  id v9;

  p_inputDelegate = &self->_inputDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAccessibilityPreferredContentSizeCategory");

    if (v8)
      -[CKMessageEntryView setEntryFieldCollapsed:animated:](self, "setEntryFieldCollapsed:animated:", 0, 1);
    v9 = objc_loadWeakRetained((id *)p_inputDelegate);
    objc_msgSend(v9, "messageEntryViewPhotoButtonHit:", self);

    -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_handlePlusButtonTouchInside:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;

  -[CKMessageEntryView composition](self, "composition", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasContent");

  if (v5)
    v6 = 2;
  else
    v6 = 1;
  -[CKMessageEntryView _updateSendMenuPresentationState:](self, "_updateSendMenuPresentationState:", v6);
}

- (void)plusButtonTouchDown:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;

  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CKMessageEntryView plusButtonTouchDown:].cold.1();

  -[CKMessageEntryView _handlePlusButtonTouchInside:](self, "_handlePlusButtonTouchInside:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    objc_msgSend(v8, "messageEntryView:touchDownInsidePlusButton:", self, v4);

  }
  if (!self->_plusButtonFeedbackGeneratorIsActive)
  {
    self->_plusButtonFeedbackGeneratorIsActive = 1;
    -[UISelectionFeedbackGenerator userInteractionStarted](self->_plusButtonFeedbackGenerator, "userInteractionStarted");
  }

}

- (void)plusButtonTouchUpOutside:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;

  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CKMessageEntryView plusButtonTouchUpOutside:].cold.1();

  -[CKMessageEntryView _updateSendMenuPresentationState:](self, "_updateSendMenuPresentationState:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    objc_msgSend(v8, "messageEntryView:touchUpOutsidePlusButton:", self, v4);

  }
  if (self->_plusButtonFeedbackGeneratorIsActive)
  {
    self->_plusButtonFeedbackGeneratorIsActive = 0;
    -[UISelectionFeedbackGenerator userInteractionEnded](self->_plusButtonFeedbackGenerator, "userInteractionEnded");
  }

}

- (void)plusButtonTouchCancel:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;

  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CKMessageEntryView plusButtonTouchCancel:].cold.1();

  -[CKMessageEntryView _updateSendMenuPresentationState:](self, "_updateSendMenuPresentationState:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    objc_msgSend(v8, "messageEntryView:touchCancelForPlusButton:", self, v4);

  }
  if (self->_plusButtonFeedbackGeneratorIsActive)
  {
    self->_plusButtonFeedbackGeneratorIsActive = 0;
    -[UISelectionFeedbackGenerator userInteractionCancelled](self->_plusButtonFeedbackGenerator, "userInteractionCancelled");
  }

}

- (void)plusButtonTouchDragEnter:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;

  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CKMessageEntryView plusButtonTouchDragEnter:].cold.1();

  -[CKMessageEntryView _handlePlusButtonTouchInside:](self, "_handlePlusButtonTouchInside:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    objc_msgSend(v8, "messageEntryView:touchDragEnterForPlusButton:", self, v4);

  }
  if (!self->_plusButtonFeedbackGeneratorIsActive)
  {
    self->_plusButtonFeedbackGeneratorIsActive = 1;
    -[UISelectionFeedbackGenerator userInteractionStarted](self->_plusButtonFeedbackGenerator, "userInteractionStarted");
  }

}

- (void)plusButtonTouchDragExit:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;

  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CKMessageEntryView plusButtonTouchDragExit:].cold.1();

  -[CKMessageEntryView _updateSendMenuPresentationState:](self, "_updateSendMenuPresentationState:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    objc_msgSend(v8, "messageEntryView:touchDragExitForPlusButton:", self, v4);

  }
  if (self->_plusButtonFeedbackGeneratorIsActive)
  {
    self->_plusButtonFeedbackGeneratorIsActive = 0;
    -[UISelectionFeedbackGenerator userInteractionEnded](self->_plusButtonFeedbackGenerator, "userInteractionEnded");
  }

}

- (void)didSelectPlusButton:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;

  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CKMessageEntryView didSelectPlusButton:].cold.1();

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    objc_msgSend(v8, "messageEntryView:didSelectPlusButton:", self, v4);

  }
  if (self->_plusButtonFeedbackGeneratorIsActive)
  {
    self->_plusButtonFeedbackGeneratorIsActive = 0;
    -[UISelectionFeedbackGenerator userInteractionEnded](self->_plusButtonFeedbackGenerator, "userInteractionEnded");
  }

}

- (void)plusButtonLongPressed:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  char v8;
  id v9;
  int v10;
  NSObject *v11;
  id v12;
  char v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CKMessageEntryView plusButtonLongPressed:].cold.3();

  v6 = objc_msgSend(v4, "state");
  if (v6 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0
      && (v9 = objc_loadWeakRetained((id *)&self->_inputDelegate),
          v10 = objc_msgSend(v9, "shouldLaunchPhotosAppForPlusButtonLongPressInMessageEntryView:", self),
          v9,
          !v10))
    {
      IMLogHandleForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[CKMessageEntryView plusButtonLongPressed:].cold.1();
    }
    else
    {
      objc_msgSend(v4, "view");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = objc_loadWeakRetained((id *)&self->_inputDelegate);
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        v14 = objc_loadWeakRetained((id *)&self->_inputDelegate);
        objc_msgSend(v14, "messageEntryView:didLongPressPlusButton:", self, v11);

      }
      if (self->_plusButtonFeedbackGeneratorIsActive)
      {
        -[UISelectionFeedbackGenerator selectionChanged](self->_plusButtonFeedbackGenerator, "selectionChanged");
        self->_plusButtonFeedbackGeneratorIsActive = 0;
        -[UISelectionFeedbackGenerator userInteractionEnded](self->_plusButtonFeedbackGenerator, "userInteractionEnded");
      }
    }
  }
  else
  {
    v15 = v6;
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CKMessageEntryView plusButtonLongPressed:].cold.2(v15, v11);
  }

}

- (void)browserButtonTapped:(id)a3
{
  CKMessageEntryViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  int v8;
  id v9;
  char v10;
  void *v11;
  int v12;
  id v13;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || (v7 = objc_loadWeakRetained((id *)p_delegate),
        v8 = objc_msgSend(v7, "shouldMessageEntryViewReportBrowserButtonHitToInputDelegate:", self),
        v7,
        v8))
  {
    v9 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isAccessibilityPreferredContentSizeCategory");

      if (v12)
        -[CKMessageEntryView setEntryFieldCollapsed:animated:](self, "setEntryFieldCollapsed:animated:", 0, 1);
      v13 = objc_loadWeakRetained((id *)&self->_inputDelegate);
      objc_msgSend(v13, "messageEntryViewBrowserButtonHit:", self);

      -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)arrowButtonTapped:(id)a3
{
  -[CKMessageEntryView setEntryFieldCollapsed:animated:](self, "setEntryFieldCollapsed:animated:", 1, 1);
}

- (void)collapsedPlaceholderLabelTapped:(id)a3
{
  -[CKMessageEntryView setEntryFieldCollapsed:animated:](self, "setEntryFieldCollapsed:animated:", 0, 1);
}

- (void)presentAudioActionButtons
{
  void *v3;
  void *v4;

  -[CKMessageEntryView cancelButton](self, "cancelButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCkTintColor:", 0xFFFFFFFFLL);

  -[CKMessageEntryView cancelButton](self, "cancelButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  -[CKMessageEntryView configureForDisplayMode:](self, "configureForDisplayMode:", 2);
}

- (void)dictationButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0CEA518]);
  objc_msgSend(v7, "setInvocationSource:", CFSTR("UIDictationInputModeInvocationSourceMicButtonInMessagesTextField"));
  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleDictationForResponder:WithOptions:", v6, v7);

}

- (double)_accessoryViewFadeDuration
{
  return 0.0;
}

- (void)beginSendMenuFullScreenPresentation
{
  -[CKMessageEntryView _updateSendMenuPresentationState:](self, "_updateSendMenuPresentationState:", 3);
}

- (void)beginSendMenuPopoverPresentation
{
  -[CKMessageEntryView _updateSendMenuPresentationState:](self, "_updateSendMenuPresentationState:", 3);
}

- (void)endSendMenuPresentation
{
  -[CKMessageEntryView _updateSendMenuPresentationState:](self, "_updateSendMenuPresentationState:", 0);
}

- (void)sendMenuPopoverMetricsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v4 = a3;
  -[CKMessageEntryView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageEntryViewActiveSendMenuPresentation:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(v6, "newPopoverLayoutMetrics");
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "state");
      if (v4 && objc_msgSend(v4, "state") == v9 || (unint64_t)(v9 - 1) >= 2)
      {
        -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
      }
      else
      {
        -[CKMessageEntryView layoutIfNeeded](self, "layoutIfNeeded");
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "entryViewSendMenuContentViewWidthAnimator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __54__CKMessageEntryView_sendMenuPopoverMetricsDidChange___block_invoke;
        v12[3] = &unk_1E274A208;
        v12[4] = self;
        objc_msgSend(v11, "addAnimations:", v12);
        objc_msgSend(v11, "startAnimation");

      }
    }

  }
}

uint64_t __54__CKMessageEntryView_sendMenuPopoverMetricsDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_setupWaveformView
{
  void *v3;
  CKMessageEntryWaveformView *v4;
  uint64_t v5;
  uint64_t v6;
  CKMessageEntryWaveformView *v7;
  _QWORD v8[7];

  -[CKMessageEntryView waveformView](self, "waveformView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [CKMessageEntryWaveformView alloc];
    v7 = -[CKMessageEntryWaveformView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKMessageEntryWaveformView setBackgroundColor:](v7, "setBackgroundColor:", 0);
    -[CKMessageEntryWaveformView setOpaque:](v7, "setOpaque:", 0);
    -[CKMessageEntryWaveformView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
    -[CKMessageEntryView setWaveformView:](self, "setWaveformView:", v7);
    -[CKMessageEntryWaveformView sizeThatFits:](v7, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__CKMessageEntryView__setupWaveformView__block_invoke;
    v8[3] = &unk_1E27506B0;
    v8[4] = self;
    v8[5] = v5;
    v8[6] = v6;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v8);

  }
}

uint64_t __40__CKMessageEntryView__setupWaveformView__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setWaveformViewSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)keyCommandSend:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CKMessageEntryView sendButtonEnabled](self, "sendButtonEnabled")
    && -[CKMessageEntryView shouldAllowSendWhenSendButtonDisabled](self, "shouldAllowSendWhenSendButtonDisabled"))
  {
    -[CKMessageEntryView touchUpInsideSendButton:](self, "touchUpInsideSendButton:", v4);
  }

}

- (void)touchUpInsideSendButton:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  os_activity_scope_state_s v12;

  v4 = a3;
  v5 = _os_activity_create(&dword_18DFCD000, "com.apple.messages.SendButtonTapped", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v5, &v12);
  if (-[CKMessageEntryView entryFieldCollapsed](self, "entryFieldCollapsed")
    && !-[CKMessageEntryView hasRecording](self, "hasRecording"))
  {
    -[CKMessageEntryView setEntryFieldCollapsed:animated:](self, "setEntryFieldCollapsed:animated:", 0, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("CKMessageEntryViewSendButtonPressedNotification"), 0);

    -[CKMessageEntryView contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collapseTextFieldsIfInPencilMode");

    -[CKMessageEntryView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageEntryViewSendButtonHit:", self);

    objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateLayout");

    if (-[CKMessageEntryView _isRunningInMVS](self, "_isRunningInMVS"))
    {
      -[CKMessageEntryView sendButton](self, "sendButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEnabled:", 0);

    }
    if (-[CKMessageEntryView hasRecording](self, "hasRecording"))
    {
      -[CKMessageEntryView audioMessageAppDelegate](self, "audioMessageAppDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "audioMessageDidSendMessage");

    }
  }
  os_activity_scope_leave(&v12);

}

- (BOOL)_canSend
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;

  -[CKMessageEntryView conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSendButtonEnabledOnPlatform"))
  {
    v6 = -[CKMessageEntryView sendButtonEnabled](self, "sendButtonEnabled");
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isSendButtonEnabledOnPlatform");

  }
  v8 = v6 & !-[CKMessageEntryView shouldRecordForService:](self, "shouldRecordForService:", v4);

  return v8;
}

- (void)showMessageEffectsHint
{
  void *v3;
  id v4;

  CKFrameworkBundle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MESSAGE_EFFECTS_COMPOSITION_HINT"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView showHintWithText:animatingReferenceButton:](self, "showHintWithText:animatingReferenceButton:", v3, 0);

}

- (void)showHintWithText:(id)a3 animatingReferenceButton:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CKMessageEntryHintView *v10;
  void *v11;
  CKMessageEntryHintView *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CKMessageEntryHintView *v23;
  CKMessageEntryHintView *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;

  v5 = a3;
  -[CKMessageEntryView audioButton](self, "audioButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView contentClipView](self, "contentClipView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView inputButtonContainerView](self, "inputButtonContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView sendButton](self, "sendButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [CKMessageEntryHintView alloc];
  objc_msgSend(v6, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView coverInsets](self, "coverInsets");
  v12 = -[CKMessageEntryHintView initWithReferenceButton:coverInsets:](v10, "initWithReferenceButton:coverInsets:", v11);

  -[CKMessageEntryHintView hintLabel](v12, "hintLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v5);

  -[CKMessageEntryView buttonAndTextAreaContainerView](self, "buttonAndTextAreaContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v12);

  -[CKMessageEntryView setHintView:](self, "setHintView:", v12);
  -[CKMessageEntryView configureForDisplayMode:](self, "configureForDisplayMode:", 1);
  -[CKMessageEntryView updateEntryView](self, "updateEntryView");
  -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
  -[CKMessageEntryView layoutIfNeeded](self, "layoutIfNeeded");
  -[CKMessageEntryHintView setHidden:animated:completion:](v12, "setHidden:animated:completion:", 0, 1, 0);
  objc_msgSend(v6, "setAlpha:", 0.0);
  v15 = (void *)MEMORY[0x1E0CEABB0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke;
  v28[3] = &unk_1E274A0B8;
  v16 = v7;
  v29 = v16;
  v17 = v8;
  v30 = v17;
  v18 = v9;
  v31 = v18;
  objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 327680, v28, 0, 0.5, 0.0);
  v24 = v12;
  v27 = v18;
  v25 = v6;
  v26 = v17;
  v19 = v18;
  v20 = v17;
  v21 = v16;
  v22 = v6;
  v23 = v12;
  im_dispatch_after();

}

uint64_t __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "setAlpha:", 0.0);
  objc_msgSend(a1[5], "setAlpha:", 0.0);
  return objc_msgSend(a1[6], "setAlpha:", 0.0);
}

void __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id location;

  location = 0;
  v2 = *(void **)(a1 + 32);
  v3 = objc_initWeak(&location, v2);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke_3;
  v11[3] = &unk_1E2750700;
  objc_copyWeak(&v12, &location);
  v11[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "setHidden:animated:completion:", 1, 1, v11);

  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
  v5 = (void *)MEMORY[0x1E0CEABB0];
  v6 = *(_QWORD *)(a1 + 80);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke_4;
  v7[3] = &unk_1E274A0B8;
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", v6, v7, 0, 0.5, 0.0);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

uint64_t __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setHintView:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "updateEntryView");
}

uint64_t __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke_4(id *a1)
{
  objc_msgSend(a1[4], "setAlpha:", 1.0);
  objc_msgSend(a1[5], "setAlpha:", 1.0);
  return objc_msgSend(a1[6], "setAlpha:", 1.0);
}

- (void)conversationPreferredServiceChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CKMessageEntryView updateEntryView](self, "updateEntryView", a3);
  -[CKMessageEntryView updateAppsMenu](self, "updateAppsMenu");
  -[CKMessageEntryView conversation](self, "conversation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

}

- (BOOL)shouldRecordForService:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAudioMessagesEntryViewRecordingEnabled");

  if ((v5 & 1) == 0)
  {
    -[CKMessageEntryView audioComposition](self, "audioComposition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return 0;
  }
  -[CKMessageEntryView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pluginView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    return 0;
  -[CKMessageEntryView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "composition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasContent");

  return v12 ^ 1;
}

- (void)updateAudioMessageRecordingAvailability
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[CKMessageEntryView conversation](self, "conversation");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPriusEnabled");

  if (!v4)
  {
    objc_msgSend(v14, "recipients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v14, "sendingService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "__ck_isSMS");

      if ((v10 & 1) != 0)
        goto LABEL_7;
      objc_msgSend(v14, "sendingService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CKMessageEntryView shouldRecordForService:](self, "shouldRecordForService:", v8))
        goto LABEL_9;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  -[CKMessageEntryView conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsCapabilities:", 64);

  if (v7)
  {
    objc_msgSend(v14, "sendingService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CKMessageEntryView shouldRecordForService:](self, "shouldRecordForService:", v8))
      goto LABEL_10;
LABEL_9:
    -[CKMessageEntryView composition](self, "composition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "hasContent") ^ 1;

LABEL_11:
    goto LABEL_12;
  }
LABEL_7:
  v11 = 0;
LABEL_12:
  -[CKMessageEntryView setAudioMessageRecordingAvailable:](self, "setAudioMessageRecordingAvailable:", v11);
  -[CKMessageEntryView audioMessageAppDelegate](self, "audioMessageAppDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "audioMessageRecordingAvailabilityChanged");

}

- (void)updateEntryView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  __CFString *v26;
  char v27;
  void *v28;
  unint64_t v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  char v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  __CFString *v60;
  NSObject *v61;
  int v62;
  const __CFString *v63;
  NSObject *v64;
  int v65;
  const __CFString *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  const __CFString *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  const __CFString *v79;
  NSObject *v80;
  void *v81;
  int v82;
  const __CFString *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  _BOOL4 v87;
  const __CFString *v88;
  NSObject *v89;
  void *v90;
  int v91;
  const __CFString *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  NSObject *v102;
  void *v103;
  uint64_t v104;
  const __CFString *v105;
  NSObject *v106;
  _BOOL4 v107;
  const __CFString *v108;
  NSObject *v109;
  _BOOL4 v110;
  const __CFString *v111;
  NSObject *v112;
  _BOOL4 v113;
  const __CFString *v114;
  BOOL v115;
  char v116;
  char v117;
  char v118;
  char v119;
  void *v120;
  int v121;
  unint64_t v122;
  char v123;
  BOOL v124;
  void *v125;
  _BOOL4 v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  int v134;
  void *v135;
  void *v136;
  char v137;
  __CFString *v138;
  char v139;
  void *v140;
  void *v141;
  BOOL v142;
  BOOL v143;
  int v144;
  _BOOL4 v145;
  void *v146;
  void *v147;
  _QWORD v148[5];
  char v149;
  char v150;
  BOOL v151;
  BOOL v152;
  char v153;
  char v154;
  BOOL v155;
  BOOL v156;
  uint8_t buf[4];
  __CFString *v158;
  __int16 v159;
  void *v160;
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  -[CKMessageEntryView conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSendButtonEnabledOnPlatform"))
  {
    v144 = -[CKMessageEntryView sendButtonEnabled](self, "sendButtonEnabled");
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend(v6, "isSendButtonEnabledOnPlatform");

  }
  v145 = -[CKMessageEntryView shouldRecordForService:](self, "shouldRecordForService:", v4);
  v143 = -[CKMessageEntryView shouldShowAudioButton](self, "shouldShowAudioButton");
  -[CKMessageEntryView updateAudioMessageRecordingAvailability](self, "updateAudioMessageRecordingAvailability");
  v142 = -[CKMessageEntryView pluginButtonsEnabled](self, "pluginButtonsEnabled");
  -[CKMessageEntryView conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastAddressedHandle");
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEntryView conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastAddressedSIMID");
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v3, "isBlockedByCommunicationLimits");
  -[CKMessageEntryView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", (v9 | -[CKMessageEntryView shouldBlurForMessageEditing](self, "shouldBlurForMessageEditing")) ^ 1);
  if (objc_msgSend(MEMORY[0x1E0D35918], "iMessageEnabledForSenderLastAddressedHandle:simID:", v147, v146))
  {
    -[CKMessageEntryView conversation](self, "conversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recipients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") != 0;

  }
  else
  {
    v12 = 0;
  }
  -[CKMessageEntryView contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isTextKit2Enabled");

  -[CKMessageEntryView conversation](self, "conversation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "chat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "supportsCapabilities:", 0x100000);

  -[CKMessageEntryView conversation](self, "conversation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "chat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    v21 = v18 & v15;
  else
    v21 = v12;

  objc_msgSend(v13, "textView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setExpressiveTextEnabled:", v21);

  if ((_DWORD)v21)
  {
    -[CKMessageEntryView contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "unpauseTextEffectsCoordinator");

  }
  if (!v9)
  {
    if (-[CKMessageEntryView hasFailedRecipients](self, "hasFailedRecipients")
      || -[CKMessageEntryView hasUnreachableEmergencyRecipient](self, "hasUnreachableEmergencyRecipient"))
    {
      v142 = 0;
    }
    -[CKMessageEntryView _placeholderTextForConversation:](self, "_placeholderTextForConversation:", v3);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = -[CKMessageEntryView _sendButtonColor](self, "_sendButtonColor");
    objc_msgSend(v13, "setPlaceholderText:", v141);
    objc_msgSend(v13, "setBalloonColor:", -[CKMessageEntryView _balloonColor](self, "_balloonColor"));
    objc_msgSend(v13, "setConversation:", v3);
    if ((objc_msgSend(v3, "isStewieConversation") & 1) != 0)
      v27 = 1;
    else
      v27 = objc_msgSend(v3, "isEmergencyTranscriptSharingConversation");
    objc_msgSend(v3, "recipients");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isMessagingActiveOverSatellite");

    objc_msgSend(v3, "handles");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "count"))
      v33 = objc_msgSend(v3, "isSatelliteSendingService");
    else
      v33 = 0;

    if (v29 < 2)
      v34 = v33;
    else
      v34 = 0;
    objc_msgSend(v13, "textView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    v37 = v31 ^ 1 | v34 | v27;
    if ((v37 & 1) != 0)
    {
      objc_msgSend(v35, "setEditable:", 1);

      objc_msgSend(v13, "textView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      v40 = 1;
    }
    else
    {
      objc_msgSend(v35, "setEditable:", 0);

      objc_msgSend(v13, "textView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      v40 = 0;
    }
    objc_msgSend(v38, "setUserInteractionEnabled:", v40);

    if (objc_msgSend(v3, "isStewieConversation"))
      objc_msgSend(v13, "setShouldStripEmojis:", 1);
    objc_msgSend(v3, "recipient");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "IDSCanonicalAddress");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAutocorrectionContext:", v42);

    objc_msgSend(v3, "chat");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "valueForChatProperty:", *MEMORY[0x1E0D359E0]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "BOOLValue");

    v46 = objc_msgSend(v4, "supportsCapability:", *MEMORY[0x1E0D38E68]) & (v45 ^ 1);
    if ((v46 & 1) != 0)
      v47 = 1;
    else
      v47 = objc_msgSend(v4, "supportsCapability:", *MEMORY[0x1E0D38DB0]);
    objc_msgSend(v13, "textView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setAcceptsPayloads:", v46);

    objc_msgSend(v13, "textView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setSendCurrentLocationFromKeyboardEnabled:", v47);

    v50 = objc_msgSend(v4, "__ck_isSMS");
    objc_msgSend(v13, "textView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setSmartDashesType:", v50);

    objc_msgSend(v13, "textView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setSmartQuotesType:", v50);

    objc_msgSend(v13, "subjectView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setSmartDashesType:", v50);

    objc_msgSend(v13, "subjectView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setSmartQuotesType:", v50);

    -[CKMessageEntryView sendButton](self, "sendButton");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v54) = objc_msgSend(v55, "isEnabled");

    if (v144 != (_DWORD)v54)
    {
      v56 = CFSTR("disable");
      if (v144)
        v56 = CFSTR("enable");
      v138 = v56;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v158 = v138;
          v159 = 2112;
          v160 = v3;
          _os_log_impl(&dword_18DFCD000, v57, OS_LOG_TYPE_INFO, "Will %@ Send Button... for conversation: %@", buf, 0x16u);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          -[CKMessageEntryView conversation](self, "conversation");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "sendingService");
          v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v158 = v60;
          _os_log_impl(&dword_18DFCD000, v58, OS_LOG_TYPE_INFO, "Conversation Sending Service: %@", buf, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v62 = objc_msgSend(MEMORY[0x1E0D35918], "iMessageEnabledForSenderLastAddressedHandle:simID:", v147, v146);
          v63 = CFSTR("NO");
          if (v62)
            v63 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v158 = (__CFString *)v63;
          _os_log_impl(&dword_18DFCD000, v61, OS_LOG_TYPE_INFO, "iMessage enabled: %@", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          v65 = objc_msgSend(MEMORY[0x1E0D35918], "smsEnabled");
          v66 = CFSTR("NO");
          if (v65)
            v66 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v158 = (__CFString *)v66;
          _os_log_impl(&dword_18DFCD000, v64, OS_LOG_TYPE_INFO, "SMS enabled: %@", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          v137 = v37;
          -[CKMessageEntryView composition](self, "composition");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "text");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKMessageEntryView contentView](self, "contentView");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "textView");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "compositionText");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v69, "isEqualToAttributedString:", v72);
          v74 = CFSTR("NO");
          if (v73)
            v74 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v158 = (__CFString *)v74;
          _os_log_impl(&dword_18DFCD000, v67, OS_LOG_TYPE_INFO, "Composition text matches contentView text: %@", buf, 0xCu);

          v37 = v137;
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          -[CKMessageEntryView composition](self, "composition");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "text");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v77, "length");
          v79 = CFSTR("YES");
          if (!v78)
            v79 = CFSTR("NO");
          *(_DWORD *)buf = 138412290;
          v158 = (__CFString *)v79;
          _os_log_impl(&dword_18DFCD000, v75, OS_LOG_TYPE_INFO, "Composition Length > 0: %@", buf, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          -[CKMessageEntryView composition](self, "composition");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend(v81, "hasContent");
          v83 = CFSTR("NO");
          if (v82)
            v83 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v158 = (__CFString *)v83;
          _os_log_impl(&dword_18DFCD000, v80, OS_LOG_TYPE_INFO, "Composition has content: %@", buf, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          -[CKMessageEntryView conversation](self, "conversation");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "sendingService");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = -[CKMessageEntryView shouldRecordForService:](self, "shouldRecordForService:", v86);
          v88 = CFSTR("NO");
          if (v87)
            v88 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v158 = (__CFString *)v88;
          _os_log_impl(&dword_18DFCD000, v84, OS_LOG_TYPE_INFO, "shouldRecordForService: %@", buf, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          -[CKMessageEntryView contentView](self, "contentView");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v90, "isShowingDictationPlaceholder");
          v92 = CFSTR("NO");
          if (v91)
            v92 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v158 = (__CFString *)v92;
          _os_log_impl(&dword_18DFCD000, v89, OS_LOG_TYPE_INFO, "isShowingDictationPlaceholder: %@", buf, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v93 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          -[CKMessageEntryView conversation](self, "conversation");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "pendingHandles");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = objc_msgSend(v95, "count");
          *(_DWORD *)buf = 134217984;
          v158 = (__CFString *)v96;
          _os_log_impl(&dword_18DFCD000, v93, OS_LOG_TYPE_INFO, "Conversation pendingHandles count: %lu", buf, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          -[CKMessageEntryView conversation](self, "conversation");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "chat");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "participants");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = objc_msgSend(v100, "count");
          *(_DWORD *)buf = 134217984;
          v158 = (__CFString *)v101;
          _os_log_impl(&dword_18DFCD000, v97, OS_LOG_TYPE_INFO, "Conversation chat participant count: %lu", buf, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v102 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
        {
          -[CKMessageEntryView conversation](self, "conversation");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = objc_msgSend(v103, "recipientCount");
          v105 = CFSTR("YES");
          if (!v104)
            v105 = CFSTR("NO");
          *(_DWORD *)buf = 138412290;
          v158 = (__CFString *)v105;
          _os_log_impl(&dword_18DFCD000, v102, OS_LOG_TYPE_INFO, "Recipient Count > 0: %@", buf, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
        {
          v107 = -[CKMessageEntryView isComposingRecipient](self, "isComposingRecipient");
          v108 = CFSTR("NO");
          if (v107)
            v108 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v158 = (__CFString *)v108;
          _os_log_impl(&dword_18DFCD000, v106, OS_LOG_TYPE_INFO, "Composing Recipients: %@", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
        {
          v110 = -[CKMessageEntryView hasFailedRecipients](self, "hasFailedRecipients");
          v111 = CFSTR("NO");
          if (v110)
            v111 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v158 = (__CFString *)v111;
          _os_log_impl(&dword_18DFCD000, v109, OS_LOG_TYPE_INFO, "Has Failed Recipients: %@", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v112 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
        {
          v113 = -[CKMessageEntryView hasUnreachableEmergencyRecipient](self, "hasUnreachableEmergencyRecipient");
          v114 = CFSTR("NO");
          if (v113)
            v114 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v158 = (__CFString *)v114;
          _os_log_impl(&dword_18DFCD000, v112, OS_LOG_TYPE_INFO, "Has Unreachable Emergency Recipient: %@", buf, 0xCu);
        }

      }
    }
    v115 = -[CKMessageEntryView _isDictationEnabled](self, "_isDictationEnabled");
    if (v145 && -[CKMessageEntryView displayMode](self, "displayMode") == 1)
    {
      v116 = objc_msgSend(MEMORY[0x1E0CEA6F8], "dictationInputModeIsFunctional");
      v117 = v37;
      v118 = !v115;
      v119 = v117 & v116;
    }
    else
    {
      v119 = 0;
      v118 = 1;
    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(v120, "isAudioMessagesEntryViewRecordingEnabled");

    if (v121)
    {
      v143 = -[CKMessageEntryView shouldShowAudioButton](self, "shouldShowAudioButton");
      v122 = -[CKMessageEntryView displayMode](self, "displayMode");
      v123 = v145;
      v118 = v143 || !v145 || !v115;
      if (v122 != 1)
        v123 = 1;
      LOBYTE(v145) = v123;
    }
    v124 = -[CKMessageEntryView isSendingMessage](self, "isSendingMessage");
    v148[0] = MEMORY[0x1E0C809B0];
    v148[1] = 3221225472;
    v148[2] = __37__CKMessageEntryView_updateEntryView__block_invoke;
    v148[3] = &unk_1E274C9C0;
    v148[4] = self;
    v149 = v118;
    v150 = v119;
    v151 = !v143;
    v152 = !v124;
    v153 = v139;
    v154 = v144;
    v155 = v145;
    v156 = v142;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v148);
    -[CKMessageEntryView sendButtonClickInteraction](self, "sendButtonClickInteraction");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v125 == 0;

    if (v126)
    {
      v127 = objc_alloc_init(MEMORY[0x1E0CEAC98]);
      -[CKMessageEntryView setSendButtonClickInteraction:](self, "setSendButtonClickInteraction:", v127);

    }
    -[CKMessageEntryView clickInteractionDelegate](self, "clickInteractionDelegate");
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    if (v128)
    {
      -[CKMessageEntryView clickInteractionDelegate](self, "clickInteractionDelegate");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView sendButtonClickInteraction](self, "sendButtonClickInteraction");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "setDelegate:", v129);

    }
    -[CKMessageEntryView sendButton](self, "sendButton");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "interactions");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView sendButtonClickInteraction](self, "sendButtonClickInteraction");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend(v132, "containsObject:", v133);

    if (((!-[CKMessageEntryView shouldAllowImpactSend](self, "shouldAllowImpactSend") | v134) & 1) != 0)
    {
      if (((-[CKMessageEntryView shouldAllowImpactSend](self, "shouldAllowImpactSend") | v134 ^ 1) & 1) != 0)
      {
LABEL_140:
        -[CKMessageEntryView updateKnockoutView](self, "updateKnockoutView");
        -[CKMessageEntryView updateBackgroundView](self, "updateBackgroundView");
        -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");

        goto LABEL_141;
      }
      -[CKMessageEntryView sendButton](self, "sendButton");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView sendButtonClickInteraction](self, "sendButtonClickInteraction");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "removeInteraction:", v136);
    }
    else
    {
      -[CKMessageEntryView sendButton](self, "sendButton");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView sendButtonClickInteraction](self, "sendButtonClickInteraction");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "addInteraction:", v136);
    }

    goto LABEL_140;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "chat");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "chatIdentifier");
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v158 = v26;
      _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "Disabling sendButton due to conversation being blocked by downtime with chatIdentifier: %@", buf, 0xCu);

    }
  }
LABEL_141:

}

void __37__CKMessageEntryView_updateEntryView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "dictationButton");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v20, "setEnabled:", *(unsigned __int8 *)(a1 + 41));
  objc_msgSend(*(id *)(a1 + 32), "audioButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", *(unsigned __int8 *)(a1 + 42));

  objc_msgSend(*(id *)(a1 + 32), "audioButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", *(unsigned __int8 *)(a1 + 43));

  if (objc_msgSend(*(id *)(a1 + 32), "shouldShowSendButton") && !CKIsRunningInMacCatalyst())
  {
    objc_msgSend(*(id *)(a1 + 32), "sendButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCkTintColor:", *(char *)(a1 + 44));
    if (objc_msgSend(*(id *)(a1 + 32), "entryFieldCollapsed"))
      objc_msgSend(v4, "setCkTintColor:", *(char *)(a1 + 44));
    objc_msgSend(v4, "setEnabled:", *(unsigned __int8 *)(a1 + 45));
    objc_msgSend(v4, "setHidden:", *(unsigned __int8 *)(a1 + 46));
    objc_msgSend(v4, "setUserInteractionEnabled:", *(unsigned __int8 *)(a1 + 43));
  }
  else
  {
    if (!CKIsRunningInMacCatalyst())
      goto LABEL_11;
    objc_msgSend(*(id *)(a1 + 32), "audioButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAudioMessagesEntryViewRecordingEnabled");

    if ((v6 & 1) == 0)
      objc_msgSend(v4, "setCkTintColor:", 0xFFFFFFFFLL);
    objc_msgSend(*(id *)(a1 + 32), "sendAudioButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCkTintColor:", objc_msgSend(*(id *)(a1 + 32), "_sendButtonColor"));

  }
LABEL_11:
  if (objc_msgSend(*(id *)(a1 + 32), "shouldShowPluginButtons"))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCkTintColor:", 0xFFFFFFFFLL);

    objc_msgSend(*(id *)(a1 + 32), "photoButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", *(unsigned __int8 *)(a1 + 47));

    objc_msgSend(*(id *)(a1 + 32), "photoButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInteractionEnabled:", *(unsigned __int8 *)(a1 + 43));

    objc_msgSend(*(id *)(a1 + 32), "browserButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCkTintColor:", objc_msgSend(v12, "entryViewButtonDefaultColor"));

    objc_msgSend(*(id *)(a1 + 32), "browserButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", *(unsigned __int8 *)(a1 + 47));

    objc_msgSend(*(id *)(a1 + 32), "browserButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUserInteractionEnabled:", *(unsigned __int8 *)(a1 + 43));

    v15 = objc_msgSend(*(id *)(a1 + 32), "_shouldEnablePlusButton");
    objc_msgSend(*(id *)(a1 + 32), "plusButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserInteractionEnabled:", v15);

    objc_msgSend(*(id *)(a1 + 32), "plusButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEnabled:", v15);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "photoButtonEnabled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "photoButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEnabled:", 0);

    objc_msgSend(*(id *)(a1 + 32), "photoButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setUserInteractionEnabled:", 0);

  }
}

- (BOOL)_isDictationEnabled
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v3 = (void *)getAFPreferencesClass_softClass;
  v21 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = (uint64_t)__getAFPreferencesClass_block_invoke;
    v16 = &unk_1E274A178;
    v17 = &v18;
    __getAFPreferencesClass_block_invoke((uint64_t)&v13);
    v3 = (void *)v19[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v4, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "dictationIsEnabled") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "suppressDictationOptIn") ^ 1;
  v7 = -[CKMessageEntryView dictationEnabledForLanguage](self, "dictationEnabledForLanguage");
  v13 = 0;
  v14 = (uint64_t)&v13;
  v15 = 0x2020000000;
  v8 = getAFDictationRestrictedSymbolLoc_ptr;
  v16 = getAFDictationRestrictedSymbolLoc_ptr;
  if (!getAFDictationRestrictedSymbolLoc_ptr)
  {
    v9 = (void *)AssistantServicesLibrary();
    v8 = dlsym(v9, "AFDictationRestricted");
    *(_QWORD *)(v14 + 24) = v8;
    getAFDictationRestrictedSymbolLoc_ptr = v8;
  }
  _Block_object_dispose(&v13, 8);
  if (!v8)
    -[CKMessageEntryView _isDictationEnabled].cold.1();
  v10 = v7 & (((uint64_t (*)(void))v8)() ^ 1);
  if (v6)
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

- (id)_placeholderTextForConversation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v16;
  int v17;
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
  uint64_t v30;
  __CFString *v31;
  void *v32;

  v4 = a3;
  if (objc_msgSend(v4, "recipientCount"))
  {
    objc_msgSend(v4, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isStewieEmergencyChat");

    if (v6)
    {
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("STEWIE_EMERGENCY_TEXT_ENTRY_PLACEHOLDER");
      v10 = CFSTR("ChatKit-SYDROB_FEATURES");
    }
    else
    {
      objc_msgSend(v4, "chat");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "shouldDisplayOffGridModeStatus");

      if (v13)
      {
        CKFrameworkBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE");
        v10 = CFSTR("ChatKit-CarrierPigeon");
      }
      else
      {
        objc_msgSend(v4, "chat");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isStewieRoadsideChat");

        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "chat");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "chatIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "roadsideProviderNameForChatIdentifier:", v20);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("STEWIE_ROADSIDE_TEXT_ENTRY_PLACEHOLDER"), &stru_1E276D870, CFSTR("ChatKit-Avocet"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "localizedStringWithFormat:", v23, v8);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_9;
        }
        if (objc_msgSend(v4, "isMapKitBusinessConversation"))
        {
          v24 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("BUSINESS_CHAT_TO"), &stru_1E276D870, CFSTR("ChatKit"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "recipient");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", v26, v28);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "userInterfaceLayoutDirection");

          if (v30 == 1)
            v31 = CFSTR("\u200F");
          else
            v31 = CFSTR("\u200E");
          -[__CFString stringByAppendingString:](v31, "stringByAppendingString:", v8);
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
        if (CKMessageEntryViewStyleIsForReply(-[CKMessageEntryView style](self, "style")))
        {
          CKFrameworkBundle();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          v9 = CFSTR("INLINE_REPLY_TEXT_ENTRY_PLACEHOLDER");
        }
        else
        {
          -[CKMessageEntryView sendLaterPluginInfo](self, "sendLaterPluginInfo");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v32)
          {
            objc_msgSend(v4, "sendingService");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "__ck_entryViewDisplayName");
            v14 = objc_claimAutoreleasedReturnValue();
            goto LABEL_8;
          }
          CKFrameworkBundle();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          v9 = CFSTR("SEND_LATER_TEXT_ENTRY_PLACEHOLDER");
        }
        v10 = CFSTR("ChatKit");
      }
    }
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E276D870, v10);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11 = (__CFString *)v14;
LABEL_9:

    goto LABEL_10;
  }
  v11 = &stru_1E276D870;
LABEL_10:

  return v11;
}

- (BOOL)_shouldEnablePlusButton
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;

  -[CKMessageEntryView conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    LOBYTE(v5) = objc_msgSend(v4, "supportsCapabilities:", 2048);
  }
  else
  {
    -[CKMessageEntryView conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendingService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "supportsCapability:", *MEMORY[0x1E0D38D80]);

    if (v8
      && (objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isSatelliteConnectionActive"),
          v9,
          (IMIsRunningInMessagesViewService() & 1) == 0))
    {
      v5 = (IMIsRunningInMessagesTranscriptExtension() | v10) ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (BOOL)_isApplePayCashInShelf
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  -[CKMessageEntryView composition](self, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shelfPluginPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsString:", *MEMORY[0x1E0D37620]) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[CKMessageEntryView composition](self, "composition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shelfPluginPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pluginBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "containsString:", *MEMORY[0x1E0D37628]);

  }
  return v6;
}

- (char)_balloonColor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  -[CKMessageEntryView conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "recipients"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "applyPayCashSendButtonColorForEntryViewStyle:", -[CKMessageEntryView style](self, "style"));

    if (!-[CKMessageEntryView _isApplePayCashInShelf](self, "_isApplePayCashInShelf"))
      v9 = objc_msgSend(v4, "sendButtonColor");
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (char)_sendButtonColor
{
  CKMessageEntryView *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;

  v2 = self;
  -[CKMessageEntryView conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "recipients"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    if (-[CKMessageEntryView _isApplePayCashInShelf](v2, "_isApplePayCashInShelf"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "theme");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v2) = objc_msgSend(v8, "applyPayCashSendButtonColorForEntryViewStyle:", -[CKMessageEntryView style](v2, "style"));

    }
    else
    {
      -[CKMessageEntryView sendLaterPluginInfo](v2, "sendLaterPluginInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        LOBYTE(v2) = 15;
      else
        v2 = (CKMessageEntryView *)objc_msgSend(v4, "sendButtonColor");
    }
  }
  else
  {
    LOBYTE(v2) = -1;
  }

  return (char)v2;
}

- (void)_contactLimitsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "[Event] Contact limits changed.", v6, 2u);
    }

  }
  -[CKMessageEntryView updateEntryView](self, "updateEntryView");

}

- (void)configureTextViewWithInputContextHistoryFromTranscript
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKMessageEntryView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputContextHistoryForMessageEntryView:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputContextHistory:", v3);

}

- (BOOL)sendButtonEnabled
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  _BOOL4 v38;
  _BOOL4 v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  NSObject *v47;
  BOOL v48;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  uint64_t v56;
  _BOOL4 v57;
  NSObject *v58;
  void *v59;
  int v60;
  _BOOL4 v61;
  __int16 v62;
  _BOOL4 v63;
  __int16 v64;
  _BOOL4 v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  -[CKMessageEntryView composition](self, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasContent");

  -[CKMessageEntryView conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendingService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v4 & 1) == 0 && !-[CKMessageEntryView shouldRecordForService:](self, "shouldRecordForService:", v6)
    || (-[CKMessageEntryView contentView](self, "contentView"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isShowingDictationPlaceholder"),
        v7,
        v8))
  {
    v9 = -[CKMessageEntryView shouldRecordForService:](self, "shouldRecordForService:", v6);
    -[CKMessageEntryView contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isShowingDictationPlaceholder");

    if (!IMOSLoggingEnabled())
    {
LABEL_49:
      v48 = 0;
      goto LABEL_50;
    }
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v60 = 67109632;
      v61 = v4;
      v62 = 1024;
      v63 = v11;
      v64 = 1024;
      v65 = v9;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Send Button: Disabled > hasContent: %{BOOL}d, isShowingDictationPlaceholder: %{BOOL}d, isAudioMessagingAvailable: %{BOOL}d", (uint8_t *)&v60, 0x14u);
    }
LABEL_7:

    goto LABEL_49;
  }
  -[CKMessageEntryView conversation](self, "conversation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isStewieConversation");

  if (v14)
  {
    -[CKMessageEntryView composition](self, "composition");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v19, "length"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LOWORD(v60) = 0;
          _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Send Button: Disabled > conversation is Stewie and trimmed text length is 0", (uint8_t *)&v60, 2u);
        }
        goto LABEL_24;
      }
      goto LABEL_48;
    }
    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isStewieActive");

    if ((v21 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LOWORD(v60) = 0;
          _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Send Button: Disabled > conversation is Stewie and stewie is not active", (uint8_t *)&v60, 2u);
        }
        goto LABEL_24;
      }
LABEL_48:

      goto LABEL_49;
    }
    -[CKMessageEntryView conversation](self, "conversation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "chat");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isStewieEmergencyChat") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isStewieEmergencyActive");

      if ((v25 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            LOWORD(v60) = 0;
            _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Send Button: Disabled > conversation is Stewie emergency chat and stewie emergency is not active", (uint8_t *)&v60, 2u);
          }
LABEL_24:

          goto LABEL_48;
        }
        goto LABEL_48;
      }
    }
    else
    {

    }
    -[CKMessageEntryView conversation](self, "conversation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "chat");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isStewieRoadsideChat");

    if (v29)
    {
      objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isStewieRoadsideActive");

      objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "mostRecentlyUsedRoadsideChatIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
        goto LABEL_67;
      -[CKMessageEntryView conversation](self, "conversation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "chat");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "chatIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", v33);

      if ((v37 & 1) == 0)
      {
LABEL_67:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            LOWORD(v60) = 0;
            _os_log_impl(&dword_18DFCD000, v47, OS_LOG_TYPE_INFO, "Send Button: Disabled > conversation is Stewie roadside chat and stewie roadside is not active or current chat is not mostRecentlyUsedRoadsideChatIdentifier.", (uint8_t *)&v60, 2u);
          }

        }
        goto LABEL_48;
      }

    }
  }
  if (-[CKMessageEntryView _isExceedingByteLimitForService:](self, "_isExceedingByteLimitForService:", v6))
    goto LABEL_49;
  if (-[CKMessageEntryView hasFailedRecipients](self, "hasFailedRecipients")
    || -[CKMessageEntryView hasUnreachableEmergencyRecipient](self, "hasUnreachableEmergencyRecipient"))
  {
    v38 = -[CKMessageEntryView hasFailedRecipients](self, "hasFailedRecipients");
    v39 = -[CKMessageEntryView hasUnreachableEmergencyRecipient](self, "hasUnreachableEmergencyRecipient");
    if (!IMOSLoggingEnabled())
      goto LABEL_49;
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v60 = 67109376;
      v61 = v38;
      v62 = 1024;
      v63 = v39;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Send Button: Disabled > hasFailedRecipients: %{BOOL}d, hasUnreachableEmergencyRecipient: %{BOOL}d", (uint8_t *)&v60, 0xEu);
    }
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "isCarrierPigeonEnabled");

  if (v41)
  {
    -[CKMessageEntryView conversation](self, "conversation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "isPending"))
    {
      -[CKMessageEntryView conversation](self, "conversation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "recipients");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v44, "count") > 1)
      {
        objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "isMessagingActiveOverSatellite");

        if ((v46 & 1) != 0)
          goto LABEL_49;
        goto LABEL_53;
      }

    }
LABEL_53:
    -[CKMessageEntryView conversation](self, "conversation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v50, "isStewieConversation"))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "isMessagingActiveOverSatellite");

      if (v52)
      {
        -[CKMessageEntryView conversation](self, "conversation");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isSatelliteSendingService");

        if (!v54)
          goto LABEL_49;
      }
    }
  }
  -[CKMessageEntryView conversation](self, "conversation");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "recipientCount");

  v57 = -[CKMessageEntryView isComposingRecipient](self, "isComposingRecipient");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v60 = 67109376;
      v61 = v56 != 0;
      v62 = 1024;
      v63 = v57;
      _os_log_impl(&dword_18DFCD000, v58, OS_LOG_TYPE_INFO, "Send Button: > hasRecipients: %{BOOL}d, isComposingRecipient: %{BOOL}d", (uint8_t *)&v60, 0xEu);
    }

  }
  -[CKMessageEntryView conversation](self, "conversation");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v59, "recipientCount"))
    v48 = 1;
  else
    v48 = -[CKMessageEntryView isComposingRecipient](self, "isComposingRecipient");

LABEL_50:
  return v48;
}

- (BOOL)_isExceedingByteLimitForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  BOOL v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKMessageEntryView conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldDisplayOffGridModeStatus");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D35910], "iMessageLiteService");
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  objc_msgSend(v4, "serviceProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", *MEMORY[0x1E0D38FB8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  if (v11 < 1)
    goto LABEL_11;
  -[CKMessageEntryView composition](self, "composition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;

  if (objc_msgSend(v14, "lengthOfBytesUsingEncoding:", 4) <= v11)
  {

LABEL_11:
    v19 = 0;
    goto LABEL_12;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Send Button: Disabled, exceeding maximum byte limit: %@ for service: %@", (uint8_t *)&v21, 0x16u);

    }
  }

  v19 = 1;
LABEL_12:

  return v19;
}

- (BOOL)shouldAllowSendWhenSendButtonDisabled
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSendButtonEnabledOnPlatform");

  if ((v4 & 1) != 0)
    return 1;
  -[CKMessageEntryView conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastFinishedMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7
      || !-[CKMessageEntryView hasFailedRecipients](self, "hasFailedRecipients")
      && !-[CKMessageEntryView hasUnreachableEmergencyRecipient](self, "hasUnreachableEmergencyRecipient");
}

- (BOOL)pluginButtonsEnabled
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  char v18;

  -[CKMessageEntryView conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "recipientCount");

  if (v4)
  {
    -[CKMessageEntryView composition](self, "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMessageEntryView conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "canAcceptMediaObjectType:givenMediaObjects:", 2, v6))
    {

    }
    else
    {
      -[CKMessageEntryView conversation](self, "conversation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "canAcceptMediaObjectType:givenMediaObjects:", 3, v6);

      if (!v9)
        return 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCarrierPigeonEnabled");

  if (v11)
  {
    -[CKMessageEntryView conversation](self, "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendingService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "__ck_isSatelliteSMS");

    if ((v14 & 1) != 0)
      return 0;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "stewieEnabled");

  if (v16)
  {
    -[CKMessageEntryView conversation](self, "conversation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isStewieConversation");

    if ((v18 & 1) != 0)
      return 0;
  }
  if (-[CKMessageEntryView shouldDisablePluginButtons](self, "shouldDisablePluginButtons"))
    return 0;
  return !-[CKMessageEntryView _isRunningInMVS](self, "_isRunningInMVS");
}

- (BOOL)photoButtonEnabled
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v10;
  char v11;

  if (-[CKMessageEntryView _isRunningInMVS](self, "_isRunningInMVS"))
    return 0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "entryViewSupportsPhotoButton");

  if (!v4)
    return 0;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "stewieEnabled");

  if (v6)
  {
    -[CKMessageEntryView conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isStewieConversation");

    if ((v8 & 1) != 0)
      return 0;
  }
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCameraAllowed");

  return v11;
}

- (BOOL)shouldShowAudioButton
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  const char *v27;
  uint8_t v29[16];

  -[CKMessageEntryView audioButton](self, "audioButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  -[CKMessageEntryView conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendingService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKMessageEntryView shouldRecordForService:](self, "shouldRecordForService:", v6);

  if (v7)
  {
    if (-[CKMessageEntryView displayMode](self, "displayMode") != 1)
    {
      if ((v4 & 1) == 0)
      {
        v8 = IMOSLoggingEnabled();
        if (v8)
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v29 = 0;
            v10 = "Hiding audio button because the display mode is not text";
            goto LABEL_16;
          }
          goto LABEL_17;
        }
        return v8;
      }
      goto LABEL_18;
    }
    if (-[CKMessageEntryView _isRunningInMVS](self, "_isRunningInMVS"))
    {
      if ((v4 & 1) == 0)
      {
        v8 = IMOSLoggingEnabled();
        if (v8)
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v29 = 0;
            v10 = "Hiding the audio button because we are running in MessagesViewService";
LABEL_16:
            _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, v10, v29, 2u);
            goto LABEL_17;
          }
          goto LABEL_17;
        }
        return v8;
      }
LABEL_18:
      LOBYTE(v8) = 0;
      return v8;
    }
    if (-[CKMessageEntryView isRunningInNotificationExtension](self, "isRunningInNotificationExtension"))
    {
      if ((v4 & 1) != 0)
        goto LABEL_18;
      v8 = IMOSLoggingEnabled();
      if (!v8)
        return v8;
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_17;
      *(_WORD *)v29 = 0;
      v10 = "Not showing the audio button because we are running in the Notification Extension";
      goto LABEL_16;
    }
    -[CKMessageEntryView conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isStewieConversation");

    if (v12)
    {
      if ((v4 & 1) != 0)
        goto LABEL_18;
      v8 = IMOSLoggingEnabled();
      if (!v8)
        return v8;
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_17;
      *(_WORD *)v29 = 0;
      v10 = "Not showing the audio button because this is a stewie conversation";
      goto LABEL_16;
    }
    -[CKMessageEntryView conversation](self, "conversation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "supportsCapabilities:", 0x10000);

    if ((v15 & 1) == 0)
    {
      v8 = IMOSLoggingEnabled();
      if (!v8)
        return v8;
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_17;
      *(_WORD *)v29 = 0;
      v10 = "Not showing the audio button because chat does not support capability.";
      goto LABEL_16;
    }
    if (CKIsRunningInMacCatalyst())
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isCarrierPigeonEnabled");

      if (v17)
      {
        -[CKMessageEntryView contentView](self, "contentView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "textView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "text");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "length");

        if (v21)
          goto LABEL_18;
      }
      -[CKMessageEntryView sendLaterPluginInfo](self, "sendLaterPluginInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v8 = IMOSLoggingEnabled();
        if (!v8)
          return v8;
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          goto LABEL_17;
        *(_WORD *)v29 = 0;
        v10 = "Not showing audioButton because we have SendLater staged.";
        goto LABEL_16;
      }
      if (!v4 || !IMOSLoggingEnabled())
        goto LABEL_57;
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        goto LABEL_56;
      *(_WORD *)v29 = 0;
      v27 = "Showing the audio button because we are running on Catalyst and the send button is hidden";
    }
    else if (-[CKMessageEntryView _isDictationEnabled](self, "_isDictationEnabled"))
    {
      -[CKMessageEntryView conversation](self, "conversation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "chat");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "shouldShowAudioButtonInEntryView");

      if (!v25)
      {
        if ((v4 & 1) != 0)
          goto LABEL_18;
        v8 = IMOSLoggingEnabled();
        if (!v8)
          return v8;
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          goto LABEL_17;
        *(_WORD *)v29 = 0;
        v10 = "Defaulting to hiding the audio button";
        goto LABEL_16;
      }
      if (!v4 || !IMOSLoggingEnabled())
        goto LABEL_57;
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        goto LABEL_56;
      *(_WORD *)v29 = 0;
      v27 = "Showing the audio button because the chat prefers it";
    }
    else
    {
      if (!v4 || !IMOSLoggingEnabled())
        goto LABEL_57;
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
LABEL_56:

LABEL_57:
        LOBYTE(v8) = 1;
        return v8;
      }
      *(_WORD *)v29 = 0;
      v27 = "Showing the audio button because dictation is disabled";
    }
    _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, v27, v29, 2u);
    goto LABEL_56;
  }
  if ((v4 & 1) != 0)
    goto LABEL_18;
  v8 = IMOSLoggingEnabled();
  if (v8)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v29 = 0;
      v10 = "Hiding audio button because the send button is showing";
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  return v8;
}

- (BOOL)_isRunningInMVS
{
  return CKIsRunningInMessagesViewService() != 0;
}

- (void)loadRecordedAudioViewsIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  CKMessageEntryRecordedAudioView *v6;
  CKMessageEntryRecordedAudioView *v7;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAudioMessagesEntryViewRecordingEnabled");

  if ((v4 & 1) == 0)
  {
    -[CKMessageEntryView recordedAudioView](self, "recordedAudioView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = [CKMessageEntryRecordedAudioView alloc];
      v7 = -[CKMessageEntryRecordedAudioView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKMessageEntryRecordedAudioView setBackgroundColor:](v7, "setBackgroundColor:", 0);
      -[CKMessageEntryRecordedAudioView setOpaque:](v7, "setOpaque:", 0);
      -[CKMessageEntryRecordedAudioView setDelegate:](v7, "setDelegate:", self);
      -[CKMessageEntryView setRecordedAudioView:](self, "setRecordedAudioView:", v7);
      -[CKMessageEntryView setNeedsLayout](self, "setNeedsLayout");
      v5 = v7;
    }

  }
}

- (void)_swipeDownGestureRecognized:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKMessageEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageEntryViewSwipeDownGestureRecognized:", self);

  }
}

- (void)textEffectsWindowOffsetDidChange:(id)a3
{
  -[CKMessageEntryView frame](self, "frame", a3);
  -[CKMessageEntryView setFrame:](self, "setFrame:");
}

- (void)sendCurrentLocationMessage
{
  id v3;

  -[CKMessageEntryView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendCurrentLocationMessage:", self);

}

- (void)_dictationAvailabilityDidChange
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enabledDictationLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView setDictationEnabledForLanguage:](self, "setDictationEnabledForLanguage:", objc_msgSend(v4, "count") != 0);

  -[CKMessageEntryView updateEntryView](self, "updateEntryView");
}

- (void)appSelectionInterfaceSelectedItem:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKMessageEntryView inputDelegate](self, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKMessageEntryView inputDelegate](self, "inputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageEntryViewSelectedAppMenuItem:", v7);

  }
}

- (void)updateAppsMenu
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
  id v14;

  if (CKIsRunningInMacCatalyst())
  {
    -[CKMessageEntryView browserButton](self, "browserButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CKMessageEntryView browserButton](self, "browserButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "button");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView entryViewTraitCollection](self, "entryViewTraitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView conversation](self, "conversation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAppMenuDataSource appMenuWithTarget:traitCollection:conversation:](CKAppMenuDataSource, "appMenuWithTarget:traitCollection:conversation:", self, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMenu:", v8);

    }
    -[CKMessageEntryView plusButton](self, "plusButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CKMessageEntryView plusButton](self, "plusButton");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "button");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView entryViewTraitCollection](self, "entryViewTraitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView conversation](self, "conversation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAppMenuDataSource appMenuWithTarget:traitCollection:conversation:](CKAppMenuDataSource, "appMenuWithTarget:traitCollection:conversation:", self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMenu:", v13);

    }
  }
}

- (void)messageEntryRecordedAudioView:(id)a3 mediaObjectDidFinishPlaying:(id)a4
{
  id v4;

  -[CKMessageEntryView audioMessageAppDelegate](self, "audioMessageAppDelegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioMessageDidEndPlayback");

}

- (void)messageEntryRecordedAudioViewPressedPlay:(id)a3
{
  -[CKMessageEntryView _startPlaying:](self, "_startPlaying:", 1);
}

- (void)messageEntryRecordedAudioViewPressedPause:(id)a3
{
  -[CKMessageEntryView _pausePlaying:](self, "_pausePlaying:", 1);
}

- (void)messageEntryRecordedAudioViewPressedDelete:(id)a3
{
  void *v4;

  if (-[CKMessageEntryView hasRecording](self, "hasRecording", a3))
  {
    -[CKMessageEntryView audioMessageAppDelegate](self, "audioMessageAppDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioMessageDidCancelMessage");

  }
  -[CKMessageEntryView setAudioComposition:](self, "setAudioComposition:", 0);
  -[CKMessageEntryView configureForDisplayMode:](self, "configureForDisplayMode:", 1);
}

- (void)messageEntryRecordedAudioViewPlaybackProgressDidChange:(double)a3
{
  id v4;

  -[CKMessageEntryView audioMessageAppDelegate](self, "audioMessageAppDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioMessageDidChangeCurrentPlaybackTime:", a3);

}

- (void)messageEntryRecordedAudioViewPlaybackDidStop
{
  id v3;

  if (-[CKMessageEntryView hasRecording](self, "hasRecording"))
  {
    -[CKMessageEntryView audioMessageAppDelegate](self, "audioMessageAppDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "audioMessageDidEndPlayback");

  }
}

- (void)_trackAudioMessageRecordingStarted
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackEvent:", *MEMORY[0x1E0D384B0]);

}

- (void)_trackAudioMessageSentWithComposition:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0D39958];
    v4 = a3;
    objc_msgSend(v3, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackEvent:", *MEMORY[0x1E0D384B8]);

    objc_msgSend(v4, "mediaObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "duration");
      v9 = v8;
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x1E0D384C0];
      v14 = CFSTR("AudioMessageDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trackEvent:withDictionary:", v11, v13);

    }
  }
}

- (void)startRecordingForRaiseGesture
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  uint8_t v11[16];

  -[CKMessageEntryView recorder](self, "recorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView audioComposition](self, "audioComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Not allowing audio recording invoked by raise to record gesture due to already existing audio composition.", v11, 2u);
      }
LABEL_10:

    }
  }
  else
  {
    -[CKMessageEntryView conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendingService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CKMessageEntryView shouldRecordForService:](self, "shouldRecordForService:", v7))
    {

      goto LABEL_12;
    }
    v8 = objc_msgSend(v3, "isRecording");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isAudioMessagesEntryViewRecordingEnabled");

      if (v10)
        -[CKMessageEntryView setRecordingStartedFromRaiseGesture:](self, "setRecordingStartedFromRaiseGesture:", 1);
      objc_msgSend(v3, "startRecordingForRaiseGesture:shouldPlaySound:", 1, 0);
      -[CKMessageEntryView audioMessageAppDelegate](self, "audioMessageAppDelegate");
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject audioMessageStartedRecordingFromMessages](v5, "audioMessageStartedRecordingFromMessages");
      goto LABEL_10;
    }
  }
LABEL_12:

}

- (void)stopRecordingForRaiseGestureWithFailure:(BOOL)a3
{
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  CKMessageEntryView *v17;
  BOOL v18;
  _QWORD v19[5];
  BOOL v20;
  uint8_t buf[16];

  -[CKMessageEntryView recorder](self, "recorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAudioMessagesEntryViewRecordingEnabled");

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Stopping audio recording invoked by raise to record gesture.", buf, 2u);
      }

    }
    -[CKMessageEntryView setRecordingStartedFromRaiseGesture:](self, "setRecordingStartedFromRaiseGesture:", 0);
    if (v5)
    {
      -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[CKMessageEntryView audioComposition](self, "audioComposition");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v12 = "Raise to record gesture attempted with an existing audio message.";
LABEL_20:
              _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
              goto LABEL_21;
            }
            goto LABEL_21;
          }
        }
        else
        {
          -[CKMessageEntryView recorder](self, "recorder");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setPaused:", 1);

          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Stopping audio recorder.", buf, 2u);
            }

          }
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __62__CKMessageEntryView_stopRecordingForRaiseGestureWithFailure___block_invoke;
          v19[3] = &unk_1E2756D40;
          v19[4] = self;
          v20 = a3;
          objc_msgSend(v5, "stopRecordingAndPlaySound:completion:", 1, v19);
        }
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v12 = "Tried to stop a recording with a nil audio recording view.";
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v12 = "Tried to stop a recording with a nil audio recorder.";
        goto LABEL_20;
      }
LABEL_21:

    }
  }
  else if (objc_msgSend(v5, "isRecording"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__CKMessageEntryView_stopRecordingForRaiseGestureWithFailure___block_invoke_459;
    v15[3] = &unk_1E2756D68;
    v18 = a3;
    v16 = v5;
    v17 = self;
    objc_msgSend(v16, "stopRecordingAndPlaySound:completion:", 1, v15);

  }
}

void __62__CKMessageEntryView_stopRecordingForRaiseGestureWithFailure___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "audioComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || v4)
  {
    if (!v3)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Raise to record Audio recording canceled because there is no composition", v22, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "recorder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPaused:", 0);

      objc_msgSend(*(id *)(a1 + 32), "clearAudioRecordingUI");
    }
  }
  else
  {
    objc_msgSend(v3, "mediaObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "duration");
    if (*(_BYTE *)(a1 + 40)
      || (v8 = v7,
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "raiseToTalkErrorMaxDuration"),
          v11 = v10,
          v9,
          v8 < v11))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Raise to record Audio recording canceled because it was too short", buf, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "clearAudioRecordingUI");
    }
    else
    {
      if (v6)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Raise to record Audio recording completed with valid audio media object. Setting up recording view for playback.", v23, 2u);
          }

        }
        objc_msgSend(*(id *)(a1 + 32), "audioRecordingView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPlaybackDuration:", v8);

        objc_msgSend(*(id *)(a1 + 32), "audioRecordingView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setState:", 2);

        objc_msgSend(*(id *)(a1 + 32), "audioRecordingView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "intensities");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setPowerLevels:", v19);

        objc_msgSend(*(id *)(a1 + 32), "conversation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setUnsentComposition:", v3);

        objc_msgSend(*(id *)(a1 + 32), "audioRecordingView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setPlaybackCurrentTime:", NAN);

      }
      objc_msgSend(*(id *)(a1 + 32), "setAudioComposition:", v3);
      objc_msgSend(*(id *)(a1 + 32), "configureForDisplayMode:", 3);
    }

  }
}

void __62__CKMessageEntryView_stopRecordingForRaiseGestureWithFailure___block_invoke_459(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  BOOL v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  _BOOL4 v18;
  void *v19;
  double v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "duration");
  v5 = v4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("YES");
      if (*(_BYTE *)(a1 + 48))
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      if (!v3)
        v7 = CFSTR("NO");
      v24 = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Stop recording with failure detected: %@, composition: %@", (uint8_t *)&v24, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "audioComposition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v10 = v9 == 0;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend(v3, "mediaObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "waveformView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "powerLevels");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPowerLevels:", v15);

    objc_msgSend(*(id *)(a1 + 40), "setAudioComposition:", v3);
    if (!*(_BYTE *)(a1 + 48)
      || (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "raiseToTalkErrorMaxDuration"),
          v18 = v5 < v17,
          v16,
          !v18))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "raiseToTalkAutoSendMaxDuration");
      if (v5 >= v20)
      {

      }
      else
      {
        v21 = *(_BYTE *)(a1 + 48) == 0;

        if (v21)
        {
          objc_msgSend(*(id *)(a1 + 40), "delegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "messageEntryViewRaiseGestureAutoSend:", *(_QWORD *)(a1 + 40));

          goto LABEL_21;
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "configureForDisplayMode:", 3);
      objc_msgSend(*(id *)(a1 + 40), "audioMessageAppDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "audioMessageStoppedRecordingFromMessages");

      goto LABEL_27;
    }
    objc_msgSend(*(id *)(a1 + 40), "configureForDisplayMode:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setAudioComposition:", 0);
    objc_msgSend(*(id *)(a1 + 40), "configureForDisplayMode:", 1);
  }
LABEL_21:
  objc_msgSend(*(id *)(a1 + 40), "setPowerLevels:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setDuration:", 0.0);
LABEL_27:

}

- (void)cancelAudioMessage
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[CKMessageEntryView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableRotationAfterRecording");

  -[CKMessageEntryView setAudioComposition:](self, "setAudioComposition:", 0);
  -[CKMessageEntryView recorder](self, "recorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRecording");

  if (v5)
  {
    -[CKMessageEntryView recorder](self, "recorder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelRecording");

  }
  -[CKMessageEntryView audioMessageAppDelegate](self, "audioMessageAppDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioMessageDidCancelMessage");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__CKMessageEntryView_cancelAudioMessage__block_invoke;
  v8[3] = &unk_1E274A208;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v8, 1.0);
}

uint64_t __40__CKMessageEntryView_cancelAudioMessage__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearAudioRecordingUI");
  return objc_msgSend(*(id *)(a1 + 32), "configureForDisplayMode:", 1);
}

- (void)startPlaying
{
  -[CKMessageEntryView _startPlaying:](self, "_startPlaying:", 0);
}

- (void)_startPlaying:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CKMessageEntryView recordedAudioView](self, "recordedAudioView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "play");

  if (v3)
  {
    -[CKMessageEntryView audioMessageAppDelegate](self, "audioMessageAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioMessageDidStartPlayback");

  }
}

- (void)pausePlaying
{
  -[CKMessageEntryView _pausePlaying:](self, "_pausePlaying:", 0);
}

- (void)_pausePlaying:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CKMessageEntryView recordedAudioView](self, "recordedAudioView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pause");

  if (v3)
  {
    -[CKMessageEntryView audioMessageAppDelegate](self, "audioMessageAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioMessageDidEndPlayback");

  }
}

- (void)disableRotationWhileRecordingAudioMessage
{
  void *v3;
  char v4;
  id v5;

  -[CKMessageEntryView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "disableRotationWhileRecordingAudioMessage");

  }
}

- (void)audioRecorderDidStartRecording:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAudioMessagesEntryViewRecordingEnabled");

  if (v5)
    -[CKMessageEntryView disableRotationWhileRecordingAudioMessage](self, "disableRotationWhileRecordingAudioMessage");
  -[CKMessageEntryView _trackAudioMessageRecordingStarted](self, "_trackAudioMessageRecordingStarted");
  -[CKMessageEntryView configureForDisplayMode:](self, "configureForDisplayMode:", 2);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAudioMessagesEntryViewRecordingEnabled");

  if (v7)
  {
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setState:", 1);

    -[CKMessageEntryView audioComposition](self, "audioComposition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[CKMessageEntryView inputDelegate](self, "inputDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0)
        return;
      -[CKMessageEntryView inputDelegate](self, "inputDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "messageEntryViewDidStageAudioRecordingUI:", self);
      v9 = v12;
    }

  }
}

- (void)audioRecorderRecordingDidChange:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isRecording"))
  {
    -[CKMessageEntryView waveformView](self, "waveformView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearPowerLevels");
    objc_msgSend(v4, "setDuration:", 0.0);
    -[CKMessageEntryView setPowerLevels:](self, "setPowerLevels:", 0);
    -[CKMessageEntryView setDuration:](self, "setDuration:", 0.0);

  }
  -[CKMessageEntryView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageEntryViewRecordingDidChange:", self);

  -[CKMessageEntryView updateEntryView](self, "updateEntryView");
}

- (void)audioRecorderRecordingDidFail:(id)a3
{
  -[CKMessageEntryView configureForDisplayMode:](self, "configureForDisplayMode:", 1);
  -[CKMessageEntryView showAudioHintWithReason:](self, "showAudioHintWithReason:", 2);
}

- (void)audioRecorderDidUpdateAveragePower:(float)a3
{
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAudioMessagesEntryViewRecordingEnabled");

  if (v6)
  {
    if (-[CKMessageEntryView recordingStartedFromRaiseGesture](self, "recordingStartedFromRaiseGesture"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "audioRecordingViewMinimumDBLevel");
      v9 = v8;

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "audioRecordingViewMaximumDBLevel");
      v12 = v11;

      -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addToWaveformWithIntensity:", (a3 - v9) / (v12 - v9));

    }
  }
  else
  {
    -[CKMessageEntryView recorder](self, "recorder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView waveformView](self, "waveformView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "duration");
    objc_msgSend(v14, "setDuration:");
    objc_msgSend(v14, "appendPowerLevel:", CKLinearForDbPowerLevel(a3) * 32767.0);
    *(float *)&v15 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView powerLevels](self, "powerLevels");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[CKMessageEntryView powerLevels](self, "powerLevels");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v16);

    }
    else
    {
      v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v26[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithArray:", v20);
      -[CKMessageEntryView setPowerLevels:](self, "setPowerLevels:", v21);

    }
    objc_msgSend(v13, "duration");
    -[CKMessageEntryView setDuration:](self, "setDuration:");
    -[CKMessageEntryView audioMessageAppDelegate](self, "audioMessageAppDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "duration");
    v24 = v23;
    *(float *)&v23 = a3;
    objc_msgSend(v22, "audioMessageDidChangeAudioPowerLevel:duration:", v23, v24);

  }
}

- (BOOL)isShowingAudioRecordingView
{
  void *v2;
  BOOL v3;

  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_setupAudioMessageRecordingView
{
  void *v3;
  CKAudioMessageRecordingView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  CKAudioMessageRecordingView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [CKAudioMessageRecordingView alloc];
    -[CKMessageEntryView contentClipView](self, "contentClipView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[CKMessageEntryView conversation](self, "conversation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendingService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CKAudioMessageRecordingView initWithFrame:service:](v4, "initWithFrame:service:", v15, v7, v9, v11, v13);
    -[CKMessageEntryView setAudioRecordingView:](self, "setAudioRecordingView:", v16);

    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlpha:", 0.0);

    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", self);

    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setupDisplayLink");

    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setEnabled:", -[CKMessageEntryView sendButtonEnabled](self, "sendButtonEnabled"));

    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView addSubview:](self, "addSubview:", v22);

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __53__CKMessageEntryView__setupAudioMessageRecordingView__block_invoke;
    v24[3] = &unk_1E274A208;
    v24[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v24);
    -[CKMessageEntryView delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "messageEntryViewDidChange:isTextChange:isShelfChange:", self, 0, 0);

  }
}

void __53__CKMessageEntryView__setupAudioMessageRecordingView__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "audioRecordingView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setState:", 1);

}

- (void)startRecordingForAudioButtonInEntryView
{
  void *v3;
  void *v4;
  void *v5;

  -[CKMessageEntryView composition](self, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasContent") & 1) != 0)
    goto LABEL_4;
  -[CKMessageEntryView audioComposition](self, "audioComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
LABEL_5:
    -[CKMessageEntryView showAudioHintWithReason:](self, "showAudioHintWithReason:", 1);
    return;
  }
  -[CKMessageEntryView sendLaterPluginInfo](self, "sendLaterPluginInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_5;
  -[CKMessageEntryView startRecording](self, "startRecording");
}

- (void)audioButtonLongPressed:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(id *);
  void *v28;
  CKMessageEntryView *v29;
  id v30;
  id v31;
  id location;
  CGPoint v33;
  CGRect v34;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 3) < 2)
  {
    -[CKMessageEntryView audioMessageButtonTimer](self, "audioMessageButtonTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CKMessageEntryView setShouldUseLinearResizeForAudioMessage:](self, "setShouldUseLinearResizeForAudioMessage:", 0);
      -[CKMessageEntryView audioMessageButtonTimer](self, "audioMessageButtonTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

      -[CKMessageEntryView setAudioMessageButtonTimer:](self, "setAudioMessageButtonTimer:", 0);
      -[CKMessageEntryView cancelAudioMessage](self, "cancelAudioMessage");
      -[CKMessageEntryView showAudioHintWithReason:](self, "showAudioHintWithReason:", 0);
      goto LABEL_11;
    }
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isStopButtonHighlighted");

    if (!v24)
      goto LABEL_11;
    -[CKMessageEntryView setupAudioMessageQuickSendViewAndStopRecording](self, "setupAudioMessageQuickSendViewAndStopRecording");
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = 0;
LABEL_10:
    objc_msgSend(v20, "setIsStopButtonHighlighted:", v22);

    goto LABEL_11;
  }
  if (v5 == 2)
  {
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v12);
    v14 = v13;
    v16 = v15;

    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stopButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v33.x = v14;
    v33.y = v16;
    v19 = CGRectContainsPoint(v34, v33);

    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v19;
    goto LABEL_10;
  }
  if (v5 == 1)
  {
    -[CKMessageEntryView setShouldUseLinearResizeForAudioMessage:](self, "setShouldUseLinearResizeForAudioMessage:", 1);
    -[CKMessageEntryView _setupAudioMessageRecordingView](self, "_setupAudioMessageRecordingView");
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 1);
    objc_msgSend(v6, "prepare");
    location = 0;
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0C99E88];
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __45__CKMessageEntryView_audioButtonLongPressed___block_invoke;
    v28 = &unk_1E2756D90;
    objc_copyWeak(&v31, &location);
    v29 = self;
    v8 = v6;
    v30 = v8;
    objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v25, 0.5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView setAudioMessageButtonTimer:](self, "setAudioMessageButtonTimer:", v9, v25, v26, v27, v28, v29);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
LABEL_11:

}

void __45__CKMessageEntryView_audioButtonLongPressed___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "setShouldUseLinearResizeForAudioMessage:", 0);
  objc_msgSend(a1[5], "impactOccurred");
  objc_msgSend(WeakRetained, "audioMessageButtonTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(WeakRetained, "setAudioMessageButtonTimer:", 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CKMessageEntryView_audioButtonLongPressed___block_invoke_2;
  v5[3] = &unk_1E274A208;
  v5[4] = a1[4];
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v5, 0.5);
  objc_msgSend(a1[4], "startRecordingForAudioButtonInEntryView");
  objc_msgSend(a1[4], "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryViewDidChange:isTextChange:isShelfChange:", a1[4], 0, 0);

}

uint64_t __45__CKMessageEntryView_audioButtonLongPressed___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureForDisplayMode:", 2);
}

- (void)showAudioHintWithReason:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAudioMessagesEntryViewRecordingEnabled");

  if (v6)
  {
    -[CKMessageEntryView audioHintLabel](self, "audioHintLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isHidden");

    if (v8)
    {
      if (a3 == 2)
      {
        -[CKMessageEntryView audioHintLabel](self, "audioHintLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CKFrameworkBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("AUDIO_HINT_RECORDING_NOT_AVAILABLE");
      }
      else if (a3 == 1)
      {
        -[CKMessageEntryView audioHintLabel](self, "audioHintLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CKFrameworkBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("AUDIO_HINT_COMPOSITION");
      }
      else
      {
        if (a3)
        {
LABEL_10:
          -[CKMessageEntryView audioButton](self, "audioButton");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setUserInteractionEnabled:", 0);

          -[CKMessageEntryView plusButton](self, "plusButton");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "button");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setEnabled:", 0);

          -[CKMessageEntryView sendButton](self, "sendButton");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setEnabled:", 0);

          -[CKMessageEntryView audioHintLabel](self, "audioHintLabel");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setAlpha:", 0.0);

          -[CKMessageEntryView audioHintLabel](self, "audioHintLabel");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setHidden:", 0);

          v20[4] = self;
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __46__CKMessageEntryView_showAudioHintWithReason___block_invoke;
          v21[3] = &unk_1E274A208;
          v21[4] = self;
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_2;
          v20[3] = &unk_1E274A1B8;
          objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v21, v20, 0.25);
          return;
        }
        -[CKMessageEntryView audioHintLabel](self, "audioHintLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CKFrameworkBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("AUDIO_HINT_TAP");
      }
      objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v13);

      goto LABEL_10;
    }
  }
}

void __46__CKMessageEntryView_showAudioHintWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setShouldShowAudioMessageHint:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageEntryViewDidChange:isTextChange:isShelfChange:", *(_QWORD *)(a1 + 32), 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "audioHintLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

uint64_t __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_2()
{
  return im_dispatch_after();
}

uint64_t __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_3(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_4;
  v3[3] = &unk_1E274A208;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_5;
  v2[3] = &unk_1E274A1B8;
  v2[4] = v4;
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v3, v2, 0.25);
}

void __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setShouldShowAudioMessageHint:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageEntryViewDidChange:isTextChange:isShelfChange:", *(_QWORD *)(a1 + 32), 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "audioHintLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "audioButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

}

void __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "sendButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "audioHintLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

}

- (void)startRecording
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CKMessageEntryView recorder](self, "recorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView setPowerLevels:](self, "setPowerLevels:", 0);
  -[CKMessageEntryView setDuration:](self, "setDuration:", 0.0);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAudioMessagesEntryViewRecordingEnabled");

  if ((v5 & 1) == 0)
  {
    -[CKMessageEntryView waveformView](self, "waveformView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDuration:", 0.0);

    -[CKMessageEntryView waveformView](self, "waveformView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearPowerLevels");

    -[CKMessageEntryView presentAudioActionButtons](self, "presentAudioActionButtons");
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[CKMessageEntryView recorder](self, "recorder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView recorder](self, "recorder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isRecording");
      v12 = CFSTR("NO");
      if (v11)
        v12 = CFSTR("YES");
      v16 = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Start recording with recorder: %@ isRecordingAlready: %@", (uint8_t *)&v16, 0x16u);

    }
  }
  -[CKMessageEntryView conversation](self, "conversation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendingService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKMessageEntryView shouldRecordForService:](self, "shouldRecordForService:", v14))
  {
    v15 = objc_msgSend(v3, "isRecording");

    if ((v15 & 1) == 0)
      objc_msgSend(v3, "startRecordingForRaiseGesture:shouldPlaySound:", 0, 0);
  }
  else
  {

  }
}

- (double)powerLevelForAudioMessageRecordingView:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  float v9;
  float v10;

  -[CKMessageEntryView recorder](self, "recorder", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[CKMessageEntryView recorder](self, "recorder"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isRecording"),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    -[CKMessageEntryView recorder](self, "recorder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "averagePower");
    v10 = v9;

  }
  else
  {
    return nanf(0);
  }
  return v10;
}

- (void)setupAudioMessageQuickSendViewAndStopRecording
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  id v9;
  uint8_t buf[2];
  __int16 v11;

  -[CKMessageEntryView recorder](self, "recorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v11 = 0;
    v7 = "Tried to stop a recording with a nil audio recorder.";
    v8 = (uint8_t *)&v11;
    goto LABEL_10;
  }
  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKMessageEntryView recorder](self, "recorder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPaused:", 1);

    -[CKMessageEntryView stopRecording](self, "stopRecording");
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlaybackCurrentTime:", NAN);

    return;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_11:

      return;
    }
    *(_WORD *)buf = 0;
    v7 = "Tried to stop a recording with a nil audio recording view.";
    v8 = buf;
LABEL_10:
    _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
    goto LABEL_11;
  }
}

- (void)stopRecording
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[CKMessageEntryView recorder](self, "recorder");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView recorder](self, "recorder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isRecording");
      v7 = CFSTR("NO");
      if (v6)
        v7 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v15 = v4;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Stop recording with recorder: %@ isRecordingAlready: %@", buf, 0x16u);

    }
  }
  -[CKMessageEntryView recorder](self, "recorder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isRecording"))
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[CKMessageEntryView delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "enableRotationAfterRecording");

    }
    -[CKMessageEntryView recorder](self, "recorder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__CKMessageEntryView_stopRecording__block_invoke;
    v13[3] = &unk_1E274C848;
    v13[4] = self;
    objc_msgSend(v12, "stopRecording:", v13);

  }
}

void __35__CKMessageEntryView_stopRecording__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  if (v16)
  {
    objc_msgSend(v16, "mediaObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "duration");
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 32), "audioRecordingView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPlaybackDuration:", v6);

      objc_msgSend(*(id *)(a1 + 32), "audioRecordingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setState:", 2);

      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isAudioMessagesEntryViewRecordingEnabled");

      v11 = *(void **)(a1 + 32);
      if (v10)
      {
        objc_msgSend(v11, "audioRecordingView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "intensities");
      }
      else
      {
        objc_msgSend(v11, "waveformView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "powerLevels");
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPowerLevels:", v13);

      objc_msgSend(*(id *)(a1 + 32), "conversation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setUnsentComposition:", v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "setAudioComposition:", v16);
    objc_msgSend(*(id *)(a1 + 32), "configureForDisplayMode:", 3);

  }
  objc_msgSend(*(id *)(a1 + 32), "recorder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCompletion:", 0);

}

- (void)audioMessageRecordingViewDidResume:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKMessageEntryView recorder](self, "recorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[CKMessageEntryView recorder](self, "recorder");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMessageEntryView recorder](self, "recorder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isRecording");
        v10 = CFSTR("NO");
        if (v9)
          v10 = CFSTR("YES");
        v25 = 138412546;
        v26 = v7;
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Resume recording with recorder: %@ isRecordingAlready: %@", (uint8_t *)&v25, 0x16u);

      }
    }
    -[CKMessageEntryView audioComposition](self, "audioComposition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CKMessageEntryView audioComposition](self, "audioComposition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mediaObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "duration");
      v16 = v15;
      -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPlaybackDuration:", v16);

      -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "powerLevels");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWithIntensities:", v19);

      -[CKMessageEntryView recorder](self, "recorder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPaused:", 1);

      -[CKMessageEntryView recorder](self, "recorder");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTotalPacketsCount:", objc_msgSend(v14, "totalPacketsCount"));

      -[CKMessageEntryView recorder](self, "recorder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "temporaryFileURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFileURL:", v23);

    }
    -[CKMessageEntryView startRecording](self, "startRecording");
    -[CKMessageEntryView recorder](self, "recorder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPaused:", 0);

  }
}

- (void)audioMessageRecordingViewDidSend:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CKMessageEntryView recorder](self, "recorder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKMessageEntryView recorder](self, "recorder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPaused:", 0);

    -[CKMessageEntryView audioController](self, "audioController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stop");

    -[CKMessageEntryView sendAudioMessage](self, "sendAudioMessage");
  }
}

- (void)sendAudioMessage
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[CKMessageEntryView recorder](self, "recorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRecording");

  if (v4)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enableRotationAfterRecording");

    location = 0;
    objc_initWeak(&location, self);
    -[CKMessageEntryView recorder](self, "recorder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__CKMessageEntryView_sendAudioMessage__block_invoke;
    v7[3] = &unk_1E2756DB8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v6, "stopRecording:", v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else if (-[CKMessageEntryView hasRecording](self, "hasRecording"))
  {
    -[CKMessageEntryView _handleSendAudioMessage](self, "_handleSendAudioMessage");
  }
}

void __38__CKMessageEntryView_sendAudioMessage__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
  {
    objc_msgSend(WeakRetained, "setAudioComposition:", v4);
    objc_msgSend(WeakRetained, "_handleSendAudioMessage");
  }
  objc_msgSend(WeakRetained, "configureForDisplayMode:", 1);

}

- (void)_handleSendAudioMessage
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[CKMessageEntryView audioComposition](self, "audioComposition");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Sending audio message with audio composition: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  -[CKMessageEntryView recorder](self, "recorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKMessageEntryView recorder](self, "recorder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetState");

  }
  -[CKMessageEntryView _deleteTemporaryAudioFile](self, "_deleteTemporaryAudioFile");
  -[CKMessageEntryView audioComposition](self, "audioComposition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryView _trackAudioMessageSentWithComposition:](self, "_trackAudioMessageSentWithComposition:", v7);

  -[CKMessageEntryView audioMessageAppDelegate](self, "audioMessageAppDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioMessageDidSendMessage");

  -[CKMessageEntryView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageEntryViewSendButtonHit:", self);

}

- (void)audioMessageRecordingViewDidCancel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CKMessageEntryView audioController](self, "audioController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKMessageEntryView audioController](self, "audioController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stop");

    -[CKMessageEntryView setAudioController:](self, "setAudioController:", 0);
  }
  -[CKMessageEntryView recorder](self, "recorder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKMessageEntryView recorder](self, "recorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPaused:", 0);

    -[CKMessageEntryView recorder](self, "recorder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelRecording");

    -[CKMessageEntryView recorder](self, "recorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resetState");

    -[CKMessageEntryView clearAudioRecordingUI](self, "clearAudioRecordingUI");
    -[CKMessageEntryView _deleteTemporaryAudioFile](self, "_deleteTemporaryAudioFile");
  }
}

- (void)_deleteTemporaryAudioFile
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAudioMessagesEntryViewRecordingEnabled");

  if (v4)
  {
    -[CKMessageEntryView audioComposition](self, "audioComposition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CKMessageEntryView audioComposition](self, "audioComposition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mediaObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v9, "temporaryFileURL");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v18 = v11;
            _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Deleting temporary audio file at url: %@", buf, 0xCu);

          }
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "temporaryFileURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        objc_msgSend(v12, "removeItemAtURL:error:", v13, &v16);
        v14 = v16;

        if (v14 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v14;
            _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Failed to delete temporary audio file with error: %@", buf, 0xCu);
          }

        }
      }

    }
  }
}

- (void)audioMessageRecordingViewDidPlay:(id)a3
{
  id v3;

  -[CKMessageEntryView audioController](self, "audioController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "play");

}

- (void)audioMessageRecordingViewDidPause:(id)a3
{
  id v3;

  -[CKMessageEntryView audioController](self, "audioController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

}

- (void)audioMessageRecordingViewDidStartScrubbing:(id)a3
{
  void *v4;
  int v5;
  void *v6;

  -[CKMessageEntryView audioController](self, "audioController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlaying");

  if (v5)
  {
    -[CKMessageEntryView audioController](self, "audioController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pause");

    -[CKMessageEntryView setAudioControllerWasPlayingBeforeScrubbing:](self, "setAudioControllerWasPlayingBeforeScrubbing:", 1);
  }
}

- (void)audioMessageRecordingViewDidUpdateScrubbing:(id)a3 atTime:(double)a4
{
  id v5;

  -[CKMessageEntryView audioController](self, "audioController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutViewsForScrubbingTime:", a4);

}

- (void)audioMessageRecordingViewDidStopScrubbing:(id)a3 atTime:(double)a4
{
  void *v6;
  void *v7;

  -[CKMessageEntryView audioController](self, "audioController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentTime:", a4);

  if (-[CKMessageEntryView audioControllerWasPlayingBeforeScrubbing](self, "audioControllerWasPlayingBeforeScrubbing"))
  {
    -[CKMessageEntryView audioController](self, "audioController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "play");

    -[CKMessageEntryView setAudioControllerWasPlayingBeforeScrubbing:](self, "setAudioControllerWasPlayingBeforeScrubbing:", 0);
  }
}

- (void)clearAudioRecordingUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateDisplayLink");

    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[CKMessageEntryView setAudioRecordingView:](self, "setAudioRecordingView:", 0);
    -[CKMessageEntryView setAudioComposition:](self, "setAudioComposition:", 0);
    -[CKMessageEntryView conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUnsentComposition:", 0);

    -[CKMessageEntryView setComposition:](self, "setComposition:", 0);
    -[CKMessageEntryView configureForDisplayMode:](self, "configureForDisplayMode:", 1);
    -[CKMessageEntryView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageEntryViewDidChange:isTextChange:isShelfChange:", self, 0, 0);

    -[CKMessageEntryView inputDelegate](self, "inputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[CKMessageEntryView inputDelegate](self, "inputDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageEntryViewDidClearAudioRecordingUI:", self);

    }
    -[CKMessageEntryView recorder](self, "recorder");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resetState");

  }
}

- (CGRect)audioRecordingPillViewFrameInThrowViewCoordinates
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKMessageEntryView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CKMessageEntryView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "backgroundView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "messageEntryView:frameInThrowViewCoordinatesForView:", self, v8);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

    }
    else
    {
      -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "backgroundView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "backgroundView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      objc_msgSend(v7, "convertRect:toView:", 0);
      v10 = v19;
      v12 = v20;
      v14 = v21;
      v16 = v22;

    }
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v23 = v10;
  v24 = v12;
  v25 = v14;
  v26 = v16;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)audioRecordingPillViewSnapshot
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];

  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA610]);
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = (void *)objc_msgSend(v4, "initWithSize:", v8, v11);

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__CKMessageEntryView_audioRecordingPillViewSnapshot__block_invoke;
    v16[3] = &unk_1E274A3D0;
    v16[4] = self;
    objc_msgSend(v12, "imageWithActions:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v13);

  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CEA658]);
  }
  return v14;
}

void __52__CKMessageEntryView_audioRecordingPillViewSnapshot__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "audioRecordingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "audioRecordingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "audioRecordingView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "drawViewHierarchyInRect:afterScreenUpdates:", 0, 0.0, 0.0, v5, v9);

}

- (void)applicationWillResignActive
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[CKMessageEntryView recorder](self, "recorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKMessageEntryView recorder](self, "recorder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isRecording");

    if (v5)
    {
      -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "state");

      if (v7 != 2)
      {
        -[CKMessageEntryView recorder](self, "recorder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPaused:", 1);

        -[CKMessageEntryView stopRecording](self, "stopRecording");
        -[CKMessageEntryView audioComposition](self, "audioComposition");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "mediaObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v16, "duration");
          v12 = v11;
          -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setPlaybackDuration:", v12);

        }
        -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setState:", 2);

        -[CKMessageEntryView audioRecordingView](self, "audioRecordingView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setPlaybackCurrentTime:", NAN);

      }
    }
  }
}

- (void)audioController:(id)a3 mediaObjectDidFinishPlaying:(id)a4
{
  id v4;

  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaybackCurrentTime:", NAN);

}

- (void)audioController:(id)a3 mediaObjectProgressDidChange:(id)a4 currentTime:(double)a5 duration:(double)a6
{
  id v7;

  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView", a3, a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaybackCurrentTime:", a5);

}

- (void)audioController:(id)a3 layoutViewsForScrubbingTime:(double)a4 mediaObject:(id)a5
{
  id v6;

  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView", a3, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaybackCurrentTime:", a4);

}

- (void)audioControllerDidStop:(id)a3
{
  id v3;

  -[CKMessageEntryView audioRecordingView](self, "audioRecordingView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setState:", 2);

}

- (NSArray)keyCommands
{
  return self->_keyCommands;
}

- (void)setKeyCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (int64_t)style
{
  return self->_style;
}

- (CKMessageEntryViewAudioMessageAppDelegate)audioMessageAppDelegate
{
  return (CKMessageEntryViewAudioMessageAppDelegate *)objc_loadWeakRetained((id *)&self->_audioMessageAppDelegate);
}

- (void)setAudioMessageAppDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audioMessageAppDelegate, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_marginInsets.top;
  left = self->_marginInsets.left;
  bottom = self->_marginInsets.bottom;
  right = self->_marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (UIEdgeInsets)coverInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_coverInsets.top;
  left = self->_coverInsets.left;
  bottom = self->_coverInsets.bottom;
  right = self->_coverInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCoverInsets:(UIEdgeInsets)a3
{
  self->_coverInsets = a3;
}

- (BOOL)shouldShowSendButton
{
  return self->_shouldShowSendButton;
}

- (void)setShouldShowSendButton:(BOOL)a3
{
  self->_shouldShowSendButton = a3;
}

- (BOOL)shouldShowDictationButton
{
  return self->_shouldShowDictationButton;
}

- (void)setShouldShowDictationButton:(BOOL)a3
{
  self->_shouldShowDictationButton = a3;
}

- (BOOL)shouldShowSubject
{
  return self->_shouldShowSubject;
}

- (void)setShouldShowSubject:(BOOL)a3
{
  self->_shouldShowSubject = a3;
}

- (BOOL)shouldShowPluginButtons
{
  return self->_shouldShowPluginButtons;
}

- (void)setShouldShowPluginButtons:(BOOL)a3
{
  self->_shouldShowPluginButtons = a3;
}

- (BOOL)shouldShowCharacterCount
{
  return self->_shouldShowCharacterCount;
}

- (void)setShouldShowCharacterCount:(BOOL)a3
{
  self->_shouldShowCharacterCount = a3;
}

- (BOOL)shouldDisableAttachments
{
  return self->_shouldDisableAttachments;
}

- (void)setShouldDisableAttachments:(BOOL)a3
{
  self->_shouldDisableAttachments = a3;
}

- (CKMessageEntryViewDelegate)delegate
{
  return (CKMessageEntryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIClickInteractionDelegate)clickInteractionDelegate
{
  return (_UIClickInteractionDelegate *)objc_loadWeakRetained((id *)&self->_clickInteractionDelegate);
}

- (void)setClickInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_clickInteractionDelegate, a3);
}

- (CKMessageEntryViewInputDelegate)inputDelegate
{
  return (CKMessageEntryViewInputDelegate *)objc_loadWeakRetained((id *)&self->_inputDelegate);
}

- (void)setInputDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_inputDelegate, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setAppStrip:(id)a3
{
  objc_storeStrong((id *)&self->_appStrip, a3);
}

- (CKEntryViewButton)dictationButton
{
  return self->_dictationButton;
}

- (void)setDictationButton:(id)a3
{
  objc_storeStrong((id *)&self->_dictationButton, a3);
}

- (UIActivityIndicatorView)sendButtonSpinner
{
  return self->_sendButtonSpinner;
}

- (void)setSendButtonSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_sendButtonSpinner, a3);
}

- (CKMessageEntryContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (CKMessageEntryWaveformView)waveformView
{
  return self->_waveformView;
}

- (void)setWaveformView:(id)a3
{
  objc_storeStrong((id *)&self->_waveformView, a3);
}

- (BOOL)animatingLayoutChange
{
  return self->_animatingLayoutChange;
}

- (void)setAnimatingLayoutChange:(BOOL)a3
{
  self->_animatingLayoutChange = a3;
}

- (BOOL)showAppStrip
{
  return self->_showAppStrip;
}

- (void)setShowAppStrip:(BOOL)a3
{
  self->_showAppStrip = a3;
}

- (CKEntryViewButton)photoButton
{
  return self->_photoButton;
}

- (void)setPhotoButton:(id)a3
{
  objc_storeStrong((id *)&self->_photoButton, a3);
}

- (CKEntryViewButton)sendButton
{
  return self->_sendButton;
}

- (void)setSendButton:(id)a3
{
  objc_storeStrong((id *)&self->_sendButton, a3);
}

- (UIView)buttonAndTextAreaContainerView
{
  return self->_buttonAndTextAreaContainerView;
}

- (void)setButtonAndTextAreaContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonAndTextAreaContainerView, a3);
}

- (BOOL)isKeyboardVisible
{
  return self->_keyboardVisible;
}

- (UITraitCollection)entryViewTraitCollection
{
  return self->_entryViewTraitCollection;
}

- (BOOL)languageHasSpaces
{
  return self->_languageHasSpaces;
}

- (void)setLanguageHasSpaces:(BOOL)a3
{
  self->_languageHasSpaces = a3;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (BOOL)entryFieldCollapsed
{
  return self->_entryFieldCollapsed;
}

- (void)setEntryFieldCollapsed:(BOOL)a3
{
  self->_entryFieldCollapsed = a3;
}

- (BOOL)shouldBlurForMessageEditing
{
  return self->_shouldBlurForMessageEditing;
}

- (BOOL)shouldUseLinearResizeForAudioMessage
{
  return self->_shouldUseLinearResizeForAudioMessage;
}

- (void)setShouldUseLinearResizeForAudioMessage:(BOOL)a3
{
  self->_shouldUseLinearResizeForAudioMessage = a3;
}

- (BOOL)extendAppStripBlurToKeyplaneTop
{
  return self->_extendAppStripBlurToKeyplaneTop;
}

- (void)setExtendAppStripBlurToKeyplaneTop:(BOOL)a3
{
  self->_extendAppStripBlurToKeyplaneTop = a3;
}

- (BOOL)shouldDisablePluginButtons
{
  return self->_disablePluginButtons;
}

- (BOOL)isComposingRecipient
{
  return self->_composingRecipient;
}

- (BOOL)hasFailedRecipients
{
  return self->_failedRecipients;
}

- (BOOL)hasUnreachableEmergencyRecipient
{
  return self->_unreachableEmergencyRecipient;
}

- (BOOL)isSendingMessage
{
  return self->_sendingMessage;
}

- (CKAudioRecorder)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_recorder, a3);
}

- (UIKeyboardLayoutGuide)entryViewKeyboardLayoutGuide
{
  return self->_entryViewKeyboardLayoutGuide;
}

- (void)setEntryViewKeyboardLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_entryViewKeyboardLayoutGuide, a3);
}

- (double)previousBottomSafeAreaInset
{
  return self->_previousBottomSafeAreaInset;
}

- (void)setPreviousBottomSafeAreaInset:(double)a3
{
  self->_previousBottomSafeAreaInset = a3;
}

- (BOOL)shouldShowSendButtonSpinner
{
  return self->_shouldShowSendButtonSpinner;
}

- (void)setShouldShowSendButtonSpinner:(BOOL)a3
{
  self->_shouldShowSendButtonSpinner = a3;
}

- (CKEntryViewPlusButton)plusButton
{
  return self->_plusButton;
}

- (void)setPlusButton:(id)a3
{
  objc_storeStrong((id *)&self->_plusButton, a3);
}

- (UISelectionFeedbackGenerator)plusButtonFeedbackGenerator
{
  return self->_plusButtonFeedbackGenerator;
}

- (BOOL)plusButtonFeedbackGeneratorIsActive
{
  return self->_plusButtonFeedbackGeneratorIsActive;
}

- (UIView)inputButtonContainerView
{
  return self->_inputButtonContainerView;
}

- (void)setInputButtonContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_inputButtonContainerView, a3);
}

- (CKEntryViewButton)browserButton
{
  return self->_browserButton;
}

- (void)setBrowserButton:(id)a3
{
  objc_storeStrong((id *)&self->_browserButton, a3);
}

- (CKEntryViewButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (CKEntryViewButton)stopButton
{
  return self->_stopButton;
}

- (void)setStopButton:(id)a3
{
  objc_storeStrong((id *)&self->_stopButton, a3);
}

- (CKEntryViewButton)arrowButton
{
  return self->_arrowButton;
}

- (void)setArrowButton:(id)a3
{
  objc_storeStrong((id *)&self->_arrowButton, a3);
}

- (_UIClickInteraction)sendButtonClickInteraction
{
  return self->_sendButtonClickInteraction;
}

- (void)setSendButtonClickInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_sendButtonClickInteraction, a3);
}

- (UILabel)characterCountLabel
{
  return self->_characterCountLabel;
}

- (void)setCharacterCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_characterCountLabel, a3);
}

- (CGSize)inputButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_inputButtonSize.width;
  height = self->_inputButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInputButtonSize:(CGSize)a3
{
  self->_inputButtonSize = a3;
}

- (CGSize)sendButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_sendButtonSize.width;
  height = self->_sendButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSendButtonSize:(CGSize)a3
{
  self->_sendButtonSize = a3;
}

- (CGSize)characterCountSize
{
  double width;
  double height;
  CGSize result;

  width = self->_characterCountSize.width;
  height = self->_characterCountSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCharacterCountSize:(CGSize)a3
{
  self->_characterCountSize = a3;
}

- (CKMessageEntryBackgroundViewProtocol)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)knockoutView
{
  return self->_knockoutView;
}

- (void)setKnockoutView:(id)a3
{
  objc_storeStrong((id *)&self->_knockoutView, a3);
}

- (UIVisualEffectView)knockoutVisualEffectView
{
  return self->_knockoutVisualEffectView;
}

- (void)setKnockoutVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_knockoutVisualEffectView, a3);
}

- (UIVisualEffectView)messageEditingBlurOverlayView
{
  return self->_messageEditingBlurOverlayView;
}

- (void)setMessageEditingBlurOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_messageEditingBlurOverlayView, a3);
}

- (BOOL)isCharacterCountHidden
{
  return self->_characterCountHidden;
}

- (BOOL)shouldCenterCharacterCount
{
  return self->_shouldCenterCharacterCount;
}

- (void)setShouldCenterCharacterCount:(BOOL)a3
{
  self->_shouldCenterCharacterCount = a3;
}

- (BOOL)shouldAllowImpactSend
{
  return self->_shouldAllowImpactSend;
}

- (void)setShouldAllowImpactSend:(BOOL)a3
{
  self->_shouldAllowImpactSend = a3;
}

- (UIView)contentClipView
{
  return self->_contentClipView;
}

- (void)setContentClipView:(id)a3
{
  objc_storeStrong((id *)&self->_contentClipView, a3);
}

- (CAShapeLayer)dashedContentClipViewLayer
{
  return self->_dashedContentClipViewLayer;
}

- (void)setDashedContentClipViewLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dashedContentClipViewLayer, a3);
}

- (BOOL)isTransitioningForBrowserSwitcher
{
  return self->_isTransitioningForBrowserSwitcher;
}

- (void)setIsTransitioningForBrowserSwitcher:(BOOL)a3
{
  self->_isTransitioningForBrowserSwitcher = a3;
}

- (int64_t)sendMenuPresentationState
{
  return self->_sendMenuPresentationState;
}

- (void)setSendMenuPresentationState:(int64_t)a3
{
  self->_sendMenuPresentationState = a3;
}

- (BOOL)shouldCoverViewBeShrunkenForSendMenu
{
  return self->_shouldCoverViewBeShrunkenForSendMenu;
}

- (void)setShouldCoverViewBeShrunkenForSendMenu:(BOOL)a3
{
  self->_shouldCoverViewBeShrunkenForSendMenu = a3;
}

- (UILabel)collpasedPlaceholderLabel
{
  return self->_collpasedPlaceholderLabel;
}

- (void)setCollpasedPlaceholderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_collpasedPlaceholderLabel, a3);
}

- (UIButton)emojiButton
{
  return self->_emojiButton;
}

- (void)setEmojiButton:(id)a3
{
  objc_storeStrong((id *)&self->_emojiButton, a3);
}

- (UIView)appStripBackgroundBlurContainerView
{
  return self->_appStripBackgroundBlurContainerView;
}

- (void)setAppStripBackgroundBlurContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_appStripBackgroundBlurContainerView, a3);
}

- (UIKBVisualEffectView)appStripBackgroundBlurView
{
  return self->_appStripBackgroundBlurView;
}

- (void)setAppStripBackgroundBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_appStripBackgroundBlurView, a3);
}

- (UITextInputTraits_Private)lastConfiguredInputDelegate
{
  return (UITextInputTraits_Private *)objc_loadWeakRetained((id *)&self->_lastConfiguredInputDelegate);
}

- (void)setLastConfiguredInputDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_lastConfiguredInputDelegate, a3);
}

- (CKMentionSuggestionView)mentionSuggestionView
{
  return self->_mentionSuggestionView;
}

- (void)setMentionSuggestionView:(id)a3
{
  objc_storeStrong((id *)&self->_mentionSuggestionView, a3);
}

- (NSArray)currentMentionSuggestions
{
  return self->_currentMentionSuggestions;
}

- (void)setCurrentMentionSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_currentMentionSuggestions, a3);
}

- (BOOL)showingMentionsSuggestions
{
  return self->_showingMentionsSuggestions;
}

- (void)setShowingMentionsSuggestions:(BOOL)a3
{
  self->_showingMentionsSuggestions = a3;
}

- (BOOL)isUpdatingMentionAttributedText
{
  return self->_isUpdatingMentionAttributedText;
}

- (void)setIsUpdatingMentionAttributedText:(BOOL)a3
{
  self->_isUpdatingMentionAttributedText = a3;
}

- (NSMutableSet)entityHandles
{
  return self->_entityHandles;
}

- (void)setEntityHandles:(id)a3
{
  objc_storeStrong((id *)&self->_entityHandles, a3);
}

- (NSMutableDictionary)entityDictionary
{
  return self->_entityDictionary;
}

- (void)setEntityDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_entityDictionary, a3);
}

- (_NSRange)rangeOfTappedMention
{
  _NSRange *p_rangeOfTappedMention;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_rangeOfTappedMention = &self->_rangeOfTappedMention;
  location = self->_rangeOfTappedMention.location;
  length = p_rangeOfTappedMention->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeOfTappedMention:(_NSRange)a3
{
  self->_rangeOfTappedMention = a3;
}

- (CKMentionEntityNode)entityTree
{
  return self->_entityTree;
}

- (void)setEntityTree:(id)a3
{
  objc_storeStrong((id *)&self->_entityTree, a3);
}

- (_UISupplementalLexicon)mentionsLexicon
{
  return self->_mentionsLexicon;
}

- (void)setMentionsLexicon:(id)a3
{
  objc_storeStrong((id *)&self->_mentionsLexicon, a3);
}

- (_NSRange)lastFoundMentionRange
{
  _NSRange *p_lastFoundMentionRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_lastFoundMentionRange = &self->_lastFoundMentionRange;
  location = self->_lastFoundMentionRange.location;
  length = p_lastFoundMentionRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLastFoundMentionRange:(_NSRange)a3
{
  self->_lastFoundMentionRange = a3;
}

- (unint64_t)currentTappedCharacterIndex
{
  return self->_currentTappedCharacterIndex;
}

- (void)setCurrentTappedCharacterIndex:(unint64_t)a3
{
  self->_currentTappedCharacterIndex = a3;
}

- (id)didSelectEntityCompletionHandler
{
  return self->_didSelectEntityCompletionHandler;
}

- (void)setDidSelectEntityCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 856);
}

- (CKScheduledUpdater)entryFieldCollapsedUpdater
{
  return self->_entryFieldCollapsedUpdater;
}

- (void)setEntryFieldCollapsedUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_entryFieldCollapsedUpdater, a3);
}

- (BOOL)entryFieldUpdaterCollapsedValue
{
  return self->_entryFieldUpdaterCollapsedValue;
}

- (void)setEntryFieldUpdaterCollapsedValue:(BOOL)a3
{
  self->_entryFieldUpdaterCollapsedValue = a3;
}

- (BOOL)entryFieldUpdaterAnimatedValue
{
  return self->_entryFieldUpdaterAnimatedValue;
}

- (void)setEntryFieldUpdaterAnimatedValue:(BOOL)a3
{
  self->_entryFieldUpdaterAnimatedValue = a3;
}

- (UISwipeGestureRecognizer)swipeGestureRecognizer
{
  return self->_swipeGestureRecognizer;
}

- (void)setSwipeGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_swipeGestureRecognizer, a3);
}

- (CKAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
  objc_storeStrong((id *)&self->_audioController, a3);
}

- (BOOL)audioControllerWasPlayingBeforeScrubbing
{
  return self->_audioControllerWasPlayingBeforeScrubbing;
}

- (void)setAudioControllerWasPlayingBeforeScrubbing:(BOOL)a3
{
  self->_audioControllerWasPlayingBeforeScrubbing = a3;
}

- (BOOL)recordingStartedFromRaiseGesture
{
  return self->_recordingStartedFromRaiseGesture;
}

- (void)setRecordingStartedFromRaiseGesture:(BOOL)a3
{
  self->_recordingStartedFromRaiseGesture = a3;
}

- (BOOL)shouldShowAudioMessageHint
{
  return self->_shouldShowAudioMessageHint;
}

- (void)setShouldShowAudioMessageHint:(BOOL)a3
{
  self->_shouldShowAudioMessageHint = a3;
}

- (CKAudioMessageRecordingView)audioRecordingView
{
  return self->_audioRecordingView;
}

- (void)setAudioRecordingView:(id)a3
{
  objc_storeStrong((id *)&self->_audioRecordingView, a3);
}

- (NSTimer)audioMessageButtonTimer
{
  return self->_audioMessageButtonTimer;
}

- (void)setAudioMessageButtonTimer:(id)a3
{
  objc_storeStrong((id *)&self->_audioMessageButtonTimer, a3);
}

- (CKComposition)audioComposition
{
  return self->_audioComposition;
}

- (CKComposition)previousAudioComposition
{
  return self->_previousAudioComposition;
}

- (void)setPreviousAudioComposition:(id)a3
{
  objc_storeStrong((id *)&self->_previousAudioComposition, a3);
}

- (CKMessageEntryRecordedAudioView)recordedAudioView
{
  return self->_recordedAudioView;
}

- (void)setRecordedAudioView:(id)a3
{
  objc_storeStrong((id *)&self->_recordedAudioView, a3);
}

- (CGSize)waveformViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_waveformViewSize.width;
  height = self->_waveformViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setWaveformViewSize:(CGSize)a3
{
  self->_waveformViewSize = a3;
}

- (CKEntryViewButton)audioButton
{
  return self->_audioButton;
}

- (void)setAudioButton:(id)a3
{
  objc_storeStrong((id *)&self->_audioButton, a3);
}

- (UILabel)audioHintLabel
{
  return self->_audioHintLabel;
}

- (void)setAudioHintLabel:(id)a3
{
  objc_storeStrong((id *)&self->_audioHintLabel, a3);
}

- (CKEntryViewButton)sendAudioButton
{
  return self->_sendAudioButton;
}

- (void)setSendAudioButton:(id)a3
{
  objc_storeStrong((id *)&self->_sendAudioButton, a3);
}

- (BOOL)dictationEnabledForLanguage
{
  return self->_dictationEnabledForLanguage;
}

- (void)setDictationEnabledForLanguage:(BOOL)a3
{
  self->_dictationEnabledForLanguage = a3;
}

- (CKMessageEntryHintView)hintView
{
  return self->_hintView;
}

- (void)setHintView:(id)a3
{
  objc_storeStrong((id *)&self->_hintView, a3);
}

- (BOOL)isAudioMessageRecordingAvailable
{
  return self->_audioMessageRecordingAvailable;
}

- (void)setAudioMessageRecordingAvailable:(BOOL)a3
{
  self->_audioMessageRecordingAvailable = a3;
}

- (NSMutableArray)powerLevels
{
  return self->_powerLevels;
}

- (void)setPowerLevels:(id)a3
{
  objc_storeStrong((id *)&self->_powerLevels, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLevels, 0);
  objc_storeStrong((id *)&self->_hintView, 0);
  objc_storeStrong((id *)&self->_sendAudioButton, 0);
  objc_storeStrong((id *)&self->_audioHintLabel, 0);
  objc_storeStrong((id *)&self->_audioButton, 0);
  objc_storeStrong((id *)&self->_recordedAudioView, 0);
  objc_storeStrong((id *)&self->_previousAudioComposition, 0);
  objc_storeStrong((id *)&self->_audioComposition, 0);
  objc_storeStrong((id *)&self->_audioMessageButtonTimer, 0);
  objc_storeStrong((id *)&self->_audioRecordingView, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
  objc_storeStrong((id *)&self->_swipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_entryFieldCollapsedUpdater, 0);
  objc_storeStrong(&self->_didSelectEntityCompletionHandler, 0);
  objc_storeStrong((id *)&self->_mentionsLexicon, 0);
  objc_storeStrong((id *)&self->_entityTree, 0);
  objc_storeStrong((id *)&self->_entityDictionary, 0);
  objc_storeStrong((id *)&self->_entityHandles, 0);
  objc_storeStrong((id *)&self->_currentMentionSuggestions, 0);
  objc_storeStrong((id *)&self->_mentionSuggestionView, 0);
  objc_destroyWeak((id *)&self->_lastConfiguredInputDelegate);
  objc_storeStrong((id *)&self->_appStripBackgroundBlurView, 0);
  objc_storeStrong((id *)&self->_appStripBackgroundBlurContainerView, 0);
  objc_storeStrong((id *)&self->_emojiButton, 0);
  objc_storeStrong((id *)&self->_collpasedPlaceholderLabel, 0);
  objc_storeStrong((id *)&self->_dashedContentClipViewLayer, 0);
  objc_storeStrong((id *)&self->_contentClipView, 0);
  objc_storeStrong((id *)&self->_messageEditingBlurOverlayView, 0);
  objc_storeStrong((id *)&self->_knockoutVisualEffectView, 0);
  objc_storeStrong((id *)&self->_knockoutView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_characterCountLabel, 0);
  objc_storeStrong((id *)&self->_sendButtonClickInteraction, 0);
  objc_storeStrong((id *)&self->_arrowButton, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_browserButton, 0);
  objc_storeStrong((id *)&self->_inputButtonContainerView, 0);
  objc_storeStrong((id *)&self->_plusButtonFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_storeStrong((id *)&self->_entryViewKeyboardLayoutGuide, 0);
  objc_storeStrong((id *)&self->_recorder, 0);
  objc_storeStrong((id *)&self->_entryViewTraitCollection, 0);
  objc_storeStrong((id *)&self->_buttonAndTextAreaContainerView, 0);
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_photoButton, 0);
  objc_storeStrong((id *)&self->_waveformView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_sendButtonSpinner, 0);
  objc_storeStrong((id *)&self->_dictationButton, 0);
  objc_storeStrong((id *)&self->_appStrip, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_inputDelegate);
  objc_destroyWeak((id *)&self->_clickInteractionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_destroyWeak((id *)&self->_audioMessageAppDelegate);
  objc_storeStrong((id *)&self->_keyCommands, 0);
}

- (void)plusButtonTouchDown:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "PlusButton Touch Down", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)plusButtonTouchUpOutside:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "PlusButton Touch Up Outside", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)plusButtonTouchCancel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "PlusButton Touch Cancel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)plusButtonTouchDragEnter:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "PlusButton Drag Enter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)plusButtonTouchDragExit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "PlusButton Drag Exit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didSelectPlusButton:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "PlusButton Selected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)plusButtonLongPressed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "Not launching photos app following long press on plus button, delegate told us not to", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)plusButtonLongPressed:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_DEBUG, "Ignoring gesture recognizer callback with state=%ld", (uint8_t *)&v2, 0xCu);
}

- (void)plusButtonLongPressed:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "PlusButton Long Press gesture detected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_isDictationEnabled
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _AFDictationRestricted(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKMessageEntryView.m"), 139, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
