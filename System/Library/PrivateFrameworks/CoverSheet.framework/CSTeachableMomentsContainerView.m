@implementation CSTeachableMomentsContainerView

- (void)statusBarManager:(id)a3 didUpdateAvoidanceFrameForStatusBar:(id)a4 withAnimationSettings:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  _QWORD v15[7];
  CGRect v16;

  v7 = a5;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarToFollow);

  if (WeakRetained == v8
    && -[CSTeachableMomentsContainerView usesStatusBarRelativeLayoutForControlCenterTutors](self, "usesStatusBarRelativeLayoutForControlCenterTutors"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15[5] = 0;
      v15[6] = 0;
      v11 = v7;
      objc_msgSend(v11, "stiffness");
      objc_msgSend(v11, "damping");

      convertTensionAndFrictionToDampingRatioAndResponse();
      objc_msgSend(v10, "setDampingRatio:", 0.0);
      objc_msgSend(v10, "setResponse:", 0.0);
    }
    -[CSTeachableMomentsContainerView controlCenterGrabberContainerView](self, "controlCenterGrabberContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v13 = CGRectEqualToRect(v16, *MEMORY[0x1E0C9D648]);

    if (v13)
      v14 = 2;
    else
      v14 = 3;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __110__CSTeachableMomentsContainerView_statusBarManager_didUpdateAvoidanceFrameForStatusBar_withAnimationSettings___block_invoke;
    v15[3] = &unk_1E8E2DB38;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", v10, v14, v15, 0);

  }
}

- (CSTeachableMomentsContainerView)initWithFrame:(CGRect)a3
{
  CSTeachableMomentsContainerView *v3;
  CSTeachableMomentsContainerView *v4;
  void *v5;
  SBLockScreenDefaults *v6;
  SBLockScreenDefaults *lockScreenDefaults;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CSTeachableMomentsContainerView;
  v3 = -[CSTeachableMomentsContainerView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (!v3)
    return v4;
  -[CSTeachableMomentsContainerView _addCallToActionLabel](v3, "_addCallToActionLabel");
  -[CSTeachableMomentsContainerView _addControlCenterTutors](v4, "_addControlCenterTutors");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__preferredTextSizeChanged_, *MEMORY[0x1E0CEB3F0], 0);

  v6 = (SBLockScreenDefaults *)objc_alloc_init(MEMORY[0x1E0DA9FA8]);
  lockScreenDefaults = v4->_lockScreenDefaults;
  v4->_lockScreenDefaults = v6;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v10 = v9 & 0xFFFFFFFFFFFFFFFBLL;
  v11 = 1;
  v12 = SBFEffectiveArtworkSubtype();
  if (v12 > 2795)
  {
    if (v12 != 2796 && v12 != 2868)
      goto LABEL_8;
  }
  else if (v12 != 2556 && v12 != 2622)
  {
LABEL_8:
    v11 = 0;
  }
  if (v10 == 1)
    v13 = 1;
  else
    v13 = v11;
  v4->_adjustsControlCenterTutorsVisibilityForAvailableSpace = v11;
  v4->_usesStatusBarRelativeLayoutForControlCenterTutors = v13;
  v4->_usesStatusBarRelativeLayoutForControlCenterTutorsY = v11;
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSTeachableMomentsContainerView;
  -[CSTeachableMomentsContainerView layoutSubviews](&v3, sel_layoutSubviews);
  -[CSTeachableMomentsContainerView _layoutHomeAffordanceContainer](self, "_layoutHomeAffordanceContainer");
  -[CSTeachableMomentsContainerView _layoutCallToActionLabel](self, "_layoutCallToActionLabel");
  -[CSTeachableMomentsContainerView _layoutControlCenterGrabberAndGlyph](self, "_layoutControlCenterGrabberAndGlyph");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSTeachableMomentsContainerView;
  -[SBFTouchPassThroughView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDescendantOfView:", self->_homeAffordanceView))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (id)presentationRegions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSRegion regionForCoordinateSpace:](CSRegion, "regionForCoordinateSpace:", self->_homeAffordanceView);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v5);
  return v3;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[CSTeachableMomentsContainerView _updateViewsForLegibilitySettings](self, "_updateViewsForLegibilitySettings");
  }

}

- (void)_updateViewsForLegibilitySettings
{
  void *v3;
  UIView *controlCenterGrabberView;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;

  -[CSTeachableMomentsContainerView callToActionLabel](self, "callToActionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLegibilitySettings:", self->_legibilitySettings);

  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  controlCenterGrabberView = self->_controlCenterGrabberView;
  objc_msgSend(v10, "colorWithAlphaComponent:", 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](controlCenterGrabberView, "setBackgroundColor:", v5);

  -[UIImageView setTintColor:](self->_controlCenterGlyphView, "setTintColor:", v10);
  v6 = -[_UILegibilitySettings style](self->_legibilitySettings, "style");
  -[CSPropertyAnimatingTouchPassThroughView layer](self->_controlCenterGrabberContainerView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_QWORD *)MEMORY[0x1E0CD2E98];
  if (v6 == 1)
    v8 = (_QWORD *)MEMORY[0x1E0CD2EA0];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v9);

}

uint64_t __110__CSTeachableMomentsContainerView_statusBarManager_didUpdateAvoidanceFrameForStatusBar_withAnimationSettings___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setStatusBarToFollow:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarToFollow);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusBarManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sbf_removeObserver:", self);

    objc_storeWeak((id *)&self->_statusBarToFollow, obj);
    objc_msgSend(obj, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "statusBarManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sbf_addObserver:", self);

    -[CSTeachableMomentsContainerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)createCallToActionLabel
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0DAC5D8]);
  -[CSTeachableMomentsContainerView _callToActionLabelFont](self, "_callToActionLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "setNumberOfLines:", 0);
  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "bs_setHitTestingDisabled:", 1);
  objc_msgSend(v3, "setStrength:", 0.3);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("call-to-action-label"));
  return v3;
}

- (void)setCallToActionLabel:(id)a3
{
  SBUILegibilityLabel *v5;
  SBUILegibilityLabel *callToActionLabel;
  void *v7;
  SBUILegibilityLabel *v8;

  v5 = (SBUILegibilityLabel *)a3;
  callToActionLabel = self->_callToActionLabel;
  v8 = v5;
  if (callToActionLabel != v5)
  {
    -[SBUILegibilityLabel removeFromSuperview](callToActionLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_callToActionLabel, a3);
    -[SBUILegibilityLabel setLegibilitySettings:](self->_callToActionLabel, "setLegibilitySettings:", self->_legibilitySettings);
    -[CSTeachableMomentsContainerView callToActionLabelContainerView](self, "callToActionLabelContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[CSTeachableMomentsContainerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_addCallToActionLabel
{
  id v3;
  id v4;

  if (SBFEffectiveHomeButtonType() == 2)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v4, "setAlpha:", 0.0);
    -[CSTeachableMomentsContainerView addSubview:](self, "addSubview:", v4);
    -[CSTeachableMomentsContainerView setCallToActionLabelContainerView:](self, "setCallToActionLabelContainerView:", v4);
    v3 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[CSTeachableMomentsContainerView addSubview:](self, "addSubview:", v3);
    -[CSTeachableMomentsContainerView setCallToActionLabelPositionPlaceholderView:](self, "setCallToActionLabelPositionPlaceholderView:", v3);

  }
}

- (void)_addControlCenterTutors
{
  void *v2;
  void *v3;
  void *v5;
  CSPropertyAnimatingTouchPassThroughView *v6;
  id v7;
  id v8;
  id v9;
  int v10;
  char v11;
  __CFString *v12;
  int v13;
  char v14;
  __CFString *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  if ((-[SBLockScreenDefaults weDontNeedNoEducation](self->_lockScreenDefaults, "weDontNeedNoEducation") & 1) == 0)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v22, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    -[CSTeachableMomentsContainerView addSubview:](self, "addSubview:", v22);
    -[CSTeachableMomentsContainerView setControlCenterTutorsContainerView:](self, "setControlCenterTutorsContainerView:", v22);
    v6 = objc_alloc_init(CSPropertyAnimatingTouchPassThroughView);
    -[CSPropertyAnimatingTouchPassThroughView setAlpha:](v6, "setAlpha:", 0.5);
    objc_msgSend(v22, "addSubview:", v6);
    -[CSTeachableMomentsContainerView setControlCenterGrabberContainerView:](self, "setControlCenterGrabberContainerView:", v6);
    v7 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[CSPropertyAnimatingTouchPassThroughView addSubview:](v6, "addSubview:", v7);
    -[CSTeachableMomentsContainerView setControlCenterGrabberView:](self, "setControlCenterGrabberView:", v7);
    v8 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v22, "addSubview:", v8);
    -[CSTeachableMomentsContainerView setControlCenterGrabberPositionPlaceholderView:](self, "setControlCenterGrabberPositionPlaceholderView:", v8);
    v9 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v22, "addSubview:", v9);
    -[CSTeachableMomentsContainerView setControlCenterGlyphContainerView:](self, "setControlCenterGlyphContainerView:", v9);
    v10 = __sb__runningInSpringBoard();
    v11 = v10;
    if (v10)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v12 = CFSTR("CC-affordance");
LABEL_19:
        v17 = (void *)MEMORY[0x1E0CEA638];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "imageNamed:inBundle:", v12, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "imageWithRenderingMode:", 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v20);
        objc_msgSend(v9, "addSubview:", v21);
        -[CSTeachableMomentsContainerView setControlCenterGlyphView:](self, "setControlCenterGlyphView:", v21);

        return;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "userInterfaceIdiom"))
      {
        v12 = CFSTR("CC-affordance");
LABEL_18:

        goto LABEL_19;
      }
    }
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v13 = __sb__runningInSpringBoard();
      v14 = v13;
      if (v13)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v15 = CFSTR("CC-affordance");
      if (v16 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
        v15 = CFSTR("CC-affordance-big-d33-n84");
      v12 = v15;
      if ((v14 & 1) == 0)

    }
    else
    {
      v12 = CFSTR("CC-affordance");
    }
    if ((v11 & 1) != 0)
      goto LABEL_19;
    goto LABEL_18;
  }
}

- (void)_layoutHomeAffordanceContainer
{
  id v3;

  -[CSTeachableMomentsContainerView homeAffordanceContainerView](self, "homeAffordanceContainerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CSTeachableMomentsContainerView bounds](self, "bounds");
    objc_msgSend(v3, "setFrame:");
  }

}

- (void)_layoutCallToActionLabel
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
  double v19;
  double v20;
  id v21;

  -[CSTeachableMomentsContainerView callToActionLabelContainerView](self, "callToActionLabelContainerView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[CSTeachableMomentsContainerView callToActionLabelPositionPlaceholderView](self, "callToActionLabelPositionPlaceholderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSTeachableMomentsContainerView callToActionLabel](self, "callToActionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSTeachableMomentsContainerView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v21, "setFrame:");
  objc_msgSend(v4, "sizeThatFits:", 159.0, 1.79769313e308);
  v10 = v9;
  BSRectWithSize();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = v6 * 0.5;
  v20 = v8 - v10 * 0.5 + -11.0;
  objc_msgSend(v4, "setBounds:", v11, v13);
  objc_msgSend(v4, "setCenter:", v19, v20);
  objc_msgSend(v3, "setBounds:", v12, v14, v16, v18);
  objc_msgSend(v3, "setCenter:", v19, v20 + -33.0);

}

- (void)_layoutControlCenterGrabberAndGlyph
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
  void *v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  void *v27;
  double v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  double v38;
  double v39;
  int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  unsigned int v47;
  int v48;
  uint64_t v49;
  int v50;
  unsigned int v51;
  int v52;
  int v53;
  unsigned int v54;
  int v55;
  int v56;
  int v57;
  double v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  double v66;
  double v67;
  int v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CSTeachableMomentsContainerView *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  id v82;
  int v83;
  int v84;
  uint64_t v85;
  double v86;
  uint64_t v87;
  int v88;
  int v89;
  unsigned int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  double v96;
  int v97;
  double v98;
  int v99;
  double v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  double v106;
  double v107;
  int v108;
  double v109;
  double v110;
  double v111;
  double v112;
  uint64_t v113;
  CGFloat MidX;
  double v115;
  double v116;
  void *v117;
  void *v118;
  double MinY;
  int v120;
  unint64_t v121;
  int v122;
  unsigned int v123;
  uint64_t v124;
  int v125;
  unsigned int v126;
  int v127;
  int v128;
  int v129;
  double v130;
  int v131;
  int v132;
  int v133;
  int v134;
  double v135;
  int v136;
  double v137;
  int v138;
  double v139;
  double v140;
  double v141;
  double v142;
  void *v143;
  double v144;
  double v145;
  int v146;
  double v147;
  int v148;
  double v149;
  int v150;
  double v151;
  double v152;
  double v153;
  int v154;
  double v155;
  int v156;
  double v157;
  int v158;
  double v159;
  double v160;
  double v161;
  int v162;
  double v163;
  double v164;
  double v165;
  double v166;
  int v167;
  double v168;
  int v169;
  int v170;
  int v171;
  double v172;
  double v173;
  int v174;
  int v175;
  double v176;
  int v177;
  int v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  int v184;
  double v185;
  int v186;
  double v187;
  int v188;
  double v189;
  double v190;
  int v191;
  double v192;
  int v193;
  int v194;
  int v195;
  double v196;
  int v197;
  int v198;
  double v199;
  int v200;
  double v201;
  double v202;
  int v203;
  double v204;
  double v205;
  double v206;
  double v207;
  int v208;
  double v209;
  int v210;
  int v211;
  double v212;
  int v213;
  int v214;
  double v215;
  int v216;
  double v217;
  double v218;
  int v219;
  int v220;
  int v221;
  double v222;
  int v223;
  double v224;
  double v225;
  double v226;
  double v227;
  int v228;
  double v229;
  int v230;
  double v231;
  int v232;
  double v233;
  int v234;
  int v235;
  double v236;
  int v237;
  int v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  int v244;
  double v245;
  double v246;
  double v247;
  double v248;
  int v249;
  int v250;
  int v251;
  double v252;
  int v253;
  int v254;
  int v255;
  int v256;
  int v257;
  double v258;
  int v259;
  double v260;
  double v261;
  double v262;
  int v263;
  int v264;
  int v265;
  int v266;
  int v267;
  int v268;
  double v269;
  int v270;
  double v271;
  uint64_t v272;
  double v273;
  double v274;
  double v275;
  double v276;
  int v277;
  int v278;
  int v279;
  int v280;
  double v281;
  uint64_t v282;
  double v283;
  double v284;
  double v285;
  int v286;
  double v287;
  uint64_t v288;
  double v289;
  int v290;
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
  int v343;
  int v344;
  int v345;
  uint64_t v346;
  uint64_t v347;
  unint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  _BYTE v406[48];
  id v407;
  id v408;
  int v409;
  unint64_t v410;
  unsigned int v411;
  int v412;
  CSTeachableMomentsContainerView *v413;
  _BYTE v414[9];
  CGRect v415;
  CGRect v416;
  CGRect v417;

  v413 = self;
  -[CSTeachableMomentsContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CSTeachableMomentsContainerView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");

  v414[0] = 0;
  -[CSTeachableMomentsContainerView controlCenterTutorsContainerView](self, "controlCenterTutorsContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  -[CSTeachableMomentsContainerView controlCenterGrabberContainerView](self, "controlCenterGrabberContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSTeachableMomentsContainerView controlCenterGrabberView](self, "controlCenterGrabberView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSTeachableMomentsContainerView controlCenterGrabberPositionPlaceholderView](self, "controlCenterGrabberPositionPlaceholderView");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = __sb__runningInSpringBoard();
  v17 = 0x1E0CEA000uLL;
  v407 = v14;
  v408 = v13;
  *(_QWORD *)&v406[40] = v15;
  if (v16)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v18 = 0;
      v19 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v342, "userInterfaceIdiom") != 1)
    {
      v18 = 0;
      v19 = 1;
      goto LABEL_10;
    }
  }
  v19 = v16 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v333 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v333, "_referenceBounds");
    }
    v18 = v20 ^ 1;
    BSSizeRoundForScale();
    if (v42 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v41 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v411 = v20 ^ 1;
      v412 = v19;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v346 = 0;
      v350 = 0;
      v354 = 0;
      v358 = 0;
      v362 = 0;
      v366 = 0;
      v370 = 0;
      v374 = 0;
      v382 = 0;
      v386 = 0;
      v378 = 0;
      v390 = 0;
      v394 = 0;
      v398 = 0;
      v402 = 0;
      memset(v406, 0, 40);
      v410 = 0;
      v409 = 0;
      v38 = 61.0;
      goto LABEL_64;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_10:
  v21 = __sb__runningInSpringBoard();
  v411 = v18;
  v412 = v19;
  if (v21)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v22 = 0;
      v23 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v341 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v341, "userInterfaceIdiom") != 1)
    {
      v22 = 0;
      v23 = 1;
      goto LABEL_19;
    }
  }
  v23 = v21 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v332, "_referenceBounds");
    }
    v22 = v20 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v409 = v20 ^ 1;
      v410 = v23;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v346 = 0;
      v350 = 0;
      v354 = 0;
      v358 = 0;
      v362 = 0;
      v366 = 0;
      v370 = 0;
      v374 = 0;
      v382 = 0;
      v386 = 0;
      v378 = 0;
      v390 = 0;
      v394 = 0;
      v398 = 0;
      v402 = 0;
      memset(v406, 0, 40);
      v38 = 61.0;
      goto LABEL_64;
    }
  }
  else
  {
    v22 = 0;
  }
LABEL_19:
  v24 = __sb__runningInSpringBoard();
  v409 = v22;
  LODWORD(v410) = v23;
  if (v24)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_DWORD *)&v406[8] = 0;
      v25 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v340, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v406[8] = 0;
      v25 = 1;
      goto LABEL_28;
    }
  }
  v25 = v24 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v331 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v331, "_referenceBounds");
    }
    *(_DWORD *)&v406[8] = v20 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      HIDWORD(v410) = v25;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v346 = 0;
      v350 = 0;
      v354 = 0;
      v358 = 0;
      v362 = 0;
      v366 = 0;
      v370 = 0;
      v374 = 0;
      v382 = 0;
      v386 = 0;
      v378 = 0;
      v390 = 0;
      v394 = 0;
      v398 = 0;
      v402 = 0;
      *(_QWORD *)v406 = 0;
      memset(&v406[12], 0, 28);
      v38 = 61.0;
      goto LABEL_64;
    }
  }
  else
  {
    *(_DWORD *)&v406[8] = 0;
  }
LABEL_28:
  v26 = __sb__runningInSpringBoard();
  HIDWORD(v410) = v25;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v406[32] = 0;
      goto LABEL_37;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v339 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v339, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)&v406[32] = 0x100000000;
      goto LABEL_37;
    }
  }
  *(_DWORD *)&v406[36] = v26 ^ 1;
  v20 = __sb__runningInSpringBoard();
  if ((_DWORD)v20)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v336, "_referenceBounds");
  }
  *(_DWORD *)&v406[32] = v20 ^ 1;
  BSSizeRoundForScale();
  if (v28 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v346 = 0;
    v350 = 0;
    v354 = 0;
    v358 = 0;
    v362 = 0;
    v366 = 0;
    v370 = 0;
    v374 = 0;
    v382 = 0;
    v386 = 0;
    v378 = 0;
    v390 = 0;
    v394 = 0;
    v398 = 0;
    v402 = 0;
    *(_QWORD *)v406 = 0;
    memset(&v406[12], 0, 20);
    v38 = 61.0;
    goto LABEL_64;
  }
LABEL_37:
  v29 = __sb__runningInSpringBoard();
  if (v29)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v406[24] = 0;
      goto LABEL_47;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v338, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v406[24] = 0;
      *(_DWORD *)&v406[28] = 1;
      goto LABEL_47;
    }
  }
  *(_DWORD *)&v406[28] = v29 ^ 1;
  v20 = __sb__runningInSpringBoard();
  if ((_DWORD)v20)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v334 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v334, "_referenceBounds");
  }
  *(_DWORD *)&v406[24] = v20 ^ 1;
  BSSizeRoundForScale();
  if (v39 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v346 = 0;
    v350 = 0;
    v354 = 0;
    v358 = 0;
    v362 = 0;
    v366 = 0;
    v370 = 0;
    v374 = 0;
    v382 = 0;
    v386 = 0;
    v378 = 0;
    v390 = 0;
    v394 = 0;
    v398 = 0;
    v402 = 0;
    *(_QWORD *)v406 = 0;
    *(_QWORD *)&v406[12] = 0;
    *(_DWORD *)&v406[20] = 0;
    v38 = 61.0;
    goto LABEL_64;
  }
LABEL_47:
  v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v406[16] = 0;
      goto LABEL_388;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v337 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v337, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v406[16] = 0;
      *(_DWORD *)&v406[20] = 1;
      goto LABEL_388;
    }
  }
  *(_DWORD *)&v406[20] = v40 ^ 1;
  v20 = __sb__runningInSpringBoard();
  if ((_DWORD)v20)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v330 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v330, "_referenceBounds");
  }
  *(_DWORD *)&v406[16] = v20 ^ 1;
  BSSizeRoundForScale();
  if (v96 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v346 = 0;
    v350 = 0;
    v354 = 0;
    v358 = 0;
    v362 = 0;
    v366 = 0;
    v370 = 0;
    v374 = 0;
    v382 = 0;
    v386 = 0;
    v378 = 0;
    v390 = 0;
    v394 = 0;
    v398 = 0;
    v402 = 0;
    *(_QWORD *)v406 = 0;
    *(_DWORD *)&v406[12] = 0;
    v38 = 61.0;
    goto LABEL_64;
  }
LABEL_388:
  v20 = __sb__runningInSpringBoard();
  if ((_DWORD)v20)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_390;
LABEL_396:
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v346 = 0;
    v350 = 0;
    v354 = 0;
    v358 = 0;
    v362 = 0;
    v366 = 0;
    v370 = 0;
    v374 = 0;
    v382 = 0;
    v386 = 0;
    v378 = 0;
    v390 = 0;
    v394 = 0;
    v398 = 0;
    v402 = 0;
    *(_QWORD *)v406 = 0;
    v38 = 61.0;
    *(_DWORD *)&v406[12] = v20 ^ 1;
    goto LABEL_64;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v335, "userInterfaceIdiom") == 1)
    goto LABEL_396;
LABEL_390:
  *(_DWORD *)&v406[12] = v20 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_394:
    *(_QWORD *)v406 = 0;
    goto LABEL_763;
  }
  v97 = __sb__runningInSpringBoard();
  if (v97)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_394;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v328, "userInterfaceIdiom"))
    {
      *(_QWORD *)v406 = 0x100000000;
      goto LABEL_763;
    }
  }
  *(_DWORD *)&v406[4] = v97 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v321 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v321, "_referenceBounds");
    }
    *(_DWORD *)v406 = v20 ^ 1;
    BSSizeRoundForScale();
    if (v151 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v346 = 0;
      v350 = 0;
      v354 = 0;
      v358 = 0;
      v362 = 0;
      v366 = 0;
      v370 = 0;
      v374 = 0;
      v382 = 0;
      v386 = 0;
      v378 = 0;
      v390 = 0;
      v394 = 0;
      v398 = 0;
      v402 = 0;
      v38 = 53.3333;
      goto LABEL_833;
    }
  }
  else
  {
    *(_DWORD *)v406 = 0;
  }
LABEL_763:
  v20 = __sb__runningInSpringBoard();
  if ((_DWORD)v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v398) = 0;
      HIDWORD(v402) = 0;
      goto LABEL_773;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v329, "userInterfaceIdiom"))
    {
      HIDWORD(v398) = 0;
      HIDWORD(v402) = 1;
      goto LABEL_773;
    }
  }
  HIDWORD(v402) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v324, "_referenceBounds");
    }
    HIDWORD(v398) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v147 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_777;
  }
  else
  {
    HIDWORD(v398) = 0;
  }
LABEL_773:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v346 = 0;
    v350 = 0;
    v354 = 0;
    v358 = 0;
    v362 = 0;
    v366 = 0;
    v370 = 0;
    v374 = 0;
    v382 = 0;
    v386 = 0;
    v378 = 0;
    v390 = 0;
    v394 = 0;
    LODWORD(v398) = 0;
    LODWORD(v402) = 0;
    v38 = 53.3333;
LABEL_833:
    v17 = 0x1E0CEA000;
    goto LABEL_64;
  }
LABEL_777:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_781:
    LODWORD(v398) = 0;
    LODWORD(v402) = 0;
    goto LABEL_821;
  }
  v148 = __sb__runningInSpringBoard();
  if (v148)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_781;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v325, "userInterfaceIdiom"))
    {
      LODWORD(v398) = 0;
      LODWORD(v402) = 1;
      goto LABEL_821;
    }
  }
  LODWORD(v402) = v148 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v316, "_referenceBounds");
    }
    LODWORD(v398) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v163 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v346 = 0;
      v350 = 0;
      v354 = 0;
      v358 = 0;
      v362 = 0;
      v366 = 0;
      v370 = 0;
      v374 = 0;
      v382 = 0;
      v386 = 0;
      v378 = 0;
      v390 = 0;
      v394 = 0;
      v38 = 60.0;
      goto LABEL_833;
    }
  }
  else
  {
    LODWORD(v398) = 0;
  }
LABEL_821:
  v20 = __sb__runningInSpringBoard();
  if ((_DWORD)v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v382) = 0;
      HIDWORD(v394) = 0;
      goto LABEL_831;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v327 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v327, "userInterfaceIdiom"))
    {
      HIDWORD(v382) = 0;
      HIDWORD(v394) = 1;
      goto LABEL_831;
    }
  }
  HIDWORD(v394) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v320, "_referenceBounds");
    }
    HIDWORD(v382) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v153 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_836;
  }
  else
  {
    HIDWORD(v382) = 0;
  }
LABEL_831:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v346 = 0;
    v350 = 0;
    v354 = 0;
    v358 = 0;
    v362 = 0;
    v366 = 0;
    v370 = 0;
    v374 = 0;
    v386 = 0;
    v390 = 0;
    v378 = 0;
    LODWORD(v382) = 0;
    LODWORD(v394) = 0;
    v38 = 60.0;
    goto LABEL_833;
  }
LABEL_836:
  v154 = __sb__runningInSpringBoard();
  if (v154)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v390) = 0;
      LODWORD(v394) = 0;
      goto LABEL_846;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v326, "userInterfaceIdiom"))
    {
      HIDWORD(v390) = 0;
      LODWORD(v394) = 1;
      goto LABEL_846;
    }
  }
  LODWORD(v394) = v154 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v317 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v317, "_referenceBounds");
    }
    HIDWORD(v390) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v159 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v346 = 0;
      v350 = 0;
      v354 = 0;
      v358 = 0;
      v362 = 0;
      v366 = 0;
      v370 = 0;
      v374 = 0;
      v386 = 0;
      v378 = 0;
      LODWORD(v382) = 0;
      LODWORD(v390) = 0;
      v38 = 53.3333;
      goto LABEL_833;
    }
  }
  else
  {
    HIDWORD(v390) = 0;
  }
LABEL_846:
  v20 = __sb__runningInSpringBoard();
  if ((_DWORD)v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v382) = 0;
      LODWORD(v390) = 0;
      goto LABEL_915;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v323, "userInterfaceIdiom"))
    {
      LODWORD(v382) = 0;
      LODWORD(v390) = 1;
      goto LABEL_915;
    }
  }
  LODWORD(v390) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v315, "_referenceBounds");
    }
    LODWORD(v382) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v166 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_965;
  }
  else
  {
    LODWORD(v382) = 0;
  }
LABEL_915:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v346 = 0;
    v350 = 0;
    v354 = 0;
    v358 = 0;
    v362 = 0;
    v366 = 0;
    v370 = 0;
    v374 = 0;
    v386 = 0;
    v378 = 0;
    v38 = 53.3333;
    goto LABEL_833;
  }
LABEL_965:
  v167 = __sb__runningInSpringBoard();
  if (v167)
  {
    v17 = 0x1E0CEA000uLL;
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v378) = 0;
      HIDWORD(v386) = 0;
      goto LABEL_983;
    }
  }
  else
  {
    v17 = 0x1E0CEA000uLL;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v322, "userInterfaceIdiom"))
    {
      HIDWORD(v378) = 0;
      HIDWORD(v386) = 1;
      goto LABEL_983;
    }
  }
  HIDWORD(v386) = v167 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v170 = __sb__runningInSpringBoard();
    if (v170)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v312, "_referenceBounds");
    }
    v20 = v170 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v378) = v20;
    if (v180 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v346 = 0;
      v350 = 0;
      v354 = 0;
      v358 = 0;
      v362 = 0;
      v366 = 0;
      v370 = 0;
      v374 = 0;
      LODWORD(v386) = 0;
      LODWORD(v378) = 0;
      v38 = 52.0;
      goto LABEL_64;
    }
  }
  else
  {
    HIDWORD(v378) = 0;
  }
LABEL_983:
  v20 = __sb__runningInSpringBoard();
  if ((_DWORD)v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v386) = 0;
      LODWORD(v378) = 0;
      goto LABEL_1040;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v319, "userInterfaceIdiom"))
    {
      LODWORD(v386) = 0;
      LODWORD(v378) = 1;
      goto LABEL_1040;
    }
  }
  LODWORD(v378) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v311 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v311, "_referenceBounds");
    }
    LODWORD(v386) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v183 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1112;
  }
  else
  {
    LODWORD(v386) = 0;
  }
LABEL_1040:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v346 = 0;
    v350 = 0;
    v354 = 0;
    v358 = 0;
    v362 = 0;
    v366 = 0;
    v370 = 0;
    v374 = 0;
    v38 = 0.0;
    goto LABEL_64;
  }
LABEL_1112:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1116:
    HIDWORD(v358) = 0;
    LODWORD(v374) = 0;
    goto LABEL_1181;
  }
  v184 = __sb__runningInSpringBoard();
  if (v184)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1116;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v314, "userInterfaceIdiom"))
    {
      HIDWORD(v358) = 0;
      LODWORD(v374) = 1;
      goto LABEL_1181;
    }
  }
  LODWORD(v374) = v184 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v195 = __sb__runningInSpringBoard();
    if (v195)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v305, "_referenceBounds");
    }
    v20 = v195 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v358) = v20;
    if (v205 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v346 = 0;
      v350 = 0;
      v354 = 0;
      LODWORD(v358) = 0;
      v362 = 0;
      v366 = 0;
      v370 = 0;
      HIDWORD(v374) = 0;
      v38 = 47.6666;
      goto LABEL_833;
    }
  }
  else
  {
    HIDWORD(v358) = 0;
  }
LABEL_1181:
  v20 = __sb__runningInSpringBoard();
  if ((_DWORD)v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v370) = 0;
      HIDWORD(v374) = 0;
      goto LABEL_1191;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v318, "userInterfaceIdiom"))
    {
      HIDWORD(v370) = 0;
      HIDWORD(v374) = 1;
      goto LABEL_1191;
    }
  }
  HIDWORD(v374) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v308, "_referenceBounds");
    }
    HIDWORD(v370) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v196 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_1195;
  }
  else
  {
    HIDWORD(v370) = 0;
  }
LABEL_1191:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v346 = 0;
    v350 = 0;
    v354 = 0;
    LODWORD(v358) = 0;
    v362 = 0;
    v366 = 0;
    LODWORD(v370) = 0;
    v38 = 47.6666;
    goto LABEL_833;
  }
