@implementation CCUIOverlaySlideUpPresentationProvider

- (BOOL)backdropViewShouldUseAlphaTransformer
{
  return 1;
}

- (BOOL)isPanDismissalAvailable
{
  return 1;
}

- (BOOL)isZoomEnabled
{
  return 0;
}

- (BOOL)allowHotPocketDuringTransition
{
  return 1;
}

- (id)transitionStateForType:(unint64_t)a3 interactive:(BOOL)a4 translation:(CGPoint)a5
{
  double y;
  _BOOL8 v6;
  double v8;

  y = a5.y;
  v6 = a4;
  -[CCUIOverlaySlideUpPresentationProvider _pullUpTranslation](self, "_pullUpTranslation", a5.x);
  if (a3 == 1)
    v8 = -v8;
  return +[CCUIOverlayTransitionState stateWithType:interactive:progress:](CCUIOverlayTransitionState, "stateWithType:interactive:progress:", a3, v6, y / v8);
}

- (unint64_t)finalTransitionTypeForState:(id)a3 gestureTranslation:(CGPoint)a4 gestureVelocity:(CGPoint)a5
{
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
  {
    CCUIPortraitMainListGridGeometryInfo();
    if (!BSFloatGreaterThanOrEqualToFloat())
      return 0;
  }
  if (BSFloatLessThanFloat())
    return 1;
  return 2;
}

- (void)layoutViews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
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
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  CGFloat v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  CGFloat rect;
  double v86;
  double v87;
  uint64_t v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  v100 = *MEMORY[0x1E0C80C00];
  -[CCUIOverlaySlideUpPresentationProvider viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIOverlaySlideUpPresentationProvider metricsProvider](self, "metricsProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayBackgroundFrame");
  objc_msgSend(v5, "setFrame:");

  v6 = objc_msgSend(v4, "overlayInterfaceOrientation");
  objc_msgSend(v3, "pagingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v88 = v9;

  objc_msgSend(v4, "overlayReachabilityHeight");
  v94 = v10;
  objc_msgSend(v3, "overlayHeaderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "statusBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOrientation:", v6);

  objc_msgSend(v3, "overlayHeaderView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "statusBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCompactTrailingAlpha:", 0.0);

  objc_msgSend(v4, "overlayContainerFrame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v3, "overlayContainerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  objc_msgSend(v3, "pagingView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v16, v18, v20, v22);

  objc_msgSend(v3, "pagingView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutIfNeeded");

  v26 = CCUILayoutEdgeInsetsForInterfaceOrientation(v6);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  objc_msgSend(v4, "overlayContentSize");
  BSRectWithSize();
  rect = v34;
  v86 = v33;
  v90 = v35;
  v91 = v28;
  v83 = v28;
  v89 = v36;
  v37 = v16;
  v87 = v18;
  v92 = v22;
  v93 = v20;
  -[CCUIOverlaySlideUpPresentationProvider _edgeInsetsForContentSize:withinBounds:contentEdgeInsets:orientation:](self, "_edgeInsetsForContentSize:withinBounds:contentEdgeInsets:orientation:", v6, v35, v36, v16, v18, v20, v22, *(_QWORD *)&v26, *(_QWORD *)&v83, v30, *(_QWORD *)&v32);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  if ((unint64_t)(v6 - 3) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "userInterfaceIdiom");

    if (!v47)
    {
      -[CCUIOverlaySlideUpPresentationProvider _additionalHeaderHeight](self, "_additionalHeaderHeight");
      v39 = v39 + v48;
    }
  }
  objc_msgSend(v4, "setOverlayContentLayoutInset:", v39, v41, v43, v45);
  objc_msgSend(v4, "setOverlayContentLayoutOffset:", 0.0);
  v84 = fmax(v39, v94);
  -[CCUIOverlaySlideUpPresentationProvider _headerViewFrameForContentSize:withinBounds:contentInset:contentEdgeInsets:orientation:](self, "_headerViewFrameForContentSize:withinBounds:contentInset:contentEdgeInsets:orientation:", v6, v90, v89, v37, v87, v93, v92, *(_QWORD *)&v84, *(_QWORD *)&v41, *(_QWORD *)&v43, *(_QWORD *)&v45, *(_QWORD *)&v26, *(_QWORD *)&v91, v30, *(_QWORD *)&v32);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  objc_msgSend(v3, "overlayHeaderView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setFrame:", v50, v52, v54, v56);

  objc_msgSend(v3, "overlayHeaderView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setInterfaceOrientation:", v6);

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  objc_msgSend(v3, "overlayHeaderLayers");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v96 != v62)
          objc_enumerationMutation(v59);
        objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "setFrame:", v50, v52, v54, v56);
      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
    }
    while (v61);
  }

  objc_msgSend(v3, "overlayHeaderView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "statusBar");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setExpandedEdgeInsets:", 0.0, v91 + v86, 0.0, v32);

  objc_msgSend(v3, "overlayStatusLabelViewController");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setEdgeInsets:", 0.0, v91 + v86, 0.0, v32);

  objc_msgSend(v3, "overlayHeaderView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setSensorAttributionEdgeInsets:", 0.0, v91 + v86, 0.0, v32);

  v101.origin.x = v86;
  v101.origin.y = rect;
  v101.size.width = v90;
  v101.size.height = v89;
  v68 = v84 + CGRectGetHeight(v101);
  -[CCUIOverlaySlideUpPresentationProvider _additionalHeaderOffsetForEditing:](self, "_additionalHeaderOffsetForEditing:", -[CCUIOverlaySlideUpPresentationProvider _isEditing](self, "_isEditing") ^ 1);
  v102.origin.x = v37;
  v102.origin.y = v87;
  v102.size.height = v92;
  v102.size.width = v93;
  CGRectGetHeight(v102);
  v103.origin.x = v86;
  v103.origin.y = v68;
  v103.size.width = v90;
  v103.size.height = v89;
  CGRectGetMinY(v103);
  UIRectInsetEdges();
  v70 = v69;
  v72 = v71;
  objc_msgSend(v3, "editingAccessoryView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "sizeThatFits:", v70, v72);

  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  v75 = v74;
  v77 = v76;
  v79 = v78;
  v81 = v80;
  objc_msgSend(v3, "editingAccessoryView", v88);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setFrame:", v75, v77, v79, v81);

}

