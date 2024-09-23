@implementation SSSScreenshotsView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  void *v26;
  void *v27;
  double v28;
  double v29;
  UIView *topBarSeparatorLine;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  UIView *bottomBarSeparatorLine;
  uint64_t v40;
  _BOOL8 v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  char v46;
  uint64_t v47;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *i;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double x;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  unsigned int v68;
  double v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  BOOL v82;
  BOOL v83;
  void *v84;
  unsigned int v85;
  unsigned int v86;
  double v87;
  double v88;
  void *v89;
  unsigned __int8 v90;
  _BOOL8 v91;
  double v92;
  double v93;
  double v94;
  double v95;
  SSSScrollView *scrollView;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  double v108;
  NSMutableArray *v109;
  id v110;
  id v111;
  uint64_t v112;
  void *j;
  void *v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  double MaxY;
  double v120;
  double Center;
  double v122;
  void *v123;
  id v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  SSSShadowView *shadowView;
  void *v138;
  double MinY;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  NSMutableArray *obj;
  uint64_t v148;
  double v149;
  void *v150;
  unint64_t v151;
  void *v152;
  id rect;
  CGFloat recta;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _QWORD v163[5];
  _BYTE v164[128];
  _BYTE v165[128];
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;

  -[SSSScreenshotsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = -[SSSScreenshotsView state](self, "state");
  -[SSSScreenshotsView _layoutBounds](self, "_layoutBounds");
  v11 = v10;
  v13 = v12;
  if (v4 == CGSizeZero.width && v6 == CGSizeZero.height)
    return;
  v15 = v8;
  v16 = v9;
  if (v7 == 1 && !self->_hasPerformedFullscreenSetup)
  {
    self->_hasPerformedFullscreenSetup = 1;
    v163[0] = _NSConcreteStackBlock;
    v163[1] = 3221225472;
    v163[2] = sub_100038B48;
    v163[3] = &unk_100091920;
    v163[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v163);
  }
  -[SSSScreenshotsView _setupPaletteIfNecessary](self, "_setupPaletteIfNecessary");
  -[SSSScreenshotsView safeAreaInsets](self, "safeAreaInsets");
  v18 = v17;
  -[SSSScreenshotsView bounds](self, "bounds");
  v20 = v19;
  v21 = 0.0;
  v23 = v22 + 0.0;
  v25 = v18 + v24;
  if (-[SSSScreenshotsView _contentSwitcherShouldMoveDown](self, "_contentSwitcherShouldMoveDown"))
  {
    if ((id)-[SSSScreenshotsView editMode](self, "editMode") == (id)2)
      v21 = 0.0;
    else
      v21 = 38.0;
  }
  v151 = v7;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar topItem](self->_topBar, "topItem"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_bottomPalette"));
  objc_msgSend(v27, "setPreferredHeight:", v21);

  -[UINavigationBar intrinsicContentSize](self->_topBar, "intrinsicContentSize");
  v29 = v28;
  -[UINavigationBar sss_setFrameUnanimatingLayingOut:](self->_topBar, "sss_setFrameUnanimatingLayingOut:", v23, v25, v20, v28);
  -[UINavigationBar setBarTintColor:](self->_topBar, "setBarTintColor:", 0);
  -[UINavigationBar setOpaque:](self->_topBar, "setOpaque:", 0);
  -[UINavigationBar setTranslucent:](self->_topBar, "setTranslucent:", 1);
  -[UINavigationBar setBackgroundImage:forBarMetrics:](self->_topBar, "setBackgroundImage:forBarMetrics:", self->_topBarEmptyBackgroundImage, 0);
  -[UINavigationBar bringSubviewToFront:](self->_topBar, "bringSubviewToFront:", self->_topBarSeparatorLine);
  +[SSChromeHelper barSeparatorSize](SSChromeHelper, "barSeparatorSize");
  topBarSeparatorLine = self->_topBarSeparatorLine;
  v32 = v29 - v31;
  -[SSSScreenshotsView bounds](self, "bounds");
  -[UIView sss_setFrameUnanimatingLayingOut:](topBarSeparatorLine, "sss_setFrameUnanimatingLayingOut:", 0.0, v32);
  -[SSSScreenshotsView bounds](self, "bounds");
  v34 = v33;
  v36 = v35;
  -[SSSScreenshotsView _bottomBarHeightIncludingSafeAreaInsets](self, "_bottomBarHeightIncludingSafeAreaInsets");
  v38 = v37;
  -[SSSScreenshotsView bounds](self, "bounds");
  -[UIVisualEffectView sss_setFrameUnanimatingLayingOut:](self->_bottomBar, "sss_setFrameUnanimatingLayingOut:", v34, CGRectGetMaxY(v166) - v38, v36, v38);
  bottomBarSeparatorLine = self->_bottomBarSeparatorLine;
  -[UIVisualEffectView bounds](self->_bottomBar, "bounds");
  -[UIView sss_setFrameUnanimatingLayingOut:](bottomBarSeparatorLine, "sss_setFrameUnanimatingLayingOut:", 0.0, 0.0);
  -[SSSScreenshotCountIndicator setCount:](self->_countIndicator, "setCount:", -[SSSScreenshotsView _numberOfPages](self, "_numberOfPages"));
  -[SSSScrollView setFrame:](self->_scrollView, "setFrame:", v11, v13, v15, v16);
  v40 = -[SSSScreenshotsView numberOfScreenshotImages](self, "numberOfScreenshotImages");
  v41 = 0;
  if (v40 >= 2)
    v41 = !-[SSSScreenshotsView _shouldAvoidKeyboard](self, "_shouldAvoidKeyboard", 0)
       && (id)-[SSSScreenshotsView editMode](self, "editMode") != (id)2;
  v143 = v16;
  v144 = v13;
  v145 = v11;
  v146 = v15;
  -[SSSScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer"));
  objc_msgSend(v42, "setAllowedTouchTypes:", &off_100095E68);

  rect = -[NSMutableArray count](self->_screenshotViews, "count");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_screenshotViews, "firstObject"));
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  obj = self->_screenshotViews;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v159, v165, 16);
  v150 = v43;
  if (v44)
  {
    v45 = v44;
    v46 = 0;
    v47 = 0;
    v148 = *(_QWORD *)v160;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
    do
    {
      for (i = 0; i != v45; i = (char *)i + 1)
      {
        if (*(_QWORD *)v160 != v148)
          objc_enumerationMutation(obj);
        v52 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * (_QWORD)i);
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "screenshot"));
        -[SSSScreenshotsView _screenshotMaximumSize](self, "_screenshotMaximumSize");
        v55 = v54;
        v57 = v56;
        -[SSSScreenshotsView _interScreenshotSpacing](self, "_interScreenshotSpacing");
        v59 = v58;
        x = CGRectNull.origin.x;
        v61 = y;
        v62 = width;
        v63 = height;
        if (v52 == v43)
        {
          objc_msgSend(v43, "rectToCenterAboveKeyboard");
          x = v64;
          v61 = v65;
          v62 = v66;
          v63 = v67;
        }
        -[SSSScreenshotsView _frameForScreenshot:atIndex:numberOfScreenshots:maximumSize:interScreenshotSpacing:rectToCenterAboveKeyboard:state:](self, "_frameForScreenshot:atIndex:numberOfScreenshots:maximumSize:interScreenshotSpacing:rectToCenterAboveKeyboard:state:", v53, (char *)i + v47, rect, v151, v55, v57, v59, x, v61, v62, v63);
        objc_msgSend(v52, "setFrame:");
        -[SSSScreenshotsView _layoutScreenshotView:forState:isFirstScreenshot:isCurrentScreenshot:](self, "_layoutScreenshotView:forState:isFirstScreenshot:isCurrentScreenshot:", v52, v151, v52 == v152, v52 == v43);
        v68 = -[SSSScreenshotsView _shouldShowScreenshotViewAtIndex:](self, "_shouldShowScreenshotViewAtIndex:", (char *)i + v47);
        v69 = 0.0;
        if (v68)
          v69 = 1.0;
        objc_msgSend(v52, "setAlpha:", v69);
        objc_msgSend(v52, "bounds");
        -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", v52);
        v71 = v70;
        v73 = v72;
        v75 = v74;
        v77 = v76;
        -[UINavigationBar frame](self->_topBar, "frame");
        v179.origin.x = v78;
        v179.origin.y = v79;
        v179.size.width = v80;
        v179.size.height = v81;
        v167.origin.x = v71;
        v167.origin.y = v73;
        v167.size.width = v75;
        v167.size.height = v77;
        v82 = CGRectIntersectsRect(v167, v179);
        v43 = v150;
        v83 = v151 == 1 && v82;
        v46 |= v83;

      }
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v159, v165, 16);
      v47 += (uint64_t)i;
    }
    while (v45);
  }
  else
  {
    v46 = 0;
  }

  if (v151 == 1)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView visibleScreenshots](self, "visibleScreenshots"));
    if (objc_msgSend(v84, "count"))
      v85 = !-[SSSScreenshotsView _shouldAvoidKeyboard](self, "_shouldAvoidKeyboard");
    else
      v85 = 0;

    if ((v46 & 1) != 0)
      goto LABEL_39;
  }
  else
  {
    v85 = 0;
    if ((v46 & 1) != 0)
    {
LABEL_39:
      v86 = -[SSSScreenshotsView _shouldBleedToBottom](self, "_shouldBleedToBottom");
      goto LABEL_40;
    }
  }
  v86 = 1;
