@implementation CKEffectPickerView

- (void)updateMomentTitle:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MaxX;
  double v20;
  void *v21;
  double v22;
  double v23;
  double MinY;
  double v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v3 = a3;
  -[CKEffectPickerView momentTitleLabel](self, "momentTitleLabel");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView momentIdentifiers](self, "momentIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView pageControl](self, "pageControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v6, "currentPage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerView fsem](self, "fsem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedPickerTitleForEffectWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "setText:", v9);
  objc_msgSend(v36, "sizeToFit");
  -[CKEffectPickerView balloonView](self, "balloonView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v37.origin.x = v12;
  v37.origin.y = v14;
  v37.size.width = v16;
  v37.size.height = v18;
  MaxX = CGRectGetMaxX(v37);
  objc_msgSend(v36, "frame");
  v20 = MaxX - CGRectGetWidth(v38);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "balloonMaskTailSizeForTailShape:", 2);
  v23 = v20 - v22;
  v39.origin.x = v12;
  v39.origin.y = v14;
  v39.size.width = v16;
  v39.size.height = v18;
  MinY = CGRectGetMinY(v39);
  objc_msgSend(v36, "frame");
  v25 = MinY - CGRectGetHeight(v40) + -4.0;

  objc_msgSend(v36, "frame");
  objc_msgSend(v36, "setFrame:", v23, v25);
  if (v3)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0CD2710]);
    objc_msgSend(v26, "setBeginTime:", CACurrentMediaTime());
    -[CKEffectPickerView momentTitleLabel](self, "momentTitleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "position");
    v30 = v29;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30 + 30.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFromValue:", v31);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setToValue:", v32);

    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTimingFunction:", v33);

    -[CKEffectPickerView momentTitleLabel](self, "momentTitleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addAnimation:forKey:", v26, CFSTR("position.y"));

  }
  -[CKEffectPickerView updateViewColors](self, "updateViewColors");

}

- (UISegmentedControl)typeSegmentedControl
{
  return self->_typeSegmentedControl;
}

- (void)invalidateAllAnimationTimers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CKEffectPickerView animationTimers](self, "animationTimers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "invalidate");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[CKEffectPickerView animationTimers](self, "animationTimers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  -[CKEffectPickerView animatedCells](self, "animatedCells");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

- (void)cancelImpactSelection
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[CKEffectPickerView selectedIndex](self, "selectedIndex");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CKEffectPickerView effectSendButtons](self, "effectSendButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8++), "setHidden:", 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CKEffectPickerView effectDotButtons](self, "effectDotButtons", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setHidden:", 0);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

  -[CKEffectPickerView _animateSelectedEffectLabelAtIndex:fromPreviousIndex:](self, "_animateSelectedEffectLabelAtIndex:fromPreviousIndex:", 0x7FFFFFFFFFFFFFFFLL, v3);
  -[CKEffectPickerView resetDotConstraintsToDefault](self, "resetDotConstraintsToDefault");
  -[CKEffectPickerView _stopBalloonAnimation](self, "_stopBalloonAnimation");
}

- (double)marginBetweenPickerDotButtons
{
  return 0.0;
}

+ (BOOL)shouldUseLargeScreenDimension
{
  void *v2;
  double Height;
  void *v4;
  double Width;
  CGRect v7;
  CGRect v8;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  Height = CGRectGetHeight(v7);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v8);

  return Height <= Width || Height > 568.0;
}

- (CKEffectPickerView)initWithFrame:(CGRect)a3 sendButtonFrame:(CGRect)a4 balloonViewOrigin:(CGPoint)a5 composition:(id)a6 color:(char)a7
{
  CGFloat y;
  double height;
  double width;
  double v10;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  id v17;
  CKEffectPickerView *v18;
  void *v19;
  void *v20;
  CKChatControllerDummyAnimator *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  CKFullScreenEffectManager *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  double v57;
  double v58;
  double v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  double v82;
  double v83;
  double v84;
  double v85;
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
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  int v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
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
  void *v159;
  double v160;
  double v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
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
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  unsigned int v188;
  void *v189;
  void *v190;
  void *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  CKFullScreenEffectManager *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  objc_super v206;
  void *v207;
  _QWORD v208[2];
  _QWORD v209[3];
  double v210;
  double v211;

  y = a5.y;
  height = a4.size.height;
  width = a4.size.width;
  v10 = a4.origin.y;
  x = a4.origin.x;
  v12 = a3.size.height;
  v13 = a3.size.width;
  v14 = a3.origin.y;
  v15 = a3.origin.x;
  v209[1] = *MEMORY[0x1E0C80C00];
  v17 = *(id *)&a5.x;
  v206.receiver = self;
  v206.super_class = (Class)CKEffectPickerView;
  v18 = -[CKEffectPickerView initWithFrame:](&v206, sel_initWithFrame_, v15, v14, v13, v12);
  if (v18)
  {
    v205 = v17;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v18, sel_contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

    v18->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[CKEffectPickerView setBalloonViewOrigin:](v18, "setBalloonViewOrigin:", v210, v211);
    v188 = LODWORD(y);
    -[CKEffectPickerView setControlColor:](v18, "setControlColor:", *(_QWORD *)&y);
    -[CKEffectPickerView traitCollection](v18, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView setIsInDarkMode:](v18, "setIsInDarkMode:", objc_msgSend(v20, "userInterfaceStyle") == 2);

    v21 = objc_alloc_init(CKChatControllerDummyAnimator);
    -[CKEffectPickerView setDummyAnimator:](v18, "setDummyAnimator:", v21);

    -[CKEffectPickerView layer](v18, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAllowsGroupBlending:", 0);

    v23 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "theme");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fsmPickerBlueLayerBackgroundColor");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v23, "setBackgroundColor:", objc_msgSend(v26, "CGColor"));

    -[CKEffectPickerView layer](v18, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    objc_msgSend(v23, "setFrame:");

    objc_msgSend(v23, "setAllowsGroupBlending:", 0);
    objc_msgSend(v23, "setAllowsGroupOpacity:", 0);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E08]);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCompositingFilter:");
    LODWORD(v28) = 0;
    objc_msgSend(v23, "setOpacity:", v28);
    -[CKEffectPickerView setBlueContrastLayer:](v18, "setBlueContrastLayer:", v23);
    -[CKEffectPickerView layer](v18, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v203 = v23;
    objc_msgSend(v29, "addSublayer:", v23);

    v192 = *MEMORY[0x1E0CD2C88];
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x1E0CD2D90];
    objc_msgSend(v30, "setValue:forKey:", &unk_1E28715E0, *MEMORY[0x1E0CD2D90]);
    v32 = *MEMORY[0x1E0CD2D70];
    objc_msgSend(v30, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D70]);
    v33 = objc_alloc_init(MEMORY[0x1E0CD2708]);
    objc_msgSend(v33, "setAllowsGroupBlending:", 0);
    -[CKEffectPickerView layer](v18, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bounds");
    objc_msgSend(v33, "setFrame:");

    v201 = v30;
    v209[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v209, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFilters:", v35);

    objc_msgSend(v33, "setScale:", 0.5);
    -[CKEffectPickerView setBackdrop:](v18, "setBackdrop:", v33);
    -[CKEffectPickerView layer](v18, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = v33;
    objc_msgSend(v36, "addSublayer:", v33);

    v37 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[CKEffectPickerView bounds](v18, "bounds");
    v38 = (void *)objc_msgSend(v37, "initWithFrame:");
    objc_msgSend(v38, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAllowsGroupBlending:", 0);

    objc_msgSend(v38, "setAutoresizingMask:", 18);
    -[CKEffectPickerView setHintContainer:](v18, "setHintContainer:", v38);
    v199 = v38;
    -[CKEffectPickerView addSubview:](v18, "addSubview:", v38);
    v40 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[CKEffectPickerView bounds](v18, "bounds");
    v41 = (void *)objc_msgSend(v40, "initWithFrame:");
    objc_msgSend(v41, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAllowsGroupBlending:", 0);

    objc_msgSend(v41, "setAutoresizingMask:", 18);
    objc_msgSend(v41, "setSemanticContentAttribute:", 3);
    -[CKEffectPickerView setPeekContainer:](v18, "setPeekContainer:", v41);
    -[CKEffectPickerView addSubview:](v18, "addSubview:", v41);
    v198 = v41;
    objc_msgSend(v41, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView setAnimationTimers:](v18, "setAnimationTimers:", v43);

    v44 = objc_alloc_init(CKFullScreenEffectManager);
    -[CKEffectPickerView setFsem:](v18, "setFsem:", v44);
    v45 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v197 = v44;
    -[CKFullScreenEffectManager effectIdentifiers](v44, "effectIdentifiers");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v45 == 1)
    {
      objc_msgSend(v46, "reverseObjectEnumerator");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "allObjects");
      v49 = objc_claimAutoreleasedReturnValue();

      v47 = (void *)v49;
    }
    v196 = v47;
    -[CKEffectPickerView setMomentIdentifiers:](v18, "setMomentIdentifiers:", v47);
    v50 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bounds");
    v52 = (void *)objc_msgSend(v50, "initWithFrame:");

    objc_msgSend(v52, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setAllowsGroupOpacity:", 0);

    objc_msgSend(v52, "layer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setAllowsGroupBlending:", 0);

    objc_msgSend(v52, "setOpaque:", 0);
    objc_msgSend(v52, "setAutoresizingMask:", 18);
    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addSubview:", v52);

    v195 = v52;
    -[CKEffectPickerView setBackgroundView:](v18, "setBackgroundView:", v52);
    v56 = objc_alloc_init(MEMORY[0x1E0CEA450]);
    -[CKEffectPickerView bounds](v18, "bounds");
    v58 = v57;
    -[CKEffectPickerView bounds](v18, "bounds");
    objc_msgSend(v56, "setItemSize:", v58, v59);
    objc_msgSend(v56, "setMinimumInteritemSpacing:", 0.0);
    objc_msgSend(v56, "setMinimumLineSpacing:", 0.0);
    objc_msgSend(v56, "setScrollDirection:", 1);
    v60 = objc_alloc(MEMORY[0x1E0CEA410]);
    -[CKEffectPickerView bounds](v18, "bounds");
    v194 = v56;
    v61 = (void *)objc_msgSend(v60, "initWithFrame:collectionViewLayout:", v56);
    objc_msgSend(v61, "setPagingEnabled:", 1);
    objc_msgSend(v61, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setBackgroundColor:", v62);

    objc_msgSend(v61, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v61, "setShowsVerticalScrollIndicator:", 0);
    v63 = objc_opt_class();
    +[CKMomentCollectionViewCell reuseIdentifier](CKMomentCollectionViewCell, "reuseIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "registerClass:forCellWithReuseIdentifier:", v63, v64);

    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addSubview:", v61);

    v204 = v61;
    -[CKEffectPickerView setMomentsCollectionView:](v18, "setMomentsCollectionView:", v61);
    v66 = objc_alloc(MEMORY[0x1E0CEA990]);
    CKFrameworkBundle();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_BUBBLE_EFFECT_STYLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v208[0] = v68;
    CKFrameworkBundle();
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_SCREEN_EFFECT_STYLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v208[1] = v70;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v208, 2);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)objc_msgSend(v66, "initWithItems:", v71);

    objc_msgSend(v72, "setSelectedSegmentIndex:", 0);
    objc_msgSend(v72, "sizeToFit");
    objc_msgSend(v72, "addTarget:action:forControlEvents:", v18, sel_effectTypeDidChange_, 4096);
    objc_msgSend(v72, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v72, "widthForSegmentAtIndex:", 0);
    if (v73 < 120.0)
    {
      objc_msgSend(v72, "setWidth:forSegmentAtIndex:", 0, 120.0);
      objc_msgSend(v72, "setWidth:forSegmentAtIndex:", 1, 120.0);
    }
    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addSubview:", v72);

    -[CKEffectPickerView setTypeSegmentedControl:](v18, "setTypeSegmentedControl:", v72);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v192);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setValue:forKey:", &unk_1E2870C78, v31);
    objc_msgSend(v75, "setValue:forKey:", MEMORY[0x1E0C9AAB0], v32);
    v76 = objc_alloc_init(MEMORY[0x1E0CD2708]);
    v193 = v72;
    objc_msgSend(v72, "frame");
    objc_msgSend(v76, "setFrame:");
    v191 = v75;
    v207 = v75;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v207, 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setFilters:", v77);

    objc_msgSend(v76, "setCornerRadius:", 5.0);
    objc_msgSend(v76, "setMasksToBounds:", 1);
    objc_msgSend(v76, "setScale:", 0.5);
    -[CKEffectPickerView setSegmentedBackdrop:](v18, "setSegmentedBackdrop:", v76);
    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "layer");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "layer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = v76;
    objc_msgSend(v79, "insertSublayer:above:", v76, v80);

    v81 = objc_alloc(MEMORY[0x1E0CEA7E8]);
    v82 = *MEMORY[0x1E0C9D648];
    v83 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v84 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v85 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v86 = (void *)objc_msgSend(v81, "initWithFrame:", *MEMORY[0x1E0C9D648], v83, v84, v85);
    objc_msgSend(v86, "addTarget:action:forControlEvents:", v18, sel_pageControlChanged_, 4096);
    objc_msgSend(v86, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CKEffectPickerView momentIdentifiers](v18, "momentIdentifiers");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setNumberOfPages:", objc_msgSend(v87, "count"));

    objc_msgSend(v86, "setCurrentPage:", 0);
    objc_msgSend(v86, "sizeToFit");
    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "addSubview:", v86);

    v187 = v86;
    -[CKEffectPickerView setPageControl:](v18, "setPageControl:", v86);
    v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v82, v83, v84, v85);
    CKFrameworkBundle();
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setText:", v91);

    objc_msgSend(v89, "setTextAlignment:", 1);
    +[CKUIBehavior fontWithStyle:adjustedForMaxSizeCategory:](CKUIBehavior, "fontWithStyle:adjustedForMaxSizeCategory:", *MEMORY[0x1E0CEB5B8], *MEMORY[0x1E0CEB3E0]);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setFont:", v92);

    objc_msgSend(v89, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v89, "sizeToFit");
    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "addSubview:", v89);

    v186 = v89;
    -[CKEffectPickerView setMainLabel:](v18, "setMainLabel:", v89);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "theme");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "sendButtonColorForColorType:", v188);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setTintColor:", v97);

    objc_msgSend(v94, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v94, "setOpaque:", 0);
    -[CKEffectPickerView sendImage](v18, "sendImage");
    v98 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setImage:forState:", v98, 0);
    v185 = (void *)v98;
    objc_msgSend(v94, "setImage:forState:", v98, 4);
    objc_msgSend(v94, "setEnabled:", 1);
    objc_msgSend(v94, "addTarget:action:forControlEvents:", v18, sel__touchUpInsideSendMomentButton_, 64);
    objc_msgSend(v94, "accessibilitySetIdentification:", CFSTR("sendButton"));
    objc_msgSend(v94, "setExclusiveTouch:", 1);
    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "addSubview:", v94);

    -[CKEffectPickerView setSendMomentButton:](v18, "setSendMomentButton:", v94);
    v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v82, v83, v84, v85);
    +[CKUIBehavior fontWithStyle:adjustedForMaxSizeCategory:](CKUIBehavior, "fontWithStyle:adjustedForMaxSizeCategory:", *MEMORY[0x1E0CEB550], *MEMORY[0x1E0CEB3D0]);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setFont:", v101);

    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addSubview:", v100);

    v184 = v100;
    -[CKEffectPickerView setMomentTitleLabel:](v18, "setMomentTitleLabel:", v100);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 5, 3, 19.0);
    v104 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("xmark.circle.fill"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = (void *)v104;
    objc_msgSend(v105, "imageWithSymbolConfiguration:", v104);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "imageWithRenderingMode:", 2);
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v103, "setImage:forState:", v107, 0);
    objc_msgSend(v103, "setImage:forState:", v107, 1);
    objc_msgSend(v107, "size");
    v109 = v108 + -4.0;
    v181 = v107;
    objc_msgSend(v107, "size");
    objc_msgSend(v103, "setBounds:", 0.0, 0.0, v109, v110 + -4.0);
    objc_msgSend(v103, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v103, "addTarget:action:forControlEvents:", v18, sel__touchUpInsideCloseButton_, 64);
    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "addSubview:", v103);

    v183 = v103;
    -[CKEffectPickerView setCloseButton:](v18, "setCloseButton:", v103);
    CKBalloonViewForClass((objc_class *)objc_msgSend(v205, "balloonViewClass"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "configureForComposition:", v205);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v112, "setColor:", v188);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = objc_msgSend(v113, "isAccessibilityPreferredContentSizeCategory");

      if (v114)
        objc_msgSend(v112, "truncateForLargeText");
    }
    objc_msgSend(v112, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v112, "setCanUseOpaqueMask:", 0);
    objc_msgSend(v112, "setUserInteractionEnabled:", 0);
    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "addSubview:", v112);

    -[CKEffectPickerView setBalloonView:](v18, "setBalloonView:", v112);
    -[CKEffectPickerView _resizeBalloon](v18, "_resizeBalloon");
    v116 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v116, "layer");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setMasksToBounds:", 1);

    objc_msgSend(v116, "layer");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setCornerRadius:", 22.5);

    objc_msgSend(v116, "layer");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setAllowsGroupOpacity:", 0);

    objc_msgSend(v116, "layer");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setAllowsGroupBlending:", 0);

    objc_msgSend(v116, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v116, "setUserInteractionEnabled:", 1);
    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addSubview:", v116);

    -[CKEffectPickerView setRoundedContainerView:](v18, "setRoundedContainerView:", v116);
    v122 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v122, "layer");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setCompositingFilter:", v124);

    objc_msgSend(v116, "addSubview:", v122);
    objc_msgSend(v116, "bounds");
    objc_msgSend(v122, "setFrame:");
    objc_msgSend(v122, "setAutoresizingMask:", 18);
    v189 = v122;
    -[CKEffectPickerView setRoundedView:](v18, "setRoundedView:", v122);
    v125 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectPickerView closeButton](v18, "closeButton");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v126, 5, 0, v18, 5, 1.0, x);
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKEffectPickerView addConstraint:](v18, "addConstraint:", v127);
    v128 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectPickerView sendMomentButton](v18, "sendMomentButton");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView closeButton](v18, "closeButton");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v129, 9, 0, v130, 9, 1.0, 0.0);
    v131 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKEffectPickerView addConstraint:](v18, "addConstraint:", v131);
    v132 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectPickerView roundedContainerView](v18, "roundedContainerView");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView closeButton](v18, "closeButton");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v133, 9, 0, v134, 9, 1.0, 0.0);
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKEffectPickerView addConstraint:](v18, "addConstraint:", v135);
    v136 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectPickerView roundedContainerView](v18, "roundedContainerView");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v137, 7, 0, 0, 0, 1.0, 45.0);
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKEffectPickerView addConstraint:](v18, "addConstraint:", v138);
    v139 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectPickerView typeSegmentedControl](v18, "typeSegmentedControl");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v140, 3, 0, v18, 3, 1.0, 70.0);
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v141, "setIdentifier:", CFSTR("typeSegmentedControlBottom"));
    -[CKEffectPickerView setTypeSegmentedControlBottomConstraint:](v18, "setTypeSegmentedControlBottomConstraint:", v141);
    -[CKEffectPickerView addConstraint:](v18, "addConstraint:", v141);
    v142 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectPickerView typeSegmentedControl](v18, "typeSegmentedControl");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v143, 9, 0, v18, 9, 1.0, 0.0);
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKEffectPickerView addConstraint:](v18, "addConstraint:", v144);
    v145 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectPickerView mainLabel](v18, "mainLabel");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v146, 11, 0, v18, 3, 1.0, 50.0);
    v147 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v147, "setIdentifier:", CFSTR("mainLabelBottom"));
    -[CKEffectPickerView setMainLabelBottomConstraint:](v18, "setMainLabelBottomConstraint:", v147);
    -[CKEffectPickerView addConstraint:](v18, "addConstraint:", v147);
    v148 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectPickerView mainLabel](v18, "mainLabel");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v149, 9, 0, v18, 9, 1.0, 0.0);
    v150 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKEffectPickerView addConstraint:](v18, "addConstraint:", v150);
    v151 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectPickerView mainLabel](v18, "mainLabel");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v152, 5, 1, v18, 5, 1.0, 20.0);
    v153 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKEffectPickerView addConstraint:](v18, "addConstraint:", v153);
    v154 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectPickerView mainLabel](v18, "mainLabel");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v155, 6, 1, v18, 6, 1.0, -20.0);
    v156 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKEffectPickerView addConstraint:](v18, "addConstraint:", v156);
    if (-[CKEffectPickerView _keyboardIsOnTopOfEffectPickerWindow](v18, "_keyboardIsOnTopOfEffectPickerWindow")
      && UIKeyboardAutomaticIsOnScreen())
    {
      v157 = (void *)MEMORY[0x1E0CB3718];
      -[CKEffectPickerView pageControl](v18, "pageControl");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerView closeButton](v18, "closeButton");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = 1.0;
      v161 = 0.0;
      v162 = v157;
      v163 = v158;
      v164 = 10;
      v165 = v159;
      v166 = 10;
    }
    else
    {
      v167 = (void *)MEMORY[0x1E0CB3718];
      -[CKEffectPickerView pageControl](v18, "pageControl");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerView peekContainer](v18, "peekContainer");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = 1.0;
      v161 = -20.0;
      v162 = v167;
      v163 = v158;
      v164 = 4;
      v165 = v159;
      v166 = 4;
    }
    objc_msgSend(v162, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v163, v164, 0, v165, v166, v160, v161);
    v168 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v168, "setIdentifier:", CFSTR("pageControlBottom"));
    -[CKEffectPickerView addConstraint:](v18, "addConstraint:", v168);
    v169 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectPickerView pageControl](v18, "pageControl");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView peekContainer](v18, "peekContainer");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v170, 7, 0, v171, 7, 1.0, 0.0);
    v172 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKEffectPickerView addConstraint:](v18, "addConstraint:", v172);
    -[CKEffectPickerView activateTextSizeDependentConstraintsForSendButtonFrame:](v18, "activateTextSizeDependentConstraintsForSendButtonFrame:", x, v10, width, height);
    v173 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", v18, sel__panGesture_);
    -[CKEffectPickerView addGestureRecognizer:](v18, "addGestureRecognizer:", v173);
    -[CKEffectPickerView setPanGestureRecognizer:](v18, "setPanGestureRecognizer:", v173);
    -[CKEffectPickerView _updateBalloonViewPositionAnimated:](v18, "_updateBalloonViewPositionAnimated:", 0);
    -[CKEffectPickerView updateMomentTitle:](v18, "updateMomentTitle:", 0);
    -[CKEffectPickerView effectTypeDidChange:](v18, "effectTypeDidChange:", v193);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView setAnimatedCells:](v18, "setAnimatedCells:", v174);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView setPausedAnimatedCells:](v18, "setPausedAnimatedCells:", v175);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "addObserver:selector:name:object:", v18, sel__applicationDidEnterBackground, *MEMORY[0x1E0CEB288], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "addObserver:selector:name:object:", v18, sel__applicationWillEnterForeground, *MEMORY[0x1E0CEB350], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "addObserver:selector:name:object:", v18, sel__accessibilityContrastStatusDidChange, *MEMORY[0x1E0CEB098], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "addObserver:selector:name:object:", v18, sel__accessibilityContrastStatusDidChange, *MEMORY[0x1E0CEAFF0], 0);

    -[CKEffectPickerView _accessibilityContrastStatusDidChange](v18, "_accessibilityContrastStatusDidChange");
    -[CKEffectPickerView updateViewColors](v18, "updateViewColors");

    v17 = v205;
  }

  return v18;
}

