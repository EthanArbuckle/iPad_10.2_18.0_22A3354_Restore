@implementation AMSUIMessageViewLayoutContext

- (AMSUIMessageViewLayoutContext)initWithMessageView:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AMSUIMessageViewLayoutContext;
  v5 = -[AMSUIMessageViewLayoutContext init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v15 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    v16 = *MEMORY[0x24BDBF090];
    *(_OWORD *)(v5 + 136) = *MEMORY[0x24BDBF090];
    *(_OWORD *)(v5 + 152) = v15;
    *(_OWORD *)(v5 + 200) = v16;
    *(_OWORD *)(v5 + 216) = v15;
    v14 = *MEMORY[0x24BDBF148];
    *(_OWORD *)(v5 + 56) = *MEMORY[0x24BDBF148];
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v9;

    *(_OWORD *)(v6 + 328) = v16;
    *(_OWORD *)(v6 + 344) = v15;
    *(_OWORD *)(v6 + 232) = v16;
    *(_OWORD *)(v6 + 248) = v15;
    v6[8] = 1;
    *(_OWORD *)(v6 + 88) = v14;
    *(_OWORD *)(v6 + 360) = v16;
    *(_OWORD *)(v6 + 376) = v15;
    *(_OWORD *)(v6 + 392) = v16;
    *(_OWORD *)(v6 + 408) = v15;
    *(_OWORD *)(v6 + 264) = v16;
    *(_OWORD *)(v6 + 280) = v15;
    *(_OWORD *)(v6 + 104) = v14;
    objc_storeWeak((id *)v6 + 5, v4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v11;

    *(_OWORD *)(v6 + 296) = v16;
    *(_OWORD *)(v6 + 312) = v15;
  }

  return (AMSUIMessageViewLayoutContext *)v6;
}

- (void)invalidate
{
  -[AMSUIMessageViewLayoutContext setIsDirty:](self, "setIsDirty:", 1);
  -[AMSUIMessageViewLayoutContext setLastFittingSize:](self, "setLastFittingSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (void)layoutSubviewFrames
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
  double v12;
  double v13;
  void *v15;
  int v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AMSUIMessageViewLayoutContext contentSize](self, "contentSize");
  if (v13 == *MEMORY[0x24BDBF148] && v12 == *(double *)(MEMORY[0x24BDBF148] + 8))
    -[AMSUIMessageViewLayoutContext setContentSize:](self, "setContentSize:", v9, v11);
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isSizing");

  if (v16)
  {
    -[AMSUIMessageViewLayoutContext lastSize](self, "lastSize");
    v9 = v17;
    v11 = v18;
  }
  -[AMSUIMessageViewLayoutContext lastMessageViewFrame](self, "lastMessageViewFrame");
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  if (!CGRectEqualToRect(v19, v20))
  {
    -[AMSUIMessageViewLayoutContext setIsDirty:](self, "setIsDirty:", 1);
    -[AMSUIMessageViewLayoutContext _contentSizeThatFits:](self, "_contentSizeThatFits:", v5, v7, v9, v11);
    -[AMSUIMessageViewLayoutContext setContentSize:](self, "setContentSize:");
  }
  -[AMSUIMessageViewLayoutContext _updateWithRootFrame:](self, "_updateWithRootFrame:", v5, v7, v9, v11);
  -[AMSUIMessageViewLayoutContext setLastMessageViewFrame:](self, "setLastMessageViewFrame:", v5, v7, v9, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[AMSUIMessageViewLayoutContext lastFittingSize](self, "lastFittingSize");
  if (width == v7 && height == v6)
  {
    -[AMSUIMessageViewLayoutContext lastSize](self, "lastSize");
    width = v11;
    height = v12;
  }
  else
  {
    -[AMSUIMessageViewLayoutContext setLastFittingSize:](self, "setLastFittingSize:", width, height);
    if (height > 5000.0)
      height = 5000.0;
    if (width > 5000.0)
      width = 5000.0;
    -[AMSUIMessageViewLayoutContext _contentSizeThatFits:](self, "_contentSizeThatFits:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), width, height);
    if (v9 < width)
      width = v9;
    if (v10 < height)
      height = v10;
    -[AMSUIMessageViewLayoutContext setLastSize:](self, "setLastSize:", width, height);
  }
  v13 = width;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)_contentSizeThatFits:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "style");
  -[AMSUIMessageViewLayoutContext setIsDirty:](self, "setIsDirty:", 1);
  -[AMSUIMessageViewLayoutContext _updateWithRootFrame:](self, "_updateWithRootFrame:", x, y, width, height);
  -[AMSUIMessageViewLayoutContext _effectiveTextViewFrame](self, "_effectiveTextViewFrame");
  v11 = v10;
  if (-[AMSUIMessageViewLayoutContext _isFooterButtonPartOfContentFrame](self, "_isFooterButtonPartOfContentFrame"))
  {
    -[AMSUIMessageViewLayoutContext footerContainerViewFrame](self, "footerContainerViewFrame");
    v11 = v11 + v12;
  }
  if (!-[AMSUIMessageViewLayoutContext isImageViewHidden](self, "isImageViewHidden"))
  {
    -[AMSUIMessageViewLayoutContext _makeImageViewSize](self, "_makeImageViewSize");
    v14 = v13;
    if (-[AMSUIMessageViewLayoutContext shouldUseStackedLayout](self, "shouldUseStackedLayout"))
    {
      objc_msgSend(v8, "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasText");
      v17 = 0.0;
      if (v16)
        -[AMSUIMessageViewLayoutContext _imageToLabelSpacing](self, "_imageToLabelSpacing", 0.0);
      v11 = v11 + v14 + v17;

    }
    else if (v9 == 5)
    {
      if (v14 + 10.0 + 10.0 >= v11)
        v11 = v14 + 10.0 + 10.0;
    }
    else if (v14 >= v11)
    {
      v11 = v14;
    }
  }
  objc_msgSend(v8, "accessorySecondaryView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AMSUIMessageViewLayoutContext accessorySecondaryViewFrame](self, "accessorySecondaryViewFrame");
    if (v19 >= v11)
      v11 = v19;
  }
  -[AMSUIMessageViewLayoutContext contentLayoutMargins](self, "contentLayoutMargins");
  v21 = v20;
  v23 = v11 + v22;
  -[AMSUIMessageViewLayoutContext footerButtonFrames](self, "footerButtonFrames");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");
  v26 = 0.0;
  v27 = 0.0;
  if (v25)
    -[AMSUIMessageViewLayoutContext _footerButtonSpacing](self, "_footerButtonSpacing", 0.0);
  v28 = v23 + v27;
  if (!-[AMSUIMessageViewLayoutContext _isFooterButtonPartOfContentFrame](self, "_isFooterButtonPartOfContentFrame"))
  {
    -[AMSUIMessageViewLayoutContext footerContainerViewFrame](self, "footerContainerViewFrame");
    v26 = v29;
  }
  v30 = v21 + v28 + v26;

  objc_msgSend(v8, "maskShapeView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v8, "maskShapeView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "arrowDirection") == 1)
    {

    }
    else
    {
      objc_msgSend(v8, "maskShapeView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "arrowDirection");

      if (v34 != 2)
        goto LABEL_26;
    }
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "maskShapeView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "arrowHeight");
    v30 = v30 + v37;

  }
LABEL_26:
  if (v9 == 1)
  {
    objc_msgSend(v8, "traitCollection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "horizontalSizeClass");

    v40 = 76.0;
    if (v30 >= 76.0)
      v40 = v30;
    v41 = 60.0;
    if (v30 >= 60.0)
      v41 = v30;
    if (v39 == 2)
      v30 = v40;
    else
      v30 = v41;
  }
  else if (v30 < 60.0)
  {
    v30 = 60.0;
  }

  v42 = width;
  v43 = v30;
  result.height = v43;
  result.width = v42;
  return result;
}

