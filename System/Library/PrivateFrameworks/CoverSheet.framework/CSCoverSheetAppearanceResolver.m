@implementation CSCoverSheetAppearanceResolver

- (CSCoverSheetAppearanceResolver)init
{
  CSCoverSheetAppearanceResolver *v2;
  SBFSteppedAnimationTimingFunctionCalculator *v3;
  SBFSteppedAnimationTimingFunctionCalculator *interactiveAnimationCalculator;
  SBFSteppedAnimationTimingFunctionCalculator *v5;
  void *v6;
  SBFSteppedAnimationTimingFunctionCalculator *v7;
  uint64_t v8;
  void *v9;
  SBFSteppedAnimationTimingFunctionCalculator *v10;
  void *v11;
  SBFSteppedAnimationTimingFunctionCalculator *v12;
  void *v13;
  SBFSteppedAnimationTimingFunctionCalculator *v14;
  void *v15;
  SBFSteppedAnimationTimingFunctionCalculator *v16;
  void *v17;
  SBFSteppedAnimationTimingFunctionCalculator *v18;
  void *v19;
  SBFSteppedAnimationTimingFunctionCalculator *v20;
  void *v21;
  SBFSteppedAnimationTimingFunctionCalculator *v22;
  void *v23;
  SBFSteppedAnimationTimingFunctionCalculator *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CSCoverSheetAppearanceResolver;
  v2 = -[CSCoverSheetAppearanceResolver init](&v27, sel_init);
  if (v2)
  {
    v3 = (SBFSteppedAnimationTimingFunctionCalculator *)objc_alloc_init(MEMORY[0x1E0DA9F00]);
    interactiveAnimationCalculator = v2->_interactiveAnimationCalculator;
    v2->_interactiveAnimationCalculator = v3;

    v5 = v2->_interactiveAnimationCalculator;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunction:withName:](v5, "addTimingFunction:withName:", v6, CFSTR("backgroundStyle"));

    v7 = v2->_interactiveAnimationCalculator;
    v8 = *MEMORY[0x1E0CD3038];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunction:withName:](v7, "addTimingFunction:withName:", v9, CFSTR("dateViewAlpha"));

    v10 = v2->_interactiveAnimationCalculator;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunction:withName:](v10, "addTimingFunction:withName:", v11, CFSTR("statusBarAlpha"));

    v12 = v2->_interactiveAnimationCalculator;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunction:withName:](v12, "addTimingFunction:withName:", v13, CFSTR("fixedFooterAlpha"));

    v14 = v2->_interactiveAnimationCalculator;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunction:withName:](v14, "addTimingFunction:withName:", v15, CFSTR("pageContentAlpha"));

    v16 = v2->_interactiveAnimationCalculator;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunction:withName:](v16, "addTimingFunction:withName:", v17, CFSTR("proudLockAlpha"));

    v18 = v2->_interactiveAnimationCalculator;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunction:withName:](v18, "addTimingFunction:withName:", v19, CFSTR("legibilitySettings"));

    v20 = v2->_interactiveAnimationCalculator;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunction:withName:](v20, "addTimingFunction:withName:", v21, CFSTR("homeAffordance"));

    v22 = v2->_interactiveAnimationCalculator;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunction:withName:](v22, "addTimingFunction:withName:", v23, CFSTR("controlCenterGrabber"));

    v24 = v2->_interactiveAnimationCalculator;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunction:withName:](v24, "addTimingFunction:withName:", v25, CFSTR("complicationContainer"));

  }
  return v2;
}