- (void)updateViewColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[CKEffectPickerView momentIdentifiers](self, "momentIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView pageControl](self, "pageControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "currentPage"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerView fsem](self, "fsem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectForIdentifier:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerView typeSegmentedControl](self, "typeSegmentedControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "selectedSegmentIndex") == 1)
    v8 = objc_msgSend(v6, "effectIsDark");
  else
    v8 = 0;

  -[CKEffectPickerView updateViewColors:](self, "updateViewColors:", v8);
}

- (void)updateViewColors:(BOOL)a3
{
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
  uint64_t v15;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
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
  _BOOL4 v71;
  void *v72;
  void *v73;
  void *v74;
  CKEffectPickerView *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  -[CKEffectPickerView typeSegmentedControl](self, "typeSegmentedControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3)
    objc_msgSend(v7, "fsmPickerPrimaryTintColorDarkEffect");
  else
    objc_msgSend(v7, "fsmPickerPrimaryTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v9);

  -[CKEffectPickerView segmentedBackdrop](self, "segmentedBackdrop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "theme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a3)
  {
    objc_msgSend(v12, "fsmPickerSecondaryColorDarkEffect");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "cgColor");
  }
  else
  {
    objc_msgSend(v12, "fsmPickerSecondaryColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "CGColor");
  }
  objc_msgSend(v10, "setBackgroundColor:", v15);

  -[CKEffectPickerView pageControl](self, "pageControl");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "theme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a3)
    objc_msgSend(v18, "fsmPickerPageIndicatorColorDarkEffect");
  else
    objc_msgSend(v18, "fsmPickerPageIndicatorColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPageIndicatorTintColor:", v20);

  -[CKEffectPickerView pageControl](self, "pageControl");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "theme");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (a3)
    objc_msgSend(v23, "fsmPickerCurrentPageIndicatorColorDarkEffect");
  else
    objc_msgSend(v23, "fsmPickerCurrentPageIndicatorColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCurrentPageIndicatorTintColor:", v25);

  -[CKEffectPickerView mainLabel](self, "mainLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "theme");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (a3)
    objc_msgSend(v28, "fsmPickerPrimaryColorDarkEffect");
  else
    objc_msgSend(v28, "fsmPickerPrimaryColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTextColor:", v30);

  -[CKEffectPickerView momentTitleLabel](self, "momentTitleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "theme");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (a3)
    objc_msgSend(v33, "fsmPickerPrimaryColorDarkEffect");
  else
    objc_msgSend(v33, "fsmPickerPrimaryColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTextColor:", v35);

  -[CKEffectPickerView closeButton](self, "closeButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "theme");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (a3)
    objc_msgSend(v38, "fsmPickerCloseButtonColorDarkEffect");
  else
    objc_msgSend(v38, "fsmPickerCloseButtonColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTintColor:", v40);

  -[CKEffectPickerView accessibilityCloseBackgroundView](self, "accessibilityCloseBackgroundView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "theme");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (a3)
    objc_msgSend(v43, "fsmPickerSecondaryColorDarkEffect");
  else
    objc_msgSend(v43, "fsmPickerSecondaryColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setBackgroundColor:", v45);

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v75 = self;
  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v81 != v49)
          objc_enumerationMutation(v46);
        v51 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "theme");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (a3)
          objc_msgSend(v53, "fsmPickerPrimaryColorDarkEffect");
        else
          objc_msgSend(v53, "fsmPickerPrimaryColor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setTextColor:", v55);

      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
    }
    while (v48);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  -[CKEffectPickerView effectDescriptiveLabels](v75, "effectDescriptiveLabels");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v58; ++j)
      {
        if (*(_QWORD *)v77 != v59)
          objc_enumerationMutation(v56);
        v61 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "theme");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v63;
        if (a3)
          objc_msgSend(v63, "fsmPickerPrimaryColorDarkEffect");
        else
          objc_msgSend(v63, "fsmPickerPrimaryColor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setTextColor:", v65);

      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
    }
    while (v58);
  }

  -[CKEffectPickerView roundedView](v75, "roundedView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "theme");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "fsmPickerRoundedViewColor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setBackgroundColor:", v69);

  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    -[CKEffectPickerView backgroundView](v75, "backgroundView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v71 = UIAccessibilityDarkerSystemColorsEnabled();
    -[CKEffectPickerView backgroundView](v75, "backgroundView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v71)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "theme");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "fsmPickerBackgroundViewColor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setBackgroundColor:", v74);

      goto LABEL_50;
    }
  }
  objc_msgSend(v70, "setBackgroundColor:", 0);
LABEL_50:

}

- (void)safeAreaInsetsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  double v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[CKEffectPickerView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CKEffectPickerView constraints](self, "constraints", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    v11 = v4 + 70.0;
    v12 = v4 + 50.0;
    v13 = -20.0 - v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("pageControlBottom"));

        v18 = v13;
        if ((v17 & 1) != 0)
          goto LABEL_9;
        objc_msgSend(v15, "identifier", v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("mainLabelBottom"));

        v18 = v12;
        if ((v20 & 1) == 0)
        {
          objc_msgSend(v15, "identifier", v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("typeSegmentedControlBottom"));

          v18 = v11;
          if (!v22)
            continue;
        }
LABEL_9:
        objc_msgSend(v15, "setConstant:", v18);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v18);
    }
    while (v9);
  }

}

