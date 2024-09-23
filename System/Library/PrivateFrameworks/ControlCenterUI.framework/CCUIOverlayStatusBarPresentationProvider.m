@implementation CCUIOverlayStatusBarPresentationProvider

- (double)_effectiveTransitionHeight
{
  double v3;
  double v4;
  double v5;

  v3 = CCUIPortraitHeaderHeight();
  v4 = v3 - CCUIStatusBarHeight();
  -[CCUIOverlayStatusBarPresentationProvider _additionalHeaderHeight](self, "_additionalHeaderHeight");
  return v4 + v5;
}

- (double)_effectiveHeaderViewHeight
{
  double v3;
  double v4;

  v3 = CCUIPortraitHeaderHeight();
  -[CCUIOverlayStatusBarPresentationProvider _additionalHeaderHeight](self, "_additionalHeaderHeight");
  return v3 + v4;
}

- (void)layoutViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
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
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  double MaxX;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double Height;
  double v78;
  void *v79;
  double v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  void *v86;
  uint64_t v87;
  void *v88;
  double Width;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  uint64_t v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  double x;
  double v124;
  double v125;
  double MinY;
  double v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  uint64_t v132;
  double v133;
  CGFloat rect;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _BYTE v147[128];
  uint64_t v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;

  v148 = *MEMORY[0x1E0C80C00];
  -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIOverlayStatusBarPresentationProvider metricsProvider](self, "metricsProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "overlayInterfaceOrientation");
  objc_msgSend(v3, "pagingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v132 = v8;

  objc_msgSend(v4, "overlayReachabilityHeight");
  v138 = v9;
  objc_msgSend(v3, "overlayHeaderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "statusBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOrientation:", v5);

  objc_msgSend(v4, "overlayBackgroundFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if ((unint64_t)(v5 - 1) <= 1)
  {
    UIRectInset();
    v13 = v20;
    v15 = v21;
    v17 = v22;
    v19 = v23;
  }
  objc_msgSend(v3, "overlayBackgroundView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v13, v15, v17, v19);

  objc_msgSend(v4, "overlayContainerFrame");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  objc_msgSend(v3, "overlayContainerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

  objc_msgSend(v3, "pagingView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v26;
  v140 = v32;
  v141 = v30;
  v142 = v28;
  objc_msgSend(v34, "setFrame:", v26, v28, v30, v32);

  objc_msgSend(v3, "pagingView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layoutIfNeeded");

  CCUILayoutEdgeInsetsForInterfaceOrientation(v5);
  CCUIEdgeInsetsRTLSwap();
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v135 = v42;
  objc_msgSend(v4, "overlayContentSize");
  BSRectWithSize();
  v44 = v43;
  rect = v45;
  v136 = v47;
  v137 = v46;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "userInterfaceIdiom");

  v133 = 0.0;
  if ((v49 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "userInterfaceLayoutDirection");

    if (v51 != 1)
    {
      v149.origin.x = v26;
      v149.size.height = v32;
      v149.size.width = v141;
      v149.origin.y = v142;
      MaxX = CGRectGetMaxX(v149);
      v150.origin.x = v44;
      v150.origin.y = rect;
      v150.size.height = v136;
      v150.size.width = v137;
      v133 = MaxX - CGRectGetWidth(v150);
    }
  }
  -[CCUIOverlayStatusBarPresentationProvider _edgeInsetsForContentSize:withinBounds:contentEdgeInsets:orientation:](self, "_edgeInsetsForContentSize:withinBounds:contentEdgeInsets:orientation:", v5, v137, v136, v139, v142, v141, v32, v37, *(_QWORD *)&v39, v41, *(_QWORD *)&v135);
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  if ((unint64_t)(v5 - 3) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "userInterfaceIdiom");

    v53 = v54;
    if (!v62)
    {
      -[CCUIOverlayStatusBarPresentationProvider _additionalHeaderHeight](self, "_additionalHeaderHeight", v54);
      v53 = v54 + v63;
    }
  }
  objc_msgSend(v4, "setOverlayContentLayoutInset:", v53, v56, v58, v60);
  if ((unint64_t)(v5 - 1) >= 2)
    v64 = -0.0;
  else
    v64 = v138;
  objc_msgSend(v4, "setOverlayContentLayoutOffset:", *MEMORY[0x1E0C9D538], v64 + *(double *)(MEMORY[0x1E0C9D538] + 8));
  v131 = v64 + v54;
  -[CCUIOverlayStatusBarPresentationProvider _headerViewFrameForContentSize:withinBounds:contentInset:contentEdgeInsets:orientation:](self, "_headerViewFrameForContentSize:withinBounds:contentInset:contentEdgeInsets:orientation:", v5, v137, v136, v139, v142, v141, v140, v64 + v54, *(_QWORD *)&v56, *(_QWORD *)&v58, *(_QWORD *)&v60, v37, *(_QWORD *)&v39, v41, *(_QWORD *)&v135);
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v72 = v64 + v71;
  objc_msgSend(v3, "overlayHeaderView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setFrame:", v66, v72, v68, v70);

  objc_msgSend(v3, "overlayHeaderView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setInterfaceOrientation:", v5);

  -[CCUIOverlayStatusBarPresentationProvider _effectiveTransitionHeight](self, "_effectiveTransitionHeight");
  v76 = v75;
  v151.origin.x = v66;
  v151.origin.y = v72;
  v151.size.width = v68;
  v151.size.height = v70;
  Height = CGRectGetHeight(v151);
  v78 = fmin(v76, Height - CCUIStatusBarHeight());
  objc_msgSend(v3, "overlayHeaderView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0.0;
  objc_msgSend(v79, "setEdgeInsets:", v78, 0.0, 0.0, 0.0);

  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  objc_msgSend(v3, "overlayHeaderLayers");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v143, v147, 16);
  if (v82)
  {
    v83 = v82;
    v84 = *(_QWORD *)v144;
    do
    {
      for (i = 0; i != v83; ++i)
      {
        if (*(_QWORD *)v144 != v84)
          objc_enumerationMutation(v81);
        objc_msgSend(*(id *)(*((_QWORD *)&v143 + 1) + 8 * i), "setFrame:", v66, v72, v68, v70);
      }
      v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v143, v147, 16);
    }
    while (v83);
  }

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v86, "userInterfaceIdiom");

  if ((v87 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0.0;
    if (objc_msgSend(v88, "userInterfaceLayoutDirection") == 1)
    {
      v152.origin.x = v139;
      v152.size.height = v140;
      v152.size.width = v141;
      v152.origin.y = v142;
      Width = CGRectGetWidth(v152);
      v153.origin.x = v133;
      v153.origin.y = rect;
      v153.size.height = v136;
      v153.size.width = v137;
      v80 = Width - CGRectGetMaxX(v153);
    }

  }
  objc_msgSend(v4, "overlayStatusBarStyle");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "statusBarInsets");
  v92 = v91;
  v94 = v93;
  v129 = v95;
  v97 = v96;

  v130 = v39;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v98, "userInterfaceIdiom");

  v100 = -0.0;
  if ((v99 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v100 = v133;
  v101 = v80 + v39 + v94 + 4.0 + 35.0 + v100;
  objc_msgSend(v3, "overlayHeaderView");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "statusBar");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setCompactEdgeInsets:", v92, v101, 0.0, v97);

  v154.origin.x = v139;
  v154.size.height = v140;
  v154.size.width = v141;
  v154.origin.y = v142;
  v104 = CGRectGetWidth(v154);
  v105 = v138 + v92;
  v106 = CCUIStatusBarHeight() - (v92 + v129);
  objc_msgSend(v3, "overlayLeadingStatusBar");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setFrame:", v94 + 0.0, v105, v104 - (v94 + v97), v106);

  v108 = v130 + v133 + v80;
  objc_msgSend(v3, "overlayHeaderView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "statusBar");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setExpandedEdgeInsets:", 0.0, v108, 0.0, v135);

  objc_msgSend(v3, "overlayHeaderView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setSensorAttributionEdgeInsets:", 0.0, v108, 0.0, v135);

  objc_msgSend(v3, "overlayStatusLabelViewController");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setEdgeInsets:", 0.0, v108, 0.0, v135);

  v155.origin.x = v133;
  v155.origin.y = rect;
  v155.size.width = v137;
  v155.size.height = v136;
  v113 = v131 + CGRectGetHeight(v155);
  -[CCUIOverlayStatusBarPresentationProvider _additionalHeaderOffsetForEditing:](self, "_additionalHeaderOffsetForEditing:", -[CCUIOverlayStatusBarPresentationProvider _isEditing](self, "_isEditing") ^ 1);
  v156.origin.x = v139;
  v156.size.height = v140;
  v156.size.width = v141;
  v156.origin.y = v142;
  CGRectGetHeight(v156);
  v157.origin.x = v133;
  v157.origin.y = v113;
  v157.size.width = v137;
  v157.size.height = v136;
  CGRectGetMinY(v157);
  UIRectInsetEdges();
  v115 = v114;
  v117 = v116;
  v119 = v118;
  v121 = v120;
  objc_msgSend(v3, "editingAccessoryView");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "sizeThatFits:", v119, v121);

  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  x = v158.origin.x;
  v124 = v158.size.width;
  v125 = v158.size.height;
  MinY = CGRectGetMinY(v158);
  v159.origin.x = v115;
  v159.origin.y = v117;
  v159.size.width = v119;
  v159.size.height = v121;
  v127 = fmin(MinY, CGRectGetMinY(v159) + 30.0);
  objc_msgSend(v3, "editingAccessoryView", v132);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setFrame:", x, v127, v124, v125);

}

- (double)_additionalHeaderHeight
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIOverlayStatusBarPresentationProvider metricsProvider](self, "metricsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalHeightForOrientation:", objc_msgSend(v5, "overlayInterfaceOrientation"));
  v7 = v6;

  return v7;
}

