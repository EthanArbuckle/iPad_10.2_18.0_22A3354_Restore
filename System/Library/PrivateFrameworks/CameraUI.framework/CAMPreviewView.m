@implementation CAMPreviewView

- (CAMPreviewView)initWithFrame:(CGRect)a3
{
  CAMPreviewView *v3;
  void *v4;
  void *v5;
  CAMVideoPreviewView *v6;
  uint64_t v7;
  CAMVideoPreviewView *videoPreviewView;
  CAMInterfaceModulationView *v9;
  CAMInterfaceModulationView *indicatorContainerView;
  CAMPreviewView *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMPreviewView;
  v3 = -[CAMPreviewView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewView setTintColor:](v3, "setTintColor:", v5);

    -[CAMPreviewView setOrientation:](v3, "setOrientation:", 1);
    v6 = [CAMVideoPreviewView alloc];
    v7 = -[CAMVideoPreviewView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    videoPreviewView = v3->_videoPreviewView;
    v3->_videoPreviewView = (CAMVideoPreviewView *)v7;

    -[CAMVideoPreviewView setClipsToBounds:](v3->_videoPreviewView, "setClipsToBounds:", 1);
    -[CAMPreviewView addSubview:](v3, "addSubview:", v3->_videoPreviewView);
    v9 = -[CAMInterfaceModulationView initWithHostingView:]([CAMInterfaceModulationView alloc], "initWithHostingView:", v3);
    indicatorContainerView = v3->_indicatorContainerView;
    v3->_indicatorContainerView = v9;

    -[CAMInterfaceModulationView setClipsToBounds:](v3->_indicatorContainerView, "setClipsToBounds:", 1);
    -[CAMPreviewView addSubview:](v3, "addSubview:", v3->_indicatorContainerView);
    v3->__debugDrawZoomPIP = CFPreferencesGetAppBooleanValue(CFSTR("CAMDebugDrawZoomPIP"), CFSTR("com.apple.camera"), 0) != 0;
    v11 = v3;
  }

  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setVideoPreviewLayer:(id)a3
{
  -[CAMVideoPreviewView setVideoPreviewLayer:](self->_videoPreviewView, "setVideoPreviewLayer:", a3);
}

- (CAMVideoPreviewView)videoPreviewView
{
  return self->_videoPreviewView;
}

- (void)layoutSubviews
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
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
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
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
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  int64_t v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  int64_t v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  objc_super v96;
  CGRect v97;
  CGRect v98;

  v96.receiver = self;
  v96.super_class = (Class)CAMPreviewView;
  -[CAMPreviewView layoutSubviews](&v96, sel_layoutSubviews);
  -[CAMPreviewView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMPreviewView indicatorContainerView](self, "indicatorContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v8;
  v14 = v6;
  v15 = v4;
  if (-[CAMPreviewView indicatorClippingStyle](self, "indicatorClippingStyle") == 1)
  {
    -[CAMPreviewView viewportFrame](self, "viewportFrame");
    v15 = v16;
    v14 = v17;
    v13 = v18;
    v12 = v19;
  }
  -[CAMPreviewView videoPreviewView](self, "videoPreviewView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v6;
  v95 = v4;
  objc_msgSend(v20, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(v11, "setFrame:", v15, v14, v13, v12);
  -[CAMPreviewView _indicatorContainerMask](self, "_indicatorContainerMask");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v11, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(v21, "frame");
    v98.origin.x = v23;
    v98.origin.y = v25;
    v98.size.width = v27;
    v98.size.height = v29;
    if (!CGRectEqualToRect(v97, v98))
    {
      objc_msgSend(v21, "setFrame:", v23, v25, v27, v29);
      -[CAMPreviewView _updateIndicatorContainerMask](self, "_updateIndicatorContainerMask");
    }
  }
  -[CAMPreviewView viewportFrame](self, "viewportFrame");
  UIRectGetCenter();
  -[CAMPreviewView convertPoint:toView:](self, "convertPoint:toView:", v11);
  -[CAMPreviewView continuousIndicator](self, "continuousIndicator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "intrinsicContentSize");
  -[CAMPreviewView traitCollection](self, "traitCollection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "displayScale");
  UIRectCenteredAboutPointScale();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  objc_msgSend(v30, "setFrame:", v33, v35, v37, v39);
  -[CAMPreviewView pointIndicator](self, "pointIndicator");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "intrinsicContentSize");
  objc_msgSend(v40, "setBounds:", 0.0, 0.0, v41, v42);
  -[CAMPreviewView viewportFrame](self, "viewportFrame");
  -[CAMPreviewView convertRect:toView:](self, "convertRect:toView:", v11);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  -[CAMPreviewView gridView](self, "gridView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  CAMViewSetBoundsAndCenterForFrame(v51, v44, v46, v48, v50);

  -[CAMPreviewView levelView](self, "levelView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  CAMViewSetBoundsAndCenterForFrame(v52, v44, v46, v48, v50);

  -[CAMPreviewView horizonLevelView](self, "horizonLevelView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  CAMViewSetBoundsAndCenterForFrame(v53, v44, v46, v48, v50);

  -[CAMPreviewView viewportFrame](self, "viewportFrame");
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v62 = -[CAMPreviewView orientation](self, "orientation");
  -[CAMPreviewView bottomContentInset](self, "bottomContentInset");
  v64 = v63;
  -[CAMPreviewView window](self, "window");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "screen");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "scale");
  +[CAMStageLightOverlayView circleFrameForViewport:orientation:bottomContentInset:screenScale:](CAMStageLightOverlayView, "circleFrameForViewport:orientation:bottomContentInset:screenScale:", v62, v55, v57, v59, v61, v64, v67);

  UIRectGetCenter();
  v69 = v68;
  v71 = v70;
  -[CAMPreviewView centeredSubjectIndicatorView](self, "centeredSubjectIndicatorView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "intrinsicContentSize");
  v74 = v73;
  v76 = v75;
  v77 = -[CAMPreviewView orientation](self, "orientation");
  if ((unint64_t)(v77 - 3) >= 2)
    v78 = v74;
  else
    v78 = v76;
  if ((unint64_t)(v77 - 3) >= 2)
    v74 = v76;
  v80 = *MEMORY[0x1E0C9D538];
  v79 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[CAMPreviewView convertPoint:toView:](self, "convertPoint:toView:", v11, v69, v71);
  objc_msgSend(v72, "setCenter:");
  objc_msgSend(v72, "setBounds:", v80, v79, v78, v74);
  -[CAMPreviewView stageLightOverlayView](self, "stageLightOverlayView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setFrame:", v95, v94, v8, v10);

  -[CAMPreviewView overlayFrame](self, "overlayFrame");
  v83 = v82;
  v85 = v84;
  v87 = v86;
  v89 = v88;
  -[CAMPreviewView stageLightOverlayView](self, "stageLightOverlayView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setViewportFrame:", v83, v85, v87, v89);

  -[CAMPreviewView bottomContentInset](self, "bottomContentInset");
  v92 = v91;
  -[CAMPreviewView stageLightOverlayView](self, "stageLightOverlayView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setBottomContentInset:", v92);

}

- (CAMFocusIndicatorView)continuousIndicator
{
  return self->_continuousIndicator;
}

- (CAMFocusIndicatorView)pointIndicator
{
  return self->_pointIndicator;
}

- (CAMGridView)gridView
{
  return self->_gridView;
}

- (CAMLevelIndicatorView)levelView
{
  return self->_levelView;
}

- (CEKSubjectIndicatorView)centeredSubjectIndicatorView
{
  return self->_centeredSubjectIndicatorView;
}

- (CAMStageLightOverlayView)stageLightOverlayView
{
  return self->_stageLightOverlayView;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (void)setContinuousIndicator:(id)a3
{
  CAMFocusIndicatorView *v5;

  v5 = (CAMFocusIndicatorView *)a3;
  if (self->_continuousIndicator != v5)
  {
    objc_storeStrong((id *)&self->_continuousIndicator, a3);
    -[CAMInterfaceModulationView addSubview:](self->_indicatorContainerView, "addSubview:", v5);
    -[CAMPreviewView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewView;
  -[CAMPreviewView dealloc](&v4, sel_dealloc);
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMPreviewView setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v6[5];

  if (self->_orientation != a3)
  {
    if (a4)
    {
      -[CAMPreviewView layoutIfNeeded](self, "layoutIfNeeded");
      self->_orientation = a3;
      -[CAMPreviewView setNeedsLayout](self, "setNeedsLayout");
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __42__CAMPreviewView_setOrientation_animated___block_invoke;
      v6[3] = &unk_1EA328868;
      v6[4] = self;
      +[CAMView animateIfNeededWithDuration:options:animations:completion:](CAMView, "animateIfNeededWithDuration:options:animations:completion:", 0x20000, v6, 0, 0.35);
    }
    else
    {
      self->_orientation = a3;
      -[CAMPreviewView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __42__CAMPreviewView_setOrientation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setViewportFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_viewportFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_viewportFrame = &self->_viewportFrame;
  if (!CGRectEqualToRect(a3, self->_viewportFrame))
  {
    p_viewportFrame->origin.x = x;
    p_viewportFrame->origin.y = y;
    p_viewportFrame->size.width = width;
    p_viewportFrame->size.height = height;
    -[CAMPreviewView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOverlayFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_overlayFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_overlayFrame = &self->_overlayFrame;
  if (!CGRectEqualToRect(a3, self->_overlayFrame))
  {
    p_overlayFrame->origin.x = x;
    p_overlayFrame->origin.y = y;
    p_overlayFrame->size.width = width;
    p_overlayFrame->size.height = height;
    -[CAMPreviewView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return -[CAMVideoPreviewView videoPreviewLayer](self->_videoPreviewView, "videoPreviewLayer");
}

- (void)setIndicatorClippingStyle:(int64_t)a3
{
  if (self->_indicatorClippingStyle != a3)
  {
    self->_indicatorClippingStyle = a3;
    -[CAMPreviewView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPointIndicator:(id)a3
{
  CAMFocusIndicatorView *v5;

  v5 = (CAMFocusIndicatorView *)a3;
  if (self->_pointIndicator != v5)
  {
    objc_storeStrong((id *)&self->_pointIndicator, a3);
    -[CAMInterfaceModulationView addSubview:](self->_indicatorContainerView, "addSubview:", v5);
    -[CAMPreviewView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)indicatePointOfInterest:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CAMPreviewView *v13;
  uint64_t v14;
  uint64_t v15;

  y = a3.y;
  x = a3.x;
  -[CAMPreviewView pointIndicator](self, "pointIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewView pointForCaptureDevicePointOfInterest:](self, "pointForCaptureDevicePointOfInterest:", x, y);
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__CAMPreviewView_indicatePointOfInterest___block_invoke;
  v11[3] = &unk_1EA32DFB8;
  v14 = v8;
  v15 = v9;
  v12 = v6;
  v13 = self;
  v10 = v6;
  objc_msgSend(v7, "performWithoutAnimation:", v11);

}

uint64_t __42__CAMPreviewView_indicatePointOfInterest___block_invoke(uint64_t a1)
{
  double v2;
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
  double v13;
  double v14;
  double v15;
  double v16;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2 * 0.5;
  v5 = v4 * 0.5;
  UIRoundToViewScale();
  v7 = v6;
  UIRoundToViewScale();
  v8 = v7 + v3;
  v10 = v5 + v9;
  v11 = *(void **)(a1 + 40);
  objc_msgSend(v11, "indicatorContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:toView:", v12, v8, v10);
  v14 = v13;
  v16 = v15;

  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", v14, v16);
}

- (void)setGridView:(id)a3
{
  CAMGridView *v4;
  CAMGridView *gridView;
  void *v6;
  void *v7;
  void *v8;
  CAMGridView *v9;

  v4 = (CAMGridView *)a3;
  gridView = self->_gridView;
  if (gridView != v4)
  {
    v9 = v4;
    -[CAMGridView superview](gridView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewView indicatorContainerView](self, "indicatorContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
      -[CAMGridView removeFromSuperview](self->_gridView, "removeFromSuperview");
    self->_gridView = v9;
    -[CAMPreviewView indicatorContainerView](self, "indicatorContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    v4 = v9;
  }

}

- (void)setLevelView:(id)a3
{
  CAMLevelIndicatorView *v4;
  CAMLevelIndicatorView *levelView;
  void *v6;
  void *v7;
  void *v8;
  CAMLevelIndicatorView *v9;

  v4 = (CAMLevelIndicatorView *)a3;
  levelView = self->_levelView;
  if (levelView != v4)
  {
    v9 = v4;
    -[CAMLevelIndicatorView superview](levelView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewView indicatorContainerView](self, "indicatorContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
      -[CAMLevelIndicatorView removeFromSuperview](self->_levelView, "removeFromSuperview");
    self->_levelView = v9;
    -[CAMPreviewView indicatorContainerView](self, "indicatorContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    v4 = v9;
  }

}

- (void)setHorizonLevelView:(id)a3
{
  CAMHorizonLevelView *v4;
  CAMHorizonLevelView *horizonLevelView;
  void *v6;
  void *v7;
  void *v8;
  CAMHorizonLevelView *v9;

  v4 = (CAMHorizonLevelView *)a3;
  horizonLevelView = self->_horizonLevelView;
  if (horizonLevelView != v4)
  {
    v9 = v4;
    -[CAMHorizonLevelView superview](horizonLevelView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewView indicatorContainerView](self, "indicatorContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
      -[CAMHorizonLevelView removeFromSuperview](self->_horizonLevelView, "removeFromSuperview");
    self->_horizonLevelView = v9;
    -[CAMPreviewView indicatorContainerView](self, "indicatorContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    v4 = v9;
  }

}

- (void)setStageLightOverlayView:(id)a3
{
  CAMStageLightOverlayView *v5;
  CAMStageLightOverlayView *stageLightOverlayView;
  void *v7;
  CAMStageLightOverlayView *v8;

  v5 = (CAMStageLightOverlayView *)a3;
  stageLightOverlayView = self->_stageLightOverlayView;
  v8 = v5;
  if (stageLightOverlayView != v5)
  {
    -[CAMStageLightOverlayView removeFromSuperview](stageLightOverlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_stageLightOverlayView, a3);
    -[CAMPreviewView videoPreviewView](self, "videoPreviewView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v8, v7);

  }
}

- (void)setBottomContentInset:(double)a3
{
  id v4;

  if (self->_bottomContentInset != a3)
  {
    self->_bottomContentInset = a3;
    -[CAMPreviewView stageLightOverlayView](self, "stageLightOverlayView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBottomContentInset:", a3);

  }
}

- (void)setCenteredSubjectIndicatorView:(id)a3
{
  CEKSubjectIndicatorView *v5;
  CEKSubjectIndicatorView *v6;

  v5 = (CEKSubjectIndicatorView *)a3;
  if (self->_centeredSubjectIndicatorView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_centeredSubjectIndicatorView, a3);
    -[CAMInterfaceModulationView addSubview:](self->_indicatorContainerView, "addSubview:", self->_centeredSubjectIndicatorView);
    -[CAMPreviewView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (CGRect)fixedSizeSubjectIndicatorFrameForFaceResult:(id)a3
{
  id v4;
  unsigned int v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MidX;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Width;
  double v24;
  double v25;
  double v26;
  long double v27;
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
  double MidY;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "rollAngle");
  v5 = -[CAMPreviewView _faceOrientationForRollAngle:](self, "_faceOrientationForRollAngle:");
  -[CAMPreviewView faceIndicatorFrameForFaceResult:](self, "faceIndicatorFrameForFaceResult:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v39.origin.x = v7;
  v39.origin.y = v9;
  v39.size.width = v11;
  v39.size.height = v13;
  MidX = CGRectGetMidX(v39);
  v40.origin.x = v7;
  v40.origin.y = v9;
  v40.size.width = v11;
  v40.size.height = v13;
  MidY = CGRectGetMidY(v40);
  v15 = (void *)MEMORY[0x1E0D0D0A0];
  -[CAMPreviewView window](self, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "screen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  objc_msgSend(v15, "fixedSizeWithScale:");
  v19 = v18;
  v21 = v20;

  if ((v5 & 0xFFFFFFFE) == 2)
    v22 = v21;
  else
    v22 = v19;
  if ((v5 & 0xFFFFFFFE) != 2)
    v19 = v21;
  if (v5 - 2 < 2)
  {
    v42.origin.x = v7;
    v42.origin.y = v9;
    v42.size.width = v11;
    v42.size.height = v13;
    Width = CGRectGetWidth(v42);
    v24 = v22;
  }
  else if (v5 > 1)
  {
    v24 = 0.0;
    Width = 0.0;
  }
  else
  {
    v41.origin.x = v7;
    v41.origin.y = v9;
    v41.size.width = v11;
    v41.size.height = v13;
    Width = CGRectGetHeight(v41);
    v24 = v19;
  }
  v25 = v24 * 0.3;
  v26 = v24 - v24 * 0.3;
  v27 = 0.0;
  if (v26 > 0.0)
  {
    v28 = (Width - v25) / v26;
    if (v28 >= 0.0)
    {
      v27 = v28;
      if (v28 > 1.0)
        v27 = 1.0;
    }
  }
  v29 = v25 + pow(v27, 0.3) * (v24 * 0.5 - v25);
  switch(v5)
  {
    case 0u:
      UIRoundToViewScale();
      v31 = v30;
      v32 = MidY - v29;
      break;
    case 1u:
      UIRoundToViewScale();
      v31 = v33;
      v32 = MidY - (v19 - v29);
      break;
    case 2u:
      v31 = MidX - v29;
      goto LABEL_21;
    case 3u:
      v31 = MidX - (v22 - v29);
LABEL_21:
      UIRoundToViewScale();
      v32 = v34;
      break;
    default:
      v31 = *MEMORY[0x1E0C9D648];
      v32 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      break;
  }
  v35 = v31;
  v36 = v22;
  v37 = v19;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v32;
  result.origin.x = v35;
  return result;
}

- (CGRect)fixedSizeSubjectIndicatorFrameForBodyResult:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a3;
  -[CAMPreviewView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0D0D0A0], "fixedSizeWithScale:", v8);
  -[CAMPreviewView frameForMetadataObjectResult:fixedSize:](self, "frameForMetadataObjectResult:fixedSize:", v4);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)frameForMetadataObjectResult:(id)a3
{
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
  CGRect result;

  objc_msgSend(a3, "underlyingMetadataObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewView _frameForAVMetadataObject:](self, "_frameForAVMetadataObject:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CAMPreviewView _frameClampedToBounds:](self, "_frameClampedToBounds:", v6, v8, v10, v12);
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)frameForMetadataObjectResult:(id)a3 fixedSize:(CGSize)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  objc_msgSend(a3, "underlyingMetadataObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewView _frameForAVMetadataObject:](self, "_frameForAVMetadataObject:", v5);

  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_frameForAVMetadataObject:(id)a3
{
  id v4;
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
  CGRect result;

  v4 = a3;
  -[CAMPreviewView videoPreviewLayer](self, "videoPreviewLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transformedMetadataObjectForMetadataObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CAMPreviewView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toLayer:", v15, v8, v10, v12, v14);

  UIRectIntegralWithScale();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)_frameClampedToBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMPreviewView indicatorContainerView](self, "indicatorContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v13 = CGRectInset(v12, 3.0, 3.0);
  v8 = v13.origin.x;
  v9 = v13.origin.y;
  v10 = v13.size.width;
  v11 = v13.size.height;

  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  return CGRectIntersection(v14, v16);
}

- (CGRect)frameForTextRegionResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
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
  CGRect result;

  v4 = a3;
  -[CAMPreviewView videoPreviewLayer](self, "videoPreviewLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingMetadataObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "transformedMetadataObjectForMetadataObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "angularOffsetBounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[CAMPreviewView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toLayer:", v17, v10, v12, v14, v16);

  UIRectIntegralWithScale();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGPoint)captureDevicePointOfInterestForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CAMPreviewView videoPreviewLayer](self, "videoPreviewLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captureDevicePointOfInterestForPoint:", x, y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)pointForCaptureDevicePointOfInterest:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CAMPreviewView videoPreviewLayer](self, "videoPreviewLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointForCaptureDevicePointOfInterest:", x, y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGRect)faceIndicatorFrameForFaceResult:(id)a3
{
  id v4;
  void *v5;
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
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "underlyingMetadataObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewView _frameForAVMetadataObject:](self, "_frameForAVMetadataObject:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "rollAngle");
  v15 = v14;

  -[CAMPreviewView _aspectFaceRectFromSquareFaceRect:angle:](self, "_aspectFaceRectFromSquareFaceRect:angle:", v7, v9, v11, v13, v15);
  -[CAMPreviewView _frameClampedToBounds:](self, "_frameClampedToBounds:");
  UIRectIntegralWithScale();
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)frameForSubjectGroupResult:(id)a3 minimumSize:(CGSize)a4
{
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
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
  void *v29;
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
  double v44;
  double v45;
  double v46;
  double v47;
  double height;
  double width;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;
  CGRect result;
  CGRect v58;

  height = a4.height;
  width = a4.width;
  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0C9D628];
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v5, "metadataObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  v12 = v9;
  v13 = v8;
  v14 = v7;
  v15 = v6;
  if (v11)
  {
    v16 = v11;
    v17 = *(_QWORD *)v51;
    v12 = v9;
    v13 = v8;
    v14 = v7;
    v15 = v6;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v51 != v17)
          objc_enumerationMutation(v10);
        v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CAMPreviewView faceIndicatorFrameForFaceResult:](self, "faceIndicatorFrameForFaceResult:", v19);
          v15 = v20;
          v14 = v21;
          v13 = v22;
          v12 = v23;
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v19, "syntheticFocusMode") & 3) != 0)
        {
          -[CAMPreviewView frameForMetadataObjectResult:](self, "frameForMetadataObjectResult:", v19);
          v15 = v24;
          v14 = v25;
          v13 = v26;
          v12 = v27;
          goto LABEL_14;
        }
      }
      v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_14:

  v56.origin.x = v15;
  v56.origin.y = v14;
  v56.size.width = v13;
  v56.size.height = v12;
  v58.origin.x = v6;
  v58.origin.y = v7;
  v58.size.width = v8;
  v58.size.height = v9;
  if (CGRectEqualToRect(v56, v58))
  {
    objc_msgSend(v5, "metadataObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewView frameForMetadataObjectResult:](self, "frameForMetadataObjectResult:", v29);
    v15 = v30;
    v14 = v31;
    v13 = v32;
    v12 = v33;

  }
  if (width > 0.0 && height > 0.0)
  {
    v34 = width - v13;
    if (v13 >= width)
      v34 = 0.0;
    v15 = v15 - v34;
    if (v13 < width)
      v13 = width;
    v35 = height - v12;
    if (v12 >= height)
      v35 = 0.0;
    v14 = v14 - v35;
    if (v12 < height)
      v12 = height;
  }
  -[CAMPreviewView _frameClampedToBounds:](self, "_frameClampedToBounds:", v15, v14, v13, v12, *(_QWORD *)&height);
  UIRectIntegralWithScale();
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;

  v44 = v37;
  v45 = v39;
  v46 = v41;
  v47 = v43;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (int)_faceOrientationForRollAngle:(double)a3
{
  double v3;
  int result;

  if (a3 == 3.40282347e38)
    a3 = 0.0;
  v3 = _nearestRoundedAngleForAngle(a3);
  if (v3 == 90.0)
    return 1;
  result = 3;
  if (v3 != 0.0 && v3 != 360.0)
    return 2 * (v3 == 180.0);
  return result;
}

- (CGRect)_aspectFaceRectFromSquareFaceRect:(CGRect)a3 angle:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  unsigned int v9;
  unsigned int v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = -[CAMPreviewView _faceOrientationForRollAngle:](self, "_faceOrientationForRollAngle:", a4);
  v10 = v9;
  if (v9 - 2 < 2)
  {
    v16 = width * 1.6;
    -[CAMPreviewView frame](self, "frame");
    v19 = v18;
    -[CAMPreviewView traitCollection](self, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayScale");
    v22 = v19 * v21;

    if (width * 1.6 >= v22)
      v16 = v22;
    v15 = v16 * 0.8;
    v23 = (v16 - width) / 1.6;
    -[CAMPreviewView videoPreviewLayer](self, "videoPreviewLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "connection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isVideoMirrored");

    if (v26)
    {
      if (v10 == 3)
        goto LABEL_16;
    }
    else if (v10 != 3)
    {
LABEL_16:
      x = x - v23;
      y = y + (v15 - height) * -0.5;
      goto LABEL_17;
    }
    v23 = v16 - v23 - width;
    goto LABEL_16;
  }
  if (v9 > 1)
  {
    v15 = height;
    v16 = width;
  }
  else
  {
    -[CAMPreviewView frame](self, "frame");
    v12 = v11;
    -[CAMPreviewView traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayScale");
    v15 = v12 * v14;

    if (height * 1.6 < v15)
      v15 = height * 1.6;
    v16 = v15 * 0.8;
    v17 = (v15 - height) / 1.6;
    if (v10)
      v17 = v15 - v17 - height;
    y = y - v17;
    x = x + (v16 - width) * -0.5;
  }
LABEL_17:
  v27 = x;
  v28 = y;
  v29 = v16;
  v30 = v15;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)setNormalizedZoomPIPRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_normalizedZoomPIPRect;
  void *v9;
  void *v10;
  void *v11;
  CAShapeLayer *indicatorContainerMask;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21 = *MEMORY[0x1E0C80C00];
  p_normalizedZoomPIPRect = &self->_normalizedZoomPIPRect;
  if (!CGRectEqualToRect(self->_normalizedZoomPIPRect, a3))
  {
    p_normalizedZoomPIPRect->origin.x = x;
    p_normalizedZoomPIPRect->origin.y = y;
    p_normalizedZoomPIPRect->size.width = width;
    p_normalizedZoomPIPRect->size.height = height;
    if (-[CAMPreviewView _isZoomPIPRectValid](self, "_isZoomPIPRectValid"))
    {
      -[CAMPreviewView _indicatorContainerMask](self, "_indicatorContainerMask");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[CAMPreviewView _updateIndicatorContainerMask](self, "_updateIndicatorContainerMask");
      }
      else
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CD2840]);
        objc_msgSend(v13, "setFillRule:", *MEMORY[0x1E0CD2B70]);
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v13, "setFillColor:", objc_msgSend(v14, "CGColor"));

        -[CAMPreviewView _setIndicatorContainerMask:](self, "_setIndicatorContainerMask:", v13);
        -[CAMPreviewView indicatorContainerView](self, "indicatorContainerView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setMask:", v13);

        -[CAMPreviewView setNeedsLayout](self, "setNeedsLayout");
      }
    }
    else if (self->__indicatorContainerMask)
    {
      -[CAMPreviewView indicatorContainerView](self, "indicatorContainerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMask:", 0);

      indicatorContainerMask = self->__indicatorContainerMask;
      self->__indicatorContainerMask = 0;

    }
    if (-[CAMPreviewView _debugDrawZoomPIP](self, "_debugDrawZoomPIP"))
    {
      v17 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        NSStringFromCGRect(v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v18;
        _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "---- Normalized Zoom PIP rect: %{public}@", (uint8_t *)&v19, 0xCu);

      }
      -[CAMPreviewView _drawZoomPIP](self, "_drawZoomPIP");
    }
  }
}

- (BOOL)_isZoomPIPRectValid
{
  CGRect v3;

  -[CAMPreviewView normalizedZoomPIPRect](self, "normalizedZoomPIPRect");
  return !CGRectIsEmpty(v3);
}

- (void)_updateIndicatorContainerMask
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGPath *Mutable;
  id v13;
  CGRect v14;
  CGRect v15;

  -[CAMPreviewView _indicatorContainerMask](self, "_indicatorContainerMask");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[CAMPreviewView videoPreviewLayer](self, "videoPreviewLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewView normalizedZoomPIPRect](self, "normalizedZoomPIPRect");
    objc_msgSend(v3, "rectForMetadataOutputRectOfInterest:");
    objc_msgSend(v3, "convertRect:toLayer:", v13);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    Mutable = CGPathCreateMutable();
    objc_msgSend(v13, "bounds");
    CGPathAddRect(Mutable, 0, v14);
    v15.origin.x = v5;
    v15.origin.y = v7;
    v15.size.width = v9;
    v15.size.height = v11;
    CGPathAddRect(Mutable, 0, v15);
    objc_msgSend(v13, "setPath:", Mutable);
    CGPathRelease(Mutable);

  }
}

- (void)_drawZoomPIP
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
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  CGRect v27;
  CGRect v28;

  -[CAMPreviewView viewWithTag:](self, "viewWithTag:", 86832);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (-[CAMPreviewView _isZoomPIPRectValid](self, "_isZoomPIPRectValid"))
  {
    -[CAMPreviewView videoPreviewLayer](self, "videoPreviewLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewView indicatorContainerView](self, "indicatorContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewView normalizedZoomPIPRect](self, "normalizedZoomPIPRect");
    objc_msgSend(v3, "rectForMetadataOutputRectOfInterest:");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertRect:toLayer:", v13, v6, v8, v10, v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v27.origin.x = v15;
    v27.origin.y = v17;
    v27.size.width = v19;
    v27.size.height = v21;
    v28 = CGRectInset(v27, -1.0, -1.0);
    if (v26)
    {
      objc_msgSend(v26, "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    }
    else
    {
      v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
      objc_msgSend(v26, "setTag:", 86832);
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = objc_msgSend(v22, "CGColor");
      objc_msgSend(v26, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setBorderColor:", v23);

      objc_msgSend(v26, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBorderWidth:", 1.0);

      objc_msgSend(v4, "addSubview:", v26);
    }

  }
  else
  {
    objc_msgSend(v26, "removeFromSuperview");
  }

}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CGRect)viewportFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewportFrame.origin.x;
  y = self->_viewportFrame.origin.y;
  width = self->_viewportFrame.size.width;
  height = self->_viewportFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)overlayFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_overlayFrame.origin.x;
  y = self->_overlayFrame.origin.y;
  width = self->_overlayFrame.size.width;
  height = self->_overlayFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CAMInterfaceModulationView)indicatorContainerView
{
  return self->_indicatorContainerView;
}

- (int64_t)indicatorClippingStyle
{
  return self->_indicatorClippingStyle;
}

- (CAMHorizonLevelView)horizonLevelView
{
  return self->_horizonLevelView;
}

- (CGRect)normalizedZoomPIPRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedZoomPIPRect.origin.x;
  y = self->_normalizedZoomPIPRect.origin.y;
  width = self->_normalizedZoomPIPRect.size.width;
  height = self->_normalizedZoomPIPRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UILabel)_simulatorLabel
{
  return self->__simulatorLabel;
}

- (int)_exposureBiasSide
{
  return self->__exposureBiasSide;
}

- (void)set_exposureBiasSide:(int)a3
{
  self->__exposureBiasSide = a3;
}

- (CAShapeLayer)_indicatorContainerMask
{
  return self->__indicatorContainerMask;
}

- (void)_setIndicatorContainerMask:(id)a3
{
  objc_storeStrong((id *)&self->__indicatorContainerMask, a3);
}

- (BOOL)_debugDrawZoomPIP
{
  return self->__debugDrawZoomPIP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indicatorContainerMask, 0);
  objc_storeStrong((id *)&self->__simulatorLabel, 0);
  objc_storeStrong((id *)&self->_stageLightOverlayView, 0);
  objc_storeStrong((id *)&self->_centeredSubjectIndicatorView, 0);
  objc_storeStrong((id *)&self->_pointIndicator, 0);
  objc_storeStrong((id *)&self->_continuousIndicator, 0);
  objc_storeStrong((id *)&self->_indicatorContainerView, 0);
  objc_storeStrong((id *)&self->_videoPreviewView, 0);
}

@end
