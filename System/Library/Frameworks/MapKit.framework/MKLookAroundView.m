@implementation MKLookAroundView

- (void)_maps_initCommon
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  UIImageView *v7;
  UIImageView *transitionStartImageview;
  UIImageView *v9;
  UIImageView *transitionEndImageview;
  UIImageView *v11;
  UIImageView *transitionGridImageview;
  _MKLookAroundLayerHostingView *v13;
  _MKLookAroundLayerHostingView *v14;
  _MKLookAroundLayerHostingView *hostView;
  id v16;
  UIView *v17;
  UIView *overlayView;
  MKCompassView *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  MKCompassView *v24;
  MKCompassView *compassView;
  UITapGestureRecognizer *v26;
  UITapGestureRecognizer *compassSelectGestureRecognizer;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *compassTopOrBottomConstraint;
  void *v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *compassTrailingConstraint;
  void *v38;
  NSLayoutConstraint *v39;
  void *v40;
  MKLookAroundGestureController *v41;
  MKLookAroundGestureController *gestureController;
  VKMapView *v43;
  VKMapView *lookAroundView;
  void *v45;
  void *v46;
  MKHapticEngine *v47;
  MKHapticEngine *hapticEngine;
  MKLookAroundBumpFlash *v49;
  MKLookAroundBumpFlash *bumpFlashView;
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
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint8_t buf[16];
  _QWORD v68[4];
  _QWORD v69[4];

  v69[2] = *MEMORY[0x1E0C80C00];
  MKGetMKLookAroundLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LookAroundViewInitialization", (const char *)&unk_18B2CC343, buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nativeScale");
  v6 = v5;

  -[MKLookAroundView setOpaque:](self, "setOpaque:", 1);
  -[MKLookAroundView setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[MKLookAroundView setInsetsLayoutMarginsFromSafeArea:](self, "setInsetsLayoutMarginsFromSafeArea:", 0);
  -[MKLookAroundView setAccessibilityIgnoresInvertColors:](self, "setAccessibilityIgnoresInvertColors:", 1);
  -[MKLookAroundView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("LookAroundView"));
  -[MKLookAroundView setNavigatingEnabled:](self, "setNavigatingEnabled:", 1);
  -[MKLookAroundView setPanningEnabled:](self, "setPanningEnabled:", 1);
  -[MKLookAroundView setZoomingEnabled:](self, "setZoomingEnabled:", 1);
  v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", 0);
  transitionStartImageview = self->_transitionStartImageview;
  self->_transitionStartImageview = v7;

  v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", 0);
  transitionEndImageview = self->_transitionEndImageview;
  self->_transitionEndImageview = v9;

  v11 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", 0);
  transitionGridImageview = self->_transitionGridImageview;
  self->_transitionGridImageview = v11;

  v13 = [_MKLookAroundLayerHostingView alloc];
  -[MKLookAroundView bounds](self, "bounds");
  v14 = -[_MKLookAroundLayerHostingView initWithFrame:](v13, "initWithFrame:");
  hostView = self->_hostView;
  self->_hostView = v14;

  -[_MKLookAroundLayerHostingView setUserInteractionEnabled:](self->_hostView, "setUserInteractionEnabled:", 0);
  -[MKLookAroundView addSubview:](self, "addSubview:", self->_hostView);
  v16 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[MKLookAroundView bounds](self, "bounds");
  v17 = (UIView *)objc_msgSend(v16, "initWithFrame:");
  overlayView = self->_overlayView;
  self->_overlayView = v17;

  -[UIView setAccessibilityIdentifier:](self->_overlayView, "setAccessibilityIdentifier:", CFSTR("LookAroundOverlayView"));
  -[MKLookAroundView addSubview:](self, "addSubview:", self->_overlayView);
  v19 = [MKCompassView alloc];
  v20 = *MEMORY[0x1E0C9D648];
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v24 = -[MKCompassView initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E0C9D648], v21, v22, v23);
  compassView = self->_compassView;
  self->_compassView = v24;

  -[MKCompassView setCompassViewSize:style:](self->_compassView, "setCompassViewSize:style:", 1, 0);
  -[MKCompassView setTag:](self->_compassView, "setTag:", 1002);
  -[MKCompassView _setTouchInsets:](self->_compassView, "_setTouchInsets:", -9.0, -9.0, -9.0, -9.0);
  -[MKCompassView setTranslatesAutoresizingMaskIntoConstraints:](self->_compassView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKCompassView setAccessibilityIdentifier:](self->_compassView, "setAccessibilityIdentifier:", CFSTR("LookAroundCompassView"));
  -[UIView addSubview:](self->_overlayView, "addSubview:", self->_compassView);
  v26 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleCompassSelect);
  compassSelectGestureRecognizer = self->_compassSelectGestureRecognizer;
  self->_compassSelectGestureRecognizer = v26;

  -[MKCompassView addGestureRecognizer:](self->_compassView, "addGestureRecognizer:", self->_compassSelectGestureRecognizer);
  -[MKCompassView topAnchor](self->_compassView, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView safeAreaLayoutGuide](self->_overlayView, "safeAreaLayoutGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  compassTopOrBottomConstraint = self->_compassTopOrBottomConstraint;
  self->_compassTopOrBottomConstraint = v31;

  -[MKCompassView trailingAnchor](self->_compassView, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView safeAreaLayoutGuide](self->_overlayView, "safeAreaLayoutGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  compassTrailingConstraint = self->_compassTrailingConstraint;
  self->_compassTrailingConstraint = v36;

  v38 = (void *)MEMORY[0x1E0CB3718];
  v39 = self->_compassTrailingConstraint;
  v69[0] = self->_compassTopOrBottomConstraint;
  v69[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v40);

  v41 = -[MKLookAroundGestureController initWithLookAroundView:]([MKLookAroundGestureController alloc], "initWithLookAroundView:", self);
  gestureController = self->_gestureController;
  self->_gestureController = v41;

  -[MKLookAroundGestureController setDelegate:](self->_gestureController, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC6528], "descriptorWithShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:", 0, 0, 0, 1, 0, v6);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (VKMapView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6520]), "initWithDescriptor:", v66);
  lookAroundView = self->_lookAroundView;
  self->_lookAroundView = v43;

  -[VKMapView setMapDelegate:](self->_lookAroundView, "setMapDelegate:", self);
  -[VKMapView setRendersInBackground:](self->_lookAroundView, "setRendersInBackground:", 0);
  -[VKMapView setMapType:](self->_lookAroundView, "setMapType:", 7);
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v40) = objc_msgSend(v45, "reduceMotionEnabled");

  if ((_DWORD)v40)
    -[VKMapView setVirtualParallaxEnabled:](self->_lookAroundView, "setVirtualParallaxEnabled:", 0);
  -[_MKLookAroundLayerHostingView layer](self->_hostView, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "insertSublayer:atIndex:", self->_lookAroundView, 0);

  -[_MKLookAroundLayerHostingView setLookAroundView:](self->_hostView, "setLookAroundView:", self->_lookAroundView);
  -[VKMapView heading](self->_lookAroundView, "heading");
  -[MKCompassView setMapHeading:](self->_compassView, "setMapHeading:");
  -[VKMapView setCameraDelegate:](self->_lookAroundView, "setCameraDelegate:", self);
  v47 = objc_alloc_init(MKHapticEngine);
  hapticEngine = self->_hapticEngine;
  self->_hapticEngine = v47;

  v49 = -[MKLookAroundBumpFlash initWithFrame:]([MKLookAroundBumpFlash alloc], "initWithFrame:", v20, v21, v22, v23);
  bumpFlashView = self->_bumpFlashView;
  self->_bumpFlashView = v49;

  -[MKLookAroundBumpFlash setAccessibilityIdentifier:](self->_bumpFlashView, "setAccessibilityIdentifier:", CFSTR("LookAroundBumpFlash"));
  -[MKLookAroundBumpFlash setTranslatesAutoresizingMaskIntoConstraints:](self->_bumpFlashView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKLookAroundBumpFlash setUserInteractionEnabled:](self->_bumpFlashView, "setUserInteractionEnabled:", 0);
  -[MKLookAroundView addSubview:](self, "addSubview:", self->_bumpFlashView);
  v62 = (void *)MEMORY[0x1E0CB3718];
  -[MKLookAroundBumpFlash topAnchor](self->_bumpFlashView, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView topAnchor](self, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v63;
  -[MKLookAroundBumpFlash leftAnchor](self->_bumpFlashView, "leftAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView leftAnchor](self, "leftAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v53;
  -[MKLookAroundBumpFlash bottomAnchor](self->_bumpFlashView, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView bottomAnchor](self, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v56;
  -[MKLookAroundBumpFlash rightAnchor](self->_bumpFlashView, "rightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView rightAnchor](self, "rightAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v68[3] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 4);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "activateConstraints:", v60);

  MKGetMKLookAroundLog();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v61))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v61, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "LookAroundViewInitialization", (const char *)&unk_18B2CC343, buf, 2u);
  }

}