- (CCUIOverlayMetricsProvider)metricsProvider
{
  return (CCUIOverlayMetricsProvider *)objc_loadWeakRetained((id *)&self->_metricsProvider);
}

- (CCUIOverlayViewProvider)viewProvider
{
  return (CCUIOverlayViewProvider *)objc_loadWeakRetained((id *)&self->_viewProvider);
}

- (uint64_t)_headerViewFrameForContentSize:(double)a3 withinBounds:(CGFloat)a4 contentInset:(CGFloat)a5 contentEdgeInsets:(CGFloat)a6 orientation:(CGFloat)a7
{
  void *v14;
  uint64_t v15;
  CGRect v17;
  CGRect v18;

  if ((unint64_t)(a9 - 1) < 2
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "userInterfaceIdiom"),
        v14,
        (v15 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    objc_msgSend(a1, "_additionalHeaderOffset");
    v17.origin.x = a4;
    v17.origin.y = a5;
    v17.size.width = a6;
    v17.size.height = a7;
    CGRectGetWidth(v17);
    return objc_msgSend(a1, "_effectiveHeaderViewHeight");
  }
  else
  {
    v18.origin.x = a4;
    v18.origin.y = a5;
    v18.size.width = a6;
    v18.size.height = a7;
    CGRectGetWidth(v18);
    return objc_msgSend(a1, "_additionalHeaderHeight");
  }
}

- (UIEdgeInsets)_edgeInsetsForContentSize:(CGSize)a3 withinBounds:(CGRect)a4 contentEdgeInsets:(UIEdgeInsets)a5 orientation:(int64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
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
  CGRect v28;
  CGRect v29;
  UIEdgeInsets result;

  if ((unint64_t)(a6 - 1) < 2)
    goto LABEL_3;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.height;
  v12 = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
LABEL_3:
    v16 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v15 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v17 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[CCUIOverlayStatusBarPresentationProvider _additionalHeaderOffset](self, "_additionalHeaderOffset", a3.width, a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    v19 = v18;
    -[CCUIOverlayStatusBarPresentationProvider _effectiveHeaderViewHeight](self, "_effectiveHeaderViewHeight");
    v21 = v19 + v20;
  }
  else
  {
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v22 = fmax(CGRectGetWidth(v28) - v12, 0.0);
    UIRoundToScale();
    v16 = v23;
    v17 = v22 - v23;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v24 = fmax(CGRectGetHeight(v29) - v11, 0.0);
    UIRoundToScale();
    v15 = v24 - v21;
  }
  v25 = v16;
  v26 = v15;
  v27 = v17;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v21;
  return result;
}

- (BOOL)isPanDismissalAvailable
{
  return 1;
}

- (BOOL)isZoomEnabled
{
  return 1;
}

- (BOOL)allowHotPocketDuringTransition
{
  return 0;
}

- (BOOL)backdropViewShouldUseAlphaTransformer
{
  return objc_msgSend(MEMORY[0x1E0D14790], "_controlCenterBackgroundRecipe") == 21;
}

- (id)transitionStateForType:(unint64_t)a3 interactive:(BOOL)a4 translation:(CGPoint)a5
{
  double y;
  CGFloat x;
  _BOOL8 v7;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double MinY;
  double v15;
  id v16;
  id v17;
  double v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  double (*v23)(uint64_t);
  void *v24;
  void *v25;
  void *v26;
  CGFloat v27;
  double v28;
  double v29;
  unint64_t v30;
  CGRect v31;

  y = a5.y;
  x = a5.x;
  v7 = a4;
  -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIOverlayStatusBarPresentationProvider metricsProvider](self, "metricsProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v11, "overlayInterfaceOrientation") - 3) > 1
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "userInterfaceIdiom"),
        v12,
        v13))
  {
    -[CCUIOverlayStatusBarPresentationProvider _effectiveTransitionHeight](self, "_effectiveTransitionHeight");
  }
  else
  {
    -[CCUIOverlayStatusBarPresentationProvider _presentedViewFrame](self, "_presentedViewFrame");
    MinY = CGRectGetMinY(v31);
  }
  if (a3 != 1)
    MinY = -MinY;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __91__CCUIOverlayStatusBarPresentationProvider_transitionStateForType_interactive_translation___block_invoke;
  v24 = &unk_1E8CFC3A8;
  v25 = v11;
  v26 = v10;
  v27 = x;
  v28 = y;
  v29 = MinY;
  v30 = a3;
  v15 = y / MinY;
  v16 = v10;
  v17 = v11;
  v18 = __91__CCUIOverlayStatusBarPresentationProvider_transitionStateForType_interactive_translation___block_invoke((uint64_t)&v21);
  +[CCUIOverlayTransitionState stateWithType:interactive:progress:pagingProgress:](CCUIOverlayTransitionState, "stateWithType:interactive:progress:pagingProgress:", a3, v7, v15, v18, v21, v22, v23, v24, v25, v26, *(_QWORD *)&v27, *(_QWORD *)&v28, *(_QWORD *)&v29, v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

double __91__CCUIOverlayStatusBarPresentationProvider_transitionStateForType_interactive_translation___block_invoke(uint64_t a1)
{
  double v2;
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
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGRect v23;

  v2 = 0.0;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "overlayPageCount") >= 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "overlayPageControl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 40), "pagingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertRect:toView:", v12, v5, v7, v9, v11);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v23.origin.x = v14;
    v23.origin.y = v16;
    v23.size.width = v18;
    v23.size.height = v20;
    v21 = fmin(fmax((*(double *)(a1 + 56) - *(double *)(a1 + 64)) / (CGRectGetMinY(v23) - *(double *)(a1 + 64)), 0.0), 1.0);
    if (*(_QWORD *)(a1 + 72) == 1)
      v2 = v21;
    else
      v2 = 0.0;

  }
  return v2;
}