LABEL_40:
  v87 = 0.0;
  if ((v85 & v86) != 0)
    v88 = 1.0;
  else
    v88 = 0.0;
  -[UINavigationBar setAlpha:](self->_topBar, "setAlpha:", v88);
  if (v151 == 1)
  {
    if (-[SSSScreenshotsView _shouldShowBottomBar](self, "_shouldShowBottomBar"))
      v87 = 1.0;
    else
      v87 = 0.0;
  }
  -[UIVisualEffectView setAlpha:](self->_bottomBar, "setAlpha:", v87);
  v91 = v85
     && (id)-[SSSScreenshotsView editMode](self, "editMode") != (id)2
     && !-[SSSScreenshotsView isSharing](self, "isSharing")
     && (v89 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate")),
         v90 = objc_msgSend(v89, "isShowingModalUI"),
         v89,
         (v90 & 1) == 0)
     && -[SSSScreenshotsView interactionMode](self, "interactionMode") == 0;
  -[SSSScreenshotsView _updatePaletteVisibilityIfNecessary:](self, "_updatePaletteVisibilityIfNecessary:", v91);
  -[SSSScrollView contentSize](self->_scrollView, "contentSize");
  v93 = v92;
  v95 = v94;
  scrollView = self->_scrollView;
  -[SSSScreenshotsView _scrollContentInsets](self, "_scrollContentInsets");
  -[SSSScrollView setContentInset:](scrollView, "setContentInset:");
  -[SSSScreenshotsView _scrollContentSize](self, "_scrollContentSize");
  v98 = v97;
  -[SSSScrollView bounds](self->_scrollView, "bounds");
  v100 = v99;
  -[SSSScrollView setContentSize:](self->_scrollView, "setContentSize:", v98, v99);
  if (v93 != v98 || v95 != v100)
    -[SSSScreenshotsView _updateScrollPositionForCurrentPage](self, "_updateScrollPositionForCurrentPage");
  -[SSSScreenshotsView _updateDisplayedPage](self, "_updateDisplayedPage");
  -[SSSScreenshotCountIndicator intrinsicContentSize](self->_countIndicator, "intrinsicContentSize");
  v149 = v101;
  objc_msgSend(v152, "bounds");
  -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", v152);
  v103 = v102;
  v105 = v104;
  v107 = v106;
  recta = v108;
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  v109 = self->_screenshotViews;
  v110 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v109, "countByEnumeratingWithState:objects:count:", &v155, v164, 16);
  if (v110)
  {
    v111 = v110;
    v112 = *(_QWORD *)v156;
    do
    {
      for (j = 0; j != v111; j = (char *)j + 1)
      {
        if (*(_QWORD *)v156 != v112)
          objc_enumerationMutation(v109);
        v114 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v114, "bounds");
        -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", v114);
        v115 = v168.origin.x;
        v116 = v168.origin.y;
        v117 = v168.size.width;
        v118 = v168.size.height;
        MaxY = CGRectGetMaxY(v168);
        v169.origin.x = v103;
        v169.origin.y = v105;
        v169.size.width = v107;
        v169.size.height = recta;
        if (MaxY > CGRectGetMaxY(v169))
        {
          recta = v118;
          v107 = v117;
          v105 = v116;
          v103 = v115;
        }
      }
      v111 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v109, "countByEnumeratingWithState:objects:count:", &v155, v164, 16);
    }
    while (v111);
  }
  v120 = CGRectZero.origin.y;

  Center = UIRectGetCenter(v145, v144, v146, v143);
  v170.origin.x = v103;
  v170.origin.y = v105;
  v170.size.width = v107;
  v170.size.height = recta;
  v122 = CGRectGetMaxY(v170);
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  v124 = objc_msgSend(v123, "userInterfaceIdiom");

  if (v124 == (id)1)
  {
    -[SSSScreenshotsView bounds](self, "bounds");
    v125 = CGRectGetMaxY(v171);
    -[UIVisualEffectView bounds](self->_bottomBar, "bounds");
    v122 = v125 - v126;
    -[UIVisualEffectView bounds](self->_bottomBar, "bounds");
    v128 = v127;
    -[SSSScreenshotsView safeAreaInsets](self, "safeAreaInsets");
    v130 = v128 - v129;
  }
  else if (-[SSSScreenshotsView _shouldExtendBottomBarForPageDots](self, "_shouldExtendBottomBarForPageDots"))
  {
    -[SSSScreenshotsView bounds](self, "bounds");
    v131 = CGRectGetMaxY(v172);
    -[UIVisualEffectView bounds](self->_bottomBar, "bounds");
    v122 = v131 - v132;
    -[UIVisualEffectView bounds](self->_bottomBar, "bounds");
    v134 = v133;
    -[SSSScreenshotsView _effectiveBottomBarExtent](self, "_effectiveBottomBarExtent");
    v130 = v134 - v135;
  }
  else
  {
    -[SSSScreenshotsView _effectiveBottomBarExtent](self, "_effectiveBottomBarExtent");
    v130 = CGRectGetMinY(v173) - v122;
  }
  UIRectCenteredAboutPoint(CGRectZero.origin.x, v120, v146, v149, Center, v122 + v130 * 0.5);
  -[SSSScreenshotCountIndicator sss_setFrameUnanimating:](self->_countIndicator, "sss_setFrameUnanimating:");
  -[SSSScreenshotCountIndicator setCount:](self->_countIndicator, "setCount:", -[SSSScreenshotsView _numberOfPages](self, "_numberOfPages"));
  if (v151)
    v136 = 1.0;
  else
    v136 = 0.0;
  if (-[SSSScreenshotsView _numberOfPages](self, "_numberOfPages") < 2
    || -[SSSScreenshotsView _shouldAvoidKeyboard](self, "_shouldAvoidKeyboard")
    || (id)-[SSSScreenshotsView editMode](self, "editMode") == (id)2)
  {
    v136 = 0.0;
  }
  -[SSSScreenshotCountIndicator setAlpha:](self->_countIndicator, "setAlpha:", v136);
  -[SSSScreenshotsView _updateShadowViewAlpha](self, "_updateShadowViewAlpha");
  shadowView = self->_shadowView;
  -[SSSScreenshotsView bounds](self, "bounds");
  -[SSSShadowView setFrame:](shadowView, "setFrame:");
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _rectsForShadowView](self, "_rectsForShadowView"));
  -[SSSShadowView setRectsForShadow:](self->_shadowView, "setRectsForShadow:", v138);
  if (-[SSSScreenshotsView _shouldShowBottomBar](self, "_shouldShowBottomBar"))
  {
    -[UIVisualEffectView frame](self->_bottomBar, "frame");
    MinY = CGRectGetMinY(v174);
  }
  else
  {
    -[SSSScreenshotsView bounds](self, "bounds");
    MinY = CGRectGetHeight(v175);
  }
  v140 = MinY;
  -[UINavigationBar frame](self->_topBar, "frame");
  v141 = v140 - CGRectGetMaxY(v176);
  -[UINavigationBar frame](self->_topBar, "frame");
  v142 = CGRectGetMaxY(v177);
  -[SSSScreenshotsView bounds](self, "bounds");
  -[UIView setFrame:](self->_rulerHostingView, "setFrame:", 0.0, v142, CGRectGetWidth(v178), v141);
  -[SSSScreenshotsView _layoutThumbnailView](self, "_layoutThumbnailView");
  -[SSSScreenshotsView setActiveScreenshotView:](self, "setActiveScreenshotView:", v150);

}

- (void)_setupPaletteIfNecessary
{
  AKToolbarView *toolPalette;
  void *v4;
  objc_class *v5;
  AKToolbarView *v6;
  AKToolbarView *v7;
  AKToolbarView *v8;
  void *v9;
  void *v10;
  id v11;
  AKToolbarView *v12;
  AKToolbarView *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (!_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages")
    || (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs") & 1) == 0)
  {
    toolPalette = self->_toolPalette;
    if (!toolPalette)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2050000000;
      v4 = (void *)qword_1000AD7F8;
      v19 = qword_1000AD7F8;
      if (!qword_1000AD7F8)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10003F8D4;
        v15[3] = &unk_100091848;
        v15[4] = &v16;
        sub_10003F8D4((uint64_t)v15);
        v4 = (void *)v17[3];
      }
      v5 = objc_retainAutorelease(v4);
      _Block_object_dispose(&v16, 8);
      v6 = (AKToolbarView *)objc_alloc_init(v5);
      v7 = self->_toolPalette;
      self->_toolPalette = v6;

      -[AKToolbarView setOpaque:](self->_toolPalette, "setOpaque:", 0);
      v8 = self->_toolPalette;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[AKToolbarView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[AKToolbarView setWantsClearBackgroundColorInCompactSize:](self->_toolPalette, "setWantsClearBackgroundColorInCompactSize:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
      v11 = objc_msgSend(v10, "userInterfaceIdiom");

      toolPalette = self->_toolPalette;
      if (!v11)
      {
        -[AKToolbarView setSupportsOpacityEditing:](toolPalette, "setSupportsOpacityEditing:", 1);
        -[AKToolbarView setOpacityEditingDelegate:](self->_toolPalette, "setOpacityEditingDelegate:", self);
        toolPalette = self->_toolPalette;
      }
    }
    v12 = toolPalette;
    -[SSSScreenshotsView bounds](self, "bounds");
    -[AKToolbarView sss_setFrameUnanimatingLayingOut:](v12, "sss_setFrameUnanimatingLayingOut:");
    -[AKToolbarView setUndoRedoButtonsHidden:](self->_toolPalette, "setUndoRedoButtonsHidden:", 1);
    -[AKToolbarView setShareButtonHidden:](self->_toolPalette, "setShareButtonHidden:", 1);
    v13 = self->_toolPalette;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView shareItemTarget](self, "shareItemTarget"));
    -[AKToolbarView setShareButtonTarget:](v13, "setShareButtonTarget:", v14);

    -[AKToolbarView setShareButtonAction:](self->_toolPalette, "setShareButtonAction:", -[SSSScreenshotsView shareItemAction](self, "shareItemAction"));
    -[AKToolbarView setAccessibilityIdentifier:](self->_toolPalette, "setAccessibilityIdentifier:", CFSTR("annotation-bottom-bar"));

  }
}

- (void)setInteractionMode:(unint64_t)a3
{
  NSMutableArray *screenshotViews;
  void *v6;
  UIView *v7;
  UIView *visualSearchCornerView;
  UIView *v9;
  _QWORD v10[5];

  self->_interactionMode = a3;
  screenshotViews = self->_screenshotViews;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000398A0;
  v10[3] = &unk_100092868;
  v10[4] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](screenshotViews, "enumerateObjectsUsingBlock:", v10);
  -[UIButton setSelected:](self->_visualSearchButton, "setSelected:", a3 == 2);
  -[UIButton setHidden:](self->_visualSearchButton, "setHidden:", self->_interactionMode == 3);
  -[SSSScreenshotsView _updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:](self, "_updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:", 1);
  if (self->_interactionMode)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
    objc_msgSend(v6, "deselectAllAnnotations");

    -[AKToolbarView endAnnotationEditing](self->_toolPalette, "endAnnotationEditing");
  }
  if (a3 == 2)
  {
    v7 = (UIView *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView _visualSearchCornerViewIfExists](self->_activeScreenshotView, "_visualSearchCornerViewIfExists"));
    visualSearchCornerView = self->_visualSearchCornerView;
    self->_visualSearchCornerView = v7;

    -[SSSScreenshotsView addSubview:](self, "addSubview:", self->_visualSearchCornerView);
    -[SSSScreenshotsView _updateVisualSearchCornerViewPositioning](self, "_updateVisualSearchCornerViewPositioning");
  }
  else
  {
    v9 = self->_visualSearchCornerView;
    if (v9)
      -[UIView removeFromSuperview](v9, "removeFromSuperview");
  }
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateVisualSearchCornerViewPositioning
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
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MaxX;
  double v21;
  double v22;
  double MaxY;
  double v24;
  double v25;
  UIView *visualSearchCornerView;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;

  -[SSSScreenshotView cropOverlayViewRectInWindow](self->_activeScreenshotView, "cropOverlayViewRectInWindow");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView window](self, "window"));
  -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v29.origin.x = v13;
  v29.origin.y = v15;
  v29.size.width = v17;
  v29.size.height = v19;
  MaxX = CGRectGetMaxX(v29);
  -[UIView bounds](self->_visualSearchCornerView, "bounds");
  v22 = MaxX - v21 + -18.0;
  v30.origin.x = v13;
  v30.origin.y = v15;
  v30.size.width = v17;
  v30.size.height = v19;
  MaxY = CGRectGetMaxY(v30);
  -[UIView bounds](self->_visualSearchCornerView, "bounds");
  v25 = MaxY - v24 + -18.0;
  visualSearchCornerView = self->_visualSearchCornerView;
  -[UIView bounds](visualSearchCornerView, "bounds");
  v28 = v27;
  -[UIView bounds](self->_visualSearchCornerView, "bounds");
  -[UIView setFrame:](visualSearchCornerView, "setFrame:", v22, v25, v28);
}

- (void)_updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  double v30;
  _QWORD v31[4];
  id v32[2];
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView activeScreenshotView](self, "activeScreenshotView"));
  v6 = (unint64_t)objc_msgSend(v5, "editMode");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  v8 = (unint64_t)objc_msgSend(v7, "userInterfaceIdiom");

  if (v8)
    v9 = v6 == 0;
  else
    v9 = 0;
  v10 = v9;
  if (!(v8 | v6))
    v10 = -[SSSScreenshotsView interactionMode](self, "interactionMode") != 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView activeScreenshotView](self, "activeScreenshotView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentImageAnalysis"));

  if (v12 && objc_msgSend(v12, "hasResultsForAnalysisTypes:", 16))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView activeScreenshotView](self, "activeScreenshotView"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vsGlyph"));
    v15 = (void *)v14;
    v16 = CFSTR("info.circle.and.sparkles");
    if (v14)
      v16 = (__CFString *)v14;
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView activeScreenshotView](self, "activeScreenshotView"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "vsGlyphFilled"));
    v20 = (void *)v19;
    v21 = CFSTR("info.circle.and.sparkles.fill");
    if (v19)
      v21 = (__CFString *)v19;
    v22 = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v17, v23));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v22, v25));

    -[UIButton setImage:forState:](self->_visualSearchButton, "setImage:forState:", v24, 0);
    -[UIButton setImage:forState:](self->_visualSearchButton, "setImage:forState:", v26, 4);

    v27 = 1;
  }
  else
  {
    v27 = 0;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate"));
  v29 = v10 & v27;
  objc_msgSend(v28, "updateAnalysisButtonStateToVisible:", v29);

  if ((_DWORD)v29)
    v30 = 1.0;
  else
    v30 = 0.0;
  if (v3)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100039CF4;
    v31[3] = &unk_100092890;
    objc_copyWeak(v32, &location);
    v32[1] = *(id *)&v30;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v31, 0.25);
    objc_destroyWeak(v32);
  }
  else
  {
    -[UIButton setAlpha:](self->_visualSearchButton, "setAlpha:", v30);
    -[SSSScreenshotsView _updateInstructionLabelIfNecessaryAnimated:](self, "_updateInstructionLabelIfNecessaryAnimated:", 0);
  }

  objc_destroyWeak(&location);
}

