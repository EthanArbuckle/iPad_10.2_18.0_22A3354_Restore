@implementation MKMapGestureController

- (void)setZoomEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[MKVariableDelayTapRecognizer setEnabled:](self->_doubleTapGestureRecognizer, "setEnabled:");
  -[UITapGestureRecognizer setEnabled:](self->_twoFingerTapGestureRecognizer, "setEnabled:", v3);
  -[UIPinchGestureRecognizer setEnabled:](self->_pinchGestureRecognizer, "setEnabled:", v3);
  -[_MKOneHandedZoomGestureRecognizer setEnabled:](self->_oneHandedZoomGestureRecognizer, "setEnabled:", v3);
  -[_MKConditionalPanZoomGestureRecognizer setEnabled:](self->_conditionalPanZoomGestureRecognizer, "setEnabled:", v3);
}

- (void)setTiltEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[MKTiltGestureRecognizer setEnabled:](self->_tiltGestureRecognizer, "setEnabled:");
  -[_MKConditionalPanTiltGestureRecognizer setEnabled:](self->_conditionalPanTiltGestureRecognizer, "setEnabled:", v3);
}

- (void)setScrollEnabled:(BOOL)a3
{
  -[UIPanGestureRecognizer setEnabled:](self->_panGestureRecognizer, "setEnabled:", a3);
}

- (void)setRotationEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIRotationGestureRecognizer setEnabled:](self->_rotationGestureRecognizer, "setEnabled:");
  -[_MKConditionalPanRotationGestureRecognizer setEnabled:](self->_conditionalPanRotationGestureRecognizer, "setEnabled:", v3);
}

- (void)clearGestureRecognizersInFlight
{
  -[MKMapGestureController _clearGesture:](self, "_clearGesture:", self->_panGestureRecognizer);
  -[MKMapGestureController _clearGesture:](self, "_clearGesture:", self->_pinchGestureRecognizer);
  -[MKMapGestureController _clearGesture:](self, "_clearGesture:", self->_twoFingerLongPressGestureRecognizer);
  -[MKMapGestureController _clearGesture:](self, "_clearGesture:", self->_twoFingerTapGestureRecognizer);
  -[MKMapGestureController _clearGesture:](self, "_clearGesture:", self->_doubleTapGestureRecognizer);
  -[MKMapGestureController _clearGesture:](self, "_clearGesture:", self->_oneHandedZoomGestureRecognizer);
}

- (void)_clearGesture:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  v3 = objc_msgSend(v4, "isEnabled");
  objc_msgSend(v4, "setEnabled:", 0);
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)setRotationFilter:(id)a3
{
  objc_storeStrong((id *)&self->_rotationFilter, a3);
}

- (MKMapGestureController)initWithMapView:(id)a3 gestureTargetView:(id)a4 doubleTapTargetView:(id)a5
{
  id v9;
  id v10;
  id v11;
  MKMapGestureController *v12;
  MKMapGestureController *v13;
  MKVariableDelayTapRecognizer *v14;
  MKVariableDelayTapRecognizer *doubleTapGestureRecognizer;
  uint64_t v16;
  UITapGestureRecognizer *twoFingerTapGestureRecognizer;
  uint64_t v18;
  UILongPressGestureRecognizer *twoFingerLongPressGestureRecognizer;
  uint64_t v20;
  UIPinchGestureRecognizer *pinchGestureRecognizer;
  _MKZoomingGestureControlConfiguration *v22;
  _MKZoomingGestureControlConfiguration *zoomConfiguration;
  MKPanGestureRecognizer *v24;
  UIPanGestureRecognizer *panGestureRecognizer;
  _MKUserInteractionGestureRecognizer *v26;
  _MKUserInteractionGestureRecognizer *touchGestureRecognizer;
  uint64_t v28;
  UIRotationGestureRecognizer *rotationGestureRecognizer;
  MKTiltGestureRecognizer *v30;
  MKTiltGestureRecognizer *tiltGestureRecognizer;
  _MKConditionalPanRotationGestureRecognizer *v32;
  _MKConditionalPanRotationGestureRecognizer *conditionalPanRotationGestureRecognizer;
  _MKConditionalPanZoomGestureRecognizer *v34;
  _MKConditionalPanZoomGestureRecognizer *conditionalPanZoomGestureRecognizer;
  _MKConditionalPanTiltGestureRecognizer *v36;
  _MKConditionalPanTiltGestureRecognizer *conditionalPanTiltGestureRecognizer;
  uint64_t v38;
  _UIInterruptScrollDecelerationGestureRecognizer *gestureInterruptionRecognizer;
  void *v40;
  double v41;
  _MKDirectionalArrowRecognizer *v42;
  _MKDirectionalArrowRecognizer *arrowZoomGestureRecognizer;
  _MKDirectionalArrowRecognizer *v44;
  _MKDirectionalArrowRecognizer *arrowRotateGestureRecognizer;
  _MKDirectionalArrowRecognizer *v46;
  _MKDirectionalArrowRecognizer *arrowPanGestureRecognizer;
  MKMapGestureController *v48;
  objc_super v50;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v50.receiver = self;
  v50.super_class = (Class)MKMapGestureController;
  v12 = -[MKMapGestureController init](&v50, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mapView, a3);
    v13->_rotationSnappingEnabled = 0;
    v14 = -[MKVariableDelayTapRecognizer initWithTarget:action:]([MKVariableDelayTapRecognizer alloc], "initWithTarget:action:", v13, sel_handleDoubleTap_);
    doubleTapGestureRecognizer = v13->_doubleTapGestureRecognizer;
    v13->_doubleTapGestureRecognizer = v14;

    -[MKVariableDelayTapRecognizer setNumberOfTapsRequired:](v13->_doubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
    -[MKVariableDelayTapRecognizer setNumberOfTouchesRequired:](v13->_doubleTapGestureRecognizer, "setNumberOfTouchesRequired:", 1);
    -[MKVariableDelayTapRecognizer setTapDelayDelegate:](v13->_doubleTapGestureRecognizer, "setTapDelayDelegate:", v13);
    objc_msgSend(v11, "addGestureRecognizer:", v13->_doubleTapGestureRecognizer);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v13, sel_handleTwoFingerTap_);
    twoFingerTapGestureRecognizer = v13->_twoFingerTapGestureRecognizer;
    v13->_twoFingerTapGestureRecognizer = (UITapGestureRecognizer *)v16;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](v13->_twoFingerTapGestureRecognizer, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v13->_twoFingerTapGestureRecognizer, "setNumberOfTouchesRequired:", 2);
    objc_msgSend(v10, "addGestureRecognizer:", v13->_twoFingerTapGestureRecognizer);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v13, sel_handleTwoFingerLongPress_);
    twoFingerLongPressGestureRecognizer = v13->_twoFingerLongPressGestureRecognizer;
    v13->_twoFingerLongPressGestureRecognizer = (UILongPressGestureRecognizer *)v18;

    -[UILongPressGestureRecognizer setNumberOfTouchesRequired:](v13->_twoFingerLongPressGestureRecognizer, "setNumberOfTouchesRequired:", 2);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v13->_twoFingerLongPressGestureRecognizer, "setMinimumPressDuration:", 0.2);
    objc_msgSend(v10, "addGestureRecognizer:", v13->_twoFingerLongPressGestureRecognizer);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA840]), "initWithTarget:action:", v13, sel_handlePinch_);
    pinchGestureRecognizer = v13->_pinchGestureRecognizer;
    v13->_pinchGestureRecognizer = (UIPinchGestureRecognizer *)v20;

    -[UIPinchGestureRecognizer setDelegate:](v13->_pinchGestureRecognizer, "setDelegate:", v13);
    -[UIPinchGestureRecognizer _setEndsOnSingleTouch:](v13->_pinchGestureRecognizer, "_setEndsOnSingleTouch:", 1);
    objc_msgSend(v10, "addGestureRecognizer:", v13->_pinchGestureRecognizer);
    v22 = -[_MKZoomingGestureControlConfiguration initWithDecelerationThreshold:maximumZoomInVelocity:maximumZoomOutVelocity:zoomOutFrictionScale:]([_MKZoomingGestureControlConfiguration alloc], "initWithDecelerationThreshold:maximumZoomInVelocity:maximumZoomOutVelocity:zoomOutFrictionScale:", 3.0, 10.0, -10.0, 4.5);
    zoomConfiguration = v13->_zoomConfiguration;
    v13->_zoomConfiguration = v22;

    v24 = -[MKPanGestureRecognizer initWithTarget:action:]([MKPanGestureRecognizer alloc], "initWithTarget:action:", v13, sel_handlePan_);
    panGestureRecognizer = v13->_panGestureRecognizer;
    v13->_panGestureRecognizer = &v24->super;

    -[UIPanGestureRecognizer setDelegate:](v13->_panGestureRecognizer, "setDelegate:", v13);
    -[UIPanGestureRecognizer _setRequiresSystemGesturesToFail:](v13->_panGestureRecognizer, "_setRequiresSystemGesturesToFail:", 1);
    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v13->_panGestureRecognizer, "setAllowedScrollTypesMask:", 2);
    objc_msgSend(v10, "addGestureRecognizer:", v13->_panGestureRecognizer);
    v26 = -[_MKUserInteractionGestureRecognizer initWithTarget:action:]([_MKUserInteractionGestureRecognizer alloc], "initWithTarget:action:", v13, sel_handleTouch_);
    touchGestureRecognizer = v13->_touchGestureRecognizer;
    v13->_touchGestureRecognizer = v26;

    -[_MKUserInteractionGestureRecognizer setTouchObserver:](v13->_touchGestureRecognizer, "setTouchObserver:", v13);
    -[_MKUserInteractionGestureRecognizer setDelegate:](v13->_touchGestureRecognizer, "setDelegate:", v13);
    -[_MKUserInteractionGestureRecognizer setCancelsTouchesInView:](v13->_touchGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[_MKUserInteractionGestureRecognizer setDelaysTouchesBegan:](v13->_touchGestureRecognizer, "setDelaysTouchesBegan:", 0);
    -[_MKUserInteractionGestureRecognizer setDelaysTouchesEnded:](v13->_touchGestureRecognizer, "setDelaysTouchesEnded:", 0);
    objc_msgSend(v10, "addGestureRecognizer:", v13->_touchGestureRecognizer);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA910]), "initWithTarget:action:", v13, sel_handleRotation_);
    rotationGestureRecognizer = v13->_rotationGestureRecognizer;
    v13->_rotationGestureRecognizer = (UIRotationGestureRecognizer *)v28;

    -[UIRotationGestureRecognizer setDelegate:](v13->_rotationGestureRecognizer, "setDelegate:", v13);
    -[UIRotationGestureRecognizer _setPreRecognitionWeight:](v13->_rotationGestureRecognizer, "_setPreRecognitionWeight:", 0.5);
    objc_msgSend(v10, "addGestureRecognizer:", v13->_rotationGestureRecognizer);
    v30 = -[MKTiltGestureRecognizer initWithTarget:action:]([MKTiltGestureRecognizer alloc], "initWithTarget:action:", v13, sel_handleTilt_);
    tiltGestureRecognizer = v13->_tiltGestureRecognizer;
    v13->_tiltGestureRecognizer = v30;

    -[MKTiltGestureRecognizer setDelegate:](v13->_tiltGestureRecognizer, "setDelegate:", v13);
    objc_msgSend(v10, "addGestureRecognizer:", v13->_tiltGestureRecognizer);
    v32 = -[_MKConditionalPanRotationGestureRecognizer initWithTarget:action:]([_MKConditionalPanRotationGestureRecognizer alloc], "initWithTarget:action:", v13, sel__handleRotationPan_);
    conditionalPanRotationGestureRecognizer = v13->_conditionalPanRotationGestureRecognizer;
    v13->_conditionalPanRotationGestureRecognizer = v32;

    -[_MKConditionalPanRotationGestureRecognizer setDelegate:](v13->_conditionalPanRotationGestureRecognizer, "setDelegate:", v13);
    -[_MKConditionalPanRotationGestureRecognizer setAllowedScrollTypesMask:](v13->_conditionalPanRotationGestureRecognizer, "setAllowedScrollTypesMask:", 2);
    objc_msgSend(v10, "addGestureRecognizer:", v13->_conditionalPanRotationGestureRecognizer);
    -[UIPanGestureRecognizer requireGestureRecognizerToFail:](v13->_panGestureRecognizer, "requireGestureRecognizerToFail:", v13->_conditionalPanRotationGestureRecognizer);
    v34 = -[_MKConditionalPanZoomGestureRecognizer initWithTarget:action:]([_MKConditionalPanZoomGestureRecognizer alloc], "initWithTarget:action:", v13, sel__handleZoomPan_);
    conditionalPanZoomGestureRecognizer = v13->_conditionalPanZoomGestureRecognizer;
    v13->_conditionalPanZoomGestureRecognizer = v34;

    -[_MKConditionalPanZoomGestureRecognizer setDelegate:](v13->_conditionalPanZoomGestureRecognizer, "setDelegate:", v13);
    -[_MKConditionalPanZoomGestureRecognizer setAllowedScrollTypesMask:](v13->_conditionalPanZoomGestureRecognizer, "setAllowedScrollTypesMask:", 2);
    objc_msgSend(v10, "addGestureRecognizer:", v13->_conditionalPanZoomGestureRecognizer);
    -[UIPanGestureRecognizer requireGestureRecognizerToFail:](v13->_panGestureRecognizer, "requireGestureRecognizerToFail:", v13->_conditionalPanZoomGestureRecognizer);
    v36 = -[_MKConditionalPanTiltGestureRecognizer initWithTarget:action:]([_MKConditionalPanTiltGestureRecognizer alloc], "initWithTarget:action:", v13, sel__handleStandardTilt_);
    conditionalPanTiltGestureRecognizer = v13->_conditionalPanTiltGestureRecognizer;
    v13->_conditionalPanTiltGestureRecognizer = v36;

    -[_MKConditionalPanTiltGestureRecognizer setDelegate:](v13->_conditionalPanTiltGestureRecognizer, "setDelegate:", v13);
    -[_MKConditionalPanTiltGestureRecognizer setAllowedScrollTypesMask:](v13->_conditionalPanTiltGestureRecognizer, "setAllowedScrollTypesMask:", 2);
    objc_msgSend(v10, "addGestureRecognizer:", v13->_conditionalPanTiltGestureRecognizer);
    -[UIPanGestureRecognizer requireGestureRecognizerToFail:](v13->_panGestureRecognizer, "requireGestureRecognizerToFail:", v13->_conditionalPanTiltGestureRecognizer);
    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEADA0]), "initWithTarget:action:", v13, sel__handleInterrupt_);
    gestureInterruptionRecognizer = v13->_gestureInterruptionRecognizer;
    v13->_gestureInterruptionRecognizer = (_UIInterruptScrollDecelerationGestureRecognizer *)v38;

    objc_msgSend(v10, "addGestureRecognizer:", v13->_gestureInterruptionRecognizer);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleForKey:", CFSTR("ZoomingDefault"));
    v13->_arrowZoomSpeed = v41;

    v42 = -[_MKDirectionalArrowRecognizer initWithTarget:action:]([_MKDirectionalArrowRecognizer alloc], "initWithTarget:action:", v13, sel_handleArrowZoom_);
    arrowZoomGestureRecognizer = v13->_arrowZoomGestureRecognizer;
    v13->_arrowZoomGestureRecognizer = v42;

    v44 = -[_MKDirectionalArrowRecognizer initWithTarget:action:]([_MKDirectionalArrowRecognizer alloc], "initWithTarget:action:", v13, sel_handleArrowRotate_);
    arrowRotateGestureRecognizer = v13->_arrowRotateGestureRecognizer;
    v13->_arrowRotateGestureRecognizer = v44;

    v46 = -[_MKDirectionalArrowRecognizer initWithTarget:action:]([_MKDirectionalArrowRecognizer alloc], "initWithTarget:action:", v13, sel_handleArrowPan_);
    arrowPanGestureRecognizer = v13->_arrowPanGestureRecognizer;
    v13->_arrowPanGestureRecognizer = v46;

    v13->_panWithMomentum = 1;
    -[MKMapGestureController setupOneHandedZoomGestureRecognizerForView:](v13, "setupOneHandedZoomGestureRecognizerForView:", v10);
    v48 = v13;
  }

  return v13;
}