- (MKLookAroundView)initWithCoder:(id)a3
{
  MKLookAroundView *v3;
  MKLookAroundView *v4;
  MKLookAroundView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKLookAroundView;
  v3 = -[MKLookAroundView initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[MKLookAroundView _maps_initCommon](v3, "_maps_initCommon");
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[VKMapView setMapDelegate:](self->_lookAroundView, "setMapDelegate:", 0);
  -[VKMapView setCameraDelegate:](self->_lookAroundView, "setCameraDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MKLookAroundView;
  -[MKLookAroundView dealloc](&v3, sel_dealloc);
}

- (MKLookAroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MKLookAroundView *v7;
  MKLookAroundView *v8;
  MKLookAroundView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)MKLookAroundView;
  v7 = -[MKLookAroundView initWithFrame:](&v11, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[MKLookAroundView _maps_initCommon](v7, "_maps_initCommon");
    -[VKMapView setFrame:](v8->_lookAroundView, "setFrame:", x, y, width, height);
    v9 = v8;
  }

  return v8;
}

- (VKMapView)lookAroundView
{
  return self->_lookAroundView;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  MKCompassView *v8;
  MKCompassView *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[MKLookAroundView _pointContainedInCompassView:](self, "_pointContainedInCompassView:", x, y))
  {
    v8 = self->_compassView;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MKLookAroundView;
    -[MKLookAroundView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
    v8 = (MKCompassView *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundView;
  -[MKLookAroundView setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_);
  -[MKLookAroundGestureController setNavigatingEnabled:](self->_gestureController, "setNavigatingEnabled:", v3);
  -[MKLookAroundGestureController setPanningEnabled:](self->_gestureController, "setPanningEnabled:", v3);
  -[MKLookAroundGestureController setZoomingEnabled:](self->_gestureController, "setZoomingEnabled:", v3);
}

- (void)_animateCanvasForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MidY;
  BOOL v18;
  double v19;
  double v20;
  BOOL v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  _QWORD v29[13];
  _QWORD v30[14];
  BOOL v31;
  BOOL v32;
  BOOL v33;
  BOOL v34;
  uint8_t buf[16];
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MKLookAroundView bounds](self, "bounds");
  v12 = v11;
  v13 = v10;
  if (fabs(v11) < 0.000001 || fabs(v10) < 0.000001 || fabs(width) < 0.000001 || fabs(height) < 0.000001)
  {
    MKGetMKLookAroundLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v24, OS_LOG_TYPE_ERROR, "Cannot animate to/from zero-sized bounds", buf, 2u);
    }

    -[_MKLookAroundLayerHostingView setFrame:](self->_hostView, "setFrame:", x, y, width, height);
    -[_MKLookAroundLayerHostingView setAlpha:](self->_hostView, "setAlpha:", 1.0);
    -[UIView setFrame:](self->_overlayView, "setFrame:", x, y, width, height);
  }
  else
  {
    v26 = v9;
    v27 = v8;
    -[MKLookAroundView frame](self, "frame");
    if (width <= v14)
      -[MKLookAroundView frame](self, "frame");
    -[MKLookAroundView frame](self, "frame");
    if (height <= v15)
      -[MKLookAroundView frame](self, "frame");
    v25 = v13;
    v16 = v12 / v13;
    -[MKLookAroundView bounds](self, "bounds");
    -[MKLookAroundView bounds](self, "bounds", CGRectGetMidX(v36));
    MidY = CGRectGetMidY(v37);
    if (width > v12)
    {
      v18 = width / height < 1.0;
    }
    else
    {
      -[MKLookAroundView bounds](self, "bounds", MidY);
      -[MKLookAroundView bounds](self, "bounds", CGRectGetMidX(v38));
      CGRectGetMidY(v39);
      v18 = 1;
    }
    if (v18)
      v19 = height;
    else
      v19 = width;
    v20 = v19 / v16;
    v21 = -[MKLookAroundView adequatelyDrawn](self, "adequatelyDrawn");
    v22 = -[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround");
    self->_changingViewSize = 1;
    v23 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __44__MKLookAroundView__animateCanvasForBounds___block_invoke;
    v30[3] = &unk_1E20D82A8;
    v31 = v21;
    v30[4] = self;
    v32 = width > v12;
    *(double *)&v30[5] = v19;
    *(double *)&v30[6] = x;
    *(double *)&v30[7] = y;
    *(double *)&v30[8] = width;
    v33 = v22;
    v34 = width / height >= 1.0;
    *(double *)&v30[9] = height;
    v30[10] = v27;
    v30[11] = v26;
    *(double *)&v30[12] = v12;
    *(double *)&v30[13] = v25;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_performWithoutAnimation:", v30);
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __44__MKLookAroundView__animateCanvasForBounds___block_invoke_2;
    v29[3] = &unk_1E20D82D0;
    v29[4] = self;
    *(double *)&v29[5] = (width - v19) * 0.5;
    *(double *)&v29[6] = (height - v20) * 0.5;
    *(double *)&v29[7] = v19;
    *(double *)&v29[8] = v20;
    *(double *)&v29[9] = x;
    *(double *)&v29[10] = y;
    *(double *)&v29[11] = width;
    *(double *)&v29[12] = height;
    v28[0] = v23;
    v28[1] = 3221225472;
    v28[2] = __44__MKLookAroundView__animateCanvasForBounds___block_invoke_3;
    v28[3] = &unk_1E20D82F8;
    v28[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_animateWithDuration:animations:completion:", v29, v28, 0.0);
  }
}

void __44__MKLookAroundView__animateCanvasForBounds___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  id v12;

  if (*(_BYTE *)(a1 + 112))
  {
    objc_msgSend(*(id *)(a1 + 32), "_imageFromLookAroundView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (*(_BYTE *)(a1 + 113))
  {
    v2 = *(double *)(a1 + 40);
    v3 = 0.0;
    v4 = v2;
    v5 = 0.0;
  }
  else
  {
    v5 = *(double *)(a1 + 48);
    v3 = *(double *)(a1 + 56);
    v4 = *(double *)(a1 + 64);
    v2 = *(double *)(a1 + 72);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrame:", v5, v3, v4, v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setFrame:", v5, v3, v4, v2);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
  if (*(_BYTE *)(a1 + 114))
    objc_msgSend(v6, "forceCameraUpdateForFrameResize");
  else
    objc_msgSend(v6, "forceLayout");
  objc_msgSend(*(id *)(a1 + 32), "_imageFromLookAroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 113))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "forceCameraUpdateForFrameResize");
  }
  v8 = 432;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "removeFromSuperview");
  if (*(_BYTE *)(a1 + 112))
  {
    objc_msgSend(*(id *)(a1 + 32), "_mapkit_insertSubview:aboveSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setImage:", v7);
    if (*(_BYTE *)(a1 + 115))
    {
      v9 = 2;
    }
    else if (*(_BYTE *)(a1 + 113))
    {
      v9 = 2;
    }
    else
    {
      v9 = 1;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setImageContentMode:", v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.25);
    objc_msgSend(*(id *)(a1 + 32), "_mapkit_insertSubview:aboveSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setImage:", v12);
    if (*(_BYTE *)(a1 + 115))
      v11 = 2;
    else
      v11 = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setImageContentMode:", v11);
    v10 = 1.0;
    goto LABEL_24;
  }
  if (!*(_BYTE *)(a1 + 114))
  {
    objc_msgSend(*(id *)(a1 + 32), "_mapkit_insertSubview:aboveSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setImage:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setImageContentMode:", 2);
    v10 = 0.800000012;
    v8 = 448;
LABEL_24:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v8), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v8), "setAlpha:", v10);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);

}

uint64_t __44__MKLookAroundView__animateCanvasForBounds___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

uint64_t __44__MKLookAroundView__animateCanvasForBounds___block_invoke_3(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MKLookAroundView__animateCanvasForBounds___block_invoke_4;
  v3[3] = &unk_1E20D7D98;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__MKLookAroundView__animateCanvasForBounds___block_invoke_5;
  v2[3] = &unk_1E20D82F8;
  v2[4] = v4;
  return objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_animateWithDuration:animations:completion:", v3, v2, 0.200000003);
}

uint64_t __44__MKLookAroundView__animateCanvasForBounds___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
}