- (void)_removeHighlightedModeForScreenshotViewIfNecessary:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "interactionMode") == (id)3)
    objc_msgSend(v3, "setInteractionMode:", 1);

}

- (void)_updateInstructionLabelIfNecessaryAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  double v11;
  void *v12;
  unsigned __int8 v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentImageAnalysis"));
  v6 = objc_msgSend(v5, "countOfDataDetectorsWithTypes:", -1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (v6)
  {
    v9 = CFSTR("CROP_AND_SCALE_OR_SELECT_TEXT_LABEL");
    v10 = CFSTR("Crop and scale or select text");
  }
  else
  {
    v9 = CFSTR("CROP_AND_SCALE_LABEL");
    v10 = CFSTR("Crop and scale");
  }
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, v10, 0));

  v11 = 0.0;
  if (self->_interactionMode == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_instructionLabel, "text"));
    v13 = objc_msgSend(v12, "isEqualToString:", v14);

    v11 = 1.0;
    if ((v13 & 1) == 0)
    {
      -[UILabel setAlpha:](self->_instructionLabel, "setAlpha:", 0.0);
      -[UILabel setText:](self->_instructionLabel, "setText:", v14);
    }
  }
  -[UILabel setAlpha:](self->_instructionLabel, "setAlpha:", v11);

}

- (void)_updateFirstResponderForHidingToolPicker
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllerForPresentationsFromScreenshotsView:", self));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView window](self, "window"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstResponder"));

  if (v5 != v8)
  {
    objc_opt_class(UITextView, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
      objc_msgSend(v8, "becomeFirstResponder");
  }

}

- (void)_updatePaletteVisibilityIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages")
    && !-[SSSScreenshotsView editMode](self, "editMode")
    || _os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs")
    && (id)-[SSSScreenshotsView editMode](self, "editMode") == (id)1)
  {
    if (v3)
    {
      objc_msgSend(v9, "updatePaletteVisibilityIfNecessary:", objc_msgSend(v9, "isBeingRemoved") ^ 1);
    }
    else
    {
      objc_msgSend(v9, "updatePaletteVisibilityIfNecessary:", 0);
      -[SSSScreenshotsView _updateFirstResponderForHidingToolPicker](self, "_updateFirstResponderForHidingToolPicker");
    }
  }
  else if (self->_toolPalette && self->_isShowingToolPalette != v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllerForPresentationsFromScreenshotsView:", self));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView window](self, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstResponder"));

    if (!v8 || v8 != v6 && !-[SSSScreenshotsView _shouldAvoidKeyboard](self, "_shouldAvoidKeyboard"))
      objc_msgSend(v6, "becomeFirstResponder");
    if (-[AKToolbarView setToolPickerVisible:forFirstResponder:](self->_toolPalette, "setToolPickerVisible:forFirstResponder:", v3, v6))self->_isShowingToolPalette = v3;

  }
}

- (void)updateForFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SSSScreenshotsView setFrame:](self, "setFrame:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_screenshotViews;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "updateForFrame:", x, y, width, height, (_QWORD)v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)_shouldShowBottomBar
{
  void *v3;
  id v4;
  int64_t v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = -[SSSScreenshotsView editMode](self, "editMode");
  if (v4)
    v6 = 1;
  else
    v6 = v5 == 2;
  return !v6;
}

- (BOOL)_shouldExtendBottomBarForPageDots
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[SSSScreenshotsView _anyScreenshotPDFViewNeedsBleedToBottom](self, "_anyScreenshotPDFViewNeedsBleedToBottom"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView visibleScreenshots](self, "visibleScreenshots"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v5 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
    v5 = objc_msgSend(v4, "userInterfaceIdiom") == 0;

  }
  return v5;
}

- (double)_toolPickerHeightOnPhone
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView window](self, "window"));
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3 + 75.0;

  return v4;
}

- (double)_bottomBarHeightIncludingSafeAreaInsets
{
  int64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
  double result;

  if (-[SSSScreenshotsView _shouldShowBottomBar](self, "_shouldShowBottomBar"))
  {
    v3 = -[SSSScreenshotsView editMode](self, "editMode");
    v4 = -[SSSScreenshotsView interactionMode](self, "interactionMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v6 = (unint64_t)objc_msgSend(v5, "userInterfaceIdiom");

    -[SSSScreenshotsView safeAreaInsets](self, "safeAreaInsets");
    v8 = v7;
    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v8 = v7 + 40.0;
    }
    else if (!v3 || !v4)
    {
      -[SSSScreenshotsView _toolPickerHeightOnPhone](self, "_toolPickerHeightOnPhone");
      v8 = v11;
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
    if (objc_msgSend(v9, "userInterfaceIdiom") == (id)1)
    {
      -[SSSScreenshotsView safeAreaInsets](self, "safeAreaInsets");
      v8 = v10 + 40.0;
    }
    else
    {
      -[SSSScreenshotsView _toolPickerHeightOnPhone](self, "_toolPickerHeightOnPhone");
      v8 = v12;
    }

  }
  v13 = -[SSSScreenshotsView _shouldExtendBottomBarForPageDots](self, "_shouldExtendBottomBarForPageDots");
  result = v8 + 26.0;
  if (!v13)
    return v8;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSScreenshotsView;
  -[SSSScreenshotsView safeAreaInsetsDidChange](&v3, "safeAreaInsetsDidChange");
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_layoutScreenshotView:(id)a3 forState:(unint64_t)a4 isFirstScreenshot:(BOOL)a5 isCurrentScreenshot:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a6;
  v9 = a3;
  v18 = v9;
  if (a4 == 1)
  {
    objc_msgSend(v9, "prepareForFullscreenExperience");
    if (!self->_isInStateTransition)
      objc_msgSend(v18, "finishPreparingForFullscreenExperience");
    goto LABEL_6;
  }
  if (self->_isInStateTransition)
  {
    objc_msgSend(v9, "prepareForMiniaturization");
LABEL_6:
    v9 = v18;
  }
  objc_msgSend(v9, "setState:", a4);
  v10 = sub_1000491EC(a4, self->_borderViewStyleOverride);
  v11 = 0;
  if (a4 == 1 && v6)
    v11 = -[SSSScreenshotsView _screenshotEditsShouldBeSnapshottedForCurrentScreenshot](self, "_screenshotEditsShouldBeSnapshottedForCurrentScreenshot") ^ 1;
  if (a4 == 1 && v11 != 1)
    objc_msgSend(v18, "commitInflightEdits");
  objc_msgSend(v18, "setBorderStyle:", v10);
  objc_msgSend(v18, "setUsesOriginalImageAspectRatio:", sub_100049204(a4));
  objc_msgSend(v18, "setGesturesEnabled:", a4 == 1);
  objc_msgSend(v18, "setAnnotationsEnabled:", v11);
  if (v6)
  {
    objc_msgSend(v18, "setScreenshotEditsSnapshotted:inTransition:currentScreenshot:", v11 ^ 1, self->_isInStateTransition, 1);
    if (!-[SSSScreenshotsView currentScreenshotCropHandlesFadedOut](self, "currentScreenshotCropHandlesFadedOut"))
    {
      v12 = !-[SSSScreenshotsView _shouldAvoidKeyboard](self, "_shouldAvoidKeyboard");
      goto LABEL_20;
    }
  }
  else
  {
    if (!-[SSSScrollView isMoving](self->_scrollView, "isMoving"))
      objc_msgSend(v18, "deselectAllAnnotations");
    objc_msgSend(v18, "setScreenshotEditsSnapshotted:inTransition:currentScreenshot:", v11 ^ 1, self->_isInStateTransition, 0);
  }
  v12 = 0;
LABEL_20:
  v13 = v12 ^ 1;
  if (a4)
    v14 = v13;
  else
    v14 = 1;
  objc_msgSend(v18, "setCropHandlesFadedOut:", v14);
  objc_msgSend(v18, "setUseTrilinearMinificationFilter:", -[SSSScreenshotsView screenshotViewsUseTrilinearMinificationFilter](self, "screenshotViewsUseTrilinearMinificationFilter"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  objc_msgSend(v18, "setGeometryMultiplier:", 1.0 / sub_100010068());

  if ((_DWORD)v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKToolbarView annotationController](self->_toolPalette, "annotationController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "akController"));
    if (v16 != v17)
      -[AKToolbarView setAnnotationController:](self->_toolPalette, "setAnnotationController:", v17);

  }
}

- (void)setActiveScreenshotView:(id)a3
{
  SSSScreenshotView *v5;
  SSSScreenshotView *activeScreenshotView;
  SSSScreenshotView *v7;
  _BOOL8 v8;
  void *v9;
  SSSScreenshotView *v10;

  v5 = (SSSScreenshotView *)a3;
  if (self->_state)
  {
    activeScreenshotView = self->_activeScreenshotView;
    if (activeScreenshotView != v5)
    {
      v10 = v5;
      v7 = activeScreenshotView;
      objc_storeStrong((id *)&self->_activeScreenshotView, a3);
      -[SSSScreenshotsView addOrRemoveAAButtonIfNecessary](self, "addOrRemoveAAButtonIfNecessary");
      v8 = !-[SSSScreenshotView editMode](v10, "editMode")
        && -[SSSScreenshotsView interactionMode](self, "interactionMode");
      -[SSSScreenshotsView setInteractionMode:](self, "setInteractionMode:", v8);
      -[SSSScreenshotsView _updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:](self, "_updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate"));
      objc_msgSend(v9, "activeScreenshotViewDidChangeToView:fromView:", self->_activeScreenshotView, v7);

      -[SSSScreenshotsView _removeHighlightedModeForScreenshotViewIfNecessary:](self, "_removeHighlightedModeForScreenshotViewIfNecessary:", v7);
      v5 = v10;
    }
  }

}

- (UIBarButtonItem)currentLiveTextBarButtonItemIfExists
{
  return (UIBarButtonItem *)-[SSSScreenshotView _imageAnalysisAaBarButtonItemIfExists](self->_activeScreenshotView, "_imageAnalysisAaBarButtonItemIfExists");
}

- (void)addOrRemoveActionInfoViewIfNecessary
{
  void *v3;
  id v4;
  UIView *v5;
  UIView **p_actionInfoView;
  UIView *actionInfoView;
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
  void *v20;
  void *v21;
  _QWORD v22[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (!v4)
  {
    v5 = (UIView *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView _actionInfoViewIfExists](self->_activeScreenshotView, "_actionInfoViewIfExists"));
    p_actionInfoView = &self->_actionInfoView;
    actionInfoView = self->_actionInfoView;
    if (v5 != actionInfoView)
    {
      -[UIView removeFromSuperview](actionInfoView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_actionInfoView, v5);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_bottomBar, "contentView"));
    if (*p_actionInfoView && self->_liveTextButton)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](*p_actionInfoView, "superview"));

      if (v9 != v8)
      {
        objc_msgSend(v8, "addSubview:", *p_actionInfoView);
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_actionInfoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](*p_actionInfoView, "leadingAnchor"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 20.0));
        v22[0] = v19;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](*p_actionInfoView, "trailingAnchor"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_liveTextButton, "leadingAnchor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v10, -10.0));
        v22[1] = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](*p_actionInfoView, "centerYAnchor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_visualSearchButton, "centerYAnchor"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
        v22[2] = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](*p_actionInfoView, "heightAnchor"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 35.0));
        v22[3] = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

      }
    }

  }
}