- (void)_updateWithRootFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  double v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  double v36;
  _BOOL4 v37;
  void *v38;
  unint64_t v39;
  double v40;
  double v41;
  uint64_t v42;
  double v43;
  double v44;
  void *v45;
  _BOOL4 v46;
  _BOOL4 v47;
  double v48;
  double v49;
  double v50;
  double v51;
  unint64_t v52;
  double v53;
  char v54;
  double v55;
  double v56;
  BOOL v57;
  BOOL v58;
  void *v59;
  void *v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double *v68;
  unint64_t v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  int v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  int v107;
  double v108;
  double v109;
  int v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  char v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  double v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t i;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  void *v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
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
  double v176;
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
  unint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  uint64_t v208;
  void *v209;
  void *v210;
  uint64_t v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
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
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  void *v245;
  uint64_t v246;
  void *v247;
  uint64_t v248;
  void *v249;
  void *v250;
  uint64_t v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  void *v263;
  double v264;
  double v265;
  double v266;
  double v267;
  double v268;
  double v269;
  double v270;
  double v271;
  double v272;
  double v273;
  double v274;
  double v275;
  _BOOL4 v276;
  double v277;
  double v278;
  double v279;
  double v280;
  double v281;
  void *v282;
  void *v283;
  _BOOL4 v284;
  double v285;
  void *v286;
  _BOOL4 v287;
  double v288;
  uint64_t v289;
  double v290;
  double v291;
  double v292;
  double v293;
  void *v294;
  double v295;
  double v296;
  double v297;
  double v298;
  double v299;
  double v300;
  double v301;
  double v302;
  double v303;
  double v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312;
  double v313;
  _BOOL4 v314;
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
  double r1;
  double r1a;
  double v328;
  double v329;
  double v330;
  double v331;
  double v332;
  double v333;
  double v334;
  double v335;
  _QWORD v336[5];
  _QWORD v337[5];
  _QWORD v338[8];
  _QWORD v339[8];
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  _BYTE v344[128];
  uint64_t v345;
  CGRect v346;
  CGRect v347;
  CGRect v348;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v345 = *MEMORY[0x24BDAC8D0];
  -[AMSUIMessageViewLayoutContext calculateMainContentFrameRootFrame:](self, "calculateMainContentFrameRootFrame:");
  if (-[AMSUIMessageViewLayoutContext isDirty](self, "isDirty"))
  {
    -[AMSUIMessageViewLayoutContext calculateAccessoryViewSize](self, "calculateAccessoryViewSize");
    -[AMSUIMessageViewLayoutContext calculateAccessorySecondaryViewSize](self, "calculateAccessorySecondaryViewSize");
  }
  -[AMSUIMessageViewLayoutContext calculateAccessoryViewFrame](self, "calculateAccessoryViewFrame");
  -[AMSUIMessageViewLayoutContext calculateAccessorySecondaryViewFrame](self, "calculateAccessorySecondaryViewFrame");
  v312 = height;
  -[AMSUIMessageViewLayoutContext calculateTextViewSizeInFrame:dirty:](self, "calculateTextViewSizeInFrame:dirty:", -[AMSUIMessageViewLayoutContext isDirty](self, "isDirty"), x, y, width, height);
  -[AMSUIMessageViewLayoutContext _calculateFooterButtonSizes](self, "_calculateFooterButtonSizes");
  -[AMSUIMessageViewLayoutContext setIsDirty:](self, "setIsDirty:", 0);
  -[AMSUIMessageViewLayoutContext imageViewFrame](self, "imageViewFrame");
  -[AMSUIMessageViewLayoutContext maskViewFrame](self, "maskViewFrame");
  -[AMSUIMessageViewLayoutContext textViewFrame](self, "textViewFrame");
  v9 = v8;
  r1 = v10;
  v12 = v11;
  v14 = v13;
  -[AMSUIMessageViewLayoutContext _effectiveTextViewFrame](self, "_effectiveTextViewFrame");
  v16 = v15;
  v18 = v17;
  -[AMSUIMessageViewLayoutContext accessoryViewFrame](self, "accessoryViewFrame");
  v304 = v20;
  v306 = v19;
  v300 = v22;
  v302 = v21;
  -[AMSUIMessageViewLayoutContext accessorySecondaryViewFrame](self, "accessorySecondaryViewFrame");
  v296 = v24;
  v298 = v23;
  v292 = v26;
  v293 = v25;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageViewLayoutContext footerButtonFramesPreFlatten](self, "footerButtonFramesPreFlatten");
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageViewLayoutContext debugButtonSize](self, "debugButtonSize");
  v290 = v29;
  v291 = v28;
  -[AMSUIMessageViewLayoutContext accessorySpacing](self, "accessorySpacing");
  v288 = v30;
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "footerButtonViews");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = -[AMSUIMessageViewLayoutContext _isAccessoryViewLeading](self, "_isAccessoryViewLeading");
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "traitCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v289 = objc_msgSend(v35, "layoutDirection");

  v314 = -[AMSUIMessageViewLayoutContext isImageViewHidden](self, "isImageViewHidden");
  -[AMSUIMessageViewLayoutContext leadingContentTextBaseline](self, "leadingContentTextBaseline");
  v333 = v36;
  v37 = -[AMSUIMessageViewLayoutContext shouldUseStackedLayout](self, "shouldUseStackedLayout");
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "style");

  -[AMSUIMessageViewLayoutContext totalFooterButtonHeight](self, "totalFooterButtonHeight");
  v41 = v40;
  v42 = MEMORY[0x24BDBEFB0];
  v318 = *MEMORY[0x24BDBEFB0];
  -[AMSUIMessageViewLayoutContext _makeImageViewSize](self, "_makeImageViewSize");
  v316 = v43;
  v322 = v44;
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "accessoryView");

  if (v37)
  {
    v320 = *(double *)(v42 + 8);
    goto LABEL_33;
  }
  v46 = -[AMSUIMessageViewLayoutContext _isIconImageTopAligned](self, "_isIconImageTopAligned");
  v47 = v46;
  if (!v39)
  {
    v48 = v9;
    v49 = v12;
    v50 = v14;
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "traitCollection");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "userInterfaceIdiom");

    if (v61 == 1)
    {
      -[AMSUIMessageViewLayoutContext contentLayoutMargins](self, "contentLayoutMargins");
      v318 = 15.0 - v62;
      v53 = 0.0;
      if (!v47)
        goto LABEL_30;
    }
    else
    {
      v53 = 11.0;
      if (!v47)
        goto LABEL_30;
    }
LABEL_31:
    -[AMSUIMessageViewLayoutContext _scaledUIValueForValue:](self, "_scaledUIValueForValue:", v53);
    v320 = v66;
    v14 = v50;
    v12 = v49;
    v9 = v48;