- (id)newActiveAppearanceGivenDesiredAppearance:(id)a3 oldAppearance:(id)a4 activeAppearance:(id)a5 activeBehavior:(id)a6 startIndex:(unint64_t)a7 targetIndex:(unint64_t)a8 indexOfMainPage:(unint64_t)a9 targetAppearance:(id)a10 modalAppearance:(id)a11 currentTransitionSource:(id)a12 contentTransitionIsAtCoverSheetLevel:(BOOL)a13 legibilityProvider:(id)a14 bounds:(CGRect)a15 whitePointValues:(id)a16 hasContentAboveCoverSheet:(BOOL)a17
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v26;
  CSBehavior *v27;
  CSBehavior *v28;
  id v29;
  CSCoverSheetViewTransitionSource **p_currentTransitionSource;
  NSArray *v31;
  NSArray *whitePointValues;
  char v33;
  double v34;
  double v35;
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
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;

  height = a15.size.height;
  width = a15.size.width;
  y = a15.origin.y;
  x = a15.origin.x;
  v73 = a3;
  v72 = a4;
  v26 = a5;
  v27 = (CSBehavior *)a6;
  v71 = a10;
  v70 = a11;
  v69 = a12;
  v68 = a14;
  objc_storeStrong((id *)&self->_desiredAppearance, a3);
  v28 = v27;
  v29 = a16;
  objc_storeStrong((id *)&self->_oldAppearance, a4);
  self->_activeBehavior = v27;
  self->_startIndex = a7;
  self->_targetIndex = a8;
  self->_indexOfMainPage = a9;
  objc_storeStrong((id *)&self->_targetAppearance, a10);
  objc_storeStrong((id *)&self->_modalAppearance, a11);
  p_currentTransitionSource = &self->_currentTransitionSource;
  objc_storeStrong((id *)&self->_currentTransitionSource, a12);
  self->_contentTransitionIsAtCoverSheetLevel = a13;
  objc_storeStrong((id *)&self->_legibilityProvider, a14);
  self->_bounds.origin.x = x;
  self->_bounds.origin.y = y;
  self->_bounds.size.width = width;
  self->_bounds.size.height = height;
  v31 = (NSArray *)objc_msgSend(v29, "copy");

  whitePointValues = self->_whitePointValues;
  self->_whitePointValues = v31;

  self->_hasContentAboveCoverSheet = a17;
  self->_fraction = 1.0;
  v33 = -[CSCoverSheetViewTransitionSource isTransitioning](self->_currentTransitionSource, "isTransitioning");
  self->_isTransitioning = v33;
  if ((v33 & 1) != 0)
  {
    if (*p_currentTransitionSource)
      -[CSCoverSheetViewTransitionSource transitionContext](*p_currentTransitionSource, "transitionContext");
    BSIntervalFractionForValue();
    self->_fraction = v34;
  }
  BSIntervalClip();
  self->_appearanceFraction = v35;
  -[SBFSteppedAnimationTimingFunctionCalculator setPercentComplete:](self->_interactiveAnimationCalculator, "setPercentComplete:");
  -[CSCoverSheetAppearanceResolver _resolveLegibilitySettings](self, "_resolveLegibilitySettings");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLegibilitySettings:", v36);

  -[CSCoverSheetAppearanceResolver _resolveBackgroundComponent](self, "_resolveBackgroundComponent");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v37);

  -[CSCoverSheetAppearanceResolver _resolveDateViewComponent](self, "_resolveDateViewComponent");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v38);

  -[CSCoverSheetAppearanceResolver _resolveComplicationContainerComponent]((uint64_t)self);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v39);

  -[CSCoverSheetAppearanceResolver _resolveRemoteInlineContentComponent]((uint64_t)self);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v40);

  -[CSCoverSheetAppearanceResolver _resolveStatusBarBackgroundComponent](self, "_resolveStatusBarBackgroundComponent");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v41);

  -[CSCoverSheetAppearanceResolver _resolveStatusBarComponent](self, "_resolveStatusBarComponent");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v42);

  -[CSCoverSheetAppearanceResolver _resolvePageContentComponent](self, "_resolvePageContentComponent");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v43);

  -[CSCoverSheetAppearanceResolver _resolveProudLockComponent](self, "_resolveProudLockComponent");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v44);

  -[CSCoverSheetAppearanceResolver _resolveHomeAffordanceComponent](self, "_resolveHomeAffordanceComponent");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v45);

  -[CSCoverSheetAppearanceResolver _resolveComponentWithType:](self, "_resolveComponentWithType:", 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v46);

  -[CSCoverSheetAppearanceResolver _resolveComponentWithType:](self, "_resolveComponentWithType:", 10);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v47);

  objc_msgSend(v26, "componentForType:identifier:", 12, CFSTR("(active)"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetAppearanceResolver _resolveFooterCallToActionLabelComponentWithHomeAffordance:](self, "_resolveFooterCallToActionLabelComponentWithHomeAffordance:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v49);

  -[CSCoverSheetAppearanceResolver _resolveControlCenterGrabberComponent](self, "_resolveControlCenterGrabberComponent");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v50);

  -[CSCoverSheetAppearanceResolver _resolveQuickActionsComponent](self, "_resolveQuickActionsComponent");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v51);

  -[CSCoverSheetAppearanceResolver _resolveSlideableContentComponent](self, "_resolveSlideableContentComponent");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v52);

  -[CSCoverSheetAppearanceResolver _resolveWallpaperComponent]((uint64_t)self);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v53);

  -[CSCoverSheetAppearanceResolver _resolveTintingComponent](self, "_resolveTintingComponent");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v54);

  -[CSCoverSheetAppearanceResolver _resolveContentComponent](self, "_resolveContentComponent");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v55);

  -[CSCoverSheetAppearanceResolver _resolveModalContentComponent]((uint64_t)self);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v56);

  -[CSCoverSheetAppearanceResolver _resolveStatusBarGradientComponent](self, "_resolveStatusBarGradientComponent");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v57);

  -[CSCoverSheetAppearanceResolver _resolvePoseidonComponent](self, "_resolvePoseidonComponent");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v58);

  -[CSCoverSheetAppearanceResolver _resolveWhitePointComponent](self, "_resolveWhitePointComponent");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v59);

  -[CSCoverSheetAppearanceResolver _resolveWallpaperFloatingLayerComponent]((uint64_t)self);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v60);

  -[CSCoverSheetAppearanceResolver _resolveBackgroundContentComponent]((uint64_t)self);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v61);

  -[CSCoverSheetAppearanceResolver _resolveComplicationSidebarComponent]((uint64_t)self);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v62);

  -[CSCoverSheetAppearanceResolver _resolveFullBleedContentComponent]((uint64_t)self);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v63);

  -[CSCoverSheetAppearanceResolver _resolveDimmingLayerComponent]((uint64_t)self);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addComponent:", v64);

  return v26;
}

- (id)_resolveComplicationContainerComponent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  _BYTE v23[7];
  uint64_t v24;
  char v25;
  _BYTE v26[7];

  if (!a1)
  {
    v3 = 0;
    return v3;
  }
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "priority:", 100);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "componentForType:identifier:", 20, CFSTR("(active)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 20, 128);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "transitionModifiers");

  v20 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 20, 256);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "transitionInputs");
  }
  else
  {
    v20 = 0u;
    v19 = 0u;
  }

  if ((v6 & 8) == 0)
  {
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if ((v6 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  SBFMainScreenScale();
  BSPointRoundForScale();
  v9 = v11;
  v10 = v12;
  objc_msgSend(v3, "setAnimationDuration:", *(double *)&v19);
  if ((v6 & 0x10) != 0)
  {
LABEL_9:
    objc_msgSend(v4, "scale", v19, (_QWORD)v20);
    v21 = v13;
    v22 = 1;
    memset(v23, 0, sizeof(v23));
    v24 = *((_QWORD *)&v20 + 1);
    v25 = 1;
    memset(v26, 0, sizeof(v26));
    objc_msgSend(v3, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:](a1, (uint64_t)&v21, 0));
    objc_msgSend(v3, "setAnimationDuration:", *(double *)&v19);
  }
LABEL_10:
  objc_msgSend(v4, "offset", (_QWORD)v19);
  objc_msgSend(v3, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:](a1, v14, v15, v9, v10));
  objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isHidden");

  objc_msgSend(v3, "setHidden:", v17);
  objc_msgSend(v3, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:](a1, 1.0, objc_msgSend(v4, "isHidden"), objc_msgSend(v3, "isHidden"), CFSTR("complicationContainer")));

  return v3;
}