- (void)addOrRemoveAAButtonIfNecessary
{
  UIButton *v3;
  UIButton **p_liveTextButton;
  UIButton *liveTextButton;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v3 = (UIButton *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView _imageAnalysisAaButtonIfExists](self->_activeScreenshotView, "_imageAnalysisAaButtonIfExists"));
  p_liveTextButton = &self->_liveTextButton;
  liveTextButton = self->_liveTextButton;
  if (v3 != liveTextButton)
  {
    -[UIButton removeFromSuperview](liveTextButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_liveTextButton, v3);
    if (*p_liveTextButton)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_bottomBar, "contentView"));
      objc_msgSend(v6, "addSubview:", *p_liveTextButton);
      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](*p_liveTextButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](*p_liveTextButton, "trailingAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -20.0));
      v14[0] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](*p_liveTextButton, "centerYAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_visualSearchButton, "centerYAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
      v14[1] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

    }
  }
  -[SSSScreenshotsView addOrRemoveActionInfoViewIfNecessary](self, "addOrRemoveActionInfoViewIfNecessary");

}

- (CGRect)_frameForScreenshot:(id)a3 atIndex:(int64_t)a4 numberOfScreenshots:(int64_t)a5 maximumSize:(CGSize)a6 interScreenshotSpacing:(double)a7 rectToCenterAboveKeyboard:(CGRect)a8 state:(unint64_t)a9
{
  double x;
  double v12;
  double v13;
  void *v17;
  void *v18;
  void *v19;
  double y;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
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
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double MaxY;
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
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  int64_t v75;
  int64_t v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  double r2;
  CGFloat r2b;
  CGFloat r2a;
  double width;
  CGFloat v90;
  CGFloat v91;
  double height;
  CGFloat v93;
  CGFloat v94;
  _OWORD v95[2];
  double v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect result;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  width = a8.size.width;
  height = a8.size.height;
  r2 = a8.origin.y;
  x = a8.origin.x;
  v12 = a6.height;
  v13 = a6.width;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView screenshotViewForScreenshot:](self, "screenshotViewForScreenshot:", a3));
  v98 = 0u;
  v99 = 0u;
  v97 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewModificationInfo"));
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "cropInfo");
  }
  else
  {
    v98 = 0u;
    v99 = 0u;
    v97 = 0u;
  }
  y = CGRectZero.origin.y;

  v21 = SSizeToFitSizeInAspectRatioOfSize(*(double *)&v97, *((double *)&v97 + 1), v13, v12);
  v23 = v22;
  v24 = -[SSSScreenshotsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v96 = 0.0;
  memset(v95, 0, sizeof(v95));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  sub_10000FFDC(v25, (uint64_t)v95);

  if (-[SSSScreenshotsView _currentUserInterfaceIdiom](self, "_currentUserInterfaceIdiom"))
  {
    -[SSSScrollView bounds](self->_scrollView, "bounds");
    v30 = UIRectCenteredIntegralRect(CGRectZero.origin.x, y, v21, v23, v26, v27, v28, v29);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    if (a9)
    {
LABEL_6:
      if (a9 == 1)
      {
        v30 = SSRoundRectToScale((v13 + a7)* (double)-[SSSScreenshotsView _effectiveIndexForIndex:inNumberOfScreenshots:](self, "_effectiveIndexForIndex:inNumberOfScreenshots:", a4, a5), v32, v34, v36, 1.0);
        v32 = v37;
        v34 = v38;
        v36 = v39;
        if (!-[SSSScreenshotsView editMode](self, "editMode") && !CGRectIsNull(self->_keyboardFrame))
        {
          v108.origin.x = CGRectNull.origin.x;
          v108.origin.y = CGRectNull.origin.y;
          v108.size.width = CGRectNull.size.width;
          v108.size.height = CGRectNull.size.height;
          v100.origin.x = x;
          v100.origin.y = r2;
          v100.size.width = width;
          v100.size.height = height;
          if (!CGRectEqualToRect(v100, v108))
          {
            -[UIView setFrame:](self->_layoutPositioningView, "setFrame:", v30, v32, v34, v36);
            -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", self->_layoutPositioningView, x, r2, width, height);
            v90 = v41;
            v93 = v40;
            r2b = v42;
            v44 = v43;
            -[SSSScreenshotsView safeAreaInsets](self, "safeAreaInsets");
            v46 = v45;
            v101.origin.x = v30;
            v101.origin.y = v32;
            v101.size.width = v34;
            v101.size.height = v36;
            v109 = CGRectOffset(v101, 0.0, v46);
            v102 = CGRectIntersection(self->_keyboardFrame, v109);
            v47 = v102.origin.y;
            v48 = v102.size.width;
            v49 = v102.size.height;
            v85 = v102.origin.x;
            v110.origin.y = v90;
            v110.origin.x = v93;
            v110.size.width = r2b;
            v110.size.height = v44;
            v103 = CGRectIntersection(v102, v110);
            v50 = v103.size.height;
            v91 = v103.origin.y;
            v94 = v103.origin.x;
            r2a = v103.size.width;
            if (!CGRectIsEmpty(v103))
            {
              v84 = v47;
              v104.origin.x = v94;
              v104.origin.y = v91;
              v104.size.width = r2a;
              v104.size.height = v50;
              if (!CGRectIsNull(v104))
              {
                v105.origin.x = v94;
                v105.origin.y = v91;
                v105.size.width = r2a;
                v105.size.height = v50;
                MaxY = CGRectGetMaxY(v105);
                v106.origin.y = v84;
                v106.origin.x = v85;
                v106.size.height = v49;
                v106.size.width = v48;
                v32 = v32 - (MaxY - CGRectGetMinY(v106));
              }
            }
          }
        }
      }
      goto LABEL_21;
    }
  }
  else
  {
    -[SSSScreenshotsView _availableRectForContent](self, "_availableRectForContent");
    v30 = UIRectCenteredIntegralRect(CGRectZero.origin.x, y, v21, v23, v52, v53, v54, v55);
    v57 = v56;
    v34 = v58;
    v36 = v59;
    -[SSSScreenshotsView safeAreaInsets](self, "safeAreaInsets");
    v32 = v57 - v60;
    if (a9)
      goto LABEL_6;
  }
  if (v24)
    v61 = -1.0;
  else
    v61 = 1.0;
  v62 = SSizeToFitSizeInAspectRatioOfSize(*(double *)&v99, *((double *)&v99 + 1), v13, v12);
  v64 = v63;
  -[SSSScrollView bounds](self->_scrollView, "bounds");
  v66 = v65 - v64;
  v67 = sub_100010074();
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  v69 = v67 * (1.0 / sub_100010068());

  v70 = v61 * v69 + 0.0;
  v71 = v66 - v69;
  v72 = v96;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  v74 = v72 * (1.0 / sub_100010068());

  if (a5 >= 3)
    v75 = 3;
  else
    v75 = a5;
  v76 = -[SSSScreenshotsView _positioningIndexForIndex:numberOfScreenshots:](self, "_positioningIndexForIndex:numberOfScreenshots:", a4, a5);
  v30 = SSRoundRectToScale(v70 + v61 * (v74 * (double)(v75 + ~v76)), v71 - v74 * (double)(v75 + ~v76), v62, v64, 1.0);
  v32 = v77;
  v34 = v78;
  v36 = v79;
LABEL_21:

  v80 = v30;
  v81 = v32;
  v82 = v34;
  v83 = v36;
  result.size.height = v83;
  result.size.width = v82;
  result.origin.y = v81;
  result.origin.x = v80;
  return result;
}

- (CGRect)_layoutBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[SSSScreenshotsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SSSScreenshotsView state](self, "state");
  -[SSSScreenshotsView safeAreaInsets](self, "safeAreaInsets");
  if (v11 == 1)
  {
    if (v13 < v15)
      v13 = v15;
    v4 = v4 + v13;
    v6 = v6 + v12;
    v8 = v8 - (v13 + v13);
    v10 = v10 - (v12 + v14);
  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)_layoutBoundsForFullPageThumbnail
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[SSSScreenshotsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SSSScreenshotsView state](self, "state");
  -[SSSScreenshotsView safeAreaInsets](self, "safeAreaInsets");
  if (v11 == 1)
  {
    v4 = v4 + v13;
    v6 = v6 + v12;
    v8 = v8 - (v13 + v15);
    v10 = v10 - (v12 + v14);
  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)_availableRectForContent
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
  double v13;
  double v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double cachedTopBarHeight;
  CGRect result;

  -[SSSScreenshotsView _layoutBounds](self, "_layoutBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((id)-[SSSScreenshotsView state](self, "state") == (id)1)
  {
    if (-[SSSScreenshotsView _currentPage](self, "_currentPage"))
    {
      cachedTopBarHeight = self->_cachedTopBarHeight;
    }
    else
    {
      -[UINavigationBar bounds](self->_topBar, "bounds");
      cachedTopBarHeight = v11;
      self->_cachedTopBarHeight = v11;
    }
    -[SSSScreenshotsView _bottomBarHeightIncludingSafeAreaInsets](self, "_bottomBarHeightIncludingSafeAreaInsets");
    v13 = v12;
    -[SSSScreenshotsView safeAreaInsets](self, "safeAreaInsets");
    v32 = fmax(v13 - v14, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView visibleScreenshots](self, "visibleScreenshots"));
    v16 = (unint64_t)objc_msgSend(v15, "count") > 1;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView window](self, "window"));
    objc_msgSend(v19, "bounds");
    +[SSChromeHelper availableRectForFullscreenContent:layoutBounds:bleedToBottom:topBarHeight:bottomBarHeight:userInterfaceIdiom:multipleScreenshots:](SSChromeHelper, "availableRectForFullscreenContent:layoutBounds:bleedToBottom:topBarHeight:bottomBarHeight:userInterfaceIdiom:multipleScreenshots:", -[SSSScreenshotsView _shouldBleedToBottom](self, "_shouldBleedToBottom"), v18, v16, v20, v21, v22, v23, v4, v6, v8, v10, *(_QWORD *)&cachedTopBarHeight, *(_QWORD *)&v32);
    v4 = v24;
    v6 = v25;
    v8 = v26;
    v10 = v27;

  }
  v28 = v4;
  v29 = v6;
  v30 = v8;
  v31 = v10;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGSize)_screenshotMaximumSize
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
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  -[SSSScreenshotsView _availableRectForContent](self, "_availableRectForContent");
  v4 = v3;
  v6 = v5;
  -[SSSScreenshotsView bounds](self, "bounds");
  v9 = SSizeToFitSizeInAspectRatioOfSize(v7, v8, v4, v6);
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  v13 = objc_msgSend(v12, "displayScale");
  v15 = SSRoundSizeToScale(v13, v9, v11, v14);
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)_interScreenshotSpacing
{
  double v3;
  double v4;
  double v5;

  -[SSSScreenshotsView _screenshotMaximumSize](self, "_screenshotMaximumSize");
  v4 = v3;
  -[SSSScreenshotsView bounds](self, "bounds");
  return (v5 - v4) * 0.25;
}

- (UIEdgeInsets)_scrollContentInsets
{
  uint64_t v3;
  double left;
  CGFloat bottom;
  double right;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
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
  double v39;
  double v40;
  double v41;
  double top;
  double v43;
  double v44;
  double v45;
  UIEdgeInsets result;

  v3 = -[SSSScreenshotsView numberOfScreenshotImages](self, "numberOfScreenshotImages");
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v7 = -[SSSScreenshotsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v8 = -[SSSScreenshotsView state](self, "state");
  if (v3 < 1)
  {
    if (v8 == 1)
    {
      -[SSSScreenshotsView _interScreenshotSpacing](self, "_interScreenshotSpacing");
      left = v40 + v40;
      -[SSSScreenshotsView _interScreenshotSpacing](self, "_interScreenshotSpacing");
      right = v41 + v41;
    }
  }
  else if (v8 == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_screenshotViews, "firstObject"));
    v10 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_screenshotViews, "lastObject"));
    v11 = (void *)v10;
    v12 = v7 == 0;
    if (v7)
      v13 = (void *)v10;
    else
      v13 = v9;
    if (v12)
      v14 = (void *)v10;
    else
      v14 = v9;
    v15 = v14;
    objc_msgSend(v13, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[SSSScreenshotsView bounds](self, "bounds");
    left = UIRectCenteredXInRect(v17, v19, v21, v23, v24, v25, v26, v27);
    objc_msgSend(v15, "frame");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;

    -[SSSScreenshotsView bounds](self, "bounds");
    right = UIRectCenteredXInRect(v29, v31, v33, v35, v36, v37, v38, v39);

  }
  top = UIEdgeInsetsZero.top;
  v43 = left;
  v44 = bottom;
  v45 = right;
  result.right = v45;
  result.bottom = v44;
  result.left = v43;
  result.top = top;
  return result;
}

