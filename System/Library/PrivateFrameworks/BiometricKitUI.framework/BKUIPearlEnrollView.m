@implementation BKUIPearlEnrollView

- (BKUIPearlEnrollView)initWithVideoCaptureSession:(id)a3 inSheet:(BOOL)a4 squareNeedsPositionLayout:(BOOL)a5
{
  return -[BKUIPearlEnrollView initWithFrame:videoCaptureSession:inSheet:squareNeedsPositionLayout:](self, "initWithFrame:videoCaptureSession:inSheet:squareNeedsPositionLayout:", a3, a4, a5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (BKUIPearlEnrollView)initWithFrame:(CGRect)a3 videoCaptureSession:(id)a4 inSheet:(BOOL)a5 squareNeedsPositionLayout:(BOOL)a6
{
  return -[BKUIPearlEnrollView initWithFrame:videoCaptureSession:inSheet:positioningGuideView:squareNeedsPositionLayout:](self, "initWithFrame:videoCaptureSession:inSheet:positioningGuideView:squareNeedsPositionLayout:", a4, a5, 0, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BKUIPearlEnrollView)initWithFrame:(CGRect)a3 videoCaptureSession:(id)a4 inSheet:(BOOL)a5 positioningGuideView:(id)a6 squareNeedsPositionLayout:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  BKUIPearlEnrollView *v16;
  BKUIPearlEnrollView *v17;
  BKUIPearlVideoCaptureSession *v18;
  BKUIPearlVideoCaptureSession *videoCaptureSession;
  void *v20;
  uint64_t v21;
  UIView *cameraShadeView;
  UIView *v23;
  void *v24;
  uint64_t v25;
  CAShapeLayer *circleMaskLayer;
  uint64_t v27;
  uint64_t v28;
  UIView *circleMaskView;
  void *v30;
  uint64_t v31;
  CAShapeLayer *roundedRectMaskLayer;
  uint64_t v33;
  UIView *roundedRectMaskView;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  BKUIPearlPositioningGuideView *v40;
  uint64_t v41;
  BKUIPearlPositioningGuideView *positioningGuide;
  BKUIPearlPositioningGuideView *v43;
  UILabel *v44;
  UILabel *repositionPhoneLabel;
  UILabel *v46;
  void *v47;
  UILabel *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  BKUIPearlPillContainerView *pillContainer;
  BKUIPearlCrossHairsView *v54;
  void *v55;
  void *v56;
  void *v57;
  UILabel *v58;
  UILabel *debugLabel;
  UILabel *v60;
  void *v61;
  UILabel *v62;
  void *v63;
  void *v64;
  UILayoutGuide *v65;
  UILayoutGuide *portalLayoutGuide;
  void *v67;
  BKUIPearlEnrollView *v68;
  void *v69;
  id v71;
  _QWORD v72[4];
  BKUIPearlEnrollView *v73;
  id v74;
  id location;
  objc_super v76;
  _QWORD v77[3];

  v7 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v77[2] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v71 = a6;
  v76.receiver = self;
  v76.super_class = (Class)BKUIPearlEnrollView;
  v16 = -[BKUIPearlEnrollView initWithFrame:](&v76, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    v16->_inSheet = a5;
    if (v15)
      v18 = (BKUIPearlVideoCaptureSession *)v15;
    else
      v18 = objc_alloc_init(BKUIPearlVideoCaptureSession);
    videoCaptureSession = v17->_videoCaptureSession;
    v17->_videoCaptureSession = v18;

    -[BKUIPearlVideoCaptureSession setDelegate:](v17->_videoCaptureSession, "setDelegate:", v17);
    v17->_squareNeedsPositionLayout = v7;
    v17->_didStartCapture = 0;
    v17->_activated = 0;
    -[BKUIPearlEnrollView layer](v17, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMasksToBounds:", 1);

    -[BKUIPearlEnrollView setClipsToBounds:](v17, "setClipsToBounds:", 1);
    v17->_pitchCorrectionSamples = 0.0;
    v17->_pitchCorrection = 0.0;
    v17->_correctionSamplesCount = 0;
    v17->_pitchMin = 1.79769313e308;
    v17->_pitchMax = -1.79769313e308;
    v21 = objc_opt_new();
    cameraShadeView = v17->_cameraShadeView;
    v17->_cameraShadeView = (UIView *)v21;

    -[UIView setAlpha:](v17->_cameraShadeView, "setAlpha:", 0.0);
    v23 = v17->_cameraShadeView;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v24);

    -[BKUIPearlEnrollView addSubview:](v17, "addSubview:", v17->_cameraShadeView);
    v25 = objc_opt_new();
    circleMaskLayer = v17->_circleMaskLayer;
    v17->_circleMaskLayer = (CAShapeLayer *)v25;

    v27 = *MEMORY[0x1E0CD2B70];
    -[CAShapeLayer setFillRule:](v17->_circleMaskLayer, "setFillRule:", *MEMORY[0x1E0CD2B70]);
    v28 = objc_opt_new();
    circleMaskView = v17->_circleMaskView;
    v17->_circleMaskView = (UIView *)v28;

    -[UIView layer](v17->_circleMaskView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setMask:", v17->_circleMaskLayer);

    -[UIView setClipsToBounds:](v17->_circleMaskView, "setClipsToBounds:", 1);
    -[UIView setAlpha:](v17->_circleMaskView, "setAlpha:", 0.0);
    -[BKUIPearlEnrollView addSubview:](v17, "addSubview:", v17->_circleMaskView);
    v31 = objc_opt_new();
    roundedRectMaskLayer = v17->_roundedRectMaskLayer;
    v17->_roundedRectMaskLayer = (CAShapeLayer *)v31;

    -[CAShapeLayer setFillRule:](v17->_roundedRectMaskLayer, "setFillRule:", v27);
    v33 = objc_opt_new();
    roundedRectMaskView = v17->_roundedRectMaskView;
    v17->_roundedRectMaskView = (UIView *)v33;

    -[UIView layer](v17->_roundedRectMaskView, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setMask:", v17->_roundedRectMaskLayer);

    -[UIView setClipsToBounds:](v17->_roundedRectMaskView, "setClipsToBounds:", 1);
    -[UIView setAlpha:](v17->_roundedRectMaskView, "setAlpha:", 0.0);
    -[BKUIPearlEnrollView addSubview:](v17, "addSubview:", v17->_roundedRectMaskView);
    if (v71)
    {
      objc_storeStrong((id *)&v17->_positioningGuide, a6);
      v36 = *MEMORY[0x1E0C9D648];
      v37 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v38 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v39 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      v40 = [BKUIPearlPositioningGuideView alloc];
      v36 = *MEMORY[0x1E0C9D648];
      v37 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v38 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v39 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v41 = -[BKUIPearlPositioningGuideView initWithFrame:](v40, "initWithFrame:", *MEMORY[0x1E0C9D648], v37, v38, v39);
      positioningGuide = v17->_positioningGuide;
      v17->_positioningGuide = (BKUIPearlPositioningGuideView *)v41;

    }
    -[BKUIPearlPositioningGuideView setInSheet:](v17->_positioningGuide, "setInSheet:", -[BKUIPearlEnrollView inSheet](v17, "inSheet"));
    -[BKUIPearlPositioningGuideView setAlpha:](v17->_positioningGuide, "setAlpha:", 0.0);
    v43 = v17->_positioningGuide;
    -[BKUIPearlEnrollView pillRingRadius](v17, "pillRingRadius");
    -[BKUIPearlPositioningGuideView setRingRadius:](v43, "setRingRadius:");
    -[BKUIPearlEnrollView addSubview:](v17, "addSubview:", v17->_positioningGuide);
    -[BKUIPearlPositioningGuideView setRoundedRectMaskLayer:](v17->_positioningGuide, "setRoundedRectMaskLayer:", v17->_roundedRectMaskLayer);
    v44 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    repositionPhoneLabel = v17->_repositionPhoneLabel;
    v17->_repositionPhoneLabel = v44;

    -[UILabel setAlpha:](v17->_repositionPhoneLabel, "setAlpha:", 0.0);
    -[UILabel setTextAlignment:](v17->_repositionPhoneLabel, "setTextAlignment:", 1);
    v46 = v17->_repositionPhoneLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v46, "setTextColor:", v47);

    -[UILabel setNumberOfLines:](v17->_repositionPhoneLabel, "setNumberOfLines:", 0);
    v48 = v17->_repositionPhoneLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 20.0, *MEMORY[0x1E0CEB5D0]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v48, "setFont:", v49);

    -[UILabel layer](v17->_repositionPhoneLabel, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setCompositingFilter:", v51);

    -[BKUIPearlEnrollView addSubview:](v17, "addSubview:", v17->_repositionPhoneLabel);
    v52 = objc_opt_new();
    pillContainer = v17->_pillContainer;
    v17->_pillContainer = (BKUIPearlPillContainerView *)v52;

    -[BKUIPearlPillContainerView setSquareNeedsPositionLayout:](v17->_pillContainer, "setSquareNeedsPositionLayout:", v7);
    -[BKUIPearlPillContainerView setAlpha:](v17->_pillContainer, "setAlpha:", 0.0);
    -[BKUIPearlEnrollView addSubview:](v17, "addSubview:", v17->_pillContainer);
    v54 = -[BKUIPearlCrossHairsView initWithFrame:]([BKUIPearlCrossHairsView alloc], "initWithFrame:", v36, v37, v38, v39);
    -[BKUIPearlEnrollView setCrossHairs:](v17, "setCrossHairs:", v54);

    -[BKUIPearlEnrollView crossHairs](v17, "crossHairs");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setAlpha:", 0.0);

    -[BKUIPearlEnrollView crossHairs](v17, "crossHairs");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollView addSubview:](v17, "addSubview:", v56);

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v50) = objc_msgSend(v57, "bkui_IsInternalInstall");

    if ((_DWORD)v50)
    {
      v58 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
      debugLabel = v17->_debugLabel;
      v17->_debugLabel = v58;

      v60 = v17->_debugLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v60, "setTextColor:", v61);

      v62 = v17->_debugLabel;
      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 20.0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v62, "setFont:", v63);

      -[UILabel setNumberOfLines:](v17->_debugLabel, "setNumberOfLines:", 0);
      -[UILabel setHidden:](v17->_debugLabel, "setHidden:", 1);
      -[BKUIPearlEnrollView addSubview:](v17, "addSubview:", v17->_debugLabel);
    }
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollView setBackgroundColor:](v17, "setBackgroundColor:", v64);

    v65 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
    portalLayoutGuide = v17->_portalLayoutGuide;
    v17->_portalLayoutGuide = v65;

    -[BKUIPearlEnrollView addLayoutGuide:](v17, "addLayoutGuide:", v17->_portalLayoutGuide);
    v17->_transitioningToState = 0;
    objc_initWeak(&location, v17);
    v77[0] = objc_opt_class();
    v77[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __112__BKUIPearlEnrollView_initWithFrame_videoCaptureSession_inSheet_positioningGuideView_squareNeedsPositionLayout___block_invoke;
    v72[3] = &unk_1EA280A98;
    objc_copyWeak(&v74, &location);
    v68 = v17;
    v73 = v68;
    -[BKUIPearlEnrollView registerForTraitChanges:withHandler:](v68, "registerForTraitChanges:withHandler:", v67, v72);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollView setTraitChangeRegistration:](v68, "setTraitChangeRegistration:", v69);

    objc_destroyWeak(&v74);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __112__BKUIPearlEnrollView_initWithFrame_videoCaptureSession_inSheet_positioningGuideView_squareNeedsPositionLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1 && !objc_msgSend(v15, "horizontalSizeClass"))
  {
    objc_msgSend(WeakRetained, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");

    if (v8)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 736);
      objc_msgSend(WeakRetained, "tutorialRingRadius");
      v11 = v10;
      objc_msgSend(WeakRetained, "portalCenter");
      objc_msgSend(v9, "setRadius:center:animated:completion:", 0, 0, v11, v12, v13);
      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 624);
      objc_msgSend(WeakRetained, "pillRingRadius");
      objc_msgSend(v14, "setRingRadius:");
      objc_msgSend(WeakRetained, "setNeedsLayout");
    }
  }

}