- (id)_resolveRemoteInlineContentComponent
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (a1)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "priority:", 100);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "componentForType:identifier:", 21, CFSTR("(active)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden");
    objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 21, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isHidden");

    objc_msgSend(v3, "setHidden:", v7);
    objc_msgSend(v3, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:](a1, 1.0, v5, v7, CFSTR("proudLockAlpha")));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_resolveWallpaperComponent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  if (a1)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "priority:", 100);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "componentForType:identifier:", 6, CFSTR("(active)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isHidden");
    v7 = objc_msgSend(v5, "isHidden");
    v8 = v7;
    if (*(_BYTE *)(a1 + 16) && (_DWORD)v7)
    {
      v9 = *(_QWORD *)(a1 + 56) ? v6 : 1;
      if (v9 != 1)
        v8 = 0;
    }
    objc_msgSend(v3, "setHidden:", v8);
    objc_msgSend(*(id *)(a1 + 48), "flagForComponentType:", 6);
    objc_msgSend(*(id *)(a1 + 56), "flagForComponentType:", 6);
    if (*(_BYTE *)(a1 + 16)
      && ((BSSettingFlagIsExplicitNo() & 1) != 0 || *(_QWORD *)(a1 + 56) && (BSSettingFlagIsExplicitNo() & 1) != 0))
    {
      v10 = 0;
    }
    else
    {
      v10 = BSSettingFlagIsExplicitNo() ^ 1;
    }
    objc_msgSend(v3, "setShouldMatchBackgroundStyle:", v10);
    objc_msgSend(v3, "setLevel:", objc_msgSend(v5, "level"));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_resolveModalContentComponent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  if (!a1)
    return 0;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "priority:", 100);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "componentForType:identifier:", 22, CFSTR("(active)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 22, 128);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "transitionModifiers");

  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 22, 256, 0, 0, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "transitionInputs");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
  }

  if ((v6 & 0x40) != 0)
  {
    v9 = objc_msgSend(v4, "level");
    v10 = *((_QWORD *)&v15 + 1);
    if (*(_BYTE *)(a1 + 16))
    {
      v11 = v9;
      if (BSFloatIsZero())
        v10 = v11;
    }
    objc_msgSend(v3, "setLevel:", v10, v13, v14, (_QWORD)v15);
  }

  return v3;
}

- (id)_resolveWallpaperFloatingLayerComponent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a1)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "priority:", 100);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 23, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShouldRenderInline:", objc_msgSend(v4, "shouldRenderInline"));

    objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 23, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShouldRenderForPosterSwitcher:", objc_msgSend(v5, "shouldRenderForPosterSwitcher"));

    objc_msgSend(*(id *)(a1 + 48), "flagForComponentType:", 23);
    objc_msgSend(*(id *)(a1 + 56), "flagForComponentType:", 23);
    if (*(_BYTE *)(a1 + 16)
      && ((BSSettingFlagIsExplicitNo() & 1) != 0 || *(_QWORD *)(a1 + 56) && (BSSettingFlagIsExplicitNo() & 1) != 0))
    {
      v6 = 0;
    }
    else
    {
      v6 = BSSettingFlagIsExplicitNo() ^ 1;
    }
    objc_msgSend(v3, "setShouldMatchMove:", v6);
    objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 23, 4096);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLevel:", objc_msgSend(v7, "level"));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_resolveBackgroundContentComponent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  char v23;
  _BYTE v24[7];
  uint64_t v25;
  char v26;
  _BYTE v27[7];

  if (!a1)
    return 0;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "priority:", 100);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "componentForType:identifier:", 24, CFSTR("(active)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 24, 128);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "transitionModifiers");

  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 24, 256);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "transitionInputs");
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
  }

  if ((v6 & 8) != 0)
  {
    objc_msgSend(v4, "offset");
    objc_msgSend(v3, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:](a1, v9, v10, *((double *)&v19 + 1), *(double *)&v20));
    if ((v6 & 0x10) == 0)
    {
LABEL_7:
      if ((v6 & 0x40) == 0)
        goto LABEL_15;
LABEL_11:
      v12 = objc_msgSend(v4, "level", (_QWORD)v19);
      v13 = *((_QWORD *)&v21 + 1);
      if (*(_BYTE *)(a1 + 16))
      {
        v14 = v12;
        if (BSFloatIsZero())
          v13 = v14;
      }
      objc_msgSend(v3, "setLevel:", v13);
      goto LABEL_15;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v4, "scale", (_QWORD)v19);
  v22 = v11;
  v23 = 1;
  memset(v24, 0, sizeof(v24));
  v25 = *((_QWORD *)&v20 + 1);
  v26 = 1;
  memset(v27, 0, sizeof(v27));
  objc_msgSend(v3, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:](a1, (uint64_t)&v22, 0));
  objc_msgSend(v3, "setAnimationDuration:", *(double *)&v19);
  if ((v6 & 0x40) != 0)
    goto LABEL_11;
LABEL_15:
  objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 24, 1, (_QWORD)v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isHidden");

  objc_msgSend(v3, "setHidden:", v16);
  v17 = 1.0;
  if ((_DWORD)v16)
    v17 = 0.0;
  objc_msgSend(v3, "setAlpha:", v17);

  return v3;
}

- (id)_resolveComplicationSidebarComponent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (a1)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "priority:", 100);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "componentForType:identifier:", 25, CFSTR("(active)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 25, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHidden");

    objc_msgSend(v3, "setHidden:", v6);
    objc_msgSend(v3, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:](a1, 1.0, objc_msgSend(v4, "isHidden"), objc_msgSend(v3, "isHidden"), CFSTR("complicationContainer")));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_resolveFullBleedContentComponent
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "priority:", 100);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setFlag:", objc_msgSend(*(id *)(a1 + 48), "flagForComponentType:", 26));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_resolveDimmingLayerComponent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (a1)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "priority:", 100);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "componentForType:identifier:", 27, CFSTR("(active)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 27, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHidden");

    objc_msgSend(v3, "setHidden:", v6);
    objc_msgSend(v3, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:](a1, 1.0, objc_msgSend(v4, "isHidden"), objc_msgSend(v3, "isHidden"), CFSTR("dateViewAlpha")));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_resolveLegibilitySettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UILegibilitySettings *v11;
  void *discreteLegibilitySettings;
  _UILegibilitySettings *v13;
  _UILegibilitySettings *v14;
  _UILegibilitySettings *v16;
  _UILegibilitySettings *v17;

  -[CSAppearance legibilitySettings](self->_modalAppearance, "legibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_copy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance legibilitySettings](self->_oldAppearance, "legibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sb_copy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance legibilitySettings](self->_targetAppearance, "legibilitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sb_copy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance legibilitySettings](self->_desiredAppearance, "legibilitySettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sb_copy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v11 = v4;
LABEL_7:
    discreteLegibilitySettings = self->_discreteLegibilitySettings;
    self->_discreteLegibilitySettings = v11;
    goto LABEL_8;
  }
  if (v8)
  {
    v11 = v8;
    goto LABEL_7;
  }
  if (v10)
  {
    v11 = v10;
    goto LABEL_7;
  }
  -[CSLegibilityProviding currentLegibilitySettings](self->_legibilityProvider, "currentLegibilitySettings");
  discreteLegibilitySettings = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(discreteLegibilitySettings, "sb_copy");
  v16 = (_UILegibilitySettings *)objc_claimAutoreleasedReturnValue();
  v17 = self->_discreteLegibilitySettings;
  self->_discreteLegibilitySettings = v16;