- (UIGestureRecognizer)oneHandedZoomGestureRecognizer
{
  return (UIGestureRecognizer *)self->_oneHandedZoomGestureRecognizer;
}

- (UITapGestureRecognizer)twoFingerTapGestureRecognizer
{
  return self->_twoFingerTapGestureRecognizer;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return &self->_doubleTapGestureRecognizer->super;
}

- (void)setupOneHandedZoomGestureRecognizerForView:(id)a3
{
  _MKOneHandedZoomGestureRecognizer *v4;
  _MKOneHandedZoomGestureRecognizer *oneHandedZoomGestureRecognizer;
  void *v6;
  void *v7;
  void *v8;
  UIPanGestureRecognizer *panGestureRecognizer;
  void *v10;
  id v11;

  v11 = a3;
  if (_MKLinkedOnOrAfterReleaseSet(2310))
  {
    v4 = -[_MKOneHandedZoomGestureRecognizer initWithTarget:action:]([_MKOneHandedZoomGestureRecognizer alloc], "initWithTarget:action:", self, sel_handlePanZoom_);
    oneHandedZoomGestureRecognizer = self->_oneHandedZoomGestureRecognizer;
    self->_oneHandedZoomGestureRecognizer = v4;

    -[_MKOneHandedZoomGestureRecognizer setDelegate:](self->_oneHandedZoomGestureRecognizer, "setDelegate:", self);
    objc_msgSend(v11, "addGestureRecognizer:", self->_oneHandedZoomGestureRecognizer);
    -[_MKOneHandedZoomGestureRecognizer tapGestureRecognizer](self->_oneHandedZoomGestureRecognizer, "tapGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addGestureRecognizer:", v6);

    -[_MKOneHandedZoomGestureRecognizer panGestureRecognizer](self->_oneHandedZoomGestureRecognizer, "panGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addGestureRecognizer:", v7);

    -[_MKOneHandedZoomGestureRecognizer tapGestureRecognizer](self->_oneHandedZoomGestureRecognizer, "tapGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requireGestureRecognizerToFail:", self->_panGestureRecognizer);

    panGestureRecognizer = self->_panGestureRecognizer;
    -[_MKOneHandedZoomGestureRecognizer panGestureRecognizer](self->_oneHandedZoomGestureRecognizer, "panGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer requireGestureRecognizerToFail:](panGestureRecognizer, "requireGestureRecognizerToFail:", v10);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKMapGestureController)initWithMapView:(id)a3 gestureTargetView:(id)a4
{
  return -[MKMapGestureController initWithMapView:gestureTargetView:doubleTapTargetView:](self, "initWithMapView:gestureTargetView:doubleTapTargetView:", a3, a4, a4);
}

- (void)_setOneHandedZoomGestureConfiguration:(id)a3
{
  -[_MKOneHandedZoomGestureRecognizer setConfiguration:](self->_oneHandedZoomGestureRecognizer, "setConfiguration:", a3);
}

- (BOOL)isRotationEnabled
{
  return -[UIRotationGestureRecognizer isEnabled](self->_rotationGestureRecognizer, "isEnabled");
}

- (BOOL)isTiltEnabled
{
  return -[MKTiltGestureRecognizer isEnabled](self->_tiltGestureRecognizer, "isEnabled");
}

- (void)dealloc
{
  objc_super v3;

  -[_MKUserInteractionGestureRecognizer setTouchObserver:](self->_touchGestureRecognizer, "setTouchObserver:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MKMapGestureController;
  -[MKMapGestureController dealloc](&v3, sel_dealloc);
}

- (BOOL)isZoomEnabled
{
  if ((-[UIPinchGestureRecognizer isEnabled](self->_pinchGestureRecognizer, "isEnabled") & 1) != 0
    || (-[MKVariableDelayTapRecognizer isEnabled](self->_doubleTapGestureRecognizer, "isEnabled") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[_MKOneHandedZoomGestureRecognizer isEnabled](self->_oneHandedZoomGestureRecognizer, "isEnabled");
  }
}

- (BOOL)isScrollEnabled
{
  return -[UIPanGestureRecognizer isEnabled](self->_panGestureRecognizer, "isEnabled");
}

- (void)setCompassView:(id)a3
{
  MKCompassView *v5;
  MKCompassView **p_compassView;
  MKCompassView *compassView;
  MKCompassView *v8;

  v5 = (MKCompassView *)a3;
  compassView = self->_compassView;
  p_compassView = &self->_compassView;
  if (compassView != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_compassView, a3);
    v5 = v8;
  }

}

- (void)stopDynamicAnimations
{
  VKDynamicAnimation *pinchDecelerationAnimation;
  VKCompoundAnimation *panDecelerationAnimationGroup;
  VKDynamicAnimation *rotationDecelerationAnimation;
  VKDynamicAnimation *tiltDecelerationAnimation;
  VKTimedAnimation *currentArrowAnimation;
  VKDynamicAnimation *v8;
  VKCompoundAnimation *v9;
  VKDynamicAnimation *v10;
  VKDynamicAnimation *v11;
  VKTimedAnimation *v12;

  pinchDecelerationAnimation = self->_pinchDecelerationAnimation;
  if (pinchDecelerationAnimation)
  {
    self->_pinchDecelerationAnimation = 0;
    v8 = pinchDecelerationAnimation;

    -[VKDynamicAnimation stop](v8, "stop");
  }
  panDecelerationAnimationGroup = self->_panDecelerationAnimationGroup;
  if (panDecelerationAnimationGroup)
  {
    self->_panDecelerationAnimationGroup = 0;
    v9 = panDecelerationAnimationGroup;

    -[VKCompoundAnimation stop](v9, "stop");
  }
  rotationDecelerationAnimation = self->_rotationDecelerationAnimation;
  if (rotationDecelerationAnimation)
  {
    self->_rotationDecelerationAnimation = 0;
    v10 = rotationDecelerationAnimation;

    -[VKDynamicAnimation stop](v10, "stop");
  }
  tiltDecelerationAnimation = self->_tiltDecelerationAnimation;
  if (tiltDecelerationAnimation)
  {
    self->_tiltDecelerationAnimation = 0;
    v11 = tiltDecelerationAnimation;

    -[VKDynamicAnimation stop](v11, "stop");
  }
  currentArrowAnimation = self->_currentArrowAnimation;
  if (currentArrowAnimation)
  {
    self->_currentArrowAnimation = 0;
    v12 = currentArrowAnimation;

    -[VKTimedAnimation stopAnimation:](v12, "stopAnimation:", 0);
  }
}

- (void)beginGesturing
{
  int64_t gestureCount;
  id WeakRetained;
  id v5;

  gestureCount = self->_gestureCount;
  if (!gestureCount)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "gestureControllerWillStartUserInteraction:", self);

    gestureCount = self->_gestureCount;
  }
  self->_gestureCount = gestureCount + 1;
  -[MKMapGestureController stopDynamicAnimations](self, "stopDynamicAnimations");
  -[MKBasicMapView mapView](self->_mapView, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopSnappingAnimations");

}

- (void)endGesturing
{
  int64_t gestureCount;
  int64_t v3;
  id WeakRetained;

  gestureCount = self->_gestureCount;
  if (gestureCount <= 0)
    v3 = 0;
  else
    v3 = gestureCount - 1;
  self->_gestureCount = v3;
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "gestureControllerDidStopUserInteraction:", self);

  }
}

- (void)_setTraitCollection:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UITraitCollection isEqual:](self->_traitCollection, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_traitCollection, a3);
    if (-[UITraitCollection userInterfaceIdiom](self->_traitCollection, "userInterfaceIdiom") == UIUserInterfaceIdiomCarPlay)
      +[_MKZoomingGestureControlConfiguration configurationForCarPlay](_MKZoomingGestureControlConfiguration, "configurationForCarPlay");
    else
      +[_MKZoomingGestureControlConfiguration defaultConfiguration](_MKZoomingGestureControlConfiguration, "defaultConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKOneHandedZoomGestureRecognizer setConfiguration:](self->_oneHandedZoomGestureRecognizer, "setConfiguration:", v5);

  }
}