LABEL_1195:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1199:
    HIDWORD(v366) = 0;
    LODWORD(v370) = 0;
    goto LABEL_1270;
  }
  v197 = __sb__runningInSpringBoard();
  if (v197)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1199;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v309, "userInterfaceIdiom"))
    {
      HIDWORD(v366) = 0;
      LODWORD(v370) = 1;
      goto LABEL_1270;
    }
  }
  LODWORD(v370) = v197 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v301, "_referenceBounds");
    }
    HIDWORD(v366) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v224 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v346 = 0;
      v350 = 0;
      v354 = 0;
      LODWORD(v358) = 0;
      v362 = 0;
      LODWORD(v366) = 0;
      v38 = 55.0;
      goto LABEL_833;
    }
  }
  else
  {
    HIDWORD(v366) = 0;
  }
LABEL_1270:
  v20 = __sb__runningInSpringBoard();
  if ((_DWORD)v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v362) = 0;
      LODWORD(v366) = 0;
      goto LABEL_1280;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v313, "userInterfaceIdiom"))
    {
      HIDWORD(v362) = 0;
      LODWORD(v366) = 1;
      goto LABEL_1280;
    }
  }
  LODWORD(v366) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v304, "_referenceBounds");
    }
    HIDWORD(v362) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v209 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1284;
  }
  else
  {
    HIDWORD(v362) = 0;
  }
LABEL_1280:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v346 = 0;
    v350 = 0;
    v354 = 0;
    LODWORD(v358) = 0;
    LODWORD(v362) = 0;
    v38 = 55.0;
    goto LABEL_833;
  }
LABEL_1284:
  v210 = __sb__runningInSpringBoard();
  if (v210)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v358) = 0;
      LODWORD(v362) = 0;
      goto LABEL_1294;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v310, "userInterfaceIdiom"))
    {
      LODWORD(v358) = 0;
      LODWORD(v362) = 1;
      goto LABEL_1294;
    }
  }
  LODWORD(v362) = v210 ^ 1;
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
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v302, "_referenceBounds");
    }
    v20 = v211 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v358) = v20;
    if (v217 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v346 = 0;
      v350 = 0;
      v354 = 0;
      v38 = 52.0;
      goto LABEL_833;
    }
  }
  else
  {
    LODWORD(v358) = 0;
  }
LABEL_1294:
  v20 = __sb__runningInSpringBoard();
  if ((_DWORD)v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v354 = 0;
      goto LABEL_1363;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v307, "userInterfaceIdiom"))
    {
      v354 = 0x100000000;
      goto LABEL_1363;
    }
  }
  HIDWORD(v354) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v300, "_referenceBounds");
    }
    LODWORD(v354) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v227 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1413;
  }
  else
  {
    LODWORD(v354) = 0;
  }
LABEL_1363:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v346 = 0;
    v350 = 0;
    v38 = 0.0;
    goto LABEL_833;
  }
LABEL_1413:
  v228 = __sb__runningInSpringBoard();
  if (v228)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v350 = 0;
      goto LABEL_1431;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v306, "userInterfaceIdiom"))
    {
      v350 = 0x100000000;
      goto LABEL_1431;
    }
  }
  HIDWORD(v350) = v228 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v299, "_referenceBounds");
    }
    LODWORD(v350) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v240 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v346 = 0;
      v38 = 47.6666;
      goto LABEL_833;
    }
  }
  else
  {
    LODWORD(v350) = 0;
  }
LABEL_1431:
  v20 = __sb__runningInSpringBoard();
  if ((_DWORD)v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v346 = 0;
      goto LABEL_1494;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v303, "userInterfaceIdiom"))
    {
      v346 = 0x100000000;
      goto LABEL_1494;
    }
  }
  HIDWORD(v346) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v298, "_referenceBounds");
    }
    LODWORD(v346) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v245 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1564;
  }
  else
  {
    LODWORD(v346) = 0;
  }
LABEL_1494:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 47.6666;
    goto LABEL_833;
  }
LABEL_1564:
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 53.0;
    goto LABEL_833;
  }
  v17 = 0x1E0CEA000uLL;
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 53.0;
    goto LABEL_64;
  }
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 46.0;
    goto LABEL_64;
  }
  v257 = __sb__runningInSpringBoard();
  if (v257)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v36 = 0;
      v37 = 0;
      goto LABEL_1681;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v297 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v297, "userInterfaceIdiom"))
    {
      v36 = 0;
      v37 = 1;
      goto LABEL_1681;
    }
  }
  v37 = v257 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v293, "_referenceBounds");
    }
    v36 = v20 ^ 1;
    BSSizeRoundForScale();
    if (v273 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v38 = 46.0;
      goto LABEL_64;
    }
  }
  else
  {
    v36 = 0;
  }
LABEL_1681:
  v264 = __sb__runningInSpringBoard();
  if (v264)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v34 = 0;
      v35 = 0;
      goto LABEL_1703;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v296, "userInterfaceIdiom"))
    {
      v34 = 0;
      v35 = 1;
      goto LABEL_1703;
    }
  }
  v35 = v264 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v20 = __sb__runningInSpringBoard();
    if ((_DWORD)v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v292, "_referenceBounds");
    }
    v34 = v20 ^ 1;
    BSSizeRoundForScale();
    if (v275 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v38 = 0.0;
      goto LABEL_64;
    }
  }
  else
  {
    v34 = 0;
  }
LABEL_1703:
  v20 = __sb__runningInSpringBoard();
  if (!(_DWORD)v20)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v295, "userInterfaceIdiom"))
    {
      v32 = 0;
      v33 = 1;
      goto LABEL_1723;
    }
LABEL_1719:
    v33 = v20 ^ 1;
    v268 = __sb__runningInSpringBoard();
    if (v268)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v294, "_referenceBounds");
    }
    v32 = v268 ^ 1;
    BSSizeRoundForScale();
    if (v269 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      goto LABEL_1726;
    goto LABEL_1723;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_1719;
  v32 = 0;
  v33 = 0;
LABEL_1723:
  v270 = __sb__runningInSpringBoard();
  if (v270)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1726:
      v30 = 0;
      v31 = 0;
      v38 = 0.0;
      goto LABEL_833;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v20 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v20, "userInterfaceIdiom"))
    {
      v30 = 0;
      v38 = 0.0;
      v31 = 1;
      goto LABEL_833;
    }
  }
  v31 = v270 ^ 1;
  v277 = __sb__runningInSpringBoard();
  if (v277)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v291, "_referenceBounds");
  }
  v30 = v277 ^ 1;
  BSSizeRoundForScale();
  v38 = 0.0;
  v17 = 0x1E0CEA000;
  v27 = v291;
LABEL_64:
  if (v30)

  if (v31)
  if (v32)

  if (v33)
  if (v34)
  {

    if (!(_DWORD)v35)
      goto LABEL_74;
  }
  else if (!(_DWORD)v35)
  {
LABEL_74:
    if (v36)
      goto LABEL_75;
LABEL_79:
    if (!v37)
      goto LABEL_81;
    goto LABEL_80;
  }

  if (!v36)
    goto LABEL_79;
LABEL_75:

  if (v37)
LABEL_80:

LABEL_81:
  if ((_DWORD)v346)

  if (HIDWORD(v346))
  if ((_DWORD)v350)

  if (HIDWORD(v350))
  if ((_DWORD)v354)

  if (HIDWORD(v354))
  if ((_DWORD)v358)

  if ((_DWORD)v362)
  if (HIDWORD(v362))

  if ((_DWORD)v366)
  if (HIDWORD(v366))

  if ((_DWORD)v370)
  if (HIDWORD(v370))

  if (HIDWORD(v374))
  if (HIDWORD(v358))

  if ((_DWORD)v374)
  if ((_DWORD)v386)

  if ((_DWORD)v378)
  if (HIDWORD(v378))

  if (HIDWORD(v386))
  if ((_DWORD)v382)

  if ((_DWORD)v390)
  if (HIDWORD(v390))

  if ((_DWORD)v394)
  if (HIDWORD(v382))

  if (HIDWORD(v394))
  if ((_DWORD)v398)

  if ((_DWORD)v402)
  if (HIDWORD(v398))

  if (HIDWORD(v402))
  if (*(_DWORD *)v406)

  if (*(_DWORD *)&v406[4])
  if (*(_DWORD *)&v406[12])

  if (*(_DWORD *)&v406[16])
  if (*(_DWORD *)&v406[20])

  if (*(_DWORD *)&v406[24])
  if (*(_DWORD *)&v406[28])

  if (*(_DWORD *)&v406[32])
  if (*(_DWORD *)&v406[36])

  if (*(_DWORD *)&v406[8])
  {

    if (!HIDWORD(v410))
      goto LABEL_161;
  }
  else if (!HIDWORD(v410))
  {
LABEL_161:
    if (v409)
      goto LABEL_162;
    goto LABEL_168;
  }

  if (v409)
  {
LABEL_162:

    if (!(_DWORD)v410)
      goto LABEL_163;
    goto LABEL_169;
  }
LABEL_168:
  if (!(_DWORD)v410)
  {
LABEL_163:
    if (v411)
      goto LABEL_164;
LABEL_170:
    if (!v412)
      goto LABEL_172;
    goto LABEL_171;
  }
LABEL_169:

  if (!v411)
    goto LABEL_170;
LABEL_164:

  if (v412)
LABEL_171:

LABEL_172:
  if (BSFloatGreaterThanFloat())
    v45 = 2.33333333;
  else
    v45 = 2.5;
  v46 = __sb__runningInSpringBoard();
  if (v46)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v47 = 0;
      v48 = 0;
      goto LABEL_184;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v340, "userInterfaceIdiom") != 1)
    {
      v47 = 0;
      v48 = 1;
      goto LABEL_184;
    }
  }
  v48 = v46 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v341 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v341, "_referenceBounds");
    }
    v47 = v49 ^ 1;
    BSSizeRoundForScale();
    if (v70 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v69 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v411 = v49 ^ 1;
      v412 = v48;
      v399 = 0;
      v395 = 0;
      v403 = 0;
      v383 = 0;
      v391 = 0;
      memset(v406, 0, 40);
      v379 = 0;
      v387 = 0;
      v375 = 0;
      v371 = 0;
      v367 = 0;
      v363 = 0;
      v359 = 0;
      v355 = 0;
      v409 = 0;
      v410 = 0;
      v351 = 0;
      v347 = 0;
      v343 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 24.0;
      goto LABEL_238;
    }
  }
  else
  {
    v47 = 0;
  }
LABEL_184:
  v50 = __sb__runningInSpringBoard();
  v411 = v47;
  v412 = v48;
  if (v50)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v51 = 0;
      v52 = 0;
      goto LABEL_193;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v339 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v339, "userInterfaceIdiom") != 1)
    {
      v51 = 0;
      v52 = 1;
      goto LABEL_193;
    }
  }
  v52 = v50 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v331 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v331, "_referenceBounds");
    }
    v51 = v49 ^ 1;
    BSSizeRoundForScale();
    if (v71 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      *(_DWORD *)&v406[32] = v49 ^ 1;
      *(_DWORD *)&v406[36] = v52;
      v399 = 0;
      v395 = 0;
      v403 = 0;
      v383 = 0;
      v391 = 0;
      memset(v406, 0, 32);
      v379 = 0;
      v387 = 0;
      v375 = 0;
      v371 = 0;
      v367 = 0;
      v363 = 0;
      v359 = 0;
      v355 = 0;
      v409 = 0;
      v410 = 0;
      v351 = 0;
      v347 = 0;
      v343 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 26.0;
      goto LABEL_238;
    }
  }
  else
  {
    v51 = 0;
  }
LABEL_193:
  v53 = __sb__runningInSpringBoard();
  *(_QWORD *)&v406[32] = __PAIR64__(v52, v51);
  if (v53)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v54 = 0;
      v55 = 0;
      goto LABEL_202;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v338, "userInterfaceIdiom") != 1)
    {
      v54 = 0;
      v55 = 1;
      goto LABEL_202;
    }
  }
  v55 = v53 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v330 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v330, "_referenceBounds");
    }
    v54 = v49 ^ 1;
    BSSizeRoundForScale();
    if (v72 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      LODWORD(v410) = v49 ^ 1;
      HIDWORD(v410) = v55;
      v399 = 0;
      v395 = 0;
      v403 = 0;
      v383 = 0;
      v391 = 0;
      memset(v406, 0, 32);
      v379 = 0;
      v387 = 0;
      v375 = 0;
      v371 = 0;
      v367 = 0;
      v363 = 0;
      v359 = 0;
      v355 = 0;
      v409 = 0;
      v347 = 0;
      v351 = 0;
      v343 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 26.0;
      goto LABEL_238;
    }
  }
  else
  {
    v54 = 0;
  }
LABEL_202:
  v56 = __sb__runningInSpringBoard();
  v410 = __PAIR64__(v55, v54);
  if (v56)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_DWORD *)&v406[28] = 0;
      v57 = 0;
      goto LABEL_211;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v337 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v337, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v406[28] = 0;
      v57 = 1;
      goto LABEL_211;
    }
  }
  v57 = v56 ^ 1;
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v334 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v334, "_referenceBounds");
  }
  *(_DWORD *)&v406[28] = v49 ^ 1;
  BSSizeRoundForScale();
  if (v58 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v409 = v57;
    v399 = 0;
    v395 = 0;
    v403 = 0;
    v383 = 0;
    v391 = 0;
    memset(v406, 0, 28);
    v379 = 0;
    v387 = 0;
    v375 = 0;
    v371 = 0;
    v367 = 0;
    v363 = 0;
    v359 = 0;
    v351 = 0;
    v355 = 0;
    v347 = 0;
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 24.0;
    goto LABEL_238;
  }
LABEL_211:
  v59 = __sb__runningInSpringBoard();
  v409 = v57;
  if (v59)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v406[20] = 0;
      goto LABEL_221;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v336, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)&v406[20] = 0x100000000;
      goto LABEL_221;
    }
  }
  *(_DWORD *)&v406[24] = v59 ^ 1;
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v332, "_referenceBounds");
  }
  *(_DWORD *)&v406[20] = v49 ^ 1;
  BSSizeRoundForScale();
  if (v67 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v399 = 0;
    v395 = 0;
    v403 = 0;
    v383 = 0;
    v391 = 0;
    memset(v406, 0, 20);
    v379 = 0;
    v387 = 0;
    v375 = 0;
    v371 = 0;
    v363 = 0;
    v367 = 0;
    v359 = 0;
    v351 = 0;
    v355 = 0;
    v347 = 0;
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 24.0;
    goto LABEL_238;
  }
LABEL_221:
  v68 = __sb__runningInSpringBoard();
  if (v68)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v406[12] = 0;
      goto LABEL_400;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v335 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v335, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)&v406[12] = 0x100000000;
      goto LABEL_400;
    }
  }
  *(_DWORD *)&v406[16] = v68 ^ 1;
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v329, "_referenceBounds");
  }
  *(_DWORD *)&v406[12] = v49 ^ 1;
  BSSizeRoundForScale();
  if (v98 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v399 = 0;
    v395 = 0;
    v403 = 0;
    v383 = 0;
    v391 = 0;
    *(_QWORD *)v406 = 0;
    v379 = 0;
    v387 = 0;
    *(_DWORD *)&v406[8] = 0;
    v371 = 0;
    v375 = 0;
    v359 = 0;
    v363 = 0;
    v367 = 0;
    v351 = 0;
    v355 = 0;
    v347 = 0;
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 24.0;
    goto LABEL_238;
  }
LABEL_400:
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_402;
LABEL_408:
    v399 = 0;
    v395 = 0;
    v403 = 0;
    v383 = 0;
    v391 = 0;
    *(_QWORD *)v406 = 0;
    v379 = 0;
    v387 = 0;
    v371 = 0;
    v375 = 0;
    v359 = 0;
    v363 = 0;
    v367 = 0;
    v351 = 0;
    v355 = 0;
    v347 = 0;
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 24.0;
    *(_DWORD *)&v406[8] = v49 ^ 1;
    goto LABEL_238;
  }
  objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v333, "userInterfaceIdiom") == 1)
    goto LABEL_408;
LABEL_402:
  v35 = (uint64_t)&qword_1D0490000;
  *(_DWORD *)&v406[8] = v49 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_406:
    *(_QWORD *)v406 = 0;
    goto LABEL_788;
  }
  v99 = __sb__runningInSpringBoard();
  if (v99)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_406;
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v327 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v327, "userInterfaceIdiom"))
    {
      *(_QWORD *)v406 = 0x100000000;
      goto LABEL_788;
    }
  }
  *(_DWORD *)&v406[4] = v99 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v320, "_referenceBounds");
    }
    *(_DWORD *)v406 = v49 ^ 1;
    BSSizeRoundForScale();
    if (v152 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v399 = 0;
      v395 = 0;
      v403 = 0;
      v383 = 0;
      v387 = 0;
      v391 = 0;
      v375 = 0;
      v379 = 0;
      v359 = 0;
      v363 = 0;
      v367 = 0;
      v371 = 0;
      v351 = 0;
      v355 = 0;
      v347 = 0;
      v343 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 38.6666;
      goto LABEL_238;
    }
  }
  else
  {
    *(_DWORD *)v406 = 0;
  }
LABEL_788:
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v399) = 0;
      HIDWORD(v403) = 0;
      goto LABEL_798;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v328, "userInterfaceIdiom"))
    {
      HIDWORD(v399) = 0;
      HIDWORD(v403) = 1;
      goto LABEL_798;
    }
  }
  HIDWORD(v403) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v323 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v323, "_referenceBounds");
    }
    HIDWORD(v399) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v149 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_802;
  }
  else
  {
    HIDWORD(v399) = 0;
  }
LABEL_798:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    LODWORD(v399) = 0;
    v395 = 0;
    LODWORD(v403) = 0;
    v383 = 0;
    v387 = 0;
    v391 = 0;
    v375 = 0;
    v379 = 0;
    v359 = 0;
    v363 = 0;
    v367 = 0;
    v371 = 0;
    v351 = 0;
    v355 = 0;
    v347 = 0;
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 38.6666;
    goto LABEL_238;
  }
LABEL_802:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_806:
    LODWORD(v399) = 0;
    LODWORD(v403) = 0;
    goto LABEL_856;
  }
  v150 = __sb__runningInSpringBoard();
  if (v150)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_806;
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v324, "userInterfaceIdiom"))
    {
      LODWORD(v399) = 0;
      LODWORD(v403) = 1;
      goto LABEL_856;
    }
  }
  LODWORD(v403) = v150 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v315, "_referenceBounds");
    }
    LODWORD(v399) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v164 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v395 = 0;
      v383 = 0;
      v387 = 0;
      v391 = 0;
      v375 = 0;
      v379 = 0;
      v359 = 0;
      v363 = 0;
      v367 = 0;
      v371 = 0;
      v351 = 0;
      v355 = 0;
      v347 = 0;
      v343 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 38.6666;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v399) = 0;
  }
LABEL_856:
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v395) = 0;
      HIDWORD(v383) = 0;
      goto LABEL_866;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v326, "userInterfaceIdiom"))
    {
      HIDWORD(v383) = 0;
      HIDWORD(v395) = 1;
      goto LABEL_866;
    }
  }
  HIDWORD(v395) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v319 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v319, "_referenceBounds");
    }
    HIDWORD(v383) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v155 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_870;
  }
  else
  {
    HIDWORD(v383) = 0;
  }
LABEL_866:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    LODWORD(v395) = 0;
    v387 = 0;
    v391 = 0;
    LODWORD(v383) = 0;
    v375 = 0;
    v379 = 0;
    v359 = 0;
    v363 = 0;
    v367 = 0;
    v371 = 0;
    v351 = 0;
    v355 = 0;
    v347 = 0;
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 38.6666;
    goto LABEL_238;
  }
LABEL_870:
  v156 = __sb__runningInSpringBoard();
  if (v156)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v395) = 0;
      HIDWORD(v391) = 0;
      goto LABEL_880;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v325, "userInterfaceIdiom"))
    {
      HIDWORD(v391) = 0;
      LODWORD(v395) = 1;
      goto LABEL_880;
    }
  }
  LODWORD(v395) = v156 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v316, "_referenceBounds");
    }
    HIDWORD(v391) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v160 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      LODWORD(v391) = 0;
      LODWORD(v383) = 0;
      v387 = 0;
      v375 = 0;
      v379 = 0;
      v359 = 0;
      v363 = 0;
      v367 = 0;
      v371 = 0;
      v351 = 0;
      v355 = 0;
      v347 = 0;
      v343 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 38.6666;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v391) = 0;
  }
LABEL_880:
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v391) = 0;
      LODWORD(v383) = 0;
      goto LABEL_921;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v322, "userInterfaceIdiom"))
    {
      LODWORD(v383) = 0;
      LODWORD(v391) = 1;
      goto LABEL_921;
    }
  }
  LODWORD(v391) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v314 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v314, "_referenceBounds");
    }
    LODWORD(v383) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v168 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_973;
  }
  else
  {
    LODWORD(v383) = 0;
  }
LABEL_921:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    v387 = 0;
    v375 = 0;
    v379 = 0;
    v359 = 0;
    v363 = 0;
    v367 = 0;
    v371 = 0;
    v351 = 0;
    v355 = 0;
    v347 = 0;
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 38.6666;
    goto LABEL_238;
  }
LABEL_973:
  v169 = __sb__runningInSpringBoard();
  if (v169)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v387) = 0;
      HIDWORD(v379) = 0;
      goto LABEL_993;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v321 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v321, "userInterfaceIdiom"))
    {
      HIDWORD(v379) = 0;
      HIDWORD(v387) = 1;
      goto LABEL_993;
    }
  }
  HIDWORD(v387) = v169 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v171 = __sb__runningInSpringBoard();
    if (v171)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v311 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v311, "_referenceBounds");
    }
    v49 = v171 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v379) = v49;
    if (v181 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      LODWORD(v379) = 0;
      LODWORD(v387) = 0;
      v371 = 0;
      v375 = 0;
      v359 = 0;
      v363 = 0;
      v367 = 0;
      v351 = 0;
      v355 = 0;
      v347 = 0;
      v343 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 39.0;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v379) = 0;
  }
LABEL_993:
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v379) = 0;
      LODWORD(v387) = 0;
      goto LABEL_1047;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v318, "userInterfaceIdiom"))
    {
      LODWORD(v387) = 0;
      LODWORD(v379) = 1;
      goto LABEL_1047;
    }
  }
  LODWORD(v379) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v310, "_referenceBounds");
    }
    LODWORD(v387) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v185 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1121;
  }
  else
  {
    LODWORD(v387) = 0;
  }
LABEL_1047:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v371 = 0;
    v375 = 0;
    v359 = 0;
    v363 = 0;
    v367 = 0;
    v351 = 0;
    v355 = 0;
    v347 = 0;
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0.0;
    goto LABEL_238;
  }
LABEL_1121:
  v35 = (uint64_t)&qword_1D0490000;
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1125:
    LODWORD(v375) = 0;
    HIDWORD(v359) = 0;
    goto LABEL_1206;
  }
  v186 = __sb__runningInSpringBoard();
  if (v186)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1125;
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v313, "userInterfaceIdiom"))
    {
      HIDWORD(v359) = 0;
      LODWORD(v375) = 1;
      goto LABEL_1206;
    }
  }
  LODWORD(v375) = v186 ^ 1;
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
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v304, "_referenceBounds");
    }
    v49 = v198 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v359) = v49;
    if (v206 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      HIDWORD(v375) = 0;
      v367 = 0;
      v371 = 0;
      v363 = 0;
      LODWORD(v359) = 0;
      v351 = 0;
      v355 = 0;
      v347 = 0;
      v343 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 39.0;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v359) = 0;
  }
LABEL_1206:
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v375) = 0;
      HIDWORD(v371) = 0;
      goto LABEL_1216;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v317, "userInterfaceIdiom"))
    {
      HIDWORD(v371) = 0;
      HIDWORD(v375) = 1;
      goto LABEL_1216;
    }
  }
  HIDWORD(v375) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v307 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v307, "_referenceBounds");
    }
    HIDWORD(v371) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v199 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_1220;
  }
  else
  {
    HIDWORD(v371) = 0;
  }
LABEL_1216:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v371) = 0;
    v363 = 0;
    v367 = 0;
    LODWORD(v359) = 0;
    v351 = 0;
    v355 = 0;
    v347 = 0;
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 39.0;
    goto LABEL_238;
  }
LABEL_1220:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1224:
    LODWORD(v371) = 0;
    HIDWORD(v367) = 0;
    goto LABEL_1304;
  }
  v200 = __sb__runningInSpringBoard();
  if (v200)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1224;
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v308 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v308, "userInterfaceIdiom"))
    {
      HIDWORD(v367) = 0;
      LODWORD(v371) = 1;
      goto LABEL_1304;
    }
  }
  LODWORD(v371) = v200 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v300, "_referenceBounds");
    }
    HIDWORD(v367) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v225 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v367) = 0;
      v363 = 0;
      LODWORD(v359) = 0;
      v351 = 0;
      v355 = 0;
      v347 = 0;
      v343 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 39.0;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v367) = 0;
  }
LABEL_1304:
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v367) = 0;
      HIDWORD(v363) = 0;
      goto LABEL_1314;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v312, "userInterfaceIdiom"))
    {
      HIDWORD(v363) = 0;
      LODWORD(v367) = 1;
      goto LABEL_1314;
    }
  }
  LODWORD(v367) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v303, "_referenceBounds");
    }
    HIDWORD(v363) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v212 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1318;
  }
  else
  {
    HIDWORD(v363) = 0;
  }
LABEL_1314:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v363) = 0;
    LODWORD(v359) = 0;
    v351 = 0;
    v355 = 0;
    v347 = 0;
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 39.0;
    goto LABEL_238;
  }
LABEL_1318:
  v213 = __sb__runningInSpringBoard();
  if (v213)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v363) = 0;
      LODWORD(v359) = 0;
      goto LABEL_1328;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v309, "userInterfaceIdiom"))
    {
      LODWORD(v359) = 0;
      LODWORD(v363) = 1;
      goto LABEL_1328;
    }
  }
  LODWORD(v363) = v213 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v214 = __sb__runningInSpringBoard();
    if (v214)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v301, "_referenceBounds");
    }
    v49 = v214 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v359) = v49;
    if (v218 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v351 = 0;
      v355 = 0;
      v347 = 0;
      v343 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 36.0;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v359) = 0;
  }
LABEL_1328:
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v355 = 0;
      goto LABEL_1369;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v306, "userInterfaceIdiom"))
    {
      v355 = 0x100000000;
      goto LABEL_1369;
    }
  }
  HIDWORD(v355) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v299, "_referenceBounds");
    }
    LODWORD(v355) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v229 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1421;
  }
  else
  {
    LODWORD(v355) = 0;
  }
LABEL_1369:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v347 = 0;
    v351 = 0;
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0.0;
    goto LABEL_238;
  }
LABEL_1421:
  v230 = __sb__runningInSpringBoard();
  if (v230)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v351 = 0;
      goto LABEL_1441;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v305, "userInterfaceIdiom"))
    {
      v351 = 0x100000000;
      goto LABEL_1441;
    }
  }
  HIDWORD(v351) = v230 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v298, "_referenceBounds");
    }
    LODWORD(v351) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v241 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v347 = 0;
      v343 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 39.0;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v351) = 0;
  }
LABEL_1441:
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v347 = 0;
      goto LABEL_1500;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v302, "userInterfaceIdiom"))
    {
      v347 = 0x100000000;
      goto LABEL_1500;
    }
  }
  HIDWORD(v347) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v297, "_referenceBounds");
    }
    LODWORD(v347) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v246 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1575;
  }
  else
  {
    LODWORD(v347) = 0;
  }
LABEL_1500:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 39.0;
    goto LABEL_238;
  }
LABEL_1575:
  v49 = (uint64_t)&off_1D048E000;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
    || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 41.0;
    goto LABEL_238;
  }
  v66 = 41.0;
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    v343 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    goto LABEL_238;
  }
  v49 = __sb__runningInSpringBoard();
  if ((_DWORD)v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v343 = 0;
      v60 = 0;
      goto LABEL_1691;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 1288), "currentDevice");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v296, "userInterfaceIdiom"))
    {
      v60 = 0;
      v343 = 1;
      goto LABEL_1691;
    }
  }
  v343 = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if ((_DWORD)v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v293, "_referenceBounds");
    }
    v60 = v49 ^ 1;
    BSSizeRoundForScale();
    if (v274 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 36.0;
      goto LABEL_238;
    }
  }
  else
  {
    v60 = 0;
  }
LABEL_1691:
  v265 = __sb__runningInSpringBoard();
  if (v265)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v61 = 0;
      v62 = 0;
      goto LABEL_1713;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v295, "userInterfaceIdiom"))
    {
      v62 = 0;
      v61 = 1;
      goto LABEL_1713;
    }
  }
  v61 = v265 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v266 = __sb__runningInSpringBoard();
    if (v266)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v292, "_referenceBounds");
    }
    v62 = v266 ^ 1;
    BSSizeRoundForScale();
    if (v276 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0.0;
      goto LABEL_238;
    }
  }
  else
  {
    v62 = 0;
  }
LABEL_1713:
  v267 = __sb__runningInSpringBoard();
  if (!v267)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v294, "userInterfaceIdiom"))
    {
      v64 = 0;
      v63 = 1;
      goto LABEL_1733;
    }
LABEL_1729:
    v63 = v267 ^ 1;
    v35 = __sb__runningInSpringBoard();
    if ((_DWORD)v35)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v49 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v49, "_referenceBounds");
    }
    v64 = v35 ^ 1;
    BSSizeRoundForScale();
    if (v271 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      goto LABEL_1736;
    goto LABEL_1733;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_1729;
  v63 = 0;
  v64 = 0;
LABEL_1733:
  v272 = __sb__runningInSpringBoard();
  if ((_DWORD)v272)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1736:
      v65 = 0;
      v66 = 0.0;
      goto LABEL_238;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v35 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v35, "userInterfaceIdiom"))
    {
      v66 = 0.0;
      v65 = 1;
      goto LABEL_238;
    }
  }
  v65 = v272 ^ 1;
  v278 = __sb__runningInSpringBoard();
  if (v278)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v272 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v272, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v66 = 0.0;
  if (v278 != 1)

LABEL_238:
  if (v65)

  v73 = v413;
  if (v64)

  v74 = v411;
  if (v63)

  v75 = HIDWORD(v410);
  if (v62)

  if (v61)
  if (v60)

  if (v343)
  if ((_DWORD)v347)

  if (HIDWORD(v347))
  if ((_DWORD)v351)

  if (HIDWORD(v351))
  if ((_DWORD)v355)

  if (HIDWORD(v355))
  if ((_DWORD)v359)

  if ((_DWORD)v363)
  if (HIDWORD(v363))

  if ((_DWORD)v367)
  if (HIDWORD(v367))

  if ((_DWORD)v371)
  if (HIDWORD(v371))

  if (HIDWORD(v375))
  if (HIDWORD(v359))

  if ((_DWORD)v375)
  if ((_DWORD)v387)

  if ((_DWORD)v379)
  if (HIDWORD(v379))

  if (HIDWORD(v387))
  if ((_DWORD)v383)

  if ((_DWORD)v391)
  if (HIDWORD(v391))

  if ((_DWORD)v395)
  if (HIDWORD(v383))

  if (HIDWORD(v395))
  if ((_DWORD)v399)

  if ((_DWORD)v403)
  if (HIDWORD(v399))

  if (HIDWORD(v403))
  if (*(_DWORD *)v406)

  if (*(_DWORD *)&v406[4])
  if (*(_DWORD *)&v406[8])

  if (*(_DWORD *)&v406[12])
  if (*(_DWORD *)&v406[16])

  if (*(_DWORD *)&v406[20])
  if (*(_DWORD *)&v406[24])

  if (*(_DWORD *)&v406[28])
  {

    if (!v409)
      goto LABEL_328;
  }
  else if (!v409)
  {
LABEL_328:
    if ((_DWORD)v410)
      goto LABEL_329;
    goto LABEL_345;
  }

  if ((_DWORD)v410)
  {
LABEL_329:

    if (!HIDWORD(v410))
      goto LABEL_330;
    goto LABEL_346;
  }