- (id)animationBatchForTransitionState:(id)a3 previousTransitionState:(id)a4
{
  id v5;
  CCUIAnimationBatch *v6;
  void *v7;
  double v8;
  double v9;

  v5 = a3;
  v6 = objc_alloc_init(CCUIAnimationBatch);
  -[CCUIOverlaySlideUpPresentationProvider _addBackgroundViewWeightingAnimationToBatch:transitionState:](self, "_addBackgroundViewWeightingAnimationToBatch:transitionState:", v6, v5);
  -[CCUIOverlaySlideUpPresentationProvider metricsProvider](self, "metricsProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overlayReachabilityHeight");
  v9 = fabs(v8);

  if (v9 < 2.22044605e-16)
  {
    -[CCUIOverlaySlideUpPresentationProvider _addHeaderContentTransformAnimationToBatch:transitionState:](self, "_addHeaderContentTransformAnimationToBatch:transitionState:", v6, v5);
    -[CCUIOverlaySlideUpPresentationProvider _addHeaderChevronAlphaAnimationToBatch:transitionState:](self, "_addHeaderChevronAlphaAnimationToBatch:transitionState:", v6, v5);
    -[CCUIOverlaySlideUpPresentationProvider _addHeaderStatusBarAlphaAnimationToBatch:transitionState:](self, "_addHeaderStatusBarAlphaAnimationToBatch:transitionState:", v6, v5);
    -[CCUIOverlaySlideUpPresentationProvider _addHeaderSensorStatusViewAlphaAnimationToBatch:transitionState:](self, "_addHeaderSensorStatusViewAlphaAnimationToBatch:transitionState:", v6, v5);
    -[CCUIOverlaySlideUpPresentationProvider _addHeaderContentTranslationAnimationToBatch:transitionState:](self, "_addHeaderContentTranslationAnimationToBatch:transitionState:", v6, v5);
  }
  -[CCUIOverlaySlideUpPresentationProvider _addAccessoryAlphaAnimationsToBatch:transitionState:](self, "_addAccessoryAlphaAnimationsToBatch:transitionState:", v6, v5);
  -[CCUIOverlaySlideUpPresentationProvider _addModuleTransformAnimationsToBatch:transitionState:](self, "_addModuleTransformAnimationsToBatch:transitionState:", v6, v5);

  return v6;
}