LABEL_32:
    -[AMSUIMessageViewLayoutContext contentLayoutMargins](self, "contentLayoutMargins");
    v320 = v320 - v67;
    goto LABEL_33;
  }
  if ((v39 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v48 = v9;
    v49 = v12;
    v50 = v14;
    v51 = v41;
    v52 = -[AMSUIMessageViewLayoutContext effectiveImageStyle](self, "effectiveImageStyle");
    if (v52 == 2)
      v53 = 15.0;
    else
      v53 = 11.0;
    v54 = v52 == 2 || v47;
    -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
    v56 = v55;
    v57 = -[AMSUIMessageViewLayoutContext _isSymbolImage](self, "_isSymbolImage");
    v58 = v322 + v53 < v56 && v57;
    v41 = v51;
    if ((v54 & 1) != 0 || v58)
      goto LABEL_31;
LABEL_30:
    -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
    v320 = (v65 - v322) * 0.5;
    v14 = v50;
    v12 = v49;
    v9 = v48;
    goto LABEL_33;
  }
  if (!v46)
  {
    v48 = v9;
    v49 = v12;
    v50 = v14;
    goto LABEL_30;
  }
  v63 = 11.0;
  if (v39 == 5)
    v63 = 10.0;
  -[AMSUIMessageViewLayoutContext _scaledUIValueForValue:](self, "_scaledUIValueForValue:", v63);
  v320 = v64;
  if (v39 != 5)
    goto LABEL_32;
LABEL_33:
  v68 = (double *)MEMORY[0x24BDBF090];
  v69 = 0x24BDBC000;
  if (v32)
  {
    -[AMSUIMessageViewLayoutContext _maxFooterButtonWidth](self, "_maxFooterButtonWidth");
    v71 = v70;
  }
  else
  {
    v71 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v41 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v308 = v68[1];
  v310 = *v68;
  if (-[AMSUIMessageViewLayoutContext _isFooterButtonPartOfContentFrame](self, "_isFooterButtonPartOfContentFrame"))
  {
    if (v37)
    {
      if (!v314)
      {
        -[AMSUIMessageViewLayoutContext _imageToLabelSpacing](self, "_imageToLabelSpacing");
        r1 = r1 + v322 + v72;
      }
      if (v32)
      {
        -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
        v74 = v73;
        -[AMSUIMessageViewLayoutContext _footerButtonSpacing](self, "_footerButtonSpacing");
        v76 = v14 + r1 + v75;
        v77 = v74;
        goto LABEL_80;
      }
      goto LABEL_78;
    }
    v287 = v33;
    v87 = v41;
    v88 = v18;
    v89 = *MEMORY[0x24BDBF148];
    v90 = *(double *)(MEMORY[0x24BDBF148] + 8);
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "textView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "hasText");

    v94 = -0.0;
    v330 = v88;
    if (v93)
      v95 = v88;
    else
      v95 = -0.0;
    v96 = v90 + v95;
    if (v93)
      v94 = v16;
    v97 = v89 + v94;
    v324 = v87;
    if (v32)
    {
      if (v97 < v71)
        v97 = v71;
      -[AMSUIMessageViewLayoutContext _footerButtonSpacing](self, "_footerButtonSpacing");
      v96 = v96 + v87 + v98;
    }
    v69 = 0x24BDBC000;
    -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
    v100 = v99;
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "textView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "textContainerInset");

    -[AMSUIMessageViewLayoutContext _footerButtonSpacing](self, "_footerButtonSpacing");
    v104 = v103;
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "textView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v106, "hasText");
    v108 = (v100 - v96) * 0.5;
    v109 = v330 + v104;
    if (v32)
      v110 = v107;
    else
      v110 = 1;

    if (!v110)
      v109 = 0.0;
    +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:");
    v9 = v111;
    r1 = v112;
    v12 = v113;
    v114 = v109;
    v14 = v115;
    +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", 0.0, v114, v71, v324, v333, v108, v97, v96);
    v71 = v116;
    v41 = v117;
    v33 = v287;
  }
  else
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "textView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "textContainerInset");
    v81 = v80;
    r1 = -v80;

    if (-[AMSUIMessageViewLayoutContext _isTextOnlyBanner](self, "_isTextOnlyBanner"))
    {
      -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
      v9 = (v82 - v16) * 0.5;
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "accessoryView");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (v84)
      {
        -[AMSUIMessageViewLayoutContext accessorySpacing](self, "accessorySpacing");
        v346.origin.x = v9;
        v346.origin.y = r1;
        v346.size.width = v12;
        v346.size.height = v14;
        v348.size.width = v304;
        v348.origin.x = v306;
        v348.size.height = v300;
        v348.origin.y = v302;
        v347 = CGRectIntersection(v346, v348);
        if (v347.size.width > 0.0)
        {
          v85 = v347.size.width;
          -[AMSUIMessageViewLayoutContext accessorySpacing](self, "accessorySpacing", v347.origin.x, v347.origin.y);
          v9 = v9 - (v85 + v86);
        }
      }
    }
    else
    {
      if (v37 && !v314)
      {
        -[AMSUIMessageViewLayoutContext _imageToLabelSpacing](self, "_imageToLabelSpacing");
        r1 = v322 + v118 - v81;
      }
      v9 = v333;
    }
    v119 = v39 == 5 || v37;
    if ((v119 & 1) == 0)
    {
      -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
      v121 = (v120 - v14) * 0.5;
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "textView");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "textContainerInset");
      v125 = -v124;

      if (v121 >= v125)
        v126 = v121;
      else
        v126 = v125;
      r1 = v126;
    }
    if (!v32)
    {
LABEL_78:
      v76 = v308;
      v77 = v310;
      goto LABEL_80;
    }
    -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
    v128 = -0.0;
    if (v39 != 5)
      v128 = v333;
    v334 = v128 + v127;
    -[AMSUIMessageViewLayoutContext contentSize](self, "contentSize");
    v130 = v129 - v41;
    -[AMSUIMessageViewLayoutContext _bottomFooterSpacing](self, "_bottomFooterSpacing");
    v76 = v130 - v131;
    if (v39 == 3)
    {
      v331 = v130 - v131;
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "maskShapeView");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = objc_msgSend(v133, "arrowDirection");

      if (v134 == 2)
      {
        -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "maskShapeView");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "arrowHeight");
        v331 = v331 - v137;

      }
LABEL_84:
      v328 = v71;
      v342 = 0u;
      v343 = 0u;
      v340 = 0u;
      v341 = 0u;
      v138 = v294;
      v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v340, v344, 16);
      if (v139)
      {
        v140 = v139;
        v141 = *(_QWORD *)v341;
        do
        {
          for (i = 0; i != v140; ++i)
          {
            if (*(_QWORD *)v341 != v141)
              objc_enumerationMutation(v138);
            objc_msgSend(*(id *)(*((_QWORD *)&v340 + 1) + 8 * i), "CGRectValue");
            v144 = v143;
            v146 = v145;
            v148 = v147;
            -[AMSUIMessageViewLayoutContext separatorThickness](self, "separatorThickness");
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v144, v146, v148, v149);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v150);

          }
          v140 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v340, v344, 16);
        }
        while (v140);
      }

      v69 = 0x24BDBC000uLL;
LABEL_92:
      v71 = v328;
      goto LABEL_93;
    }
    v77 = v334;
  }
LABEL_80:
  v331 = v76;
  v334 = v77;
  if (v39 - 2 < 2)
    goto LABEL_83;
  if (v39 != 1)
  {
    if (v39 != 5)
      goto LABEL_93;
LABEL_83:
    if (!v32)
      goto LABEL_93;
    goto LABEL_84;
  }
  if (!v314 && !v37)
  {
    v272 = v9;
    v273 = v12;
    -[AMSUIMessageViewLayoutContext contentLayoutMargins](self, "contentLayoutMargins");
    v275 = v316 + v274;
    v328 = v71;
    v276 = v33;
    v277 = v41;
    if (-[AMSUIMessageViewLayoutContext _isSymbolImage](self, "_isSymbolImage"))
      -[AMSUIMessageViewLayoutContext _scaledUIValueForValue:](self, "_scaledUIValueForValue:", 16.0);
    else
      -[AMSUIMessageViewLayoutContext _interitemSpacing](self, "_interitemSpacing");
    v279 = v275 + v278;
    -[AMSUIMessageViewLayoutContext separatorThickness](self, "separatorThickness");
    v281 = v280;
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v282, "accessoryView");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    v284 = v283 != 0;

    v285 = -0.0;
    if (v284 && v276)
      v285 = v306 + v304 + v288;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v279 + v285, (v312 - (v312 + -24.0)) * 0.5, v281, v312 + -24.0);
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v286);

    v41 = v277;
    v12 = v273;
    v9 = v272;
    goto LABEL_92;
  }
