@implementation AVPlaybackContentTransitioningView

- (AVPlaybackContentTransitioningView)initWithFrame:(CGRect)a3 activeContentView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  AVPlaybackContentContainerView *v9;
  AVPlaybackContentTransitioningView *v10;
  double v11;
  double v12;
  AVPlaybackContentContainerView *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (AVPlaybackContentContainerView *)a4;
  v15.receiver = self;
  v15.super_class = (Class)AVPlaybackContentTransitioningView;
  v10 = -[AVPlaybackContentTransitioningView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v13 = v9;
    if (!v9)
      v13 = -[AVPlaybackContentContainerView initWithFrame:activeContentView:]([AVPlaybackContentContainerView alloc], "initWithFrame:activeContentView:", 0, v11, v12, width, height);
    objc_storeStrong((id *)&v10->_activeContentView, v13);
    if (!v9)

    -[AVPlaybackContentContainerView setFrame:](v10->_activeContentView, "setFrame:", v11, v12, width, height);
    -[AVPlaybackContentTransitioningView setContentInsetAdjustmentBehavior:](v10, "setContentInsetAdjustmentBehavior:", 2);
    -[AVPlaybackContentTransitioningView setPagingEnabled:](v10, "setPagingEnabled:", 1);
    -[AVPlaybackContentTransitioningView setDelegate:](v10, "setDelegate:", v10);
    -[AVPlaybackContentTransitioningView setShowsHorizontalScrollIndicator:](v10, "setShowsHorizontalScrollIndicator:", 0);
    -[AVPlaybackContentTransitioningView setShowsVerticalScrollIndicator:](v10, "setShowsVerticalScrollIndicator:", 0);
    -[AVPlaybackContentTransitioningView _setInterpageSpacing:](v10, "_setInterpageSpacing:", 24.0, 0.0);
    -[AVPlaybackContentTransitioningView setAlwaysBounceHorizontal:](v10, "setAlwaysBounceHorizontal:", 1);
    -[AVPlaybackContentTransitioningView setDirectionalLockEnabled:](v10, "setDirectionalLockEnabled:", 1);
  }

  return v10;
}

- (void)setPlayingOnSecondScreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_playingOnSecondScreen = a3;
  -[AVPlaybackContentTransitioningView activeContentView](self, "activeContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlayingOnSecondScreen:", v3);

  -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlayingOnSecondScreen:", v3);

}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackContentTransitioningView;
  -[AVPlaybackContentTransitioningView setDelegate:](&v3, sel_setDelegate_, a3);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  char v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVPlaybackContentTransitioningView;
  if (-[AVPlaybackContentTransitioningView gestureRecognizerShouldBegin:](&v9, sel_gestureRecognizerShouldBegin_, v4))
  {
    -[AVPlaybackContentTransitioningView panGestureRecognizer](self, "panGestureRecognizer");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      -[AVPlaybackContentTransitioningView contentTransitioningDelegate](self, "contentTransitioningDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", self);
      v6 = objc_msgSend(v7, "contentTransitioningViewShouldBeginDragging:locationInView:", self);

    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackContentTransitioningView;
  -[AVPlaybackContentTransitioningView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AVPlaybackContentTransitioningView _updateTransitionStateIfPossible](self, "_updateTransitionStateIfPossible");
}

- (CGRect)videoContentFrame
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

  -[AVPlaybackContentTransitioningView activeContentView](self, "activeContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoContentFrame");
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

- (void)setVideoContentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVPlaybackContentTransitioningView activeContentView](self, "activeContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVideoContentFrame:", x, y, width, height);

  -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVideoContentFrame:", x, y, width, height);

}

- (void)setVideoGravity:(int64_t)a3 removingAllSublayerTransformAnimations:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;

  v4 = a4;
  -[AVPlaybackContentTransitioningView activeContentView](self, "activeContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVideoGravity:removingAllSublayerTransformAnimations:", a3, v4);

  -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVideoGravity:removingAllSublayerTransformAnimations:", a3, v4);

}

- (void)setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[AVPlaybackContentTransitioningView activeContentView](self, "activeContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:", v3);

  -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:", v3);

}

- (BOOL)canShowStatusBarBackgroundGradientWhenStatusBarVisible
{
  void *v2;
  char v3;

  -[AVPlaybackContentTransitioningView activeContentView](self, "activeContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowStatusBarBackgroundGradientWhenStatusBarVisible");

  return v3;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  CGRect v16;
  CGRect v17;

  x = a5->x;
  y = a5->y;
  -[AVPlaybackContentTransitioningView contentSize](self, "contentSize", a3, a4.x, a4.y);
  v10 = v9;
  -[AVPlaybackContentTransitioningView bounds](self, "bounds");
  if (v10 == CGRectGetWidth(v16)
    || (-[AVPlaybackContentTransitioningView contentSize](self, "contentSize"), x <= v11 * 0.5))
  {
    v14 = *MEMORY[0x1E0C9D538];
    y = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[AVPlaybackContentTransitioningView contentSize](self, "contentSize");
    v13 = v12;
    -[AVPlaybackContentTransitioningView bounds](self, "bounds");
    v14 = v13 - CGRectGetWidth(v17);
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v14, y);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackContentTransitioningView setTargetContentOffset:](self, "setTargetContentOffset:", v15);

  a5->x = v14;
  a5->y = y;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[AVPlaybackContentTransitioningView setTransitionInteractive:](self, "setTransitionInteractive:", 1);
  -[AVPlaybackContentTransitioningView setTargetContentOffset:](self, "setTargetContentOffset:", 0);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[AVPlaybackContentTransitioningView setTargetContentOffset:](self, "setTargetContentOffset:", 0);
  -[AVPlaybackContentTransitioningView setTransitionInteractive:](self, "setTransitionInteractive:", 0);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[AVPlaybackContentTransitioningView setTransitionInteractive:](self, "setTransitionInteractive:", 0);
}