LABEL_345:
  if (!HIDWORD(v410))
  {
LABEL_330:
    if (!*(_DWORD *)&v406[32])
      goto LABEL_332;
    goto LABEL_331;
  }
LABEL_346:

  if (*(_DWORD *)&v406[32])
LABEL_331:

LABEL_332:
  if (*(_DWORD *)&v406[36])
  {

    if (!v411)
      goto LABEL_334;
  }
  else if (!v411)
  {
LABEL_334:
    if (!v412)
      goto LABEL_336;
    goto LABEL_335;
  }

  if (v412)
LABEL_335:

LABEL_336:
  if (!-[CSTeachableMomentsContainerView usesStatusBarRelativeLayoutForControlCenterTutors](v413, "usesStatusBarRelativeLayoutForControlCenterTutors"))
  {
    v83 = __sb__runningInSpringBoard();
    if (v83)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v84 = 0;
        v85 = 0;
        goto LABEL_361;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v339 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v339, "userInterfaceIdiom") != 1)
      {
        v85 = 0;
        v84 = 1;
        goto LABEL_361;
      }
    }
    v84 = v83 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v87 = __sb__runningInSpringBoard();
      if ((_DWORD)v87)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v340 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v340, "_referenceBounds");
      }
      v85 = v87 ^ 1;
      BSSizeRoundForScale();
      if (v110 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v109 == *(double *)(MEMORY[0x1E0DAB260] + 280))
      {
        v411 = v87 ^ 1;
        v412 = v84;
        v410 = 0;
        v409 = 0;
        memset(v406, 0, 40);
        v396 = 0;
        v388 = 0;
        v392 = 0;
        v404 = 0;
        v400 = 0;
        v380 = 0;
        v384 = 0;
        v372 = 0;
        v376 = 0;
        v364 = 0;
        v368 = 0;
        v356 = 0;
        v360 = 0;
        v348 = 0;
        v352 = 0;
        v344 = 0;
        LODWORD(v341) = 0;
        v102 = 0;
        v103 = 0;
        v75 = 0;
        v104 = 0;
        v105 = 0;
        v106 = 0.0;
        goto LABEL_441;
      }
    }
    else
    {
      v85 = 0;
    }
LABEL_361:
    v88 = __sb__runningInSpringBoard();
    v411 = v85;
    v412 = v84;
    if (v88)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v89 = 0;
        v90 = 0;
        goto LABEL_370;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v338 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v338, "userInterfaceIdiom") != 1)
      {
        v90 = 0;
        v89 = 1;
        goto LABEL_370;
      }
    }
    v89 = v88 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v87 = __sb__runningInSpringBoard();
      if ((_DWORD)v87)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v330 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v330, "_referenceBounds");
      }
      v90 = v87 ^ 1;
      BSSizeRoundForScale();
      if (v111 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
      {
        LODWORD(v410) = v87 ^ 1;
        HIDWORD(v410) = v89;
        v409 = 0;
        memset(v406, 0, 40);
        v396 = 0;
        v388 = 0;
        v392 = 0;
        v404 = 0;
        v400 = 0;
        v380 = 0;
        v384 = 0;
        v372 = 0;
        v376 = 0;
        v364 = 0;
        v368 = 0;
        v356 = 0;
        v360 = 0;
        v348 = 0;
        v352 = 0;
        v344 = 0;
        LODWORD(v341) = 0;
        v102 = 0;
        v103 = 0;
        v75 = 0;
        v104 = 0;
        v105 = 0;
        v106 = 0.0;
        goto LABEL_441;
      }
    }
    else
    {
      v90 = 0;
    }
LABEL_370:
    v91 = __sb__runningInSpringBoard();
    v410 = __PAIR64__(v89, v90);
    if (v91)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v92 = 0;
        v93 = 0;
        goto LABEL_379;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v337 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v337, "userInterfaceIdiom") != 1)
      {
        v93 = 0;
        v92 = 1;
        goto LABEL_379;
      }
    }
    v92 = v91 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v87 = __sb__runningInSpringBoard();
      if ((_DWORD)v87)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v329 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v329, "_referenceBounds");
      }
      v93 = v87 ^ 1;
      BSSizeRoundForScale();
      if (v112 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
      {
        *(_DWORD *)&v406[36] = v87 ^ 1;
        v409 = v92;
        memset(v406, 0, 36);
        v396 = 0;
        v388 = 0;
        v392 = 0;
        v404 = 0;
        v400 = 0;
        v380 = 0;
        v384 = 0;
        v372 = 0;
        v376 = 0;
        v364 = 0;
        v368 = 0;
        v356 = 0;
        v360 = 0;
        v348 = 0;
        v352 = 0;
        v344 = 0;
        LODWORD(v341) = 0;
        v102 = 0;
        v103 = 0;
        v75 = 0;
        v104 = 0;
        v105 = 0;
        v106 = 0.0;
        goto LABEL_441;
      }
    }
    else
    {
      v93 = 0;
    }
LABEL_379:
    v94 = __sb__runningInSpringBoard();
    v409 = v92;
    *(_DWORD *)&v406[36] = v93;
    if (v94)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v95 = 0;
        v74 = 0;
        goto LABEL_414;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v336, "userInterfaceIdiom") != 1)
      {
        v74 = 0;
        v95 = 1;
        goto LABEL_414;
      }
    }
    v95 = v94 ^ 1;
    v87 = __sb__runningInSpringBoard();
    if ((_DWORD)v87)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v333 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v333, "_referenceBounds");
    }
    v74 = v87 ^ 1;
    BSSizeRoundForScale();
    if (v100 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
    {
      *(_DWORD *)&v406[28] = v87 ^ 1;
      *(_DWORD *)&v406[32] = v95;
      memset(v406, 0, 28);
      v396 = 0;
      v388 = 0;
      v392 = 0;
      v404 = 0;
      v400 = 0;
      v380 = 0;
      v384 = 0;
      v372 = 0;
      v376 = 0;
      v364 = 0;
      v368 = 0;
      v356 = 0;
      v360 = 0;
      v348 = 0;
      v352 = 0;
      v344 = 0;
      LODWORD(v341) = 0;
      v102 = 0;
      v103 = 0;
      v75 = 0;
      v104 = 0;
      v105 = 0;
      v106 = 0.0;
      goto LABEL_441;
    }
LABEL_414:
    v101 = __sb__runningInSpringBoard();
    *(_DWORD *)&v406[28] = v74;
    *(_DWORD *)&v406[32] = v95;
    if (v101)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(_QWORD *)&v406[20] = 0;
        goto LABEL_424;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v335 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v335, "userInterfaceIdiom") != 1)
      {
        *(_DWORD *)&v406[20] = 0;
        *(_DWORD *)&v406[24] = 1;
        goto LABEL_424;
      }
    }
    *(_DWORD *)&v406[24] = v101 ^ 1;
    v87 = __sb__runningInSpringBoard();
    if ((_DWORD)v87)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v331 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v331, "_referenceBounds");
    }
    *(_DWORD *)&v406[20] = v87 ^ 1;
    BSSizeRoundForScale();
    if (v107 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
    {
      memset(v406, 0, 20);
      v396 = 0;
      v388 = 0;
      v392 = 0;
      v404 = 0;
      v400 = 0;
      v380 = 0;
      v384 = 0;
      v372 = 0;
      v376 = 0;
      v364 = 0;
      v368 = 0;
      v356 = 0;
      v360 = 0;
      v348 = 0;
      v352 = 0;
      v344 = 0;
      LODWORD(v341) = 0;
      v102 = 0;
      v103 = 0;
      v75 = 0;
      v104 = 0;
      v105 = 0;
      v106 = 0.0;
      goto LABEL_441;
    }
LABEL_424:
    v108 = __sb__runningInSpringBoard();
    if (v108)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(_QWORD *)&v406[12] = 0;
        goto LABEL_599;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v334 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v334, "userInterfaceIdiom") != 1)
      {
        *(_DWORD *)&v406[12] = 0;
        *(_DWORD *)&v406[16] = 1;
        goto LABEL_599;
      }
    }
    *(_DWORD *)&v406[16] = v108 ^ 1;
    v87 = __sb__runningInSpringBoard();
    if ((_DWORD)v87)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v328 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v328, "_referenceBounds");
    }
    *(_DWORD *)&v406[12] = v87 ^ 1;
    BSSizeRoundForScale();
    if (v135 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
    {
      *(_QWORD *)&v406[4] = 0;
      *(_DWORD *)v406 = 0;
      v396 = 0;
      v388 = 0;
      v392 = 0;
      v404 = 0;
      v400 = 0;
      v380 = 0;
      v384 = 0;
      v372 = 0;
      v376 = 0;
      v364 = 0;
      v368 = 0;
      v356 = 0;
      v360 = 0;
      v348 = 0;
      v352 = 0;
      v344 = 0;
      LODWORD(v341) = 0;
      v102 = 0;
      v103 = 0;
      v75 = 0;
      v104 = 0;
      v105 = 0;
      v106 = 0.0;
      goto LABEL_441;
    }
LABEL_599:
    v87 = __sb__runningInSpringBoard();
    if ((_DWORD)v87)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_601;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v332, "userInterfaceIdiom") != 1)
      {
LABEL_601:
        *(_DWORD *)&v406[8] = v87 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_605:
          *(_QWORD *)v406 = 0;
          goto LABEL_890;
        }
        v136 = __sb__runningInSpringBoard();
        if (v136)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_605;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v326 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v326, "userInterfaceIdiom"))
          {
            *(_DWORD *)v406 = 0;
            *(_DWORD *)&v406[4] = 1;
            goto LABEL_890;
          }
        }
        *(_DWORD *)&v406[4] = v136 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v87 = __sb__runningInSpringBoard();
          if ((_DWORD)v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v319 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v319, "_referenceBounds");
          }
          *(_DWORD *)v406 = v87 ^ 1;
          BSSizeRoundForScale();
          if (v165 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
          {
            v396 = 0;
            v388 = 0;
            v392 = 0;
            v404 = 0;
            v400 = 0;
            v380 = 0;
            v384 = 0;
            v372 = 0;
            v376 = 0;
            v364 = 0;
            v368 = 0;
            v356 = 0;
            v360 = 0;
            v348 = 0;
            v352 = 0;
            v344 = 0;
            LODWORD(v341) = 0;
            v102 = 0;
            v103 = 0;
            v75 = 0;
            v104 = 0;
            v105 = 0;
            v106 = 41.0;
            goto LABEL_441;
          }
        }
        else
        {
          *(_DWORD *)v406 = 0;
        }
LABEL_890:
        v87 = __sb__runningInSpringBoard();
        if ((_DWORD)v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v396) = 0;
            LODWORD(v392) = 0;
            goto LABEL_900;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v327 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v327, "userInterfaceIdiom"))
          {
            LODWORD(v392) = 0;
            LODWORD(v396) = 1;
            goto LABEL_900;
          }
        }
        LODWORD(v396) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v87 = __sb__runningInSpringBoard();
          if ((_DWORD)v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v322 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v322, "_referenceBounds");
          }
          LODWORD(v392) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v157 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
            goto LABEL_904;
        }
        else
        {
          LODWORD(v392) = 0;
        }
LABEL_900:
        if ((_SBF_Private_IsD94Like() & 1) != 0)
        {
          v404 = 0;
          v400 = 0;
          HIDWORD(v392) = 0;
          HIDWORD(v396) = 0;
          v384 = 0;
          v388 = 0;
          v376 = 0;
          v380 = 0;
          v364 = 0;
          v368 = 0;
          v372 = 0;
          v356 = 0;
          v360 = 0;
          v348 = 0;
          v352 = 0;
          v344 = 0;
          LODWORD(v341) = 0;
          v102 = 0;
          v103 = 0;
          v75 = 0;
          v104 = 0;
          v105 = 0;
          v106 = 41.0;
          goto LABEL_441;
        }
LABEL_904:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_908:
          v404 = 0;
          goto LABEL_1006;
        }
        v158 = __sb__runningInSpringBoard();
        if (v158)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_908;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v323 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v323, "userInterfaceIdiom"))
          {
            v404 = 0x100000000;
            goto LABEL_1006;
          }
        }
        HIDWORD(v404) = v158 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v87 = __sb__runningInSpringBoard();
          if ((_DWORD)v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v314 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v314, "_referenceBounds");
          }
          LODWORD(v404) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v182 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
          {
            v400 = 0;
            HIDWORD(v392) = 0;
            HIDWORD(v396) = 0;
            v384 = 0;
            v388 = 0;
            v376 = 0;
            v380 = 0;
            v364 = 0;
            v368 = 0;
            v372 = 0;
            v356 = 0;
            v360 = 0;
            v348 = 0;
            v352 = 0;
            v344 = 0;
            LODWORD(v341) = 0;
            v102 = 0;
            v103 = 0;
            v75 = 0;
            v104 = 0;
            v105 = 0;
            v106 = 48.666;
            goto LABEL_441;
          }
        }
        else
        {
          LODWORD(v404) = 0;
        }
LABEL_1006:
        v87 = __sb__runningInSpringBoard();
        if ((_DWORD)v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v400) = 0;
            HIDWORD(v392) = 0;
            goto LABEL_1016;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v325 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v325, "userInterfaceIdiom"))
          {
            HIDWORD(v392) = 0;
            HIDWORD(v400) = 1;
            goto LABEL_1016;
          }
        }
        HIDWORD(v400) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v87 = __sb__runningInSpringBoard();
          if ((_DWORD)v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v318 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v318, "_referenceBounds");
          }
          HIDWORD(v392) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v173 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
            goto LABEL_1020;
        }
        else
        {
          HIDWORD(v392) = 0;
        }
LABEL_1016:
        if ((_SBF_Private_IsD64Like() & 1) != 0)
        {
          LODWORD(v400) = 0;
          HIDWORD(v396) = 0;
          v384 = 0;
          v388 = 0;
          v376 = 0;
          v380 = 0;
          v364 = 0;
          v368 = 0;
          v372 = 0;
          v356 = 0;
          v360 = 0;
          v348 = 0;
          v352 = 0;
          v344 = 0;
          LODWORD(v341) = 0;
          v102 = 0;
          v103 = 0;
          v75 = 0;
          v104 = 0;
          v105 = 0;
          v106 = 48.666;
          goto LABEL_441;
        }
LABEL_1020:
        v174 = __sb__runningInSpringBoard();
        if (v174)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v400) = 0;
            HIDWORD(v396) = 0;
            goto LABEL_1030;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v324 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v324, "userInterfaceIdiom"))
          {
            HIDWORD(v396) = 0;
            LODWORD(v400) = 1;
            goto LABEL_1030;
          }
        }
        LODWORD(v400) = v174 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v175 = __sb__runningInSpringBoard();
          if (v175)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v315 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v315, "_referenceBounds");
          }
          v87 = v175 ^ 1u;
          BSSizeRoundForScale();
          HIDWORD(v396) = v87;
          if (v179 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
          {
            v384 = 0;
            v388 = 0;
            v376 = 0;
            v380 = 0;
            v364 = 0;
            v368 = 0;
            v372 = 0;
            v356 = 0;
            v360 = 0;
            v348 = 0;
            v352 = 0;
            v344 = 0;
            LODWORD(v341) = 0;
            v102 = 0;
            v103 = 0;
            v75 = 0;
            v104 = 0;
            v105 = 0;
            v106 = 41.0;
            goto LABEL_441;
          }
        }
        else
        {
          HIDWORD(v396) = 0;
        }
LABEL_1030:
        v87 = __sb__runningInSpringBoard();
        if ((_DWORD)v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v388 = 0;
            goto LABEL_1054;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v321, "userInterfaceIdiom"))
          {
            v388 = 0x100000000;
            goto LABEL_1054;
          }
        }
        HIDWORD(v388) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v87 = __sb__runningInSpringBoard();
          if ((_DWORD)v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v313 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v313, "_referenceBounds");
          }
          LODWORD(v388) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v187 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
            goto LABEL_1130;
        }
        else
        {
          LODWORD(v388) = 0;
        }
LABEL_1054:
        if ((_SBF_Private_IsD54() & 1) != 0)
        {
          v380 = 0;
          v384 = 0;
          v372 = 0;
          v376 = 0;
          v364 = 0;
          v368 = 0;
          v356 = 0;
          v360 = 0;
          v348 = 0;
          v352 = 0;
          v344 = 0;
          LODWORD(v341) = 0;
          v102 = 0;
          v103 = 0;
          v75 = 0;
          v104 = 0;
          v105 = 0;
          v106 = 41.0;
          goto LABEL_441;
        }
LABEL_1130:
        v188 = __sb__runningInSpringBoard();
        if (v188)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v384) = 0;
            LODWORD(v380) = 0;
            goto LABEL_1146;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v320 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v320, "userInterfaceIdiom"))
          {
            LODWORD(v380) = 0;
            HIDWORD(v384) = 1;
            goto LABEL_1146;
          }
        }
        HIDWORD(v384) = v188 ^ 1;
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
            v310 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v310, "_referenceBounds");
          }
          v87 = v191 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v380) = v87;
          if (v201 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            LODWORD(v384) = 0;
            HIDWORD(v380) = 0;
            v372 = 0;
            v376 = 0;
            v364 = 0;
            v368 = 0;
            v356 = 0;
            v360 = 0;
            v348 = 0;
            v352 = 0;
            v344 = 0;
            LODWORD(v341) = 0;
            v102 = 0;
            v103 = 0;
            v75 = 0;
            v104 = 0;
            v105 = 0;
            v106 = 31.0;
            goto LABEL_441;
          }
        }
        else
        {
          LODWORD(v380) = 0;
        }
LABEL_1146:
        v87 = __sb__runningInSpringBoard();
        if ((_DWORD)v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v384) = 0;
            HIDWORD(v380) = 0;
            goto LABEL_1164;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v317 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v317, "userInterfaceIdiom"))
          {
            HIDWORD(v380) = 0;
            LODWORD(v384) = 1;
            goto LABEL_1164;
          }
        }
        LODWORD(v384) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v87 = __sb__runningInSpringBoard();
          if ((_DWORD)v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v309 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v309, "_referenceBounds");
          }
          HIDWORD(v380) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v202 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
            goto LABEL_1240;
        }
        else
        {
          HIDWORD(v380) = 0;
        }
LABEL_1164:
        if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
        {
          v372 = 0;
          v376 = 0;
          v364 = 0;
          v368 = 0;
          v356 = 0;
          v360 = 0;
          v348 = 0;
          v352 = 0;
          v344 = 0;
          LODWORD(v341) = 0;
          v102 = 0;
          v103 = 0;
          v75 = 0;
          v104 = 0;
          v105 = 0;
          v106 = 0.0;
          goto LABEL_441;
        }
LABEL_1240:
        v74 = (uint64_t)&qword_1D0490000;
        if (!_SBF_Private_IsD93Like())
        {
LABEL_1244:
          HIDWORD(v376) = 0;
          HIDWORD(v364) = 0;
          goto LABEL_1338;
        }
        v203 = __sb__runningInSpringBoard();
        if (v203)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_1244;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v312 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v312, "userInterfaceIdiom"))
          {
            HIDWORD(v364) = 0;
            HIDWORD(v376) = 1;
            goto LABEL_1338;
          }
        }
        HIDWORD(v376) = v203 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v87 = __sb__runningInSpringBoard();
          if ((_DWORD)v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v303 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v303, "_referenceBounds");
          }
          HIDWORD(v364) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v226 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
          {
            LODWORD(v376) = 0;
            v368 = 0;
            v372 = 0;
            LODWORD(v364) = 0;
            v356 = 0;
            v360 = 0;
            v348 = 0;
            v352 = 0;
            v344 = 0;
            LODWORD(v341) = 0;
            v102 = 0;
            v103 = 0;
            v75 = 0;
            v104 = 0;
            v105 = 0;
            v106 = 31.3333;
            goto LABEL_441;
          }
        }
        else
        {
          HIDWORD(v364) = 0;
        }
LABEL_1338:
        v87 = __sb__runningInSpringBoard();
        if ((_DWORD)v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v376) = 0;
            HIDWORD(v372) = 0;
            goto LABEL_1348;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v316 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v316, "userInterfaceIdiom"))
          {
            HIDWORD(v372) = 0;
            LODWORD(v376) = 1;
            goto LABEL_1348;
          }
        }
        LODWORD(v376) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v87 = __sb__runningInSpringBoard();
          if ((_DWORD)v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v306 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v306, "_referenceBounds");
          }
          HIDWORD(v372) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v215 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
            goto LABEL_1352;
        }
        else
        {
          HIDWORD(v372) = 0;
        }
LABEL_1348:
        if ((_SBF_Private_IsD93Like() & 1) != 0)
        {
          LODWORD(v372) = 0;
          v368 = 0;
          LODWORD(v364) = 0;
          v356 = 0;
          v360 = 0;
          v348 = 0;
          v352 = 0;
          v344 = 0;
          LODWORD(v341) = 0;
          v102 = 0;
          v103 = 0;
          v75 = 0;
          v104 = 0;
          v105 = 0;
          v106 = 31.3333;
          goto LABEL_441;
        }
LABEL_1352:
        if (!_SBF_Private_IsD63Like())
        {
LABEL_1356:
          LODWORD(v372) = 0;
          HIDWORD(v368) = 0;
          goto LABEL_1454;
        }
        v216 = __sb__runningInSpringBoard();
        if (v216)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_1356;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v307 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v307, "userInterfaceIdiom"))
          {
            HIDWORD(v368) = 0;
            LODWORD(v372) = 1;
            goto LABEL_1454;
          }
        }
        LODWORD(v372) = v216 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v232 = __sb__runningInSpringBoard();
          if (v232)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v299 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v299, "_referenceBounds");
          }
          v87 = v232 ^ 1u;
          BSSizeRoundForScale();
          HIDWORD(v368) = v87;
          if (v242 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
            LODWORD(v368) = 0;
            LODWORD(v364) = 0;
            v356 = 0;
            v360 = 0;
            v348 = 0;
            v352 = 0;
            v344 = 0;
            LODWORD(v341) = 0;
            v102 = 0;
            v103 = 0;
            v75 = 0;
            v104 = 0;
            v105 = 0;
            v106 = 40.0;
            goto LABEL_441;
          }
        }
        else
        {
          HIDWORD(v368) = 0;
        }
LABEL_1454:
        v87 = __sb__runningInSpringBoard();
        if ((_DWORD)v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v368) = 0;
            LODWORD(v364) = 0;
            goto LABEL_1464;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v311 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v311, "userInterfaceIdiom"))
          {
            LODWORD(v364) = 0;
            LODWORD(v368) = 1;
            goto LABEL_1464;
          }
        }
        LODWORD(v368) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v87 = __sb__runningInSpringBoard();
          if ((_DWORD)v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v302 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v302, "_referenceBounds");
          }
          LODWORD(v364) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v233 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
            goto LABEL_1468;
        }
        else
        {
          LODWORD(v364) = 0;
        }
LABEL_1464:
        if ((_SBF_Private_IsD63Like() & 1) != 0)
        {
          v356 = 0;
          v360 = 0;
          v348 = 0;
          v352 = 0;
          v344 = 0;
          LODWORD(v341) = 0;
          v102 = 0;
          v103 = 0;
          v75 = 0;
          v104 = 0;
          v105 = 0;
          v106 = 40.0;
          goto LABEL_441;
        }
LABEL_1468:
        v234 = __sb__runningInSpringBoard();
        if (v234)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v360) = 0;
            LODWORD(v356) = 0;
            goto LABEL_1478;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v308 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v308, "userInterfaceIdiom"))
          {
            LODWORD(v356) = 0;
            HIDWORD(v360) = 1;
            goto LABEL_1478;
          }
        }
        HIDWORD(v360) = v234 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v235 = __sb__runningInSpringBoard();
          if (v235)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v300 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v300, "_referenceBounds");
          }
          v87 = v235 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v356) = v87;
          if (v239 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
          {
            LODWORD(v360) = 0;
            HIDWORD(v356) = 0;
            v348 = 0;
            v352 = 0;
            v344 = 0;
            LODWORD(v341) = 0;
            v102 = 0;
            v103 = 0;
            v75 = 0;
            v104 = 0;
            v105 = 0;
            v106 = 34.0;
            goto LABEL_441;
          }
        }
        else
        {
          LODWORD(v356) = 0;
        }
LABEL_1478:
        v87 = __sb__runningInSpringBoard();
        if ((_DWORD)v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v360) = 0;
            HIDWORD(v356) = 0;
            goto LABEL_1488;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v305 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v305, "userInterfaceIdiom"))
          {
            HIDWORD(v356) = 0;
            LODWORD(v360) = 1;
            goto LABEL_1488;
          }
        }
        LODWORD(v360) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v87 = __sb__runningInSpringBoard();
          if ((_DWORD)v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v298 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v298, "_referenceBounds");
          }
          HIDWORD(v356) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v243 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
            goto LABEL_1556;
        }
        else
        {
          HIDWORD(v356) = 0;
        }
LABEL_1488:
        if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
        {
          v348 = 0;
          v352 = 0;
          v344 = 0;
          LODWORD(v341) = 0;
          v102 = 0;
          v103 = 0;
          v75 = 0;
          v104 = 0;
          v105 = 0;
          v106 = 0.0;
          goto LABEL_441;
        }
LABEL_1556:
        v244 = __sb__runningInSpringBoard();
        if (v244)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v352 = 0;
            goto LABEL_1593;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v304 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v304, "userInterfaceIdiom"))
          {
            v352 = 0x100000000;
            goto LABEL_1593;
          }
        }
        HIDWORD(v352) = v244 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v249 = __sb__runningInSpringBoard();
          if (v249)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v297 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v297, "_referenceBounds");
          }
          v87 = v249 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v352) = v87;
          if (v258 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
            v348 = 0;
            v344 = 0;
            LODWORD(v341) = 0;
            v102 = 0;
            v103 = 0;
            v75 = 0;
            v104 = 0;
            v105 = 0;
            v106 = 31.3333;
            goto LABEL_441;
          }
        }
        else
        {
          LODWORD(v352) = 0;
        }
LABEL_1593:
        v250 = __sb__runningInSpringBoard();
        if (v250)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v251 = 0;
            v87 = 0;
            goto LABEL_1611;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v301, "userInterfaceIdiom"))
          {
            v87 = 0;
            v251 = 1;
            goto LABEL_1611;
          }
        }
        v251 = v250 ^ 1;
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
            v296 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v296, "_referenceBounds");
          }
          v87 = v254 ^ 1u;
          BSSizeRoundForScale();
          if (v260 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
            goto LABEL_1642;
        }
        else
        {
          v87 = 0;
        }
LABEL_1611:
        if ((_SBF_Private_IsD53() & 1) != 0)
        {
          v348 = __PAIR64__(v251, v87);
          v344 = 0;
          LODWORD(v341) = 0;
          v102 = 0;
          v103 = 0;
          v75 = 0;
          v104 = 0;
          v105 = 0;
          v106 = 31.3333;
          goto LABEL_441;
        }
LABEL_1642:
        v348 = __PAIR64__(v251, v87);
        if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
          || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
        {
          v344 = 0;
          LODWORD(v341) = 0;
          v102 = 0;
          v103 = 0;
          v75 = 0;
          v104 = 0;
          v105 = 0;
          v106 = 32.666;
          goto LABEL_441;
        }
        v106 = 22.5;
        if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
        {
          v344 = 0;
          LODWORD(v341) = 0;
          v102 = 0;
          v103 = 0;
          v75 = 0;
          v104 = 0;
          v105 = 0;
          goto LABEL_441;
        }
        v87 = __sb__runningInSpringBoard();
        if ((_DWORD)v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v344 = 0;
            LODWORD(v341) = 0;
            goto LABEL_1764;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v295 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v295, "userInterfaceIdiom"))
          {
            LODWORD(v341) = 0;
            v344 = 1;
            goto LABEL_1764;
          }
        }
        v344 = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v87 = __sb__runningInSpringBoard();
          if ((_DWORD)v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v293 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v293, "_referenceBounds");
          }
          LODWORD(v341) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v283 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
          {
            v102 = 0;
            v103 = 0;
            v75 = 0;
            v104 = 0;
            v105 = 0;
            v106 = 27.0;
            goto LABEL_441;
          }
        }
        else
        {
          LODWORD(v341) = 0;
        }
LABEL_1764:
        v279 = __sb__runningInSpringBoard();
        if (v279)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v102 = 0;
            v103 = 0;
            goto LABEL_1774;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v294 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v294, "userInterfaceIdiom"))
          {
            v103 = 0;
            v102 = 1;
            goto LABEL_1774;
          }
        }
        v102 = v279 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v74 = __sb__runningInSpringBoard();
          if ((_DWORD)v74)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v292 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v292, "_referenceBounds");
          }
          v103 = v74 ^ 1;
          BSSizeRoundForScale();
          if (v284 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
          {
            v75 = 0;
            v104 = 0;
            v105 = 0;
            v106 = 0.0;
            goto LABEL_441;
          }
        }
        else
        {
          v103 = 0;
        }
LABEL_1774:
        v74 = __sb__runningInSpringBoard();
        if ((_DWORD)v74)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v75 = 0;
            v104 = 0;
LABEL_1794:
            v282 = __sb__runningInSpringBoard();
            if ((_DWORD)v282)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
LABEL_1797:
                v105 = 0;
                v106 = 0.0;
                goto LABEL_441;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v74 = objc_claimAutoreleasedReturnValue();
              if (objc_msgSend((id)v74, "userInterfaceIdiom"))
              {
                v106 = 0.0;
                v105 = 1;
                goto LABEL_441;
              }
            }
            v105 = v282 ^ 1;
            v286 = __sb__runningInSpringBoard();
            if (v286)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
              v282 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v282, "_referenceBounds");
            }
            BSSizeRoundForScale();
            v106 = 0.0;
            if (v286 != 1)

LABEL_441:
            if (v105)

            v73 = v413;
            if (v104)

            v74 = v410;
            if ((_DWORD)v75)

            if (v103)
            if (v102)

            if ((_DWORD)v341)
            if (v344)

            if ((_DWORD)v348)
            if (HIDWORD(v348))

            if ((_DWORD)v352)
            if (HIDWORD(v352))

            if (HIDWORD(v356))
            if ((_DWORD)v360)

            if ((_DWORD)v356)
            if (HIDWORD(v360))

            if ((_DWORD)v364)
            if ((_DWORD)v368)

            if (HIDWORD(v368))
            if ((_DWORD)v372)

            if (HIDWORD(v372))
            if ((_DWORD)v376)

            if (HIDWORD(v364))
            if (HIDWORD(v376))

            if (HIDWORD(v380))
            if ((_DWORD)v384)

            if ((_DWORD)v380)
            if (HIDWORD(v384))

            if ((_DWORD)v388)
            if (HIDWORD(v388))

            if (HIDWORD(v396))
            if ((_DWORD)v400)

            if (HIDWORD(v392))
            if (HIDWORD(v400))

            if ((_DWORD)v404)
            if (HIDWORD(v404))

            if ((_DWORD)v392)
            if ((_DWORD)v396)

            if (*(_DWORD *)v406)
            if (*(_DWORD *)&v406[4])

            if (*(_DWORD *)&v406[8])
            if (*(_DWORD *)&v406[12])

            if (*(_DWORD *)&v406[16])
            if (*(_DWORD *)&v406[20])

            if (*(_DWORD *)&v406[24])
            if (*(_DWORD *)&v406[28])
            {

              if (!*(_DWORD *)&v406[32])
                goto LABEL_531;
            }
            else if (!*(_DWORD *)&v406[32])
            {
LABEL_531:
              if (*(_DWORD *)&v406[36])
                goto LABEL_532;
              goto LABEL_547;
            }

            if (*(_DWORD *)&v406[36])
            {
LABEL_532:

              if (!v409)
                goto LABEL_533;
              goto LABEL_548;
            }