LABEL_8:
  if (self->_isTransitioning)
  {
    -[SBFSteppedAnimationTimingFunctionCalculator valueForFunctionWithName:](self->_interactiveAnimationCalculator, "valueForFunctionWithName:", CFSTR("legibilitySettings"));
    _SBUIInterpolatedLegibilitySettings();
    v13 = (_UILegibilitySettings *)objc_claimAutoreleasedReturnValue();
    if (self->_fraction < 0.5)
      objc_storeStrong((id *)&self->_discreteLegibilitySettings, v6);
  }
  else
  {
    v13 = self->_discreteLegibilitySettings;
  }
  -[_UILegibilitySettings setMinFillHeight:](v13, "setMinFillHeight:", 0.0);
  -[_UILegibilitySettings setMinFillHeight:](self->_discreteLegibilitySettings, "setMinFillHeight:", 0.0);
  v14 = v13;

  return v14;
}

- (id)_resolveBackgroundComponent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 19, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:", v6);

  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 19, 64);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v8);

  -[SBFSteppedAnimationTimingFunctionCalculator valueForFunctionWithName:](self->_interactiveAnimationCalculator, "valueForFunctionWithName:", CFSTR("backgroundStyle"));
  objc_msgSend(v4, "setTransitionProgress:");
  return v4;
}

- (id)_resolveDateViewComponent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  char v37;
  _BYTE v38[7];
  uint64_t v39;
  char v40;
  _BYTE v41[7];

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", 1, CFSTR("(active)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHidden");

  v8 = objc_msgSend(v5, "isHidden");
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 1, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v10);

  objc_msgSend(v4, "setPageIndex:", 0);
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 1, 128);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "transitionModifiers");

  v35 = 0u;
  v34 = 0u;
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 1, 256);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "transitionInputs");
  }
  else
  {
    v35 = 0u;
    v34 = 0u;
  }

  if ((v12 & 8) != 0)
  {
    SBFMainScreenScale();
    BSPointRoundForScale();
    v15 = v17;
    v16 = v18;
    objc_msgSend(v4, "setAnimationDuration:", *(double *)&v34);
    if ((v12 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v15 = *MEMORY[0x1E0C9D538];
  v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if ((v12 & 0x10) != 0)
  {
LABEL_8:
    objc_msgSend(v5, "scale", v34, (_QWORD)v35);
    v36 = v19;
    v37 = 1;
    memset(v38, 0, sizeof(v38));
    v39 = *((_QWORD *)&v35 + 1);
    v40 = 1;
    memset(v41, 0, sizeof(v41));
    objc_msgSend(v4, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v36, 0));
    objc_msgSend(v4, "setAnimationDuration:", *(double *)&v34);
  }
LABEL_9:
  if ((v12 & 4) != 0)
    objc_msgSend(v4, "setStretch:", 1);
  objc_msgSend(v5, "offset", (_QWORD)v34);
  objc_msgSend(v4, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:]((uint64_t)self, v20, v21, v15, v16));
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 1, 16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setView:", v23);

  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 1, 8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVibrantAndCentered:", objc_msgSend(v24, "flag"));

  if (self->_startIndex != self->_targetIndex && (BSFloatIsOne() & 1) == 0)
  {
    if ((_DWORD)v7 != v8)
    {
      v25 = 72;
      if (v8)
        v25 = 80;
      v26 = *(char **)((char *)&self->super.isa + v25) - self->_indexOfMainPage;
      if ((_DWORD)v7)
      {
        objc_msgSend(v5, "offset");
        v15 = v27;
        v16 = v28;
      }
      objc_msgSend(v4, "setOffset:", v15, v16);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPageIndex:", v29);

    }
    v7 = v8 & v7;
  }
  objc_msgSend(v4, "setHidden:", v7);
  if (objc_msgSend(v4, "isHidden"))
    objc_msgSend(v4, "setHidesTime:", 1);
  objc_msgSend(MEMORY[0x1E0DA9F60], "rootSettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "awakeDateAlpha");
  v32 = v31;

  objc_msgSend(v4, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, v32, objc_msgSend(v5, "isHidden"), objc_msgSend(v4, "isHidden"), CFSTR("dateViewAlpha")));
  return v4;
}

- (double)_scaleForTransitionFromScale:(double)a3 toScale:(double)a4 timingFunction:
{
  double v5;
  char v6;
  _BYTE v7[7];
  double v8;
  char v9;
  _BYTE v10[7];

  if (!a1)
    return 0.0;
  v5 = a3;
  v6 = 1;
  memset(v7, 0, sizeof(v7));
  v8 = a4;
  v9 = 1;
  memset(v10, 0, sizeof(v10));
  return -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:](a1, (uint64_t)&v5, a2);
}

- (double)_offsetForTransitionFromOffset:(double)a3 toOffset:(double)a4 timingFunction:(double)a5
{
  double v8;
  double v10;
  char v11;
  _BYTE v12[7];
  double v13;
  char v14;
  _BYTE v15[7];

  if (!a1)
    return 0.0;
  v10 = a2;
  v11 = 1;
  memset(v12, 0, sizeof(v12));
  v13 = a4;
  v14 = 1;
  memset(v15, 0, sizeof(v15));
  v8 = -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:](a1, (uint64_t)&v10, 0);
  v10 = a3;
  v11 = 1;
  memset(v12, 0, sizeof(v12));
  v13 = a5;
  v14 = 1;
  memset(v15, 0, sizeof(v15));
  -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:](a1, (uint64_t)&v10, 0);
  return v8;
}

- (double)_dateViewAlphaForCurrentWakeState
{
  void *v1;
  double v2;
  double v3;

  if (!a1)
    return 0.0;
  objc_msgSend(MEMORY[0x1E0DA9F60], "rootSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "awakeDateAlpha");
  v3 = v2;

  return v3;
}

- (double)_alphaForTransitionFromHidden:(uint64_t)a3 toHidden:(int)a4 unhiddenAlpha:(void *)a5 timingFunction:
{
  id v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v14;
  char v15;
  _BYTE v16[7];
  double v17;
  char v18;
  _BYTE v19[7];
  _DWORD v20[2];
  _DWORD v21[2];

  if (!a1)
    return 0.0;
  v8 = a5;
  v9 = BSEqualBools();
  v21[0] = 0;
  *(_DWORD *)((char *)v21 + 3) = 0;
  v20[0] = 0;
  *(_DWORD *)((char *)v20 + 3) = 0;
  v10 = 0.0;
  if (a4)
    v11 = 0.0;
  else
    v11 = a2;
  if (a4)
    v10 = a2;
  if (v9)
    v10 = v11;
  v14 = v10;
  v15 = 1;
  *(_DWORD *)v16 = v21[0];
  *(_DWORD *)&v16[3] = 0;
  v17 = v11;
  v18 = 1;
  *(_DWORD *)v19 = v20[0];
  *(_DWORD *)&v19[3] = 0;
  v12 = -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:](a1, (uint64_t)&v14, v8);

  return v12;
}