- (int64_t)selectedMomentIndex
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  int64_t v8;

  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  *(float *)&v7 = v7 / v5;
  v8 = llroundf(*(float *)&v7);

  return v8;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = -[CKEffectPickerView selectedMomentIndex](self, "selectedMomentIndex", a3);
  -[CKEffectPickerView pageControl](self, "pageControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentPage");

  if (v6 != v4)
  {
    -[CKEffectPickerView pageControl](self, "pageControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCurrentPage:", v4);

    -[CKEffectPickerView updateMomentTitle:](self, "updateMomentTitle:", 0);
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  -[CKEffectPickerView updateMomentTitle:](self, "updateMomentTitle:", 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  _OWORD v19[8];

  -[CKEffectPickerView setDelegate:](self, "setDelegate:", 0);
  -[CKEffectPickerView balloonView](self, "balloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v19[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v19[5] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v19[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v19[7] = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v19[0] = *MEMORY[0x1E0CD2610];
  v19[1] = v7;
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v19[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v19[3] = v8;
  objc_msgSend(v4, "setTransform:", v19);

  -[CKEffectPickerView balloonView](self, "balloonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_removeAllAnimations:", 1);

  -[CKEffectPickerView balloonView](self, "balloonView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", 1);

  -[CKEffectPickerView balloonView](self, "balloonView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isAccessibilityPreferredContentSizeCategory");

  if (v13)
  {
    -[CKEffectPickerView balloonView](self, "balloonView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "restoreFromLargeTextTruncation");
LABEL_4:

  }
  -[CKEffectPickerView balloonView](self, "balloonView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CKBalloonViewReuse(v14);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB350], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB098], 0);

  v18.receiver = self;
  v18.super_class = (Class)CKEffectPickerView;
  -[CKEffectPickerView dealloc](&v18, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  objc_super v55;

  v55.receiver = self;
  v55.super_class = (Class)CKEffectPickerView;
  -[CKEffectPickerView layoutSubviews](&v55, sel_layoutSubviews);
  -[CKEffectPickerView _updateBalloonViewPositionAnimated:](self, "_updateBalloonViewPositionAnimated:", 0);
  -[CKEffectPickerView backdrop](self, "backdrop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  if (UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityDarkerSystemColorsEnabled())
  {
    -[CKEffectPickerView accessibilityBackdropView](self, "accessibilityBackdropView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView bounds](self, "bounds");
    objc_msgSend(v5, "setFrame:");

    -[CKEffectPickerView sendMomentButton](self, "sendMomentButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[CKEffectPickerView accessibilitySendBackgroundView](self, "accessibilitySendBackgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v8 + 2.0, v10 + 2.0, v12 + -4.0, v14 + -4.0);

    -[CKEffectPickerView closeButton](self, "closeButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    -[CKEffectPickerView accessibilityCloseBackgroundView](self, "accessibilityCloseBackgroundView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v18 + 2.0, v20 + 2.0, v22 + -4.0, v24 + -4.0);

    -[CKEffectPickerView accessibilitySendBackgroundView](self, "accessibilitySendBackgroundView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView accessibilitySendBackgroundView](self, "accessibilitySendBackgroundView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    objc_msgSend(v27, "setCornerRadius:", v29 * 0.5);

    -[CKEffectPickerView accessibilityCloseBackgroundView](self, "accessibilityCloseBackgroundView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView accessibilityCloseBackgroundView](self, "accessibilityCloseBackgroundView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    objc_msgSend(v31, "setCornerRadius:", v33 * 0.5);

    -[CKEffectPickerView typeSegmentedControl](self, "typeSegmentedControl");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "selectedSegmentIndex");

    if (!v35)
    {
      -[CKEffectPickerView accessibilitySendBackgroundView](self, "accessibilitySendBackgroundView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setHidden:", 1);

    }
  }
  -[CKEffectPickerView segmentedBackdrop](self, "segmentedBackdrop");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView bounds](self, "bounds");
  v39 = v38 * 0.5;
  -[CKEffectPickerView segmentedBackdrop](self, "segmentedBackdrop");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bounds");
  v42 = v39 - v41 * 0.5;
  -[CKEffectPickerView typeSegmentedControlBottomConstraint](self, "typeSegmentedControlBottomConstraint");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constant");
  v45 = v44;
  -[CKEffectPickerView segmentedBackdrop](self, "segmentedBackdrop");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bounds");
  v48 = v47;
  -[CKEffectPickerView segmentedBackdrop](self, "segmentedBackdrop");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bounds");
  objc_msgSend(v37, "setFrame:", v42, v45, v48);

  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "collectionViewLayout");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bounds");
  v53 = v52;
  objc_msgSend(v50, "bounds");
  objc_msgSend(v51, "setItemSize:", v53, v54);

}

- (void)updateHintTransition:(double)a3
{
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  CGFloat v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CATransform3D v51;
  CATransform3D v52;
  CATransform3D v53;

  if (!-[CKEffectPickerView isAnimating](self, "isAnimating"))
  {
    -[CKEffectPickerView hintBlackText](self, "hintBlackText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 < 1.0 && v5 == 0)
    {
      -[CKEffectPickerView _resizeBalloon](self, "_resizeBalloon");
      -[CKEffectPickerView _updateBalloonViewPositionAnimated:](self, "_updateBalloonViewPositionAnimated:", 0);
      -[CKEffectPickerView balloonView](self, "balloonView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerView balloonViewOrigin](self, "balloonViewOrigin");
      v12 = v11 + 1.0;
      -[CKEffectPickerView balloonView](self, "balloonView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "origin");
      objc_msgSend(v10, "setOrigin:", v12, v14 + 3.0);

      -[CKEffectPickerView _blackTextReplica](self, "_blackTextReplica");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        -[CKEffectPickerView balloonView](self, "balloonView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[CKEffectPickerView balloonViewOrigin](self, "balloonViewOrigin");
      objc_msgSend(v15, "setOrigin:");
      -[CKEffectPickerView hintContainer](self, "hintContainer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", v15);

      -[CKEffectPickerView setHintBlackText:](self, "setHintBlackText:", v15);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "theme");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sendButtonColorForColorType:", -[CKEffectPickerView controlColor](self, "controlColor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerView sendImage](self, "sendImage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setImage:forState:", v21, 0);
      objc_msgSend(v20, "setImage:forState:", v21, 4);
      objc_msgSend(v20, "setOpaque:", 0);
      -[CKEffectPickerView closeButton](self, "closeButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "frame");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;

      objc_msgSend(v20, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v28, v30);
      objc_msgSend(v20, "setTintColor:", v19);
      objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
      objc_msgSend(v20, "setOrigin:", v24, v26);
      -[CKEffectPickerView hintContainer](self, "hintContainer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addSubview:", v20);

      -[CKEffectPickerView setHintSendButton:](self, "setHintSendButton:", v20);
    }
    else
    {
      -[CKEffectPickerView hintBlackText](self, "hintBlackText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3 == 1.0 && v7)
      {
        -[CKEffectPickerView hintBlackText](self, "hintBlackText");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        -[CKEffectPickerView setHintBlackText:](self, "setHintBlackText:", 0);
        -[CKEffectPickerView hintSendButton](self, "hintSendButton");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromSuperview");

        -[CKEffectPickerView setHintSendButton:](self, "setHintSendButton:", 0);
      }
    }
    -[CKEffectPickerView backdrop](self, "backdrop");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = fmin(a3, 0.6);
    v34 = v33 * 64.0;
    if (v33 * 64.0 < 3.0)
      v34 = 3.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setValue:forKeyPath:", v35, CFSTR("filters.gaussianBlur.inputRadius"));

    -[CKEffectPickerView blueContrastLayer](self, "blueContrastLayer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setValue:forKey:", v37, CFSTR("opacity"));

    v38 = a3 * 0.15 + 1.0;
    -[CKEffectPickerView balloonView](self, "balloonView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v52.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v49 = *(_OWORD *)&v52.m31;
    *(_OWORD *)&v52.m33 = v50;
    v48 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v52.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v47 = *(_OWORD *)&v52.m41;
    *(_OWORD *)&v52.m43 = v48;
    v46 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v52.m11 = *MEMORY[0x1E0CD2610];
    v45 = *(_OWORD *)&v52.m11;
    *(_OWORD *)&v52.m13 = v46;
    v44 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v52.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v43 = *(_OWORD *)&v52.m21;
    *(_OWORD *)&v52.m23 = v44;
    CATransform3DScale(&v53, &v52, v38, v38, 1.0);
    objc_msgSend(v40, "setTransform:", &v53);

    -[CKEffectPickerView hintBlackText](self, "hintBlackText");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)&v52.m31 = v49;
    *(_OWORD *)&v52.m33 = v50;
    *(_OWORD *)&v52.m41 = v47;
    *(_OWORD *)&v52.m43 = v48;
    *(_OWORD *)&v52.m11 = v45;
    *(_OWORD *)&v52.m13 = v46;
    *(_OWORD *)&v52.m21 = v43;
    *(_OWORD *)&v52.m23 = v44;
    CATransform3DScale(&v51, &v52, v38, v38, 1.0);
    objc_msgSend(v42, "setTransform:", &v51);

  }
}

- (void)updateColor:(char)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  -[CKEffectPickerView setControlColor:](self, "setControlColor:");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendButtonColorForColorType:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CKEffectPickerView effectSendButtons](self, "effectSendButtons", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12++), "setTintColor:", v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  -[CKEffectPickerView hintSendButton](self, "hintSendButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v7);

  -[CKEffectPickerView sendMomentButton](self, "sendMomentButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTintColor:", v7);

  -[CKEffectPickerView balloonView](self, "balloonView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKEffectPickerView balloonView](self, "balloonView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setColor:", v3);

    -[CKEffectPickerView balloonView](self, "balloonView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "prepareForDisplayIfNeeded");

  }
}

- (void)setBalloonText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonTextColorForColorType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView _setBalloonText:withColor:](self, "_setBalloonText:withColor:", v4, v6);

}

- (UIFont)effectLabelFont
{
  UIFont *effectLabelFont;
  UIFont *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIFont *v15;
  UIFont *v16;

  effectLabelFont = self->_effectLabelFont;
  if (effectLabelFont)
  {
    v3 = effectLabelFont;
  }
  else
  {
    +[CKUIBehavior fontWithStyle:adjustedForMaxSizeCategory:](CKUIBehavior, "fontWithStyle:adjustedForMaxSizeCategory:", *MEMORY[0x1E0CEB550], *MEMORY[0x1E0CEB3C8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    v9 = *MEMORY[0x1E0DC13C0];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC13C0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1448]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DC1458]);

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v9);
    objc_msgSend(MEMORY[0x1E0DC1358], "fontDescriptorWithFontAttributes:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v5, "pointSize");
    objc_msgSend(v14, "fontWithDescriptor:size:", v13);
    v15 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v16 = self->_effectLabelFont;
    self->_effectLabelFont = v15;

    v3 = self->_effectLabelFont;
  }
  return v3;
}

- (id)sendImage
{
  void *v2;
  void *v3;

  +[CKEntryViewButton entryViewButtonImageForType:color:](CKEntryViewButton, "entryViewButtonImageForType:color:", 4, -[CKEffectPickerView controlColor](self, "controlColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_imageThatSuppressesAccessibilityHairlineThickening");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addEffect:(id)a3 withDescriptiveText:(id)a4 withIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
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
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  id *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  double v65;
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
  void *v79;
  void *v80;
  void *v81;
  id v82;
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
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  _QWORD v113[2];
  CGSize v114;
  CGSize v115;

  v113[1] = *MEMORY[0x1E0C80C00];
  v111 = a5;
  v8 = a4;
  v9 = a3;
  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CKEffectPickerView setEffectLabels:](self, "setEffectLabels:", v11);

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CKEffectPickerView setEffectDescriptiveLabels:](self, "setEffectDescriptiveLabels:", v12);

    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CKEffectPickerView setEffectDotButtons:](self, "setEffectDotButtons:", v13);

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CKEffectPickerView setEffectSendButtons:](self, "setEffectSendButtons:", v14);

    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CKEffectPickerView setEffectIdentifiers:](self, "setEffectIdentifiers:", v15);

    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKEffectPickerView setEffectDotConstraintsThatChange:](self, "setEffectDotConstraintsThatChange:", v16);

  }
  v17 = objc_alloc(MEMORY[0x1E0CEA700]);
  v18 = *MEMORY[0x1E0C9D648];
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v22 = (void *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], v19, v20, v21);
  objc_msgSend(v22, "setText:", v9);

  -[CKEffectPickerView effectLabelFont](self, "effectLabelFont");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFont:", v23);

  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v22, "sizeToFit");
  -[CKEffectPickerView peekContainer](self, "peekContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v22);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v18, v19, v20, v21);
  objc_msgSend(v25, "setText:", v8);

  -[CKEffectPickerView effectLabelFont](self, "effectLabelFont");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFont:", v26);

  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v25, "sizeToFit");
  objc_msgSend(v25, "setHidden:", 1);
  -[CKEffectPickerView peekContainer](self, "peekContainer");
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v27, "addSubview:", v25);

  LODWORD(v27) = UIAccessibilityIsReduceTransparencyEnabled();
  v28 = v27 | UIAccessibilityDarkerSystemColorsEnabled();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "theme");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "fsmPickerPrimaryColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v22;
  objc_msgSend(v22, "setTextColor:", v31);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "theme");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "fsmPickerPrimaryColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTextColor:", v34);

  if ((v28 & 1) == 0)
  {
    objc_msgSend(v22, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    setUpVibrancyForLayer(v35, 0, !-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"), -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

    objc_msgSend(v25, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    setUpVibrancyForLayer(v36, 0, !-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"), -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

  }
  v110 = v25;
  -[CKEffectPickerView sendImage](self, "sendImage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "size");
  UIGraphicsBeginImageContext(v114);
  objc_msgSend(v37, "size");
  UIGraphicsBeginImageContextWithOptions(v115, 0, 0.0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "theme");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v28)
    objc_msgSend(v39, "fsmPickerPrimaryColor");
  else
    objc_msgSend(v39, "fsmPickerDotColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "set");

  v42 = (void *)MEMORY[0x1E0CEA390];
  objc_msgSend(v37, "size");
  v44 = v43 * 0.5 + -4.5;
  objc_msgSend(v37, "size");
  objc_msgSend(v42, "bezierPathWithOvalInRect:", v44, v45 * 0.5 + -4.5, 9.0, 9.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "fill");

  UIGraphicsGetImageFromCurrentImageContext();
  v47 = objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  +[CKLargeHitButton buttonWithType:](CKLargeHitButton, "buttonWithType:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setCk_hitTestInsets:", -15.0, -15.0, -15.0, -15.0);
  objc_msgSend(v48, "setImage:forState:", v47, 0);
  v108 = (void *)v47;
  objc_msgSend(v48, "setImage:forState:", v47, 4);
  objc_msgSend(v48, "sizeToFit");
  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addSubview:", v48);

  objc_msgSend(v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v48, "addTarget:action:forControlEvents:", self, sel__touchUpInsideDotButton_, 64);
  if ((v28 & 1) == 0)
  {
    objc_msgSend(v48, "setOpaque:", 0);
    v50 = -[CKEffectPickerView isInDarkMode](self, "isInDarkMode");
    v51 = (id *)MEMORY[0x1E0CD2EA0];
    if (!v50)
      v51 = (id *)MEMORY[0x1E0CD2E98];
    v52 = *v51;
    objc_msgSend(v48, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "setCompositingFilter:", v54);
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "theme");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "sendButtonColorForColorType:", -[CKEffectPickerView controlColor](self, "controlColor"));
  v57 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setImage:forState:", v37, 0);
  v109 = v37;
  objc_msgSend(v58, "setImage:forState:", v37, 4);
  objc_msgSend(v58, "setOpaque:", 0);
  objc_msgSend(v58, "setBounds:", 0.0, 0.0, 52.0, 52.0);
  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addSubview:", v58);

  v107 = (void *)v57;
  objc_msgSend(v58, "setTintColor:", v57);
  objc_msgSend(v58, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v58, "addTarget:action:forControlEvents:", self, sel__touchUpInsideSendButton_, 64);
  objc_msgSend(v58, "setHidden:", 1);
  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "count");

  if (v62)
  {
    -[CKEffectPickerView effectDotButtons](self, "effectDotButtons");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "lastObject");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKEffectPickerView marginBetweenPickerDotButtons](self, "marginBetweenPickerDotButtons");
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v48, 10, 0, v64, 10, 1.0, -(v65 + 9.0));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addConstraint:", v66);

    objc_msgSend(v60, "addObject:", v66);
    -[CKEffectPickerView effectDotConstraintsThatChange](self, "effectDotConstraintsThatChange");
    v106 = v60;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView effectIdentifiers](self, "effectIdentifiers");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView effectLabels](self, "effectLabels");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "objectAtIndex:", objc_msgSend(v70, "count") - 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectForKey:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = v106;
    objc_msgSend(v72, "addObject:", v66);
  }
  else
  {
    -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v48, 4, 0, v64, 4, 1.0, -9.5);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addConstraint:", v66);
  }

  -[CKEffectPickerView effectDotConstraintsThatChange](self, "effectDotConstraintsThatChange");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v111;
  objc_msgSend(v73, "setObject:forKey:", v60, v111);

  v75 = (void *)MEMORY[0x1E0CB3718];
  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v48, 9, 0, v76, 9, 1.0, 0.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addConstraint:", v77);

  -[CKEffectPickerView lastEffectDotTopConstraint](self, "lastEffectDotTopConstraint");
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    v80 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectPickerView lastEffectDotTopConstraint](self, "lastEffectDotTopConstraint");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = v81;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 1);
    v82 = v60;
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "deactivateConstraints:", v83);

    v60 = v82;
    v74 = v111;

    -[CKEffectPickerView lastEffectDotTopConstraint](self, "lastEffectDotTopConstraint");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView removeConstraint:](self, "removeConstraint:", v84);

  }
  v85 = (void *)MEMORY[0x1E0CB3718];
  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v48, 3, 0, v86, 3, 1.0, 9.5);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addConstraint:", v87);

  -[CKEffectPickerView setLastEffectDotTopConstraint:](self, "setLastEffectDotTopConstraint:", v87);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v58, 9, 0, v48, 9, 1.0, 0.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v58, 10, 0, v48, 10, 1.0, 0.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "addConstraint:", v89);

  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addConstraint:", v90);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v48, 10, 0, v112, 10, 1.0, 0.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)MEMORY[0x1E0CB3718];
  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v95, 5, 0, v112, 6, 1.0, 22.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerView addConstraint:](self, "addConstraint:", v93);
  -[CKEffectPickerView addConstraint:](self, "addConstraint:", v96);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v112, 6, 0, v110, 6, 1.0, 0.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v112, 10, 0, v110, 10, 1.0, 0.0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView addConstraint:](self, "addConstraint:", v97);
  -[CKEffectPickerView addConstraint:](self, "addConstraint:", v98);

  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "addObject:", v112);

  -[CKEffectPickerView effectDescriptiveLabels](self, "effectDescriptiveLabels");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "addObject:", v110);

  -[CKEffectPickerView effectSendButtons](self, "effectSendButtons");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "addObject:", v58);

  -[CKEffectPickerView effectDotButtons](self, "effectDotButtons");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "addObject:", v48);

  -[CKEffectPickerView effectIdentifiers](self, "effectIdentifiers");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "addObject:", v74);

  -[CKEffectPickerView _updateRoundedContainerView](self, "_updateRoundedContainerView");
  -[CKEffectPickerView peekContainer](self, "peekContainer");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView balloonView](self, "balloonView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "addSubview:", v105);

}

- (void)_resizeBalloon
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView frame](self, "frame");
  v5 = v4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "senderTranscriptInsets");
  objc_msgSend(v3, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:", 1, 0, 0, 0, v5, v7, v8, v9, v10);
  v12 = v11;

  -[CKEffectPickerView balloonView](self, "balloonView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prepareForDisplay");

  -[CKEffectPickerView balloonView](self, "balloonView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsLayout");

  -[CKEffectPickerView balloonView](self, "balloonView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNeedsDisplay");

  -[CKEffectPickerView balloonView](self, "balloonView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutIfNeeded");

  -[CKEffectPickerView balloonView](self, "balloonView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeThatFits:", v12, 1.79769313e308);
  v19 = v18;
  v21 = v20;

  -[CKEffectPickerView balloonView](self, "balloonView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v19, v21);

}

- (void)_setBalloonText:(id)a3 withColor:(id)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[CKEffectPickerView balloonView](self, "balloonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v12);
    v10 = objc_msgSend(v9, "length");
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v6, 0, v10);
    -[CKEffectPickerView balloonView](self, "balloonView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributedText:", v9);

    -[CKEffectPickerView _resizeBalloon](self, "_resizeBalloon");
  }

}