- (unint64_t)headerMode
{
  return 3;
}

- (id)transitionBetweenEditing
{
  CCUIAnimationBatch *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  CCUIOverlaySlideUpPresentationProvider *v12;
  char v13;

  v3 = objc_alloc_init(CCUIAnimationBatch);
  -[CCUIOverlaySlideUpPresentationProvider viewProvider](self, "viewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditing");
  objc_msgSend((id)objc_opt_class(), "_editingC2AnimationParametersToEditing:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__CCUIOverlaySlideUpPresentationProvider_transitionBetweenEditing__block_invoke;
  v10[3] = &unk_1E8CFC7D0;
  v13 = v5;
  v11 = v4;
  v12 = self;
  v7 = v4;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIAnimationBatch addAnimation:](v3, "addAnimation:", v8);

  return v3;
}

uint64_t __66__CCUIOverlaySlideUpPresentationProvider_transitionBetweenEditing__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "overlayHeaderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 48))
    v4 = 0.0;
  else
    v4 = 1.0;
  objc_msgSend(v2, "setAlpha:", v4);

  objc_msgSend(*(id *)(a1 + 32), "editingAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*(_BYTE *)(a1 + 48))
    v7 = 1.0;
  else
    v7 = 0.0;
  objc_msgSend(v5, "setAlpha:", v7);

  return objc_msgSend(*(id *)(a1 + 40), "layoutViews");
}

- (double)dismissalFlickMaximumTime
{
  return 0.2;
}

- (double)dismissalFlickMinimumVelocity
{
  return 600.0;
}

- (unint64_t)dismissalFlickAllowedDirections
{
  return 4;
}