- (void)_handleStandardTilt:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  char v10;
  id v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  VKDynamicAnimation *v26;
  VKDynamicAnimation *tiltDecelerationAnimation;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  _QWORD v40[5];
  id v41;
  double v42;
  double v43;
  double v44;
  _QWORD v45[5];
  id v46;
  double v47;
  double v48;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self->_mapView);
  v6 = v5;
  v8 = v7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "gestureController:focusPointForPoint:gestureKind:", self, 3, v6, v8);
    v6 = v12;
    v8 = v13;

  }
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      -[MKMapGestureController beginGesturing](self, "beginGesturing");
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v14, "gestureControllerWillStartTilting:", self);

      -[MKMapGestureController mapView](self, "mapView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mapView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "startPitchingWithFocusPoint:", v6, v8);
      goto LABEL_10;
    case 2:
      objc_msgSend(v4, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "translationInView:", v31);
      v33 = v32;

      -[MKMapGestureController mapView](self, "mapView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mapView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updatePitchWithFocusPoint:translation:", v6, v8, v33);
LABEL_10:

      goto LABEL_16;
    case 3:
      objc_msgSend(v4, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "velocityInView:", v17);
      v19 = v18;

      -[MKMapGestureController mapView](self, "mapView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "mapView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (fabs(v19) <= 100.0
        || (objc_msgSend(v15, "isFullyPitched") & 1) != 0
        || !objc_msgSend(v15, "isPitched"))
      {
        objc_msgSend(v15, "stopPitchingWithFocusPoint:", v6, v8);
        v37 = objc_loadWeakRetained((id *)&self->_delegate);
        v38 = v37;
        if (v19 >= 0.0)
          objc_msgSend(v37, "gestureControllerDidStopTilting:willDecelerate:tiltDirection:", self, 0, 2);
        else
          objc_msgSend(v37, "gestureControllerDidStopTilting:willDecelerate:tiltDirection:", self, 0, 1);

        -[MKMapGestureController endGesturing](self, "endGesturing");
      }
      else
      {
        v21 = MEMORY[0x1E0C809B0];
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __46__MKMapGestureController__handleStandardTilt___block_invoke;
        v45[3] = &unk_1E20DA388;
        v45[4] = self;
        v22 = v15;
        v46 = v22;
        v47 = v6;
        v48 = v8;
        v23 = (void *)MEMORY[0x18D778DB8](v45);
        v40[0] = v21;
        v40[1] = 3221225472;
        v40[2] = __46__MKMapGestureController__handleStandardTilt___block_invoke_2;
        v40[3] = &unk_1E20DA3B0;
        v40[4] = self;
        v41 = v22;
        v42 = v6;
        v43 = v8;
        v44 = v19;
        v24 = (void *)MEMORY[0x18D778DB8](v40);
        -[VKDynamicAnimation stop](self->_tiltDecelerationAnimation, "stop");
        v25 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v25, "gestureControllerDidStopTilting:willDecelerate:tiltDirection:", self, 1, 0);

        v26 = (VKDynamicAnimation *)objc_alloc_init(MEMORY[0x1E0DC64F0]);
        tiltDecelerationAnimation = self->_tiltDecelerationAnimation;
        self->_tiltDecelerationAnimation = v26;

        -[VKDynamicAnimation setCompletionHandler:](self->_tiltDecelerationAnimation, "setCompletionHandler:", v24);
        -[MKMapGestureController mapView](self, "mapView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "translationInView:", v28);
        v39 = v23;
        dynamicValueAnimation();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKDynamicAnimation setDynamicStepHandler:](self->_tiltDecelerationAnimation, "setDynamicStepHandler:", v29);

        -[MKBasicMapView mapView](self->_mapView, "mapView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "runAnimation:", self->_tiltDecelerationAnimation);

      }
LABEL_16:

      break;
    case 4:
      -[MKMapGestureController mapView](self, "mapView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "mapView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stopPitchingWithFocusPoint:", v6, v8);

      v36 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v36, "gestureControllerDidStopTilting:willDecelerate:tiltDirection:", self, 0, 0);

      -[MKMapGestureController endGesturing](self, "endGesturing");
      break;
    default:
      break;
  }

}

void __46__MKMapGestureController__handleStandardTilt___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFullyPitched");

  if ((v7 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "updatePitchWithFocusPoint:translation:", *(double *)(a1 + 48), *(double *)(a1 + 56), a3);
}

void __46__MKMapGestureController__handleStandardTilt___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 328);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 328);
  *(_QWORD *)(v2 + 328) = 0;

  objc_msgSend(*(id *)(a1 + 40), "stopPitchingWithFocusPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v4 = *(double *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v6 = WeakRetained;
  v7 = *(_QWORD *)(a1 + 32);
  if (v4 >= 0.0)
    objc_msgSend(WeakRetained, "gestureControllerDidStopTilting:willDecelerate:tiltDirection:", v7, 0, 2);
  else
    objc_msgSend(WeakRetained, "gestureControllerDidStopTilting:willDecelerate:tiltDirection:", v7, 0, 1);

  objc_msgSend(*(id *)(a1 + 32), "endGesturing");
}

uint64_t __46__MKMapGestureController__handleStandardTilt___block_invoke_3(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(_QWORD, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(double *)(*(_QWORD *)(a1 + 32) + 256), a2);
}

- (void)handleRotation:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  char v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v4 = a3;
  MKGetGesturesLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HandleRotation", (const char *)&unk_18B2CC343, buf, 2u);
  }

  objc_msgSend(v4, "locationInView:", self->_mapView);
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "gestureController:focusPointForPoint:gestureKind:", self, 2, v7, v9);
    v7 = v13;
    v9 = v14;

  }
  v15 = objc_msgSend(v4, "state");
  objc_msgSend(v4, "rotation");
  v17 = v16;
  objc_msgSend(v4, "velocity");
  -[MKMapGestureController _updateRotationGestureForState:focusPoint:rotation:velocity:](self, "_updateRotationGestureForState:focusPoint:rotation:velocity:", v15, v7, v9, v17, v18);
  MKGetGesturesLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HandleRotation", (const char *)&unk_18B2CC343, v20, 2u);
  }

}

- (void)_updateRotationGestureForState:(int64_t)a3 focusPoint:(CGPoint)a4 rotation:(double)a5 velocity:(double)a6
{
  double y;
  double x;
  MKRotationFilter *v12;
  id WeakRetained;
  MKRotationFilter *rotationFilter;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void (**v21)(double);
  void *v22;
  void *v23;
  int v24;
  id v25;
  VKDynamicAnimation *v26;
  VKDynamicAnimation *rotationDecelerationAnimation;
  void *v28;
  void *v29;
  MKRotationFilter *v30;
  void *v31;
  void *v32;
  id v33;
  void (**v34)(double);
  _QWORD v35[7];
  _QWORD v36[7];

  y = a4.y;
  x = a4.x;
  if (a3 == 1)
  {
    -[MKMapGestureController beginGesturing](self, "beginGesturing");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "gestureControllerWillStartRotating:", self);

    rotationFilter = self->_rotationFilter;
    if (rotationFilter)
    {
      -[MKRotationFilter startRotatingWithFocusPoint:withSnapping:](rotationFilter, "startRotatingWithFocusPoint:withSnapping:", self->_rotationSnappingEnabled, x, y);
    }
    else
    {
      -[MKMapGestureController mapView](self, "mapView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "mapView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "startRotatingWithFocusPoint:", x, y);

    }
  }
  else if (a3 == 4)
  {
    v12 = self->_rotationFilter;
    if (v12)
    {
      -[MKRotationFilter stopRotatingWithFocusPoint:](v12, "stopRotatingWithFocusPoint:", a4.x, a4.y);
    }
    else
    {
      -[MKMapGestureController mapView](self, "mapView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mapView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stopRotatingWithFocusPoint:", x, y);

    }
    v17 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v17, "gestureControllerDidStopRotating:willDecelerate:", self, 0);

    -[MKMapGestureController endGesturing](self, "endGesturing");
    return;
  }
  v20 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __86__MKMapGestureController__updateRotationGestureForState_focusPoint_rotation_velocity___block_invoke;
  v36[3] = &unk_1E20DA400;
  v36[4] = self;
  *(double *)&v36[5] = x;
  *(double *)&v36[6] = y;
  v21 = (void (**)(double))MEMORY[0x18D778DB8](v36);
  v21[2](a5);
  if (a3 == 3)
  {
    if (fabs(a6) <= 3.0)
    {
      v30 = self->_rotationFilter;
      if (v30)
      {
        -[MKRotationFilter stopRotatingWithFocusPoint:](v30, "stopRotatingWithFocusPoint:", x, y);
      }
      else
      {
        -[MKMapGestureController mapView](self, "mapView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "mapView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stopRotatingWithFocusPoint:", x, y);

      }
      v33 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v33, "gestureControllerDidStopRotating:willDecelerate:", self, 0);

      -[MKMapGestureController endGesturing](self, "endGesturing");
    }
    else
    {
      v35[0] = v20;
      v35[1] = 3221225472;
      v35[2] = __86__MKMapGestureController__updateRotationGestureForState_focusPoint_rotation_velocity___block_invoke_2;
      v35[3] = &unk_1E20DA428;
      v35[4] = self;
      *(double *)&v35[5] = x;
      *(double *)&v35[6] = y;
      v22 = (void *)MEMORY[0x18D778DB8](v35);
      -[MKMapGestureController mapView](self, "mapView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isPointValidForGesturing:", x, y);

      if (v24)
      {
        -[VKDynamicAnimation stop](self->_rotationDecelerationAnimation, "stop");
        v25 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v25, "gestureControllerDidStopRotating:willDecelerate:", self, 1);

        v26 = (VKDynamicAnimation *)objc_alloc_init(MEMORY[0x1E0DC64F0]);
        rotationDecelerationAnimation = self->_rotationDecelerationAnimation;
        self->_rotationDecelerationAnimation = v26;

        -[VKDynamicAnimation setCompletionHandler:](self->_rotationDecelerationAnimation, "setCompletionHandler:", v22);
        v34 = v21;
        dynamicValueAnimation();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKDynamicAnimation setDynamicStepHandler:](self->_rotationDecelerationAnimation, "setDynamicStepHandler:", v28);

        -[MKBasicMapView mapView](self->_mapView, "mapView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "runAnimation:", self->_rotationDecelerationAnimation);

      }
    }
  }

}

void __86__MKMapGestureController__updateRotationGestureForState_focusPoint_rotation_velocity___block_invoke(uint64_t a1, double a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[5];
  if (v5)
  {
    objc_msgSend(v5, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 40), *(double *)(a1 + 48), a2);
  }
  else
  {
    objc_msgSend(v4, "mapView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mapView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 40), *(double *)(a1 + 48), a2);

  }
}

void __86__MKMapGestureController__updateRotationGestureForState_focusPoint_rotation_velocity___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 312);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 312);
  *(_QWORD *)(v2 + 312) = 0;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v4)
  {
    objc_msgSend(v4, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "gestureControllerDidStopRotatingDecelerating:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "endGesturing");
}

uint64_t __86__MKMapGestureController__updateRotationGestureForState_focusPoint_rotation_velocity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleDoubleTap:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[6];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(v4, "locationInView:", self->_mapView);
    v6 = v5;
    v8 = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "gestureController:focusPointForPoint:gestureKind:", self, 1, v6, v8);
      v6 = v11;
      v8 = v12;

    }
    v13 = objc_msgSend(v4, "modifierFlags");
    if ((v13 & 0x80000) != 0)
      v14 = -1.0;
    else
      v14 = 1.0;
    if ((v13 & 0x80000) != 0)
      v15 = 2;
    else
      v15 = 1;
    -[MKMapGestureController beginGesturing](self, "beginGesturing");
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v16, "gestureControllerWillStartZooming:animated:", self, 1);

    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __42__MKMapGestureController_handleDoubleTap___block_invoke;
    v18[3] = &unk_1E20DA478;
    v18[4] = self;
    v18[5] = v15;
    objc_msgSend(v17, "zoom:withFocusPoint:completionHandler:", v18, v14, v6, v8);

  }
}

uint64_t __42__MKMapGestureController_handleDoubleTap___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "gestureControllerDidStopZooming:direction:type:willDecelerate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 2, 0);

  return objc_msgSend(*(id *)(a1 + 32), "endGesturing");
}

- (void)handleTwoFingerTap:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  id v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  _QWORD v15[5];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(v4, "locationInView:", self->_mapView);
    v6 = v5;
    v8 = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "gestureController:focusPointForPoint:gestureKind:", self, 1, v6, v8);
      v6 = v11;
      v8 = v12;

    }
    -[MKMapGestureController beginGesturing](self, "beginGesturing");
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "gestureControllerWillStartZooming:animated:", self, 1);

    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__MKMapGestureController_handleTwoFingerTap___block_invoke;
    v15[3] = &unk_1E20DA4A0;
    v15[4] = self;
    objc_msgSend(v14, "zoom:withFocusPoint:completionHandler:", v15, -1.0, v6, v8);

  }
}

uint64_t __45__MKMapGestureController_handleTwoFingerTap___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "gestureControllerDidStopZooming:direction:type:willDecelerate:", *(_QWORD *)(a1 + 32), 2, 3, 0);

  return objc_msgSend(*(id *)(a1 + 32), "endGesturing");
}

- (void)handleTwoFingerLongPress:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == 1)
  {
    self->_didStartLongPress = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "gestureControllerWillStartTwoFingerLongPress:", self);

  }
  else if (objc_msgSend(v6, "state") == 3 || objc_msgSend(v6, "state") == 4)
  {
    if (self->_didStartLongPress)
    {
      v5 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v5, "gestureControllerDidStopTwoFingerLongPress:", self);

    }
    self->_didStartLongPress = 0;
  }

}

- (void)handlePinch:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = a3;
  MKGetGesturesLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HandlePinch", (const char *)&unk_18B2CC343, buf, 2u);
  }

  objc_msgSend(v4, "locationInView:", self->_mapView);
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "gestureController:focusPointForPoint:gestureKind:", self, 1, v7, v9);
    v7 = v12;
    v9 = v13;

  }
  objc_msgSend(v4, "scale");
  v15 = v14;
  objc_msgSend(v4, "velocity");
  -[MKMapGestureController _updateZoomGestureForState:focusPoint:scale:velocity:gestureType:configuration:](self, "_updateZoomGestureForState:focusPoint:scale:velocity:gestureType:configuration:", objc_msgSend(v4, "state"), 1, self->_zoomConfiguration, v7, v9, v15, v16);
  MKGetGesturesLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HandlePinch", (const char *)&unk_18B2CC343, v18, 2u);
  }

}