- (unint64_t)finalTransitionTypeForState:(id)a3 gestureTranslation:(CGPoint)a4 gestureVelocity:(CGPoint)a5
{
  id v5;
  int v6;
  uint64_t v7;
  unint64_t v8;

  v5 = a3;
  v6 = BSFloatGreaterThanOrEqualToFloat();
  v7 = objc_msgSend(v5, "type");
  if (v6)
  {
    if (v7 == 1)
    {
      v8 = BSFloatGreaterThanFloat();
    }
    else if (BSFloatLessThanFloat())
    {
      v8 = 2;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    if (v7 == 1)
      objc_msgSend(v5, "snappedStatusBarPresentationProgress");
    else
      objc_msgSend(v5, "snappedPresentationProgress");
    if (BSFloatIsOne())
      v8 = 1;
    else
      v8 = 2;
  }

  return v8;
}

- (id)animationBatchForTransitionState:(id)a3 previousTransitionState:(id)a4
{
  id v6;
  id v7;
  CCUIAnimationBatch *v8;
  _BOOL4 v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CCUIAnimationBatch);
  -[CCUIOverlayStatusBarPresentationProvider _addLeadingStatusBarAlphaAnimationToBatch:transitionState:](self, "_addLeadingStatusBarAlphaAnimationToBatch:transitionState:", v8, v6);
  -[CCUIOverlayStatusBarPresentationProvider _addHeaderContentTransformAnimationToBatch:transitionState:](self, "_addHeaderContentTransformAnimationToBatch:transitionState:", v8, v6);
  -[CCUIOverlayStatusBarPresentationProvider _addHeaderSensorStatusViewAlphaAnimationToBatch:transitionState:](self, "_addHeaderSensorStatusViewAlphaAnimationToBatch:transitionState:", v8, v6);
  v9 = +[CCUIOverlayTransitionState isSignificantStatusBarTransitionFrom:to:](CCUIOverlayTransitionState, "isSignificantStatusBarTransitionFrom:to:", v7, v6);

  if (v9)
  {
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      -[CCUIOverlayStatusBarPresentationProvider _addReducedMotionStatusBarStateAnimationToBatch:transitionState:](self, "_addReducedMotionStatusBarStateAnimationToBatch:transitionState:", v8, v6);
    }
    else
    {
      -[CCUIOverlayStatusBarPresentationProvider _addStatusBarStateAnimationToBatch:transitionState:](self, "_addStatusBarStateAnimationToBatch:transitionState:", v8, v6);
      -[CCUIOverlayStatusBarPresentationProvider _addStatusBarAlphaAnimationToBatch:transitionState:](self, "_addStatusBarAlphaAnimationToBatch:transitionState:", v8, v6);
    }
  }

  return v8;
}

- (unint64_t)headerMode
{
  return 2;
}

- (id)secondaryAnimationBatchForTransitionState:(id)a3 previousTransitionState:(id)a4
{
  id v6;
  id v7;
  CCUIAnimationBatch *v8;
  _BOOL4 v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CCUIAnimationBatch);
  -[CCUIOverlayStatusBarPresentationProvider _addBackgroundViewWeightingAnimationToBatch:transitionState:](self, "_addBackgroundViewWeightingAnimationToBatch:transitionState:", v8, v6);
  -[CCUIOverlayStatusBarPresentationProvider _addPageContentTransformAnimationsToBatch:transitionState:](self, "_addPageContentTransformAnimationsToBatch:transitionState:", v8, v6);
  -[CCUIOverlayStatusBarPresentationProvider _addModuleTransformAnimationsToBatch:transitionState:](self, "_addModuleTransformAnimationsToBatch:transitionState:", v8, v6);
  v9 = +[CCUIOverlayTransitionState isSignificantTransitionFrom:to:](CCUIOverlayTransitionState, "isSignificantTransitionFrom:to:", v7, v6);

  if (v9)
  {
    -[CCUIOverlayStatusBarPresentationProvider _addModuleScaleAnimationsToBatch:transitionState:](self, "_addModuleScaleAnimationsToBatch:transitionState:", v8, v6);
    -[CCUIOverlayStatusBarPresentationProvider _addModuleAlphaAnimationsToBatch:transitionState:](self, "_addModuleAlphaAnimationsToBatch:transitionState:", v8, v6);
    -[CCUIOverlayStatusBarPresentationProvider _addAccessoryScaleAnimationsToBatch:transitionState:](self, "_addAccessoryScaleAnimationsToBatch:transitionState:", v8, v6);
    -[CCUIOverlayStatusBarPresentationProvider _addAccessoryAlphaAnimationsToBatch:transitionState:](self, "_addAccessoryAlphaAnimationsToBatch:transitionState:", v8, v6);
  }

  return v8;
}

- (id)prepareForPresentation
{
  CCUIAnimationBatch *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = objc_alloc_init(CCUIAnimationBatch);
  -[CCUIOverlayStatusBarPresentationProvider metricsProvider](self, "metricsProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayStatusBarStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__CCUIOverlayStatusBarPresentationProvider_prepareForPresentation__block_invoke;
    v13[3] = &unk_1E8CFC3D0;
    v13[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v13);
    objc_msgSend((id)objc_opt_class(), "_hiddenStatusBarFadeAnimationParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __66__CCUIOverlayStatusBarPresentationProvider_prepareForPresentation__block_invoke_2;
    v12[3] = &unk_1E8CFC3D0;
    v12[4] = self;
    +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIAnimationBatch addAnimation:](v3, "addAnimation:", v9);

  }
  else
  {
    -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOverlayStatusBarHidden:", 0);

  }
  return v3;
}

void __66__CCUIOverlayStatusBarPresentationProvider_prepareForPresentation__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setOverlayStatusBarHidden:", 1);

}

void __66__CCUIOverlayStatusBarPresentationProvider_prepareForPresentation__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setOverlayStatusBarHidden:", 0);

}

- (id)cleanupForDismissal
{
  CCUIAnimationBatch *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v3 = objc_alloc_init(CCUIAnimationBatch);
  -[CCUIOverlayStatusBarPresentationProvider metricsProvider](self, "metricsProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayStatusBarStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "_hiddenStatusBarFadeAnimationParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__CCUIOverlayStatusBarPresentationProvider_cleanupForDismissal__block_invoke;
    v11[3] = &unk_1E8CFC3D0;
    v11[4] = self;
    +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v7, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIAnimationBatch addAnimation:](v3, "addAnimation:", v8);

  }
  else
  {
    -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOverlayStatusBarHidden:", 1);

  }
  return v3;
}

void __63__CCUIOverlayStatusBarPresentationProvider_cleanupForDismissal__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setOverlayStatusBarHidden:", 1);

}

- (id)transitionBetweenEditing
{
  CCUIAnimationBatch *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  v3 = objc_alloc_init(CCUIAnimationBatch);
  v4 = -[CCUIOverlayStatusBarPresentationProvider _isEditing](self, "_isEditing");
  objc_msgSend((id)objc_opt_class(), "_editingC2AnimationParametersToEditing:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__CCUIOverlayStatusBarPresentationProvider_transitionBetweenEditing__block_invoke;
  v8[3] = &unk_1E8CFC3F8;
  v8[4] = self;
  v9 = v4;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIAnimationBatch addAnimation:](v3, "addAnimation:", v6);

  return v3;
}

void __68__CCUIOverlayStatusBarPresentationProvider_transitionBetweenEditing__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overlayHeaderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 40))
    v4 = 0.0;
  else
    v4 = 1.0;
  objc_msgSend(v2, "setAlpha:", v4);

  objc_msgSend(v8, "editingAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*(_BYTE *)(a1 + 40))
    v7 = 1.0;
  else
    v7 = 0.0;
  objc_msgSend(v5, "setAlpha:", v7);

  objc_msgSend(*(id *)(a1 + 32), "layoutViews");
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
  return 1;
}