- (double)_alphaForTransitionFromHidden:(int)a3 toHidden:(void *)a4 timingFunction:
{
  if (a1)
    return -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:](a1, 1.0, a2, a3, a4);
  else
    return 0.0;
}

- (id)_resolveStatusBarBackgroundComponent
{
  void *v3;
  void *v4;
  void *v5;
  int IsExplicitNo;
  int v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  char IsOne;
  int IsYes;
  uint64_t v15;
  void *v16;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", 8, CFSTR("(active)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAppearance flagForComponentType:](self->_desiredAppearance, "flagForComponentType:", 8);
  IsExplicitNo = BSSettingFlagIsExplicitNo();
  -[CSAppearance flagForComponentType:](self->_oldAppearance, "flagForComponentType:", 8);
  v7 = BSSettingFlagIsExplicitNo();
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 8, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHidden");

  v10 = objc_msgSend(v5, "isHidden");
  v11 = v9;
  if (self->_startIndex != self->_targetIndex)
  {
    v12 = v10;
    IsOne = BSFloatIsOne();
    v11 = v9;
    if ((IsOne & 1) == 0)
    {
      if (IsExplicitNo == v7)
      {
        v11 = v12 & v9;
      }
      else
      {
        IsYes = BSSettingFlagIsYes();
        v15 = 72;
        if (IsYes)
          v15 = 80;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(char **)((char *)&self->super.isa + v15) - self->_indexOfMainPage);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setValue:", v16);

        if (BSSettingFlagIsYes())
          v11 = v12;
        else
          v11 = v9;
      }
    }
  }
  objc_msgSend(v4, "setHidden:", v11);
  objc_msgSend(v4, "setShowBackgroundWhileTransitioning:", IsExplicitNo ^ 1u);
  objc_msgSend(v4, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, objc_msgSend(v5, "isHidden"), v9, CFSTR("dateViewAlpha")));

  return v4;
}

- (id)_resolveStatusBarComponent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  _BYTE v26[7];
  uint64_t v27;
  char v28;
  _BYTE v29[7];

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", 2, CFSTR("(active)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 2, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFakeStatusBarLevel:", v7);

  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 2, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", objc_msgSend(v8, "isHidden"));

  -[NSArray lastObject](self->_whitePointValues, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &unk_1E8E87F10;
  objc_msgSend(v9, "doubleValue");
  v12 = v11;

  objc_msgSend(v4, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, v12, objc_msgSend(v5, "isHidden"), objc_msgSend(v4, "isHidden"), CFSTR("statusBarAlpha")));
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 2, 128);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "transitionModifiers");

  v23 = 0u;
  v22 = 0u;
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 2, 256);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "transitionInputs");
  }
  else
  {
    v23 = 0u;
    v22 = 0u;
  }

  if ((v14 & 0x20) != 0)
  {
    objc_msgSend(v5, "blurRadius");
    v24 = v17;
    v25 = 1;
    memset(v26, 0, sizeof(v26));
    v27 = 0;
    v28 = 1;
    memset(v29, 0, sizeof(v29));
    objc_msgSend(v4, "setBlurRadius:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v24, 0));
    objc_msgSend(v4, "setAnimationDuration:", *(double *)&v22);
  }
  if ((v14 & 0x10) != 0)
  {
    objc_msgSend(v5, "scale");
    v24 = v18;
    v25 = 1;
    memset(v26, 0, sizeof(v26));
    v27 = *((_QWORD *)&v23 + 1);
    v28 = 1;
    memset(v29, 0, sizeof(v29));
    objc_msgSend(v4, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v24, 0));
    objc_msgSend(v4, "setAnimationDuration:", *(double *)&v22);
  }
  v19 = -[CSAppearance flagForComponentType:](self->_desiredAppearance, "flagForComponentType:", 2, v22, (_QWORD)v23);
  -[CSAppearance flagForComponentType:](self->_oldAppearance, "flagForComponentType:", 2);
  if (self->_isTransitioning && ((BSSettingFlagIsYes() & 1) != 0 || (BSSettingFlagIsYes() & 1) != 0))
  {
    v20 = 1;
  }
  else if (self->_hasContentAboveCoverSheet)
  {
    v20 = 0;
  }
  else
  {
    v20 = v19;
  }
  objc_msgSend(v4, "setFakeStatusBar:", v20);
  objc_msgSend(v4, "setLegibilitySettings:", self->_discreteLegibilitySettings);

  return v4;
}

- (id)_resolvePageContentComponent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", 4, CFSTR("(active)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", objc_msgSend(v6, "isHidden"));

  objc_msgSend(v4, "setSuppressHorizontalBounce:", -[CSAppearance flagForComponentType:](self->_desiredAppearance, "flagForComponentType:", 4));
  objc_msgSend(v4, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, objc_msgSend(v5, "isHidden"), objc_msgSend(v4, "isHidden"), CFSTR("pageContentAlpha")));

  return v4;
}