_BYTE *__44__MKLookAroundView__animateCanvasForBounds___block_invoke_5(uint64_t a1)
{
  _BYTE *result;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setFrame:");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 424) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "removeFromSuperview");
  result = *(_BYTE **)(a1 + 32);
  if (result[425])
    return (_BYTE *)objc_msgSend(result, "setCompassHidden:animated:", 0, 1);
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MKLookAroundView bounds](self, "bounds");
  v15.origin.x = v8;
  v15.origin.y = v9;
  v15.size.width = v10;
  v15.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v15))
  {
    if (width == self->_oldRect.size.height && height == self->_oldRect.size.width
      || !objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters")
      || (-[MKLookAroundView bounds](self, "bounds"), CGRectIsEmpty(v14)))
    {
      self->_changingViewSize = 1;
      -[_MKLookAroundLayerHostingView setFrame:](self->_hostView, "setFrame:", x, y, width, height);
      -[UIView setFrame:](self->_overlayView, "setFrame:", x, y, width, height);
      if (self->_changingViewSize)
        -[VKMapView forceFrame](self->_lookAroundView, "forceFrame");
      self->_changingViewSize = 0;
    }
    else
    {
      -[MKLookAroundView _animateCanvasForBounds:](self, "_animateCanvasForBounds:", x, y, width, height);
    }
    self->_oldRect.origin.x = x;
    self->_oldRect.origin.y = y;
    self->_oldRect.size.width = width;
    self->_oldRect.size.height = height;
  }
  v12.receiver = self;
  v12.super_class = (Class)MKLookAroundView;
  -[MKLookAroundView setBounds:](&v12, sel_setBounds_, x, y, width, height);
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
  objc_super v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MKLookAroundView bounds](self, "bounds");
  v16.origin.x = v8;
  v16.origin.y = v9;
  v16.size.width = v10;
  v16.size.height = v11;
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v16))
  {
    if (width == self->_oldRect.size.height && height == self->_oldRect.size.width
      || !objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters")
      || (-[MKLookAroundView bounds](self, "bounds"), CGRectIsEmpty(v14)))
    {
      v15.origin.x = 0.0;
      v15.origin.y = 0.0;
      v15.size.width = width;
      v15.size.height = height;
      if (!CGRectIsEmpty(v15))
      {
        self->_changingViewSize = 1;
        -[_MKLookAroundLayerHostingView setFrame:](self->_hostView, "setFrame:", 0.0, 0.0, width, height);
        -[UIView setFrame:](self->_overlayView, "setFrame:", 0.0, 0.0, width, height);
        -[VKMapView forceFrame](self->_lookAroundView, "forceFrame");
        self->_changingViewSize = 0;
      }
    }
    else
    {
      -[MKLookAroundView _animateCanvasForBounds:](self, "_animateCanvasForBounds:", 0.0, 0.0, width, height);
    }
    self->_oldRect.origin.x = 0.0;
    self->_oldRect.origin.y = 0.0;
    self->_oldRect.size.width = width;
    self->_oldRect.size.height = height;
  }
  v12.receiver = self;
  v12.super_class = (Class)MKLookAroundView;
  -[MKLookAroundView setFrame:](&v12, sel_setFrame_, x, y, width, height);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundView;
  -[MKLookAroundView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  -[VKMapView enableViewDataLoading:](self->_lookAroundView, "enableViewDataLoading:", a3 != 0);
}

- (BOOL)isCompassHidden
{
  return -[MKCompassView isHidden](self->_compassView, "isHidden");
}

- (void)setCompassHidden:(BOOL)a3
{
  -[MKLookAroundView setCompassHidden:animated:](self, "setCompassHidden:animated:", a3, 0);
}

- (void)setCompassHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  MKCompassView *v7;
  MKCompassView *v8;
  uint64_t v9;
  MKCompassView *v10;
  void (**v11)(_QWORD);
  void (**v12)(_QWORD, _QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  MKCompassView *v17;
  BOOL v18;
  _QWORD v19[4];
  MKCompassView *v20;
  BOOL v21;

  v4 = a4;
  v7 = self->_compassView;
  v8 = v7;
  if (a3 || !self->_changingViewSize)
  {
    self->_wantsCompassShown = 0;
    if (-[MKCompassView isHidden](v7, "isHidden"))
      -[MKCompassView setHidden:](v8, "setHidden:", 0);
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __46__MKLookAroundView_setCompassHidden_animated___block_invoke;
    v19[3] = &unk_1E20D8320;
    v10 = v8;
    v20 = v10;
    v21 = a3;
    v11 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v19);
    v13 = v9;
    v14 = 3221225472;
    v15 = __46__MKLookAroundView_setCompassHidden_animated___block_invoke_2;
    v16 = &unk_1E20D8348;
    v17 = v10;
    v18 = a3;
    v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D778DB8](&v13);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_animateWithDuration:animations:completion:", v11, v12, 0.25, v13, v14, v15, v16);
    }
    else
    {
      v11[2](v11);
      v12[2](v12, 1);
    }

  }
  else
  {
    self->_wantsCompassShown = 1;
  }

}

uint64_t __46__MKLookAroundView_setCompassHidden_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

uint64_t __46__MKLookAroundView_setCompassHidden_animated___block_invoke_2(uint64_t a1)
{
  double v2;

  v2 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v2);
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setCompassInsets:(UIEdgeInsets)a3
{
  self->_compassInsets = a3;
  -[MKLookAroundView _updateCompassInsets](self, "_updateCompassInsets");
}

- (void)setNavigatingEnabled:(BOOL)a3
{
  self->_navigatingEnabled = a3;
  -[MKLookAroundGestureController setNavigatingEnabled:](self->_gestureController, "setNavigatingEnabled:");
}

- (void)setPanningEnabled:(BOOL)a3
{
  self->_panningEnabled = a3;
  -[MKLookAroundGestureController setPanningEnabled:](self->_gestureController, "setPanningEnabled:");
}

- (void)setZoomingEnabled:(BOOL)a3
{
  self->_zoomingEnabled = a3;
  -[MKLookAroundGestureController setZoomingEnabled:](self->_gestureController, "setZoomingEnabled:");
}

- (BOOL)showsRoadLabels
{
  return -[VKMapView showsRoadLabels](self->_lookAroundView, "showsRoadLabels");
}

- (void)setShowsRoadLabels:(BOOL)a3
{
  -[VKMapView setShowsRoadLabels:](self->_lookAroundView, "setShowsRoadLabels:", a3);
}

- (BOOL)showsPointLabels
{
  return -[VKMapView showsPointLabels](self->_lookAroundView, "showsPointLabels");
}

- (void)setShowsPointLabels:(BOOL)a3
{
  _BOOL4 v3;
  MKPointOfInterestFilter *pointOfInterestFilter;
  MKPointOfInterestFilter *v6;
  MKPointOfInterestFilter *v7;
  id v8;

  v3 = a3;
  -[VKMapView setShowsPointLabels:](self->_lookAroundView, "setShowsPointLabels:");
  if (v3)
  {
    pointOfInterestFilter = self->_pointOfInterestFilter;
    self->_pointOfInterestFilter = 0;

    -[VKMapView setPointsOfInterestFilter:](self->_lookAroundView, "setPointsOfInterestFilter:", 0);
  }
  else
  {
    +[MKPointOfInterestFilter filterExcludingAllCategories](MKPointOfInterestFilter, "filterExcludingAllCategories");
    v6 = (MKPointOfInterestFilter *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pointOfInterestFilter;
    self->_pointOfInterestFilter = v6;

    -[MKPointOfInterestFilter _geoPOICategoryFilter](self->_pointOfInterestFilter, "_geoPOICategoryFilter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[VKMapView setPointsOfInterestFilter:](self->_lookAroundView, "setPointsOfInterestFilter:", v8);

  }
}

- (CLLocationCoordinate2D)centerCoordinate
{
  void *v3;
  void *v4;
  double v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  CLLocationCoordinate2D v8;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  double v11;
  double v12;
  CLLocationCoordinate2D result;

  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[MKLookAroundView muninViewState](self, "muninViewState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cameraFrame");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "latitude");
    v6 = v5;
    objc_msgSend(v4, "longitude");
    v8 = CLLocationCoordinate2DMake(v6, v7);
    latitude = v8.latitude;
    longitude = v8.longitude;

  }
  else
  {
    latitude = *MEMORY[0x1E0C9E500];
    longitude = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  v11 = latitude;
  v12 = longitude;
  result.longitude = v12;
  result.latitude = v11;
  return result;
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  longitude = a3.longitude;
  latitude = a3.latitude;
  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[VKMapView altitude](self->_lookAroundView, "altitude");
    v7 = v6;
    -[VKMapView pitch](self->_lookAroundView, "pitch");
    v9 = v8;
    -[VKMapView presentationYaw](self->_lookAroundView, "presentationYaw");
    -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](self->_lookAroundView, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, 0, latitude, longitude, v7, v10, v9, 0.0);
  }
}