- (void)_setTransitionState:(id)a3 transitionDirection:(id)a4 transitionProgress:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int64_t transitionState;
  int64_t transitionDirection;
  double transitionProgress;
  unint64_t v15;
  int64_t v16;
  double v17;
  double v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  AVPlaybackContentContainerView *v30;
  AVPlaybackContentContainerView *incomingContentView;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  AVPlaybackContentTransitioningView *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _BOOL4 v52;
  NSObject *v53;
  AVPlaybackContentTransitioningView *v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  _BOOL4 v71;
  AVPlaybackContentTransitioningView *v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  AVPlaybackContentTransitioningView *v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  _BOOL4 v90;
  NSObject *v91;
  AVPlaybackContentTransitioningView *v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  double v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  _BOOL4 v109;
  AVPlaybackContentTransitioningView *v110;
  double v111;
  CGFloat v112;
  double v113;
  CGFloat v114;
  double v115;
  CGFloat v116;
  double v117;
  CGFloat v118;
  AVPlaybackContentTransitioningView *v119;
  double v120;
  CGFloat v121;
  double v122;
  CGFloat v123;
  double v124;
  CGFloat v125;
  double v126;
  CGFloat v127;
  _BOOL4 v128;
  void *v129;
  AVPlaybackContentTransitioningView *v130;
  void *v131;
  void *v132;
  void *v133;
  AVPlaybackContentTransitioningView *v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  _BOOL4 v143;
  double MinX;
  double v145;
  double v146;
  _BOOL4 v147;
  _BOOL4 v148;
  void *v149;
  int v150;
  void *v151;
  AVPlaybackContentContainerView *v152;
  void *v153;
  void *v154;
  AVPlaybackContentContainerView *v155;
  AVPlaybackContentContainerView *activeContentView;
  AVPlaybackContentContainerView *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  _QWORD v162[7];
  uint8_t buf[4];
  void *v164;
  __int16 v165;
  void *v166;
  uint64_t v167;
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

  v167 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v161 = v8;
  if (-[AVPlaybackContentTransitioningView _isAdjustingBoundsOrContentSize](self, "_isAdjustingBoundsOrContentSize"))
  {
    _AVLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_ERROR, "Attempt to transition while adjusting bounds.", buf, 2u);
    }

    v8 = v161;
  }
  transitionState = self->_transitionState;
  transitionDirection = self->_transitionDirection;
  transitionProgress = self->_transitionProgress;
  v15 = transitionState;
  if (v8)
    v15 = objc_msgSend(v8, "integerValue");
  v16 = transitionDirection;
  if (v9)
    v16 = objc_msgSend(v9, "integerValue");
  v17 = transitionProgress;
  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    v17 = v18;
  }
  v160 = v10;
  v19 = v9;
  if (!-[AVPlaybackContentTransitioningView _canTransitionFromState:toState:](self, "_canTransitionFromState:toState:", transitionState, v15))
  {
    _AVLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[AVPlaybackContentTransitioningView _descriptionForState:](self, "_descriptionForState:", transitionState);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlaybackContentTransitioningView _descriptionForState:](self, "_descriptionForState:", v15);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v164 = v159;
      v165 = 2112;
      v166 = v158;
      _os_log_error_impl(&dword_1AC4B1000, v20, OS_LOG_TYPE_ERROR, "Invalid state transition from %@ to %@.", buf, 0x16u);

    }
  }
  if (v15 <= 7)
  {
    if (((1 << v15) & 0x27) != 0)
    {
      v17 = 0.0;
    }
    else if (((1 << v15) & 0x58) != 0)
    {
      v17 = fmin(fmax(v17, 0.0), 1.0);
    }
    else
    {
      v17 = 1.0;
    }
  }
  self->_transitionDirection = v16;
  self->_transitionProgress = v17;
  self->_transitionState = v15;
  v162[0] = MEMORY[0x1E0C809B0];
  v162[1] = 3221225472;
  v162[2] = __97__AVPlaybackContentTransitioningView__setTransitionState_transitionDirection_transitionProgress___block_invoke;
  v162[3] = &unk_1E5BB32F0;
  v162[5] = v15;
  v162[6] = transitionState;
  v162[4] = self;
  -[AVPlaybackContentTransitioningView _performBoundsOrContentSizeAdjustment:](self, "_performBoundsOrContentSizeAdjustment:", v162);
  -[AVPlaybackContentTransitioningView _makeStateDescription](self, "_makeStateDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackContentTransitioningView setStateDescription:](self, "setStateDescription:", v21);

  -[AVPlaybackContentTransitioningView contentTransitioningDelegate](self, "contentTransitioningDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentTransitioningViewDidChangeTransitionStatus:oldState:oldTransitionDirection:oldProgress:", self, transitionState, transitionDirection, transitionProgress);

  if (v15 != self->_transitionState)
  {
    _AVLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v23, OS_LOG_TYPE_ERROR, "This is where the problem is.", buf, 2u);
    }

  }
  v24 = v19;
  switch(v15)
  {
    case 0uLL:
      if (v16)
      {
        v25 = &unk_1E5BF3780;
        goto LABEL_110;
      }
      goto LABEL_112;
    case 1uLL:
      if (!v16)
      {
        _AVLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1AC4B1000, v26, OS_LOG_TYPE_ERROR, "Invalid state transition", buf, 2u);
        }

      }
      -[AVPlaybackContentTransitioningView contentTransitioningDelegate](self, "contentTransitioningDelegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "contentTransitioningView:shouldBeginTransitionWithDirection:", self, v16);

      if (v28)
      {
        -[AVPlaybackContentTransitioningView contentTransitioningDelegate](self, "contentTransitioningDelegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "contentTransitioningPlayerContentViewForTransition:", self);
        v30 = (AVPlaybackContentContainerView *)objc_claimAutoreleasedReturnValue();
        incomingContentView = self->_incomingContentView;
        self->_incomingContentView = v30;

        -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setPlayingOnSecondScreen:", -[AVPlaybackContentTransitioningView isPlayingOnSecondScreen](self, "isPlayingOnSecondScreen"));

        -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVPlaybackContentTransitioningView activeContentView](self, "activeContentView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:", objc_msgSend(v34, "canShowStatusBarBackgroundGradientWhenStatusBarVisible"));

        -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "playerLayerView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVPlaybackContentTransitioningView activeContentView](self, "activeContentView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "playerLayerView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setVideoGravity:", objc_msgSend(v38, "videoGravity"));

        goto LABEL_100;
      }
      v25 = &unk_1E5BF37B0;
      goto LABEL_65;
    case 2uLL:
      -[AVPlaybackContentTransitioningView targetContentOffset](self, "targetContentOffset");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        -[AVPlaybackContentTransitioningView setTargetContentOffset:](self, "setTargetContentOffset:", 0);
        -[AVPlaybackContentTransitioningView setContentOffset:animated:](self, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
        goto LABEL_112;
      }
      if (transitionDirection == v16)
        goto LABEL_112;
      v25 = &unk_1E5BF37C8;
      goto LABEL_110;
    case 3uLL:
      if (!v16 && transitionState != v15)
      {
        _AVLog();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1AC4B1000, v40, OS_LOG_TYPE_ERROR, "Invalid state transition", buf, 2u);
        }

      }
      -[AVPlaybackContentTransitioningView targetContentOffset](self, "targetContentOffset");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        -[AVPlaybackContentTransitioningView targetContentOffset](self, "targetContentOffset");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "CGPointValue");
        -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
        v43 = self;
        UIPointRoundToViewScale();
        v45 = v44;
        v47 = v46;
        UIPointRoundToViewScale();
        v49 = v48;
        v51 = v50;

        v52 = v47 == v51 && v45 == v49;
      }
      else
      {
        v52 = 0;
      }

      -[AVPlaybackContentTransitioningView targetContentOffset](self, "targetContentOffset");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      if (v132)
      {
        -[AVPlaybackContentTransitioningView targetContentOffset](self, "targetContentOffset");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "CGPointValue");
        -[AVPlaybackContentTransitioningView frameForTransitioningContentView](self, "frameForTransitioningContentView");
        v134 = self;
        UIPointRoundToViewScale();
        v136 = v135;
        v138 = v137;
        UIPointRoundToViewScale();
        v140 = v139;
        v142 = v141;

        v143 = v138 == v142 && v136 == v140;
      }
      else
      {
        v143 = 0;
      }
      v24 = v19;

      -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
      MinX = CGRectGetMinX(v172);
      -[AVPlaybackContentTransitioningView frameForTransitioningContentView](self, "frameForTransitioningContentView");
      v145 = CGRectGetMinX(v173);
      -[AVPlaybackContentTransitioningView contentOffset](self, "contentOffset");
      if (v16 == 3)
      {
        if (transitionDirection != 3)
        {
LABEL_104:
          v147 = v146 >= MinX;
          v148 = v146 <= v145;
          goto LABEL_106;
        }
LABEL_102:
        v147 = v146 <= MinX;
        v148 = v146 >= v145;
        goto LABEL_106;
      }
      if (v16 == 2)
      {
        if (transitionDirection == 2)
          goto LABEL_104;
        goto LABEL_102;
      }
      if (v16)
      {
        v148 = 0;
        v147 = 0;
      }
      else
      {
        v147 = v146 == MinX;
        v148 = v146 == v145;
      }