- (CGRect)_presentedViewFrame
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
  uint64_t v16;
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
  CGRect result;

  -[CCUIOverlayStatusBarPresentationProvider metricsProvider](self, "metricsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayContainerFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "overlayContentSize");
  BSRectWithSize();
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(v3, "overlayInterfaceOrientation");
  -[CCUIOverlayStatusBarPresentationProvider _edgeInsetsForContentSize:withinBounds:contentEdgeInsets:orientation:](self, "_edgeInsetsForContentSize:withinBounds:contentEdgeInsets:orientation:", v16, v13, v15, v5, v7, v9, v11, *MEMORY[0x1E0DC49E8], *(_QWORD *)(MEMORY[0x1E0DC49E8] + 8), *(_QWORD *)(MEMORY[0x1E0DC49E8] + 16), *(_QWORD *)(MEMORY[0x1E0DC49E8] + 24));
  v18 = v5 + v17;
  v20 = v7 + v19;
  v22 = v9 - (v17 + v21);
  v24 = v11 - (v19 + v23);

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (double)_additionalHeaderOffset
{
  double result;

  -[CCUIOverlayStatusBarPresentationProvider _additionalHeaderOffsetForEditing:](self, "_additionalHeaderOffsetForEditing:", -[CCUIOverlayStatusBarPresentationProvider _isEditing](self, "_isEditing"));
  return result;
}

- (double)_additionalHeaderOffsetForEditing:(BOOL)a3
{
  double result;
  double v5;
  double v6;

  result = 0.0;
  if (a3)
  {
    v5 = -CCUIStatusBarHeight();
    -[CCUIOverlayStatusBarPresentationProvider _additionalHeaderHeight](self, "_additionalHeaderHeight");
    return v5 - v6;
  }
  return result;
}

- (BOOL)_isEditing
{
  void *v2;
  char v3;

  -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

+ (id)_hiddenStatusBarFadeAnimationParameters
{
  if (_hiddenStatusBarFadeAnimationParameters_onceToken != -1)
    dispatch_once(&_hiddenStatusBarFadeAnimationParameters_onceToken, &__block_literal_global_0);
  return (id)_hiddenStatusBarFadeAnimationParameters_parameters;
}

void __83__CCUIOverlayStatusBarPresentationProvider__hiddenStatusBarFadeAnimationParameters__block_invoke()
{
  uint64_t v0;
  void *v1;
  CCUIMutableCABasicAnimationParameters *v2;

  v2 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  -[CCUIMutableCABasicAnimationParameters setDuration:](v2, "setDuration:", 0.35);
  v0 = -[CCUIMutableCABasicAnimationParameters copy](v2, "copy");
  v1 = (void *)_hiddenStatusBarFadeAnimationParameters_parameters;
  _hiddenStatusBarFadeAnimationParameters_parameters = v0;

}

+ (id)_baseC2AnimationParametersForTransitionState:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 IsReduceMotionEnabled;
  uint64_t *v6;
  id v7;

  v3 = a3;
  if (_baseC2AnimationParametersForTransitionState__onceToken != -1)
    dispatch_once(&_baseC2AnimationParametersForTransitionState__onceToken, &__block_literal_global_11);
  if (objc_msgSend(v3, "isInteractive"))
  {
    v4 = (void *)_baseC2AnimationParametersForTransitionState__baseInteractiveParameters;
  }
  else
  {
    objc_msgSend(v3, "clampedPresentationProgress");
    if (BSFloatIsZero())
    {
      v4 = (void *)_baseC2AnimationParametersForTransitionState__baseDismissParameters;
    }
    else
    {
      IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      v6 = &_baseC2AnimationParametersForTransitionState__baseReduceMotionPresentParameters;
      if (!IsReduceMotionEnabled)
        v6 = &_baseC2AnimationParametersForTransitionState__basePresentParameters;
      v4 = (void *)*v6;
    }
  }
  v7 = v4;

  return v7;
}

void __89__CCUIOverlayStatusBarPresentationProvider__baseC2AnimationParametersForTransitionState___block_invoke()
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
  v1 = (void *)_baseC2AnimationParametersForTransitionState__basePresentParameters;
  _baseC2AnimationParametersForTransitionState__basePresentParameters = v0;

  v2 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  -[CCUIMutableC2AnimationParameters setTension:](v2, "setTension:", 250.0);
  -[CCUIMutableC2AnimationParameters setFriction:](v2, "setFriction:", 30.0);
  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v2, "setFrameRateRange:", *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
  -[CCUIMutableC2AnimationParameters setHighFrameRateReason:](v2, "setHighFrameRateReason:", 2031617);
  v3 = -[CCUIMutableC2AnimationParameters copy](v2, "copy");
  v4 = (void *)_baseC2AnimationParametersForTransitionState__baseReduceMotionPresentParameters;
  _baseC2AnimationParametersForTransitionState__baseReduceMotionPresentParameters = v3;

  v5 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  -[CCUIMutableC2AnimationParameters setTension:](v5, "setTension:", 436.1);
  -[CCUIMutableC2AnimationParameters setFriction:](v5, "setFriction:", 41.8);
  v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v5, "setFrameRateRange:", *(double *)&v14.minimum, *(double *)&v14.maximum, *(double *)&v14.preferred);
  -[CCUIMutableC2AnimationParameters setHighFrameRateReason:](v5, "setHighFrameRateReason:", 2031617);
  v6 = -[CCUIMutableC2AnimationParameters copy](v5, "copy");
  v7 = (void *)_baseC2AnimationParametersForTransitionState__baseDismissParameters;
  _baseC2AnimationParametersForTransitionState__baseDismissParameters = v6;

  v8 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  -[CCUIMutableC2AnimationParameters setInteractive:](v8, "setInteractive:", 1);
  -[CCUIMutableC2AnimationParameters setTension:](v8, "setTension:", 1754.61);
  -[CCUIMutableC2AnimationParameters setFriction:](v8, "setFriction:", 72.05);
  v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v8, "setFrameRateRange:", *(double *)&v15.minimum, *(double *)&v15.maximum, *(double *)&v15.preferred);
  -[CCUIMutableC2AnimationParameters setHighFrameRateReason:](v8, "setHighFrameRateReason:", 2031617);
  v9 = -[CCUIMutableC2AnimationParameters copy](v8, "copy");
  v10 = (void *)_baseC2AnimationParametersForTransitionState__baseInteractiveParameters;
  _baseC2AnimationParametersForTransitionState__baseInteractiveParameters = v9;

}

+ (id)_leadingStatusBarCAAnimationParametersForTransitionState:(id)a3
{
  uint64_t v3;
  id v4;
  int IsOne;
  uint64_t *v6;

  v3 = _leadingStatusBarCAAnimationParametersForTransitionState__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_leadingStatusBarCAAnimationParametersForTransitionState__onceToken, &__block_literal_global_13);
  objc_msgSend(v4, "snappedStatusBarPresentationProgress");

  IsOne = BSFloatIsOne();
  v6 = &_leadingStatusBarCAAnimationParametersForTransitionState__presentParameters;
  if (!IsOne)
    v6 = &_leadingStatusBarCAAnimationParametersForTransitionState__dismissParameters;
  return (id)*v6;
}

void __101__CCUIOverlayStatusBarPresentationProvider__leadingStatusBarCAAnimationParametersForTransitionState___block_invoke()
{
  uint64_t v0;
  void *v1;
  CCUIMutableCASpringAnimationParameters *v2;
  uint64_t v3;
  void *v4;
  CCUIMutableCASpringAnimationParameters *v5;

  v5 = objc_alloc_init(CCUIMutableCASpringAnimationParameters);
  -[CCUIMutableCASpringAnimationParameters setMass:](v5, "setMass:", 1.0);
  -[CCUIMutableCASpringAnimationParameters setStiffness:](v5, "setStiffness:", 500.0);
  -[CCUIMutableCASpringAnimationParameters setDamping:](v5, "setDamping:", 50.0);
  v0 = -[CCUIMutableCASpringAnimationParameters copy](v5, "copy");
  v1 = (void *)_leadingStatusBarCAAnimationParametersForTransitionState__presentParameters;
  _leadingStatusBarCAAnimationParametersForTransitionState__presentParameters = v0;

  v2 = objc_alloc_init(CCUIMutableCASpringAnimationParameters);
  -[CCUIMutableCASpringAnimationParameters setMass:](v2, "setMass:", 1.0);
  -[CCUIMutableCASpringAnimationParameters setStiffness:](v2, "setStiffness:", 525.0);
  -[CCUIMutableCASpringAnimationParameters setDamping:](v2, "setDamping:", 50.0);
  v3 = -[CCUIMutableCASpringAnimationParameters copy](v2, "copy");
  v4 = (void *)_leadingStatusBarCAAnimationParametersForTransitionState__dismissParameters;
  _leadingStatusBarCAAnimationParametersForTransitionState__dismissParameters = v3;

}