- (id)_resolveProudLockComponent
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  double v28;
  double v29;
  double v31;
  double v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  char v37;
  _BYTE v38[7];
  uint64_t v39;
  char v40;
  _BYTE v41[7];

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", 11, CFSTR("(active)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "offset");
  v7 = v6;
  v9 = v8;
  v10 = (double *)MEMORY[0x1E0C9D538];
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 11, 128);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "transitionModifiers");

  v35 = 0u;
  v34 = 0u;
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 11, 256);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "transitionInputs");
  }
  else
  {
    v35 = 0u;
    v34 = 0u;
  }
  v15 = *v10;
  v16 = v10[1];

  v17 = v16;
  v18 = v15;
  if ((v12 & 8) == 0)
  {
    if ((v12 & 0x10) == 0)
      goto LABEL_6;
LABEL_19:
    objc_msgSend(v5, "scale", v34, (_QWORD)v35);
    v36 = v33;
    v37 = 1;
    memset(v38, 0, sizeof(v38));
    v39 = *((_QWORD *)&v35 + 1);
    v40 = 1;
    memset(v41, 0, sizeof(v41));
    objc_msgSend(v4, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v36, 0));
    objc_msgSend(v4, "setAnimationDuration:", *(double *)&v34);
    if ((v12 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  SBFMainScreenScale();
  BSPointRoundForScale();
  v18 = v31;
  v17 = v32;
  objc_msgSend(v4, "setAnimationDuration:", *(double *)&v34);
  if ((v12 & 0x10) != 0)
    goto LABEL_19;
LABEL_6:
  if ((v12 & 0x20) != 0)
  {
LABEL_7:
    objc_msgSend(v5, "blurRadius", (_QWORD)v34);
    v36 = v19;
    v37 = 1;
    memset(v38, 0, sizeof(v38));
    v39 = 0;
    v40 = 1;
    memset(v41, 0, sizeof(v41));
    objc_msgSend(v4, "setBlurRadius:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v36, 0));
    objc_msgSend(v4, "setAnimationDuration:", *(double *)&v34);
  }
LABEL_8:
  v20 = -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:]((uint64_t)self, v7, v9, v18, v17);
  v22 = v21;
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 11, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", objc_msgSend(v23, "isHidden"));

  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 11, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "value");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v25);

  v26 = objc_msgSend(v5, "isHidden");
  v27 = objc_msgSend(v4, "isHidden");
  -[CSAppearance flagForComponentType:](self->_desiredAppearance, "flagForComponentType:", 11);
  -[CSAppearance flagForComponentType:](self->_oldAppearance, "flagForComponentType:", 11);
  objc_msgSend(v5, "alpha");
  if (self->_isTransitioning && ((v29 = v28, (BSSettingFlagIsYes() & 1) != 0) || BSSettingFlagIsYes()))
  {
    objc_msgSend(v4, "setAlpha:", v29, (_QWORD)v34);
  }
  else
  {
    v29 = -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, v26, v27, CFSTR("proudLockAlpha"));
    objc_msgSend(v4, "setAlpha:", fmin(fmax(v29 * 2.0 + -1.0, 0.0), 1.0));
    objc_msgSend(v4, "setOffset:", v20, v22);
  }
  if (BSPointEqualToPoint() && !BSFloatIsZero() && v26 != v27)
  {
    objc_msgSend(v4, "setAlpha:", v29);
    objc_msgSend(v4, "setOffset:", v18, v17);
  }

  return v4;
}

- (id)_resolveHomeAffordanceComponent
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  int v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  char v36;
  _BYTE v37[7];
  double v38;
  char v39;
  _BYTE v40[7];

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", 12, CFSTR("(active)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CSBehavior areRestrictedCapabilities:](self->_activeBehavior, "areRestrictedCapabilities:", 4096))
    v6 = 0;
  else
    v6 = !-[CSBehavior areRestrictedCapabilities:](self->_activeBehavior, "areRestrictedCapabilities:", 56);
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");

  v9 = v6 ^ 1;
  if (self->_isTransitioning)
    v10 = 0;
  else
    v10 = v6 ^ 1;
  objc_msgSend(v4, "setHidden:", v10 | v8);
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 12, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v12);

  if (self->_contentTransitionIsAtCoverSheetLevel)
    v13 = 0;
  else
    v13 = v9;
  objc_msgSend(v4, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, objc_msgSend(v5, "isHidden"), v13 | v8, CFSTR("homeAffordance")));
  v14 = -[CSAppearance flagForComponentType:](self->_desiredAppearance, "flagForComponentType:", 12);
  if (self->_hasContentAboveCoverSheet)
    v15 = 1;
  else
    v15 = v14;
  objc_msgSend(v4, "setSuppressTeachableMomentsAnimation:", v15);
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 12, 128);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "transitionModifiers");

  v34 = 0u;
  v33 = 0u;
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 12, 256);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "transitionInputs");
  }
  else
  {
    v34 = 0u;
    v33 = 0u;
  }

  if ((v17 & 8) != 0)
  {
    v21 = *((double *)&v33 + 1);
    v20 = *(double *)&v34;
    objc_msgSend(v4, "setAnimationDuration:", *(double *)&v33);
  }
  else
  {
    v21 = *MEMORY[0x1E0C9D538];
    v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v22 = -[CSCoverSheetAppearanceResolver _finalizeOffset:referenceFrame:]((uint64_t)self, v21, v20, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  v24 = v23;
  v25 = 1.0;
  if ((v17 & 0x10) != 0)
  {
    v25 = *((double *)&v34 + 1);
    objc_msgSend(v4, "setAnimationDuration:", *(double *)&v33);
  }
  v26 = objc_msgSend(v5, "isHidden", (_QWORD)v33);
  v27 = objc_msgSend(v4, "isHidden");
  if (!v26 || v27)
  {
    objc_msgSend(v5, "offset");
    v22 = -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:]((uint64_t)self, v28, v29, v22, v24);
    v24 = v30;
    objc_msgSend(v5, "scale");
    v35 = v31;
    v36 = 1;
    memset(v37, 0, sizeof(v37));
    v38 = v25;
    v39 = 1;
    memset(v40, 0, sizeof(v40));
    v25 = -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v35, 0);
  }
  objc_msgSend(v4, "setOffset:", v22, v24);
  objc_msgSend(v4, "setScale:", v25);

  return v4;
}

- (double)_finalizeOffset:(double)a3 referenceFrame:(CGFloat)a4
{
  double Width;
  CGRect v14;
  CGRect v15;

  if (!a1)
    return 0.0;
  if (BSFloatEqualToFloat())
  {
    v14.origin.x = a4;
    v14.origin.y = a5;
    v14.size.width = a6;
    v14.size.height = a7;
    CGRectGetHeight(v14);
  }
  if (BSFloatEqualToFloat())
  {
    v15.origin.x = a4;
    v15.origin.y = a5;
    v15.size.width = a6;
    v15.size.height = a7;
    Width = CGRectGetWidth(v15);
    if (a2 >= 0.0)
      return Width;
    else
      return -Width;
  }
  return a2;
}

- (id)_resolveComponentWithType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  _BYTE v21[7];
  uint64_t v22;
  char v23;
  _BYTE v24[7];

  +[CSComponent componentWithType:](CSComponent, "componentWithType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "priority:", 100);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", a3, CFSTR("(active)"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", a3, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", objc_msgSend(v8, "isHidden"));

  objc_msgSend(v6, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, objc_msgSend(v7, "isHidden"), objc_msgSend(v6, "isHidden"), CFSTR("fixedFooterAlpha")));
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", a3, 128);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "transitionModifiers");

  v18 = 0u;
  v17 = 0u;
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", a3, 256);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "transitionInputs");
  }
  else
  {
    v18 = 0u;
    v17 = 0u;
  }

  if ((v10 & 8) != 0)
  {
    objc_msgSend(v7, "offset");
    objc_msgSend(v6, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:]((uint64_t)self, v13, v14, *((double *)&v17 + 1), *(double *)&v18));
    objc_msgSend(v6, "setAnimationDuration:", *(double *)&v17);
  }
  if ((v10 & 0x10) != 0)
  {
    objc_msgSend(v7, "scale");
    v19 = v15;
    v20 = 1;
    memset(v21, 0, sizeof(v21));
    v22 = *((_QWORD *)&v18 + 1);
    v23 = 1;
    memset(v24, 0, sizeof(v24));
    objc_msgSend(v6, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v19, 0));
    objc_msgSend(v6, "setAnimationDuration:", *(double *)&v17);
  }

  return v6;
}