LABEL_93:
  -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", v318, v320, v316, v322, v151, v152, v153, v154);
  v319 = v155;
  v321 = v156;
  v323 = v157;
  v159 = v158;
  -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", v9, r1, v12, v14, v160, v161, v162, v163);
  v313 = v164;
  v315 = v165;
  v317 = v166;
  r1a = v167;
  -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", v310, v308, v291, v290, v168, v169, v170, v171);
  v173 = v172;
  v175 = v174;
  v177 = v176;
  v179 = v178;
  -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", v306, v302, v304, v300, v180, v181, v182, v183);
  v305 = v184;
  v307 = v185;
  v309 = v186;
  v311 = v187;
  -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", v298, v296, v293, v292, v188, v189, v190, v191);
  v297 = v192;
  v299 = v193;
  v301 = v194;
  v303 = v195;
  if (-[AMSUIMessageViewLayoutContext _shouldOffsetFooterButtonFromMainContentView](self, "_shouldOffsetFooterButtonFromMainContentView"))
  {
    -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
    +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", v334, v331, v71, v41, v196, v197, v198, v199);
    v41 = v203;
  }
  else
  {
    v202 = v71;
    v201 = v331;
    v200 = v334;
  }
  v204 = v69;
  v205 = *(void **)(v69 + 3768);
  v339[0] = MEMORY[0x24BDAC760];
  v339[1] = 3221225472;
  v339[2] = __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke;
  v339[3] = &__block_descriptor_64_e26___NSValue_16__0__NSValue_8l;
  v332 = v201;
  v335 = v200;
  *(double *)&v339[4] = v200;
  *(double *)&v339[5] = v201;
  v329 = v202;
  *(double *)&v339[6] = v202;
  *(double *)&v339[7] = v41;
  objc_msgSend(v294, "ams_mapWithTransform:", v339);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "arrayWithArray:", v206);
  v207 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39 <= 5 && ((1 << v39) & 0x2C) != 0)
  {
    v208 = v289;
    if (v32)
    {
      v209 = *(void **)(v204 + 3768);
      v338[0] = MEMORY[0x24BDAC760];
      v338[1] = 3221225472;
      v338[2] = __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke_2;
      v338[3] = &__block_descriptor_64_e26___NSValue_16__0__NSValue_8l;
      *(double *)&v338[4] = v335;
      *(double *)&v338[5] = v332;
      *(double *)&v338[6] = v329;
      *(double *)&v338[7] = v41;
      objc_msgSend(v27, "ams_mapWithTransform:", v338);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "arrayWithArray:", v210);
      v211 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v211;
    }
  }
  else
  {
    v208 = v289;
  }
  v212 = v173 + -12.0;
  v325 = v41;
  if (v208 == 1)
  {
    -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
    +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v319, v321, v323, v159, v213, v214, v215, v216);
    v319 = v217;
    v321 = v218;
    v323 = v219;
    v295 = v220;
    -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
    +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v313, v315, v317, r1a, v221, v222, v223, v224);
    v313 = v225;
    v315 = v226;
    v317 = v227;
    r1a = v228;
    -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
    +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v305, v307, v309, v311, v229, v230, v231, v232);
    v305 = v233;
    v307 = v234;
    v309 = v235;
    v311 = v236;
    -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
    +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v297, v299, v301, v303, v237, v238, v239, v240);
    v297 = v241;
    v299 = v242;
    v301 = v243;
    v303 = v244;
    v245 = *(void **)(v204 + 3768);
    v246 = MEMORY[0x24BDAC760];
    v337[0] = MEMORY[0x24BDAC760];
    v337[1] = 3221225472;
    v337[2] = __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke_3;
    v337[3] = &unk_24CB501E8;
    v337[4] = self;
    objc_msgSend(v27, "ams_mapWithTransform:", v337);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v245, "arrayWithArray:", v247);
    v248 = objc_claimAutoreleasedReturnValue();

    v249 = *(void **)(v204 + 3768);
    v336[0] = v246;
    v336[1] = 3221225472;
    v336[2] = __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke_4;
    v336[3] = &unk_24CB501E8;
    v336[4] = self;
    objc_msgSend(v207, "ams_mapWithTransform:", v336);
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v249, "arrayWithArray:", v250);
    v251 = objc_claimAutoreleasedReturnValue();

    -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
    +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v173 + -12.0, v175 + -10.0, v177, v179, v252, v253, v254, v255);
    v212 = v256;
    v258 = v257;
    v260 = v259;
    v262 = v261;
    v207 = (void *)v251;
    v27 = (void *)v248;
  }
  else
  {
    v295 = v159;
    v260 = v177;
    v262 = v179;
    v258 = v175 + -10.0;
  }
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v263, "bounds");
  v265 = v264;
  v267 = v266;
  v269 = v268;
  v271 = v270;

  -[AMSUIMessageViewLayoutContext setImageViewFrame:](self, "setImageViewFrame:", v319, v321, v323, v295);
  -[AMSUIMessageViewLayoutContext setMaskViewFrame:](self, "setMaskViewFrame:", v265, v267, v269, v271);
  -[AMSUIMessageViewLayoutContext setTextViewFrame:](self, "setTextViewFrame:", v313, v315, v317, r1a);
  -[AMSUIMessageViewLayoutContext setAccessoryViewFrame:](self, "setAccessoryViewFrame:", v305, v307, v309, v311);
  -[AMSUIMessageViewLayoutContext setAccessorySecondaryViewFrame:](self, "setAccessorySecondaryViewFrame:", v297, v299, v301, v303);
  -[AMSUIMessageViewLayoutContext setSeparatorViewFrames:](self, "setSeparatorViewFrames:", v27);
  -[AMSUIMessageViewLayoutContext setFooterContainerViewFrame:](self, "setFooterContainerViewFrame:", v335, v332, v329, v325);
  -[AMSUIMessageViewLayoutContext setFooterButtonFrames:](self, "setFooterButtonFrames:", v207);
  -[AMSUIMessageViewLayoutContext setDebugButtonFrame:](self, "setDebugButtonFrame:", v212, v258, v260, v262);

}

uint64_t __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a2, "CGRectValue");
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:");
  return objc_msgSend(v2, "valueWithCGRect:");
}

uint64_t __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a2, "CGRectValue");
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:");
  return objc_msgSend(v2, "valueWithCGRect:");
}

uint64_t __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke_3(uint64_t a1, void *a2)
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
  double v12;
  double v13;
  double v14;
  double v15;

  v3 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a2, "CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "mainContentFrame");
  +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v5, v7, v9, v11, v12, v13, v14, v15);
  return objc_msgSend(v3, "valueWithCGRect:");
}

uint64_t __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke_4(uint64_t a1, void *a2)
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
  double v12;
  double v13;
  double v14;
  double v15;

  v3 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a2, "CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "mainContentFrame");
  +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v5, v7, v9, v11, v12, v13, v14, v15);
  return objc_msgSend(v3, "valueWithCGRect:");
}