+ (id)_trailingStatusBarCAAnimationParametersForTransitionState:(id)a3
{
  uint64_t v3;
  id v4;
  int IsOne;
  uint64_t *v6;

  v3 = _trailingStatusBarCAAnimationParametersForTransitionState__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_trailingStatusBarCAAnimationParametersForTransitionState__onceToken, &__block_literal_global_15);
  objc_msgSend(v4, "snappedStatusBarPresentationProgress");

  IsOne = BSFloatIsOne();
  v6 = &_trailingStatusBarCAAnimationParametersForTransitionState__presentParameters;
  if (!IsOne)
    v6 = &_trailingStatusBarCAAnimationParametersForTransitionState__dismissParameters;
  return (id)*v6;
}

void __102__CCUIOverlayStatusBarPresentationProvider__trailingStatusBarCAAnimationParametersForTransitionState___block_invoke()
{
  uint64_t v0;
  void *v1;
  CCUIMutableCASpringAnimationParameters *v2;
  uint64_t v3;
  void *v4;
  CCUIMutableCASpringAnimationParameters *v5;

  v5 = objc_alloc_init(CCUIMutableCASpringAnimationParameters);
  -[CCUIMutableCASpringAnimationParameters setMass:](v5, "setMass:", 1.0);
  -[CCUIMutableCASpringAnimationParameters setStiffness:](v5, "setStiffness:", 150.0);
  -[CCUIMutableCASpringAnimationParameters setDamping:](v5, "setDamping:", 50.0);
  v0 = -[CCUIMutableCASpringAnimationParameters copy](v5, "copy");
  v1 = (void *)_trailingStatusBarCAAnimationParametersForTransitionState__presentParameters;
  _trailingStatusBarCAAnimationParametersForTransitionState__presentParameters = v0;

  v2 = objc_alloc_init(CCUIMutableCASpringAnimationParameters);
  -[CCUIMutableCASpringAnimationParameters setMass:](v2, "setMass:", 1.0);
  -[CCUIMutableCASpringAnimationParameters setStiffness:](v2, "setStiffness:", 525.0);
  -[CCUIMutableCASpringAnimationParameters setDamping:](v2, "setDamping:", 50.0);
  v3 = -[CCUIMutableCASpringAnimationParameters copy](v2, "copy");
  v4 = (void *)_trailingStatusBarCAAnimationParametersForTransitionState__dismissParameters;
  _trailingStatusBarCAAnimationParametersForTransitionState__dismissParameters = v3;

}

+ (id)_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState:(id)a3
{
  uint64_t v3;
  id v4;
  int IsOne;
  uint64_t *v6;

  v3 = _compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__onceToken, &__block_literal_global_16);
  objc_msgSend(v4, "snappedStatusBarPresentationProgress");

  IsOne = BSFloatIsOne();
  v6 = &_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters;
  if (!IsOne)
    v6 = &_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters;
  return (id)*v6;
}

void __114__CCUIOverlayStatusBarPresentationProvider__compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  CCUIMutableCABasicAnimationParameters *v3;
  uint64_t v4;
  void *v5;
  CCUIMutableCABasicAnimationParameters *v6;

  v6 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  -[CCUIMutableCABasicAnimationParameters setDuration:](v6, "setDuration:", 0.1321);
  v0 = *MEMORY[0x1E0CD3048];
  -[CCUIMutableCABasicAnimationParameters setTimingFunction:](v6, "setTimingFunction:", *MEMORY[0x1E0CD3048]);
  v1 = -[CCUIMutableCABasicAnimationParameters copy](v6, "copy");
  v2 = (void *)_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters;
  _compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters = v1;

  v3 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  -[CCUIMutableCABasicAnimationParameters setDuration:](v3, "setDuration:", 0.1321);
  -[CCUIMutableCABasicAnimationParameters setTimingFunction:](v3, "setTimingFunction:", v0);
  v4 = -[CCUIMutableCABasicAnimationParameters copy](v3, "copy");
  v5 = (void *)_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters;
  _compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters = v4;

}

+ (id)_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState:(id)a3
{
  uint64_t v3;
  id v4;
  int IsOne;
  uint64_t *v6;

  v3 = _expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__onceToken, &__block_literal_global_17);
  objc_msgSend(v4, "snappedStatusBarPresentationProgress");

  IsOne = BSFloatIsOne();
  v6 = &_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters;
  if (!IsOne)
    v6 = &_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters;
  return (id)*v6;
}

void __114__CCUIOverlayStatusBarPresentationProvider__expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  CCUIMutableCABasicAnimationParameters *v3;
  uint64_t v4;
  void *v5;
  CCUIMutableCABasicAnimationParameters *v6;

  v6 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  -[CCUIMutableCABasicAnimationParameters setDuration:](v6, "setDuration:", 0.2525);
  v0 = *MEMORY[0x1E0CD3048];
  -[CCUIMutableCABasicAnimationParameters setTimingFunction:](v6, "setTimingFunction:", *MEMORY[0x1E0CD3048]);
  v1 = -[CCUIMutableCABasicAnimationParameters copy](v6, "copy");
  v2 = (void *)_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters;
  _expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters = v1;

  v3 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  -[CCUIMutableCABasicAnimationParameters setDuration:](v3, "setDuration:", 0.0725);
  -[CCUIMutableCABasicAnimationParameters setTimingFunction:](v3, "setTimingFunction:", v0);
  v4 = -[CCUIMutableCABasicAnimationParameters copy](v3, "copy");
  v5 = (void *)_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters;
  _expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters = v4;

}

+ (id)_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState:(id)a3
{
  uint64_t v3;
  id v4;
  int IsOne;
  uint64_t *v6;

  v3 = _expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__onceToken, &__block_literal_global_18);
  objc_msgSend(v4, "snappedStatusBarPresentationProgress");

  IsOne = BSFloatIsOne();
  v6 = &_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters;
  if (!IsOne)
    v6 = &_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters;
  return (id)*v6;
}

void __115__CCUIOverlayStatusBarPresentationProvider__expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  CCUIMutableCABasicAnimationParameters *v3;
  uint64_t v4;
  void *v5;
  CCUIMutableCABasicAnimationParameters *v6;

  v6 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  -[CCUIMutableCABasicAnimationParameters setDuration:](v6, "setDuration:", 0.0925);
  v0 = *MEMORY[0x1E0CD3048];
  -[CCUIMutableCABasicAnimationParameters setTimingFunction:](v6, "setTimingFunction:", *MEMORY[0x1E0CD3048]);
  v1 = -[CCUIMutableCABasicAnimationParameters copy](v6, "copy");
  v2 = (void *)_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters;
  _expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters = v1;

  v3 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  -[CCUIMutableCABasicAnimationParameters setDuration:](v3, "setDuration:", 0.1321);
  -[CCUIMutableCABasicAnimationParameters setTimingFunction:](v3, "setTimingFunction:", v0);
  v4 = -[CCUIMutableCABasicAnimationParameters copy](v3, "copy");
  v5 = (void *)_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters;
  _expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters = v4;

}

+ (id)_reducedMotionStatusBarStateCAAnimationParameters
{
  if (_reducedMotionStatusBarStateCAAnimationParameters_onceToken != -1)
    dispatch_once(&_reducedMotionStatusBarStateCAAnimationParameters_onceToken, &__block_literal_global_19);
  return (id)_reducedMotionStatusBarStateCAAnimationParameters_parameters;
}

void __93__CCUIOverlayStatusBarPresentationProvider__reducedMotionStatusBarStateCAAnimationParameters__block_invoke()
{
  uint64_t v0;
  void *v1;
  CCUIMutableCABasicAnimationParameters *v2;

  v2 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  -[CCUIMutableCABasicAnimationParameters setDuration:](v2, "setDuration:", 0.35);
  v0 = -[CCUIMutableCABasicAnimationParameters copy](v2, "copy");
  v1 = (void *)_reducedMotionStatusBarStateCAAnimationParameters_parameters;
  _reducedMotionStatusBarStateCAAnimationParameters_parameters = v0;

}