LABEL_106:
      if (v52 || v147)
      {
        v25 = &unk_1E5BF37E0;
      }
      else
      {
        if (!v143 && !v148)
          goto LABEL_112;
        v25 = &unk_1E5BF37F8;
      }
LABEL_110:
      v130 = self;
      v131 = 0;
      v129 = 0;
LABEL_111:
      -[AVPlaybackContentTransitioningView _setTransitionState:transitionDirection:transitionProgress:](v130, "_setTransitionState:transitionDirection:transitionProgress:", v25, v131, v129);
LABEL_112:

      return;
    case 4uLL:
      if (transitionDirection != v16 && v16)
      {
        _AVLog();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1AC4B1000, v53, OS_LOG_TYPE_ERROR, "Invalid state transition", buf, 2u);
        }

      }
      if ((-[AVPlaybackContentTransitioningView _isHorizontalBouncing](self, "_isHorizontalBouncing") & 1) != 0)
        goto LABEL_112;
      -[AVPlaybackContentTransitioningView bounds](self, "bounds");
      -[AVPlaybackContentTransitioningView _frameExcludingActiveContent](self, "_frameExcludingActiveContent");
      v54 = self;
      UIPointRoundToViewScale();
      v56 = v55;
      v58 = v57;
      UISizeRoundToViewScale();
      v60 = v59;
      v62 = v61;
      self = v54;
      UIPointRoundToViewScale();
      v64 = v63;
      v66 = v65;
      UISizeRoundToViewScale();
      v68 = v67;
      v70 = v69;

      v168.origin.x = v56;
      v168.origin.y = v58;
      v168.size.width = v60;
      v168.size.height = v62;
      v174.origin.x = v64;
      v174.origin.y = v66;
      v174.size.width = v68;
      v174.size.height = v70;
      v71 = CGRectIntersectsRect(v168, v174);

      if (v71)
      {
        -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
        -[AVPlaybackContentTransitioningView bounds](self, "bounds");
        v72 = self;
        UIPointRoundToViewScale();
        v74 = v73;
        v76 = v75;
        UISizeRoundToViewScale();
        v78 = v77;
        v80 = v79;
        v81 = v72;
        UIPointRoundToViewScale();
        v83 = v82;
        v85 = v84;
        UISizeRoundToViewScale();
        v87 = v86;
        v89 = v88;

        v169.origin.x = v74;
        v169.origin.y = v76;
        v169.size.width = v78;
        v169.size.height = v80;
        v175.origin.x = v83;
        v175.origin.y = v85;
        v175.size.width = v87;
        v175.size.height = v89;
        v90 = CGRectEqualToRect(v169, v175);

      }
      else
      {
        v90 = 1;
      }
      -[AVPlaybackContentTransitioningView targetContentOffset](self, "targetContentOffset");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = (!v149
           || -[AVPlaybackContentTransitioningView isDragging](self, "isDragging")
           && (-[AVPlaybackContentTransitioningView isDecelerating](self, "isDecelerating") & 1) == 0
           && -[AVPlaybackContentTransitioningView isTracking](self, "isTracking"))
          && !v90;

      if (!v90)
        goto LABEL_99;
      -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "removeFromSuperview");

      v152 = self->_incomingContentView;
      self->_incomingContentView = 0;

      v25 = &unk_1E5BF3828;
      v131 = &unk_1E5BF37C8;
      v129 = &unk_1E5BF4298;
      goto LABEL_98;
    case 5uLL:
      v25 = &unk_1E5BF37C8;