- (void)calculateAccessoryViewFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIMessageViewLayoutContext accessoryViewFrame](self, "accessoryViewFrame");
    v6 = v5;
    v8 = v7;
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v10;
    else
      v15 = 0;

    v11 = 0.0;
    v12 = 0.0;
    if ((objc_msgSend(v15, "isDefaultCloseButton") & 1) == 0)
    {
      -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
      v12 = (v13 - v8) * 0.5;
    }
    if (!-[AMSUIMessageViewLayoutContext _isAccessoryViewLeading](self, "_isAccessoryViewLeading"))
    {
      -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
      v11 = v14 - v6;
    }
    -[AMSUIMessageViewLayoutContext setAccessoryViewFrame:](self, "setAccessoryViewFrame:", v11, v12, v6, v8);

  }
  else
  {
    -[AMSUIMessageViewLayoutContext setAccessoryViewFrame:](self, "setAccessoryViewFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
}

- (void)calculateAccessorySecondaryViewFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessorySecondaryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIMessageViewLayoutContext accessorySecondaryViewFrame](self, "accessorySecondaryViewFrame");
    v6 = v5;
    v8 = v7;
    -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
    v10 = v9 - v6;
    -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
    v12 = (v11 - v8) * 0.5;
  }
  else
  {
    v10 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  -[AMSUIMessageViewLayoutContext setAccessorySecondaryViewFrame:](self, "setAccessorySecondaryViewFrame:", v10, v12, v6, v8);
}

- (void)calculateAccessoryViewSize
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

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessoryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeThatFits:", 100.0, 1.79769313e308);
    v10 = v9;
    v12 = v11;

    -[AMSUIMessageViewLayoutContext setAccessoryViewFrame:](self, "setAccessoryViewFrame:", v5, v6, v10, v12);
  }
}

- (void)calculateAccessorySecondaryViewSize
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

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessorySecondaryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessorySecondaryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeThatFits:", 100.0, 1.79769313e308);
    v10 = v9;
    v12 = v11;

    -[AMSUIMessageViewLayoutContext setAccessorySecondaryViewFrame:](self, "setAccessorySecondaryViewFrame:", v5, v6, v10, v12);
  }
}

- (void)calculateMainContentFrameRootFrame:(CGRect)a3
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
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;

  height = a3.size.height;
  width = a3.size.width;
  -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame", a3.origin.x, a3.origin.y);
  -[AMSUIMessageViewLayoutContext contentLayoutMargins](self, "contentLayoutMargins");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = height - v6 - v12;
  -[AMSUIMessageViewLayoutContext _bottomFooterSpacing](self, "_bottomFooterSpacing");
  v15 = v13 - v14;
  v16 = width - v9 - v11;
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "style");

  if (v18 == 2)
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "safeAreaInsets");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    v15 = v15 - (v21 + v25);
    v16 = v16 - (v23 + v27);
  }
  -[AMSUIMessageViewLayoutContext footerButtonFrames](self, "footerButtonFrames");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29)
  {
    -[AMSUIMessageViewLayoutContext _footerButtonSpacing](self, "_footerButtonSpacing");
    v15 = v15 - v30;
  }
  if (!-[AMSUIMessageViewLayoutContext _isFooterButtonPartOfContentFrame](self, "_isFooterButtonPartOfContentFrame"))
  {
    -[AMSUIMessageViewLayoutContext totalFooterButtonHeight](self, "totalFooterButtonHeight");
    v15 = v15 - v31;
  }
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "maskShapeView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "maskShapeView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "arrowHeight");
    v37 = v36;

    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "maskShapeView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "arrowDirection");

    switch(v40)
    {
      case 1:
        v7 = v7 + v37;
        goto LABEL_10;
      case 2:
LABEL_10:
        v15 = v15 - v37;
        break;
      case 4:
        v9 = v9 + v37;
        goto LABEL_12;
      case 8:
LABEL_12:
        v16 = v16 - v37;
        break;
      default:
        break;
    }
  }
  -[AMSUIMessageViewLayoutContext setMainContentFrame:](self, "setMainContentFrame:", v9, v7, v16, v15);
}

- (void)calculateTextViewSizeInFrame:(CGRect)a3 dirty:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _QWORD v41[2];

  v4 = a4;
  v41[1] = *MEMORY[0x24BDAC8D0];
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasText");

  if (v8)
  {
    -[AMSUIMessageViewLayoutContext _maxTextContainerWidth](self, "_maxTextContainerWidth");
    v10 = v9;
    if (-[AMSUIMessageViewLayoutContext _isTextOnlyBanner](self, "_isTextOnlyBanner"))
    {
      -[AMSUIMessageViewLayoutContext _bannerMaxTextWidth](self, "_bannerMaxTextWidth");
      if (v10 >= v11)
        v10 = v11;
    }
    if (v4)
    {
      -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
      v13 = v12;
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textContainerInset");
      v17 = v16;
      v19 = v18;

      v20 = v19 + v13 + v17;
      -[AMSUIMessageViewLayoutContext calculateTextViewExclusionFrame](self, "calculateTextViewExclusionFrame");
      -[AMSUIMessageViewLayoutContext textViewExclusionPath](self, "textViewExclusionPath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[AMSUIMessageViewLayoutContext textViewExclusionPath](self, "textViewExclusionPath");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v22;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "textView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "textContainer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setExclusionPaths:", v23);

      }
      else
      {
        -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "textView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "textContainer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setExclusionPaths:", MEMORY[0x24BDBD1A8]);
      }

      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "textView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sizeThatFits:", v10, v20);
      v30 = v29;
      v32 = v31;

      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "traitCollection");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "layoutDirection");

      if (v35 == 1)
        v36 = v10;
      else
        v36 = v30;
      -[AMSUIMessageViewLayoutContext setTextViewContentHuggingSize:](self, "setTextViewContentHuggingSize:", v36, v32);
    }
    v37 = *MEMORY[0x24BDBEFB0];
    v38 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[AMSUIMessageViewLayoutContext textViewContentHuggingSize](self, "textViewContentHuggingSize");
    -[AMSUIMessageViewLayoutContext setTextViewFrame:](self, "setTextViewFrame:", v37, v38, v39, v40);
  }
}

