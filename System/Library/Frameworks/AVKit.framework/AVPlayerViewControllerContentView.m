@implementation AVPlayerViewControllerContentView

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AVObservationController *v8;
  AVObservationController *observationController;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVPlayerViewControllerContentView;
  -[AVPlayerViewControllerContentView didMoveToWindow](&v11, sel_didMoveToWindow);
  -[AVScrollingObserver update](self->_scrollingObserver, "update");
  -[AVPlayerViewControllerContentView loadPlaybackControlsViewIfNeeded](self, "loadPlaybackControlsViewIfNeeded");
  -[AVPlayerViewControllerContentView avkit_needsUpdateBackdropCaptureViewHidden](self, "avkit_needsUpdateBackdropCaptureViewHidden");
  -[AVPlayerViewControllerContentView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewControllerContentView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerViewControllerContentView:didMoveToWindow:", self, v4);

  -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerViewControllerContentViewDidMoveToSuperviewOrWindow:", self);

  -[AVPlayerViewControllerContentView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "_addBoundingPathChangeObserver:", self);
  if (!self->_observationController)
  {
    v8 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
    observationController = self->_observationController;
    self->_observationController = v8;

    v10 = -[AVObservationController startObserving:keyPath:includeInitialValue:observationHandler:](self->_observationController, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playbackContentContainerView.activeContentView.playerLayerView.videoBounds"), 0, &__block_literal_global_22236);
    -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](self->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerViewControllerContentViewUpdateContentIntersectionNotification"), 0, 0, &__block_literal_global_56_22238);
  }

}

- (void)setContentOverlayView:(id)a3
{
  UIView *v5;
  UIView *contentOverlayView;
  AVPlayerViewControllerContentView *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  contentOverlayView = self->_contentOverlayView;
  if (contentOverlayView != v5)
  {
    v8 = v5;
    -[UIView superview](contentOverlayView, "superview");
    v7 = (AVPlayerViewControllerContentView *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[UIView removeFromSuperview](self->_contentOverlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentOverlayView, a3);
    -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:]((id *)&self->super.super.super.isa, v8);
    -[AVPlayerViewControllerContentView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  CGFloat height;
  void *v7;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
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
  uint64_t v61;
  double v62;
  double MinY;
  double v64;
  float v65;
  float v66;
  double v67;
  void *v68;
  void *v69;
  AVExternalPlaybackIndicatorView *externalPlaybackIndicatorView;
  void *v71;
  void *v72;
  AVCABackdropLayerView *backdropLayerView;
  UIImageView *audioOnlyIndicatorView;
  double v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  uint64_t v81;
  UIImageView *unsupportedContentIndicatorView;
  double v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  char v103;
  id *v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  int v112;
  double v113;
  double v114;
  void *v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  void *v128;
  void *v129;
  char v130;
  void *v131;
  CGFloat v132;
  CGFloat v133;
  CGFloat v134;
  CGFloat v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  objc_super v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;

  kdebug_trace();
  -[AVPlayerViewControllerContentView bounds](self, "bounds");
  v145 = CGRectInset(v144, 10.0, 43.0);
  x = v145.origin.x;
  y = v145.origin.y;
  width = v145.size.width;
  height = v145.size.height;
  if (CGRectGetWidth(v145) < 49.0
    || (v146.origin.x = x,
        v146.origin.y = y,
        v146.size.width = width,
        v146.size.height = height,
        CGRectGetHeight(v146) < 37.0))
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v142 = height;
  -[AVPlayerViewControllerContentView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerViewControllerContentViewEdgeInsetsForLetterboxedVideo:", self);
  -[AVPlayerViewControllerContentView setEdgeInsetsForLetterboxedContent:](self, "setEdgeInsetsForLetterboxedContent:");

  -[AVPlayerViewControllerContentView addPlaybackContentContainerViewIfNeeded](self, "addPlaybackContentContainerViewIfNeeded");
  if (self)
  {
    -[AVPlayerViewControllerContentView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    if (self->_contentOverlayViewPlacement == 1)
    {
      v138 = y;
      v140 = width;
      v136 = x;
      -[AVPlayerViewControllerContentView playbackContentContainerView](self, "playbackContentContainerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activeContentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "frame");
      if (v17)
      {
        v22 = v18;
        v23 = v19;
        v24 = v20;
        v25 = v21;
        objc_msgSend(v17, "superview");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v17, "superview");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVPlayerViewControllerContentView convertRect:fromView:](self, "convertRect:fromView:", v27, v22, v23, v24, v25);
          v9 = v28;
          v11 = v29;
          v13 = v30;
          v15 = v31;

        }
      }

      x = v136;
      y = v138;
      width = v140;
    }
    -[UIView setFrame:](self->_contentOverlayView, "setFrame:", v9, v11, v13, v15);
    -[AVPlayerViewControllerContentView playbackContentContainerView](self, "playbackContentContainerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v32, "isDescendantOfView:", self))
      goto LABEL_31;
    -[AVPlayerViewControllerContentView bounds](self, "bounds");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    -[AVMobileControlsViewController controlsViewControllerIfChromeless](self->_controlsViewController, "controlsViewControllerIfChromeless");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "viewIfLoaded");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerContentView playbackContentContainerView](self, "playbackContentContainerView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activeContentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "playerLayerView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41 || !v42 || !v45)
    {
LABEL_30:
      objc_msgSend(v32, "setFrame:", v34, v36, v38, v40);

LABEL_31:
      goto LABEL_32;
    }
    objc_msgSend(v41, "contentTabPresentationContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
    {
      v48 = objc_msgSend(v46, "state");
      if (!v48
        || v48 == 2
        && (objc_msgSend(v47, "transitionContext"),
            v49 = (void *)objc_claimAutoreleasedReturnValue(),
            v50 = objc_msgSend(v49, "direction"),
            v49,
            !v50))
      {
        v141 = width;
        objc_msgSend(v47, "presentationHeight");
        -[AVPlayerViewControllerContentView convertPoint:fromView:](self, "convertPoint:fromView:", v42, 0.0, v51);
        v137 = v52;
        objc_msgSend(v41, "unobscuredContentArea");
        -[AVPlayerViewControllerContentView convertRect:fromView:](self, "convertRect:fromView:", v42);
        v134 = v54;
        v135 = v53;
        v132 = v56;
        v133 = v55;
        objc_msgSend(v45, "videoDisplaySize");
        v59 = v58;
        if (v58 != 0.0)
        {
          v60 = v57;
          if (v57 != 0.0)
          {
            v139 = y;
            v61 = objc_msgSend(v45, "videoGravity");
            v62 = v40;
            if ((unint64_t)(v61 - 2) < 2)
              goto LABEL_23;
            if (v61 == 1)
            {
              v62 = v38 / (v59 / v60);
LABEL_23:
              v147.origin.y = v134;
              v147.origin.x = v135;
              v147.size.height = v132;
              v147.size.width = v133;
              MinY = CGRectGetMinY(v147);
              v64 = v40 - MinY - v137;
              v65 = v64;
              v66 = v62;
              width = v141;
              if (v65 > v66 || vabds_f32(v65, v66) < 0.00000011921)
              {
                v67 = MinY + v64 * 0.5;
                v148.origin.x = v34;
                v148.origin.y = v36;
                v148.size.width = v38;
                v148.size.height = v40;
                v36 = v36 + v67 - CGRectGetMidY(v148);
              }
              y = v139;
              goto LABEL_29;
            }
            y = v139;
          }
        }
        width = v141;
      }
    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_32:
  -[AVPlayerViewControllerContentView controlsViewController](self, "controlsViewController");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "viewIfLoaded");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewControllerContentView bounds](self, "bounds");
  objc_msgSend(v69, "setFrame:");

  externalPlaybackIndicatorView = self->_externalPlaybackIndicatorView;
  -[AVPlayerViewControllerContentView bounds](self, "bounds");
  -[AVExternalPlaybackIndicatorView setFrame:](externalPlaybackIndicatorView, "setFrame:");
  -[AVPlayerViewControllerContentView iAdPreRollViewIfLoaded](self, "iAdPreRollViewIfLoaded");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewControllerContentView bounds](self, "bounds");
  objc_msgSend(v71, "setFrame:");

  -[AVPlayerViewControllerContentView interactiveContentOverlayView](self, "interactiveContentOverlayView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewControllerContentView bounds](self, "bounds");
  objc_msgSend(v72, "setFrame:");

  backdropLayerView = self->_backdropLayerView;
  -[AVPlayerViewControllerContentView bounds](self, "bounds");
  -[AVCABackdropLayerView setFrame:](backdropLayerView, "setFrame:");
  -[UIImageView setFrame:](self->_audioOnlyIndicatorView, "setFrame:", x, y, width, v142);
  -[UIImageView setFrame:](self->_unsupportedContentIndicatorView, "setFrame:", x, y, width, v142);
  audioOnlyIndicatorView = self->_audioOnlyIndicatorView;
  v149.origin.x = x;
  v149.origin.y = y;
  v149.size.width = width;
  v149.size.height = v142;
  v75 = CGRectGetWidth(v149);
  -[UIImageView image](self->_audioOnlyIndicatorView, "image");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "size");
  if (v75 < v77)
  {
    -[UIImageView setContentMode:](audioOnlyIndicatorView, "setContentMode:", 1);
  }
  else
  {
    v150.origin.x = x;
    v150.origin.y = y;
    v150.size.width = width;
    v150.size.height = v142;
    v78 = CGRectGetHeight(v150);
    -[UIImageView image](self->_audioOnlyIndicatorView, "image");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "size");
    if (v78 < v80)
      v81 = 1;
    else
      v81 = 4;
    -[UIImageView setContentMode:](audioOnlyIndicatorView, "setContentMode:", v81);

  }
  unsupportedContentIndicatorView = self->_unsupportedContentIndicatorView;
  v151.origin.x = x;
  v151.origin.y = y;
  v151.size.width = width;
  v151.size.height = v142;
  v83 = CGRectGetWidth(v151);
  -[UIImageView image](self->_unsupportedContentIndicatorView, "image");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "size");
  if (v83 < v85)
  {
    -[UIImageView setContentMode:](unsupportedContentIndicatorView, "setContentMode:", 1);
  }
  else
  {
    v152.origin.x = x;
    v152.origin.y = y;
    v152.size.width = width;
    v152.size.height = v142;
    v86 = CGRectGetHeight(v152);
    -[UIImageView image](self->_unsupportedContentIndicatorView, "image");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "size");
    if (v86 < v88)
      v89 = 1;
    else
      v89 = 4;
    -[UIImageView setContentMode:](unsupportedContentIndicatorView, "setContentMode:", v89);

  }
  if (!-[UIView avkit_isVideoGravityFrozen](self, "avkit_isVideoGravityFrozen"))
  {
    -[AVPlayerViewControllerContentView layoutClass](self, "layoutClass");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      -[AVPlayerViewControllerContentView layoutClass](self, "layoutClass");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v91, "unsignedIntegerValue");

      -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v93, "playerViewControllerContentViewShouldApplyAutomaticVideoGravity:", self) & 1) != 0)
      {
        -[AVPlayerViewControllerContentView automaticVideoGravity](self, "automaticVideoGravity");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = AVVideoGravityFromString(v94);
      }
      else
      {
        -[AVPlayerViewControllerContentView targetVideoGravities](self, "targetVideoGravities");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v92);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "objectForKeyedSubscript:", v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = AVVideoGravityFromString(v97);

      }
      v98 = *MEMORY[0x1E0DC49E8];
      v99 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v100 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v101 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      if (-[AVPlayerViewControllerContentView isCoveringWindow](self, "isCoveringWindow"))
      {
        -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend(v102, "playerViewControllerContentViewIsBeingTransitionedFromFullScreen:", self);

        if ((v103 & 1) == 0)
        {
          v104 = (id *)MEMORY[0x1E0DC4730];
          if (!objc_msgSend((id)*MEMORY[0x1E0DC4730], "_isClassic")
            || objc_msgSend(*v104, "_classicMode") == 5)
          {
            -[AVPlayerViewControllerContentView traitCollection](self, "traitCollection");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "displayCornerRadius");
            if (v106 <= 0.0)
            {

            }
            else
            {

              if (v95 == 1)
              {
                -[AVPlayerViewControllerContentView edgeInsetsForLetterboxedContent](self, "edgeInsetsForLetterboxedContent");
                v98 = v107;
                v99 = v108;
                v100 = v109;
                v101 = v110;
              }
            }
          }
        }
      }
      -[AVPlayerViewControllerContentView setVideoContentInset:](self, "setVideoContentInset:", v98, v99, v100, v101);
      -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend(v111, "playerViewControllerContentViewHasActiveTransition:", self);

      if (v112 && objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"))
        -[AVPlayerViewControllerContentView _applyVideoGravityIfNeeded:](self, v95);
      v113 = *MEMORY[0x1E0C9D538];
      v114 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      -[AVPlayerViewControllerContentView playbackContentContainerView](self, "playbackContentContainerView");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "bounds");
      v117 = v116;
      v119 = v118;

      -[AVPlayerViewControllerContentView videoContentInset](self, "videoContentInset");
      v155.origin.x = v113 + v120;
      v155.origin.y = v114 + v121;
      v155.size.width = v117 - (v120 + v122);
      v155.size.height = v119 - (v121 + v123);
      v153.origin.x = v113;
      v153.origin.y = v114;
      v153.size.width = v117;
      v153.size.height = v119;
      v154 = CGRectIntersection(v153, v155);
      v124 = v154.origin.x;
      v125 = v154.origin.y;
      v126 = v154.size.width;
      v127 = v154.size.height;
      -[AVPlayerViewControllerContentView playbackContentContainerView](self, "playbackContentContainerView");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "setVideoContentFrame:", v124, v125, v126, v127);

      -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = objc_msgSend(v129, "playerViewControllerContentViewHasActiveTransition:", self);

      if ((v130 & 1) == 0)
        -[AVPlayerViewControllerContentView _applyVideoGravityIfNeeded:](self, v95);
    }
  }
  -[AVPlayerViewControllerContentView _updateControlsViewContentIntersectionIfNeeded](self);
  v143.receiver = self;
  v143.super_class = (Class)AVPlayerViewControllerContentView;
  -[AVPlayerViewControllerContentView layoutSubviews](&v143, sel_layoutSubviews);
  -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "playerViewControllerContentViewDidLayoutSubviews:", self);

  kdebug_trace();
}