LABEL_65:
      v129 = &unk_1E5BF4298;
      goto LABEL_66;
    case 6uLL:
      if (transitionDirection != v16 && v16)
      {
        _AVLog();
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1AC4B1000, v91, OS_LOG_TYPE_ERROR, "Invalid state transition", buf, 2u);
        }

      }
      if ((-[AVPlaybackContentTransitioningView _isHorizontalBouncing](self, "_isHorizontalBouncing") & 1) != 0)
        goto LABEL_112;
      -[AVPlaybackContentTransitioningView bounds](self, "bounds");
      -[AVPlaybackContentTransitioningView _frameExcludingTransitioningContent](self, "_frameExcludingTransitioningContent");
      v92 = self;
      UIPointRoundToViewScale();
      v94 = v93;
      v96 = v95;
      UISizeRoundToViewScale();
      v98 = v97;
      v100 = v99;
      self = v92;
      UIPointRoundToViewScale();
      v102 = v101;
      v104 = v103;
      UISizeRoundToViewScale();
      v106 = v105;
      v108 = v107;

      v170.origin.x = v94;
      v170.origin.y = v96;
      v170.size.width = v98;
      v170.size.height = v100;
      v176.origin.x = v102;
      v176.origin.y = v104;
      v176.size.width = v106;
      v176.size.height = v108;
      v109 = CGRectIntersectsRect(v170, v176);

      if (v109)
      {
        -[AVPlaybackContentTransitioningView frameForTransitioningContentView](self, "frameForTransitioningContentView");
        -[AVPlaybackContentTransitioningView bounds](self, "bounds");
        v110 = self;
        UIPointRoundToViewScale();
        v112 = v111;
        v114 = v113;
        UISizeRoundToViewScale();
        v116 = v115;
        v118 = v117;
        v119 = v110;
        UIPointRoundToViewScale();
        v121 = v120;
        v123 = v122;
        UISizeRoundToViewScale();
        v125 = v124;
        v127 = v126;

        v171.origin.x = v112;
        v171.origin.y = v114;
        v171.size.width = v116;
        v171.size.height = v118;
        v177.origin.x = v121;
        v177.origin.y = v123;
        v177.size.width = v125;
        v177.size.height = v127;
        v128 = CGRectEqualToRect(v171, v177);

      }
      else
      {
        v128 = 1;
      }
      -[AVPlaybackContentTransitioningView targetContentOffset](self, "targetContentOffset");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = (!v153
           || -[AVPlaybackContentTransitioningView isDragging](self, "isDragging")
           && (-[AVPlaybackContentTransitioningView isDecelerating](self, "isDecelerating") & 1) == 0
           && -[AVPlaybackContentTransitioningView isTracking](self, "isTracking"))
          && !v128;

      if (v128)
      {
        -[AVPlaybackContentTransitioningView activeContentView](self, "activeContentView");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "removeFromSuperview");

        -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
        v155 = (AVPlaybackContentContainerView *)objc_claimAutoreleasedReturnValue();
        activeContentView = self->_activeContentView;
        self->_activeContentView = v155;

        -[AVPlaybackContentContainerView setPlayingOnSecondScreen:](self->_activeContentView, "setPlayingOnSecondScreen:", -[AVPlaybackContentTransitioningView isPlayingOnSecondScreen](self, "isPlayingOnSecondScreen"));
        v157 = self->_incomingContentView;
        self->_incomingContentView = 0;

        v25 = &unk_1E5BF3810;
        v131 = &unk_1E5BF37C8;
        v129 = &unk_1E5BF42A8;