- (double)presentationYaw
{
  double result;

  if (!-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
    return 0.0;
  -[VKMapView yaw](self->_lookAroundView, "yaw");
  return result;
}

- (void)setPresentationYaw:(double)a3
{
  double v5;

  -[VKMapView pitch](self->_lookAroundView, "pitch");
  -[MKLookAroundView setPresentationYaw:pitch:animated:](self, "setPresentationYaw:pitch:animated:", 0, a3, v5);
}

- (void)setPresentationYaw:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;

  v4 = a4;
  -[VKMapView pitch](self->_lookAroundView, "pitch");
  -[MKLookAroundView setPresentationYaw:pitch:animated:](self, "setPresentationYaw:pitch:animated:", v4, a3, v7);
}

- (void)setPresentationYaw:(double)a3 pitch:(double)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v5 = a5;
  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[VKMapView centerCoordinate](self->_lookAroundView, "centerCoordinate");
    v10 = v9;
    -[VKMapView centerCoordinate](self->_lookAroundView, "centerCoordinate");
    v12 = v11;
    -[VKMapView altitude](self->_lookAroundView, "altitude");
    v14 = v13;
    v15 = fmod(a3, 360.0);
    if (v15 >= 0.0)
      v16 = v15;
    else
      v16 = v15 + 360.0;
    if (v5)
      v17 = 0.25;
    else
      v17 = 0.0;
    -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](self->_lookAroundView, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, 0, v10, v12, v14, v16, a4, v17);
  }
}