- (AVPlaybackContentContainer)playbackContentContainerView
{
  return self->_playbackContentContainerView;
}

- (NSNumber)layoutClass
{
  void *v3;
  void *v4;
  void *v5;
  double Width;
  uint64_t v7;
  CGRect v9;
  CGRect v10;

  -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerViewControllerContentViewOverrideLayoutClass:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (-[AVPlayerViewControllerContentView isCoveringWindow](self, "isCoveringWindow"))
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      -[AVPlayerViewControllerContentView bounds](self, "bounds");
      Width = CGRectGetWidth(v9);
      -[AVPlayerViewControllerContentView bounds](self, "bounds");
      if (Width <= CGRectGetHeight(v10))
        v7 = 1;
      else
        v7 = 2;
      objc_msgSend(v5, "numberWithUnsignedInteger:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (-[AVPlayerViewControllerContentView _isInAWindow](self, "_isInAWindow"))
    {
      v4 = &unk_1E5BF3960;
    }
    else
    {
      v4 = 0;
    }
  }
  return (NSNumber *)v4;
}

- (BOOL)isCoveringWindow
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double Width;
  CGFloat MaxY;
  double v28;
  double MinX;
  double MinY;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  double Height;
  void *v47;
  double v48;
  double v49;
  CGFloat rect;
  double rect_8;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  -[AVPlayerViewControllerContentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[AVPlayerViewControllerContentView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewControllerContentView bounds](self, "bounds");
  objc_msgSend(v4, "convertRect:fromView:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  rect = v6;
  UIPointRoundToScale();
  UISizeRoundToScale();
  v49 = v13;
  rect_8 = v14;
  -[AVPlayerViewControllerContentView window](self, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "windowScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "statusBarManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "statusBarFrame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[AVPlayerViewControllerContentView bounds](self, "bounds");
  Width = CGRectGetWidth(v52);
  v53.origin.x = v19;
  v53.origin.y = v21;
  v53.size.width = v23;
  v53.size.height = v25;
  MaxY = CGRectGetWidth(v53);
  if (Width != MaxY)
    goto LABEL_6;
  v54.origin.x = rect;
  v54.origin.y = v8;
  v54.size.width = v10;
  v54.size.height = v12;
  MinX = CGRectGetMinX(v54);
  v55.origin.x = v19;
  v55.origin.y = v21;
  v55.size.width = v23;
  v55.size.height = v25;
  MaxY = CGRectGetMinX(v55);
  if (MinX == MaxY)
  {
    v56.origin.x = rect;
    v56.origin.y = v8;
    v56.size.width = v10;
    v56.size.height = v12;
    MinY = CGRectGetMinY(v56);
    v57.origin.x = v19;
    v57.origin.y = v21;
    v57.size.width = v23;
    v57.size.height = v25;
    MaxY = CGRectGetMaxY(v57);
    v31 = MinY > MaxY;
    v32 = v49;
    if (!v31)
    {
      v58.origin.x = rect;
      v58.origin.y = v8;
      v58.size.width = v10;
      v58.size.height = v12;
      v61.origin.x = v19;
      v61.origin.y = v21;
      v61.size.width = v23;
      v61.size.height = v25;
      *(CGRect *)&MaxY = CGRectUnion(v58, v61);
      v32 = v33;
      rect_8 = v34;
    }
  }
  else
  {
LABEL_6:
    v32 = v49;
  }
  -[AVPlayerViewControllerContentView window](self, "window", MaxY, v28);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bounds");
  v37 = v36;
  v39 = v38;

  if (v32 == v37)
  {
    v40 = rect_8;
    if (rect_8 == v39)
      return 1;
  }
  -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate", v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "playerViewControllerContentViewHasActiveTransition:", self);

  if (!v43)
    return 0;
  -[AVPlayerViewControllerContentView window](self, "window");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bounds");

  -[AVPlayerViewControllerContentView window](self, "window");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bounds");
  Height = CGRectGetHeight(v59);
  -[AVPlayerViewControllerContentView window](self, "window");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bounds");
  v48 = CGRectGetWidth(v60);

  return v48 == rect_8 && Height == v32;
}

- (id)gen1Delegate
{
  return objc_loadWeakRetained((id *)&self->_gen1Delegate);
}

- (NSMutableDictionary)targetVideoGravities
{
  return self->_targetVideoGravities;
}

- (id)_playerLayerView
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "playbackContentContainerView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "activeContentView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "playerLayerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setEdgeInsetsForLetterboxedContent:(UIEdgeInsets)a3
{
  self->_edgeInsetsForLetterboxedContent = a3;
}

- (void)loadPlaybackControlsViewIfNeeded
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AVPlayerViewControllerContentView controlsViewController](self, "controlsViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[AVPlayerViewControllerContentView window](self, "window");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = -[AVPlayerViewControllerContentView showsPlaybackControls](self, "showsPlaybackControls");

      if (v5)
      {
        objc_msgSend(v9, "loadViewIfNeeded");
        -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:]((id *)&self->super.super.super.isa, self->_backdropLayerView);
        objc_msgSend(v9, "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:]((id *)&self->super.super.super.isa, v6);

        -[AVPlayerViewControllerContentView _updateCustomControlsViewConstraints]((uint64_t)self);
        -[AVPlayerViewControllerContentView avkit_needsUpdateBackdropCaptureViewHidden](self, "avkit_needsUpdateBackdropCaptureViewHidden");
        -[AVPlayerViewControllerContentView chromeControlsViewController](self, "chromeControlsViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "playbackControlsView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setCustomControlsView:", self->_customControlsView);

        -[AVPlayerViewControllerContentView _updateControlsViewContentIntersectionIfNeeded](self);
      }
    }
  }

}