- (void)_adjustMainLabelAndTypeSegmentedControlIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGRect v8;

  -[CKEffectPickerView _setNeedsSwitcherAnimationIfNecessary](self, "_setNeedsSwitcherAnimationIfNecessary");
  if (-[CKEffectPickerView needsSwitcherAnimation](self, "needsSwitcherAnimation"))
  {
    -[CKEffectPickerView mainLabelBottomConstraint](self, "mainLabelBottomConstraint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setConstant:", 40.0);

    -[CKEffectPickerView typeSegmentedControlBottomConstraint](self, "typeSegmentedControlBottomConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView mainLabel](self, "mainLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v4, "setConstant:", CGRectGetHeight(v8) + 40.0);

    -[CKEffectPickerView typeSegmentedControl](self, "typeSegmentedControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    -[CKEffectPickerView segmentedBackdrop](self, "segmentedBackdrop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    -[CKEffectPickerView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)_updateBalloonViewPositionAnimated:(BOOL)a3
{
  _BOOL4 v3;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
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
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
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
  id v66;
  _QWORD v67[9];
  CGRect v68;
  CGRect v69;

  v3 = a3;
  if (-[CKEffectPickerView isAnimating](self, "isAnimating"))
    return;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[CKEffectPickerView typeSegmentedControl](self, "typeSegmentedControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "selectedSegmentIndex");

  if (v10 == 1)
  {
    -[CKEffectPickerView effectSendButtons](self, "effectSendButtons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "convertRect:toView:", self, v14, v16, v18, v20);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
LABEL_6:

    goto LABEL_7;
  }
  v29 = v8;
  v27 = v7;
  v25 = v6;
  v23 = v5;
  if (-[CKEffectPickerView selectedIndex](self, "selectedIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CKEffectPickerView effectSendButtons](self, "effectSendButtons");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndex:", -[CKEffectPickerView selectedIndex](self, "selectedIndex"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "frame");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "convertRect:toView:", self, v32, v34, v36, v38);
    v23 = v40;
    v25 = v41;
    v27 = v42;
    v29 = v43;

    goto LABEL_6;
  }
LABEL_7:
  v68.origin.x = v5;
  v68.origin.y = v6;
  v68.size.width = v7;
  v68.size.height = v8;
  v69.origin.x = v23;
  v69.origin.y = v25;
  v69.size.width = v27;
  v69.size.height = v29;
  if (CGRectEqualToRect(v68, v69))
  {
    -[CKEffectPickerView closeButton](self, "closeButton");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "frame");
    v23 = v45;
    v25 = v46;
    v27 = v47;
    v29 = v48;

  }
  -[CKEffectPickerView balloonView](self, "balloonView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "frame");
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;

  -[CKEffectPickerView _updateBalloonViewOrigin:forButtonFrame:](self, "_updateBalloonViewOrigin:forButtonFrame:", v51, v53, v55, v57, v23, v25, v27, v29);
  v62 = v58;
  v63 = v59;
  v64 = v60;
  v65 = v61;
  if (v3)
  {
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __57__CKEffectPickerView__updateBalloonViewPositionAnimated___block_invoke;
    v67[3] = &unk_1E274B8B8;
    v67[4] = self;
    *(double *)&v67[5] = v58;
    *(double *)&v67[6] = v59;
    *(double *)&v67[7] = v60;
    *(double *)&v67[8] = v61;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v67, 0.3);
  }
  else
  {
    -[CKEffectPickerView balloonView](self, "balloonView");
    v66 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setFrame:", v62, v63, v64, v65);

  }
}

void __57__CKEffectPickerView__updateBalloonViewPositionAnimated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "balloonView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (CGRect)_updateBalloonViewOrigin:(CGRect)a3 forButtonFrame:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_updateMomentsBackgroundColor
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  _BOOL8 v46;
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
  double v66;
  double v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  v8 = v7 / v5;

  v9 = v8;
  v10 = vcvtms_s32_f32(v9);
  v11 = vcvtps_s32_f32(v9);
  v12 = (double)v10;
  if (v10 < 0)
  {
    v16 = 0;
  }
  else
  {
    -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForItemAtIndexPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "effect");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17 = v8 - v12;
  -[CKEffectPickerView momentIdentifiers](self, "momentIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19 <= v11)
  {
    v23 = 0;
  }
  else
  {
    -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cellForItemAtIndexPath:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "effect");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  if (v17 > 0.5)
    v24 = v23;
  else
    v24 = v16;
  objc_msgSend(v24, "messageFilters");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (v26)
  {
    v64 = v23;
    v27 = v16;
    v28 = *(_QWORD *)v69;
    while (2)
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v30, "type") == 6)
        {
          -[CKEffectPickerView balloonView](self, "balloonView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v26 = v30;
            goto LABEL_21;
          }
        }
      }
      v26 = (id)objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      if (v26)
        continue;
      break;
    }
LABEL_21:
    v16 = v27;
    v23 = v64;
  }

  -[CKEffectPickerView balloonView](self, "balloonView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "filters");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v34, "count"))
  {

    goto LABEL_26;
  }
  -[CKEffectPickerView balloonView](self, "balloonView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "filters");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "containsObject:", v26);

  if ((v37 & 1) == 0)
  {
    -[CKEffectPickerView balloonView](self, "balloonView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "clearFilters");
LABEL_26:

  }
  if (v26)
  {
    -[CKEffectPickerView balloonView](self, "balloonView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "filters");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "containsObject:", v26);

    if ((v40 & 1) == 0)
    {
      -[CKEffectPickerView balloonView](self, "balloonView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addFilter:", v26);

    }
  }
  objc_msgSend(v16, "backgroundColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "backgroundColor");
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v43;
  if (v42)
  {
    if (v43)
      goto LABEL_32;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
      goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
  objc_msgSend(v42, "colorByBlendingWithColor:withFraction:", v44, v17);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0.0;
  v67 = 0.0;
  objc_msgSend(v45, "getHue:saturation:brightness:alpha:", 0, 0, &v67, &v66);
  v46 = v66 > 0.5 && v67 < 0.5;
  -[CKEffectPickerView setUsesDarkVibrancyForLayers:](self, "setUsesDarkVibrancyForLayers:", v46, v66);
  if (!UIAccessibilityIsReduceTransparencyEnabled() && !UIAccessibilityDarkerSystemColorsEnabled())
  {
    v65 = v16;
    -[CKEffectPickerView closeButton](self, "closeButton");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    setUpVibrancyForLayer(v48, v46, !-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"), -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

    -[CKEffectPickerView momentTitleLabel](self, "momentTitleLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    setUpVibrancyForLayer(v50, v46, !-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"), -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

    -[CKEffectPickerView pageControl](self, "pageControl");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "layer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    setUpVibrancyForLayer(v52, v46, 0, -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

    -[CKEffectPickerView mainLabel](self, "mainLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "layer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    setUpVibrancyForLayer(v54, v46, !-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"), -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

    -[CKEffectPickerView typeSegmentedControl](self, "typeSegmentedControl");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "layer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    setUpVibrancyForLayer(v56, v46, !-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"), -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

    -[CKEffectPickerView pageControl](self, "pageControl");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setCurrentPageIndicatorTintColor:", v58);
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "theme");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "fsmPickerCurrentPageIndicatorColor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setCurrentPageIndicatorTintColor:", v60);

    }
    v16 = v65;
  }
  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setBackgroundColor:", v45);

  -[CKEffectPickerView backdrop](self, "backdrop");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setEnabled:", 0);

  -[CKEffectPickerView backdrop](self, "backdrop");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setEnabled:", 1);

}

- (id)_blackTextReplica
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CKEffectPickerView _resizeBalloon](self, "_resizeBalloon");
  -[CKEffectPickerView balloonView](self, "balloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v3, "frame");
  v5 = (void *)objc_msgSend(v4, "initWithFrame:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v3, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v7 == (id)++v9)
        {
          v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v7 = v10;

      if (!v7)
        goto LABEL_12;
      +[CKBalloonTextView makeTextView](CKBalloonTextView, "makeTextView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend(v7, "attributedText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v13, "initWithAttributedString:", v14);

      v15 = objc_msgSend(v6, "length");
      v16 = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAttribute:value:range:", v16, v17, 0, v15);

      objc_msgSend(v11, "setAttributedText:", v6);
      objc_msgSend(v7, "frame");
      objc_msgSend(v11, "setFrame:");
      objc_msgSend(v5, "addSubview:", v11);
    }
    else
    {
LABEL_10:
      v11 = v5;
      v5 = 0;
    }
    v12 = v5;

    v5 = v11;
  }
  else
  {
    v7 = 0;
LABEL_12:
    v12 = 0;
  }

  return v12;
}

- (BOOL)_keyboardIsOnTopOfEffectPickerWindow
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_animateIn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CKTransientReplicaButtonContainer *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  CKTransientReplicaButtonContainer *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  double v61;
  void *v62;
  CKTransientReplicaButtonContainer *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidY;
  void *v100;
  void *v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  double v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  uint64_t v111;
  uint64_t j;
  void *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  id v118;
  void *v119;
  void *v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  double v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  void *v131;
  double v132;
  double v133;
  double v134;
  double v135;
  id v136;
  void *v137;
  void *v138;
  void *v139;
  double v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  double v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
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
  __int128 v162;
  __int128 v163;
  void *v164;
  __int128 v165;
  CKEffectPickerView *v166;
  __int128 v167;
  void *v168;
  __int128 v169;
  id v170;
  __int128 v171;
  uint64_t v172;
  __int128 v173;
  void *v174;
  __int128 v175;
  uint64_t v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _QWORD v181[5];
  CKTransientReplicaButtonContainer *v182;
  id v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  CATransform3D v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  _BYTE v197[128];
  _BYTE v198[128];
  uint64_t v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;

  v199 = *MEMORY[0x1E0C80C00];
  -[CKEffectPickerView balloonView](self, "balloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v193 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v173 = v193;
  v194 = v175;
  v171 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v195 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v169 = v195;
  v196 = v171;
  v167 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v189 = *MEMORY[0x1E0CD2610];
  v165 = v189;
  v190 = v167;
  v163 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v191 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v162 = v191;
  v192 = v163;
  objc_msgSend(v4, "setTransform:", &v189);

  -[CKEffectPickerView hintBlackText](self, "hintBlackText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = v173;
  v194 = v175;
  v195 = v169;
  v196 = v171;
  v189 = v165;
  v190 = v167;
  v191 = v162;
  v192 = v163;
  objc_msgSend(v6, "setTransform:", &v189);

  -[CKEffectPickerView hintBlackText](self, "hintBlackText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[CKEffectPickerView setHintBlackText:](self, "setHintBlackText:", 0);
  -[CKEffectPickerView hintSendButton](self, "hintSendButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[CKEffectPickerView setHintSendButton:](self, "setHintSendButton:", 0);
  v9 = [CKTransientReplicaButtonContainer alloc];
  -[CKEffectPickerView closeButton](self, "closeButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[CKEffectPickerView isInDarkMode](self, "isInDarkMode");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "theme");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fsmPickerCloseButtonColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[CKTransientReplicaButtonContainer initWithFrame:hasDarkVibrancy:isInDarkMode:color:sendColor:](v9, "initWithFrame:hasDarkVibrancy:isInDarkMode:color:sendColor:", 0, v19, v22, -[CKEffectPickerView controlColor](self, "controlColor"), v12, v14, v16, v18);

  -[CKEffectPickerView peekContainer](self, "peekContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v23);

  -[CKEffectPickerView closeButton](self, "closeButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", 1);

  -[CKTransientReplicaButtonContainer cancelButtonCircle](v23, "cancelButtonCircle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = 0;
  objc_msgSend(v27, "setOpacity:", v28);

  -[CKTransientReplicaButtonContainer cancelButtonGlyphLayer](v23, "cancelButtonGlyphLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v188, 0.0, 0.0, 1.0);
  objc_msgSend(v29, "setTransform:", &v188);

  -[CKEffectPickerView peekContainer](self, "peekContainer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView balloonView](self, "balloonView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v31);

  -[CKEffectPickerView _resizeBalloon](self, "_resizeBalloon");
  -[CKEffectPickerView _updateBalloonViewPositionAnimated:](self, "_updateBalloonViewPositionAnimated:", 0);
  -[CKEffectPickerView balloonView](self, "balloonView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  v34 = v33;
  objc_msgSend(v32, "frame");
  v36 = v35;
  objc_msgSend(v32, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "anchorPoint");
  v39 = v34 + v36 * v38;

  objc_msgSend(v32, "frame");
  v41 = v40;
  objc_msgSend(v32, "frame");
  v43 = v42;
  objc_msgSend(v32, "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "anchorPoint");
  v46 = v41 + v43 * v45;

  -[CKEffectPickerView balloonViewOrigin](self, "balloonViewOrigin");
  objc_msgSend(v32, "setOrigin:");
  -[CKEffectPickerView _blackTextReplica](self, "_blackTextReplica");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView balloonViewOrigin](self, "balloonViewOrigin");
  objc_msgSend(v47, "setOrigin:");
  -[CKEffectPickerView peekContainer](self, "peekContainer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addSubview:", v47);

  -[CKEffectPickerView balloonView](self, "balloonView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v51) = 0;
  objc_msgSend(v50, "setOpacity:", v51);

  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v54) = 0;
  objc_msgSend(v53, "setOpacity:", v54);

  v186 = 0u;
  v187 = 0u;
  v184 = 0u;
  v185 = 0u;
  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v184, v198, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v185;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v185 != v58)
          objc_enumerationMutation(v55);
        objc_msgSend(*(id *)(*((_QWORD *)&v184 + 1) + 8 * i), "layer");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v61) = 0;
        objc_msgSend(v60, "setOpacity:", v61);

      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v184, v198, 16);
    }
    while (v57);
  }

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.325);
  -[CKEffectPickerView setIsAnimating:](self, "setIsAnimating:", 1);
  v62 = (void *)MEMORY[0x1E0CD28B0];
  v181[0] = MEMORY[0x1E0C809B0];
  v181[1] = 3221225472;
  v181[2] = __32__CKEffectPickerView__animateIn__block_invoke;
  v181[3] = &unk_1E274A0B8;
  v181[4] = self;
  v63 = v23;
  v182 = v63;
  v170 = v47;
  v183 = v170;
  objc_msgSend(v62, "setCompletionBlock:", v181);
  v64 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v64, "setToValue:", &unk_1E28715F0);
  v65 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v64, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v64, "setRemovedOnCompletion:", 0);
  objc_msgSend(v64, "setBeginTime:", CACurrentMediaTime());
  v66 = *MEMORY[0x1E0CD3050];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setTimingFunction:", v67);

  -[CKEffectPickerView backdrop](self, "backdrop");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v64;
  objc_msgSend(v68, "addAnimation:forKey:", v64, CFSTR("filters.gaussianBlur.inputRadius"));

  v69 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v69, "setToValue:", &unk_1E2871600);
  objc_msgSend(v69, "setFillMode:", v65);
  objc_msgSend(v69, "setRemovedOnCompletion:", 0);
  objc_msgSend(v69, "setBeginTime:", CACurrentMediaTime());
  v172 = v66;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v66);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setTimingFunction:", v70);

  v71 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v71, "setFromValue:", &unk_1E2871600);
  objc_msgSend(v71, "setToValue:", &unk_1E2871610);
  v176 = v65;
  objc_msgSend(v71, "setFillMode:", v65);
  objc_msgSend(v71, "setRemovedOnCompletion:", 0);
  objc_msgSend(v71, "setBeginTime:", CACurrentMediaTime());
  v72 = *MEMORY[0x1E0CD3040];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setTimingFunction:", v73);

  v74 = v71;
  v75 = v74;
  if (-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"))
  {
    v75 = objc_alloc_init(MEMORY[0x1E0CD2710]);

    objc_msgSend(v75, "setFromValue:", &unk_1E2871620);
    objc_msgSend(v75, "setToValue:", &unk_1E2871610);
    objc_msgSend(v75, "setFillMode:", v176);
    objc_msgSend(v75, "setRemovedOnCompletion:", 0);
    objc_msgSend(v75, "setBeginTime:", CACurrentMediaTime());
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v72);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setTimingFunction:", v76);

  }
  v168 = v74;
  -[CKEffectPickerView blueContrastLayer](self, "blueContrastLayer");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "addAnimation:forKey:", v69, CFSTR("opacity"));

  -[CKTransientReplicaButtonContainer sendButtonCircle](v63, "sendButtonCircle");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v75;
  objc_msgSend(v78, "addAnimation:forKey:", v75, CFSTR("opacity"));

  -[CKTransientReplicaButtonContainer cancelButtonCircle](v63, "cancelButtonCircle");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addAnimation:forKey:", v69, CFSTR("opacity"));

  if (UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityDarkerSystemColorsEnabled())
  {
    -[CKEffectPickerView accessibilityBackdropView](self, "accessibilityBackdropView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "addAnimation:forKey:", v69, CFSTR("opacity"));

  }
  v81 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v81, "setValues:", &unk_1E286F9E8);
  objc_msgSend(v81, "setKeyTimes:", &unk_1E286FA00);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v72);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setTimingFunction:", v82);

  objc_msgSend(v81, "setFillMode:", v176);
  objc_msgSend(v81, "setRemovedOnCompletion:", 0);
  objc_msgSend(v81, "setBeginTime:", CACurrentMediaTime());
  v83 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v83, "setValues:", &unk_1E286FA18);
  objc_msgSend(v83, "setKeyTimes:", &unk_1E286FA30);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v172);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setTimingFunction:", v84);

  objc_msgSend(v83, "setFillMode:", v176);
  objc_msgSend(v83, "setRemovedOnCompletion:", 0);
  objc_msgSend(v83, "setBeginTime:", CACurrentMediaTime());
  -[CKTransientReplicaButtonContainer sendButtonGlyphLayer](v63, "sendButtonGlyphLayer");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = v83;
  objc_msgSend(v85, "addAnimation:forKey:", v83, CFSTR("transform.scale"));

  -[CKTransientReplicaButtonContainer cancelButtonGlyphLayer](v63, "cancelButtonGlyphLayer");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v81;
  objc_msgSend(v86, "addAnimation:forKey:", v81, CFSTR("transform.scale"));

  v87 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)v39);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setToValue:", v88);

  objc_msgSend(v87, "setFillMode:", v176);
  objc_msgSend(v87, "setRemovedOnCompletion:", 0);
  objc_msgSend(v87, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v172);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setTimingFunction:", v89);

  v90 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)v46);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setToValue:", v91);

  objc_msgSend(v90, "setFillMode:", v176);
  objc_msgSend(v90, "setRemovedOnCompletion:", 0);
  objc_msgSend(v90, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v172);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setTimingFunction:", v92);

  objc_msgSend(v32, "addAnimation:forKey:", v87, CFSTR("position.x"));
  objc_msgSend(v32, "addAnimation:forKey:", v90, CFSTR("position.y"));
  v164 = v32;
  v174 = v69;
  objc_msgSend(v32, "addAnimation:forKey:", v69, CFSTR("opacity"));
  v93 = v74;
  if (v170)
  {
    objc_msgSend(v170, "addAnimation:forKey:", v74, CFSTR("opacity"));
    objc_msgSend(v170, "addAnimation:forKey:", v87, CFSTR("position.x"));
    objc_msgSend(v170, "addAnimation:forKey:", v90, CFSTR("position.y"));
  }
  v157 = v87;
  -[CKEffectPickerView closeButton](self, "closeButton", v93, v90);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "frame");
  x = v200.origin.x;
  y = v200.origin.y;
  width = v200.size.width;
  height = v200.size.height;
  CGRectGetMidX(v200);
  v201.origin.x = x;
  v201.origin.y = y;
  v201.size.width = width;
  v201.size.height = height;
  MidY = CGRectGetMidY(v201);
  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "lastObject");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "frame");
  v102 = v202.origin.x;
  v103 = v202.origin.y;
  v104 = v202.size.width;
  v105 = v202.size.height;
  CGRectGetMidX(v202);
  v203.origin.x = v102;
  v203.origin.y = v103;
  v203.size.width = v104;
  v203.size.height = v105;
  v106 = CGRectGetMidY(v203);

  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  v166 = self;
  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v177, v197, 16);
  if (v108)
  {
    v109 = v108;
    v110 = MidY - v106;
    v111 = *(_QWORD *)v178;
    do
    {
      for (j = 0; j != v109; ++j)
      {
        if (*(_QWORD *)v178 != v111)
          objc_enumerationMutation(v107);
        v113 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * j);
        objc_msgSend(v113, "frame");
        v115 = v114;
        v117 = v116;
        v118 = objc_alloc_init(MEMORY[0x1E0CD2710]);
        v119 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v113, "layer");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "anchorPoint");
        objc_msgSend(v119, "numberWithDouble:", v110 + v115 + v117 * v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "setFromValue:", v122);

        v123 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v113, "layer");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "anchorPoint");
        objc_msgSend(v123, "numberWithDouble:", v115 + v117 * v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "setToValue:", v126);

        objc_msgSend(v118, "setRemovedOnCompletion:", 0);
        objc_msgSend(v118, "setFillMode:", v176);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v172);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "setTimingFunction:", v127);

        objc_msgSend(v118, "setBeginTime:", CACurrentMediaTime());
        objc_msgSend(v113, "addAnimation:forKey:", v118, CFSTR("position.y"));
        v128 = (void *)objc_msgSend(v174, "copy");
        v129 = CACurrentMediaTime();
        objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
        objc_msgSend(v128, "setBeginTime:", v129 + v130 * 0.6);
        objc_msgSend(v113, "addAnimation:forKey:", v128, CFSTR("opacity"));

      }
      v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v177, v197, 16);
    }
    while (v109);
  }

  -[CKEffectPickerView roundedContainerView](v166, "roundedContainerView");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "frame");
  v133 = v132;
  v135 = v134;

  v136 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  v137 = (void *)MEMORY[0x1E0CB37E8];
  -[CKEffectPickerView roundedContainerView](v166, "roundedContainerView");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "layer");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "anchorPoint");
  objc_msgSend(v137, "numberWithDouble:", v133 + v135 * v140 + 150.0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "setFromValue:", v141);

  v142 = (void *)MEMORY[0x1E0CB37E8];
  -[CKEffectPickerView roundedContainerView](v166, "roundedContainerView");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "layer");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "anchorPoint");
  objc_msgSend(v142, "numberWithDouble:", v133 + v135 * v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "setToValue:", v146);

  objc_msgSend(v136, "setRemovedOnCompletion:", 0);
  objc_msgSend(v136, "setFillMode:", v176);
  v147 = *MEMORY[0x1E0CD3048];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "setTimingFunction:", v148);

  objc_msgSend(v136, "setBeginTime:", CACurrentMediaTime());
  -[CKEffectPickerView roundedContainerView](v166, "roundedContainerView");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "addAnimation:forKey:", v136, CFSTR("position.y"));

  -[CKEffectPickerView roundedContainerView](v166, "roundedContainerView");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "addAnimation:forKey:", v174, CFSTR("opacity"));

  v151 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v151, "setFromValue:", &unk_1E2871650);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v135);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "setToValue:", v152);

  objc_msgSend(v151, "setFillMode:", v176);
  objc_msgSend(v151, "setRemovedOnCompletion:", 0);
  objc_msgSend(v151, "setFillMode:", v176);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v147);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "setTimingFunction:", v153);

  objc_msgSend(v151, "setBeginTime:", CACurrentMediaTime());
  -[CKEffectPickerView roundedContainerView](v166, "roundedContainerView");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "addAnimation:forKey:", v151, CFSTR("bounds.size.height"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[CKEffectPickerView peekContainer](v166, "peekContainer");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "setHidden:", 0);

}