- (CGSize)_scrollContentSize
{
  double v3;
  CGFloat width;
  NSMutableArray *v5;
  id v6;
  id v7;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  uint64_t v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  CGSize result;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[SSSScreenshotsView bounds](self, "bounds");
  width = v3;
  if (-[SSSScreenshotsView numberOfScreenshotImages](self, "numberOfScreenshotImages") >= 1
    && (id)-[SSSScreenshotsView state](self, "state") == (id)1)
  {
    width = CGRectNull.size.width;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = self->_screenshotViews;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      x = CGRectNull.origin.x;
      y = CGRectNull.origin.y;
      height = CGRectNull.size.height;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12), "frame", (_QWORD)v20);
          v28.origin.x = v13;
          v28.origin.y = v14;
          v28.size.width = v15;
          v28.size.height = v16;
          v26.origin.x = x;
          v26.origin.y = y;
          v26.size.width = width;
          v26.size.height = height;
          v27 = CGRectUnion(v26, v28);
          x = v27.origin.x;
          y = v27.origin.y;
          width = v27.size.width;
          height = v27.size.height;
          v12 = (char *)v12 + 1;
        }
        while (v7 != v12);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

  }
  -[SSSScrollView frame](self->_scrollView, "frame", (_QWORD)v20);
  v17 = width;
  v19 = v18;
  result.height = v19;
  result.width = v17;
  return result;
}

- (BOOL)_showAllScreenshotsForNumberOfScreenshots:(int64_t)a3
{
  unint64_t v4;

  v4 = -[SSSScreenshotsView state](self, "state");
  return a3 < 4 || v4 == 1;
}

- (BOOL)_shouldShowScreenshotViewAtIndex:(int64_t)a3
{
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  BOOL v9;

  if ((id)-[SSSScreenshotsView editMode](self, "editMode") == (id)2
    && -[SSSScreenshotsView _currentPage](self, "_currentPage") != a3)
  {
    return 0;
  }
  if (-[SSSScreenshotsView _showAllScreenshotsForNumberOfScreenshots:](self, "_showAllScreenshotsForNumberOfScreenshots:", -[SSSScreenshotsView _numberOfPages](self, "_numberOfPages")))
  {
    return 1;
  }
  v6 = -[SSSScreenshotsView _numberOfPages](self, "_numberOfPages");
  v7 = -[SSSScreenshotsView _numberOfPages](self, "_numberOfPages");
  if (v6 >= 0)
    v8 = v6;
  else
    v8 = v6 + 1;
  v9 = v8 >> 1 == a3 || v7 - 1 == a3;
  return !a3 || v9;
}

- (int64_t)_positioningIndexForIndex:(int64_t)a3 numberOfScreenshots:(int64_t)a4
{
  if (!-[SSSScreenshotsView _showAllScreenshotsForNumberOfScreenshots:](self, "_showAllScreenshotsForNumberOfScreenshots:", a4))return (uint64_t)((double)a3 / (double)a4 * 3.0);
  return a3;
}

- (int64_t)_effectiveIndexForIndex:(int64_t)a3 inNumberOfScreenshots:(int64_t)a4
{
  if (-[SSSScreenshotsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    return ~a3 + a4;
  else
    return a3;
}

- (id)_rectsForShadowView
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double y;
  double width;
  double height;
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
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView visibleScreenshots](self, "visibleScreenshots"));
  v5 = (uint64_t)objc_msgSend(v4, "count");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", v7));
      -[SSSScreenshotsView bounds](self, "bounds");
      -[SSSScreenshotsView _frameForScreenshot:atIndex:numberOfScreenshots:maximumSize:interScreenshotSpacing:rectToCenterAboveKeyboard:state:](self, "_frameForScreenshot:atIndex:numberOfScreenshots:maximumSize:interScreenshotSpacing:rectToCenterAboveKeyboard:state:", v11, v7, v6, 0, v12, v13, 0.0, CGRectNull.origin.x, y, width, height);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v22 = sub_100010074();
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v15 - v22, v17 - v22, v19 + v22 * 2.0, v21 + v22 * 2.0));
      objc_msgSend(v3, "addObject:", v23);

      ++v7;
    }
    while (v6 != v7);
  }

  return v3;
}

- (double)_thumbnailTrayWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[SSSScreenshotsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom") == (id)1;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");
  v11 = fmax(v4, v6);
  v12 = fmin(v4, v6);
  if (v10 == (id)1)
    v13 = v11;
  else
    v13 = v12;
  v14 = dbl_10006E1C0[v8];

  return v14 * v13;
}

- (void)_layoutThumbnailView
{
  void *v3;
  void *v4;
  _SSSPDFThumbnailView *pdfThumbnailView;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double MaxY;
  double v19;
  id v20;
  uint64_t v21;
  double MinX;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  id v39;
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
  void *v51;
  id v52;
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
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  if ((id)-[SSSScreenshotsView editMode](self, "editMode") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _viewForPage:](self, "_viewForPage:", -[SSSScreenshotsView _currentPage](self, "_currentPage")));
    objc_msgSend(v3, "setNeedsLayout");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _viewForPage:](self, "_viewForPage:", -[SSSScreenshotsView _currentPage](self, "_currentPage")));
    objc_msgSend(v4, "layoutIfNeeded");

    pdfThumbnailView = self->_pdfThumbnailView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _currentPDFView](self, "_currentPDFView"));
    -[_SSSPDFThumbnailView setPdfView:](pdfThumbnailView, "setPdfView:", v6);

    -[SSSScreenshotsView _updateThumbnailViewVisibilityIfNeededAnimated:](self, "_updateThumbnailViewVisibilityIfNeededAnimated:", 0);
    -[SSSScreenshotsView _thumbnailTrayWidth](self, "_thumbnailTrayWidth");
    v8 = v7;
    -[UINavigationBar frame](self->_topBar, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[SSSScreenshotsView _bottomBarHeightIncludingSafeAreaInsets](self, "_bottomBarHeightIncludingSafeAreaInsets");
    if (v17 == 0.0)
    {
      -[SSSScreenshotsView bounds](self, "bounds");
      MaxY = CGRectGetMaxY(v65);
    }
    else
    {
      -[UIVisualEffectView frame](self->_bottomBar, "frame");
      MaxY = CGRectGetMinY(v64);
    }
    v19 = MaxY;
    v20 = -[SSSScreenshotsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    -[SSSScreenshotsView _layoutBoundsForFullPageThumbnail](self, "_layoutBoundsForFullPageThumbnail");
    if (v20)
      MinX = CGRectGetMinX(*(CGRect *)&v21);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&v21) - v8;
    v66.origin.x = v10;
    v66.origin.y = v12;
    v66.size.width = v14;
    v66.size.height = v16;
    v26 = CGRectGetMaxY(v66);
    v67.origin.x = v10;
    v67.origin.y = v12;
    v67.size.width = v14;
    v67.size.height = v16;
    v27 = v19 - CGRectGetMaxY(v67);
    -[_SSSPDFThumbnailView setFrame:](self->_pdfThumbnailView, "setFrame:", MinX, v26, v8, v27);
    -[SSSScreenshotsView safeAreaInsets](self, "safeAreaInsets");
    -[UIVisualEffectView setFrame:](self->_thumbnailBackgroundView, "setFrame:", MinX, v26, v8 + v28, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _currentPDFView](self, "_currentPDFView"));
    objc_msgSend(v29, "bounds");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _currentPDFView](self, "_currentPDFView"));
    -[UINavigationBar bounds](self->_topBar, "bounds");
    v39 = objc_msgSend(v38, "convertRect:fromView:", self->_topBar);
    v44 = SSRectSubtractingRect(v39, v31, v33, v35, v37, v40, v41, v42, v43);
    v46 = v45;
    v48 = v47;
    v50 = v49;

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _currentPDFView](self, "_currentPDFView"));
    -[_SSSPDFThumbnailView bounds](self->_pdfThumbnailView, "bounds");
    v52 = objc_msgSend(v51, "convertRect:fromView:", self->_pdfThumbnailView);
    v57 = SSRectSubtractingRect(v52, v44, v46, v48, v50, v53, v54, v55, v56);
    v59 = v58;
    v61 = v60;
    v63 = v62;

    -[_SSSPDFThumbnailView setScrollViewVisibleRectInPDFView:](self->_pdfThumbnailView, "setScrollViewVisibleRectInPDFView:", v57, v59, v61, v63);
  }
  else
  {
    -[SSSScreenshotsView _updateThumbnailViewVisibilityIfNeededAnimated:](self, "_updateThumbnailViewVisibilityIfNeededAnimated:", 0);
  }
}

- (CGRect)screenshotsExtentRect
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_screenshotViews;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "extent", (_QWORD)v21);
        -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", v12);
        v29.origin.x = v13;
        v29.origin.y = v14;
        v29.size.width = v15;
        v29.size.height = v16;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v29);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (UICoordinateSpace)screenshotsParentCoordinateSpace
{
  return (UICoordinateSpace *)self->_scrollView;
}

- (void)_updateThumbnailViewVisibilityIfNeededAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003BF28;
  v6[3] = &unk_100091920;
  v6[4] = self;
  v4 = objc_retainBlock(v6);
  v5 = v4;
  if (v3)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.2);
  else
    ((void (*)(_QWORD *))v4[2])(v4);

}

- (void)aaButtonPressed:(id)a3
{
  void *v4;
  id v5;

  -[UIButton setSelected:](self->_liveTextButton, "setSelected:", -[UIButton isSelected](self->_liveTextButton, "isSelected", a3) ^ 1);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView activeScreenshotView](self, "activeScreenshotView"));
  objc_msgSend(v5, "aaButtonPressed:", v4);

}

- (void)analysisInfoButtonPressed:(id)a3
{
  void *v4;
  id v5;

  -[UIButton setSelected:](self->_visualSearchButton, "setSelected:", -[UIButton isSelected](self->_visualSearchButton, "isSelected", a3) ^ 1);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView activeScreenshotView](self, "activeScreenshotView"));
  objc_msgSend(v5, "analysisButtonPressed:", v4);

}

- (void)toolbarDidSelectOpacityOptionWithAccessoryView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate"));
  objc_msgSend(v5, "didTapOpacityOptionWithAttributeView:", v4);

}

- (void)endOpacityEditing
{
  void *v3;
  void *v4;

  if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages") & 1) != 0
    || _os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView window](self, "window"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v3));
    objc_msgSend(v4, "_endOpacityEditing");

  }
  -[AKToolbarView endOpacityEditing](self->_toolPalette, "endOpacityEditing");
}

- (SSSScreenshot)currentScreenshot
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "screenshot"));

  return (SSSScreenshot *)v3;
}

- (id)currentScreenshotView
{
  return -[SSSScreenshotsView _viewForPage:](self, "_viewForPage:", -[SSSScreenshotsView _currentPage](self, "_currentPage"));
}