- (void)handlePanZoom:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  uint8_t v21[16];
  uint8_t buf[16];

  v4 = a3;
  MKGetGesturesLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HandlePanZoom", (const char *)&unk_18B2CC343, buf, 2u);
  }

  objc_msgSend(v4, "locationOfTapGesture");
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "gestureController:focusPointForPoint:gestureKind:", self, 1, v7, v9);
    v7 = v12;
    v9 = v13;

  }
  v14 = objc_msgSend(v4, "state");
  objc_msgSend(v4, "scale");
  v16 = v15;
  objc_msgSend(v4, "velocity");
  v18 = v17;
  objc_msgSend(v4, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapGestureController _updateZoomGestureForState:focusPoint:scale:velocity:gestureType:configuration:](self, "_updateZoomGestureForState:focusPoint:scale:velocity:gestureType:configuration:", v14, 4, v19, v7, v9, v16, v18);

  MKGetGesturesLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HandlePanZoom", (const char *)&unk_18B2CC343, v21, 2u);
  }

}

- (void)_updateZoomGestureForState:(int64_t)a3 focusPoint:(CGPoint)a4 scale:(double)a5 velocity:(double)a6 gestureType:(int64_t)a7 configuration:(id)a8
{
  double y;
  double x;
  id v15;
  void *v16;
  id v17;
  void *v18;
  double lastScale;
  uint64_t v20;
  id WeakRetained;
  void *v22;
  uint64_t v23;
  void (**v24)(_QWORD, double, double);
  NSObject *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  void *v36;
  double v37;
  uint64_t v38;
  VKDynamicAnimation *v39;
  VKDynamicAnimation *pinchDecelerationAnimation;
  void *v41;
  id v42;
  void *v43;
  double v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void (**v48)(_QWORD, double, double);
  _QWORD v49[8];
  _QWORD v50[7];
  uint8_t buf[4];
  double v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  y = a4.y;
  x = a4.x;
  v55 = *MEMORY[0x1E0C80C00];
  v15 = a8;
  if (a3 == 1)
  {
    self->_lastScale = 1.0;
    -[MKMapGestureController beginGesturing](self, "beginGesturing");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "gestureControllerWillStartZooming:animated:", self, 0);

    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "startPinchingWithFocusPoint:", x, y);

  }
  else if (a3 == 4)
  {
    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stopPinchingWithFocusPoint:", x, y);

    v17 = objc_loadWeakRetained((id *)&self->_delegate);
    v18 = v17;
    lastScale = self->_lastScale;
    if (lastScale > 1.0)
      v20 = 1;
    else
      v20 = 2 * (lastScale < 1.0);
    objc_msgSend(v17, "gestureControllerDidStopZooming:direction:type:willDecelerate:", self, v20, a7, 0);

    -[MKMapGestureController endGesturing](self, "endGesturing");
    goto LABEL_34;
  }
  v23 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __105__MKMapGestureController__updateZoomGestureForState_focusPoint_scale_velocity_gestureType_configuration___block_invoke;
  v50[3] = &unk_1E20DA4C8;
  v50[4] = self;
  *(double *)&v50[5] = x;
  *(double *)&v50[6] = y;
  v24 = (void (**)(_QWORD, double, double))MEMORY[0x18D778DB8](v50);
  if (-[MKBasicMapView isPointValidForGesturing:](self->_mapView, "isPointValidForGesturing:", x, y))
  {
    v24[2](v24, self->_lastScale, a5);
    MKGetGesturesLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = self->_lastScale;
      *(_DWORD *)buf = 134218240;
      v52 = v26;
      v53 = 2048;
      v54 = a5;
      _os_log_impl(&dword_18B0B0000, v25, OS_LOG_TYPE_DEBUG, "_updateZoomGestureForState oldFactor : %f newFactor : %f", buf, 0x16u);
    }

  }
  if (a3 == 3)
  {
    objc_msgSend(v15, "decelerationThreshold");
    v28 = -a6;
    if (a6 >= 0.0)
      v28 = a6;
    if (v28 <= v27)
    {
      -[MKBasicMapView mapView](self->_mapView, "mapView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stopPinchingWithFocusPoint:", x, y);

      v42 = objc_loadWeakRetained((id *)&self->_delegate);
      v43 = v42;
      v44 = self->_lastScale;
      if (v44 > 1.0)
        v45 = 1;
      else
        v45 = 2 * (v44 < 1.0);
      objc_msgSend(v42, "gestureControllerDidStopZooming:direction:type:willDecelerate:", self, v45, a7, 0);

      -[MKMapGestureController endGesturing](self, "endGesturing");
    }
    else
    {
      objc_msgSend(v15, "maximumZoomOutVelocity");
      v30 = v29;
      objc_msgSend(v15, "maximumZoomInVelocity");
      if (v30 <= a6)
        v32 = a6;
      else
        v32 = v30;
      v49[0] = v23;
      v49[1] = 3221225472;
      v49[2] = __105__MKMapGestureController__updateZoomGestureForState_focusPoint_scale_velocity_gestureType_configuration___block_invoke_57;
      v49[3] = &unk_1E20DA4F0;
      if (v32 <= v31)
        v33 = v32;
      else
        v33 = v31;
      v49[4] = self;
      *(double *)&v49[5] = x;
      *(double *)&v49[6] = y;
      v49[7] = a7;
      v34 = (void *)MEMORY[0x18D778DB8](v49);
      -[VKDynamicAnimation stop](self->_pinchDecelerationAnimation, "stop");
      v35 = objc_loadWeakRetained((id *)&self->_delegate);
      v36 = v35;
      v37 = self->_lastScale;
      if (v37 > 1.0)
        v38 = 1;
      else
        v38 = 2 * (v37 < 1.0);
      objc_msgSend(v35, "gestureControllerDidStopZooming:direction:type:willDecelerate:", self, v38, a7, 1);

      v39 = (VKDynamicAnimation *)objc_alloc_init(MEMORY[0x1E0DC64F0]);
      pinchDecelerationAnimation = self->_pinchDecelerationAnimation;
      self->_pinchDecelerationAnimation = v39;

      -[VKDynamicAnimation setCompletionHandler:](self->_pinchDecelerationAnimation, "setCompletionHandler:", v34);
      if (v33 <= 0.0)
        objc_msgSend(v15, "zoomOutFrictionScale");
      v48 = v24;
      dynamicValueAnimation();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKDynamicAnimation setDynamicStepHandler:](self->_pinchDecelerationAnimation, "setDynamicStepHandler:", v46);

      -[MKBasicMapView mapView](self->_mapView, "mapView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "runAnimation:", self->_pinchDecelerationAnimation);

    }
  }

LABEL_34:
}

void __105__MKMapGestureController__updateZoomGestureForState_focusPoint_scale_velocity_gestureType_configuration___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;

  if (a3 >= 0.01)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mapView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatePinchWithFocusPoint:oldFactor:newFactor:", *(double *)(a1 + 40), *(double *)(a1 + 48), a2, a3);

    *(double *)(*(_QWORD *)(a1 + 32) + 256) = a3;
  }
}

void __105__MKMapGestureController__updateZoomGestureForState_focusPoint_scale_velocity_gestureType_configuration___block_invoke_57(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;

  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 264);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 264);
  *(_QWORD *)(v2 + 264) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopPinchingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "gestureControllerDidStopZoomingDecelerating:direction:type:");

  objc_msgSend(*(id *)(a1 + 32), "endGesturing");
}

uint64_t __105__MKMapGestureController__updateZoomGestureForState_focusPoint_scale_velocity_gestureType_configuration___block_invoke_2(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(_QWORD, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(double *)(*(_QWORD *)(a1 + 32) + 256), a2);
}

- (CGPoint)_snapPointToDevicePixels:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[MKBasicMapView mapView](self->_mapView, "mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsScale");
  v8 = v7;

  -[MKBasicMapView window](self->_mapView, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = vabdd_f64(v8, v11);

  if (v12 >= 0.000001)
  {
    x = round(x * v8) / v8;
    y = round(y * v8) / v8;
  }
  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)handlePan:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  VKCompoundAnimation *panDecelerationAnimationGroup;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  VKCompoundAnimation *v32;
  VKCompoundAnimation *v33;
  id v34;
  void *v35;
  NSObject *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id location[12];
  uint8_t buf[8];
  uint8_t *v44;
  uint64_t v45;
  __n128 (*v46)(__n128 *, __n128 *);
  uint64_t (*v47)();
  const char *v48;
  uint64_t v49;
  uint64_t v50;

  v4 = a3;
  MKGetGesturesLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HandlePan", (const char *)&unk_18B2CC343, buf, 2u);
  }

  objc_msgSend(v4, "locationInView:", self->_mapView);
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "gestureController:focusPointForPoint:gestureKind:", self, 0, v7, v9);
    v7 = v12;
    v9 = v13;

  }
  -[MKMapGestureController _snapPointToDevicePixels:](self, "_snapPointToDevicePixels:", v7, v9);
  v15 = v14;
  v17 = v16;
  -[VKCompoundAnimation stop](self->_panDecelerationAnimationGroup, "stop");
  panDecelerationAnimationGroup = self->_panDecelerationAnimationGroup;
  self->_panDecelerationAnimationGroup = 0;

  *(_QWORD *)buf = 0;
  v44 = buf;
  v45 = 0x4012000000;
  v46 = __Block_byref_object_copy__13;
  v47 = __Block_byref_object_dispose__13;
  v49 = 0;
  v50 = 0;
  v48 = "";
  objc_msgSend(v4, "translationInView:", self->_mapView);
  -[MKMapGestureController _snapPointToDevicePixels:](self, "_snapPointToDevicePixels:");
  v49 = v19;
  v50 = v20;
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      -[MKMapGestureController beginGesturing](self, "beginGesturing");
      -[MKBasicMapView mapView](self->_mapView, "mapView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "startPanningAtPoint:", v15, v17);

      v22 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v22, "gestureControllerWillStartPanning:", self);
      goto LABEL_13;
    case 2:
      -[MKBasicMapView mapView](self->_mapView, "mapView");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updatePanWithTranslation:", *((double *)v44 + 6), *((double *)v44 + 7));
      goto LABEL_13;
    case 3:
      objc_msgSend(v4, "velocityInView:", self->_mapView);
      if (!self->_panWithMomentum || fabs(v23) <= 200.0 && fabs(v24) <= 200.0)
        goto LABEL_11;
      -[MKBasicMapView mapView](self->_mapView, "mapView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "isPitched");

      v22 = objc_alloc_init(MEMORY[0x1E0DC64F0]);
      v28 = (void *)MEMORY[0x1E0C809B0];
      location[7] = (id)MEMORY[0x1E0C809B0];
      location[8] = (id)3221225472;
      location[9] = __36__MKMapGestureController_handlePan___block_invoke;
      location[10] = &unk_1E20DA518;
      location[11] = buf;
      dynamicValueAnimation();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setDynamicStepHandler:", v29);

      v30 = objc_alloc_init(MEMORY[0x1E0DC64F0]);
      location[2] = v28;
      location[3] = (id)3221225472;
      location[4] = __36__MKMapGestureController_handlePan___block_invoke_2;
      location[5] = &unk_1E20DA518;
      location[6] = buf;
      dynamicValueAnimation();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setDynamicStepHandler:", v31);

      objc_initWeak(location, self);
      v32 = (VKCompoundAnimation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC64D0]), "initWithAnimations:", v22, v30, 0);
      v33 = self->_panDecelerationAnimationGroup;
      self->_panDecelerationAnimationGroup = v32;

      v39[0] = v28;
      v39[1] = 3221225472;
      v39[2] = __36__MKMapGestureController_handlePan___block_invoke_3;
      v39[3] = &unk_1E20DA540;
      objc_copyWeak(&v41, location);
      v40 = v4;
      -[VKCompoundAnimation setCompletionHandler:](self->_panDecelerationAnimationGroup, "setCompletionHandler:", v39);
      v37[0] = v28;
      v37[1] = 3221225472;
      v37[2] = __36__MKMapGestureController_handlePan___block_invoke_4;
      v37[3] = &unk_1E20DA568;
      objc_copyWeak(&v38, location);
      v37[4] = buf;
      -[VKCompoundAnimation setGroupStepHandler:](self->_panDecelerationAnimationGroup, "setGroupStepHandler:", v37);
      v34 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v34, "gestureControllerDidStopPanning:willDecelerate:", self, 1);

      -[MKBasicMapView mapView](self->_mapView, "mapView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "runAnimation:", self->_panDecelerationAnimationGroup);

      objc_destroyWeak(&v38);
      objc_destroyWeak(&v41);
      objc_destroyWeak(location);

LABEL_13:
      break;
    case 4:
LABEL_11:
      -[MKBasicMapView mapView](self->_mapView, "mapView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stopPanningAtPoint:", v15, v17);

      v26 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v26, "gestureControllerDidStopPanning:willDecelerate:", self, 0);

      -[MKMapGestureController endGesturing](self, "endGesturing");
      break;
    default:
      break;
  }
  MKGetGesturesLog();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v36))
  {
    LOWORD(location[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v36, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HandlePan", (const char *)&unk_18B2CC343, (uint8_t *)location, 2u);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __36__MKMapGestureController_handlePan___block_invoke(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 48) = a2;
  return result;
}

uint64_t __36__MKMapGestureController_handlePan___block_invoke_2(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56) = a2;
  return result;
}

void __36__MKMapGestureController_handlePan___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  objc_msgSend(WeakRetained, "_snapPointToDevicePixels:");
  objc_msgSend(v3, "stopPanningAtPoint:");

  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gestureControllerDidStopPanningDecelerating:", WeakRetained);

  objc_msgSend(WeakRetained, "endGesturing");
}