- (id)chromeControlsViewController
{
  void *v2;
  void *v3;

  -[AVPlayerViewControllerContentView controlsViewController](self, "controlsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controlsViewControllerIfChromed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AVMobileControlsViewController)controlsViewController
{
  return self->_controlsViewController;
}

- (UIEdgeInsets)videoContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_videoContentInset.top;
  left = self->_videoContentInset.left;
  bottom = self->_videoContentInset.bottom;
  right = self->_videoContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setVideoContentInset:(UIEdgeInsets)a3
{
  self->_videoContentInset = a3;
}

- (UIView)interactiveContentOverlayView
{
  return self->_interactiveContentOverlayView;
}

- (UIView)iAdPreRollViewIfLoaded
{
  return self->_iAdPreRollViewIfLoaded;
}

- (void)addPlaybackContentContainerViewIfNeeded
{
  void *v3;
  char v4;
  AVPlayerViewControllerContentView *v5;
  id v6;

  -[AVPlayerViewControllerContentView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "playerViewControllerContentViewIsPlayingOnSecondScreen:", self);

  -[AVPlayerViewControllerContentView playbackContentContainerView](self, "playbackContentContainerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v5 = (AVPlayerViewControllerContentView *)objc_claimAutoreleasedReturnValue();

  if (v5 != self && (v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:]((id *)&self->super.super.super.isa, v6);
    -[AVPlayerViewControllerContentView bounds](self, "bounds");
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }

}

- (AVPlayerViewControllerContentViewDelegate)delegate
{
  return (AVPlayerViewControllerContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_applyVideoGravityIfNeeded:(void *)a1
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[AVPlayerViewControllerContentView _playerLayerView](a1);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v17, "videoGravity") == a2;
  v5 = v17;
  if (!v4)
  {
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v6 = (void *)MEMORY[0x1E0CD28B0];
      objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationDuration");
      objc_msgSend(v6, "setAnimationDuration:");
      v7 = (void *)MEMORY[0x1E0CD28B0];
      v8 = objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationCurve");
      if (v8 > 3)
        v9 = (id *)MEMORY[0x1E0CD3038];
      else
        v9 = (id *)qword_1E5BB4910[v8];
      v11 = *v9;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setAnimationTimingFunction:", v12);
      objc_msgSend(a1, "playbackContentContainerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "gen1Delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "playerViewControllerContentViewHasActiveTransition:", a1);

      objc_msgSend(v13, "setVideoGravity:removingAllSublayerTransformAnimations:", a2, v15);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    else
    {
      objc_msgSend(v17, "setVideoGravity:", a2);
      objc_msgSend(v17, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAllAnimations");

    }
    objc_msgSend(a1, "gen1Delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "playerViewControllerContentViewDidChangeVideoGravity:", a1);

    v5 = v17;
  }

}

- (BOOL)canAutomaticallyZoomLetterboxVideos
{
  return self->_canAutomaticallyZoomLetterboxVideos;
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
  if (self->_showsPlaybackControls != a3)
  {
    self->_showsPlaybackControls = a3;
    -[AVPlayerViewControllerContentView loadPlaybackControlsViewIfNeeded](self, "loadPlaybackControlsViewIfNeeded");
  }
}

- (BOOL)showsPlaybackControls
{
  return self->_showsPlaybackControls;
}

- (void)_insertViewIntoHierarchy:(id *)a1
{
  id v3;
  id v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id *v10;
  uint64_t i;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      objc_msgSend(v3, "superview");
      v5 = (id *)objc_claimAutoreleasedReturnValue();

      if (v5 != a1)
      {
        v12[0] = a1[70];
        v12[1] = a1[52];
        v12[2] = a1[54];
        v12[3] = a1[56];
        v12[4] = a1[53];
        v12[5] = a1[58];
        objc_msgSend(a1[64], "viewIfLoaded");
        v12[6] = objc_claimAutoreleasedReturnValue();
        v6 = 0;
        v7 = 0;
        v12[7] = a1[66];
        while (1)
        {
          v8 = (id)v12[v6];
          if (v8 == v4)
            break;
          v9 = v8;
          objc_msgSend(v8, "superview");
          v10 = (id *)objc_claimAutoreleasedReturnValue();
          if (v10 == a1)
            ++v7;

          if (++v6 == 8)
            goto LABEL_11;
        }
        objc_msgSend(v4, "removeFromSuperview");
        objc_msgSend(a1, "insertSubview:atIndex:", v4, v7);

LABEL_11:
        for (i = 7; i != -1; --i)

      }
    }
  }

}

- (void)_updateCustomControlsViewConstraints
{
  void *v2;
  void *v3;
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
  id v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
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
  id v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _QWORD v70[4];
  _QWORD v71[4];
  _QWORD v72[6];

  v72[4] = *MEMORY[0x1E0C80C00];
  if (!a1 || !*(_QWORD *)(a1 + 528))
    return;
  -[AVPlayerViewControllerContentView _clearCustomControlsViewConstraintsIfNeeded](a1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 528), "avkit_constraintsFromCenterAndDimensionAnchorsToCenterAndDimensionAnchorsOfItem:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = *(id *)(a1 + 512);
  objc_msgSend(*(id *)(a1 + 528), "transportControlsAreaLayoutGuideProvidingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 528), "volumeControlsAreaLayoutGuideProvidingView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 528), "displayModeControlsAreaLayoutGuideProvidingView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || !objc_msgSend(v4, "isViewLoaded"))
    goto LABEL_10;
  objc_msgSend(v4, "transportControlsLayoutItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volumeControlsLayoutItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayModeControlsLayoutItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v6 || !v7 || !v8)
  {

LABEL_10:
    objc_msgSend(v5, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v54);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v51;
    objc_msgSend(v5, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v14;
    objc_msgSend(v5, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v64 = v2;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2] = v17;
    objc_msgSend(v5, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "bottomAnchor");
    v61 = v4;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v60 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v72[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addObjectsFromArray:", v21);

    objc_msgSend(v63, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v55);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v52;
    objc_msgSend(v63, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v23;
    objc_msgSend(v63, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v26;
    objc_msgSend(v63, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addObjectsFromArray:", v30);

    objc_msgSend(v62, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v56);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v53;
    objc_msgSend(v62, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v32;
    objc_msgSend(v62, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v35;
    objc_msgSend(v62, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v70[3] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addObjectsFromArray:", v39);

    v5 = v60;
    v4 = v61;

    v2 = v64;
    goto LABEL_11;
  }
  objc_msgSend(v5, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v10);

  objc_msgSend(v63, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v11);

  objc_msgSend(v62, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v12);

LABEL_11:
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v40 = v2;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v41)
  {
    v43 = v41;
    v44 = *(_QWORD *)v66;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v66 != v44)
          objc_enumerationMutation(v40);
        LODWORD(v42) = 1148813312;
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * v45++), "setPriority:", v42);
      }
      while (v43 != v45);
      v43 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v43);
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v40);
  v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v40);
  v47 = *(void **)(a1 + 456);
  *(_QWORD *)(a1 + 456) = v46;

  objc_msgSend(*(id *)(a1 + 528), "setNeedsUpdateConstraints");
}

- (void)avkit_needsUpdateBackdropCaptureViewHidden
{
  AVCABackdropLayerView *backdropLayerView;

  backdropLayerView = self->_backdropLayerView;
  if (backdropLayerView)
  {
    if (self->_wantsBackdropView)
      -[AVCABackdropLayerView updateActiveBackdropEffectIfGroupLeader](backdropLayerView, "updateActiveBackdropEffectIfGroupLeader");
  }
}

- (void)setShowsAudioOnlyIndicator:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIImageView *v13;
  UIImageView *audioOnlyIndicatorView;
  _QWORD v15[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    *(_DWORD *)buf = 136315650;
    v17 = "-[AVPlayerViewControllerContentView setShowsAudioOnlyIndicator:]";
    v19 = "showsAudioOnlyIndicator";
    v18 = 2080;
    if (v3)
      v6 = "YES";
    v20 = 2080;
    v21 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

  if (v3)
  {
    if (self)
    {
      if (!self->_audioOnlyIndicatorView)
      {
        v7 = objc_alloc(MEMORY[0x1E0DC3890]);
        v8 = (void *)MEMORY[0x1E0DC3870];
        AVBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "imageNamed:inBundle:", CFSTR("AudioOnlyIndicator"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "AV_indicatorForegroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_flatImageWithColor:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (UIImageView *)objc_msgSend(v7, "initWithImage:", v12);
        audioOnlyIndicatorView = self->_audioOnlyIndicatorView;
        self->_audioOnlyIndicatorView = v13;

      }
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__AVPlayerViewControllerContentView_setShowsAudioOnlyIndicator___block_invoke;
    v15[3] = &unk_1E5BB4CA0;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v15);
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_audioOnlyIndicatorView, "removeFromSuperview");
  }
}

- (void)setShowsUnsupportedContentIndicator:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *unsupportedContentIndicatorView;

  if (a3)
  {
    if (self)
    {
      if (!self->_unsupportedContentIndicatorView)
      {
        v4 = objc_alloc(MEMORY[0x1E0DC3890]);
        v5 = (void *)MEMORY[0x1E0DC3870];
        AVBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("UnsupportedContentIndicator"), v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "AV_indicatorForegroundColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_flatImageWithColor:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v9);
        unsupportedContentIndicatorView = self->_unsupportedContentIndicatorView;
        self->_unsupportedContentIndicatorView = v10;

      }
    }
    -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:]((id *)&self->super.super.super.isa, self->_unsupportedContentIndicatorView);
    -[AVPlayerViewControllerContentView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_unsupportedContentIndicatorView, "removeFromSuperview");
  }
}

- (AVScrollingObserver)scrollingObserver
{
  return self->_scrollingObserver;
}

- (void)setWantsBackdropView:(BOOL)a3
{
  AVCABackdropLayerView *v4;
  AVCABackdropLayerView *v5;
  AVCABackdropLayerView *backdropLayerView;

  if (self->_wantsBackdropView != a3)
  {
    self->_wantsBackdropView = a3;
    if (a3 && !self->_backdropLayerView)
    {
      v4 = [AVCABackdropLayerView alloc];
      -[AVPlayerViewControllerContentView bounds](self, "bounds");
      v5 = -[AVCABackdropLayerView initWithFrame:](v4, "initWithFrame:");
      backdropLayerView = self->_backdropLayerView;
      self->_backdropLayerView = v5;

      -[AVCABackdropLayerView setAutoresizingMask:](self->_backdropLayerView, "setAutoresizingMask:", 0);
      -[AVCABackdropLayerView setCaptureOnly:](self->_backdropLayerView, "setCaptureOnly:", 1);
      -[AVPlayerViewControllerContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setCanAutomaticallyZoomLetterboxVideos:(BOOL)a3
{
  self->_canAutomaticallyZoomLetterboxVideos = a3;
}

- (AVPlayerViewControllerContentView)initWithFrame:(CGRect)a3 playbackContentContainerView:(id)a4 targetVideoGravities:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  AVPlayerViewControllerContentView *v14;
  AVPlayerViewControllerContentView *v15;
  uint64_t v16;
  NSMutableDictionary *targetVideoGravities;
  uint64_t v18;
  AVCacheLargestInscribedRectInBoundingPath *cacheLargestInscribedRect;
  AVScrollingObserver *v20;
  AVScrollingObserver *scrollingObserver;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)AVPlayerViewControllerContentView;
  v14 = -[AVPlayerViewControllerContentView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    v14->_wantsBackdropView = 0;
    v14->_canAutomaticallyZoomLetterboxVideos = 1;
    v14->_needsInitialLayout = 1;
    v16 = objc_msgSend(v13, "mutableCopy");
    targetVideoGravities = v15->_targetVideoGravities;
    v15->_targetVideoGravities = (NSMutableDictionary *)v16;

    objc_storeStrong((id *)&v15->_playbackContentContainerView, a4);
    v15->_contentOverlayViewPlacement = 0;
    v18 = objc_opt_new();
    cacheLargestInscribedRect = v15->_cacheLargestInscribedRect;
    v15->_cacheLargestInscribedRect = (AVCacheLargestInscribedRectInBoundingPath *)v18;

    v20 = -[AVScrollingObserver initWithView:]([AVScrollingObserver alloc], "initWithView:", v15);
    scrollingObserver = v15->_scrollingObserver;
    v15->_scrollingObserver = v20;

    -[AVScrollingObserver addDelegate:](v15->_scrollingObserver, "addDelegate:", v15);
  }

  return v15;
}

- (void)setControlsViewController:(id)a3
{
  AVMobileControlsViewController *v5;
  void *v6;
  AVTurboModePlaybackControlsPlaceholderView *v7;
  AVTurboModePlaybackControlsPlaceholderView *turboModePlaybackControlsPlaceholderView;
  void *v9;
  AVMobileControlsViewController *v10;

  v5 = (AVMobileControlsViewController *)a3;
  if (self->_controlsViewController != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_controlsViewController, a3);
    -[AVPlayerViewControllerContentView chromeControlsViewController](self, "chromeControlsViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "turboModeControlsView");
    v7 = (AVTurboModePlaybackControlsPlaceholderView *)objc_claimAutoreleasedReturnValue();
    turboModePlaybackControlsPlaceholderView = self->_turboModePlaybackControlsPlaceholderView;
    self->_turboModePlaybackControlsPlaceholderView = v7;

    -[AVPlayerViewControllerContentView chromeControlsViewController](self, "chromeControlsViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPrefersCompactFullScreenControls:", -[AVPlayerViewControllerContentView styleSheetShouldUseCompactFullScreenItemSize](self, "styleSheetShouldUseCompactFullScreenItemSize"));

    -[AVPlayerViewControllerContentView loadPlaybackControlsViewIfNeeded](self, "loadPlaybackControlsViewIfNeeded");
    v5 = v10;
  }

}

- (AVPlaybackControlsView)playbackControlsView
{
  void *v2;
  void *v3;

  -[AVPlayerViewControllerContentView chromeControlsViewController](self, "chromeControlsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlaybackControlsView *)v3;
}

- (BOOL)styleSheetShouldUseCompactFullScreenItemSize
{
  return self->_styleSheetShouldUseCompactFullScreenItemSize;
}

- (id)avkit_backdropGroupLeader
{
  AVCABackdropLayerView *v3;
  uint64_t v4;
  objc_super v6;

  v3 = self->_backdropLayerView;
  if (!-[AVPlayerViewControllerContentView wantsBackdropView](self, "wantsBackdropView"))
  {
    v6.receiver = self;
    v6.super_class = (Class)AVPlayerViewControllerContentView;
    -[UIView avkit_backdropGroupLeader](&v6, sel_avkit_backdropGroupLeader);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (AVCABackdropLayerView *)v4;
  }
  return v3;
}

- (BOOL)wantsBackdropView
{
  return self->_wantsBackdropView;
}

- (void)setShowsExternalPlaybackIndicator:(BOOL)a3
{
  AVExternalPlaybackIndicatorView *v4;
  AVExternalPlaybackIndicatorView *v5;
  AVExternalPlaybackIndicatorView *externalPlaybackIndicatorView;
  _QWORD v7[5];

  if (a3)
  {
    if (self)
    {
      if (!self->_externalPlaybackIndicatorView)
      {
        v4 = [AVExternalPlaybackIndicatorView alloc];
        -[AVPlayerViewControllerContentView bounds](self, "bounds");
        v5 = -[AVExternalPlaybackIndicatorView initWithFrame:](v4, "initWithFrame:");
        externalPlaybackIndicatorView = self->_externalPlaybackIndicatorView;
        self->_externalPlaybackIndicatorView = v5;

      }
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__AVPlayerViewControllerContentView_setShowsExternalPlaybackIndicator___block_invoke;
    v7[3] = &unk_1E5BB4CA0;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
  }
  else
  {
    -[AVExternalPlaybackIndicatorView removeFromSuperview](self->_externalPlaybackIndicatorView, "removeFromSuperview");
  }
}

- (void)setExternalPlaybackIndicatorTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[AVPlayerViewControllerContentView setExternalPlaybackIndicatorTitle:](self, "setExternalPlaybackIndicatorTitle:", v7);
  -[AVPlayerViewControllerContentView setExternalPlaybackIndicatorSubtitle:](self, "setExternalPlaybackIndicatorSubtitle:", v6);
  -[AVExternalPlaybackIndicatorView setTitleString:subtitleString:](self->_externalPlaybackIndicatorView, "setTitleString:subtitleString:", v7, v6);

}

- (void)setExternalPlaybackIndicatorTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (void)setExternalPlaybackIndicatorSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  BOOL v12;
  void *v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVPlayerViewControllerContentView frame](self, "frame");
  v16.origin.x = v8;
  v16.origin.y = v9;
  v16.size.width = v10;
  v16.size.height = v11;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v12 = CGRectEqualToRect(v15, v16);
  v14.receiver = self;
  v14.super_class = (Class)AVPlayerViewControllerContentView;
  -[AVPlayerViewControllerContentView setFrame:](&v14, sel_setFrame_, x, y, width, height);
  if (!v12)
  {
    -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "playerViewControllerContentViewDidChangeSize:", self);

  }
}

- (void)setGen1Delegate:(id)a3
{
  objc_storeWeak((id *)&self->_gen1Delegate, a3);
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  id v5;

  -[AVPlayerViewControllerContentView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "_removeBoundingPathChangeObserver:", self);
    v4 = v5;
  }

}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewControllerContentView;
  -[AVPlayerViewControllerContentView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[AVScrollingObserver update](self->_scrollingObserver, "update");
  -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerViewControllerContentViewDidMoveToSuperviewOrWindow:", self);

}

- (void)setTargetVideoGravity:(id)a3 forLayoutClass:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v6 = a3;
  -[AVPlayerViewControllerContentView _playerLayerView](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0C8A6D8];
  if (v6)
    v8 = v6;
  v9 = v8;

  v10 = (void *)objc_msgSend(v9, "copy");
  -[AVPlayerViewControllerContentView targetVideoGravities](self, "targetVideoGravities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  -[AVPlayerViewControllerContentView layoutClass](self, "layoutClass");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[AVPlayerViewControllerContentView layoutClass](self, "layoutClass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "unsignedIntegerValue") == a4)
    {
      v16 = objc_msgSend(v7, "videoGravity");
      v17 = AVVideoGravityFromString(v9);

      if (v16 != v17)
      {
        -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "playerViewControllerContentViewShouldApplyAutomaticVideoGravity:", self);

        if (v19)
          -[AVPlayerViewControllerContentView setAutomaticVideoGravity:](self, "setAutomaticVideoGravity:", v9);
        -[AVPlayerViewControllerContentView window](self, "window");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          if ((objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled") & 1) == 0
            && objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled")
            && -[UIView avkit_wantsAnimatedViewTransitions](self, "avkit_wantsAnimatedViewTransitions"))
          {
            v21 = objc_alloc(MEMORY[0x1E0DC3F38]);
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __74__AVPlayerViewControllerContentView_setTargetVideoGravity_forLayoutClass___block_invoke;
            v24[3] = &unk_1E5BB4CA0;
            v24[4] = self;
            v22 = (void *)objc_msgSend(v21, "initWithDuration:curve:animations:", 5, v24, 0.25);
            objc_msgSend(v22, "startAnimation");

          }
          else
          {
            -[AVPlayerViewControllerContentView setNeedsLayout](self, "setNeedsLayout");
            -[AVPlayerViewControllerContentView layoutIfNeeded](self, "layoutIfNeeded");
          }
        }
        else
        {
          objc_msgSend(v7, "setVideoGravity:", AVVideoGravityFromString(v9));
          -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "playerViewControllerContentViewDidChangeVideoGravity:", self);

        }
      }
    }
    else
    {

    }
  }

}