- (void)parentScreenshotView:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;

  v5 = a3;
  -[SSSScreenshotsView layoutIfNeeded](self, "layoutIfNeeded");
  -[SSSScreenshotsView _noteCurrentPageForSignificantChange](self, "_noteCurrentPageForSignificantChange");
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setRulerHostingView:", self->_rulerHostingView);
  -[NSMutableArray addObject:](self->_screenshotViews, "addObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView imageAnalyzer](self, "imageAnalyzer"));
  objc_msgSend(v5, "setImageAnalyzer:", v6);

  -[SSSScrollView addSubview:](self->_scrollView, "addSubview:", v5);
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_screenshotViewForScreenshot:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_screenshotViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screenshot", (_QWORD)v12));

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeScreenshots:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  -[SSSScreenshotsView layoutIfNeeded](self, "layoutIfNeeded");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _screenshotViewForScreenshot:](self, "_screenshotViewForScreenshot:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), (_QWORD)v13));
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "setIsBeingRemoved:", 1);
          objc_msgSend(v11, "setScreenshotEditsSnapshotted:inTransition:currentScreenshot:", 1, 0, 1);
          -[NSMutableArray removeObject:](self->_screenshotViews, "removeObject:", v11);
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[SSSScreenshotsView _noteCurrentPageForSignificantChange](self, "_noteCurrentPageForSignificantChange");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate"));
  objc_msgSend(v12, "screenshotDidChangeForScreenshotsView:", self);

  -[SSSScreenshotsView _updateActiveScreenshotViewIfNecessary](self, "_updateActiveScreenshotViewIfNecessary");
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");

}

- (int64_t)numberOfScreenshotImages
{
  return (int64_t)-[NSMutableArray count](self->_screenshotViews, "count");
}

- (void)setScreenshotViewsUseTrilinearMinificationFilter:(BOOL)a3
{
  self->_screenshotViewsUseTrilinearMinificationFilter = a3;
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCurrentScreenshotCropHandlesFadedOut:(BOOL)a3
{
  self->_currentScreenshotCropHandlesFadedOut = a3;
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)commitInflightEdits
{
  NSMutableArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_screenshotViews;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "commitInflightEdits", (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_updateActiveScreenshotViewIfNecessary
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  -[SSSScreenshotsView setActiveScreenshotView:](self, "setActiveScreenshotView:", v3);

}

- (void)setState:(unint64_t)a3
{
  CGSize size;

  if (self->_state != a3)
  {
    self->_isInStateTransition = 1;
    -[SSSScreenshotsView _noteCurrentPageForSignificantChange](self, "_noteCurrentPageForSignificantChange");
    if (!a3)
    {
      -[AKToolbarView forceHideRuler](self->_toolPalette, "forceHideRuler");
      -[SSSScreenshotsView setEditMode:](self, "setEditMode:", 0);
      size = CGRectNull.size;
      self->_keyboardFrame.origin = CGRectNull.origin;
      self->_keyboardFrame.size = size;
    }
    self->_state = a3;
    -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)inStateTransition
{
  return self->_isInStateTransition;
}

- (void)stateTransitionFinished
{
  self->_isInStateTransition = 0;
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateDisplayedPage
{
  if (self->_lastPageForSignificantChange == -1 || -[SSSScreenshotsView _currentPage](self, "_currentPage") == -1)
  {
    -[SSSScreenshotCountIndicator setIndex:](self->_countIndicator, "setIndex:", -[SSSScreenshotsView _currentPage](self, "_currentPage"));
  }
  else
  {
    if ((id)-[SSSScreenshotsView state](self, "state") == (id)1)
    {
      -[SSSScreenshotsView _scrollToPage:animated:](self, "_scrollToPage:animated:", self->_lastPageForSignificantChange, 0);
      -[SSSScreenshotCountIndicator setIndex:](self->_countIndicator, "setIndex:", self->_lastPageForSignificantChange);
    }
    self->_lastPageForSignificantChange = -1;
  }
}

- (void)_updateScrollPositionForCurrentPage
{
  if ((id)-[SSSScreenshotsView state](self, "state") == (id)1 && self->_lastPageForSignificantChange == -1)
    -[SSSScreenshotsView _scrollToPage:animated:](self, "_scrollToPage:animated:", -[SSSScreenshotsView _currentPage](self, "_currentPage"), 0);
}

- (void)_noteCurrentPageForSignificantChange
{
  self->_lastPageForSignificantChange = -[SSSScreenshotsView _currentPage](self, "_currentPage");
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate", a3));
  objc_msgSend(v4, "screenshotDidChangeForScreenshotsView:", self);

  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout", a3);
  -[SSSScreenshotsView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  CGFloat y;
  uint64_t v9;
  id v10;
  uint64_t v11;
  int64_t v12;
  CGFloat v13;

  x = a4.x;
  y = a5->y;
  v9 = -[SSSScreenshotsView _pageForXOffsetInScrollView:](self, "_pageForXOffsetInScrollView:", a3, a5->x, a4.y);
  v10 = -[SSSScreenshotsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (x != 0.0)
  {
    v11 = 1;
    if (v10)
      v11 = -1;
    if (x <= 0.0)
      v11 = -v11;
    v9 = (v11 + v9) & ~((v11 + v9) >> 63);
    v12 = -[SSSScreenshotsView _numberOfPages](self, "_numberOfPages");
    if (v9 >= v12 - 1)
      v9 = v12 - 1;
  }
  -[SSSScreenshotsView _scrollViewRectForPage:](self, "_scrollViewRectForPage:", v9);
  a5->x = v13;
  a5->y = y;
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_viewForPage:(int64_t)a3
{
  void *v5;

  if (a3 < 0)
  {
    v5 = 0;
  }
  else if ((unint64_t)-[NSMutableArray count](self->_screenshotViews, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_screenshotViews, "objectAtIndex:", a3));
  }
  return v5;
}

- (CGRect)_scrollViewRectForPage:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Center;
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
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _viewForPage:](self, "_viewForPage:", a3));
  objc_msgSend(v4, "bounds");
  -[SSSScrollView convertRect:fromView:](self->_scrollView, "convertRect:fromView:", v4);
  v6 = v5;
  v8 = v7;
  Center = UIRectGetCenter(v5, v7, v9, v10);
  v13 = v12;
  -[SSSScrollView bounds](self->_scrollView, "bounds");
  v16 = UIRectCenteredAboutPoint(v6, v8, v14, v15, Center, v13);
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (int64_t)_pageForXOffsetInScrollView:(double)a3
{
  double y;
  double v6;
  double v7;
  double Center;
  uint64_t v9;
  int64_t v10;
  double v11;
  id v12;
  id WeakRetained;
  SSSScrollView *scrollView;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  y = CGRectZero.origin.y;
  -[SSSScrollView bounds](self->_scrollView, "bounds");
  Center = UIRectGetCenter(a3, y, v6, v7);
  if (-[SSSScreenshotsView _numberOfPages](self, "_numberOfPages") < 1)
    return -1;
  v9 = 0;
  v10 = -1;
  v11 = 1.79769313e308;
  do
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_screenshotViews, "objectAtIndex:", v9));
    WeakRetained = objc_loadWeakRetained((id *)&self->_appearingScreenshotView);

    if (v12 != WeakRetained && (objc_msgSend(v12, "isBeingRemoved") & 1) == 0)
    {
      scrollView = self->_scrollView;
      objc_msgSend(v12, "bounds");
      -[SSSScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", v12);
      v19 = vabdd_f64(UIRectGetCenter(v15, v16, v17, v18), Center);
      if (v19 < v11)
      {
        v10 = v9;
        v11 = v19;
      }
    }

    ++v9;
  }
  while (v9 < -[SSSScreenshotsView _numberOfPages](self, "_numberOfPages"));
  return v10;
}

- (int64_t)_currentPage
{
  int64_t result;

  result = -[SSSScreenshotsView state](self, "state");
  if (result)
  {
    -[SSSScrollView contentOffset](self->_scrollView, "contentOffset");
    return -[SSSScreenshotsView _pageForXOffsetInScrollView:](self, "_pageForXOffsetInScrollView:");
  }
  return result;
}

- (int64_t)_numberOfPages
{
  return (int64_t)-[NSMutableArray count](self->_screenshotViews, "count");
}

- (void)_scrollToPage:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[SSSScreenshotsView _scrollViewRectForPage:](self, "_scrollViewRectForPage:", a3);
  -[SSSScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", v4);
}

- (id)viewsForScreenshots:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  id obj;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v3 = a3;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v9 = self->_screenshotViews;
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "screenshot"));

              if (v15 == v8)
              {
                objc_msgSend(v18, "addObject:", v14);
                goto LABEL_16;
              }
            }
            v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }

  return v18;
}

- (void)setIsSharing:(BOOL)a3
{
  self->_isSharing = a3;
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (NSArray)visibleScreenshots
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_screenshotViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "screenshot", (_QWORD)v11));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_screenshotAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_screenshotViews, "objectAtIndex:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screenshot"));

  return v4;
}

- (id)screenshotViewForScreenshot:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_screenshotViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screenshot", (_QWORD)v13));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_screenshotsEligibleForSharing
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_screenshotViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "screenshot", (_QWORD)v11));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSArray)activityItems
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _screenshotsEligibleForSharing](self, "_screenshotsEligibleForSharing"));
  v5 = objc_msgSend(v4, "count");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _screenshotsEligibleForSharing](self, "_screenshotsEligibleForSharing"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(v11, "lastViewEditMode");
        if (v12)
        {
          if (v12 != (id)1)
            continue;
          if (v5 == (id)1)
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemProviderPDFAsImage"));
          else
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemProviderPDF"));
        }
        else
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemProviderImage"));
        }
        v14 = (void *)v13;
        objc_msgSend(v3, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v3, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInfo printInfo](UIPrintInfo, "printInfo"));
    objc_msgSend(v15, "setOutputType:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SCREENSHOTS_PRINT_JOB_FORMAT"), &stru_1000937C8, 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, objc_msgSend(v3, "count")));

    objc_msgSend(v15, "setJobName:", v18);
    objc_msgSend(v3, "addObject:", v15);

  }
  return (NSArray *)v3;
}

- (NSArray)dragItems
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_screenshotViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screenshot", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemProviderForDragItems"));
        v12 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v11);
        objc_msgSend(v12, "setLocalObject:", v9);
        objc_msgSend(v3, "addObject:", v12);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)imageItems
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _screenshotsEligibleForSharing](self, "_screenshotsEligibleForSharing", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "itemProviderImage"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "item"));
        objc_msgSend(v3, "addObject:", v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_screenshotViewForDragItem:(id)a3
{
  return objc_msgSend(a3, "localObject");
}

- (id)previewForDragItem:(id)a3 inContainer:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double y;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  __int128 v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  _OWORD v33[3];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _screenshotViewForDragItem:](self, "_screenshotViewForDragItem:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screenshot"));
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "convertRect:fromView:", v7);
  v10 = v9;
  v12 = v11;
  y = CGPointZero.y;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageProvider"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "requestOutputImageForUIBlocking"));

  v16 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v15);
  objc_msgSend(v16, "setFrame:", CGPointZero.x, y, v10, v12);
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "convertPoint:fromView:", v7, UIRectGetCenter(v17, v18, v19, v20));
  v22 = v21;
  v24 = v23;

  v25 = objc_alloc((Class)UIDragPreviewTarget);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView window](self, "window"));
  v27 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v33[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v33[1] = v27;
  v33[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v28 = objc_msgSend(v25, "initWithContainer:center:transform:", v26, v33, v22, v24);

  v29 = objc_alloc_init((Class)UIDragPreviewParameters);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v29, "setBackgroundColor:", v30);

  v31 = objc_msgSend(objc_alloc((Class)UITargetedDragPreview), "initWithView:parameters:target:", v16, v29, v28);
  return v31;
}

- (id)targetForCancellingDragItem:(id)a3 inContainer:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _screenshotViewForDragItem:](self, "_screenshotViewForDragItem:", a3));
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "convertPoint:fromView:", v7, UIRectGetCenter(v8, v9, v10, v11));
  v14 = objc_msgSend(objc_alloc((Class)UIDragPreviewTarget), "initWithContainer:center:", v6, v12, v13);

  return v14;
}

- (void)setShowsShadow:(BOOL)a3
{
  self->_showsShadow = a3;
  -[SSSScreenshotsView _updateShadowViewAlpha](self, "_updateShadowViewAlpha");
}