void __36__MKMapGestureController_handlePan___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePanWithTranslation:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));

}

- (double)variableDelayTapRecognizer:(id)a3 shouldWaitForNextTapForDuration:(double)a4 afterTouch:(id)a5
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  double v13;

  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "gestureController:shouldWaitForNextTapForDuration:afterTouch:", self, v7, a4);
      a4 = v13;

    }
  }

  return a4;
}

- (void)handleZoomArrowMask:(int64_t)a3 speed:(double)a4
{
  double v7;
  double v8;
  id v9;
  id v10;

  if (-[MKMapGestureController isZoomEnabled](self, "isZoomEnabled"))
  {
    if (a3)
    {
      if (a4 <= 0.0)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleForKey:", CFSTR("ZoomingDefault"));
        self->_arrowZoomSpeed = v7;

      }
      else
      {
        self->_arrowZoomSpeed = a4;
      }
    }
    -[_MKDirectionalArrowRecognizer handleArrowMask:](self->_arrowZoomGestureRecognizer, "handleArrowMask:", a3);
    if (-[_MKDirectionalArrowRecognizer state](self->_arrowZoomGestureRecognizer, "state") == 3
      || -[_MKDirectionalArrowRecognizer state](self->_arrowZoomGestureRecognizer, "state") == 5
      || -[_MKDirectionalArrowRecognizer state](self->_arrowZoomGestureRecognizer, "state") == 4)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleForKey:", CFSTR("ZoomingDefault"));
      self->_arrowZoomSpeed = v8;

    }
  }
}

- (void)_handleRotationPan:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id WeakRetained;
  char v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  v19 = a3;
  if (objc_msgSend(v19, "state") == 1)
  {
    objc_msgSend(v19, "locationInView:", self->_mapView);
    v5 = v4;
    v7 = v6;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "gestureController:focusPointForPoint:gestureKind:", self, 2, v5, v7);
      v5 = v11;
      v7 = v12;

    }
    self->_panRotateStartPoint.x = v5;
    self->_panRotateStartPoint.y = v7;
  }
  -[MKMapGestureController mapView](self, "mapView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "translationInView:", v13);
  v15 = v14;

  -[MKMapGestureController mapView](self, "mapView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "velocityInView:", v16);
  v18 = v17;

  -[MKMapGestureController _updateRotationGestureForState:focusPoint:rotation:velocity:](self, "_updateRotationGestureForState:focusPoint:rotation:velocity:", objc_msgSend(v19, "state"), self->_panRotateStartPoint.x, self->_panRotateStartPoint.y, v15 / 200.0, v18 / 200.0);
}

- (void)_handleZoomPan:(id)a3
{
  double v4;
  double MidX;
  double v6;
  double MidY;
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
  double v21;
  double v22;
  double v23;
  id WeakRetained;
  char v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  id v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _MKConditionalPanZoomGestureRecognizer *v44;
  double v45;
  _MKConditionalPanZoomGestureRecognizer *conditionalPanZoomGestureRecognizer;
  double v47;
  _MKZoomingGestureControlConfiguration *v48;
  double v49;
  void *v50;
  double v51;
  UIPanGestureRecognizer *v52;
  CGRect v53;
  CGRect v54;

  v52 = (UIPanGestureRecognizer *)a3;
  if (-[UIPanGestureRecognizer state](v52, "state") == 1)
  {
    self->_lastScale = 1.0;
    self->_lastZoomPanTranslation = 0.0;
    if (self->_scaleDragGestureRecognizer == v52)
    {
      -[MKBasicMapView bounds](self->_mapView, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[MKBasicMapView edgeInsets](self->_mapView, "edgeInsets");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) != 0)
      {
        v26 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v26, "gestureControllerSignificantViewFrame:", self);
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v34 = v33;

      }
      else
      {
        v28 = v9 + v19;
        v30 = v11 + v17;
        v32 = v13 - (v19 + v23);
        v34 = v15 - (v17 + v21);
      }
      v53.origin.x = v28;
      v53.origin.y = v30;
      v53.size.width = v32;
      v53.size.height = v34;
      MidX = CGRectGetMidX(v53);
      v54.origin.x = v28;
      v54.origin.y = v30;
      v54.size.width = v32;
      v54.size.height = v34;
      MidY = CGRectGetMidY(v54);
    }
    else
    {
      -[UIPanGestureRecognizer locationInView:](v52, "locationInView:", self->_mapView);
      MidX = v4;
      MidY = v6;
    }
    self->_panZoomStartPoint.x = MidX;
    self->_panZoomStartPoint.y = MidY;
  }
  else
  {
    MidX = self->_panZoomStartPoint.x;
    MidY = self->_panZoomStartPoint.y;
  }
  v35 = objc_loadWeakRetained((id *)&self->_delegate);

  if (v35)
  {
    v36 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v36, "gestureController:focusPointForPoint:gestureKind:", self, 1, MidX, MidY);
    MidX = v37;
    MidY = v38;

  }
  if (-[MKBasicMapView isPointValidForGesturing:](self->_mapView, "isPointValidForGesturing:", MidX, MidY))
  {
    -[UIPanGestureRecognizer view](v52, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer translationInView:](v52, "translationInView:", v39);
    v41 = v40;
    v43 = v42;

    v44 = (_MKConditionalPanZoomGestureRecognizer *)v52;
    if (self->_scaleDragGestureRecognizer == v52)
      v45 = v41;
    else
      v45 = v43;
    conditionalPanZoomGestureRecognizer = self->_conditionalPanZoomGestureRecognizer;
    if (conditionalPanZoomGestureRecognizer == (_MKConditionalPanZoomGestureRecognizer *)v52)
      v45 = -v45;
    v47 = self->_lastScale * ((v45 - self->_lastZoomPanTranslation) / 240.0 + 1.0);
    self->_lastZoomPanTranslation = v45;
  }
  else
  {
    conditionalPanZoomGestureRecognizer = self->_conditionalPanZoomGestureRecognizer;
    v47 = 1.0;
    v44 = (_MKConditionalPanZoomGestureRecognizer *)v52;
  }
  if (conditionalPanZoomGestureRecognizer == v44)
  {
    -[_MKConditionalPanZoomGestureRecognizer view](v44, "view");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer velocityInView:](v52, "velocityInView:", v50);
    v49 = -v51;

    v48 = self->_zoomConfiguration;
    v44 = (_MKConditionalPanZoomGestureRecognizer *)v52;
  }
  else
  {
    v48 = 0;
    v49 = 0.0;
  }
  -[MKMapGestureController _updateZoomGestureForState:focusPoint:scale:velocity:gestureType:configuration:](self, "_updateZoomGestureForState:focusPoint:scale:velocity:gestureType:configuration:", -[_MKConditionalPanZoomGestureRecognizer state](v44, "state"), 4, v48, MidX, MidY, v47, v49);

}

- (void)_handleInterrupt:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 3)
  {
    -[MKMapGestureController stopDynamicAnimations](self, "stopDynamicAnimations");
    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopSnappingAnimations");

  }
}

- (BOOL)keyDown:(id)a3
{
  id v4;
  _MKDirectionalArrowRecognizer *activeArrowGestureRecognizer;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  _MKDirectionalArrowRecognizer *v9;
  _MKDirectionalArrowRecognizer *v10;
  BOOL v11;

  v4 = a3;
  activeArrowGestureRecognizer = self->_activeArrowGestureRecognizer;
  if (!activeArrowGestureRecognizer)
  {
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((~objc_msgSend(v6, "modifierFlags") & 0x120000) == 0
      && (objc_msgSend(v6, "modifierFlags") & 0xFFFFFFFFFFEDFFFFLL) == 0)
    {

      goto LABEL_30;
    }
    if ((objc_msgSend(v6, "modifierFlags") & 0x80000) != 0)
    {
      v7 = objc_msgSend(v6, "keyCode") - 45;
      if (v7 > 0x25)
        goto LABEL_17;
      if (((1 << v7) & 0x3000000003) == 0)
      {
        if (((1 << v7) & 0xC00000000) == 0
          || !-[MKMapGestureController isRotationEnabled](self, "isRotationEnabled"))
        {
          goto LABEL_17;
        }
        v8 = 200;
LABEL_16:
        v9 = (_MKDirectionalArrowRecognizer *)*(id *)((char *)&self->super.isa + v8);
        if (v9)
          goto LABEL_20;
        goto LABEL_17;
      }
      if (!-[MKMapGestureController isZoomEnabled](self, "isZoomEnabled"))
      {
LABEL_17:
        if (-[MKMapGestureController isScrollEnabled](self, "isScrollEnabled"))
          v9 = self->_arrowPanGestureRecognizer;
        else
          v9 = 0;
LABEL_20:
        if (-[UIPanGestureRecognizer state](self->_panGestureRecognizer, "state") == 1
          || -[UIPanGestureRecognizer state](self->_panGestureRecognizer, "state") == 2
          || -[UIPinchGestureRecognizer state](self->_pinchGestureRecognizer, "state") == 1
          || -[UIPinchGestureRecognizer state](self->_pinchGestureRecognizer, "state") == 2
          || -[UIRotationGestureRecognizer state](self->_rotationGestureRecognizer, "state") == 1
          || -[UIRotationGestureRecognizer state](self->_rotationGestureRecognizer, "state") == 2)
        {

          v9 = 0;
        }
        v10 = self->_activeArrowGestureRecognizer;
        self->_activeArrowGestureRecognizer = v9;

        activeArrowGestureRecognizer = self->_activeArrowGestureRecognizer;
        if (activeArrowGestureRecognizer)
          goto LABEL_28;
LABEL_30:
        v11 = 0;
        goto LABEL_29;
      }
    }
    else if ((unint64_t)(objc_msgSend(v6, "keyCode") - 45) > 1
           || !-[MKMapGestureController isZoomEnabled](self, "isZoomEnabled"))
    {
      goto LABEL_17;
    }
    v8 = 192;
    goto LABEL_16;
  }
LABEL_28:
  -[_MKDirectionalArrowRecognizer keyDown:](activeArrowGestureRecognizer, "keyDown:", v4);
  v11 = 1;
LABEL_29:

  return v11;
}

- (BOOL)keyUp:(id)a3
{
  id v4;
  _MKDirectionalArrowRecognizer *activeArrowGestureRecognizer;
  _MKDirectionalArrowRecognizer *v6;

  v4 = a3;
  activeArrowGestureRecognizer = self->_activeArrowGestureRecognizer;
  if (activeArrowGestureRecognizer)
  {
    -[_MKDirectionalArrowRecognizer keyUp:](self->_activeArrowGestureRecognizer, "keyUp:", v4);
    if (-[_MKDirectionalArrowRecognizer state](self->_activeArrowGestureRecognizer, "state") == 3
      || -[_MKDirectionalArrowRecognizer state](self->_activeArrowGestureRecognizer, "state") == 5
      || -[_MKDirectionalArrowRecognizer state](self->_activeArrowGestureRecognizer, "state") == 4)
    {
      v6 = self->_activeArrowGestureRecognizer;
      self->_activeArrowGestureRecognizer = 0;

    }
  }

  return activeArrowGestureRecognizer != 0;
}

- (void)zoomIn
{
  _MKDirectionalArrowRecognizer **p_activeArrowGestureRecognizer;
  _MKDirectionalArrowRecognizer *activeArrowGestureRecognizer;

  p_activeArrowGestureRecognizer = &self->_activeArrowGestureRecognizer;
  if (!self->_activeArrowGestureRecognizer && -[MKMapGestureController isZoomEnabled](self, "isZoomEnabled"))
    objc_storeStrong((id *)p_activeArrowGestureRecognizer, self->_arrowZoomGestureRecognizer);
  activeArrowGestureRecognizer = self->_activeArrowGestureRecognizer;
  if (activeArrowGestureRecognizer == self->_arrowZoomGestureRecognizer)
  {
    if (-[_MKDirectionalArrowRecognizer arrows](activeArrowGestureRecognizer, "arrows") != 2)
      -[_MKDirectionalArrowRecognizer handleArrowMask:](self->_arrowZoomGestureRecognizer, "handleArrowMask:", 2);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_cancelZoomInOrOut, 0);
    -[MKMapGestureController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_cancelZoomInOrOut, 0, 0.3);
  }
}

- (void)zoomOut
{
  _MKDirectionalArrowRecognizer **p_activeArrowGestureRecognizer;
  _MKDirectionalArrowRecognizer *activeArrowGestureRecognizer;

  p_activeArrowGestureRecognizer = &self->_activeArrowGestureRecognizer;
  if (!self->_activeArrowGestureRecognizer && -[MKMapGestureController isZoomEnabled](self, "isZoomEnabled"))
    objc_storeStrong((id *)p_activeArrowGestureRecognizer, self->_arrowZoomGestureRecognizer);
  activeArrowGestureRecognizer = self->_activeArrowGestureRecognizer;
  if (activeArrowGestureRecognizer == self->_arrowZoomGestureRecognizer)
  {
    if (-[_MKDirectionalArrowRecognizer arrows](activeArrowGestureRecognizer, "arrows") != 4)
      -[_MKDirectionalArrowRecognizer handleArrowMask:](self->_arrowZoomGestureRecognizer, "handleArrowMask:", 4);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_cancelZoomInOrOut, 0);
    -[MKMapGestureController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_cancelZoomInOrOut, 0, 0.3);
  }
}