- (void)setPointOfInterestFilter:(id)a3
{
  MKPointOfInterestFilter *v4;
  MKPointOfInterestFilter *v5;
  MKPointOfInterestFilter *pointOfInterestFilter;
  uint64_t v7;
  void *v8;
  MKPointOfInterestFilter *v9;

  v4 = (MKPointOfInterestFilter *)a3;
  if (self->_pointOfInterestFilter != v4)
  {
    v9 = v4;
    v5 = (MKPointOfInterestFilter *)-[MKPointOfInterestFilter copy](v4, "copy");
    pointOfInterestFilter = self->_pointOfInterestFilter;
    self->_pointOfInterestFilter = v5;

    if (v9)
      v7 = -[MKPointOfInterestFilter _excludesAllCategories](v9, "_excludesAllCategories") ^ 1;
    else
      v7 = 1;
    -[VKMapView setShowsPointLabels:](self->_lookAroundView, "setShowsPointLabels:", v7);
    -[MKPointOfInterestFilter _geoPOICategoryFilter](v9, "_geoPOICategoryFilter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapView setPointsOfInterestFilter:](self->_lookAroundView, "setPointsOfInterestFilter:", v8);

    v4 = v9;
  }

}

- (NSDate)collectionDate
{
  void *v3;
  void *v4;

  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[VKMapView currentMarker](self->_lookAroundView, "currentMarker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collectionDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSURL)sharingURL
{
  MKMapItem *mapItem;
  MKPlacemark *v4;
  void *v5;
  MKPlacemark *v7;
  MKMapItem *v8;
  void *v9;

  mapItem = self->_mapItem;
  if (mapItem || (mapItem = self->_revGeoMapItem) != 0)
  {
    -[MKLookAroundView muninViewState](self, "muninViewState");
    v4 = (MKPlacemark *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem _activityURLWithMuninViewState:](mapItem, "_activityURLWithMuninViewState:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = [MKPlacemark alloc];
    -[MKLookAroundView centerCoordinate](self, "centerCoordinate");
    v4 = -[MKPlacemark initWithCoordinate:](v7, "initWithCoordinate:");
    v8 = -[MKMapItem initWithPlacemark:]([MKMapItem alloc], "initWithPlacemark:", v4);
    -[MKLookAroundView muninViewState](self, "muninViewState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem _activityURLWithMuninViewState:](v8, "_activityURLWithMuninViewState:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v5;
}

- (void)enterLookAroundWithEntryPoint:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MKLookAroundView recordTriggerAction:](self, "recordTriggerAction:", objc_msgSend(v8, "triggerAction"));
  v4 = objc_msgSend(v8, "type");
  switch(v4)
  {
    case 2:
      objc_msgSend(v8, "muninViewState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLookAroundView _enterLookAroundForMuninViewState:](self, "_enterLookAroundForMuninViewState:", v5);
      goto LABEL_7;
    case 1:
      objc_msgSend(v8, "muninMarker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "heading");
      -[MKLookAroundView _enterLookAroundForMuninMarker:withHeading:](self, "_enterLookAroundForMuninMarker:withHeading:", v5);
      goto LABEL_7;
    case 0:
      objc_msgSend(v8, "mapItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "wantsCloseUpView");
      objc_msgSend(v8, "cameraFrameOverride");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLookAroundView _enterLookAroundForMapItem:wantsCloseUpView:cameraFrameOverride:](self, "_enterLookAroundForMapItem:wantsCloseUpView:cameraFrameOverride:", v5, v6, v7);

LABEL_7:
      break;
  }

}

- (void)_enterLookAroundForMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 cameraFrameOverride:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  GEOStorefrontView *requestedStorefrontView;
  VKMapView *lookAroundView;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  VKMapView *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  v30 = a3;
  v9 = a5;
  if (objc_msgSend(v30, "_hasLookAroundStorefront"))
  {
    -[MKLookAroundView _resetViewState](self, "_resetViewState");
    objc_msgSend(v30, "_geoMapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_storefrontPresentationInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      objc_msgSend(v11, "closeUpView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "standOffView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend(v11, "closeUpView");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v15;

    }
    self->_hasEnteredLookAround = 1;
    self->_moveToStorefrontViewInProgress = 0;
    requestedStorefrontView = self->_requestedStorefrontView;
    self->_requestedStorefrontView = 0;

    self->_wantsStorefrontCloseUpView = 0;
    -[VKMapView cancelPendingMove](self->_lookAroundView, "cancelPendingMove");
    lookAroundView = self->_lookAroundView;
    if (v9)
    {
      -[VKMapView setMapType:](lookAroundView, "setMapType:", 11);
      v18 = v9;
      objc_msgSend(v18, "latitude");
      v20 = v19;
      objc_msgSend(v18, "longitude");
      v22 = v21;
      v23 = self->_lookAroundView;
      objc_msgSend(v18, "altitude");
      v25 = v24;
      objc_msgSend(v18, "yaw");
      v27 = v26;
      objc_msgSend(v18, "pitch");
      v29 = v28;

      -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](v23, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, 0, v20, v22, v25, v27, v29, 0.0);
    }
    else
    {
      -[VKMapView enterMuninForStorefrontView:secondaryStorefrontView:](lookAroundView, "enterMuninForStorefrontView:secondaryStorefrontView:", v12, 0);
      -[VKMapView forceFrame](self->_lookAroundView, "forceFrame");
    }
    objc_storeStrong((id *)&self->_mapItem, a3);
    -[MKLookAroundView _updateCameraFrame](self, "_updateCameraFrame");
    -[MKLookAroundView _updateCompass](self, "_updateCompass");
    -[MKLookAroundView _setInitialLocationInfo](self, "_setInitialLocationInfo");

  }
}

- (void)_enterLookAroundForMuninMarker:(id)a3 withHeading:(double)a4
{
  id v6;

  v6 = a3;
  -[MKLookAroundView _resetViewState](self, "_resetViewState");
  self->_hasEnteredLookAround = 1;
  -[VKMapView enterMuninForMarker:withHeading:](self->_lookAroundView, "enterMuninForMarker:withHeading:", v6, a4);

  -[MKLookAroundView _updateCameraFrame](self, "_updateCameraFrame");
  -[MKLookAroundView _setInitialLocationInfo](self, "_setInitialLocationInfo");
}

- (void)_enterLookAroundForMuninViewState:(id)a3
{
  GEOMuninViewState *v4;
  GEOMuninViewState *muninViewState;
  GEOMuninViewState *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  VKMapView *lookAroundView;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v4 = (GEOMuninViewState *)a3;
  -[MKLookAroundView _resetViewState](self, "_resetViewState");
  self->_hasEnteredLookAround = 1;
  muninViewState = self->_muninViewState;
  self->_muninViewState = v4;
  v6 = v4;

  -[VKMapView setMapType:](self->_lookAroundView, "setMapType:", 11);
  -[GEOMuninViewState cameraFrame](v6, "cameraFrame");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "latitude");
  v8 = v7;
  objc_msgSend(v17, "longitude");
  v10 = v9;
  lookAroundView = self->_lookAroundView;
  objc_msgSend(v17, "altitude");
  v13 = v12;
  objc_msgSend(v17, "yaw");
  v15 = v14;
  objc_msgSend(v17, "pitch");
  -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](lookAroundView, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, 0, v8, v10, v13, v15, v16, 0.0);

}

- (void)reset
{
  -[MKLookAroundView _resetViewState](self, "_resetViewState");
  -[VKMapView setMapType:](self->_lookAroundView, "setMapType:", 7);
  -[VKMapView forceFrame](self->_lookAroundView, "forceFrame");
}

- (BOOL)cancelPendingMove
{
  int v3;

  v3 = -[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround");
  if (v3)
    LOBYTE(v3) = -[VKMapView cancelPendingMove](self->_lookAroundView, "cancelPendingMove");
  return v3;
}

- (VKMuninMarker)muninMarker
{
  void *v3;

  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[VKMapView currentMarker](self->_lookAroundView, "currentMarker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (VKMuninMarker *)v3;
}

- (void)openInMapsWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a3;
  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundView sharingURL](self, "sharingURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openURL:completionHandler:", v5, v6);

  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (VKLabelMarker)selectedLabelMarker
{
  void *v3;

  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[VKMapView selectedLabelMarker](self->_lookAroundView, "selectedLabelMarker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (VKLabelMarker *)v3;
}

- (BOOL)adequatelyDrawn
{
  _BOOL4 v3;

  v3 = -[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround");
  if (v3)
    LOBYTE(v3) = -[VKMapView getSceneState](self->_lookAroundView, "getSceneState") != 0;
  return v3;
}

- (BOOL)isLoading
{
  return -[VKMapView getSceneState](self->_lookAroundView, "getSceneState") != 2
      && -[VKMapView getSceneState](self->_lookAroundView, "getSceneState") != 3
      && -[VKMapView getSceneState](self->_lookAroundView, "getSceneState") != 4;
}

- (BOOL)moveToMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 orMuninMarker:(id)a5 withHeading:(double)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  GEOStorefrontView *requestedStorefrontView;
  void *v24;

  v12 = a3;
  v13 = a5;
  v14 = (void (**)(id, _QWORD))a7;
  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    if (objc_msgSend(v12, "_hasLookAroundStorefront"))
    {
      -[MKLookAroundView _resetViewState](self, "_resetViewState");
      objc_msgSend(v12, "_geoMapItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_storefrontPresentationInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
      {
        objc_msgSend(v16, "closeUpView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v16, "standOffView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          v22 = v20;
        }
        else
        {
          objc_msgSend(v16, "closeUpView");
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v22;

      }
      self->_storefrontFullyDrawn = 0;
      self->_moveToStorefrontViewInProgress = 0;
      requestedStorefrontView = self->_requestedStorefrontView;
      self->_requestedStorefrontView = 0;

      self->_wantsStorefrontCloseUpView = 0;
      v18 = -[MKLookAroundView _moveToStorefrontView:animated:completionHandler:](self, "_moveToStorefrontView:animated:completionHandler:", v17, 0, v14);
      if (v18)
        v24 = v12;
      else
        v24 = 0;
      objc_storeStrong((id *)&self->_mapItem, v24);

      goto LABEL_21;
    }
    if (v13)
    {
      v18 = -[VKMapView moveToMarker:withHeading:animated:completionHandler:](self->_lookAroundView, "moveToMarker:withHeading:animated:completionHandler:", v13, 0, v14, a6);
      if (v18)
        v19 = v12;
      else
        v19 = 0;
      objc_storeStrong((id *)&self->_mapItem, v19);
      goto LABEL_21;
    }
  }
  if (v14)
    v14[2](v14, 0);
  LOBYTE(v18) = 0;
LABEL_21:

  return v18;
}

- (BOOL)tapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  _BOOL4 v6;
  MKMapItem *mapItem;

  y = a3.y;
  x = a3.x;
  v6 = -[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround");
  if (v6)
  {
    mapItem = self->_mapItem;
    self->_mapItem = 0;

    if ((-[VKMapView tapAtPoint:](self->_lookAroundView, "tapAtPoint:", x, y) & 1) != 0)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      -[MKHapticEngine prepare](self->_hapticEngine, "prepare");
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)jumpToCloseUpView
{
  void *v3;
  void *v4;
  VKMapView *lookAroundView;
  void *v6;
  id v7;

  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_storefrontPresentationInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "closeUpView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    lookAroundView = self->_lookAroundView;
    objc_msgSend(v7, "closeUpView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapView enterMuninForStorefrontView:secondaryStorefrontView:](lookAroundView, "enterMuninForStorefrontView:secondaryStorefrontView:", v6, 0);

    -[VKMapView forceLayout](self->_lookAroundView, "forceLayout");
  }

}

- (void)jumpToStandOffView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_storefrontPresentationInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "standOffView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v10, "closeUpView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v10, "standOffView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v10, "closeUpView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  if (v7)
  {
    -[VKMapView enterMuninForStorefrontView:secondaryStorefrontView:](self->_lookAroundView, "enterMuninForStorefrontView:secondaryStorefrontView:", v7, v9);
    -[VKMapView forceLayout](self->_lookAroundView, "forceLayout");
  }

}

- (BOOL)_moveToStorefrontView:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  GEOStorefrontView **p_requestedStorefrontView;
  char v12;
  void *v13;
  VKMapView *lookAroundView;
  id v15;
  id v16;
  GEOStorefrontView *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  id location;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (v9)
  {
    p_requestedStorefrontView = &self->_requestedStorefrontView;
    objc_storeStrong((id *)&self->_requestedStorefrontView, a3);
    if (self->_moveToStorefrontViewInProgress)
    {
      self->_wantsStorefrontCloseUpView = 0;
      v12 = 1;
    }
    else
    {
      self->_moveToStorefrontViewInProgress = 1;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("MKLookAroundViewWillMoveToStorefront"), self, 0);
      objc_initWeak(&location, self);
      lookAroundView = self->_lookAroundView;
      v19[1] = 3221225472;
      v19[2] = __69__MKLookAroundView__moveToStorefrontView_animated_completionHandler___block_invoke;
      v19[3] = &unk_1E20D8370;
      v19[0] = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v23, &location);
      v15 = v13;
      v20 = v15;
      v21 = v9;
      v24 = v6;
      v16 = v10;
      v22 = v16;
      v12 = -[VKMapView moveToStorefrontView:animated:completionHandler:](lookAroundView, "moveToStorefrontView:animated:completionHandler:", v21, v6, v19);
      if ((v12 & 1) == 0)
      {
        self->_moveToStorefrontViewInProgress = 0;
        v17 = *p_requestedStorefrontView;
        *p_requestedStorefrontView = 0;

        if (v16)
          (*((void (**)(id, uint64_t))v16 + 2))(v16, 1);
      }

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __69__MKLookAroundView__moveToStorefrontView_animated_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  id *WeakRetained;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id *v12;

  v4 = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 603) = 0;
    v6 = *(void **)(a1 + 32);
    v12 = WeakRetained;
    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MKLookAroundViewDidMoveToStorefront"), v7, 0);

    v8 = v12[78];
    v9 = v8;
    if (!v8 || v8 == *(id *)(a1 + 40))
    {
      v10 = v12[78];
      v12[78] = 0;

      v11 = *(_QWORD *)(a1 + 48);
      if (v11)
        (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, a2);
    }
    else
    {
      objc_msgSend(v12, "_moveToStorefrontView:animated:completionHandler:", v8, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
    }

    WeakRetained = v12;
  }

}

- (void)moveToCloseUpView
{
  -[MKLookAroundView moveToCloseUpViewAnimated:](self, "moveToCloseUpViewAnimated:", 1);
}

- (void)moveToCloseUpViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_storefrontPresentationInfo");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "closeUpView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v9;
    if (v6)
    {
      if (self->_storefrontFullyDrawn || !v3)
      {
        objc_msgSend(v9, "closeUpView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKLookAroundView _moveToStorefrontView:animated:completionHandler:](self, "_moveToStorefrontView:animated:completionHandler:", v8, v3, 0);

        v7 = v9;
      }
      else
      {
        self->_wantsStorefrontCloseUpView = 1;
      }
    }

  }
}

- (void)moveToStandOffView
{
  -[MKLookAroundView moveToStandOffViewAnimated:](self, "moveToStandOffViewAnimated:", 1);
}

- (void)moveToStandOffViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_storefrontPresentationInfo");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "standOffView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v8, "standOffView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLookAroundView _moveToStorefrontView:animated:completionHandler:](self, "_moveToStorefrontView:animated:completionHandler:", v7, v3, 0);

    }
  }
}

- (void)selectLabelMarker:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  MKMapItem *mapItem;
  VKMapView *lookAroundView;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  MKLookAroundView *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v4);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = CFSTR("nil");
    }
    MKGetMKLookAroundLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v15 = self;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_DEBUG, "<MKLookAroundView: %p> -selectLabelMarker:%@", buf, 0x16u);
    }

    if (v4 && objc_msgSend(v4, "hasBusinessID"))
    {
      mapItem = self->_mapItem;
      self->_mapItem = 0;

      -[MKLookAroundView _refineLabelMarker:](self, "_refineLabelMarker:", v4);
      objc_initWeak((id *)buf, self);
      lookAroundView = self->_lookAroundView;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __38__MKLookAroundView_selectLabelMarker___block_invoke;
      v12[3] = &unk_1E20D8398;
      objc_copyWeak(&v13, (id *)buf);
      -[VKMapView selectLabelMarker:completion:](lookAroundView, "selectLabelMarker:completion:", v4, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __38__MKLookAroundView_selectLabelMarker___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (a2)
    {
      objc_msgSend(WeakRetained, "selectedLabelMarker");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(v6, "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lookAroundView:didSelectLabelMarker:", v6, v4);

      }
    }
    else
    {
      objc_msgSend(WeakRetained, "deselectLabelMarker");
    }
    WeakRetained = v6;
  }

}