void __32__CKEffectPickerView__animateIn__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "backdrop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKeyPath:", &unk_1E28715F0, CFSTR("filters.gaussianBlur.inputRadius"));

  objc_msgSend(a1[4], "roundedContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1.0;
  objc_msgSend(v4, "setOpacity:", v5);

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(a1[4], "effectLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v49;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v10), "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = 1.0;
        objc_msgSend(v11, "setOpacity:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(a1[5], "removeFromSuperview");
  objc_msgSend(a1[4], "closeButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 0);

  objc_msgSend(a1[6], "removeFromSuperview");
  objc_msgSend(a1[4], "setIsAnimating:", 0);
  objc_msgSend(a1[4], "_updateBalloonViewPositionAnimated:", 0);
  objc_msgSend(a1[4], "balloonView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1.0;
  objc_msgSend(v15, "setOpacity:", v16);

  objc_msgSend(a1[4], "blueContrastLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 1.0;
  objc_msgSend(v17, "setOpacity:", v18);

  objc_msgSend(a1[4], "balloonView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_removeAllAnimations:", 1);

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(a1[4], "effectLabels");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v45;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v24++), "_removeAllAnimations:", 1);
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v22);
  }

  objc_msgSend(a1[4], "roundedContainerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_removeAllAnimations:", 1);

  objc_msgSend(a1[4], "hintContainer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setHidden:", 1);

  objc_msgSend(a1[4], "backdrop");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "scale");
  objc_msgSend(v27, "setRasterizationScale:");

  objc_msgSend(a1[4], "backdrop");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setShouldRasterize:", 1);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(a1[4], "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "effectPickerViewDidFinishAnimatingIn:", a1[4]);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(a1[4], "fsem", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "effectIdentifiers");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v41;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v41 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v36);
        objc_msgSend(a1[4], "fsem");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "effectForIdentifier:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        ++v36;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v34);
  }

}

- (void)_stopBalloonAnimation
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  CKSendAnimationContext *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CKEffectPickerView balloonView](self, "balloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  if (v3)
  {
    objc_msgSend(v3, "setInvisibleInkEffectEnabled:", 0);
    objc_msgSend(v3, "prepareForDisplayIfNeeded");
    v9 = objc_alloc_init(CKSendAnimationContext);
    v19 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSendAnimationContext setThrowBalloonViews:](v9, "setThrowBalloonViews:", v10);

    v11 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSendAnimationContext setAnimatableTextViews:](v9, "setAnimatableTextViews:", v12);

    if (!v5)
    -[CKSendAnimationContext setIsSender:](v9, "setIsSender:", 1);
    -[CKSendAnimationContext setImpactIdentifier:](v9, "setImpactIdentifier:", CFSTR("nil"));
    -[CKEffectPickerView dummyAnimator](self, "dummyAnimator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stopAnimationWithSendAnimationContext:", v9);

  }
}