- (void)calculateTextViewExclusionFrame
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double y;
  double v10;
  double v11;
  double v12;
  double height;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double x;
  double width;
  void *v30;
  uint64_t v31;
  double v32;
  void *v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGRect v37;
  CGRect v38;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AMSUIMessageViewLayoutContext _isAccessoryViewLeading](self, "_isAccessoryViewLeading"))
    goto LABEL_2;
  objc_msgSend(v3, "accessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    goto LABEL_6;
  }
  objc_msgSend(v3, "accessorySecondaryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_6:
    -[AMSUIMessageViewLayoutContext accessoryViewFrame](self, "accessoryViewFrame");
    v7 = v6;
    y = v8;
    v11 = v10;
    height = v12;
    objc_msgSend(v3, "accessoryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accessorySecondaryView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[AMSUIMessageViewLayoutContext accessorySecondaryViewFrame](self, "accessorySecondaryViewFrame");
      v7 = v18;
      y = v19;
      v11 = v20;
      height = v21;
      objc_msgSend(v3, "accessorySecondaryView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;

      v15 = v23;
    }
    if (-[AMSUIMessageViewLayoutContext _shouldTextViewTextFillUnderCloseButton](self, "_shouldTextViewTextFillUnderCloseButton"))
    {
      if (-[AMSUIMessageViewLayoutContext shouldUseStackedLayout](self, "shouldUseStackedLayout")
        && !-[AMSUIMessageViewLayoutContext isImageViewHidden](self, "isImageViewHidden"))
      {
        -[AMSUIMessageViewLayoutContext setTextViewExclusionPath:](self, "setTextViewExclusionPath:", 0);
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
      height = v24;
      y = 0.0;
    }
    -[AMSUIMessageViewLayoutContext leadingContentTextBaseline](self, "leadingContentTextBaseline");
    v26 = v7 - v25;
    -[AMSUIMessageViewLayoutContext accessorySpacing](self, "accessorySpacing");
    x = v26 - v27;
    width = v11 + v27;
    objc_msgSend(v3, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "layoutDirection");

    if (v31 == 1)
    {
      memset(&v36, 0, sizeof(v36));
      CGAffineTransformMakeScale(&v36, -1.0, 1.0);
      memset(&v35, 0, sizeof(v35));
      -[AMSUIMessageViewLayoutContext _maxTextContainerWidth](self, "_maxTextContainerWidth");
      v34 = v36;
      CGAffineTransformTranslate(&v35, &v34, -v32, 0.0);
      v34 = v35;
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      v38 = CGRectApplyAffineTransform(v37, &v34);
      y = v38.origin.y;
      width = v38.size.width;
      height = v38.size.height;
      if (v38.origin.x >= 0.01)
        x = v38.origin.x;
      else
        x = 0.0;
    }
    objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", x, y, width, height);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIMessageViewLayoutContext setTextViewExclusionPath:](self, "setTextViewExclusionPath:", v33);

    goto LABEL_24;
  }
LABEL_2:
  -[AMSUIMessageViewLayoutContext setTextViewExclusionPath:](self, "setTextViewExclusionPath:", 0);
LABEL_25:

}

- (void)_calculateFooterButtonSizes
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[8];
  _QWORD v12[4];

  if (-[AMSUIMessageViewLayoutContext isDirty](self, "isDirty"))
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "footerButtonViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[AMSUIMessageViewLayoutContext footerButtonFramesPreFlatten](self, "footerButtonFramesPreFlatten");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeAllObjects");

      -[AMSUIMessageViewLayoutContext _maxFooterButtonWidth](self, "_maxFooterButtonWidth");
      v8 = v7;
      v12[0] = 0;
      v12[1] = v12;
      v12[2] = 0x2020000000;
      v12[3] = 0;
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "footerButtonViews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __60__AMSUIMessageViewLayoutContext__calculateFooterButtonSizes__block_invoke;
      v11[3] = &unk_24CB50210;
      v11[6] = v8;
      v11[7] = 0x4061800000000000;
      v11[4] = self;
      v11[5] = v12;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

      _Block_object_dispose(v12, 8);
    }
  }
}

double __60__AMSUIMessageViewLayoutContext__calculateFooterButtonSizes__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  double result;

  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "_footerMinimumHeight");
  if (v4 < v5)
    v4 = v5;
  v6 = *(double *)(a1 + 48);
  v7 = *MEMORY[0x24BDBEFB0];
  v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "footerButtonFramesPreFlatten");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v7, v8, v6, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  objc_msgSend(*(id *)(a1 + 32), "_footerButtonInterSpacing");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v4 + v11 + *(double *)(v12 + 24);
  *(double *)(v12 + 24) = result;
  return result;
}

- (double)_bottomFooterSpacing
{
  void *v2;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");

  return 0.0;
}

- (NSDirectionalEdgeInsets)contentLayoutMargins
{
  void *v3;
  void *v4;
  NSString *v5;
  BOOL IsAccessibilityCategory;
  void *v7;
  uint64_t v8;
  int v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSDirectionalEdgeInsets result;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "style");

  if (v8 == 1)
  {
    v9 = 1;
    v12 = 10.0;
    v10 = 12.0;
    v11 = 12.0;
  }
  else if (v8)
  {
    v9 = 1;
    v12 = 11.0;
    v10 = 13.0;
    v11 = 13.0;
  }
  else if (IsAccessibilityCategory)
  {
    v9 = 0;
    v10 = 16.0;
    v11 = 16.0;
    v12 = 16.0;
  }
  else
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    v12 = 11.0;
    if (v15 == 1)
      v10 = 9.0;
    else
      v10 = 11.0;
    if (v15 == 1)
      v11 = 9.0;
    else
      v11 = 14.0;
    v9 = 1;
  }
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "style") == 1
    && !-[AMSUIMessageViewLayoutContext shouldUseStackedLayout](self, "shouldUseStackedLayout"))
  {
    v34 = -[AMSUIMessageViewLayoutContext isImageViewHidden](self, "isImageViewHidden");

    if (!v34)
    {
      if (-[AMSUIMessageViewLayoutContext _isSymbolImage](self, "_isSymbolImage"))
        v11 = 16.0;
      else
        v11 = 20.0;
    }
  }
  else
  {

  }
  if (v9)
  {
    -[AMSUIMessageViewLayoutContext _scaledUIValueForValue:](self, "_scaledUIValueForValue:", v12);
    v18 = v17;
    -[AMSUIMessageViewLayoutContext _scaledUIValueForValue:](self, "_scaledUIValueForValue:", v12);
    v12 = v19;
    -[AMSUIMessageViewLayoutContext _scaledUIValueForValue:](self, "_scaledUIValueForValue:", v11);
    v11 = v20;
    -[AMSUIMessageViewLayoutContext _scaledUIValueForValue:](self, "_scaledUIValueForValue:", v10);
    v10 = v21;
  }
  else
  {
    v18 = v12;
  }
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "style"))
  {

  }
  else
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "userInterfaceIdiom");

    if (v25 == 1)
    {
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "safeAreaInsets");
      v28 = v27;
      v30 = v29;

      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "traitCollection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "layoutDirection");

      if (v33 == 1)
      {
        if (v11 < v28)
          v11 = v28;
      }
      else if (v10 < v30)
      {
        v10 = v30;
      }
    }
  }
  v35 = v18;
  v36 = v11;
  v37 = v12;
  v38 = v10;
  result.trailing = v38;
  result.bottom = v37;
  result.leading = v36;
  result.top = v35;
  return result;
}

- (CGSize)_makeImageViewSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[AMSUIMessageViewLayoutContext _imageLength](self, "_imageLength");
  v4 = v3;
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "preLayoutImageView");

  if (!(_DWORD)v6 || v7)
  {
    if (!v7)
    {
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "micaPlayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v4 = *MEMORY[0x24BDBF148];
        v12 = *(double *)(MEMORY[0x24BDBF148] + 8);
        goto LABEL_7;
      }
    }
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "micaPlayer");

  }
  v12 = v4;
LABEL_7:

  v13 = v4;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)_bannerMaxTextWidth
{
  void *v2;
  void *v3;
  _BOOL4 v4;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass") == 2;

  return dbl_211254750[v4];
}

- (unint64_t)effectiveImageStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "imageStyle");

  if (!v4)
    return 1;
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "imageStyle");

  return v6;
}

- (double)_footerButtonInterSpacing
{
  return 0.0;
}

- (double)_footerButtonSpacing
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  double result;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  if (v4)
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "style");

    v7 = 0.0;
    if (v6 == 6)
    {
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView", 0.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferredContentSizeCategory");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

      v7 = 0.0;
      if (IsAccessibilityCategory)
        v7 = 4.0;
    }
  }
  else
  {
    v7 = 6.0;
  }
  -[AMSUIMessageViewLayoutContext _scaledUIValueForValue:](self, "_scaledUIValueForValue:", v7);
  return result;
}

- (double)_footerMinimumHeight
{
  void *v3;
  void *v4;
  uint64_t v5;
  double result;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "style")
    || -[AMSUIMessageViewLayoutContext shouldUseStackedLayout](self, "shouldUseStackedLayout"))
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "style");

    if (v5 != 6)
    {
      -[AMSUIMessageViewLayoutContext _scaledUIValueForValue:](self, "_scaledUIValueForValue:", 44.0);
      return result;
    }
  }
  else
  {

  }
  return 0.0;
}