- (void)setupAnimationViewWithSuperView:(id)a3
{
  id v4;
  void *v5;
  BKUIMicaAnimationView *v6;
  BKUIMicaAnimationView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
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
  CGFloat v26;
  CGFloat v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
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
  CGAffineTransform v52;
  CGAffineTransform v53;
  _QWORD v54[4];
  _QWORD v55[5];

  v55[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[BKUIPearlEnrollView squareNeedsPositionLayout](self, "squareNeedsPositionLayout"))
  {
    -[BKUIPearlEnrollView animationView](self, "animationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = [BKUIMicaAnimationView alloc];
      v7 = -[OBAnimationView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[BKUIPearlEnrollView setAnimationView:](self, "setAnimationView:", v7);

    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65128]), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("enrolling"), CFSTR("enrolling"), 0.01, 1.0);
    v55[0] = v8;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65128]), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("done"), CFSTR("done"), 1.5, 1.0);
    v55[1] = v9;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65128]), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("check"), CFSTR("check"), 1.5, 1.0);
    v55[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[BKUIPearlEnrollView animationView](self, "animationView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[BKUIPearlEnrollView animationView](self, "animationView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 0.0);

    -[BKUIPearlEnrollView animationController](self, "animationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0D65120]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLForResource:withExtension:", CFSTR("faceid-completion"), CFSTR("ca"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlEnrollView animationView](self, "animationView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v15, "initWithUrlToPackage:animationView:animatedStates:startAtFirstState:", v17, v18, v11, v19);
      -[BKUIPearlEnrollView setAnimationController:](self, "setAnimationController:", v20);

    }
    -[BKUIPearlEnrollView animationView](self, "animationView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "packageLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[BKUIPearlEnrollView animationView](self, "animationView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setScale:", 1.0);

    -[BKUIPearlEnrollView animationView](self, "animationView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v24);

    +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v11;
    if (objc_msgSend(v25, "mainScreenClass") == 31)
    {
      v26 = 5.0;
      v27 = 5.0;
    }
    else
    {
      v26 = 4.0;
      v27 = 4.0;
    }
    CGAffineTransformMakeScale(&v53, v26, v27);
    -[BKUIPearlEnrollView animationView](self, "animationView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v53;
    objc_msgSend(v28, "setTransform:", &v52);

    -[BKUIPearlEnrollView animationView](self, "animationView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollView setSuccessAnimationViewCenterYConstraint:](self, "setSuccessAnimationViewCenterYConstraint:", v32);

    v46 = (void *)MEMORY[0x1E0CB3718];
    -[BKUIPearlEnrollView animationView](self, "animationView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "widthAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    objc_msgSend(v49, "constraintEqualToConstant:", v33);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v47;
    -[BKUIPearlEnrollView animationView](self, "animationView");
    v34 = v22;
    v48 = v22;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "heightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bounds");
    objc_msgSend(v36, "constraintEqualToConstant:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v38;
    -[BKUIPearlEnrollView animationView](self, "animationView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v41 = v4;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v43;
    -[BKUIPearlEnrollView successAnimationViewCenterYConstraint](self, "successAnimationViewCenterYConstraint");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "activateConstraints:", v45);

    v4 = v41;
  }

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  CAShapeLayer *circleMaskLayer;
  id v7;
  objc_super v8;

  v4 = a3;
  -[BKUIPearlEnrollView backgroundColor](self, "backgroundColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[UIView setBackgroundColor:](self->_circleMaskView, "setBackgroundColor:", v4);
    circleMaskLayer = self->_circleMaskLayer;
    v7 = objc_retainAutorelease(v4);
    -[CAShapeLayer setBackgroundColor:](circleMaskLayer, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));
    -[UIView setBackgroundColor:](self->_roundedRectMaskView, "setBackgroundColor:", v7);
    -[CAShapeLayer setBackgroundColor:](self->_roundedRectMaskLayer, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v7), "CGColor"));
  }
  v8.receiver = self;
  v8.super_class = (Class)BKUIPearlEnrollView;
  -[BKUIPearlEnrollView setBackgroundColor:](&v8, sel_setBackgroundColor_, v4);

}

- (void)setDebugOverlayVisible:(BOOL)a3
{
  self->_debugOverlayVisible = a3;
  -[UILabel setHidden:](self->_debugLabel, "setHidden:", !a3);
  -[BKUIPearlEnrollView setNeedsLayout](self, "setNeedsLayout");
}

- (void)preEnrollActivate
{
  if (!self->_activated)
  {
    self->_activated = 1;
    -[BKUIPearlEnrollView setActive:](self, "setActive:", 1);
  }
}

- (void)postEnrollDeActivate
{
  -[BKUIPearlEnrollView setActive:](self, "setActive:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[BKUIPearlEnrollView setActive:](self, "setActive:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BKUIPearlEnrollView;
  -[BKUIPearlEnrollView dealloc](&v3, sel_dealloc);
}

- (void)setActive:(BOOL)a3
{
  if (!a3)
    -[BKUIPearlEnrollView _endAndCleanupEnrollSessionIfNeeded](self, "_endAndCleanupEnrollSessionIfNeeded");
  self->_active = a3;
}

- (void)_endAndCleanupEnrollSessionIfNeeded
{
  void *v3;

  if (-[BKUIPearlEnrollView active](self, "active"))
  {
    -[BKUIPearlPositioningGuideView setHidden:](self->_positioningGuide, "setHidden:", 1);
    -[BKUIPearlEnrollView previewLayer](self, "previewLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

    -[BKUIPearlVideoCaptureSession endCapture](self->_videoCaptureSession, "endCapture");
    -[BKUIPearlEnrollView _stopNudgeTimer](self, "_stopNudgeTimer");
  }
}

- (id)previewLayer
{
  return -[BKUIPearlVideoCaptureSession previewLayer](self->_videoCaptureSession, "previewLayer");
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int state;
  BOOL v6;
  int v7;
  void *v9;
  void *v10;

  v3 = a3;
  if (a3)
  {
    -[BKUIPearlEnrollView _stopNudgeTimer](self, "_stopNudgeTimer");
    -[BKUIPearlEnrollView setCameraBlurred:](self, "setCameraBlurred:", 1);
  }
  else
  {
    state = self->_state;
    v6 = state > 7;
    v7 = (1 << state) & 0xB8;
    if (!v6 && v7 != 0)
      -[BKUIPearlEnrollView setCameraBlurred:](self, "setCameraBlurred:", 0);
    -[BKUIPearlEnrollView _startNudgeTimer](self, "_startNudgeTimer");
  }
  -[BKUIPearlEnrollView previewLayer](self, "previewLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v3 ^ 1);

  -[BKUIPearlPositioningGuideView setHidden:](self->_positioningGuide, "setHidden:", v3);
}

- (void)_animateToState:(int)a3 fromState:(int)a4 completion:(id)a5
{
  uint64_t v5;
  id v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id location;
  _QWORD v19[5];

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  if ((v5 & 0xFFFFFFFD) == 5 && (a3 == 9 || a3 == 3))
    -[BKUIPearlPillContainerView stashPillStates](self->_pillContainer, "stashPillStates");
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__BKUIPearlEnrollView__animateToState_fromState_completion___block_invoke;
  v19[3] = &unk_1EA27FB98;
  v19[4] = self;
  +[UIView bkui_animateWithDuration:animations:](0.3, MEMORY[0x1E0CEABB0], v19);
  -[BKUIPearlEnrollView setTransitioningToState:](self, "setTransitioningToState:", 1);
  objc_initWeak(&location, self);
  v12 = v9;
  v13 = 3221225472;
  v14 = __60__BKUIPearlEnrollView__animateToState_fromState_completion___block_invoke_2;
  v15 = &unk_1EA280AC0;
  objc_copyWeak(&v17, &location);
  v10 = v8;
  v16 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(&v12);
  switch(self->_state)
  {
    case 0:
      -[BKUIPearlEnrollView _cleanupUIState](self, "_cleanupUIState", v12, v13, v14, v15);
      goto LABEL_8;
    case 1:
      -[BKUIPearlEnrollView _animateToEntryAnimation](self, "_animateToEntryAnimation", v12, v13, v14, v15);
LABEL_8:
      v11[2](v11);
      break;
    case 2:
      -[BKUIPearlEnrollView _animateToTutorialWithCompletion:](self, "_animateToTutorialWithCompletion:", v11, v12, v13, v14, v15);
      break;
    case 3:
      -[BKUIPearlEnrollView _animateToNeedsPositioningFromState:withCompletion:](self, "_animateToNeedsPositioningFromState:withCompletion:", v5, v11, v12, v13, v14, v15);
      break;
    case 4:
      -[BKUIPearlEnrollView _animateToNeedsCenterBinWithCompletion:](self, "_animateToNeedsCenterBinWithCompletion:", v11, v12, v13, v14, v15);
      break;
    case 5:
      -[BKUIPearlEnrollView _animateToFirstScanWithCompletion:](self, "_animateToFirstScanWithCompletion:", v11, v12, v13, v14, v15);
      break;
    case 6:
      -[BKUIPearlEnrollView _animateToFirstScanCompleteWithCompletion:](self, "_animateToFirstScanCompleteWithCompletion:", v11, v12, v13, v14, v15);
      break;
    case 7:
      -[BKUIPearlEnrollView _animateToScanningStateWithCompletion:](self, "_animateToScanningStateWithCompletion:", v11, v12, v13, v14, v15);
      break;
    case 8:
      -[BKUIPearlEnrollView _animateToScanCompleteWithCompletion:](self, "_animateToScanCompleteWithCompletion:", v11, v12, v13, v14, v15);
      break;
    case 9:
      -[BKUIPearlEnrollView _animateToPartialCaptureWithCompletion:](self, "_animateToPartialCaptureWithCompletion:", v11, v12, v13, v14, v15);
      break;
    case 0xA:
      -[BKUIPearlEnrollView _animateToFinishedWithCompletion:](self, "_animateToFinishedWithCompletion:", v11, v12, v13, v14, v15);
      break;
    default:
      break;
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __60__BKUIPearlEnrollView__animateToState_fromState_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "crossHairs");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __60__BKUIPearlEnrollView__animateToState_fromState_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setTransitioningToState:", 0);
  objc_msgSend(WeakRetained, "transitionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateTransitionDidComplete");

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

- (void)_setState:(int)a3 completion:(id)a4
{
  id v6;
  uint64_t state;
  NSDate *v8;
  NSDate *stateStart;
  _BOOL4 v10;
  uint64_t v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
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
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  CGAffineTransform v32;
  CGAffineTransform v33;
  _QWORD v34[6];

  v34[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  state = self->_state;
  if (a3 < 2 || state > 1)
  {
    self->_state = a3;
    if (!a3)
      goto LABEL_17;
  }
  else
  {
    -[BKUIPearlEnrollView startCapture](self, "startCapture");
    state = self->_state;
    self->_state = a3;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  stateStart = self->_stateStart;
  self->_stateStart = v8;

  -[BKUIPearlEnrollView setNeedsLayout](self, "setNeedsLayout");
  -[BKUIPearlEnrollView updatePortalLayoutGuide](self, "updatePortalLayoutGuide");
  v10 = -[BKUIPearlEnrollView squareNeedsPositionLayout](self, "squareNeedsPositionLayout");
  v11 = self->_state;
  if (v10 && (_DWORD)v11 == 10)
  {
    if ((_DWORD)state == 9 || (_DWORD)state == 6)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65128]), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("enrolling"), CFSTR("enrolling"), 0.01, 1.0);
      v34[0] = v13;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65128]), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("done"), CFSTR("done"), 1.5, 1.0);
      v34[1] = v14;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65128]), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("check"), CFSTR("check"), 1.5, 1.0);
      v34[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc(MEMORY[0x1E0D65120]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLForResource:withExtension:", CFSTR("faceid-completion-skip-mask"), CFSTR("ca"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlEnrollView animationView](self, "animationView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v17, "initWithUrlToPackage:animationView:animatedStates:startAtFirstState:", v19, v20, v16, v21);
      -[BKUIPearlEnrollView setAnimationController:](self, "setAnimationController:", v22);

      -[BKUIPearlEnrollView setAlpha:](self, "setAlpha:", 0.0);
      -[BKUIPearlEnrollView animationView](self, "animationView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAlpha:", 0.0);

      CGAffineTransformMakeScale(&v33, 1.0, 1.0);
      -[BKUIPearlEnrollView animationView](self, "animationView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v33;
      objc_msgSend(v24, "setTransform:", &v32);

      -[BKUIPearlEnrollView successAnimationViewCenterYConstraint](self, "successAnimationViewCenterYConstraint");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setConstant:", 4.0);

      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __44__BKUIPearlEnrollView__setState_completion___block_invoke;
      v31[3] = &unk_1EA27FB98;
      v31[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 196608, v31, 0, 0.349999994, 0.150000006);

    }
    else
    {
      -[BKUIPearlEnrollView animationView](self, "animationView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAlpha:", 0.0);

      v27 = (void *)MEMORY[0x1E0CEABB0];
      objc_msgSend(MEMORY[0x1E0CEABD0], "behaviorWithDampingRatio:response:", 1.0, 0.5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29[4] = self;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __44__BKUIPearlEnrollView__setState_completion___block_invoke_2;
      v30[3] = &unk_1EA27FB98;
      v30[4] = self;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __44__BKUIPearlEnrollView__setState_completion___block_invoke_3;
      v29[3] = &unk_1EA280AE8;
      objc_msgSend(v27, "_animateUsingSpringBehavior:tracking:animations:completion:", v28, 0, v30, v29);

    }
  }
  else
  {
    -[BKUIPearlPillContainerView animateToState:completion:](self->_pillContainer, "animateToState:completion:", v11, 0);
  }
  if ((self->_state | 2) == 7)
  {
    self->_nudgesNudged = 0;
    -[BKUIPearlEnrollView setNudgesPaused:](self, "setNudgesPaused:", 0);
    -[BKUIPearlEnrollView _startNudgeTimer](self, "_startNudgeTimer");
    self->_fillHoldoffFrameCount = 0;
  }
  else
  {
    -[BKUIPearlEnrollView _stopNudgeTimer](self, "_stopNudgeTimer");
  }
LABEL_17:
  -[BKUIPearlEnrollView _animateToState:fromState:completion:](self, "_animateToState:fromState:completion:", self->_state, state, v6);

}

void __44__BKUIPearlEnrollView__setState_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "animationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "animationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimation");

}