+ (id)_moduleC2AnimationParametersForTransitionState:(id)a3 layoutRect:(CCUILayoutRect *)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  BOOL IsReduceMotionEnabled;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a1, "_baseC2AnimationParametersForTransitionState:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "tension");
  v8 = v7;
  v9 = 0.0;
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v11 = 0.0;
  if (!IsReduceMotionEnabled)
    v11 = (double)a4->var0.var1 * -10.0;
  objc_msgSend(v6, "setTension:", v8 + v11);
  objc_msgSend(v6, "friction");
  v13 = v12;
  if (!UIAccessibilityIsReduceMotionEnabled())
    v9 = (double)a4->var0.var1 * 3.0;
  objc_msgSend(v6, "setFriction:", v13 + v9);
  return v6;
}

+ (id)_moduleScaleCAAnimationParametersForTransitionState:(id)a3
{
  id v3;
  CCUIMutableCASpringAnimationParameters *v4;
  uint64_t v5;
  double v6;

  v3 = a3;
  v4 = objc_alloc_init(CCUIMutableCASpringAnimationParameters);
  v5 = objc_msgSend(v3, "type");

  -[CCUIMutableCASpringAnimationParameters setMass:](v4, "setMass:", 1.0);
  v6 = dbl_1CFC011B0[v5 == 1];
  -[CCUIMutableCASpringAnimationParameters setStiffness:](v4, "setStiffness:", dbl_1CFC011A0[v5 == 1]);
  -[CCUIMutableCASpringAnimationParameters setDamping:](v4, "setDamping:", v6);
  return v4;
}

+ (id)_moduleAlphaCAAnimationParametersForTransitionState:(id)a3
{
  id v3;
  CCUIMutableCASpringAnimationParameters *v4;
  uint64_t v5;
  double v6;

  v3 = a3;
  v4 = objc_alloc_init(CCUIMutableCASpringAnimationParameters);
  v5 = objc_msgSend(v3, "type");

  -[CCUIMutableCASpringAnimationParameters setMass:](v4, "setMass:", 1.0);
  v6 = dbl_1CFC011D0[v5 == 1];
  -[CCUIMutableCASpringAnimationParameters setStiffness:](v4, "setStiffness:", dbl_1CFC011C0[v5 == 1]);
  -[CCUIMutableCASpringAnimationParameters setDamping:](v4, "setDamping:", v6);
  return v4;
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
  CCUIOverlayStatusBarPresentationProvider *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseC2AnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __104__CCUIOverlayStatusBarPresentationProvider__addBackgroundViewWeightingAnimationToBatch_transitionState___block_invoke;
  v14 = &unk_1E8CFC540;
  v15 = self;
  v16 = v6;
  v9 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);

}

void __104__CCUIOverlayStatusBarPresentationProvider__addBackgroundViewWeightingAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayBackgroundView");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "clampedPresentationProgress");
  objc_msgSend(v3, "setWeighting:");

}

- (void)_addLeadingStatusBarAlphaAnimationToBatch:(id)a3 transitionState:(id)a4
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
  CCUIOverlayStatusBarPresentationProvider *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseC2AnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __102__CCUIOverlayStatusBarPresentationProvider__addLeadingStatusBarAlphaAnimationToBatch_transitionState___block_invoke;
  v14 = &unk_1E8CFC540;
  v15 = self;
  v16 = v6;
  v9 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);

}

void __102__CCUIOverlayStatusBarPresentationProvider__addLeadingStatusBarAlphaAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayLeadingStatusBar");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_leadingStatusBarAlphaForTransitionState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setAlpha:");

}

- (double)_leadingStatusBarAlphaForTransitionState:(id)a3
{
  double v3;

  objc_msgSend(a3, "clampedPresentationProgress");
  return 1.0 - v3;
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
  CCUIOverlayStatusBarPresentationProvider *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseC2AnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __103__CCUIOverlayStatusBarPresentationProvider__addHeaderContentTransformAnimationToBatch_transitionState___block_invoke;
  v14 = &unk_1E8CFC540;
  v15 = self;
  v16 = v6;
  v9 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);

}

void __103__CCUIOverlayStatusBarPresentationProvider__addHeaderContentTransformAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "_headerViewTransformForTransitionState:", *(_QWORD *)(a1 + 40));
  v10 = v13;
  v11 = v14;
  v12 = v15;
  objc_msgSend(v3, "setContentTransform:", &v10);
  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overlayHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  v8 = *(void **)(a1 + 32);
  if (v8)
    objc_msgSend(v8, "_compactStatusBar:transformForTransitionState:", v7, *(_QWORD *)(a1 + 40));
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  objc_msgSend(v3, "setCompactScaleTransform:", v9);

}

- (CGAffineTransform)_compactStatusBar:(SEL)a3 transformForTransitionState:(id)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  objc_msgSend(a5, "clampedPresentationProgress", a4);
  v8 = v7;
  -[CCUIOverlayStatusBarPresentationProvider _effectiveTransitionHeight](self, "_effectiveTransitionHeight");
  v10 = fmin(v8 * (v9 / (CCUIStatusBarHeight() * 0.75)), 1.0);
  -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "overlayHeaderView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "statusBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "maxCompactScaleFactor");
  v15 = v14;

  return CGAffineTransformMakeScale(retstr, (v15 + -1.0) * v10 + 1.0, (v15 + -1.0) * v10 + 1.0);
}

- (CGAffineTransform)_headerViewTransformForTransitionState:(SEL)a3
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  CGAffineTransform *result;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v6 = a4;
  -[CCUIOverlayStatusBarPresentationProvider metricsProvider](self, "metricsProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "overlayInterfaceOrientation");
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  if ((unint64_t)(v8 - 3) > 1)
  {
    if ((unint64_t)(v8 - 1) < 2)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(v6, "clampedPresentationProgress");
  if (!BSFloatIsZero()
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "userInterfaceIdiom"),
        v9,
        v10))
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    v16 = 24.0;
    if ((v15 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
LABEL_8:
      -[CCUIOverlayStatusBarPresentationProvider _transformForTransitionState:rubberBandingHeight:](self, "_transformForTransitionState:rubberBandingHeight:", v6, v16);
      *(_OWORD *)&retstr->a = v18;
      *(_OWORD *)&retstr->c = v19;
      *(_OWORD *)&retstr->tx = v20;
      goto LABEL_9;
    }
LABEL_7:
    UIAccessibilityIsReduceMotionEnabled();
    v16 = 184.0;
    goto LABEL_8;
  }
  -[CCUIOverlayStatusBarPresentationProvider _effectiveTransitionHeight](self, "_effectiveTransitionHeight");
  v12 = v11;
  v13 = CCUIStatusBarHeight();
  CGAffineTransformMakeTranslation(retstr, 0.0, -(v12 + v13 * 0.5));
LABEL_9:

  return result;
}

- (void)_addStatusBarStateAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  CCUIOverlayStatusBarPresentationProvider *v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_leadingStatusBarCAAnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarStateAnimationToBatch_transitionState___block_invoke;
  v21[3] = &unk_1E8CFC540;
  v21[4] = self;
  v10 = v6;
  v22 = v10;
  +[CCUIAnimation animationWithParameters:delay:animations:](CCUIAnimation, "animationWithParameters:delay:animations:", v8, v21, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v11);

  objc_msgSend((id)objc_opt_class(), "_trailingStatusBarCAAnimationParametersForTransitionState:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  v16 = 3221225472;
  v17 = __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarStateAnimationToBatch_transitionState___block_invoke_2;
  v18 = &unk_1E8CFC540;
  v19 = self;
  v20 = v10;
  v13 = v10;
  +[CCUIAnimation animationWithParameters:delay:animations:](CCUIAnimation, "animationWithParameters:delay:animations:", v12, &v15, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v14, v15, v16, v17, v18, v19);

}