- (void)_updateShadowViewAlpha
{
  unsigned int v3;
  double v4;

  v3 = -[SSSScreenshotsView showsShadow](self, "showsShadow");
  v4 = 0.0;
  if (v3)
    v4 = 1.0;
  -[SSSShadowView setAlpha:](self->_shadowView, "setAlpha:", v4);
}

- (void)screenshotViewUndoStackChanged:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate", a3));
  objc_msgSend(v4, "undoStackChangedForScreenshotsView:", self);

}

- (void)screenshotViewTapped:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));

  v5 = v6;
  if (v4 != v6)
  {
    -[SSSScreenshotsView _scrollToPage:animated:](self, "_scrollToPage:animated:", -[NSMutableArray indexOfObject:](self->_screenshotViews, "indexOfObject:", v6), 1);
    v5 = v6;
    self->_shouldUpdateActivityItemsAfterScrollAnimation = 1;
  }

}

- (void)screenshotViewCropDidChange:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate", a3));
  objc_msgSend(v4, "cropDidChangeForScreenshotView:", self);

  -[SSSScreenshotsView _updateVisualSearchCornerViewPositioning](self, "_updateVisualSearchCornerViewPositioning");
}

- (id)viewControllerForPresentationsFromScreenshotView:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForPresentationsFromScreenshotsView:", self));

  return v5;
}

- (void)screenshotView:(id)a3 hasHighPriorityGesture:(id)a4
{
  SSSScrollView *scrollView;
  id v5;
  id v6;

  scrollView = self->_scrollView;
  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSScrollView panGestureRecognizer](scrollView, "panGestureRecognizer"));
  objc_msgSend(v6, "requireGestureRecognizerToFail:", v5);

}

- (void)screenshotView:(id)a3 noLongerHasHighPriorityGesture:(id)a4
{
  SSSScrollView *scrollView;
  id v5;
  id v6;

  scrollView = self->_scrollView;
  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSScrollView panGestureRecognizer](scrollView, "panGestureRecognizer"));
  objc_msgSend(v6, "removeFailureRequirement:", v5);

}

- (void)screenshotView:(id)a3 didUpdateInteraction:(id)a4 withAnalysis:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView activeScreenshotView](self, "activeScreenshotView"));

  if (v7 == v6)
  {
    -[SSSScreenshotsView addOrRemoveAAButtonIfNecessary](self, "addOrRemoveAAButtonIfNecessary");
    -[SSSScreenshotsView _updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:](self, "_updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:", 1);
  }
}

- (void)screenshotView:(id)a3 requestsUpdateToInteractionMode:(unint64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate", a3));
  objc_msgSend(v6, "screenshotsView:requestsUpdateToInteractionMode:", self, a4);

}

- (void)screenshotView:(id)a3 startEditingOpacityInAccessoryView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate"));
  objc_msgSend(v6, "didTapOpacityOptionWithAttributeView:", v5);

}

- (CGRect)_effectiveBottomBarExtent
{
  double v3;
  double height;
  double v5;
  double v6;
  double v7;
  CGFloat width;
  void *v9;
  double y;
  CGFloat x;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[SSSScreenshotsView _toolPickerHeightOnPhone](self, "_toolPickerHeightOnPhone");
  height = v3;
  -[SSSScreenshotsView bounds](self, "bounds");
  v6 = v5;
  -[SSSScreenshotsView bounds](self, "bounds");
  width = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v9, "userInterfaceIdiom") == (id)1)
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  else
  {
    y = v6 - height;
    x = 0.0;
  }

  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setSnapshotScreenshotEdits:(BOOL)a3
{
  self->_snapshotScreenshotEdits = a3;
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_screenshotEditsShouldBeSnapshottedForCurrentScreenshot
{
  if (-[SSSScreenshotsView snapshotScreenshotEdits](self, "snapshotScreenshotEdits"))
    return 1;
  else
    return -[SSSScrollView isMoving](self->_scrollView, "isMoving");
}

- (void)dismissOverlayManagedViewControllers
{
  void *v3;
  id v4;

  -[AKToolbarView dismissPresentedPopovers](self->_toolPalette, "dismissPresentedPopovers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView window](self, "window"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstResponder"));

  -[AKToolbarView setToolPickerVisible:forFirstResponder:](self->_toolPalette, "setToolPickerVisible:forFirstResponder:", 0, v4);
}

- (int64_t)positionForBar:(id)a3
{
  if (self->_topBar == a3)
    return 3;
  else
    return 0;
}

- (UIView)bottomBar
{
  return (UIView *)self->_toolPalette;
}

- (void)setShareItemTarget:(id)a3
{
  objc_storeWeak(&self->_shareItemTarget, a3);
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShareItemAction:(SEL)a3
{
  self->_shareItemAction = a3;
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setUndoItemTarget:(id)a3
{
  objc_storeWeak(&self->_undoItemTarget, a3);
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setUndoItemAction:(SEL)a3
{
  self->_undoItemAction = a3;
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setRedoItemTarget:(id)a3
{
  objc_storeWeak(&self->_redoItemTarget, a3);
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setRedoItemAction:(SEL)a3
{
  self->_redoItemAction = a3;
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
}

- (id)createUndoMenu
{
  void *v2;
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
  _QWORD v15[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "undoManager"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("UNDO_FORMAT"), CFSTR("Undo %@"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "undoActionName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v7, 0, "_undo", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UNDO_ALL"), CFSTR("Undo All"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v10, 0, "_undoAll", 0));

  v15[0] = v8;
  v15[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1000937C8, 0, CFSTR("SSSUndoMenuIdentifer"), 0, v12));

  return v13;
}

- (void)_undo
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "undoManager"));

  if (objc_msgSend(v3, "canUndo"))
    objc_msgSend(v3, "undo");

}

- (void)_undoAll
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "undoManager"));

  if (objc_msgSend(v3, "canUndo"))
  {
    do
      objc_msgSend(v3, "undo");
    while ((objc_msgSend(v3, "canUndo") & 1) != 0);
  }

}

- (void)setBorderViewStyleOverride:(int64_t)a3 withAnimator:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v6 = a4;
  self->_borderViewStyleOverride = a3;
  -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003E270;
    v9[3] = &unk_100091920;
    v9[4] = self;
    objc_msgSend(v6, "addAnimations:", v9);
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003E278;
    v8[3] = &unk_100091920;
    v8[4] = self;
    v7 = +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:delay:options:animations:completion:](UIViewPropertyAnimator, "runningPropertyAnimatorWithDuration:delay:options:animations:completion:", 6, v8, 0, 0.3, 0.0);
  }

}

- (BOOL)_shouldHandleKeyboardNotification:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardIsLocalUserInfoKey));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!v6)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllerForPresentationsFromScreenshotsView:", self));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
  v10 = v9 == 0;

  return v10;
}

- (void)_updateForKeyboardNotification:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  unint64_t v21;
  _QWORD v22[4];
  id v23[5];
  id location;

  v4 = a3;
  if (-[SSSScreenshotsView _shouldHandleKeyboardNotification:](self, "_shouldHandleKeyboardNotification:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", UIKeyboardFrameEndUserInfoKey));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", UIKeyboardAnimationDurationUserInfoKey));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", UIKeyboardAnimationCurveUserInfoKey));

    objc_msgSend(v6, "CGRectValue");
    -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", 0);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v8, "doubleValue");
    v20 = v19;
    v21 = (unint64_t)objc_msgSend(v10, "integerValue");
    -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
    -[SSSScreenshotsView layoutIfNeeded](self, "layoutIfNeeded");
    -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10003E528;
    v22[3] = &unk_1000928B8;
    objc_copyWeak(v23, &location);
    v23[1] = v12;
    v23[2] = v14;
    v23[3] = v16;
    v23[4] = v18;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v21 | 6, v22, 0, v20, 0.0);
    objc_destroyWeak(v23);
    objc_destroyWeak(&location);

  }
}

- (void)_keyboardWillShow:(id)a3
{
  -[SSSScreenshotsView _updateForKeyboardNotification:](self, "_updateForKeyboardNotification:", a3);
}

- (void)_keyboardWillHide:(id)a3
{
  -[SSSScreenshotsView _updateForKeyboardNotification:](self, "_updateForKeyboardNotification:", a3);
}

- (BOOL)_shouldAvoidKeyboard
{
  CGRect *p_keyboardFrame;
  _BOOL4 v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  BOOL v10;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  p_keyboardFrame = &self->_keyboardFrame;
  v14.origin.x = CGRectNull.origin.x;
  v14.origin.y = CGRectNull.origin.y;
  v14.size.width = CGRectNull.size.width;
  v14.size.height = CGRectNull.size.height;
  if (CGRectEqualToRect(self->_keyboardFrame, v14))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[SSSScreenshotsView bounds](self, "bounds");
    v15.origin.x = v5;
    v15.origin.y = v6;
    v15.size.width = v7;
    v15.size.height = v8;
    v12 = CGRectIntersection(*p_keyboardFrame, v15);
    v4 = !CGRectIsEmpty(v12);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  objc_msgSend(v9, "rectToCenterAboveKeyboard");
  v10 = v4 & !CGRectIsNull(v13);

  return v10;
}

- (void)_updateSubviewOrdering
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = v3;
  if (self->_toolPalette)
    objc_msgSend(v3, "addObject:");
  if (self->_countIndicator)
    objc_msgSend(v4, "addObject:");
  if (self->_bottomBar)
    objc_msgSend(v4, "addObject:");
  if (self->_pdfThumbnailView)
    objc_msgSend(v4, "addObject:");
  if (self->_thumbnailBackgroundView)
    objc_msgSend(v4, "addObject:");
  if (self->_topBar)
    objc_msgSend(v4, "addObject:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[SSSScreenshotsView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), self->_scrollView, (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  SSSScreenshotCountIndicator *v19;
  id v20;
  SSSScreenshotCountIndicator *v21;
  SSSScrollView *v22;
  id WeakRetained;
  char v24;
  id v25;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = v8;
  if (self->_topBar)
    objc_msgSend(v8, "addObject:");
  if (self->_toolPalette)
    objc_msgSend(v9, "addObject:");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_bottomBar, "contentView"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_bottomBar, "contentView"));
    objc_msgSend(v9, "addObject:", v11);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "convertPoint:fromView:", self, x, y);
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hitTest:withEvent:", v7));
        v19 = (SSSScreenshotCountIndicator *)v18;
        if (v18 && !UIViewIgnoresTouchEvents(v18))
        {

          goto LABEL_18;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v14)
        continue;
      break;
    }
  }

  v27.receiver = self;
  v27.super_class = (Class)SSSScreenshotsView;
  v20 = -[SSSScreenshotsView hitTest:withEvent:](&v27, "hitTest:withEvent:", v7, x, y);
  v19 = (SSSScreenshotCountIndicator *)objc_claimAutoreleasedReturnValue(v20);
LABEL_18:
  if (v19 == self->_countIndicator
    || (v21 = (SSSScreenshotCountIndicator *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_bottomBar, "contentView")),
        v21,
        v19 == v21))
  {
    v22 = self->_scrollView;

    v19 = (SSSScreenshotCountIndicator *)v22;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v24 = objc_opt_respondsToSelector(WeakRetained, "screenshotsView:didHitTestView:point:withEvent:");

  if ((v24 & 1) != 0)
  {
    v25 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v25, "screenshotsView:didHitTestView:point:withEvent:", self, v19, v7, x, y);

  }
  return v19;
}