uint64_t __44__BKUIPearlEnrollView__setState_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v10, 0.2, 0.2);
  v2 = *(void **)(a1 + 32);
  v9 = v10;
  objc_msgSend(v2, "setTransform:", &v9);
  CGAffineTransformMakeScale(&v8, 1.0, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "animationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  objc_msgSend(v3, "setTransform:", &v7);

  objc_msgSend(*(id *)(a1 + 32), "animationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "animationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimation");

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __44__BKUIPearlEnrollView__setState_completion___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "animationView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)setState:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  if (self->_state != (_DWORD)v4)
  {
    self->_stateTransitionInProgress = 1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__BKUIPearlEnrollView_setState_completion___block_invoke;
    v8[3] = &unk_1EA2800F8;
    v8[4] = self;
    v9 = v6;
    -[BKUIPearlEnrollView _setState:completion:](self, "_setState:completion:", v4, v8);

  }
}

uint64_t __43__BKUIPearlEnrollView_setState_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 560) = 0;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)didDisappear
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __35__BKUIPearlEnrollView_didDisappear__block_invoke;
  v2[3] = &unk_1EA27FB98;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v2, 0, 0.15);
}

uint64_t __35__BKUIPearlEnrollView_didDisappear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 744), "setAlphaHideOnZero:", 0.0);
}

- (void)_updateDebugOverlay
{
  double frameCount;
  double v4;
  double v5;
  UILabel *debugLabel;
  const __CFString *debugFrameInformation;
  const __CFString *debugStatusInformation;
  const __CFString *debugTemplateInformation;
  id v10;

  if (self->_debugOverlayVisible)
  {
    frameCount = (double)self->_frameCount;
    -[NSDate timeIntervalSinceNow](self->_startTime, "timeIntervalSinceNow");
    v5 = frameCount / -v4;
    debugLabel = self->_debugLabel;
    debugFrameInformation = (const __CFString *)self->_debugFrameInformation;
    debugStatusInformation = &stru_1EA281248;
    if (!debugFrameInformation)
      debugFrameInformation = &stru_1EA281248;
    debugTemplateInformation = (const __CFString *)self->_debugTemplateInformation;
    if (!debugTemplateInformation)
      debugTemplateInformation = &stru_1EA281248;
    if (self->_debugStatusInformation)
      debugStatusInformation = (const __CFString *)self->_debugStatusInformation;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\nenroll framerate: %0.2f\n%@\n%@"), debugFrameInformation, *(_QWORD *)&v5, debugTemplateInformation, debugStatusInformation);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](debugLabel, "setText:", v10);

  }
}

- (void)_recordDataFrameWithFaceState:(id)a3
{
  id v4;
  int state;
  double v6;
  NSString *debugStatusInformation;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  id v13;

  v4 = a3;
  state = self->_state;
  v13 = v4;
  if ((state | 2) == 7)
  {
    -[NSDate timeIntervalSinceNow](self->_stateStart, "timeIntervalSinceNow");
    if (v6 < -1.0)
    {
      debugStatusInformation = self->_debugStatusInformation;
      self->_debugStatusInformation = 0;

LABEL_6:
      objc_msgSend(v13, "pitch");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;
      objc_msgSend(v13, "yaw");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      -[BKUIPearlEnrollView setPitch:yaw:](self, "setPitch:yaw:", v10, v12);

      v4 = v13;
      goto LABEL_7;
    }
    state = self->_state;
    v4 = v13;
  }
  if ((state - 3) <= 1)
    goto LABEL_6;
LABEL_7:

}

- (void)_updateCorrectionEstimates:(double)a3 yaw:(double)a4
{
  unint64_t correctionSamplesCount;
  BOOL v5;
  BOOL v6;
  double pitchMax;
  double pitchMin;
  unint64_t v9;
  double v10;
  double v11;

  if (a3 <= 5.0)
    self->_pitchMax = fmax(self->_pitchMax, a3);
  if (a3 >= -45.0)
    self->_pitchMin = fmin(self->_pitchMin, a3);
  correctionSamplesCount = self->_correctionSamplesCount;
  if (a3 < -0.1)
  {
    v5 = correctionSamplesCount >= 5;
    v6 = correctionSamplesCount == 5;
  }
  else
  {
    v5 = 1;
    v6 = 0;
  }
  if (v6 || !v5)
  {
    v9 = correctionSamplesCount + 1;
    self->_correctionSamplesCount = v9;
    v10 = self->_pitchCorrectionSamples + a3;
    self->_pitchCorrectionSamples = v10;
    v11 = v10 / (double)v9;
LABEL_13:
    self->_pitchCorrection = v11;
    return;
  }
  if (correctionSamplesCount >= 6)
  {
    pitchMax = self->_pitchMax;
    pitchMin = self->_pitchMin;
    if (pitchMax - pitchMin >= 10.0)
    {
      v11 = (pitchMax + pitchMin) * 0.5 * 0.1 + self->_pitchCorrection * 0.9;
      goto LABEL_13;
    }
  }
}

- (void)setPitch:(double)a3 yaw:(double)a4
{
  unsigned int v7;
  double v8;
  double pitchCorrection;
  double v10;
  int state;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  double v24;
  unint64_t v25;
  NSString *v26;
  NSString *debugFrameInformation;
  _QWORD v28[5];
  uint8_t buf[4];
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = MGGetSInt32Answer() - 22;
  v8 = 10.0;
  if (v7 <= 3)
    v8 = dbl_1DB2DFB28[v7];
  if (!self->_stateTransitionInProgress)
  {
    pitchCorrection = self->_pitchCorrection;
    v10 = a3 - pitchCorrection;
    self->_currentCorrectedPitch = a3 - pitchCorrection;
    state = self->_state;
    if (state == 4)
    {
      if (self->_progressiveBlur)
      {
        -[BKUIPearlEnrollView _updateRaiseLowerGuidanceLabelIfNeededForPitch:](self, "_updateRaiseLowerGuidanceLabelIfNeededForPitch:", a3 - pitchCorrection);
        -[BKUIPearlEnrollView _progressiveBlurAmountForPitch:](self, "_progressiveBlurAmountForPitch:", v10);
        -[BKUIPearlEnrollView setCameraBlurAmount:useShade:duration:completion:](self, "setCameraBlurAmount:useShade:duration:completion:", 1, 0);
      }
    }
    else if (state == 7 || state == 5)
    {
      if (!self->_nudging)
      {
        -[BKUIPearlEnrollView crossHairs](self, "crossHairs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTintColor:", v14);

        -[BKUIPearlEnrollView crossHairs](self, "crossHairs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setPitch:yaw:", v10, a4);

        -[BKUIPearlEnrollView crossHairs](self, "crossHairs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "alpha");
        v18 = v17;

        if (v18 == 0.0)
        {
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __36__BKUIPearlEnrollView_setPitch_yaw___block_invoke;
          v28[3] = &unk_1EA27FB98;
          v28[4] = self;
          +[UIView bkui_animateWithDuration:animations:](0.5, MEMORY[0x1E0CEABB0], v28);
        }
      }
      v19 = sqrt(a4 * a4 + v10 * v10);
      v20 = atan2(-v10, -a4);
      v21 = 6.28318531;
      if (v20 >= 0.0)
        v21 = 0.0;
      v22 = v20 + v21;
      if (-[BKUIPearlEnrollView debugOverlayVisible](self, "debugOverlayVisible"))
      {
        _BKUILoggingFacility();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = self->_pitchCorrection;
          *(_DWORD *)buf = 134219520;
          v30 = v10;
          v31 = 2048;
          v32 = a3;
          v33 = 2048;
          v34 = v24;
          v35 = 2048;
          v36 = a4;
          v37 = 2048;
          v38 = a4;
          v39 = 2048;
          v40 = v19;
          v41 = 2048;
          v42 = v22;
          _os_log_impl(&dword_1DB281000, v23, OS_LOG_TYPE_DEFAULT, "P: %0.2f(%0.2f C: %0.2f) Y: %0.2f(%0.2f) M: %0.2f FA: %0.2f", buf, 0x48u);
        }

      }
      if (v19 > 6.0)
      {
        v25 = self->_fillHoldoffFrameCount + 1;
        self->_fillHoldoffFrameCount = v25;
        if (v8 < (double)v25
          && -[BKUIPearlPillContainerView fillPillsAroundAngle:](self->_pillContainer, "fillPillsAroundAngle:", v22)
          && self->_nudgesNudged != -1)
        {
          -[BKUIPearlEnrollView _startNudgeTimer](self, "_startNudgeTimer");
        }
      }
      if (self->_debugOverlayVisible)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("p: %0.2f, y: %0.2f, angle: %0.2f\n pC: %0.2f"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&v22, *(_QWORD *)&self->_pitchCorrection);
        v26 = (NSString *)objc_claimAutoreleasedReturnValue();
        debugFrameInformation = self->_debugFrameInformation;
        self->_debugFrameInformation = v26;

        -[BKUIPearlEnrollView _updateDebugOverlay](self, "_updateDebugOverlay");
      }
      -[BKUIPearlEnrollView _updateCorrectionEstimates:yaw:](self, "_updateCorrectionEstimates:yaw:", a3, a4);
    }
  }
}

void __36__BKUIPearlEnrollView_setPitch_yaw___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "crossHairs");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)updateWithFaceState:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "faceDetected") && (objc_msgSend(v4, "partiallyOutOfView") & 1) == 0)
    -[BKUIPearlEnrollView _recordDataFrameWithFaceState:](self, "_recordDataFrameWithFaceState:", v4);

}

- (void)updateWithProgress:(id)a3
{
  NSDate *v4;
  NSDate *startTime;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  NSString *debugTemplateInformation;
  id v16;

  v16 = a3;
  if (!self->_startTime)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startTime = self->_startTime;
    self->_startTime = v4;

  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Templates:\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "enrolledPoses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    v9 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        v11 = 0;
        v12 = 1;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("%@ "), v13);

          v11 = v12;
        }
        while (objc_msgSend(v10, "count") > (unint64_t)v12++);
      }
      objc_msgSend(v6, "appendString:", CFSTR("\n"));

      v8 = ++v9;
    }
    while (objc_msgSend(v7, "count") > (unint64_t)v9);
  }
  debugTemplateInformation = self->_debugTemplateInformation;
  self->_debugTemplateInformation = (NSString *)v6;

  -[BKUIPearlEnrollView _updateDebugOverlay](self, "_updateDebugOverlay");
}

- (double)percentOfPillsCompleted
{
  double result;

  -[BKUIPearlPillContainerView percentOfPillsCompleted](self->_pillContainer, "percentOfPillsCompleted");
  return result;
}

- (void)_cleanupUIState
{
  BKUIPearlPositioningGuideView *v3;
  BKUIPearlPositioningGuideView *v4;
  BKUIPearlPositioningGuideView *positioningGuide;
  BKUIPearlPositioningGuideView *v6;
  BKUIPearlPositioningGuideView *v7;
  NSDate *stateStart;
  void *v9;

  v3 = [BKUIPearlPositioningGuideView alloc];
  -[BKUIPearlEnrollView bounds](self, "bounds");
  v4 = -[BKUIPearlPositioningGuideView initWithFrame:](v3, "initWithFrame:");
  -[BKUIPearlPositioningGuideView setInSheet:](v4, "setInSheet:", -[BKUIPearlEnrollView inSheet](self, "inSheet"));
  -[BKUIPearlPositioningGuideView setAlpha:](v4, "setAlpha:", 0.0);
  -[BKUIPearlEnrollView pillRingRadius](self, "pillRingRadius");
  -[BKUIPearlPositioningGuideView setRingRadius:](v4, "setRingRadius:");
  -[BKUIPearlEnrollView center](self, "center");
  -[BKUIPearlPositioningGuideView setCenter:](v4, "setCenter:");
  -[BKUIPearlPositioningGuideView setRoundedRectMaskLayer:](v4, "setRoundedRectMaskLayer:", self->_roundedRectMaskLayer);
  -[BKUIPearlEnrollView addSubview:](self, "addSubview:", v4);
  -[BKUIPearlPositioningGuideView removeFromSuperview](self->_positioningGuide, "removeFromSuperview");
  positioningGuide = self->_positioningGuide;
  self->_positioningGuide = 0;

  v6 = self->_positioningGuide;
  self->_positioningGuide = v4;
  v7 = v4;

  self->_state = 0;
  stateStart = self->_stateStart;
  self->_stateStart = 0;

  self->_nudgesPaused = 0;
  self->_nudgesNudged = 0;
  -[BKUIPearlEnrollView pillContainer](self, "pillContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetPillsAnimated:", 0);

  -[BKUIPearlEnrollView _stopNudgeTimer](self, "_stopNudgeTimer");
}

- (double)_progressiveBlurAmountForPitch:(double)a3
{
  double v3;
  double v5;
  double v6;
  double result;

  v3 = 0.0;
  if (a3 < -30.0 || a3 > -10.0)
  {
    v5 = vabdd_f64(-30.0, a3);
    v6 = vabdd_f64(-10.0, a3);
    if (v5 < v6)
      v6 = v5;
    v3 = v6 * 0.5 + 2.0;
  }
  result = 15.0;
  if (v3 <= 15.0)
    return v3;
  return result;
}

- (void)_updateRaiseLowerGuidanceLabelIfNeededForPitch:(double)a3
{
  unint64_t v4;
  NSTimer *v5;
  NSTimer *raiseLowerGuidanceDelayTimer;
  _QWORD v7[5];

  if (self->_state == 4)
  {
    if (a3 >= -30.0)
    {
      if (a3 <= -10.0)
        return;
      v4 = 2;
    }
    else
    {
      v4 = 1;
    }
    if (!self->_pendingRaiseLowerGuidanceState)
    {
      self->_pendingRaiseLowerGuidanceState = v4;
      -[NSTimer invalidate](self->_raiseLowerGuidanceDelayTimer, "invalidate");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __70__BKUIPearlEnrollView__updateRaiseLowerGuidanceLabelIfNeededForPitch___block_invoke;
      v7[3] = &unk_1EA280B10;
      v7[4] = self;
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 0.25);
      v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      raiseLowerGuidanceDelayTimer = self->_raiseLowerGuidanceDelayTimer;
      self->_raiseLowerGuidanceDelayTimer = v5;

    }
  }
}