void __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarStateAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "snappedStatusBarPresentationProgress");
  objc_msgSend(v4, "setLeadingState:", BSFloatIsOne());

}

void __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarStateAnimationToBatch_transitionState___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "snappedStatusBarPresentationProgress");
  objc_msgSend(v4, "setTrailingState:", BSFloatIsOne());

}

- (void)_addStatusBarAlphaAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snappedStatusBarPresentationProgress");
  if (BSFloatIsOne())
    v9 = 0.03;
  else
    v9 = 0.05283;
  v10 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarAlphaAnimationToBatch_transitionState___block_invoke;
  v25[3] = &unk_1E8CFC540;
  v25[4] = self;
  v11 = v6;
  v26 = v11;
  +[CCUIAnimation animationWithParameters:delay:animations:](CCUIAnimation, "animationWithParameters:delay:animations:", v8, v25, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v12);

  objc_msgSend((id)objc_opt_class(), "_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "snappedStatusBarPresentationProgress");
  if (BSFloatIsOne())
    v14 = 0.0025;
  else
    v14 = 0.0;
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarAlphaAnimationToBatch_transitionState___block_invoke_2;
  v23[3] = &unk_1E8CFC540;
  v23[4] = self;
  v15 = v11;
  v24 = v15;
  +[CCUIAnimation animationWithParameters:delay:animations:](CCUIAnimation, "animationWithParameters:delay:animations:", v13, v23, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v16);

  objc_msgSend((id)objc_opt_class(), "_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "snappedStatusBarPresentationProgress");
  if (BSFloatIsOne())
    v18 = 0.0;
  else
    v18 = 0.05283;
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarAlphaAnimationToBatch_transitionState___block_invoke_3;
  v21[3] = &unk_1E8CFC540;
  v21[4] = self;
  v22 = v15;
  v19 = v15;
  +[CCUIAnimation animationWithParameters:delay:animations:](CCUIAnimation, "animationWithParameters:delay:animations:", v17, v21, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v20);

}

void __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarAlphaAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "snappedStatusBarPresentationProgress");
  objc_msgSend(v5, "setCompactTrailingAlpha:", 1.0 - v4);

}

void __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarAlphaAnimationToBatch_transitionState___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "snappedStatusBarPresentationProgress");
  objc_msgSend(v4, "setLeadingAlpha:");

}

void __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarAlphaAnimationToBatch_transitionState___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "snappedStatusBarPresentationProgress");
  objc_msgSend(v4, "setExpandedTrailingAlpha:");

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
  CCUIOverlayStatusBarPresentationProvider *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseC2AnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __108__CCUIOverlayStatusBarPresentationProvider__addHeaderSensorStatusViewAlphaAnimationToBatch_transitionState___block_invoke;
  v14 = &unk_1E8CFC540;
  v15 = self;
  v16 = v6;
  v9 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);

}

void __108__CCUIOverlayStatusBarPresentationProvider__addHeaderSensorStatusViewAlphaAnimationToBatch_transitionState___block_invoke(uint64_t a1)
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

- (void)_addReducedMotionStatusBarStateAnimationToBatch:(id)a3 transitionState:(id)a4
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
  CCUIOverlayStatusBarPresentationProvider *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_reducedMotionStatusBarStateCAAnimationParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __108__CCUIOverlayStatusBarPresentationProvider__addReducedMotionStatusBarStateAnimationToBatch_transitionState___block_invoke;
  v14 = &unk_1E8CFC540;
  v15 = self;
  v16 = v6;
  v9 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);

}

void __108__CCUIOverlayStatusBarPresentationProvider__addReducedMotionStatusBarStateAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t IsOne;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBar");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "snappedStatusBarPresentationProgress");
  IsOne = BSFloatIsOne();
  objc_msgSend(v6, "setLeadingState:", IsOne);
  objc_msgSend(v6, "setTrailingState:", IsOne);
  objc_msgSend(*(id *)(a1 + 40), "snappedStatusBarPresentationProgress");
  objc_msgSend(v6, "setCompactTrailingAlpha:", 1.0 - v5);
  objc_msgSend(*(id *)(a1 + 40), "snappedStatusBarPresentationProgress");
  objc_msgSend(v6, "setLeadingAlpha:");
  objc_msgSend(*(id *)(a1 + 40), "snappedStatusBarPresentationProgress");
  objc_msgSend(v6, "setExpandedTrailingAlpha:");

}

- (void)_addPageContentTransformAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a4;
  v7 = a3;
  -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIOverlayStatusBarPresentationProvider metricsProvider](self, "metricsProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_baseC2AnimationParametersForTransitionState:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__CCUIOverlayStatusBarPresentationProvider__addPageContentTransformAnimationsToBatch_transitionState___block_invoke;
  v15[3] = &unk_1E8CFC568;
  v16 = v6;
  v17 = v9;
  v18 = v8;
  v11 = v8;
  v12 = v9;
  v13 = v6;
  +[CCUIAnimation animationWithParameters:animations:](CCUIAnimation, "animationWithParameters:animations:", v10, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v14);

}

uint64_t __102__CCUIOverlayStatusBarPresentationProvider__addPageContentTransformAnimationsToBatch_transitionState___block_invoke(id *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a1[4], "pagingProgress");
  v3 = v2;
  v4 = fmax(fmin((v2 + -0.4) / 0.6, 1.0), 0.0);
  v5 = 1.0 - v4 + v4 * 0.7;
  v6 = fmax(fmin((v3 + -0.33) / 0.67, 1.0), 0.0);
  v7 = 1.0 - v6 + v6 * 0.8;
  objc_msgSend(a1[5], "overlayContentSize");
  v9 = v3 * 0.0 + (1.0 - v3) * (v8 * (1.0 - v7) * -0.5);
  objc_msgSend(a1[6], "setOverlayPageContentAlpha:", v5);
  objc_msgSend(a1[6], "setOverlayPageContentScale:", v7);
  return objc_msgSend(a1[6], "setOverlayPageContentTranslation:", 0.0, v9);
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
  -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__CCUIOverlayStatusBarPresentationProvider__addModuleTransformAnimationsToBatch_transitionState___block_invoke;
  v11[3] = &unk_1E8CFC5B8;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "enumerateOverlayModuleViewsWithBlock:", v11);

}

void __97__CCUIOverlayStatusBarPresentationProvider__addModuleTransformAnimationsToBatch_transitionState___block_invoke(_QWORD *a1, void *a2, _OWORD *a3)
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
  v16[2] = __97__CCUIOverlayStatusBarPresentationProvider__addModuleTransformAnimationsToBatch_transitionState___block_invoke_2;
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

void __97__CCUIOverlayStatusBarPresentationProvider__addModuleTransformAnimationsToBatch_transitionState___block_invoke_2(uint64_t a1)
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
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  CGAffineTransform *result;
  id v12;

  v12 = a4;
  -[CCUIOverlayStatusBarPresentationProvider metricsProvider](self, "metricsProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v7, "overlayInterfaceOrientation") - 1) < 2
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "userInterfaceIdiom"),
        v8,
        v10 = 24.0,
        (v9 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    if (UIAccessibilityIsReduceMotionEnabled())
      v10 = 184.0;
    else
      v10 = ((double)a5->var0.var1 * 0.25 + 1.0) * 184.0;
  }
  -[CCUIOverlayStatusBarPresentationProvider _transformForTransitionState:rubberBandingHeight:](self, "_transformForTransitionState:rubberBandingHeight:", v12, v10);

  return result;
}

- (void)_addModuleScaleAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_moduleScaleCAAnimationParametersForTransitionState:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__CCUIOverlayStatusBarPresentationProvider__addModuleScaleAnimationsToBatch_transitionState___block_invoke;
  v13[3] = &unk_1E8CFC5E0;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = v8;
  v10 = v8;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "enumerateOverlayModuleViewsWithBlock:", v13);

}