- (void)setEditMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[SSSScreenshotsView editMode](self, "editMode") != a3)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
    if (objc_msgSend(v8, "editMode") != (id)a3)
      -[AKToolbarView forceHideRuler](self->_toolPalette, "forceHideRuler");
    objc_msgSend(v8, "setEditMode:", a3);
    -[_SSSPDFThumbnailView setShouldUpdate:](self->_pdfThumbnailView, "setShouldUpdate:", a3 == 1);
    -[SSSScreenshotsView _noteCurrentPageForSignificantChange](self, "_noteCurrentPageForSignificantChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllerForPresentationsFromScreenshotsView:", self));

    objc_msgSend(v6, "becomeFirstResponder");
    -[SSSScreenshotsView setNeedsLayout](self, "setNeedsLayout");
    -[SSSScreenshotsView layoutIfNeeded](self, "layoutIfNeeded");
    objc_msgSend(v8, "adjustPDFPositioningToMatchImageIfNecessary");
    -[SSSScreenshotsView _updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:](self, "_updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:", 0);
    -[SSSScreenshotsView addOrRemoveAAButtonIfNecessary](self, "addOrRemoveAAButtonIfNecessary");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate"));
    objc_msgSend(v7, "screenshotsViewEditModeDidChange:", self);

  }
}

- (int64_t)editMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  v3 = objc_msgSend(v2, "editMode");

  return (int64_t)v3;
}

- (BOOL)isCropped
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  v3 = objc_msgSend(v2, "isCropped");

  return v3;
}

- (void)enterCrop
{
  id v3;

  -[AKToolbarView forceHideRuler](self->_toolPalette, "forceHideRuler");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _viewForPage:](self, "_viewForPage:", -[SSSScreenshotsView _currentPage](self, "_currentPage")));
  objc_msgSend(v3, "enterCrop");

}

- (void)resetCrop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  objc_msgSend(v2, "resetCrop");

}

- (void)doneCrop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _viewForPage:](self, "_viewForPage:", -[SSSScreenshotsView _currentPage](self, "_currentPage")));
  objc_msgSend(v2, "doneCrop");

}

- (void)cancelCrop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView _viewForPage:](self, "_viewForPage:", -[SSSScreenshotsView _currentPage](self, "_currentPage")));
  objc_msgSend(v2, "cancelCrop");

}

- (int64_t)currentPDFPage
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  v3 = objc_msgSend(v2, "currentPDFPage");

  return (int64_t)v3;
}

- (id)_currentPDFView
{
  void *v3;
  void *v4;

  if (-[SSSScreenshotsView _isShowingPDFScreenshot](self, "_isShowingPDFScreenshot"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_internalPDFView"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_anyScreenshotPDFViewNeedsBleedToBottom
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView visibleScreenshots](self, "visibleScreenshots", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "pdfData"));

        if (v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)_isShowingPDFScreenshot
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshotView](self, "currentScreenshotView"));
  v3 = objc_msgSend(v2, "editMode") != 0;

  return v3;
}

- (void)didProcessDocumentUpdateForScreenshot:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView visibleScreenshots](self, "visibleScreenshots"));
  v5 = objc_msgSend(v4, "containsObject:", v6);

  if (v5)
    objc_msgSend(v6, "didProcessDocumentUpdate");

}

- (BOOL)_layoutShouldShowContentSwitcher
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshot](self, "currentScreenshot"));
  v4 = objc_msgSend(v3, "isWaitingForPDF");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshot](self, "currentScreenshot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pdfData"));

  if (v6)
    return 1;
  else
    return v4;
}

- (BOOL)_layoutShouldEnableContentSwitcher
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView currentScreenshot](self, "currentScreenshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pdfData"));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_contentSwitcherShouldMoveDown
{
  unsigned __int8 v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = -[SSSScreenshotsView _isPortraitPhone](self, "_isPortraitPhone");
  if (-[SSSScreenshotsView _isLandscapePhone](self, "_isLandscapePhone"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v4, "bounds");
    v6 = v5 <= 568.0;

  }
  else
  {
    v6 = 0;
  }
  return (v3 | v6) & -[SSSScreenshotsView _layoutShouldShowContentSwitcher](self, "_layoutShouldShowContentSwitcher");
}

- (BOOL)_shouldBleedToBottom
{
  return (id)-[SSSScreenshotsView editMode](self, "editMode") == (id)1;
}

- (BOOL)_isPortraitPhone
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  BOOL v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView window](self, "window"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView window](self, "window"));
  objc_msgSend(v6, "bounds");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");
  v12 = v5 > v8 && v10 == 0;

  return v12;
}

- (BOOL)_isLandscapePhone
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  BOOL v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView window](self, "window"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView window](self, "window"));
  objc_msgSend(v6, "bounds");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");
  v12 = v5 > v8 && v10 == 0;

  return v12;
}

- (SSSScreenshotsView)initWithFrame:(CGRect)a3
{
  SSSScreenshotsView *v3;
  UINavigationBar *v4;
  UINavigationBar *topBar;
  SSSScrollView *v6;
  SSSScrollView *v7;
  SSSScrollView *scrollView;
  UIView *v9;
  UIView *layoutPositioningView;
  SSSShadowView *v11;
  SSSShadowView *shadowView;
  uint64_t v13;
  NSMutableArray *screenshotViews;
  CGSize size;
  SSSPassthroughView *v16;
  UIView *rulerHostingView;
  void *v18;
  void *v19;
  _SSSPDFThumbnailView *v20;
  _SSSPDFThumbnailView *pdfThumbnailView;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SSSScreenshotsView;
  v3 = -[SSSScreenshotsView initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SSSScreenshotsView setClipsToBounds:](v3, "setClipsToBounds:", 0);
  v4 = (UINavigationBar *)objc_alloc_init((Class)UINavigationBar);
  topBar = v3->_topBar;
  v3->_topBar = v4;

  v3->_state = 0;
  v6 = [SSSScrollView alloc];
  -[SSSScreenshotsView bounds](v3, "bounds");
  v7 = -[SSSScrollView initWithFrame:](v6, "initWithFrame:");
  scrollView = v3->_scrollView;
  v3->_scrollView = v7;

  -[SSSScrollView setShowsHorizontalScrollIndicator:](v3->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[SSSScrollView setShowsVerticalScrollIndicator:](v3->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[SSSScrollView setPagingEnabled:](v3->_scrollView, "setPagingEnabled:", 0);
  -[SSSScrollView setClipsToBounds:](v3->_scrollView, "setClipsToBounds:", 0);
  -[SSSScrollView setHitTestsUsingSubviews:](v3->_scrollView, "setHitTestsUsingSubviews:", 1);
  -[SSSScrollView setDelegate:](v3->_scrollView, "setDelegate:", v3);
  -[SSSScrollView setDecelerationRate:](v3->_scrollView, "setDecelerationRate:", UIScrollViewDecelerationRateFast);
  -[SSSScrollView setDelegate:](v3->_scrollView, "setDelegate:", v3);
  -[SSSScreenshotsView addSubview:](v3, "addSubview:", v3->_scrollView);
  v9 = (UIView *)objc_alloc_init((Class)UIView);
  layoutPositioningView = v3->_layoutPositioningView;
  v3->_layoutPositioningView = v9;

  -[UIView setHidden:](v3->_layoutPositioningView, "setHidden:", 1);
  -[SSSScrollView addSubview:](v3->_scrollView, "addSubview:", v3->_layoutPositioningView);
  v11 = objc_alloc_init(SSSShadowView);
  shadowView = v3->_shadowView;
  v3->_shadowView = v11;

  -[SSSScreenshotsView insertSubview:belowSubview:](v3, "insertSubview:belowSubview:", v3->_shadowView, v3->_scrollView);
  v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  screenshotViews = v3->_screenshotViews;
  v3->_screenshotViews = (NSMutableArray *)v13;

  size = CGRectNull.size;
  v3->_keyboardFrame.origin = CGRectNull.origin;
  v3->_keyboardFrame.size = size;
  v3->_lastPageForSignificantChange = -1;
  v16 = objc_alloc_init(SSSPassthroughView);
  rulerHostingView = v3->_rulerHostingView;
  v3->_rulerHostingView = &v16->super;

  -[UIView setClipsToBounds:](v3->_rulerHostingView, "setClipsToBounds:", 1);
  -[SSSScreenshotsView addSubview:](v3, "addSubview:", v3->_rulerHostingView);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v18, "addObserver:selector:name:object:", v3, "_keyboardWillShow:", UIKeyboardWillShowNotification, 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v19, "addObserver:selector:name:object:", v3, "_keyboardWillHide:", UIKeyboardWillHideNotification, 0);

  v20 = objc_alloc_init(_SSSPDFThumbnailView);
  pdfThumbnailView = v3->_pdfThumbnailView;
  v3->_pdfThumbnailView = v20;

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SSSScreenshotsView;
  -[SSSScreenshotsView dealloc](&v4, "dealloc");
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;

  if (self->_shouldUpdateActivityItemsAfterScrollAnimation)
  {
    self->_shouldUpdateActivityItemsAfterScrollAnimation = 0;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsView delegate](self, "delegate", a3));
    objc_msgSend(v4, "activityItemsChangedForScreenshotsView:", self);

  }
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)snapshotScreenshotEdits
{
  return self->_snapshotScreenshotEdits;
}

- (VKCImageAnalyzer)imageAnalyzer
{
  return self->_imageAnalyzer;
}

- (void)setImageAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_imageAnalyzer, a3);
}

- (unint64_t)interactionMode
{
  return self->_interactionMode;
}

- (UINavigationBar)topBar
{
  return self->_topBar;
}

- (id)shareItemTarget
{
  return objc_loadWeakRetained(&self->_shareItemTarget);
}

- (SEL)shareItemAction
{
  return self->_shareItemAction;
}

- (id)undoItemTarget
{
  return objc_loadWeakRetained(&self->_undoItemTarget);
}

- (SEL)undoItemAction
{
  return self->_undoItemAction;
}

- (id)redoItemTarget
{
  return objc_loadWeakRetained(&self->_redoItemTarget);
}

- (SEL)redoItemAction
{
  return self->_redoItemAction;
}

- (BOOL)showsShadow
{
  return self->_showsShadow;
}

- (BOOL)screenshotViewsUseTrilinearMinificationFilter
{
  return self->_screenshotViewsUseTrilinearMinificationFilter;
}

- (SSSScreenshotsViewDelegate)delegate
{
  return (SSSScreenshotsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)currentScreenshotCropHandlesFadedOut
{
  return self->_currentScreenshotCropHandlesFadedOut;
}

- (UIView)rulerHostingView
{
  return self->_rulerHostingView;
}

- (BOOL)isSharing
{
  return self->_isSharing;
}

- (BOOL)isPerformingFullscreenSetup
{
  return self->_isPerformingFullscreenSetup;
}

- (void)setIsPerformingFullscreenSetup:(BOOL)a3
{
  self->_isPerformingFullscreenSetup = a3;
}

- (SSSScreenshotView)appearingScreenshotView
{
  return (SSSScreenshotView *)objc_loadWeakRetained((id *)&self->_appearingScreenshotView);
}

- (void)setAppearingScreenshotView:(id)a3
{
  objc_storeWeak((id *)&self->_appearingScreenshotView, a3);
}

- (SSSScreenshotView)activeScreenshotView
{
  return self->_activeScreenshotView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeScreenshotView, 0);
  objc_destroyWeak((id *)&self->_appearingScreenshotView);
  objc_storeStrong((id *)&self->_rulerHostingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_redoItemTarget);
  objc_destroyWeak(&self->_undoItemTarget);
  objc_destroyWeak(&self->_shareItemTarget);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_screenshotViews, 0);
  objc_storeStrong((id *)&self->_layoutPositioningView, 0);
  objc_storeStrong((id *)&self->_pdfThumbnailView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_countIndicator, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_toolPalette, 0);
  objc_storeStrong((id *)&self->_thumbnailBackgroundView, 0);
  objc_storeStrong((id *)&self->_actionInfoView, 0);
  objc_storeStrong((id *)&self->_visualSearchCornerView, 0);
  objc_storeStrong((id *)&self->_liveTextButton, 0);
  objc_storeStrong((id *)&self->_visualSearchButton, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_bottomBarSeparatorLine, 0);
  objc_storeStrong((id *)&self->_topBarSeparatorLine, 0);
  objc_storeStrong((id *)&self->_bottomBar, 0);
  objc_storeStrong((id *)&self->_topBarEmptyBackgroundImage, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
}

@end