uint64_t __70__BKUIPearlEnrollView__updateRaiseLowerGuidanceLabelIfNeededForPitch___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 672);
  *(_QWORD *)(v1 + 672) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_setRaiseLowerGuidanceLabelState:", v2);
}

- (void)_setRaiseLowerGuidanceLabelState:(unint64_t)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  id v24;

  v4 = CFSTR("GENTLY_LOWER");
  if (a3 != 2)
    v4 = 0;
  if (a3 == 1)
    v5 = CFSTR("GENTLY_RAISE");
  else
    v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_1EA281248, CFSTR("Pearl"));
  v24 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v5, &stru_1EA281248, CFSTR("Pearl-j3xx"));
    v10 = objc_claimAutoreleasedReturnValue();

    v24 = (id)v10;
  }
  -[UILabel text](self->_repositionPhoneLabel, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v24, "isEqualToString:", v11);

  v13 = v24;
  if ((v12 & 1) == 0)
  {
    -[UILabel setText:](self->_repositionPhoneLabel, "setText:", v24);
    -[UILabel frame](self->_repositionPhoneLabel, "frame");
    v15 = v14;
    v17 = v16;
    if (-[BKUIPearlEnrollView squareNeedsPositionLayout](self, "squareNeedsPositionLayout"))
    {
      -[BKUIPearlEnrollView pillRingRadius](self, "pillRingRadius");
      v19 = v18 + v18;
    }
    else
    {
      -[BKUIPearlEnrollView bounds](self, "bounds");
      v21 = v20;
      +[BKUIStyle sharedStyle](BKUIStyle, "sharedStyle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "horizontalMarginForView:", self);
      v19 = v21 + v23 * -2.0;

    }
    -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_repositionPhoneLabel, "textRectForBounds:limitedToNumberOfLines:", -[UILabel numberOfLines](self->_repositionPhoneLabel, "numberOfLines"), 0.0, 0.0, v19, 1.79769313e308);
    -[UILabel setFrame:](self->_repositionPhoneLabel, "setFrame:", v15, v17, v19);
    -[BKUIPearlEnrollView setNeedsLayout](self, "setNeedsLayout");
    v13 = v24;
  }

}

- (void)setCameraBlurAmount:(double)a3 useShade:(BOOL)a4 duration:(double)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  NSObject *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  _QWORD v27[5];
  NSObject *v28;
  _QWORD v29[5];
  NSObject *v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD v33[6];
  _QWORD v34[2];

  v7 = a4;
  v34[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = dispatch_group_create();
  v12 = 0.0;
  if (v7)
    v12 = a3 * 0.5 / 15.0 + 0.2;
  if (v12 <= 1.0)
    v13 = v12;
  else
    v13 = 1.0;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    a5 = a5 * 0.5;
    v13 = a3 / 15.0;
    a3 = 0.0;
  }
  dispatch_group_enter(v11);
  v14 = MEMORY[0x1E0CEABB0];
  v15 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke;
  v33[3] = &unk_1EA2801E8;
  v33[4] = self;
  *(double *)&v33[5] = v13;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke_2;
  v31[3] = &unk_1EA27FC00;
  v16 = v11;
  v32 = v16;
  +[UIView bkui_animateWithDuration:animations:completion:](a5, v14, v33, v31);
  dispatch_group_enter(v16);
  if (a3 <= 0.0)
  {
    +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollView previewLayer](self, "previewLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0CD3058];
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke_76;
    v27[3] = &unk_1EA27FC78;
    v27[4] = self;
    v25 = (id *)&v28;
    v28 = v16;
    objc_msgSend(v21, "runBasicAnimationOnLayer:withDuration:keyPath:fromValue:toValue:removedOnCompletion:timingFunction:completion:", v22, CFSTR("filters.gaussianBlur.inputRadius"), 0, &unk_1EA298CC8, 0, v26, a5, v27);
  }
  else
  {
    self->_blurInProgress = 1;
    -[BKUIPearlEnrollView previewLayer](self, "previewLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "gaussianBlurWithRadius:", 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFilters:", v20);

    +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollView previewLayer](self, "previewLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0CD3058];
    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke_3;
    v29[3] = &unk_1EA27FC78;
    v29[4] = self;
    v25 = (id *)&v30;
    v30 = v16;
    objc_msgSend(v21, "runBasicAnimationOnLayer:withDuration:keyPath:fromValue:toValue:removedOnCompletion:timingFunction:completion:", v22, CFSTR("filters.gaussianBlur.inputRadius"), 0, v23, 0, v24, a5, v29);

  }
  if (v10)
    dispatch_group_notify(v16, MEMORY[0x1E0C80D38], v10);

}

uint64_t __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", *(double *)(a1 + 40));
}

void __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 456) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke_76(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[456])
  {
    objc_msgSend(v2, "previewLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFilters:", 0);

    objc_msgSend(*(id *)(a1 + 32), "previewLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllAnimations");

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)setCameraBlurred:(BOOL)a3
{
  double v3;

  v3 = 0.0;
  if (a3)
    v3 = 15.0;
  -[BKUIPearlEnrollView setCameraBlurAmount:useShade:duration:completion:](self, "setCameraBlurAmount:useShade:duration:completion:", 0, 0, v3, 0.5);
}

- (void)setFailed
{
  -[BKUIPearlEnrollView setCameraBlurred:](self, "setCameraBlurred:", 1);
  -[BKUIPearlEnrollView setActive:](self, "setActive:", 0);
}

- (void)setNudgesPaused:(BOOL)a3
{
  self->_nudgesPaused = a3;
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
  BKUIPearlPositioningGuideView *positioningGuide;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  BKUIPearlPillContainerView *pillContainer;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  BOOL v47;
  void *v48;
  int v49;
  const __CFString *v50;
  void *v51;
  uint64_t v52;
  const __CFString *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  AVPlayer *v61;
  AVPlayer *tutorialPlayer;
  double v63;
  double v64;
  BKUIPearlMovieLoopView *v65;
  BKUIPearlMovieLoopView *tutorialMovieView;
  void *v67;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  id v88;
  id v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  -[BKUIPearlEnrollView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  positioningGuide = self->_positioningGuide;
  -[BKUIPearlEnrollView pillRingRadius](self, "pillRingRadius");
  -[BKUIPearlPositioningGuideView setRingRadius:](positioningGuide, "setRingRadius:");
  if (self->_debugOverlayVisible)
  {
    -[UILabel sizeToFit](self->_debugLabel, "sizeToFit");
    -[UILabel frame](self->_debugLabel, "frame");
    -[UILabel setFrame:](self->_debugLabel, "setFrame:", 10.0, 10.0, v8 + -24.0);
  }
  -[BKUIPearlPillContainerView bounds](self->_pillContainer, "bounds");
  v93.origin.x = v12;
  v93.origin.y = v13;
  v93.size.width = v14;
  v93.size.height = v15;
  v90.origin.x = v4;
  v90.origin.y = v6;
  v90.size.width = v8;
  v90.size.height = v10;
  if (!CGRectEqualToRect(v90, v93))
  {
    -[BKUIPearlPillContainerView setFrame:](self->_pillContainer, "setFrame:", v4, v6, v8, v10);
    if (-[BKUIPearlEnrollView state](self, "state") == 2)
      -[BKUIPearlEnrollView tutorialRingRadius](self, "tutorialRingRadius");
    else
      -[BKUIPearlEnrollView pillRingRadius](self, "pillRingRadius");
    v17 = v16;
    pillContainer = self->_pillContainer;
    -[BKUIPearlEnrollView portalCenter](self, "portalCenter");
    -[BKUIPearlPillContainerView setRadius:center:animated:completion:](pillContainer, "setRadius:center:animated:completion:", 0, 0, v17, v19, v20);
    -[BKUIPearlPillContainerView setNeedsLayout](self->_pillContainer, "setNeedsLayout");
  }
  v21 = *MEMORY[0x1E0C9D648];
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[BKUIPearlEnrollView portalRadius](self, "portalRadius");
  v24 = v23 * 2.125;
  -[BKUIPearlEnrollView crossHairs](self, "crossHairs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBounds:", v21, v22, v24, v24);

  -[BKUIPearlEnrollView crossHairs](self, "crossHairs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollView portalCenter](self, "portalCenter");
  objc_msgSend(v26, "setCenter:");

  -[BKUIPearlEnrollView layer](self, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  -[UIView setFrame:](self->_cameraShadeView, "setFrame:", v29, v31, v33, v35);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "userInterfaceIdiom");

  v38 = 1.77777778;
  if ((v37 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v38 = 1.0;
  v39 = v33 * v38;
  -[BKUIPearlEnrollView layer](self, "layer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bounds");
  v42 = (v41 - v39) * 0.5;

  -[BKUIPearlEnrollView previewLayer](self, "previewLayer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFrame:", v29, v42, v33, v39);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "userInterfaceIdiom");

  if ((v45 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[BKUIPearlEnrollView traitCollection](self, "traitCollection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "horizontalSizeClass") == 0;

  }
  else
  {
    v47 = 0;
  }
  if (!self->_tutorialMovieView && !v47)
  {
    +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "isN84");

    if (v49)
      v50 = CFSTR("Enrollment_Tutorial_Loop-n84");
    else
      v50 = CFSTR("Enrollment_Tutorial_Loop-D22");
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "userInterfaceIdiom");

    if ((v52 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v53 = CFSTR("Enrollment_Tutorial_Loop-j3xx");
    else
      v53 = v50;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "userInterfaceIdiom");

    if ((v55 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      +[BKUIVideoAssetHelpers iPadVideoURLForAssetName:](BKUIVideoAssetHelpers, "iPadVideoURLForAssetName:", v53);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "URLForResource:withExtension:", v53, CFSTR("mov"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1EA2989C8, 0);
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setCategory:withOptions:error:", *MEMORY[0x1E0C89660], 1, 0);

    objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (AVPlayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B2E8]), "initWithPlayerItem:", v60);
    tutorialPlayer = self->_tutorialPlayer;
    self->_tutorialPlayer = v61;

    -[AVPlayer setMuted:](self->_tutorialPlayer, "setMuted:", 1);
    -[AVPlayer setAllowsExternalPlayback:](self->_tutorialPlayer, "setAllowsExternalPlayback:", 0);
    -[BKUIPearlEnrollView tutorialMovieSize](self, "tutorialMovieSize");
    v65 = -[BKUIPearlMovieLoopView initWithFrame:player:asset:]([BKUIPearlMovieLoopView alloc], "initWithFrame:player:asset:", self->_tutorialPlayer, v58, 0.0, 0.0, v63, v64);
    tutorialMovieView = self->_tutorialMovieView;
    self->_tutorialMovieView = v65;

    -[BKUIPearlEnrollView addSubview:](self, "addSubview:", self->_tutorialMovieView);
  }
  if (-[BKUIPearlEnrollView state](self, "state") <= 2 && self->_tutorialMovieView)
  {
    -[BKUIPearlEnrollView tutorialMovieSize](self, "tutorialMovieSize");
    v68 = *(double *)&v67;
    v88 = v67;
    v70 = v69;
    v91.origin.x = v4;
    v91.origin.y = v6;
    v91.size.width = v8;
    v91.size.height = v10;
    v71 = v8;
    v72 = v10;
    v73 = v6;
    v74 = v4;
    v75 = v68 * 0.5;
    v76 = CGRectGetMidX(v91) - v75;
    -[BKUIPearlEnrollView portalOffset](self, "portalOffset");
    v78 = v76 + v77;
    v92.origin.x = v4;
    v92.origin.y = v73;
    v92.size.width = v71;
    v92.size.height = v72;
    v79 = CGRectGetMidY(v92) - v70 * 0.5;
    -[BKUIPearlEnrollView portalOffset](self, "portalOffset");
    v81 = v79 + v80;
    v4 = v74;
    v6 = v73;
    v10 = v72;
    v8 = v71;
    -[BKUIPearlMovieLoopView setFrame:](self->_tutorialMovieView, "setFrame:", v78, v81, *(double *)&v88, v70);
    -[BKUIPearlMovieLoopView _setCornerRadius:](self->_tutorialMovieView, "_setCornerRadius:", v75);
    -[BKUIPearlMovieLoopView layer](self->_tutorialMovieView, "layer");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "userInterfaceIdiom");

  }
  -[BKUIPearlPositioningGuideView setFrame:](self->_positioningGuide, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_circleMaskView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_roundedRectMaskView, "setFrame:", v4, v6, v8, v10);
  -[BKUIPearlEnrollView center](self, "center");
  v85 = v84;
  v87 = v86;
  -[BKUIPearlEnrollView superview](self, "superview");
  v89 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollView convertPoint:fromView:](self, "convertPoint:fromView:", v89, v85, v87);
  -[UILabel setCenter:](self->_repositionPhoneLabel, "setCenter:");

}

- (void)updatePortalLayoutGuide
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  -[BKUIPearlEnrollView portalLayoutGuideConstraints](self, "portalLayoutGuideConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[BKUIPearlEnrollView portalLayoutGuideConstraints](self, "portalLayoutGuideConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    -[BKUIPearlEnrollView setPortalLayoutGuideConstraints:](self, "setPortalLayoutGuideConstraints:", 0);
  }
  -[BKUIPearlEnrollView portalRadius](self, "portalRadius");
  v7 = v6 + v6;
  -[BKUIPearlEnrollView portalOffset](self, "portalOffset");
  v9 = v8;
  v11 = v10;
  -[BKUIPearlEnrollView portalLayoutGuide](self, "portalLayoutGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToConstant:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v26;
  -[BKUIPearlEnrollView portalLayoutGuide](self, "portalLayoutGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v23;
  -[BKUIPearlEnrollView portalLayoutGuide](self, "portalLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollView centerXAnchor](self, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v15;
  -[BKUIPearlEnrollView portalLayoutGuide](self, "portalLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollView centerYAnchor](self, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollView setPortalLayoutGuideConstraints:](self, "setPortalLayoutGuideConstraints:", v20);

  v21 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlEnrollView portalLayoutGuideConstraints](self, "portalLayoutGuideConstraints");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v22);

}

- (BOOL)expectsRunningVideoCaptureSession:(id)a3
{
  int v4;

  v4 = -[BKUIPearlEnrollView active](self, "active", a3);
  if (v4)
  {
    v4 = -[BKUIPearlEnrollView state](self, "state");
    if (v4)
      LOBYTE(v4) = -[BKUIPearlEnrollView state](self, "state") < 0xA;
  }
  return v4;
}

- (void)startCapture
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_didStartCapture)
  {
    -[BKUIPearlVideoCaptureSession startCapture](self->_videoCaptureSession, "startCapture");
    _BKUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[BKUIPearlVideoCaptureSession previewLayer](self->_videoCaptureSession, "previewLayer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "insertSublayer:_videoCaptureSession.previewLayer = %@", (uint8_t *)&v7, 0xCu);

    }
    -[BKUIPearlEnrollView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlVideoCaptureSession previewLayer](self->_videoCaptureSession, "previewLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertSublayer:atIndex:", v6, 0);

    self->_didStartCapture = 1;
  }
}

- (id)_maskPathWithRadius:(double)a3 inFrame:(CGRect)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA390];
  -[BKUIPearlEnrollView portalCenter](self, "portalCenter");
  objc_msgSend(v6, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPath:", v7);

  return v5;
}