- (void)cancelZoomInOrOut
{
  _MKDirectionalArrowRecognizer *activeArrowGestureRecognizer;
  _MKDirectionalArrowRecognizer *v4;

  activeArrowGestureRecognizer = self->_activeArrowGestureRecognizer;
  if (activeArrowGestureRecognizer == self->_arrowZoomGestureRecognizer)
  {
    -[_MKDirectionalArrowRecognizer handleArrowMask:](activeArrowGestureRecognizer, "handleArrowMask:", 0);
    v4 = self->_activeArrowGestureRecognizer;
    self->_activeArrowGestureRecognizer = 0;

  }
}

- (void)handleArrowPan:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MidX;
  double MidY;
  void *v23;
  id WeakRetained;
  VKTimedAnimation *v25;
  VKTimedAnimation *currentArrowAnimation;
  CFAbsoluteTime Current;
  uint64_t v28;
  void *v29;
  id *p_location;
  VKTimedAnimation *v31;
  VKTimedAnimation *v32;
  VKTimedAnimation *v33;
  VKTimedAnimation *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41[3];
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45[3];
  _QWORD v46[4];
  id v47;
  id *v48;
  id v49[2];
  id from[6];
  __int128 v51;
  id location;
  CGRect v53;
  CGRect v54;

  v4 = a3;
  -[MKBasicMapView bounds](self->_mapView, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MKBasicMapView edgeInsets](self->_mapView, "edgeInsets");
  v14 = v6 + v13;
  v16 = v8 + v15;
  v18 = v10 - (v13 + v17);
  v20 = v12 - (v15 + v19);
  v53.origin.x = v14;
  v53.origin.y = v16;
  v53.size.width = v18;
  v53.size.height = v20;
  MidX = CGRectGetMidX(v53);
  v54.origin.x = v14;
  v54.origin.y = v16;
  v54.size.width = v18;
  v54.size.height = v20;
  MidY = CGRectGetMidY(v54);
  if (objc_msgSend(v4, "state") == 1)
  {
    -[MKMapGestureController beginGesturing](self, "beginGesturing");
    -[MKMapGestureController stopDynamicAnimations](self, "stopDynamicAnimations");
    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "startPanningAtPoint:panAtStartPoint:", 1, MidX, MidY);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "gestureControllerWillStartPanning:", self);

    v25 = (VKTimedAnimation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6570]), "initWithDuration:", 1.0);
    currentArrowAnimation = self->_currentArrowAnimation;
    self->_currentArrowAnimation = v25;

    -[VKTimedAnimation setRunsForever:](self->_currentArrowAnimation, "setRunsForever:", 1);
    objc_initWeak(&location, self);
    Current = CFAbsoluteTimeGetCurrent();
    from[0] = 0;
    from[1] = from;
    from[2] = (id)0x4012000000;
    from[3] = __Block_byref_object_copy__13;
    from[4] = __Block_byref_object_dispose__13;
    from[5] = "";
    v51 = *MEMORY[0x1E0C9D538];
    v28 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __41__MKMapGestureController_handleArrowPan___block_invoke;
    v46[3] = &unk_1E20DA590;
    objc_copyWeak(v49, &location);
    v49[1] = *(id *)&Current;
    v47 = v4;
    v48 = from;
    -[VKTimedAnimation setStepHandler:](self->_currentArrowAnimation, "setStepHandler:", v46);
    v44[0] = v28;
    v44[1] = 3221225472;
    v44[2] = __41__MKMapGestureController_handleArrowPan___block_invoke_2;
    v44[3] = &unk_1E20DA5B8;
    objc_copyWeak(v45, &location);
    v45[1] = *(id *)&MidX;
    v45[2] = *(id *)&MidY;
    -[VKTimedAnimation setCompletionHandler:](self->_currentArrowAnimation, "setCompletionHandler:", v44);
    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "runAnimation:", self->_currentArrowAnimation);

    objc_destroyWeak(v45);
    objc_destroyWeak(v49);
    _Block_object_dispose(from, 8);
    p_location = &location;
LABEL_6:
    objc_destroyWeak(p_location);
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "state") == 3)
  {
    v31 = self->_currentArrowAnimation;
    if (v31)
    {
      -[VKTimedAnimation stopAnimation:](v31, "stopAnimation:", 1);
      v32 = self->_currentArrowAnimation;
      self->_currentArrowAnimation = 0;

      objc_initWeak(from, self);
      v33 = (VKTimedAnimation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6570]), "initWithDuration:", 0.25);
      v34 = self->_currentArrowAnimation;
      self->_currentArrowAnimation = v33;

      v35 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __41__MKMapGestureController_handleArrowPan___block_invoke_3;
      v42[3] = &unk_1E20DA5E0;
      objc_copyWeak(&v43, from);
      -[VKTimedAnimation setStepHandler:](self->_currentArrowAnimation, "setStepHandler:", v42);
      v37 = v35;
      v38 = 3221225472;
      v39 = __41__MKMapGestureController_handleArrowPan___block_invoke_4;
      v40 = &unk_1E20DA5B8;
      objc_copyWeak(v41, from);
      v41[1] = *(id *)&MidX;
      v41[2] = *(id *)&MidY;
      -[VKTimedAnimation setCompletionHandler:](self->_currentArrowAnimation, "setCompletionHandler:", &v37);
      -[MKBasicMapView mapView](self->_mapView, "mapView", v37, v38, v39, v40);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "runAnimation:", self->_currentArrowAnimation);

      objc_destroyWeak(v41);
      objc_destroyWeak(&v43);
      p_location = from;
      goto LABEL_6;
    }
  }
LABEL_7:

}

void __41__MKMapGestureController_handleArrowPan___block_invoke(uint64_t a1)
{
  id *WeakRetained;
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
  char v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id *v21;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v21 = WeakRetained;
    objc_msgSend(WeakRetained[1], "bounds");
    v4 = v3;
    objc_msgSend(v21[1], "bounds");
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = (v4 + v6) * 0.5 * 0.00960614812;
    v9 = v8 - *(double *)(a1 + 56);
    v10 = v7 * 1.5;
    if (v9 <= 1.0)
      v10 = (v4 + v6) * 0.5 * 0.00960614812;
    v11 = v7 * 3.0;
    if (v9 > 4.0)
      v12 = v11;
    else
      v12 = v10;
    v13 = *MEMORY[0x1E0C9D538];
    v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v15 = objc_msgSend(*(id *)(a1 + 32), "arrows");
    v16 = v14 + 1.0;
    if ((v15 & 2) == 0)
      v16 = v14;
    if ((v15 & 4) != 0)
      v16 = v16 + -1.0;
    v17 = v13 + 1.0;
    if ((v15 & 8) == 0)
      v17 = v13;
    if ((v15 & 0x10) != 0)
      v17 = v17 + -1.0;
    if (fabs(v17) + fabs(v16) > 1.5)
    {
      v17 = v17 / 1.41421354;
      v16 = v16 / 1.41421354;
    }
    v18 = v12 * v17;
    v19 = v12 * v16;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = v18
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 48);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) = v19
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 56);
    *((double *)v21 + 47) = v18;
    *((double *)v21 + 48) = v19;
    *(_OWORD *)(v21 + 45) = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
    objc_msgSend(v21[1], "mapView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updatePanWithTranslation:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));

    WeakRetained = v21;
  }

}

void __41__MKMapGestureController_handleArrowPan___block_invoke_2(uint64_t a1, int a2)
{
  id *WeakRetained;
  id v5;
  void *v6;
  id v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if (a2)
    {
      v5 = objc_loadWeakRetained(WeakRetained + 2);
      objc_msgSend(v5, "gestureControllerDidStopPanning:willDecelerate:", v8, 1);

    }
    else
    {
      objc_msgSend(WeakRetained[1], "mapView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopPanningAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

      v7 = objc_loadWeakRetained(v8 + 2);
      objc_msgSend(v7, "gestureControllerDidStopPanning:willDecelerate:", v8, 0);

      objc_msgSend(v8, "endGesturing");
    }
    WeakRetained = v8;
  }

}

void __41__MKMapGestureController_handleArrowPan___block_invoke_3(uint64_t a1, float a2)
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = *((double *)WeakRetained + 45);
    v5 = *((double *)WeakRetained + 46);
    v7 = *((double *)WeakRetained + 47);
    v6 = *((double *)WeakRetained + 48);
    v12 = WeakRetained;
    objc_msgSend(*((id *)WeakRetained + 1), "mapView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (float)(1.0 - (float)(a2 * a2));
    v10 = v4 + v7 * v9;
    v11 = v5 + v6 * v9;
    objc_msgSend(v8, "updatePanWithTranslation:", v10, v11);

    WeakRetained = v12;
    *((double *)v12 + 45) = v10;
    *((double *)v12 + 46) = v11;
  }

}

void __41__MKMapGestureController_handleArrowPan___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "mapView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stopPanningAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

    v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "gestureControllerDidStopPanningDecelerating:", WeakRetained);

    objc_msgSend(WeakRetained, "endGesturing");
  }

}

- (void)handleArrowRotate:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MidX;
  double MidY;
  VKTimedAnimation *currentArrowAnimation;
  MKRotationFilter *rotationFilter;
  VKTimedAnimation *v25;
  VKTimedAnimation *v26;
  VKTimedAnimation *v27;
  uint64_t v28;
  id *v29;
  id *v30;
  void *v31;
  _BOOL4 v32;
  double v33;
  MKRotationFilter *v34;
  void *v35;
  id WeakRetained;
  VKTimedAnimation *v37;
  VKTimedAnimation *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  VKTimedAnimation *v43;
  void *v44;
  VKTimedAnimation *v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48[3];
  _QWORD v49[4];
  id v50[3];
  _QWORD v51[4];
  id v52[3];
  _QWORD v53[4];
  id v54;
  id v55[3];
  _QWORD v56[4];
  id v57[3];
  _QWORD v58[4];
  id v59[4];
  id location;
  CGRect v61;
  CGRect v62;

  v4 = a3;
  -[MKBasicMapView bounds](self->_mapView, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MKBasicMapView edgeInsets](self->_mapView, "edgeInsets");
  v14 = v6 + v13;
  v16 = v8 + v15;
  v18 = v10 - (v13 + v17);
  v20 = v12 - (v15 + v19);
  v61.origin.x = v14;
  v61.origin.y = v16;
  v61.size.width = v18;
  v61.size.height = v20;
  MidX = CGRectGetMidX(v61);
  v62.origin.x = v14;
  v62.origin.y = v16;
  v62.size.width = v18;
  v62.size.height = v20;
  MidY = CGRectGetMidY(v62);
  if (objc_msgSend(v4, "state") == 1)
  {
    if ((objc_msgSend(v4, "modifierFlags") & 0x100000) == 0)
    {
      -[MKMapGestureController beginGesturing](self, "beginGesturing");
      -[VKTimedAnimation stopAnimation:](self->_currentArrowAnimation, "stopAnimation:", 0);
      currentArrowAnimation = self->_currentArrowAnimation;
      self->_currentArrowAnimation = 0;

      rotationFilter = self->_rotationFilter;
      if (rotationFilter)
      {
        -[MKRotationFilter startRotatingWithFocusPoint:withSnapping:](rotationFilter, "startRotatingWithFocusPoint:withSnapping:", 0, MidX, MidY);
      }
      else
      {
        -[MKBasicMapView mapView](self->_mapView, "mapView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "startRotatingWithFocusPoint:", MidX, MidY);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "gestureControllerWillStartRotating:", self);

      v37 = (VKTimedAnimation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6570]), "initWithDuration:", 1.0);
      v38 = self->_currentArrowAnimation;
      self->_currentArrowAnimation = v37;

      -[VKTimedAnimation setRunsForever:](self->_currentArrowAnimation, "setRunsForever:", 1);
      objc_initWeak(&location, self);
      self->_lastRotation = 0.0;
      v39 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __44__MKMapGestureController_handleArrowRotate___block_invoke_3;
      v53[3] = &unk_1E20DA630;
      v29 = v55;
      objc_copyWeak(v55, &location);
      v54 = v4;
      v55[1] = *(id *)&MidX;
      v55[2] = *(id *)&MidY;
      -[VKTimedAnimation setStepHandler:](self->_currentArrowAnimation, "setStepHandler:", v53);
      v51[0] = v39;
      v51[1] = 3221225472;
      v51[2] = __44__MKMapGestureController_handleArrowRotate___block_invoke_4;
      v51[3] = &unk_1E20DA5B8;
      objc_copyWeak(v52, &location);
      v52[1] = *(id *)&MidX;
      v52[2] = *(id *)&MidY;
      -[VKTimedAnimation setCompletionHandler:](self->_currentArrowAnimation, "setCompletionHandler:", v51);
      -[MKBasicMapView mapView](self->_mapView, "mapView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "runAnimation:", self->_currentArrowAnimation);

      objc_destroyWeak(v52);
      goto LABEL_18;
    }
    -[MKMapGestureController beginGesturing](self, "beginGesturing");
    -[MKMapGestureController stopDynamicAnimations](self, "stopDynamicAnimations");
    v32 = (objc_msgSend(v4, "arrows") & 8) == 0;
    if ((objc_msgSend(v4, "modifierFlags") & 0x20000) != 0)
      v33 = 12.0;
    else
      v33 = 3.0;
    v34 = self->_rotationFilter;
    if (v34)
    {
      -[MKRotationFilter startRotatingWithFocusPoint:withSnapping:](v34, "startRotatingWithFocusPoint:withSnapping:", 0, MidX, MidY);
    }
    else
    {
      -[MKBasicMapView mapView](self->_mapView, "mapView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "startRotatingWithFocusPoint:", MidX, MidY);

    }
    v42 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v42, "gestureControllerWillStartRotating:", self);

    self->_isFullRotatingFromArrows = 1;
    objc_initWeak(&location, self);
    v43 = (VKTimedAnimation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6570]), "initWithDuration:", v33);
    v44 = (void *)qword_18B2A9BF0[v32];
    v45 = self->_currentArrowAnimation;
    self->_currentArrowAnimation = v43;

    v46 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __44__MKMapGestureController_handleArrowRotate___block_invoke;
    v58[3] = &unk_1E20DA608;
    v29 = v59;
    objc_copyWeak(v59, &location);
    v59[1] = v44;
    v59[2] = *(id *)&MidX;
    v59[3] = *(id *)&MidY;
    -[VKTimedAnimation setStepHandler:](self->_currentArrowAnimation, "setStepHandler:", v58);
    v56[0] = v46;
    v56[1] = 3221225472;
    v56[2] = __44__MKMapGestureController_handleArrowRotate___block_invoke_2;
    v56[3] = &unk_1E20DA5B8;
    v30 = v57;
    objc_copyWeak(v57, &location);
    v57[1] = *(id *)&MidX;
    v57[2] = *(id *)&MidY;
    -[VKTimedAnimation setCompletionHandler:](self->_currentArrowAnimation, "setCompletionHandler:", v56);
    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "runAnimation:", self->_currentArrowAnimation);
