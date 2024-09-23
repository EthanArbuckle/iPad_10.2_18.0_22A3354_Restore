@implementation AVMobileChromelessControlsView

- (AVMobileChromelessControlsView)init
{
  char *v2;
  AVMobileChromelessControlsView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessControlsView;
  v2 = -[AVView init](&v6, sel_init);
  v3 = (AVMobileChromelessControlsView *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 584) = 0u;
    *(_OWORD *)(v2 + 600) = 0u;
    v4 = (void *)*((_QWORD *)v2 + 77);
    *((_QWORD *)v2 + 77) = 0;

    *(_QWORD *)&v3->_layoutConfiguration.contentTabPresented = 0;
    v3->_layoutConfiguration.contentTabsLayout = 0;
    v3->_layoutConfiguration.contentTabPresentationHeight = 0.0;
    v3->_layoutAllowed = 1;
  }
  return v3;
}

- (void)setLayoutAllowed:(BOOL)a3
{
  if (self->_layoutAllowed != a3)
  {
    self->_layoutAllowed = a3;
    if (a3)
      -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLayoutConfiguration:(AVMobileChromelessControlsLayoutConfiguration *)a3
{
  AVMobileChromelessControlsLayoutConfiguration *p_layoutConfiguration;
  double controlsPadding;
  NSArray **p_pinnedAuxiliaryControls;
  NSArray *pinnedAuxiliaryControls;
  _BOOL4 contentTabPresented;
  BOOL *p_contentTabPresented;
  double contentTabPresentationHeight;
  unint64_t v11;
  int v12;
  double v13;
  unint64_t v14;
  NSArray *v15;
  double v21;
  __int128 v22;
  __int128 v23;
  unint64_t auxiliaryControlsPlacement;
  int expanded;
  unint64_t includedControls;

  p_layoutConfiguration = &self->_layoutConfiguration;
  includedControls = self->_layoutConfiguration.includedControls;
  expanded = self->_layoutConfiguration.expanded;
  controlsPadding = self->_layoutConfiguration.controlsPadding;
  auxiliaryControlsPlacement = self->_layoutConfiguration.auxiliaryControlsPlacement;
  p_pinnedAuxiliaryControls = &self->_layoutConfiguration.pinnedAuxiliaryControls;
  pinnedAuxiliaryControls = self->_layoutConfiguration.pinnedAuxiliaryControls;
  p_contentTabPresented = &self->_layoutConfiguration.contentTabPresented;
  contentTabPresented = self->_layoutConfiguration.contentTabPresented;
  contentTabPresentationHeight = self->_layoutConfiguration.contentTabPresentationHeight;
  v11 = a3->includedControls;
  v12 = a3->expanded;
  v13 = a3->controlsPadding;
  v14 = a3->auxiliaryControlsPlacement;
  v15 = a3->pinnedAuxiliaryControls;
  if (expanded != v12
    || includedControls != v11
    || auxiliaryControlsPlacement != v14
    || controlsPadding != v13
    || pinnedAuxiliaryControls != v15
    || contentTabPresented != a3->contentTabPresented)
  {

LABEL_19:
    v22 = *(_OWORD *)&a3->controlsPadding;
    *(_OWORD *)&p_layoutConfiguration->includedControls = *(_OWORD *)&a3->includedControls;
    *(_OWORD *)&p_layoutConfiguration->controlsPadding = v22;
    objc_storeStrong((id *)p_pinnedAuxiliaryControls, a3->pinnedAuxiliaryControls);
    v23 = *(_OWORD *)&a3->contentTabPresented;
    *((_QWORD *)p_contentTabPresented + 2) = *(_QWORD *)&a3->contentTabPresentationHeight;
    *(_OWORD *)p_contentTabPresented = v23;
    -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_20;
  }
  v21 = a3->contentTabPresentationHeight;

  if (contentTabPresentationHeight != v21)
    goto LABEL_19;
LABEL_20:

}

- (void)setAuxiliaryControlsView:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id *p_auxiliaryControlsView;
  NSObject *v9;
  id v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Error: auxiliaryControlsView is already a subview of another view.", buf, 2u);
    }

  }
  p_auxiliaryControlsView = (id *)&self->_auxiliaryControlsView;
  if (self->_auxiliaryControlsView)
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Error: auxiliaryControlsView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    v10 = *p_auxiliaryControlsView;
  }
  else
  {
    v10 = 0;
  }
  if (v10 != v5)
  {
    objc_msgSend(v10, "removeFromSuperview");
    objc_storeStrong((id *)&self->_auxiliaryControlsView, a3);
    objc_msgSend(*p_auxiliaryControlsView, "setHidden:", 1);
    -[AVMobileChromelessControlsView addSubview:](self, "addSubview:", *p_auxiliaryControlsView);
    -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setBackgroundView:(id)a3
{
  AVMobileChromelessBackgroundGradientView *v5;
  void *v6;
  NSObject *v7;
  AVMobileChromelessBackgroundGradientView **p_backgroundView;
  NSObject *v9;
  AVMobileChromelessBackgroundGradientView *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = (AVMobileChromelessBackgroundGradientView *)a3;
  -[AVMobileChromelessBackgroundGradientView superview](v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Error: backgroundView is already a subview of another view.", buf, 2u);
    }

  }
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView)
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Error: backgroundView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    v10 = *p_backgroundView;
  }
  else
  {
    v10 = 0;
  }
  if (v10 != v5)
  {
    -[AVMobileChromelessBackgroundGradientView removeFromSuperview](v10, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[AVMobileChromelessControlsView addSubview:](self, "addSubview:", *p_backgroundView);
    -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setContentTabsView:(id)a3
{
  AVMobileChromelessContentTabsView *v5;
  void *v6;
  NSObject *v7;
  AVMobileChromelessContentTabsView *contentTabsView;
  uint8_t v9[16];

  v5 = (AVMobileChromelessContentTabsView *)a3;
  -[AVMobileChromelessContentTabsView superview](v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Error: contentTabView is already a subview of another view.", v9, 2u);
    }

  }
  contentTabsView = self->_contentTabsView;
  if (contentTabsView != v5)
  {
    -[AVMobileChromelessContentTabsView removeFromSuperview](contentTabsView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentTabsView, a3);
    -[AVMobileChromelessControlsView addSubview:](self, "addSubview:", self->_contentTabsView);
    -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setDisplayModeControlsView:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id *p_displayModeControlsView;
  NSObject *v9;
  id v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Error: displayModeControlsView is already a subview of another view.", buf, 2u);
    }

  }
  p_displayModeControlsView = (id *)&self->_displayModeControlsView;
  if (self->_displayModeControlsView)
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Error: displayModeControlsView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    v10 = *p_displayModeControlsView;
  }
  else
  {
    v10 = 0;
  }
  if (v10 != v5)
  {
    objc_msgSend(v10, "removeFromSuperview");
    objc_storeStrong((id *)&self->_displayModeControlsView, a3);
    objc_msgSend(*p_displayModeControlsView, "setHidden:", 1);
    -[AVMobileChromelessControlsView addSubview:](self, "addSubview:", *p_displayModeControlsView);
    -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setLiveEdgeContentTagView:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id *p_liveEdgeContentTagView;
  NSObject *v9;
  id v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Error: liveEdgeContentTagView is already a subview of another view.", buf, 2u);
    }

  }
  p_liveEdgeContentTagView = (id *)&self->_liveEdgeContentTagView;
  if (self->_liveEdgeContentTagView)
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Error: liveEdgeContentTagView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    v10 = *p_liveEdgeContentTagView;
  }
  else
  {
    v10 = 0;
  }
  if (v10 != v5)
  {
    objc_msgSend(v10, "removeFromSuperview");
    objc_storeStrong((id *)&self->_liveEdgeContentTagView, a3);
    objc_msgSend(*p_liveEdgeContentTagView, "setHidden:", 1);
    -[AVMobileChromelessControlsView addSubview:](self, "addSubview:", *p_liveEdgeContentTagView);
    -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPlaybackControlsView:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id *p_playbackControlsView;
  NSObject *v9;
  id v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Error: playbackControlsView is already a subview of another view.", buf, 2u);
    }

  }
  p_playbackControlsView = (id *)&self->_playbackControlsView;
  if (self->_playbackControlsView)
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Error: playbackControlsView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    v10 = *p_playbackControlsView;
  }
  else
  {
    v10 = 0;
  }
  if (v10 != v5)
  {
    objc_msgSend(v10, "removeFromSuperview");
    objc_storeStrong((id *)&self->_playbackControlsView, a3);
    objc_msgSend(*p_playbackControlsView, "setHidden:", 1);
    -[AVMobileChromelessControlsView addSubview:](self, "addSubview:", *p_playbackControlsView);
    -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTimelineView:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id *p_timelineView;
  NSObject *v9;
  id v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Error: timelineView is already a subview of another view.", buf, 2u);
    }

  }
  p_timelineView = (id *)&self->_timelineView;
  if (self->_timelineView)
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Error: timelineView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    v10 = *p_timelineView;
  }
  else
  {
    v10 = 0;
  }
  if (v10 != v5)
  {
    objc_msgSend(v10, "removeFromSuperview");
    objc_storeStrong((id *)&self->_timelineView, a3);
    objc_msgSend(*p_timelineView, "setHidden:", 1);
    -[AVMobileChromelessControlsView addSubview:](self, "addSubview:", *p_timelineView);
    -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTitlebarView:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id *p_titlebarView;
  NSObject *v9;
  id v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Error: titlebarView is already a subview of another view.", buf, 2u);
    }

  }
  p_titlebarView = (id *)&self->_titlebarView;
  if (self->_titlebarView)
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Error: titlebarView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    v10 = *p_titlebarView;
  }
  else
  {
    v10 = 0;
  }
  if (v10 != v5)
  {
    objc_msgSend(v10, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titlebarView, a3);
    objc_msgSend(*p_titlebarView, "setHidden:", 1);
    -[AVMobileChromelessControlsView addSubview:](self, "addSubview:", *p_titlebarView);
    -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setVolumeControlsView:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id *p_volumeControlsView;
  NSObject *v9;
  id v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Error: volumeControlsView is already a subview of another view.", buf, 2u);
    }

  }
  p_volumeControlsView = (id *)&self->_volumeControlsView;
  if (self->_volumeControlsView)
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Error: volumeControlsView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    v10 = *p_volumeControlsView;
  }
  else
  {
    v10 = 0;
  }
  if (v10 != v5)
  {
    objc_msgSend(v10, "removeFromSuperview");
    objc_storeStrong((id *)&self->_volumeControlsView, a3);
    objc_msgSend(*p_volumeControlsView, "setHidden:", 1);
    -[AVMobileChromelessControlsView addSubview:](self, "addSubview:", *p_volumeControlsView);
    -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t includedControls;
  uint64_t v16;
  unint64_t auxiliaryControlsPlacement;
  NSArray *v18;
  _BOOL4 contentTabPresented;
  _BOOL4 contentTabTransitioning;
  unint64_t contentTabsLayout;
  NSArray *v22;
  BOOL v23;
  double v24;
  AVMobileChromelessPlaybackControlsView *v25;
  uint64_t v26;
  double v27;
  double v28;
  float v29;
  float v30;
  float v31;
  CGFloat v33;
  double MaxY;
  double v35;
  CGFloat v36;
  AVMobileChromelessDisplayModeControlsView *v37;
  AVMobileChromelessVolumeControlsView *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  _BOOL4 v49;
  unsigned int v50;
  unsigned int v51;
  double v52;
  double v53;
  NSArray *v54;
  AVMobileAuxiliaryControlsView *v55;
  AVMobileChromelessTimelineView *v56;
  AVMobileTitlebarView *v57;
  unint64_t v58;
  double v59;
  NSArray *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  _BOOL4 v67;
  double v68;
  double v69;
  _BOOL4 v70;
  double v71;
  double v72;
  BOOL v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  int v79;
  NSObject *v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  double v90;
  NSArray *v91;
  AVMobileAuxiliaryControlsView *v92;
  AVMobileContentTagView *v93;
  AVMobileChromelessTimelineView *v94;
  AVMobileTitlebarView *v95;
  uint64_t v96;
  NSArray *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  unint64_t v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  int v114;
  char v115;
  double v116;
  void *v118;
  double v119;
  double v120;
  double v121;
  double v122;
  CGFloat MidY;
  double v124;
  float v125;
  float v126;
  float v127;
  float v128;
  double v129;
  double v130;
  float v131;
  float v132;
  float v133;
  float v134;
  BOOL v135;
  double v136;
  char v137;
  BOOL v139;
  unint64_t v140;
  uint64x2_t v141;
  int16x8_t v142;
  void *v143;
  void *v144;
  uint64_t i;
  id v146;
  void *v147;
  int v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  char v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  char v158;
  void *v159;
  uint64_t j;
  int v161;
  void *v162;
  CGFloat r1;
  double v164;
  uint64_t v165;
  double v166;
  unint64_t v167;
  NSArray *v168;
  _BOOL4 v169;
  double MinY;
  double v171;
  double v172;
  CGFloat rect;
  unint64_t recta;
  double rectb;
  double v176;
  CGFloat v177;
  double contentTabPresentationHeight;
  double v179;
  double height;
  double width;
  double y;
  double x;
  double controlsPadding;
  double v185;
  double v186;
  NSArray *v187;
  objc_super v188;
  int v189;
  __int16 v190;
  unint64_t v191;
  uint64_t v192;
  double v193;
  unint64_t v194;
  NSArray *v195;
  BOOL v196;
  BOOL v197;
  int v198;
  __int16 v199;
  unint64_t v200;
  double v201;
  unint64_t v202;
  char v203;
  unsigned __int32 v204;
  char v205;
  char v206;
  char v207;
  uint8_t buf[8];
  __int128 v209;
  AVMobileContentTagView *v210;
  AVMobileChromelessPlaybackControlsView *v211;
  AVMobileChromelessTimelineView *v212;
  AVMobileTitlebarView *v213;
  AVMobileChromelessVolumeControlsView *v214;
  uint64_t v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;

  v215 = *MEMORY[0x1E0C80C00];
  if (!-[AVMobileChromelessControlsView layoutAllowed](self, "layoutAllowed"))
    goto LABEL_152;
  -[AVMobileChromelessControlsView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceStyle") == 1 && !CGRectIsNull(self->_contentIntersection))
  {
    y = self->_contentIntersection.origin.y;
    x = self->_contentIntersection.origin.x;
    height = self->_contentIntersection.size.height;
    width = self->_contentIntersection.size.width;
  }
  else
  {
    -[AVMobileChromelessControlsView bounds](self, "bounds");
    y = v5;
    x = v4;
    height = v7;
    width = v6;
  }

  -[AVMobileChromelessControlsView layoutMarginsGuide](self, "layoutMarginsGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutFrame");
  v185 = v9;
  v186 = v10;
  v12 = v11;
  v14 = v13;

  includedControls = self->_layoutConfiguration.includedControls;
  v16 = *(_QWORD *)&self->_layoutConfiguration.expanded;
  controlsPadding = self->_layoutConfiguration.controlsPadding;
  auxiliaryControlsPlacement = self->_layoutConfiguration.auxiliaryControlsPlacement;
  v18 = self->_layoutConfiguration.pinnedAuxiliaryControls;
  contentTabPresented = self->_layoutConfiguration.contentTabPresented;
  contentTabTransitioning = self->_layoutConfiguration.contentTabTransitioning;
  v189 = *(_DWORD *)(&self->_layoutConfiguration.contentTabTransitioning + 1);
  v190 = *(_WORD *)(&self->_layoutConfiguration.contentTabTransitioning + 5);
  contentTabsLayout = self->_layoutConfiguration.contentTabsLayout;
  contentTabPresentationHeight = self->_layoutConfiguration.contentTabPresentationHeight;
  v22 = v18;
  v202 = 0;
  v23 = contentTabPresented && contentTabsLayout == 1;
  v24 = v14;
  if (v23)
  {
    v216.origin.x = v185;
    v216.size.width = v186;
    v216.origin.y = v12;
    v216.size.height = v14;
    v24 = v14 - (contentTabPresentationHeight - CGRectGetMinY(v216));
  }
  v187 = v22;
  v25 = self->_playbackControlsView;
  v26 = -[AVMobileChromelessControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[AVMobileChromelessPlaybackControlsView intrinsicContentSize](v25, "intrinsicContentSize");
  if ((includedControls & 8) != 0)
  {
    v28 = v27;
    v29 = v27;
    v30 = v24;
    v31 = vabds_f32(v29, v30);
    if (v29 < v30 || v31 < 0.00000011921)
    {
      v33 = v12 + (v24 - v28) * 0.5;
      -[UIView avkit_setFrame:inLayoutDirection:](v25, "avkit_setFrame:inLayoutDirection:", v26, v185, v33, v186, v28);
      BYTE4(v202) = 1;

      v217.origin.x = v185;
      v217.origin.y = v12;
      v217.size.width = v186;
      v217.size.height = v14;
      MinY = CGRectGetMinY(v217);
      v218.origin.x = v185;
      v218.origin.y = v12;
      v218.size.width = v186;
      v218.size.height = v14;
      MaxY = CGRectGetMaxY(v218);
      v219.origin.x = v185;
      v219.origin.y = v33;
      v219.size.width = v186;
      v219.size.height = v28;
      v35 = CGRectGetMinY(v219);
      v220.origin.x = v185;
      v220.origin.y = v33;
      v220.size.width = v186;
      v220.size.height = v28;
      v36 = CGRectGetMaxY(v220);
      v165 = v16;
      v169 = contentTabTransitioning;
      v221.origin.y = controlsPadding + v36;
      v221.size.height = MaxY - v36 - controlsPadding;
      v221.origin.x = v185;
      v171 = v221.origin.y;
      v221.size.width = v186;
      v176 = v221.size.height;
      v164 = CGRectGetMinY(v221);
      v168 = v187;
      v37 = self->_displayModeControlsView;
      v38 = self->_volumeControlsView;
      v39 = -[AVMobileChromelessControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
      -[AVMobileChromelessDisplayModeControlsView intrinsicContentSize](v37, "intrinsicContentSize");
      v41 = v40;
      -[AVMobileChromelessVolumeControlsView intrinsicContentSize](v38, "intrinsicContentSize");
      if (v41 >= v42)
        v43 = v41;
      else
        v43 = v42;
      -[AVMobileChromelessDisplayModeControlsView sizeThatFits:](v37, "sizeThatFits:", v186 * 0.5, v43);
      v45 = v44;
      v167 = auxiliaryControlsPlacement;
      v166 = -[AVMobileChromelessControlsView _controlsExpansionYOffset](self);
      v46 = *MEMORY[0x1E0C9D648];
      rect = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v48 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v47 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v49 = v43 <= v35 - MinY - controlsPadding;
      v50 = v49 & (includedControls >> 1);
      if (v50 == 1)
      {
        r1 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        -[UIView avkit_setFrame:inLayoutDirection:](v37, "avkit_setFrame:inLayoutDirection:", v39, v185, MinY - v166, v45, v43);
        v222.origin.x = v46;
        v222.origin.y = rect;
        v222.size.width = v48;
        v222.size.height = r1;
        v234.origin.x = v185;
        v234.origin.y = MinY - v166;
        v234.size.width = v45;
        v234.size.height = v43;
        v223 = CGRectUnion(v222, v234);
        rect = v223.origin.y;
        v46 = v223.origin.x;
        v48 = v223.size.width;
        v47 = v223.size.height;
      }
      v51 = v49 & (includedControls >> 2);
      if (v51)
      {
        -[AVMobileChromelessVolumeControlsView intrinsicContentSize](v38, "intrinsicContentSize");
        if (v52 >= v186 - v45)
          v53 = v186 - v45;
        else
          v53 = v52;
        -[UIView avkit_setFrame:inLayoutDirection:](v38, "avkit_setFrame:inLayoutDirection:", v39, v185 + v186 - v53, MinY - v166, v53, v43);
        v224.origin.x = v46;
        v224.origin.y = rect;
        v224.size.width = v48;
        v224.size.height = v47;
        v235.origin.x = v185 + v186 - v53;
        v235.origin.y = MinY - v166;
        v235.size.width = v53;
        v235.size.height = v43;
        v225 = CGRectUnion(v224, v235);
        rect = v225.origin.y;
        v46 = v225.origin.x;
        v48 = v225.size.width;
        v47 = v225.size.height;
      }
      BYTE2(v202) = v50;
      HIBYTE(v202) = v51;

      v54 = v168;
      if ((contentTabPresented || v169) && self->_contentTabsView && (includedControls & 0x40) != 0)
      {
        v177 = v46;
        v228.origin.x = v46;
        v228.origin.y = rect;
        v228.size.width = v48;
        v228.size.height = v47;
        v81 = controlsPadding + CGRectGetMaxY(v228);
        v191 = includedControls;
        v192 = v165;
        v193 = controlsPadding;
        v194 = v167;
        v195 = v168;
        v196 = contentTabPresented;
        v197 = v169;
        v198 = v189;
        v199 = v190;
        v200 = contentTabsLayout;
        v201 = contentTabPresentationHeight;
        v82 = -[AVMobileChromelessControlsView _layoutContentTabsInFrame:withConfiguration:canFitState:]((id *)&self->super.super.super.super.isa, (double *)&v191, (uint64_t)&v202, v185, v81, v186, v14 - v47);
        v84 = v83;
        v86 = v85;
        v88 = v87;
        v229.origin.y = rect;
        v229.origin.x = v177;
        v229.size.width = v48;
        v229.size.height = v47;
        v89 = CGRectGetMaxY(v229);
        v230.origin.x = v82;
        v230.origin.y = v84;
        v230.size.width = v86;
        v230.size.height = v88;
        v90 = CGRectGetMinY(v230);
        v231.origin.y = rect;
        v231.origin.x = v177;
        v231.size.width = v48;
        v231.size.height = v47;
        v171 = controlsPadding + v89;
        v176 = v90 - controlsPadding - CGRectGetMaxY(v231) - controlsPadding;
      }
      else if ((includedControls & 0x40) != 0)
      {
        v55 = self->_auxiliaryControlsView;
        v56 = self->_timelineView;
        v57 = self->_titlebarView;
        v58 = self->_layoutConfiguration.includedControls;
        v59 = self->_layoutConfiguration.controlsPadding;
        recta = self->_layoutConfiguration.auxiliaryControlsPlacement;
        v60 = self->_layoutConfiguration.pinnedAuxiliaryControls;
        -[AVMobileChromelessTimelineView intrinsicContentSize](v56, "intrinsicContentSize");
        v62 = v61;
        -[AVMobileTitlebarView intrinsicContentSize](v57, "intrinsicContentSize");
        v64 = v63;
        -[AVMobileAuxiliaryControlsView sizeFittingControls:](v55, "sizeFittingControls:", v60);
        v66 = v65;

        v67 = (v58 & 0x10) == 0;
        if ((v58 & 1) != 0)
          v68 = v62;
        else
          v68 = 0.0;
        if (v68 >= v66)
          v69 = v68;
        else
          v69 = v66;
        v70 = recta != 1 || (v58 & 0x10) == 0;
        if (recta == 1)
          v67 = 1;
        if (!v70)
          v68 = v69;
        if ((v58 & 0x20) != 0)
          v71 = v64;
        else
          v71 = 0.0;
        if (v71 >= v66)
          v72 = v71;
        else
          v72 = v66;
        if (!v67)
          v71 = v72;
        v73 = v71 == 0.0 || v68 == 0.0;
        v74 = -0.0;
        if (!v73)
          v74 = v59;
        if (v68 + v71 + 0.0 + v74 >= v176)
        {
          v54 = v168;
        }
        else
        {
          v191 = includedControls;
          v192 = v165;
          v193 = controlsPadding;
          v54 = v168;
          v194 = v167;
          v195 = v168;
          v196 = contentTabPresented;
          v197 = v169;
          v198 = v189;
          v199 = v190;
          v200 = contentTabsLayout;
          v201 = contentTabPresentationHeight;
          v226.origin.x = -[AVMobileChromelessControlsView _layoutContentTabsInFrame:withConfiguration:canFitState:]((id *)&self->super.super.super.super.isa, (double *)&v191, (uint64_t)&v202, v185, v171, v186, v176);
          v75 = v226.origin.x;
          v76 = v226.origin.y;
          v77 = v226.size.width;
          v78 = v226.size.height;
          v79 = BYTE1(v202);
          if ((((v79 != 0) ^ CGRectEqualToRect(v226, *MEMORY[0x1E0C9D628])) & 1) == 0)
          {
            _AVLog();
            v80 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              v161 = BYTE1(v202);
              v233.origin.x = v75;
              v233.origin.y = v76;
              v233.size.width = v77;
              v233.size.height = v78;
              NSStringFromCGRect(v233);
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v161;
              LOWORD(v209) = 2112;
              *(_QWORD *)((char *)&v209 + 2) = v162;
              _os_log_error_impl(&dword_1AC4B1000, v80, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency. Fitting state and layout rect for content tabs UI does not match. canFitContentTabs: %d  contentTabsLayoutFrame: %@", buf, 0x12u);

            }
          }
          if (BYTE1(v202))
          {
            v227.origin.x = v75;
            v227.origin.y = v76;
            v227.size.width = v77;
            v227.size.height = v78;
            v176 = CGRectGetMinY(v227) - v164 - controlsPadding;
            v171 = v164;
          }
        }
      }
      v91 = v54;
      v92 = self->_auxiliaryControlsView;
      v93 = self->_liveEdgeContentTagView;
      v94 = self->_timelineView;
      v95 = self->_titlebarView;
      v96 = -[AVMobileChromelessControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
      v97 = v91;
      -[AVMobileChromelessTimelineView intrinsicContentSize](v94, "intrinsicContentSize");
      if (v176 >= v98)
        v99 = v98;
      else
        v99 = v176;
      -[AVMobileTitlebarView intrinsicContentSize](v95, "intrinsicContentSize");
      v101 = v100;
      -[AVMobileContentTagView intrinsicContentSize](v93, "intrinsicContentSize");
      v103 = v102;
      v179 = -[AVMobileChromelessControlsView _controlsExpansionYOffset](self);
      -[AVMobileAuxiliaryControlsView sizeFittingControls:](v92, "sizeFittingControls:", v97);
      v106 = v105;
      v107 = v104;
      v108 = includedControls & 1;
      v109 = v171 + v176;
      v110 = v99 - controlsPadding;
      v111 = 0.0;
      if ((includedControls & 1) == 0)
        v110 = 0.0;
      v112 = v176 - v110;
      if ((includedControls & 1) != 0)
        v113 = v99;
      else
        v113 = 0.0;
      rectb = v109 - v113;
      if ((includedControls & 0x10) == 0)
        goto LABEL_77;
      if (v167 != 1 && v112 >= v104 && v186 >= v106)
      {
        -[AVMobileTitlebarView title](v95, "title", v186);
        v118 = (void *)objc_claimAutoreleasedReturnValue();

        if (v118)
        {
          -[AVMobileTitlebarView intrinsicContentSize](v95, "intrinsicContentSize");
          v120 = v119;
          -[AVMobileTitlebarView titleLabelCenterYOffset](v95, "titleLabelCenterYOffset");
          v122 = v121;
          v232.origin.x = 0.0;
          v232.origin.y = 0.0;
          v232.size.width = v106;
          v232.size.height = v107;
          MidY = CGRectGetMidY(v232);
          v124 = controlsPadding;
          v111 = rectb - controlsPadding - (v120 - v122) - MidY;
        }
        else
        {
          v124 = controlsPadding;
          v111 = rectb - v107 - controlsPadding;
        }
        v115 = 0;
        v116 = v186 - (v106 + v124 * 1.5);
        v114 = 1;
        goto LABEL_111;
      }
      if (v167 != 1)
      {
        v114 = 0;
        v115 = 1;
        goto LABEL_78;
      }
      v172 = v103;
      v125 = v186 + -150.0;
      v126 = v106;
      if ((v125 > v126 || vabds_f32(v125, v126) < 0.00000011921)
        && ((v127 = v176, v128 = v104, v127 > v128) || vabds_f32(v127, v128) < 0.00000011921))
      {
        v129 = v106;
        v130 = v107;
      }
      else
      {
        -[AVMobileAuxiliaryControlsView sizeFittingControls:](v92, "sizeFittingControls:", MEMORY[0x1E0C9AA60]);
        v131 = v129;
        if (v125 <= v131 && vabds_f32(v125, v131) >= 0.00000011921
          || ((v132 = v112, v133 = v130, v134 = vabds_f32(v132, v133), v132 <= v133)
            ? (v135 = v134 < 0.00000011921)
            : (v135 = 1),
              !v135))
        {
          v114 = 0;
          v115 = 0;
          v116 = v186;
          v103 = v172;
          goto LABEL_111;
        }
        if (v129 == *MEMORY[0x1E0C9D820])
        {
          v103 = v172;
          if (v130 == *(double *)(MEMORY[0x1E0C9D820] + 8))
          {
LABEL_77:
            v114 = 0;
            v115 = 0;
LABEL_78:
            v116 = v186;
LABEL_111:
            if ((includedControls & 0x20) == 0)
              v115 = 1;
            if (v112 < v101)
              v137 = 1;
            else
              v137 = v115;
            if (v108)
              -[UIView avkit_setFrame:inLayoutDirection:](v94, "avkit_setFrame:inLayoutDirection:", v96, v185, v179 + rectb);
            if (v114)
              -[UIView avkit_setFrame:inLayoutDirection:](v92, "avkit_setFrame:inLayoutDirection:", v96, v185 + v186 - v106, v179 + v111, v106, v107);
            if ((v137 & 1) == 0)
              -[UIView avkit_setFrame:inLayoutDirection:](v95, "avkit_setFrame:inLayoutDirection:", v96, v185, v179 + rectb - controlsPadding - v101, v116, v101);
            v139 = v112 >= v103 && v108 != 0;
            LOBYTE(v202) = v114;
            BYTE3(v202) = v139;
            BYTE5(v202) = v108;
            BYTE6(v202) = v137 ^ 1;

            goto LABEL_129;
          }
LABEL_107:
          v115 = 0;
          if (v130 >= v99)
            v136 = v130;
          else
            v136 = v99;
          v112 = v176 - v136 - controlsPadding;
          v111 = v109 - v136 + (v136 - v130) * 0.5;
          rectb = v109 - v136 + (v136 - v99) * 0.5;
          v114 = 1;
          v116 = v186;
          v107 = v130;
          v106 = v129;
          goto LABEL_111;
        }
      }
      v103 = v172;
      goto LABEL_107;
    }
  }
  BYTE4(v202) = 0;

LABEL_129:
  v140 = v202;
  *(_QWORD *)buf = self->_auxiliaryControlsView;
  *(_QWORD *)&v209 = self->_contentTabsView;
  *((_QWORD *)&v209 + 1) = self->_displayModeControlsView;
  v210 = self->_liveEdgeContentTagView;
  v211 = self->_playbackControlsView;
  v212 = self->_timelineView;
  v213 = self->_titlebarView;
  v214 = self->_volumeControlsView;
  v203 = v140 & 1;
  v141 = (uint64x2_t)vdupq_n_s64(v140);
  v142 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v141, (uint64x2_t)xmmword_1AC5F8180), (int32x4_t)vshlq_u64(v141, (uint64x2_t)xmmword_1AC5F8170));
  *(int8x8_t *)v142.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v142), (int8x8_t)0x1000100010001);
  v204 = vmovn_s16(v142).u32[0];
  v205 = BYTE5(v140) & 1;
  v206 = BYTE6(v140) & 1;
  v207 = HIBYTE(v140) & 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 8; ++i)
  {
    v146 = *(id *)&buf[8 * i];
    v147 = v146;
    if (v146)
    {
      v148 = *(&v203 + i);
      if ((v148 == 0) != objc_msgSend(v146, "isHidden"))
      {
        objc_msgSend(v147, "setHidden:", v148 == 0);
        if (v148)
          v149 = v144;
        else
          v149 = v143;
        objc_msgSend(v149, "addObject:", v147);
      }
    }

  }
  if (objc_msgSend(v143, "count"))
  {
    v150 = v143;
    v151 = v150;
    if (v150)
    {
      if (objc_msgSend(v150, "count"))
      {
        -[AVMobileChromelessControlsView delegate](self, "delegate");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = objc_opt_respondsToSelector();

        if ((v153 & 1) != 0)
        {
          -[AVMobileChromelessControlsView delegate](self, "delegate");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "chromelessControlsView:didDetachControlsViews:", self, v151);

        }
      }
    }

  }
  if (objc_msgSend(v144, "count"))
  {
    v155 = v144;
    v156 = v155;
    if (v155)
    {
      if (objc_msgSend(v155, "count"))
      {
        -[AVMobileChromelessControlsView delegate](self, "delegate");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v158 = objc_opt_respondsToSelector();

        if ((v158 & 1) != 0)
        {
          -[AVMobileChromelessControlsView delegate](self, "delegate");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "chromelessControlsView:didAttachControlsViews:", self, v156);

        }
      }
    }

  }
  for (j = 56; j != -8; j -= 8)

  -[AVMobileChromelessBackgroundGradientView setFrame:](self->_backgroundView, "setFrame:", x, y, width, height);