- (UIEdgeInsets)_edgeInsetsForContentSize:(CGSize)a3 withinBounds:(CGRect)a4 contentEdgeInsets:(UIEdgeInsets)a5 orientation:(int64_t)a6
{
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if ((unint64_t)(a6 - 1) > 1)
  {
    CGRectGetHeight(a4);
    UIRoundToScale();
    v9 = v13;
  }
  else
  {
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    -[CCUIOverlaySlideUpPresentationProvider _additionalHeaderOffset](self, "_additionalHeaderOffset", a3.width, a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    v11 = v10;
    -[CCUIOverlaySlideUpPresentationProvider _effectiveHeaderViewHeight](self, "_effectiveHeaderViewHeight");
    v13 = v11 + v12;
  }
  v14 = v6;
  v15 = v9;
  v16 = v7;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (uint64_t)_headerViewFrameForContentSize:(double)a3 withinBounds:(CGFloat)a4 contentInset:(CGFloat)a5 contentEdgeInsets:(CGFloat)a6 orientation:(CGFloat)a7
{
  CGRect v15;
  CGRect v16;

  if ((unint64_t)(a9 - 1) > 1)
  {
    v16.origin.x = a4;
    v16.origin.y = a5;
    v16.size.width = a6;
    v16.size.height = a7;
    CGRectGetWidth(v16);
    return objc_msgSend(a1, "_additionalHeaderHeight");
  }
  else
  {
    objc_msgSend(a1, "_additionalHeaderOffset");
    v15.origin.x = a4;
    v15.origin.y = a5;
    v15.size.width = a6;
    v15.size.height = a7;
    CGRectGetWidth(v15);
    return objc_msgSend(a1, "_effectiveHeaderViewHeight");
  }
}

- (double)_pullUpTranslation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double Height;
  double v8;
  double v9;
  CGRect v11;

  -[CCUIOverlaySlideUpPresentationProvider viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIOverlaySlideUpPresentationProvider metricsProvider](self, "metricsProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CCUILayoutEdgeInsetsForInterfaceOrientation(objc_msgSend(v4, "overlayInterfaceOrientation"));
  objc_msgSend(v3, "overlayContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  Height = CGRectGetHeight(v11);
  objc_msgSend(v4, "overlayContentLayoutInset");
  v9 = Height - v8 - v5;

  return v9;
}

- (double)_effectiveHeaderViewHeight
{
  double v3;
  double v4;

  v3 = CCUIPortraitHeaderHeight();
  -[CCUIOverlaySlideUpPresentationProvider _additionalHeaderHeight](self, "_additionalHeaderHeight");
  return v3 + v4;
}

- (double)_additionalHeaderHeight
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[CCUIOverlaySlideUpPresentationProvider viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIOverlaySlideUpPresentationProvider metricsProvider](self, "metricsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalHeightForOrientation:", objc_msgSend(v5, "overlayInterfaceOrientation"));
  v7 = v6;

  return v7;
}

- (double)_additionalHeaderOffset
{
  double result;

  -[CCUIOverlaySlideUpPresentationProvider _additionalHeaderOffsetForEditing:](self, "_additionalHeaderOffsetForEditing:", -[CCUIOverlaySlideUpPresentationProvider _isEditing](self, "_isEditing"));
  return result;
}

- (double)_additionalHeaderOffsetForEditing:(BOOL)a3
{
  double result;
  void *v4;
  uint64_t v5;
  double v6;

  result = 0.0;
  if (a3)
  {
    -[CCUIOverlaySlideUpPresentationProvider metricsProvider](self, "metricsProvider", 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "overlayInterfaceOrientation");

    v6 = CCUILayoutEdgeInsetsForInterfaceOrientation(v5);
    return -CCUIStatusBarHeight() - v6;
  }
  return result;
}

- (BOOL)_isEditing
{
  void *v2;
  char v3;

  -[CCUIOverlaySlideUpPresentationProvider viewProvider](self, "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

+ (id)_baseC2AnimationParametersForTransitionState:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 IsReduceMotionEnabled;
  uint64_t *v6;
  id v7;

  v3 = a3;
  if (_baseC2AnimationParametersForTransitionState__onceToken_0 != -1)
    dispatch_once(&_baseC2AnimationParametersForTransitionState__onceToken_0, &__block_literal_global_2);
  if (objc_msgSend(v3, "isInteractive"))
  {
    v4 = (void *)_baseC2AnimationParametersForTransitionState__baseInteractiveParameters_0;
  }
  else
  {
    objc_msgSend(v3, "clampedPresentationProgress");
    if (BSFloatIsZero())
    {
      v4 = (void *)_baseC2AnimationParametersForTransitionState__baseDismissParameters_0;
    }
    else
    {
      IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      v6 = &_baseC2AnimationParametersForTransitionState__baseReduceMotionPresentParameters_0;
      if (!IsReduceMotionEnabled)
        v6 = &_baseC2AnimationParametersForTransitionState__basePresentParameters_0;
      v4 = (void *)*v6;
    }
  }
  v7 = v4;

  return v7;
}

void __87__CCUIOverlaySlideUpPresentationProvider__baseC2AnimationParametersForTransitionState___block_invoke()
{
  uint64_t v0;
  void *v1;
  CCUIMutableC2AnimationParameters *v2;
  uint64_t v3;
  void *v4;
  CCUIMutableC2AnimationParameters *v5;
  uint64_t v6;
  void *v7;
  CCUIMutableC2AnimationParameters *v8;
  uint64_t v9;
  void *v10;
  CCUIMutableC2AnimationParameters *v11;
  CAFrameRateRange v12;
  CAFrameRateRange v13;
  CAFrameRateRange v14;
  CAFrameRateRange v15;

  v11 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  -[CCUIMutableC2AnimationParameters setTension:](v11, "setTension:", 250.0);
  -[CCUIMutableC2AnimationParameters setFriction:](v11, "setFriction:", 22.0);
  v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v11, "setFrameRateRange:", *(double *)&v12.minimum, *(double *)&v12.maximum, *(double *)&v12.preferred);
  -[CCUIMutableC2AnimationParameters setHighFrameRateReason:](v11, "setHighFrameRateReason:", 2031617);
  v0 = -[CCUIMutableC2AnimationParameters copy](v11, "copy");
  v1 = (void *)_baseC2AnimationParametersForTransitionState__basePresentParameters_0;
  _baseC2AnimationParametersForTransitionState__basePresentParameters_0 = v0;

  v2 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  -[CCUIMutableC2AnimationParameters setTension:](v2, "setTension:", 250.0);
  -[CCUIMutableC2AnimationParameters setFriction:](v2, "setFriction:", 30.0);
  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v2, "setFrameRateRange:", *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
  -[CCUIMutableC2AnimationParameters setHighFrameRateReason:](v2, "setHighFrameRateReason:", 2031617);
  v3 = -[CCUIMutableC2AnimationParameters copy](v2, "copy");
  v4 = (void *)_baseC2AnimationParametersForTransitionState__baseReduceMotionPresentParameters_0;
  _baseC2AnimationParametersForTransitionState__baseReduceMotionPresentParameters_0 = v3;

  v5 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  -[CCUIMutableC2AnimationParameters setTension:](v5, "setTension:", 250.0);
  -[CCUIMutableC2AnimationParameters setFriction:](v5, "setFriction:", 22.0);
  v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v5, "setFrameRateRange:", *(double *)&v14.minimum, *(double *)&v14.maximum, *(double *)&v14.preferred);
  -[CCUIMutableC2AnimationParameters setHighFrameRateReason:](v5, "setHighFrameRateReason:", 2031617);
  v6 = -[CCUIMutableC2AnimationParameters copy](v5, "copy");
  v7 = (void *)_baseC2AnimationParametersForTransitionState__baseDismissParameters_0;
  _baseC2AnimationParametersForTransitionState__baseDismissParameters_0 = v6;

  v8 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  -[CCUIMutableC2AnimationParameters setInteractive:](v8, "setInteractive:", 1);
  -[CCUIMutableC2AnimationParameters setTension:](v8, "setTension:", 1754.61);
  -[CCUIMutableC2AnimationParameters setFriction:](v8, "setFriction:", 72.05);
  v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v8, "setFrameRateRange:", *(double *)&v15.minimum, *(double *)&v15.maximum, *(double *)&v15.preferred);
  -[CCUIMutableC2AnimationParameters setHighFrameRateReason:](v8, "setHighFrameRateReason:", 2031617);
  v9 = -[CCUIMutableC2AnimationParameters copy](v8, "copy");
  v10 = (void *)_baseC2AnimationParametersForTransitionState__baseInteractiveParameters_0;
  _baseC2AnimationParametersForTransitionState__baseInteractiveParameters_0 = v9;

}