LABEL_98:
        v130 = self;
        goto LABEL_111;
      }
LABEL_99:
      if (!v150)
        goto LABEL_112;
LABEL_100:
      v25 = &unk_1E5BF3798;
      goto LABEL_110;
    case 7uLL:
      v25 = &unk_1E5BF37C8;
      v129 = &unk_1E5BF42A8;
LABEL_66:
      v130 = self;
      v131 = 0;
      goto LABEL_111;
    default:
      goto LABEL_112;
  }
}

- (void)performTransition:(int64_t)a3
{
  int64_t v5;
  NSObject *v6;
  double v7;
  double Width;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  AVPlaybackContentTransitioningView *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;
  CGRect v20;
  CGRect v21;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = -[AVPlaybackContentTransitioningView transitionState](self, "transitionState");
  if ((unint64_t)(v5 - 1) >= 7)
  {
    if (!v5)
    {
      v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (a3 == 2)
      {
        -[AVPlaybackContentTransitioningView bounds](self, "bounds");
        Width = CGRectGetWidth(v20);
        -[AVPlaybackContentTransitioningView _interpageSpacing](self, "_interpageSpacing");
        v10 = Width + v9;
      }
      else if (a3 == 3)
      {
        -[AVPlaybackContentTransitioningView bounds](self, "bounds");
        v11 = CGRectGetWidth(v21);
        -[AVPlaybackContentTransitioningView _interpageSpacing](self, "_interpageSpacing");
        v10 = -(v11 + v12);
      }
      else
      {
        v10 = *MEMORY[0x1E0C9D538];
      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v10, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlaybackContentTransitioningView setTargetContentOffset:](self, "setTargetContentOffset:", v14);

      -[AVPlaybackContentTransitioningView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v10, v7);
    }
  }
  else
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[AVPlaybackContentTransitioningView stateDescription](self, "stateDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = self;
      v17 = 2112;
      v18 = v13;
      _os_log_error_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_ERROR, "Instance %@ attempted content transition while one was already active. Ignoring. %@", (uint8_t *)&v15, 0x16u);

    }
  }
}