- (CGRect)_effectiveTextViewFrame
{
  void *v3;
  void *v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textContainerInset");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[AMSUIMessageViewLayoutContext textViewFrame](self, "textViewFrame");
  v16 = v15 - (v6 + v10);
  v18 = v17 - (v8 + v12);
  result.size.height = v16;
  result.size.width = v18;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)_imageLength
{
  id v3;
  void *v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  BOOL v26;

  if (_imageLength_ams_once_token___COUNTER__ != -1)
    dispatch_once(&_imageLength_ams_once_token___COUNTER__, &__block_literal_global_9);
  v3 = (id)_imageLength_ams_once_object___COUNTER__;
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (!IsAccessibilityCategory)
    goto LABEL_6;
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 || (objc_msgSend(v11, "doubleValue"), v13 = v12, v11, v13 == 2.22507386e-308))
  {
LABEL_6:
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "style");

    if (v15)
    {
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "style") == 3)
      {
LABEL_10:

LABEL_11:
        if (-[AMSUIMessageViewLayoutContext effectiveImageStyle](self, "effectiveImageStyle") == 2)
        {
LABEL_16:
          *(double *)&v20 = 44.0;
LABEL_25:
          v13 = *(double *)&v20;
          goto LABEL_26;
        }
        if (!-[AMSUIMessageViewLayoutContext _isSymbolImage](self, "_isSymbolImage"))
        {
          -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "style") == 3)
          {
            -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "footerButtonViews");

          }
          goto LABEL_16;
        }
        goto LABEL_19;
      }
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "style") == 2)
      {

        goto LABEL_10;
      }
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "style");

      if (v22 == 6)
        goto LABEL_11;
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "style");

      if (v24 == 5)
      {
LABEL_19:
        v13 = 45.0;
        goto LABEL_26;
      }
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "style") == 4)
      {
        v26 = -[AMSUIMessageViewLayoutContext _isSymbolImage](self, "_isSymbolImage");

        if (!v26)
        {
          *(double *)&v20 = 52.0;
          goto LABEL_25;
        }
      }
      else
      {

      }
    }
    *(double *)&v20 = 40.0;
    goto LABEL_25;
  }
LABEL_26:

  return v13;
}

void __45__AMSUIMessageViewLayoutContext__imageLength__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BEBE070];
  v4[0] = *MEMORY[0x24BEBE078];
  v4[1] = v0;
  v5[0] = &unk_24CB8C8A8;
  v5[1] = &unk_24CB8C8B8;
  v1 = *MEMORY[0x24BEBE060];
  v4[2] = *MEMORY[0x24BEBE068];
  v4[3] = v1;
  v5[2] = &unk_24CB8C8C8;
  v5[3] = &unk_24CB8C8D8;
  v4[4] = *MEMORY[0x24BEBE058];
  v5[4] = &unk_24CB8C8E8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_imageLength_ams_once_object___COUNTER__;
  _imageLength_ams_once_object___COUNTER__ = v2;

}

- (double)_imageToLabelSpacing
{
  void *v3;
  uint64_t v4;
  double v5;
  double result;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  v5 = 4.0;
  if (!v4)
    v5 = 6.0;
  -[AMSUIMessageViewLayoutContext _scaledUIValueForValue:](self, "_scaledUIValueForValue:", v5);
  return result;
}

- (double)_interitemSpacing
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double result;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  v5 = 10.0;
  if (v4)
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "style");

    if (v7 != 1)
    {
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "style") != 2)
      {
        -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "style") != 6)
        {
          -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "style");

        }
      }

      v5 = 11.0;
    }
  }
  -[AMSUIMessageViewLayoutContext _scaledUIValueForValue:](self, "_scaledUIValueForValue:", v5);
  return result;
}

- (BOOL)_isAccessoryViewLeading
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 6)
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "style") == 2)
    {
      v10 = objc_msgSend(v5, "isDefaultCloseButton");
    }
    else
    {
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "style") == 6)
      {
        v10 = objc_msgSend(v5, "isDefaultCloseButton");
      }
      else
      {
        -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "style") == 3)
          v10 = objc_msgSend(v5, "isDefaultCloseButton");
        else
          v10 = 0;

      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_isIconImageTopAligned
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  if (v4 == 5)
    return 1;
  if (v4)
    return 0;
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom") != 0;

  return v7;
}

- (BOOL)_isFooterButtonPartOfContentFrame
{
  void *v2;
  uint64_t v3;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style");

  return (unint64_t)(v3 - 6) < 0xFFFFFFFFFFFFFFFBLL;
}

- (BOOL)_isSymbolImage
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isImageSymbolImage") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "isSymbolImage");

  }
  return v4;
}

- (BOOL)_isTextOnlyBanner
{
  void *v3;
  _BOOL4 v4;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "style") == 1 && -[AMSUIMessageViewLayoutContext isImageViewHidden](self, "isImageViewHidden"))
    v4 = !-[AMSUIMessageViewLayoutContext shouldUseStackedLayout](self, "shouldUseStackedLayout");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (double)_maxFooterButtonWidth
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;

  -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
  v4 = v3;
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "style");

  if (v6 != 5)
  {
    -[AMSUIMessageViewLayoutContext leadingContentTextBaseline](self, "leadingContentTextBaseline");
    v4 = v4 - v7;
  }
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "style") != 2)
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "style") != 3)
    {
      -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "style");

      if (v15 != 5)
        goto LABEL_8;
      goto LABEL_7;
    }

  }
LABEL_7:
  -[AMSUIMessageViewLayoutContext contentLayoutMargins](self, "contentLayoutMargins");
  v4 = v4 + v10;
LABEL_8:
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "style")
    || -[AMSUIMessageViewLayoutContext shouldUseStackedLayout](self, "shouldUseStackedLayout"))
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "style");

    if (v13 != 6)
      return v4;
  }
  else
  {

  }
  -[AMSUIMessageViewLayoutContext accessoryViewFrame](self, "accessoryViewFrame");
  return v4 - v16;
}

- (double)_maxTextContainerWidth
{
  double v3;
  double v4;
  double v5;

  -[AMSUIMessageViewLayoutContext mainContentFrame](self, "mainContentFrame");
  v4 = v3;
  -[AMSUIMessageViewLayoutContext leadingContentTextBaseline](self, "leadingContentTextBaseline");
  return v4 - v5;
}

- (double)_scaledUIValueForValue:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE220]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValueForValue:compatibleWithTraitCollection:", v7, a3);
  v9 = v8;

  return v9;
}

- (BOOL)_shouldOffsetFooterButtonFromMainContentView
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "style"))
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "style") == 6)
      v5 = !-[AMSUIMessageViewLayoutContext shouldUseStackedLayout](self, "shouldUseStackedLayout");
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    v5 = !-[AMSUIMessageViewLayoutContext shouldUseStackedLayout](self, "shouldUseStackedLayout");
  }

  return v5;
}

- (BOOL)_shouldTextViewTextFillUnderCloseButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  id v8;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "style"))
  {
    v6 = 0;
LABEL_9:

    return v6;
  }
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "style");

  if (v5 != 1)
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    v6 = objc_msgSend(v8, "isDefaultCloseButton");
    goto LABEL_9;
  }
  return 0;
}

- (BOOL)shouldUseStackedLayout
{
  void *v2;
  void *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  return IsAccessibilityCategory;
}

- (double)accessorySpacing
{
  return 10.0;
}