+ (id)_moduleC2AnimationParametersForTransitionState:(id)a3 layoutRect:(CCUILayoutRect *)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "_baseC2AnimationParametersForTransitionState:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "tension");
  objc_msgSend(v5, "setTension:", v6 + 0.0);
  objc_msgSend(v5, "friction");
  objc_msgSend(v5, "setFriction:", v7 + 0.0);
  return v5;
}

+ (id)_editingC2AnimationParametersToEditing:(BOOL)a3
{
  CCUIMutableC2AnimationParameters *v3;
  CAFrameRateRange v5;

  v3 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  -[CCUIMutableC2AnimationParameters setTension:](v3, "setTension:", 436.1);
  -[CCUIMutableC2AnimationParameters setFriction:](v3, "setFriction:", 41.8);
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v3, "setFrameRateRange:", *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
  -[CCUIMutableC2AnimationParameters setHighFrameRateReason:](v3, "setHighFrameRateReason:", 2031618);
  return v3;
}

- (void)_addBackgroundViewWeightingAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  CCUIOverlaySlideUpPresentationProvider *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseC2AnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __102__CCUIOverlaySlideUpPresentationProvider__addBackgroundViewWeightingAnimationToBatch_transitionState___block_invoke;
  v14 = &unk_1E8CFC540;
  v15 = self;
  v16 = v6;
  v9 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);

}