LABEL_547:
            if (!v409)
            {
LABEL_533:
              if (!(_DWORD)v410)
                goto LABEL_535;
              goto LABEL_534;
            }
LABEL_548:

            if (!(_DWORD)v410)
            {
LABEL_535:
              if (HIDWORD(v410))
              {

                if (!v411)
                  goto LABEL_537;
              }
              else if (!v411)
              {
LABEL_537:
                if (!v412)
                {
LABEL_539:
                  v113 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
                  v415.origin.x = 0.0;
                  v415.origin.y = 0.0;
                  v415.size.width = v38;
                  v415.size.height = v45;
                  MidX = CGRectGetMidX(v415);
                  v115 = v8 - MidX - v106;
                  v116 = v106 + MidX;
                  if (v113 == 1)
                    v80 = v116;
                  else
                    v80 = v115;
                  v86 = v45 * 0.5;
                  v81 = v45 * 0.5 + v66;
                  goto LABEL_543;
                }
LABEL_538:

                goto LABEL_539;
              }

              if (!v412)
                goto LABEL_539;
              goto LABEL_538;
            }
LABEL_534:

            goto LABEL_535;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v87 = objc_claimAutoreleasedReturnValue();
          if (objc_msgSend((id)v87, "userInterfaceIdiom"))
          {
            v104 = 0;
            v75 = 1;
            goto LABEL_1794;
          }
        }
        v75 = v74 ^ 1;
        v74 = __sb__runningInSpringBoard();
        if ((_DWORD)v74)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v85 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v85, "_referenceBounds");
        }
        v104 = v74 ^ 1;
        BSSizeRoundForScale();
        if (v281 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
          goto LABEL_1797;
        goto LABEL_1794;
      }
    }
    *(_QWORD *)v406 = 0;
    v396 = 0;
    v388 = 0;
    v392 = 0;
    v404 = 0;
    v400 = 0;
    v380 = 0;
    v384 = 0;
    v372 = 0;
    v376 = 0;
    v364 = 0;
    v368 = 0;
    v356 = 0;
    v360 = 0;
    v348 = 0;
    v352 = 0;
    v344 = 0;
    LODWORD(v341) = 0;
    v102 = 0;
    v103 = 0;
    v75 = 0;
    v104 = 0;
    v105 = 0;
    v106 = 0.0;
    *(_DWORD *)&v406[8] = v87 ^ 1;
    goto LABEL_441;
  }
  v76 = -[CSTeachableMomentsContainerView usesStatusBarRelativeLayoutForControlCenterTutorsY](v413, "usesStatusBarRelativeLayoutForControlCenterTutorsY");
  if ((_DWORD)v76)
    v77 = 8.0;
  else
    v77 = v66;
  -[CSTeachableMomentsContainerView _grabberCenterForContainerBounds:grabberTop:grabberTopIsRelative:grabberSize:isSpaceConstrained:](v413, "_grabberCenterForContainerBounds:grabberTop:grabberTopIsRelative:grabberSize:isSpaceConstrained:", v76, v414, v4, v6, v8, v10, v77, v38, v45);
  v80 = v79;
  v81 = v78;
  if (v79 == *MEMORY[0x1E0C9D538] && v78 == *(double *)(MEMORY[0x1E0C9D538] + 8))
  {

    v82 = v408;
    goto LABEL_733;
  }
  v86 = v45 * 0.5;
LABEL_543:
  objc_msgSend(v408, "setBounds:", 0.0, 0.0, v38, v45);
  objc_msgSend(v408, "setCenter:", v80, v81);
  -[CABackdropLayer setBounds:](v73->_controlCenterGrabberBackdropLayer, "setBounds:", 0.0, 0.0, v38, v45);
  -[CABackdropLayer setPosition:](v73->_controlCenterGrabberBackdropLayer, "setPosition:", v80, v81);
  objc_msgSend(v407, "setFrame:", 0.0, 0.0, v38, v45);
  objc_msgSend(v407, "_setContinuousCornerRadius:", v86);
  objc_msgSend(*(id *)&v406[40], "setBounds:", 0.0, 0.0, v38, v45);
  objc_msgSend(*(id *)&v406[40], "setCenter:", v80, v81 + 28.5);

  -[CSTeachableMomentsContainerView controlCenterGlyphContainerView](v73, "controlCenterGlyphContainerView");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSTeachableMomentsContainerView bounds](v73, "bounds");
  objc_msgSend(v117, "setFrame:");
  -[CSTeachableMomentsContainerView controlCenterGlyphView](v73, "controlCenterGlyphView");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "sizeToFit");
  if (-[CSTeachableMomentsContainerView usesStatusBarRelativeLayoutForControlCenterTutorsY](v73, "usesStatusBarRelativeLayoutForControlCenterTutorsY"))
  {
    -[CSTeachableMomentsContainerView controlCenterGrabberContainerView](v73, "controlCenterGrabberContainerView");
    v74 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v74, "frame");
    MinY = CGRectGetMinY(v416);
LABEL_728:

    goto LABEL_729;
  }
  v120 = __sb__runningInSpringBoard();
  if (v120)
  {
    v121 = 0x1E0CEA000;
    if (SBFEffectiveDeviceClass() != 2)
    {
      v122 = 0;
      v123 = 0;
      goto LABEL_562;
    }
  }
  else
  {
    v121 = 0x1E0CEA000uLL;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v74 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v74, "userInterfaceIdiom") != 1)
    {
      v123 = 0;
      v122 = 1;
      goto LABEL_562;
    }
  }
  v122 = v120 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v341 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v341, "_referenceBounds");
    }
    v123 = v124 ^ 1;
    BSSizeRoundForScale();
    if (v140 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v139 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v411 = v124 ^ 1;
      v412 = v122;
      v410 = 0;
      v409 = 0;
      LODWORD(v408) = 0;
      LODWORD(v407) = 0;
      memset(v406, 0, 44);
      v405 = 0;
      v401 = 0;
      v397 = 0;
      v389 = 0;
      v393 = 0;
      v381 = 0;
      v385 = 0;
      v373 = 0;
      v377 = 0;
      v365 = 0;
      v369 = 0;
      v353 = 0;
      v357 = 0;
      v361 = 0;
      v345 = 0;
      v349 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 27.0;
      goto LABEL_629;
    }
  }
  else
  {
    v123 = 0;
  }
LABEL_562:
  v125 = __sb__runningInSpringBoard();
  v411 = v123;
  v412 = v122;
  if (v125)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v75 = 0;
      v126 = 0;
      goto LABEL_571;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v340, "userInterfaceIdiom") != 1)
    {
      v126 = 0;
      v75 = 1;
      goto LABEL_571;
    }
  }
  v75 = v125 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v332, "_referenceBounds");
    }
    v126 = v124 ^ 1;
    BSSizeRoundForScale();
    if (v141 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      LODWORD(v410) = v124 ^ 1;
      HIDWORD(v410) = v75;
      v409 = 0;
      LODWORD(v408) = 0;
      LODWORD(v407) = 0;
      memset(v406, 0, 44);
      v405 = 0;
      v401 = 0;
      v397 = 0;
      v389 = 0;
      v393 = 0;
      v381 = 0;
      v385 = 0;
      v373 = 0;
      v377 = 0;
      v365 = 0;
      v369 = 0;
      v353 = 0;
      v357 = 0;
      v361 = 0;
      v345 = 0;
      v349 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 28.0;
      goto LABEL_629;
    }
  }
  else
  {
    v126 = 0;
  }
LABEL_571:
  v127 = __sb__runningInSpringBoard();
  v410 = __PAIR64__(v75, v126);
  if (v127)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v128 = 0;
      LODWORD(v408) = 0;
      goto LABEL_580;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v339 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v339, "userInterfaceIdiom") != 1)
    {
      LODWORD(v408) = 0;
      v128 = 1;
      goto LABEL_580;
    }
  }
  v128 = v127 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v331 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v331, "_referenceBounds");
    }
    LODWORD(v408) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v142 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v409 = v128;
      LODWORD(v407) = 0;
      memset(v406, 0, 44);
      v405 = 0;
      v401 = 0;
      v397 = 0;
      v389 = 0;
      v393 = 0;
      v381 = 0;
      v385 = 0;
      v373 = 0;
      v377 = 0;
      v365 = 0;
      v369 = 0;
      v353 = 0;
      v357 = 0;
      v361 = 0;
      v345 = 0;
      v349 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 28.0;
      goto LABEL_629;
    }
  }
  else
  {
    LODWORD(v408) = 0;
  }
LABEL_580:
  v129 = __sb__runningInSpringBoard();
  v409 = v128;
  if (v129)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      LODWORD(v407) = 0;
      *(_DWORD *)&v406[40] = 0;
      goto LABEL_589;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v338, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v406[40] = 0;
      LODWORD(v407) = 1;
      goto LABEL_589;
    }
  }
  LODWORD(v407) = v129 ^ 1;
  v124 = __sb__runningInSpringBoard();
  if ((_DWORD)v124)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v335 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v335, "_referenceBounds");
  }
  *(_DWORD *)&v406[40] = v124 ^ 1;
  BSSizeRoundForScale();
  if (v130 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    memset(v406, 0, 40);
    v405 = 0;
    v401 = 0;
    v397 = 0;
    v389 = 0;
    v393 = 0;
    v381 = 0;
    v385 = 0;
    v373 = 0;
    v377 = 0;
    v365 = 0;
    v369 = 0;
    v353 = 0;
    v357 = 0;
    v361 = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 27.0;
    goto LABEL_629;
  }
LABEL_589:
  v131 = __sb__runningInSpringBoard();
  if (v131)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v406[32] = 0;
      goto LABEL_611;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v337 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v337, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v406[32] = 0;
      *(_DWORD *)&v406[36] = 1;
      goto LABEL_611;
    }
  }
  *(_DWORD *)&v406[36] = v131 ^ 1;
  v124 = __sb__runningInSpringBoard();
  if ((_DWORD)v124)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v333, "_referenceBounds");
  }
  *(_DWORD *)&v406[32] = v124 ^ 1;
  BSSizeRoundForScale();
  if (v137 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    memset(v406, 0, 32);
    v405 = 0;
    v401 = 0;
    v397 = 0;
    v389 = 0;
    v393 = 0;
    v381 = 0;
    v385 = 0;
    v373 = 0;
    v377 = 0;
    v365 = 0;
    v369 = 0;
    v353 = 0;
    v357 = 0;
    v361 = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 27.0;
    goto LABEL_629;
  }
LABEL_611:
  v138 = __sb__runningInSpringBoard();
  if (v138)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v406[24] = 0;
      goto LABEL_747;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v336, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v406[24] = 0;
      *(_DWORD *)&v406[28] = 1;
      goto LABEL_747;
    }
  }
  *(_DWORD *)&v406[28] = v138 ^ 1;
  v124 = __sb__runningInSpringBoard();
  if ((_DWORD)v124)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v330 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v330, "_referenceBounds");
  }
  *(_DWORD *)&v406[24] = v124 ^ 1;
  BSSizeRoundForScale();
  if (v145 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v406, 0, 24);
    v405 = 0;
    v401 = 0;
    v397 = 0;
    v389 = 0;
    v393 = 0;
    v381 = 0;
    v385 = 0;
    v373 = 0;
    v377 = 0;
    v365 = 0;
    v369 = 0;
    v353 = 0;
    v357 = 0;
    v361 = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 27.0;
    goto LABEL_629;
  }
LABEL_747:
  v124 = __sb__runningInSpringBoard();
  if ((_DWORD)v124)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_749;
LABEL_755:
    memset(v406, 0, 20);
    v405 = 0;
    v401 = 0;
    v397 = 0;
    v389 = 0;
    v393 = 0;
    v381 = 0;
    v385 = 0;
    v373 = 0;
    v377 = 0;
    v365 = 0;
    v369 = 0;
    v353 = 0;
    v357 = 0;
    v361 = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 27.0;
    *(_DWORD *)&v406[20] = v124 ^ 1;
    goto LABEL_629;
  }
  objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v334, "userInterfaceIdiom") == 1)
    goto LABEL_755;
LABEL_749:
  *(_DWORD *)&v406[20] = v124 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_753:
    *(_QWORD *)&v406[8] = 0;
    goto LABEL_933;
  }
  v146 = __sb__runningInSpringBoard();
  if (v146)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_753;
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v328, "userInterfaceIdiom"))
    {
      *(_QWORD *)&v406[8] = 0x100000000;
      goto LABEL_933;
    }
  }
  *(_DWORD *)&v406[12] = v146 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v321 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v321, "_referenceBounds");
    }
    *(_DWORD *)&v406[8] = v124 ^ 1;
    BSSizeRoundForScale();
    if (v172 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      *(_DWORD *)&v406[16] = 0;
      *(_QWORD *)v406 = 0;
      v405 = 0;
      v401 = 0;
      v397 = 0;
      v389 = 0;
      v393 = 0;
      v381 = 0;
      v385 = 0;
      v373 = 0;
      v377 = 0;
      v365 = 0;
      v369 = 0;
      v353 = 0;
      v357 = 0;
      v361 = 0;
      v345 = 0;
      v349 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 38.6666;
      goto LABEL_629;
    }
  }
  else
  {
    *(_DWORD *)&v406[8] = 0;
  }
LABEL_933:
  v124 = __sb__runningInSpringBoard();
  if ((_DWORD)v124)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v406[16] = 0;
      *(_DWORD *)&v406[4] = 0;
      goto LABEL_943;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v329, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v406[4] = 0;
      *(_DWORD *)&v406[16] = 1;
      goto LABEL_943;
    }
  }
  *(_DWORD *)&v406[16] = v124 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v324, "_referenceBounds");
    }
    *(_DWORD *)&v406[4] = v124 ^ 1;
    BSSizeRoundForScale();
    if (v161 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_947;
  }
  else
  {
    *(_DWORD *)&v406[4] = 0;
  }
LABEL_943:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    *(_DWORD *)v406 = 0;
    v405 = 0;
    v401 = 0;
    v397 = 0;
    v389 = 0;
    v393 = 0;
    v381 = 0;
    v385 = 0;
    v373 = 0;
    v377 = 0;
    v365 = 0;
    v369 = 0;
    v353 = 0;
    v357 = 0;
    v361 = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 38.6666;
    goto LABEL_629;
  }
LABEL_947:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_951:
    *(_DWORD *)v406 = 0;
    HIDWORD(v405) = 0;
    goto LABEL_1060;
  }
  v162 = __sb__runningInSpringBoard();
  if (v162)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_951;
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v325, "userInterfaceIdiom"))
    {
      HIDWORD(v405) = 0;
      *(_DWORD *)v406 = 1;
      goto LABEL_1060;
    }
  }
  *(_DWORD *)v406 = v162 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v316, "_referenceBounds");
    }
    HIDWORD(v405) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v190 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      LODWORD(v405) = 0;
      v401 = 0;
      v397 = 0;
      v389 = 0;
      v393 = 0;
      v381 = 0;
      v385 = 0;
      v373 = 0;
      v377 = 0;
      v365 = 0;
      v369 = 0;
      v353 = 0;
      v357 = 0;
      v361 = 0;
      v345 = 0;
      v349 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 38.6666;
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v405) = 0;
  }
LABEL_1060:
  v124 = __sb__runningInSpringBoard();
  if ((_DWORD)v124)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v405) = 0;
      LODWORD(v401) = 0;
      goto LABEL_1070;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v327 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v327, "userInterfaceIdiom"))
    {
      LODWORD(v401) = 0;
      LODWORD(v405) = 1;
      goto LABEL_1070;
    }
  }
  LODWORD(v405) = v124 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v320, "_referenceBounds");
    }
    LODWORD(v401) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v176 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_1074;
  }
  else
  {
    LODWORD(v401) = 0;
  }
LABEL_1070:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    HIDWORD(v401) = 0;
    v397 = 0;
    v389 = 0;
    v393 = 0;
    v381 = 0;
    v385 = 0;
    v373 = 0;
    v377 = 0;
    v365 = 0;
    v369 = 0;
    v353 = 0;
    v357 = 0;
    v361 = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 38.6666;
    goto LABEL_629;
  }
LABEL_1074:
  v177 = __sb__runningInSpringBoard();
  if (v177)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v401) = 0;
      HIDWORD(v397) = 0;
      goto LABEL_1084;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v326, "userInterfaceIdiom"))
    {
      HIDWORD(v397) = 0;
      HIDWORD(v401) = 1;
      goto LABEL_1084;
    }
  }
  HIDWORD(v401) = v177 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v178 = __sb__runningInSpringBoard();
    if (v178)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v317 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v317, "_referenceBounds");
    }
    v124 = v178 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v397) = v124;
    if (v189 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v389 = 0;
      v393 = 0;
      v381 = 0;
      v385 = 0;
      LODWORD(v397) = 0;
      v373 = 0;
      v377 = 0;
      v365 = 0;
      v369 = 0;
      v353 = 0;
      v357 = 0;
      v361 = 0;
      v345 = 0;
      v349 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 38.6666;
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v397) = 0;
  }
LABEL_1084:
  v124 = __sb__runningInSpringBoard();
  if ((_DWORD)v124)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v393) = 0;
      LODWORD(v381) = 0;
      goto LABEL_1108;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v323, "userInterfaceIdiom"))
    {
      LODWORD(v381) = 0;
      LODWORD(v393) = 1;
      goto LABEL_1108;
    }
  }
  LODWORD(v393) = v124 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v315, "_referenceBounds");
    }
    LODWORD(v381) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v192 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_1154;
  }
  else
  {
    LODWORD(v381) = 0;
  }
LABEL_1108:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    LODWORD(v397) = 0;
    HIDWORD(v393) = 0;
    v385 = 0;
    v389 = 0;
    v373 = 0;
    v377 = 0;
    HIDWORD(v381) = 0;
    v365 = 0;
    v369 = 0;
    v353 = 0;
    v357 = 0;
    v361 = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 38.6666;
    goto LABEL_629;
  }
LABEL_1154:
  v193 = __sb__runningInSpringBoard();
  if (v193)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v397) = 0;
      HIDWORD(v393) = 0;
      goto LABEL_1171;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v322, "userInterfaceIdiom"))
    {
      HIDWORD(v393) = 0;
      LODWORD(v397) = 1;
      goto LABEL_1171;
    }
  }
  LODWORD(v397) = v193 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v194 = __sb__runningInSpringBoard();
    if (v194)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v312, "_referenceBounds");
    }
    v124 = v194 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v393) = v124;
    if (v204 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      v385 = 0;
      v389 = 0;
      v373 = 0;
      v377 = 0;
      HIDWORD(v381) = 0;
      v365 = 0;
      v369 = 0;
      v353 = 0;
      v357 = 0;
      v361 = 0;
      v345 = 0;
      v349 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 40.0;
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v393) = 0;
  }
LABEL_1171:
  v124 = __sb__runningInSpringBoard();
  if ((_DWORD)v124)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v389 = 0;
      goto LABEL_1235;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v319, "userInterfaceIdiom"))
    {
      v389 = 0x100000000;
      goto LABEL_1235;
    }
  }
  HIDWORD(v389) = v124 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v311 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v311, "_referenceBounds");
    }
    LODWORD(v389) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v207 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1259;
  }
  else
  {
    LODWORD(v389) = 0;
  }
LABEL_1235:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v385 = 0;
    v373 = 0;
    v377 = 0;
    HIDWORD(v381) = 0;
    v365 = 0;
    v369 = 0;
    v353 = 0;
    v357 = 0;
    v361 = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 0.0;
    goto LABEL_629;
  }
LABEL_1259:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1263:
    HIDWORD(v385) = 0;
    HIDWORD(v377) = 0;
    goto LABEL_1381;
  }
  v208 = __sb__runningInSpringBoard();
  if (v208)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1263;
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v314, "userInterfaceIdiom"))
    {
      HIDWORD(v377) = 0;
      HIDWORD(v385) = 1;
      goto LABEL_1381;
    }
  }
  HIDWORD(v385) = v208 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v219 = __sb__runningInSpringBoard();
    if (v219)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v305, "_referenceBounds");
    }
    v124 = v219 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v377) = v124;
    if (v231 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      LODWORD(v385) = 0;
      HIDWORD(v381) = 0;
      v369 = 0;
      v373 = 0;
      LODWORD(v377) = 0;
      v353 = 0;
      v357 = 0;
      v361 = 0;
      v365 = 0;
      v345 = 0;
      v349 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 39.0;
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v377) = 0;
  }
LABEL_1381:
  v220 = __sb__runningInSpringBoard();
  if (v220)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v385) = 0;
      v124 = 0;
      goto LABEL_1391;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v318, "userInterfaceIdiom"))
    {
      v124 = 0;
      LODWORD(v385) = 1;
      goto LABEL_1391;
    }
  }
  LODWORD(v385) = v220 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v221 = __sb__runningInSpringBoard();
    if (v221)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v308, "_referenceBounds");
    }
    v124 = v221 ^ 1u;
    BSSizeRoundForScale();
    if (v222 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_1395;
  }
  else
  {
    v124 = 0;
  }
LABEL_1391:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    HIDWORD(v381) = v124;
    v369 = 0;
    v373 = 0;
    LODWORD(v377) = 0;
    v353 = 0;
    v357 = 0;
    v361 = 0;
    v365 = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 39.0;
    goto LABEL_629;
  }
LABEL_1395:
  HIDWORD(v381) = v124;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1399:
    v373 = 0;
    goto LABEL_1506;
  }
  v223 = __sb__runningInSpringBoard();
  if (v223)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_1399;
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v309, "userInterfaceIdiom"))
    {
      v373 = 0x100000000;
      goto LABEL_1506;
    }
  }
  HIDWORD(v373) = v223 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v301, "_referenceBounds");
    }
    LODWORD(v373) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v248 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v377) = 0;
      v365 = 0;
      v369 = 0;
      v353 = 0;
      v357 = 0;
      v361 = 0;
      v345 = 0;
      v349 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 39.0;
      goto LABEL_629;
    }
  }
  else
  {
    LODWORD(v373) = 0;
  }
LABEL_1506:
  v124 = __sb__runningInSpringBoard();
  if ((_DWORD)v124)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v377) = 0;
      HIDWORD(v369) = 0;
      goto LABEL_1516;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v313, "userInterfaceIdiom"))
    {
      HIDWORD(v369) = 0;
      LODWORD(v377) = 1;
      goto LABEL_1516;
    }
  }
  LODWORD(v377) = v124 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v304, "_referenceBounds");
    }
    HIDWORD(v369) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v236 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1520;
  }
  else
  {
    HIDWORD(v369) = 0;
  }
LABEL_1516:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v369) = 0;
    v353 = 0;
    v357 = 0;
    v361 = 0;
    v365 = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 39.0;
    goto LABEL_629;
  }
LABEL_1520:
  v237 = __sb__runningInSpringBoard();
  if (v237)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v369) = 0;
      HIDWORD(v353) = 0;
      goto LABEL_1530;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v310, "userInterfaceIdiom"))
    {
      HIDWORD(v353) = 0;
      LODWORD(v369) = 1;
      goto LABEL_1530;
    }
  }
  LODWORD(v369) = v237 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v238 = __sb__runningInSpringBoard();
    if (v238)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v302, "_referenceBounds");
    }
    v124 = v238 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v353) = v124;
    if (v247 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v361 = 0;
      v365 = 0;
      v357 = 0;
      LODWORD(v353) = 0;
      v345 = 0;
      v349 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 37.0;
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v353) = 0;
  }
LABEL_1530:
  v124 = __sb__runningInSpringBoard();
  if ((_DWORD)v124)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v365 = 0;
      goto LABEL_1552;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v307, "userInterfaceIdiom"))
    {
      v365 = 0x100000000;
      goto LABEL_1552;
    }
  }
  HIDWORD(v365) = v124 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v300, "_referenceBounds");
    }
    LODWORD(v365) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v252 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1601;
  }
  else
  {
    LODWORD(v365) = 0;
  }
LABEL_1552:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v357 = 0;
    v361 = 0;
    LODWORD(v353) = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 0.0;
    goto LABEL_629;
  }
LABEL_1601:
  v253 = __sb__runningInSpringBoard();
  if (v253)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v361) = 0;
      LODWORD(v357) = 0;
      goto LABEL_1617;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v306, "userInterfaceIdiom"))
    {
      LODWORD(v357) = 0;
      HIDWORD(v361) = 1;
      goto LABEL_1617;
    }
  }
  HIDWORD(v361) = v253 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v299, "_referenceBounds");
    }
    LODWORD(v357) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v261 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v361) = 0;
      HIDWORD(v357) = 0;
      LODWORD(v353) = 0;
      v345 = 0;
      v349 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 39.0;
      goto LABEL_629;
    }
  }
  else
  {
    LODWORD(v357) = 0;
  }
LABEL_1617:
  v255 = __sb__runningInSpringBoard();
  if (v255)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v256 = 0;
      v124 = 0;
      goto LABEL_1638;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v121 + 1288), "currentDevice");
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v303, "userInterfaceIdiom"))
    {
      v124 = 0;
      v256 = 1;
      goto LABEL_1638;
    }
  }
  v256 = v255 ^ 1;
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
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v298, "_referenceBounds");
    }
    v124 = v259 ^ 1u;
    BSSizeRoundForScale();
    if (v262 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1655;
  }
  else
  {
    v124 = 0;
  }
LABEL_1638:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    HIDWORD(v357) = v124;
    LODWORD(v361) = v256;
    LODWORD(v353) = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 39.0;
    goto LABEL_629;
  }
LABEL_1655:
  LODWORD(v361) = v256;
  HIDWORD(v357) = v124;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
    || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    LODWORD(v353) = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    MinY = 41.0;
    goto LABEL_629;
  }
  MinY = 41.0;
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    LODWORD(v353) = 0;
    v345 = 0;
    v349 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    goto LABEL_629;
  }
  v263 = __sb__runningInSpringBoard();
  if (v263)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v353) = 0;
      v345 = 0;
      goto LABEL_1784;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v297 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v297, "userInterfaceIdiom"))
    {
      v345 = 0;
      LODWORD(v353) = 1;
      goto LABEL_1784;
    }
  }
  LODWORD(v353) = v263 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v294, "_referenceBounds");
    }
    v345 = v124 ^ 1;
    BSSizeRoundForScale();
    if (v285 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v349 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 36.0;
      goto LABEL_629;
    }
  }
  else
  {
    v345 = 0;
  }
LABEL_1784:
  v280 = __sb__runningInSpringBoard();
  if (v280)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v349 = 0;
      goto LABEL_1807;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v296, "userInterfaceIdiom"))
    {
      v349 = 1;
      goto LABEL_1807;
    }
  }
  LODWORD(v349) = v280 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v124 = __sb__runningInSpringBoard();
    if ((_DWORD)v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v293, "_referenceBounds");
    }
    HIDWORD(v349) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v289 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v132 = 0;
      v133 = 0;
      v134 = 0;
      MinY = 0.0;
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v349) = 0;
  }
LABEL_1807:
  v124 = __sb__runningInSpringBoard();
  if (!(_DWORD)v124)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v295, "userInterfaceIdiom"))
    {
      v133 = 0;
      v132 = 1;
      goto LABEL_1828;
    }
LABEL_1824:
    v132 = v124 ^ 1;
    v75 = __sb__runningInSpringBoard();
    if ((_DWORD)v75)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v124 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v124, "_referenceBounds");
    }
    v133 = v75 ^ 1;
    BSSizeRoundForScale();
    if (v287 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      goto LABEL_1831;
    goto LABEL_1828;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_1824;
  v132 = 0;
  v133 = 0;
LABEL_1828:
  v288 = __sb__runningInSpringBoard();
  if ((_DWORD)v288)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1831:
      v134 = 0;
      MinY = 0.0;
      goto LABEL_629;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v75 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v75, "userInterfaceIdiom"))
    {
      MinY = 0.0;
      v134 = 1;
      goto LABEL_629;
    }
  }
  v134 = v288 ^ 1;
  v290 = __sb__runningInSpringBoard();
  if (v290)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v288 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v288, "_referenceBounds");
  }
  BSSizeRoundForScale();
  MinY = 0.0;
  if (v290 != 1)

LABEL_629:
  if (v134)

  if (v133)
  if (v132)

  if (HIDWORD(v349))
  v73 = v413;
  if ((_DWORD)v349)

  if (v345)
  if ((_DWORD)v353)

  if (HIDWORD(v357))
  if ((_DWORD)v361)

  if ((_DWORD)v357)
  if (HIDWORD(v361))

  if ((_DWORD)v365)
  if (HIDWORD(v365))

  if (HIDWORD(v353))
  if ((_DWORD)v369)

  if (HIDWORD(v369))
  if ((_DWORD)v377)

  if ((_DWORD)v373)
  if (HIDWORD(v373))

  if (HIDWORD(v381))
  if ((_DWORD)v385)

  if (HIDWORD(v377))
  if (HIDWORD(v385))

  if ((_DWORD)v389)
  if (HIDWORD(v389))

  if (HIDWORD(v393))
  if ((_DWORD)v397)

  if ((_DWORD)v381)
  if ((_DWORD)v393)

  if (HIDWORD(v397))
  if (HIDWORD(v401))

  if ((_DWORD)v401)
  if ((_DWORD)v405)

  if (HIDWORD(v405))
  if (*(_DWORD *)v406)

  if (*(_DWORD *)&v406[4])
  if (*(_DWORD *)&v406[16])

  if (*(_DWORD *)&v406[8])
  if (*(_DWORD *)&v406[12])

  if (*(_DWORD *)&v406[20])
  if (*(_DWORD *)&v406[24])

  if (*(_DWORD *)&v406[28])
  if (*(_DWORD *)&v406[32])

  if (*(_DWORD *)&v406[36])
  if (*(_DWORD *)&v406[40])

  if ((_DWORD)v407)
  if ((_DWORD)v408)
  {

    if (!v409)
      goto LABEL_723;
  }
  else if (!v409)
  {
LABEL_723:
    if ((_DWORD)v410)
      goto LABEL_724;
    goto LABEL_737;
  }

  if ((_DWORD)v410)
  {
LABEL_724:

    if (!HIDWORD(v410))
      goto LABEL_725;
    goto LABEL_738;
  }
LABEL_737:
  if (!HIDWORD(v410))
  {
LABEL_725:
    if (!v411)
      goto LABEL_727;
    goto LABEL_726;
  }
LABEL_738:

  if (v411)
LABEL_726:

LABEL_727:
  if (v412)
    goto LABEL_728;