- (void)_animateOut
{
  uint64_t v3;
  CKTransientReplicaButtonContainer *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  CKTransientReplicaButtonContainer *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  double v62;
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
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidY;
  void *v94;
  void *v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  double v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  double v104;
  uint64_t v105;
  uint64_t i;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  id v112;
  void *v113;
  void *v114;
  double v115;
  void *v116;
  void *v117;
  void *v118;
  double v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  double v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  double v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  double v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
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
  CKEffectPickerView *v156;
  void *v157;
  void *v158;
  CKTransientReplicaButtonContainer *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _QWORD v167[5];
  _QWORD v168[5];
  _BYTE v169[128];
  uint64_t v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;

  v170 = *MEMORY[0x1E0C80C00];
  -[CKEffectPickerView cancelImpactSelection](self, "cancelImpactSelection");
  v3 = MEMORY[0x1E0C809B0];
  v168[0] = MEMORY[0x1E0C809B0];
  v168[1] = 3221225472;
  v168[2] = __33__CKEffectPickerView__animateOut__block_invoke;
  v168[3] = &unk_1E274A208;
  v168[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v168, 0.325);
  v4 = [CKTransientReplicaButtonContainer alloc];
  -[CKEffectPickerView closeButton](self, "closeButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[CKEffectPickerView usesDarkVibrancyForLayers](self, "usesDarkVibrancyForLayers");
  v15 = -[CKEffectPickerView isInDarkMode](self, "isInDarkMode");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "theme");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fsmPickerCloseButtonColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[CKTransientReplicaButtonContainer initWithFrame:hasDarkVibrancy:isInDarkMode:color:sendColor:](v4, "initWithFrame:hasDarkVibrancy:isInDarkMode:color:sendColor:", v14, v15, v18, -[CKEffectPickerView controlColor](self, "controlColor"), v7, v9, v11, v13);

  -[CKEffectPickerView peekContainer](self, "peekContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v19);

  -[CKEffectPickerView closeButton](self, "closeButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", 1);

  -[CKTransientReplicaButtonContainer sendButtonCircle](v19, "sendButtonCircle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = 0;
  objc_msgSend(v23, "setOpacity:", v24);

  v159 = v19;
  -[CKTransientReplicaButtonContainer sendButtonGlyphLayer](v19, "sendButtonGlyphLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = 0;
  objc_msgSend(v25, "setOpacity:", v26);

  -[CKEffectPickerView _resizeBalloon](self, "_resizeBalloon");
  -[CKEffectPickerView _updateBalloonViewPositionAnimated:](self, "_updateBalloonViewPositionAnimated:", 0);
  -[CKEffectPickerView balloonView](self, "balloonView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView balloonViewOrigin](self, "balloonViewOrigin");
  v29 = v28;
  objc_msgSend(v27, "frame");
  v31 = v30;
  objc_msgSend(v27, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "anchorPoint");
  v34 = v33;

  -[CKEffectPickerView balloonViewOrigin](self, "balloonViewOrigin");
  v36 = v35;
  objc_msgSend(v27, "frame");
  v38 = v37;
  v158 = v27;
  objc_msgSend(v27, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "anchorPoint");
  v41 = v40;

  -[CKEffectPickerView _blackTextReplica](self, "_blackTextReplica");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    -[CKEffectPickerView peekContainer](self, "peekContainer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSubview:", v42);

    objc_msgSend(v42, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = 0;
    objc_msgSend(v44, "setOpacity:", v45);

  }
  v157 = v42;
  -[CKEffectPickerView backdrop](self, "backdrop");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setShouldRasterize:", 0);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.325);
  -[CKEffectPickerView setIsAnimating:](self, "setIsAnimating:", 1);
  v167[0] = v3;
  v167[1] = 3221225472;
  v167[2] = __33__CKEffectPickerView__animateOut__block_invoke_2;
  v167[3] = &unk_1E274A208;
  v167[4] = self;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v167);
  v47 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v47, "setFromValue:", &unk_1E28715F0);
  objc_msgSend(v47, "setToValue:", &unk_1E2871610);
  v48 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v47, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v47, "setRemovedOnCompletion:", 0);
  objc_msgSend(v47, "setBeginTime:", CACurrentMediaTime());
  v49 = *MEMORY[0x1E0CD3050];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setTimingFunction:", v50);

  -[CKEffectPickerView backdrop](self, "backdrop");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = v47;
  objc_msgSend(v51, "addAnimation:forKey:", v47, CFSTR("filters.gaussianBlur.inputRadius"));

  v52 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v52, "setFromValue:", &unk_1E2871610);
  objc_msgSend(v52, "setToValue:", &unk_1E2871600);
  objc_msgSend(v52, "setFillMode:", v48);
  objc_msgSend(v52, "setRemovedOnCompletion:", 0);
  objc_msgSend(v52, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v49);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setTimingFunction:", v53);

  v54 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v54, "setFromValue:", &unk_1E2871600);
  objc_msgSend(v54, "setToValue:", &unk_1E2871610);
  objc_msgSend(v54, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v54, "setRemovedOnCompletion:", 0);
  objc_msgSend(v54, "setBeginTime:", CACurrentMediaTime());
  v55 = *MEMORY[0x1E0CD3040];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v54;
  objc_msgSend(v54, "setTimingFunction:", v56);

  v57 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v57, "setFromValue:", &unk_1E2871600);
  objc_msgSend(v57, "setToValue:", &unk_1E2871610);
  v161 = v48;
  objc_msgSend(v57, "setFillMode:", v48);
  objc_msgSend(v57, "setRemovedOnCompletion:", 0);
  objc_msgSend(v57, "setBeginTime:", CACurrentMediaTime());
  v160 = v49;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v49);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setTimingFunction:", v58);

  v59 = v52;
  v60 = v59;
  if (-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"))
  {
    v60 = objc_alloc_init(MEMORY[0x1E0CD2710]);

    objc_msgSend(v60, "setFromValue:", &unk_1E2871610);
    objc_msgSend(v60, "setToValue:", &unk_1E2871660);
    objc_msgSend(v60, "setFillMode:", v48);
    objc_msgSend(v60, "setRemovedOnCompletion:", 0);
    objc_msgSend(v60, "setBeginTime:", CACurrentMediaTime());
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v55);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setTimingFunction:", v61);

  }
  v62 = v29 + v31 * v34;
  -[CKTransientReplicaButtonContainer sendButtonCircle](v159, "sendButtonCircle");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addAnimation:forKey:", v60, CFSTR("opacity"));

  -[CKTransientReplicaButtonContainer sendButtonGlyphLayer](v159, "sendButtonGlyphLayer");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v60;
  objc_msgSend(v64, "addAnimation:forKey:", v60, CFSTR("opacity"));

  -[CKTransientReplicaButtonContainer cancelButtonCircle](v159, "cancelButtonCircle");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addAnimation:forKey:", v162, CFSTR("opacity"));

  -[CKEffectPickerView momentTitleLabel](self, "momentTitleLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addAnimation:forKey:", v57, CFSTR("opacity"));

  -[CKEffectPickerView sendMomentButton](self, "sendMomentButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addAnimation:forKey:", v57, CFSTR("opacity"));

  -[CKEffectPickerView pageControl](self, "pageControl");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addAnimation:forKey:", v57, CFSTR("opacity"));

  -[CKEffectPickerView backgroundView](self, "backgroundView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addAnimation:forKey:", v57, CFSTR("opacity"));

  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "addAnimation:forKey:", v57, CFSTR("opacity"));

  -[CKEffectPickerView mainLabel](self, "mainLabel");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addAnimation:forKey:", v57, CFSTR("opacity"));

  -[CKEffectPickerView typeSegmentedControl](self, "typeSegmentedControl");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addAnimation:forKey:", v57, CFSTR("opacity"));

  -[CKEffectPickerView segmentedBackdrop](self, "segmentedBackdrop");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addAnimation:forKey:", v57, CFSTR("opacity"));

  -[CKEffectPickerView blueContrastLayer](self, "blueContrastLayer");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "addAnimation:forKey:", v57, CFSTR("opacity"));

  if (UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityDarkerSystemColorsEnabled())
  {
    -[CKEffectPickerView accessibilityBackdropView](self, "accessibilityBackdropView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "addAnimation:forKey:", v57, CFSTR("opacity"));

  }
  v154 = v57;
  v76 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v76, "setValues:", &unk_1E286FA48);
  objc_msgSend(v76, "setKeyTimes:", &unk_1E286FA60);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v55);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setTimingFunction:", v77);

  objc_msgSend(v76, "setFillMode:", v48);
  objc_msgSend(v76, "setRemovedOnCompletion:", 0);
  objc_msgSend(v76, "setBeginTime:", CACurrentMediaTime());
  v78 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v78, "setValues:", &unk_1E286FA78);
  objc_msgSend(v78, "setKeyTimes:", &unk_1E286FA90);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v160);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setTimingFunction:", v79);

  objc_msgSend(v78, "setFillMode:", v48);
  objc_msgSend(v78, "setRemovedOnCompletion:", 0);
  objc_msgSend(v78, "setBeginTime:", CACurrentMediaTime());
  -[CKTransientReplicaButtonContainer sendButtonGlyphLayer](v159, "sendButtonGlyphLayer");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v76;
  objc_msgSend(v80, "addAnimation:forKey:", v76, CFSTR("transform.scale"));

  -[CKTransientReplicaButtonContainer cancelButtonGlyphLayer](v159, "cancelButtonGlyphLayer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v78;
  objc_msgSend(v81, "addAnimation:forKey:", v78, CFSTR("transform.scale"));

  v82 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v62);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setToValue:", v83);

  objc_msgSend(v82, "setFillMode:", v48);
  objc_msgSend(v82, "setRemovedOnCompletion:", 0);
  objc_msgSend(v82, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v160);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setTimingFunction:", v84);

  v85 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36 + v38 * v41);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setToValue:", v86);

  objc_msgSend(v85, "setFillMode:", v161);
  objc_msgSend(v85, "setRemovedOnCompletion:", 0);
  objc_msgSend(v85, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v160);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setTimingFunction:", v87);

  objc_msgSend(v158, "addAnimation:forKey:", v82, CFSTR("position.x"));
  objc_msgSend(v158, "addAnimation:forKey:", v85, CFSTR("position.y"));
  if (v157)
  {
    objc_msgSend(v158, "addAnimation:forKey:", v162, CFSTR("opacity"));
    objc_msgSend(v157, "addAnimation:forKey:", v59, CFSTR("opacity"));
    objc_msgSend(v157, "addAnimation:forKey:", v82, CFSTR("position.x"));
    objc_msgSend(v157, "addAnimation:forKey:", v85, CFSTR("position.y"));
  }
  v148 = v85;
  v149 = v82;
  v153 = v59;
  -[CKEffectPickerView closeButton](self, "closeButton");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "frame");
  x = v171.origin.x;
  y = v171.origin.y;
  width = v171.size.width;
  height = v171.size.height;
  CGRectGetMidX(v171);
  v172.origin.x = x;
  v172.origin.y = y;
  v172.size.width = width;
  v172.size.height = height;
  MidY = CGRectGetMidY(v172);
  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "lastObject");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "frame");
  v96 = v173.origin.x;
  v97 = v173.origin.y;
  v98 = v173.size.width;
  v99 = v173.size.height;
  CGRectGetMidX(v173);
  v174.origin.x = v96;
  v174.origin.y = v97;
  v174.size.width = v98;
  v174.size.height = v99;
  v100 = CGRectGetMidY(v174);

  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  v156 = self;
  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v163, v169, 16);
  if (v102)
  {
    v103 = v102;
    v104 = MidY - v100;
    v105 = *(_QWORD *)v164;
    do
    {
      for (i = 0; i != v103; ++i)
      {
        if (*(_QWORD *)v164 != v105)
          objc_enumerationMutation(v101);
        v107 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * i);
        objc_msgSend(v107, "frame");
        v109 = v108;
        v111 = v110;
        v112 = objc_alloc_init(MEMORY[0x1E0CD2710]);
        v113 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v107, "layer");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "anchorPoint");
        objc_msgSend(v113, "numberWithDouble:", v109 + v111 * v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "setFromValue:", v116);

        v117 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v107, "layer");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "anchorPoint");
        objc_msgSend(v117, "numberWithDouble:", v104 + v109 + v111 * v119);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "setToValue:", v120);

        objc_msgSend(v112, "setRemovedOnCompletion:", 0);
        objc_msgSend(v112, "setFillMode:", v161);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v160);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "setTimingFunction:", v121);

        objc_msgSend(v112, "setBeginTime:", CACurrentMediaTime());
        objc_msgSend(v107, "addAnimation:forKey:", v112, CFSTR("position.y"));
        v122 = (void *)objc_msgSend(v162, "copy");
        v123 = CACurrentMediaTime();
        objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
        objc_msgSend(v122, "setBeginTime:", v123 + v124 * -0.8);
        objc_msgSend(v107, "addAnimation:forKey:", v122, CFSTR("opacity"));

      }
      v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v163, v169, 16);
    }
    while (v103);
  }

  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "frame");
  v127 = v126;
  v129 = v128;

  v130 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  v131 = (void *)MEMORY[0x1E0CB37E8];
  -[CKEffectPickerView roundedContainerView](v156, "roundedContainerView");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "layer");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "anchorPoint");
  objc_msgSend(v131, "numberWithDouble:", v127 + v129 * v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "setFromValue:", v135);

  v136 = (void *)MEMORY[0x1E0CB37E8];
  -[CKEffectPickerView roundedContainerView](v156, "roundedContainerView");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "layer");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "anchorPoint");
  objc_msgSend(v136, "numberWithDouble:", v127 + v129 * v139 + 150.0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "setToValue:", v140);

  objc_msgSend(v130, "setRemovedOnCompletion:", 0);
  objc_msgSend(v130, "setFillMode:", v161);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v160);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "setTimingFunction:", v141);

  objc_msgSend(v130, "setBeginTime:", CACurrentMediaTime());
  -[CKEffectPickerView roundedContainerView](v156, "roundedContainerView");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "addAnimation:forKey:", v130, CFSTR("position.y"));

  -[CKEffectPickerView roundedContainerView](v156, "roundedContainerView");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "addAnimation:forKey:", v162, CFSTR("opacity"));

  v144 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v129);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "setFromValue:", v145);

  objc_msgSend(v144, "setToValue:", &unk_1E2871650);
  objc_msgSend(v144, "setFillMode:", v161);
  objc_msgSend(v144, "setRemovedOnCompletion:", 0);
  objc_msgSend(v144, "setFillMode:", v161);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v160);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "setTimingFunction:", v146);

  objc_msgSend(v144, "setBeginTime:", CACurrentMediaTime());
  -[CKEffectPickerView roundedContainerView](v156, "roundedContainerView");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "addAnimation:forKey:", v144, CFSTR("bounds.size.height"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __33__CKEffectPickerView__animateOut__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", 0);

  objc_msgSend(*(id *)(a1 + 32), "accessibilitySendBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

  objc_msgSend(*(id *)(a1 + 32), "accessibilityCloseBackgroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", 0);

}

void __33__CKEffectPickerView__animateOut__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "touchUpInsideCloseButton");

}

- (id)_glyphLayerForButtonAnimationWithGlyphName:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v3);
  objc_msgSend(v8, "setContents:", objc_msgSend(v9, "CGImage"));
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v5, v7);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompositingFilter:", v10);

  return v8;
}

- (void)_animateSelectedEffectLabelAtIndex:(unint64_t)a3 fromPreviousIndex:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void (**v20)(_QWORD);
  void (**v21)(_QWORD);
  void (**v22)(void *, uint64_t);
  void (**v23)(void *, uint64_t);
  uint64_t v24;
  void (**v25)(void *, uint64_t);
  _QWORD v26[7];
  __int128 v27;
  _QWORD v28[8];
  __int128 v29;
  _QWORD v30[6];
  __int128 v31;
  _QWORD aBlock[6];
  __int128 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__59;
  v50 = __Block_byref_object_dispose__59;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__59;
  v44 = __Block_byref_object_dispose__59;
  v45 = 0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CKEffectPickerView effectLabels](self, "effectLabels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v47[5];
    v47[5] = v8;

    -[CKEffectPickerView effectDescriptiveLabels](self, "effectDescriptiveLabels");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a3);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v41[5];
    v41[5] = v11;

  }
  v13 = 0;
  v14 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__59;
  v38 = __Block_byref_object_dispose__59;
  v39 = 0;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CKEffectPickerView effectLabels](self, "effectLabels");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", a4);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v35[5];
    v35[5] = v16;

    -[CKEffectPickerView effectDescriptiveLabels](self, "effectDescriptiveLabels");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndex:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)v35[5];
  }
  objc_msgSend(v13, "setHidden:", 0);
  objc_msgSend(v14, "setHidden:", 1);
  objc_msgSend((id)v47[5], "setHidden:", 1);
  objc_msgSend((id)v41[5], "setHidden:", 0);
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke;
  aBlock[3] = &unk_1E27584D8;
  aBlock[4] = self;
  aBlock[5] = &v34;
  v33 = xmmword_18E7CBDB0;
  v20 = (void (**)(_QWORD))_Block_copy(aBlock);
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke_2;
  v30[3] = &unk_1E27584D8;
  v30[4] = self;
  v30[5] = &v46;
  v31 = xmmword_18E7CBDC0;
  v21 = (void (**)(_QWORD))_Block_copy(v30);
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke_3;
  v28[3] = &unk_1E2758500;
  v28[4] = self;
  v28[5] = &v46;
  v28[6] = &v40;
  v28[7] = a3;
  v29 = xmmword_18E7CBDC0;
  v22 = (void (**)(void *, uint64_t))_Block_copy(v28);
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke_4;
  v26[3] = &unk_1E2758528;
  v26[4] = self;
  v26[5] = &v34;
  v26[6] = a4;
  v27 = xmmword_18E7CBDB0;
  v23 = (void (**)(void *, uint64_t))_Block_copy(v26);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.25);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v20[2](v20);
    v24 = 0;
    v25 = v22;
  }
  else if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21[2](v21);
    if (!-[CKEffectPickerView shouldAnimatePreviousLabelForCancel:](self, "shouldAnimatePreviousLabelForCancel:", v35[5]))
    {
      objc_msgSend((id)v35[5], "_removeAllAnimations:", 1);
      goto LABEL_12;
    }
    v24 = 0;
    v25 = v23;
  }
  else
  {
    v24 = 1;
    v22[2](v22, 1);
    v25 = v23;
  }
  v25[2](v25, v24);
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit", 0x3FD6666660000000, 0x3FF0000000000000);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

void __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "effectLabels");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    v5 = *MEMORY[0x1E0CD3050];
    v6 = *MEMORY[0x1E0CD2B60];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        if (v8 != *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        {
          v9 = objc_alloc_init(MEMORY[0x1E0CD2710]);
          objc_msgSend(v9, "setBeginTime:", CACurrentMediaTime());
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setFromValue:", v10);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setToValue:", v11);

          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setTimingFunction:", v12);

          objc_msgSend(v9, "setRemovedOnCompletion:", 0);
          objc_msgSend(v9, "setFillMode:", v6);
          objc_msgSend(v8, "addAnimation:forKey:", v9, CFSTR("opacity"));

        }
        ++v7;
      }
      while (v3 != v7);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

}

void __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "effectLabels");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    v5 = *MEMORY[0x1E0CD3050];
    v6 = *MEMORY[0x1E0CD2B60];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        if (v8 != *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        {
          v9 = objc_alloc_init(MEMORY[0x1E0CD2710]);
          objc_msgSend(v9, "setBeginTime:", CACurrentMediaTime());
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setFromValue:", v10);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setToValue:", v11);

          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setTimingFunction:", v12);

          objc_msgSend(v9, "setRemovedOnCompletion:", 0);
          objc_msgSend(v9, "setFillMode:", v6);
          objc_msgSend(v8, "addAnimation:forKey:", v9, CFSTR("opacity"));

        }
        ++v7;
      }
      while (v3 != v7);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

}

void __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke_3(uint64_t a1, int a2)
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v22, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "frame");
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anchorPoint");
  v8 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "frame");
  v10 = v5 + v8 * v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFromValue:", v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "offsetYForLabelAtIndex:withInitialY:", *(_QWORD *)(a1 + 56), v10);
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setToValue:", v13);

  v14 = *MEMORY[0x1E0CD3050];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTimingFunction:", v15);

  objc_msgSend(v22, "setRemovedOnCompletion:", 0);
  v16 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v22, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnimation:forKey:", v22, CFSTR("position.y"));

  if (a2)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CD2710]);
    objc_msgSend(v18, "setBeginTime:", CACurrentMediaTime());
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFromValue:", v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setToValue:", v20);

    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTimingFunction:", v21);

    objc_msgSend(v18, "setFillMode:", v16);
    objc_msgSend(v18, "setRemovedOnCompletion:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addAnimation:forKey:", v18, CFSTR("opacity"));

  }
}

void __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke_4(uint64_t a1, int a2)
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v22, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "frame");
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anchorPoint");
  v8 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "frame");
  v10 = v5 + v8 * v9;

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "offsetYForLabelAtIndex:withInitialY:", *(_QWORD *)(a1 + 48), v10);
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFromValue:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setToValue:", v13);

  v14 = *MEMORY[0x1E0CD3050];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTimingFunction:", v15);

  objc_msgSend(v22, "setRemovedOnCompletion:", 1);
  v16 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v22, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnimation:forKey:", v22, CFSTR("position.y"));

  if (a2)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CD2710]);
    objc_msgSend(v18, "setBeginTime:", CACurrentMediaTime());
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFromValue:", v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setToValue:", v20);

    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTimingFunction:", v21);

    objc_msgSend(v18, "setFillMode:", v16);
    objc_msgSend(v18, "setRemovedOnCompletion:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addAnimation:forKey:", v18, CFSTR("opacity"));

  }
}

- (double)offsetYForLabelAtIndex:(int64_t)a3 withInitialY:(double)a4
{
  return 0.0;
}