- (void)deselectLabelMarker
{
  NSObject *v3;
  MKMapItem *mapItem;
  void *v5;
  void *v6;
  int v7;
  MKLookAroundView *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    MKGetMKLookAroundLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v7 = 134217984;
      v8 = self;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "<MKLookAroundView: %p> -deselectLabelMarker", (uint8_t *)&v7, 0xCu);
    }

    mapItem = self->_mapItem;
    self->_mapItem = 0;

    -[VKMapView selectedLabelMarker](self->_lookAroundView, "selectedLabelMarker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[VKMapView deselectLabelMarker](self->_lookAroundView, "deselectLabelMarker");
      -[MKLookAroundView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lookAroundView:didDeselectLabelMarker:", self, v5);

    }
  }
}

- (void)recordTriggerAction:(int)a3
{
  NSDate *v5;
  NSDate *startTime;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startTime = self->_startTime;
    self->_startTime = v5;

    self->_triggerAction = a3;
  }
}

- (id)labelMarkerForCustomFeatureAnnotation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[VKMapView labelMarkerForCustomFeatureAnnotation:](self->_lookAroundView, "labelMarkerForCustomFeatureAnnotation:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addCustomFeatureDataSource:(id)a3
{
  -[VKMapView addCustomFeatureDataSource:](self->_lookAroundView, "addCustomFeatureDataSource:", a3);
}

- (void)removeCustomFeatureDataSource:(id)a3
{
  -[VKMapView removeCustomFeatureDataSource:](self->_lookAroundView, "removeCustomFeatureDataSource:", a3);
}

- (void)lookAroundGestureControllerDidStartUserInteraction:(id)a3
{
  id v4;

  -[MKLookAroundView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lookAroundViewDidStartUserInteraction:", self);

}

- (void)lookAroundGestureControllerDidStopUserInteraction:(id)a3
{
  id v4;

  -[MKLookAroundView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lookAroundViewDidStopUserInteraction:", self);

}

- (void)lookAroundGestureController:(id)a3 didTapLabelMarker:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MKLookAroundView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lookAroundView:didTapLabelMarker:", self, v5);

}

- (void)lookAroundGestureController:(id)a3 didTapAtPoint:(CGPoint)a4 areaAvailable:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  id v9;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  -[MKLookAroundView delegate](self, "delegate", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lookAroundView:didTapAtPoint:areaAvailable:", self, v5, x, y);

}

- (void)lookAroundGestureController:(id)a3 didZoomWithDirection:(int64_t)a4 type:(int64_t)a5
{
  id v8;

  -[MKLookAroundView delegate](self, "delegate", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lookAroundView:didZoomWithDirection:type:", self, a4, a5);

}

- (void)lookAroundGestureControllerDidPan:(id)a3
{
  id v4;

  -[MKLookAroundView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lookAroundViewDidPan:", self);

}

- (BOOL)lookAroundGestureControllerShouldReceive:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[MKLookAroundView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MKLookAroundView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "lookAroundView:shouldReceiveTouch:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)mapLayerDidChangeVisibleRegion
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[MKLookAroundView _updateCameraFrame](self, "_updateCameraFrame");
    -[MKLookAroundView _updateCompass](self, "_updateCompass");
    -[MKLookAroundView muninViewState](self, "muninViewState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cameraFrame");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "latitude");
    v5 = v4;
    objc_msgSend(v7, "longitude");
    -[MKLookAroundView _updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:](self, "_updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:", 0, v5, v6);

  }
}

- (void)mapLayerWillChangeRegionAnimated:(BOOL)a3
{
  void *v4;
  char v5;
  id v6;

  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround", a3)
    && !self->_didStartRegionChange
    && !self->_didChangeCameraFrame)
  {
    self->_didStartRegionChange = 1;
    -[MKLookAroundView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[MKLookAroundView delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lookAroundViewWillChangeRegion:", self);

    }
  }
}

- (void)mapLayerDidChangeRegionAnimated:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround", a3))
  {
    if (self->_didStartRegionChange)
    {
      self->_didStartRegionChange = 0;
      self->_didChangeCameraFrame = 0;
      -[MKLookAroundView delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        -[MKLookAroundView delegate](self, "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lookAroundViewDidChangeRegion:", self);

      }
    }
    -[MKLookAroundView _updateCameraFrame](self, "_updateCameraFrame");
    -[MKLookAroundView _updateCompass](self, "_updateCompass");
    -[MKLookAroundView muninViewState](self, "muninViewState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cameraFrame");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "latitude");
    v9 = v8;
    objc_msgSend(v11, "longitude");
    -[MKLookAroundView _updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:](self, "_updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:", 1, v9, v10);

  }
}

- (void)mapLayer:(id)a3 nearestJunctionDidChange:(id)a4 currentRoad:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *lastJunctionName;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  NSString *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  id v34;

  v34 = a4;
  v7 = a5;
  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    objc_msgSend(v34, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = (void *)v8,
          objc_msgSend(v34, "name"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "length"),
          v10,
          v9,
          v11))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      _MKLocalizedStringFromThisBundle(CFSTR("%@"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, v14);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      lastJunctionName = self->_lastJunctionName;
      self->_lastJunctionName = v15;

    }
    else
    {
      objc_msgSend(v7, "roadName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length"))
      {
        objc_msgSend(v34, "roads");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19 >= 2)
        {
          objc_msgSend(v7, "roadName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "roads");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "roadName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v22, "isEqualToString:", v13));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "roadName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v24, "length"))
          {
            v25 = (void *)MEMORY[0x1E0CB3940];
            _MKLocalizedStringFromThisBundle(CFSTR("%@ & %@"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", v26, v13, v24);
            v27 = (NSString *)objc_claimAutoreleasedReturnValue();
            v28 = self->_lastJunctionName;
            self->_lastJunctionName = v27;

          }
          else
          {
            v26 = self->_lastJunctionName;
            self->_lastJunctionName = 0;
          }

          goto LABEL_13;
        }
      }
      else
      {

      }
      v13 = self->_lastJunctionName;
      self->_lastJunctionName = 0;
    }
LABEL_13:

    -[MKLookAroundView muninViewState](self, "muninViewState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "cameraFrame");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "latitude");
    v32 = v31;
    objc_msgSend(v30, "longitude");
    -[MKLookAroundView _updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:](self, "_updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:", 0, v32, v33);

  }
}

- (void)mapLayerWillAnimateToLocation:(id)a3
{
  double var1;
  double var0;
  id v6;

  var1 = a3.var1;
  var0 = a3.var0;
  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[MKLookAroundView _updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:](self, "_updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:", 1, var0, var1);
    -[MKLookAroundView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lookAroundViewWillChangeLocationInfo:", self);

  }
}

- (void)mapLayerWasUnableToAnimate
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[MKHapticEngine playFailure](self->_hapticEngine, "playFailure");
    -[MKLookAroundBumpFlash flash](self->_bumpFlashView, "flash");
    MKGetMKLookAroundLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_ERROR, "MKLookAroundView - No path available to target point", v4, 2u);
    }

  }
}