- (id)_enrollMaskPathWithRadius:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[BKUIPearlEnrollView bounds](self, "bounds");
  return -[BKUIPearlEnrollView _maskPathWithRadius:inFrame:](self, "_maskPathWithRadius:inFrame:", a3, v5, v6, v7, v8);
}

- (void)_runTutorialLoopWithDuration:(double)a3 delay:(double)a4 loopDelay:(double)a5
{
  NSObject *v9;
  _QWORD v10[8];

  dispatch_get_global_queue(21, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke;
  v10[3] = &unk_1EA280B38;
  v10[4] = self;
  *(double *)&v10[5] = a4;
  *(double *)&v10[6] = a3;
  *(double *)&v10[7] = a5;
  dispatch_async(v9, v10);

}

void __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD block[6];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 699))
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = MEMORY[0x1E0C80D38];
    do
    {
      if (*(_DWORD *)(v1 + 704) != 2)
        break;
      block[0] = v3;
      block[1] = 3221225472;
      block[2] = __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke_2;
      block[3] = &unk_1EA27FB98;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_sync(v4, block);
      usleep((*(double *)(a1 + 40) * 1000000.0));
      v13[0] = v3;
      v13[1] = 3221225472;
      v13[2] = __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke_3;
      v13[3] = &unk_1EA27FB98;
      v13[4] = *(_QWORD *)(a1 + 32);
      dispatch_sync(v4, v13);

      usleep(0xF4240u);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeIntervalSinceDate:", v5);
        v8 = v7;

        v9 = v8 / *(double *)(a1 + 48) + v8 / *(double *)(a1 + 48);
        v12[0] = v3;
        v12[1] = 3221225472;
        v12[2] = __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke_4;
        v12[3] = &unk_1EA2801E8;
        v10 = v9 * 3.14159265 + -0.392699082;
        v12[4] = *(_QWORD *)(a1 + 32);
        *(double *)&v12[5] = v10;
        dispatch_async(v4, v12);

        usleep(0x493E0u);
        v11 = *(_QWORD *)(a1 + 32);
      }
      while (*(_BYTE *)(v11 + 699) && *(_DWORD *)(v11 + 704) == 2 && v10 < 6.28318531);
      usleep((*(double *)(a1 + 56) * 1000000.0));

      v1 = *(_QWORD *)(a1 + 32);
    }
    while (*(_BYTE *)(v1 + 699));
  }
}

uint64_t __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "resetPillsAnimated:", 1);
}

uint64_t __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  __int128 v5;
  uint64_t v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 608);
  v5 = *MEMORY[0x1E0CA2E68];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v2, "seekToTime:", &v5);
  LODWORD(v3) = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "playImmediatelyAtRate:", v3);
}

uint64_t __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke_4(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(v1 + 704) == 2)
    return objc_msgSend(*(id *)(v1 + 736), "fillPillsAroundAngle:forTutorial:", 1, *(double *)(result + 40));
  return result;
}

- (void)_nudgeIfNecessary
{
  __assert_rtn("-[BKUIPearlEnrollView _nudgeIfNecessary]", "BKUIPearlEnrollView.m", 1076, "_nudgesNudged < kPearlMaxNudgesPerMode");
}

void __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "crossHairs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_2;
  v8 = &unk_1EA27FB98;
  v3 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "nudgeInDirection:smallNudgePeak:largeNudgePeak:completion:", MEMORY[0x1E0C809B0], 3221225472, __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_4, &unk_1EA2801E8, v9, v3, MEMORY[0x1E0C809B0], 3221225472, __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_3, &unk_1EA27FB98, v9, MEMORY[0x1E0C809B0], 3221225472, __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_2, &unk_1EA27FB98, v9);

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 592);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrollView:willNudgeInDirection:nudgeCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592));

}

void __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReachSmallNudgePeakForEnrollView:", *(_QWORD *)(a1 + 32));

}

void __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReachLargeNudgePeakForEnrollView:", *(_QWORD *)(a1 + 32));

}

_QWORD *__40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD *result;

  objc_msgSend(*(id *)(a1 + 32), "setCameraBlurred:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 584) = 0;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollView:didNudgeInDirection:nudgeCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592));

  result = *(_QWORD **)(a1 + 32);
  if (result[74] != -1)
    return (_QWORD *)objc_msgSend(result, "_startNudgeTimer");
  return result;
}

- (void)_startNudgeTimer
{
  NSObject *v3;
  int state;
  NSTimer *v5;
  NSTimer *nudgeTimer;
  _QWORD v7[5];
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_active && !self->_nudging && (self->_state | 2) == 7)
  {
    _BKUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      state = self->_state;
      *(_DWORD *)buf = 67109120;
      v9 = state;
      _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "Starting nudge timer, state = %i", buf, 8u);
    }

    -[NSTimer invalidate](self->_nudgeTimer, "invalidate");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__BKUIPearlEnrollView__startNudgeTimer__block_invoke;
    v7[3] = &unk_1EA280B10;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 4.0);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    nudgeTimer = self->_nudgeTimer;
    self->_nudgeTimer = v5;

  }
}

void __39__BKUIPearlEnrollView__startNudgeTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_nudgeIfNecessary");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 576);
  *(_QWORD *)(v2 + 576) = 0;

}

- (void)_stopNudgeTimer
{
  NSObject *v3;
  int state;
  NSTimer *nudgeTimer;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_nudgeTimer)
  {
    _BKUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      state = self->_state;
      v6[0] = 67109120;
      v6[1] = state;
      _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "Stopping nudge timer, state = %i", (uint8_t *)v6, 8u);
    }

    -[NSTimer invalidate](self->_nudgeTimer, "invalidate");
    nudgeTimer = self->_nudgeTimer;
    self->_nudgeTimer = 0;

  }
}

- (BOOL)_animateCircleMaskWithPositioningGuide
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) != 1;
}

- (void)_animateToEntryAnimation
{
  BKUIPearlPillContainerView *pillContainer;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  double v10;
  uint8_t v11[16];

  pillContainer = self->_pillContainer;
  -[BKUIPearlEnrollView tutorialRingRadius](self, "tutorialRingRadius");
  v5 = v4;
  -[BKUIPearlEnrollView portalCenter](self, "portalCenter");
  -[BKUIPearlPillContainerView setRadius:center:animated:completion:](pillContainer, "setRadius:center:animated:completion:", 0, 0, v5, v6, v7);
  if (self->_entryAnimationAlreadyRan)
  {
    -[BKUIPearlMovieLoopView setAlphaHideOnZero:](self->_tutorialMovieView, "setAlphaHideOnZero:", 1.0);
    -[BKUIPearlPositioningGuideView setAlpha:](self->_positioningGuide, "setAlpha:", 0.0);
    _BKUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DB281000, v8, OS_LOG_TYPE_DEFAULT, "_animateToEntryAnimation: PreviewLayer's opacity will be updated to 0", v11, 2u);
    }

    -[BKUIPearlEnrollView previewLayer](self, "previewLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 0;
    objc_msgSend(v9, "setOpacity:", v10);

    -[BKUIPearlPillContainerView setAlpha:](self->_pillContainer, "setAlpha:", 1.0);
  }
  else
  {
    self->_entryAnimationAlreadyRan = 1;
    -[BKUIPearlPillContainerView setAlpha:](self->_pillContainer, "setAlpha:", 1.0);
    -[BKUIPearlMovieLoopView setAlphaHideOnZero:](self->_tutorialMovieView, "setAlphaHideOnZero:", 1.0);
  }
}