LABEL_729:
  objc_msgSend(v118, "bounds");
  objc_msgSend(v118, "setCenter:", v80, MinY + CGRectGetHeight(v417) * 0.5);

  if (!-[CSTeachableMomentsContainerView adjustsControlCenterTutorsVisibilityForAvailableSpace](v73, "adjustsControlCenterTutorsVisibilityForAvailableSpace"))return;
  -[CSTeachableMomentsContainerView controlCenterTutorsContainerView](v73, "controlCenterTutorsContainerView");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v143;
  v144 = 0.0;
  if (!v414[0])
    v144 = 1.0;
  objc_msgSend(v143, "setAlpha:", v144);
LABEL_733:

}

- (CGPoint)_grabberCenterForContainerBounds:(CGRect)a3 grabberTop:(double)a4 grabberTopIsRelative:(BOOL)a5 grabberSize:(CGSize)a6 isSpaceConstrained:(BOOL *)a7
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat height;
  CGFloat width;
  _BOOL4 v16;
  CGFloat v18;
  double v19;
  CGFloat y;
  CGFloat x;
  id WeakRetained;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MidX;
  void *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  double v53;
  int v54;
  int v55;
  double v56;
  int v57;
  int v58;
  int v59;
  int v60;
  double v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  int v68;
  double v69;
  double v70;
  int v71;
  int v72;
  double v73;
  int v74;
  int v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  double v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  double v100;
  double v101;
  int v102;
  int v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  int v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  int v116;
  int v117;
  double v118;
  double v119;
  int v120;
  int v121;
  int v122;
  uint64_t v123;
  double v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  double v130;
  int v131;
  double v132;
  int v133;
  int v134;
  int v135;
  double v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  double v143;
  int v144;
  int v145;
  uint64_t v146;
  int v147;
  int v148;
  int v149;
  double v150;
  int v151;
  int v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  double v164;
  int v165;
  int v166;
  uint64_t v167;
  int v168;
  int v169;
  int v170;
  uint64_t v171;
  int v172;
  int v173;
  int v174;
  double v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  int v188;
  double v189;
  int v190;
  int v191;
  int v192;
  double v193;
  int v194;
  int v195;
  int v196;
  int v197;
  int v198;
  int v199;
  int v200;
  int v201;
  int v202;
  int v203;
  int v204;
  int v205;
  double v206;
  int v207;
  double v208;
  double v209;
  double v210;
  int v211;
  double v212;
  int v213;
  double v214;
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
  double v230;
  int v231;
  int v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  int v238;
  uint64_t v239;
  int v240;
  int v241;
  int v242;
  double v243;
  int v244;
  int v245;
  int v246;
  int v247;
  int v248;
  int v249;
  double v250;
  int v251;
  int v252;
  int v253;
  int v254;
  int v255;
  double v256;
  double v257;
  double v258;
  int v259;
  double v260;
  double v261;
  double v262;
  int v263;
  double v264;
  int v265;
  double v266;
  int v267;
  int v268;
  int v269;
  int v270;
  int v271;
  int v272;
  int v273;
  double v274;
  double v275;
  double v276;
  double v277;
  int v278;
  int v279;
  int v280;
  int v281;
  double v282;
  double v283;
  double v284;
  int v285;
  int v286;
  int v287;
  int v288;
  int v289;
  int v290;
  int v291;
  int v292;
  int v293;
  double v294;
  double v295;
  int v296;
  double v297;
  int v298;
  int v299;
  double v300;
  int v301;
  double v302;
  double v303;
  int v304;
  int v305;
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
  BOOL *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  BOOL *v344;
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
  BOOL *v363;
  void *v364;
  BOOL *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  BOOL *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
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
  void *v436;
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
  int v461;
  int v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  CGFloat v509;
  _BOOL4 v510;
  double v511;
  BOOL *v512;
  double v513;
  CGFloat v514;
  CGFloat v515;
  double v516;
  CGFloat v517;
  double v518;
  CGPoint result;
  CGRect v520;
  CGRect v521;
  CGRect v522;
  CGRect v523;
  CGRect v524;

  height = a6.height;
  width = a6.width;
  v16 = a5;
  v18 = a3.size.height;
  v19 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarToFollow);
  v23 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_4;
  v517 = x;
  v518 = height;
  v516 = width;
  objc_msgSend(WeakRetained, "frameForPartWithIdentifier:", *MEMORY[0x1E0CEC1F8]);
  v24 = v520.origin.x;
  v25 = v520.origin.y;
  v26 = v520.size.width;
  v27 = v520.size.height;
  if (CGRectEqualToRect(v520, *MEMORY[0x1E0C9D648])
    || (v521.origin.x = v24,
        v521.origin.y = v25,
        v521.size.width = v26,
        v521.size.height = v27,
        CGRectEqualToRect(v521, *MEMORY[0x1E0C9D628])))
  {
LABEL_4:
    v28 = *MEMORY[0x1E0C9D538];
    v29 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    goto LABEL_5;
  }
  v514 = v27;
  v515 = v25;
  v510 = v16;
  v512 = a7;
  v513 = v26;
  v32 = v24;
  if (v26 != v19)
  {
    objc_msgSend(v23, "frame");
    v32 = v19 - (v33 - v24);
  }
  v522.origin.x = v32;
  v522.size.height = v514;
  v522.origin.y = v25;
  v34 = v26;
  v522.size.width = v26;
  MidX = CGRectGetMidX(v522);
  v36 = (void *)objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  v37 = __sb__runningInSpringBoard();
  v38 = v37;
  v511 = a4;
  v509 = y;
  if (v36 == (void *)1)
  {
    if (v37)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v461 = 0;
        LODWORD(v454) = 0;
        goto LABEL_25;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v408 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v408, "userInterfaceIdiom") != 1)
      {
        LODWORD(v454) = 0;
        v461 = 1;
        goto LABEL_25;
      }
    }
    a7 = (BOOL *)(v38 ^ 1u);
    v461 = v38 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v39 = __sb__runningInSpringBoard();
      if (v39)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v389 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v389, "_referenceBounds");
      }
      a7 = (BOOL *)(v39 ^ 1u);
      BSSizeRoundForScale();
      LODWORD(v454) = v39 ^ 1;
      if (v77 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v76 == *(double *)(MEMORY[0x1E0DAB260] + 280))
      {
        LODWORD(v453) = 0;
        LODWORD(v447) = 0;
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        LODWORD(v458) = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        LODWORD(v442) = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v431) = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        v59 = 0;
        v60 = 0;
        v61 = 0.0;
        goto LABEL_132;
      }
    }
    else
    {
      LODWORD(v454) = 0;
    }
LABEL_25:
    v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        LODWORD(v453) = 0;
        LODWORD(v447) = 0;
        goto LABEL_43;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v406 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v406, "userInterfaceIdiom") != 1)
      {
        LODWORD(v447) = 0;
        LODWORD(v453) = 1;
        goto LABEL_43;
      }
    }
    LODWORD(v453) = v41 ^ 1;
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
        v387 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v387, "_referenceBounds");
      }
      BSSizeRoundForScale();
      LODWORD(v447) = v42 ^ 1;
      if (v80 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
      {
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        LODWORD(v458) = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        LODWORD(v442) = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v431) = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        v59 = 0;
        v60 = 0;
        v61 = 0.0;
        goto LABEL_132;
      }
    }
    else
    {
      LODWORD(v447) = 0;
    }
LABEL_43:
    v45 = __sb__runningInSpringBoard();
    if (v45)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        goto LABEL_61;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v404, "userInterfaceIdiom") != 1)
      {
        LODWORD(v459) = 0;
        LODWORD(v460) = 1;
        goto LABEL_61;
      }
    }
    LODWORD(v460) = v45 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v46 = __sb__runningInSpringBoard();
      if (v46)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v385 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v385, "_referenceBounds");
      }
      LODWORD(v459) = v46 ^ 1;
      BSSizeRoundForScale();
      if (v82 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
      {
        LODWORD(v458) = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        LODWORD(v442) = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v431) = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        v59 = 0;
        v60 = 0;
        v61 = 0.0;
        goto LABEL_132;
      }
    }
    else
    {
      LODWORD(v459) = 0;
    }
LABEL_61:
    v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        LODWORD(v458) = 0;
        LODWORD(v457) = 0;
        goto LABEL_78;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v400, "userInterfaceIdiom") != 1)
      {
        LODWORD(v457) = 0;
        LODWORD(v458) = 1;
        goto LABEL_78;
      }
    }
    LODWORD(v458) = v49 ^ 1;
    v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v395 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v395, "_referenceBounds");
    }
    LODWORD(v457) = v50 ^ 1;
    BSSizeRoundForScale();
    if (v53 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
    {
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      LODWORD(v442) = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      LODWORD(v431) = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v419) = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0.0;
      goto LABEL_132;
    }
LABEL_78:
    v54 = __sb__runningInSpringBoard();
    if (v54)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        goto LABEL_98;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "userInterfaceIdiom") != 1)
      {
        LODWORD(v455) = 0;
        LODWORD(v456) = 1;
        goto LABEL_98;
      }
    }
    LODWORD(v456) = v54 ^ 1;
    v55 = __sb__runningInSpringBoard();
    if (v55)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_referenceBounds");
    }
    LODWORD(v455) = v55 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
    {
      v409 = v7;
      v410 = v36;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      LODWORD(v442) = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      LODWORD(v431) = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v419) = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0.0;
      goto LABEL_132;
    }
LABEL_98:
    v71 = __sb__runningInSpringBoard();
    v410 = v36;
    v409 = v7;
    if (v71)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
LABEL_545:
        v120 = __sb__runningInSpringBoard();
        v402 = v8;
        v401 = v9;
        if (v120)
        {
          if (SBFEffectiveDeviceClass() != 2)
            goto LABEL_547;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v36, "userInterfaceIdiom") != 1)
          {
LABEL_547:
            LODWORD(v450) = v120 ^ 1;
            v398 = v36;
            if (!_SBF_Private_IsD94Like())
            {
LABEL_551:
              v122 = 0;
              v123 = 0;
              goto LABEL_640;
            }
            v121 = __sb__runningInSpringBoard();
            if (v121)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                goto LABEL_551;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v7, "userInterfaceIdiom"))
              {
                v378 = v7;
                v123 = 0;
                v122 = 1;
                goto LABEL_640;
              }
            }
            v122 = v121 ^ 1;
            v378 = v7;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              v140 = __sb__runningInSpringBoard();
              if (v140)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v7 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "_referenceBounds");
              }
              v369 = v7;
              v123 = v140 ^ 1u;
              BSSizeRoundForScale();
              if (v155 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
              {
                LODWORD(v448) = v140 ^ 1;
                LODWORD(v449) = v122;
                LODWORD(v446) = 0;
                LODWORD(v443) = 0;
                LODWORD(v445) = 0;
                LODWORD(v444) = 0;
                LODWORD(v442) = 0;
                LODWORD(v435) = 0;
                LODWORD(v441) = 0;
                LODWORD(v440) = 0;
                LODWORD(v439) = 0;
                LODWORD(v438) = 0;
                LODWORD(v437) = 0;
                LODWORD(v436) = 0;
                LODWORD(v434) = 0;
                LODWORD(v433) = 0;
                LODWORD(v432) = 0;
                LODWORD(v429) = 0;
                LODWORD(v431) = 0;
                LODWORD(v430) = 0;
                LODWORD(v427) = 0;
                LODWORD(v426) = 0;
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                LODWORD(v422) = 0;
                LODWORD(v420) = 0;
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                v59 = 0;
                v60 = 0;
                v61 = 0.0;
                goto LABEL_132;
              }
            }
            else
            {
              v123 = 0;
            }
LABEL_640:
            v141 = __sb__runningInSpringBoard();
            LODWORD(v449) = v122;
            LODWORD(v448) = v123;
            if (v141)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                LODWORD(v446) = 0;
                LODWORD(v443) = 0;
                goto LABEL_650;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v10, "userInterfaceIdiom"))
              {
                LODWORD(v443) = 0;
                LODWORD(v446) = 1;
                goto LABEL_650;
              }
            }
            LODWORD(v446) = v141 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              v142 = __sb__runningInSpringBoard();
              if (v142)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v8 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "_referenceBounds");
              }
              LODWORD(v443) = v142 ^ 1;
              BSSizeRoundForScale();
              if (v143 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
                goto LABEL_654;
            }
            else
            {
              LODWORD(v443) = 0;
            }
LABEL_650:
            if ((_SBF_Private_IsD94Like() & 1) != 0)
            {
              v391 = v8;
              v392 = v10;
              LODWORD(v445) = 0;
              LODWORD(v444) = 0;
              LODWORD(v442) = 0;
              LODWORD(v435) = 0;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              v59 = 0;
              v60 = 0;
              v61 = 0.0;
              goto LABEL_132;
            }
LABEL_654:
            v392 = v10;
            v391 = v8;
            if (!_SBF_Private_IsD64Like())
            {
LABEL_658:
              v145 = 0;
              v146 = 0;
              goto LABEL_726;
            }
            v144 = __sb__runningInSpringBoard();
            if (v144)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                goto LABEL_658;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v123 = objc_claimAutoreleasedReturnValue();
              if (objc_msgSend((id)v123, "userInterfaceIdiom"))
              {
                v372 = (void *)v123;
                v146 = 0;
                v145 = 1;
                goto LABEL_726;
              }
            }
            v145 = v144 ^ 1;
            v372 = (void *)v123;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              v161 = __sb__runningInSpringBoard();
              if (v161)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "_referenceBounds");
              }
              v146 = v161 ^ 1u;
              BSSizeRoundForScale();
              if (v185 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
              {
                v382 = v9;
                LODWORD(v444) = v161 ^ 1;
                LODWORD(v445) = v145;
                LODWORD(v442) = 0;
                LODWORD(v435) = 0;
                LODWORD(v441) = 0;
                LODWORD(v440) = 0;
                LODWORD(v439) = 0;
                LODWORD(v438) = 0;
                LODWORD(v437) = 0;
                LODWORD(v436) = 0;
                LODWORD(v434) = 0;
                LODWORD(v433) = 0;
                LODWORD(v432) = 0;
                LODWORD(v429) = 0;
                LODWORD(v431) = 0;
                LODWORD(v430) = 0;
                LODWORD(v427) = 0;
                LODWORD(v426) = 0;
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                LODWORD(v422) = 0;
                LODWORD(v420) = 0;
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                v59 = 0;
                v60 = 0;
                v61 = -1.0;
                goto LABEL_132;
              }
            }
            else
            {
              v146 = 0;
            }
LABEL_726:
            v162 = __sb__runningInSpringBoard();
            LODWORD(v445) = v145;
            LODWORD(v444) = v146;
            v382 = v9;
            if (v162)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                LODWORD(v442) = 0;
                LODWORD(v435) = 0;
                goto LABEL_736;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v11, "userInterfaceIdiom"))
              {
                LODWORD(v435) = 0;
                LODWORD(v442) = 1;
                goto LABEL_736;
              }
            }
            LODWORD(v442) = v162 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              v163 = __sb__runningInSpringBoard();
              if (v163)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "_referenceBounds");
              }
              LODWORD(v435) = v163 ^ 1;
              BSSizeRoundForScale();
              if (v164 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
                goto LABEL_740;
            }
            else
            {
              LODWORD(v435) = 0;
            }
LABEL_736:
            if ((_SBF_Private_IsD64Like() & 1) != 0)
            {
              v380 = v10;
              v381 = v11;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              v59 = 0;
              v60 = 0;
              v61 = -1.0;
              goto LABEL_132;
            }
LABEL_740:
            v165 = __sb__runningInSpringBoard();
            v381 = v11;
            v380 = v10;
            if (v165)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                v166 = 0;
                v167 = 0;
                goto LABEL_750;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v146 = objc_claimAutoreleasedReturnValue();
              if (objc_msgSend((id)v146, "userInterfaceIdiom"))
              {
                v373 = (void *)v146;
                v167 = 0;
                v166 = 1;
                goto LABEL_750;
              }
            }
            v166 = v165 ^ 1;
            v373 = (void *)v146;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              v168 = __sb__runningInSpringBoard();
              if (v168)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v146 = objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v146, "_referenceBounds");
              }
              v362 = (void *)v146;
              v167 = v168 ^ 1u;
              BSSizeRoundForScale();
              if (v182 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
              {
                LODWORD(v440) = v168 ^ 1;
                LODWORD(v441) = v166;
                LODWORD(v439) = 0;
                LODWORD(v438) = 0;
                LODWORD(v437) = 0;
                LODWORD(v436) = 0;
                LODWORD(v434) = 0;
                LODWORD(v433) = 0;
                LODWORD(v432) = 0;
                LODWORD(v429) = 0;
                LODWORD(v431) = 0;
                LODWORD(v430) = 0;
                LODWORD(v427) = 0;
                LODWORD(v426) = 0;
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                LODWORD(v422) = 0;
                LODWORD(v420) = 0;
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                v59 = 0;
                v60 = 0;
                v61 = 0.0;
                goto LABEL_132;
              }
            }
            else
            {
              v167 = 0;
            }
LABEL_750:
            v169 = __sb__runningInSpringBoard();
            LODWORD(v441) = v166;
            LODWORD(v440) = v167;
            if (v169)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                v170 = 0;
                v171 = 0;
                goto LABEL_801;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "userInterfaceIdiom"))
              {
                v171 = 0;
                v170 = 1;
                goto LABEL_801;
              }
            }
            v170 = v169 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              v180 = __sb__runningInSpringBoard();
              if (v180)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v167 = objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v167, "_referenceBounds");
              }
              v171 = v180 ^ 1u;
              BSSizeRoundForScale();
              if (v189 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
                goto LABEL_836;
            }
            else
            {
              v171 = 0;
            }
LABEL_801:
            if ((_SBF_Private_IsD54() & 1) != 0)
            {
              v374 = (void *)v167;
              v375 = v12;
              LODWORD(v438) = v171;
              LODWORD(v439) = v170;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              v59 = 0;
              v60 = 0;
              v61 = 0.0;
              goto LABEL_132;
            }
LABEL_836:
            v190 = __sb__runningInSpringBoard();
            LODWORD(v439) = v170;
            LODWORD(v438) = v171;
            v375 = v12;
            v374 = (void *)v167;
            if (v190)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                v191 = 0;
                v192 = 0;
                goto LABEL_854;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              a7 = (BOOL *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(a7, "userInterfaceIdiom"))
              {
                v365 = a7;
                v192 = 0;
                v191 = 1;
                goto LABEL_854;
              }
            }
            v191 = v190 ^ 1;
            v365 = a7;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              v195 = __sb__runningInSpringBoard();
              if (v195)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                a7 = (BOOL *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a7, "_referenceBounds");
              }
              v192 = v195 ^ 1;
              BSSizeRoundForScale();
              if (v208 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
              {
                v370 = a7;
                LODWORD(v436) = v195 ^ 1;
                LODWORD(v437) = v191;
                LODWORD(v434) = 0;
                LODWORD(v433) = 0;
                LODWORD(v432) = 0;
                LODWORD(v429) = 0;
                LODWORD(v431) = 0;
                LODWORD(v430) = 0;
                LODWORD(v427) = 0;
                LODWORD(v426) = 0;
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                LODWORD(v422) = 0;
                LODWORD(v420) = 0;
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                v59 = 0;
                v60 = 0;
                v61 = 0.0;
                goto LABEL_132;
              }
            }
            else
            {
              v192 = 0;
            }
LABEL_854:
            v196 = __sb__runningInSpringBoard();
            LODWORD(v437) = v191;
            LODWORD(v436) = v192;
            v370 = a7;
            if (v196)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                v197 = 0;
                v198 = 0;
                goto LABEL_874;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v11, "userInterfaceIdiom"))
              {
                v364 = v11;
                v198 = 0;
                v197 = 1;
                goto LABEL_874;
              }
            }
            v197 = v196 ^ 1;
            v364 = v11;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              v201 = __sb__runningInSpringBoard();
              if (v201)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v347 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v347, "_referenceBounds");
              }
              v198 = v201 ^ 1;
              BSSizeRoundForScale();
              if (v210 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
                goto LABEL_919;
            }
            else
            {
              v198 = 0;
            }
LABEL_874:
            if (_SBF_Private_IsD33OrSimilarDevice()
              && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
            {
              LODWORD(v433) = v198;
              LODWORD(v434) = v197;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              v59 = 0;
              v60 = 0;
              v61 = 0.0;
              goto LABEL_132;
            }
LABEL_919:
            LODWORD(v434) = v197;
            LODWORD(v433) = v198;
            if (!_SBF_Private_IsD93Like())
            {
LABEL_923:
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              goto LABEL_976;
            }
            v211 = __sb__runningInSpringBoard();
            if (v211)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                goto LABEL_923;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v351 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v351, "userInterfaceIdiom"))
              {
                LODWORD(v429) = 0;
                LODWORD(v432) = 1;
                goto LABEL_976;
              }
            }
            LODWORD(v432) = v211 ^ 1;
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
                v336 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v336, "_referenceBounds");
              }
              LODWORD(v429) = v222 ^ 1;
              BSSizeRoundForScale();
              if (v235 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
              {
                LODWORD(v431) = 0;
                LODWORD(v430) = 0;
                LODWORD(v427) = 0;
                LODWORD(v426) = 0;
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                LODWORD(v422) = 0;
                LODWORD(v420) = 0;
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                v59 = 0;
                v60 = 0;
                v61 = 0.0;
                goto LABEL_132;
              }
            }
            else
            {
              LODWORD(v429) = 0;
            }
LABEL_976:
            v223 = __sb__runningInSpringBoard();
            if (v223)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                LODWORD(v431) = 0;
                LODWORD(v430) = 0;
                goto LABEL_986;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v356 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v356, "userInterfaceIdiom"))
              {
                LODWORD(v430) = 0;
                LODWORD(v431) = 1;
                goto LABEL_986;
              }
            }
            LODWORD(v431) = v223 ^ 1;
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
                a7 = (BOOL *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a7, "_referenceBounds");
              }
              LODWORD(v430) = v224 ^ 1;
              BSSizeRoundForScale();
              if (v225 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
                goto LABEL_990;
            }
            else
            {
              LODWORD(v430) = 0;
            }
LABEL_986:
            if ((_SBF_Private_IsD93Like() & 1) != 0)
            {
              v363 = a7;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              v59 = 0;
              v60 = 0;
              v61 = 0.0;
              goto LABEL_132;
            }
LABEL_990:
            v363 = a7;
            if (!_SBF_Private_IsD63Like())
            {
LABEL_994:
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              goto LABEL_1062;
            }
            v226 = __sb__runningInSpringBoard();
            if (v226)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                goto LABEL_994;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v171 = objc_claimAutoreleasedReturnValue();
              v343 = (void *)v171;
              if (objc_msgSend((id)v171, "userInterfaceIdiom"))
              {
                LODWORD(v426) = 0;
                LODWORD(v427) = 1;
                goto LABEL_1062;
              }
            }
            LODWORD(v427) = v226 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              v240 = __sb__runningInSpringBoard();
              if (v240)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v328 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v328, "_referenceBounds");
              }
              LODWORD(v426) = v240 ^ 1;
              BSSizeRoundForScale();
              if (v260 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
              {
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                LODWORD(v422) = 0;
                LODWORD(v420) = 0;
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                v59 = 0;
                v60 = 0;
                v61 = -1.0;
                goto LABEL_1163;
              }
              v34 = v26;
            }
            else
            {
              LODWORD(v426) = 0;
            }
LABEL_1062:
            v241 = __sb__runningInSpringBoard();
            if (v241)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                goto LABEL_1072;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v171 = objc_claimAutoreleasedReturnValue();
              if (objc_msgSend((id)v171, "userInterfaceIdiom"))
              {
                LODWORD(v425) = 0;
                LODWORD(v428) = 1;
                goto LABEL_1072;
              }
            }
            LODWORD(v428) = v241 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              v242 = __sb__runningInSpringBoard();
              if (v242)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v333 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v333, "_referenceBounds");
              }
              LODWORD(v425) = v242 ^ 1;
              BSSizeRoundForScale();
              if (v243 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
              {
LABEL_1076:
                v244 = __sb__runningInSpringBoard();
                v357 = (void *)v171;
                if (v244)
                {
                  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                  {
                    LODWORD(v422) = 0;
                    LODWORD(v420) = 0;
                    goto LABEL_1086;
                  }
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                  a7 = (BOOL *)objc_claimAutoreleasedReturnValue();
                  v344 = a7;
                  if (objc_msgSend(a7, "userInterfaceIdiom"))
                  {
                    LODWORD(v420) = 0;
                    LODWORD(v422) = 1;
                    goto LABEL_1086;
                  }
                }
                LODWORD(v422) = v244 ^ 1;
                if (SBFEffectiveHomeButtonType() != 2)
                {
                  LODWORD(v420) = 0;
                  goto LABEL_1086;
                }
                v245 = __sb__runningInSpringBoard();
                if (v245)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v329 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v329, "_referenceBounds");
                }
                LODWORD(v420) = v245 ^ 1;
                BSSizeRoundForScale();
                if (v256 < *(double *)(MEMORY[0x1E0DAB260] + 120))
                {
                  v34 = v26;
LABEL_1086:
                  v246 = __sb__runningInSpringBoard();
                  if (v246)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
                      LODWORD(v424) = 0;
                      LODWORD(v423) = 0;
                      goto LABEL_1130;
                    }
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                    a7 = (BOOL *)objc_claimAutoreleasedReturnValue();
                    v339 = a7;
                    if (objc_msgSend(a7, "userInterfaceIdiom"))
                    {
                      LODWORD(v423) = 0;
                      LODWORD(v424) = 1;
                      goto LABEL_1130;
                    }
                  }
                  LODWORD(v424) = v246 ^ 1;
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
                      v325 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v325, "_referenceBounds");
                    }
                    LODWORD(v423) = v254 ^ 1;
                    BSSizeRoundForScale();
                    v34 = v26;
                    if (v262 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
                      goto LABEL_1168;
                  }
                  else
                  {
                    LODWORD(v423) = 0;
                  }
LABEL_1130:
                  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
                  {
                    LODWORD(v421) = 0;
                    LODWORD(v417) = 0;
                    LODWORD(v419) = 0;
                    LODWORD(v418) = 0;
                    LODWORD(v416) = 0;
                    LODWORD(v413) = 0;
                    LODWORD(v415) = 0;
                    LODWORD(v414) = 0;
                    LODWORD(v412) = 0;
                    LODWORD(v411) = 0;
                    v59 = 0;
                    v60 = 0;
                    v61 = 0.0;
                    goto LABEL_132;
                  }
LABEL_1168:
                  v263 = __sb__runningInSpringBoard();
                  if (v263)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
                      LODWORD(v421) = 0;
                      LODWORD(v417) = 0;
                      goto LABEL_1199;
                    }
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                    v337 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v337, "userInterfaceIdiom"))
                    {
                      LODWORD(v417) = 0;
                      LODWORD(v421) = 1;
                      goto LABEL_1199;
                    }
                  }
                  LODWORD(v421) = v263 ^ 1;
                  if (SBFEffectiveHomeButtonType() == 2)
                  {
                    v267 = __sb__runningInSpringBoard();
                    if (v267)
                    {
                      __sb__mainScreenReferenceBounds();
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                      v323 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v323, "_referenceBounds");
                    }
                    LODWORD(v417) = v267 ^ 1;
                    BSSizeRoundForScale();
                    if (v274 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
                    {
                      LODWORD(v419) = 0;
                      LODWORD(v418) = 0;
                      LODWORD(v416) = 0;
                      LODWORD(v413) = 0;
                      LODWORD(v415) = 0;
                      LODWORD(v414) = 0;
                      LODWORD(v412) = 0;
                      LODWORD(v411) = 0;
                      v59 = 0;
                      v60 = 0;
                      v61 = 0.0;
LABEL_1247:
                      v34 = v513;
                      goto LABEL_132;
                    }
                  }
                  else
                  {
                    LODWORD(v417) = 0;
                  }
LABEL_1199:
                  v268 = __sb__runningInSpringBoard();
                  if (v268)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
                      LODWORD(v419) = 0;
                      LODWORD(v418) = 0;
                      goto LABEL_1219;
                    }
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                    v331 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v331, "userInterfaceIdiom"))
                    {
                      LODWORD(v418) = 0;
                      LODWORD(v419) = 1;
                      goto LABEL_1219;
                    }
                  }
                  LODWORD(v419) = v268 ^ 1;
                  if (SBFEffectiveHomeButtonType() == 2)
                  {
                    v271 = __sb__runningInSpringBoard();
                    if (v271)
                    {
                      __sb__mainScreenReferenceBounds();
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                      v321 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v321, "_referenceBounds");
                    }
                    LODWORD(v418) = v271 ^ 1;
                    BSSizeRoundForScale();
                    if (v276 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
                      goto LABEL_1239;
                  }
                  else
                  {
                    LODWORD(v418) = 0;
                  }
LABEL_1219:
                  if ((_SBF_Private_IsD53() & 1) != 0)
                  {
LABEL_1243:
                    LODWORD(v416) = 0;
                    LODWORD(v413) = 0;
                    LODWORD(v415) = 0;
                    LODWORD(v414) = 0;
                    LODWORD(v412) = 0;
                    LODWORD(v411) = 0;
                    v59 = 0;
                    v60 = 0;
                    v61 = 0.0;
                    goto LABEL_1247;
                  }
LABEL_1239:
                  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
                    || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
                  {
                    goto LABEL_1243;
                  }
                  v61 = 0.0;
                  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
                    || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
                  {
                    LODWORD(v416) = 0;
                    LODWORD(v413) = 0;
                    LODWORD(v415) = 0;
                    LODWORD(v414) = 0;
                    LODWORD(v412) = 0;
                    LODWORD(v411) = 0;
                    v59 = 0;
                    v60 = 0;
                    goto LABEL_1247;
                  }
                  v278 = __sb__runningInSpringBoard();
                  if (v278)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
                      LODWORD(v416) = 0;
                      LODWORD(v413) = 0;
                      goto LABEL_1317;
                    }
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                    v319 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v319, "userInterfaceIdiom"))
                    {
                      LODWORD(v413) = 0;
                      LODWORD(v416) = 1;
                      goto LABEL_1317;
                    }
                  }
                  LODWORD(v416) = v278 ^ 1;
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
                      v308 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v308, "_referenceBounds");
                    }
                    LODWORD(v413) = v286 ^ 1;
                    BSSizeRoundForScale();
                    if (v294 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
                    {
                      LODWORD(v415) = 0;
                      LODWORD(v414) = 0;
                      LODWORD(v412) = 0;
                      LODWORD(v411) = 0;
                      v59 = 0;
                      v60 = 0;
                      goto LABEL_1247;
                    }
                  }
                  else
                  {
                    LODWORD(v413) = 0;
                  }
LABEL_1317:
                  v287 = __sb__runningInSpringBoard();
                  if (v287)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
                      LODWORD(v415) = 0;
                      LODWORD(v414) = 0;
                      goto LABEL_1337;
                    }
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                    v317 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v317, "userInterfaceIdiom"))
                    {
                      LODWORD(v414) = 0;
                      LODWORD(v415) = 1;
                      goto LABEL_1337;
                    }
                  }
                  LODWORD(v415) = v287 ^ 1;
                  if (SBFEffectiveHomeButtonType() == 2)
                  {
                    v290 = __sb__runningInSpringBoard();
                    if (v290)
                    {
                      __sb__mainScreenReferenceBounds();
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                      v306 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v306, "_referenceBounds");
                    }
                    LODWORD(v414) = v290 ^ 1;
                    BSSizeRoundForScale();
                    if (v302 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
                    {
                      LODWORD(v412) = 0;
                      LODWORD(v411) = 0;
                      v59 = 0;
                      v60 = 0;
                      goto LABEL_1247;
                    }
                  }
                  else
                  {
                    LODWORD(v414) = 0;
                  }