- (id)_resolveFooterCallToActionLabelComponentWithHomeAffordance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  unsigned int v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "priority:", 100);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", 9, CFSTR("(active)"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHidden");

  if (SBFEffectiveHomeButtonType() == 2)
    v10 = objc_msgSend(v4, "isHidden");
  else
    v10 = 0;
  objc_msgSend(v6, "setHidden:", v9 | v10);
  objc_msgSend(v6, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, objc_msgSend(v7, "isHidden"), objc_msgSend(v6, "isHidden"), CFSTR("fixedFooterAlpha")));

  return v6;
}

- (id)_resolveControlCenterGrabberComponent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;
  char v16;
  _BYTE v17[7];
  uint64_t v18;
  char v19;
  _BYTE v20[7];

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", 13, CFSTR("(active)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CSBehavior areRestrictedCapabilities:](self->_activeBehavior, "areRestrictedCapabilities:", 128))
  {
    objc_msgSend(v4, "setHidden:", 1);
  }
  else
  {
    -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", objc_msgSend(v6, "isHidden"));

  }
  objc_msgSend(v4, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, objc_msgSend(v5, "isHidden"), objc_msgSend(v4, "isHidden"), CFSTR("controlCenterGrabber")));
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 2, 128);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "transitionModifiers");

  v14 = 0u;
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 2, 256);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "transitionInputs");
  else
    v14 = 0u;

  if ((v8 & 0x20) != 0)
  {
    objc_msgSend(v5, "blurRadius");
    v15 = v11;
    v16 = 1;
    memset(v17, 0, sizeof(v17));
    v18 = 0;
    v19 = 1;
    memset(v20, 0, sizeof(v20));
    objc_msgSend(v4, "setBlurRadius:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v15, 0));
    objc_msgSend(v4, "setAnimationDuration:", 0.0);
  }
  if ((v8 & 0x10) != 0)
  {
    objc_msgSend(v5, "scale");
    v15 = v12;
    v16 = 1;
    memset(v17, 0, sizeof(v17));
    v18 = *((_QWORD *)&v14 + 1);
    v19 = 1;
    memset(v20, 0, sizeof(v20));
    objc_msgSend(v4, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v15, 0));
    objc_msgSend(v4, "setAnimationDuration:", 0.0);
  }

  return v4;
}

- (id)_resolveQuickActionsComponent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v18;
  double v19;
  uint64_t v20;
  __int128 v21;
  double v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  _BYTE v26[7];
  uint64_t v27;
  char v28;
  _BYTE v29[7];

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", 14, CFSTR("(active)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAppearance componentForType:property:](self->_oldAppearance, "componentForType:property:", 14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHidden");

  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHidden");

  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 14, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flag");

  objc_msgSend(v4, "setSuppressVisibleChanges:", BSSettingFlagIsYes());
  v11 = -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, v7, v9, CFSTR("proudLockAlpha"));
  objc_msgSend(v4, "setHidden:", v9);
  objc_msgSend(v4, "setAlpha:", v11);
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 14, 128);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "transitionModifiers");

  v23 = 0u;
  v21 = 0u;
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 14, 256);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "transitionInputs");
  }
  else
  {
    v23 = 0u;
    v21 = 0u;
  }

  if ((v13 & 8) == 0)
  {
    if ((v13 & 0x10) == 0)
      goto LABEL_6;
LABEL_10:
    objc_msgSend(v5, "scale", (_QWORD)v21);
    v24 = v20;
    v25 = 1;
    memset(v26, 0, sizeof(v26));
    v27 = *((_QWORD *)&v23 + 1);
    v28 = 1;
    memset(v29, 0, sizeof(v29));
    objc_msgSend(v4, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v24, 0));
    objc_msgSend(v4, "setAnimationDuration:", *(double *)&v21);
    if ((v13 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v5, "offset");
  objc_msgSend(v4, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:]((uint64_t)self, v18, v19, *((double *)&v21 + 1), *(double *)&v23));
  objc_msgSend(v4, "setAnimationDuration:", *(double *)&v21);
  if ((v13 & 0x10) != 0)
    goto LABEL_10;
LABEL_6:
  if ((v13 & 0x20) != 0)
  {
LABEL_7:
    objc_msgSend(v5, "blurRadius", (_QWORD)v21);
    v24 = v16;
    v25 = 1;
    memset(v26, 0, sizeof(v26));
    v27 = 0;
    v28 = 1;
    memset(v29, 0, sizeof(v29));
    objc_msgSend(v4, "setBlurRadius:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v24, 0));
    objc_msgSend(v4, "setAnimationDuration:", v22);
  }
LABEL_8:

  return v4;
}

- (id)_resolveSlideableContentComponent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v18;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", 5, CFSTR("(active)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 5, 128);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "transitionModifiers");

  v18 = 0u;
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 5, 256);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "transitionInputs");
  else
    v18 = 0u;

  if ((v7 & 8) != 0)
  {
    v11 = *((double *)&v18 + 1);
    v10 = 0.0;
    objc_msgSend(v4, "setAnimationDuration:", *(double *)&v18);
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v12 = -[CSCoverSheetAppearanceResolver _finalizeOffset:referenceFrame:]((uint64_t)self, v11, v10, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  v14 = v13;
  objc_msgSend(v5, "offset");
  objc_msgSend(v4, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:]((uint64_t)self, v15, v16, v12, v14));

  return v4;
}

- (id)_resolveTintingComponent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", 7, CFSTR("(active)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isHidden");
  v8 = objc_msgSend(v6, "isHidden");
  if (self->_isTransitioning
    && (BSIntervalSubIntervalValueForValue(),
        objc_msgSend(v4, "setAlpha:", 0, 1, 0x3FE0000000000000, 1, 0x3FD999999999999ALL, 1, 0x3FF0000000000000, 1, 0, 1, 0x3FF0000000000000, 1), self->_isTransitioning)&& (v8 & v7 & 1) == 0)
  {
    objc_msgSend(v4, "setHidden:", 0);
  }
  else
  {
    objc_msgSend(v4, "setHidden:", v8);
    if ((_DWORD)v8)
      objc_msgSend(v4, "setAlpha:", 0.0);
  }

  return v4;
}