- (void)_animateToTutorialWithCompletion:(id)a3
{
  _BOOL4 entryAnimationAlreadyRan;
  double v5;
  void *v6;
  id v7;

  v7 = a3;
  entryAnimationAlreadyRan = self->_entryAnimationAlreadyRan;
  -[BKUIPearlEnrollView _animateToEntryAnimation](self, "_animateToEntryAnimation");
  v5 = 1.0;
  if (entryAnimationAlreadyRan)
    v5 = 0.0;
  -[BKUIPearlEnrollView _runTutorialLoopWithDuration:delay:loopDelay:](self, "_runTutorialLoopWithDuration:delay:loopDelay:", 4.5, v5, 1.5);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)_animateToNeedsPositioningFromState:(int)a3 withCompletion:(id)a4
{
  id v6;
  BOOL v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  BKUIPearlPillContainerView *pillContainer;
  id v17;
  void *v18;
  _BOOL4 IsReduceMotionEnabled;
  BKUIPearlPositioningGuideView *positioningGuide;
  void *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  BOOL v25;
  _QWORD v26[5];
  _BYTE v27[128];
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  _QWORD aBlock[5];
  id v34;
  id v35;
  BOOL v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD v40[5];

  v6 = a4;
  v7 = a3 == 2;
  v8 = a3 - 4;
  -[BKUIPearlPositioningGuideView setHidden:](self->_positioningGuide, "setHidden:", 0);
  -[BKUIPearlEnrollView setCameraBlurred:](self, "setCameraBlurred:", 0);
  -[BKUIPearlEnrollView _nonOccludingCircleMaskRadius](self, "_nonOccludingCircleMaskRadius");
  -[BKUIPearlEnrollView _enrollMaskPathWithRadius:](self, "_enrollMaskPathWithRadius:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((a3 - 4) < 6)
  {
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      if (-[BKUIPearlEnrollView needsMaskedNeedsPositionStyleEnrollment](self, "needsMaskedNeedsPositionStyleEnrollment"))
      {
        -[BKUIPearlPositioningGuideView prepareMaskLayerForReducedMotionOpenTransition](self->_positioningGuide, "prepareMaskLayerForReducedMotionOpenTransition");
      }
      v11 = MEMORY[0x1E0CEABB0];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke;
      v40[3] = &unk_1EA27FB98;
      v40[4] = self;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_2;
      v37[3] = &unk_1EA280B60;
      v37[4] = self;
      v38 = v10;
      v39 = v6;
      +[UIView bkui_animateWithDuration:animations:completion:](0.3, v11, v40, v37);

      v12 = v38;
    }
    else
    {
      v13 = -[BKUIPearlEnrollView _animateCircleMaskWithPositioningGuide](self, "_animateCircleMaskWithPositioningGuide");
      v14 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_6;
      aBlock[3] = &unk_1EA280BB0;
      v36 = v13;
      aBlock[4] = self;
      v34 = v10;
      v35 = v6;
      v15 = _Block_copy(aBlock);
      objc_initWeak(&location, self);
      if (v8 > 4)
      {
        v17 = objc_loadWeakRetained(&location);
        objc_msgSend(v17, "pillContainer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v14;
        v28[1] = 3221225472;
        v28[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_14;
        v28[3] = &unk_1EA280080;
        v29 = v15;
        objc_msgSend(v18, "setAllPillState:animated:completion:", 4, 1, v28);

      }
      else
      {
        pillContainer = self->_pillContainer;
        v30[0] = v14;
        v30[1] = 3221225472;
        v30[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_13;
        v30[3] = &unk_1EA280080;
        v31 = v15;
        -[BKUIPearlPillContainerView setAllPillState:animated:completion:](pillContainer, "setAllPillState:animated:completion:", 4, 1, v30);
        v17 = v31;
      }

      objc_destroyWeak(&location);
      v12 = v34;
    }
LABEL_20:

    goto LABEL_21;
  }
  if (a3)
  {
    -[CAShapeLayer setPath:](self->_circleMaskLayer, "setPath:", objc_msgSend(objc_retainAutorelease(v9), "CGPath"));
    -[UIView setAlpha:](self->_circleMaskView, "setAlpha:", 1.0);
    if (-[BKUIPearlEnrollView needsMaskedNeedsPositionStyleEnrollment](self, "needsMaskedNeedsPositionStyleEnrollment"))
    {
      IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      positioningGuide = self->_positioningGuide;
      if (IsReduceMotionEnabled)
        -[BKUIPearlPositioningGuideView prepareMaskLayerForReducedMotionOpenTransition](positioningGuide, "prepareMaskLayerForReducedMotionOpenTransition");
      else
        -[BKUIPearlPositioningGuideView prepareMaskLayerForStartToOpenTransition](positioningGuide, "prepareMaskLayerForStartToOpenTransition");
      -[UIView setAlpha:](self->_roundedRectMaskView, "setAlpha:", 1.0);
    }
    if (a3 == 2)
    {
      -[BKUIPearlEnrollView previewLayer](self, "previewLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlEnrollView _needsPositioningPreviewTransform](self, "_needsPositioningPreviewTransform");
      objc_msgSend(v21, "setTransform:", v27);

      -[BKUIPearlPositioningGuideView resetValuesToStart](self->_positioningGuide, "resetValuesToStart");
    }
    v22 = MEMORY[0x1E0CEABB0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_15;
    v26[3] = &unk_1EA27FB98;
    v26[4] = self;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_16;
    v23[3] = &unk_1EA280438;
    v23[4] = self;
    v25 = v7;
    v24 = v6;
    +[UIView bkui_animateWithDuration:animations:completion:](0.3, v22, v26, v23);
    v12 = v24;
    goto LABEL_20;
  }
  -[BKUIPearlEnrollView _updateToNeedsPositionWithoutAnimationWithCompletion:](self, "_updateToNeedsPositionWithoutAnimationWithCompletion:", v6);
LABEL_21:

}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _OWORD v5[8];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "previewLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "_needsPositioningPreviewTransform");
  else
    memset(v5, 0, sizeof(v5));
  objc_msgSend(v2, "setTransform:", v5);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "setAlpha:", 0.0);
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setPath:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGPath"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "setAlpha:", 1.0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 624);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_3;
  v4[3] = &unk_1EA2802C0;
  v4[4] = v2;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "animateToOpenValuesOverDuration:curve:completion:", 2, v4, 0.0);

}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  _QWORD v5[5];

  v1 = MEMORY[0x1E0CEABB0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_4;
  v5[3] = &unk_1EA27FB98;
  v2 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_5;
  v3[3] = &unk_1EA27FF90;
  v4 = v2;
  +[UIView bkui_animateWithDuration:animations:completion:](0.3, v1, v5, v3);

}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setAlpha:", 1.0);
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  char v16;
  _QWORD v17[4];
  uint64_t v18;
  _QWORD v19[5];
  id v20;

  v2 = MEMORY[0x1E0C809B0];
  if (!*(_BYTE *)(a1 + 56))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "pillRingRadius");
    objc_msgSend(v3, "_enrollMaskPathWithRadius:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 640);
    v7 = objc_msgSend(v6, "path");
    v8 = objc_retainAutorelease(v4);
    v9 = objc_msgSend(v8, "CGPath");
    v10 = *MEMORY[0x1E0CD3040];
    v19[0] = v2;
    v19[1] = 3221225472;
    v19[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_7;
    v19[3] = &unk_1EA27FC78;
    v11 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v11;
    objc_msgSend(v5, "runBasicAnimationOnLayer:withDuration:keyPath:fromValue:toValue:removedOnCompletion:timingFunction:completion:", v6, CFSTR("path"), v7, v9, 1, v10, 0.1, v19);

  }
  v12 = MEMORY[0x1E0CEABB0];
  v17[0] = v2;
  v17[1] = 3221225472;
  v17[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_8;
  v17[3] = &unk_1EA27FB98;
  v18 = *(_QWORD *)(a1 + 32);
  v13[0] = v2;
  v13[1] = 3221225472;
  v13[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_9;
  v13[3] = &unk_1EA280B88;
  v13[4] = v18;
  v15 = *(id *)(a1 + 48);
  v16 = *(_BYTE *)(a1 + 56);
  v14 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:animations:completion:](0.1, v12, v17, v13);

}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setPath:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGPath"));
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setAlpha:", 1.0);
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "resetPillsAnimated:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 624);
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_10;
  v14[3] = &unk_1EA2802C0;
  v14[4] = v2;
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v3, "animateToOpenValuesOverDuration:curve:completion:", 2, v14, 0.8);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_11;
  v13[3] = &unk_1EA27FB98;
  v13[4] = *(_QWORD *)(a1 + 32);
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.4, 0.1, MEMORY[0x1E0CEABB0], 0, v13, 0);
  if (*(_BYTE *)(a1 + 56))
  {
    +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 640);
    v7 = objc_msgSend(v6, "path");
    v8 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGPath");
    v9 = *MEMORY[0x1E0CD3040];
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_12;
    v11[3] = &unk_1EA27FC78;
    v10 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    objc_msgSend(v5, "runBasicAnimationOnLayer:withDuration:keyPath:fromValue:toValue:removedOnCompletion:timingFunction:completion:", v6, CFSTR("path"), v7, v8, 1, v9, 0.5, v11);

  }
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_10(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2 && !UIAccessibilityIsReduceMotionEnabled())
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "breathe");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  _OWORD v4[8];

  objc_msgSend(*(id *)(a1 + 32), "previewLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "_needsPositioningPreviewTransform");
  else
    memset(v4, 0, sizeof(v4));
  objc_msgSend(v2, "setTransform:", v4);

}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setPath:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGPath"));
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_15(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setAlpha:", 1.0);
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_16(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];
  id v4;
  char v5;
  _QWORD v6[4];
  uint64_t v7;

  v1 = MEMORY[0x1E0CEABB0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_17;
  v6[3] = &unk_1EA27FB98;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_103;
  v3[3] = &unk_1EA280438;
  v2 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v3[1] = 3221225472;
  v5 = *(_BYTE *)(a1 + 48);
  v3[4] = v7;
  v4 = v2;
  +[UIView bkui_animateWithDuration:animations:completion:](0.3, v1, v6, v3);

}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  double v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 744), "setAlphaHideOnZero:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "setAlpha:", 0.0);
  _BKUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "_animateToNeedsPositioningFromState: PreviewLayer's opacity will be updated to 1", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "previewLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setOpacity:", v4);

}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_103(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  if (*(_BYTE *)(a1 + 48))
  {
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    v3 = *(void **)(v1 + 624);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_2_104;
    v5[3] = &unk_1EA2802C0;
    v5[4] = v1;
    v6 = v2;
    objc_msgSend(v3, "animateToOpenValuesOverDuration:curve:completion:", 2, v5, 0.8);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
  }
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_2_104(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2 && !UIAccessibilityIsReduceMotionEnabled())
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "breathe");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateToNeedsPositionWithoutAnimationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  CAShapeLayer *circleMaskLayer;
  id v7;
  _BOOL4 IsReduceMotionEnabled;
  BKUIPearlPositioningGuideView *positioningGuide;
  void *v10;
  NSObject *v11;
  void *v12;
  double v13;
  BKUIPearlPositioningGuideView *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];
  _BYTE v19[128];

  v4 = a3;
  -[BKUIPearlPositioningGuideView setHidden:](self->_positioningGuide, "setHidden:", 0);
  -[BKUIPearlEnrollView setCameraBlurred:](self, "setCameraBlurred:", 0);
  -[BKUIPearlEnrollView _nonOccludingCircleMaskRadius](self, "_nonOccludingCircleMaskRadius");
  -[BKUIPearlEnrollView _enrollMaskPathWithRadius:](self, "_enrollMaskPathWithRadius:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  circleMaskLayer = self->_circleMaskLayer;
  v7 = objc_retainAutorelease(v5);
  -[CAShapeLayer setPath:](circleMaskLayer, "setPath:", objc_msgSend(v7, "CGPath"));
  -[UIView setAlpha:](self->_circleMaskView, "setAlpha:", 1.0);
  if (-[BKUIPearlEnrollView needsMaskedNeedsPositionStyleEnrollment](self, "needsMaskedNeedsPositionStyleEnrollment"))
  {
    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    positioningGuide = self->_positioningGuide;
    if (IsReduceMotionEnabled)
      -[BKUIPearlPositioningGuideView prepareMaskLayerForReducedMotionOpenTransition](positioningGuide, "prepareMaskLayerForReducedMotionOpenTransition");
    else
      -[BKUIPearlPositioningGuideView prepareMaskLayerForStartToOpenTransition](positioningGuide, "prepareMaskLayerForStartToOpenTransition");
    -[UIView setAlpha:](self->_roundedRectMaskView, "setAlpha:", 1.0);
  }
  -[BKUIPearlEnrollView previewLayer](self, "previewLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollView _needsPositioningPreviewTransform](self, "_needsPositioningPreviewTransform");
  objc_msgSend(v10, "setTransform:", v19);

  -[BKUIPearlPositioningGuideView resetValuesToStart](self->_positioningGuide, "resetValuesToStart");
  -[UILabel setAlpha:](self->_repositionPhoneLabel, "setAlpha:", 0.0);
  -[BKUIPearlPositioningGuideView setAlpha:](self->_positioningGuide, "setAlpha:", 1.0);
  -[BKUIPearlMovieLoopView setAlphaHideOnZero:](self->_tutorialMovieView, "setAlphaHideOnZero:", 0.0);
  -[BKUIPearlPillContainerView setAlpha:](self->_pillContainer, "setAlpha:", 0.0);
  _BKUILoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v11, OS_LOG_TYPE_DEFAULT, "_updateToNeedsPositionWithoutAnimationWithCompletion: PreviewLayer's opacity will be updated to 1", buf, 2u);
  }

  -[BKUIPearlEnrollView previewLayer](self, "previewLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1.0;
  objc_msgSend(v12, "setOpacity:", v13);

  v14 = self->_positioningGuide;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__BKUIPearlEnrollView__updateToNeedsPositionWithoutAnimationWithCompletion___block_invoke;
  v16[3] = &unk_1EA2802C0;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  -[BKUIPearlPositioningGuideView animateToOpenValuesOverDuration:curve:completion:](v14, "animateToOpenValuesOverDuration:curve:completion:", 2, v16, 0.0);

}

uint64_t __76__BKUIPearlEnrollView__updateToNeedsPositionWithoutAnimationWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2 && !UIAccessibilityIsReduceMotionEnabled())
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "breathe");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_animateToNeedsCenterBinWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void (**v11)(_QWORD);
  void *v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  _QWORD v15[5];
  id v16;
  void (**v17)(_QWORD);
  _QWORD v18[5];
  id v19;
  _QWORD aBlock[5];
  id v21;

  v4 = a3;
  self->_progressiveBlur = 0;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke;
  aBlock[3] = &unk_1EA2800F8;
  aBlock[4] = self;
  v6 = v4;
  v21 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v7[2](v7);
  }
  else
  {
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_5;
    v18[3] = &unk_1EA2800F8;
    v18[4] = self;
    v8 = v7;
    v19 = v8;
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_7;
    v15[3] = &unk_1EA27FE20;
    v15[4] = self;
    v9 = _Block_copy(v18);
    v16 = v9;
    v17 = v8;
    v10 = _Block_copy(v15);
    v11 = (void (**)(_QWORD))_Block_copy(v10);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v14 = (void (**)(_QWORD))_Block_copy(v9);

      v11 = v14;
    }
    v11[2](v11);

  }
}

uint64_t __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t result;
  _QWORD block[5];

  v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_2;
  block[3] = &unk_1EA27FB98;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double *v3;
  double v4;
  double v5;
  _QWORD v6[4];
  id v7;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 704) == 4)
  {
    objc_msgSend((id)v2, "_updateRaiseLowerGuidanceLabelIfNeededForPitch:", *(double *)(v2 + 448));
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = *(double **)(a1 + 32);
    objc_msgSend(v3, "_progressiveBlurAmountForPitch:", v3[56]);
    v5 = v4 + 1.0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_3;
    v6[3] = &unk_1EA27FB70;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "setCameraBlurAmount:useShade:duration:completion:", 1, v6, v5, 1.0);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && *((_DWORD *)WeakRetained + 176) == 4)
  {
    *((_BYTE *)WeakRetained + 440) = 1;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_4;
    v3[3] = &unk_1EA27FB98;
    v3[4] = WeakRetained;
    +[UIView bkui_animateWithDuration:animations:](0.5, MEMORY[0x1E0CEABB0], v3);
  }

}

uint64_t __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.5);
}

void __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 624);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_6;
  v4[3] = &unk_1EA2802C0;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "animateToOpenValuesOverDuration:curve:completion:", 0, v4, 0.4);

}

uint64_t __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_6(uint64_t a1, int a2)
{
  if (a2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "breathe");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 624);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_8;
  v4[3] = &unk_1EA27FF68;
  v4[1] = 3221225472;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "animateToPopOutValuesOverDuration:completion:", v4, 0.4);

}

uint64_t __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_8(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = 40;
  if (a2)
    v2 = 32;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + v2) + 16))();
}