- (void)_updateTransitionStateIfPossible
{
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;

  if (!-[AVPlaybackContentTransitioningView _isAdjustingBoundsOrContentSize](self, "_isAdjustingBoundsOrContentSize"))
  {
    v3 = -[AVPlaybackContentTransitioningView transitionState](self, "transitionState");
    if (v3 <= 7 && ((1 << v3) & 0xA7) != 0)
    {
      if ((-[AVPlaybackContentTransitioningView _isHorizontalBouncing](self, "_isHorizontalBouncing") & 1) != 0)
      {
        v4 = &unk_1E5BF3780;
        goto LABEL_14;
      }
      -[AVPlaybackContentTransitioningView contentOffset](self, "contentOffset");
      v6 = v5;
      v8 = v7;
      -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
      if (v6 == v10 && v8 == v9)
      {
        v4 = &unk_1E5BF37C8;
        goto LABEL_14;
      }
      v11 = (void *)MEMORY[0x1E0CB37E8];
      -[AVPlaybackContentTransitioningView contentOffset](self, "contentOffset");
      v13 = v12;
      -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
      if (v13 <= CGRectGetMinX(v24))
        v14 = 2;
      else
        v14 = 3;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      v14 = -[AVPlaybackContentTransitioningView transitionDirection](self, "transitionDirection");
    }
    objc_msgSend(v11, "numberWithInteger:", v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v23 = v4;
    -[AVPlaybackContentTransitioningView contentSize](self, "contentSize");
    v16 = v15;
    -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
    v17 = v16 - CGRectGetWidth(v25);
    if (v17 > 0.0)
    {
      v18 = objc_msgSend(v23, "integerValue");
      if (v18 == 3)
      {
        v19 = (void *)MEMORY[0x1E0CB37E8];
        -[AVPlaybackContentTransitioningView contentOffset](self, "contentOffset");
        goto LABEL_20;
      }
      if (v18 == 2)
      {
        v19 = (void *)MEMORY[0x1E0CB37E8];
        -[AVPlaybackContentTransitioningView contentOffset](self, "contentOffset");
        v21 = v17 - v20;
LABEL_20:
        objc_msgSend(v19, "numberWithDouble:", v21 / v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
    v22 = 0;
LABEL_21:
    -[AVPlaybackContentTransitioningView _setTransitionState:transitionDirection:transitionProgress:](self, "_setTransitionState:transitionDirection:transitionProgress:", 0, v23, v22);

  }
}

- (void)_performBoundsOrContentSizeAdjustment:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[AVPlaybackContentTransitioningView setBoundsOrContentSizeAdjustmentCount:](self, "setBoundsOrContentSizeAdjustmentCount:", -[AVPlaybackContentTransitioningView boundsOrContentSizeAdjustmentCount](self, "boundsOrContentSizeAdjustmentCount")+ 1);
  v4[2](v4);

  -[AVPlaybackContentTransitioningView setBoundsOrContentSizeAdjustmentCount:](self, "setBoundsOrContentSizeAdjustmentCount:", -[AVPlaybackContentTransitioningView boundsOrContentSizeAdjustmentCount](self, "boundsOrContentSizeAdjustmentCount")- 1);
}

- (BOOL)_isAdjustingBoundsOrContentSize
{
  return -[AVPlaybackContentTransitioningView boundsOrContentSizeAdjustmentCount](self, "boundsOrContentSizeAdjustmentCount") != 0;
}

- (void)_updateSizeAndContentFrame
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  unint64_t v21;
  int64_t v22;
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
  int64_t v33;
  double Width;
  double v35;
  double v36;
  double v37;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  CGFloat v43;
  double MinX;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  _BYTE v58[32];
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
  *(_QWORD *)v58 = v3;
  *(_QWORD *)&v58[8] = v4;
  *(_QWORD *)&v58[16] = v5;
  *(_QWORD *)&v58[24] = v6;
  -[AVPlaybackContentTransitioningView frameForTransitioningContentView](self, "frameForTransitioningContentView");
  v8 = v7;
  v55 = v10;
  v56 = v9;
  v54 = v11;
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v57 = *MEMORY[0x1E0C9D538];
  -[AVPlaybackContentTransitioningView bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = *MEMORY[0x1E0C9D648];
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v21 = -[AVPlaybackContentTransitioningView transitionState](self, "transitionState");
  if (v21 <= 6 && ((1 << v21) & 0x58) != 0)
  {
    v22 = -[AVPlaybackContentTransitioningView transitionDirection](self, "transitionDirection");
    if (v22 == 3)
    {
      -[AVPlaybackContentTransitioningView _interpageSpacing](self, "_interpageSpacing");
      v26 = v25;
      v59.origin.x = v57;
      v59.origin.y = v12;
      v59.size.width = v14;
      v59.size.height = v16;
      v18 = v26 + CGRectGetWidth(v59);
      v20 = v16;
      v19 = v14;
      v23 = v12;
      v24 = v57;
    }
    else if (v22 == 2)
    {
      -[AVPlaybackContentTransitioningView _interpageSpacing](self, "_interpageSpacing");
      v28 = v27;
      v60.origin.x = v18;
      v60.origin.y = v17;
      v60.size.width = v14;
      v60.size.height = v16;
      v24 = v28 + CGRectGetWidth(v60);
      v20 = v16;
      v19 = v14;
      v23 = v12;
    }
    else
    {
      if (v22 == 1)
      {
        v20 = v54;
        v19 = v55;
        v17 = v56;
        v18 = v8;
        v16 = *(double *)&v58[24];
        v14 = *(double *)&v58[16];
        v23 = *(double *)&v58[8];
      }
      else
      {
        v23 = v12;
      }
      v24 = v57;
      if (v22 == 1)
        v24 = *(double *)v58;
    }
  }
  else
  {
    v23 = v12;
    v24 = v57;
  }
  -[AVPlaybackContentTransitioningView setFrameForActiveContentView:](self, "setFrameForActiveContentView:", v24, v23, v14, v16);
  -[AVPlaybackContentTransitioningView setFrameForTransitioningContentView:](self, "setFrameForTransitioningContentView:", v18, v17, v19, v20);
  -[AVPlaybackContentTransitioningView bounds](self, "bounds");
  v30 = v29;
  v32 = v31;
  v33 = -[AVPlaybackContentTransitioningView transitionState](self, "transitionState");
  if ((unint64_t)(v33 - 3) < 2)
  {
LABEL_16:
    -[AVPlaybackContentTransitioningView bounds](self, "bounds");
    Width = CGRectGetWidth(v61);
    -[AVPlaybackContentTransitioningView _interpageSpacing](self, "_interpageSpacing");
    v30 = v35 + Width * 2.0;
    goto LABEL_18;
  }
  if (v33 != 7)
  {
    if (v33 != 6)
      goto LABEL_18;
    goto LABEL_16;
  }
  *(double *)&v58[16] = v55;
  *(double *)&v58[24] = v54;
  *(double *)v58 = v8;
  *(double *)&v58[8] = v56;
LABEL_18:
  -[AVPlaybackContentTransitioningView contentSize](self, "contentSize");
  if (v30 != v37 || v32 != v36)
  {
    -[AVPlaybackContentTransitioningView contentOffset](self, "contentOffset");
    v40 = v39;
    -[AVPlaybackContentTransitioningView setContentSize:](self, "setContentSize:", v30, v32);
    -[AVPlaybackContentTransitioningView bounds](self, "bounds");
    if (v30 > CGRectGetWidth(v62))
    {
      -[AVPlaybackContentTransitioningView bounds](self, "bounds");
      *(_QWORD *)&v58[16] = v41;
      *(_QWORD *)&v58[24] = v42;
      *(CGFloat *)v58 = v57;
      *(double *)&v58[8] = v12;
    }
    v43 = CGRectGetMinX(*(CGRect *)v58) - v40;
    -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
    MinX = CGRectGetMinX(v63);
    -[AVPlaybackContentTransitioningView contentOffset](self, "contentOffset");
    v46 = MinX - v45;
    -[AVPlaybackContentTransitioningView contentOffset](self, "contentOffset");
    v48 = v47;
    v50 = v49 + v46 - v43;
    -[AVPlaybackContentTransitioningView contentOffset](self, "contentOffset");
    if (v50 != v52 || v48 != v51)
      -[AVPlaybackContentTransitioningView setContentOffset:](self, "setContentOffset:", v50, v48);
  }
  -[AVPlaybackContentTransitioningView _ensureContentViews](self, "_ensureContentViews");
}

- (void)_ensureContentViews
{
  void *v3;
  void *v4;
  void *v5;
  AVPlaybackContentTransitioningView *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  AVPlaybackContentTransitioningView *v11;
  id v12;

  -[AVPlaybackContentTransitioningView activeContentView](self, "activeContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
  objc_msgSend(v3, "setFrame:");

  -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackContentTransitioningView frameForTransitioningContentView](self, "frameForTransitioningContentView");
  objc_msgSend(v4, "setFrame:");

  -[AVPlaybackContentTransitioningView activeContentView](self, "activeContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (AVPlaybackContentTransitioningView *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
  {
    -[AVPlaybackContentTransitioningView activeContentView](self, "activeContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackContentTransitioningView addSubview:](self, "addSubview:", v7);

  }
  -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (AVPlaybackContentTransitioningView *)objc_claimAutoreleasedReturnValue();

    if (v11 != self)
    {
      -[AVPlaybackContentTransitioningView incomingContentView](self, "incomingContentView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[AVPlaybackContentTransitioningView addSubview:](self, "addSubview:", v12);

    }
  }
}

- (CGRect)_frameExcludingActiveContent
{
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double Width;
  double MaxX;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect result;

  v3 = (double *)MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[AVPlaybackContentTransitioningView contentSize](self, "contentSize");
  v6 = v5;
  v8 = v7;
  -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
  Width = CGRectGetWidth(v14);
  -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
  if (CGRectGetMinX(v15) == 0.0)
  {
    -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
    MaxX = CGRectGetMaxX(v16);
  }
  else
  {
    MaxX = *v3;
  }
  v11 = v6 - Width;
  v12 = v4;
  v13 = v8;
  result.size.height = v13;
  result.size.width = v11;
  result.origin.y = v12;
  result.origin.x = MaxX;
  return result;
}

- (CGRect)_frameExcludingTransitioningContent
{
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double Width;
  double MaxX;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect result;

  v3 = (double *)MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[AVPlaybackContentTransitioningView contentSize](self, "contentSize");
  v6 = v5;
  v8 = v7;
  -[AVPlaybackContentTransitioningView frameForTransitioningContentView](self, "frameForTransitioningContentView");
  Width = CGRectGetWidth(v14);
  -[AVPlaybackContentTransitioningView frameForTransitioningContentView](self, "frameForTransitioningContentView");
  if (CGRectGetMinX(v15) == 0.0)
  {
    -[AVPlaybackContentTransitioningView frameForTransitioningContentView](self, "frameForTransitioningContentView");
    MaxX = CGRectGetMaxX(v16);
  }
  else
  {
    MaxX = *v3;
  }
  v11 = v6 - Width;
  v12 = v4;
  v13 = v8;
  result.size.height = v13;
  result.size.width = v11;
  result.origin.y = v12;
  result.origin.x = MaxX;
  return result;
}

- (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  BOOL v4;
  unsigned int v5;
  BOOL result;
  BOOL v7;
  _BOOL4 v8;

  switch(a4)
  {
    case 0:
      v4 = (unint64_t)a3 >= 8;
      v5 = 165;
      goto LABEL_10;
    case 1:
      v7 = a3 == 0;
      goto LABEL_12;
    case 2:
      v4 = (unint64_t)a3 >= 8;
      v5 = 6;
      goto LABEL_10;
    case 3:
      v4 = (unint64_t)a3 >= 8;
      v5 = 90;
      goto LABEL_10;
    case 4:
      v4 = (unint64_t)a3 >= 8;
      v5 = 24;
      goto LABEL_10;
    case 5:
      v7 = a3 == 4;
      goto LABEL_12;
    case 6:
      v4 = (unint64_t)a3 >= 8;
      v5 = 72;
LABEL_10:
      v8 = (v5 >> a3) & 1;
      goto LABEL_16;
    case 7:
      v7 = a3 == 6;
LABEL_12:
      LOBYTE(v8) = v7;
      v4 = (unint64_t)a3 >= 8;
LABEL_16:
      result = !v4 && v8;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)setStateDescription:(id)a3
{
  id v4;
  NSString *v5;
  NSString *stateDescription;
  NSObject *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  CGPoint v23;
  CGPoint v24;
  CGPoint v25;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString isEqualToString:](self->_stateDescription, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    stateDescription = self->_stateDescription;
    self->_stateDescription = v5;

    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_stateDescription;
      -[AVPlaybackContentTransitioningView contentOffset](self, "contentOffset");
      NSStringFromCGPoint(v23);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlaybackContentTransitioningView frameForActiveContentView](self, "frameForActiveContentView");
      NSStringFromCGPoint(v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlaybackContentTransitioningView frameForTransitioningContentView](self, "frameForTransitioningContentView");
      NSStringFromCGPoint(v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136316162;
      v13 = "-[AVPlaybackContentTransitioningView setStateDescription:]";
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ Offset: %@ ActiveOrigin: %@ TransitioningOrigin: %@", (uint8_t *)&v12, 0x34u);

    }
  }

}

- (id)_descriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return 0;
  else
    return off_1E5BB2520[a3];
}

- (id)_makeStateDescription
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;

  -[AVPlaybackContentTransitioningView _descriptionForState:](self, "_descriptionForState:", -[AVPlaybackContentTransitioningView transitionState](self, "transitionState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AVPlaybackContentTransitioningView transitionDirection](self, "transitionDirection");
  if (v4 > 3)
    v5 = 0;
  else
    v5 = off_1E5BB2560[v4];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isPlayingOnSecondScreen
{
  return self->_playingOnSecondScreen;
}

- (AVPlaybackContentContainerView)activeContentView
{
  return self->_activeContentView;
}

- (int64_t)transitionState
{
  return self->_transitionState;
}

- (int64_t)transitionDirection
{
  return self->_transitionDirection;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (AVPlaybackContentTransitioningViewDelegate)contentTransitioningDelegate
{
  return (AVPlaybackContentTransitioningViewDelegate *)objc_loadWeakRetained((id *)&self->_contentTransitioningDelegate);
}

- (void)setContentTransitioningDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contentTransitioningDelegate, a3);
}

- (AVPlaybackContentContainerView)incomingContentView
{
  return self->_incomingContentView;
}

- (BOOL)isTransitionInteractive
{
  return self->_transitionInteractive;
}

- (void)setTransitionInteractive:(BOOL)a3
{
  self->_transitionInteractive = a3;
}

- (NSValue)targetContentOffset
{
  return self->_targetContentOffset;
}

- (void)setTargetContentOffset:(id)a3
{
  objc_storeStrong((id *)&self->_targetContentOffset, a3);
}

- (NSString)stateDescription
{
  return self->_stateDescription;
}

- (CGRect)frameForActiveContentView
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameForActiveContentView.origin.x;
  y = self->_frameForActiveContentView.origin.y;
  width = self->_frameForActiveContentView.size.width;
  height = self->_frameForActiveContentView.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameForActiveContentView:(CGRect)a3
{
  self->_frameForActiveContentView = a3;
}

- (CGRect)frameForTransitioningContentView
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameForTransitioningContentView.origin.x;
  y = self->_frameForTransitioningContentView.origin.y;
  width = self->_frameForTransitioningContentView.size.width;
  height = self->_frameForTransitioningContentView.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameForTransitioningContentView:(CGRect)a3
{
  self->_frameForTransitioningContentView = a3;
}

- (int64_t)boundsOrContentSizeAdjustmentCount
{
  return self->_boundsOrContentSizeAdjustmentCount;
}

- (void)setBoundsOrContentSizeAdjustmentCount:(int64_t)a3
{
  self->_boundsOrContentSizeAdjustmentCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDescription, 0);
  objc_storeStrong((id *)&self->_targetContentOffset, 0);
  objc_storeStrong((id *)&self->_incomingContentView, 0);
  objc_destroyWeak((id *)&self->_contentTransitioningDelegate);
  objc_storeStrong((id *)&self->_activeContentView, 0);
}

uint64_t __97__AVPlaybackContentTransitioningView__setTransitionState_transitionDirection_transitionProgress___block_invoke(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(_QWORD *)(result + 40);
  v2 = v1 == 6 || v1 == 4;
  if (!v2 && (v1 != 3 || *(_QWORD *)(result + 48) == 1))
    return objc_msgSend(*(id *)(result + 32), "_updateSizeAndContentFrame");
  return result;
}

@end