- (void)mapLayerDidChangeSceneState:(id)a3 withState:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t triggerAction;
  void *v12;
  unint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD v21[5];
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a4)
    {
      if (!self->_didTriggerAdequatelyDrawnNotification)
      {
        objc_msgSend(v6, "postNotificationName:object:", CFSTR("MKLookAroundViewDidBecomeAdequatelyDrawn"), self);
        self->_didTriggerAdequatelyDrawnNotification = 1;
        -[UIImageView superview](self->_transitionGridImageview, "superview");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v20[4] = self;
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __58__MKLookAroundView_mapLayerDidChangeSceneState_withState___block_invoke;
          v21[3] = &unk_1E20D7D98;
          v21[4] = self;
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __58__MKLookAroundView_mapLayerDidChangeSceneState_withState___block_invoke_2;
          v20[3] = &unk_1E20D82F8;
          objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_animateWithDuration:animations:completion:", v21, v20, 0.200000003);
        }
      }
      if (a4 - 1 < 2)
        goto LABEL_26;
      if (a4 == 3)
      {
LABEL_17:
        v13 = a4 - 3;
        if (self->_didChangeCameraFrame && !self->_didStartRegionChange)
        {
          self->_didChangeCameraFrame = 0;
          -[MKLookAroundView delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_opt_respondsToSelector();

          if ((v15 & 1) != 0)
          {
            -[MKLookAroundView delegate](self, "delegate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "lookAroundViewDidChangeRegion:", self);

          }
        }
        v22 = CFSTR("hasFailedTiles");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13 < 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MKLookAroundViewDidBecomeFullyDrawn"), self, v18);

        goto LABEL_23;
      }
      if (a4 == 4)
      {
LABEL_26:
        if (!self->_hasValidViewState)
        {
          -[MKLookAroundView mapLayerDidChangeVisibleRegion](self, "mapLayerDidChangeVisibleRegion");
          self->_hasValidViewState = 1;
        }
        if (-[MKMapItem _hasLookAroundStorefront](self->_mapItem, "_hasLookAroundStorefront"))
        {
          self->_storefrontFullyDrawn = 1;
          if (self->_wantsStorefrontCloseUpView)
          {
            self->_wantsStorefrontCloseUpView = 0;
            -[MKLookAroundView moveToCloseUpView](self, "moveToCloseUpView");
          }
        }
        if (self->_triggerAction)
        {
          -[NSDate timeIntervalSinceNow](self->_startTime, "timeIntervalSinceNow");
          v10 = (void *)MEMORY[0x1E0D263E8];
          triggerAction = self->_triggerAction;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 * -1000.0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v19) = 0;
          objc_msgSend(v10, "captureDisplayAnalyticWithDisplayActionTrigger:requiredResourcesAvailable:totalTime:requestedImageCount:renderedImageCount:movementDistance:meanImageSpacing:displayEvent:", triggerAction, 0, v12, 0, 0, 0, 0, v19);

          self->_triggerAction = 0;
        }
        if (a4 - 2 > 2)
          goto LABEL_23;
        goto LABEL_17;
      }
    }
    else
    {
      self->_didTriggerAdequatelyDrawnNotification = 0;
    }
LABEL_23:

  }
}

uint64_t __58__MKLookAroundView_mapLayerDidChangeSceneState_withState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
}

uint64_t __58__MKLookAroundView_mapLayerDidChangeSceneState_withState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "removeFromSuperview");
}

- (void)_handleCompassSelect
{
  -[MKLookAroundView setPresentationYaw:pitch:animated:](self, "setPresentationYaw:pitch:animated:", 1, 0.0, 0.0);
}

- (id)_locationInfoWithHeading:(double)a3
{
  NSArray *v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_lastGroundViews;
  v5 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "isHeadingInRange:", a3, (_QWORD)v10))
        {
          objc_msgSend(v8, "locationInfo");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v5 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)_pointContainedInCompassView:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  BOOL result;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  result = 0;
  if (!-[MKLookAroundView isCompassHidden](self, "isCompassHidden"))
  {
    -[MKCompassView frame](self->_compassView, "frame");
    v9 = CGRectInset(v8, -9.0, -9.0);
    v7.x = x;
    v7.y = y;
    if (CGRectContainsPoint(v9, v7))
      return 1;
  }
  return result;
}

- (void)_refineLabelMarker:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  MKMapItemIdentifier *v9;
  void *v10;
  void *v11;
  MKMapServiceTicket *v12;
  MKMapServiceTicket *refineTicket;
  MKMapServiceTicket *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  objc_msgSend(v4, "coordinate");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D271C0]), "initWithMUID:coordinate:", objc_msgSend(v4, "businessID"), v6, v7);
  v9 = -[MKMapItemIdentifier initWithGEOMapItemIdentifier:]([MKMapItemIdentifier alloc], "initWithGEOMapItemIdentifier:", v8);
  -[MKMapServiceTicket cancel](self->_refineTicket, "cancel");
  +[MKMapService sharedService](MKMapService, "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ticketForIdentifiers:traits:", v11, 0);
  v12 = (MKMapServiceTicket *)objc_claimAutoreleasedReturnValue();
  refineTicket = self->_refineTicket;
  self->_refineTicket = v12;

  objc_initWeak(&location, self);
  v14 = self->_refineTicket;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __39__MKLookAroundView__refineLabelMarker___block_invoke;
  v16[3] = &unk_1E20D83E8;
  objc_copyWeak(&v18, &location);
  v15 = v4;
  v17 = v15;
  -[MKMapServiceTicket submitWithHandler:networkActivity:](v14, "submitWithHandler:networkActivity:", v16, 0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __39__MKLookAroundView__refineLabelMarker___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    MKGetMKLookAroundLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_ERROR, "Error: Identifier refinement ticket failed: %@", buf, 0xCu);
    }

  }
  else if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, WeakRetained);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__MKLookAroundView__refineLabelMarker___block_invoke_2;
    block[3] = &unk_1E20D83C0;
    objc_copyWeak(&v14, (id *)buf);
    v12 = *(id *)(a1 + 32);
    v13 = v9;
    v10 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

}

void __39__MKLookAroundView__refineLabelMarker___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "selectedLabelMarker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);

    if (v3 == v4)
    {
      objc_storeStrong(v6 + 76, *(id *)(a1 + 40));
      objc_msgSend(v6, "_updateLocationInfo");
    }
    v5 = v6[69];
    v6[69] = 0;

    WeakRetained = v6;
  }

}

- (void)_resetViewState
{
  NSArray *lastGroundViews;
  NSString *lastJunctionName;
  MKMapItem *mapItem;
  MKMapItem *revGeoMapItem;
  MKMapServiceTicket *refineTicket;
  MKMapServiceTicket *revGeoTicket;

  self->_hasValidViewState = 0;
  self->_lastCoordinate = (CLLocationCoordinate2D)MKCoordinateInvalid;
  lastGroundViews = self->_lastGroundViews;
  self->_lastGroundViews = 0;

  lastJunctionName = self->_lastJunctionName;
  self->_lastJunctionName = 0;

  mapItem = self->_mapItem;
  self->_mapItem = 0;

  revGeoMapItem = self->_revGeoMapItem;
  self->_revGeoMapItem = 0;

  -[MKMapServiceTicket cancel](self->_refineTicket, "cancel");
  refineTicket = self->_refineTicket;
  self->_refineTicket = 0;

  -[MKMapServiceTicket cancel](self->_revGeoTicket, "cancel");
  revGeoTicket = self->_revGeoTicket;
  self->_revGeoTicket = 0;

  self->_storefrontFullyDrawn = 0;
}

- (void)_reverseGeocodeCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v6;
  MKMapServiceTicket *v7;
  MKMapServiceTicket *revGeoTicket;
  MKMapServiceTicket *v9;
  _QWORD v10[4];
  id v11;
  id location;

  longitude = a3.longitude;
  latitude = a3.latitude;
  self->_lastCoordinate = a3;
  -[MKMapServiceTicket cancel](self->_revGeoTicket, "cancel");
  +[MKMapService sharedService](MKMapService, "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ticketForReverseGeocodeCoordinate:traits:", 0, latitude, longitude);
  v7 = (MKMapServiceTicket *)objc_claimAutoreleasedReturnValue();
  revGeoTicket = self->_revGeoTicket;
  self->_revGeoTicket = v7;

  objc_initWeak(&location, self);
  v9 = self->_revGeoTicket;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__MKLookAroundView__reverseGeocodeCoordinate___block_invoke;
  v10[3] = &unk_1E20D8438;
  objc_copyWeak(&v11, &location);
  -[MKMapServiceTicket submitWithHandler:networkActivity:](v9, "submitWithHandler:networkActivity:", v10, 0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __46__MKLookAroundView__reverseGeocodeCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    MKGetMKLookAroundLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_ERROR, "Error: ReverseGeocodeCoordinate ticket failed: %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_geoMapItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __46__MKLookAroundView__reverseGeocodeCoordinate___block_invoke_2;
    v19[3] = &unk_1E20D8410;
    v13 = v10;
    v20 = v13;
    objc_msgSend(v11, "iterateGroundViewsWithBlock:", v19);

    objc_initWeak((id *)buf, WeakRetained);
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __46__MKLookAroundView__reverseGeocodeCoordinate___block_invoke_3;
    v15[3] = &unk_1E20D83C0;
    objc_copyWeak(&v18, (id *)buf);
    v16 = v13;
    v17 = v9;
    v14 = v9;
    v8 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);

LABEL_6:
  }

}

void __46__MKLookAroundView__reverseGeocodeCoordinate___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, double a5, double a6)
{
  void *v10;
  id v11;
  id v12;
  id v13;
  MKLookAroundGroundViewInfo *v14;

  v10 = *(void **)(a1 + 32);
  v11 = a4;
  v12 = a3;
  v13 = a2;
  v14 = -[MKLookAroundGroundViewInfo initWithStartHeading:endHeading:localityName:locationName:secondaryLocationName:]([MKLookAroundGroundViewInfo alloc], "initWithStartHeading:endHeading:localityName:locationName:secondaryLocationName:", v13, v12, v11, a5, a6);

  objc_msgSend(v10, "addObject:", v14);
}