LABEL_152:
  v188.receiver = self;
  v188.super_class = (Class)AVMobileChromelessControlsView;
  -[AVView layoutSubviews](&v188, sel_layoutSubviews);
}

- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3
{
  if (self->_displayModeControlsView == a3 || self->_volumeControlsView == a3)
    -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContentIntersection:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentIntersection;
  void *v9;
  uint64_t v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentIntersection = &self->_contentIntersection;
  if (!CGRectEqualToRect(self->_contentIntersection, a3))
  {
    p_contentIntersection->origin.x = x;
    p_contentIntersection->origin.y = y;
    p_contentIntersection->size.width = width;
    p_contentIntersection->size.height = height;
    -[AVMobileChromelessControlsView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceStyle");

    if (v10 == 1)
      -[AVMobileChromelessControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)layoutAllowed
{
  return self->_layoutAllowed;
}

- (AVMobileAuxiliaryControlsView)auxiliaryControlsView
{
  return self->_auxiliaryControlsView;
}

- (AVMobileChromelessBackgroundGradientView)backgroundView
{
  return self->_backgroundView;
}

- (AVMobileChromelessContentTabsView)contentTabsView
{
  return self->_contentTabsView;
}

- (AVMobileChromelessDisplayModeControlsView)displayModeControlsView
{
  return self->_displayModeControlsView;
}

- (AVMobileContentTagView)liveEdgeContentTagView
{
  return self->_liveEdgeContentTagView;
}

- (AVMobileChromelessPlaybackControlsView)playbackControlsView
{
  return self->_playbackControlsView;
}

- (AVMobileChromelessTimelineView)timelineView
{
  return self->_timelineView;
}

- (AVMobileTitlebarView)titlebarView
{
  return self->_titlebarView;
}

- (AVMobileChromelessVolumeControlsView)volumeControlsView
{
  return self->_volumeControlsView;
}

- (CGRect)contentIntersection
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentIntersection.origin.x;
  y = self->_contentIntersection.origin.y;
  width = self->_contentIntersection.size.width;
  height = self->_contentIntersection.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (AVMobileChromelessControlsLayoutConfiguration)layoutConfiguration
{
  AVMobileChromelessControlsLayoutConfiguration *p_layoutConfiguration;
  __int128 v5;
  AVMobileChromelessControlsLayoutConfiguration *result;

  p_layoutConfiguration = &self->_layoutConfiguration;
  v5 = *(_OWORD *)&self->_layoutConfiguration.controlsPadding;
  *(_OWORD *)&retstr->includedControls = *(_OWORD *)&self->_layoutConfiguration.includedControls;
  *(_OWORD *)&retstr->controlsPadding = v5;
  result = self->_layoutConfiguration.pinnedAuxiliaryControls;
  retstr->pinnedAuxiliaryControls = (NSArray *)result;
  *(_OWORD *)&retstr->contentTabPresented = *(_OWORD *)&p_layoutConfiguration->contentTabPresented;
  retstr->contentTabPresentationHeight = p_layoutConfiguration->contentTabPresentationHeight;
  return result;
}

- (AVMobileChromelessControlsViewDelegate)delegate
{
  return (AVMobileChromelessControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{

  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_volumeControlsView, 0);
  objc_storeStrong((id *)&self->_titlebarView, 0);
  objc_storeStrong((id *)&self->_timelineView, 0);
  objc_storeStrong((id *)&self->_playbackControlsView, 0);
  objc_storeStrong((id *)&self->_liveEdgeContentTagView, 0);
  objc_storeStrong((id *)&self->_displayModeControlsView, 0);
  objc_storeStrong((id *)&self->_contentTabsView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_auxiliaryControlsView, 0);
}

- (double)_layoutContentTabsInFrame:(uint64_t)a3 withConfiguration:(double)a4 canFitState:(double)a5
{
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unsigned int v34;
  NSObject *v35;
  double MaxY;
  NSObject *v38;
  CGFloat r1;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  uint8_t buf[16];
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v14 = a1[61];
  v15 = a2[2];
  objc_msgSend(a1, "layoutMargins");
  v43 = v17;
  v44 = v16;
  v19 = v18;
  v21 = v20;
  v22 = objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection");
  v40 = -[AVMobileChromelessControlsView _controlsExpansionYOffset](a1);
  v41 = a6;
  v42 = a4;
  v46.origin.y = a7;
  objc_msgSend(v14, "intrinsicContentSize");
  v24 = v23;
  v25 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v45 = v15 + v23 + 50.0;
  v46.origin.x = *(CGFloat *)MEMORY[0x1E0C9D628];
  v26 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v27 = *a2;
  if (v46.origin.y < v45)
    goto LABEL_15;
  r1 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v28 = 0.0;
  if ((LOBYTE(v27) & 0x40) != 0)
    v28 = v24;
  v29 = a5 + v46.origin.y - v28;
  if ((LOBYTE(v27) & 0x40) != 0 && v14)
  {
    v30 = a2[7] - v24 - v15 - v21;
    if (v30 >= v46.origin.y - v24 - v15)
      v30 = v46.origin.y - v24 - v15;
    if (v30 >= 50.0)
      v31 = v30;
    else
      v31 = 50.0;
    objc_msgSend(a1, "layoutMargins");
    if (*((_BYTE *)a2 + 41))
    {
      if (!*((_BYTE *)a2 + 40))
      {
        v29 = v29 - (v15 - v44);
        v31 = v31 - (v21 - v15);
LABEL_26:
        objc_msgSend(v14, "setFadeDistance:", v32);
        goto LABEL_27;
      }
    }
    else if (!*((_BYTE *)a2 + 40))
    {
      goto LABEL_26;
    }
    v29 = v29 - (v15 + v31 - v44);
    v31 = v15 + v21 + v24 + v31;
    v32 = 0.0;
    goto LABEL_26;
  }
  v31 = v24;
  if ((LOBYTE(v27) & 0x40) == 0)
  {
LABEL_15:
    v33 = *MEMORY[0x1E0C9D628];
    goto LABEL_16;
  }
LABEL_27:
  objc_msgSend(a1[61], "setLayoutMargins:", v44, v19, v21, v43);
  objc_msgSend(a1[61], "avkit_setFrame:inLayoutDirection:", v22, v42 - v19, v40 + v29, v43 + v41 + v19, v31);
  v48.origin.x = v46.origin.x;
  v48.origin.y = v25;
  v48.size.width = v26;
  v48.size.height = r1;
  v50.origin.x = v42 - v19;
  v50.origin.y = v40 + v29;
  v50.size.width = v43 + v41 + v19;
  v50.size.height = v31;
  *(_QWORD *)&v33 = (unint64_t)CGRectUnion(v48, v50);
  if (*((_BYTE *)a2 + 40))
  {
    objc_msgSend(a1, "bounds");
    MaxY = CGRectGetMaxY(v49);
    if (*((_BYTE *)a2 + 40))
    {
      if (MaxY - (v40 + v29) != a2[7])
      {
        _AVLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1AC4B1000, v38, OS_LOG_TYPE_ERROR, "The content tabs layout frame height does not match the given contentTabsPresentationHeight.", buf, 2u);
        }

      }
    }
  }
LABEL_16:
  if (a3)
  {
    v34 = (LODWORD(v27) >> 6) & 1;
    if (v46.origin.y < v45)
      LOBYTE(v34) = 0;
    *(_BYTE *)(a3 + 1) = v34;
  }
  else
  {
    _AVLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v46.size.width) = 0;
      _os_log_error_impl(&dword_1AC4B1000, v35, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency. AVMobileChromelessControlsViewCanFitState cannot be nil.", (uint8_t *)&v46.size, 2u);
    }

  }
  return v33;
}

- (double)_controlsExpansionYOffset
{
  objc_msgSend(a1, "layoutConfiguration", 0);

  return 0.0;
}

@end