void __102__CCUIOverlaySlideUpPresentationProvider__addBackgroundViewWeightingAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayBackgroundView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(*(id *)(a1 + 40), "isInteractive");
  objc_msgSend(*(id *)(a1 + 40), "clampedPresentationProgress");
  v4 = v3;
  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_pullUpTranslation");
    v4 = (v4 * v5 + (1.0 - v4) * 0.0) / 300.0;
  }
  objc_msgSend(v6, "setWeighting:", v4);

}

- (void)_addHeaderContentTransformAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  CCUIOverlaySlideUpPresentationProvider *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseC2AnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __101__CCUIOverlaySlideUpPresentationProvider__addHeaderContentTransformAnimationToBatch_transitionState___block_invoke;
  v14 = &unk_1E8CFC540;
  v15 = self;
  v16 = v6;
  v9 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);

}

void __101__CCUIOverlaySlideUpPresentationProvider__addHeaderContentTransformAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _OWORD v5[3];
  __int128 v6;
  __int128 v7;
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "_headerViewTransformForTransitionState:", *(_QWORD *)(a1 + 40));
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  objc_msgSend(v3, "setContentTransform:", v5);

}

- (CGAffineTransform)_headerViewTransformForTransitionState:(SEL)a3
{
  CGFloat v6;

  objc_msgSend(a4, "clampedPresentationProgress");
  -[CCUIOverlaySlideUpPresentationProvider _pullUpTranslation](self, "_pullUpTranslation");
  UIRoundToScale();
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  return CGAffineTransformMakeTranslation(retstr, 0.0, v6);
}

- (void)_addHeaderChevronAlphaAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  CCUIOverlaySlideUpPresentationProvider *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseC2AnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __97__CCUIOverlaySlideUpPresentationProvider__addHeaderChevronAlphaAnimationToBatch_transitionState___block_invoke;
  v14 = &unk_1E8CFC540;
  v15 = self;
  v16 = v6;
  v9 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);

}

void __97__CCUIOverlaySlideUpPresentationProvider__addHeaderChevronAlphaAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayHeaderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "presentationProgress");
  objc_msgSend(v4, "setChevronAlpha:", fmin(fmax((v3 + -0.88) * 0.3 / 0.07 + 0.0, 0.0), 0.3));

}

- (void)_addHeaderStatusBarAlphaAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  CCUIOverlaySlideUpPresentationProvider *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseC2AnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __99__CCUIOverlaySlideUpPresentationProvider__addHeaderStatusBarAlphaAnimationToBatch_transitionState___block_invoke;
  v14 = &unk_1E8CFC540;
  v15 = self;
  v16 = v6;
  v9 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);

}