LABEL_1337:
                  v291 = __sb__runningInSpringBoard();
                  if (v291)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
                      LODWORD(v412) = 0;
                      LODWORD(v411) = 0;
                      goto LABEL_1363;
                    }
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                    v315 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v315, "userInterfaceIdiom"))
                    {
                      LODWORD(v411) = 0;
                      LODWORD(v412) = 1;
                      goto LABEL_1363;
                    }
                  }
                  LODWORD(v412) = v291 ^ 1;
                  v296 = __sb__runningInSpringBoard();
                  if (v296)
                  {
                    __sb__mainScreenReferenceBounds();
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                    v311 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v311, "_referenceBounds");
                  }
                  LODWORD(v411) = v296 ^ 1;
                  BSSizeRoundForScale();
                  if (v297 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
                    goto LABEL_1366;
LABEL_1363:
                  v298 = __sb__runningInSpringBoard();
                  if (v298)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
LABEL_1366:
                      v59 = 0;
                      v60 = 0;
                      goto LABEL_1247;
                    }
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                    v313 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v313, "userInterfaceIdiom"))
                    {
                      v60 = 0;
                      v59 = 1;
                      goto LABEL_1247;
                    }
                  }
                  v304 = __sb__runningInSpringBoard();
                  if (v304)
                  {
                    __sb__mainScreenReferenceBounds();
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                    a7 = (BOOL *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(a7, "_referenceBounds");
                  }
                  BSSizeRoundForScale();
                  v60 = v304 ^ 1;
                  v34 = v513;
                  v59 = v298 ^ 1;
                  goto LABEL_132;
                }
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                v59 = 0;
                v60 = 0;
                v61 = 0.0;
LABEL_1163:
                v34 = v513;
                goto LABEL_132;
              }
            }
            else
            {
              LODWORD(v425) = 0;
            }
LABEL_1072:
            if ((_SBF_Private_IsD63Like() & 1) != 0)
            {
              v357 = (void *)v171;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              v59 = 0;
              v60 = 0;
              v61 = -1.0;
              goto LABEL_132;
            }
            goto LABEL_1076;
          }
        }
        v398 = v36;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        LODWORD(v442) = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v431) = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        v59 = 0;
        v60 = 0;
        v61 = 0.0;
        LODWORD(v450) = v120 ^ 1;
LABEL_132:
        v62 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v463 = 0;
        v465 = 0;
        v467 = 0;
        v469 = 0;
        v471 = 0;
        v475 = 0;
        v473 = 0;
        v477 = 0;
        v479 = 0;
        v481 = 0;
        v485 = 0;
        v487 = 0;
        v483 = 0;
        v489 = 0;
        v491 = 0;
        v495 = 0;
        v493 = 0;
        v497 = 0;
        v499 = 0;
        v501 = 0;
        v503 = 0;
        v505 = 0;
        v507 = 0;
        v69 = -v61;
        goto LABEL_133;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "userInterfaceIdiom") != 1)
      {
        LODWORD(v451) = 0;
        LODWORD(v452) = 1;
        goto LABEL_545;
      }
    }
    LODWORD(v452) = v71 ^ 1;
    v72 = __sb__runningInSpringBoard();
    if (v72)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_referenceBounds");
    }
    LODWORD(v451) = v72 ^ 1;
    BSSizeRoundForScale();
    if (v119 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
    {
      v401 = v9;
      v402 = v8;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      LODWORD(v442) = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      LODWORD(v431) = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v419) = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0.0;
      goto LABEL_132;
    }
    goto LABEL_545;
  }
  if (v37)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v507 = 0;
      goto LABEL_34;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v407 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v407, "userInterfaceIdiom") != 1)
    {
      v507 = 0x100000000;
      goto LABEL_34;
    }
  }
  a7 = (BOOL *)(v38 ^ 1u);
  HIDWORD(v507) = v38 ^ 1;
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
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v388, "_referenceBounds");
    }
    a7 = (BOOL *)(v40 ^ 1u);
    BSSizeRoundForScale();
    LODWORD(v507) = v40 ^ 1;
    if (v79 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v78 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v461 = 0;
      v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      v67 = 0;
      LODWORD(v458) = 0;
      v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      v467 = 0;
      LODWORD(v442) = 0;
      v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      v475 = 0;
      LODWORD(v431) = 0;
      v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      v479 = 0;
      LODWORD(v419) = 0;
      v481 = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      v485 = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      v487 = 0;
      v59 = 0;
      v60 = 0;
      v483 = 0;
      v489 = 0;
      v491 = 0;
      v495 = 0;
      v493 = 0;
      v497 = 0;
      v499 = 0;
      v501 = 0;
      v503 = 0;
      v505 = 0;
      v69 = 0.0;
      goto LABEL_133;
    }
  }
  else
  {
    LODWORD(v507) = 0;
  }
LABEL_34:
  v43 = __sb__runningInSpringBoard();
  if (v43)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      LODWORD(v495) = 0;
      HIDWORD(v499) = 0;
      goto LABEL_52;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v405 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v405, "userInterfaceIdiom") != 1)
    {
      LODWORD(v495) = 0;
      HIDWORD(v499) = 1;
      goto LABEL_52;
    }
  }
  a7 = (BOOL *)(v43 ^ 1u);
  HIDWORD(v499) = v43 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v44 = __sb__runningInSpringBoard();
    if (v44)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v386 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v386, "_referenceBounds");
    }
    a7 = (BOOL *)(v44 ^ 1u);
    BSSizeRoundForScale();
    LODWORD(v495) = v44 ^ 1;
    if (v81 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v461 = 0;
      v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      v67 = 0;
      LODWORD(v458) = 0;
      v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      v467 = 0;
      LODWORD(v442) = 0;
      v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      v475 = 0;
      LODWORD(v431) = 0;
      v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      v479 = 0;
      LODWORD(v419) = 0;
      v481 = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      v485 = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      v487 = 0;
      v59 = 0;
      v60 = 0;
      v483 = 0;
      v489 = 0;
      v491 = 0;
      HIDWORD(v495) = 0;
      v493 = 0;
      v497 = 0;
      LODWORD(v499) = 0;
      v501 = 0;
      v503 = 0;
      v505 = 0;
      v69 = 0.0;
      goto LABEL_133;
    }
  }
  else
  {
    LODWORD(v495) = 0;
  }
LABEL_52:
  v47 = __sb__runningInSpringBoard();
  if (v47)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v505 = 0;
      goto LABEL_69;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v403 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v403, "userInterfaceIdiom") != 1)
    {
      v505 = 0x100000000;
      goto LABEL_69;
    }
  }
  HIDWORD(v505) = v47 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v48 = __sb__runningInSpringBoard();
    if (v48)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v384, "_referenceBounds");
    }
    LODWORD(v505) = v48 ^ 1;
    BSSizeRoundForScale();
    if (v118 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v461 = 0;
      v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      v67 = 0;
      LODWORD(v458) = 0;
      v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      v467 = 0;
      LODWORD(v442) = 0;
      v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      v475 = 0;
      LODWORD(v431) = 0;
      v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      v479 = 0;
      LODWORD(v419) = 0;
      v481 = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      v485 = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      v487 = 0;
      v59 = 0;
      v60 = 0;
      v483 = 0;
      v489 = 0;
      v491 = 0;
      HIDWORD(v495) = 0;
      v493 = 0;
      v497 = 0;
      LODWORD(v499) = 0;
      v501 = 0;
      v503 = 0;
      v69 = 0.0;
      goto LABEL_133;
    }
  }
  else
  {
    LODWORD(v505) = 0;
  }
LABEL_69:
  v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v503 = 0;
      goto LABEL_87;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v399 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v399, "userInterfaceIdiom") != 1)
    {
      v503 = 0x100000000;
      goto LABEL_87;
    }
  }
  HIDWORD(v503) = v51 ^ 1;
  v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v394 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v394, "_referenceBounds");
  }
  LODWORD(v503) = v52 ^ 1;
  BSSizeRoundForScale();
  if (v56 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v461 = 0;
    v65 = 0;
    LODWORD(v454) = 0;
    LODWORD(v453) = 0;
    v66 = 0;
    LODWORD(v447) = 0;
    LODWORD(v460) = 0;
    LODWORD(v459) = 0;
    v67 = 0;
    LODWORD(v458) = 0;
    v68 = 0;
    LODWORD(v457) = 0;
    LODWORD(v456) = 0;
    LODWORD(v455) = 0;
    v463 = 0;
    LODWORD(v452) = 0;
    LODWORD(v451) = 0;
    LODWORD(v450) = 0;
    LODWORD(v449) = 0;
    LODWORD(v448) = 0;
    v465 = 0;
    LODWORD(v446) = 0;
    LODWORD(v443) = 0;
    LODWORD(v445) = 0;
    LODWORD(v444) = 0;
    v467 = 0;
    LODWORD(v442) = 0;
    v469 = 0;
    LODWORD(v435) = 0;
    LODWORD(v441) = 0;
    LODWORD(v440) = 0;
    LODWORD(v439) = 0;
    LODWORD(v438) = 0;
    LODWORD(v437) = 0;
    LODWORD(v436) = 0;
    v471 = 0;
    LODWORD(v434) = 0;
    LODWORD(v433) = 0;
    LODWORD(v432) = 0;
    LODWORD(v429) = 0;
    v475 = 0;
    LODWORD(v431) = 0;
    v473 = 0;
    LODWORD(v430) = 0;
    LODWORD(v427) = 0;
    LODWORD(v426) = 0;
    LODWORD(v428) = 0;
    v477 = 0;
    LODWORD(v425) = 0;
    LODWORD(v422) = 0;
    LODWORD(v420) = 0;
    LODWORD(v424) = 0;
    LODWORD(v423) = 0;
    LODWORD(v421) = 0;
    LODWORD(v417) = 0;
    v479 = 0;
    LODWORD(v419) = 0;
    v481 = 0;
    LODWORD(v418) = 0;
    LODWORD(v416) = 0;
    LODWORD(v413) = 0;
    LODWORD(v415) = 0;
    v485 = 0;
    LODWORD(v414) = 0;
    LODWORD(v412) = 0;
    LODWORD(v411) = 0;
    v487 = 0;
    v59 = 0;
    v60 = 0;
    v483 = 0;
    v489 = 0;
    v491 = 0;
    HIDWORD(v495) = 0;
    v493 = 0;
    v497 = 0;
    LODWORD(v499) = 0;
    v501 = 0;
    v69 = 0.0;
    goto LABEL_133;
  }
LABEL_87:
  v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v501 = 0;
      goto LABEL_107;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v397 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v397, "userInterfaceIdiom") != 1)
    {
      v501 = 0x100000000;
      goto LABEL_107;
    }
  }
  HIDWORD(v501) = v57 ^ 1;
  v58 = __sb__runningInSpringBoard();
  if (v58)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v390 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v390, "_referenceBounds");
  }
  LODWORD(v501) = v58 ^ 1;
  BSSizeRoundForScale();
  if (v73 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v461 = 0;
    v65 = 0;
    LODWORD(v454) = 0;
    LODWORD(v453) = 0;
    v66 = 0;
    LODWORD(v447) = 0;
    LODWORD(v460) = 0;
    LODWORD(v459) = 0;
    v67 = 0;
    LODWORD(v458) = 0;
    v68 = 0;
    LODWORD(v457) = 0;
    LODWORD(v456) = 0;
    LODWORD(v455) = 0;
    v463 = 0;
    LODWORD(v452) = 0;
    LODWORD(v451) = 0;
    LODWORD(v450) = 0;
    LODWORD(v449) = 0;
    LODWORD(v448) = 0;
    v465 = 0;
    LODWORD(v446) = 0;
    LODWORD(v443) = 0;
    LODWORD(v445) = 0;
    LODWORD(v444) = 0;
    v467 = 0;
    LODWORD(v442) = 0;
    v469 = 0;
    LODWORD(v435) = 0;
    LODWORD(v441) = 0;
    LODWORD(v440) = 0;
    LODWORD(v439) = 0;
    LODWORD(v438) = 0;
    LODWORD(v437) = 0;
    LODWORD(v436) = 0;
    v471 = 0;
    LODWORD(v434) = 0;
    LODWORD(v433) = 0;
    LODWORD(v432) = 0;
    LODWORD(v429) = 0;
    v475 = 0;
    LODWORD(v431) = 0;
    v473 = 0;
    LODWORD(v430) = 0;
    LODWORD(v427) = 0;
    LODWORD(v426) = 0;
    LODWORD(v428) = 0;
    v477 = 0;
    LODWORD(v425) = 0;
    LODWORD(v422) = 0;
    LODWORD(v420) = 0;
    LODWORD(v424) = 0;
    LODWORD(v423) = 0;
    LODWORD(v421) = 0;
    LODWORD(v417) = 0;
    v479 = 0;
    LODWORD(v419) = 0;
    v481 = 0;
    LODWORD(v418) = 0;
    LODWORD(v416) = 0;
    LODWORD(v413) = 0;
    LODWORD(v415) = 0;
    v485 = 0;
    LODWORD(v414) = 0;
    LODWORD(v412) = 0;
    LODWORD(v411) = 0;
    v487 = 0;
    v59 = 0;
    v60 = 0;
    v483 = 0;
    v489 = 0;
    v491 = 0;
    HIDWORD(v495) = 0;
    v493 = 0;
    v497 = 0;
    LODWORD(v499) = 0;
    v69 = 0.0;
    goto LABEL_133;
  }
LABEL_107:
  v74 = __sb__runningInSpringBoard();
  if (v74)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v497) = 0;
      LODWORD(v499) = 0;
      goto LABEL_557;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v396 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v396, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v497) = 0;
      LODWORD(v499) = 1;
      goto LABEL_557;
    }
  }
  LODWORD(v499) = v74 ^ 1;
  v75 = __sb__runningInSpringBoard();
  if (v75)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v383 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v383, "_referenceBounds");
  }
  HIDWORD(v497) = v75 ^ 1;
  BSSizeRoundForScale();
  if (v124 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v461 = 0;
    v65 = 0;
    LODWORD(v454) = 0;
    LODWORD(v453) = 0;
    v66 = 0;
    LODWORD(v447) = 0;
    LODWORD(v460) = 0;
    LODWORD(v459) = 0;
    v67 = 0;
    LODWORD(v458) = 0;
    v68 = 0;
    LODWORD(v457) = 0;
    LODWORD(v456) = 0;
    LODWORD(v455) = 0;
    v463 = 0;
    LODWORD(v452) = 0;
    LODWORD(v451) = 0;
    LODWORD(v450) = 0;
    LODWORD(v449) = 0;
    LODWORD(v448) = 0;
    v465 = 0;
    LODWORD(v446) = 0;
    LODWORD(v443) = 0;
    LODWORD(v445) = 0;
    LODWORD(v444) = 0;
    v467 = 0;
    LODWORD(v442) = 0;
    v469 = 0;
    LODWORD(v435) = 0;
    LODWORD(v441) = 0;
    LODWORD(v440) = 0;
    LODWORD(v439) = 0;
    LODWORD(v438) = 0;
    LODWORD(v437) = 0;
    LODWORD(v436) = 0;
    v471 = 0;
    LODWORD(v434) = 0;
    LODWORD(v433) = 0;
    LODWORD(v432) = 0;
    LODWORD(v429) = 0;
    v475 = 0;
    LODWORD(v431) = 0;
    v473 = 0;
    LODWORD(v430) = 0;
    LODWORD(v427) = 0;
    LODWORD(v426) = 0;
    LODWORD(v428) = 0;
    v477 = 0;
    LODWORD(v425) = 0;
    LODWORD(v422) = 0;
    LODWORD(v420) = 0;
    LODWORD(v424) = 0;
    LODWORD(v423) = 0;
    LODWORD(v421) = 0;
    LODWORD(v417) = 0;
    v479 = 0;
    LODWORD(v419) = 0;
    v481 = 0;
    LODWORD(v418) = 0;
    LODWORD(v416) = 0;
    LODWORD(v413) = 0;
    LODWORD(v415) = 0;
    v485 = 0;
    LODWORD(v414) = 0;
    LODWORD(v412) = 0;
    LODWORD(v411) = 0;
    v487 = 0;
    v59 = 0;
    v60 = 0;
    v483 = 0;
    v489 = 0;
    v491 = 0;
    HIDWORD(v495) = 0;
    v493 = 0;
    LODWORD(v497) = 0;
    v69 = 0.0;
    goto LABEL_133;
  }
LABEL_557:
  v125 = __sb__runningInSpringBoard();
  if (v125)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_559;
LABEL_565:
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v461 = 0;
    v65 = 0;
    LODWORD(v454) = 0;
    LODWORD(v453) = 0;
    v66 = 0;
    LODWORD(v447) = 0;
    LODWORD(v460) = 0;
    LODWORD(v459) = 0;
    v67 = 0;
    LODWORD(v458) = 0;
    v68 = 0;
    LODWORD(v457) = 0;
    LODWORD(v456) = 0;
    LODWORD(v455) = 0;
    v463 = 0;
    LODWORD(v452) = 0;
    LODWORD(v451) = 0;
    LODWORD(v450) = 0;
    LODWORD(v449) = 0;
    LODWORD(v448) = 0;
    v465 = 0;
    LODWORD(v446) = 0;
    LODWORD(v443) = 0;
    LODWORD(v445) = 0;
    LODWORD(v444) = 0;
    v467 = 0;
    LODWORD(v442) = 0;
    v469 = 0;
    LODWORD(v435) = 0;
    LODWORD(v441) = 0;
    LODWORD(v440) = 0;
    LODWORD(v439) = 0;
    LODWORD(v438) = 0;
    LODWORD(v437) = 0;
    LODWORD(v436) = 0;
    v471 = 0;
    LODWORD(v434) = 0;
    LODWORD(v433) = 0;
    LODWORD(v432) = 0;
    LODWORD(v429) = 0;
    v475 = 0;
    LODWORD(v431) = 0;
    v473 = 0;
    LODWORD(v430) = 0;
    LODWORD(v427) = 0;
    LODWORD(v426) = 0;
    LODWORD(v428) = 0;
    v477 = 0;
    LODWORD(v425) = 0;
    LODWORD(v422) = 0;
    LODWORD(v420) = 0;
    LODWORD(v424) = 0;
    LODWORD(v423) = 0;
    LODWORD(v421) = 0;
    LODWORD(v417) = 0;
    v479 = 0;
    LODWORD(v419) = 0;
    v481 = 0;
    LODWORD(v418) = 0;
    LODWORD(v416) = 0;
    LODWORD(v413) = 0;
    LODWORD(v415) = 0;
    v485 = 0;
    LODWORD(v414) = 0;
    LODWORD(v412) = 0;
    LODWORD(v411) = 0;
    v487 = 0;
    v59 = 0;
    v60 = 0;
    v483 = 0;
    v489 = 0;
    v491 = 0;
    HIDWORD(v495) = 0;
    v493 = 0;
    v69 = 0.0;
    LODWORD(v497) = v125 ^ 1;
    goto LABEL_133;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v393, "userInterfaceIdiom") == 1)
    goto LABEL_565;
LABEL_559:
  a7 = (BOOL *)(v125 ^ 1u);
  LODWORD(v497) = v125 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_563:
    v493 = 0;
    goto LABEL_665;
  }
  v126 = __sb__runningInSpringBoard();
  if (v126)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_563;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v377 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v377, "userInterfaceIdiom"))
    {
      v493 = 0x100000000;
      goto LABEL_665;
    }
  }
  HIDWORD(v493) = v126 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v147 = __sb__runningInSpringBoard();
    if (v147)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v360 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v360, "_referenceBounds");
    }
    LODWORD(v493) = v147 ^ 1;
    BSSizeRoundForScale();
    if (v156 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v461 = 0;
      v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      v67 = 0;
      LODWORD(v458) = 0;
      v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      v467 = 0;
      LODWORD(v442) = 0;
      v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      v475 = 0;
      LODWORD(v431) = 0;
      v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      v479 = 0;
      LODWORD(v419) = 0;
      v481 = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      v485 = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      v487 = 0;
      v59 = 0;
      v60 = 0;
      v483 = 0;
      v489 = 0;
      v491 = 0;
      HIDWORD(v495) = 0;
      v69 = 0.0;
      goto LABEL_133;
    }
  }
  else
  {
    LODWORD(v493) = 0;
  }
LABEL_665:
  v148 = __sb__runningInSpringBoard();
  if (v148)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v491) = 0;
      HIDWORD(v495) = 0;
      goto LABEL_675;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v379 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v379, "userInterfaceIdiom"))
    {
      HIDWORD(v491) = 0;
      HIDWORD(v495) = 1;
      goto LABEL_675;
    }
  }
  HIDWORD(v495) = v148 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v149 = __sb__runningInSpringBoard();
    if (v149)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v367 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v367, "_referenceBounds");
    }
    HIDWORD(v491) = v149 ^ 1;
    BSSizeRoundForScale();
    if (v150 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_679;
  }
  else
  {
    HIDWORD(v491) = 0;
  }
LABEL_675:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v461 = 0;
    v65 = 0;
    LODWORD(v454) = 0;
    LODWORD(v453) = 0;
    v66 = 0;
    LODWORD(v447) = 0;
    LODWORD(v460) = 0;
    LODWORD(v459) = 0;
    v67 = 0;
    LODWORD(v458) = 0;
    v68 = 0;
    LODWORD(v457) = 0;
    LODWORD(v456) = 0;
    LODWORD(v455) = 0;
    v463 = 0;
    LODWORD(v452) = 0;
    LODWORD(v451) = 0;
    LODWORD(v450) = 0;
    LODWORD(v449) = 0;
    LODWORD(v448) = 0;
    v465 = 0;
    LODWORD(v446) = 0;
    LODWORD(v443) = 0;
    LODWORD(v445) = 0;
    LODWORD(v444) = 0;
    v467 = 0;
    LODWORD(v442) = 0;
    v469 = 0;
    LODWORD(v435) = 0;
    LODWORD(v441) = 0;
    LODWORD(v440) = 0;
    LODWORD(v439) = 0;
    LODWORD(v438) = 0;
    LODWORD(v437) = 0;
    LODWORD(v436) = 0;
    v471 = 0;
    LODWORD(v434) = 0;
    LODWORD(v433) = 0;
    LODWORD(v432) = 0;
    LODWORD(v429) = 0;
    v475 = 0;
    LODWORD(v431) = 0;
    v473 = 0;
    LODWORD(v430) = 0;
    LODWORD(v427) = 0;
    LODWORD(v426) = 0;
    LODWORD(v428) = 0;
    v477 = 0;
    LODWORD(v425) = 0;
    LODWORD(v422) = 0;
    LODWORD(v420) = 0;
    LODWORD(v424) = 0;
    LODWORD(v423) = 0;
    LODWORD(v421) = 0;
    LODWORD(v417) = 0;
    v479 = 0;
    LODWORD(v419) = 0;
    v481 = 0;
    LODWORD(v418) = 0;
    LODWORD(v416) = 0;
    LODWORD(v413) = 0;
    LODWORD(v415) = 0;
    v485 = 0;
    LODWORD(v414) = 0;
    LODWORD(v412) = 0;
    LODWORD(v411) = 0;
    v487 = 0;
    v59 = 0;
    v60 = 0;
    v483 = 0;
    v489 = 0;
    LODWORD(v491) = 0;
    v69 = 0.0;
    goto LABEL_133;
  }
LABEL_679:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_683:
    HIDWORD(v489) = 0;
    LODWORD(v491) = 0;
    goto LABEL_760;
  }
  v151 = __sb__runningInSpringBoard();
  if (v151)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_683;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v368 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v368, "userInterfaceIdiom"))
    {
      HIDWORD(v489) = 0;
      LODWORD(v491) = 1;
      goto LABEL_760;
    }
  }
  LODWORD(v491) = v151 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    HIDWORD(v489) = 0;
    goto LABEL_760;
  }
  v172 = __sb__runningInSpringBoard();
  if (v172)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v353 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v353, "_referenceBounds");
  }
  HIDWORD(v489) = v172 ^ 1;
  BSSizeRoundForScale();
  if (v186 < *(double *)(MEMORY[0x1E0DAB260] + 136))
  {
LABEL_760:
    v173 = __sb__runningInSpringBoard();
    if (v173)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        LODWORD(v485) = 0;
        LODWORD(v489) = 0;
        goto LABEL_770;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v376 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v376, "userInterfaceIdiom"))
      {
        LODWORD(v485) = 0;
        LODWORD(v489) = 1;
        goto LABEL_770;
      }
    }
    LODWORD(v489) = v173 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v174 = __sb__runningInSpringBoard();
      if (v174)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v359 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v359, "_referenceBounds");
      }
      LODWORD(v485) = v174 ^ 1;
      BSSizeRoundForScale();
      if (v175 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
        goto LABEL_774;
    }
    else
    {
      LODWORD(v485) = 0;
    }
LABEL_770:
    if ((_SBF_Private_IsD64Like() & 1) != 0)
    {
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v461 = 0;
      v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      v67 = 0;
      LODWORD(v458) = 0;
      v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      v467 = 0;
      LODWORD(v442) = 0;
      v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      v475 = 0;
      LODWORD(v431) = 0;
      v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      v479 = 0;
      LODWORD(v419) = 0;
      v481 = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      HIDWORD(v485) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      v487 = 0;
      v59 = 0;
      v60 = 0;
      v483 = 0;
      v69 = -1.0;
      goto LABEL_133;
    }
LABEL_774:
    v176 = __sb__runningInSpringBoard();
    if (v176)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        HIDWORD(v483) = 0;
        HIDWORD(v487) = 0;
        goto LABEL_784;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v371 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v371, "userInterfaceIdiom"))
      {
        HIDWORD(v483) = 0;
        HIDWORD(v487) = 1;
        goto LABEL_784;
      }
    }
    HIDWORD(v487) = v176 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v177 = __sb__runningInSpringBoard();
      if (v177)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v354 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v354, "_referenceBounds");
      }
      BSSizeRoundForScale();
      HIDWORD(v483) = v177 ^ 1;
      if (v183 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      {
        v62 = 0;
        v63 = 0;
        v64 = 0;
        v461 = 0;
        v65 = 0;
        LODWORD(v454) = 0;
        LODWORD(v453) = 0;
        v66 = 0;
        LODWORD(v447) = 0;
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        v67 = 0;
        LODWORD(v458) = 0;
        v68 = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        v463 = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        v465 = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        v467 = 0;
        LODWORD(v442) = 0;
        v469 = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        v471 = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        v475 = 0;
        LODWORD(v431) = 0;
        v473 = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        v477 = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        v479 = 0;
        LODWORD(v419) = 0;
        v481 = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        HIDWORD(v485) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        LODWORD(v487) = 0;
        v59 = 0;
        LODWORD(v483) = 0;
        v69 = 0.0;
        goto LABEL_135;
      }
    }
    else
    {
      HIDWORD(v483) = 0;
    }
LABEL_784:
    v178 = __sb__runningInSpringBoard();
    if (v178)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        HIDWORD(v479) = 0;
        LODWORD(v483) = 0;
        goto LABEL_807;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v366 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v366, "userInterfaceIdiom"))
      {
        HIDWORD(v479) = 0;
        LODWORD(v483) = 1;
        goto LABEL_807;
      }
    }
    LODWORD(v483) = v178 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v181 = __sb__runningInSpringBoard();
      if (v181)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v352 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v352, "_referenceBounds");
      }
      HIDWORD(v479) = v181 ^ 1;
      BSSizeRoundForScale();
      if (v193 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
        goto LABEL_844;
    }
    else
    {
      HIDWORD(v479) = 0;
    }
LABEL_807:
    if ((_SBF_Private_IsD54() & 1) != 0)
    {
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v461 = 0;
      v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      v67 = 0;
      LODWORD(v458) = 0;
      v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      v467 = 0;
      LODWORD(v442) = 0;
      v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      v475 = 0;
      LODWORD(v431) = 0;
      v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v479) = 0;
      LODWORD(v419) = 0;
      v481 = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      HIDWORD(v485) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      LODWORD(v487) = 0;
      v59 = 0;
      v69 = 0.0;
      goto LABEL_135;
    }
LABEL_844:
    v194 = __sb__runningInSpringBoard();
    if (v194)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        HIDWORD(v485) = 0;
        LODWORD(v487) = 0;
        goto LABEL_864;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v361, "userInterfaceIdiom"))
      {
        HIDWORD(v485) = 0;
        LODWORD(v487) = 1;
        goto LABEL_864;
      }
    }
    LODWORD(v487) = v194 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v199 = __sb__runningInSpringBoard();
      if (v199)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v348 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v348, "_referenceBounds");
      }
      HIDWORD(v485) = v199 ^ 1;
      BSSizeRoundForScale();
      if (v209 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
      {
        v62 = 0;
        v63 = 0;
        v64 = 0;
        v461 = 0;
        v65 = 0;
        LODWORD(v454) = 0;
        LODWORD(v453) = 0;
        v66 = 0;
        LODWORD(v447) = 0;
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        v67 = 0;
        LODWORD(v458) = 0;
        v68 = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        v463 = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        v465 = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        v467 = 0;
        LODWORD(v442) = 0;
        v469 = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        v471 = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        v475 = 0;
        LODWORD(v431) = 0;
        v473 = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        v477 = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v479) = 0;
        LODWORD(v419) = 0;
        v481 = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        v59 = 0;
        v69 = 0.0;
        goto LABEL_135;
      }
    }
    else
    {
      HIDWORD(v485) = 0;
    }
LABEL_864:
    v200 = __sb__runningInSpringBoard();
    if (v200)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v481 = 0;
        goto LABEL_881;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v358, "userInterfaceIdiom"))
      {
        v481 = 0x100000000;
        goto LABEL_881;
      }
    }
    HIDWORD(v481) = v200 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v202 = __sb__runningInSpringBoard();
      if (v202)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v346 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v346, "_referenceBounds");
      }
      LODWORD(v481) = v202 ^ 1;
      BSSizeRoundForScale();
      if (v212 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
        goto LABEL_928;
    }
    else
    {
      LODWORD(v481) = 0;
    }
LABEL_881:
    if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
    {
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v461 = 0;
      v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      v67 = 0;
      LODWORD(v458) = 0;
      v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      v467 = 0;
      LODWORD(v442) = 0;
      v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      v475 = 0;
      LODWORD(v431) = 0;
      v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v479) = 0;
      LODWORD(v419) = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      v59 = 0;
      v69 = 0.0;
      goto LABEL_135;
    }
LABEL_928:
    if (!_SBF_Private_IsD93Like())
    {
LABEL_932:
      HIDWORD(v475) = 0;
      LODWORD(v479) = 0;
      goto LABEL_1001;
    }
    v213 = __sb__runningInSpringBoard();
    if (v213)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        goto LABEL_932;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v350 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v350, "userInterfaceIdiom"))
      {
        HIDWORD(v475) = 0;
        LODWORD(v479) = 1;
        goto LABEL_1001;
      }
    }
    LODWORD(v479) = v213 ^ 1;
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
        v335 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v335, "_referenceBounds");
      }
      HIDWORD(v475) = v227 ^ 1;
      BSSizeRoundForScale();
      if (v236 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      {
        v62 = 0;
        v63 = 0;
        v64 = 0;
        v461 = 0;
        v65 = 0;
        LODWORD(v454) = 0;
        LODWORD(v453) = 0;
        v66 = 0;
        LODWORD(v447) = 0;
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        v67 = 0;
        LODWORD(v458) = 0;
        v68 = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        v463 = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        v465 = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        v467 = 0;
        LODWORD(v442) = 0;
        v469 = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        v471 = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v475) = 0;
        LODWORD(v431) = 0;
        v473 = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        v477 = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        v59 = 0;
        v69 = 0.0;
        goto LABEL_135;
      }
    }
    else
    {
      HIDWORD(v475) = 0;
    }