- (id)_resolveContentComponent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  char v17;
  _BYTE v18[7];
  uint64_t v19;
  char v20;
  _BYTE v21[7];

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:identifier:](self->_oldAppearance, "componentForType:identifier:", 15, CFSTR("(active)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 15, 128);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "transitionModifiers");

  v15 = 0u;
  v14 = 0u;
  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 15, 256);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "transitionInputs");
  }
  else
  {
    v15 = 0u;
    v14 = 0u;
  }

  if ((v7 & 8) != 0)
  {
    objc_msgSend(v5, "offset");
    objc_msgSend(v4, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:]((uint64_t)self, v10, v11, *((double *)&v14 + 1), *(double *)&v15));
    objc_msgSend(v4, "setAnimationDuration:", *(double *)&v14);
  }
  if ((v7 & 0x10) != 0)
  {
    objc_msgSend(v5, "scale");
    v16 = v12;
    v17 = 1;
    memset(v18, 0, sizeof(v18));
    v19 = *((_QWORD *)&v15 + 1);
    v20 = 1;
    memset(v21, 0, sizeof(v21));
    objc_msgSend(v4, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v16, 0));
    objc_msgSend(v4, "setAnimationDuration:", *(double *)&v14);
  }

  return v4;
}

- (uint64_t)_levelForTransitionFromLevel:(uint64_t)a3 toLevel:
{
  if (!a1)
    return 0;
  if (*(_BYTE *)(a1 + 16) && BSFloatIsZero())
    return a2;
  return a3;
}

- (id)_resolveStatusBarGradientComponent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  objc_msgSend(v4, "setHidden:", v6);
  return v4;
}

- (id)_resolvePoseidonComponent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  objc_msgSend(v4, "setHidden:", v6);
  objc_msgSend(v4, "setAlpha:", (double)(v6 ^ 1));
  return v4;
}

- (id)_resolveWhitePointComponent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "priority:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 18, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "flag");

  -[CSAppearance componentForType:property:](self->_desiredAppearance, "componentForType:property:", 18, 1024);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animationDuration");
  v11 = v10;

  if (v11 == 0.0)
  {
    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dashBoardRemoteContentSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((_DWORD)v6)
    {
      if (objc_msgSend(v13, "animatesUndimming"))
      {
        objc_msgSend(v14, "undimDuration");
LABEL_7:
        v11 = v15;
      }
    }
    else if (objc_msgSend(v13, "animatesDimming"))
    {
      objc_msgSend(v14, "dimDuration");
      goto LABEL_7;
    }

  }
  objc_msgSend(v4, "setHidden:", v6);
  objc_msgSend(v4, "setLighterReduction:", v8);
  objc_msgSend(v4, "setAnimationDuration:", v11);
  return v4;
}

- (double)_valueForTransitionInterval:(void *)a3 timingFunction:
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 16))
    {
      if (v5)
        objc_msgSend(*(id *)(a1 + 8), "valueForFunctionWithName:", v5);
      BSIntervalValueForFraction();
      v7 = v8;
    }
    else
    {
      v7 = *(double *)(a2 + 16);
    }
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (void)setInteractiveAnimationCalculatorPercentComplete:(double)a3
{
  -[SBFSteppedAnimationTimingFunctionCalculator setPercentComplete:](self->_interactiveAnimationCalculator, "setPercentComplete:", a3);
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (double)appearanceFraction
{
  return self->_appearanceFraction;
}

- (void)setAppearanceFraction:(double)a3
{
  self->_appearanceFraction = a3;
}

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  self->_fraction = a3;
}

- (_UILegibilitySettings)discreteLegibilitySettings
{
  return self->_discreteLegibilitySettings;
}

- (void)setDiscreteLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_discreteLegibilitySettings, a3);
}

- (CSAppearance)desiredAppearance
{
  return self->_desiredAppearance;
}

- (void)setDesiredAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_desiredAppearance, a3);
}

- (CSAppearance)oldAppearance
{
  return self->_oldAppearance;
}

- (void)setOldAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_oldAppearance, a3);
}

- (CSBehavior)activeBehavior
{
  return self->_activeBehavior;
}

- (void)setActiveBehavior:(id)a3
{
  self->_activeBehavior = (CSBehavior *)a3;
}

- (unint64_t)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(unint64_t)a3
{
  self->_startIndex = a3;
}

- (unint64_t)targetIndex
{
  return self->_targetIndex;
}

- (void)setTargetIndex:(unint64_t)a3
{
  self->_targetIndex = a3;
}

- (unint64_t)indexOfMainPage
{
  return self->_indexOfMainPage;
}

- (void)setIndexOfMainPage:(unint64_t)a3
{
  self->_indexOfMainPage = a3;
}

- (CSAppearance)targetAppearance
{
  return self->_targetAppearance;
}

- (void)setTargetAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_targetAppearance, a3);
}

- (CSAppearance)modalAppearance
{
  return self->_modalAppearance;
}

- (void)setModalAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_modalAppearance, a3);
}

- (CSCoverSheetViewTransitionSource)currentTransitionSource
{
  return self->_currentTransitionSource;
}

- (void)setCurrentTransitionSource:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransitionSource, a3);
}

- (BOOL)contentTransitionIsAtCoverSheetLevel
{
  return self->_contentTransitionIsAtCoverSheetLevel;
}

- (void)setContentTransitionIsAtCoverSheetLevel:(BOOL)a3
{
  self->_contentTransitionIsAtCoverSheetLevel = a3;
}

- (CSLegibilityProviding)legibilityProvider
{
  return self->_legibilityProvider;
}

- (void)setLegibilityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_legibilityProvider, a3);
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (NSArray)whitePointValues
{
  return self->_whitePointValues;
}

- (void)setWhitePointValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)hasContentAboveCoverSheet
{
  return self->_hasContentAboveCoverSheet;
}

- (void)setHasContentAboveCoverSheet:(BOOL)a3
{
  self->_hasContentAboveCoverSheet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitePointValues, 0);
  objc_storeStrong((id *)&self->_legibilityProvider, 0);
  objc_storeStrong((id *)&self->_currentTransitionSource, 0);
  objc_storeStrong((id *)&self->_modalAppearance, 0);
  objc_storeStrong((id *)&self->_targetAppearance, 0);
  objc_storeStrong((id *)&self->_oldAppearance, 0);
  objc_storeStrong((id *)&self->_desiredAppearance, 0);
  objc_storeStrong((id *)&self->_discreteLegibilitySettings, 0);
  objc_storeStrong((id *)&self->_interactiveAnimationCalculator, 0);
}

@end