void __99__CCUIOverlaySlideUpPresentationProvider__addHeaderStatusBarAlphaAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayHeaderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "presentationProgress");
  objc_msgSend(v4, "setStatusBarAlpha:", fmin(fmax((v3 + -0.88) / 0.07 + 0.0, 0.0), 1.0));

}

- (void)_addAccessoryAlphaAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  CCUIOverlaySlideUpPresentationProvider *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseC2AnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __94__CCUIOverlaySlideUpPresentationProvider__addAccessoryAlphaAnimationsToBatch_transitionState___block_invoke;
  v14 = &unk_1E8CFC540;
  v15 = self;
  v16 = v6;
  v9 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);

}

void __94__CCUIOverlaySlideUpPresentationProvider__addAccessoryAlphaAnimationsToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayPageControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "presentationProgress");
  objc_msgSend(v4, "setAlpha:", fmin(fmax((v3 + -0.88) / 0.07 + 0.0, 0.0), 1.0));

}

- (void)_addHeaderSensorStatusViewAlphaAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  CCUIOverlaySlideUpPresentationProvider *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseC2AnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __106__CCUIOverlaySlideUpPresentationProvider__addHeaderSensorStatusViewAlphaAnimationToBatch_transitionState___block_invoke;
  v14 = &unk_1E8CFC540;
  v15 = self;
  v16 = v6;
  v9 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);

}

void __106__CCUIOverlaySlideUpPresentationProvider__addHeaderSensorStatusViewAlphaAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayHeaderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "presentationProgress");
  objc_msgSend(v4, "setSensorStatusViewAlpha:", fmin(fmax((v3 + -0.88) / 0.07 + 0.0, 0.0), 1.0));

}

- (void)_addHeaderContentTranslationAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  CCUIOverlaySlideUpPresentationProvider *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseC2AnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __103__CCUIOverlaySlideUpPresentationProvider__addHeaderContentTranslationAnimationToBatch_transitionState___block_invoke;
  v14 = &unk_1E8CFC540;
  v15 = self;
  v16 = v6;
  v9 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);

}

void __103__CCUIOverlaySlideUpPresentationProvider__addHeaderContentTranslationAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v14 = 0u;
  v15 = 0;
  v13 = 0u;
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "_transformForTransitionState:rubberBandingHeight:", *(_QWORD *)(a1 + 40), 460.0, (unsigned __int128)0, (unsigned __int128)0, 0);
    v2 = *(void **)(a1 + 32);
  }
  objc_msgSend(v2, "viewProvider", v13, v14, v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pagingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "convertRect:toView:", 0);
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overlayHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "statusBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v9, "convertRect:toView:", 0);
  v12 = fmax(v6 - (v10 + v11) + 0.0, 0.0);
  objc_msgSend(v9, "setExpandedStatusBarTranslation:", v12);
  objc_msgSend(v9, "layoutIfNeeded");
  objc_msgSend(v8, "setVerticalContentTranslation:", v12);
  objc_msgSend(v8, "layoutIfNeeded");

}

- (void)_addModuleTransformAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CCUIOverlaySlideUpPresentationProvider viewProvider](self, "viewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__CCUIOverlaySlideUpPresentationProvider__addModuleTransformAnimationsToBatch_transitionState___block_invoke;
  v11[3] = &unk_1E8CFC5B8;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "enumerateOverlayModuleViewsWithBlock:", v11);

}