LABEL_17:

    objc_destroyWeak(v30);
LABEL_18:
    objc_destroyWeak(v29);
    objc_destroyWeak(&location);
    goto LABEL_19;
  }
  if (objc_msgSend(v4, "state") == 3 && !self->_isFullRotatingFromArrows)
  {
    -[VKTimedAnimation stopAnimation:](self->_currentArrowAnimation, "stopAnimation:", 1);
    v25 = self->_currentArrowAnimation;
    self->_currentArrowAnimation = 0;

    objc_initWeak(&location, self);
    v26 = (VKTimedAnimation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6570]), "initWithDuration:", 0.25);
    v27 = self->_currentArrowAnimation;
    self->_currentArrowAnimation = v26;

    v28 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __44__MKMapGestureController_handleArrowRotate___block_invoke_5;
    v49[3] = &unk_1E20DA658;
    v29 = v50;
    objc_copyWeak(v50, &location);
    v50[1] = *(id *)&MidX;
    v50[2] = *(id *)&MidY;
    -[VKTimedAnimation setStepHandler:](self->_currentArrowAnimation, "setStepHandler:", v49);
    v47[0] = v28;
    v47[1] = 3221225472;
    v47[2] = __44__MKMapGestureController_handleArrowRotate___block_invoke_6;
    v47[3] = &unk_1E20DA5B8;
    v30 = v48;
    objc_copyWeak(v48, &location);
    v48[1] = *(id *)&MidX;
    v48[2] = *(id *)&MidY;
    -[VKTimedAnimation setCompletionHandler:](self->_currentArrowAnimation, "setCompletionHandler:", v47);
    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "runAnimation:", self->_currentArrowAnimation);
    goto LABEL_17;
  }
LABEL_19:

}

void __44__MKMapGestureController_handleArrowRotate___block_invoke(uint64_t a1, float a2)
{
  double v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = *(double *)(a1 + 40) * a2;
    v5 = (void *)*((_QWORD *)WeakRetained + 5);
    if (v5)
    {
      objc_msgSend(v5, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 48), *(double *)(a1 + 56), v4);
    }
    else
    {
      objc_msgSend(*((id *)WeakRetained + 1), "mapView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 48), *(double *)(a1 + 56), v4);

    }
  }

}

void __44__MKMapGestureController_handleArrowRotate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 392) = 0;
    v2 = (void *)*((_QWORD *)WeakRetained + 5);
    if (v2)
    {
      objc_msgSend(v2, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    }
    else
    {
      objc_msgSend(*((id *)WeakRetained + 1), "mapView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

    }
    v4 = objc_loadWeakRetained((id *)WeakRetained + 2);
    objc_msgSend(v4, "gestureControllerDidStopRotatingDecelerating:", WeakRetained);

    objc_msgSend(WeakRetained, "endGesturing");
  }

}

void __44__MKMapGestureController_handleArrowRotate___block_invoke_3(uint64_t a1)
{
  char v2;
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "arrows");
    v3 = objc_msgSend(*(id *)(a1 + 32), "modifierFlags");
    v4 = dbl_18B2A9C00[(v2 & 0x10) == 0];
    if ((v3 & 0x20000) != 0)
      v4 = v4 * 0.25;
    v5 = v4 + *((double *)WeakRetained + 51);
    *((double *)WeakRetained + 50) = v4;
    *((double *)WeakRetained + 51) = v5;
    v6 = (void *)*((_QWORD *)WeakRetained + 5);
    if (v6)
    {
      objc_msgSend(v6, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    }
    else
    {
      objc_msgSend(*((id *)WeakRetained + 1), "mapView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 48), *(double *)(a1 + 56), *((double *)WeakRetained + 51));

    }
  }

}

void __44__MKMapGestureController_handleArrowRotate___block_invoke_4(uint64_t a1, int a2)
{
  id *WeakRetained;
  id v5;
  id v6;
  void *v7;
  id v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    if (a2)
    {
      v5 = objc_loadWeakRetained(WeakRetained + 2);
      objc_msgSend(v5, "gestureControllerDidStopRotating:willDecelerate:", v9, 1);

      WeakRetained = v9;
    }
    else
    {
      v6 = WeakRetained[5];
      if (v6)
      {
        objc_msgSend(v6, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
      }
      else
      {
        objc_msgSend(v9[1], "mapView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

      }
      v8 = objc_loadWeakRetained(v9 + 2);
      objc_msgSend(v8, "gestureControllerDidStopRotating:willDecelerate:", v9, 0);

      objc_msgSend(v9, "endGesturing");
      WeakRetained = v9;
    }
  }

}

void __44__MKMapGestureController_handleArrowRotate___block_invoke_5(uint64_t a1, float a2)
{
  id *WeakRetained;
  id *v5;
  double v6;
  id v7;
  void *v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *((double *)WeakRetained + 51) + *((double *)WeakRetained + 50) * (float)(1.0 - (float)(a2 * a2));
    v7 = WeakRetained[5];
    v9 = v5;
    if (v7)
    {
      objc_msgSend(v7, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 40), *(double *)(a1 + 48), v6);
    }
    else
    {
      objc_msgSend(v5[1], "mapView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 40), *(double *)(a1 + 48), v6);

    }
    v5 = v9;
    *((double *)v9 + 51) = v6;
  }

}

void __44__MKMapGestureController_handleArrowRotate___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)*((_QWORD *)WeakRetained + 5);
    if (v2)
    {
      objc_msgSend(v2, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    }
    else
    {
      objc_msgSend(*((id *)WeakRetained + 1), "mapView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

    }
    v4 = objc_loadWeakRetained((id *)WeakRetained + 2);
    objc_msgSend(v4, "gestureControllerDidStopRotatingDecelerating:", WeakRetained);

    objc_msgSend(WeakRetained, "endGesturing");
  }

}

- (void)handleArrowZoom:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MidX;
  double MidY;
  id WeakRetained;
  id v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  VKTimedAnimation *v29;
  VKTimedAnimation *currentArrowAnimation;
  uint64_t v31;
  void *v32;
  id *p_location;
  VKTimedAnimation *v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double arrowZoomSpeed;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double pinchFactorAverageInGesture;
  double v48;
  double v49;
  VKTimedAnimation *v50;
  float v51;
  VKTimedAnimation *v52;
  uint64_t v53;
  void *v54;
  _QWORD v55[4];
  id v56[3];
  _QWORD v57[4];
  id v58[4];
  float v59;
  _QWORD v60[4];
  id v61[3];
  _QWORD v62[4];
  id v63;
  id *v64;
  id v65[3];
  id from[3];
  CFAbsoluteTime Current;
  id location;
  CGRect v69;
  CGRect v70;

  v4 = a3;
  -[MKBasicMapView bounds](self->_mapView, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MKBasicMapView edgeInsets](self->_mapView, "edgeInsets");
  v14 = v6 + v13;
  v16 = v8 + v15;
  v18 = v10 - (v13 + v17);
  v20 = v12 - (v15 + v19);
  v69.origin.x = v14;
  v69.origin.y = v16;
  v69.size.width = v18;
  v69.size.height = v20;
  MidX = CGRectGetMidX(v69);
  v70.origin.x = v14;
  v70.origin.y = v16;
  v70.size.width = v18;
  v70.size.height = v20;
  MidY = CGRectGetMidY(v70);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v24 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v24, "gestureController:focusPointForPoint:gestureKind:", self, 0, MidX, MidY);
    MidX = v25;
    MidY = v26;

  }
  if (objc_msgSend(v4, "state") == 1)
  {
    -[MKMapGestureController beginGesturing](self, "beginGesturing");
    -[MKMapGestureController stopDynamicAnimations](self, "stopDynamicAnimations");
    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "startPinchingWithFocusPoint:", MidX, MidY);

    v28 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v28, "gestureControllerWillStartZooming:animated:", self, 1);

    self->_pinchFactorAverageInGesture = 1.0;
    self->_lastScale = 1.0;
    self->_arrowZoomStartTimestamp = CFAbsoluteTimeGetCurrent();
    v29 = (VKTimedAnimation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6570]), "initWithDuration:", 1.0);
    currentArrowAnimation = self->_currentArrowAnimation;
    self->_currentArrowAnimation = v29;

    -[VKTimedAnimation setRunsForever:](self->_currentArrowAnimation, "setRunsForever:", 1);
    objc_initWeak(&location, self);
    from[0] = 0;
    from[1] = from;
    from[2] = (id)0x2020000000;
    Current = 0.0;
    Current = CFAbsoluteTimeGetCurrent();
    v31 = MEMORY[0x1E0C809B0];
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __42__MKMapGestureController_handleArrowZoom___block_invoke;
    v62[3] = &unk_1E20DA680;
    objc_copyWeak(v65, &location);
    v64 = from;
    v63 = v4;
    v65[1] = *(id *)&MidX;
    v65[2] = *(id *)&MidY;
    -[VKTimedAnimation setStepHandler:](self->_currentArrowAnimation, "setStepHandler:", v62);
    v60[0] = v31;
    v60[1] = 3221225472;
    v60[2] = __42__MKMapGestureController_handleArrowZoom___block_invoke_2;
    v60[3] = &unk_1E20DA5B8;
    objc_copyWeak(v61, &location);
    v61[1] = *(id *)&MidX;
    v61[2] = *(id *)&MidY;
    -[VKTimedAnimation setCompletionHandler:](self->_currentArrowAnimation, "setCompletionHandler:", v60);
    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "runAnimation:", self->_currentArrowAnimation);

    objc_destroyWeak(v61);
    objc_destroyWeak(v65);
    _Block_object_dispose(from, 8);
    p_location = &location;