- (BOOL)shouldAnimatePreviousLabelForCancel:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CKEffectPickerView momentIdentifiers](self, "momentIdentifiers", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = a4;
  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKMomentCollectionViewCell reuseIdentifier](CKMomentCollectionViewCell, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subviews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[CKEffectPickerView fsem](self, "fsem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView momentIdentifiers](self, "momentIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "row");

  objc_msgSend(v12, "objectAtIndex:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "effectForIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setEffect:", v15);
  return v8;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "effect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v30 = v7;
    objc_msgSend(v6, "setupEffectIfNeeded");
    -[CKEffectPickerView balloonView](self, "balloonView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v6, "effectViews");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v35)
    {
      v32 = *(_QWORD *)v44;
      v33 = v6;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v44 != v32)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
          objc_msgSend(v34, "superview");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "center");
          objc_msgSend(v10, "convertPoint:toView:", self);
          objc_msgSend(v9, "setFocusPoint:");

          objc_msgSend(v34, "superview");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "frame");
          objc_msgSend(v11, "convertRect:toView:", self);
          objc_msgSend(v9, "setMessageRect:");

          objc_msgSend(v9, "setMessageOrientation:", objc_msgSend(v34, "orientation"));
          -[CKEffectPickerView balloonView](self, "balloonView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "center");
          v14 = v13;
          v16 = v15;
          v17 = objc_alloc(MEMORY[0x1E0CEA610]);
          objc_msgSend(v12, "bounds");
          v20 = (void *)objc_msgSend(v17, "initWithSize:", v18, v19);
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __72__CKEffectPickerView_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
          v41[3] = &unk_1E274A3D0;
          v21 = v12;
          v42 = v21;
          v36 = v20;
          objc_msgSend(v20, "imageWithActions:", v41);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v6, "effectViews");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v38;
            do
            {
              v27 = 0;
              do
              {
                if (*(_QWORD *)v38 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v27);
                objc_msgSend(v21, "superview");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "convertPoint:toView:", self, v14, v16);
                objc_msgSend(v28, "setFocusPoint:");

                objc_msgSend(v28, "setMessageImage:", v22);
                ++v27;
              }
              while (v25 != v27);
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
            }
            while (v25);
          }

          ++v8;
          v6 = v33;
        }
        while (v8 != v35);
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v35);
    }

    objc_msgSend(v6, "animate");
    -[CKEffectPickerView checkAndUpdateForSpotlightEffect:](self, "checkAndUpdateForSpotlightEffect:", v6);
    -[CKEffectPickerView addAnimationTimerForCell:](self, "addAnimationTimerForCell:", v6);

    v7 = v30;
  }

}

uint64_t __72__CKEffectPickerView_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(*(id *)(a1 + 32), "frame");
  return objc_msgSend(*(id *)(a1 + 32), "drawViewHierarchyInRect:", v2, v3);
}

- (void)checkAndUpdateForSpotlightEffect:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  if (UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityDarkerSystemColorsEnabled())
  {
    objc_msgSend(v8, "effect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.messages.effect.CKSpotlightEffect"));

    if (v6)
    {
      -[CKEffectPickerView updateViewColors:](self, "updateViewColors:", 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateViewColors_, v7, 4.0);

    }
  }

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(v7, "effect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKEffectPickerView removeAnimationTimerForCell:](self, "removeAnimationTimerForCell:", v7);
    objc_msgSend(v7, "stopAnimation");
  }

}

- (void)addAnimationTimerForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0C99E88];
  objc_msgSend(v4, "effect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "duration");
  v8 = v7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__CKEffectPickerView_addAnimationTimerForCell___block_invoke;
  v18[3] = &unk_1E2758550;
  v9 = v4;
  v19 = v9;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v5, "timerWithTimeInterval:repeats:block:", 1, v18, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTimer:forMode:", v10, *MEMORY[0x1E0C99860]);

  -[CKEffectPickerView animationTimers](self, "animationTimers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "effect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v10, v14);

  -[CKEffectPickerView animatedCells](self, "animatedCells");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "effect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v9, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __47__CKEffectPickerView_addAnimationTimerForCell___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "animate");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "checkAndUpdateForSpotlightEffect:", *(_QWORD *)(a1 + 32));

}

- (void)removeAnimationTimerForCell:(id)a3
{
  id v4;
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

  v4 = a3;
  -[CKEffectPickerView animationTimers](self, "animationTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "invalidate");
  -[CKEffectPickerView animationTimers](self, "animationTimers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v10);

  -[CKEffectPickerView animatedCells](self, "animatedCells");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v13);

}

- (void)_setNeedsSwitcherAnimationIfNecessary
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MaxY;
  id v21;
  CGRect v22;
  CGRect v23;

  if ((objc_msgSend((id)objc_opt_class(), "shouldUseLargeScreenDimension") & 1) != 0)
  {
    -[CKEffectPickerView typeSegmentedControl](self, "typeSegmentedControl");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v22.origin.x = v4;
    v22.origin.y = v6;
    v22.size.width = v8;
    v22.size.height = v10;
    MaxY = CGRectGetMaxY(v22);
    v23.origin.x = v13;
    v23.origin.y = v15;
    v23.size.width = v17;
    v23.size.height = v19;
    -[CKEffectPickerView setNeedsSwitcherAnimation:](self, "setNeedsSwitcherAnimation:", MaxY >= CGRectGetMinY(v23));

  }
  else
  {
    -[CKEffectPickerView setNeedsSwitcherAnimation:](self, "setNeedsSwitcherAnimation:", 1);
  }
}

- (void)_startSwitcherAnimationIfNecessary
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (-[CKEffectPickerView needsSwitcherAnimation](self, "needsSwitcherAnimation"))
  {
    v3[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__CKEffectPickerView__startSwitcherAnimationIfNecessary__block_invoke;
    v4[3] = &unk_1E274A208;
    v4[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__CKEffectPickerView__startSwitcherAnimationIfNecessary__block_invoke_2;
    v3[3] = &unk_1E274A1B8;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v4, v3, 0.2, 0.5);
  }
}

uint64_t __56__CKEffectPickerView__startSwitcherAnimationIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeSegmentedControlBottomConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", 20.0);

  objc_msgSend(*(id *)(a1 + 32), "mainLabelBottomConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "typeSegmentedControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "mainLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __56__CKEffectPickerView__startSwitcherAnimationIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "segmentedBackdrop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsSwitcherAnimation:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKEffectPickerView;
  -[CKEffectPickerView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[CKEffectPickerView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView setIsInDarkMode:](self, "setIsInDarkMode:", objc_msgSend(v4, "userInterfaceStyle") == 2);

  -[CKEffectPickerView updateViewColors](self, "updateViewColors");
}

- (void)handleTouchUp:(CGPoint)a3
{
  void *v4;
  int v5;
  id v6;

  -[CKEffectPickerView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView effectSendButtons](self, "effectSendButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v6);

  if (v5)
    -[CKEffectPickerView _touchUpInsideSendButton:](self, "_touchUpInsideSendButton:", v6);

}

- (void)handleTouchMoved:(CGPoint)a3
{
  void *v4;
  int v5;
  id v6;
  unint64_t selectedIndex;
  void *v8;
  id v9;

  -[CKEffectPickerView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView effectDotButtons](self, "effectDotButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v9);

  if (v5)
  {
    -[CKEffectPickerView _touchUpInsideDotButton:](self, "_touchUpInsideDotButton:", v9);
LABEL_7:
    v8 = v9;
    goto LABEL_8;
  }
  -[CKEffectPickerView closeButton](self, "closeButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 != v6)
  {

    goto LABEL_7;
  }
  selectedIndex = self->_selectedIndex;

  v8 = v9;
  if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CKEffectPickerView _touchUpInsideCloseButton:](self, "_touchUpInsideCloseButton:", v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)pageControlChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(a3, "currentPage");
  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollToItemAtIndexPath:atScrollPosition:animated:", v5, 16, 1);

}

- (void)effectTypeDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  -[CKEffectPickerView _updateBalloonViewPositionAnimated:](self, "_updateBalloonViewPositionAnimated:", 1);
  -[CKEffectPickerView updateViewColors](self, "updateViewColors");
  -[CKEffectPickerView typeSegmentedControl](self, "typeSegmentedControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedSegmentIndex");

  if (v5)
  {
    -[CKEffectPickerView _stopBalloonAnimation](self, "_stopBalloonAnimation");
    -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    -[CKEffectPickerView effectLabels](self, "effectLabels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v55 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "setHidden:", 1);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
      }
      while (v9);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[CKEffectPickerView effectDescriptiveLabels](self, "effectDescriptiveLabels", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v51 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "setHidden:", 1);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      }
      while (v14);
    }

    -[CKEffectPickerView invalidateAllAnimationTimers](self, "invalidateAllAnimationTimers");
    -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", self);

    -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDataSource:", self);

    -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 0);

    -[CKEffectPickerView pageControl](self, "pageControl");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", 0);

    -[CKEffectPickerView sendMomentButton](self, "sendMomentButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 0);

    -[CKEffectPickerView momentTitleLabel](self, "momentTitleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 0);

    -[CKEffectPickerView accessibilitySendBackgroundView](self, "accessibilitySendBackgroundView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 0);

    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      v24 = -[NSArray count](self->_momentIdentifiers, "count");
      -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "frame");
      v27 = v26;

      v28 = v27 * (double)v24;
      -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "contentOffset");
      v31 = v30;

      -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setContentOffset:", v28, v31);

    }
    -[CKEffectPickerView pageControl](self, "pageControl");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCurrentPage:", -[CKEffectPickerView selectedMomentIndex](self, "selectedMomentIndex"));
    goto LABEL_28;
  }
  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setHidden:", 0);

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v59 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * k), "setHidden:", 0);
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v37);
  }

  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setDelegate:", 0);

  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDataSource:", 0);

  -[CKEffectPickerView invalidateAllAnimationTimers](self, "invalidateAllAnimationTimers");
  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setHidden:", 1);

  -[CKEffectPickerView pageControl](self, "pageControl");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setHidden:", 1);

  -[CKEffectPickerView sendMomentButton](self, "sendMomentButton");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setHidden:", 1);

  -[CKEffectPickerView momentTitleLabel](self, "momentTitleLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setHidden:", 1);

  v46 = -[CKEffectPickerView selectedIndex](self, "selectedIndex");
  if (v46 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v47 = v46;
    -[CKEffectPickerView effectDotButtons](self, "effectDotButtons");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndex:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView _touchUpInsideDotButton:](self, "_touchUpInsideDotButton:", v48);

LABEL_28:
  }
  -[CKEffectPickerView momentsCollectionView](self, "momentsCollectionView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "reloadData");

  -[CKEffectPickerView _updateMomentsBackgroundColor](self, "_updateMomentsBackgroundColor");
  -[CKEffectPickerView updateMomentTitle:](self, "updateMomentTitle:", 1);
}

- (void)_panGesture:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") != 3)
  {
    objc_msgSend(v4, "locationInView:", self);
    -[CKEffectPickerView handleTouchMoved:](self, "handleTouchMoved:");
  }

}

- (void)_touchUpInsideSendButton:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CKEffectPickerView effectSendButtons](self, "effectSendButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  -[CKEffectPickerView delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView effectIdentifiers](self, "effectIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "effectSelectedWithIdentifier:", v8);

}

- (void)_touchUpInsideSendMomentButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKEffectPickerView delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView momentIdentifiers](self, "momentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView pageControl](self, "pageControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v5, "currentPage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "effectSelectedWithIdentifier:", v6);

}

- (void)_animateInSendButton:(id)a3
{
  id v3;
  CGFloat Width;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  CATransform3D v18;
  CATransform3D v19;
  CGRect v20;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v20);
  memset(&v19, 0, sizeof(v19));
  CATransform3DMakeScale(&v19, 9.0 / Width, 9.0 / Width, 1.0);
  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v19;
  objc_msgSend(v5, "setTransform:", &v18);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v6 = (void *)MEMORY[0x1E0CD28B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __43__CKEffectPickerView__animateInSendButton___block_invoke;
  v16[3] = &unk_1E274A208;
  v17 = v3;
  v7 = v3;
  objc_msgSend(v6, "setCompletionBlock:", v16);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.15);
  v8 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  v18 = v19;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", v9);

  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v18.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v18.m33 = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v18.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v18.m43 = v11;
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v18.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v18.m13 = v12;
  v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v18.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v18.m23 = v13;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToValue:", v14);

  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v8, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v7, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAnimation:forKey:", v8, CFSTR("transform"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __43__CKEffectPickerView__animateInSendButton___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[8];

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v8[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v8[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v8[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v8[7] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v8[0] = *MEMORY[0x1E0CD2610];
  v8[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v8[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v8[3] = v6;
  objc_msgSend(v2, "setTransform:", v8);

  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
}

- (void)_animateOutSendButton:(id)a3
{
  id v3;
  CGFloat Width;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  CATransform3D v15;
  _QWORD v16[4];
  id v17;
  CATransform3D v18;
  CATransform3D v19;
  CGRect v20;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v20);
  memset(&v19, 0, sizeof(v19));
  CATransform3DMakeScale(&v19, 9.0 / Width, 9.0 / Width, 1.0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.15);
  v16[1] = 3221225472;
  v18 = v19;
  v5 = (void *)MEMORY[0x1E0CD28B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[2] = __44__CKEffectPickerView__animateOutSendButton___block_invoke;
  v16[3] = &unk_1E2758578;
  v17 = v3;
  v6 = v3;
  objc_msgSend(v5, "setCompletionBlock:", v16);
  v7 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v15.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v15.m33 = v8;
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v15.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v15.m43 = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v15.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v15.m13 = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v15.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v15.m23 = v11;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", v12);

  v15 = v19;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", v13);

  objc_msgSend(v7, "setRemovedOnCompletion:", 0);
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v7, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v6, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v7, CFSTR("transform"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __44__CKEffectPickerView__animateOutSendButton___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[8];

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 120);
  v8[4] = *(_OWORD *)(a1 + 104);
  v8[5] = v3;
  v4 = *(_OWORD *)(a1 + 152);
  v8[6] = *(_OWORD *)(a1 + 136);
  v8[7] = v4;
  v5 = *(_OWORD *)(a1 + 56);
  v8[0] = *(_OWORD *)(a1 + 40);
  v8[1] = v5;
  v6 = *(_OWORD *)(a1 + 88);
  v8[2] = *(_OWORD *)(a1 + 72);
  v8[3] = v6;
  objc_msgSend(v2, "setTransform:", v8);

  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
}

- (void)resetDotConstraintsToDefault
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CKEffectPickerView effectDotConstraintsThatChange](self, "effectDotConstraintsThatChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
              -[CKEffectPickerView marginBetweenPickerDotButtons](self, "marginBetweenPickerDotButtons");
              objc_msgSend(v15, "setConstant:", -(v16 + 9.0));
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

}

- (void)_touchUpInsideDotButton:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CKEffectPickerView selectedIndex](self, "selectedIndex");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[CKEffectPickerView effectSendButtons](self, "effectSendButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "setHidden:", 1);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v8);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[CKEffectPickerView effectDotButtons](self, "effectDotButtons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "setHidden:", 0);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    }
    while (v13);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v39 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * k), "setHidden:", 0);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    }
    while (v18);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[CKEffectPickerView effectDescriptiveLabels](self, "effectDescriptiveLabels", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v35;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * m), "setHidden:", 1);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
    }
    while (v23);
  }

  -[CKEffectPickerView effectDotButtons](self, "effectDotButtons");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "indexOfObject:", v4);

  -[CKEffectPickerView effectSendButtons](self, "effectSendButtons");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndex:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerView _animateInSendButton:](self, "_animateInSendButton:", v29);
  -[CKEffectPickerView _animateSelectedEffectLabelAtIndex:fromPreviousIndex:](self, "_animateSelectedEffectLabelAtIndex:fromPreviousIndex:", v27, v5);
  -[CKEffectPickerView setSelectedIndex:](self, "setSelectedIndex:", v27);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && v5 != v27)
  {
    -[CKEffectPickerView effectSendButtons](self, "effectSendButtons");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndex:", v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "setHidden:", 0);
    -[CKEffectPickerView _animateOutSendButton:](self, "_animateOutSendButton:", v31);

  }
  objc_msgSend(v4, "setHidden:", 1);
  -[CKEffectPickerView _updateBalloonViewPositionAnimated:](self, "_updateBalloonViewPositionAnimated:", 1);
  -[CKEffectPickerView effectIdentifiers](self, "effectIdentifiers");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndex:", v27);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView startAnimationPreviewForIdentifier:](self, "startAnimationPreviewForIdentifier:", v33);

}