LABEL_1001:
    v228 = __sb__runningInSpringBoard();
    if (v228)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v477 = 0;
        goto LABEL_1011;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v355 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v355, "userInterfaceIdiom"))
      {
        v477 = 0x100000000;
        goto LABEL_1011;
      }
    }
    HIDWORD(v477) = v228 ^ 1;
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
        v341 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v341, "_referenceBounds");
      }
      LODWORD(v477) = v229 ^ 1;
      BSSizeRoundForScale();
      if (v230 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
        goto LABEL_1015;
    }
    else
    {
      LODWORD(v477) = 0;
    }
LABEL_1011:
    if ((_SBF_Private_IsD93Like() & 1) != 0)
    {
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v461 = 0;
      v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      v67 = 0;
      LODWORD(v458) = 0;
      v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      v467 = 0;
      LODWORD(v442) = 0;
      v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      LODWORD(v475) = 0;
      LODWORD(v431) = 0;
      v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v419) = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      v59 = 0;
      v69 = 0.0;
      goto LABEL_135;
    }
LABEL_1015:
    if (!_SBF_Private_IsD63Like())
    {
LABEL_1019:
      v473 = 0;
      goto LABEL_1096;
    }
    v231 = __sb__runningInSpringBoard();
    if (v231)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        goto LABEL_1019;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v342 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v342, "userInterfaceIdiom"))
      {
        v473 = 0x100000000;
        goto LABEL_1096;
      }
    }
    HIDWORD(v473) = v231 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v247 = __sb__runningInSpringBoard();
      if (v247)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v327 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v327, "_referenceBounds");
      }
      LODWORD(v473) = v247 ^ 1;
      BSSizeRoundForScale();
      if (v261 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      {
        v62 = 0;
        v63 = 0;
        v64 = 0;
        v461 = 0;
        v65 = 0;
        LODWORD(v454) = 0;
        LODWORD(v453) = 0;
        v66 = 0;
        LODWORD(v447) = 0;
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        v67 = 0;
        LODWORD(v458) = 0;
        v68 = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        v463 = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        v465 = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        v467 = 0;
        LODWORD(v442) = 0;
        v469 = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        v471 = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v475) = 0;
        LODWORD(v431) = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        v59 = 0;
        v69 = -1.0;
        goto LABEL_1165;
      }
      v34 = v26;
    }
    else
    {
      LODWORD(v473) = 0;
    }
LABEL_1096:
    v248 = __sb__runningInSpringBoard();
    if (v248)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        HIDWORD(v471) = 0;
        LODWORD(v475) = 0;
        goto LABEL_1106;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v349 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v349, "userInterfaceIdiom"))
      {
        HIDWORD(v471) = 0;
        LODWORD(v475) = 1;
        goto LABEL_1106;
      }
    }
    LODWORD(v475) = v248 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v249 = __sb__runningInSpringBoard();
      if (v249)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v334 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v334, "_referenceBounds");
      }
      HIDWORD(v471) = v249 ^ 1;
      BSSizeRoundForScale();
      if (v250 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      {
LABEL_1110:
        v251 = __sb__runningInSpringBoard();
        if (v251)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v467) = 0;
            LODWORD(v471) = 0;
            goto LABEL_1120;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v345 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v345, "userInterfaceIdiom"))
          {
            LODWORD(v467) = 0;
            LODWORD(v471) = 1;
            goto LABEL_1120;
          }
        }
        LODWORD(v471) = v251 ^ 1;
        if (SBFEffectiveHomeButtonType() != 2)
        {
          LODWORD(v467) = 0;
          goto LABEL_1120;
        }
        v252 = __sb__runningInSpringBoard();
        if (v252)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v330 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v330, "_referenceBounds");
        }
        LODWORD(v467) = v252 ^ 1;
        BSSizeRoundForScale();
        if (v257 < *(double *)(MEMORY[0x1E0DAB260] + 120))
        {
          v34 = v26;
LABEL_1120:
          v253 = __sb__runningInSpringBoard();
          if (v253)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
              v469 = 0;
              goto LABEL_1136;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
            v340 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v340, "userInterfaceIdiom"))
            {
              v469 = 0x100000000;
              goto LABEL_1136;
            }
          }
          HIDWORD(v469) = v253 ^ 1;
          if (SBFEffectiveHomeButtonType() == 2)
          {
            v255 = __sb__runningInSpringBoard();
            if (v255)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
              v326 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v326, "_referenceBounds");
            }
            LODWORD(v469) = v255 ^ 1;
            BSSizeRoundForScale();
            v34 = v26;
            if (v264 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
              goto LABEL_1176;
          }
          else
          {
            LODWORD(v469) = 0;
          }
LABEL_1136:
          if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
          {
            v62 = 0;
            v63 = 0;
            v64 = 0;
            v461 = 0;
            v65 = 0;
            LODWORD(v454) = 0;
            LODWORD(v453) = 0;
            v66 = 0;
            LODWORD(v447) = 0;
            LODWORD(v460) = 0;
            LODWORD(v459) = 0;
            v67 = 0;
            LODWORD(v458) = 0;
            v68 = 0;
            LODWORD(v457) = 0;
            LODWORD(v456) = 0;
            LODWORD(v455) = 0;
            v463 = 0;
            LODWORD(v452) = 0;
            LODWORD(v451) = 0;
            LODWORD(v450) = 0;
            LODWORD(v449) = 0;
            LODWORD(v448) = 0;
            v465 = 0;
            LODWORD(v446) = 0;
            LODWORD(v443) = 0;
            LODWORD(v445) = 0;
            LODWORD(v444) = 0;
            HIDWORD(v467) = 0;
            LODWORD(v442) = 0;
            LODWORD(v435) = 0;
            LODWORD(v441) = 0;
            LODWORD(v440) = 0;
            LODWORD(v439) = 0;
            LODWORD(v438) = 0;
            LODWORD(v437) = 0;
            LODWORD(v436) = 0;
            LODWORD(v434) = 0;
            LODWORD(v433) = 0;
            LODWORD(v432) = 0;
            LODWORD(v429) = 0;
            LODWORD(v431) = 0;
            LODWORD(v430) = 0;
            LODWORD(v427) = 0;
            LODWORD(v426) = 0;
            LODWORD(v428) = 0;
            LODWORD(v425) = 0;
            LODWORD(v422) = 0;
            LODWORD(v420) = 0;
            LODWORD(v424) = 0;
            LODWORD(v423) = 0;
            LODWORD(v421) = 0;
            LODWORD(v417) = 0;
            LODWORD(v419) = 0;
            LODWORD(v418) = 0;
            LODWORD(v416) = 0;
            LODWORD(v413) = 0;
            LODWORD(v415) = 0;
            LODWORD(v414) = 0;
            LODWORD(v412) = 0;
            LODWORD(v411) = 0;
            v59 = 0;
            v69 = 0.0;
            goto LABEL_135;
          }
LABEL_1176:
          v265 = __sb__runningInSpringBoard();
          if (v265)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
              HIDWORD(v465) = 0;
              HIDWORD(v467) = 0;
              goto LABEL_1209;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
            v338 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v338, "userInterfaceIdiom"))
            {
              HIDWORD(v465) = 0;
              HIDWORD(v467) = 1;
              goto LABEL_1209;
            }
          }
          HIDWORD(v467) = v265 ^ 1;
          if (SBFEffectiveHomeButtonType() == 2)
          {
            v269 = __sb__runningInSpringBoard();
            if (v269)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
              v324 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v324, "_referenceBounds");
            }
            HIDWORD(v465) = v269 ^ 1;
            BSSizeRoundForScale();
            if (v275 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
            {
              v62 = 0;
              v63 = 0;
              v64 = 0;
              v461 = 0;
              v65 = 0;
              LODWORD(v454) = 0;
              LODWORD(v453) = 0;
              v66 = 0;
              LODWORD(v447) = 0;
              LODWORD(v460) = 0;
              LODWORD(v459) = 0;
              v67 = 0;
              LODWORD(v458) = 0;
              v68 = 0;
              LODWORD(v457) = 0;
              LODWORD(v456) = 0;
              LODWORD(v455) = 0;
              v463 = 0;
              LODWORD(v452) = 0;
              LODWORD(v451) = 0;
              LODWORD(v450) = 0;
              LODWORD(v449) = 0;
              LODWORD(v448) = 0;
              LODWORD(v465) = 0;
              LODWORD(v446) = 0;
              LODWORD(v443) = 0;
              LODWORD(v445) = 0;
              LODWORD(v444) = 0;
              LODWORD(v442) = 0;
              LODWORD(v435) = 0;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              v59 = 0;
              v69 = 0.0;
LABEL_1258:
              v34 = v513;
              goto LABEL_135;
            }
          }
          else
          {
            HIDWORD(v465) = 0;
          }
LABEL_1209:
          v270 = __sb__runningInSpringBoard();
          if (v270)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
              HIDWORD(v463) = 0;
              LODWORD(v465) = 0;
              goto LABEL_1225;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
            v332 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v332, "userInterfaceIdiom"))
            {
              HIDWORD(v463) = 0;
              LODWORD(v465) = 1;
              goto LABEL_1225;
            }
          }
          LODWORD(v465) = v270 ^ 1;
          if (SBFEffectiveHomeButtonType() == 2)
          {
            v272 = __sb__runningInSpringBoard();
            if (v272)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
              v322 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v322, "_referenceBounds");
            }
            HIDWORD(v463) = v272 ^ 1;
            BSSizeRoundForScale();
            if (v277 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
              goto LABEL_1250;
          }
          else
          {
            HIDWORD(v463) = 0;
          }
LABEL_1225:
          if ((_SBF_Private_IsD53() & 1) != 0)
          {
LABEL_1254:
            v62 = 0;
            v63 = 0;
            v64 = 0;
            v461 = 0;
            v65 = 0;
            LODWORD(v454) = 0;
            LODWORD(v453) = 0;
            v66 = 0;
            LODWORD(v447) = 0;
            LODWORD(v460) = 0;
            LODWORD(v459) = 0;
            v67 = 0;
            LODWORD(v458) = 0;
            v68 = 0;
            LODWORD(v457) = 0;
            LODWORD(v456) = 0;
            LODWORD(v455) = 0;
            LODWORD(v463) = 0;
            LODWORD(v452) = 0;
            LODWORD(v451) = 0;
            LODWORD(v450) = 0;
            LODWORD(v449) = 0;
            LODWORD(v448) = 0;
            LODWORD(v446) = 0;
            LODWORD(v443) = 0;
            LODWORD(v445) = 0;
            LODWORD(v444) = 0;
            LODWORD(v442) = 0;
            LODWORD(v435) = 0;
            LODWORD(v441) = 0;
            LODWORD(v440) = 0;
            LODWORD(v439) = 0;
            LODWORD(v438) = 0;
            LODWORD(v437) = 0;
            LODWORD(v436) = 0;
            LODWORD(v434) = 0;
            LODWORD(v433) = 0;
            LODWORD(v432) = 0;
            LODWORD(v429) = 0;
            LODWORD(v431) = 0;
            LODWORD(v430) = 0;
            LODWORD(v427) = 0;
            LODWORD(v426) = 0;
            LODWORD(v428) = 0;
            LODWORD(v425) = 0;
            LODWORD(v422) = 0;
            LODWORD(v420) = 0;
            LODWORD(v424) = 0;
            LODWORD(v423) = 0;
            LODWORD(v421) = 0;
            LODWORD(v417) = 0;
            LODWORD(v419) = 0;
            LODWORD(v418) = 0;
            LODWORD(v416) = 0;
            LODWORD(v413) = 0;
            LODWORD(v415) = 0;
            LODWORD(v414) = 0;
            LODWORD(v412) = 0;
            LODWORD(v411) = 0;
            v59 = 0;
            v69 = 0.0;
            goto LABEL_1258;
          }
LABEL_1250:
          if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
            || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
          {
            goto LABEL_1254;
          }
          v69 = 0.0;
          if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
          {
            v62 = 0;
            v63 = 0;
            v64 = 0;
            v461 = 0;
            v65 = 0;
            LODWORD(v454) = 0;
            LODWORD(v453) = 0;
            v66 = 0;
            LODWORD(v447) = 0;
            LODWORD(v460) = 0;
            LODWORD(v459) = 0;
            v67 = 0;
            LODWORD(v458) = 0;
            v68 = 0;
            LODWORD(v457) = 0;
            LODWORD(v456) = 0;
            LODWORD(v455) = 0;
            LODWORD(v463) = 0;
            LODWORD(v452) = 0;
            LODWORD(v451) = 0;
            LODWORD(v450) = 0;
            LODWORD(v449) = 0;
            LODWORD(v448) = 0;
            LODWORD(v446) = 0;
            LODWORD(v443) = 0;
            LODWORD(v445) = 0;
            LODWORD(v444) = 0;
            LODWORD(v442) = 0;
            LODWORD(v435) = 0;
            LODWORD(v441) = 0;
            LODWORD(v440) = 0;
            LODWORD(v439) = 0;
            LODWORD(v438) = 0;
            LODWORD(v437) = 0;
            LODWORD(v436) = 0;
            LODWORD(v434) = 0;
            LODWORD(v433) = 0;
            LODWORD(v432) = 0;
            LODWORD(v429) = 0;
            LODWORD(v431) = 0;
            LODWORD(v430) = 0;
            LODWORD(v427) = 0;
            LODWORD(v426) = 0;
            LODWORD(v428) = 0;
            LODWORD(v425) = 0;
            LODWORD(v422) = 0;
            LODWORD(v420) = 0;
            LODWORD(v424) = 0;
            LODWORD(v423) = 0;
            LODWORD(v421) = 0;
            LODWORD(v417) = 0;
            LODWORD(v419) = 0;
            LODWORD(v418) = 0;
            LODWORD(v416) = 0;
            LODWORD(v413) = 0;
            LODWORD(v415) = 0;
            LODWORD(v414) = 0;
            LODWORD(v412) = 0;
            LODWORD(v411) = 0;
            v59 = 0;
            goto LABEL_1258;
          }
          v279 = __sb__runningInSpringBoard();
          if (v279)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
              v68 = 0;
              LODWORD(v463) = 0;
              goto LABEL_1327;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
            v320 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v320, "userInterfaceIdiom"))
            {
              v68 = 0;
              LODWORD(v463) = 1;
              goto LABEL_1327;
            }
          }
          LODWORD(v463) = v279 ^ 1;
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
              v309 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v309, "_referenceBounds");
            }
            v68 = v288 ^ 1;
            BSSizeRoundForScale();
            if (v295 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
            {
              v62 = 0;
              v63 = 0;
              v64 = 0;
              v461 = 0;
              v65 = 0;
              LODWORD(v454) = 0;
              LODWORD(v453) = 0;
              v66 = 0;
              LODWORD(v447) = 0;
              LODWORD(v460) = 0;
              LODWORD(v459) = 0;
              v67 = 0;
              LODWORD(v458) = 0;
              LODWORD(v457) = 0;
              LODWORD(v456) = 0;
              LODWORD(v455) = 0;
              LODWORD(v452) = 0;
              LODWORD(v451) = 0;
              LODWORD(v450) = 0;
              LODWORD(v449) = 0;
              LODWORD(v448) = 0;
              LODWORD(v446) = 0;
              LODWORD(v443) = 0;
              LODWORD(v445) = 0;
              LODWORD(v444) = 0;
              LODWORD(v442) = 0;
              LODWORD(v435) = 0;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              v59 = 0;
              goto LABEL_1258;
            }
          }
          else
          {
            v68 = 0;
          }
LABEL_1327:
          v289 = __sb__runningInSpringBoard();
          if (v289)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
              v66 = 0;
              v67 = 0;
              goto LABEL_1347;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
            v318 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v318, "userInterfaceIdiom"))
            {
              v66 = 0;
              v67 = 1;
              goto LABEL_1347;
            }
          }
          v67 = v289 ^ 1;
          if (SBFEffectiveHomeButtonType() == 2)
          {
            v292 = __sb__runningInSpringBoard();
            if (v292)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
              v307 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v307, "_referenceBounds");
            }
            v66 = v292 ^ 1;
            BSSizeRoundForScale();
            if (v303 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
            {
              v62 = 0;
              v63 = 0;
              v64 = 0;
              v461 = 0;
              v65 = 0;
              LODWORD(v454) = 0;
              LODWORD(v453) = 0;
              LODWORD(v447) = 0;
              LODWORD(v460) = 0;
              LODWORD(v459) = 0;
              LODWORD(v458) = 0;
              LODWORD(v457) = 0;
              LODWORD(v456) = 0;
              LODWORD(v455) = 0;
              LODWORD(v452) = 0;
              LODWORD(v451) = 0;
              LODWORD(v450) = 0;
              LODWORD(v449) = 0;
              LODWORD(v448) = 0;
              LODWORD(v446) = 0;
              LODWORD(v443) = 0;
              LODWORD(v445) = 0;
              LODWORD(v444) = 0;
              LODWORD(v442) = 0;
              LODWORD(v435) = 0;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              v59 = 0;
              goto LABEL_1258;
            }
          }
          else
          {
            v66 = 0;
          }
LABEL_1347:
          v293 = __sb__runningInSpringBoard();
          if (v293)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
              v63 = 0;
              v65 = 0;
              goto LABEL_1373;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
            v316 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v316, "userInterfaceIdiom"))
            {
              v63 = 0;
              v65 = 1;
              goto LABEL_1373;
            }
          }
          v65 = v293 ^ 1;
          v299 = __sb__runningInSpringBoard();
          if (v299)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v312 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v312, "_referenceBounds");
          }
          v63 = v299 ^ 1u;
          BSSizeRoundForScale();
          if (v300 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
            goto LABEL_1376;
LABEL_1373:
          v301 = __sb__runningInSpringBoard();
          if (v301)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
LABEL_1376:
              v62 = 0;
              v64 = 0;
              v461 = 0;
              LODWORD(v454) = 0;
              LODWORD(v453) = 0;
              LODWORD(v447) = 0;
              LODWORD(v460) = 0;
              LODWORD(v459) = 0;
              LODWORD(v458) = 0;
              LODWORD(v457) = 0;
              LODWORD(v456) = 0;
              LODWORD(v455) = 0;
              LODWORD(v452) = 0;
              LODWORD(v451) = 0;
              LODWORD(v450) = 0;
              LODWORD(v449) = 0;
              LODWORD(v448) = 0;
              LODWORD(v446) = 0;
              LODWORD(v443) = 0;
              LODWORD(v445) = 0;
              LODWORD(v444) = 0;
              LODWORD(v442) = 0;
              LODWORD(v435) = 0;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              v59 = 0;
              goto LABEL_1258;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
            v314 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v314, "userInterfaceIdiom"))
            {
              v64 = 0;
              v461 = 0;
              LODWORD(v454) = 0;
              LODWORD(v453) = 0;
              LODWORD(v447) = 0;
              LODWORD(v460) = 0;
              LODWORD(v459) = 0;
              LODWORD(v458) = 0;
              LODWORD(v457) = 0;
              LODWORD(v456) = 0;
              LODWORD(v455) = 0;
              LODWORD(v452) = 0;
              LODWORD(v451) = 0;
              LODWORD(v450) = 0;
              LODWORD(v449) = 0;
              LODWORD(v448) = 0;
              LODWORD(v446) = 0;
              LODWORD(v443) = 0;
              LODWORD(v445) = 0;
              LODWORD(v444) = 0;
              LODWORD(v442) = 0;
              LODWORD(v435) = 0;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              v59 = 0;
              v62 = 1;
              goto LABEL_1258;
            }
          }
          v62 = v301 ^ 1;
          v305 = __sb__runningInSpringBoard();
          if (v305)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v310 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v310, "_referenceBounds");
          }
          v64 = v305 ^ 1u;
          BSSizeRoundForScale();
          v461 = 0;
          LODWORD(v454) = 0;
          LODWORD(v453) = 0;
          LODWORD(v447) = 0;
          LODWORD(v460) = 0;
          LODWORD(v459) = 0;
          LODWORD(v458) = 0;
          LODWORD(v457) = 0;
          LODWORD(v456) = 0;
          LODWORD(v455) = 0;
          LODWORD(v452) = 0;
          LODWORD(v451) = 0;
          LODWORD(v450) = 0;
          LODWORD(v449) = 0;
          LODWORD(v448) = 0;
          LODWORD(v446) = 0;
          LODWORD(v443) = 0;
          LODWORD(v445) = 0;
          LODWORD(v444) = 0;
          LODWORD(v442) = 0;
          LODWORD(v435) = 0;
          LODWORD(v441) = 0;
          LODWORD(v440) = 0;
          LODWORD(v439) = 0;
          LODWORD(v438) = 0;
          LODWORD(v437) = 0;
          LODWORD(v436) = 0;
          LODWORD(v434) = 0;
          LODWORD(v433) = 0;
          LODWORD(v432) = 0;
          LODWORD(v429) = 0;
          LODWORD(v431) = 0;
          LODWORD(v430) = 0;
          LODWORD(v427) = 0;
          LODWORD(v426) = 0;
          LODWORD(v428) = 0;
          LODWORD(v425) = 0;
          LODWORD(v422) = 0;
          LODWORD(v420) = 0;
          LODWORD(v424) = 0;
          LODWORD(v423) = 0;
          LODWORD(v421) = 0;
          LODWORD(v417) = 0;
          LODWORD(v419) = 0;
          LODWORD(v418) = 0;
          LODWORD(v416) = 0;
          LODWORD(v413) = 0;
          LODWORD(v415) = 0;
          LODWORD(v414) = 0;
          LODWORD(v412) = 0;
          LODWORD(v411) = 0;
          v59 = 0;
          goto LABEL_1258;
        }
        v62 = 0;
        v63 = 0;
        v64 = 0;
        v461 = 0;
        v65 = 0;
        LODWORD(v454) = 0;
        LODWORD(v453) = 0;
        v66 = 0;
        LODWORD(v447) = 0;
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        v67 = 0;
        LODWORD(v458) = 0;
        v68 = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        v463 = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        v465 = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        HIDWORD(v467) = 0;
        LODWORD(v442) = 0;
        v469 = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v431) = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        v59 = 0;
        v69 = 0.0;
LABEL_1165:
        v34 = v513;
        goto LABEL_135;
      }
    }
    else
    {
      HIDWORD(v471) = 0;
    }
LABEL_1106:
    if ((_SBF_Private_IsD63Like() & 1) != 0)
    {
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v461 = 0;
      v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      v67 = 0;
      LODWORD(v458) = 0;
      v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      v467 = 0;
      LODWORD(v442) = 0;
      v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      LODWORD(v471) = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      LODWORD(v431) = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v419) = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      v59 = 0;
      v69 = -1.0;
      goto LABEL_135;
    }
    goto LABEL_1110;
  }
  v62 = 0;
  v63 = 0;
  v64 = 0;
  v461 = 0;
  v65 = 0;
  LODWORD(v454) = 0;
  LODWORD(v453) = 0;
  v66 = 0;
  LODWORD(v447) = 0;
  LODWORD(v460) = 0;
  LODWORD(v459) = 0;
  v67 = 0;
  LODWORD(v458) = 0;
  v68 = 0;
  LODWORD(v457) = 0;
  LODWORD(v456) = 0;
  LODWORD(v455) = 0;
  v463 = 0;
  LODWORD(v452) = 0;
  LODWORD(v451) = 0;
  LODWORD(v450) = 0;
  LODWORD(v449) = 0;
  LODWORD(v448) = 0;
  v465 = 0;
  LODWORD(v446) = 0;
  LODWORD(v443) = 0;
  LODWORD(v445) = 0;
  LODWORD(v444) = 0;
  v467 = 0;
  LODWORD(v442) = 0;
  v469 = 0;
  LODWORD(v435) = 0;
  LODWORD(v441) = 0;
  LODWORD(v440) = 0;
  LODWORD(v439) = 0;
  LODWORD(v438) = 0;
  LODWORD(v437) = 0;
  LODWORD(v436) = 0;
  v471 = 0;
  LODWORD(v434) = 0;
  LODWORD(v433) = 0;
  LODWORD(v432) = 0;
  LODWORD(v429) = 0;
  v475 = 0;
  LODWORD(v431) = 0;
  v473 = 0;
  LODWORD(v430) = 0;
  LODWORD(v427) = 0;
  LODWORD(v426) = 0;
  LODWORD(v428) = 0;
  v477 = 0;
  LODWORD(v425) = 0;
  LODWORD(v422) = 0;
  LODWORD(v420) = 0;
  LODWORD(v424) = 0;
  LODWORD(v423) = 0;
  LODWORD(v421) = 0;
  LODWORD(v417) = 0;
  v479 = 0;
  LODWORD(v419) = 0;
  v481 = 0;
  LODWORD(v418) = 0;
  LODWORD(v416) = 0;
  LODWORD(v413) = 0;
  LODWORD(v415) = 0;
  v485 = 0;
  LODWORD(v414) = 0;
  LODWORD(v412) = 0;
  LODWORD(v411) = 0;
  v487 = 0;
  v59 = 0;
  v60 = 0;
  v483 = 0;
  LODWORD(v489) = 0;
  v69 = -1.0;
LABEL_133:
  if (v60)
  {
    v83 = v59;

    v59 = v83;
  }
LABEL_135:
  if (v59)

  if ((_DWORD)v411)
  if ((_DWORD)v412)

  if ((_DWORD)v414)
  if ((_DWORD)v415)

  if ((_DWORD)v413)
  if ((_DWORD)v416)

  if ((_DWORD)v418)
  if ((_DWORD)v419)

  if ((_DWORD)v417)
  if ((_DWORD)v421)

  if ((_DWORD)v423)
  if ((_DWORD)v424)

  if ((_DWORD)v420)
  if ((_DWORD)v422)

  if ((_DWORD)v425)
  if ((_DWORD)v428)

  if ((_DWORD)v426)
  if ((_DWORD)v427)

  if ((_DWORD)v430)
  if ((_DWORD)v431)

  if ((_DWORD)v429)
  if ((_DWORD)v432)

  if ((_DWORD)v433)
  if ((_DWORD)v434)

  if ((_DWORD)v436)
  if ((_DWORD)v437)

  if ((_DWORD)v438)
  if ((_DWORD)v439)

  if ((_DWORD)v440)
  if ((_DWORD)v441)

  if ((_DWORD)v435)
  if ((_DWORD)v442)

  if ((_DWORD)v444)
  if ((_DWORD)v445)

  if ((_DWORD)v443)
  if ((_DWORD)v446)

  if ((_DWORD)v448)
  if ((_DWORD)v449)

  if ((_DWORD)v450)
  if ((_DWORD)v451)

  if ((_DWORD)v452)
  if ((_DWORD)v455)

  if ((_DWORD)v456)
  if ((_DWORD)v457)

  if ((_DWORD)v458)
  if ((_DWORD)v459)

  if ((_DWORD)v460)
  if ((_DWORD)v447)
  {

    if (!(_DWORD)v453)
      goto LABEL_233;
  }
  else if (!(_DWORD)v453)
  {
LABEL_233:
    if (!(_DWORD)v454)
      goto LABEL_235;
    goto LABEL_234;
  }

  if ((_DWORD)v454)
LABEL_234:

LABEL_235:
  if (v461)
  {

    if (!(_DWORD)v64)
      goto LABEL_237;
  }
  else if (!(_DWORD)v64)
  {
LABEL_237:
    if (v62)
      goto LABEL_238;
    goto LABEL_249;
  }

  if (v62)
  {
LABEL_238:

    if (!(_DWORD)v63)
      goto LABEL_239;
    goto LABEL_250;
  }
LABEL_249:
  if (!(_DWORD)v63)
  {
LABEL_239:
    if (v65)
      goto LABEL_240;
    goto LABEL_251;
  }
LABEL_250:

  if (v65)
  {
LABEL_240:

    if (!v66)
      goto LABEL_241;
    goto LABEL_252;
  }
LABEL_251:
  if (!v66)
  {
LABEL_241:
    if (v67)
      goto LABEL_242;
LABEL_253:
    if (!v68)
      goto LABEL_255;
    goto LABEL_254;
  }
LABEL_252:

  if (!v67)
    goto LABEL_253;
LABEL_242:

  if (v68)
LABEL_254:

LABEL_255:
  if ((_DWORD)v463)

  if (HIDWORD(v463))
  if ((_DWORD)v465)

  if (HIDWORD(v465))
  if (HIDWORD(v467))

  if ((_DWORD)v469)
  if (HIDWORD(v469))

  if ((_DWORD)v467)
  if ((_DWORD)v471)

  if (HIDWORD(v471))
  if ((_DWORD)v475)

  if ((_DWORD)v473)
  if (HIDWORD(v473))

  if ((_DWORD)v477)
  if (HIDWORD(v477))

  if (HIDWORD(v475))
  if ((_DWORD)v479)

  if ((_DWORD)v481)
  if (HIDWORD(v481))

  if (HIDWORD(v485))
  if ((_DWORD)v487)

  if (HIDWORD(v479))
  if ((_DWORD)v483)

  if (HIDWORD(v483))
  if (HIDWORD(v487))

  if ((_DWORD)v485)
  if ((_DWORD)v489)

  if (HIDWORD(v489))
  if ((_DWORD)v491)

  if (HIDWORD(v491))
  if (HIDWORD(v495))

  if ((_DWORD)v493)
  if (HIDWORD(v493))

  if ((_DWORD)v497)
  if (HIDWORD(v497))

  if ((_DWORD)v499)
  if ((_DWORD)v501)

  if (HIDWORD(v501))
  if ((_DWORD)v503)

  if (HIDWORD(v503))
  if ((_DWORD)v505)

  if (HIDWORD(v505))
  if ((_DWORD)v495)

  if (HIDWORD(v499))
  {

    if (!(_DWORD)v507)
      goto LABEL_343;
  }
  else if (!(_DWORD)v507)
  {
LABEL_343:
    if (!HIDWORD(v507))
      goto LABEL_345;
    goto LABEL_344;
  }

  if (HIDWORD(v507))
LABEL_344:

LABEL_345:
  v84 = __sb__runningInSpringBoard();
  if (v84)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v508 = 0;
      goto LABEL_357;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v459 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v459, "userInterfaceIdiom") != 1)
    {
      v508 = 0x100000000;
      goto LABEL_357;
    }
  }
  HIDWORD(v508) = v84 ^ 1;
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
      v450 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v450, "_referenceBounds");
    }
    BSSizeRoundForScale();
    LODWORD(v508) = v85 ^ 1;
    if (v105 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v104 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v506 = 0;
      v500 = 0;
      v504 = 0;
      v502 = 0;
      v498 = 0;
      v496 = 0;
      v490 = 0;
      v486 = 0;
      v494 = 0;
      v492 = 0;
      v488 = 0;
      v482 = 0;
      v484 = 0;
      v480 = 0;
      v478 = 0;
      v474 = 0;
      v476 = 0;
      v472 = 0;
      v470 = 0;
      v468 = 0;
      v466 = 0;
      v464 = 0;
      v462 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v100 = 7.5;
      goto LABEL_411;
    }
  }
  else
  {
    LODWORD(v508) = 0;
  }