void __95__CCUIOverlaySlideUpPresentationProvider__addModuleTransformAnimationsToBatch_transitionState___block_invoke(_QWORD *a1, void *a2, _OWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[2];

  v5 = a2;
  v6 = (void *)objc_opt_class();
  v7 = a1[5];
  v8 = a3[1];
  v21[0] = *a3;
  v21[1] = v8;
  objc_msgSend(v6, "_moduleC2AnimationParametersForTransitionState:layoutRect:", v7, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__CCUIOverlaySlideUpPresentationProvider__addModuleTransformAnimationsToBatch_transitionState___block_invoke_2;
  v16[3] = &unk_1E8CFC590;
  v10 = (void *)a1[5];
  v11 = (void *)a1[6];
  v16[4] = a1[4];
  v12 = v10;
  v13 = a3[1];
  v19 = *a3;
  v20 = v13;
  v17 = v12;
  v18 = v5;
  v14 = v5;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v9, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:", v15);

}

void __95__CCUIOverlaySlideUpPresentationProvider__addModuleTransformAnimationsToBatch_transitionState___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_OWORD *)(a1 + 72);
    v6 = *(_OWORD *)(a1 + 56);
    v7 = v4;
    objc_msgSend(v2, "_moduleViewTransformForTransitionState:layoutRect:", v3, &v6);
  }
  objc_msgSend(*(id *)(a1 + 48), "c2AnimationContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v10;
  v8 = v11;
  objc_msgSend(v5, "setTransform:", &v6);

}

- (CGAffineTransform)_moduleViewTransformForTransitionState:(SEL)a3 layoutRect:(id)a4
{
  id v7;
  CGAffineTransform v9;
  CGAffineTransform t1;
  CGAffineTransform v11[2];

  memset(&v11[1], 0, sizeof(CGAffineTransform));
  v7 = a4;
  -[CCUIOverlaySlideUpPresentationProvider _transformForTransitionState:rubberBandingHeight:](self, "_transformForTransitionState:rubberBandingHeight:", v7, 460.0);
  memset(v11, 0, 48);
  -[CCUIOverlaySlideUpPresentationProvider _moduleViewScaleTransformForTransitionState:](self, "_moduleViewScaleTransformForTransitionState:", v7);

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  t1 = v11[0];
  v9 = v11[1];
  return CGAffineTransformConcat(retstr, &t1, &v9);
}

- (CGAffineTransform)_moduleViewScaleTransformForTransitionState:(SEL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGAffineTransform *result;
  id v11;

  v11 = a4;
  if (!objc_msgSend(v11, "isInteractive") || objc_msgSend(v11, "type") == 1)
    objc_msgSend(v11, "isInteractive");
  objc_msgSend(v11, "clampedPresentationProgress");
  v6 = v5 + 1.0 - v5;
  objc_msgSend(v11, "presentationProgress");
  v8 = fmax(v7 + -1.0, 0.0);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v9 = v6 + v8 * 0.0 + (1.0 - v8) * 0.0;
  CGAffineTransformMakeScale(retstr, v9, v9);

  return result;
}

- (CGAffineTransform)_transformForTransitionState:(SEL)a3 rubberBandingHeight:(id)a4
{
  id v7;
  CGFloat v8;

  v7 = a4;
  -[CCUIOverlaySlideUpPresentationProvider _pullUpTranslation](self, "_pullUpTranslation");
  objc_msgSend(v7, "clampedPresentationProgress");
  objc_msgSend(v7, "nonZeroPresentationProgress");
  objc_msgSend(v7, "clampedPresentationProgress");

  BSUIConstrainValueWithRubberBand();
  UIRoundToScale();
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  return CGAffineTransformMakeTranslation(retstr, 0.0, v8);
}

- (CCUIOverlayViewProvider)viewProvider
{
  return (CCUIOverlayViewProvider *)objc_loadWeakRetained((id *)&self->_viewProvider);
}

- (void)setViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_viewProvider, a3);
}

- (CCUIOverlayMetricsProvider)metricsProvider
{
  return (CCUIOverlayMetricsProvider *)objc_loadWeakRetained((id *)&self->_metricsProvider);
}

- (void)setMetricsProvider:(id)a3
{
  objc_storeWeak((id *)&self->_metricsProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_metricsProvider);
  objc_destroyWeak((id *)&self->_viewProvider);
}

@end