- (void)dealloc
{
  AVObservationController *observationController;
  objc_super v4;

  observationController = self->_observationController;
  if (observationController)
    -[AVObservationController stopAllObservation](observationController, "stopAllObservation");
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewControllerContentView;
  -[AVPlayerViewControllerContentView dealloc](&v4, sel_dealloc);
}

- (NSString)automaticVideoGravity
{
  NSString **p_automaticVideoGravity;
  NSString *automaticVideoGravity;
  CFPropertyListRef v4;
  void *v5;
  void *v6;

  p_automaticVideoGravity = &self->_automaticVideoGravity;
  automaticVideoGravity = self->_automaticVideoGravity;
  if (!automaticVideoGravity)
  {
    v4 = CFPreferencesCopyValue(CFSTR("automaticVideoGravity"), CFSTR("com.apple.avkit"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v5 = (void *)v4;
    if (v4)
      v6 = (void *)v4;
    else
      v6 = (void *)*MEMORY[0x1E0C8A6E0];
    objc_storeStrong((id *)p_automaticVideoGravity, v6);

    automaticVideoGravity = *p_automaticVideoGravity;
  }
  return automaticVideoGravity;
}

- (void)setAutomaticVideoGravity:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = (void *)*MEMORY[0x1E0C8A6E0];
  objc_storeStrong((id *)&self->_automaticVideoGravity, v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.avkit.SharedPreferences"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECF1C60);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v9);

  objc_msgSend(v8, "resume");
  objc_msgSend(v8, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__AVPlayerViewControllerContentView_setAutomaticVideoGravity___block_invoke;
  v12[3] = &unk_1E5BB4CA0;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "setAutomaticVideoGravity:completion:", v4, v12);

}

- (void)setStyleSheetShouldUseCompactFullScreenItemSize:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_styleSheetShouldUseCompactFullScreenItemSize != a3)
  {
    v3 = a3;
    self->_styleSheetShouldUseCompactFullScreenItemSize = a3;
    -[AVPlayerViewControllerContentView chromeControlsViewController](self, "chromeControlsViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrefersCompactFullScreenControls:", v3);

  }
}