LABEL_357:
  v86 = __sb__runningInSpringBoard();
  if (v86)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v506) = 0;
      LODWORD(v500) = 0;
      goto LABEL_366;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v458 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v458, "userInterfaceIdiom") != 1)
    {
      LODWORD(v500) = 0;
      HIDWORD(v506) = 1;
      goto LABEL_366;
    }
  }
  HIDWORD(v506) = v86 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v87 = __sb__runningInSpringBoard();
    if (v87)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v460 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v460, "_referenceBounds");
    }
    BSSizeRoundForScale();
    LODWORD(v500) = v87 ^ 1;
    if (v106 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      LODWORD(v506) = 0;
      v504 = 0;
      v502 = 0;
      HIDWORD(v500) = 0;
      v498 = 0;
      v496 = 0;
      v490 = 0;
      v486 = 0;
      v494 = 0;
      v492 = 0;
      v488 = 0;
      v482 = 0;
      v484 = 0;
      v480 = 0;
      v478 = 0;
      v474 = 0;
      v476 = 0;
      v472 = 0;
      v470 = 0;
      v468 = 0;
      v466 = 0;
      v464 = 0;
      v462 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v100 = 17.5;
      goto LABEL_411;
    }
  }
  else
  {
    LODWORD(v500) = 0;
  }
LABEL_366:
  v88 = __sb__runningInSpringBoard();
  if (v88)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      LODWORD(v506) = 0;
      HIDWORD(v504) = 0;
      goto LABEL_375;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v457 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v457, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v504) = 0;
      LODWORD(v506) = 1;
      goto LABEL_375;
    }
  }
  LODWORD(v506) = v88 ^ 1;
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
      v449 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v449, "_referenceBounds");
    }
    HIDWORD(v504) = v89 ^ 1;
    BSSizeRoundForScale();
    if (v107 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      LODWORD(v504) = 0;
      v502 = 0;
      HIDWORD(v500) = 0;
      v498 = 0;
      v496 = 0;
      v490 = 0;
      v486 = 0;
      v494 = 0;
      v492 = 0;
      v488 = 0;
      v482 = 0;
      v484 = 0;
      v480 = 0;
      v478 = 0;
      v474 = 0;
      v476 = 0;
      v472 = 0;
      v470 = 0;
      v468 = 0;
      v466 = 0;
      v464 = 0;
      v462 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v100 = 17.5;
      goto LABEL_411;
    }
  }
  else
  {
    HIDWORD(v504) = 0;
  }
LABEL_375:
  v90 = __sb__runningInSpringBoard();
  if (v90)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      LODWORD(v504) = 0;
      HIDWORD(v502) = 0;
      goto LABEL_384;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v456 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v456, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v502) = 0;
      LODWORD(v504) = 1;
      goto LABEL_384;
    }
  }
  LODWORD(v504) = v90 ^ 1;
  v91 = __sb__runningInSpringBoard();
  if (v91)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v453 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v453, "_referenceBounds");
  }
  HIDWORD(v502) = v91 ^ 1;
  BSSizeRoundForScale();
  if (v92 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    LODWORD(v502) = 0;
    HIDWORD(v500) = 0;
    v498 = 0;
    v496 = 0;
    v490 = 0;
    v486 = 0;
    v494 = 0;
    v492 = 0;
    v488 = 0;
    v482 = 0;
    v484 = 0;
    v480 = 0;
    v478 = 0;
    v474 = 0;
    v476 = 0;
    v472 = 0;
    v470 = 0;
    v468 = 0;
    v466 = 0;
    v464 = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 7.5;
    goto LABEL_411;
  }
LABEL_384:
  v93 = __sb__runningInSpringBoard();
  if (v93)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      LODWORD(v502) = 0;
      HIDWORD(v500) = 0;
      goto LABEL_394;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v455 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v455, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v500) = 0;
      LODWORD(v502) = 1;
      goto LABEL_394;
    }
  }
  LODWORD(v502) = v93 ^ 1;
  v94 = __sb__runningInSpringBoard();
  if (v94)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v451 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v451, "_referenceBounds");
  }
  HIDWORD(v500) = v94 ^ 1;
  BSSizeRoundForScale();
  if (v101 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v498 = 0;
    v496 = 0;
    v490 = 0;
    v486 = 0;
    v494 = 0;
    v492 = 0;
    v488 = 0;
    v482 = 0;
    v484 = 0;
    v480 = 0;
    v478 = 0;
    v474 = 0;
    v476 = 0;
    v472 = 0;
    v470 = 0;
    v468 = 0;
    v466 = 0;
    v464 = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 7.5;
    goto LABEL_411;
  }
LABEL_394:
  v102 = __sb__runningInSpringBoard();
  if (v102)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v498 = 0;
      goto LABEL_529;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v454 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v454, "userInterfaceIdiom") != 1)
    {
      v498 = 0x100000000;
      goto LABEL_529;
    }
  }
  HIDWORD(v498) = v102 ^ 1;
  v103 = __sb__runningInSpringBoard();
  if (v103)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v448 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v448, "_referenceBounds");
  }
  BSSizeRoundForScale();
  LODWORD(v498) = v103 ^ 1;
  if (v115 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v496 = 0;
    v490 = 0;
    v486 = 0;
    v494 = 0;
    v492 = 0;
    v488 = 0;
    v482 = 0;
    v484 = 0;
    v480 = 0;
    v478 = 0;
    v474 = 0;
    v476 = 0;
    v472 = 0;
    v470 = 0;
    v468 = 0;
    v466 = 0;
    v464 = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 7.5;
    goto LABEL_411;
  }
LABEL_529:
  v116 = __sb__runningInSpringBoard();
  if (v116)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_531;
LABEL_537:
    v490 = 0;
    v486 = 0;
    v494 = 0;
    v492 = 0;
    v488 = 0;
    LODWORD(v496) = 0;
    v482 = 0;
    v484 = 0;
    v480 = 0;
    v478 = 0;
    v474 = 0;
    v476 = 0;
    v472 = 0;
    v470 = 0;
    v468 = 0;
    v466 = 0;
    v464 = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 7.5;
    HIDWORD(v496) = v116 ^ 1;
    goto LABEL_411;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v452 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v452, "userInterfaceIdiom") == 1)
    goto LABEL_537;
LABEL_531:
  HIDWORD(v496) = v116 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_535:
    LODWORD(v490) = 0;
    HIDWORD(v486) = 0;
    goto LABEL_578;
  }
  v117 = __sb__runningInSpringBoard();
  if (v117)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_535;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v446 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v446, "userInterfaceIdiom"))
    {
      HIDWORD(v486) = 0;
      LODWORD(v490) = 1;
      goto LABEL_578;
    }
  }
  LODWORD(v490) = v117 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v127 = __sb__runningInSpringBoard();
    if (v127)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v439 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v439, "_referenceBounds");
    }
    HIDWORD(v486) = v127 ^ 1;
    BSSizeRoundForScale();
    if (v132 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v494 = 0;
      v492 = 0;
      v488 = 0;
      LODWORD(v496) = 0;
      HIDWORD(v490) = 0;
      LODWORD(v486) = 0;
      v482 = 0;
      v484 = 0;
      v480 = 0;
      v478 = 0;
      v474 = 0;
      v476 = 0;
      v472 = 0;
      v470 = 0;
      v468 = 0;
      v466 = 0;
      v464 = 0;
      v462 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    HIDWORD(v486) = 0;
  }
LABEL_578:
  v128 = __sb__runningInSpringBoard();
  if (v128)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v494) = 0;
      HIDWORD(v492) = 0;
      goto LABEL_588;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v447 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v447, "userInterfaceIdiom"))
    {
      HIDWORD(v492) = 0;
      LODWORD(v494) = 1;
      goto LABEL_588;
    }
  }
  LODWORD(v494) = v128 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v129 = __sb__runningInSpringBoard();
    if (v129)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v442 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v442, "_referenceBounds");
    }
    HIDWORD(v492) = v129 ^ 1;
    BSSizeRoundForScale();
    if (v130 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_592;
  }
  else
  {
    HIDWORD(v492) = 0;
  }
LABEL_588:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    v488 = 0;
    LODWORD(v496) = 0;
    LODWORD(v492) = 0;
    HIDWORD(v494) = 0;
    HIDWORD(v490) = 0;
    LODWORD(v486) = 0;
    v482 = 0;
    v484 = 0;
    v480 = 0;
    v478 = 0;
    v474 = 0;
    v476 = 0;
    v472 = 0;
    v470 = 0;
    v468 = 0;
    v466 = 0;
    v464 = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 0.0;
    goto LABEL_411;
  }
LABEL_592:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_596:
    v488 = 0;
    goto LABEL_606;
  }
  v131 = __sb__runningInSpringBoard();
  if (v131)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_596;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v443 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v443, "userInterfaceIdiom"))
    {
      v488 = 0x100000000;
      goto LABEL_606;
    }
  }
  HIDWORD(v488) = v131 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v133 = __sb__runningInSpringBoard();
    if (v133)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v434 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v434, "_referenceBounds");
    }
    LODWORD(v488) = v133 ^ 1;
    BSSizeRoundForScale();
    if (v154 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      LODWORD(v496) = 0;
      LODWORD(v492) = 0;
      HIDWORD(v494) = 0;
      HIDWORD(v490) = 0;
      LODWORD(v486) = 0;
      v482 = 0;
      v484 = 0;
      v480 = 0;
      v478 = 0;
      v474 = 0;
      v476 = 0;
      v472 = 0;
      v470 = 0;
      v468 = 0;
      v466 = 0;
      v464 = 0;
      v462 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    LODWORD(v488) = 0;
  }
LABEL_606:
  v134 = __sb__runningInSpringBoard();
  if (v134)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v496) = 0;
      LODWORD(v492) = 0;
      goto LABEL_616;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v445 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v445, "userInterfaceIdiom"))
    {
      LODWORD(v492) = 0;
      LODWORD(v496) = 1;
      goto LABEL_616;
    }
  }
  LODWORD(v496) = v134 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v135 = __sb__runningInSpringBoard();
    if (v135)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v438 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v438, "_referenceBounds");
    }
    LODWORD(v492) = v135 ^ 1;
    BSSizeRoundForScale();
    if (v136 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_620;
  }
  else
  {
    LODWORD(v492) = 0;
  }
LABEL_616:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    HIDWORD(v494) = 0;
    HIDWORD(v490) = 0;
    LODWORD(v486) = 0;
    v482 = 0;
    v484 = 0;
    v480 = 0;
    v478 = 0;
    v474 = 0;
    v476 = 0;
    v472 = 0;
    v470 = 0;
    v468 = 0;
    v466 = 0;
    v464 = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 0.0;
    goto LABEL_411;
  }
LABEL_620:
  v137 = __sb__runningInSpringBoard();
  if (v137)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v494) = 0;
      HIDWORD(v490) = 0;
      goto LABEL_630;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v444 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v444, "userInterfaceIdiom"))
    {
      HIDWORD(v490) = 0;
      HIDWORD(v494) = 1;
      goto LABEL_630;
    }
  }
  HIDWORD(v494) = v137 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v138 = __sb__runningInSpringBoard();
    if (v138)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v435 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v435, "_referenceBounds");
    }
    BSSizeRoundForScale();
    HIDWORD(v490) = v138 ^ 1;
    if (v153 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      LODWORD(v486) = 0;
      v482 = 0;
      v484 = 0;
      v480 = 0;
      v478 = 0;
      v474 = 0;
      v476 = 0;
      v472 = 0;
      v470 = 0;
      v468 = 0;
      v466 = 0;
      v464 = 0;
      v462 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    HIDWORD(v490) = 0;
  }
LABEL_630:
  v139 = __sb__runningInSpringBoard();
  if (v139)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v486) = 0;
      LODWORD(v482) = 0;
      goto LABEL_690;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v441 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v441, "userInterfaceIdiom"))
    {
      LODWORD(v482) = 0;
      LODWORD(v486) = 1;
      goto LABEL_690;
    }
  }
  LODWORD(v486) = v139 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v152 = __sb__runningInSpringBoard();
    if (v152)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v433 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v433, "_referenceBounds");
    }
    LODWORD(v482) = v152 ^ 1;
    BSSizeRoundForScale();
    if (v157 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_706;
  }
  else
  {
    LODWORD(v482) = 0;
  }
LABEL_690:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    v484 = 0;
    HIDWORD(v482) = 0;
    v480 = 0;
    v478 = 0;
    v474 = 0;
    v476 = 0;
    v472 = 0;
    v470 = 0;
    v468 = 0;
    v466 = 0;
    v464 = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 0.0;
    goto LABEL_411;
  }
LABEL_706:
  v158 = __sb__runningInSpringBoard();
  if (v158)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v484 = 0;
      goto LABEL_716;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v440 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v440, "userInterfaceIdiom"))
    {
      v484 = 0x100000000;
      goto LABEL_716;
    }
  }
  HIDWORD(v484) = v158 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v159 = __sb__runningInSpringBoard();
    if (v159)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v430 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v430, "_referenceBounds");
    }
    LODWORD(v484) = v159 ^ 1;
    BSSizeRoundForScale();
    if (v184 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      HIDWORD(v482) = 0;
      v480 = 0;
      v478 = 0;
      v474 = 0;
      v476 = 0;
      v472 = 0;
      v470 = 0;
      v468 = 0;
      v466 = 0;
      v464 = 0;
      v462 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    LODWORD(v484) = 0;
  }
LABEL_716:
  v160 = __sb__runningInSpringBoard();
  if (v160)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v482) = 0;
      HIDWORD(v480) = 0;
      goto LABEL_794;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v437 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v437, "userInterfaceIdiom"))
    {
      HIDWORD(v480) = 0;
      HIDWORD(v482) = 1;
      goto LABEL_794;
    }
  }
  HIDWORD(v482) = v160 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v179 = __sb__runningInSpringBoard();
    if (v179)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v429 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v429, "_referenceBounds");
    }
    HIDWORD(v480) = v179 ^ 1;
    BSSizeRoundForScale();
    if (v187 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_827;
  }
  else
  {
    HIDWORD(v480) = 0;
  }
LABEL_794:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v478 = 0;
    v474 = 0;
    LODWORD(v480) = 0;
    v476 = 0;
    v472 = 0;
    v470 = 0;
    v468 = 0;
    v466 = 0;
    v464 = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 0.0;
    goto LABEL_411;
  }
LABEL_827:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_831:
    LODWORD(v478) = 0;
    HIDWORD(v474) = 0;
    goto LABEL_888;
  }
  v188 = __sb__runningInSpringBoard();
  if (v188)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_831;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v432 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v432, "userInterfaceIdiom"))
    {
      HIDWORD(v474) = 0;
      LODWORD(v478) = 1;
      goto LABEL_888;
    }
  }
  LODWORD(v478) = v188 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v203 = __sb__runningInSpringBoard();
    if (v203)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v423 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v423, "_referenceBounds");
    }
    BSSizeRoundForScale();
    HIDWORD(v474) = v203 ^ 1;
    if (v214 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      LODWORD(v480) = 0;
      v476 = 0;
      LODWORD(v474) = 0;
      v472 = 0;
      HIDWORD(v478) = 0;
      v470 = 0;
      v468 = 0;
      v466 = 0;
      v464 = 0;
      v462 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    HIDWORD(v474) = 0;
  }
LABEL_888:
  v204 = __sb__runningInSpringBoard();
  if (v204)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v480) = 0;
      HIDWORD(v476) = 0;
      goto LABEL_898;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v436 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v436, "userInterfaceIdiom"))
    {
      HIDWORD(v476) = 0;
      LODWORD(v480) = 1;
      goto LABEL_898;
    }
  }
  LODWORD(v480) = v204 ^ 1;
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
      v426 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v426, "_referenceBounds");
    }
    HIDWORD(v476) = v205 ^ 1;
    BSSizeRoundForScale();
    if (v206 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_902;
  }
  else
  {
    HIDWORD(v476) = 0;
  }
LABEL_898:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v474) = 0;
    v472 = 0;
    HIDWORD(v478) = 0;
    LODWORD(v476) = 0;
    v470 = 0;
    v468 = 0;
    v466 = 0;
    v464 = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 0.0;
    goto LABEL_411;
  }
LABEL_902:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_906:
    LODWORD(v474) = 0;
    HIDWORD(v472) = 0;
    goto LABEL_942;
  }
  v207 = __sb__runningInSpringBoard();
  if (v207)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_906;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v427 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v427, "userInterfaceIdiom"))
    {
      HIDWORD(v472) = 0;
      LODWORD(v474) = 1;
      goto LABEL_942;
    }
  }
  LODWORD(v474) = v207 ^ 1;
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
      v419 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v419, "_referenceBounds");
    }
    HIDWORD(v472) = v215 ^ 1;
    BSSizeRoundForScale();
    if (v234 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      HIDWORD(v478) = 0;
      LODWORD(v476) = 0;
      v470 = 0;
      v468 = 0;
      LODWORD(v472) = 0;
      v466 = 0;
      v464 = 0;
      v462 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    HIDWORD(v472) = 0;
  }
LABEL_942:
  v216 = __sb__runningInSpringBoard();
  if (v216)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v478) = 0;
      LODWORD(v476) = 0;
      goto LABEL_952;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v431 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v431, "userInterfaceIdiom"))
    {
      LODWORD(v476) = 0;
      HIDWORD(v478) = 1;
      goto LABEL_952;
    }
  }
  HIDWORD(v478) = v216 ^ 1;
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
      v422 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v422, "_referenceBounds");
    }
    LODWORD(v476) = v217 ^ 1;
    BSSizeRoundForScale();
    if (v218 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_956;
  }
  else
  {
    LODWORD(v476) = 0;
  }
LABEL_952:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    v470 = 0;
    v468 = 0;
    LODWORD(v472) = 0;
    v466 = 0;
    v464 = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 0.0;
    goto LABEL_411;
  }
LABEL_956:
  v219 = __sb__runningInSpringBoard();
  if (v219)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v470) = 0;
      LODWORD(v468) = 0;
      goto LABEL_966;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v428 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v428, "userInterfaceIdiom"))
    {
      LODWORD(v468) = 0;
      HIDWORD(v470) = 1;
      goto LABEL_966;
    }
  }
  HIDWORD(v470) = v219 ^ 1;
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
      v420 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v420, "_referenceBounds");
    }
    LODWORD(v468) = v220 ^ 1;
    BSSizeRoundForScale();
    if (v233 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      LODWORD(v472) = 0;
      LODWORD(v470) = 0;
      HIDWORD(v468) = 0;
      v466 = 0;
      v464 = 0;
      v462 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    LODWORD(v468) = 0;
  }
LABEL_966:
  v221 = __sb__runningInSpringBoard();
  if (v221)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v472) = 0;
      LODWORD(v470) = 0;
      goto LABEL_1026;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v425 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v425, "userInterfaceIdiom"))
    {
      LODWORD(v470) = 0;
      LODWORD(v472) = 1;
      goto LABEL_1026;
    }
  }
  LODWORD(v472) = v221 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v232 = __sb__runningInSpringBoard();
    if (v232)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v418 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v418, "_referenceBounds");
    }
    LODWORD(v470) = v232 ^ 1;
    BSSizeRoundForScale();
    if (v237 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1042;
  }
  else
  {
    LODWORD(v470) = 0;
  }
LABEL_1026:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    HIDWORD(v468) = 0;
    v466 = 0;
    v464 = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 0.0;
    goto LABEL_411;
  }
LABEL_1042:
  v238 = __sb__runningInSpringBoard();
  if (v238)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v468) = 0;
      HIDWORD(v466) = 0;
      goto LABEL_1052;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v424 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v424, "userInterfaceIdiom"))
    {
      HIDWORD(v466) = 0;
      HIDWORD(v468) = 1;
      goto LABEL_1052;
    }
  }
  HIDWORD(v468) = v238 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v239 = __sb__runningInSpringBoard();
    if ((_DWORD)v239)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v417 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v417, "_referenceBounds");
    }
    HIDWORD(v466) = v239 ^ 1;
    BSSizeRoundForScale();
    if (v258 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v466) = 0;
      v464 = 0;
      v462 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v259 = 0;
      v100 = 0.0;
      goto LABEL_1193;
    }
    v34 = v513;
  }
  else
  {
    HIDWORD(v466) = 0;
  }
LABEL_1052:
  v239 = __sb__runningInSpringBoard();
  if ((_DWORD)v239)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v466) = 0;
      HIDWORD(v464) = 0;
      goto LABEL_1142;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v421 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v421, "userInterfaceIdiom"))
    {
      HIDWORD(v464) = 0;
      LODWORD(v466) = 1;
      goto LABEL_1142;
    }
  }
  LODWORD(v466) = v239 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v239 = __sb__runningInSpringBoard();
    if ((_DWORD)v239)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v416, "_referenceBounds");
    }
    HIDWORD(v464) = v239 ^ 1;
    BSSizeRoundForScale();
    v34 = v513;
    if (v266 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1184;
  }
  else
  {
    HIDWORD(v464) = 0;
  }
LABEL_1142:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
LABEL_1188:
    LODWORD(v464) = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 0.0;
    goto LABEL_411;
  }
LABEL_1184:
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
    || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    goto LABEL_1188;
  }
  v100 = 0.0;
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v464) = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    goto LABEL_411;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    LODWORD(v464) = 0;
    v462 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v259 = 0;
    goto LABEL_1193;
  }
  v273 = __sb__runningInSpringBoard();
  if (v273)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v464) = 0;
      v462 = 0;
      goto LABEL_1277;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v415 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v415, "userInterfaceIdiom"))
    {
      v462 = 0;
      LODWORD(v464) = 1;
      goto LABEL_1277;
    }
  }
  LODWORD(v464) = v273 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v239 = __sb__runningInSpringBoard();
    if ((_DWORD)v239)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v412, "_referenceBounds");
    }
    v462 = v239 ^ 1;
    BSSizeRoundForScale();
    if (v283 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v259 = 0;
      goto LABEL_1193;
    }
  }
  else
  {
    v462 = 0;
  }
LABEL_1277:
  v280 = __sb__runningInSpringBoard();
  if (v280)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v95 = 0;
      v96 = 0;
      goto LABEL_1287;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v414 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v414, "userInterfaceIdiom"))
    {
      v96 = 0;
      v95 = 1;
      goto LABEL_1287;
    }
  }
  v95 = v280 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v239 = __sb__runningInSpringBoard();
    if ((_DWORD)v239)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v411 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v411, "_referenceBounds");
    }
    v96 = v239 ^ 1;
    BSSizeRoundForScale();
    if (v284 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v259 = 0;
      goto LABEL_1193;
    }
  }
  else
  {
    v96 = 0;
  }
LABEL_1287:
  v281 = __sb__runningInSpringBoard();
  if (!v281)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v413 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v413, "userInterfaceIdiom"))
    {
      v98 = 0;
      v97 = 1;
      goto LABEL_1297;
    }
LABEL_1293:
    v97 = v281 ^ 1;
    v239 = __sb__runningInSpringBoard();
    if ((_DWORD)v239)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v64 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v64, "_referenceBounds");
    }
    v98 = v239 ^ 1;
    BSSizeRoundForScale();
    if (v282 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      goto LABEL_1300;
    goto LABEL_1297;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_1293;
  v97 = 0;
  v98 = 0;
LABEL_1297:
  v239 = __sb__runningInSpringBoard();
  if ((_DWORD)v239)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1300:
      v99 = 0;
      v259 = 0;
      goto LABEL_1193;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v63 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v63, "userInterfaceIdiom"))
    {
      v259 = 0;
      v99 = 1;
      goto LABEL_1193;
    }
  }
  v99 = v239 ^ 1;
  v285 = __sb__runningInSpringBoard();
  if (v285)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v239 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v239, "_referenceBounds");
  }
  v259 = v285 ^ 1;
  BSSizeRoundForScale();
LABEL_1193:
  v34 = v513;
  if (v259)

LABEL_411:
  if (v99)

  if (v98)
  {

    if (!v97)
      goto LABEL_415;
  }
  else if (!v97)
  {
LABEL_415:
    if (v96)
      goto LABEL_416;
    goto LABEL_420;
  }

  if (v96)
  {
LABEL_416:

    if (!v95)
      goto LABEL_422;
    goto LABEL_421;
  }
LABEL_420:
  if (v95)
LABEL_421:

LABEL_422:
  if (v462)

  if ((_DWORD)v464)
  if (HIDWORD(v464))

  if ((_DWORD)v466)
  if (HIDWORD(v466))

  if (HIDWORD(v468))
  if ((_DWORD)v470)

  if ((_DWORD)v472)
  if ((_DWORD)v468)

  if (HIDWORD(v470))
  if ((_DWORD)v476)

  if (HIDWORD(v478))
  if (HIDWORD(v472))

  if ((_DWORD)v474)
  if (HIDWORD(v476))

  if ((_DWORD)v480)
  if (HIDWORD(v474))

  if ((_DWORD)v478)
  if (HIDWORD(v480))

  if (HIDWORD(v482))
  if ((_DWORD)v484)

  if (HIDWORD(v484))
  if ((_DWORD)v482)

  if ((_DWORD)v486)
  if (HIDWORD(v490))

  if (HIDWORD(v494))
  if ((_DWORD)v492)

  if ((_DWORD)v496)
  if ((_DWORD)v488)

  if (HIDWORD(v488))
  if (HIDWORD(v492))

  if ((_DWORD)v494)
  if (HIDWORD(v486))

  if ((_DWORD)v490)
  if (HIDWORD(v496))

  if ((_DWORD)v498)
  if (HIDWORD(v498))

  if (HIDWORD(v500))
  if ((_DWORD)v502)

  if (HIDWORD(v502))
  if ((_DWORD)v504)

  if (HIDWORD(v504))
  if ((_DWORD)v506)

  if ((_DWORD)v500)
  if (HIDWORD(v506))

  if ((_DWORD)v508)
  v108 = MidX + v69;
  if (HIDWORD(v508))

  v109 = BSFloatLessThanFloat();
  v110 = v100 - (v108 - v516 * 0.5);
  if (!v109)
    v110 = -0.0;
  v111 = v108 + v110;
  v523.origin.x = v517;
  v523.origin.y = v509;
  v523.size.width = v19;
  v523.size.height = v18;
  v112 = CGRectGetMaxX(v523) - v100;
  if (BSFloatGreaterThanFloat())
    v113 = v516 * 0.5 + v111 - v112;
  else
    v113 = 0.0;
  if (v510)
  {
    v524.origin.x = v32;
    v524.size.height = v514;
    v524.origin.y = v515;
    v524.size.width = v34;
    v114 = CGRectGetMaxY(v524) + v511;
  }
  else
  {
    v114 = v511;
  }
  v28 = v111 - v113;
  v29 = v518 * 0.5 + v114;
  if (v512)
    *v512 = v34 < v516 + -15.0;
LABEL_5:

  v30 = v28;
  v31 = v29;
  result.y = v31;
  result.x = v30;
  return result;
}

- (void)_preferredTextSizeChanged:(id)a3
{
  SBUILegibilityLabel *callToActionLabel;
  id v4;

  callToActionLabel = self->_callToActionLabel;
  -[CSTeachableMomentsContainerView _callToActionLabelFont](self, "_callToActionLabelFont", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityLabel setFont:](callToActionLabel, "setFont:", v4);

}

- (id)_callToActionLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB538], 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isStatusBarLayoutReady
{
  id WeakRetained;
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL4 v8;
  CGRect v10;
  CGRect v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarToFollow);
  v3 = WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "frameForPartWithIdentifier:", *MEMORY[0x1E0CEC1F8]),
        x = v10.origin.x,
        y = v10.origin.y,
        width = v10.size.width,
        height = v10.size.height,
        !CGRectEqualToRect(v10, *MEMORY[0x1E0C9D628])))
  {
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    v8 = !CGRectEqualToRect(v11, *MEMORY[0x1E0C9D648]);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIView)controlCenterGrabberView
{
  return self->_controlCenterGrabberView;
}

- (void)setControlCenterGrabberView:(id)a3
{
  objc_storeStrong((id *)&self->_controlCenterGrabberView, a3);
}

- (CSPropertyAnimatingTouchPassThroughView)controlCenterGrabberContainerView
{
  return self->_controlCenterGrabberContainerView;
}

- (void)setControlCenterGrabberContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_controlCenterGrabberContainerView, a3);
}

- (UIView)controlCenterGrabberPositionPlaceholderView
{
  return self->_controlCenterGrabberPositionPlaceholderView;
}

- (void)setControlCenterGrabberPositionPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_controlCenterGrabberPositionPlaceholderView, a3);
}

- (UIImageView)controlCenterGlyphView
{
  return self->_controlCenterGlyphView;
}

- (void)setControlCenterGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_controlCenterGlyphView, a3);
}

- (SBUILegibilityLabel)callToActionLabel
{
  return self->_callToActionLabel;
}

- (UIView)callToActionLabelPositionPlaceholderView
{
  return self->_callToActionLabelPositionPlaceholderView;
}

- (void)setCallToActionLabelPositionPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_callToActionLabelPositionPlaceholderView, a3);
}

- (UIStatusBar)statusBarToFollow
{
  return (UIStatusBar *)objc_loadWeakRetained((id *)&self->_statusBarToFollow);
}

- (BOOL)usesStatusBarRelativeLayoutForControlCenterTutors
{
  return self->_usesStatusBarRelativeLayoutForControlCenterTutors;
}

- (CABackdropLayer)controlCenterGrabberBackdropLayer
{
  return self->_controlCenterGrabberBackdropLayer;
}

- (void)setControlCenterGrabberBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_controlCenterGrabberBackdropLayer, a3);
}

- (SBLockScreenDefaults)lockScreenDefaults
{
  return self->_lockScreenDefaults;
}

- (void)setLockScreenDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenDefaults, a3);
}

- (BOOL)usesStatusBarRelativeLayoutForControlCenterTutorsY
{
  return self->_usesStatusBarRelativeLayoutForControlCenterTutorsY;
}

- (BOOL)adjustsControlCenterTutorsVisibilityForAvailableSpace
{
  return self->_adjustsControlCenterTutorsVisibilityForAvailableSpace;
}

- (UIView)controlCenterTutorsContainerView
{
  return self->_controlCenterTutorsContainerView;
}

- (void)setControlCenterTutorsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_controlCenterTutorsContainerView, a3);
}

- (UIView)controlCenterGlyphContainerView
{
  return self->_controlCenterGlyphContainerView;
}

- (void)setControlCenterGlyphContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_controlCenterGlyphContainerView, a3);
}

- (UIView)callToActionLabelContainerView
{
  return self->_callToActionLabelContainerView;
}

- (void)setCallToActionLabelContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_callToActionLabelContainerView, a3);
}

- (UIView)homeAffordanceContainerView
{
  return self->_homeAffordanceContainerView;
}

- (void)setHomeAffordanceContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceContainerView, a3);
}

- (UIView)homeAffordanceView
{
  return self->_homeAffordanceView;
}

- (void)setHomeAffordanceView:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_homeAffordanceContainerView, 0);
  objc_storeStrong((id *)&self->_callToActionLabelContainerView, 0);
  objc_storeStrong((id *)&self->_controlCenterGlyphContainerView, 0);
  objc_storeStrong((id *)&self->_controlCenterTutorsContainerView, 0);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_controlCenterGrabberBackdropLayer, 0);
  objc_destroyWeak((id *)&self->_statusBarToFollow);
  objc_storeStrong((id *)&self->_callToActionLabelPositionPlaceholderView, 0);
  objc_storeStrong((id *)&self->_callToActionLabel, 0);
  objc_storeStrong((id *)&self->_controlCenterGlyphView, 0);
  objc_storeStrong((id *)&self->_controlCenterGrabberPositionPlaceholderView, 0);
  objc_storeStrong((id *)&self->_controlCenterGrabberContainerView, 0);
  objc_storeStrong((id *)&self->_controlCenterGrabberView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