void __46__MKLookAroundView__reverseGeocodeCoordinate___block_invoke_3(id *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (objc_msgSend(a1[4], "count"))
    {
      v3 = objc_msgSend(a1[4], "copy");
      v4 = (void *)*((_QWORD *)v6 + 67);
      *((_QWORD *)v6 + 67) = v3;

      objc_storeStrong((id *)v6 + 77, a1[5]);
      objc_msgSend(v6, "_updateLocationInfo");
    }
    v5 = (void *)*((_QWORD *)v6 + 70);
    *((_QWORD *)v6 + 70) = 0;

    WeakRetained = v6;
  }

}

- (void)_updateCameraFrame
{
  void *v3;
  void *v4;
  double v5;
  long double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;

  -[MKLookAroundView muninViewState](self, "muninViewState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraFrame");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  -[VKMapView centerCoordinate](self->_lookAroundView, "centerCoordinate");
  objc_msgSend(v4, "setLatitude:");
  -[VKMapView centerCoordinate](self->_lookAroundView, "centerCoordinate");
  objc_msgSend(v4, "setLongitude:", v5);
  -[VKMapView altitude](self->_lookAroundView, "altitude");
  objc_msgSend(v4, "setAltitude:");
  -[VKMapView yaw](self->_lookAroundView, "yaw");
  v7 = fmod(v6, 360.0);
  if (v7 < 0.0)
    v7 = v7 + 360.0;
  objc_msgSend(v4, "setYaw:", v7);
  -[VKMapView pitch](self->_lookAroundView, "pitch");
  objc_msgSend(v4, "setPitch:");
  objc_msgSend(v4, "setRoll:", 0.0);
  if ((objc_msgSend(v4, "isEqual:", v15) & 1) == 0)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setCameraFrame:", v4);
    -[MKLookAroundView muninViewState](self, "muninViewState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocationInfo:", v10);

    objc_storeStrong((id *)&self->_muninViewState, v8);
    if (!self->_didChangeCameraFrame && !self->_didStartRegionChange)
    {
      self->_didChangeCameraFrame = 1;
      -[MKLookAroundView delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[MKLookAroundView delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lookAroundViewWillChangeRegion:", self);

      }
    }
    -[MKLookAroundView delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lookAroundView:didChangeCameraFrame:", self, v4);

  }
}

- (void)_updateCompass
{
  -[VKMapView heading](self->_lookAroundView, "heading");
  -[MKCompassView setMapHeading:](self->_compassView, "setMapHeading:");
}

- (void)_updateCompassInsets
{
  UIEdgeInsets *p_compassInsets;
  uint64_t v4;
  uint64_t v5;

  p_compassInsets = &self->_compassInsets;
  -[NSLayoutConstraint setConstant:](self->_compassTopOrBottomConstraint, "setConstant:", self->_compassInsets.top);
  v4 = -[MKLookAroundView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v5 = 24;
  if (v4 == 1)
    v5 = 8;
  -[NSLayoutConstraint setConstant:](self->_compassTrailingConstraint, "setConstant:", -*(double *)((char *)&p_compassInsets->top + v5));
  -[MKLookAroundView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setInitialLocationInfo
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[MKLookAroundView muninViewState](self, "muninViewState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraFrame");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "latitude");
  v5 = v4;
  objc_msgSend(v7, "longitude");
  -[MKLookAroundView _updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:](self, "_updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:", 1, v5, v6);

}

- (void)_updateLocationInfo
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  GEOMuninViewState *muninViewState;
  void *v19;
  id v20;

  -[MKLookAroundView muninViewState](self, "muninViewState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInfo");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v20, "copy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  -[MKLookAroundView muninViewState](self, "muninViewState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cameraFrame");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "yaw");
  -[MKLookAroundView _locationInfoWithHeading:](self, "_locationInfoWithHeading:");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v7;
  v13 = v12;

  if (self->_lastJunctionName)
  {
    v14 = (void *)objc_msgSend(v13, "copy");

    objc_msgSend(v14, "setLocationName:", self->_lastJunctionName);
    v13 = v14;
  }
  if ((objc_msgSend(v13, "isEqual:", v20) & 1) == 0)
  {
    v15 = (void *)objc_opt_new();
    -[MKLookAroundView muninViewState](self, "muninViewState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cameraFrame");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCameraFrame:", v17);

    objc_msgSend(v15, "setLocationInfo:", v13);
    muninViewState = self->_muninViewState;
    self->_muninViewState = (GEOMuninViewState *)v15;

    -[MKLookAroundView delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lookAroundView:didChangeLocationInfo:", self, v13);

  }
}

- (void)_updateLocationInfoForCoordinate:(CLLocationCoordinate2D)a3 allowReverseGeocodeIfNeeded:(BOOL)a4
{
  if (vabdd_f64(a3.latitude, self->_lastCoordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(a3.longitude, self->_lastCoordinate.longitude) >= 0.00000000999999994)
  {
    if (a4)
      -[MKLookAroundView _reverseGeocodeCoordinate:](self, "_reverseGeocodeCoordinate:");
  }
  else if (!self->_revGeoTicket)
  {
    -[MKLookAroundView _updateLocationInfo](self, "_updateLocationInfo", a4);
  }
}

- (NSArray)visiblePlaceMUIDs
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VKMapView labelMarkers](self->_lookAroundView, "labelMarkers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "featureType") == 14)
        {
          if (objc_msgSend(v9, "featureID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "featureID"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v10);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v11;
}

- (NSArray)visibleRoadLabels
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VKMapView labelMarkers](self->_lookAroundView, "labelMarkers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "featureType") == 15)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)imageResources
{
  void *v3;

  if (-[MKLookAroundView hasEnteredLookAround](self, "hasEnteredLookAround"))
  {
    -[VKMapView onscreenImageResources](self->_lookAroundView, "onscreenImageResources");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (id)_imageFromLookAroundView
{
  CGFloat v3;
  CGFloat v4;
  void *v5;
  CGSize v7;

  -[VKMapView frame](self->_lookAroundView, "frame");
  v7.width = v3;
  v7.height = v4;
  UIGraphicsBeginImageContextWithOptions(v7, 0, 0.0);
  -[VKMapView renderInContext:](self->_lookAroundView, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v5;
}

- (void)setLookAroundView:(id)a3
{
  objc_storeStrong((id *)&self->_lookAroundView, a3);
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIEdgeInsets)compassInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_compassInsets.top;
  left = self->_compassInsets.left;
  bottom = self->_compassInsets.bottom;
  right = self->_compassInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)hasEnteredLookAround
{
  return self->_hasEnteredLookAround;
}

- (void)setHasEnteredLookAround:(BOOL)a3
{
  self->_hasEnteredLookAround = a3;
}

- (BOOL)navigatingEnabled
{
  return self->_navigatingEnabled;
}

- (BOOL)panningEnabled
{
  return self->_panningEnabled;
}

- (BOOL)zoomingEnabled
{
  return self->_zoomingEnabled;
}

- (MKLookAroundViewDelegate)delegate
{
  return (MKLookAroundViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return self->_pointOfInterestFilter;
}

- (GEOMuninViewState)muninViewState
{
  return self->_muninViewState;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (MKMapItem)revGeoMapItem
{
  return self->_revGeoMapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_pointOfInterestFilter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hapticEngine, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_requestedStorefrontView, 0);
  objc_storeStrong((id *)&self->_revGeoMapItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_revGeoTicket, 0);
  objc_storeStrong((id *)&self->_refineTicket, 0);
  objc_storeStrong((id *)&self->_lastJunctionName, 0);
  objc_storeStrong((id *)&self->_lastGroundViews, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_gestureController, 0);
  objc_storeStrong((id *)&self->_bumpFlashView, 0);
  objc_storeStrong((id *)&self->_compassSelectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_compassTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_compassTopOrBottomConstraint, 0);
  objc_storeStrong((id *)&self->_compassView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_transitionGridImageview, 0);
  objc_storeStrong((id *)&self->_transitionEndImageview, 0);
  objc_storeStrong((id *)&self->_transitionStartImageview, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
}

- (id)_mapkit_locationTitle
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;

  -[MKLookAroundView muninViewState](self, "muninViewState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "locationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "locationName");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E20DFC00;
  }

  return v6;
}

- (id)_mapkit_locationSubtitle
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  -[MKLookAroundView muninViewState](self, "muninViewState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "secondaryLocationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "secondaryLocationName");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E20DFC00;
  }
  objc_msgSend(v3, "localityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    if (-[__CFString length](v6, "length"))
    {
      -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR(", "));
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (__CFString *)v9;
    }
    objc_msgSend(v3, "localityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v11;
  }

  return v6;
}

@end