- (void)startAnimationPreviewForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKEffectPickerView balloonView](self, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "subviews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  if (v5)
  {
    objc_msgSend(v5, "setInvisibleInkEffectEnabled:", objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.invisibleink")));
    objc_msgSend(v5, "prepareForDisplayIfNeeded");
    -[CKEffectPickerView _defaultSendAnimationContextForAnimationPreview](self, "_defaultSendAnimationContextForAnimationPreview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setThrowBalloonViews:", v12);

    v13 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAnimatableTextViews:", v14);

    if (!v7)
    objc_msgSend(v11, "setImpactIdentifier:", v4);
    -[CKEffectPickerView dummyAnimator](self, "dummyAnimator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "beginAnimationWithSendAnimationContext:", v11);

  }
}

- (void)_applicationDidEnterBackground
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CKEffectPickerView fsem](self, "fsem", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[CKEffectPickerView animationTimers](self, "animationTimers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[CKEffectPickerView animatedCells](self, "animatedCells");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[CKEffectPickerView removeAnimationTimerForCell:](self, "removeAnimationTimerForCell:", v13);
          -[CKEffectPickerView pausedAnimatedCells](self, "pausedAnimatedCells");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v13, v9);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)_applicationWillEnterForeground
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CKEffectPickerView pausedAnimatedCells](self, "pausedAnimatedCells", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        -[CKEffectPickerView pausedAnimatedCells](self, "pausedAnimatedCells");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "animate");
        -[CKEffectPickerView addAnimationTimerForCell:](self, "addAnimationTimerForCell:", v10);
        -[CKEffectPickerView pausedAnimatedCells](self, "pausedAnimatedCells");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (id)_defaultSendAnimationContextForAnimationPreview
{
  CKSendAnimationContext *v2;

  v2 = objc_alloc_init(CKSendAnimationContext);
  -[CKSendAnimationContext setIsSender:](v2, "setIsSender:", 1);
  -[CKSendAnimationContext setShouldRepeat:](v2, "setShouldRepeat:", 0);
  return v2;
}

- (void)_accessibilityContrastStatusDidChange
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
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
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t k;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t m;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  if (UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityDarkerSystemColorsEnabled())
  {
    -[CKEffectPickerView pageControl](self, "pageControl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", 0);

    -[CKEffectPickerView mainLabel](self, "mainLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", 0);

    -[CKEffectPickerView momentTitleLabel](self, "momentTitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilters:", 0);

    -[CKEffectPickerView closeButton](self, "closeButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", 0);

    -[CKEffectPickerView typeSegmentedControl](self, "typeSegmentedControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilters:", 0);

    -[CKEffectPickerView roundedView](self, "roundedView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCompositingFilter:", 0);

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    -[CKEffectPickerView effectLabels](self, "effectLabels");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v89;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v89 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "layer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setFilters:", 0);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
      }
      while (v17);
    }

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    -[CKEffectPickerView effectDescriptiveLabels](self, "effectDescriptiveLabels", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v85;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v85 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * j), "layer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setFilters:", 0);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
      }
      while (v23);
    }

    -[CKEffectPickerView accessibilityBackdropView](self, "accessibilityBackdropView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      v28 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "theme");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "fsmPickerBackgroundColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setBackgroundColor:", v31);

      -[CKEffectPickerView setAccessibilityBackdropView:](self, "setAccessibilityBackdropView:", v28);
      -[CKEffectPickerView accessibilityBackdropView](self, "accessibilityBackdropView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerView peekContainer](self, "peekContainer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v32, v33);

    }
    -[CKEffectPickerView accessibilityCloseBackgroundView](self, "accessibilityCloseBackgroundView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      v35 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "theme");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "fsmPickerSecondaryColor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setBackgroundColor:", v38);

      -[CKEffectPickerView setAccessibilityCloseBackgroundView:](self, "setAccessibilityCloseBackgroundView:", v35);
      -[CKEffectPickerView peekContainer](self, "peekContainer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerView accessibilityCloseBackgroundView](self, "accessibilityCloseBackgroundView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerView closeButton](self, "closeButton");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "insertSubview:belowSubview:", v40, v41);

    }
    -[CKEffectPickerView accessibilitySendBackgroundView](self, "accessibilitySendBackgroundView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
      v43 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "theme");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "fsmPickerBackgroundColor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setBackgroundColor:", v46);

      -[CKEffectPickerView setAccessibilitySendBackgroundView:](self, "setAccessibilitySendBackgroundView:", v43);
      -[CKEffectPickerView peekContainer](self, "peekContainer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerView accessibilitySendBackgroundView](self, "accessibilitySendBackgroundView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerView sendMomentButton](self, "sendMomentButton");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "insertSubview:belowSubview:", v48, v49);

    }
    -[CKEffectPickerView accessibilityBackdropView](self, "accessibilityBackdropView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setHidden:", 0);

    -[CKEffectPickerView accessibilitySendBackgroundView](self, "accessibilitySendBackgroundView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setHidden:", 0);

    -[CKEffectPickerView accessibilityCloseBackgroundView](self, "accessibilityCloseBackgroundView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setHidden:", 0);

    -[CKEffectPickerView backdrop](self, "backdrop");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setHidden:", 1);

    -[CKEffectPickerView blueContrastLayer](self, "blueContrastLayer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setHidden:", 1);
  }
  else
  {
    -[CKEffectPickerView blueContrastLayer](self, "blueContrastLayer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setHidden:", 0);

    -[CKEffectPickerView backdrop](self, "backdrop");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setHidden:", 0);

    -[CKEffectPickerView accessibilityBackdropView](self, "accessibilityBackdropView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setHidden:", 1);

    -[CKEffectPickerView accessibilitySendBackgroundView](self, "accessibilitySendBackgroundView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setHidden:", 1);

    -[CKEffectPickerView accessibilityCloseBackgroundView](self, "accessibilityCloseBackgroundView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setHidden:", 1);

    -[CKEffectPickerView pageControl](self, "pageControl");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    setUpVibrancyForLayer(v61, 0, 0, -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

    -[CKEffectPickerView mainLabel](self, "mainLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    setUpVibrancyForLayer(v63, 0, !-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"), -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

    -[CKEffectPickerView momentTitleLabel](self, "momentTitleLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "layer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    setUpVibrancyForLayer(v65, 0, !-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"), -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

    -[CKEffectPickerView closeButton](self, "closeButton");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "layer");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    setUpVibrancyForLayer(v67, 0, !-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"), -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

    -[CKEffectPickerView typeSegmentedControl](self, "typeSegmentedControl");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "layer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    setUpVibrancyForLayer(v69, 0, !-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"), -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

    -[CKEffectPickerView roundedView](self, "roundedView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "layer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setCompositingFilter:", v72);

    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    -[CKEffectPickerView effectLabels](self, "effectLabels");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v97;
      do
      {
        for (k = 0; k != v75; ++k)
        {
          if (*(_QWORD *)v97 != v76)
            objc_enumerationMutation(v73);
          objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * k), "layer");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          setUpVibrancyForLayer(v78, 0, !-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"), -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
      }
      while (v75);
    }

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    -[CKEffectPickerView effectDescriptiveLabels](self, "effectDescriptiveLabels");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v93;
      do
      {
        for (m = 0; m != v80; ++m)
        {
          if (*(_QWORD *)v93 != v81)
            objc_enumerationMutation(v54);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * m), "layer");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          setUpVibrancyForLayer(v83, 0, !-[CKEffectPickerView isInDarkMode](self, "isInDarkMode"), -[CKEffectPickerView isInDarkMode](self, "isInDarkMode"));

        }
        v80 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
      }
      while (v80);
    }
  }

  -[CKEffectPickerView updateViewColors](self, "updateViewColors");
  -[CKEffectPickerView setNeedsLayout](self, "setNeedsLayout");
}

- (CKEffectPickerViewDelegate)delegate
{
  return (CKEffectPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)hintContainer
{
  return self->_hintContainer;
}

- (void)setHintContainer:(id)a3
{
  objc_storeStrong((id *)&self->_hintContainer, a3);
}

- (UIView)peekContainer
{
  return self->_peekContainer;
}

- (void)setPeekContainer:(id)a3
{
  objc_storeStrong((id *)&self->_peekContainer, a3);
}

- (CABackdropLayer)backdrop
{
  return self->_backdrop;
}

- (void)setBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_backdrop, a3);
}

- (CALayer)blueContrastLayer
{
  return self->_blueContrastLayer;
}

- (void)setBlueContrastLayer:(id)a3
{
  objc_storeStrong((id *)&self->_blueContrastLayer, a3);
}

- (CKFullScreenEffectManager)fsem
{
  return self->_fsem;
}

- (void)setFsem:(id)a3
{
  objc_storeStrong((id *)&self->_fsem, a3);
}

- (NSArray)momentIdentifiers
{
  return self->_momentIdentifiers;
}

- (void)setMomentIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSMutableDictionary)animationTimers
{
  return self->_animationTimers;
}

- (void)setAnimationTimers:(id)a3
{
  objc_storeStrong((id *)&self->_animationTimers, a3);
}

- (NSMutableDictionary)animatedCells
{
  return self->_animatedCells;
}

- (void)setAnimatedCells:(id)a3
{
  objc_storeStrong((id *)&self->_animatedCells, a3);
}

- (NSMutableDictionary)pausedAnimatedCells
{
  return self->_pausedAnimatedCells;
}

- (void)setPausedAnimatedCells:(id)a3
{
  objc_storeStrong((id *)&self->_pausedAnimatedCells, a3);
}

- (char)controlColor
{
  return self->_controlColor;
}

- (void)setControlColor:(char)a3
{
  self->_controlColor = a3;
}

- (void)setEffectLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_effectLabelFont, a3);
}

- (UICollectionView)momentsCollectionView
{
  return self->_momentsCollectionView;
}

- (void)setMomentsCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_momentsCollectionView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)roundedView
{
  return self->_roundedView;
}

- (void)setRoundedView:(id)a3
{
  objc_storeStrong((id *)&self->_roundedView, a3);
}

- (NSLayoutConstraint)typeSegmentedControlBottomConstraint
{
  return self->_typeSegmentedControlBottomConstraint;
}

- (void)setTypeSegmentedControlBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_typeSegmentedControlBottomConstraint, a3);
}

- (NSLayoutConstraint)mainLabelBottomConstraint
{
  return self->_mainLabelBottomConstraint;
}

- (void)setMainLabelBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_mainLabelBottomConstraint, a3);
}

- (NSLayoutConstraint)lastEffectDotTopConstraint
{
  return self->_lastEffectDotTopConstraint;
}

- (void)setLastEffectDotTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_lastEffectDotTopConstraint, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (CKChatControllerDummyAnimator)dummyAnimator
{
  return self->_dummyAnimator;
}

- (void)setDummyAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_dummyAnimator, a3);
}

- (BOOL)needsSwitcherAnimation
{
  return self->_needsSwitcherAnimation;
}

- (void)setNeedsSwitcherAnimation:(BOOL)a3
{
  self->_needsSwitcherAnimation = a3;
}

- (BOOL)isInDarkMode
{
  return self->_isInDarkMode;
}

- (void)setIsInDarkMode:(BOOL)a3
{
  self->_isInDarkMode = a3;
}

- (UIView)hintBlackText
{
  return self->_hintBlackText;
}

- (void)setHintBlackText:(id)a3
{
  objc_storeStrong((id *)&self->_hintBlackText, a3);
}

- (UIView)hintSendButton
{
  return self->_hintSendButton;
}

- (void)setHintSendButton:(id)a3
{
  objc_storeStrong((id *)&self->_hintSendButton, a3);
}

- (CGPoint)balloonViewOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_balloonViewOrigin.x;
  y = self->_balloonViewOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBalloonViewOrigin:(CGPoint)a3
{
  self->_balloonViewOrigin = a3;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (BOOL)usesDarkVibrancyForLayers
{
  return self->_usesDarkVibrancyForLayers;
}

- (void)setUsesDarkVibrancyForLayers:(BOOL)a3
{
  self->_usesDarkVibrancyForLayers = a3;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (UIView)roundedContainerView
{
  return self->_roundedContainerView;
}

- (void)setRoundedContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_roundedContainerView, a3);
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_balloonView, a3);
}

- (NSMutableArray)effectLabels
{
  return self->_effectLabels;
}

- (void)setEffectLabels:(id)a3
{
  objc_storeStrong((id *)&self->_effectLabels, a3);
}

- (NSMutableDictionary)effectDotConstraintsThatChange
{
  return self->_effectDotConstraintsThatChange;
}

- (void)setEffectDotConstraintsThatChange:(id)a3
{
  objc_storeStrong((id *)&self->_effectDotConstraintsThatChange, a3);
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  self->_selectedIndex = a3;
}

- (NSMutableArray)effectDotButtons
{
  return self->_effectDotButtons;
}

- (void)setEffectDotButtons:(id)a3
{
  objc_storeStrong((id *)&self->_effectDotButtons, a3);
}

- (NSMutableArray)effectDescriptiveLabels
{
  return self->_effectDescriptiveLabels;
}

- (void)setEffectDescriptiveLabels:(id)a3
{
  objc_storeStrong((id *)&self->_effectDescriptiveLabels, a3);
}

- (NSMutableArray)effectSendButtons
{
  return self->_effectSendButtons;
}

- (void)setEffectSendButtons:(id)a3
{
  objc_storeStrong((id *)&self->_effectSendButtons, a3);
}

- (UIButton)sendMomentButton
{
  return self->_sendMomentButton;
}

- (void)setSendMomentButton:(id)a3
{
  objc_storeStrong((id *)&self->_sendMomentButton, a3);
}

- (void)setTypeSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_typeSegmentedControl, a3);
}

- (NSLayoutConstraint)roundedContainerViewTopConstraint
{
  return self->_roundedContainerViewTopConstraint;
}

- (void)setRoundedContainerViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_roundedContainerViewTopConstraint, a3);
}

- (NSLayoutConstraint)closeButtonBottomConstraint
{
  return self->_closeButtonBottomConstraint;
}

- (void)setCloseButtonBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_closeButtonBottomConstraint, a3);
}

- (NSMutableArray)effectIdentifiers
{
  return self->_effectIdentifiers;
}

- (void)setEffectIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_effectIdentifiers, a3);
}

- (CABackdropLayer)segmentedBackdrop
{
  return self->_segmentedBackdrop;
}

- (void)setSegmentedBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedBackdrop, a3);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (void)setMainLabel:(id)a3
{
  objc_storeStrong((id *)&self->_mainLabel, a3);
}

- (UILabel)momentTitleLabel
{
  return self->_momentTitleLabel;
}

- (void)setMomentTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_momentTitleLabel, a3);
}

- (UIView)accessibilityBackdropView
{
  return self->_accessibilityBackdropView;
}

- (void)setAccessibilityBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityBackdropView, a3);
}

- (UIView)accessibilityCloseBackgroundView
{
  return self->_accessibilityCloseBackgroundView;
}

- (void)setAccessibilityCloseBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityCloseBackgroundView, a3);
}

- (UIView)accessibilitySendBackgroundView
{
  return self->_accessibilitySendBackgroundView;
}

- (void)setAccessibilitySendBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilitySendBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilitySendBackgroundView, 0);
  objc_storeStrong((id *)&self->_accessibilityCloseBackgroundView, 0);
  objc_storeStrong((id *)&self->_accessibilityBackdropView, 0);
  objc_storeStrong((id *)&self->_momentTitleLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_segmentedBackdrop, 0);
  objc_storeStrong((id *)&self->_effectIdentifiers, 0);
  objc_storeStrong((id *)&self->_closeButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_roundedContainerViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_typeSegmentedControl, 0);
  objc_storeStrong((id *)&self->_sendMomentButton, 0);
  objc_storeStrong((id *)&self->_effectSendButtons, 0);
  objc_storeStrong((id *)&self->_effectDescriptiveLabels, 0);
  objc_storeStrong((id *)&self->_effectDotButtons, 0);
  objc_storeStrong((id *)&self->_effectDotConstraintsThatChange, 0);
  objc_storeStrong((id *)&self->_effectLabels, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_roundedContainerView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_hintSendButton, 0);
  objc_storeStrong((id *)&self->_hintBlackText, 0);
  objc_storeStrong((id *)&self->_dummyAnimator, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_lastEffectDotTopConstraint, 0);
  objc_storeStrong((id *)&self->_mainLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_typeSegmentedControlBottomConstraint, 0);
  objc_storeStrong((id *)&self->_roundedView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_momentsCollectionView, 0);
  objc_storeStrong((id *)&self->_effectLabelFont, 0);
  objc_storeStrong((id *)&self->_pausedAnimatedCells, 0);
  objc_storeStrong((id *)&self->_animatedCells, 0);
  objc_storeStrong((id *)&self->_animationTimers, 0);
  objc_storeStrong((id *)&self->_momentIdentifiers, 0);
  objc_storeStrong((id *)&self->_fsem, 0);
  objc_storeStrong((id *)&self->_blueContrastLayer, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_peekContainer, 0);
  objc_storeStrong((id *)&self->_hintContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