- (BOOL)isImageViewHidden
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "preLayoutImageView") ^ 1;

  }
  return v6;
}

- (double)leadingContentTextBaseline
{
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;

  v3 = 0.0;
  if (!-[AMSUIMessageViewLayoutContext shouldUseStackedLayout](self, "shouldUseStackedLayout")
    && !-[AMSUIMessageViewLayoutContext isImageViewHidden](self, "isImageViewHidden"))
  {
    -[AMSUIMessageViewLayoutContext _makeImageViewSize](self, "_makeImageViewSize");
    v5 = v4 + 0.0;
    -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "style");

    if (v7 == 1)
    {
      if (-[AMSUIMessageViewLayoutContext _isSymbolImage](self, "_isSymbolImage"))
        -[AMSUIMessageViewLayoutContext _scaledUIValueForValue:](self, "_scaledUIValueForValue:", 16.0);
      else
        -[AMSUIMessageViewLayoutContext _interitemSpacing](self, "_interitemSpacing");
      v3 = v5 + v8 * 2.0;
    }
    else
    {
      -[AMSUIMessageViewLayoutContext _interitemSpacing](self, "_interitemSpacing");
      v3 = v5 + v9;
    }
  }
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessoryView");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = -[AMSUIMessageViewLayoutContext _isAccessoryViewLeading](self, "_isAccessoryViewLeading");

    if (v13)
    {
      -[AMSUIMessageViewLayoutContext accessoryViewFrame](self, "accessoryViewFrame");
      v15 = v14;
      -[AMSUIMessageViewLayoutContext accessoryViewFrame](self, "accessoryViewFrame");
      v17 = v15 + v16;
      -[AMSUIMessageViewLayoutContext accessorySpacing](self, "accessorySpacing");
      v3 = v3 + v18 + v17;
    }
  }
  else
  {

  }
  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "textView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "textContainerInset");
  v22 = v3 - v21;

  return v22;
}

- (double)separatorThickness
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[AMSUIMessageViewLayoutContext messageView](self, "messageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = 1.0 / v4;

  return v5;
}

- (double)totalFooterButtonHeight
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[AMSUIMessageViewLayoutContext footerButtonFramesPreFlatten](self, "footerButtonFramesPreFlatten");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0.0;
  -[AMSUIMessageViewLayoutContext _footerButtonInterSpacing](self, "_footerButtonInterSpacing");
  v6 = v5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AMSUIMessageViewLayoutContext footerButtonFramesPreFlatten](self, "footerButtonFramesPreFlatten", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "CGRectValue");
        v11 = v11 + v6 + v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  return v11 - v6;
}

- (CGRect)accessoryViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_accessoryViewFrame.origin.x;
  y = self->_accessoryViewFrame.origin.y;
  width = self->_accessoryViewFrame.size.width;
  height = self->_accessoryViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAccessoryViewFrame:(CGRect)a3
{
  self->_accessoryViewFrame = a3;
}

- (CGRect)accessorySecondaryViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_accessorySecondaryViewFrame.origin.x;
  y = self->_accessorySecondaryViewFrame.origin.y;
  width = self->_accessorySecondaryViewFrame.size.width;
  height = self->_accessorySecondaryViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAccessorySecondaryViewFrame:(CGRect)a3
{
  self->_accessorySecondaryViewFrame = a3;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (CGRect)debugButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_debugButtonFrame.origin.x;
  y = self->_debugButtonFrame.origin.y;
  width = self->_debugButtonFrame.size.width;
  height = self->_debugButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDebugButtonFrame:(CGRect)a3
{
  self->_debugButtonFrame = a3;
}

- (CGSize)debugButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_debugButtonSize.width;
  height = self->_debugButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDebugButtonSize:(CGSize)a3
{
  self->_debugButtonSize = a3;
}

- (NSMutableArray)footerButtonFrames
{
  return self->_footerButtonFrames;
}

- (void)setFooterButtonFrames:(id)a3
{
  objc_storeStrong((id *)&self->_footerButtonFrames, a3);
}

- (CGRect)imageViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_imageViewFrame.origin.x;
  y = self->_imageViewFrame.origin.y;
  width = self->_imageViewFrame.size.width;
  height = self->_imageViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setImageViewFrame:(CGRect)a3
{
  self->_imageViewFrame = a3;
}

- (CGRect)maskViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_maskViewFrame.origin.x;
  y = self->_maskViewFrame.origin.y;
  width = self->_maskViewFrame.size.width;
  height = self->_maskViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMaskViewFrame:(CGRect)a3
{
  self->_maskViewFrame = a3;
}

- (NSMutableArray)separatorViewFrames
{
  return self->_separatorViewFrames;
}

- (void)setSeparatorViewFrames:(id)a3
{
  objc_storeStrong((id *)&self->_separatorViewFrames, a3);
}

- (CGRect)textViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_textViewFrame.origin.x;
  y = self->_textViewFrame.origin.y;
  width = self->_textViewFrame.size.width;
  height = self->_textViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTextViewFrame:(CGRect)a3
{
  self->_textViewFrame = a3;
}

- (NSMutableArray)footerButtonFramesPreFlatten
{
  return self->_footerButtonFramesPreFlatten;
}

- (void)setFooterButtonFramesPreFlatten:(id)a3
{
  objc_storeStrong((id *)&self->_footerButtonFramesPreFlatten, a3);
}

- (CGRect)footerContainerViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_footerContainerViewFrame.origin.x;
  y = self->_footerContainerViewFrame.origin.y;
  width = self->_footerContainerViewFrame.size.width;
  height = self->_footerContainerViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFooterContainerViewFrame:(CGRect)a3
{
  self->_footerContainerViewFrame = a3;
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (CGSize)lastFittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastFittingSize.width;
  height = self->_lastFittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastFittingSize:(CGSize)a3
{
  self->_lastFittingSize = a3;
}

- (CGRect)lastMessageViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastMessageViewFrame.origin.x;
  y = self->_lastMessageViewFrame.origin.y;
  width = self->_lastMessageViewFrame.size.width;
  height = self->_lastMessageViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastMessageViewFrame:(CGRect)a3
{
  self->_lastMessageViewFrame = a3;
}

- (CGSize)lastSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastSize.width;
  height = self->_lastSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastSize:(CGSize)a3
{
  self->_lastSize = a3;
}

- (CGRect)mainContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_mainContentFrame.origin.x;
  y = self->_mainContentFrame.origin.y;
  width = self->_mainContentFrame.size.width;
  height = self->_mainContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMainContentFrame:(CGRect)a3
{
  self->_mainContentFrame = a3;
}

- (AMSUIMessageView)messageView
{
  return (AMSUIMessageView *)objc_loadWeakRetained((id *)&self->_messageView);
}

- (void)setMessageView:(id)a3
{
  objc_storeWeak((id *)&self->_messageView, a3);
}

- (CGSize)textViewContentHuggingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_textViewContentHuggingSize.width;
  height = self->_textViewContentHuggingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTextViewContentHuggingSize:(CGSize)a3
{
  self->_textViewContentHuggingSize = a3;
}

- (UIBezierPath)textViewExclusionPath
{
  return self->_textViewExclusionPath;
}

- (void)setTextViewExclusionPath:(id)a3
{
  objc_storeStrong((id *)&self->_textViewExclusionPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewExclusionPath, 0);
  objc_destroyWeak((id *)&self->_messageView);
  objc_storeStrong((id *)&self->_footerButtonFramesPreFlatten, 0);
  objc_storeStrong((id *)&self->_separatorViewFrames, 0);
  objc_storeStrong((id *)&self->_footerButtonFrames, 0);
}

@end