- (void)_animateToScanningStateWithCompletion:(id)a3
{
  id v4;
  BKUIPearlPillContainerView *pillContainer;
  uint64_t v6;
  double v7;
  BKUIPearlPillContainerView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  _BOOL4 v14;
  id v15;
  const CGPath *v16;
  void *v17;
  CAShapeLayer *circleMaskLayer;
  uint64_t v19;
  uint64_t v20;
  BKUIPearlPositioningGuideView *positioningGuide;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  dispatch_time_t v27;
  _QWORD block[5];
  _QWORD v29[5];
  id v30;
  BOOL v31;
  _QWORD v32[6];
  _QWORD v33[5];
  _QWORD v34[5];

  v4 = a3;
  -[BKUIPearlEnrollView setCameraBlurred:](self, "setCameraBlurred:", 0);
  pillContainer = self->_pillContainer;
  if (UIAccessibilityIsReduceMotionEnabled())
    v6 = 2;
  else
    v6 = 4;
  -[BKUIPearlPillContainerView alpha](self->_pillContainer, "alpha");
  -[BKUIPearlPillContainerView setAllPillState:animated:completion:](pillContainer, "setAllPillState:animated:completion:", v6, v7 > 0.0, 0);
  v8 = self->_pillContainer;
  -[BKUIPearlEnrollView pillRingRadius](self, "pillRingRadius");
  v10 = v9;
  -[BKUIPearlEnrollView portalCenter](self, "portalCenter");
  -[BKUIPearlPillContainerView setRadius:center:animated:completion:](v8, "setRadius:center:animated:completion:", 0, 0, v10, v11, v12);
  v13 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke;
  v34[3] = &unk_1EA27FB98;
  v34[4] = self;
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.3, 0.0, MEMORY[0x1E0CEABB0], 516, v34, 0);
  v14 = -[BKUIPearlEnrollView _animateCircleMaskWithPositioningGuide](self, "_animateCircleMaskWithPositioningGuide");
  -[BKUIPearlEnrollView portalRadius](self, "portalRadius");
  -[BKUIPearlEnrollView _enrollMaskPathWithRadius:](self, "_enrollMaskPathWithRadius:");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (const CGPath *)objc_msgSend(v15, "CGPath");

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    -[BKUIPearlPositioningGuideView setAlpha:](self->_positioningGuide, "setAlpha:", 0.0);
    if (!CGPathEqualToPath(-[CAShapeLayer path](self->_circleMaskLayer, "path"), v16))
    {
      -[UIView setAlpha:](self->_circleMaskView, "setAlpha:", 0.0);
      -[CAShapeLayer setPath:](self->_circleMaskLayer, "setPath:", v16);
      v33[0] = v13;
      v33[1] = 3221225472;
      v33[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_2;
      v33[3] = &unk_1EA27FB98;
      v33[4] = self;
      +[UIView bkui_animateWithDuration:animations:](0.4, MEMORY[0x1E0CEABB0], v33);
    }
  }
  else if (v14)
  {
    +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    circleMaskLayer = self->_circleMaskLayer;
    v19 = -[CAShapeLayer path](circleMaskLayer, "path");
    v20 = *MEMORY[0x1E0CD3050];
    v32[0] = v13;
    v32[1] = 3221225472;
    v32[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_3;
    v32[3] = &unk_1EA2801E8;
    v32[4] = self;
    v32[5] = v16;
    objc_msgSend(v17, "runBasicAnimationOnLayer:withDuration:keyPath:fromValue:toValue:removedOnCompletion:timingFunction:completion:", circleMaskLayer, CFSTR("path"), v19, v16, 1, v20, 0.5, v32);

  }
  positioningGuide = self->_positioningGuide;
  -[BKUIPearlEnrollView portalCenter](self, "portalCenter");
  v23 = v22;
  v25 = v24;
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_4;
  v29[3] = &unk_1EA280438;
  v31 = v14;
  v29[4] = self;
  v30 = v4;
  v26 = v4;
  -[BKUIPearlPositioningGuideView animateToFinishedValuesOverDuration:center:completion:](positioningGuide, "animateToFinishedValuesOverDuration:center:completion:", v29, 0.5, v23, v25);
  v27 = dispatch_time(0, 300000000);
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_8;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_after(v27, MEMORY[0x1E0C80D38], block);

}

uint64_t __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
}

uint64_t __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "setAlpha:", 1.0);
}

uint64_t __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setPath:", *(_QWORD *)(a1 + 40));
}

void __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_4(uint64_t a1)
{
  BOOL IsReduceMotionEnabled;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  uint64_t v22;
  _QWORD v23[5];
  id v24;

  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v3 = MEMORY[0x1E0C809B0];
  if (!IsReduceMotionEnabled && !*(_BYTE *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "pillRingRadius");
    objc_msgSend(v4, "_enrollMaskPathWithRadius:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 640);
    v18 = objc_retainAutorelease(v5);
    objc_msgSend(v6, "setPath:", objc_msgSend(v18, "CGPath"));
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "portalRadius");
    objc_msgSend(v7, "_enrollMaskPathWithRadius:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 640);
    v11 = objc_msgSend(v10, "path");
    v12 = objc_retainAutorelease(v8);
    v13 = objc_msgSend(v12, "CGPath");
    v14 = *MEMORY[0x1E0CD3050];
    v23[0] = v3;
    v23[1] = 3221225472;
    v23[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_5;
    v23[3] = &unk_1EA27FC78;
    v23[4] = *(_QWORD *)(a1 + 32);
    v24 = v12;
    v15 = v12;
    objc_msgSend(v9, "runBasicAnimationOnLayer:withDuration:keyPath:fromValue:toValue:removedOnCompletion:timingFunction:completion:", v10, CFSTR("path"), v11, v13, 1, v14, 0.2, v23);

  }
  v16 = MEMORY[0x1E0CEABB0];
  v21[0] = v3;
  v21[1] = 3221225472;
  v21[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_6;
  v21[3] = &unk_1EA27FB98;
  v17 = *(void **)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 32);
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_7;
  v19[3] = &unk_1EA2802C0;
  v19[4] = v22;
  v20 = v17;
  +[UIView bkui_animateWithDuration:animations:completion:](0.2, v16, v21, v19);

}

uint64_t __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setPath:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGPath"));
}

uint64_t __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setAlpha:", 0.0);
}

uint64_t __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_7(uint64_t a1)
{
  char v2;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setHidden:", 1);
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "unstashPillStatesIfNeededAnimated:", 1);
  if (!UIAccessibilityIsReduceMotionEnabled() && (v2 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "setAllPillState:animated:completion:", 2, 1, 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_8(uint64_t a1)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_9;
  v1[3] = &unk_1EA27FB98;
  v1[4] = *(_QWORD *)(a1 + 32);
  +[UIView bkui_animateWithDuration:animations:](0.4, MEMORY[0x1E0CEABB0], v1);
}

void __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  _OWORD v4[8];

  objc_msgSend(*(id *)(a1 + 32), "previewLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "_scanningAndPartialCapturePreviewTransform");
  else
    memset(v4, 0, sizeof(v4));
  objc_msgSend(v2, "setTransform:", v4);

}

- (void)_animateToFirstScanWithCompletion:(id)a3
{
  BKUIPearlPillContainerView *pillContainer;
  id v5;

  pillContainer = self->_pillContainer;
  v5 = a3;
  -[BKUIPearlPillContainerView setAlpha:](pillContainer, "setAlpha:", 0.0);
  -[BKUIPearlEnrollView _animateToScanningStateWithCompletion:](self, "_animateToScanningStateWithCompletion:", v5);

}

- (void)_animateToFirstScanCompleteWithCompletion:(id)a3
{
  BKUIPearlPillContainerView *pillContainer;
  BKUIPearlPillContainerView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  pillContainer = self->_pillContainer;
  v10 = a3;
  -[BKUIPearlPillContainerView setAllPillState:animated:completion:](pillContainer, "setAllPillState:animated:completion:", 5, 1, 0);
  -[BKUIPearlEnrollView setCameraBlurred:](self, "setCameraBlurred:", 1);
  v5 = self->_pillContainer;
  -[BKUIPearlEnrollView completedRingRadius](self, "completedRingRadius");
  v7 = v6;
  -[BKUIPearlEnrollView portalCenter](self, "portalCenter");
  -[BKUIPearlPillContainerView setRadius:center:animated:completion:](v5, "setRadius:center:animated:completion:", 1, v10, v7, v8, v9);

}

- (void)_animateToScanCompleteWithCompletion:(id)a3
{
  BKUIPearlPillContainerView *pillContainer;
  BKUIPearlPillContainerView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  pillContainer = self->_pillContainer;
  v10 = a3;
  -[BKUIPearlPillContainerView setAllPillState:animated:completion:](pillContainer, "setAllPillState:animated:completion:", 5, 1, 0);
  -[BKUIPearlEnrollView setCameraBlurred:](self, "setCameraBlurred:", 1);
  v5 = self->_pillContainer;
  -[BKUIPearlEnrollView completedRingRadius](self, "completedRingRadius");
  v7 = v6;
  -[BKUIPearlEnrollView portalCenter](self, "portalCenter");
  -[BKUIPearlPillContainerView setRadius:center:animated:completion:](v5, "setRadius:center:animated:completion:", 1, v10, v7, v8, v9);

}

- (void)_animateToFinishedWithCompletion:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  void *v10;
  CAShapeLayer *circleMaskLayer;
  id v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  if (!-[BKUIPearlEnrollView squareNeedsPositionLayout](self, "squareNeedsPositionLayout"))
  {
    -[BKUIPearlEnrollView bounds](self, "bounds");
    -[BKUIPearlEnrollView _maskPathWithRadius:inFrame:](self, "_maskPathWithRadius:inFrame:", 0.001, v4, v5, v6, v7);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGPath");

    +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    circleMaskLayer = self->_circleMaskLayer;
    -[BKUIPearlEnrollView portalRadius](self, "portalRadius");
    -[BKUIPearlEnrollView _enrollMaskPathWithRadius:](self, "_enrollMaskPathWithRadius:");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "CGPath");
    objc_msgSend(v10, "runBasicAnimationOnLayer:withDuration:keyPath:fromValue:toValue:removedOnCompletion:timingFunction:completion:", circleMaskLayer, CFSTR("path"), v13, v9, 0, *MEMORY[0x1E0CD3050], 0.3, v14);

    -[CAShapeLayer setPath:](self->_circleMaskLayer, "setPath:", v9);
  }

}

- (void)_animateToPartialCaptureWithCompletion:(id)a3
{
  id v4;
  BKUIPearlPillContainerView *pillContainer;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  _BOOL4 v11;
  id v12;
  const CGPath *v13;
  void *v14;
  CAShapeLayer *circleMaskLayer;
  uint64_t v16;
  uint64_t v17;
  BKUIPearlPositioningGuideView *positioningGuide;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  dispatch_time_t v24;
  _QWORD block[5];
  _QWORD v26[5];
  id v27;
  BOOL v28;
  _QWORD v29[6];
  _QWORD v30[5];
  _QWORD v31[5];

  v4 = a3;
  -[BKUIPearlEnrollView setCameraBlurred:](self, "setCameraBlurred:", 1);
  -[BKUIPearlPillContainerView setAllPillState:animated:completion:](self->_pillContainer, "setAllPillState:animated:completion:", 5, 1, 0);
  pillContainer = self->_pillContainer;
  -[BKUIPearlEnrollView pillRingRadius](self, "pillRingRadius");
  v7 = v6;
  -[BKUIPearlEnrollView portalCenter](self, "portalCenter");
  -[BKUIPearlPillContainerView setRadius:center:animated:completion:](pillContainer, "setRadius:center:animated:completion:", 1, 0, v7, v8, v9);
  v10 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke;
  v31[3] = &unk_1EA27FB98;
  v31[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 516, v31, 0, 0.3, 0.0);
  v11 = -[BKUIPearlEnrollView _animateCircleMaskWithPositioningGuide](self, "_animateCircleMaskWithPositioningGuide");
  -[BKUIPearlEnrollView portalRadius](self, "portalRadius");
  -[BKUIPearlEnrollView _enrollMaskPathWithRadius:](self, "_enrollMaskPathWithRadius:");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const CGPath *)objc_msgSend(v12, "CGPath");

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    -[BKUIPearlPositioningGuideView setAlpha:](self->_positioningGuide, "setAlpha:", 0.0);
    if (!CGPathEqualToPath(-[CAShapeLayer path](self->_circleMaskLayer, "path"), v13))
    {
      -[UIView setAlpha:](self->_circleMaskView, "setAlpha:", 0.0);
      -[CAShapeLayer setPath:](self->_circleMaskLayer, "setPath:", v13);
      v30[0] = v10;
      v30[1] = 3221225472;
      v30[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_2;
      v30[3] = &unk_1EA27FB98;
      v30[4] = self;
      +[UIView bkui_animateWithDuration:animations:](0.4, MEMORY[0x1E0CEABB0], v30);
    }
  }
  else if (v11)
  {
    +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    circleMaskLayer = self->_circleMaskLayer;
    v16 = -[CAShapeLayer path](circleMaskLayer, "path");
    v17 = *MEMORY[0x1E0CD3050];
    v29[0] = v10;
    v29[1] = 3221225472;
    v29[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_3;
    v29[3] = &unk_1EA2801E8;
    v29[4] = self;
    v29[5] = v13;
    objc_msgSend(v14, "runBasicAnimationOnLayer:withDuration:keyPath:fromValue:toValue:removedOnCompletion:timingFunction:completion:", circleMaskLayer, CFSTR("path"), v16, v13, 1, v17, 0.5, v29);

  }
  positioningGuide = self->_positioningGuide;
  -[BKUIPearlEnrollView portalCenter](self, "portalCenter");
  v20 = v19;
  v22 = v21;
  v26[0] = v10;
  v26[1] = 3221225472;
  v26[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_4;
  v26[3] = &unk_1EA280438;
  v28 = v11;
  v26[4] = self;
  v27 = v4;
  v23 = v4;
  -[BKUIPearlPositioningGuideView animateToFinishedValuesOverDuration:center:completion:](positioningGuide, "animateToFinishedValuesOverDuration:center:completion:", v26, 0.5, v20, v22);
  v24 = dispatch_time(0, 300000000);
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_8;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_after(v24, MEMORY[0x1E0C80D38], block);

}

uint64_t __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
}