- (void)setInteractiveContentOverlayView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_interactiveContentOverlayView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_interactiveContentOverlayView, a3);
    v5 = v6;
    if (v6)
    {
      -[AVPlayerViewControllerContentView addSubview:](self, "addSubview:", v6);
      -[AVPlayerViewControllerContentView setNeedsLayout](self, "setNeedsLayout");
      -[AVPlayerViewControllerContentView layoutIfNeeded](self, "layoutIfNeeded");
      v5 = v6;
    }
  }

}

- (void)setContentOverlayViewPlacement:(unint64_t)a3
{
  if (self->_contentOverlayViewPlacement != a3)
  {
    self->_contentOverlayViewPlacement = a3;
    -[AVPlayerViewControllerContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCustomControlsView:(id)a3
{
  AVPlayerViewControllerCustomControlsView *v5;
  AVPlayerViewControllerCustomControlsView *customControlsView;
  void *v7;
  void *v8;
  AVPlayerViewControllerCustomControlsView *v9;

  v5 = (AVPlayerViewControllerCustomControlsView *)a3;
  customControlsView = self->_customControlsView;
  v9 = v5;
  if (customControlsView != v5)
  {
    -[AVPlayerViewControllerCustomControlsView removeFromSuperview](customControlsView, "removeFromSuperview");
    -[AVPlayerViewControllerContentView _clearCustomControlsViewConstraintsIfNeeded]((uint64_t)self);
    objc_storeStrong((id *)&self->_customControlsView, a3);
    -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:]((id *)&self->super.super.super.isa, v9);
    -[AVPlayerViewControllerContentView _updateCustomControlsViewConstraints]((uint64_t)self);
    -[AVPlayerViewControllerContentView chromeControlsViewController](self, "chromeControlsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackControlsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCustomControlsView:", v9);

  }
}

- (UIView)iAdPreRollView
{
  UIView *iAdPreRollView;
  AVTouchIgnoringView *v4;
  UIView *v5;
  UIView *v6;

  iAdPreRollView = self->_iAdPreRollView;
  if (!iAdPreRollView)
  {
    v4 = [AVTouchIgnoringView alloc];
    -[AVPlayerViewControllerContentView bounds](self, "bounds");
    v5 = -[AVTouchIgnoringView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_iAdPreRollView;
    self->_iAdPreRollView = v5;

    -[UIView setEdgesInsettingLayoutMarginsFromSafeArea:](self->_iAdPreRollView, "setEdgesInsettingLayoutMarginsFromSafeArea:", 0);
    -[AVPlayerViewControllerContentView addSubview:](self, "addSubview:", self->_iAdPreRollView);
    iAdPreRollView = self->_iAdPreRollView;
  }
  return iAdPreRollView;
}

- (void)setPlaybackContentContainerView:(id)a3
{
  AVPlaybackContentContainer *v4;
  AVPlaybackContentContainer *playbackContentContainerView;
  AVPlaybackContentContainer *v6;
  AVPlaybackContentContainer *v7;
  AVPlaybackContentContainer *v8;
  AVPlaybackContentContainer *v9;
  void *v10;
  AVPlaybackContentContainer *v11;

  v4 = (AVPlaybackContentContainer *)a3;
  playbackContentContainerView = self->_playbackContentContainerView;
  if (playbackContentContainerView != v4)
  {
    v11 = v4;
    v6 = v4;
    v7 = self->_playbackContentContainerView;
    self->_playbackContentContainerView = v6;
    v8 = playbackContentContainerView;

    v9 = self->_playbackContentContainerView;
    -[AVPlaybackContentContainer frame](v8, "frame");
    -[AVPlaybackContentContainer setFrame:](v9, "setFrame:");

    -[AVPlayerViewControllerContentView addPlaybackContentContainerViewIfNeeded](self, "addPlaybackContentContainerViewIfNeeded");
    -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerViewControllerContentViewPlaybackContentContainerViewChanged:", self);

    v4 = v11;
  }

}

- (BOOL)isViewDescendantOfPlaybackControlsSubview:(id)a3
{
  AVPlayerViewControllerCustomControlsView *v4;
  void *v5;
  AVPlayerViewControllerCustomControlsView *v6;
  BOOL v7;

  v4 = (AVPlayerViewControllerCustomControlsView *)a3;
  -[AVMobileControlsViewController viewIfLoaded](self->_controlsViewController, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[AVPlayerViewControllerCustomControlsView isDescendantOfView:](v4, "isDescendantOfView:", v5) & 1) != 0)
  {
    -[AVMobileControlsViewController viewIfLoaded](self->_controlsViewController, "viewIfLoaded");
    v6 = (AVPlayerViewControllerCustomControlsView *)objc_claimAutoreleasedReturnValue();

    if (v6 != v4)
    {
      v7 = 1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  if (-[AVPlayerViewControllerCustomControlsView isDescendantOfView:](v4, "isDescendantOfView:", self->_customControlsView))v7 = self->_customControlsView != v4;
  else
    v7 = 0;
LABEL_8:

  return v7;
}

- (void)removeTurboModePlaybackControlsPlaceholderViewIfNeeded
{
  -[AVTurboModePlaybackControlsPlaceholderView removeFromSuperview](self->_turboModePlaybackControlsPlaceholderView, "removeFromSuperview");
  -[AVTurboModePlaybackControlsPlaceholderView setPlayerController:](self->_turboModePlaybackControlsPlaceholderView, "setPlayerController:", 0);
  -[AVCABackdropLayerView setForceLowQualityEffect:](self->_backdropLayerView, "setForceLowQualityEffect:", 0);
}

- (BOOL)avkit_hasFullScreenLayoutClass
{
  void *v2;
  BOOL v3;

  -[AVPlayerViewControllerContentView layoutClass](self, "layoutClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue") == 1 || objc_msgSend(v2, "unsignedIntegerValue") == 2;

  return v3;
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  -[AVCacheLargestInscribedRectInBoundingPath clearCache](self->_cacheLargestInscribedRect, "clearCache", a3, a4);
  -[AVPlayerViewControllerContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)scrollingObserverDidChangeScrollingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AVCABackdropLayerView updateActiveBackdropEffectIfGroupLeader](self->_backdropLayerView, "updateActiveBackdropEffectIfGroupLeader", a3);
  -[AVPlayerViewControllerContentView gen1Delegate](self, "gen1Delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerViewControllerContentViewDidUpdateScrollingStatus:", self);

  -[AVPlayerViewControllerContentView playbackControlsView](self, "playbackControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "volumeButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsUpdateGlyphRenderingMode");

  -[AVTurboModePlaybackControlsPlaceholderView volumeButton](self->_turboModePlaybackControlsPlaceholderView, "volumeButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsUpdateGlyphRenderingMode");

}

- (UIView)contentOverlayView
{
  return self->_contentOverlayView;
}

- (unint64_t)contentOverlayViewPlacement
{
  return self->_contentOverlayViewPlacement;
}

- (AVPlayerViewControllerCustomControlsView)customControlsView
{
  return self->_customControlsView;
}

- (UIEdgeInsets)edgeInsetsForLetterboxedContent
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsetsForLetterboxedContent.top;
  left = self->_edgeInsetsForLetterboxedContent.left;
  bottom = self->_edgeInsetsForLetterboxedContent.bottom;
  right = self->_edgeInsetsForLetterboxedContent.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (AVCacheLargestInscribedRectInBoundingPath)cacheLargestInscribedRect
{
  return self->_cacheLargestInscribedRect;
}

- (void)setCacheLargestInscribedRect:(id)a3
{
  objc_storeStrong((id *)&self->_cacheLargestInscribedRect, a3);
}

- (BOOL)needsInitialLayout
{
  return self->_needsInitialLayout;
}

- (void)setNeedsInitialLayout:(BOOL)a3
{
  self->_needsInitialLayout = a3;
}

- (NSString)externalPlaybackIndicatorTitle
{
  return self->_externalPlaybackIndicatorTitle;
}

- (NSString)externalPlaybackIndicatorSubtitle
{
  return self->_externalPlaybackIndicatorSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalPlaybackIndicatorSubtitle, 0);
  objc_storeStrong((id *)&self->_externalPlaybackIndicatorTitle, 0);
  objc_storeStrong((id *)&self->_cacheLargestInscribedRect, 0);
  objc_storeStrong((id *)&self->_iAdPreRollViewIfLoaded, 0);
  objc_storeStrong((id *)&self->_interactiveContentOverlayView, 0);
  objc_storeStrong((id *)&self->_playbackContentContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_targetVideoGravities, 0);
  objc_storeStrong((id *)&self->_scrollingObserver, 0);
  objc_storeStrong((id *)&self->_customControlsView, 0);
  objc_storeStrong((id *)&self->_controlsViewController, 0);
  objc_storeStrong((id *)&self->_automaticVideoGravity, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_destroyWeak((id *)&self->_gen1Delegate);
  objc_storeStrong((id *)&self->_turboModePlaybackControlsPlaceholderView, 0);
  objc_storeStrong((id *)&self->_backdropLayerView, 0);
  objc_storeStrong((id *)&self->_customControlsViewLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_unsupportedContentIndicatorView, 0);
  objc_storeStrong((id *)&self->_iAdPreRollView, 0);
  objc_storeStrong((id *)&self->_externalPlaybackIndicatorView, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);
  objc_storeStrong((id *)&self->_audioOnlyIndicatorView, 0);
}

- (void)_updateControlsViewContentIntersectionIfNeeded
{
  _QWORD v1[4];
  id v2;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __83__AVPlayerViewControllerContentView__updateControlsViewContentIntersectionIfNeeded__block_invoke;
    v1[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v2, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v1);
    objc_destroyWeak(&v2);
    objc_destroyWeak(&location);
  }
}

void __83__AVPlayerViewControllerContentView__updateControlsViewContentIntersectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v15 = WeakRetained;
    objc_msgSend(WeakRetained, "controlsViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "controlsViewControllerIfChromeless");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "viewIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerContentView _playerLayerView](v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 && v5)
    {
      objc_msgSend(v5, "videoBounds");
      objc_msgSend(v4, "convertRect:fromView:", v6);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(v4, "bounds");
      v18.origin.x = v8;
      v18.origin.y = v10;
      v18.size.width = v12;
      v18.size.height = v14;
      v17 = CGRectIntersection(v16, v18);
      objc_msgSend(v4, "setContentIntersection:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
    }

    WeakRetained = v15;
  }

}

void __63__AVPlayerViewControllerContentView__startObservationsIfNeeded__block_invoke_2(int a1, id val)
{
  -[AVPlayerViewControllerContentView _updateControlsViewContentIntersectionIfNeeded](val);
}

void __63__AVPlayerViewControllerContentView__startObservationsIfNeeded__block_invoke(int a1, id val)
{
  -[AVPlayerViewControllerContentView _updateControlsViewContentIntersectionIfNeeded](val);
}

- (void)_clearCustomControlsViewConstraintsIfNeeded
{
  void *v2;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 456))
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
      v2 = *(void **)(a1 + 456);
      *(_QWORD *)(a1 + 456) = 0;

    }
  }
}

uint64_t __74__AVPlayerViewControllerContentView_setTargetVideoGravity_forLayoutClass___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __71__AVPlayerViewControllerContentView_setShowsExternalPlaybackIndicator___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(id **)(a1 + 32);
  v5 = v2[54];
  objc_msgSend(v2, "externalPlaybackIndicatorTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "externalPlaybackIndicatorSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleString:subtitleString:", v3, v4);

  -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:](*(id **)(a1 + 32), v5);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");

}

uint64_t __64__AVPlayerViewControllerContentView_setShowsAudioOnlyIndicator___block_invoke(uint64_t a1)
{
  -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:](*(id **)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 416));
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

uint64_t __62__AVPlayerViewControllerContentView_setAutomaticVideoGravity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

@end