void __93__CCUIOverlayStatusBarPresentationProvider__addModuleScaleAnimationsToBatch_transitionState___block_invoke(_QWORD *a1, void *a2, _OWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];

  v5 = a2;
  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = a3[1];
  v23[0] = *a3;
  v23[1] = v8;
  objc_msgSend(v6, "_delayForTransitionState:layoutRect:", v7, v23);
  v10 = v9;
  v11 = (void *)a1[6];
  v12 = a1[7];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__CCUIOverlayStatusBarPresentationProvider__addModuleScaleAnimationsToBatch_transitionState___block_invoke_2;
  v18[3] = &unk_1E8CFC590;
  v13 = (void *)a1[5];
  v18[4] = a1[4];
  v14 = v13;
  v15 = a3[1];
  v21 = *a3;
  v22 = v15;
  v19 = v14;
  v20 = v5;
  v16 = v5;
  +[CCUIAnimation animationWithParameters:delay:animations:](CCUIAnimation, "animationWithParameters:delay:animations:", v12, v18, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:", v17);

}

void __93__CCUIOverlayStatusBarPresentationProvider__addModuleScaleAnimationsToBatch_transitionState___block_invoke_2(uint64_t a1)
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
    objc_msgSend(v2, "_moduleViewScaleTransformForTransitionState:layoutRect:", v3, &v6);
  }
  objc_msgSend(*(id *)(a1 + 48), "caAnimationContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v10;
  v8 = v11;
  objc_msgSend(v5, "setTransform:", &v6);

}

- (CGAffineTransform)_moduleViewScaleTransformForTransitionState:(SEL)a3 layoutRect:(id)a4
{
  uint64_t v6;
  __int128 v7;
  double v8;
  CGAffineTransform *result;
  id v10;

  v10 = a4;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v6 = MEMORY[0x1E0C9BAA8];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  }
  else
  {
    objc_msgSend(v10, "snappedPresentationProgress");
    *(_OWORD *)&retstr->a = 0u;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    CGAffineTransformMakeScale(retstr, v8 + (1.0 - v8) * 0.8, v8 + (1.0 - v8) * 0.8);
  }

  return result;
}

- (void)_addModuleAlphaAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_moduleAlphaCAAnimationParametersForTransitionState:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__CCUIOverlayStatusBarPresentationProvider__addModuleAlphaAnimationsToBatch_transitionState___block_invoke;
  v13[3] = &unk_1E8CFC5E0;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = v8;
  v10 = v8;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "enumerateOverlayModuleViewsWithBlock:", v13);

}

void __93__CCUIOverlayStatusBarPresentationProvider__addModuleAlphaAnimationsToBatch_transitionState___block_invoke(_QWORD *a1, void *a2, _OWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  _OWORD v21[2];

  v5 = a2;
  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = a3[1];
  v21[0] = *a3;
  v21[1] = v8;
  objc_msgSend(v6, "_delayForTransitionState:layoutRect:", v7, v21);
  v10 = v9;
  v12 = (void *)a1[6];
  v11 = a1[7];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __93__CCUIOverlayStatusBarPresentationProvider__addModuleAlphaAnimationsToBatch_transitionState___block_invoke_2;
  v18 = &unk_1E8CFC540;
  v19 = v5;
  v20 = (id)a1[5];
  v13 = v5;
  +[CCUIAnimation animationWithParameters:delay:animations:](CCUIAnimation, "animationWithParameters:delay:animations:", v11, &v15, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAnimation:", v14, v15, v16, v17, v18);

}

void __93__CCUIOverlayStatusBarPresentationProvider__addModuleAlphaAnimationsToBatch_transitionState___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "caAnimationContainerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "snappedPresentationProgress");
  objc_msgSend(v2, "setAlpha:");

}

- (void)_addAccessoryScaleAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _OWORD v19[2];

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_moduleScaleCAAnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "overlayPageControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = xmmword_1CFC01200;
  v19[1] = unk_1CFC01210;
  -[CCUIOverlayStatusBarPresentationProvider _delayForTransitionState:layoutRect:](self, "_delayForTransitionState:layoutRect:", v6, v19);
  v12 = v11;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__CCUIOverlayStatusBarPresentationProvider__addAccessoryScaleAnimationsToBatch_transitionState___block_invoke;
  v16[3] = &unk_1E8CFC568;
  v16[4] = self;
  v17 = v6;
  v18 = v10;
  v13 = v10;
  v14 = v6;
  +[CCUIAnimation animationWithParameters:delay:animations:](CCUIAnimation, "animationWithParameters:delay:animations:", v8, v16, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v15);

}

uint64_t __96__CCUIOverlayStatusBarPresentationProvider__addAccessoryScaleAnimationsToBatch_transitionState___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = a1[5];
    v6 = xmmword_1CFC011E0;
    v7 = xmmword_1CFC011F0;
    objc_msgSend(v2, "_moduleViewScaleTransformForTransitionState:layoutRect:", v3, &v6);
  }
  v4 = (void *)a1[6];
  v6 = v9;
  v7 = v10;
  v8 = v11;
  return objc_msgSend(v4, "setTransform:", &v6);
}

- (void)_addAccessoryAlphaAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  _OWORD v22[2];

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_moduleAlphaCAAnimationParametersForTransitionState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "overlayPageControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = xmmword_1CFC01200;
  v22[1] = unk_1CFC01210;
  -[CCUIOverlayStatusBarPresentationProvider _delayForTransitionState:layoutRect:](self, "_delayForTransitionState:layoutRect:", v6, v22);
  v12 = v11;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __96__CCUIOverlayStatusBarPresentationProvider__addAccessoryAlphaAnimationsToBatch_transitionState___block_invoke;
  v19 = &unk_1E8CFC540;
  v20 = v10;
  v21 = v6;
  v13 = v6;
  v14 = v10;
  +[CCUIAnimation animationWithParameters:delay:animations:](CCUIAnimation, "animationWithParameters:delay:animations:", v8, &v16, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:", v15, v16, v17, v18, v19);

}

uint64_t __96__CCUIOverlayStatusBarPresentationProvider__addAccessoryAlphaAnimationsToBatch_transitionState___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "snappedPresentationProgress");
  return objc_msgSend(v1, "setAlpha:");
}

- (CGAffineTransform)_transformForTransitionState:(SEL)a3 rubberBandingHeight:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGAffineTransform *result;
  id v18;
  CGRect v19;

  v7 = a4;
  -[CCUIOverlayStatusBarPresentationProvider metricsProvider](self, "metricsProvider");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v18, "overlayInterfaceOrientation") - 3) > 1
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "userInterfaceIdiom"),
        v8,
        v9))
  {
    -[CCUIOverlayStatusBarPresentationProvider _effectiveTransitionHeight](self, "_effectiveTransitionHeight");
    -[CCUIOverlayStatusBarPresentationProvider viewProvider](self, "viewProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "overlayHeaderView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "verticalSecondaryServiceDelta");

  }
  else
  {
    -[CCUIOverlayStatusBarPresentationProvider _presentedViewFrame](self, "_presentedViewFrame");
    CGRectGetMinY(v19);
  }
  objc_msgSend(v7, "clampedPresentationProgress");
  objc_msgSend(v7, "nonZeroPresentationProgress");
  objc_msgSend(v7, "clampedPresentationProgress");
  BSUIConstrainValueWithRubberBand();
  UIRoundToScale();
  v14 = v13;
  objc_msgSend(v7, "pagingProgress");
  v16 = v15;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeTranslation(retstr, 0.0, v16 * 0.0 + (1.0 - v16) * v14);

  return result;
}

- (double)_delayForTransitionState:(id)a3 layoutRect:(CCUILayoutRect *)a4
{
  uint64_t v5;
  BOOL IsReduceMotionEnabled;
  double result;

  v5 = objc_msgSend(a3, "type");
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  result = 0.0;
  if (v5 == 2)
  {
    if (!IsReduceMotionEnabled)
      return (double)a4->var0.var0 * 0.016 + (double)a4->var0.var1 * 0.016;
  }
  else if (!IsReduceMotionEnabled)
  {
    return (double)a4->var0.var1 * 0.016;
  }
  return result;
}

- (void)setViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_viewProvider, a3);
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