uint64_t __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "setAlpha:", 1.0);
}

uint64_t __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setPath:", *(_QWORD *)(a1 + 40));
}

void __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_4(uint64_t a1)
{
  BOOL IsReduceMotionEnabled;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  uint64_t v22;
  _QWORD v23[5];
  id v24;

  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v3 = MEMORY[0x1E0C809B0];
  if (!IsReduceMotionEnabled && !*(_BYTE *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "pillRingRadius");
    objc_msgSend(v4, "_enrollMaskPathWithRadius:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 640);
    v18 = objc_retainAutorelease(v5);
    objc_msgSend(v6, "setPath:", objc_msgSend(v18, "CGPath"));
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "portalRadius");
    objc_msgSend(v7, "_enrollMaskPathWithRadius:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 640);
    v11 = objc_msgSend(v10, "path");
    v12 = objc_retainAutorelease(v8);
    v13 = objc_msgSend(v12, "CGPath");
    v14 = *MEMORY[0x1E0CD3050];
    v23[0] = v3;
    v23[1] = 3221225472;
    v23[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_5;
    v23[3] = &unk_1EA27FC78;
    v23[4] = *(_QWORD *)(a1 + 32);
    v24 = v12;
    v15 = v12;
    objc_msgSend(v9, "runBasicAnimationOnLayer:withDuration:keyPath:fromValue:toValue:removedOnCompletion:timingFunction:completion:", v10, CFSTR("path"), v11, v13, 1, v14, 0.2, v23);

  }
  v16 = MEMORY[0x1E0CEABB0];
  v21[0] = v3;
  v21[1] = 3221225472;
  v21[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_6;
  v21[3] = &unk_1EA27FB98;
  v17 = *(void **)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 32);
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_7;
  v19[3] = &unk_1EA2802C0;
  v19[4] = v22;
  v20 = v17;
  +[UIView bkui_animateWithDuration:animations:completion:](0.2, v16, v21, v19);

}

uint64_t __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setPath:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGPath"));
}

uint64_t __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setAlpha:", 0.0);
}

uint64_t __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setHidden:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_8(uint64_t a1)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_9;
  v1[3] = &unk_1EA27FB98;
  v1[4] = *(_QWORD *)(a1 + 32);
  +[UIView bkui_animateWithDuration:animations:](0.4, MEMORY[0x1E0CEABB0], v1);
}

void __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  _OWORD v4[8];

  objc_msgSend(*(id *)(a1 + 32), "previewLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "_scanningAndPartialCapturePreviewTransform");
  else
    memset(v4, 0, sizeof(v4));
  objc_msgSend(v2, "setTransform:", v4);

}

- (CGSize)tutorialMovieSize
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && !-[BKUIPearlEnrollView inSheet](self, "inSheet"))
    v5 = 200.0;
  else
    v5 = 133.333333;
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)portalRadius
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double result;
  double v16;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && !-[BKUIPearlEnrollView inSheet](self, "inSheet"))
  {
    -[BKUIPearlPositioningGuideView minimumMaskLayerDistanceFromCenter](self->_positioningGuide, "minimumMaskLayerDistanceFromCenter");
  }
  else
  {
    +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isZoomEnabled") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceIdiom") == 0;

      v8 = dbl_1DB2DFB50[v7];
    }
    else
    {

      v8 = 150.0;
    }
    if (-[BKUIPearlEnrollView squareNeedsPositionLayout](self, "squareNeedsPositionLayout"))
    {
      +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isZoomEnabled");

      if (v10)
      {
        +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "mainScreenClass");
        -[BKUIPearlEnrollView bounds](self, "bounds");
        v14 = -45.0;
        if (v12 == 31)
          v14 = -60.0;
        v8 = v13 * 0.5 + v14;

      }
      else
      {
        -[BKUIPearlEnrollView bounds](self, "bounds");
        return v16 * 0.5 + -48.6 + -5.0;
      }
    }
    return v8;
  }
  return result;
}

- (double)_nonOccludingCircleMaskRadius
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;

  -[BKUIPearlEnrollView bounds](self, "bounds");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return v4;
  -[BKUIPearlPositioningGuideView maximumMaskLayerDistanceFromCenter](self->_positioningGuide, "maximumMaskLayerDistanceFromCenter");
  return sqrt(v7 * v7 + v7 * v7);
}

- (double)tutorialRingRadius
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && !-[BKUIPearlEnrollView inSheet](self, "inSheet"))
    return 172.5;
  else
    return 116.0;
}

- (double)pillRingRadius
{
  double v2;

  -[BKUIPearlEnrollView portalRadius](self, "portalRadius");
  return v2 + 4.0;
}

- (CGPoint)portalCenter
{
  CGFloat MidX;
  double MidY;
  double v5;
  CGPoint result;
  CGRect v7;
  CGRect v8;

  -[BKUIPearlEnrollView bounds](self, "bounds");
  MidX = CGRectGetMidX(v7);
  -[BKUIPearlEnrollView bounds](self, "bounds");
  MidY = CGRectGetMidY(v8);
  v5 = MidX;
  result.y = MidY;
  result.x = v5;
  return result;
}

- (CGPoint)portalOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;
  CGRect v11;
  CGRect v12;

  -[BKUIPearlEnrollView portalCenter](self, "portalCenter");
  v4 = v3;
  v6 = v5;
  -[BKUIPearlEnrollView bounds](self, "bounds");
  v7 = v4 - CGRectGetMidX(v11);
  -[BKUIPearlEnrollView bounds](self, "bounds");
  v8 = v6 - CGRectGetMidY(v12);
  v9 = v7;
  result.y = v8;
  result.x = v9;
  return result;
}

- (double)_previewZoomLevel
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0.8;
  -[BKUIPearlEnrollView previewLayer](self, "previewLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[BKUIPearlEnrollView portalRadius](self, "portalRadius");
  return (v8 + 5.0 + v8 + 5.0) / v7;
}

- (CATransform3D)_scanningAndPartialCapturePreviewTransform
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CATransform3D v11;
  CATransform3D a;
  CATransform3D v13;
  CATransform3D v14;

  -[BKUIPearlEnrollView portalOffset](self, "portalOffset");
  v6 = v5;
  v8 = v7;
  -[BKUIPearlEnrollView _previewZoomLevel](self, "_previewZoomLevel");
  memset(&v14, 0, sizeof(v14));
  CATransform3DMakeScale(&v14, v9, v9, v9);
  memset(&v13, 0, sizeof(v13));
  CATransform3DMakeTranslation(&v13, v6, v8, 0.0);
  a = v14;
  v11 = v13;
  return CATransform3DConcat(retstr, &a, &v11);
}

- (CATransform3D)_needsPositioningPreviewTransform
{
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  CATransform3D *result;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CATransform3D v24;
  CATransform3D a;
  CATransform3D v26;
  CATransform3D v27;
  CATransform3D v28;

  v5 = (_OWORD *)MEMORY[0x1E0CD2610];
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&retstr->m33 = v6;
  v7 = v5[7];
  *(_OWORD *)&retstr->m41 = v5[6];
  *(_OWORD *)&retstr->m43 = v7;
  v8 = v5[1];
  *(_OWORD *)&retstr->m11 = *v5;
  *(_OWORD *)&retstr->m13 = v8;
  v9 = v5[3];
  *(_OWORD *)&retstr->m21 = v5[2];
  *(_OWORD *)&retstr->m23 = v9;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[BKUIPearlEnrollView portalOffset](self, "portalOffset");
    v14 = v13;
    v16 = v15;
    -[BKUIPearlEnrollView _previewZoomLevel](self, "_previewZoomLevel");
    v18 = v17;
    -[BKUIPearlVideoCaptureSession additionalPreviewScalingAllowedByCameraFormat](self->_videoCaptureSession, "additionalPreviewScalingAllowedByCameraFormat");
    memset(&v28, 0, sizeof(v28));
    CATransform3DMakeScale(&v28, v18 * v19, v18 * v19, v18 * v19);
    memset(&v27, 0, sizeof(v27));
    CATransform3DMakeTranslation(&v27, v14, v16, 0.0);
    a = v28;
    v24 = v27;
    result = CATransform3DConcat(&v26, &a, &v24);
    v20 = *(_OWORD *)&v26.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v26.m31;
    *(_OWORD *)&retstr->m33 = v20;
    v21 = *(_OWORD *)&v26.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v26.m41;
    *(_OWORD *)&retstr->m43 = v21;
    v22 = *(_OWORD *)&v26.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v26.m11;
    *(_OWORD *)&retstr->m13 = v22;
    v23 = *(_OWORD *)&v26.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v26.m21;
    *(_OWORD *)&retstr->m23 = v23;
  }
  return result;
}

- (void)setMovieViewHidden:(BOOL)a3
{
  BKUIPearlMovieLoopView *tutorialMovieView;

  tutorialMovieView = self->_tutorialMovieView;
  if (a3)
    -[BKUIPearlMovieLoopView hideAVPlayerReplaceWithSnapshot](tutorialMovieView, "hideAVPlayerReplaceWithSnapshot");
  else
    -[BKUIPearlMovieLoopView unhideAVPlayerRemoveSnapshot](tutorialMovieView, "unhideAVPlayerRemoveSnapshot");
}

- (BOOL)needsMaskedNeedsPositionStyleEnrollment
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || -[BKUIPearlEnrollView squareNeedsPositionLayout](self, "squareNeedsPositionLayout");
}

- (void)setPillsHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;

  v3 = a3;
  -[BKUIPearlEnrollView pillContainer](self, "pillContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v5 = 1.0;
  if (v3)
    v5 = 0.0;
  objc_msgSend(v4, "setAlpha:", v5);

}

- (void)setCrosshairsHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;

  v3 = a3;
  -[BKUIPearlEnrollView crossHairs](self, "crossHairs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v5 = 1.0;
  if (v3)
    v5 = 0.0;
  objc_msgSend(v4, "setAlpha:", v5);

}

- (BKUIPearlEnrollViewDelegate)delegate
{
  return (BKUIPearlEnrollViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isTransitioningToState
{
  return self->_transitioningToState;
}

- (void)setTransitioningToState:(BOOL)a3
{
  self->_transitioningToState = a3;
}

- (BKUIPearlEnrollViewStateTransitionDelegate)transitionDelegate
{
  return (BKUIPearlEnrollViewStateTransitionDelegate *)objc_loadWeakRetained((id *)&self->_transitionDelegate);
}

- (void)setTransitionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transitionDelegate, a3);
}

- (BOOL)debugOverlayVisible
{
  return self->_debugOverlayVisible;
}

- (UILayoutGuide)portalLayoutGuide
{
  return self->_portalLayoutGuide;
}

- (BKUIPearlPillContainerView)pillContainer
{
  return self->_pillContainer;
}

- (void)setPillContainer:(id)a3
{
  objc_storeStrong((id *)&self->_pillContainer, a3);
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (void)setInSheet:(BOOL)a3
{
  self->_inSheet = a3;
}

- (BKUIPearlMovieLoopView)tutorialMovieView
{
  return self->_tutorialMovieView;
}

- (void)setTutorialMovieView:(id)a3
{
  objc_storeStrong((id *)&self->_tutorialMovieView, a3);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSArray)portalLayoutGuideConstraints
{
  return self->_portalLayoutGuideConstraints;
}

- (void)setPortalLayoutGuideConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_portalLayoutGuideConstraints, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)squareNeedsPositionLayout
{
  return self->_squareNeedsPositionLayout;
}

- (void)setSquareNeedsPositionLayout:(BOOL)a3
{
  self->_squareNeedsPositionLayout = a3;
}

- (BKUIPearlCrossHairsView)crossHairs
{
  return self->_crossHairs;
}

- (void)setCrossHairs:(id)a3
{
  objc_storeStrong((id *)&self->_crossHairs, a3);
}

- (OBAnimationView)animationView
{
  return self->_animationView;
}

- (void)setAnimationView:(id)a3
{
  objc_storeStrong((id *)&self->_animationView, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (NSLayoutConstraint)successAnimationViewCenterYConstraint
{
  return self->_successAnimationViewCenterYConstraint;
}

- (void)setSuccessAnimationViewCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_successAnimationViewCenterYConstraint, a3);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_successAnimationViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_crossHairs, 0);
  objc_storeStrong((id *)&self->_portalLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_tutorialMovieView, 0);
  objc_storeStrong((id *)&self->_pillContainer, 0);
  objc_storeStrong((id *)&self->_portalLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_transitionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_raiseLowerGuidanceDelayTimer, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_roundedRectMaskLayer, 0);
  objc_storeStrong((id *)&self->_roundedRectMaskView, 0);
  objc_storeStrong((id *)&self->_circleMaskLayer, 0);
  objc_storeStrong((id *)&self->_circleMaskView, 0);
  objc_storeStrong((id *)&self->_positioningGuide, 0);
  objc_storeStrong((id *)&self->_tutorialPlayer, 0);
  objc_storeStrong((id *)&self->_nudgeTimer, 0);
  objc_storeStrong((id *)&self->_stateStart, 0);
  objc_storeStrong((id *)&self->_debugStatusInformation, 0);
  objc_storeStrong((id *)&self->_debugTemplateInformation, 0);
  objc_storeStrong((id *)&self->_debugFrameInformation, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_repositionPhoneLabel, 0);
  objc_storeStrong((id *)&self->_cameraShadeView, 0);
  objc_storeStrong((id *)&self->_videoCaptureSession, 0);
}

@end