LABEL_19:
    objc_destroyWeak(p_location);
    goto LABEL_20;
  }
  if (objc_msgSend(v4, "state") == 3)
  {
    -[VKTimedAnimation stopAnimation:](self->_currentArrowAnimation, "stopAnimation:", 1);
    v34 = self->_currentArrowAnimation;
    self->_currentArrowAnimation = 0;

    objc_initWeak(from, self);
    v35 = 0.0;
    if (self->_arrowZoomStartTimestamp - CFAbsoluteTimeGetCurrent() + 0.25 > 0.0)
      v35 = self->_arrowZoomStartTimestamp - CFAbsoluteTimeGetCurrent() + 0.25;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleForKey:", CFSTR("ZoomingDefault"));
    v38 = v37;

    arrowZoomSpeed = self->_arrowZoomSpeed;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleForKey:", CFSTR("ZoomingDefault"));
    v42 = v41;

    if (arrowZoomSpeed < v42)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "doubleForKey:", CFSTR("ZoomingDefault"));
      v38 = v38 + (v44 - self->_arrowZoomSpeed) * 0.699999988;

    }
    v45 = CFAbsoluteTimeGetCurrent() - self->_arrowZoomStartTimestamp;
    v46 = 0.0;
    if (v45 >= 0.125)
    {
      v46 = 1.0;
      if (v45 < 0.5)
        v46 = (v45 + -0.125) / 0.375;
    }
    pinchFactorAverageInGesture = self->_pinchFactorAverageInGesture;
    if (pinchFactorAverageInGesture > 1.0
      || fabs(pinchFactorAverageInGesture + -1.0) < 0.000001 && (objc_msgSend(v4, "lastArrows") & 2) != 0)
    {
      v48 = v38 + 1.0;
    }
    else
    {
      v48 = 1.0 - v38;
    }
    v49 = self->_pinchFactorAverageInGesture;
    v50 = (VKTimedAnimation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6570]), "initWithDuration:", v35 + 0.25);
    v52 = self->_currentArrowAnimation;
    self->_currentArrowAnimation = v50;

    v53 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __42__MKMapGestureController_handleArrowZoom___block_invoke_3;
    v57[3] = &unk_1E20DA6A8;
    objc_copyWeak(v58, from);
    v51 = v35 / (v35 + 0.25);
    v59 = v51;
    *(double *)&v58[1] = v48 + v46 * (v49 - v48);
    v58[2] = *(id *)&MidX;
    v58[3] = *(id *)&MidY;
    -[VKTimedAnimation setStepHandler:](self->_currentArrowAnimation, "setStepHandler:", v57);
    v55[0] = v53;
    v55[1] = 3221225472;
    v55[2] = __42__MKMapGestureController_handleArrowZoom___block_invoke_4;
    v55[3] = &unk_1E20DA5B8;
    objc_copyWeak(v56, from);
    v56[1] = *(id *)&MidX;
    v56[2] = *(id *)&MidY;
    -[VKTimedAnimation setCompletionHandler:](self->_currentArrowAnimation, "setCompletionHandler:", v55);
    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "runAnimation:", self->_currentArrowAnimation);

    objc_destroyWeak(v56);
    objc_destroyWeak(v58);
    p_location = from;
    goto LABEL_19;
  }
LABEL_20:

}

void __42__MKMapGestureController_handleArrowZoom___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double Current;
  double v4;
  char v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    Current = CFAbsoluteTimeGetCurrent();
    v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v5 = objc_msgSend(*(id *)(a1 + 32), "arrows");
    v6 = *((double *)v9 + 28);
    if ((v5 & 2) == 0)
      v6 = -v6;
    v7 = (Current - v4) * v6 * 60.0 + 1.0;
    *((double *)v9 + 30) = (*((double *)v9 + 30) + *((double *)v9 + 30)) / 3.0 + v7 / 3.0;
    *((CFAbsoluteTime *)v9 + 31) = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*((id *)v9 + 1), "mapView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updatePinchWithFocusPoint:oldFactor:newFactor:", *(double *)(a1 + 56), *(double *)(a1 + 64), 1.0, v7);

    WeakRetained = v9;
    *((double *)v9 + 32) = v7;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = Current;
  }

}

void __42__MKMapGestureController_handleArrowZoom___block_invoke_2(uint64_t a1, int a2)
{
  id *WeakRetained;
  id v5;
  void *v6;
  id v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if (a2)
    {
      v5 = objc_loadWeakRetained(WeakRetained + 2);
      objc_msgSend(v5, "gestureControllerDidStopZooming:direction:willDecelerate:");

      return;
    }
    objc_msgSend(WeakRetained[1], "mapView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopPinchingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

    v7 = objc_loadWeakRetained(v8 + 2);
    objc_msgSend(v7, "gestureControllerDidStopZooming:direction:willDecelerate:");

    objc_msgSend(v8, "endGesturing");
    WeakRetained = v8;
  }

}

void __42__MKMapGestureController_handleArrowZoom___block_invoke_3(uint64_t a1, float a2)
{
  id WeakRetained;
  float v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double *v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = *(float *)(a1 + 64);
    v13 = (double *)WeakRetained;
    if (v5 <= a2)
    {
      v10 = *(double *)(a1 + 40);
      v11 = *((double *)WeakRetained + 32);
      objc_msgSend(*((id *)WeakRetained + 1), "mapView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = fmaxf(a2 - v5, 0.0);
      v9 = v11 * ((v10 + -1.0) * 0.25 * (1.0 - v12 * v12) + 1.0);
    }
    else
    {
      v6 = *(double *)(a1 + 40);
      v7 = *((double *)WeakRetained + 32);
      objc_msgSend(*((id *)WeakRetained + 1), "mapView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6 * v7;
    }
    objc_msgSend(v8, "updatePinchWithFocusPoint:oldFactor:newFactor:", *(double *)(a1 + 48), *(double *)(a1 + 56), v13[32], v9);

    WeakRetained = v13;
    v13[32] = v9;
  }

}

void __42__MKMapGestureController_handleArrowZoom___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "mapView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stopPinchingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

    v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "gestureControllerDidStopZoomingDecelerating:direction:");

    objc_msgSend(WeakRetained, "endGesturing");
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  MKTiltGestureRecognizer *v4;
  MKTiltGestureRecognizer *v5;
  char v6;
  void *v7;

  v4 = (MKTiltGestureRecognizer *)a3;
  v5 = v4;
  if ((MKTiltGestureRecognizer *)self->_conditionalPanTiltGestureRecognizer == v4)
  {
    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "canEnter3DMode");

  }
  else if (self->_tiltGestureRecognizer == v4)
  {
    v6 = -[MKMapGestureController tiltGestureRecognizerShouldBegin:](self, "tiltGestureRecognizerShouldBegin:", v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)tiltGestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;

  v4 = a3;
  -[MKBasicMapView mapView](self->_mapView, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canEnter3DMode");

  if ((v6 & 1) == 0)
    goto LABEL_4;
  -[MKMapGestureController mapView](self, "mapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationOfTouch:inView:", 0, v7);
  v9 = v8;
  v11 = v10;

  -[MKMapGestureController mapView](self, "mapView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationOfTouch:inView:", 1, v12);
  v14 = v13;
  v16 = v15;

  v17 = v14 - v9;
  v18 = (v16 - v11) * (v16 - v11) + v17 * v17;
  if (v18 > 0.0)
    v19 = v17 * v17 / v18 > 0.25;
  else
LABEL_4:
    v19 = 0;

  return v19;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIPanGestureRecognizer *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = a4;
  v8 = v7;
  if ((UIPanGestureRecognizer *)self->_oneHandedZoomGestureRecognizer == v6
    && (objc_msgSend(v7, "_isPointerTouch") & 1) != 0
    || (-[MKMapGestureController delegate](self, "delegate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "gestureController:shouldReceiveTouch:", self, v8),
        v9,
        (v10 & 1) == 0))
  {
    v11 = 0;
  }
  else if (self->_panGestureRecognizer == v6)
  {
    objc_msgSend(v8, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "touchLevel") != 1;

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v7;
  UIPanGestureRecognizer *v8;
  UIPanGestureRecognizer *v9;
  _MKUserInteractionGestureRecognizer *touchGestureRecognizer;
  UILongPressGestureRecognizer *twoFingerLongPressGestureRecognizer;
  int v14;
  UIPinchGestureRecognizer *pinchGestureRecognizer;
  UIRotationGestureRecognizer *rotationGestureRecognizer;
  UIPanGestureRecognizer *v18;
  void *v19;
  UIRotationGestureRecognizer *v20;
  _MKOneHandedZoomGestureRecognizer *oneHandedZoomGestureRecognizer;
  _MKConditionalPanRotationGestureRecognizer *conditionalPanRotationGestureRecognizer;
  _MKConditionalPanTiltGestureRecognizer *conditionalPanTiltGestureRecognizer;
  BOOL v24;

  v7 = (UIPanGestureRecognizer *)a3;
  v8 = (UIPanGestureRecognizer *)a4;
  v9 = v8;
  touchGestureRecognizer = self->_touchGestureRecognizer;
  if (touchGestureRecognizer == (_MKUserInteractionGestureRecognizer *)v7
    || touchGestureRecognizer == (_MKUserInteractionGestureRecognizer *)v8)
  {
    goto LABEL_10;
  }
  twoFingerLongPressGestureRecognizer = self->_twoFingerLongPressGestureRecognizer;
  if (twoFingerLongPressGestureRecognizer == (UILongPressGestureRecognizer *)v7
    || twoFingerLongPressGestureRecognizer == (UILongPressGestureRecognizer *)v8)
  {
    goto LABEL_10;
  }
  pinchGestureRecognizer = self->_pinchGestureRecognizer;
  if (pinchGestureRecognizer == (UIPinchGestureRecognizer *)v7 && self->_panGestureRecognizer == v8
    || pinchGestureRecognizer == (UIPinchGestureRecognizer *)v8 && self->_panGestureRecognizer == v7
    || (rotationGestureRecognizer = self->_rotationGestureRecognizer,
        rotationGestureRecognizer == (UIRotationGestureRecognizer *)v7)
    && self->_panGestureRecognizer == v8
    || rotationGestureRecognizer == (UIRotationGestureRecognizer *)v8 && self->_panGestureRecognizer == v7)
  {
    -[MKBasicMapView mapView](self->_mapView, "mapView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v19, "staysCenteredDuringPinch") ^ 1;

    goto LABEL_11;
  }
  if (rotationGestureRecognizer == (UIRotationGestureRecognizer *)v7)
  {
    -[MKMapGestureController pinchGestureRecognizer](self, "pinchGestureRecognizer");
    v4 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    if (v4 == v9)
    {

      goto LABEL_10;
    }
  }
  -[MKMapGestureController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v18 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  if (v18 == v7)
  {
    v20 = self->_rotationGestureRecognizer;

    if (rotationGestureRecognizer == (UIRotationGestureRecognizer *)v7)
    if (v20 != (UIRotationGestureRecognizer *)v9)
      goto LABEL_29;
LABEL_10:
    LOBYTE(v14) = 1;
    goto LABEL_11;
  }

  if (rotationGestureRecognizer == (UIRotationGestureRecognizer *)v7)
LABEL_29:
  oneHandedZoomGestureRecognizer = self->_oneHandedZoomGestureRecognizer;
  LOBYTE(v14) = 1;
  if (oneHandedZoomGestureRecognizer != (_MKOneHandedZoomGestureRecognizer *)v7
    && oneHandedZoomGestureRecognizer != (_MKOneHandedZoomGestureRecognizer *)v9)
  {
    conditionalPanRotationGestureRecognizer = self->_conditionalPanRotationGestureRecognizer;
    conditionalPanTiltGestureRecognizer = self->_conditionalPanTiltGestureRecognizer;
    if (conditionalPanRotationGestureRecognizer != (_MKConditionalPanRotationGestureRecognizer *)v7
      || conditionalPanTiltGestureRecognizer != (_MKConditionalPanTiltGestureRecognizer *)v9)
    {
      if (conditionalPanRotationGestureRecognizer)
        v24 = conditionalPanTiltGestureRecognizer == (_MKConditionalPanTiltGestureRecognizer *)v7;
      else
        v24 = 0;
      LOBYTE(v14) = v24;
    }
  }
LABEL_11:

  return v14;
}

- (UILongPressGestureRecognizer)twoFingerLongPressGestureRecognizer
{
  return self->_twoFingerLongPressGestureRecognizer;
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (UIRotationGestureRecognizer)rotationGestureRecognizer
{
  return self->_rotationGestureRecognizer;
}

- (MKMapGestureControllerDelegate)delegate
{
  return (MKMapGestureControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MKBasicMapView)mapView
{
  return self->_mapView;
}

- (MKScaleView)scaleView
{
  return self->_scaleView;
}

- (MKCompassView)compassView
{
  return self->_compassView;
}

- (MKRotationFilter)rotationFilter
{
  return self->_rotationFilter;
}

- (BOOL)panWithMomentum
{
  return self->_panWithMomentum;
}

- (void)setPanWithMomentum:(BOOL)a3
{
  self->_panWithMomentum = a3;
}

- (BOOL)rotationSnappingEnabled
{
  return self->_rotationSnappingEnabled;
}

- (void)setRotationSnappingEnabled:(BOOL)a3
{
  self->_rotationSnappingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_tiltDecelerationAnimation, 0);
  objc_storeStrong((id *)&self->_tiltGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rotationDecelerationAnimation, 0);
  objc_storeStrong((id *)&self->_rotationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panDecelerationAnimationGroup, 0);
  objc_storeStrong((id *)&self->_pinchDecelerationAnimation, 0);
  objc_storeStrong((id *)&self->_currentArrowAnimation, 0);
  objc_storeStrong((id *)&self->_arrowPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_arrowRotateGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_arrowZoomGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_activeArrowGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_gestureInterruptionRecognizer, 0);
  objc_storeStrong((id *)&self->_conditionalPanTiltGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_conditionalPanZoomGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_conditionalPanRotationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scaleDragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_zoomConfiguration, 0);
  objc_storeStrong((id *)&self->_oneHandedZoomGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_twoFingerLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_twoFingerTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rotationFilter, 0);
  objc_storeStrong((id *)&self->_compassView, 0);
  objc_storeStrong((id *)&self->_scaleView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
